// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Based on https://github.com/aws/amazon-chime-sdk-ios-spm/blob/main/Package.swift

// Current stable version of the Amazon Chime SDK for iOS
let SDKMediaVersion = "0.18.3"
let SDKMachineLearningVersion = "0.2.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKMediaChecksum = "03751799d43c5325524f9056057530f25da4ccdc6d712acb24f556471f0e939a"
let SDKMachineLearningChecksum = "d79e15d11b24ee53219a0c02963e60c4b56cd2f4d121bf8d40c3fe3068a14a9d"

let package = Package(
    name: "AmazonChimeSDK",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "AmazonChimeSDK", targets: ["AmazonChimeSDK", "AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMedia", targets: ["AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMachineLearning", targets: ["AmazonChimeSDKMachineLearning"]),
    ],
    dependencies: [
        .package(url: "https://github.com/birdrides/mockingbird.git", "0.15.0"..<"0.16.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AmazonChimeSDK",
            dependencies: [.targetItem(name: "AmazonChimeSDKMedia", condition: nil)],
            path: "AmazonChimeSDK/AmazonChimeSDK",
            exclude: ["audiovideo/video/backgroundfilter/TensorFlowSegmentationProcessor.m"]
        ),
        .testTarget(
            name: "AmazonChimeSDKTests",
            dependencies: ["AmazonChimeSDK", .product(name: "Mockingbird", package: "mockingbird")],
            path: "AmazonChimeSDK/AmazonChimeSDKTests"
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMedia",
            url: "\(hostingUrl)/media-without-bitcode/\(SDKMediaVersion)/spm/AmazonChimeSDKMedia-\(SDKMediaVersion).zip",
            checksum: SDKMediaChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMachineLearning",
            url: "\(hostingUrl)/machine-learning-without-bitcode/\(SDKMachineLearningVersion)/spm/AmazonChimeSDKMachineLearning-\(SDKMachineLearningVersion).zip",
            checksum: SDKMachineLearningChecksum
        )
    ]
)
