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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_AppAuth.xcframework.zip",
      checksum: "bccbb0398e51470b901a5ed8d225b672bb25b45d282dc5fae7e64d2e75476505"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_AppCheckCore.xcframework.zip",
      checksum: "223da2e343c169e3685a433b54b07ff58fa7794274b8981c05d9a3ea0aa20aac"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FBLPromises.xcframework.zip",
      checksum: "d8dbd18df80b7637f8ca791fac9dd5b3052b707ff3038d24701c5d31429d361d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "9a9827b71c9450caa92fd92658358f75d363f142736f97396c3118fbd17779aa"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAILogic.xcframework.zip",
      checksum: "139787fc175ee73ea10d037097bc833f19f5b6d793a9af8239d6e1c6a86765cc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d20d3bc78de75f7179a8f47f472da3f2aff9344b0e1f6eaae2a14186e16d0c7d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "1be560cb7c61d0c8dd193de9e96b81c2327f977b619841e12d01161332a99298"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4a81681447885a12823a9638061e41435819bc764aec9ce2b56a28c8f4eb9c31"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d45ecd92e44aa6f315b489f74b6899dc001710cdd85ce961bd7dff2cf11fc542"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "27fa910d37a9d58e93d5d4b8bdf4cad44411a81479c19924f841e2e554e3bf4a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "61ff463956e1c20dcf14b900ed02f412efc6c3f043262ca3a7d81a0b6496ba66"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCore.xcframework.zip",
      checksum: "0cc5b6dba37fe04f72ae52c426cc2f4c1fa63d0d20770a5d43c2daff3c878c6f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5f1c94b2cfb9d14907cbaaa86452ef100b97c271aea0e87a22608e33819bf7e2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "a3ff94aef3ddd0f509dc95b3278174b2b0260bd4fe6dee9329f0ea3ee2813ee5"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "179334b09393770de2f08e35944b779b158bf719f746dd1546c4dd9e565d56b0"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "293ce2b80e30ef5336a7470e02a61de080f23bd854d916361c5cc7111181e9f8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ffe5f2e380eb8073e6f572a76419afc21b2669c534833258f83e658e1210c42c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "894105453c45463393ba03bb84c98d5562e8e1d74169160d7120a02caa9ebeda"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "90499b53c081a23035ddaceab0a1bf6c7f6ed6013c037db55d43560ca3c8a2d6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "d45b72d6a0bbe57e801fdcff6385d7e01211d46850644050f3818ebc062133da"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "28799b20ad5d4b8f58e2ae7f68bab3feabb957951de3e01d742de1994f894d5e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a3a540d2832c645b84e26ca63763dc99868039cd5abfa00288af8778079823c3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "ed07b0b0254ab2c14b4e29d9fa4e040d7bc74ff35ef1b59e0a720d4285997b5c"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "4129780e5cdbe9a73fc1ad47936121c3413b733bac3e9bfe81d479a2806da3e8"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "d49987735c6bba5bd7702f3fa746d98b1d317a6053ef826d37e2f68f367ae752"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "58079b27cb9cf416fa599d6469e328da94006fcd0085ea623badb2b94178e68d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4d3570c86dcba8151b1a7a6dad7950d3eb05fd4f497a62928524d1dae87fb0b6"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "72d1a0d6079be2f38d35a8e6d71504f2c778b6115a5107e6a2fb0d0e3416f521"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "38826907d63a4a6fa3dd08389afd31f9935aa2fc79c7f74dc5376451432a713a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "c92b0988ed3cd95f23cc7df03eff906bd94866a639350b0543618dd6720f0cbf"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "82c55d23e740f12d288ff1314a8adf9f994d12ad6fba2d3e5e46c6faf449432d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "442c86df1970a143058de98516f3da11999694cd08a6963fb04274ad21be1a8e"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "2c85b78bd7b63fb467a40fdd68dedbb1f879daae263be9a98a1ea2ca19fa7bd7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ea3e79a9cd98d22edcbffca2afd9dfe5421bdc44a6f58b570b9b24c606a1e265"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "bf584c38ffda80d8905f0a5dd5d7448ff6c71a0973d85bf199d805ae60da2018"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "6270f94634fce269b10b9130bb4ad9280dc768286639b9aede161cb013fa41dc"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "32cfeb540f753d47729eb7c39e6a59c399ea15ee64246cb908b7ecb5c7ce723f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "cd5c86baa45ad3cb3f658976877fca39ac7083148f0c60499b6655367f98cf8e"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_Promises.xcframework.zip",
      checksum: "8ed8b886bd6f5282ce3898ea095d1e006030e1029cbdb186d32359e02a1f0b69"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6e43ce80f8916c648cc709449b57054460bf9fd74238188f56db7fb1c672656a"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_absl.xcframework.zip",
      checksum: "0f28b8b88d4098836929bd0e70c7508f1b238d0dceb671098d0c470f20e0aafd"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_grpc.xcframework.zip",
      checksum: "8443f0c2c68109b30fec01b9f77e313433b30a7f72ca5d57755bca1603e20b38"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_grpcpp.xcframework.zip",
      checksum: "0c1bff07fcf033065a3a23eca96c7c2e11032298c69c5bc50eec059e219c0aaf"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_leveldb.xcframework.zip",
      checksum: "85952e1127264b2a179c2ec8d5e7440709df6bc50d1fe2442ce19374a6d265ea"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_nanopb.xcframework.zip",
      checksum: "5b6e0bb7e8dc3006d29ebee9da02035db060a70b2bb1d62adfc3698c1adc7591"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_openssl_grpc.xcframework.zip",
      checksum: "5dbe47102a27269613a9cb557468e7eea96e82a84ddf2de3bceb3e015d76d825"
    )
  ]
)
    