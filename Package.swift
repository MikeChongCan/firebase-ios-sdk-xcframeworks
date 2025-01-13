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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppAuth.xcframework.zip",
      checksum: "6520857bee28fa16b7c019856e3b2493a96e509b2062b571159d6c0c423b210e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppCheckCore.xcframework.zip",
      checksum: "2af9843e4fd0318015b73de921992777962418c88ba504c02b274f5cd69752e4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FBLPromises.xcframework.zip",
      checksum: "7f73ebfc12dee832fafe692d86dfa943498c6d419a8e233d86c427d561d5becb"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "3e0e2afd507d00e9b9470659dfab12dfadcc88fddde722d34a3a0b9c26cd5bed"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "84fb72052f7329b999ae6109196c05861e1136282bc3a494f181a3c5cb5ede33"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d30b0989dbdb05d558cf3aca2deb037a094512adf2440ecef906aadbc3dd8386"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "0f909e42213981564772e9b5a86048ce3260c695a12051ba278b3d9cb3380430"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a4f68b6a404df8b501f6d68208e5dc51ddc2eb5cff599c76c2f707e041b39294"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "fb67ed68893409168747be15c83054d0054acf8b9dcdca2370948a4779ea3548"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "dbd40e55c2d4adfbccc2d22dfaec77db7920ef33cdfaafa79c9fa6c2d15757a4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4279130538c9b858921cca51f7251a8a27afaa2286a1e027ca8da9ffe7472dbc"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCore.xcframework.zip",
      checksum: "5f71f14c4ad521f88d7c77639bdaeb862fb3e99251901137b6c4eb10fef2717f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ecf85d3877e66081f538b27588e729eec9e237014eeb69e8e20ec59f37edc2ea"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "beab43048b3cc974c46ff3cd39c963b1a5cff7806322270063c1fb8f51b64bf0"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "026ef1ecf29720de5dfb95f32e5b5623e848995393ee4161f4e4df02d36078d1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a8635ffcbeaf8651f6fdb57cf642cae2078cb70e9d7c2b68fad06c3e0732e889"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "de4dfee5802d81d53cd36eded8d49b89eeb89b9a9ee7480260696e0e765d441f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "32e044cd1dbe7649859e760df84b99502d4b0e5ca51f58140b0ddd0f45b90203"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e1eb31185d174737407c582549017c68c62fe5b456ba3c093af8fd619f3c9c22"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a773384887be8cbd08ea8434ed962866408cca55740566146c085cf8baa3263e"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c9631e28af12a823709fcc8de401218a6a2587b0d00c4af0570fbf87107423af"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d3cca7acaeffc1b69719b6703a0af69a896319de6664ca3aee5c6f8991249bdd"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c1cccbea5e2d0eedfcf9aecc7d23ec3835df553a8bbb9afda94833308f106171"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c0a77e7b2f8938c98b5a0a5b625a0bd57146ee65d557c747a3e2b7b5f79eb81b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b09d58d46d19b6e860399014b1fd2a0a8235f1b96b05f8ce0889de2c412455c0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "809782da0d3cc9e528717e87ccfcf059c101db88c6cd0b5f27bdd310fa060fbc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "48f16f5ed50bce5d51c5595cf1d40f0cb5880ddbe8622951a46de5a8e333e599"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a1b912785a6c7ac4588fb7d4e966fded52da89952c60c8498f4f61dc9722a422"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "2e1ea9784a9926a2f31aeed6b1779831f01593347d0296547cd9ec5286e1471a"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5c1ac12d1c8e5d7514029f16eedb6967b630d4203de76bdd4d39fe994d43af22"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "f06ceeae42e707fb21335575f71f99b3e34b4fc85fcc9a9fd74ba80645b30637"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "77e813e32202935019557d2cbff5b97c8a689c5700664029862578dd1138b0a7"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "50e1e67f799adba36aebb92a21f9f891b2daf448238a724aec0f0e5e6fd82552"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "c5f3ca6a515cf31a8a95f169a36441af546fb5c64a3b0b10fcd1ebbe361a7bc0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4dab56e74dceb60f988d2260da0c9a8ebaf2ae0ba7f00c379f86371709704a1d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d4c9449798d8e1ec20acfc5e4e372ac3423f1fc686be16759f94fdadedc1868a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "602a4945e33da1d4093e09ed15be22b840e206e467663c23b922784d678b917f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d7ec023c22b0f1e2e4e80c9ac55efa099c70350e6c3d03cc8345d5f1b2c76a61"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ecdc6f5e2025322586016a249ed2401dc45fb5d0b158829d49cdfe95bfafe2e1"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "d02e723c59e9772d1e923a4d61d19939ff4355972ff3572271f1a2e602c04a21"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "b6edff68168307933cc3626676aaaa35ff9a2bab343962cf012d08656ebc18a7"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_Promises.xcframework.zip",
      checksum: "771ea656c4968ccad77df2c12631471411b8f3c4484a3d0e29c456a130716d11"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3f415b75a595e6eb2feb36571366404996d2c6ee2044f6f5c8e4557e88aa1b7c"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "5ed97782b6955aa032ad4ceff321349013b6ef8caac139ab546ca468869cc460"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b4a50fa7d3300b038a1be301c6cd7cc5a4fb8b8c08e717015b2c5bd22b7ef726"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_absl.xcframework.zip",
      checksum: "050af3165e2776e6f58649dd1edc800cb981bc7eb45c87af35917ddf3022062f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpc.xcframework.zip",
      checksum: "02dd01579a8d1103e7e3de2f2203642db23f784700daa0dd712f864976e5721a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpcpp.xcframework.zip",
      checksum: "500f6d9e6acc934d5820e15c21cf39ec2375c5536d9f6618f1cf044ce113ca3e"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_leveldb.xcframework.zip",
      checksum: "05c6acae2c78ecaacdca949cf1e90b3b183b82c0b6dcce1b12801b7f7a4c8827"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_nanopb.xcframework.zip",
      checksum: "4a2676949340cc319e9de897c35ebad8068df41882de4edba36259a1082b8c52"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_openssl_grpc.xcframework.zip",
      checksum: "3f051870b857c2e7d7efce49d91945a5f836bd105bb3ea62babba7fd83bb468c"
    )
  ]
)
    