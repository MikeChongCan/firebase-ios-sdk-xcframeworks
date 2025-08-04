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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppAuth.xcframework.zip",
      checksum: "adaacbde56272c0eefe399d1daf4fc75e0cbbf687643c4cc134e98114d4f6bd2"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppCheckCore.xcframework.zip",
      checksum: "9b2890643fc13a5e710571d692615a508e91a32e1a0db2aa175dec135282579e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FBLPromises.xcframework.zip",
      checksum: "519f00f5d1de602abcd32ae9fb474ff2765e0b0600dc7d8c89e61bdbb88b3865"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "846b8bd44b7e9d89ea96e6a89c3f758047c7c5d8aca48089982e87535635e850"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAI.xcframework.zip",
      checksum: "5889772add39724ad8aecbba60babe53fa869a2ebbc640fe98acac860b0aa9ee"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "185b5f4bb845af574726ad230a7c47b74edeacd6b165439eba1c153005a7dbc4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "b81d111c6fb8f14f1e07e02fb4bf36015ace0ce44226afbffd6897939a2c4156"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "097442dc3cc24713ff3264987040b041c5fc6df0356a9dd649cf62cf1a86f4c1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6ac402ce50ca1c2cfc5287b314a851557c81d5facfc9763d7e3ee11827e458de"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "0876c4fd6bad5db02b9b2262e23d78ed7a7b6ddf9e9958d09633089be4915d8e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "252d841d07d5eb07d7adce34933e7c06de567a7242defd4a881b2f3236e225be"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCore.xcframework.zip",
      checksum: "e7608c784db428fff05720864e2aa0848a6e67f19c8ba9bf988556bc0ef54f96"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7af425936a35eef0dee4ba35d0c03443741f5276aaea52bf31a81b58b3df430c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "bdf02804cd0e7bb17aa523fc1086cefa81ebb94752597c252315aea8aacec590"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "163a2eba47d23f902dd314be9a64c15fa892741dc46668ebe237df711e5fad55"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "45cb595ce9be7b032a02379404d8d3637594869d581e91df8002ff5c7820adef"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e04b5d601f6dfe7408af93c7249e577914140f4cbb71a368cf44018c64bd3b9c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "14eb04bf3be66378f5dfe677577a70890ff8e96e813ea882e4f5534f6e07efd2"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "eed891b9eb923fa1dbfeb71f1489274045bea05f5115c47279439578694d23e2"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ffd0b670cfb7c2faeda7c5c0097be4693c1c353d08c16cb5afaff29a7c50d70b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9e6244070302e0b47c2be9a38c8979e6389dac160fe8c3d9f7034dca187913ab"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f657250513504feb6cb0ea746458b986a8a7c746efe5ea01d8d0593960ff45ad"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2f55cb2522c3f09adb7c095fca946820cd2d3a8e44c5d99c830d031d4611a13d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "8a15689648711fb9b9ddef859c2208132cb357880a40237c6d7ecc682aaaaff2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "a37b8383c73102a73398ea8739954a54032b97bd81ca367dd2444b89ebcdd3e8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ef1102a524e0bb5e4b3b408fe0a922cb75c5056ba88e48b246a996590f22eb64"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "3cadf2cc328452b82ec1b604a8e355b5fa44bbaf03ef3d25993d0e2bdda94578"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "2352d21b55526a9d47818ba51792e6e9412b638e981f409ef201f95222893cc8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "8a6547a867c7edfaa260cadaad102a515f8a4ea87bb49b698f21dbe030c4d6b2"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "787490a59ab7e9816696193d00484a3bac3908b6f95117d73e21e6ca62335af0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "b19ac9591a8ea56a33c59369893a7f6c2e16626aad94e4479430833589dec772"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "13c60c1a3e60b007d7b929a2b33eeb05221db1acf02915451341715384ce0768"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "479b159050517302140736a135a38458d49e8c27b777064b0a3cbab07f4c63fa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "870d8e5eaaa93c0c9962a613492bb2c1f9f73313970598aedf7c8698552555ef"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "557620a26c9af20f25375d570a1b442420fdcbc8e8a887b7428a995fbb3f50ab"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b39e8fc7c849daa27d1f17e8270357fee92b1b9ddb820a70e362cd6f0a155261"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "02cd90ffe11bda1b0c29536792376cd2c07ca6a8e19aeab1ad434297a0844c59"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "ca48939050e896c47779eebe084e635b2ee7c69fb4700d782ec0ff982b57dc99"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_Promises.xcframework.zip",
      checksum: "6636528e16f0c15c8ce2af14c2007d467f78d37b4e12277ec11898068425e1a8"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "2cdc0cddcbf7bb7272dbb52ac856e6b852328a24da0b158fdbf7c7533dac33a7"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "05785e3b2dc915464d643ccb9612d42662ca098faf4c39a9408ba1da8c4af2e0"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_absl.xcframework.zip",
      checksum: "d18f8570b38c7c2b73c0964b891aea9463a69c674bb0b9fc75ea559199a751cc"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpc.xcframework.zip",
      checksum: "d9a8bda7618fe6473aa3eac6381662519ff7772ec6a89620efcfc9c851da780c"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpcpp.xcframework.zip",
      checksum: "2eeb8c7a1b3e0399be90c574924bd238aae120d97171640ef7a3205147c2beae"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_leveldb.xcframework.zip",
      checksum: "7cb5276b2eabf93ac59bb4ca00a4c5b83c099f782999e55a299cf1018a616508"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_nanopb.xcframework.zip",
      checksum: "044ef88930c5175551faba0ce309226d8d11c74c023c6590d7a4a535dba014c3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_openssl_grpc.xcframework.zip",
      checksum: "5a474dc1f2abf8a1a64fc1b63258b0cbd8fc78d81461dfa96671170fb4ff9fdf"
    )
  ]
)
    