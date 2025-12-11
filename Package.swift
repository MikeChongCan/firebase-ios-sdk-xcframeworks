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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_AppAuth.xcframework.zip",
      checksum: "0f5cd1d8d23e7d05a7373e2b5ce19baa8e3769315b9ff0af4bef34d60bd520bd"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_AppCheckCore.xcframework.zip",
      checksum: "8234c71424582a53fd94157724a34a82af584390157dc4106f7b50d9a45514c8"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FBLPromises.xcframework.zip",
      checksum: "386599af77df16be007a73bb14a4ae415bd36b5500d0c96a6cfb67c534bc5ef4"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "f30bdbef75ba3cdaad1dd4cf9a4709b1c7de1b720309c1f016218886dc45f7d3"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAILogic.xcframework.zip",
      checksum: "1df894dd33c22545b5ccb1b0d877b217eb6eba0d5c685f4c4cd1048d91227a3a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "89bca704132c4d91907ae36eb9d595025d5849c1f9f97fce06b909f550b3bed8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "33b379babe62d15a387eeb7f90b88f2fe66387bebafdb59e26255f602e2c37ec"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "657a97ade585cc5490fd6cc88c3746c45c9e32ecb280d281d253d20e2f86cebf"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5b60128fe83bbb95f5d925df920c727a944c93a282dd3ac8bcfbc5571ddfffea"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "cc22d142c76c7fbdf54ac356fd9707a14bbb5471d9ae8cafb822b923c49c021b"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9e2ce97bf6122e2a2e35c1f071e1101548c047b3514f4701cb321689d9661050"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCore.xcframework.zip",
      checksum: "d471e339541e804535f64ed9a0673d8e437b94ea5b3466c00ff9f5f7add855df"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "56c8eb5213764b8887a2967b57fc8bf10db199f86659ee0e5b266828fb210c18"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "e1391132ddf6bf31924666bb31eea7aad7ac4bc4417a5d64a044a9e22a8213cb"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "cd9710fc0f16c25659b210bcb4fa485d3caccf994d45f0071e8509310e28a280"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "e7bf1d8c62b61a2108055017bfe4ae32d3a8a9332c0ceab35420ca9dc811c1de"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d60436bd5a7faf4b2eee640ddad2aab7317e68d4c994c4d3590b2b574d8ae6b0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "35840d4f172d61a2138e782ec56fb9297013a97a278c7562cb8e82efd3ceebb5"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d86c8bc3f7d4fd75b9518b8121063881d6be1fa4cb94776026568f7d9cd9a6d7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6ddf996bbc7b21510a34218477d4882d9915b389f5025d19cb2848c299759756"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "74f9bd4101dafe0d81ad07ea4f7eecea1c636bff29264a66bada1c9935cf66b3"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1e6f54b28e9f32df0963f593e63ae564e87cc9dc0b410a19b1c9dfbf0046adf3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "804f7ab20bc23566a5cd1162e98eb282f00bd94e45cc3144c4a3957ac7829925"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7395ae78ee06951bf780c2cc210067b838dc676faba397b576bd6843df538f6e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "3cc6bb1c0875b42972d377f20158e40ab2de6bf992465e2f134611af3632150e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3fb2d63652647a1d334a2f55c0aababd8c0b3c8422317d6dee1870e6edab5402"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "32a4ab6b1f8cbd25bf98e716ba41a5ec244bd303b3403b1f6b99c9b1e2a7ccd7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "3dbf9d4befba96536d41f9369afac9ca518b67e974e680e85886e7359c12e38b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "bf695fecd61567aa90f830527dca017ef534522df69cbb3c2c8d8188f5856249"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "51a176dbc54149699c5332fa63dbd9c4a6db8f943ee350a7144103383e066090"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "1566620035335326949742dfa421e61ac27eda89236b9ed409902e04c8a67204"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "8fb3c01ab761a015f874200091d2c2305abbdbee56c9db5d42c05f31e38e881b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "af4d56b25ef7f4d91c7cd77161ea21432479987a37299d9d874462c25ea3c6be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "dccf7d9b744fe636c9cb200a9b0bff7e6f1c8b5816053efd2970ce1935ba7eb3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "660782e0dabdef0b66f5633fc93610d7a1f0b6e3666c08cef7b6bd3a8f67a2b7"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ca7c851a0be8609ab73d8cda8b47824768b93f3e55d0cf0d04ad93e71fe2fecd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "032a347c18f94c9dfc2f1a7b7dd35dd204ac35a9dcb5708817b7db6a02d6891e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "25bcebec16c10cbc488c113339ee75b20fb09e0dd81251b35266e2b3c2efa95b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_Promises.xcframework.zip",
      checksum: "c0ae08b7a512faad7acb3dec92d81bd081701d3794c8acbc493a89f526aa7bfa"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "fc440c81b459268b9458a38948daf9953cf82bb4b36e89b2ceb361a77eb7d7cb"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "098f5e8d29b0ddf91facdc242313025bf0fbe17b3ca8146f5cdcc6645f5e74e6"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_absl.xcframework.zip",
      checksum: "e1f5014db2ead000c99117064d8b63917cdfe7b8973869bbebf27e5f55bd9040"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_grpc.xcframework.zip",
      checksum: "e95a3341ddeb071bd83e2384e41b44f7025f35c1fa049f0e44ff74af4423ab63"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_grpcpp.xcframework.zip",
      checksum: "7383a9b4c1155f3d34f77f329171e38268e399c60ffdf03a7e4b67283f5a29db"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_leveldb.xcframework.zip",
      checksum: "8c61c6a65f6c6477ca5e92553cd04c789b30eee4ebfdaee0561a476cfabad596"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_nanopb.xcframework.zip",
      checksum: "e8f265752cacf9c76b1027b7a00376abb8cf7e8a6194f3de23902f2565d158ae"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_openssl_grpc.xcframework.zip",
      checksum: "dfd91696b805581b1d41d011d3b79d4987aa8ab98f84c470cac25421a8e7870b"
    )
  ]
)
    