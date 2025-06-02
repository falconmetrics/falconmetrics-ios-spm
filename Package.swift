// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FalconMetrics",
    platforms: [
        .iOS(.v16)
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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.1.3/FalconMetricsSDK.xcframework.zip",
            checksum: "9eaf24ff88944bdcfa51ded7c0fc04e1dea3610e0b1a22d65e871217dcb3089c"
        )
    ]
)
