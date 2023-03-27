// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GICommon",
  defaultLocalization: "en",
  platforms: [.iOS(.v16), .macOS(.v13)],
  products: [
    .library(
      name: "GICommon",
      targets: ["GICommon"]),
  ],
  dependencies: [
    .package(url: "https://github.com/realm/realm-cocoa.git", .upToNextMajor(from: "5.0.0"))
  ],
  targets: [
    .target(
      name: "GICommon",
      dependencies: [
        .product(name: "RealmSwift", package: "realm-cocoa")
      ],
      resources: [
        .process("Resources")
      ]
    ),
    .testTarget(
      name: "GICommonTests",
      dependencies: ["GICommon"]),
  ]
)
