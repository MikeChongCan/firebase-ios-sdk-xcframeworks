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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppAuth.xcframework.zip",
      checksum: "e830dd87c1bc80aedfcb62aed979819efd1a78d1303868d1381e4feeef2ed7e3"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppCheckCore.xcframework.zip",
      checksum: "2033bb4e63ac63290fc9cc959b74d202f0d41768cdae63433cb06970a2d40faf"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FBLPromises.xcframework.zip",
      checksum: "c69b158c0f5e36affb86bb4801447a94aac91b2a8e17d628ffd82d240f411ee9"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "42980ade7ea9716dc2b0b3d05f125c881c794a7fdfed9768abef14e1d0550f19"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAILogic.xcframework.zip",
      checksum: "6bc09585909a48b50b463e2fa1fb496ad6ce4715d89791be5f6c0af2bb906747"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7253dd81d51ca63f8fe0a35a88498b48a62d75b1f742aeeaafb2d48252f12b8d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "6cc3789aa24b40c073922eb44ac1dd2a7ae125ff627785621c54961675d83306"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6b3c22bd564093aa1043a04f99af64244a9a71d0087a03bb44b5f827f75a443d"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "2bbeab57c06f716de8ec977fe080f7aba7c5b6461908aad8ca87611484ba133d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "3ac7dc51d730c662a8ca194a5d817e9e35db5eeeb644626518d6fa8d0d8a6ad7"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "692fcce856e95a3ee30d5279efe05da5842a375104aa47af49740ec57cbc9866"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCore.xcframework.zip",
      checksum: "6952cf19e498eae59666724b6fcbdee04224a434898fea87d488ba7115598bd8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ab520507c1338fc375d7ce5e478b2b5b45d6d180899f864b97c87e51cd34a842"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "62f1721fa24523592d05aebbf3e0fd941637e290953ab319bb5254491cd99d04"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c5d3c29b1f8220971b8d47d38d0c0d0554dc29c61050c617a4c64c8eb68e4b63"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5e19570ea72ab76bb18d5addf79462240794028c6f48b378854d82b961daed64"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6eb260f52758e64007a17b1bea406dcb9c949356352775d5c258bcd9536881d8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "35b8dcc65854689ddacf365f55a41aabd2babddb91fce16dfd286d8aa7ca36d9"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "3acf03c7e9df6232652472307b2738bee2aebce8528668c0b02f9652589fc954"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "06c35e5987ad23bfae4a49996971d0a86e1584ab422e5f775c610ebbb8c34aa7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1e117eded1a5ddc4a372c46669cfe7b3f93b8984ecf2f279d90cd64182640982"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ed064ee9d6420620553306957d88516386e75fa853819825cd18e07e47205db4"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "3ce278b7e4f5384b59d87850b0c330611fc7d8f9c0d7b1ab47c053f42d043ffd"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d971028abd6aaad7420696392a0607bfb69b77e2e5cf24f889e635118e32eda3"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "8e513805ce8c37d2ead9c24ec9d8030f4a9d973166830b95614668fc7bf12b39"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "438e12dd3020d11342ef34d19d7f86bb76519a1a9a26e72307ade259888eef46"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "66b61001ea9c9aec2d4d37b6f634394ac4994975d03b9f66481a1bdce808ce71"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "c82c76750b0944aae0ea82c5f0b65d17ff47b1aff1e648ddc7cdb6d3e84ea510"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "60207029ec3d15e69f71a060dda5880e8df2326f8fb032f699a30ff7eaf4b0a1"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "513b24bef96135b048b2993466b702ddad201bc87498b902565ea4dd8cbc2142"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "087a423cc79421c7d8910620c7694734a4c516ce675ceb6b9f89e1c06481aeeb"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "508ce6620b8dfe80a44ed67cd0ec1b3e7732ec6d2f3102942b9346e67bbf55a9"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "33275af8a3e201a4dc11e5414191d0fb09c451cbe9a0e287a1e2abec4a84ae55"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "42db7727eee5eac35d3c1b33997d0fcb1c7062bc0abed38e4686782ae4467ce5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e02f4f685b1e99ff3b2f4219831988b71239cb9fa233c910964f9c90ed135d73"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "cd576668adf5e9b1206d6b7b63f5698f1a8366bb31500b15aad00dc5861c1d6e"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "56c78465a1fafbd99b1e656f8e33e1207c418586655945df7c393bb8d1471d92"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "93636a5dcd4e966edd8722dc1e35616b2c8209b7c029f6436339bc34e78939ae"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_Promises.xcframework.zip",
      checksum: "d469cc3ccaac08d7cf93b2f86fcc0a4ad71f4369673323d069d42b1e76c3501b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "e22b4fb624a3d456ad214b04a4d1e304d788b6b3840bd6012a5605ce5ebd6495"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_absl.xcframework.zip",
      checksum: "07aa89b0ddec0b5f436b05ff4fec0f725f70861a265351e08d7fca9ef9d3361f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpc.xcframework.zip",
      checksum: "dce257d546f9d43bc6f0903aed0e30f07f86038b97e2d3f52136d071ca39e846"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpcpp.xcframework.zip",
      checksum: "d9025a1b0e48c0e8886a2fc86681ee0219c55f532fb2461211eea2e0360b5eea"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_leveldb.xcframework.zip",
      checksum: "77caa9da2d3d8893af5ad64990005387dc586e19d201bd99b0a17e7e9c50ece5"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_nanopb.xcframework.zip",
      checksum: "9393b7e2e1865ddc83cea10709771fa2446b22ecc74a3978c306630731c8029b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_openssl_grpc.xcframework.zip",
      checksum: "fa3ba2ed96858c9df2bf1571e2e429920f18c36c7ca852362b02193023d02020"
    )
  ]
)
    