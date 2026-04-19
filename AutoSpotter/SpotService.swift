import Foundation
<<<<<<< HEAD
=======
import Combine
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3

class SpotService: ObservableObject {
    static let shared = SpotService()
    private let key = "spotted_cars"

    @Published var spottedIds: Set<String> = []

<<<<<<< HEAD
    init() {
        load()
    }
=======
    init() { load() }
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3

    private func load() {
        let saved = UserDefaults.standard.stringArray(forKey: key) ?? []
        spottedIds = Set(saved)
    }

    private func save() {
        UserDefaults.standard.set(Array(spottedIds), forKey: key)
    }

<<<<<<< HEAD
    func isSpotted(_ carId: String) -> Bool {
        spottedIds.contains(carId)
    }

    func markAsSpotted(_ carId: String) {
        spottedIds.insert(carId)
        save()
    }

    func removeSpot(_ carId: String) {
        spottedIds.remove(carId)
        save()
    }

    func toggleSpot(_ carId: String) {
        if isSpotted(carId) {
            removeSpot(carId)
        } else {
            markAsSpotted(carId)
        }
    }

    var totalPoints: Int {
        allCars
            .filter { spottedIds.contains($0.id) }
            .reduce(0) { $0 + $1.points }
=======
    func isSpotted(_ carId: String) -> Bool { spottedIds.contains(carId) }
    func markAsSpotted(_ carId: String) { spottedIds.insert(carId); save() }
    func removeSpot(_ carId: String) { spottedIds.remove(carId); save() }
    func toggleSpot(_ carId: String) {
        if isSpotted(carId) { removeSpot(carId) } else { markAsSpotted(carId) }
    }
    func clearAll() {
        spottedIds = []
        UserDefaults.standard.removeObject(forKey: key)
    }

    var totalPoints: Int {
        allCars.filter { spottedIds.contains($0.id) }.reduce(0) { $0 + $1.points }
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
    }
}
