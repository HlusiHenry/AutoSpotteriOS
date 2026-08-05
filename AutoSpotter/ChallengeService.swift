import Foundation
import Combine

/// Verwaltet das Bounty Board — tägliche und wöchentliche Challenges
class ChallengeService: ObservableObject {
    static let shared = ChallengeService()

    @Published var dailyChallenges: [ActiveChallenge] = []
    @Published var weeklyChallenges: [ActiveChallenge] = []
    @Published var completedToday: [String] = []   // Challenge IDs
    @Published var completedThisWeek: [String] = []

    private let dailyKey = "challenges_daily"
    private let weeklyKey = "challenges_weekly"
    private let dailyCompletedKey = "challenges_daily_completed"
    private let weeklyCompletedKey = "challenges_weekly_completed"
    private let lastDailyRefresh = "challenges_last_daily_refresh"
    private let lastWeeklyRefresh = "challenges_last_weekly_refresh"

    struct ActiveChallenge: Identifiable, Codable {
        let challenge: Challenge
        var progress: Int

        var id: String { challenge.id }
        var isCompleted: Bool { progress >= challenge.target }
        var progressFraction: Double {
            min(Double(progress) / Double(challenge.target), 1.0)
        }

        init(challenge: Challenge, progress: Int = 0) {
            self.challenge = challenge
            self.progress = progress
        }
    }

    init() {
        checkRefresh()
        load()
        // refreshProgress() NICHT in init — verhindert Deadlock mit SpotService.shared
    }

    // MARK: - Refresh

    func checkRefresh() {
        let today = Calendar.current.startOfDay(for: Date())
        let defaults = UserDefaults.standard

        // Daily Refresh
        if let lastRefresh = defaults.object(forKey: lastDailyRefresh) as? Date {
            if !Calendar.current.isDate(lastRefresh, inSameDayAs: today) {
                generateDailyChallenges()
                completedToday = []
                defaults.set(today, forKey: lastDailyRefresh)
            }
        } else {
            generateDailyChallenges()
            completedToday = []
            defaults.set(today, forKey: lastDailyRefresh)
        }

        // Weekly Refresh (Montag)
        let weekday = Calendar.current.component(.weekday, from: today)
        if let lastRefresh = defaults.object(forKey: lastWeeklyRefresh) as? Date {
            let lastWeekday = Calendar.current.component(.weekday, from: lastRefresh)
            if weekday == 2 && lastWeekday != 2 { // Montag
                generateWeeklyChallenges()
                completedThisWeek = []
                defaults.set(today, forKey: lastWeeklyRefresh)
            }
        } else {
            generateWeeklyChallenges()
            completedThisWeek = []
            defaults.set(today, forKey: lastWeeklyRefresh)
        }

        save()
    }

    private func generateDailyChallenges() {
        let dailies = challengePool.filter { $0.timeframe == .daily }.shuffled()
        dailyChallenges = Array(dailies.prefix(3)).map { ActiveChallenge(challenge: $0) }
    }

    private func generateWeeklyChallenges() {
        let weeklies = challengePool.filter { $0.timeframe == .weekly }.shuffled()
        weeklyChallenges = Array(weeklies.prefix(3)).map { ActiveChallenge(challenge: $0) }
    }

    // MARK: - Progress Tracking

    func refreshProgress() {
        let store = SpotStore.shared
        let spots = store.records
        let spotService = SpotService.shared
        let photoService = PhotoService.shared

        // Daily Challenges
        for i in dailyChallenges.indices {
            dailyChallenges[i].progress = calculateProgress(
                for: dailyChallenges[i].challenge,
                spots: spots,
                spotService: spotService,
                photoService: photoService,
                timeframe: .daily
            )
        }

        // Weekly Challenges
        for i in weeklyChallenges.indices {
            weeklyChallenges[i].progress = calculateProgress(
                for: weeklyChallenges[i].challenge,
                spots: spots,
                spotService: spotService,
                photoService: photoService,
                timeframe: .weekly
            )
        }

        save()
    }

    private func calculateProgress(for challenge: Challenge,
                                   spots: [SpotRecord],
                                   spotService: SpotService,
                                   photoService: PhotoService,
                                   timeframe: Challenge.Timeframe) -> Int {
        let calendar = Calendar.current
        let now = Date()

        let filteredSpots: [SpotRecord]
        if timeframe == .daily {
            filteredSpots = spots.filter { calendar.isDate($0.spottedAt, inSameDayAs: now) }
        } else {
            // Weekly: ab Montag dieser Woche
            let weekStart = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now))!
            filteredSpots = spots.filter { $0.spottedAt >= weekStart }
        }

        switch challenge.type {
        case .spotCount:
            return filteredSpots.count

        case .brandSpecific:
            // Challenge-Titel enthält Markennamen (einfache Heuristik)
            let brandCars = allCars.filter { car in
                filteredSpots.contains { $0.id == car.id }
            }
            return brandCars.filter { car in
                challenge.title.lowercased().contains(car.brand.lowercased())
            }.count

        case .rarityLevel:
            let relevant = filteredSpots.compactMap { spot in
                allCars.first { $0.id == spot.id }
            }
            return relevant.filter { $0.rarityLevel >= challenge.target }.count

        case .categoryTarget:
            let relevant = filteredSpots.compactMap { spot in
                allCars.first { $0.id == spot.id }
            }
            return relevant.filter { car in
                car.category.lowercased().contains("hypercar") ||
                car.rarityLevel >= 5
            }.count

        case .photoProof:
            // Zähle wie viele gespottete Autos Fotos haben
            return filteredSpots.filter { $0.photoIndex != nil }.count

        case .streakDays:
            return StreakService.shared.currentStreak
        }
    }

    func claimReward(for challengeId: String) -> Int? {
        // Daily
        if let index = dailyChallenges.firstIndex(where: { $0.id == challengeId }),
           dailyChallenges[index].isCompleted,
           !completedToday.contains(challengeId) {
            completedToday.append(challengeId)
            save()
            return dailyChallenges[index].challenge.reward
        }

        // Weekly
        if let index = weeklyChallenges.firstIndex(where: { $0.id == challengeId }),
           weeklyChallenges[index].isCompleted,
           !completedThisWeek.contains(challengeId) {
            completedThisWeek.append(challengeId)
            save()
            return weeklyChallenges[index].challenge.reward
        }

        return nil
    }

    var totalBonusPoints: Int {
        var total = 0
        for c in dailyChallenges where completedToday.contains(c.id) {
            total += c.challenge.reward
        }
        for c in weeklyChallenges where completedThisWeek.contains(c.id) {
            total += c.challenge.reward
        }
        return total
    }

    // MARK: - Persistenz

    private func save() {
        if let encoded = try? JSONEncoder().encode(dailyChallenges) {
            UserDefaults.standard.set(encoded, forKey: dailyKey)
        }
        if let encoded = try? JSONEncoder().encode(weeklyChallenges) {
            UserDefaults.standard.set(encoded, forKey: weeklyKey)
        }
        UserDefaults.standard.set(completedToday, forKey: dailyCompletedKey)
        UserDefaults.standard.set(completedThisWeek, forKey: weeklyCompletedKey)
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: dailyKey),
           let decoded = try? JSONDecoder().decode([ActiveChallenge].self, from: data) {
            dailyChallenges = decoded
        }
        if let data = UserDefaults.standard.data(forKey: weeklyKey),
           let decoded = try? JSONDecoder().decode([ActiveChallenge].self, from: data) {
            weeklyChallenges = decoded
        }
        completedToday = UserDefaults.standard.stringArray(forKey: dailyCompletedKey) ?? []
        completedThisWeek = UserDefaults.standard.stringArray(forKey: weeklyCompletedKey) ?? []
    }
}
