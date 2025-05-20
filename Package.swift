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
        "_FirebaseAI",
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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppAuth.xcframework.zip",
      checksum: "76e5c5a2c65112a24bf7ad2e3822b5ea7972d3be1b71c4206d70b361e070236b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppCheckCore.xcframework.zip",
      checksum: "1a0bdc149809631467e246ffad38ca2b80e4ddb151dad4c89d32680568651066"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FBLPromises.xcframework.zip",
      checksum: "2ae3ab986e769f3c79df2f176b405d65d5ee157e3d3d3914369b79651b599bd1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5dc996e75694afc35ba957233bad93121de52ab0aa031dd09d304c59d36d1ccc"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAI.xcframework.zip",
      checksum: "58a6cac614276c10bf559cdcff62a7ed318e2eb344f81d609825a896444dfadc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "386372fec49e6cd8242ebda7a0c1044bc322151ea1611cc20ff14a45ddb01fbc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e164d95c6dd9eb1d66c860db8a0d718a114339210054077ce34996c8cc6701f9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "b484ab881a9d751aca55dead5a471aeb291675016434d0e2e85c40893ebaa9a1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9ca88cf9ca45f13b0d34436671553134cb522ff7ad9f7b5582f9afd8961f11e1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "7e83e971355e3ccea03a1c943953f7f15df3b0a047ff9559a65f3220848433ac"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "871656c18d5641c38ed6f7c5dc2d98fb576b66aa70cf797de8a8eb7624763516"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "dfed863dd6f046fd7e21916a14f1c4f7bd946fe524674e1eaece370cbad85b40"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCore.xcframework.zip",
      checksum: "6bfdf9fc388b40fc717bb32fd696883996747181e7b8ce7db760f840650aadac"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "629f298e8dff3252a9e4eef12e0447dd50dccf42e400c9a4b3c84d2b19aec2cf"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "48d7db58526a8b342aca635913bd975887ca200eb77ee656027c090ca96a4930"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c3fb8a6f04b558933a230a8b74bc7c4a3ec91836307d103b80ad5f9e4d25f988"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "44ed457cc65357b859135e6b68a3e7572de4add44288e4686faf167dc19a6835"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "5b779f146174748945e124100ad01460678bffce6f4c3c9650774742f442f195"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6f778d1c15ce9571928865c0116a7d93ba135cca3d57f07174afb82300e2893e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a21f86d9ff6f60fcde48e34a18c603e0dab906c57e666ed5f00154348e428126"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "fd1e65482c6a6da1b1bbe01aa44b9d6075bcb4e6d561f7177d1af6a6986eb4e0"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "f4d8b8d872cca8b576c1a848e4091c690c2ff29dc111c2931340e848047f86a1"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "059ce43c14b2c59d255b3368c8938e201f6613fa12ae5ce60975f565cb9dc75f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c51922cde2885c44eae891e36cb1ddd19381529345f816c559d16d689306045a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "caca16628f578734863b47528c965f1eefbe3b73299f7ba3e4a3cd88d00cc5c6"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "3883057c572deed5fbc06602dd68bd8e880cb7dd379a0340958ca6fc982a072c"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "3f6cda242a68e5ea3b4d342da5fb8cd90baca771c68cd59778d7034b092cb8f0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "6d034c46a9c8e03010cd8b815f34be9b484e8a4f6b90dd42530cb59eae97522b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "3a37bbd768270d704b93cad3b71f90f6f135f87e504404b7e7e430c6354395ee"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "e387d20c902f410ec4006b879e6e6dd123680d22b1e2899b5f36c611a668f04f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "79d91633a99a3dc663b24dc82504b4d43dc72d6c3249605dc6acb9b8a119e980"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "5cf86463dd9945e992298c3a60b31565c1b0a950b1a0d24f181551c24da553ec"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "d766951f209d075c79d0d28edadba416add4b71a1ace48026e40f3a8c0ecacac"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "cafbdf8107d93ae3d627c1e241b2ce18944e2abb43e8069b69e9cad841c71758"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "0a3e62e875d8a654805cfaef4d62700ff384176c3e008cf2f72684b0de2591da"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "bf201faac879e3908d31b9db2c50604324852700407a701ca77c267391a10053"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "36d2a44a956a6daecdffe4c2d44e515bb17f84304b6dcb57fb66015880063233"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "9cb76dc213da6f5884a26a4ec53d420d43a944530d7d350e65fefd99f00fc406"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4448a9e6c8075382d387c802e602b762c8539b2224a819451dcfc770a3fd2b70"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleMobileAds.xcframework.zip",
      checksum: "1c640ea464c293255c1c164ead253b02e16a69c3a40d8bc3b3593643e077b902"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "5f0545a6dbfa85318002ffdfaa6a73e19a1dee3e90bf049e83ac30a32ac376cc"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "29692ac7a53d3644e01fe70d9f068e5855f058a9ff2e5a33652f3c37e438fb76"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_Promises.xcframework.zip",
      checksum: "c05ee8f8ed19f5f6c34131766bd7d006e526a5c1481942fd8123084d0a649008"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "b539fb3354c75e7534c3e41accba1eda61f30184f21cf2b5a944cb84df8f0ac5"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_SwiftProtobuf.xcframework.zip",
      checksum: "18a2c34d168d92ea1855999b3b5d873133b94e803b691f46dc1312498d7493e3"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f615d9a31bea487d552addd99e991766c5aa11d634dc7dec82faf0a9fde7719a"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_absl.xcframework.zip",
      checksum: "f286ca9a562fb25ba842681df1fef0987970fe73b95737b24af97ec5fb383429"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpc.xcframework.zip",
      checksum: "179a4a6c10e1126e482a7550d0962008c82b18099b4402ca30f3798a5392e6e3"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpcpp.xcframework.zip",
      checksum: "3a2305441354bf92c9b0d8fc8b2baab295adadfc51d93f9c3dcf800f6ea76e7a"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_leveldb.xcframework.zip",
      checksum: "81dda909dbbe7a703d79af6bd005d24f92b0ebe145bd0063f9e42c91370ff564"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_nanopb.xcframework.zip",
      checksum: "34c6d6a8c22df588c6d757dd87cb80d59969401552c7bb9943db90518743455a"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_openssl_grpc.xcframework.zip",
      checksum: "ad4b923562e5b72579a8a0725cc47292b94ea8a42a2af88cee01757bdfb97757"
    )
  ]
)
    