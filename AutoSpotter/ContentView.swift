import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            EntdeckenView()
                .tabItem {
                    Label("Entdecken", systemImage: "magnifyingglass")
                }
            SammlungView()
                .tabItem {
                    Label("Sammlung", systemImage: "star.fill")
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
        }
        .accentColor(Color(hex: "#E8C547"))
    }
}
