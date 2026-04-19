import SwiftUI

struct EntdeckenView: View {
    @EnvironmentObject var spotService: SpotService
    @State private var search = ""
    @State private var selectedBrand: String? = nil
    @State private var selectedCategory: String? = nil

    var filtered: [Car] {
        allCars.filter { car in
            let matchSearch = search.isEmpty ||
                car.brand.localizedCaseInsensitiveContains(search) ||
                car.model.localizedCaseInsensitiveContains(search)
            let matchBrand = selectedBrand == nil || car.brand == selectedBrand
            let matchCategory = selectedCategory == nil || car.category == selectedCategory
            return matchSearch && matchBrand && matchCategory
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Suchfeld
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("Suche...", text: $search)
                }
                .padding(10)
                .background(Color(hex: "#1E1E1E"))
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.top, 8)

                // Filter
                HStack(spacing: 8) {
                    FilterPicker(title: "Marke", selection: $selectedBrand, options: allBrands)
                    FilterPicker(title: "Kategorie", selection: $selectedCategory, options: allCategories)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)

                // Liste
                List(filtered) { car in
                    NavigationLink(destination: DetailView(car: car)) {
                        CarRow(car: car, isSpotted: spotService.isSpotted(car.id))
                    }
                    .listRowBackground(Color(hex: "#1E1E1E"))
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .background(Color(hex: "#121212"))
            .navigationTitle("Entdecken")
        }
    }
}

struct FilterPicker: View {
    let title: String
    @Binding var selection: String?
    let options: [String]

    var body: some View {
        Menu {
            Button("Alle") { selection = nil }
            ForEach(options, id: \.self) { option in
                Button(option) { selection = option }
            }
        } label: {
            HStack {
                Text(selection ?? title)
                    .foregroundColor(selection == nil ? .gray : Color(hex: "#E8C547"))
                    .font(.subheadline)
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(hex: "#1E1E1E"))
            .cornerRadius(12)
        }
        .frame(maxWidth: .infinity)
    }
}
