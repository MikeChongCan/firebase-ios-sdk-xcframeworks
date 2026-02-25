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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppAuth.xcframework.zip",
      checksum: "7a5c20701ba030c35e0198699c8e0910f20d1cb4976fc7d76a6bd5a9bbde6f3c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppCheckCore.xcframework.zip",
      checksum: "00a0bb708b72e0f2b4bb5e53a47026c834294edb6397689d9cfa01418e4deba0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FBLPromises.xcframework.zip",
      checksum: "a88bcd4b7fe6d564b51a66d1192ef995c61c8bd1b9b5f312b3ac36701d065466"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "0a6106385abb32da16a70ea15fe6e23b14410ffa113d478c65db0f594b8b8296"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAILogic.xcframework.zip",
      checksum: "55d288c6d3fe46a7cc9c5d6b4dbd66493423881c324ee2a9c4ba6dd32f61e52b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "428e857b4eb8d8d725d272b60f1f4102a1d87567b550e87b39d5b6d3d2dec531"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8d64c08ab26e76557eb168c7bcf378d0741b80c07d5a65de744bf42848130d92"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0eb5bc27f4feda62a3130eec6a652031a54342ce40ac28b9734e7c70206ec514"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "bf234d2192604cb3d5a0233ad04ffe26578f7bb329810f9f56195263518ba627"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "e735cc2829b5f1dedab9c1f4d1e3bfa13ea4a33e381ac15c72fbc5322e21ccde"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d23ba80b30be8dc8a59566ea414873b107b6016aa5a8f377ab44ef73eb3f26f2"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCore.xcframework.zip",
      checksum: "16f9702b2aea320b601cd4173da8346ce57ce5a6709b60fca46b229fd558b4fd"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "c8f17625dda382d30cb6682a0baf53c11c101f70443b7ae4253e6d91c0877eb2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "ee905edad855f2edaf298f4da1d9390510d49f9144caf3036fc188ff327356b3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "2654d74133b779ab5be45e6e8bf4a469a7b91e4c483d19836fcea4299e5ca1db"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "ec2adf6c2411e10b4bd6930710c935cfbeb965644292d5c06b6d1c3085214899"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e153cdf82cc8e61a8da65ef16a21844031b134efc2021ebeb042f35cf7a716e2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a25279f638b3395299c3d1741a141e1552e7dcd7327d83594acc924d8a308ce5"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "27a747bad24667a754edfb08a812c9c85043dec8a60545787560a351c5283587"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a7c13e8ce509822a7697c1bd45843e0eade68eb9d74cc8e354541f323df5c780"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "422f57c9d98455aceb38a6183fd2cc2a563da831ff6134da00563602d0328372"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "9d99c44f78abdb238803b7fbb08271b3636934f09b12da16940a2fa7f807d9e4"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c1ea25bafd01fae430bbfecb0b716a4ff24be2120432264d9cf3706b21b99389"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "cc1b45b136186bb8fb19dc488ed85cf14e2435d9df666c6d804883e16b00e720"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "7783dccb06e00f790ba6611c1cf6380c3550243cd49f1c3ec9fd1c2577037959"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "5091413be8439bd629b1eaa60ee91026f347861f565dd8240818e602857b1325"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "51236561bc07bc8355e3ec11fa1fb18f2abd403be3aa8bb0eaa5c994a7c2e474"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "f21f05491fb1561c0b4703d190428dafa19c11ebfc5937f99a09e4bad689931e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "2798e858f382b3a377b77167f61e871f1d8299e29ab883dbc0b697f3d9758649"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "4c51beb3ce484a4a5038ebff1418795dd634df50ecf6fa2d4dcafe31ba318d22"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "0048cb4a89de35d46c2d556f79251645196a54308ba4da9f25a7936d99787891"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "03d7271834f7d191d0a71e9332a264593296aa524d8a168f50d33ffb52dddd23"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "44531c07bee6093d93280534d804f78792ee1b597ece9449fd26fbb9a6557be8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ec4eb943954b0dffc83ebd0fac3a5620d8e50b419bfc4b2e6236fa426b25be34"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a0139c373d328994a46ad5e8cbe6419fa954572a16d1ed17427c0daf52d60fa4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b10c1b9b1b903b1f5820bbe0b64184b2a7339cf173a6bf9d56126c6ffc045e3e"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "ddf418d2d55dedb98f4273d7d170673257e0f59cddae03709d4911661dae7b69"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "cd209338831d09690c749eefa0df46ac5063a538e95996e683c5b8600d13e7e3"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_Promises.xcframework.zip",
      checksum: "cfe334016dd919df1b3226f426515efb4dd07de5c21ecee75dcd96421f5c3aad"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6506a4769b0607463134a77a412bb7813eae3cfbef197b80d15d5a35060e1980"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_absl.xcframework.zip",
      checksum: "ee208ccf3e10d1b74f5aae0194b1c2c0ab657e5864b5446ffc1177c2e763dc2f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpc.xcframework.zip",
      checksum: "804b1a095301a17d1574b4713dd0b54e1ea9e267fe5a4a788af15d7090f0f7f6"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpcpp.xcframework.zip",
      checksum: "26c8f57df6c84e11b292b4f715a73a582c6a82fde22a2f0477de753ea4fab438"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_leveldb.xcframework.zip",
      checksum: "bb26bead0cb28a74b8e2b12ffb76a84eb8f33ad63636bbbc173408c4277de1bf"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_nanopb.xcframework.zip",
      checksum: "d6c3d562582a6a54fe8f37268463487ff395e774144aa7d1a7ceebab76c9f9ca"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_openssl_grpc.xcframework.zip",
      checksum: "98b1d58577469c9d27bb3643774a96a18d5a606ccca686027c7e4be122e48e95"
    )
  ]
)
    