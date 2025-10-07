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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppAuth.xcframework.zip",
      checksum: "2242e533a841c6bc91fc8c22711838bc2c55b295764babb30b62668c40dabc22"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppCheckCore.xcframework.zip",
      checksum: "9d54ecfe11e9065264d99735904bc5f7332becf2cf59e2c08f50ce4914a3cf21"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FBLPromises.xcframework.zip",
      checksum: "9d0dfaa995b31c93ac35766a270b23af15fcfaf48892d7ffa28b03f39af20020"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8ae4c4cc0dded56398ce362f4d8ac2d388741cb7106a015263bf45e4111b62df"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAI.xcframework.zip",
      checksum: "a6adf536db14097314719fefa492801402b107a4ee87d99152f7c3f255d006c1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "1e9554ab5fc045c8d299dce43a37eaf4d6a90316f01e5fd8ff7ac68b14333c7e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5e07a8907ad09d048c9a58b2d8ce9f809d0f95575ea922e50e3444ecb9f20051"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2341d241d065eebfacaca09eab4d18bfef69cd6c756d97bf1eb63f0c6d0db16e"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3dfbaac062aa6e5bcabb7c198d2b09913a8cf78ab48e55748c633d5730f82235"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "ac03ba9ec19da3c6ffae1055c43149e9977fabce70f815e50bf6e1176b8b1ce5"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "76ab2c35be4ce267a2df27c35dd238376a0a585f4752a9e43c1eeb73c2b41133"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCore.xcframework.zip",
      checksum: "877d1bd79255b7a6065d6adf49bb74bd6099fae1bdd1cf8896d32e30e980e25f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2b8806840625388be6b68bfce95e24cc26391b9a943392c801d25533096ad74b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "dae29ef146b04d48214daaaea4eb7af30a1bf81c9e8dcb314e24e56991c2d41e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "eb9e9ed322f633affd4c14ec1dd4bb2bd70e61e7c0a83d4ef1d4bce92cfb933f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "f0a08cb96ed089eaeba64df9f1043f7365e807f90935e4b7da6134ea23bfb165"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "09e3e4eb72b7a8bb1750c3232b84e1a91f434124148f6920af68a08074a6e75d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "2c680c0ee12567d01f572060020319bf29c7e7af8c316f8621c450ad579587bf"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8790ff3de97d9e52afb29ebff07fb610c5eafe8b3bc6ca5baec1448bf17590f4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "83793bc93d388b41b69416d9f4e9f10dbef7cc28d0d9e3477a080c89ecb7bef5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "7c5a78148e3a82064ab3b1cbdb2029286dd781fe9c72add39e6a62303977f3ad"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d0f86f9c23d381135663c3ced42e6e2beeee1dfbd5131cd34388320c2c938a57"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e102e069c6bb1c5153a07dbeff10554b3762ee9aab45b7bd6c19c1b8e5cd0bce"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "76f6bb722f8261686943bb03e7961725b69a8ada989d5991b5e33ed0b5db652b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "4f4d0b4ff9f110f991ca6de1a2190d216274800ac053019706b71ba215dd0714"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "f3688be97b6da30089610e062e1a98deb932782e09d3e8ad5632eea699f6423d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "02175e5c7df47ae80e72cac7425a3aa1f305de9b2f55cd5822be924c589875d5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "a687f45fc811b855b8a56f9dd802a2d9d885df58ddbc787ce62eb6c4483e95cc"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "945cfaa0a087be141ca6d10e289cde9a02feed80a5be27b56a02a845ea38e5b8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "eae883051620346df47c5581cbce7353e9738866d9c6efbf9f86f67b20af4d5c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "9bf5f50367d288a641974ecfe54d9d07b34bc65ff505bd21300d59e001b409cf"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "dd46480e3d9ece1e4d3734abac42255f549e88918ca547a64fd20ba5d445aca9"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "72b03072eb5d14827be810ed7473804921126da4b0aab76670c7496c04ec5264"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5ecea1bce0d8b478c12e78800fe4c53a363ee896553fb7e87366fefafd63442d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c24f1aba1d82a9c85b8e21db4d0cb735eb7d04403af37113334e466335f05816"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4c660e194cb893c0a3825e80e1efeec83a56c9dc0cfa5152d36c4ae1e798167a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "0f8f26602aeb882d4b447c1a38e112abb5c63b50e1d7fc2c302d3e67f34f827f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "1c832b2931392462855063a836b65a55e9a60c1f033517e84eeb9297c50cb640"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_Promises.xcframework.zip",
      checksum: "30d00a9cf1fcb4492f1a650540505271c5b9c1e2855517d992e03c5a7cf02cc6"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c1556c8c81b6f7d92682a21ce7d62f1ecc75540aa9146afa7aa4c0f62e39f16f"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "29676219d3e85644131987d497e876eef9c5afd1dd15907e42bfae95b8beae14"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_absl.xcframework.zip",
      checksum: "e959a543f81b1d9b3079b94879ae27efe514472a715e01e3b1d9fc26ae52a918"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpc.xcframework.zip",
      checksum: "6fb03bf1384a3cc0bc063cb9ed095d8da923a2d452d69a78de4d51534b262b1f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpcpp.xcframework.zip",
      checksum: "d3ef0873e3f9c00e635d623a5c14d2c2f1354c29250303db0e4a21a1adbc73a6"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_leveldb.xcframework.zip",
      checksum: "5943346f254cae3a602977311b9f9f1699335f54b47682c9073e9a2ec6d10948"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_nanopb.xcframework.zip",
      checksum: "a17d1d57dcc00e44ad263f92268e8d4d03f07fae0abc6b4dad20c2cedaca6e9c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_openssl_grpc.xcframework.zip",
      checksum: "df7f3779484b7330c8e9e496232b6b3cc8e23f16fa45255827243d8f6f699b53"
    )
  ]
)
    