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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/1.0.1/FalconMetrics.xcframework.zip",
            checksum: "4deb0e2cc99926c8b54f7811e4683f4fe795c638bd9b3b78301ac11fb32c9d12"
        )
    ]
)
