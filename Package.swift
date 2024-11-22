// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Skywalker",
    defaultLocalization: "zh",
    platforms: [.iOS(.v13)],
    products: [
        // MARK: - 纯Swift库
        .library(name: "Skywalker", targets: ["Skywalker"]),
        // MARK: - 纯Objective-C库
        .library(name: "SkywalkerOC", targets: ["SkywalkerOC"]),
    ],
    // MARK: - 包依赖列表(外部依赖-当前Package之外的依赖)
    dependencies: [
        .package(url: "https://github.com/devxoul/Then", branch: "master"),
        .package(url: "https://github.com/ReactiveX/RxSwift", branch: "main"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", branch: "master"),// 代码格式化工具 - 在Skywalker上下文菜单中使用SwiftFormatPlugin
    ],
    // MARK: - 目标列表
    targets: [
        // MARK: - 纯Swift目标 - 依赖纯Objective-C目标以复用Objective-C代码 dependencies当前Target依赖项
        .target(name: "Skywalker", dependencies: [.target(name: "SkywalkerOC"), "Then", "RxSwift", .product(name: "RxCocoa", package: "RxSwift")], path: "Sources/Skywalker",
                exclude: [],
                resources: [
                    .copy("FoundationDevelop/Bundle/Projects.json")
                ],
                swiftSettings: [
                    .swiftLanguageMode(.v5),
                    // .unsafeFlags(["-suppress-warnings"]),// 压制所有编译警告
                    .define("PACKAGECONFIGURATION_DEBUG", .when(configuration: .debug)),
                    .define("PACKAGECONFIGURATION_RELEASE", .when(configuration: .release)),
                ]
                // linkerSettings: [.linkedFramework("CFNetwork", .when(platforms: [.iOS], configuration: nil))]
               ),
        
        // MARK: - 纯Objective-C目标
        .target(name: "SkywalkerOC", dependencies: [], path: "Sources/SkywalkerOC",
                exclude: [],
                resources: [],
                publicHeadersPath: "",
                cSettings: []),
                // cSettings: [.unsafeFlags(["-w"])]),// 压制所有编译警告
        
        // MARK: - 纯Swift测试目标用来测试两个库
        .testTarget(name: "SkywalkerTests", dependencies: ["Skywalker"],
                    exclude: [],
                    resources: [
                        .copy("Resources/Skywalker.png"),
                        .copy("FoundationDevelop/Bundle/WeatherbitExample.json"),
                   ],
                   swiftSettings: [
                    .swiftLanguageMode(.v5)
                   ]),
        
        // MARK: - 纯Objective-C测试目标用来测试两个库
        .testTarget(name: "SkywalkerOCTests", dependencies: ["Skywalker", "SkywalkerOC"],
                    exclude: [],
                    resources: [],
                    cSettings: []),
    ]
    // swiftLanguageVersions: [.version("6"), .v5]
)

// 检查Skywalker返回nil的ObjeciveC扩展添加nullable
// 控件的小块UI常用属性代码片段
// Swift枚举包含判断contains
