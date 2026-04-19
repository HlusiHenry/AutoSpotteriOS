import SwiftUI

// ─── Hilfsfunktion: Markenname → Asset-Name ──────────────────────────────────
// Wandelt "Alfa Romeo" → "Alfa-Romeo" damit es mit den PNG-Dateinamen passt
func brandLogoName(_ brand: String) -> String {
    return brand.replacingOccurrences(of: " ", with: "-")
}

// ─── CarRow ───────────────────────────────────────────────────────────────────
struct CarRow: View {
    let car: Car
    let isSpotted: Bool
    @EnvironmentObject var spotService: SpotService

    var body: some View {
        HStack(spacing: 14) {

            // Markenlogo oder Fallback Emoji
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(car.brandColor.opacity(0.2))
                    .frame(width: 55, height: 55)

                if UIImage(named: brandLogoName(car.brand)) != nil {
                    Image(brandLogoName(car.brand))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .padding(4)
                } else {
                    Text(car.emoji)
                        .font(.system(size: 32))
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("\(car.brand) \(car.model)")
                    .font(.headline)
                    .foregroundColor(.white)

                HStack(spacing: 6) {
                    Text(car.rarityLabel)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(car.rarityColor.opacity(0.2))
                        .foregroundColor(car.rarityColor)
                        .cornerRadius(4)

                    Text("\(car.points) Pkt.")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            // Fernglas-Button
            Button(action: {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                spotService.toggleSpot(car.id)
            }) {
                Image(systemName: isSpotted ? "binoculars.fill" : "binoculars")
                    .foregroundColor(isSpotted ? Color(hex: "#E8C547") : .gray.opacity(0.5))
                    .font(.title3)
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.05))
                    .clipShape(Circle())
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.white.opacity(0.03))
        .cornerRadius(16)
    }
}

// ─── PointsCard ───────────────────────────────────────────────────────────────
struct PointsCard: View {
    let points: Int
    let spotted: Int
    let total: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("DEIN FORTSCHRITT")
                        .font(.caption)
                        .fontWeight(.black)
                        .foregroundColor(.black.opacity(0.5))

                    Text("\(points)")
                        .font(.system(size: 54, weight: .black, design: .rounded))
                        .foregroundColor(.black)

                    Text("GESAMTPUNKTE")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.6))
                }
                Spacer()

                ZStack {
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 8)
                    Circle()
                        .trim(from: 0, to: CGFloat(spotted) / CGFloat(max(1, total)))
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .rotationEffect(.degrees(-90))

                    VStack(spacing: 0) {
                        Text("\(Int((Double(spotted) / Double(max(1, total))) * 100))%")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 70, height: 70)
            }

            Text("\(spotted) von \(total) Autos gesammelt")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.black.opacity(0.7))
        }
        .padding(24)
        .background(
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "#E8C547"), Color(hex: "#FFD700")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                GeometryReader { geo in
                    Color.white.opacity(0.2)
                        .frame(width: geo.size.width * 1.5)
                        .rotationEffect(.degrees(45))
                        .offset(x: -geo.size.width * 0.5, y: -geo.size.height * 0.5)
                }
            }
        )
        .cornerRadius(24)
        .shadow(color: Color(hex: "#E8C547").opacity(0.3), radius: 15, x: 0, y: 10)
        .padding(.horizontal)
    }
}

// ─── Color Hex Extension ──────────────────────────────────────────────────────
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
