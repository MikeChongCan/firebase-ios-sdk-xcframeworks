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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_AppCheckCore.xcframework.zip",
      checksum: "ab15e897ba235feece52060b64f53be6ca98f59420db1c134f55d1696f1ceff1"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FBLPromises.xcframework.zip",
      checksum: "f5b60f5069e10046a45821f49ca8980ed361ea72b7d22fe441193fd982222d20"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b1a8829d765c90828f5c62db12048496f21b2c7be1b78f646d42142f296ca36d"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAILogic.xcframework.zip",
      checksum: "fc423a4c62089aa7c80ab35e9c7f759a36b285fa155f89ad207b51a852dcc13e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f425d061c822c1139eeca1a21a0330e45d76cfddb5c2d23a9ff9df0bd6c3ac8d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "31b2b1fb50a05cd52c63650d7d85dfa5777140bfc9ccc3a57db7ad2b8e1b001d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ba9360f5433a948f11058273bcd113b01379625f12bf27978cdcac69a688df70"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "20b756edae26bc2b282fd46a93113d7a5031639ff40e0c91e788921cfc0f977d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "f788d5fb839ed6c0d2c2ae1074f5868259f1c1e9d16076013b7e78e2448cb7ab"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e4a4ef349f556a2e7809b5056072f71550bb320d4b60356b6d55f226bf346194"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseCore.xcframework.zip",
      checksum: "9147b1e40e2a5679d64aafe037d575edb7008eecad58545c1f6e7b29760cd18b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "830c4070ca4d54b8501d6f944a506ff6defe7d8f23e3c84a2990a36c78d8220b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8e54af26f877f9b16a2fe6b08e3f12edabdda5699c2f0948eb7c948187f95c7b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "848ef72f207f9ac5d9b04cbb126ec223f555f8702391610742030cc03e538f6b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "37d47340463d144eb72b307e512d09f16e57cb61ddafd72bb51178191b452ca4"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "87ad8bfba15ccfd4084ff57b7eec7db139f64e84cc24c28efc2dc9ebb1634dc5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7a1b568ec4b1ead9d46fea9ee3c48d8096ac1a585a1836a26a4059713fb68065"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9f1872c637f7703fcfa99dbc6c072125ef840a2899d57d35f7d9d6cf0ccc8a8b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a427fca9b0f7d351b7bbb592f300f541b6a8ab79dc86a701cb47d93c42ea34c1"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "e9bf3bf6b914a41bd00b6f02dc154071ffa46cd0f0cde8764302c02d333c7dff"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e6da46d3496b0bea2e38ce568f032658356cead09ee70e5914dd1136c1bd77e5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5d2be140f343697b7a9cd13897a5783c334a54c4932fdc4be82d3910bcb9967a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "ea07009b32d0c37a91eb01006b29b72d39ca23e06264d91a72bc4fb135f3aa72"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "cdb109db8d6ad94732ff7a8827b1bc95225973dba2b09fe5b8016cdc835185c3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1ba626e88a7798eb0149de19286452f2c1aeefc195627a05f4b63428f045a7d0"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "ccaa200ae2c97b922ae1c0fbcb96e004a2623ecfbb4fd9479a0ef09ba7c6a17e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "bd8a400f6f34fe0026f74de913ae0dd21aee38484c4f6c1030a021c580d9a1ce"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "2603748d40f4d187a3673ef087f6e596021a8caea62e135aea163a8c6a6e743f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d55a838b575255aebdf0537b257f183ee95fd76d0540a785fa4f94cc5b775133"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "ad158fda2e4fa842858b17f46b428c637bd8ebe4cbc615d9f3b54d9cf6ff0c6d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8bf3004422c52a17d13da5874a4d22e89f3d79ad37c18e10e3b745c4c074ed4b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2039703d1cf38278db739d1f513fdbbef905fa0d02b6e64635e7b03e62a8afea"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "5655183cc3703e60f3593ab60df1edc39511929f148cd9fdf76f0fa6bde153f6"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "660c3a20fe0672cdda58adfc48aa976815d710fd3d860181d29a5ae6b2779e67"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d64c4ae38ca2b33365baf25bb2dcf8bf2ca4d827940491c22279c0346379124b"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_absl.xcframework.zip",
      checksum: "c0fd3375df6c502988df67c271372ebb92a6cb991dd0a116e96ebeed5423ab39"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_grpc.xcframework.zip",
      checksum: "5dec4f3d4a8a8e5bba412c1cf5e93b2fac72656b99b33384566a568f1f544057"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_grpcpp.xcframework.zip",
      checksum: "b04c09eb6fbbfc4aed33860ddb928d6ac5f5cbd633bd2af812c3e51dbb2cc6a4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_leveldb.xcframework.zip",
      checksum: "71ee15849b4489fa6404b673b9203922ba0da213f6074de2d23f484a9556ebee"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_nanopb.xcframework.zip",
      checksum: "fc38bb24c37c24f1bae03025d9f174da5e91f0b9b5f3204b6c5ed2edfde27e54"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.0/_openssl_grpc.xcframework.zip",
      checksum: "b2ea34ee39924a8cef4c1c984cc81808e143ef4db8a9edd3f026ea7d6e8a4c73"
    )
  ]
)
    