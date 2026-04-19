import Foundation
import SwiftUI
import Combine

// ─── Unsplash Photo Model ───────────────────────────────────────────────────
struct UnsplashPhoto: Identifiable, Codable {
    let id: String
    let urls: UnsplashURLs
}

struct UnsplashURLs: Codable {
    let regular: String
    let small: String
}

// ─── UnsplashService ────────────────────────────────────────────────────────
// Lädt mehrere Fotos pro Auto von Unsplash und cached sie im Speicher
class UnsplashService: ObservableObject {
    static let shared = UnsplashService()

    // ⚠️ DEIN API KEY: Trage hier deinen Unsplash Access Key ein!
    private let apiKey = "GpzDVEq9a_LsN97Rk8YqvUT7Drj_T1fHNOzXBG0HzOc"

    // In-Memory Cache: carId → [UnsplashPhoto]
    private var cache: [String: [UnsplashPhoto]] = [:]

    @Published var photosByCarId: [String: [UnsplashPhoto]] = [:]

    func loadPhotos(for car: Car) {
        // Wenn schon gecached, nix laden
        if let cached = cache[car.id] {
            DispatchQueue.main.async {
                self.photosByCarId[car.id] = cached
            }
            return
        }

        let query = "\(car.brand) \(car.model) car"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&per_page=5&orientation=landscape&client_id=\(apiKey)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            struct SearchResult: Codable {
                let results: [UnsplashPhoto]
            }

            if let result = try? JSONDecoder().decode(SearchResult.self, from: data) {
                DispatchQueue.main.async {
                    self.cache[car.id] = result.results
                    self.photosByCarId[car.id] = result.results
                }
            }
        }.resume()
    }
}

// ─── AsyncUnsplashImage ──────────────────────────────────────────────────────
// Einzelnes Unsplash-Foto laden & anzeigen
struct AsyncUnsplashImage: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                Rectangle()
                    .fill(Color.white.opacity(0.05))
                    .overlay(ProgressView().tint(.white))
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Rectangle()
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            @unknown default:
                EmptyView()
            }
        }
    }
}

// ─── PhotoGallery ────────────────────────────────────────────────────────────
// Swipeable Fotogalerie für den DetailScreen
struct PhotoGallery: View {
    let car: Car
    @StateObject private var unsplash = UnsplashService.shared
    @State private var currentIndex = 0

    var photos: [UnsplashPhoto] {
        unsplash.photosByCarId[car.id] ?? []
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            if photos.isEmpty {
                // Fallback: Markenfarbe + Emoji solange Fotos laden
                ZStack {
                    car.brandColor.opacity(0.3)
                    Text(car.emoji)
                        .font(.system(size: 100))
                }
                .frame(height: 280)
            } else {
                // Swipeable TabView
                TabView(selection: $currentIndex) {
                    ForEach(Array(photos.enumerated()), id: \.element.id) { index, photo in
                        AsyncUnsplashImage(urlString: photo.urls.regular)
                            .frame(height: 280)
                            .clipped()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 280)

                // Eigene Dots
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
        .onAppear {
            unsplash.loadPhotos(for: car)
        }
    }
}
