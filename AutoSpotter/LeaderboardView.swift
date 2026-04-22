import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var spotService: SpotService
    @ObservedObject var leaderboardService = LeaderboardService.shared

    @State private var showNameSheet = false
    @State private var nameInput = ""

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 16) {
                        // Eigener Score oben
                        myScoreCard

                        // Trennlinie
                        Text("RANGLISTE")
                            .font(.caption.bold())
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)

                        // Liste
                        ForEach(Array(leaderboardService.entries.enumerated()), id: \.element.id) { index, entry in
                            leaderboardRow(entry: entry, rank: index + 1)
                        }
                    }
                    .padding()
                }

                // Banner wenn Achievement freigeschaltet
                VStack {
                    if let achievement = AchievementService.shared.newlyUnlocked {
                        AchievementBanner(achievement: achievement)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    Spacer()
                }
                .animation(.spring(), value: AchievementService.shared.newlyUnlocked?.id)
            }
            .navigationTitle("Rangliste")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showNameSheet = true }) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color(hex: "#E8C547"))
                    }
                }
            }
            .sheet(isPresented: $showNameSheet) {
                nameSheet
            }
            .onAppear {
                leaderboardService.loadMyName()
                if !leaderboardService.myName.isEmpty {
                    leaderboardService.updateMyScore(
                        points: spotService.totalPoints,
                        spotsCount: spotService.spottedIds.count
                    )
                }
            }
        }
    }

    // MARK: - Eigener Score Card
    private var myScoreCard: some View {
        VStack(spacing: 10) {
            if leaderboardService.myName.isEmpty {
                Button(action: { showNameSheet = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(hex: "#E8C547"))
                        Text("Namen eingeben & mitmachen")
                            .font(.subheadline.bold())
                            .foregroundColor(Color(hex: "#E8C547"))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(14)
                }
            } else {
                HStack(spacing: 14) {
                    // Rang
                    ZStack {
                        Circle()
                            .fill(Color(hex: "#E8C547"))
                            .frame(width: 44, height: 44)
                        Text("#\(leaderboardService.myRank(points: spotService.totalPoints) ?? 0)")
                            .font(.headline.bold())
                            .foregroundColor(.black)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(leaderboardService.myName)
                            .font(.headline)
                        Text("\(spotService.spottedIds.count) Spots")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Text("\(spotService.totalPoints) Pts")
                        .font(.title3.bold())
                        .foregroundColor(Color(hex: "#E8C547"))
                }
                .padding()
                .background(Color(hex: "#E8C547").opacity(0.15))
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color(hex: "#E8C547"), lineWidth: 1)
                )
            }
        }
    }

    // MARK: - Ranglisten Row
    private func leaderboardRow(entry: LeaderboardEntry, rank: Int) -> some View {
        let isMe = entry.name == leaderboardService.myName

        return HStack(spacing: 14) {
            // Rang-Badge
            ZStack {
                Circle()
                    .fill(rankColor(rank))
                    .frame(width: 36, height: 36)
                Text("\(rank)")
                    .font(.subheadline.bold())
                    .foregroundColor(rank <= 3 ? .black : .primary)
            }

            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(entry.name)
                        .font(.subheadline.bold())
                    if isMe {
                        Text("Du")
                            .font(.caption.bold())
                            .foregroundColor(.black)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color(hex: "#E8C547"))
                            .cornerRadius(6)
                    }
                }
                Text("\(entry.spotsCount) Spots")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text("\(entry.points)")
                .font(.subheadline.bold())
                .foregroundColor(isMe ? Color(hex: "#E8C547") : .primary)
            Text("Pts")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }

    private func rankColor(_ rank: Int) -> Color {
        switch rank {
        case 1: return Color(hex: "#FFD700") // Gold
        case 2: return Color(hex: "#C0C0C0") // Silber
        case 3: return Color(hex: "#CD7F32") // Bronze
        default: return Color(UIColor.tertiarySystemBackground)
        }
    }

    // MARK: - Name Sheet
    private var nameSheet: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Wie heißt du?")
                    .font(.title2.bold())
                    .padding(.top)

                Text("Dein Name erscheint in der Rangliste.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                TextField("Dein Name", text: $nameInput)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                Button(action: {
                    if !nameInput.trimmingCharacters(in: .whitespaces).isEmpty {
                        leaderboardService.saveMyName(nameInput.trimmingCharacters(in: .whitespaces))
                        leaderboardService.updateMyScore(
                            points: spotService.totalPoints,
                            spotsCount: spotService.spottedIds.count
                        )
                        showNameSheet = false
                    }
                }) {
                    Text("Bestätigen")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#E8C547"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationTitle("Name einstellen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") { showNameSheet = false }
                }
            }
        }
        .onAppear {
            nameInput = leaderboardService.myName
        }
    }
}

// MARK: - Achievement Banner (globaler Overlay)
struct AchievementBanner: View {
    let achievement: Achievement

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: achievement.icon)
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(Color(hex: "#E8C547"))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text("Achievement freigeschaltet!")
                    .font(.caption.bold())
                    .foregroundColor(.secondary)
                Text(achievement.title)
                    .font(.subheadline.bold())
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding(14)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.3), radius: 10, y: 4)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}
