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
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_AppAuth.xcframework.zip",
      checksum: "ccf90539ff3cd798ad6c219004c3cf1784b4d678c8d60fbe195437195755c7e0"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_AppCheckCore.xcframework.zip",
      checksum: "dc01c20574a4bfa6fb21708cc7f13b070e4a810f6a00cde3fa3a83b0b0e541b6"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FBLPromises.xcframework.zip",
      checksum: "76622a47ee59da78bdd877c74a98c6a980f72229d2bbf72b1c257b0180b3c091"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c9d933f11dac829741816d4240f268eb200c2be4c04eebbf032be307e57403dc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c0ee6355260a313b32d68b9d1d22d156231aae4cc7ffa71143a51cd4bbc3c72a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "3ad20ddf24645090a51dea2a0f493bfa6d650c38af594abf52bc2e06708e5471"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "a28371a7693fac4453b62f24f73c141c273c0ee1182c8485e509df4c59266d28"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "181931c2b9120d6a93b0e5aac24dc9e9c68e85ecc7ab3fee577f218e17995113"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "8805ec5725f09d135cf77425a551f6634aa754bdb6d3edef6a9fd0671d15cd3d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "cc0fc8ee3ce8f3659cc68c6b1cf895476e78adab6cefbbb5a4b530594c60ee97"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "244e0ae99abab71cc60a445cfc5ed4e708fbf9a499e41413f3be4e5eb88656bf"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCore.xcframework.zip",
      checksum: "944ea0dafaaf364b31544691607919a5b530ac516a9c92cb53c156c02e0cede6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "0c488618e508e1dcdcedaa3f6b164f5ec23b1c189c942dd5f611d1639dbe49c1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "2e1f49f76958dcf914a638f0893d275955e8ec9de7717eca3df2516031a64736"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "9a1efb3bf1fc5ef52becdce218434951cc4701dcd45f17868bf03b702caa17c9"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "52f691eda340bea1a4d98e227390d4c81a325a320b4fb4c97b9591e0a09e78a2"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "d129ad96bea4adc6da1663e368ccc55aea18efd094c1d5b124124da2b3003603"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "c2ff1f00e6ac1d02b7853644830d429a599539a803f5e208e84d1fb067172d13"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b672bdcf9586511fc05b861126caa984396cc85c5a0174480ef162b2319aa7dd"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "644db24a68f35694e5e1b9e2106e967512efc12eeb6c009ff84fe9a0d0713fd1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b733fb2b94c4324a04127c69c94657c700caa8c6ced9bbee31bdf77627fcbf3c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "fd75fa43c1f02a32dcc1e3d41f9bef9ee23ef36bcfa252b7ae75b5c6a42d71d0"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "302060a061f5112e207695f7391ea32540e5c4708e1ce06fc2ab3cad2f9a42f9"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f9232d63aadf22bf9703fe788f228b1cebe94534b9ef0aeff21adfa5cb0c20ff"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5df2976ccc818da677179698d59362842e4719b8a3f0c7e1943f1cf6d3650e40"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "1971d6cf8bc588cc7e2ad4be721fec3751900e8deeaa26c105e141531e8f588d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c934e22edeb9f2cb7aef57dd5922e5ce38d064990483c774f8efdbe4d670176a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c52e077c57224351899c8a002d4669354ead2d2dee71383fd3b46bfaf9584f1c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "02d514e996a020033fd718e538d88cc3c0befd94f5925fcb36dc31f20b9a146c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3e333aee0487ec852c308fa7bd99dd05d5bb8b6292b4a361dc23a9a639aa3194"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "899d11316046c045d62383b7a7cdf6b6e2b3ff6e1853c1d96bb86061619cf5dc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "788352eeee51b143e9be5fc5ef61a345a07a4e7d968631aec7a124385112dbbb"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "83c74083fc1d2decdc97f303cff32c77bab64d6209c657c611e28d4cf8a39a81"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "97a70ad7cd57989da42861c1ec30f463933f7ba080b6b0489a048dff41a0d452"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d5ed0f455403c2bcf73609037e45571fc45e24a2a56d518c95276d65f1568cd8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "85efdc50573de5bd0daee4c6335862ccf1b9c1b8309c07000610cadef1de48fa"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "bd76e612d7856a8589b1d661bfd56376f28521e7f2196ace40f256d512d7620b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleMobileAds.xcframework.zip",
      checksum: "409b27fd5a5b27d7e1d603d78ecc0d4f0b9ac061a4d4bbafcff224d6bc9f373e"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "4194bdaa37c310fdc317232abcfdd8073c1ed4f9a38cdce0671f009c7c6f27e6"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "1813ea4fe225d33fc3d7fe466af5544c480e34bf857f2bb590fee15feef3fd3d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_Promises.xcframework.zip",
      checksum: "07743186fd078ef6af6cf84c51c3b7b77c55540a908e0901159d19a701902730"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a4f49645312b22cc51d3d344db6e3d1ab3ae4216e7123fd2cadb3c07dd7d7742"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "5ec92f02402216d3f23e8ddf6530f97a5cac2ba06c69b1146dac316c682741f1"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f7225b2b458795265ba12e681626b535d7a0f740a9b51e9833c64f1c8831566c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_absl.xcframework.zip",
      checksum: "8e4a6ace16eff649bf9072fd0335904aa5c96d3b8f978205c8079c2fc210ccd4"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_grpc.xcframework.zip",
      checksum: "e4d343460c7c5e283aad5cf7acbd82d698c43d27429826e1a4a0bbc972211df5"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_grpcpp.xcframework.zip",
      checksum: "9443d4ca088db288b12046af8fd54ed514797611ad035c51d48e69dc2169b0bb"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_leveldb.xcframework.zip",
      checksum: "c56cd59e882ea65f43eeeeca5dd142f10923514fd2120ceb7c7aed9b0167fad8"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_nanopb.xcframework.zip",
      checksum: "576eb9dbdd96ac9e852268adb10d8ed27fce5808a022ac2c2d15d46885544cf5"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_openssl_grpc.xcframework.zip",
      checksum: "c04f200a879a492409c28fd68177b2b2ecde7459ee4b756e75816cf2dea9d406"
    )
  ]
)
    