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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.3.0/FalconMetricsSDK.xcframework.zip",
            checksum: "0e264b04994dfc294fcfe1aeadf9e0a000548da810db089fdd24ae8f301b3024"
        )
    ]
)
