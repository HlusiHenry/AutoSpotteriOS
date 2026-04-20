import Foundation
import SwiftUI
import Combine

// ─── Modelle ──────────────────────────────────────────────────────────────────
struct UnsplashPhoto: Identifiable, Codable {
    let id: String
    let urls: UnsplashURLs
}

struct UnsplashURLs: Codable {
    let regular: String
    let small: String
}

// ─── UnsplashService ──────────────────────────────────────────────────────────
class UnsplashService: ObservableObject {
    static let shared = UnsplashService()

    // ⚠️ DEIN API KEY HIER EINTRAGEN:
    private let apiKey = "DEIN_UNSPLASH_API_KEY"

    private var cache: [String: [String]] = [:] // carId → [imageURL]
    @Published var photosByCarId: [String: [String]] = [:]

    // Hauptfunktion: erst Unsplash, dann Wikipedia als Backup
    func loadPhotos(for car: Car) {
        if let cached = cache[car.id] {
            DispatchQueue.main.async { self.photosByCarId[car.id] = cached }
            return
        }

        // Erst Unsplash versuchen
        if apiKey != "DEIN_UNSPLASH_API_KEY" {
            loadFromUnsplash(for: car)
        } else {
            // Kein Key → direkt Wikipedia
            loadFromWikipedia(for: car)
        }
    }

    // ── Unsplash ──────────────────────────────────────────────────────────────
    private func loadFromUnsplash(for car: Car) {
        let query = "\(car.brand) \(car.model) car"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&per_page=5&orientation=landscape&client_id=\(apiKey)") else {
            loadFromWikipedia(for: car)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, _ in
            struct SearchResult: Codable {
                let results: [UnsplashPhoto]
            }
            if let data = data,
               let result = try? JSONDecoder().decode(SearchResult.self, from: data),
               !result.results.isEmpty {
                let urls = result.results.map { $0.urls.regular }
                DispatchQueue.main.async {
                    self.cache[car.id] = urls
                    self.photosByCarId[car.id] = urls
                }
            } else {
                // Unsplash fehlgeschlagen → Wikipedia
                self.loadFromWikipedia(for: car)
            }
        }.resume()
    }

    // ── Wikipedia Backup ──────────────────────────────────────────────────────
    private func loadFromWikipedia(for car: Car) {
        let query = "\(car.brand) \(car.model)"
            .replacingOccurrences(of: " ", with: "_")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "https://en.wikipedia.org/api/rest_v1/page/summary/\(query)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            struct WikiResponse: Codable {
                let thumbnail: WikiImage?
            }
            struct WikiImage: Codable {
                let source: String
            }
            if let data = data,
               let result = try? JSONDecoder().decode(WikiResponse.self, from: data),
               let imageURL = result.thumbnail?.source {
                DispatchQueue.main.async {
                    self.cache[car.id] = [imageURL]
                    self.photosByCarId[car.id] = [imageURL]
                }
            }
        }.resume()
    }
}

// ─── PhotoGallery ─────────────────────────────────────────────────────────────
struct PhotoGallery: View {
    let car: Car
    @StateObject private var unsplash = UnsplashService.shared
    @State private var currentIndex = 0

    var photos: [String] {
        unsplash.photosByCarId[car.id] ?? []
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            if photos.isEmpty {
                // Fallback: Markenfarbe + Emoji
                ZStack {
                    car.brandColor.opacity(0.3)
                    Text(car.emoji)
                        .font(.system(size: 100))
                }
                .frame(height: 280)
            } else {
                TabView(selection: $currentIndex) {
                    ForEach(Array(photos.enumerated()), id: \.offset) { index, urlString in
                        AsyncImage(url: URL(string: urlString)) { phase in
                            switch phase {
                            case .empty:
                                Rectangle()
                                    .fill(Color.white.opacity(0.05))
                                    .overlay(ProgressView().tint(.white))
                            case .success(let image):
                                image.resizable().scaledToFill()
                            default:
                                Rectangle()
                                    .fill(Color.white.opacity(0.05))
                                    .overlay(Image(systemName: "photo").foregroundColor(.gray))
                            }
                        }
                        .frame(height: 280)
                        .clipped()
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 280)

                // Dots
                if photos.count > 1 {
                    HStack(spacing: 6) {
                        ForEach(0..<photos.count, id: \.self) { i in
                            Circle()
                                .fill(i == currentIndex ? Color(hex: "#E8C547") : Color.white.opacity(0.4))
                                .frame(width: i == currentIndex ? 8 : 5, height: i == currentIndex ? 8 : 5)
                        }
                    }
                    .padding(.bottom, 12)
                }
            }
        }
        .onAppear {
            unsplash.loadPhotos(for: car)
        }
    }
}
