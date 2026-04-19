import SwiftUI

// ─── CarRow ───────────────────────────────────
struct CarRow: View {
    let car: Car
    let isSpotted: Bool

    var body: some View {
        HStack(spacing: 14) {
            Text(car.emoji)
                .font(.system(size: 36))
                .frame(width: 50)

            VStack(alignment: .leading, spacing: 4) {
                Text("\(car.brand) \(car.model)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(car.rarityLabel) • \(car.points) Punkte")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: isSpotted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isSpotted ? Color(hex: "#E8C547") : .gray)
                .font(.title3)
        }
        .padding(.vertical, 6)
    }
}

// ─── PointsCard ───────────────────────────────
struct PointsCard: View {
    let points: Int
    let spotted: Int
    let total: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Gesamtpunkte")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.7))
            Text("\(points)")
                .font(.system(size: 52, weight: .bold))
                .foregroundColor(.black)
            Text("\(spotted) von \(total) Autos gespottet")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.7))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(
            LinearGradient(
                colors: [Color(hex: "#E8C547"), Color(hex: "#B8942A")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

// ─── Color Hex Extension ──────────────────────
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
