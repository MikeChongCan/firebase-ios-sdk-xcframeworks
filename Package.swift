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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppAuth.xcframework.zip",
      checksum: "d603de8ef2c42ad86654bb09e990f1f798ca5a3e7f9ffd5bad5b31a7fc03582a"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppCheckCore.xcframework.zip",
      checksum: "ca18fd2a8659a7814aa19e378fa259f77f5ff488b1109ebc81e74b447a35c977"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FBLPromises.xcframework.zip",
      checksum: "dd6c78ec8ac095413f8674835e06a4aa84d49e2e49051d2ad7499d734728ab05"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseABTesting.xcframework.zip",
      checksum: "f817ec06a59d30f7a2b38c8226291e1d172a96d229bd9f2615f5056478bf57f3"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAILogic.xcframework.zip",
      checksum: "c61cb18fd241712c30698821a707f63838546e94be4b1e004f0792ab3327dc28"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "2b1904460bdd6ecf7cee037bd39423cce36ab20ecb4ea57fb6a9e2204ec3dcf4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "bcd0792f3250415d20afc36b26329ba0b6e7a74ecc30f45045ecf2e61e045801"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4f0dd460793b09c2eac3246394e8725056afeb49befdcaf21783ff61f2f285ed"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c84df6daa699575434c22dc03db7afc995869fbf6f33391cce41965a03454fe2"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuth.xcframework.zip",
      checksum: "a94f76b3cb603ed652afd5fcf30015d55fe67b85086a762d57952d094c65ddcc"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b8612d4e997d23929e45431d66a74efef3491f1a5e404c25417fa2485108ccb0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCore.xcframework.zip",
      checksum: "5926197dc3b56d4df8f2784df5172d2744484f254534bd81996f3d8176b918d0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7fcff1acc01c8bd00520b4ff5ae74f2924059fd7ec419ab36c5e48a6bdd1714f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4898651a02b51a790dceb4339ea56e3afd274bacc701d1e6c72bbe291d08eb35"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "690633497828b37a28633d29c7abba84b23d0910442fd75d7a70347ffb9859e9"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseDatabase.xcframework.zip",
      checksum: "e1965bbe7cb01ebc96c0828c7f8c16e4b27d31034829825772d9b63e999dac11"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestore.xcframework.zip",
      checksum: "99f6741fd673883201f2fe03200c342fab9043bedceac2de83c993a4716fb46c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e2597f442a73d87fec82042c460f5b20bef84c70a00aac56cbdcf934193c09d8"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFunctions.xcframework.zip",
      checksum: "60c2a474810914e21051659b781f7415ef83c3c877b61a5ac647eb380ed78066"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6200f31b40014811682a4bc7df94a8c0a0dfb0964d80ee54be63a2e48ae90221"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInstallations.xcframework.zip",
      checksum: "011617d923f226ca973ab11494fcd55e0a23444a9b118c7339e83e2606c41b76"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e16324c5ef1cba60415bfdc01b1ad00450462f8fbfd9e30701101f7ec8feb793"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessaging.xcframework.zip",
      checksum: "9cc73d16f8ddc86e8bd38560d84453bd93ff8862e7918b89b98dd2ff1ed5cf0b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d953fc1bc06229cc088227d8953dcfcbef51984dab7fe0214fe7f6334187a1f7"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebasePerformance.xcframework.zip",
      checksum: "e3ca06452f66167a17b8fa076ff29b617aa7e792ac4d6006e7fa2779001572fd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ce5257a48950743b81207e6854ffb91c1f8b5312b10d7a0a75ebca8e65ba3762"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d8457433f23999dbe17d9a68bd011cf09e49bc09dddf1a5447159556392c3339"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSessions.xcframework.zip",
      checksum: "b378ba0e6a8c2428d8eba6d693546fe9c7a6e41bd656b154a0fbc206165042c1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f501e46e1aa9a385678061477c3ee940128992dad4ad3e72113ce061db57aa68"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseStorage.xcframework.zip",
      checksum: "1af0ceff9f4264cedb6cb209b269694f03740043a53b434d3a53f1cebee53d37"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMAppAuth.xcframework.zip",
      checksum: "80cecaf8bd259b7a435ddbdf20999980acbefb8a219d5305a75cd06e91838327"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "79af78b4b3811b0e6be9fd8f762add7fc81dfca63574a493c28c5b52c1977529"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "53f5409b716b436cf0b3e01ac09d92160fe853a06786ab7aeb6f97906095492e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "d0fe4ee8687040fb56154ff291eb52e8d7bd408dc58bf4a6013ed8ee992ccc9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c33bbf62dbf41cd1bec6c9d11d3a118e408d5c4710ad622a0f4557d7da411bea"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleDataTransport.xcframework.zip",
      checksum: "7303b89eaa4ed3db46a9c74de8b5f747ea1a13685e3ab8fd8d5376a0f3ea4506"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleSignIn.xcframework.zip",
      checksum: "ceb8e2c34f81e38b2d9da44baf28aa112fc003adcd3e069de07a5d7bead6824b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleUtilities.xcframework.zip",
      checksum: "6daec220c084b030c87938bcbd4fdf95b5c055f9d998d3950b7d32d766232f87"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_Promises.xcframework.zip",
      checksum: "a600f14237089fa823ed8927af05d30eb36ab6eb6d13c124a6a4eb0a9ac12ebe"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_RecaptchaInterop.xcframework.zip",
      checksum: "81c087850188e4b0efa8843dd083b258b828eee3d8a89823c9ea24c7357165b9"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_absl.xcframework.zip",
      checksum: "e2b6eb611270cd217f6f8226b57726004c67a8bb0cc0b0915cc107f242c2cc08"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpc.xcframework.zip",
      checksum: "5af9df5897e9e0f688c85fa89d3ba68107be92264afb4b70b6005a0f04006d78"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpcpp.xcframework.zip",
      checksum: "3f4668b67c1c91e8bc0390618e12a734df6f1b657864eb661b28c2d83c4ebf4c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_leveldb.xcframework.zip",
      checksum: "e1a121526ee9af6eb0b57817bd1b0d5c0c1cc77b1d5008d0445893b23e9d43e4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_nanopb.xcframework.zip",
      checksum: "9d00d11efae8423cc119a91ce50518d33e4b71f1b71f00dd45363905e9396c8b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_openssl_grpc.xcframework.zip",
      checksum: "cd584530102168bf7f9b111c86f1e8548b99e0d7796b76ef38651a8b67a45e3a"
    )
  ]
)
    