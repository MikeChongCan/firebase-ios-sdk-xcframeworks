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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppAuth.xcframework.zip",
      checksum: "9eb47499c9518da4616b9f4114a9c27c3b1137b8d242d4826f48cb088c9b7fcf"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppCheckCore.xcframework.zip",
      checksum: "1afe1447e826485d56c213c9142c3e9fe306e2d28e0794f022ae326d8a097c08"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FBLPromises.xcframework.zip",
      checksum: "dba92a09a3e1ca1e666b3f68fc9e3eecfc7b236ca7fa1fbc5ebd2ca8323a12ac"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseABTesting.xcframework.zip",
      checksum: "35b9d0c7da23de3edc063bf55d6ccf3333e1b98ca08d87ee5de4f4bc71b94e96"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAILogic.xcframework.zip",
      checksum: "12f5c26320caff1a1d25a78aa9547cb6fadf9dafa02baef6a5f165b12aa95cc8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "13213591ac6e5fb970742653d376f0ae370b8dcf75b1acd410e4a0b11c003023"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7311348255ff18eaed98dae267aed24a027deffb900206d86b645bee3183f151"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "667731df2ef69333fdeb6122a148cbb4591952d682aa6c47f54dd86e0d73c9f3"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "aed2ef22fa1d77704622217c4d279a5a13bde30480d6851806e80ee32e97497b"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuth.xcframework.zip",
      checksum: "a8a84a23f86b95bcef696f8c2af59180aa6682a78b34cb4cbc92d5596019018a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "3e3f86cef3900b4de1f35c78d67ad263ec76a28b155099c1a3cf53c365757e44"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCore.xcframework.zip",
      checksum: "1abe635b8656b09a8b649815d2c7c96506b2d8c2a327ecd1ef26b64bb6623e9f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "71dcc40af5fba3b753fb83c26ccf44b92cc287613819e059b08f5fcd42dab1ca"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7fac14d6f78be0f0ab0f32b40f59053d856898c24e3ecd7922b2fe054e2bfedf"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "372c9896d8776ecfe483a4f80b2a518f97f162a74f0d7af052592638ce2eb96d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseDatabase.xcframework.zip",
      checksum: "949ee081611fba986b4819baf6eee39996aaf951dc650e0d5dcb779eabd266d0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e3406d9f6878752bcda339e2b9d77df80035b225a28370c906e360f506bf4a9e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "adb8f6e9179349f06db11edd702757f1f8b82232df7bf9318693b708cb791f6a"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFunctions.xcframework.zip",
      checksum: "7c9f175d7f6399309a78964f4303902ee5f7df464728aaf9525bb3e34eb5612c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c91d4ae97ea3af1f682557c96049c087299ca2ae545a9bb7c56fe943e441221b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInstallations.xcframework.zip",
      checksum: "64ba2f623436cd64011189e911da447af41c84e3b788f2181d72c71ba8c79db1"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6513e04bc967569f4d780f1db318e18268bfe31867ee530389b18a0c91dd08ec"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e414b88b5854146ceae3fb48780c5aa74efcb036b4c551485a7ef044b0e055f4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "61f39c3e118bdde158dd8044d5540e2c915ae0c324e9dd40be2d8c7fe1a03371"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebasePerformance.xcframework.zip",
      checksum: "ec44b6df948ed756eab4b494ffb9e13feca374043ed0af93999fa1c2fc8a6fbb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "b9073abc2f9106bb955229f46deafae1e01ebf44fe02dde0b6f6b0530b0fe97a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "37462f342ac2d217e392d9ad03fa7e8d29f78418d8a3c3c65aec6324aa77b861"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSessions.xcframework.zip",
      checksum: "01ce0d765a0d07b88599800ceaf3d3258c3c15419b2be995c91e9497f1708a52"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "39ea84cdc3bacf49462587ca32f91c103560d9c633582158b38be78b70abb5b2"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseStorage.xcframework.zip",
      checksum: "32ca22401302b47a93459067abee11152e4aef77dab14a890f374cb48e214305"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMAppAuth.xcframework.zip",
      checksum: "caf6b8639dcebc695708e76eeb5feb94d9e6db5ac9b2f3c561ca22685c2b423d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "719e9251232849200405d35cb9b459ab18a701ed57d88c934a22d437ab75b324"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f32b2f063de63e50cc4ed360a56c223d75bdd64b38309450c77b254d74370315"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e1743482092ae4c932193ac9bd9824301bbe1dbcdaafe9378652df87c3524969"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "87545e2b36ad26809fb1bfcc44422af84b61fc593d182ae6de13d62a1afe6aa7"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleDataTransport.xcframework.zip",
      checksum: "76599a44274099e8959e4ce1c678794580ea2455be6d9d7e57df4b6a0b0634b6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleSignIn.xcframework.zip",
      checksum: "2b596b58c87d379974c843e3c8a7e092ba220fa458794871eca677ffddb70b12"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleUtilities.xcframework.zip",
      checksum: "d3033c9680e31463ebdf6a957ab4854f3a70973b479e71d7bbf01c292c3d01c0"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_Promises.xcframework.zip",
      checksum: "a2ac961a69349235081e5381ab49c97e3837030b234ab8dd923e7cad6dca6180"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_RecaptchaInterop.xcframework.zip",
      checksum: "814a0e7690142a2177ede6427cdca423eec72e6b61ef5a042852b27050c5d3eb"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_absl.xcframework.zip",
      checksum: "b6528720783a1aaa373b6002d51e3d7a60e52024d2e78db8ec9a56a0a6a9e998"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpc.xcframework.zip",
      checksum: "b18bd13a3e0158ba13e053cbd3ba2337e1cc28b5067f2d3e5df8cc01e272faf3"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpcpp.xcframework.zip",
      checksum: "85ea82110d87bd47c0467e9f29be6e2eb32809c29cc63518c2d15c890aa55c25"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_leveldb.xcframework.zip",
      checksum: "dc41283085e5e47dda1f65a1412e683b25b01a6bbc4d89551e34f29baf4e7f92"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_nanopb.xcframework.zip",
      checksum: "b0641f102532d436510e11ede7b7292bbbf522f6b9cbd4b40e79ca9f740d9340"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_openssl_grpc.xcframework.zip",
      checksum: "fa9fd0be6a9b873475c6224fa8f6efc26028e7c7c2d6a5df32eb2d6619bf4408"
    )
  ]
)
    