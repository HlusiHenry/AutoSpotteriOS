import Foundation
import Combine
import CoreLocation

/// Erweiterter Spot-Eintrag: Wann + Wo + Foto-Beweis
struct SpotRecord: Identifiable, Codable, Equatable {
    let id: String          // car.id
    let spottedAt: Date     // Timestamp
    let latitude: Double?   // GPS
    let longitude: Double?
    let locationName: String?
    let photoIndex: Int?    // Referenz auf PhotoService Index

    var coordinate: CLLocationCoordinate2D? {
        guard let lat = latitude, let lon = longitude else { return nil }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: spottedAt)
    }
}

/// Persistenter Store für SpotRecords — pro Car können mehrere Spots existieren
class SpotStore: ObservableObject {
    static let shared = SpotStore()
    private let key = "spot_records"

    @Published var records: [SpotRecord] = []

    init() { load() }

    // MARK: - CRUD

    func addSpot(carId: String, latitude: Double?, longitude: Double?,
                 locationName: String?, photoIndex: Int?) {
        let record = SpotRecord(
            id: carId,
            spottedAt: Date(),
            latitude: latitude,
            longitude: longitude,
            locationName: locationName,
            photoIndex: photoIndex
        )
        records.append(record)
        save()
    }

    func removeSpot(carId: String) {
        // Entfernt den LETZTEN Spot dieses Autos
        if let lastIndex = records.lastIndex(where: { $0.id == carId }) {
            records.remove(at: lastIndex)
            save()
        }
    }

    func removeAllSpots(for carId: String) {
        records.removeAll { $0.id == carId }
        save()
    }

    func spots(for carId: String) -> [SpotRecord] {
        records.filter { $0.id == carId }.sorted { $0.spottedAt > $1.spottedAt }
    }

    func latestSpot(for carId: String) -> SpotRecord? {
        spots(for: carId).first
    }

    func hasSpots(for carId: String) -> Bool {
        records.contains { $0.id == carId }
    }

    var allSpottedIds: Set<String> {
        Set(records.map { $0.id })
    }

    var totalSpots: Int { records.count }

    // MARK: - Tages-Statistiken für Streaks

    var allSpotDates: [Date] {
        records.map { $0.spottedAt }
    }

    var uniqueSpotDays: Set<String> {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return Set(records.map { formatter.string(from: $0.spottedAt) })
    }

    func spotsOnDay(_ date: Date) -> Int {
        let calendar = Calendar.current
        return records.filter { calendar.isDate($0.spottedAt, inSameDayAs: date) }.count
    }

    // MARK: - Persistenz

    private func save() {
        if let encoded = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([SpotRecord].self, from: data) {
            records = decoded
        }
    }

    // MARK: - Backup

    func createBackupString() -> String {
        guard let encoded = try? JSONEncoder().encode(records),
              let str = String(data: encoded, encoding: .utf8) else { return "" }
        return str.data(using: .utf8)?.base64EncodedString() ?? ""
    }

    func restoreFromBackup(code: String) -> Bool {
        guard let data = Data(base64Encoded: code),
              let str = String(data: data, encoding: .utf8),
              let decoded = try? JSONDecoder().decode([SpotRecord].self, from: str.data(using: .utf8)!) else {
            return false
        }
        records = decoded
        save()
        return true
    }

    func resetAll() {
        records.removeAll()
        save()
    }
}
