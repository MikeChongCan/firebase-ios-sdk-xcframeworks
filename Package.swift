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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppAuth.xcframework.zip",
      checksum: "c2eb36f13d3f3119691462403a77211687d3d97d62a611fc3100bfece8d843fc"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppCheckCore.xcframework.zip",
      checksum: "8eb7e909ee7695cb97c4459cd37eeed2589c43404a45ff29fad6ebd5b3da7a2a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FBLPromises.xcframework.zip",
      checksum: "cf6b4fdd94299260713d7ec99fd07cdbf20fee14f709530f1f3e113526711ed4"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "df6311ac4fd7916d5a64395ae224d637bda4c63dde013ade87d0b329aaa573f1"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAILogic.xcframework.zip",
      checksum: "3ccb282c65d46b2e509502ff0fe9d640325c9933bb1f77d030af654994db9a2a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f80ba492c85431426a2151bc93afef9173d5133df18ec3300f0c014a0e63abdf"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "af0299f66cdaba4b33afae4aa5ffd84e4b453eecf5fae9569c4c3c0d43fee7e5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "deea5feb22b38aac5ed8c6a92c65a4fbe46ac5940899e453354480e597e7eb19"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "bc62791ee70ec51b5c208fe246e271e27704fcdf4cbc41f7ede55337d9c2a62a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "97fe72a90c4251bea1f2c270857a5e7943f20fdf3abb96b39b09016498f8ffd7"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f7e0ed1472fa29c8beb7ab376f4c2406c724b2d204dee855d7653bc40d4abc2f"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCore.xcframework.zip",
      checksum: "c53aa12f35f8ebf1beb85b339a756fd7666ce8a60a782e3e80a23cea9e3dba0f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "01dbeae443640be887d98fd5110dc6ace5c23d6ae752b608977757539147307d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4fe88344ca90182522b63db62368f70b5c0ff7991c69418527f1b3499366077f"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "4ffbd8c81b2edc45b7c1d94110595fa6b564319d5aad39a79fd10c0c808ac2ae"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "2127272bd426349cb8b4a4f0911f2f86db9fe1c8267a5e25a8dbbd37ed427608"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a3d233549d7e5a8c90432f97a523cc348bb50921cf547119bd46fcaf082440d2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "f0e390e1025d32517d69ee863590fe1600e3ae01491482183c3adc7909f91fd7"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e259f00e5c07aacdadcc19da0bf9d06c2a31660eefffe86756d014a8a38a0afb"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "26347475fc0b406ea53933167866814111a31d0e6845897b82fb3f31450c9ab8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "234f208c4d6256e2ccf96143a9d9e089cf25feb5cdf433b9e703b80b5d6a297a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b93d194ad4144e3f6b652d2636bb3230b2071ec892fcf0227020647c7406c7eb"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "16111caf4bc27bfdb5b0f238424b9bf3eb4fc09f8b940bb14720a09a912c9eaa"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "8760a58150e6808587079eec40d4dbe84f60ac1742d9f70a329954d0f1974f83"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "c6f416a132baa558997e317e4a12702bf63820bfc0327947b72e5e383be0fbb7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "177af6dc2147908f9e6e89c50f118eaddc23128f17fcc866be43a63ddb071309"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4fde625ba6b7ee33a27cb481acaf321b351e3756cd3e05de8fb81846ff9ec5a9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "a3dba7edc139f2bc520f25355bb139a9e7bae023a54dbec25a83826945ecd297"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d2a1fa7ff772657512372e1b881d9a4aab394512cfcd7cf0db029803dfb87b18"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "c0589be3eee16fed14de77c08153be1a7a8629236b98eb00009b66185e2cfdc0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "738d707fe97bdfea369090d712faf70acbe80ea04f84a1657551ae5afc9474f0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "06c8a8ec40542af308be7e1c42ca527ec2d82c353ae19be088cd7df2bc05759d"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "03e5995250b7803db9bb23e9b93179ab05fe8a0160e051994cf6a3e725c231ad"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4bd0f2c5cda21ff70d0676065743353300c0080d4c47a6ad7427dba59119a29b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6e242e87eb84c2d086dd3ea1a347242e2d5c6296e47e3c6f9f08dece1248b4f8"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "078d52b5e8751ae124a2da542d3e4abc0a22405e75bb431c0ff8478a370e8fa6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "b99238467cada68455f0510f058f973601805b100c88c4e850cb2c90bd93335e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "d5f39a22803141efb0215a438fbc783fcc5520f7409f0514ca67ec8d408655da"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_Promises.xcframework.zip",
      checksum: "1b325e1757edd22d9e271b1a21247549519e7f27a645b4ec8542eb64e78b4937"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "420b108add03ba69b85cdecbd35046cf8d344db3fcf55d14ea45268170180f5a"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "4ce9a31b2672cc52262554ec8137d810e29c78b61426b609b919a865dfa79ba1"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_absl.xcframework.zip",
      checksum: "097bc1614760b41960b4b5ed754f7ba2a364b3fd3301b82d8b4d4f1bb1b6273f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpc.xcframework.zip",
      checksum: "7ac090cd086f21532d759df1c464eec59cf51f3256dfc16f9d816d866a76a282"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpcpp.xcframework.zip",
      checksum: "f045b8e44a8b11602ea8b759beb01fa33560301ff4fc9f20c40443e5cbc7e1cf"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_leveldb.xcframework.zip",
      checksum: "844d2d976a6b11b5b6bf92f0be3849ce560af9515f3f78a5b2cf68029f74eec6"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_nanopb.xcframework.zip",
      checksum: "b0a337de4f0d59be5b6fbdd6d25f81aa09e43369950a06a8c0ba1529a92243a1"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_openssl_grpc.xcframework.zip",
      checksum: "aeb80056e1fd6d865f0ef433ce6d691146407984be2c945aa2213abe8bbd788c"
    )
  ]
)
    