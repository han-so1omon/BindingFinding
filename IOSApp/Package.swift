// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "BookSpineReaderApp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .app(name: "BookSpineReaderApp", targets: ["BookSpineReaderApp"])
    ],
    dependencies: [
        .package(path: "../")
    ],
    targets: [
        .executableTarget(
            name: "BookSpineReaderApp",
            dependencies: ["BookSpineReader"]
        )
    ]
)
