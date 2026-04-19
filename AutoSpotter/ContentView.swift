import SwiftUI

struct ContentView: View {
    @StateObject var settings = AppSettings()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            EntdeckenView()
                .tabItem { Label("Entdecken", systemImage: "magnifyingglass") }
            
            SammlungView()
                .tabItem { Label("Sammlung", systemImage: "star.fill") }
            
            StatsView()
                .tabItem { Label("Stats", systemImage: "chart.bar.fill") }
            
            SettingsView()
                .tabItem { Label("Einstellungen", systemImage: "gearshape.fill") }
        }
        .accentColor(settings.accentColor)
        .environmentObject(settings)
    }
}
