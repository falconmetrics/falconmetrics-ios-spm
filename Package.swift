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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.2.0/FalconMetricsSDK.xcframework.zip",
            checksum: "050daceadf5b790be0fc18ff75504f2bcf73a02385206584353b40ad02aaa096"
        )
    ]
)
