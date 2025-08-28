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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/1.0.0/FalconMetrics.xcframework.zip",
            checksum: "fb715c99874f0b7d354066d9d80987b06d0d77c9026b2e6c0b3e71104bf9f6a0"
        )
    ]
)
