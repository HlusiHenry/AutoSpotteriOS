import SwiftUI
import AVFoundation
import CoreLocation

/// SwiftUI View die das Kamera-Preview anzeigt und Fotos aufnimmt
struct CameraView: View {
    @StateObject private var camera = CameraService.shared
    @Environment(\.dismiss) private var dismiss
    @State private var capturedImage: UIImage?
    @State private var showCapturedPreview = false
    @State private var permissionDenied = false

    var body: some View {
        ZStack {
            // Kamera-Preview oder schwarzer Hintergrund
            if camera.isSessionReady {
                CameraPreviewView(session: camera.session)
                    .ignoresSafeArea()
            } else if permissionDenied {
                permissionDeniedView
            } else {
                Color.black.ignoresSafeArea()
                ProgressView("Kamera startet...")
                    .foregroundColor(.white)
            }

            // Overlay UI
            VStack {
                // Top Leiste mit Schließen-Button
                HStack {
                    Button(action: {
                        camera.stopSession()
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                    }
                    .padding(.leading, 20)

                    Spacer()

                    // GPS Status
                    if let location = camera.lastLocation {
                        HStack(spacing: 4) {
                            Image(systemName: "location.fill")
                                .font(.caption)
                            Text(String(format: "%.4f, %.4f",
                                       location.coordinate.latitude,
                                       location.coordinate.longitude))
                                .font(.caption)
                        }
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .padding(.trailing, 20)
                    }
                }
                .padding(.top, 60)

                Spacer()

                // Auto-Erkennung Hinweis
                if camera.isSessionReady {
                    VStack(spacing: 8) {
                        Image(systemName: "viewfinder")
                            .font(.system(size: 40))
                            .foregroundColor(Color(hex: "#E8C547").opacity(0.5))

                        Text("Richte die Kamera auf ein Auto")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))

                        Text("Markenerkennung via KI")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#E8C547").opacity(0.6))
                    }
                    .padding(.bottom, 20)
                }

                // Auslöser-Button
                Button(action: { camera.capturePhoto() }) {
                    ZStack {
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            .frame(width: 80, height: 80)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 66, height: 66)
                    }
                }
                .padding(.bottom, 50)
                .disabled(!camera.isSessionReady)
            }
        }
        .onAppear { setupCamera() }
        .onDisappear { camera.stopSession() }
        .onChange(of: camera.lastCapturedImage) { _, newImage in
            if let image = newImage {
                capturedImage = image
                showCapturedPreview = true
            }
        }
        .sheet(isPresented: $showCapturedPreview) {
            if let image = capturedImage {
                CapturedPhotoSheet(
                    image: image,
                    location: camera.lastLocation,
                    onSave: { photo, locationName in
                        camera.onPhotoCaptured?(photo, camera.lastLocation)
                        camera.stopSession()
                        dismiss()
                    },
                    onRetake: {
                        capturedImage = nil
                        showCapturedPreview = false
                    }
                )
            }
        }
    }

    private var permissionDeniedView: some View {
        VStack(spacing: 20) {
            Image(systemName: "camera.slash.fill")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            Text("Kamera-Zugriff verweigert")
                .font(.title2.bold())
                .foregroundColor(.white)
            Text("Gehe zu Einstellungen > Datenschutz > Kamera\nund erlaube AutoSpotter den Zugriff.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#0F0F0F"))
    }

    private func setupCamera() {
        Task {
            let granted = await camera.requestCameraPermission()
            if granted {
                camera.requestLocationPermission()
                camera.setupSession()
            } else {
                await MainActor.run { permissionDenied = true }
            }
        }
    }
}

// MARK: - Kamera-Preview (UIViewRepresentable)

struct CameraPreviewView: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .black

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// MARK: - Aufgenommenes Foto: Vorschau + Auto auswählen + Speichern

struct CapturedPhotoSheet: View {
    let image: UIImage
    let location: CLLocation?
    let onSave: (UIImage, String?) -> Void
    let onRetake: () -> Void

    @State private var locationName: String = ""
    @State private var searchText: String = ""
    @State private var selectedCar: Car?
    @State private var isSaving = false
    @State private var saved = false
    @Environment(\.dismiss) private var dismiss

    var filteredCars: [Car] {
        if searchText.isEmpty { return [] }
        return allCars.filter {
            $0.model.localizedCaseInsensitiveContains(searchText) ||
            $0.brand.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .frame(maxHeight: 200)

                if let loc = location {
                    HStack(spacing: 4) {
                        Image(systemName: "location.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        Text(String(format: "%.5f, %.5f",
                                   loc.coordinate.latitude,
                                   loc.coordinate.longitude))
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }

                TextField("Ort (z.B. München, Leopoldstraße)", text: $locationName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                Divider().padding(.horizontal)

                Text("Welches Auto hast du gespottet?")
                    .font(.headline)
                    .foregroundColor(.white)

                TextField("Auto suchen...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                if !filteredCars.isEmpty {
                    List {
                        ForEach(Array(filteredCars.prefix(10))) { car in
                            Button(action: { selectedCar = car; searchText = car.model }) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(car.model).foregroundColor(.white)
                                        Text(car.brand).font(.caption).foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Text("\(car.points) Pkt")
                                        .font(.caption)
                                        .foregroundColor(Color(hex: "#E8C547"))
                                }
                            }
                            .listRowBackground(Color.white.opacity(0.05))
                        }
                    }
                    .listStyle(.plain)
                    .frame(maxHeight: 200)
                }

                Spacer()

                HStack(spacing: 30) {
                    Button(action: onRetake) {
                        Label("Neu", systemImage: "arrow.triangle.2.circlepath")
                            .foregroundColor(.gray)
                    }

                    Button(action: saveSpot) {
                        Label(saved ? "Gespeichert!" : "Einreichen",
                              systemImage: saved ? "checkmark.circle.fill" : "checkmark.circle.fill")
                            .foregroundColor(selectedCar != nil ? Color(hex: "#E8C547") : .gray)
                            .fontWeight(.bold)
                    }
                    .disabled(selectedCar == nil || isSaving)
                }
                .padding(.bottom, 30)
            }
            .padding(.top)
            .background(Color(hex: "#0F0F0F").ignoresSafeArea())
            .navigationTitle("Spotten & Speichern")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func saveSpot() {
        guard let car = selectedCar else { return }
        isSaving = true

        // Foto speichern
        let photoIndex = PhotoService.shared.savePhoto(image, forCarId: car.id)
        PhotoService.shared.saveMeta(forCarId: car.id, index: photoIndex,
                                      date: Date(), locationName: locationName.isEmpty ? nil : locationName)

        // Auto spotten
        SpotService.shared.markAsSpotted(
            car.id,
            latitude: location?.coordinate.latitude,
            longitude: location?.coordinate.longitude,
            locationName: locationName.isEmpty ? nil : locationName,
            photoIndex: photoIndex
        )

        saved = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            onSave(image, locationName.isEmpty ? nil : locationName)
        }
    }
}

