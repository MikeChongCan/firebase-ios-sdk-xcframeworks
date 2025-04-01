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
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
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
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
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
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_AppAuth.xcframework.zip",
      checksum: "72ac85c83c6aa7942f6c0d77c7cf859359fdbad58a00beb928894f85df08b846"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_AppCheckCore.xcframework.zip",
      checksum: "f2bd68ca9a01ee021218f2fe958ef6a3d8d86a52dec861b8fc4d293eddfbcd69"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FBLPromises.xcframework.zip",
      checksum: "b58575cfe956eba3cefcd38453dea97b44f88dacbcac89e7ed60e49419a88425"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8372ac8afeb02a919cccece0484a59a08737bf3c75e75e861c93e198fa80f7dd"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "195ce9b2145c29441b11ae9001909beaf0585fc327a7b0fcf4627a02d98f7414"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0a10f308731b7004cd3efddbc9ad2ecaba4bd137389de7cca4e486a0a3c47c8b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "dd70fdc0e393b8d5f1d94804b6ecad28ca67dc3642200e1190bd4e1b4856c676"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ddcb24377b0ebba5207d7bde0edb53ecacc206b5aa699832c828ac63c0ec8dfb"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6998ba7e606e368fa4c519933ac356c0a2e412df16772e12220f3743bc24887c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "1ee0fa2b5a44b9c4d29168be1faab1204a8b6ed8a50598e9fcc9031d8b998381"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "2b4ed77cb28349fd5a53f4d2380e1ced627e2843513ce417c2c286d740c67a11"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCore.xcframework.zip",
      checksum: "8a980b229c34cad9c0dff60973ded2e873b30ad6821a3216600e438052576d26"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "6d94095088f411c5c2bb8522da368d7535e065486beb3fef0402c49312723ca5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "072e423de20d6027c3220ae7f8ae8fe835fceac34c7ec8bbae8a1e40afd321a1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "785905f7e65f074c9f016cac10a85d79bc586e2c56a42c244cab7c484db7e4ca"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "b9afda0fa9bed4e51933d3509460eab72e40e51423d9bd6fa11f7a441b8cfe07"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "758f9f837f012614647f96ef2a3365960030b51fdfba9d7aa7b67c3ee9e494db"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "355df25b5552b702bb9f2f210008be6572caeba1193aaae703df0e76a67c468b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "afd2ecde10f7593fc0f52df8ee5742485fc28e69c535d3f754d0d1a32f1491fe"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d28821e762cbe4bee6e3efdfafa2241f260c32df9aa70f5634407d32cdc847d7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8f34f6306f5e739288f81d445757d13a62dd9924af56e704bfea1d4343d79fa0"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "131f78f3d93719f46c8a08420a74b49b73902aaa23e57c5ea59d9ec1db76b794"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "35a18b5dcc0faf3d875a6b4ed8bb0a96ae174639161864a8cac432a0f676cc2d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7c918a696aa808a3497d9a8d7827b02c5fddbf6702898a7ad37d3bfbb514768a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c6aca7df7affa717f018293b0fd403f7a08bae468f46c2d219cb51c7a4d7c115"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "35d7a583fe6f9ff21d976f5a489fd93a1ef27be8b4871fafe1aa14192984da30"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "da56997f70fd1920364e2c3a3c4eac78906ea7d015e315154ab87cae8dcb0b72"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "82300c733c6ad3d54b3b3efb627d04328db775bcea54334d76229eb29943bf28"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "934bf4a57286c6cf5783872f2876bb9ad4bf4e675ec994d72d514d60f3064ecd"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d4313f50f9efa76d9985ab8ea5c30cc67177828f3790ebce46e34f822129daa5"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "a2c9eae0406e91612a72d12d0a98fffb3e5a82eb964921222e0b16042d845510"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "eb2d10803ec1803e41c6be247621cf21d7722992d05440da8ebc0b0486869587"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "5422bd4e0a18cc3f9264f114acaf81acdb290a010fdd4fa42610266574d3a3ab"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "86d239b49001e8bb7a44b2d0f9fb02386d8b34ed51653a30563bb7fbe42575d2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ed2e90d3896ee7b34ad8b9718ed46d98251714eb6f4556cc1da52eb2705dd92f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f1becee1b3d6b04bd2b92367f62bfb33ecbf7cee030117db2d6268ccd9931e94"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f35ba673e6600ac5d750465a7add29672ac52619f9e8638d08f2f552a33ccb89"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "682637093fa35151d8844480b5789a27b4df4d9df957a12b3a414cc7f648f094"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleMobileAds.xcframework.zip",
      checksum: "27c0bb703c7fc62074ec81bb9f39922fe74c3e9db3ba51099f1523702806e46a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "1ab46b54d7c52b0bbbfc5c148b99a905846e3c4fb94e82f0fb691c900552d750"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "4fe455da65840a30e448b14d164c80e25888074ce658d0a2a3c80d50353d6029"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_Promises.xcframework.zip",
      checksum: "b93fc15d02108397e411ef823b519b473d10c84270ce4428515e6eb7f3185611"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1e78160b34c11c661f4d355fd19f2778c370c03383942f26c6fadad68b39ced6"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_SwiftProtobuf.xcframework.zip",
      checksum: "69ac59cfb257533d831d7fa16bbe55c94de08b234c14383d45b5409737aad98e"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "8ac229dd2e4c6f9043faa3d64591afa33e4509037f9d5c9f1f73c789883b80a4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_absl.xcframework.zip",
      checksum: "8444aab83c6ef1592f284f37667d5236e4ccd24f03318711f7ade17c018ef11b"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_grpc.xcframework.zip",
      checksum: "ffbfe3590c1d8978f67b63ee8a1e5901830558da7950cea9ff47e19542050afb"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_grpcpp.xcframework.zip",
      checksum: "178f0d91413ca4f65ba8a5d1b26c88a823428e39eb7baa4c2e8df138b48af6c8"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_leveldb.xcframework.zip",
      checksum: "f9eaba640682f85cf3d84329ebaaac2157349011543a3c143582bfa6b84a11d3"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_nanopb.xcframework.zip",
      checksum: "f6fd8a3015db160c8bd06e99a807962b291ac988aed8d6ecd1fc4168c9655e27"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_openssl_grpc.xcframework.zip",
      checksum: "4da92bb414a5fd88b4c27a04c241f0b992d731293410084fcba441c14e149454"
    )
  ]
)
    