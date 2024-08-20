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
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
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
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
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
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
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
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
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
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_AppAuth.xcframework.zip",
      checksum: "006c7b454bd6c02225c09c6230f13c2dbcf557f274bce39404ece30d3bb60a0e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_AppCheckCore.xcframework.zip",
      checksum: "f63af48837ec38c484a5c4ed8e9f21c6eed49a28249d063c881f2ff612af4077"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FBLPromises.xcframework.zip",
      checksum: "4b3fd45b9e2e063299022d149cdefeba8dbe7cd00d299f4c234dbc5e86e44107"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "6dbfd49481552a2535097e5e11f19ee293e0f3b0ea18c3c2df2b05c070bc2881"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e04ea040c3e80ad2cd46e13ba9cfe82887ee64043ef0b908c96e5501e1a74e40"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "adcdd3c981ed08144c949197d2855b0f7ce0fbc87f31731a9f8fd3a4194889a4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e9e31f914697e939542996ad4c532fe56e1f0dfd86d4e218dbfd615b64e82f5d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9b25e1ba4a74d9cecbacb7bbcc65fbbbfce6d9eb382ec514c12170080a7aa83d"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "0595980aaf925a9174021007527ba3bfeb440d0a1d536b8db4da6fea0b22cb1d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "6eb1029bdf636965ee5f0435c5a5436a2d00ba6c191b81540df8aed1dbd56aac"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "26ab67d3fd02b283a6e774b86031214c7b15f93a4000676ebfc00341d26dd7eb"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCore.xcframework.zip",
      checksum: "ec4f7f21b11527687e6d9fe2ad79cbcdcf789e8d982f1ab1b9fa1ed3334cf39b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "26edbf0bc69c687c6480ca46adac42b64849aa6f54c4547bb641a9e42d361db2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "75e12ef93da78ed8e42cbb20d50103c88caf1ca8cdb8027b7765fc27882759e8"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a2a0356603e670b91eafedcc3811b6d287f54e26141c500825afb315e28f377e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "cc2a09cb70f219e94113fe06dabf9ca8dc923599c96e287c26f95de611997d16"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "b964971a25c958607afc6b816e3c64eb8dd721720fc8842e4af306902bec5ed9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "918975b6153e97feb59045cf06b2eff657c74b38f6142a01dee6a6fb0e8eaae9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "01381c5ee960ab844181e8324167e7ba95f58e42d38f4e85306593e9d99456bd"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "746ad34e898ee77194476710f4e5d887b16a2fe92d00989354a0b9f634d73513"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ab4957b8e0a313e392a71066a240d24c3d608e10ebe61e72136752d6e3cfa51a"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "3037b5bc12771e1b54510d89016498a83a0d74db6cf9e921b5dc0b4ed778da9e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "140835108e74f6280f93760fd96406b5cf25eacccb67dcf09caf1dc43cf9c8c0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "5780f8ac29f7c64570e786c4ba85c81d380d1d415372301a565ece46994ed85a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b8ab610324348a6190336dd933470f39fd8a0e52bb0a272d7d3b254e51dadf6e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "d0acbebe03d504ac12900134811b6e3639c554c74d69e35b017aacd3507a7645"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9c71b34e4639d81caa9f87c8e554df9fc22bcf05101db890bcfc73d60f589dff"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "312e437f3a9b4c84aac5f3f94bab3fcc486be948636e24d42fbea60c4d0fbc3a"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "ae2f8da9f24a1ac3f1bcccbb7103a44bc4c6f06d75b3b965c3ed6912cd823212"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d715d903aec8e5962080cc6eb1129aae4bddad7730259b5de17f835b848dbc20"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "de0d591c83d6a43fe7c85fd8c2efd6ef52705912f3af68626aa6c3e766b61909"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "6a03272f155315c62577e1686608df9c607be8605dbfd76aff9552f930c744c0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "7de143cbd4195eec16352a129790534f0efdd07c968a12f316d6dd1606801a64"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "aac5ab88d2f2723f05bb094e06a90daba92f47d4de5676497e5e6d701f40469f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e4c5ffe52ea6c1ae5d97d9a152d1f6726d945832dae08516e5e2966e69d12df8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "588890cbd5ce0b1aa08287e9e9844f24fc5c56289777886eb3b76a4da94ed52d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "67edc7cb07f29d78eea751b1ed19d326138db575c4eb865e06d7451ee1d1af79"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleMobileAds.xcframework.zip",
      checksum: "29cc347f4742d39706fa4f89660ee6c6695a4841f6792f0ae1b80f0bbb8a88b3"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "aee37c6c13f4c7a7b82f5278c2e950d36446871f70ed45faac8b07df67d37b62"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "3c727d64388310e51ebe5efeebf8e0b3d145984ec44b0d158e57d7ecf076dcdd"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_Promises.xcframework.zip",
      checksum: "3d973f49af3d8d73aa44cf05e067195447dd622ca8d6b7a2ca72bb0d0eb151c0"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "69628a549cfa44bff9cc862167055d19884d3be1a659372fc5227308b6af6ce2"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b6760bbff0113ebdf96ef30dd0a579148f6f8f047cf435f75d710302996e2bee"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "efb0329ee77e990e33fa84399f7c355be37f5593250f2608c14c3d316bdeb2e1"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_absl.xcframework.zip",
      checksum: "3224214943e8e48b3febd44c9f0851c605b1484ea4a653ceec2cb7defd25b7d5"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_grpc.xcframework.zip",
      checksum: "5e7f8a912a192731a1a37ae6c7c357d71b276dca2564d702fc98aabf8bd29233"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_grpcpp.xcframework.zip",
      checksum: "8f88a1b52bc4b0d969a1b1b570020108f8cd84e2f483ecffcc92a5bef2c55044"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_leveldb.xcframework.zip",
      checksum: "8f62eeab006c9ec4d11dba1495f714abc5f63a06da10e2e86b9c5a3cabd25a15"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_nanopb.xcframework.zip",
      checksum: "3fde787c90bb9395b54002905dc9f549117b97fc9336475047e8d0c06393f6f0"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_openssl_grpc.xcframework.zip",
      checksum: "f7280df0bb70070d33411962c645cddf56ec8ed8b463e8dacc98e038ec6537eb"
    )
  ]
)
    