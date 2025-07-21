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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.4.0/FalconMetricsSDK.xcframework.zip",
            checksum: "6c6ae6e76a129b23d78699833948f9ccc0a77168631f9c62df0290bb5b85a559"
        )
    ]
)
