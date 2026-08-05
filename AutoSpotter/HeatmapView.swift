import SwiftUI
import MapKit

/// Heatmap / Karten-Ansicht aller Spots
struct HeatmapView: View {
    @ObservedObject var store = SpotStore.shared
    @EnvironmentObject var spotService: SpotService

    @State private var position: MapCameraPosition = .automatic
    @State private var selectedSpot: SpotRecord?
    @State private var selectedCar: Car?
    @State private var showDetail = false

    var spotsWithLocation: [SpotRecord] {
        store.records.filter { $0.latitude != nil && $0.longitude != nil }
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                if spotsWithLocation.isEmpty {
                    emptyView
                } else {
                    mapView
                }
            }
            .navigationTitle("Spot-Karte")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showDetail) {
                if let car = selectedCar {
                    SpotDetailSheet(car: car, record: selectedSpot)
                }
            }
        }
    }

    private var emptyView: some View {
        VStack(spacing: 20) {
            Image(systemName: "map")
                .font(.system(size: 60))
                .foregroundColor(.gray.opacity(0.3))

            Text("Noch keine Spots mit Standort")
                .font(.headline)
                .foregroundColor(.white)

            Text("Aktiviere GPS beim nächsten Foto\num deine Funde auf der Karte zu sehen.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#0F0F0F"))
    }

    private var mapView: some View {
        Map(position: $position) {
            ForEach(spotsWithLocation) { spot in
                if let car = allCars.first(where: { $0.id == spot.id }) {
                    Annotation(
                        car.emoji,
                        coordinate: spot.coordinate!,
                        anchor: .center
                    ) {
                        // Annotation Content
                    }
                }
            }
        }
        .mapStyle(.standard)
        .onAppear {
            // Zentriere auf den neuesten Spot
            if let latest = spotsWithLocation.last {
                position = .camera(MapCamera(
                    centerCoordinate: latest.coordinate!,
                    distance: 5000
                ))
            }
        }
    }
}

// MARK: - Spot Detail Sheet (von der Karte)

struct SpotDetailSheet: View {
    let car: Car
    let record: SpotRecord?

    @Environment(\.dismiss) var dismiss
    let photoService = PhotoService.shared

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Auto Info
                    HStack(spacing: 12) {
                        Text(car.emoji)
                            .font(.system(size: 50))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(car.model)
                                .font(.title3.bold())
                                .foregroundColor(.white)
                            Text("\(car.brand) · \(car.year)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack(spacing: 4) {
                                ForEach(0..<car.rarityLevel, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .font(.caption2)
                                        .foregroundColor(car.rarityColor)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(14)

                    // Spot Info
                    if let record = record {
                        VStack(alignment: .leading, spacing: 8) {
                            InfoRow(icon: "calendar", label: "Gesichtet am",
                                    value: record.formattedDate)
                            if let name = record.locationName {
                                InfoRow(icon: "mappin.and.ellipse", label: "Ort",
                                        value: name)
                            }
                            if let lat = record.latitude {
                                InfoRow(icon: "location.fill", label: "Koordinaten",
                                        value: String(format: "%.4f, %.4f", lat, record.longitude ?? 0))
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(14)
                    }

                    // Foto falls vorhanden
                    if let record = record, let idx = record.photoIndex {
                        let photos = photoService.loadPhotos(forCarId: car.id)
                        if idx < photos.count {
                            Image(uiImage: photos[idx])
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
            .background(Color(hex: "#0F0F0F"))
            .navigationTitle("Spot-Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fertig") { dismiss() }
                }
            }
        }
    }
}

struct InfoRow: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .frame(width: 20)
                .foregroundColor(Color(hex: "#E8C547"))
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}
