// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "google-mlkit-face-detection",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "google-mlkit-face-detection",
            targets: ["google_mlkit_face_detection"])
    ],
    dependencies: [
        // Vendored fork of google-mlkit-swiftpm 9.0.2 with a widened
        // GTMSessionFetcher range so Firebase iOS SDK 13+ (GTMSessionFetcher 4.x)
        // can resolve alongside ML Kit. The path is inside this package's root,
        // so it keeps working when Flutter symlinks the plugin into the
        // generated Swift package and resolves paths lexically.
        .package(path: "google-mlkit-swiftpm")
    ],
    targets: [
        .target(
            name: "google_mlkit_face_detection",
            dependencies: [
                .product(name: "MLKitFaceDetection", package: "google-mlkit-swiftpm")
            ],
            path: "Sources/google_mlkit_face_detection"
        )
    ]
)
