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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.1.2/FalconMetricsSDK.xcframework.zip",
            checksum: "beb1fcc8abb827074f454b3513f9925c3a8519cbe1de5a8a1e1fb4a2b0579cad"
        )
    ]
)
