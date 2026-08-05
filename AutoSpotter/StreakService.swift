import Foundation
import Combine

/// Trackt tägliche Spot-Streaks und gibt Statistiken
class StreakService: ObservableObject {
    static let shared = StreakService()

    @Published var currentStreak: Int = 0
    @Published var longestStreak: Int = 0
    @Published var totalDaysSpotted: Int = 0
    @Published var todaySpots: Int = 0
    @Published var lastSpotDate: Date?

    private let currentStreakKey = "streak_current"
    private let longestStreakKey = "streak_longest"
    private let totalDaysKey = "streak_total_days"
    private let lastDateKey = "streak_last_date"

    init() { load(); refresh() }

    /// Wird nach jedem Spot aufgerufen
    func recordSpot() {
        let today = Calendar.current.startOfDay(for: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        lastSpotDate = Date()

        // Prüfen ob heute schon gespottet wurde
        if let lastDate = UserDefaults.standard.string(forKey: lastDateKey),
           lastDate == formatter.string(from: today) {
            // Heute schon — nur Counter erhöhen
            todaySpots += 1
            save()
            return
        }

        // Neuer Tag!
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let yesterdayString = formatter.string(from: yesterday)

        if let lastDate = UserDefaults.standard.string(forKey: lastDateKey) {
            if lastDate == yesterdayString {
                // Gestern auch gespottet → Streak verlängern
                currentStreak += 1
            } else if lastDate == formatter.string(from: today) {
                // Heute schon (sollte nicht passieren wegen obigem Check)
            } else {
                // Lücke → Streak reset
                currentStreak = 1
            }
        } else {
            // Erster Spot überhaupt
            currentStreak = 1
        }

        if currentStreak > longestStreak {
            longestStreak = currentStreak
        }

        totalDaysSpotted += 1
        todaySpots = 1

        UserDefaults.standard.set(formatter.string(from: today), forKey: lastDateKey)
        save()
    }

    func refresh() {
        let store = SpotStore.shared
        let spots = store.records

        if let last = spots.map({ $0.spottedAt }).max() {
            lastSpotDate = last
        }

        totalDaysSpotted = store.uniqueSpotDays.count
        todaySpots = store.spotsOnDay(Date())

        // Berechne aktuellen Streak
        calculateStreak()
    }

    private func calculateStreak() {
        let store = SpotStore.shared
        let days = store.uniqueSpotDays.sorted()
        guard !days.isEmpty else {
            currentStreak = 0
            return
        }

        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let todayString = formatter.string(from: today)
        let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!
        let yesterdayString = formatter.string(from: yesterday)

        // Streak zählt nur wenn gestern ODER heute gespottet wurde
        var streak = 0
        let sortedDays = days.sorted().reversed()

        guard let firstDay = sortedDays.first else { return }

        // Erster Tag muss heute oder gestern sein
        if firstDay != todayString && firstDay != yesterdayString {
            currentStreak = 0
            return
        }

        var checkDate = firstDay == todayString ? today : yesterday
        for dayStr in sortedDays {
            if dayStr == formatter.string(from: checkDate) {
                streak += 1
                checkDate = calendar.date(byAdding: .day, value: -1, to: checkDate)!
            } else if dayStr < formatter.string(from: checkDate) {
                break
            }
        }

        currentStreak = streak
        if streak > longestStreak { longestStreak = streak }
        save()
    }

    // MARK: - Persistenz

    private func save() {
        UserDefaults.standard.set(currentStreak, forKey: currentStreakKey)
        UserDefaults.standard.set(longestStreak, forKey: longestStreakKey)
        UserDefaults.standard.set(totalDaysSpotted, forKey: totalDaysKey)
    }

    private func load() {
        currentStreak = UserDefaults.standard.integer(forKey: currentStreakKey)
        longestStreak = UserDefaults.standard.integer(forKey: longestStreakKey)
        totalDaysSpotted = UserDefaults.standard.integer(forKey: totalDaysKey)
    }
}
