import Foundation
import SwiftUI

struct Car: Identifiable, Codable {
    let id: String
    let brand: String
    let modelFamily: String
    let model: String
    let generation: String
    let year: Int
    let category: String
    let rarityLevel: Int
    let hp: Int
    let topSpeed: Int
    let price: String
    let description: String
    let emoji: String

    var brandColor: Color {
        switch brand.lowercased() {
        case "ferrari", "alfa romeo": return .red
        case "lamborghini": return .yellow
        case "bmw": return Color(hex: "#1C69D4")
        case "mercedes-benz": return Color(hex: "#9E9E9E")
        case "porsche": return Color(hex: "#B8942A")
        case "audi": return Color(hex: "#BB0A30")
        case "bugatti": return Color(hex: "#00247D")
        case "mclaren": return .orange
        case "aston martin": return Color(hex: "#006644")
        case "koenigsegg": return Color(hex: "#1A1A1A")
        case "pagani": return Color(hex: "#C5A028")
        case "rimac": return Color(hex: "#003087")
        case "maserati": return Color(hex: "#00529F")
        case "nissan": return Color(hex: "#C3002F")
        case "honda": return Color(hex: "#CC0000")
        case "toyota": return Color(hex: "#EB0A1E")
        case "ford": return Color(hex: "#003476")
        case "chevrolet": return Color(hex: "#D4AF37")
        case "dodge": return Color(hex: "#CC0000")
        case "subaru": return Color(hex: "#003399")
        case "hennessey": return Color(hex: "#8B0000")
        case "ssc": return Color(hex: "#1A1A1A")
        case "czinger": return Color(hex: "#2D2D2D")
        case "gordon murray": return Color(hex: "#006B3C")
        case "de tomaso": return Color(hex: "#003580")
        case "bentley": return Color(hex: "#4A4A4A")
        case "rolls-royce": return Color(hex: "#6B0F1A")
        case "jaguar": return Color(hex: "#1D5C1D")
        case "land rover": return Color(hex: "#005A2B")
        case "tesla": return Color(hex: "#CC0000")
        case "vw": return Color(hex: "#001E6C")
        case "renault": return Color(hex: "#FFD700")
        case "peugeot": return Color(hex: "#002D72")
        case "lancia": return Color(hex: "#003580")
        case "mitsubishi": return Color(hex: "#CC0000")
        case "mazda": return Color(hex: "#9B1B30")
        case "hyundai": return Color(hex: "#002C5F")
        case "kia": return Color(hex: "#05141F")
        case "lotus": return Color(hex: "#B5CC18")
        case "lexus": return Color(hex: "#1B1B1B")
        default: return Color(hex: "#2C2C2E")
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
        case 1: return "Haeufig"
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

extension Color {
    static let silver = Color(red: 0.75, green: 0.75, blue: 0.75)
}
