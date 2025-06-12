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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/0.2.1/FalconMetricsSDK.xcframework.zip",
            checksum: "fa31a0d5136b56eb885518941af5917806159f3b33901de3b9d4380b3289d8ec"
        )
    ]
)
