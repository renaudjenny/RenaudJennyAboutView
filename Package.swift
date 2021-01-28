// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RenaudJennyAboutView",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "RenaudJennyAboutView",
            targets: ["RenaudJennyAboutView"]),
    ],
    dependencies: [
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.2"),
    ],
    targets: [
        .target(
            name: "RenaudJennyAboutView",
            dependencies: []),
        .testTarget(
            name: "RenaudJennyAboutViewTests",
            dependencies: ["RenaudJennyAboutView", "SnapshotTesting"]),
    ]
)
