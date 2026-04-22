import SwiftUI

struct AchievementsView: View {
    @EnvironmentObject var spotService: SpotService
    @ObservedObject var achievementService = AchievementService.shared

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Fortschritt oben
                    progressHeader

                    // Pro Kategorie
                    ForEach(Achievement.AchievementCategory.allCases, id: \.self) { category in
                        categorySection(category)
                    }
                }
                .padding()
            }
            .navigationTitle("Achievements")
            .background(Color(UIColor.systemBackground))
        }
    }

    // MARK: - Progress Header
    private var progressHeader: some View {
        let total = allAchievements.count
        let unlocked = achievementService.unlockedIds.count
        let progress = Double(unlocked) / Double(total)

        return VStack(spacing: 8) {
            HStack {
                Text("\(unlocked) / \(total) freigeschaltet")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(Int(progress * 100))%")
                    .font(.subheadline.bold())
                    .foregroundColor(Color(hex: "#E8C547"))
            }
            ProgressView(value: progress)
                .tint(Color(hex: "#E8C547"))
                .scaleEffect(x: 1, y: 1.5)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(14)
    }

    // MARK: - Kategorie Sektion
    private func categorySection(_ category: Achievement.AchievementCategory) -> some View {
        let achievements = allAchievements.filter { $0.category == category }

        return VStack(alignment: .leading, spacing: 10) {
            Text(category.rawValue)
                .font(.headline)
                .padding(.horizontal, 4)

            ForEach(achievements) { achievement in
                achievementRow(achievement)
            }
        }
    }

    // MARK: - Achievement Row
    private func achievementRow(_ achievement: Achievement) -> some View {
        let unlocked = achievementService.isUnlocked(achievement.id)

        return HStack(spacing: 14) {
            // Icon
            ZStack {
                Circle()
                    .fill(unlocked ? Color(hex: "#E8C547") : Color(UIColor.tertiarySystemBackground))
                    .frame(width: 44, height: 44)
                Image(systemName: achievement.icon)
                    .font(.system(size: 20))
                    .foregroundColor(unlocked ? .black : .gray)
            }

            // Text
            VStack(alignment: .leading, spacing: 2) {
                Text(achievement.title)
                    .font(.subheadline.bold())
                    .foregroundColor(unlocked ? .primary : .secondary)
                Text(achievement.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Checkmark
            if unlocked {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color(hex: "#E8C547"))
                    .font(.title3)
            } else {
                Image(systemName: "lock.fill")
                    .foregroundColor(Color(UIColor.tertiaryLabel))
                    .font(.title3)
            }
        }
        .padding(12)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .opacity(unlocked ? 1.0 : 0.6)
    }
}
