// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAILogic"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppAuth.xcframework.zip",
      checksum: "a329a36b34424c6dd7529d4179d34495c1c8a5190eb7e8f56dff12ddd83b23d0"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppCheckCore.xcframework.zip",
      checksum: "812ebc09ec943cffaa249089d9325f11bd646cc4af4cb8e700e49b5a09e67ce5"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "e856919fb7bbc368a2cf91a125835a1f2cdb43d882768ceecf55f0fefab41908"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "266994caf935230348e9e1109516d039f908a58f44e43e36e8613c7c8c537b47"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAILogic.xcframework.zip",
      checksum: "d5a095255765daac5e13ebfb8fcf5614df39c6dc524934642fbdbc1847e0d00d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "fcb52adf3f24ba092f79f84842c516edffb9cd25adcdf7a0b3deeb574f97471a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "03f0ba3a9bdf14cd9d6a1dfeafa450d884e1f3df077e4963ab41bfe5e7fffb99"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2950c87a71d86ec481c472999c00debabc22c53a07ae59de7d7f9fb4c136d286"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b4cab44a0cbcece68b705e9f40702d9d468132e0d5fc5f2fb3353f64b9e1baeb"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAuth.xcframework.zip",
      checksum: "12021294137e1f64632c28db71a46948e70fda439ee2d7efff678062f5eba9d9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "fcdcafe406a1c45d1c4d186e47e78444d9d3cce70f332b9804b2a1cd316e5737"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "118b4a5bc2a4621cd3fa63e03f1791071a8a4cd66353b7a7e4d5bf976401cea2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "dd00d89733dfddf0ad6c97dd5a19f12bdf426efa0f0c5f68aab354aef5adc9f8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "a8920b3ae8aeba33eb6ce08677286a64baf5e481b1c5eaa93a8806450aca5769"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "550dcb22952a77848bb549406df7f718c19bd39c173e328029ef11f54a946bf8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseDatabase.xcframework.zip",
      checksum: "88e50e8cb7aead515e7a2b2ab0277dd1f612bab33ad3e87f0144f2f1af9eeeb2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFirestore.xcframework.zip",
      checksum: "7c49527543ce3bd9eba052cc72ccdb5bd9c73f4c4749dd99c0631f4035bbae95"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "79281b2f20898017f8937bfa14f76590756131448d3b9bb900d9a1df04d15876"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFunctions.xcframework.zip",
      checksum: "6ba7dca758bec925f6183260643adec7b48fb18b9cfe83c9d48496c290137526"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "83b0d28006bbf7561e9c5a1365342802e566e5d5e35f54edb53fa48b3440b8e5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "709d22e3950d1cae6d193585efcc5c9d912e9e3b5c583deea24b48ac4ce791ae"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "86e4b3163a69f981d6776aaa98cdf29e1b5a5d32bb0ff744f7ef05330cdb8012"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d7739a63821036990ceb361ab70c8ede8e2465c4beabbc785cbb6e2324aa06f3"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "86743e5c671e885a52e411461af59b804a6d0eb4a3fa402cb6815e48d218e074"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "34e7412e0cead359f1fa0679c438100127291bec38aab6e9679270ebcd6e70a2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ed24ae5f0796002b23838095d2a37bfbfc5867978b429c3706deb6f3906db59a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bd5dd2e02bd70301a445553412cb38a21c1c196d2cb6e151e8ad75392ff707d0"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "5aae5388b11e0f445892761f9a803b29047325ee287a8848479b62eb9a47a762"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "35a595c443a795031b627e641056b95eba384e1d84de320e9f5d18841dcba76f"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseStorage.xcframework.zip",
      checksum: "4a2a9f2e867c63cb98fe1b57a074228f3f67741aa87acdd14f39761edd4c40f5"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GTMAppAuth.xcframework.zip",
      checksum: "09753a4d98a430f6c5e6b89f79d3b4d0798491316916e7d650e959bf96ff8ca9"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ddb0e6e0853fce5666697c52156536adf094925649d84a2cf9fd138d5c877b1c"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9435b71da9d1f8cb75c93698c6717642d1a03c150842e60904ecde46735d71d1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4098f358bdb85af9616fed4b4ca2083c6c3245c2f1c99b636dd0fe0ec965b76e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1798c16b814592235d27d4b47d111e7219e3dc64c0f0464c5d0ca99fdc708843"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "faee5b42a5343054ec941d3f6ef2b85e02c9f37a2fc94c2f0009a4fa3a11d2e0"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleSignIn.xcframework.zip",
      checksum: "28333552f6c7f69c3abd07b62c6f8557b14ac7df9881512b8b264af645ce16c6"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "e57a7607a6a0340f94d30a7ba11aac6be1bd701e2caea4b195847db307527e3b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "5c19e70bd251057fc349f92642abf5b2ac3f793e03872d79c6f63fb9a79c26cb"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1212010623ce29341ef34b105623de40c52c70b1c557bb5526633f55b78431fb"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d45393a4fdf922a7fa29f68fca78b63f42852a41157df2df2835456086f573f9"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_absl.xcframework.zip",
      checksum: "0266d69546449f1ef250e0e6938e32ba1026c9fc15e1ca779b415a0a30ecc4b0"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_grpc.xcframework.zip",
      checksum: "b4da51b8a21cbebefe68df4922ace10856fb4ac612eaaee23791750232532fe2"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_grpcpp.xcframework.zip",
      checksum: "21edb879fed3c608c77c1639dd17fd3668c6162bcc6fc1943941a79024b92a93"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_leveldb.xcframework.zip",
      checksum: "d05249290e18b7e5b8b0b48ba706e2fd9e4d768d6b2cc07333dc39dacb8772c5"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "a2cc0f1084e1fd127a56886809a1b1173ce72d6c7fa2a075266a28a8500b8904"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_openssl_grpc.xcframework.zip",
      checksum: "b886b597768830512d6fd91940d91777b06aacefe05078cee6b4b81d95159dd8"
    )
  ]
)
    