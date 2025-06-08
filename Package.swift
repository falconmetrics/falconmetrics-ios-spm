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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.1.4/FalconMetricsSDK.xcframework.zip",
            checksum: "9a045564ec9f50259db77ff28f33d3edb5ba796f42312817dec2803c84537eb6"
        )
    ]
)
