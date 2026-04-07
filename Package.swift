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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppAuth.xcframework.zip",
      checksum: "ed56775db9ed2fbab3f75df6d770ca5b08cd19d1f32566f7ab98b47afe681e24"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppCheckCore.xcframework.zip",
      checksum: "00e7a7507982e9b040c2abbc0d9f7d370395292ca9a14d1200231ad5e5e26ed2"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FBLPromises.xcframework.zip",
      checksum: "382e883950598336abe48bb28e929d25a2e986bd94812a423bc9f4f4c98af251"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "71a0c513914e35de5016d9a223bbc6cddafd8eef5f1ebfa28cc552e0286f82ca"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAILogic.xcframework.zip",
      checksum: "d9f20865ba2507b16f92ef9c23447708539bde08b702a0057d34209882b2b655"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3965e82203a53336f9df99cd514dccf0003848991a76f111a4afa9170bb7c5fd"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e715a0fb4fd20bb79c54d1ccb92c6f794757903fdca2381b5559ea5496892ffc"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "fe761f935f86bd74323770d9b77b2e1bbfb099abdb6e506f113264b8fc000c57"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6f6be44d603a1bd1148b3ecd5d621678f91f7dfc8329208b8261dbb900eb005d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "ff46927e50c19ee81d2f70d223654d73d26557410a3620c8af831bcf48104777"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "517787c85d4b5f5043353ab4a062175c052e675c4a3a0ed138241b8dde44d1f1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCore.xcframework.zip",
      checksum: "f03ecd06c3a484a35bb2fed63d96fb42e3dad2702d2e330f9275d2433414d001"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "bac087fba77059a5de914ede960451483cea48f66c057c72a42fcce8a39f34fc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4d223427c799dbea34ca95cc62da330ee75816b3b0ca5b6aaab60d21c1df5365"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "be4aaf74fadc6689acdf09b3b7ea093de1a7ada065cf88e68cb2a7779e2ff5f5"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a1b56956b64bce9278382153b7fbb5a66511c0d0082791b49bc35f9127051331"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "31a766aa35db3425ca3f789cb51587a4f281ba349c0e48ea63fcc71f68b73a5c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8d81b6abdbb75dde4267a582996b18cda0f5394d0c17b7946f283717d959f5eb"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "75cafd1378d57f7ba30597d5eb1c2ef6a5b2549b4f274ac44095831be1e19194"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e98aada19b096aa7b0ae2cb50034eb40fea8ce3f338ae1578818bab72fd02bd1"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "3b7579185ec4bb8c3772e56490b0614c174a47f5f4ff1e9f3b72b1a011a2cd26"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "73d0df53abc1fb23700560f3ebc458e162e31e959ac77ed35ab1f20d57f185ff"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "5e96f521a6dbc3e6fb0fd60988e6f747a05a550affdd40bdd11a29f13a0cf9d4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "4997476805e4d857414eda0b162b2ed1d89fc04e817201f82a2f64be8835f325"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "353c06f1bd2533c4f8b7b6dc14273febf8f3365d920c63ee7b1acfe1b4411833"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d3e12be75615fcb0cc708414817135a285a91c0d8a6afd4be98e4c99e89391fe"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "321f05f806de5890d8220ec7b694bde0b801805b98201eeb14262a288bbfa8e5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "84bc8f5d076caab1c733924b0cfc1a172c8c34efd8a8eba0d4aac659c28a94fa"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9f71c4ee3411fec254dff005e0cb87be09c19abfb850183a7ea577f3a13a1096"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "bd5b07b7e7c3ba20ced89d7eea8493908f62d69a6984964dfd69a74cdaf146a2"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "daa2980d0519b7802e438f6402efbd33bc894e84e6e0a497c91be5839f5561a0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "950b069348b0774b1dcb15dbed5e9faf201546a13c540fe82fedbf2a455a0361"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f3dbd35df576b8622526730c54faa6f554f0c3911df12eebefac5c719977d350"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "7b0218e163a61645c88019fd821825712847bd7483ac401284c980295be0a625"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e43fb8591678c9234fa1e6fdd43d26ae6866833bb764330eb5378d357491959f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0b62b571deb30e6be36f1e0554c8bf44fc1723ac82ab935fdfdd4d0502948e52"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "c3dd068295408ad7108d1e39261b11b1cc8f6b236bafceeef9653bf2fea04697"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "c6ceb2093cb190b874f4bf005394e58ccc7898498c06cfef2eec4bb3bdbea1c1"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_Promises.xcframework.zip",
      checksum: "77a9802a07b75156d665f60f8a1f7188b6651520ec7bb49296a108521e642898"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "15b7e8dd0e25a86f98334567d82f387428d33efbb30220bbf4b209a411485014"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_absl.xcframework.zip",
      checksum: "cd3a814c39c6f95572a0f6f6fa4ce3841e82259e02e4f19cf8578d78fc7b77d1"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpc.xcframework.zip",
      checksum: "b8c055435d2745405b7b117a30c9240e535f71b5278b69d5ec4f68d9449537ea"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpcpp.xcframework.zip",
      checksum: "6d272ab9894820cce45e02758a3c74ae558f2a89514c65daa5b67642802a603d"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_leveldb.xcframework.zip",
      checksum: "e21a86ac11b9d3fb2c91ceef2d2e887a973f7654f3b90cab12f01772a7952dbc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_nanopb.xcframework.zip",
      checksum: "4a73f2968521b79fcc0e67db4cc442106e5ec197d45d62c1b4bf027f42879d6b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_openssl_grpc.xcframework.zip",
      checksum: "0b4d7cddd8482b53be9d7318d9e12370fd4825b5fe591e6f35845c81622ca538"
    )
  ]
)
    