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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_AppAuth.xcframework.zip",
      checksum: "47ceb000d83eda9dcef4cdd5139abedf6ffed48691f71e79f5e9b2a3c880cafd"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_AppCheckCore.xcframework.zip",
      checksum: "1b342b57115707651a2fd19ad14b7c6725b3a8475f598164f41d2505636ed562"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FBLPromises.xcframework.zip",
      checksum: "4ca7f5e8c7bba559227a142499d9dd16a4527919a87802fa879ef3344662a529"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "15b6b0ffea53ee98519200863e5a9baa28e42e57f0dda3892f2a92f4c31a040e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "964b49fc5d4c9022d9287ae1842acb7560769ffd029193bd548c0566f0bd9ebe"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "29b6aa8e8d29e7c47d201bcd3aa14498a57097541a1ca28a5e842ca78aae6c05"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "61d63a4f5f26aca23c4b8e72fa3fcda1230e292f6ba3e3c31a8f69f0136ac6be"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9be0fa61c88a4c0bd2e08309058019c7a084af6864672c4c98c0b6b13272eed1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5fc77a9295ff9397e4e376e0c8e98798dc3f46c140f78914c5c437fe1b83b455"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "b9ea227a33218c298c76a1ca05a13f6f278000943b7382b076af58472c817eb7"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "20d2100efd50399b5fb68a80d54d1081310e4b278889c722a39ff39af1e90647"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCore.xcframework.zip",
      checksum: "fe893f41069ebab82292d63d9d0d946e8c1ba1cb5df932869247b8df58504678"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "117e11e3a087be790bd2009e1d581e90e6fc544e2574796d233f53e10358d758"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "ad9b979ca39a02f71f063546722066baf2f8e19aea07359e4f79b643ea5463f4"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c3144f80c5f1935284c9ed7532663af2a873bab33de19564cc8bde7c0ba218c1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d6a93ec1bfa76fb11d0e423a8f451a92730bfa616464b8e757402f7ea0f14c6b"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "7dbefba1e5f09ff56e80eab5dd1c2f51c0f147656cac1589a8dc80a2cdb143d3"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6430913c6aa35a8de22df2f95bd56b037ef9de626e49e821c3c426d4dfbb15c3"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8a368a8c8b7822aa5c578743f103511d94414aa03e33b1f3fe999c3de23280ee"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "10e49799f77a1c63dda02deaa007935355fd475cdb9a0c32e9ecac9d0d664209"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "735f8fe65044f777af53b2c63d0f95a4dc166094b16d1cfd1229dfee97253815"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ee35c7aab878956ae70a41a40913f49f09e899d16beebedda0d4d882c1cdde7a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5a54ff35b29f4310808b71d81754008fa2c1e567984c783191e2fa229bed8c4a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "cfadefc5fe4d2b196c9a96e47ecb26330c4cdfe9b276f871b735223e5a5afbd9"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "2c34f84f20f39c5ad3a1c44feb21a5ffdf844bede2b9491e2e148bb825be7f9a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "d4be7116da9e90096101e08dc4ed4a7202ed79b1bc977ee500d9ec74d127aefb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3175e189f10c737790fe1a634582300d2b228389dd4cce1637ba900a10b2f345"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "6a444217153592b6e6b6637e0923db7c30c6a063fc4ea533c1bb6e4e17aa809f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "219467bf4e9d3424cffe2d6991615b8fa536d44e863386e943c87adeff9d0c8a"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "25231afb19af88d55a872af84ffca11d38497738115d460ea7559293bc0cda83"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "fe393de148c0c342dde69dfc2d71ee3c74c5638706d5f58933d6edf9b4fe9e5d"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "199010607c7c7f7709220a7e55191d457e219dfbe321d5c116e41b9e977f0295"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "8e520fd977a0c34a7b023a2fe6969e002d2cc6e9d6bc3ebbfb591de5cc76ee29"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "95cdc4fa791b2ecf7deb87772976ec5993cf6b6d150c1579442685d6d8dc82f9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "df6de807fd62c840651eb9b6d2f87ce132d35555ac67ca03f9ec5d30567ff047"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "baad463764dbe39312e4360bc3de64f4e4d2d2d77134e22fc1fa5762c5608d54"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b91fc5963d1f90bf9ead2fa31e0875394124cc62e50ca0ed858c2909163a8189"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "8c80a3b51aabaf45d4cd1f0f93ec90860a54fb0caf924d262cf684feca826b9b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4a73a56c7b318dfec5f2585a14dd58bf53855c71c05ae74f583efa289a807934"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "85a1a77444b988ae8f8b6b19404af1a6ce9867af764feb5680f2be1c542429ce"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "12056574ccf08c8107f9a00fea23f58d6ec01484f6058c246e3341584826374f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_Promises.xcframework.zip",
      checksum: "17c0219e963f82b75dfa0f4037baabc76b41e6b5a277a67d8314c703795fc417"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0dee5b5cb4b972e43f9310c787de9f175e609d0b5ac40b7b8d70fbad78595c9d"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_SwiftProtobuf.xcframework.zip",
      checksum: "04c9d0ae7f49e07af838c804e89f7098d690fc974d5b5058fdc0addcdf3c41fc"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "8860712fd8800ff7de27bdae8179b78078431624ee5494f05102979bfbc70d96"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_absl.xcframework.zip",
      checksum: "6d3f12ca56fbded7fe0af2224b82271b3797f387d48191546ab7761a5e01715c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_grpc.xcframework.zip",
      checksum: "a35f5a6d39842ee50e23ee61711d03b52e431e62b65607a024e2374b625c1dca"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_grpcpp.xcframework.zip",
      checksum: "41e6dbbd033e48532c349b6d316f21f2137e26b79a323c07486b68525109f1d3"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_leveldb.xcframework.zip",
      checksum: "38c65a86d86e7310152d8c0840afe4c9e93529115ea16f1c4328c67e25f0a0b4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_nanopb.xcframework.zip",
      checksum: "7f9e867dde27d7e003e80dc25d5ce319651f1f6b794498495ceada37e21892f4"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_openssl_grpc.xcframework.zip",
      checksum: "23e4d5a989e1b017b929c62b2de286e0d86ab1893758925b604fc60c27bb002a"
    )
  ]
)
    