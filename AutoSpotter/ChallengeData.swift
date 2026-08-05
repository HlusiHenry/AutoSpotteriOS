import Foundation

/// Modell für tägliche/wöchentliche Challenges
struct Challenge: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let icon: String          // SF Symbol
    let type: ChallengeType
    let target: Int
    let reward: Int          // Bonuspunkte
    let timeframe: Timeframe

    enum ChallengeType: String, Codable {
        case spotCount       // "Spotte X Autos"
        case brandSpecific   // "Spotte einen Ferrari"
        case rarityLevel     // "Spotte X Autos mit Seltenheit ≥ Y"
        case categoryTarget  // "Spotte ein Hypercar"
        case photoProof      // "Mache X Fotos von Spots"
        case streakDays      // "Halte eine X-Tage Streak"
    }

    enum Timeframe: String, Codable {
        case daily
        case weekly
    }
}

/// Pool aller möglichen Challenges
let challengePool: [Challenge] = [
    // DAILIES
    Challenge(id: "d_3spots", title: "Drei auf einen Streich",
              description: "Spotte heute 3 Autos", icon: "3.circle.fill",
              type: .spotCount, target: 3, reward: 30, timeframe: .daily),

    Challenge(id: "d_rarity3", title: "Jäger des Seltenen",
              description: "Spotte ein Auto mit Seltenheit 3+", icon: "sparkles",
              type: .rarityLevel, target: 3, reward: 40, timeframe: .daily),

    Challenge(id: "d_ferrari", title: "Cavallino Rampante",
              description: "Spotte einen Ferrari", icon: "flame.fill",
              type: .brandSpecific, target: 1, reward: 50, timeframe: .daily),

    Challenge(id: "d_5spots", title: "Spotter-Fieber",
              description: "Spotte heute 5 Autos", icon: "5.circle.fill",
              type: .spotCount, target: 5, reward: 60, timeframe: .daily),

    Challenge(id: "d_photo", title: "Paparazzi",
              description: "Mache ein Foto von deinem Spot", icon: "camera.fill",
              type: .photoProof, target: 1, reward: 25, timeframe: .daily),

    Challenge(id: "d_porsche", title: "Stuttgarter Edelmetall",
              description: "Spotte einen Porsche", icon: "shield.fill",
              type: .brandSpecific, target: 1, reward: 40, timeframe: .daily),

    Challenge(id: "d_hypercar", title: "Hypercar-Jäger",
              description: "Spotte ein Hypercar", icon: "bolt.fill",
              type: .categoryTarget, target: 1, reward: 100, timeframe: .daily),

    // WEEKLIES
    Challenge(id: "w_20spots", title: "Marathon-Mann",
              description: "Spotte diese Woche 20 Autos", icon: "figure.run",
              type: .spotCount, target: 20, reward: 200, timeframe: .weekly),

    Challenge(id: "w_rarity5", title: "Einhorn-Sichtung",
              description: "Spotte ein Auto mit Seltenheit 5", icon: "star.circle.fill",
              type: .rarityLevel, target: 5, reward: 300, timeframe: .weekly),

    Challenge(id: "w_streak7", title: "Glückssträhne",
              description: "Halte eine 7-Tage Streak", icon: "flame.circle.fill",
              type: .streakDays, target: 7, reward: 250, timeframe: .weekly),

    Challenge(id: "w_bmw", title: "Bayrische Motorenwerke",
              description: "Spotte 5 BMWs", icon: "car.2.fill",
              type: .brandSpecific, target: 5, reward: 150, timeframe: .weekly),

    Challenge(id: "w_10photos", title: "Foto-Profi",
              description: "Mache 10 Fotos von Spots", icon: "camera.macro",
              type: .photoProof, target: 10, reward: 150, timeframe: .weekly),
]
