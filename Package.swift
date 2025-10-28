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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppAuth.xcframework.zip",
      checksum: "e6c09cb73035defbb2582602877998d558d57f3ca87e0d5ff1f584ea52b8f45b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppCheckCore.xcframework.zip",
      checksum: "8a44e131dab60184f9677126277fc21eadbee3036ab80b158d735fddf39a5900"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FBLPromises.xcframework.zip",
      checksum: "83995ef7ed92fb58a69a9a62e52e9456509bc4e30be493b3fdd3b8c1f185fe0c"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "9806e562f15a397e09de2727e4bb3e3079093083f761e990312928140fcc00a4"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAILogic.xcframework.zip",
      checksum: "554aac0fd17d7d77597c7b9c7bbb2e11b2bdb0e968aa461e90b5f7f824950e87"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d929db2b757875955af97b4c4affdb6b94f49ec2e82d4e033e9730780dd5323e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "21e22c9792701f8ea8ce6fc25c081a047c800da24fe63b88bdce207ac06f5f21"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f1653a2027775b7fec407e01b701a54785b562d6c2655c85e0a9e2aded7fbcb9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3a67eabbf9dcef0edd2048bbb4cbb8c59001f7e7855843d7f9330464c8726897"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "ecd3a8e541fafd8d61506751a009344d6d497d9311ce03d32f6c44255de47dfb"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "1893713dc6ca8ff7820b5bc08a4953e1f1cbf05c23d545104f91f4f900f7b74f"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCore.xcframework.zip",
      checksum: "4fcf893b087817f2da3077c1efbc600f31db4bebeb4785a40118d5921541034c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "c2a293db599553672f9667eb9290486bcca45f7aa36eed2cbb6607d93fc06a82"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "1fc335b61e96421b4f31a679c77a2fb6318166f6b18b4f5d3b68f64fe5d864b7"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e351ee6c1da52b1de74dfb3968f7486915a4bb8ea0ea54fa3c361fd19318f8b0"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d36f4f1af59fadf91f632d7c4be366939dc10bd488776d11dddddf136aba04b5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d6d6a2caa1252b6eb0742f1307ed1296331a6b8e0d415c78bfb5d92cae4b4395"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "fed023e5d5f1e42bd4b1a3cb8a17cf582617c1930854a64b6ae97e707ab95815"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "1b56b9e634a63c9f3e097e4e87b7386dcecc59e62f43fd4d0674e15ffba28c1b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "9972758879f6b51b5f4444d1a38053124b841c5c71bd43158565318b9e8a91d8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c319b260c5db05b752778254c6f3c5c7996d271597b6f41f376392c4f347ad1c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8f69d42e3d4917567940b11c50e77f07b93caf862f916e0d3fb8b347f4c6ab53"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4ab570ae6db339cd24515d58bbce48ac34b5fc29e35e5644dfdae220b33890f3"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "74c19f4e8071f2e62c3ceaa2db07b3de0f90a8cc27234f45ffa675b9fa014769"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "c7c14a15eaf76930d8e32eb4ef8c0ff8c796879bb11261ad73dd40b8ecdc0532"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "5523f5c234286c51dd4f3417f98463aef0e77a57417f9e1d1a0f6507606ce427"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "7c07842b59d09abc450331801f7c2c8be099ae6eab8ae238cafc6b8fa17bb8d9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "c5eae243365a8d224496637723d13704d1d94578e090e4d9255d64d54ff160c1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c1f1e962d851072f23331249f956aa1cec072f592f6ebc1e32b01f57a1baeaef"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "e3a00d08ff6b044ffcf8d49e8f68784e7c796d8e6bcf3df65f6b36c0fce304b4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "edf1ab871693eb87029072db27ba40c9dafbbd8f70096bd6326d5b394cf5611c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "e65b20680a70df03ad6d8d7263f2e768781f83621dbecc1069a40e7e77c0b630"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "1dfac7bc0b3160c0e077d9408ab178266577883204b1f4b0a380aa05630f7de3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "731e65d3c88a7d59b25a9031dca458bdc813a2ba3ba87ef53fa35000605c3d2f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "97e5c2da6cdbe4585b62f0bc336faad51fbb80fbc07fc770e15490b0a9a4c33c"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f9889295326417316da7f26f9e0f2fbe8be289cd2bf26be447fd6de10a213a78"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "7585a0f3355b5237788fe18eefb169da70ff31b5efd5fb801314a9e35c63695f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "f5f479debee526ad05fbe1061d7eb508ffa79a4e8809d951585267de595ff5ba"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_Promises.xcframework.zip",
      checksum: "847f6d9eb4365667d022a586f2e8aa522ba2bb9123041ce4d7aa52a6b16b4950"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3644d3d5e6243684f8564dc9c4ca19dcf9453256e7acab270aba31c8f24253bd"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "2ac3a34a91ef1d1abdc7fd36addad6883159ce352ad5e18dca6fba07dd8b2ef5"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_absl.xcframework.zip",
      checksum: "6009e1c3e9e585b9cd0afaa0d3dbdd4e98119cf714af34e3136b2dcac3690e8a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpc.xcframework.zip",
      checksum: "8b3d4f4ab7dbe2ca5226fdfb36207c5726c89167b31deff65dcb26b7b102ccb2"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpcpp.xcframework.zip",
      checksum: "e59dc62a3c1e4db7ca152b9e01379644573d9299391742032d5c31cf81c37276"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_leveldb.xcframework.zip",
      checksum: "35cfc7bb3586c3145bec36588a0570f993dc4892b7282b97365c2f59c21fe8b8"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_nanopb.xcframework.zip",
      checksum: "86398aa8c8f99ccfc0aa6eb95c81772239d0b5b6a42313965192d0930e6af414"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_openssl_grpc.xcframework.zip",
      checksum: "db2eacfdb486cbbc947301d6423c3596f6d487f5c88ee6d8eb1f23eecaa079c9"
    )
  ]
)
    