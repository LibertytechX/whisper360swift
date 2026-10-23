// swift-tools-version:5.9
import PackageDescription

// Binary distribution of the Whisper360 iOS SDK. The source is not published.
// The checksum is that of the Whisper360.xcframework.zip attached to the matching GitHub release.
let package = Package(
    name: "Whisper360",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Whisper360", targets: ["Whisper360Binary", "Whisper360Dependencies"])
    ],
    dependencies: [
        .package(url: "https://github.com/livekit/client-sdk-swift-xcframework.git", exact: "2.18.0")
    ],
    targets: [
        .binaryTarget(
            name: "Whisper360Binary",
            url: "https://github.com/LibertytechX/whisper360swift/releases/download/0.1.1/Whisper360.xcframework.zip",
            checksum: "4044057433b167d52d96ef03d2575add9fe917a04737d55c177c17c1a89ca17f"
        ),
        .target(
            name: "Whisper360Dependencies",
            dependencies: [.product(name: "LiveKit", package: "client-sdk-swift-xcframework")],
            path: "Sources/Whisper360Dependencies"
        ),
    ]
)
