import Foundation
import Combine

class SpotService: ObservableObject {
    static let shared = SpotService()
    private let key = "spotted_cars"

    @Published var spottedIds: Set<String> = []

    init() { load() }

    private func load() {
        let saved = UserDefaults.standard.stringArray(forKey: key) ?? []
        spottedIds = Set(saved)
    }

    private func save() {
        UserDefaults.standard.set(Array(spottedIds), forKey: key)
    }

    func isSpotted(_ carId: String) -> Bool { spottedIds.contains(carId) }
    
    func markAsSpotted(_ carId: String) { 
        spottedIds.insert(carId)
        save() 
    }
    
    func removeSpot(_ carId: String) { 
        spottedIds.remove(carId)
        save() 
    }
    
    func toggleSpot(_ carId: String) {
        if isSpotted(carId) { removeSpot(carId) } else { markAsSpotted(carId) }
    }

    var totalPoints: Int {
        allCars.filter { spottedIds.contains($0.id) }.reduce(0) { $0 + $1.points }
    }
    
    // BACKUP FUNKTIONEN
    func createBackupString() -> String {
        let data = Array(spottedIds).joined(separator: ",")
        return data.data(using: .utf8)?.base64EncodedString() ?? ""
    }
    
    func restoreFromBackup(code: String) -> Bool {
        guard let data = Data(base64Encoded: code),
              let decodedString = String(data: data, encoding: .utf8) else {
            return false
        }
        
        let ids = decodedString.components(separatedBy: ",")
        spottedIds = Set(ids.filter { !$0.isEmpty })
        save()
        return true
    }
    
    func resetAll() {
        spottedIds.removeAll()
        save()
    }
}
