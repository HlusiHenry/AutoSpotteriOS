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

    private let apiKey = "DEIN_UNSPLASH_API_KEY"
    private let maxPhotos = 5

    private var cache: [String: [String]] = [:]
    @Published var photosByCarId: [String: [String]] = [:]

    func loadPhotos(for car: Car) {
        if let cached = cache[car.id] {
            DispatchQueue.main.async { self.photosByCarId[car.id] = cached }
            return
        }
        if apiKey != "DEIN_UNSPLASH_API_KEY" {
            loadFromUnsplash(for: car)
        } else {
            loadFromWikipediaMulti(for: car)
        }
    }

    // ── Unsplash (bis zu 5 Fotos) ─────────────────────────────────────────────
    private func loadFromUnsplash(for car: Car) {
        let query = "\(car.brand) \(car.model) car"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&per_page=\(maxPhotos)&orientation=landscape&client_id=\(apiKey)") else {
            loadFromWikipediaMulti(for: car)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            struct SearchResult: Codable { let results: [UnsplashPhoto] }
            if let data = data,
               let result = try? JSONDecoder().decode(SearchResult.self, from: data),
               !result.results.isEmpty {
                let urls = result.results.map { $0.urls.regular }
                DispatchQueue.main.async {
                    self.cache[car.id] = urls
                    self.photosByCarId[car.id] = urls
                }
            } else {
                self.loadFromWikipediaMulti(for: car)
            }
        }.resume()
    }

    // ── Wikipedia: Schritt 1 – Bild-Titel laden ───────────────────────────────
    private func loadFromWikipediaMulti(for car: Car) {
        let queries = [
            "\(car.brand)_\(car.model)",
            "\(car.model)_\(car.brand)",
            car.model
        ]
        tryWikipediaPageImages(queries: queries, for: car)
    }

    private func tryWikipediaPageImages(queries: [String], for car: Car) {
        guard !queries.isEmpty else {
            loadFromWikimediaCommons(for: car)
            return
        }
        var remaining = queries
        let current = (remaining.removeFirst()
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")

        let apiURL = "https://en.wikipedia.org/w/api.php?action=query&titles=\(current)&prop=images&format=json&imlimit=20"
        guard let url = URL(string: apiURL) else {
            tryWikipediaPageImages(queries: remaining, for: car)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            struct Resp: Codable { let query: PagesQuery }
            struct PagesQuery: Codable { let pages: [String: WikiPage] }
            struct WikiPage: Codable { let images: [WikiImageTitle]? }
            struct WikiImageTitle: Codable { let title: String }

            guard let data = data,
                  let result = try? JSONDecoder().decode(Resp.self, from: data),
                  let page = result.query.pages.values.first,
                  let images = page.images, !images.isEmpty else {
                self.tryWikipediaPageImages(queries: remaining, for: car)
                return
            }

            let photoTitles = images
                .map { $0.title }
                .filter { t in
                    let l = t.lowercased()
                    return (l.hasSuffix(".jpg") || l.hasSuffix(".jpeg") || l.hasSuffix(".png"))
                        && !l.contains("logo") && !l.contains("flag")
                        && !l.contains("icon") && !l.contains("map")
                        && !l.contains("coat") && !l.contains("badge")
                }
                .prefix(self.maxPhotos)
                .map { $0 }

            if photoTitles.isEmpty {
                self.tryWikipediaPageImages(queries: remaining, for: car)
            } else {
                self.resolveImageURLs(titles: photoTitles, for: car) {
                    self.tryWikipediaPageImages(queries: remaining, for: car)
                }
            }
        }.resume()
    }

    // ── Wikipedia: Schritt 2 – Bild-URLs auflösen ────────────────────────────
    private func resolveImageURLs(titles: [String], for car: Car, fallback: @escaping () -> Void) {
        let joined = titles.joined(separator: "|")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let apiURL = "https://en.wikipedia.org/w/api.php?action=query&titles=\(joined)&prop=imageinfo&iiprop=url&format=json"
        guard let url = URL(string: apiURL) else { fallback(); return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            struct Resp: Codable { let query: PagesQuery }
            struct PagesQuery: Codable { let pages: [String: ImagePage] }
            struct ImagePage: Codable { let imageinfo: [ImageInfo]? }
            struct ImageInfo: Codable { let url: String }

            guard let data = data,
                  let result = try? JSONDecoder().decode(Resp.self, from: data) else {
                fallback(); return
            }

            let urls = result.query.pages.values
                .compactMap { $0.imageinfo?.first?.url }
                .filter { !$0.isEmpty }

            if urls.isEmpty {
                fallback()
            } else {
                DispatchQueue.main.async {
                    self.cache[car.id] = urls
                    self.photosByCarId[car.id] = urls
                }
            }
        }.resume()
    }

    // ── Wikimedia Commons Fallback (bis zu 5 Fotos) ───────────────────────────
    private func loadFromWikimediaCommons(for car: Car) {
        let searchTerm = "\(car.brand) \(car.model)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=\(searchTerm)&srnamespace=6&format=json&srlimit=\(maxPhotos)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            struct Resp: Codable { let query: QueryResult }
            struct QueryResult: Codable { let search: [SearchItem] }
            struct SearchItem: Codable { let title: String }

            guard let data = data,
                  let result = try? JSONDecoder().decode(Resp.self, from: data),
                  !result.query.search.isEmpty else { return }

            let urls: [String] = result.query.search.compactMap { item in
                let filename = item.title
                    .replacingOccurrences(of: "File:", with: "")
                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                return "https://commons.wikimedia.org/wiki/Special:FilePath/\(filename)?width=800"
            }

            if !urls.isEmpty {
                DispatchQueue.main.async {
                    self.cache[car.id] = urls
                    self.photosByCarId[car.id] = urls
                }
            }
        }.resume()
    }
}
