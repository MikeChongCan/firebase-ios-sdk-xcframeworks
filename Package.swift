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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppAuth.xcframework.zip",
      checksum: "e67b522d72971ea02a1e46f1ae10d5b32636866a7afce8e992ee7ae8e98906b6"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppCheckCore.xcframework.zip",
      checksum: "34b25dc4861db1499fdafc404491f9cc8de76d4259b38e8bfb2e22fc92856922"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FBLPromises.xcframework.zip",
      checksum: "6da9f38cdfd1f974afedbf471fc9440a86377617bf2101d5c169e2d29c05baf0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "46d57bf28c7c983eb71cd1a337cebe4bf7b24b58b6f4c07e46f0816dc9593aae"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAILogic.xcframework.zip",
      checksum: "2f2dc069be17d5beb22bda7fc24dfd7c4cd34ae8d606769590387cea9f2e506b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2f3111ce2da05dd4b8119d5289c1bb2fa0366703eb288d4ccaf24e30fa1bc379"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "4e13d77dc24f98e5591a504b1b1191539f136dd6710a2423baa659cd0be47337"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1b7d177c8fe4b27265ad5e7a9ab0920c832b57d3c6701e7a59865d3bc7d1b45a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3fcfe63a9e46f83f16f022b32510773cb9d0e4030a7987d842f4860147c5b62c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "dd69ac45eb18345e300f912f414a1579b3d42f89690f62654c7fedd45e07799e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d36c71ca20c1963de49a10683099e433262e53550bbc119942074b35872d3116"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCore.xcframework.zip",
      checksum: "edfe5da7ae621b379f15e5fbbeef519ad1ca52110697d75e423788fb15755ceb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "0eb03db4fa1a851e112c92c2653941781a28168007771cc906ebe3d51bbb1628"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3eb2286712f36da83bf99900af71b57e3be1f976e1e20f12096a19344e7565d1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f1200c813ab0c47c53aadf2822576ba32b386f2b56368a57faeaebebf982eb4b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "20285aa95e9c06174ceb023c67b889683c219281c25f55dad28e193151f9d043"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "21ab358d64afb45476f96f186409e02b5605f1fcef44c9cf42bf64d3b62ac935"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "08aaca1a417a95354db4f64f02efb4bbdc964d4fd05afddcbb07640214194eb6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "6fd1c3cbfd980d2d43028b88e98869c3f937c00ba5e99673d57300498230cf7b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "4813f66ac5cb9ccdd1ea53cc449bdc2adc6c5b9911a78453e4b451972c8cb006"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "55f13e47fc663feb0b29d7a5a53078cf594d215c8680b478221f5592a3590a8b"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f4930ec40e7b49f3dc8bd6c1be14acfd261788f4d58a899d87c0eff6f055d9f7"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "1f8b45715b8edaca7926437506bda89db8668a6ce6cb769662ca8e97996efa63"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f7848a43dc6a3926e5003e618d2ef3df6f2ba747a454a3f2965343b0a4031429"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "9c20cbeefd32e3d636a70e42bebbcef598c9fcdfca21329b03081b602afa3089"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "717e20ec3f4c1cbdc46642a9b566da60d88452caa1b0c92894b88d0d3374e4fc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "b8e6ef4cdd66f520b6f187661fa062571304edd66cb69c9c276d29cd713cf53d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "e82486a299909882c56a76d2c644eec410e2adaa765ab243f8d5c89be51478f6"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c0e38f862604f8a837074c2249b17c74d5d7b2e6c40360b7863f85101284655e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "06224e860dec7dd0af1ba94a56263a24fda093180467e4f1bcd3ef19ae9bc1ac"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "2bda804dffb3bc5c3d541ee5312aaf35d0fd14498e447bd330a770b38ef49a5e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "6c2c561fb522be17d1ee5d9ad3d00d4b7b558eeb50137730180e8b5d994e3c7a"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "7517b650021b8527228746a55f7c41c5dfaa8df50db5e1a3bd9aec09246239e2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b68b73deaa185c12ec49be8be468762da76482da80251537e8ef4e45053ce6a7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "accc76d87f2a581b17e4679260fa199854896848506de40fa6fd2674c6b8dd02"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3cbce25144c933294a4b5a82846e73b9ccaef733f405b2e03b7f33cde06cd6fa"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "e927220590ccd95ff3eb36133025ef2fdd32304781aff3893d0f1a0fd3447f00"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "855f7098ff34d62fb94957496cb5b32c3412dd2778ca69fab9c41fc1faa47391"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_Promises.xcframework.zip",
      checksum: "e338d21d120e108bdff1ec59ec0beaa42e13bc293fd1bbffe1677704724766f5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "bef73b6b10327ebefc8ee5643e419e30eb2d47abe5293ceb765aad81f896f1db"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_absl.xcframework.zip",
      checksum: "513a212cdb60a9f7362358ed949b408ca79b0dc79db15ab4d23b60113111be39"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpc.xcframework.zip",
      checksum: "9b926c469f4b5e02821b230848139cf41e5aa97f3bcb8df8f24ae3bbb730fef8"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpcpp.xcframework.zip",
      checksum: "a9edee4cc8a9b58d277a0b49f51dc0c9301fb9237da690ac6e45b548bfe413ec"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_leveldb.xcframework.zip",
      checksum: "767b53c80770a64dcfdab387f4ca43276ec4b4501599a5e98725a08ee8d06a7c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_nanopb.xcframework.zip",
      checksum: "0b3c47d3db13a054849c3e66818a4897e42c1f09e608b7ad0c1095eb8ef647db"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_openssl_grpc.xcframework.zip",
      checksum: "f12fc99104355d2ada9e72427b2d5060d4b9292021ac28435661bf71570cdf39"
    )
  ]
)
    