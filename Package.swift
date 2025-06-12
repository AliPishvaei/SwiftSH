// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftSH",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftSH",
            targets: ["SwiftSH"]),
    ],
    dependencies: [],
    targets: [
        .systemLibrary(
            name: "libssh2",
            pkgConfig: "libssh2",
            providers: [
                .brew(["libssh2"]),
                .apt(["libssh2-1-dev"]),
            ]
        ),
        .target(
            name: "SwiftSH",
            dependencies: ["libssh2"],
            path: "SwiftSH"
        ),
        .testTarget(
            name: "SwiftSHTests",
            dependencies: ["SwiftSH"],
            path: "SwiftSHTests"
        ),
    ]
)