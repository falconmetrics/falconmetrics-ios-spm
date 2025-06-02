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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.1.0/FalconMetricsSDK.xcframework.zip",
            checksum: "e8e08418edb9aa91c7da9a10c070f97a8d033cb5abe8598ba46f146231149b5a"
        )
    ]
)
