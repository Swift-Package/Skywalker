// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Skywalker",
    platforms: [.iOS(.v14)],
    products: [
        // MARK: - 纯Swift库
        .library(name: "Skywalker",targets: ["Skywalker"]),
        // MARK: - 纯Objective-C库
        .library(name: "SkywalkerOC", targets: ["SkywalkerOC"]),
    ],
    dependencies: [],
    targets: [
        // MARK: - 纯Swift目标 - 依赖纯Objective-C目标以复用Objective-C代码
        .target(name: "Skywalker", dependencies: ["SkywalkerOC"]),
        
        // MARK: - 纯Objective-C目标
        .target(name: "SkywalkerOC", dependencies: [], path: "Sources/SkywalkerOC", publicHeadersPath: ""),
        
        // MARK: - 纯Swift测试目标用来测试两个库
        .testTarget(name: "SkywalkerTests", dependencies: ["Skywalker"]),
        
        // MARK: - 纯Objective-C测试目标用来测试两个库
        .testTarget(name: "SkywalkerOCTests", dependencies: ["Skywalker", "SkywalkerOC"]),
    ]
)
