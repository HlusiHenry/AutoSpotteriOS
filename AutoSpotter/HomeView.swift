import SwiftUI

struct HomeView: View {
    @EnvironmentObject var spotService: SpotService

    var recentSpotted: [Car] {
        allCars.filter { spotService.isSpotted($0.id) }.suffix(5).reversed()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Punkte Karte
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: spotService.spottedIds.count,
                        total: allCars.count
                    )

                    // Zuletzt gespottet
                    if recentSpotted.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "car.2")
                                .font(.system(size: 50))
                                .foregroundColor(.gray)
                            Text("Noch keine Autos gespottet.")
                                .foregroundColor(.gray)
                            Text("Geh zum Entdecken-Tab!")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        .padding(.top, 40)
                    } else {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Zuletzt gespottet")
                                .font(.headline)
                                .padding(.horizontal)
                            ForEach(recentSpotted) { car in
                                NavigationLink(destination: DetailView(car: car)) {
                                    CarRow(car: car, isSpotted: true)
                                }
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .background(Color(hex: "#121212"))
            .navigationTitle("AutoSpotter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
