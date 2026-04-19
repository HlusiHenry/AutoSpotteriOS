import SwiftUI
import Combine

class AppSettings: ObservableObject {
    @Published var accentColorHex: String {
        didSet {
            UserDefaults.standard.set(accentColorHex, forKey: "accent_color_hex")
        }
    }
    
    @Published var hapticsEnabled: Bool {
        didSet {
            UserDefaults.standard.set(hapticsEnabled, forKey: "haptics_enabled")
        }
    }
    
    init() {
        self.accentColorHex = UserDefaults.standard.string(forKey: "accent_color_hex") ?? "#E8C547"
        self.hapticsEnabled = UserDefaults.standard.object(forKey: "haptics_enabled") as? Bool ?? true
    }
    
    var accentColor: Color {
        Color(hex: accentColorHex)
    }
}
