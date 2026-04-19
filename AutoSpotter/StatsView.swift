import SwiftUI

struct StatsView: View {
    @EnvironmentObject var spotService: SpotService

    let rarityLevels: [(Int, String, Color)] = [
        (1, "Häufig", .green),
        (2, "Gelegentlich", .blue),
        (3, "Selten", .purple),
        (4, "Sehr selten", .orange),
        (5, "Extrem selten", .red),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: spotService.spottedIds.count,
                        total: allCars.count
                    )

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Nach Seltenheit")
                            .font(.headline)
                            .padding(.horizontal)

                        ForEach(rarityLevels, id: \.0) { level, label, color in
                            RarityRow(
                                rarityLevel: level,
                                label: label,
                                color: color,
                                spotted: allCars.filter {
                                    $0.rarityLevel == level && spotService.isSpotted($0.id)
                                }.count,
                                total: allCars.filter { $0.rarityLevel == level }.count
                            )
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .background(Color(hex: "#121212"))
            .navigationTitle("Stats")
        }
    }
}

struct RarityRow: View {
    let rarityLevel: Int
    let label: String
    let color: Color
    let spotted: Int
    let total: Int

    var progress: Double {
        total == 0 ? 0 : Double(spotted) / Double(total)
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Circle()
                    .fill(color)
                    .frame(width: 10, height: 10)
                Text(label)
                    .font(.subheadline)
                Spacer()
                Text("\(spotted) / \(total)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: color))
                .scaleEffect(x: 1, y: 2, anchor: .center)
        }
    }
}
