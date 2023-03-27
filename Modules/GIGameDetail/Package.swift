// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GIGameDetail",
  defaultLocalization: "en",
  platforms: [.iOS(.v16), .macOS(.v13)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "GIGameDetail",
      targets: ["GIGameDetail"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(name: "GIGame", path: "../GIGame"),
    .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image.git", from: "2.1.1"),
    .package(url: "https://github.com/NuPlay/RichText.git", from: "2.2.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "GIGameDetail",
      dependencies: [
        "GIGame",
        .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image"),
        .product(name: "RichText", package: "RichText")
      ]),
    .testTarget(
      name: "GIGameDetailTests",
      dependencies: ["GIGameDetail"]),
    
  ]
)
