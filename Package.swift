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
            url: "https://falconmetrics-sdk.s3.eu-west-1.amazonaws.com/ios/1.1.0/FalconMetrics.xcframework.zip",
            checksum: "b8e8956be35622240120f8b286839f561245db34bd33b1fa9797ac69badc30fa"
        )
    ]
)
