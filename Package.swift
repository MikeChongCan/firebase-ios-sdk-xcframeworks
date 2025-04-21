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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppAuth.xcframework.zip",
      checksum: "ed0a978e68c0ef65df77b16e543b1b1c3e071030d4964ac902b983d5ad3013bb"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppCheckCore.xcframework.zip",
      checksum: "278bec88c30a1aa2bbe89cca692457ae30ccf50c64b2f282bab305aaaefe86cc"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FBLPromises.xcframework.zip",
      checksum: "7373cb04c7e9b509bd0ba29201d1cc37ef2892bc31aeaf6cf2723865c6b89c91"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "d7d63a4ee3ae652017c7b597f835b8d8b80c67f35410eac6b66f51fd1696498d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "5f62c7612405005133823bc4b265d7827283018e38331eb8a3a8646d35a7a792"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "99e6f65385c11ae623b0eb1156d49535420ddc99090850f3c871b919305d71b2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "dd14a4b8391a06a7e8cfc9790748bdef7b327ea654c90942d105966c8823c43b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "22e2603f86d0bbf9fd2cd5ad7b198eaf28a63c60ae8d4e0433b067002d906671"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "42187b4c63066d96d38f79414ab81df8c13f9d552cfa1d5092e3011665718a68"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "89b4cd3fcc17a1c0ef04b739a8ee8f4e69812671922dcded49158b4dfebef831"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "c3608bf7ce812b2795bea0bcd556928a6778daf422e8cf5fecb553ea023cd8f5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCore.xcframework.zip",
      checksum: "3258b6fb3e1bd8abbb0df1d75874c5e2bb6d36d4916f6e7db09c3c80946b9448"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "9d7ee2b7c3c346dc2e8d6d9464bbbf44adf3bb9de64430adb87d965c27f1cb99"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d3f323a067d92b4ce30daa0ce2013f5393e339cf8a87c356c93e5d01807a8181"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "bb90ea4c4eceeaa0c663db4e18b3286ca75575f1c3f598db4685d365b4a0c6cb"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "fc229d62a10b26938d65c1c319b2bd650fdb8da1bf4d0c0430eff2d37f7e46d3"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "fcfbe38ee45cb7b0ac1eb5e7dd4312f756c58e1cd6ad2344a72e411fae1b7f76"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2343175c1a6d2058fefcb3fba9f5e060a9449a9c788d572c8826bdd8a7d68c6c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4dcc367a4cf78eb9c1ca05764999451b0f4c49b44b3332afd7b5081b0eb8363c"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d32c5a54172db28a9432b1cd5a48d1d9f75b11e9ab52d886f403761efee6c7b7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e22f1361b76569cea1733ff86b43a13db44ba7ffefb43ebc7c3ad18422486f20"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1045bdf4422d7f62bdd324f32dc5fb69a76ceac59c2379439c6b5330dd611536"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "539ec581ddfb733972d2c8948ff3010c3d4db31ddaf777b66276273bbeeec661"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "cf78e2819d4c1bcaaa00f8c8803169a6e4c226242de05dc382af4ac2e57cd6d5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b7ba4389ba62aa06a99ac44d75a5d6e7a84c8853f3ee36edc0f33fa972614d3f"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "002f1f4c9386e075da20a3c224152f4557a718688315182d84e1570279e58e8e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "66b428090754ac9add21ee1c1c361a7952fd69d2a640897c574f83c245214a24"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "74381575d09931d5807133a6e3aba9c30a9dd9aea9d33d24017d8f0345a03143"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "62e16c1ec3cd5d0989b33a34383c454e2df678b61fca9a9d8d92600224360a25"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c7c55d38dbcf8895723e1a5b22fb352bb6ecda519389a3d94d7f92ce2b4666ce"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "bd506dcd579540bfaf8153803bd5e5665b1a1a766dc4b22925be15e8b1e9c1b6"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "295e95af16afe1f1b0abf2af705a67c8a59d42460c4d5a8b66679bda27debf43"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "e90ed47a8b64314fa42302401fb56f6323f2b5eaf7a60f4c7afd68f6d072ce36"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "34c6e83e70a60dc2b14db56224b981799f3a685031c98f629b09b05d84dea38b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "c10721064b77a20c8793ea21bbc0b118647051043a346995c1f422da739d33d9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f765bfe08326a9815bfd8406b2bd4aa0e734acee8f9c30e88217da20fe57c56e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "79a17162e701f341525ccd015b5c6546faea99e654e32473156faaef381cee4a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "c09de834376cc1f242c1b3d5c6aa5e56e72e0a3ab6e99e31fba3f8891914eed9"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleMobileAds.xcframework.zip",
      checksum: "c1bcee2105845ee94349e5df17d3f4e1cd1fb15ce01b935594d9530230b8e56b"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "e6d9e70a4bc71d60cd82251ca7f9f4e4b91bfaea7d771244e841355749903bac"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "df764c64a82065fb99df34302cf26d47495b21ffa743ee4481164c2d0cf83323"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_Promises.xcframework.zip",
      checksum: "ca20fa59e87490aa04c56555640bd7c25f328e5f2c212a29f0235e104a3293e5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "860153a97868791bfdb4156ad31292775df9b3eab440a91f15e3566e39473398"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e20def54efb60268dcca6a15b1da7f2ddd219b9a3d9e403f357aea36dcd17631"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "93eb91ad75bdfe1440ca28c7962f45b4f4064e09930e4d4974a849148706819b"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_absl.xcframework.zip",
      checksum: "be8dedec7049c8770f2c4836287532a1e84f2a595f65f151f9622b96a1c61cf2"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpc.xcframework.zip",
      checksum: "7a13cb3add2627a146313e909041b44da578c64e196c6c7559c079f6dc02e32a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpcpp.xcframework.zip",
      checksum: "bcf6601b28968ead25ae483268b5e3e45a43664725ece5402e15d89a75db4128"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_leveldb.xcframework.zip",
      checksum: "4fd2a5be2f98f57695a2adde58357f10d97ab37cdf94d8388c97667964f2d90e"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_nanopb.xcframework.zip",
      checksum: "93f0480e4261a41a17c1d6cd0721ccc0030293e56e5275dfae4b631c391b8a20"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_openssl_grpc.xcframework.zip",
      checksum: "01cdcbf90bfc6e6e526e6fd30672288a99bf90228d12888d330a12308771cd59"
    )
  ]
)
    