import SwiftUI

struct SammlungView: View {
    @EnvironmentObject var spotService: SpotService

    var spottedCars: [Car] {
        allCars.filter { spotService.isSpotted($0.id) }
    }

    var body: some View {
        NavigationView {
            Group {
                if spottedCars.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "tray")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Noch nichts in der Sammlung.")
                            .foregroundColor(.gray)
                    }
                } else {
                    List(spottedCars) { car in
                        NavigationLink(destination: DetailView(car: car)) {
                            CarRow(car: car, isSpotted: true)
                        }
                        .listRowBackground(Color(hex: "#1E1E1E"))
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .background(Color(hex: "#121212"))
            .navigationTitle("Sammlung")
        }
    }
}
