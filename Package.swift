// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "Skywalker",
    defaultLocalization: "zh",
    platforms: [.iOS(.v14)],
    products: [
        // MARK: - 纯Swift库
        .library(name: "Skywalker", targets: ["Skywalker"]),
        // MARK: - 纯Objective-C库
        .library(name: "SkywalkerOC", targets: ["SkywalkerOC"]),
    ],
    // MARK: - 包依赖列表(外部依赖-当前Package之外的依赖)
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", branch: "master"),// 代码格式化工具 - 在Skywalker上下文菜单中使用SwiftFormatPlugin
        .package(url: "https://github.com/ReactiveX/RxSwift", branch: "main")
    ],
    // MARK: - 目标列表
    targets: [
        // MARK: - 纯Swift目标 - 依赖纯Objective-C目标以复用Objective-C代码 dependencies当前Target依赖项
        .target(name: "Skywalker", dependencies: [.target(name: "SkywalkerOC"), "RxSwift"], path: "Sources/Skywalker",
                exclude: [],
                resources: [
                    .copy("FoundationDevelop/Bundle/Projects.json")
                ],
                swiftSettings: [
                    .define("PACKAGECONFIGURATION_DEBUG", .when(configuration: .debug)),
                    .define("PACKAGECONFIGURATION_RELEASE", .when(configuration: .release)),
                    // .unsafeFlags(["-suppress-warnings"]),// 压制所有编译警告
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
                   swiftSettings: []),
        
        // MARK: - 纯Objective-C测试目标用来测试两个库
        .testTarget(name: "SkywalkerOCTests", dependencies: ["Skywalker", "SkywalkerOC"],
                    exclude: [],
                    resources: [],
                    cSettings: []),
    ]
)

// 检查Skywalker返回nil的ObjeciveC扩展添加nullable
// 控件的小块UI常用属性代码片段
// Swift枚举包含判断contains
