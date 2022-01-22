// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Skywalker",
    platforms: [.iOS(.v14)],
    products: [
        // MARK: - 纯Swift库
        .library(
            name: "Skywalker",
            targets: ["Skywalker"]),
        // MARK: - 纯Objective-C库
        .library(
            name: "SkywalkerOC",
            targets: ["SkywalkerOC"]),
    ],
                      
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // MARK: - 纯Swift目标
        .target(
            name: "Skywalker",
            dependencies: []),
        
        // MARK: - 纯Objective-C目标
        .target(
            name: "SkywalkerOC",
            dependencies: [],
            path: "Sources/SkywalkerOC",
            publicHeadersPath: ""),
        
        .testTarget(
            name: "SkywalkerTests",
            dependencies: ["Skywalker"]),
    ]
)
