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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_AppCheckCore.xcframework.zip",
      checksum: "5ee867acfcc330f5fd3322b4df7ed7ca2a3e39e3c9e5522c1e20d38b131efaab"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FBLPromises.xcframework.zip",
      checksum: "e56b043fa5781485f17118b39c7d4b8c25d43edf9f9e0441a06f398e95c1e774"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "27cd49f84c61adf33c26c8d0796d46635cb006b884941b577037da1b5bbb27e2"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAILogic.xcframework.zip",
      checksum: "7db42d009fbb6a305475b6f8c91526028c40307eb2fa2403c9f25da56536f189"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4b6d2522493637a1c119397de159e410a668732d0598c7a2e5a02b05fee83be3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "324d855cf961b2724301a990698ed0a374cf286ba57d0d76bf24b4443489609b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "db1de166f3071caab88c024c44aa9ac042be9c7266904e6a3f406525c56670fa"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "656f1b69862596ddf40b51ee7358e3bd87e355ed2e118b2f72919d73c7394bea"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "d8be49db8355c1b8f9d7aa81973ca19a207ab7fd47d5aa5653609fbce9f396ff"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e60f558a87f075da8b1cae0ee5b4a2a6cd3d438198058a872e72829c2816d6c3"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCore.xcframework.zip",
      checksum: "855de8c334f8e733ad3764d9d889fa312c830d6047b9b7609fa6b7080f8cb508"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ec16608f2745f5e7964a254b9bf0d2871c655ea0b2d35ab4d9001497b16aa030"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "714f860d642c1925f7fe6966ca52b9d750e3a82c2010e851026498da813263f9"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "2c8b30068e37dcad0ad83206e743e674a8a9edf975b10b505326c374c8a8f51b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "18233bea6d226d6148061826621cc83a7cd3c273bee9c4a8f0d2e7753cb621b8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "1c985a135673c489db35183959c8029d2fce82ec44c6729588af6bf175c44ad4"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "138d5e520730cbfa9f506f9725d2f24cf0ca1b4df6aee3f5289c49e93383aed2"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "3f34c1959d0fc1c7725725610bd4a0972fe6fd64bf19a39f455e76f35f942cbf"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8fc250cd2746a2dd2527f42d6af1a9e067596436aef9d0c087e7ef83e05b9828"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6580856e9bdb34237b86623e08f70220ceb03d2afec800c7b3f3ed9c359c9263"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d5d30740bfc2f39b761dc10bf66363abd1c19b7c87d0bfb715ce3bec02805f42"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5cf5403116d2121a3ad830f49d8f53c9be6a767701ff95c5350c04b35f22a744"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "3c9f5961bf2ab7616a4194e78a3798e0df67ea6fdac28c1f13fd274cc49d4402"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7fbe4ddea6c09606b300b0daeac38185ed470ca9a3ae2d84a8e45dcd0de17c0b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "15172cf1d031c9394e32ec0855417757ab5a5ffdff2139f3413f8d39a19069d1"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "953ab8b9d39d6c9b0c7dc8143c43cedc277378f01ca0a57ae40858f729921780"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d69d60edf7dae873fda0e7672411776052193f65b00ac7c260be0e3b79093947"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "8c27f8778eb5a715edcb0a928f9ac845e83f18f12163d4f246f812d197c4892a"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "071b16951a1cb50521ccc6f952b72befe4e0e9571cd674f9c5e734f7cc3fe5f1"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "bff8551b24f0a0f691b14d7233113bbbf601cb9f8932d437735a063e1c14d813"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "79cb2d2aa7ef8a230fd08e8a9d66471408c867e04e8ce5e2cd82ba44f16111b4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5ef92644134733dd0120bab08da028f774cbd85681170eeb973d4c276222c530"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "bfc0f049d2c63686f016a41cc52502c07fc05d10facb1fa3d1dce29c9859dc74"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "26c077d873d3e588276294c49944b05ecb2fb29d4aa08dba90871ea61b2cdaea"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "28f944afff4eb2611877f9598d5a2cd093b26f6b5861243c59e8b25561302301"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_absl.xcframework.zip",
      checksum: "f35e253b0bd7d8b6cb8d370a3e8d2b34fb0f0ed2e96a9bd532dfa85774d9cc60"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpc.xcframework.zip",
      checksum: "73ac1a243c76c67855c755d47dbe63bee00fd831d612a27dfe49a43a1e9116dd"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpcpp.xcframework.zip",
      checksum: "ff661b38038708bc630b8c1743a7d5a3bf0119931dd63b2c677d617c39cb3ab3"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_leveldb.xcframework.zip",
      checksum: "3057e57d1f1bb8a659ffb34a2a2068c97970ec95e56c061742fd69e28be11951"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_nanopb.xcframework.zip",
      checksum: "99175e2d80523a476912361a36294f6488904b2be0a30f9079ea89a4859b9e9c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_openssl_grpc.xcframework.zip",
      checksum: "996d8f75ba1824be972508a8346fb854b6360dadf083e15ba39469c446f3c246"
    )
  ]
)
    