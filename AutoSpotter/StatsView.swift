import SwiftUI

struct StatsView: View {
    @EnvironmentObject var spotService: SpotService
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: spotService.spottedIds.count,
                        total: allCars.count
                    )
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Deine Sammler-Erfolge")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Text("Statistiken und Abzeichen kommen in einem der nächsten Updates!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.03))
                            .cornerRadius(15)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .background(Color(hex: "#0F0F0F").ignoresSafeArea())
            .navigationTitle("Statistiken")
        }
    }
}
