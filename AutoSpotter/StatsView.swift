import SwiftUI

struct StatsView: View {
    @EnvironmentObject var spotService: SpotService
    @ObservedObject var achievementService = AchievementService.shared
    @ObservedObject var streakService = StreakService.shared
    @ObservedObject var store = SpotStore.shared
    @ObservedObject var challengeService = ChallengeService.shared

    @State private var showAchievements = false
    @State private var showLeaderboard = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: store.allSpottedIds.count,
                        total: allCars.count
                    )

                    // Streak Mini Card
                    StreakCard(
                        currentStreak: streakService.currentStreak,
                        longestStreak: streakService.longestStreak,
                        todaySpots: streakService.todaySpots,
                        totalDays: streakService.totalDaysSpotted
                    )

                    // Statistik-Grid
                    statsGrid

                    // Achievements + Rangliste Buttons
                    VStack(spacing: 12) {
                        Button(action: { showAchievements = true }) {
                            navCard(
                                icon: "trophy.fill",
                                title: "Achievements",
                                subtitle: "\(achievementService.unlockedIds.count) / \(allAchievements.count) freigeschaltet"
                            )
                        }

                        Button(action: { showLeaderboard = true }) {
                            navCard(
                                icon: "list.number",
                                title: "Rangliste",
                                subtitle: "Lokale Highscores"
                            )
                        }
                    }
                    .padding(.horizontal)

                    // Bonus-Punkte
                    if challengeService.totalBonusPoints > 0 {
                        HStack {
                            Image(systemName: "gift.fill")
                                .foregroundColor(Color(hex: "#E8C147"))
                            Text("Bonus: +\(challengeService.totalBonusPoints) Pkt")
                                .foregroundColor(Color(hex: "#E8C147"))
                        }
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#E8C547").opacity(0.1))
                        .cornerRadius(14)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .background(Color(hex: "#0F0F0F").ignoresSafeArea())
            .navigationTitle("Statistiken")
            .sheet(isPresented: $showAchievements) {
                AchievementsView()
                    .environmentObject(spotService)
            }
            .sheet(isPresented: $showLeaderboard) {
                LeaderboardView()
                    .environmentObject(spotService)
            }
        }
    }

    private var statsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            StatBox(
                value: "\(store.totalSpots)",
                label: "Spots gesamt",
                icon: "binoculars.fill",
                color: Color(hex: "#E8C547")
            )
            StatBox(
                value: "\(streakService.totalDaysSpotted)",
                label: "Aktive Tage",
                icon: "calendar",
                color: .blue
            )
            StatBox(
                value: "\(allCars.filter { $0.rarityLevel >= 4 }.filter { spotService.isSpotted($0.id) }.count)",
                label: "Seltene Funde",
                icon: "sparkles",
                color: .purple
            )
            StatBox(
                value: "\(Set(spotService.spottedIds.compactMap { id in allCars.first(where: { $0.id == id })?.brand }).count)",
                label: "Marken",
                icon: "car.2.fill",
                color: .orange
            )
            StatBox(
                value: "\(challengeService.completedToday.count)",
                label: "Bountys heute",
                icon: "target",
                color: .green
            )
            StatBox(
                value: "\(store.records.filter { $0.photoIndex != nil }.count)",
                label: "Fotos",
                icon: "camera.fill",
                color: .red
            )
        }
        .padding(.horizontal)
    }

    private func navCard(icon: String, title: String, subtitle: String) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 44, height: 44)
                .background(Color(hex: "#E8C547"))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(14)
        .background(Color.white.opacity(0.06))
        .cornerRadius(14)
    }
}

struct StatBox: View {
    let value: String
    let label: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)

            Text(value)
                .font(.title.bold())
                .foregroundColor(.white)

            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.white.opacity(0.04))
        .cornerRadius(14)
    }
}
