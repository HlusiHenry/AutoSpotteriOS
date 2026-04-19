import SwiftUI

struct StatsView: View {
    @EnvironmentObject var spotService: SpotService
<<<<<<< HEAD
=======
    @State private var showSettings = false
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3

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
<<<<<<< HEAD
=======
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(Color(hex: "#E8C547"))
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .environmentObject(spotService)
            }
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var spotService: SpotService
    @Environment(\.dismiss) var dismiss
    @State private var showDeleteConfirm = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Daten")) {
                    Button(role: .destructive) {
                        showDeleteConfirm = true
                    } label: {
                        HStack {
                            Image(systemName: "trash.fill")
                            Text("Alle Spots löschen")
                        }
                    }
                    .confirmationDialog(
                        "Wirklich alle Spots löschen?",
                        isPresented: $showDeleteConfirm,
                        titleVisibility: .visible
                    ) {
                        Button("Alles löschen", role: .destructive) {
                            spotService.clearAll()
                            dismiss()
                        }
                        Button("Abbrechen", role: .cancel) {}
                    }
                }

                Section(header: Text("App Info")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Autos gesamt")
                        Spacer()
                        Text("\(allCars.count)")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Gespottet")
                        Spacer()
                        Text("\(spotService.spottedIds.count)")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Einstellungen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fertig") { dismiss() }
                        .foregroundColor(Color(hex: "#E8C547"))
                }
            }
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
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
