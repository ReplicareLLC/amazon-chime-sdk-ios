// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKMediaVersion = "0.18.1"
let SDKMachineLearningVersion = "0.2.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKMediaChecksum = "20268ae2c8c17e8721576ebf0846a837db2e15eca37ebe0e9c0d6c1c365b3a12"
let SDKMachineLearningChecksum = "d79e15d11b24ee53219a0c02963e60c4b56cd2f4d121bf8d40c3fe3068a14a9d"

let package = Package(
    name: "AmazonChimeSDK",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AmazonChimeSDK",
            targets: ["amazon-chime-sdk-ios-swift", "AmazonChimeSDKMedia"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "amazon-chime-sdk-ios-swift",
            path: "AmazonChimeSDK/AmazonChimeSDK",
            exclude: ["audiovideo/video/backgroundfilter/TensorFlowSegmentationProcessor.m"],
            publicHeadersPath: "AmazonChimeSDK.h"
        ),
//        .target(
//            name: "amazon-chime-sdk-ios-objc",
//            path: "AmazonChimeSDK/AmazonChimeSDK",
//            sources: [
////                "AmazonChimeSDK.h",
//                "audiovideo/video/backgroundfilter/CwtEnum.h",
////                "video/backgroundfilter/TwtTfLiteModel.h",
//                "audiovideo/video/backgroundfilter/SegmentationProcessor.h",
//                "audiovideo/video/backgroundfilter/TensorFlowSegmentationProcessor.m",
//            ],
//            publicHeadersPath: ""
//        ),
        .testTarget(
            name: "amazon-chime-sdk-iosTests",
            dependencies: ["amazon-chime-sdk-ios-swift"]),
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
