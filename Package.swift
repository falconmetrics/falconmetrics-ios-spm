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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.4.1/FalconMetricsSDK.xcframework.zip",
            checksum: "3e390fa170d0261fd0838c1834587eb5361cbed74b1cbdebd1f7f11d5b4969b9"
        )
    ]
)
