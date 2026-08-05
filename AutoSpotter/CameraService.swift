import AVFoundation
import Combine
import CoreLocation
import UIKit

/// Managed die Kamera-Session für Live-Aufnahmen mit GPS-Tagging
class CameraService: NSObject, ObservableObject {
    static let shared = CameraService()

    let session = AVCaptureSession()
    private let photoOutput = AVCapturePhotoOutput()
    private let locationManager = CLLocationManager()

    @Published var isSessionReady = false
    @Published var lastCapturedImage: UIImage?
    @Published var lastLocation: CLLocation?
    @Published var authorizationStatus: AVAuthorizationStatus = .notDetermined
    @Published var locationAuthStatus: CLAuthorizationStatus = .notDetermined

    // Callback wenn Foto aufgenommen wurde
    var onPhotoCaptured: ((UIImage, CLLocation?) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        locationAuthStatus = locationManager.authorizationStatus
    }

    // MARK: - Berechtigungen

    func requestCameraPermission() async -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            await MainActor.run { authorizationStatus = .authorized }
            return true
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            await MainActor.run { authorizationStatus = granted ? .authorized : .denied }
            return granted
        default:
            return false
        }
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    // MARK: - Session Setup

    func setupSession() {
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: camera) else {
            print("❌ Kamera nicht verfügbar")
            return
        }

        session.beginConfiguration()
        session.sessionPreset = .photo

        if session.canAddInput(input) { session.addInput(input) }
        if session.canAddOutput(photoOutput) { session.addOutput(photoOutput) }

        session.commitConfiguration()

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.session.startRunning()
            DispatchQueue.main.async {
                self?.isSessionReady = true
                self?.locationManager.startUpdatingLocation()
            }
        }
    }

    func stopSession() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.session.stopRunning()
            DispatchQueue.main.async {
                self?.isSessionReady = false
                self?.locationManager.stopUpdatingLocation()
            }
        }
    }

    // MARK: - Foto aufnehmen

    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .auto
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
}

// MARK: - CLLocationManagerDelegate

extension CameraService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse ||
           manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension CameraService: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        guard let data = photo.fileDataRepresentation(),
              let image = UIImage(data: data) else {
            print("❌ Foto konnte nicht verarbeitet werden")
            return
        }

        let currentLocation = lastLocation
        DispatchQueue.main.async { [weak self] in
            self?.lastCapturedImage = image
            self?.onPhotoCaptured?(image, currentLocation)
        }
    }
}
