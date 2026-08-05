import SwiftUI
import CoreLocation

struct DetailView: View {
    let car: Car
    @EnvironmentObject var spotService: SpotService
    @ObservedObject var store = SpotStore.shared
    @State private var showCamera = false
    @State private var pendingPhoto: UIImage?
    @State private var pendingLocation: CLLocation?

    var isSpotted: Bool {
        spotService.isSpotted(car.id)
    }

    var latestRecord: SpotRecord? {
        store.latestSpot(for: car.id)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                PhotoGallery(car: car)

                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(car.brand)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(car.model)
                            .font(.largeTitle)
                            .bold()
                        HStack(spacing: 12) {
                            RarityBadge(label: car.rarityLabel, level: car.rarityLevel)
                            Text("\(car.points) Punkte")
                                .font(.subheadline)
                                .foregroundColor(Color(hex: "#E8C547"))
                                .bold()
                        }
                    }

                    Divider().background(Color.gray.opacity(0.3))

                    Text(car.description)
                        .foregroundColor(.gray)
                        .font(.body)

                    // Spot-Info (wann & wo)
                    if let record = latestRecord {
                        Divider().background(Color.gray.opacity(0.3))

                        VStack(alignment: .leading, spacing: 6) {
                            Text("📅 Gesichtet: \(record.formattedDate)")
                                .font(.caption)
                                .foregroundColor(.gray)
                            if let loc = record.locationName {
                                Text("📍 \(loc)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }

                    Divider().background(Color.gray.opacity(0.3))

                    VStack(spacing: 12) {
                        DataRow(label: "Baujahr", value: "\(car.year)")
                        DataRow(label: "Kategorie", value: car.category)
                        DataRow(label: "PS", value: "\(car.hp) PS")
                        DataRow(label: "Topspeed", value: "\(car.topSpeed) km/h")
                        DataRow(label: "Preis", value: car.price)
                    }

                    // MARK: - Action Buttons
                    VStack(spacing: 12) {
                        // Spot Button
                        Button {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.impactOccurred()
                            spotService.toggleSpot(car.id)
                        } label: {
                            HStack {
                                Image(systemName: isSpotted ? "checkmark.circle.fill" : "binoculars.fill")
                                Text(isSpotted ? "Gespottet ✓" : "Als gespottet markieren")
                                    .bold()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isSpotted ? Color.green : Color(hex: "#E8C547"))
                            .foregroundColor(isSpotted ? .white : .black)
                            .cornerRadius(14)
                        }

                        // Kamera-Button (Spot mit Foto)
                        if !isSpotted {
                            Button(action: { showCamera = true }) {
                                HStack {
                                    Image(systemName: "camera.fill")
                                    Text("Mit Kamera spotten")
                                        .bold()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                            }
                        }

                        // Share Button (nur wenn gespottet)
                        if isSpotted {
                            ShareButton(
                                car: car,
                                record: latestRecord,
                                photoIndex: latestRecord?.photoIndex
                            )
                        }
                    }
                    .padding(.top, 8)
                }
                .padding()
            }
        }
        .background(Color(hex: "#121212"))
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showCamera) {
            SpotCameraView(car: car) { image, location in
                let photoIndex = PhotoService.shared.savePhoto(image, forCarId: car.id)
                if let loc = location {
                    reverseGeocode(loc) { name in
                        spotService.markAsSpotted(
                            car.id,
                            latitude: loc.coordinate.latitude,
                            longitude: loc.coordinate.longitude,
                            locationName: name,
                            photoIndex: photoIndex
                        )
                    }
                } else {
                    spotService.markAsSpotted(car.id, photoIndex: photoIndex)
                }
                showCamera = false
            }
        }
    }

    private func reverseGeocode(_ location: CLLocation, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, _ in
            let name = placemarks?.first?.locality ?? placemarks?.first?.name
            completion(name)
        }
    }
}

// MARK: - SpotCameraView

struct SpotCameraView: View {
    let car: Car
    let onCapture: (UIImage, CLLocation?) -> Void

    @StateObject private var camera = CameraService.shared

    var body: some View {
        ZStack {
            if camera.isSessionReady {
                CameraPreviewView(session: camera.session)
                    .ignoresSafeArea()
            } else {
                Color.black.ignoresSafeArea()
            }

            VStack {
                HStack {
                    Button(action: { camera.stopSession() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                .padding(.top, 60)

                Spacer()

                VStack(spacing: 12) {
                    Text(car.emoji).font(.system(size: 40))
                    Text(car.model).font(.headline).foregroundColor(.white)
                    Text(car.brand).font(.caption).foregroundColor(Color(hex: "#E8C547"))
                    Image(systemName: "viewfinder")
                        .font(.system(size: 50))
                        .foregroundColor(.white.opacity(0.3))
                }
                .padding(24)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.bottom, 20)

                Button(action: { camera.capturePhoto() }) {
                    ZStack {
                        Circle().stroke(Color.white, lineWidth: 4).frame(width: 80, height: 80)
                        Circle().fill(Color.white).frame(width: 66, height: 66)
                    }
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            Task {
                if await camera.requestCameraPermission() {
                    camera.requestLocationPermission()
                    camera.setupSession()
                }
            }
        }
        .onChange(of: camera.lastCapturedImage) { _, newImage in
            if let img = newImage {
                onCapture(img, camera.lastLocation)
            }
        }
    }
}

// MARK: - DataRow & RarityBadge

struct DataRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack {
            Text(label).foregroundColor(.gray)
            Spacer()
            Text(value).bold()
        }
    }
}

struct RarityBadge: View {
    let label: String
    let level: Int
    var color: Color {
        switch level {
        case 1: return .green
        case 2: return .blue
        case 3: return .purple
        case 4: return .orange
        case 5: return .red
        default: return .gray
        }
    }
    var body: some View {
        Text(label)
            .font(.caption).bold()
            .padding(.horizontal, 10).padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(8)
    }
}
