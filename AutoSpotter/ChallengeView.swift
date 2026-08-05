import SwiftUI

/// Bounty Board — tägliche und wöchentliche Challenges
struct ChallengeView: View {
    @ObservedObject var challengeService = ChallengeService.shared
    @EnvironmentObject var spotService: SpotService
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Segment Picker
                    Picker("Zeitraum", selection: $selectedTab) {
                        Text("Täglich").tag(0)
                        Text("Wöchentlich").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)

                    if selectedTab == 0 {
                        dailySection
                    } else {
                        weeklySection
                    }

                    // Bonuspunkte Summe
                    bonusPointsCard
                }
                .padding(.top)
            }
            .background(Color(hex: "#0F0F0F").ignoresSafeArea())
            .navigationTitle("Bounty Board")
            .onAppear {
                challengeService.checkRefresh()
                challengeService.refreshProgress()
            }
        }
    }

    // MARK: - Daily Challenges

    private var dailySection: some View {
        VStack(spacing: 12) {
            if challengeService.dailyChallenges.isEmpty {
                Text("Keine täglichen Challenges verfügbar")
                    .foregroundColor(.gray)
                    .padding()
            }

            ForEach(challengeService.dailyChallenges) { active in
                ChallengeCard(
                    active: active,
                    isClaimed: challengeService.completedToday.contains(active.id),
                    onClaim: {
                        if let reward = challengeService.claimReward(for: active.id) {
                            // Bonus-Punkte zum SpotService hinzufügen?
                            // Für jetzt: visuelles Feedback
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                        }
                    }
                )
            }

            HStack {
                Image(systemName: "clock")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Neue Challenges morgen")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.top, 4)
        }
        .padding(.horizontal)
    }

    // MARK: - Weekly Challenges

    private var weeklySection: some View {
        VStack(spacing: 12) {
            if challengeService.weeklyChallenges.isEmpty {
                Text("Keine wöchentlichen Challenges verfügbar")
                    .foregroundColor(.gray)
                    .padding()
            }

            ForEach(challengeService.weeklyChallenges) { active in
                ChallengeCard(
                    active: active,
                    isClaimed: challengeService.completedThisWeek.contains(active.id),
                    onClaim: {
                        if let _ = challengeService.claimReward(for: active.id) {
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                        }
                    }
                )
            }

            HStack {
                Image(systemName: "calendar")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Neue Challenges nächsten Montag")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.top, 4)
        }
        .padding(.horizontal)
    }

    // MARK: - Bonus Points

    private var bonusPointsCard: some View {
        VStack(spacing: 6) {
            Text("💰 Bonus-Punkte gesammelt")
                .font(.caption)
                .foregroundColor(.gray)
            Text("+\(challengeService.totalBonusPoints)")
                .font(.title.bold())
                .foregroundColor(Color(hex: "#E8C547"))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.03))
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}

// MARK: - Challenge Card

struct ChallengeCard: View {
    let active: ChallengeService.ActiveChallenge
    let isClaimed: Bool
    let onClaim: () -> Void

    var challenge: Challenge { active.challenge }

    var body: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                Circle()
                    .fill(active.isCompleted
                          ? Color.green.opacity(0.2)
                          : Color(hex: "#E8C547").opacity(0.15))
                    .frame(width: 50, height: 50)

                Image(systemName: isClaimed ? "checkmark.circle.fill" : challenge.icon)
                    .font(.title3)
                    .foregroundColor(isClaimed
                                     ? .green
                                     : (active.isCompleted
                                        ? Color(hex: "#E8C547")
                                        : .gray))
            }

            // Info
            VStack(alignment: .leading, spacing: 4) {
                Text(challenge.title)
                    .font(.subheadline.bold())
                    .foregroundColor(isClaimed ? .gray : .white)
                    .strikethrough(isClaimed)

                Text(challenge.description)
                    .font(.caption)
                    .foregroundColor(.gray)

                // Progress Bar
                ProgressView(value: active.progressFraction)
                    .progressViewStyle(LinearProgressViewStyle(
                        tint: active.isCompleted ? .green : Color(hex: "#E8C547")
                    ))
                    .scaleEffect(x: 1, y: 1.5, anchor: .center)

                HStack {
                    Text("\(active.progress)/\(challenge.target)")
                        .font(.caption2)
                        .foregroundColor(.gray)

                    Spacer()

                    Text("+\(challenge.reward) Bonus")
                        .font(.caption2.bold())
                        .foregroundColor(Color(hex: "#E8C547"))
                }
            }

            Spacer()

            // Claim Button
            if active.isCompleted && !isClaimed {
                Button(action: onClaim) {
                    Text("Claim")
                        .font(.caption.bold())
                        .foregroundColor(.black)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            } else if isClaimed {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
                    .font(.title3)
            }
        }
        .padding(14)
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
    }
}
