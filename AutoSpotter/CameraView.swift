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

// MARK: - Aufgenommenes Foto: Vorschau + Speichern

struct CapturedPhotoSheet: View {
    let image: UIImage
    let location: CLLocation?
    let onSave: (UIImage, String?) -> Void
    let onRetake: () -> Void

    @State private var locationName: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding(.horizontal)

                if let loc = location {
                    VStack(spacing: 4) {
                        Text("📍 Standort erfasst")
                            .font(.caption)
                            .foregroundColor(.green)
                        Text(String(format: "%.5f, %.5f",
                                   loc.coordinate.latitude,
                                   loc.coordinate.longitude))
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }

                TextField("Ort-Name (z.B. München, Leopoldstraße)", text: $locationName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                HStack(spacing: 30) {
                    Button(action: onRetake) {
                        Label("Neu aufnehmen", systemImage: "arrow.triangle.2.circlepath")
                            .foregroundColor(.gray)
                    }

                    Button(action: {
                        onSave(image, locationName.isEmpty ? nil : locationName)
                    }) {
                        Label("Speichern", systemImage: "checkmark.circle.fill")
                            .foregroundColor(Color(hex: "#E8C547"))
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)

                Spacer()
            }
            .padding(.top)
            .background(Color(hex: "#0F0F0F").ignoresSafeArea())
            .navigationTitle("Foto gespeichert")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

