import SwiftUI

struct EntdeckenView: View {
    @EnvironmentObject var spotService: SpotService
    @State private var searchText = ""

    var groupedCars: [String: [Car]] {
        let filtered = allCars.filter {
            searchText.isEmpty ? true : ($0.brand + " " + $0.model).localizedCaseInsensitiveContains(searchText)
        }
        return Dictionary(grouping: filtered, by: { $0.brand })
    }

    var sortedBrands: [String] {
        groupedCars.keys.sorted()
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(sortedBrands, id: \.self) { brand in
                    Section(header: BrandHeader(brand: brand)) {
                        ForEach(groupedCars[brand] ?? []) { car in
                            NavigationLink(destination: DetailView(car: car)) {
                                CarRow(car: car, isSpotted: spotService.isSpotted(car.id))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .searchable(text: $searchText, prompt: "Marke oder Modell suchen...")
            .navigationTitle("Entdecken")
            .background(Color(hex: "#0F0F0F"))
        }
    }
}

// ─── BrandHeader ──────────────────────────────────────────────────────────────
struct BrandHeader: View {
    let brand: String

    var body: some View {
        HStack(spacing: 10) {
            if UIImage(named: brandLogoName(brand)) != nil {
                Image(brandLogoName(brand))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding(4)
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(8)
            }

            Text(brand)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#E8C547"))
        }
        .padding(.vertical, 8)
    }
}
