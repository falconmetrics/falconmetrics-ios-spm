// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FalconMetrics",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FalconMetrics",
            targets: ["FalconMetrics"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "FalconMetrics",
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/1.1.1/FalconMetrics.xcframework.zip",
            checksum: "d8daa86d459421974d12323066787636fcc86d904ae1faa417ec42c783dde4aa"
        )
    ]
)
