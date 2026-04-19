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
<<<<<<< HEAD
                    Label("Sammlung", systemImage: "square.grid.2x2.fill")
=======
                    Label("Sammlung", systemImage: "star.fill")
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
        }
<<<<<<< HEAD
        .tint(Color(hex: "#E8C547"))
=======
        .accentColor(Color(hex: "#E8C547"))
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
    }
}
