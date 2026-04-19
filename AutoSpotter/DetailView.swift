import SwiftUI

struct DetailView: View {
    let car: Car
    @EnvironmentObject var spotService: SpotService

    var isSpotted: Bool {
        spotService.isSpotted(car.id)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Hero Emoji
                ZStack {
                    Color(hex: "#1E1E1E")
                    Text(car.emoji)
                        .font(.system(size: 120))
                        .padding(.vertical, 40)
                }

                VStack(alignment: .leading, spacing: 20) {
                    // Titel + Badge
                    VStack(alignment: .leading, spacing: 8) {
                        Text(car.brand)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(car.model)
                            .font(.largeTitle)
                            .bold()
                        HStack(spacing: 12) {
                            RarityBadge(label: car.rarityLabel, level: car.rarityLevel)
                            Text("\(car.points) Punkte")
                                .font(.subheadline)
                                .foregroundColor(Color(hex: "#E8C547"))
                                .bold()
                        }
                    }

                    Divider().background(Color.gray.opacity(0.3))

                    // Beschreibung
                    Text(car.description)
                        .foregroundColor(.gray)
                        .font(.body)

                    Divider().background(Color.gray.opacity(0.3))

                    // Daten Tabelle
                    VStack(spacing: 12) {
                        DataRow(label: "Baujahr", value: "\(car.year)")
                        DataRow(label: "Kategorie", value: car.category)
                        DataRow(label: "PS", value: "\(car.hp) PS")
                        DataRow(label: "Topspeed", value: "\(car.topSpeed) km/h")
                        DataRow(label: "Preis", value: car.price)
                    }

                    // Gesehen Button
                    Button {
                        spotService.toggleSpot(car.id)
                    } label: {
                        HStack {
                            Image(systemName: isSpotted ? "checkmark.circle.fill" : "plus.circle.fill")
                            Text(isSpotted ? "Gespottet ✓" : "Als gespottet markieren")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isSpotted ? Color.green : Color(hex: "#E8C547"))
                        .foregroundColor(isSpotted ? .white : .black)
                        .cornerRadius(14)
                    }
                    .padding(.top, 8)
                }
                .padding()
            }
        }
        .background(Color(hex: "#121212"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DataRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .bold()
        }
    }
}

struct RarityBadge: View {
    let label: String
    let level: Int

    var color: Color {
        switch level {
        case 1: return .green
        case 2: return .blue
        case 3: return .purple
        case 4: return .orange
        case 5: return .red
        default: return .gray
        }
    }

    var body: some View {
        Text(label)
            .font(.caption)
            .bold()
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(8)
    }
}
