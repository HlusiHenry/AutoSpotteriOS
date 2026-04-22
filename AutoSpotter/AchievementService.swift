import Foundation
import UIKit
import Combine  // ← fixes ObservableObject / @Published errors

class AchievementService: ObservableObject {
    static let shared = AchievementService()

    private let key = "unlocked_achievements"
    private let spotDatesKey = "spot_dates"

    @Published var unlockedIds: Set<String> = []
    @Published var newlyUnlocked: Achievement? = nil

    init() {
        load()
    }

    private func load() {
        let saved = UserDefaults.standard.stringArray(forKey: key) ?? []
        unlockedIds = Set(saved)
    }

    private func save() {
        UserDefaults.standard.set(Array(unlockedIds), forKey: key)
    }

    func isUnlocked(_ id: String) -> Bool {
        unlockedIds.contains(id)
    }

    func checkAll(spottedIds: Set<String>, totalPoints: Int) {
        let spotted = allCars.filter { spottedIds.contains($0.id) }

        checkSpotCount(spotted: spotted)
        checkPoints(totalPoints: totalPoints)
        checkRarity(spotted: spotted)
        checkBrands(spottedIds: spottedIds)
        checkTimeAchievements()
        checkCompleteAll(spotted: spotted)
    }

    private func unlock(_ id: String) {
        guard !unlockedIds.contains(id) else { return }
        unlockedIds.insert(id)
        save()
        if let achievement = allAchievements.first(where: { $0.id == id }) {
            DispatchQueue.main.async {
                self.newlyUnlocked = achievement
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.newlyUnlocked = nil
                }
            }
        }
    }

    private func checkSpotCount(spotted: [Car]) {
        let count = spotted.count
        if count >= 1   { unlock("first_spot") }
        if count >= 5   { unlock("five_spots") }
        if count >= 25  { unlock("twentyfive_spots") }
        if count >= 50  { unlock("fifty_spots") }
        if count >= 100 { unlock("hundred_spots") }
    }

    private func checkPoints(totalPoints: Int) {
        if totalPoints >= 100   { unlock("points_100") }
        if totalPoints >= 500   { unlock("points_500") }
        if totalPoints >= 1000  { unlock("points_1000") }
        if totalPoints >= 5000  { unlock("points_5000") }
        if totalPoints >= 10000 { unlock("points_10000") }
    }

    // ⚠️ Replace `rarityLevel` below with whatever property name your Car model actually uses.
    private func checkRarity(spotted: [Car]) {
        let rarity3 = spotted.filter { $0.rarityLevel >= 3 }.count
        let rarity4 = spotted.filter { $0.rarityLevel >= 4 }.count
        let rarity5 = spotted.filter { $0.rarityLevel >= 5 }.count

        if rarity3 >= 1 { unlock("rarity_3") }
        if rarity4 >= 1 { unlock("rarity_4") }
        if rarity5 >= 1 { unlock("rarity_5_first") }
        if rarity5 >= 2 { unlock("rarity_5_double") }
    }

    private func checkBrands(spottedIds: Set<String>) {
        var brandMap: [String: [Car]] = [:]
        for car in allCars {
            brandMap[car.brand, default: []].append(car)
        }

        var completedBrands = 0
        for (brand, cars) in brandMap {
            let allSpotted = cars.allSatisfy { spottedIds.contains($0.id) }
            if allSpotted {
                completedBrands += 1
                if brand == "BMW"     { unlock("brand_bmw") }
                if brand == "Ferrari" { unlock("brand_ferrari") }
                if brand == "Porsche" { unlock("brand_porsche") }
            }
        }
        if completedBrands >= 1 { unlock("brand_any") }
        if completedBrands >= 5 { unlock("brand_five") }
    }

    func checkTimeAchievements() {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 22 || hour < 1 { unlock("night_owl") }
        if hour < 7               { unlock("early_bird") }

        let todayKey = todayDateString()
        let spotsToday = UserDefaults.standard.integer(forKey: "spots_today_\(todayKey)")
        if spotsToday >= 5 { unlock("five_in_one_day") }
    }

    func incrementTodayCount() {
        let todayKey = todayDateString()
        let key = "spots_today_\(todayKey)"
        let current = UserDefaults.standard.integer(forKey: key)
        UserDefaults.standard.set(current + 1, forKey: key)
    }

    private func checkCompleteAll(spotted: [Car]) {
        if spotted.count == allCars.count {
            unlock("complete_all")
        }
    }

    func checkPhotographer() {
        unlock("photographer")
    }

    func checkDailyChallenge() {
        unlock("daily_challenge")
    }

    private func todayDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
