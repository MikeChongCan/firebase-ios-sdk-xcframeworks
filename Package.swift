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
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppAuth.xcframework.zip",
      checksum: "5fc6358dbec366b8fe534cc1e304b5422c83c213127990d3d3e1f23840c6acbf"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppCheckCore.xcframework.zip",
      checksum: "4db2939f65e9fd98db857571b9c4e8f0a0b97a3311aaefb1b9c33ec30eafea5b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FBLPromises.xcframework.zip",
      checksum: "97b4a8e94315c7b03a528a3e593fffa92a984de224f94478cbedcf3596b4b28d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseABTesting.xcframework.zip",
      checksum: "92a5df1c1edc9ba39d6d29b7a1568ce848e1465760a32ff26885f4cc508aa2a4"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAILogic.xcframework.zip",
      checksum: "e7f8dadfeab6a5478ececd2dfc60dcdf43ff366ce7d2c6b063ff101296f9851b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f4629940f2ba0d3b7119a7dfa565c51681768f772219ff32627298cb175ca7f6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "4e81f6a72718ad844a0e3716719e7364a4932ce4779392cb7f54033b28951841"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e9dee28830bb6f913bc32db3cf4133c4c0a697699db07bb6a5fe49a3a7509091"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "7fd43f380dbba7aa1844d686cf35c130dc8230bbd76a328cec45002488fd004d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuth.xcframework.zip",
      checksum: "1aa06f1b69f5b07e5cd4fd30dfa3ff3fd95880dbf5e33ec05aff8ae17139777f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "1c3f29f0f720e7b05dc9aa1110d172418cbe30588ed7eb04b61a1c620ed1a8a5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCore.xcframework.zip",
      checksum: "5ab625ac061e19a71c89bb0ff6f7a9c17e8a783ef11c8100df8cba3f5d816be3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "662f45e4cc24314da575e053e2852e26ee7072724110c3c1c8692b0633f42a80"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "2df0058bff72ffd33043a894f6a8a2a62cbb929805898a416ebcf09f9b62bb2d"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "bbc59fbc499f51e6f1b96c8aa032e3faa7e870f7f5d7550c1e15846c45a0d09a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseDatabase.xcframework.zip",
      checksum: "66c11ea019092af23b2ce692e4959689592f1b4657b25ba7551d34c1afc30017"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestore.xcframework.zip",
      checksum: "f557c92475ee9e2939abcf021229acd1e2360f85a0e5ed036afee40a278e6028"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "fda9aed094c2ce8b623143a242bd6ef36da30c951ff25c96c02947da6b65c82f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFunctions.xcframework.zip",
      checksum: "eab0264c34812e8ce3336b91c0d26526c1eebed56676d8d201f107251458f8ec"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5c0ae878f492299b7e4d8e84c10a7a381ead3742536496a01ec944af669731d1"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInstallations.xcframework.zip",
      checksum: "aa6679cf09c93fbfbebe46b0646dc120398648ede84810ab9f2b58910f2334eb"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d3e978ba0d2ac9bd5bde9809b8beaf984436d1987ae0bbb76ea4adbb421e7149"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessaging.xcframework.zip",
      checksum: "dd5c5242e91d21fb70d827591e2100982ef6232825f2db096052451955e36a12"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d4ddcf233daaf0b905d15f6d99c60abc7d70887f13f47e3262a526297e1264ff"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebasePerformance.xcframework.zip",
      checksum: "f2aa9d377f35889c1cfd6d6fcee471c3738eacfd68bf93680ff34f77b8c628a5"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "40dc8d8b2286574bd51331d7ce4825a2ed7142c2069dab88d161539f884e9ca2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "959595212bb46af690c65ada67e0358c2668c462fba150a14c709c19a0834f3d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSessions.xcframework.zip",
      checksum: "73af99ea9c16d776ba74e1e74da2b466ad929e5c4bdc495660902bf9b50f3a09"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ae7ecf363fe82f85aeb50ef63773687484487d87e91482042a9231a262d95a1b"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseStorage.xcframework.zip",
      checksum: "38746282a182c86e705736a28f73030888a408891e2d1ee29518ae190ec29af0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMAppAuth.xcframework.zip",
      checksum: "440bf1508fd070d0f4a870a100e8bd2869fa2f7c8edd6f14e6ea14d6240df869"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "8464d07591563a0c8818110dd45dc561d83b1dcce2107e2c3910220f3d298a18"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "31a5a1f5204f4844a480d3889b6ebe2e69473ef32b868935c51812c0483cb08b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5db9889c4a65501f1492f30d71b1f42d74b4dc7bee3dd3df7c6eda72830a0802"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d17a0fff9ac54467812517bde8185ab2fd9c052405e2729589602fcef1a659d8"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e35a54215ed6546f2a574f20c940f6030c36b07bf8cf76b6f78761aeb50dac64"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleSignIn.xcframework.zip",
      checksum: "bece4eb32033bb5e71893117e392768ad62702ee14b6b974676d66b8bcbc658d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleUtilities.xcframework.zip",
      checksum: "89a913e77cb1ca1a441edd7c60f9647307756ff575512b4c8f98a96cff3b1619"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_Promises.xcframework.zip",
      checksum: "863c9cffd1f5a0590c84fd79af4e36c33e0c6de783d7d61d4772fe3ee0ddaf86"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a798916b0d052d274ac255fb64b620a105ff00f29ae457a74e12face94f26d8f"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_absl.xcframework.zip",
      checksum: "1f349ec6d02c2c3e184daf1d890a16ec364db1cc56bac08efdaf54dcb9cd6c31"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpc.xcframework.zip",
      checksum: "1e96a87a65a0cb6a41d26b1836f7f65ce182ab7e1c0c8a77187a414caa447d6f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpcpp.xcframework.zip",
      checksum: "12d02a7fd8f238293cea1a23d182bbe92ad487a4b717b16b637834b113bc7bb8"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_leveldb.xcframework.zip",
      checksum: "94cb766cb239b0e21c35d1a72a2d9494f1f1262225e9fa4fa95686e70fe1223f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_nanopb.xcframework.zip",
      checksum: "6c82dfb4f9c01d6c1bc0f199ca2631140ff665564869084dce71c450e0793f70"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_openssl_grpc.xcframework.zip",
      checksum: "38df525ee7ec17b5be7cb1899f222a7f87c9bfd3a3fb708b25cbd5885ecc733f"
    )
  ]
)
    