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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.2.2/FalconMetricsSDK.xcframework.zip",
            checksum: "3933aac73b5253a4a579f855df4642a22206c9a2178ea2361d91b01bdaebbf8a"
        )
    ]
)
