import SwiftUI

struct HomeView: View {
    @EnvironmentObject var spotService: SpotService
    
    // Wir greifen auf allCars aus CarsData.swift zu
    var recentSpotted: [Car] {
        allCars.filter { spotService.isSpotted($0.id) }.suffix(5).reversed()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Die neue PointsCard
                    PointsCard(
                        points: spotService.totalPoints,
                        spotted: spotService.spottedIds.count,
                        total: allCars.count
                    )
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Deine letzten Funde")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            if !recentSpotted.isEmpty {
                                NavigationLink(destination: SammlungView()) {
                                    Text("Alle sehen")
                                        .font(.footnote)
                                        .foregroundColor(Color(hex: "#E8C547"))
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        if recentSpotted.isEmpty {
                            VStack(spacing: 15) {
                                Image(systemName: "binoculars.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.gray.opacity(0.3))
                                    .padding(.top, 20)
                                
                                Text("Noch keine Autos gesammelt")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text("Geh auf die Jagd im Entdecken-Tab!")
                                    .font(.subheadline)
                                    .foregroundColor(.gray.opacity(0.8))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 40)
                            .background(Color.white.opacity(0.03))
                            .cornerRadius(20)
                            .padding(.horizontal)
                        } else {
                            VStack(spacing: 12) {
                                ForEach(recentSpotted) { car in
                                    NavigationLink(destination: DetailView(car: car)) {
                                        CarRow(car: car, isSpotted: true)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Ein kleiner Motivations-Banner
                    VStack(spacing: 8) {
                        Text("💡 Profi-Tipp")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#E8C547"))
                        
                        Text("Seltene Hypercars geben bis zu 250 Punkte!")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.03))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .padding(.top)
            }
            .background(Color(hex: "#0F0F0F").ignoresSafeArea())
            .navigationTitle("AutoSpotter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
