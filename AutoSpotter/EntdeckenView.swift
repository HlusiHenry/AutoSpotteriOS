import SwiftUI
import Combine
// ═══════════════════════════════════════════════════════════
// MARK: - HideService
// ═══════════════════════════════════════════════════════════

class HideService: ObservableObject {
    static let shared = HideService()
    private let key = "hidden_car_ids"

    @Published var hiddenIds: Set<String> = []

    init() { load() }

    private func load() {
        let saved = UserDefaults.standard.stringArray(forKey: key) ?? []
        hiddenIds = Set(saved)
    }

    private func save() {
        UserDefaults.standard.set(Array(hiddenIds), forKey: key)
    }

    func isHidden(_ id: String) -> Bool { hiddenIds.contains(id) }

    func hide(_ id: String) {
        hiddenIds.insert(id)
        save()
    }

    func unhide(_ id: String) {
        hiddenIds.remove(id)
        save()
    }

    func toggleHide(_ id: String) {
        if isHidden(id) { unhide(id) } else { hide(id) }
    }

    var count: Int { hiddenIds.count }
}

// ═══════════════════════════════════════════════════════════
// MARK: - EntdeckenView (Ebene 1: Marken-Liste)
// ═══════════════════════════════════════════════════════════

struct EntdeckenView: View {
    @EnvironmentObject var spotService: SpotService
    @StateObject private var hideService = HideService.shared
    @State private var searchText = ""
    @State private var showHiddenSheet = false

    var filteredBrands: [String] {
        if searchText.isEmpty {
            return allBrands
        }
        return allBrands.filter { brand in
            brand.localizedCaseInsensitiveContains(searchText) ||
            allCars.contains {
                $0.brand == brand &&
                ($0.model.localizedCaseInsensitiveContains(searchText) ||
                 $0.modelFamily.localizedCaseInsensitiveContains(searchText))
            }
        }
    }

    var hiddenCount: Int {
        allCars.filter { hideService.isHidden($0.id) }.count
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBrands, id: \.self) { brand in
                    NavigationLink(destination: ModelFamilyView(brand: brand)) {
                        BrandRow(brand: brand)
                    }
                    .listRowBackground(Color(hex: "#1C1C1E"))
                }

                if hiddenCount > 0 {
                    Section {
                        Button(action: { showHiddenSheet = true }) {
                            HStack {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(.gray)
                                Text("\(hiddenCount) ausgeblendete\(hiddenCount == 1 ? "s Auto" : " Autos")")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                        .listRowBackground(Color(hex: "#1C1C1E").opacity(0.6))
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            .background(Color(hex: "#0F0F0F"))
            .searchable(text: $searchText, prompt: "Marke oder Modell suchen...")
            .navigationTitle("Entdecken")
            .sheet(isPresented: $showHiddenSheet) {
                HiddenCarsView()
                    .environmentObject(spotService)
                    .environmentObject(hideService)
            }
        }
        .environmentObject(hideService)
    }
}

// ═══════════════════════════════════════════════════════════
// MARK: - BrandRow
// ═══════════════════════════════════════════════════════════

struct BrandRow: View {
    let brand: String
    @EnvironmentObject var spotService: SpotService
    @StateObject private var hideService = HideService.shared

    var brandCars: [Car] { allCars.filter { $0.brand == brand } }
    var spottedCount: Int { brandCars.filter { spotService.isSpotted($0.id) }.count }
    var totalVisible: Int { brandCars.filter { !hideService.isHidden($0.id) }.count }
    var families: [String] { Array(Set(brandCars.map { $0.modelFamily })).sorted() }

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(brandCars.first?.brandColor.opacity(0.25) ?? Color(hex: "#2C2C2E"))
                    .frame(width: 48, height: 48)
                if UIImage(named: brandLogoName(brand)) != nil {
                    Image(brandLogoName(brand))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                } else {
                    Text(String(brand.prefix(2)))
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(hex: "#E8C547"))
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(brand)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(families.count) Modellreihen · \(totalVisible) Fahrzeuge")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                Text("\(spottedCount)/\(brandCars.count)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#E8C547"))
                ProgressView(value: Double(spottedCount), total: Double(max(brandCars.count, 1)))
                    .progressViewStyle(LinearProgressViewStyle(tint: Color(hex: "#E8C547")))
                    .frame(width: 50)
            }
        }
        .padding(.vertical, 4)
    }
}

// ═══════════════════════════════════════════════════════════
// MARK: - Ebene 2: Modellreihen einer Marke
// ═══════════════════════════════════════════════════════════

struct ModelFamilyView: View {
    let brand: String
    @EnvironmentObject var spotService: SpotService
    @StateObject private var hideService = HideService.shared

    var families: [String] {
        Array(Set(allCars.filter { $0.brand == brand }.map { $0.modelFamily }))
            .sorted()
    }

    func cars(for family: String) -> [Car] {
        allCars.filter {
            $0.brand == brand && $0.modelFamily == family && !hideService.isHidden($0.id)
        }
        .sorted { $0.year > $1.year }
    }

    var body: some View {
        List {
            ForEach(families, id: \.self) { family in
                let familyCars = cars(for: family)
                if !familyCars.isEmpty {
                    NavigationLink(destination: GenerationListView(brand: brand, modelFamily: family)) {
                        ModelFamilyRow(family: family, cars: familyCars)
                    }
                    .listRowBackground(Color(hex: "#1C1C1E"))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .scrollContentBackground(.hidden)
        .background(Color(hex: "#0F0F0F"))
        .navigationTitle(brand)
        .navigationBarTitleDisplayMode(.large)
    }
}

// ═══════════════════════════════════════════════════════════
// MARK: - ModelFamilyRow
// ═══════════════════════════════════════════════════════════

struct ModelFamilyRow: View {
    let family: String
    let cars: [Car]
    @EnvironmentObject var spotService: SpotService

    var spottedCount: Int { cars.filter { spotService.isSpotted($0.id) }.count }
    var newestYear: Int { cars.map { $0.year }.max() ?? 0 }
    var oldestYear: Int { cars.map { $0.year }.min() ?? 0 }
    var yearRange: String {
        if newestYear == oldestYear { return "\(newestYear)" }
        return "\(oldestYear)\u{2013}\(newestYear)"
    }
    var maxRarity: Int { cars.map { $0.rarityLevel }.max() ?? 1 }

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(cars.first?.rarityColor.opacity(0.2) ?? Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                Text(cars.first?.emoji ?? "🚗")
                    .font(.title3)
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(family)
                    .font(.headline)
                    .foregroundColor(.white)
                HStack(spacing: 6) {
                    Text(yearRange)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("·")
                        .foregroundColor(.gray)
                        .font(.caption)
                    Text("\(cars.count) Variante\(cars.count == 1 ? "" : "n")")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(spottedCount)/\(cars.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(spottedCount == cars.count ? .green : Color(hex: "#E8C547"))
                HStack(spacing: 2) {
                    ForEach(1...5, id: \.self) { level in
                        Circle()
                            .fill(level <= maxRarity
                                  ? (cars.first?.rarityColor ?? .gray)
                                  : Color.gray.opacity(0.2))
                            .frame(width: 5, height: 5)
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}

// ═══════════════════════════════════════════════════════════
// MARK: - Ebene 3: Varianten / Generationen
// ═══════════════════════════════════════════════════════════

struct GenerationListView: View {
    let brand: String
    let modelFamily: String
    @EnvironmentObject var spotService: SpotService
    @StateObject private var hideService = HideService.shared
    @State private var carToHide: Car? = nil
    @State private var showHideConfirm = false
    @State private var sortByYear = true

    var cars: [Car] {
        let base = allCars.filter {
            $0.brand == brand && $0.modelFamily == modelFamily && !hideService.isHidden($0.id)
        }
        return sortByYear
            ? base.sorted { $0.year > $1.year }
            : base.sorted { $0.model < $1.model }
    }

    var hideDialogTitle: String {
        if let car = carToHide {
            return "\(car.model) ausblenden?"
        }
        return "Auto ausblenden?"
    }

    var body: some View {
        List {
            Section {
                Picker("Sortierung", selection: $sortByYear) {
                    Text("Nach Baujahr").tag(true)
                    Text("Alphabetisch").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .listRowBackground(Color.clear)
            }

            Section {
                ForEach(cars) { car in
                    NavigationLink(destination: DetailView(car: car)) {
                        CarRow(car: car, isSpotted: spotService.isSpotted(car.id))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(Color(hex: "#1C1C1E"))
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            carToHide = car
                            showHideConfirm = true
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        } label: {
                            Label("Ausblenden", systemImage: "eye.slash")
                        }
                        .tint(Color(hex: "#3A3A3C"))
                    }
                    .contextMenu {
                        Button(role: .destructive) {
                            carToHide = car
                            showHideConfirm = true
                        } label: {
                            Label("Ausblenden", systemImage: "eye.slash")
                        }

                        Button {
                            spotService.toggleSpot(car.id)
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        } label: {
                            let spotted = spotService.isSpotted(car.id)
                            Label(
                                spotted ? "Als nicht gespottet markieren" : "Als gespottet markieren",
                                systemImage: spotted ? "binoculars.fill" : "binoculars"
                            )
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .scrollContentBackground(.hidden)
        .background(Color(hex: "#0F0F0F"))
        .navigationTitle(modelFamily)
        .navigationBarTitleDisplayMode(.large)
        .confirmationDialog(
            hideDialogTitle,
            isPresented: $showHideConfirm,
            titleVisibility: .visible
        ) {
            Button("Ausblenden", role: .destructive) {
                if let car = carToHide {
                    hideService.hide(car.id)
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                }
            }
            Button("Abbrechen", role: .cancel) {}
        } message: {
            Text("Das Auto wird aus der Liste ausgeblendet. Du kannst es unter 'Ausgeblendete Autos' wieder einblenden.")
        }
    }
}



// ═══════════════════════════════════════════════════════════
// MARK: - BrandHeader
// ═══════════════════════════════════════════════════════════

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

// ═══════════════════════════════════════════════════════════
// MARK: - HiddenCarsView
// ═══════════════════════════════════════════════════════════

struct HiddenCarsView: View {
    @EnvironmentObject var spotService: SpotService
    @EnvironmentObject var hideService: HideService
    @Environment(\.dismiss) var dismiss

    var hiddenCars: [Car] {
        allCars.filter { hideService.isHidden($0.id) }
            .sorted { $0.brand < $1.brand }
    }

    var body: some View {
        NavigationView {
            Group {
                if hiddenCars.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "eye.fill")
                            .font(.system(size: 48))
                            .foregroundColor(Color(hex: "#E8C547"))
                        Text("Keine ausgeblendeten Autos")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Wische in einer Autouebersicht nach links oder halte ein Auto gedrueckt, um es auszublenden.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "#0F0F0F"))
                } else {
                    List {
                        ForEach(hiddenCars) { car in
                            HStack(spacing: 12) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(car.brandColor.opacity(0.2))
                                        .frame(width: 40, height: 40)
                                    Text(car.emoji)
                                        .font(.body)
                                }

                                VStack(alignment: .leading, spacing: 2) {
                                    Text(car.model)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text("\(car.brand) · \(car.year)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Button {
                                    hideService.unhide(car.id)
                                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                } label: {
                                    HStack(spacing: 4) {
                                        Image(systemName: "eye")
                                        Text("Einblenden")
                                    }
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hex: "#E8C547"))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(Color(hex: "#E8C547").opacity(0.15))
                                    .cornerRadius(8)
                                }
                            }
                            .listRowBackground(Color(hex: "#1C1C1E"))
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                    .background(Color(hex: "#0F0F0F"))
                }
            }
            .navigationTitle("Ausgeblendete Autos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fertig") { dismiss() }
                        .foregroundColor(Color(hex: "#E8C547"))
                }
                if !hiddenCars.isEmpty {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Alle einblenden") {
                            for car in hiddenCars {
                                hideService.unhide(car.id)
                            }
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                        }
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    }
                }
            }
        }
    }
}

