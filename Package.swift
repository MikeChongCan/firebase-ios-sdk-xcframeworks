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
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseMLModelDownloader"
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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppAuth.xcframework.zip",
      checksum: "83bc5286ce743d5ca050f3ba14237ed8b2507fe6edc465ac89e58656007363e6"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppCheckCore.xcframework.zip",
      checksum: "cc6b9881a2b6c9a426a1ddb1562a4c431ededee7d77366e01773a80389653b7a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FBLPromises.xcframework.zip",
      checksum: "c3d58a89d6420f04f712bc111542991d222374dd7971f6cf1f549a8f1f89a2a0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8c8e401f6e820b588a7662012aa5f2df4a6ebfaac850e36abdd66f040d4ae8f5"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAILogic.xcframework.zip",
      checksum: "75ba94b64ef5d38eac21317a4071b822804c90415ae39ecf11dec18a4dc1cb1e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "5755f3b58aeac80609c6e478cfcfbb495680231601e48098b39eee80247273ae"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "bf958bf25d14e262657a92dffff514a28bb6ca48ee4ca62f908d812b56e28482"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a26d981c20bef78ac240d4ce003f47d0ff83156577cb583fb4bfc007f61386bd"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "23bcfeb73aae33456dad4ab82985fff50778e58f73085a19c2d6bce427e12a5d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "237f96ab50ed3dc9ecb36749f912b2fd0ea7412bdbd4ed36e346e03e6ff0799d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b9ffc481e8b2c0296729aab21eae65db93255832c2d378eade2ce8de4502c518"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCore.xcframework.zip",
      checksum: "2cf19fbbb1f60d1df021f71f6a42fb3fc4127f841de67508c3c5d050f6517b50"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e7b09367c395f6597d6fdbdc52eae9d4bd7e91ce45310d68620e3653bec02db3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7c3f39a725f3d7a0595efd5ef390059f94b58a7506b8d357a605383a54d96de5"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "817b443271697f51a67abfd34bbabfd501657ce3d2b9e5c51c437e24ceb0b8fd"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d55a5362a9820c307d02455d933d3038220c21fc1cf219c8e0bf62c87f361c7b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "792b030950ef2454cfd49e8e24752301489f7eb60b12f6cbf71f90c1426ba888"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b9d3c75866b520b8599a6c146d0c8b4c28c7ee7a3f2cb48c7769369b5da130be"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "3638ce596409e60f19f29f8daf5ea3577835904bfe494232aeeadbdc78d40aca"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "d15cbf79ad539164946c13fe0875f02c219fe8dc48fc8bc4afbb45dce1e9d98b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "0adf81379f0dc2875fe9ea94ee18761469b24bf7abe624921be15f203c59a542"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "dac77a6f618240e16e8e2bbebf517c3d9152e0765990c2e92fff4d7e4be010bf"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "97fdee6dc458b0d3705f62f41e1e0c592a8cdbdc53fdca0f0dd52dab2630a6db"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d1bddb0b208ee7f5abc2e11df0fa310be194fb1b3e7f9d2907492d238613dcff"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "a5a49ab6f35acb3d06b9ffaf2b5558c00d3cf610f7c94b42352a544de5705bb3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d5e806ae11876e31fad413bb7b31d0d597815a9fb12b08c093aba01ac915da51"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4758b9c9e3694e570a60950ef1eb388d5bd48cb387fde8ed52490c2488011ef9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "10bbf3ab2ce68153b4d4f7dffac784b09af2cae83bbadebc3fe1a887c08bfe3b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3a9c6b25221d2353a7510c57de113f2b00f191b7d8dabea0efb97bdef1ea5f92"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "dc4b225c9c03b160ee36f9eb6f7e575f8b4fd3c7194f944727b5e4d87d0ef27c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "4c98137d146e93907f7cc4eaf440a79636e8273281b31a93b4d027d9e3867f59"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ff0de999add1870f17170c9c4dca9a00e0fb085c97b497a137e2bffa4cb58485"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "b4870c2e0a36127a8297342e6271c273909e86cfc05b8a4ba1534d0e643a5e7a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "d126750247ef132e74b00ef0f06b773c6a3191479b7aba7135fcf288b0d9082b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "70073823bbc777cbc68f5b1220f43b8d305d5761335d3ba30dff82612a58ce87"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "281752b3060f6877bc8d130228a1019250f6fa478ad3c638f56e12b36225a774"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "9771c6af4cd62ba92986fe0ebfca0e174dcd4973af5b378dd595728cfc510a06"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "8d94bf64b03b86f4f4f1b3344d38fd812f5a9c8bba9cba3d034aa892deb11beb"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_Promises.xcframework.zip",
      checksum: "0961199dfd976cc2ceff00b8d5314fb74b2b0fdb65cee56088887ffc3fd85dc3"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "07f9422aaf02e90252f8202184a3141a8c631a1435ea1bcd31a1b9a86b183ad2"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_absl.xcframework.zip",
      checksum: "149f7cbd5eaefc1a28bca2f12318548674115838e83932760d0f556bf8b89e05"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpc.xcframework.zip",
      checksum: "221e1d1dfd6c023e12f719b3c2a8d33188b0106a988afef1c9250cd5b7f3ca42"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpcpp.xcframework.zip",
      checksum: "6e8fdfb940e1d08214806a15bc61982147e82a3b82dad394f8fea6d6a8a53b9f"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_leveldb.xcframework.zip",
      checksum: "1dd2ea19710996faa89ad262bd317a7da1c0a9223bf75dadf1667312f5b7b893"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_nanopb.xcframework.zip",
      checksum: "0cacdf7ac18ea2433ef2f6d0aec8e2b5eb7ddc4747eb6e0c8939538318c4ef16"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_openssl_grpc.xcframework.zip",
      checksum: "ab3030b3799e62f7d6f40ed3acef20ac12fd9350316945d646df94d491df3dc4"
    )
  ]
)
    