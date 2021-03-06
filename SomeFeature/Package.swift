// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SomeFeature",
    platforms: [SupportedPlatform.iOS(SupportedPlatform.IOSVersion.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SomeFeature",
            targets: ["SomeFeature"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SomeFeature",
            dependencies: ["Other",
                           "User",
                           .product(name: "Alamofire", package: "Alamofire")],
            resources: [.copy("some.txt")]),
        .target(
            name: "Other",
            dependencies: [.product(name: "Alamofire", package: "Alamofire")]),
        .target(
            name: "User",
            dependencies: [.product(name: "Alamofire", package: "Alamofire")]),
        .testTarget(
            name: "SomeFeatureTests",
            dependencies: ["SomeFeature"]),
    ]
)
