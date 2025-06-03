// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BookSpineReader",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BookSpineReader",
            targets: ["BookSpineReader"]
        )
    ],
    targets: [
        .target(
            name: "BookSpineReader"
        ),
        .testTarget(
            name: "BookSpineReaderTests",
            dependencies: ["BookSpineReader"]
        )
    ]
)
