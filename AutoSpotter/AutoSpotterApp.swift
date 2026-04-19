import SwiftUI

@main
struct AutoSpotterApp: App {
    @StateObject private var spotService = SpotService.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(spotService)
                .preferredColorScheme(.dark)
        }
    }
}
