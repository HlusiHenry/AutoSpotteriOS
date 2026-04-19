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
                    Label("Sammlung", systemImage: "square.grid.2x2.fill")
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
        }
        .tint(Color(hex: "#E8C547"))
    }
}
