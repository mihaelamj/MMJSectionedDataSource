// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MMJSectionedDataSource",
  products: [
    .library(name: "MMJSectionedDataSource", targets: ["MMJSectionedDataSource"]),
  ],
  
  dependencies: [
    .package(url: "https://github.com/mihaelamj/MMJUtils", .exact("0.2.0"))
  ],
  
  targets: [
    .target(name: "MMJSectionedDataSource", dependencies: []),
    .testTarget(name: "MMJSectionedDataSourceTests",
                dependencies: [
                  "MMJSectionedDataSource",
                  .product(name: "CollectionUtil", package: "MMJUtils")
                ]),
  ]
)



