import Foundation

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

    var rarityColor: String {
        switch rarityLevel {
        case 1: return "green"
        case 2: return "blue"
        case 3: return "purple"
        case 4: return "orange"
        case 5: return "red"
        default: return "gray"
        }
    }
}
