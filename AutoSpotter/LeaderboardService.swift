import Foundation
import Combine

struct LeaderboardEntry: Identifiable, Codable {
    let id: UUID
    var name: String
    var points: Int
    var spotsCount: Int
    var date: Date

    init(name: String, points: Int, spotsCount: Int) {
        self.id = UUID()
        self.name = name
        self.points = points
        self.spotsCount = spotsCount
        self.date = Date()
    }
}

class LeaderboardService: ObservableObject {
    static let shared = LeaderboardService()

    private let key = "leaderboard_entries"
    private let myNameKey = "leaderboard_my_name"

    @Published var entries: [LeaderboardEntry] = []
    @Published var myName: String = ""

    init() {
        load()
        loadMyName()
        if entries.isEmpty {
            seedDemoData()
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([LeaderboardEntry].self, from: data) {
            entries = decoded.sorted { $0.points > $1.points }
        }
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func loadMyName() {
        myName = UserDefaults.standard.string(forKey: myNameKey) ?? ""
    }

    func saveMyName(_ name: String) {
        myName = name
        UserDefaults.standard.set(name, forKey: myNameKey)
    }

    // Eigenen Score aktualisieren oder neu anlegen
    func updateMyScore(points: Int, spotsCount: Int) {
        guard !myName.isEmpty else { return }
        if let index = entries.firstIndex(where: { $0.name == myName }) {
            entries[index].points = points
            entries[index].spotsCount = spotsCount
            entries[index].date = Date()
        } else {
            let entry = LeaderboardEntry(name: myName, points: points, spotsCount: spotsCount)
            entries.append(entry)
        }
        entries.sort { $0.points > $1.points }
        save()
    }

    func myRank(points: Int) -> Int? {
        let sorted = entries.sorted { $0.points > $1.points }
        return sorted.firstIndex(where: { $0.name == myName }).map { $0 + 1 }
    }

    // Demo-Einträge damit die Liste nicht leer aussieht
    private func seedDemoData() {
        let demoEntries = [
            LeaderboardEntry(name: "MaxSpotter", points: 4850, spotsCount: 47),
            LeaderboardEntry(name: "CarHunter99", points: 3200, spotsCount: 31),
            LeaderboardEntry(name: "SpotKing", points: 2750, spotsCount: 28),
            LeaderboardEntry(name: "AutoFan_DE", points: 1900, spotsCount: 19),
            LeaderboardEntry(name: "HyperJäger", points: 1450, spotsCount: 15),
        ]
        entries = demoEntries.sorted { $0.points > $1.points }
        save()
    }

    func deleteAllEntries() {
        entries = []
        save()
        seedDemoData()
    }
}
