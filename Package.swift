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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppAuth.xcframework.zip",
      checksum: "674f36a0ba07832b3158b00cb5545234469f9730919dc2f872bac275ec6a10ed"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "3766c0f6fd21f236be4f3b02a9676f603be589fd05f45469921e6ee1af0769f2"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "de91a553dc6bd2d387931e8bc26cc48edd1d8e33e9a19dfbcbff99e06370e8f0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "16c9cb90bae3077cc9b2e68ff73b4a6de7e031df92747f4381fef217c1918b6b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "05f0c731e78cea822c963f7456573c493e6e4cde3692f9f192b661df8345c5dd"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "98c0ca91a08c99cf52222f5b90df715d44fe9d0880e5e7beb25c469581ab8841"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "6583dfc8181a6fcdabd4e93ee37353f35fbb2a230b65acfcbd07dacb320d6b26"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "b03934a8a0e00282f06bfd53b0c589acad0d48f3d249dfdf07a0cc6e4f1a17f4"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "8773e918e9e4a4717ae51a625c43a1009c2bbb2cbdf2b35c4f02d52784c5fbd5"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "10ec720e12ccd47e66412ee4309b9c7dd29cd3ee2cca01aca2e3d4fbad225dce"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "2ee33bcb110cfe8c5568aa11137c4af9b1549f4781741f053c0b9656feb93a3d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "d4edf45b0b355d2ec447665a07bffc48cf1a61b872030dca682c3528c7cdf10b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "71a65f0abfe1ce9d6bd7f260bc2621e0fa28e3476a1b54c7f3894c4a0ad743ab"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "abbd6aa478eff753ee6ce030aaa0d8721eb0d80dcbde2b991e6535377b25afd3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "99d5e51bbaa6f6f5f7839368010a747083dfe0da80c016c29eb5ec4a230cdb07"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "49a4d19fa2459559625bde615f1f1c081c24f12cbfe198e5d5ad345ff97d5d5a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "dd321cde054d0e6eab1291e0c06e60ea72a5ec3347ed40f0c75df84c6233d4b9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "bb4c42cb3aa44bd159f9d0a4c32a9e43a93d44f4617623c29ccac93c1c308bb0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a9972c05ed9a2ccd44e4a0f68493fb3e40c953d4772008ce54dddf5b8f024b9c"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "c60cc8060097c8a70c388c36efda932ae9b1c96b0543cbde147ae2735604327e"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "3857953873e2d2a6cee04667237bb67b4ae6a9cb117c1a35b637047b49adc53d"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "8e5726abf4abcf89eda61c95c58d16821534409b2f7a615770c3952845a76a15"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c722b3fbf880c6a4ec81760f6de377ec9e05ef8b4ee362ccd59198ae6c84028b"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d8daf483198201790b081aa9ecb3b774560c05ace52ffe5603037cf57248d84e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "a43e410393410aaca6c4a22f0a7fc4977b45ce85177bca44326b1c483309fefd"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "e6248d7b1e1b2e8da8333d1462ff1cbc8e9ccc0bc4a40edce0dd586bd2db1084"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d01883710b831b4a63d3ef9c036e82df2b8a5d878451616ffc5c8f084bcf7121"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "36df9710fddcf1cf2c8c5421593f5185d831534d8aa9ae33a30fc08452b60d1c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "52b7423e90194ee2edc586ace60bf05838dd178d20d42614d226ea87e153b9ae"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9139d39131ab889ac20ec8da79b34d2cd7e21701d37d55eb5caa0628d78600bb"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "516e8922303424c1f91b700227c57495e2d56a3443cfaaad36e5fb464b4c3e5e"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "48f37769201ff20e6b2c140ae139752cbd8b93416f9e46951f4dc6e3b2a4ba30"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "3b613ce8850bbdc0cdef5f2fb02bead5fac55e480f6d4971c11556a3a0b0b148"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "9e5014dcb97252e8e8ac767f002235c438c2a941f2e538e1dc46699b9b3a9ad2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8bce55d8a27650e6423aa4c41e48213ae9aef45431cbc77d826f7f41dc86de2a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3a863ff9cff0c12d6945069df078bf571fad278a178629a67e5b5791a05239a1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "697d73ad236d2f620ced621be9dce8452746f929c2c665bbd36dab46447e6e4d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7533cb76400469e25ed8a1741d52e9ee052cdcdd8c4030991be0938a29f2bfa0"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "5a43ce8d69ab37c77d8a3bc06fb55a10af2df58f43efa635cd33d4c036e73226"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "9dff58344da1b3e6436d358608d3a8df2dcca8036483c161568170891f0cbc60"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "4146929fd79af69c9c87bceae8a272ba9e321213f030422a1f06d7c6c4cb85f9"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "10df7eb6c694c5f02e948ac44423101b63128b2ac5fbf71a9c932f509520efa6"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "cf35447add8e30ee0aa4c1e39022ab23db162b95be6e96120ae9591dc4b24efd"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "a3a7e517cdac3886a6def5f20992f46efb447c9955d69e04847639747080b36a"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b9d9e56187eb75238a73e7d9e0ad7e33966dca95cf3095cb92e88abba9de8b9c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "070f76adb7df72afb34c52b170cd1452eec1ec1794fe4cbd2b914972f015f82f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "8ad7c1f82d77dd3c0c8c6a5accb4501c0e1dc6f2b318bde51cd95781edf086a6"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "1086505aef624a90cb2ed21e85774ed8b1aa526c994bbdf549f3b893a1f3929e"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "a4a0e43648b7a08599e21989a243ef478178742d1af0f3681037610d1bbe7561"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "5fc4254b3405a20c7aeabf152a87a07593b81e41cd6988681f565be9d7392cf8"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "be33526f288d38feba4a78a3bf0323e8e65b57da00f994cc9cae982ed12640bf"
    )
  ]
)
    