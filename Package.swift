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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_AppAuth.xcframework.zip",
      checksum: "171574c83423f314b36e68a50ed2b7040cb1371e996665e214e5ee4dc67fd815"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_AppCheckCore.xcframework.zip",
      checksum: "0963286757a4ebc4a297e5fdd7f4d1860a8827c0edda674aa06d487f784711d5"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FBLPromises.xcframework.zip",
      checksum: "2284cd9144d57ba966bff13e0cf475031786f010aace07fb88f9b92fc32dcd95"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "623f94f82e3f5c39b05eafe7cebc2a9420d825af813c169488878296e22d4e00"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "52c446585f4cdcffb5a07244a246356328354f84d74f02c5aa1899fab9edede6"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d897b5ab2d5f2b8b867b7510683406ebbb3a5a09caebedde380d9898782ffbb9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "bddab23abe621a5f525c33ab4658042c696d5df9bd90f3738ecb240aa8896417"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a285168a7ecc6ba4b6f0e72cf6270102fcbb517f880f0aa979debbcd8183bd59"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ab2d25c89a91459e462a9a3466d1dd814a258446b800b6b1b2b75a337907bf51"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "91f7b0a0e79cd27f9ea0f25a2534905950c81b6d852b7350f10d0b71a232f103"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "ff284feb7a09922f4221524f55c787af07aa9f5499f7c4b0da9f12820aaa67f7"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCore.xcframework.zip",
      checksum: "2e4814fe594855b5f9deaaec49dac8bdf1b3d6d8971b376900cf0ce43c2b2061"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "49bff7f741cbaf3ce8f89621471f7ab49198adac94694491c0b77f74025d481b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "93cc3cc76a7d17657642863d5fd6100d3695c60b14f865a52ea6a2761b1d0c4b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c378d183279fc74fc2ac5a5e24386602d793c969508428ce0de19309f8bb3826"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "391f10cf73da26a39dea19ad2e12626aeaae28210ec7aba4833c59e3c138376d"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "c35b1f1290b29385cdbe34425a63b0743399ea7b894fa8cbad787b2b7fd58941"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "436c34491739ccb7a1e35a824be646893650eec44aa823435f0f874f5d7fc702"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ac1e0bb98b0462ac9ad0149a0472362c1d0f88cbbf96c13d72f4222c93f29f7a"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b07879c7e541e0133f9759b10aaf6d595e575b79b4e3c58e79fa3bf9ce1c4f94"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "410e9981972d7cd77e92c351260d6809b3c7a944017f050ac1c0956a79206ec4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9bb6924e618072ceb6a965f5312cb5ba2bdd5485787833110812557678b44a2c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4ed61db1527f1369b8828cd72b95b39c71261b1a9be66ff52bb8f35dc1a23d06"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "3e61eb910d698e44a6c3c6e36f09df6da494e44c17e627503d2f4ca7acbc0206"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c8e3af035f0c6b7b9e8eea6dd218a9a6e1427fa4b4aefb32a7f8997d5497a0ba"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "ffad35799fa8f7009a8ce628978c626db45dc8b2837c3ae16a944832deef9726"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "1df2f95681e399e11ace5be98776e31b0ec2481caf3adf7809d2d64bb447e586"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "7295461a0497ce1ed2cebd232d9ca6db39c51f9c028d4ee98471f3ac066dedec"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "b269e5ac33a5048551610483c87d5da5f44af2eb86b37a11e9a9f3302807acc6"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "883fdaad39e4e0dbd37ed844db64cabeed99e5db58c176e07b35eb4c67fbc6c7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "ee1521fdb39bd9f2457bbc133ec16e258ffe933e9a7cfb53420de238c83d78d2"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "7536de793fea59ecde2e8621654e20091a5311e4c31dfb394a3c140d3d895834"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "3414fe81e354be6f4f3d34a6216658c5440aac0d48791091f40a808d616d0fb2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "79884bdfae1f529069fd8ab181777e6603fe86879246cb328c0396bd86d72b9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "69427c444f27bc2646785611e29405429dc1cb6c8f4cc47b33d3c2abc13f897d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "195e4ec42561065c14429c27a99eaf330e94db9074f721ebad0176ae36c736a4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "460f64a7e67b0f4b77ec7c8fec493143b10d49d11d7275741bcde32edd1a2c37"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "a49e552da6d07837d42277680e49d5e0b2b2540095ac1ab9051ed416ee63157f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleMobileAds.xcframework.zip",
      checksum: "3d388034fdfcaa165dc595d437bdf24d90dafe4fe54604ffebc774c29530f1dd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "f7599fa391192c27880fc63fffd76ba1bcffebcd7f578d49897889f396b9b33c"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "d26be946289fcceb913e87cc90b2f513295006bbc2f2171d2319cdc14678d5e2"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_Promises.xcframework.zip",
      checksum: "e3704c96e4cac1a12abb5a7944c3b093b4e3e2b71c593e5f33d33b9c77bb3172"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d91e47c825e2be8ed25eb5c7f2164f0b7145721a8efc868cd679820b155c2334"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "4b490110f10e6e773618fba2e0ac2e3d34b59b6569ec46c4c4cc24f76835a7c4"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "fb4805ace8883c0e3374fe36e422f7b387c3663812f2537d101ba9858be25980"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_absl.xcframework.zip",
      checksum: "e818d6b77876c366841e18d47c2037628722e0cb6e5b62b829e5be18b95a5385"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_grpc.xcframework.zip",
      checksum: "9041e7b4c63e4393c57837c77a3336fc9a2e4bd9f32380758ee2ae0c114753f9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_grpcpp.xcframework.zip",
      checksum: "faad130e5794c271aad2b4ee811c98f14e87cf1a8ea6fa3f02a42097494b1f33"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_leveldb.xcframework.zip",
      checksum: "be9c04acfb5752d791571d5fbd1e253f4be5ce51c556ac2193ed15fbb7daffec"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_nanopb.xcframework.zip",
      checksum: "3f4ea505f3db08233aea01d07fd85ee1fa9e59fed7e25c57eaf951b6e3f25b62"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_openssl_grpc.xcframework.zip",
      checksum: "e674911764db82b77b7dcb62b90daa621c9a3cb6acfbab5a7b01d452bfbe50f6"
    )
  ]
)
    