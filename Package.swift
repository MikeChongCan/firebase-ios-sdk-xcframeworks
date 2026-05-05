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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppAuth.xcframework.zip",
      checksum: "983a9ddd5902343b5afd61088b926f62352be1aaefe823026f8171eba192621c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppCheckCore.xcframework.zip",
      checksum: "0641067405da98e90efad97132d437c0e28b6f80d3f3824bab7000c1f7bd7cbf"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FBLPromises.xcframework.zip",
      checksum: "619d4057c31239b511ca7820c70c2d92d7976790d16b804a99a513551920d02f"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "6b687cac5d10217fd7daebffe9cded807ef0210987bb8e435e3255c55ae3a31a"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAILogic.xcframework.zip",
      checksum: "ee7f85d14bf82adada43fe06a3298346fb3dfbb1a5317dc2bf69705fc1feb620"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6b66097a6dfcd72303d94e4d716f2594ea07e9518f4381062933f014de1ed42e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "ac9d29339fbd5f82866a079526101ee677b2d805718d7d1a6999bdcb04ab140d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "87be24704ec4f8867dc82b93e322698f62b6fa098ccdf82ff01812e685884258"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "85bd9f3682d66db1a900ac0056cb7c839cf225bc2de92204cbe9dfd956f7c25d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "4d2f480be3e90960bd0f9ab74dff9cb4a815f1403dcd743d6bb66058573306b4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "ea2b29b6efac3d73f96f1e32c744dae61466087a8c660890b8a9832ee50c691b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCore.xcframework.zip",
      checksum: "fd6f8fff1b1a2cb1175ec36ef3628d331eb4a06b629f6294d79ac0d6488bad6b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "dc091f7c58e85db21cbc2684e622457a94e63c956c9fd259566a72ce567cfd3b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "6be7292a755e0fc7603c617882e6da8c4e7e13dd46d2e2f77490f6352dc6694e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "84bedb50fb6745b222834afcee57adea640b538103a2049680e613c18ee9b544"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "79c81c7f1e610acf174964ab8176559b0113a8ad23f9c661d769a92888c801f6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e6a5d84e3a7fd8d1838292181999bb1603f0f58c3b7fae0441267fa1c42218ca"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "9cd1383b65d4471662c13d0e818585447e77ac093764cfe1f141e8f971df9240"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ffdbb4c301afdccff38df1320eb5d6fed5cefee03717a139a15af37ca3a43dc7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "77c9cdf94bf92740b6d0ec46e91f3f76c219a2c822dfdd13163db0d907178927"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "20d28cee8841bdaf6d69aa76a1a559c8422a412d8b2637cec424fd69654a433e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0dd6061332d268f4e6f1900b29d5d62f6e26e4e20301cde95e0111d2e432fd9a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f52d57f051b2c4773c56c31cc08fa44b437ce7256551e5bcb294afb2cf4c80b9"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ec79a07f8c5449a85e1ab45e59796942a8d01956b8aa22478119cf56882ab4a0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "5c93949b5d8f1a6776caf3e5ef8408ce01fa9534ea5abcf251bb88cfe1613a17"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8ef52a0b12681f10ccfd1379bf69e288ca9f389d991b822a3c172a77f8ff07ac"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d992dc1e2db3e833f0cd2c110fdf9a9e532b1936cb3f2be711b82238700d27ce"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "7fa5e001730ff57040bc02c8c7ab5c8d244b30fcd22736ba6c1de9f07cbc8950"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c7bf3097532cf12f6fd92407c276add390d5d38f904258015b61a4c0144420d7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "fca06cd4b7389de052ccb1a46529dc6c4248cdc404fed75035bdf83675a8b358"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "18db6242be2fbd144002d3762a5b6a938a873027ae2307c85e9b69117e19b6a5"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "2d22bec4f0e43e378fdc08707ecc29a3e51ce218dc15076983d8d8aab40759c6"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "619f8db9178d0acc59dab0cb8966d74291a1306360b2840370f98caca2609997"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "cc2b49964ff82a42cd1010d49c6f658d7c2a7d31b601dbe53917c728280a4f36"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "597fd454911a40b5aa15f949f5a689d5a459658bf3e12b83bb7ef816da35d510"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b0e39f4491a32f5cdfa88408d018e659155935a277635249824512ac24c1c8ec"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "a4dff52821a3b741a84439aaaa7c9242b57f9210b6a7cd77c77a262e5ff1e803"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "299636736a3a86d5c97ed9d8e5ce8379c190941772fb2c49358349795b436fbb"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_Promises.xcframework.zip",
      checksum: "7310b69e73cb94b86f2958b09ea8f1d4f97dd537bc951379badf899ef4655e45"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "038228c46982043f44aa1311cce08617a0f7336a96b62582ee5d7aab20474075"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_absl.xcframework.zip",
      checksum: "f53e59294a927f6a0d078fc17538395dcdddc4f178814e677a41be4c89400de4"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpc.xcframework.zip",
      checksum: "0e645353ecc635234e8615b616665e49ac2b934010c9bd88b2e27ca002a41d33"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpcpp.xcframework.zip",
      checksum: "7e420d9c5f23a4d11890ccddc1092db898c8c4047867f94d7cc4c05a0eb463d4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_leveldb.xcframework.zip",
      checksum: "ba288bb316dbac60f3023ebf9fd5b9468e7516b714ca4a5c5ea4b0045f155a21"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_nanopb.xcframework.zip",
      checksum: "0659f66616232c4dff69ee2b3949504fe4eedcbde510ff0ca5f426d98764ac89"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_openssl_grpc.xcframework.zip",
      checksum: "4faa27941f691dca565ff4cc11e68241ebca145147eda4d5e2aaa7c886c08a8f"
    )
  ]
)
    