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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.1.1/FalconMetricsSDK.xcframework.zip",
            checksum: "631541f65f5499ef1e224934b4496caa0317dee8303a20bef2ff2baa65c105f6"
        )
    ]
)
