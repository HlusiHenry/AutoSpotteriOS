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
<<<<<<< HEAD
                    // Punkte Karte
=======
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: spotService.spottedIds.count,
                        total: allCars.count
                    )

<<<<<<< HEAD
                    // Zuletzt gespottet
=======
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
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
