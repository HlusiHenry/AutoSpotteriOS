import SwiftUI
import PhotosUI

// MARK: - GalleryImage Enum

enum GalleryImage {
    case remote(String)                   // Unsplash / Wikipedia URL
    case asset(String)                    // Bundle Asset-Name
    case userPhoto(UIImage, index: Int)   // Lokales Nutzerfoto
}

// MARK: - PhotoGallery

struct PhotoGallery: View {
    let car: Car
    @EnvironmentObject var spotService: SpotService
    @ObservedObject private var unsplash = UnsplashService.shared

    @State private var userPhotos: [UIImage] = []
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showFullscreen: Bool = false
    @State private var fullscreenIndex: Int = 0

    // Reihenfolge: Remote-Fotos → Asset-Bild → Nutzerfotos
    var allImages: [GalleryImage] {
        var result: [GalleryImage] = []

        // 1. Remote-Fotos (Unsplash / Wikipedia)
        let remoteURLs = unsplash.photosByCarId[car.id] ?? []
        for urlString in remoteURLs {
            result.append(.remote(urlString))
        }

        // 2. Asset-Bild aus Bundle (nur wenn keine Remote-Fotos vorhanden)
        if remoteURLs.isEmpty {
            if UIImage(named: car.id) != nil {
                result.append(.asset(car.id))
            } else if UIImage(named: car.brand) != nil {
                result.append(.asset(car.brand))
            }
        }

        // 3. Eigene Fotos des Nutzers
        for (index, photo) in userPhotos.enumerated() {
            result.append(.userPhoto(photo, index: index))
        }

        return result
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Array(allImages.enumerated()), id: \.offset) { i, galleryImage in
                        GalleryCell(galleryImage: galleryImage, car: car)
                            .frame(width: UIScreen.main.bounds.width, height: 260)
                            .clipped()
                            .onTapGesture {
                                fullscreenIndex = i
                                showFullscreen = true
                            }
                    }

                    // + Button zum Foto hinzufügen
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        ZStack {
                            Rectangle()
                                .fill(Color.white.opacity(0.05))
                                .frame(
                                    width: allImages.isEmpty ? UIScreen.main.bounds.width : 120,
                                    height: 260
                                )
                                .cornerRadius(allImages.isEmpty ? 0 : 12)

                            VStack(spacing: 8) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 36))
                                    .foregroundColor(Color(hex: "#E8C547"))
                                Text("Foto hinzufügen")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .frame(height: 260)

            // Punkte-Indikator
            if allImages.count > 1 {
                HStack(spacing: 4) {
                    ForEach(0..<allImages.count, id: \.self) { _ in
                        Circle()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 5, height: 5)
                    }
                }
                .padding(8)
            }
        }
        .onAppear {
            loadPhotos()
            unsplash.loadPhotos(for: car)
        }
        .onChange(of: selectedItem) { _, newItem in
            guard let newItem else { return }
            Task {
                if let data = try? await newItem.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    let index = PhotoService.shared.savePhoto(image, forCarId: car.id)
                    PhotoService.shared.saveMeta(
                        forCarId: car.id,
                        index: index,
                        date: Date(),
                        locationName: nil
                    )
                    loadPhotos()
                }
                selectedItem = nil
            }
        }
        .fullScreenCover(isPresented: $showFullscreen) {
            FullscreenGalleryView(
                allImages: allImages,
                startIndex: fullscreenIndex,
                car: car,
                onDelete: { userIndex in
                    PhotoService.shared.deletePhoto(forCarId: car.id, atIndex: userIndex)
                    loadPhotos()
                }
            )
        }
    }

    private func loadPhotos() {
        userPhotos = PhotoService.shared.loadPhotos(forCarId: car.id)
    }
}

// MARK: - Einzelne Zelle

struct GalleryCell: View {
    let galleryImage: GalleryImage
    let car: Car

    var body: some View {
        switch galleryImage {
        case .remote(let urlString):
            AsyncImage(url: URL(string: urlString)) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        car.brandColor.opacity(0.2)
                        ProgressView().tint(.white)
                    }
                case .success(let image):
                    image.resizable().scaledToFill()
                default:
                    brandColorPlaceholder
                }
            }

        case .asset(let name):
            if let uiImage = UIImage(named: name) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {
                brandColorPlaceholder
            }

        case .userPhoto(let image, _):
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        }
    }

    var brandColorPlaceholder: some View {
        ZStack {
            car.brandColor
            VStack(spacing: 8) {
                Text(car.brand.prefix(1))
                    .font(.system(size: 72, weight: .bold))
                    .foregroundColor(.white.opacity(0.3))
                Text(car.brand)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.4))
            }
        }
    }
}

// MARK: - Vollbild-Galerie

struct FullscreenGalleryView: View {
    let allImages: [GalleryImage]
    let startIndex: Int
    let car: Car
    let onDelete: (Int) -> Void

    @Environment(\.dismiss) var dismiss
    @State private var currentIndex: Int
    @State private var showDeleteConfirm = false

    init(allImages: [GalleryImage], startIndex: Int, car: Car, onDelete: @escaping (Int) -> Void) {
        self.allImages = allImages
        self.startIndex = startIndex
        self.car = car
        self.onDelete = onDelete
        _currentIndex = State(initialValue: startIndex)
    }

    var currentImage: GalleryImage { allImages[currentIndex] }

    var metaText: String? {
        if case .userPhoto(_, let userIndex) = currentImage {
            return PhotoService.shared.loadMeta(forCarId: car.id, index: userIndex)
        }
        return nil
    }

    var canDelete: Bool {
        if case .userPhoto = currentImage { return true }
        return false
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            TabView(selection: $currentIndex) {
                ForEach(Array(allImages.enumerated()), id: \.offset) { i, galleryImage in
                    ZoomableImage(galleryImage: galleryImage, car: car)
                        .tag(i)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            VStack {
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                    }
                    .padding()

                    Spacer()

                    if canDelete {
                        Button { showDeleteConfirm = true } label: {
                            Image(systemName: "trash.circle.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.red)
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
                Spacer()

                VStack(spacing: 8) {
                    if let meta = metaText {
                        Text(meta)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                    }

                    HStack(spacing: 6) {
                        ForEach(0..<allImages.count, id: \.self) { i in
                            Circle()
                                .fill(i == currentIndex
                                      ? Color(hex: "#E8C547")
                                      : Color.white.opacity(0.4))
                                .frame(
                                    width: i == currentIndex ? 8 : 6,
                                    height: i == currentIndex ? 8 : 6
                                )
                                .animation(.easeInOut(duration: 0.2), value: currentIndex)
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .confirmationDialog("Foto löschen?", isPresented: $showDeleteConfirm, titleVisibility: .visible) {
            Button("Löschen", role: .destructive) {
                if case .userPhoto(_, let userIndex) = currentImage {
                    onDelete(userIndex)
                    dismiss()
                }
            }
            Button("Abbrechen", role: .cancel) {}
        }
    }
}

// MARK: - Zoombares Einzelbild

struct ZoomableImage: View {
    let galleryImage: GalleryImage
    let car: Car

    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    var body: some View {
        imageView
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in scale = lastScale * value }
                    .onEnded { _ in
                        if scale < 1.0 { withAnimation { scale = 1.0 } }
                        if scale > 5.0 { withAnimation { scale = 5.0 } }
                        lastScale = scale
                    }
            )
            .onTapGesture(count: 2) {
                withAnimation {
                    scale = scale > 1.0 ? 1.0 : 2.5
                    lastScale = scale
                }
            }
    }

    @ViewBuilder
    var imageView: some View {
        switch galleryImage {
        case .remote(let urlString):
            AsyncImage(url: URL(string: urlString)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFit()
                case .empty:
                    ZStack {
                        Color.black
                        ProgressView().tint(.white)
                    }
                default:
                    ZStack {
                        Color.black
                        Text(car.brand.prefix(1))
                            .font(.system(size: 100, weight: .bold))
                            .foregroundColor(.white.opacity(0.15))
                    }
                }
            }

        case .asset(let name):
            if let uiImage = UIImage(named: name) {
                Image(uiImage: uiImage).resizable().scaledToFit()
            } else {
                ZStack {
                    Color.black
                    Text(car.brand.prefix(1))
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(.white.opacity(0.15))
                }
            }

        case .userPhoto(let image, _):
            Image(uiImage: image).resizable().scaledToFit()
        }
    }
}
