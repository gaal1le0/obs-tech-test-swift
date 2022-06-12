// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppUtils",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppUtils",
            targets: ["AppUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/chrisdhaan/CDMarkdownKit.git", .upToNextMajor(from: "2.1.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppUtils",
            dependencies: [
                .byNameItem(name: "CDMarkdownKit", condition: nil)
            ],
            resources: [
                .process("Resources/Colors.xcassets"),
                .process("Resources/Media.xcassets"),
            ]
        ),
        .testTarget(
            name: "AppUtilsTests",
            dependencies: ["AppUtils"]),
    ]
)
