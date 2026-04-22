import SwiftUI

struct StatsView: View {
    @EnvironmentObject var spotService: SpotService
    @ObservedObject var achievementService = AchievementService.shared

    @State private var showAchievements = false
    @State private var showLeaderboard = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: spotService.spottedIds.count,
                        total: allCars.count
                    )

                    // Achievements + Rangliste Buttons
                    VStack(spacing: 12) {
                        Button(action: { showAchievements = true }) {
                            HStack {
                                Image(systemName: "trophy.fill")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .frame(width: 44, height: 44)
                                    .background(Color(hex: "#E8C547"))
                                    .clipShape(Circle())

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Achievements")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("\(achievementService.unlockedIds.count) / \(allAchievements.count) freigeschaltet")
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

                        Button(action: { showLeaderboard = true }) {
                            HStack {
                                Image(systemName: "list.number")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .frame(width: 44, height: 44)
                                    .background(Color(hex: "#E8C547"))
                                    .clipShape(Circle())

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Rangliste")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Lokale Highscores")
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
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("Deine Sammler-Erfolge")
                            .font(.headline)
                            .padding(.horizontal)

                        Text("Statistiken und Abzeichen kommen in einem der nächsten Updates!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.03))
                            .cornerRadius(15)
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
}
