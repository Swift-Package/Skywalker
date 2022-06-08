// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Skywalker",
    defaultLocalization: "zh",
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
        .target(name: "Skywalker", dependencies: ["SkywalkerOC"],
                exclude: [],
                resources: [
                    .copy("FoundationDevelop/Bundle/Projects.json")
                ],
                swiftSettings: [
                    .define("PACKAGECONFIGURATION_DEBUG", .when(platforms: nil, configuration: .debug)),
                    .define("PACKAGECONFIGURATION_RELEASE", .when(platforms: nil, configuration: .release)),
                    //.unsafeFlags(["-suppress-warnings"]),// 压制编译警告
                ]),
        
        // MARK: - 纯Objective-C目标
        .target(name: "SkywalkerOC", dependencies: [], path: "Sources/SkywalkerOC",
                exclude: [],
                resources: [],
                publicHeadersPath: "",
                cSettings: []),
                //cSettings: [.unsafeFlags(["-w"])]), // 压制所有编译警告
        
        // MARK: - 纯Swift测试目标用来测试两个库
        .testTarget(name: "SkywalkerTests", dependencies: ["Skywalker"],
                    exclude: [],
                    resources: [
                        .copy("FoundationDevelop/Bundle/WeatherbitExample.json"),
                   ],
                   swiftSettings: []),
        
        // MARK: - 纯Objective-C测试目标用来测试两个库
        .testTarget(name: "SkywalkerOCTests", dependencies: ["Skywalker", "SkywalkerOC"],
                    exclude: [],
                    resources: [],
                    cSettings: []),
    ]
)
