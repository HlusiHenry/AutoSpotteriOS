import Foundation
import SwiftUI

struct Car: Identifiable, Codable {
    let id: String
    let brand: String
    let model: String
    let year: Int
    let category: String
    let rarityLevel: Int
    let hp: Int
    let topSpeed: Int
    let price: String
    let description: String
    let emoji: String
    
    // Markenfarben für den "Kombiniert"-Look (Option 6 in der Projektbeschreibung)
    var brandColor: Color {
        switch brand.lowercased() {
        case "ferrari", "alfa romeo": return .red
        case "lamborghini": return .yellow
        case "bmw": return .blue
        case "mercedes-benz": return .gray
        case "porsche": return Color(hex: "#B8942A") // Gold/Bronze
        case "audi": return .silver
        case "bugatti": return .blue
        case "mclaren": return .orange
        case "aston martin": return Color(hex: "#006644") // British Racing Green
        default: return Color(hex: "#2C2C2E") // Standard Dunkelgrau
        }
    }

    var points: Int {
        switch rarityLevel {
        case 1: return 10
        case 2: return 25
        case 3: return 50
        case 4: return 100
        case 5: return 250
        default: return 0
        }
    }

    var rarityLabel: String {
        switch rarityLevel {
        case 1: return "Häufig"
        case 2: return "Gelegentlich"
        case 3: return "Selten"
        case 4: return "Sehr selten"
        case 5: return "Extrem selten"
        default: return "Unbekannt"
        }
    }

    var rarityColor: Color {
        switch rarityLevel {
        case 1: return .green
        case 2: return .blue
        case 3: return .purple
        case 4: return .orange
        case 5: return .red
        default: return .gray
        }
    }
}

// Hilfserweiterung für Standardfarben
extension Color {
    static let silver = Color(red: 0.75, green: 0.75, blue: 0.75)
}
