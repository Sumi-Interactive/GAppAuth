// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "GAppAuth",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
    ],
    products: [
        .library(name: "GAppAuth-iOS", targets: ["GAppAuth-iOS"]),
        .library(name: "GAppAuth-macOS", targets: ["GAppAuth-macOS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/GTMAppAuth.git", from: "5.0.0"),
        .package(url: "https://github.com/openid/AppAuth-iOS.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "GAppAuth-iOS",
            dependencies: [
                "GTMAppAuth",
                .product(name: "AppAuth", package: "AppAuth-iOS"),
            ],
            path: "Sources/iOS"
        ),
        .target(
            name: "GAppAuth-macOS",
            dependencies: [
                "GTMAppAuth",
                .product(name: "AppAuth", package: "AppAuth-iOS"),
            ],
            path: "Sources/macOS"
        ),
    ]
)
