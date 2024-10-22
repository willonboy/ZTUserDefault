// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "ZTUserDefault",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ZTUserDefault",
            targets: ["ZTUserDefault"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ZTUserDefault",
            dependencies: []),
    ],
    swiftLanguageVersions: [.version("5.2")]
)
