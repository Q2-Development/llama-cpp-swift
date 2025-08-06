// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LLamaSwift",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .watchOS(.v4),
        .tvOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "LLamaSwift",
            targets: ["LLamaSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
    ],
    targets: [
        .target(
            name: "LLamaSwift",
            dependencies: [
                "LlamaFramework",
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .binaryTarget(
            name: "LlamaFramework",
            url: "https://github.com/ggml-org/llama.cpp/releases/download/b6097/llama-b6097-xcframework.zip",
            checksum: "3c2689d7e4a321217b775d4310a6b823dfe4f67d68ee5566e79bf58c7eab2ab8"
        ),
        .testTarget(
            name: "llama-cpp-swiftTests",
            dependencies: ["LLamaSwift"]
        ),
    ]
)
