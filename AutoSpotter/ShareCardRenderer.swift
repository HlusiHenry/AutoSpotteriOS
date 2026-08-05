import SwiftUI
import UIKit
import CoreLocation

/// Generiert Share-Bilder für Social Media
struct ShareCardRenderer {
    static let cardWidth: CGFloat = 1080
    static let cardHeight: CGFloat = 1350

    /// Erstellt ein Share-Bild für ein gesichtetes Auto
    static func render(car: Car, record: SpotRecord? = nil,
                       photo: UIImage? = nil,
                       userName: String = "",
                       points: Int = 0,
                       rank: Int? = nil) -> UIImage {
        let hasPhoto = photo != nil
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: cardWidth, height: cardHeight))

        return renderer.image { ctx in
            let rect = CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight)

            // Hintergrund
            UIColor(hex: "#0F0F0F").setFill()
            ctx.fill(rect)

            // Farbiger Verlauf oben (Markenfarbe)
            drawGradientTop(ctx: ctx, color: car.brandColor)

            // Foto (falls vorhanden)
            if let photo = photo {
                drawPhoto(ctx: ctx, photo: photo)
            }

            // Auto Infos
            let yStart: CGFloat = hasPhoto ? 720 : 180
            drawEmoji(ctx: ctx, car: car, yStart: yStart)
            drawModelName(ctx: ctx, car: car, yStart: yStart)
            drawBrandYear(ctx: ctx, car: car, yStart: yStart)
            drawSpecs(ctx: ctx, car: car, yStart: yStart)

            // Datum & Ort falls vorhanden
            if let record = record {
                drawSpotInfo(ctx: ctx, record: record, yStart: yStart)
            }

            // Raritäts-Badge
            drawRarityBadge(ctx: ctx, car: car)

            // Punkte
            let pointsY: CGFloat = hasPhoto ? 1100 : 650
            drawPointsBlock(ctx: ctx, car: car, points: points, yPos: pointsY)

            // User & Rank
            if !userName.isEmpty {
                let userY: CGFloat = hasPhoto ? 1230 : 780
                drawUserInfo(ctx: ctx, userName: userName, rank: rank, yPos: userY)
            }

            // Footer
            drawFooter(ctx: ctx)
        }
    }

    // MARK: - Einzelne Zeichen-Elemente

    private static func drawGradientTop(ctx: UIGraphicsImageRendererContext, color: Color) {
        let uiColor = UIColor(color)
        let gradientRect = CGRect(x: 0, y: 0, width: cardWidth, height: 400)

        let colors = [uiColor.withAlphaComponent(0.6).cgColor,
                      uiColor.withAlphaComponent(0.1).cgColor,
                      UIColor.clear.cgColor]
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: [0, 0.5, 1.0]) else { return }

        ctx.cgContext.drawLinearGradient(gradient,
                                          start: CGPoint(x: cardWidth/2, y: 0),
                                          end: CGPoint(x: cardWidth/2, y: 400),
                                          options: [])
    }

    private static func drawPhoto(ctx: UIGraphicsImageRendererContext, photo: UIImage) {
        let photoRect = CGRect(x: 40, y: 80, width: cardWidth - 80, height: 600)
        let path = UIBezierPath(roundedRect: photoRect, cornerRadius: 24)
        ctx.cgContext.addPath(path.cgPath)
        ctx.cgContext.clip()
        photo.draw(in: photoRect)
        ctx.cgContext.resetClip()

        let border = UIBezierPath(roundedRect: photoRect, cornerRadius: 24)
        UIColor.white.withAlphaComponent(0.1).setStroke()
        border.lineWidth = 2
        border.stroke()
    }

    private static func drawEmoji(ctx: UIGraphicsImageRendererContext, car: Car, yStart: CGFloat) {
        let emojiAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 72)
        ]
        (car.emoji as NSString).draw(at: CGPoint(x: 60, y: yStart),
                                      withAttributes: emojiAttributes)
    }

    private static func drawModelName(ctx: UIGraphicsImageRendererContext, car: Car, yStart: CGFloat) {
        let modelAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: UIColor.white
        ]
        (car.model as NSString).draw(at: CGPoint(x: 160, y: yStart + 5),
                                      withAttributes: modelAttributes)
    }

    private static func drawBrandYear(ctx: UIGraphicsImageRendererContext, car: Car, yStart: CGFloat) {
        let brandAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 28, weight: .medium),
            .foregroundColor: UIColor.gray
        ]
        ("\(car.brand) · \(car.year)" as NSString).draw(
            at: CGPoint(x: 160, y: yStart + 65),
            withAttributes: brandAttributes)
    }

    private static func drawSpecs(ctx: UIGraphicsImageRendererContext, car: Car, yStart: CGFloat) {
        let specY = yStart + 120
        let specs = [("\(car.hp) PS", "bolt.fill"),
                     ("\(car.topSpeed) km/h", "gauge.with.dots.needle.33percent"),
                     (car.price.replacingOccurrences(of: "ab ", with: ""), "eurosign.circle")]

        var xPos: CGFloat = 60
        for (value, icon) in specs {
            let specRect = CGRect(x: xPos, y: specY, width: 300, height: 70)
            drawSpecBadge(ctx: ctx, rect: specRect, icon: icon, text: value)
            xPos += 320
        }
    }

    private static func drawSpotInfo(ctx: UIGraphicsImageRendererContext, record: SpotRecord, yStart: CGFloat) {
        let specY = yStart + 120
        let dateY = specY + 100

        let dateStr = "📅 \(record.formattedDate)"
        (dateStr as NSString).draw(at: CGPoint(x: 60, y: dateY),
                                    withAttributes: [
                                        .font: UIFont.systemFont(ofSize: 22),
                                        .foregroundColor: UIColor.gray
                                    ])

        if let loc = record.locationName {
            let locStr = "📍 \(loc)"
            (locStr as NSString).draw(at: CGPoint(x: 60, y: dateY + 35),
                                       withAttributes: [
                                        .font: UIFont.systemFont(ofSize: 22),
                                        .foregroundColor: UIColor.gray
                                       ])
        }
    }

    private static func drawRarityBadge(ctx: UIGraphicsImageRendererContext, car: Car) {
        let badgeRect = CGRect(x: cardWidth - 280, y: 180, width: 220, height: 60)
        let path = UIBezierPath(roundedRect: badgeRect, cornerRadius: 30)

        UIColor(car.rarityColor).withAlphaComponent(0.3).setFill()
        path.fill()

        UIColor(car.rarityColor).setStroke()
        path.lineWidth = 2
        path.stroke()

        let rarityText = car.rarityLabel.uppercased()
        let rarityAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor(car.rarityColor)
        ]
        let size = (rarityText as NSString).size(withAttributes: rarityAttributes)
        (rarityText as NSString).draw(
            at: CGPoint(x: badgeRect.midX - size.width/2,
                       y: badgeRect.midY - size.height/2),
            withAttributes: rarityAttributes)
    }

    private static func drawPointsBlock(ctx: UIGraphicsImageRendererContext,
                                         car: Car, points: Int, yPos: CGFloat) {
        let pointsAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.monospacedDigitSystemFont(ofSize: 80, weight: .heavy),
            .foregroundColor: UIColor(hex: "#E8C547")
        ]
        let pointsStr = "+\(car.points)"
        (pointsStr as NSString).draw(at: CGPoint(x: cardWidth - 280, y: yPos),
                                      withAttributes: pointsAttributes)

        ("PUNKTE" as NSString).draw(at: CGPoint(x: cardWidth - 280, y: yPos + 85),
                                     withAttributes: [
                                        .font: UIFont.systemFont(ofSize: 22, weight: .medium),
                                        .foregroundColor: UIColor.gray
                                     ])

        if points > 0 {
            let totalStr = "Gesamt: \(points) Pkt"
            (totalStr as NSString).draw(at: CGPoint(x: 60, y: yPos + 30),
                                         withAttributes: [
                                            .font: UIFont.systemFont(ofSize: 32, weight: .bold),
                                            .foregroundColor: UIColor.white
                                         ])
        }
    }

    private static func drawUserInfo(ctx: UIGraphicsImageRendererContext,
                                      userName: String, rank: Int?, yPos: CGFloat) {
        let userStr: String
        if let rank = rank {
            userStr = "#\(rank) \(userName)"
        } else {
            userStr = userName
        }

        (userStr as NSString).draw(at: CGPoint(x: 60, y: yPos),
                                    withAttributes: [
                                        .font: UIFont.systemFont(ofSize: 26, weight: .semibold),
                                        .foregroundColor: UIColor(hex: "#E8C547")
                                    ])
    }

    private static func drawFooter(ctx: UIGraphicsImageRendererContext) {
        let footerAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 28, weight: .black),
            .foregroundColor: UIColor.white.withAlphaComponent(0.3)
        ]
        let footerText = "🏎️ AutoSpotter"
        let footerSize = (footerText as NSString).size(withAttributes: footerAttributes)
        (footerText as NSString).draw(
            at: CGPoint(x: cardWidth/2 - footerSize.width/2, y: cardHeight - 80),
            withAttributes: footerAttributes)

        let lineY = cardHeight - 60
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 60, y: lineY))
        linePath.addLine(to: CGPoint(x: cardWidth - 60, y: lineY))
        UIColor.white.withAlphaComponent(0.1).setStroke()
        linePath.lineWidth = 1
        linePath.stroke()
    }

    private static func drawSpecBadge(ctx: UIGraphicsImageRendererContext,
                                       rect: CGRect, icon: String, text: String) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 14)
        UIColor.white.withAlphaComponent(0.05).setFill()
        path.fill()

        if let sfSymbol = UIImage(systemName: icon)?.withTintColor(
            UIColor(hex: "#E8C547"), renderingMode: .alwaysOriginal) {
            sfSymbol.draw(in: CGRect(x: rect.minX + 12, y: rect.midY - 12,
                                     width: 24, height: 24))
        }

        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.monospacedDigitSystemFont(ofSize: 20, weight: .medium),
            .foregroundColor: UIColor.white
        ]
        (text as NSString).draw(at: CGPoint(x: rect.minX + 46, y: rect.midY - 12),
                                withAttributes: textAttributes)
    }
}

// MARK: - UIColor Hex Helper

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

// MARK: - SwiftUI Share Sheet Helper

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Share Button in Detail Views

struct ShareButton: View {
    let car: Car
    let record: SpotRecord?
    let photoIndex: Int?

    @ObservedObject var spotService = SpotService.shared
    @ObservedObject var leaderboardService = LeaderboardService.shared
    @State private var showShare = false
    @State private var shareImage: UIImage?

    var body: some View {
        Button(action: generateAndShare) {
            Label("Teilen", systemImage: "square.and.arrow.up")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color(hex: "#E8C547"))
                .cornerRadius(10)
        }
        .sheet(isPresented: $showShare) {
            if let image = shareImage {
                ShareSheet(items: [image])
            }
        }
    }

    private func generateAndShare() {
        var photo: UIImage?
        if let idx = photoIndex {
            let photos = PhotoService.shared.loadPhotos(forCarId: car.id)
            if idx < photos.count {
                photo = photos[idx]
            }
        }

        shareImage = ShareCardRenderer.render(
            car: car,
            record: record,
            photo: photo,
            userName: leaderboardService.myName,
            points: spotService.totalPoints,
            rank: leaderboardService.myRank(points: spotService.totalPoints)
        )
        showShare = true
    }
}
