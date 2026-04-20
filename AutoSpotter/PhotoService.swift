import Foundation
import UIKit

class PhotoService {
    static let shared = PhotoService()

    // MARK: - Ordner-Pfad

    private var documentsURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    // MARK: - Foto speichern

    /// Speichert ein neues Foto für ein Auto. Gibt den Index zurück.
    func savePhoto(_ image: UIImage, forCarId carId: String) -> Int {
        let existingCount = photoCount(forCarId: carId)
        let filename = "photo_\(carId)_\(existingCount).jpg"
        let fileURL = documentsURL.appendingPathComponent(filename)

        if let data = image.jpegData(compressionQuality: 0.85) {
            try? data.write(to: fileURL)
        }
        return existingCount
    }

    // MARK: - Fotos laden

    /// Gibt alle gespeicherten Fotos für ein Auto zurück (als UIImage-Array)
    func loadPhotos(forCarId carId: String) -> [UIImage] {
        var images: [UIImage] = []
        var index = 0
        while true {
            let filename = "photo_\(carId)_\(index).jpg"
            let fileURL = documentsURL.appendingPathComponent(filename)
            if FileManager.default.fileExists(atPath: fileURL.path),
               let image = UIImage(contentsOfFile: fileURL.path) {
                images.append(image)
                index += 1
            } else {
                break
            }
        }
        return images
    }

    /// Anzahl gespeicherter Fotos für ein Auto
    func photoCount(forCarId carId: String) -> Int {
        var count = 0
        while true {
            let filename = "photo_\(carId)_\(count).jpg"
            let fileURL = documentsURL.appendingPathComponent(filename)
            if FileManager.default.fileExists(atPath: fileURL.path) {
                count += 1
            } else {
                break
            }
        }
        return count
    }

    /// Löscht ein einzelnes Foto (und benennt die restlichen um, damit keine Lücken entstehen)
    func deletePhoto(forCarId carId: String, atIndex indexToDelete: Int) {
        let total = photoCount(forCarId: carId)

        // Zu löschendes Foto entfernen
        let deleteURL = documentsURL.appendingPathComponent("photo_\(carId)_\(indexToDelete).jpg")
        try? FileManager.default.removeItem(at: deleteURL)

        // Alle danach liegenden Fotos um 1 nach vorne verschieben
        for i in (indexToDelete + 1)..<total {
            let oldURL = documentsURL.appendingPathComponent("photo_\(carId)_\(i).jpg")
            let newURL = documentsURL.appendingPathComponent("photo_\(carId)_\(i - 1).jpg")
            try? FileManager.default.moveItem(at: oldURL, to: newURL)
        }

        // Metadaten ebenfalls verschieben
        for i in (indexToDelete + 1)..<total {
            let oldMeta = UserDefaults.standard.string(forKey: "photo_meta_\(carId)_\(i)")
            UserDefaults.standard.set(oldMeta, forKey: "photo_meta_\(carId)_\(i - 1)")
        }
        UserDefaults.standard.removeObject(forKey: "photo_meta_\(carId)_\(total - 1)")
    }

    /// Löscht alle Fotos eines Autos
    func deleteAllPhotos(forCarId carId: String) {
        let total = photoCount(forCarId: carId)
        for i in 0..<total {
            let fileURL = documentsURL.appendingPathComponent("photo_\(carId)_\(i).jpg")
            try? FileManager.default.removeItem(at: fileURL)
            UserDefaults.standard.removeObject(forKey: "photo_meta_\(carId)_\(i)")
        }
    }

    // MARK: - Metadaten (Datum + Ort)

    /// Speichert Metadaten (Datum + Ortsname) für ein Foto
    func saveMeta(forCarId carId: String, index: Int, date: Date, locationName: String?) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "de_DE")

        let dateString = formatter.string(from: date)
        let location = locationName ?? ""
        let value = location.isEmpty ? dateString : "\(dateString) · \(location)"
        UserDefaults.standard.set(value, forKey: "photo_meta_\(carId)_\(index)")
    }

    /// Gibt den Metadaten-String zurück (z.B. „15. April 2025 · München")
    func loadMeta(forCarId carId: String, index: Int) -> String? {
        return UserDefaults.standard.string(forKey: "photo_meta_\(carId)_\(index)")
    }
}
