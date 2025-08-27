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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppAuth.xcframework.zip",
      checksum: "ad178c281b66b1272f40552824fc7269be42a9a2e3cd94c0ed34cda92c38ac8e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppCheckCore.xcframework.zip",
      checksum: "f407917e6834f81a886f5bcf5d78048d1d9d0744f00c4f7d2b138c0ecc1c380d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FBLPromises.xcframework.zip",
      checksum: "5ed2b7854efd1ca3a31f51e6fa7697cb542052be1b7049f54dddf8bd4358dc2e"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "48fe27bd863df7f6122414c4d430cadb7f0f8f953339c2128db4b07ebb88804a"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAI.xcframework.zip",
      checksum: "cf2f79658388a9a8392db04fb17e9c6db88172560ea4ef84c6010ca2699b209f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4ebc439e0682aa9b37a7e14f7c68937e7076cde6003224673644558c1f39930d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "566186f687ff87ee5c8b25d8c93925b5d2d68a3551ed507a0f64255533c55f1f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f697408425a09376b281f386538522a5fbeaf0fffd7322e76fc260a75e9f17fe"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "87f7f182d3c55ee852d66436eacafb26f792b316c6f625cb0b0ed434c79b94a4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "760a621017a399cb53e1e88e0972702ec5f000951b1b0b4d76ef0ac7bf334aa7"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5f8fc9fadd1e264e48903c4566638fd29cc012f9dfeb4a7c47b214c4484d37eb"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCore.xcframework.zip",
      checksum: "99df36d3fb7f734b68c692c19e36ca417c5f0d0e437ecbbd365611224b64c254"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "26c26b48dfd37c392a9d299244a80a4fb30c7380bb05fb1a469881080d33fa9f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "da16f4d95f0c575c889e2a1e2ae8ce1d14c94cd9badb1d00d8216397e86adcd3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "d63a6b3a6ae1a167878fea4a9ca623c911ca716554d97a1b278fb0a3baade6a5"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a2116beafb921c788c6320bce1d6d3221cff8c0e2df24c8e139a8b9373d523b5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "7184b8b724cee3f9f956e926f45431a54c2617afeb9fa62c3a07b78291c794a6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4a208473ecd555d2e819a29d354987137b652396d58f9eb337fe1f42fedb89cd"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8bcb62308d532f07f5aa7abf5398a1967fb203bb455f6fad9b4b1b5b196b1072"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "00c8e465ebcf1f89f00723bc3270e805545524dbf3b1f3b730442ce09e6e25ff"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "0b115bd7eef9293eb75e0c1208f908b042867d4952ab43cb8471082f017a7f62"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6a233d05e89957622c4afd95981c567df83cc387ceb61f1e02763b9908f32898"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "934ae0848bced4fc971321f07565771e93852a6faf3411574db6c1bc7a103be8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b52aa2daa4b318353cef11918146c3b2f47e54e3be03422d0bea73e4200c9f86"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "42d070171e5bb4e7e1431bd5eb173d0be5a6f06d55b60297131499b5bfbb0bef"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "1bbcd02b3edf5c591db8375cd8e338a633e60ac0440a483ba255e2df82c1f43c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "2908d0fdba9f010bd49e48cbdc3f963301df1bdf328228e3bd353a2fd60b45a5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "ef0e47c9b6101caf2fe2ff02628310cd5541bb94b9f537ae783369d4698e5ebf"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4ed4741df4dcc880c64f06e332a47c10051505b279c065ab7b23d47f68aaa8b7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "43ee8fa4781be23a6455725b00e0e92e7afa8faac56753e0597b0bc4cd8974bc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "53a1600f9aa552928d1987eae7898a682a12f8a77059ad873070716f38102bef"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "19d37f3e5d6c074f36b4386e17eb67814ec5d1fdb3447ecd245c156ce414199a"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9049336e7ea07eb70294b8e35dc52308d7fd4f66f1ce4589d1fcdedc515fee36"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "428a046381103a1b96757b1f1f70e2920e90fe68f564b34e3c15b29b6a6c18d0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ccba874aa1f802c768a2726bffef58b7c7402ba91ec375c01a80a35d9ac69faa"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4916b03e9ad9022bc9429844212f7c021766fa89e7e155ec8dc6553fdcbd3a5f"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "55d7fa463f5364d6192ac664e67c15f7217c4385f69ba396484f75d8a514e50b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "ab0ce2b2e8b39f705e79594976e04ed4321ef34207e8d6165967735f436f7997"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_Promises.xcframework.zip",
      checksum: "59cca481612a9789b0ae89121e5df327569cf99b2f0fe4baf4be75e1e338c987"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c3041681e59a50e12d53831bbe3abd00008230d969a76d9605d4037166b1be32"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "2c03cd5361326b52178386d1e1fe58e6d2acdb0aa1d4e0b9b537b2afd2fa1ea4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_absl.xcframework.zip",
      checksum: "5fc5da44af8823d537bba201f25545429a0fef0c690439610ba89ef182bab23b"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpc.xcframework.zip",
      checksum: "1f8117a3cb27b9a6e46544de7a37cca79bc334ac09ef7aedb38b7790d05d3d9f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpcpp.xcframework.zip",
      checksum: "e741f5ffe2214a9abc8c3d69ab21e3fe68fbd4a7414a3747e1eec047469fabf7"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_leveldb.xcframework.zip",
      checksum: "1770635b80b203a59b2926303d4ebea9326ff42f7b2f6e9e740c430f898cb1f2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_nanopb.xcframework.zip",
      checksum: "6ffe9512abc6f980a685a0f10cb295640f46fccc16eaeb1fbc1ba99493672b5f"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_openssl_grpc.xcframework.zip",
      checksum: "2c1178c82b786f888429f9e2e5b6b6df6503350ea05b00fba784317e23b5d6cf"
    )
  ]
)
    