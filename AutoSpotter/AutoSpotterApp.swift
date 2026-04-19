import SwiftUI

@main
struct AutoSpotterApp: App {
<<<<<<< HEAD
    @StateObject private var spotService = SpotService.shared
=======
    @StateObject private var spotService = SpotService()
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(spotService)
                .preferredColorScheme(.dark)
        }
    }
}
