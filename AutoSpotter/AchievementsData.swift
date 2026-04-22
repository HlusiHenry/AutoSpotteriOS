import Foundation

struct Achievement: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let category: AchievementCategory

    enum AchievementCategory: String, Codable, CaseIterable {
        case ersteSchritte = "🚗 Erste Schritte"
        case punkte = "⭐ Punkte"
        case seltenheit = "💎 Seltenheit"
        case marken = "🏎️ Marken"
        case spezial = "🌟 Spezial"
    }
}

let allAchievements: [Achievement] = [

    // ERSTE SCHRITTE
    Achievement(id: "first_spot", title: "Erster Spot", description: "1 Auto gespottet", icon: "car.fill", category: .ersteSchritte),
    Achievement(id: "five_spots", title: "Auf der Straße", description: "5 Autos gespottet", icon: "car.2.fill", category: .ersteSchritte),
    Achievement(id: "twentyfive_spots", title: "Autoliebhaber", description: "25 Autos gespottet", icon: "bolt.car.fill", category: .ersteSchritte),
    Achievement(id: "fifty_spots", title: "Kenner", description: "50 Autos gespottet", icon: "star.circle.fill", category: .ersteSchritte),
    Achievement(id: "hundred_spots", title: "Legende", description: "100 Autos gespottet", icon: "crown.fill", category: .ersteSchritte),

    // PUNKTE
    Achievement(id: "points_100", title: "Einsteiger", description: "100 Punkte erreicht", icon: "1.circle.fill", category: .punkte),
    Achievement(id: "points_500", title: "Sammler", description: "500 Punkte erreicht", icon: "5.circle.fill", category: .punkte),
    Achievement(id: "points_1000", title: "Profi", description: "1.000 Punkte erreicht", icon: "chart.line.uptrend.xyaxis", category: .punkte),
    Achievement(id: "points_5000", title: "Elite", description: "5.000 Punkte erreicht", icon: "flame.fill", category: .punkte),
    Achievement(id: "points_10000", title: "Meister", description: "10.000 Punkte erreicht", icon: "trophy.fill", category: .punkte),

    // SELTENHEIT
    Achievement(id: "rarity_3", title: "Seltener Fund", description: "Ersten Seltenheit-3 gespottet", icon: "sparkle", category: .seltenheit),
    Achievement(id: "rarity_4", title: "Sehr selten", description: "Ersten Seltenheit-4 gespottet", icon: "sparkles", category: .seltenheit),
    Achievement(id: "rarity_5_first", title: "Hypercar-Jäger", description: "Ersten Hypercar (Stufe 5) gespottet", icon: "bolt.fill", category: .seltenheit),
    Achievement(id: "rarity_5_double", title: "Doppelt selten", description: "2 Hypercars gespottet", icon: "bolt.circle.fill", category: .seltenheit),

    // MARKEN
    Achievement(id: "brand_bmw", title: "BMW-Fan", description: "Alle BMW gespottet", icon: "b.circle.fill", category: .marken),
    Achievement(id: "brand_ferrari", title: "Ferrari-Fan", description: "Alle Ferrari gespottet", icon: "f.circle.fill", category: .marken),
    Achievement(id: "brand_porsche", title: "Porsche-Fan", description: "Alle Porsche gespottet", icon: "p.circle.fill", category: .marken),
    Achievement(id: "brand_any", title: "Markentreu", description: "Eine komplette Marke gespottet", icon: "checkmark.seal.fill", category: .marken),
    Achievement(id: "brand_five", title: "Vielfahrer", description: "5 verschiedene Marken komplett gespottet", icon: "flag.fill", category: .marken),

    // SPEZIAL
    Achievement(id: "five_in_one_day", title: "Fleißig", description: "5 Autos an einem Tag gespottet", icon: "calendar.badge.checkmark", category: .spezial),
    Achievement(id: "night_owl", title: "Nachtjäger", description: "Auto nach 22 Uhr gespottet", icon: "moon.fill", category: .spezial),
    Achievement(id: "early_bird", title: "Frühaufsteher", description: "Auto vor 7 Uhr gespottet", icon: "sunrise.fill", category: .spezial),
    Achievement(id: "daily_challenge", title: "Tagesherausforderung", description: "Auto des Tages gespottet", icon: "sun.max.fill", category: .spezial),
    Achievement(id: "photographer", title: "Fotograf", description: "Erstes eigenes Foto hinzugefügt", icon: "camera.fill", category: .spezial),
    Achievement(id: "complete_all", title: "Vollständig", description: "100% aller Autos gespottet", icon: "checkmark.circle.fill", category: .spezial),
]
