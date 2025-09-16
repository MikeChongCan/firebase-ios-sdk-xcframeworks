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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppAuth.xcframework.zip",
      checksum: "2ea49d85c850955c989c2681a7e39df1c4efed567fa5453e684ea7baa9da0cec"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppCheckCore.xcframework.zip",
      checksum: "9eaf77190eb275c636e4f474c248e9b82ede7ec6d6fdbf945b2bab083c89458c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FBLPromises.xcframework.zip",
      checksum: "eed76a71dd263be1fb642203fba32c7b6ade8e7cd7b216108110b526907c46fb"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "fc2f67ce6f63c40c032c7f1c2587d441455eefa7e664bbcf09fe35d65fd41b8b"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAI.xcframework.zip",
      checksum: "092f15758d5815850e9a614618e1ff0729fe0e3781d6bd8f3aa2ef064a52725f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "37c9730df0f114a56accd6d6414b167d70a8a9f09cdfdb44e3814384bedde118"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "f0acf62ed6added599af923a82a75f6f47773cfa7a07762b739f89ceb6a89295"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "c24fc23bf567cfded532bf9be58851ab22cd1e4925848fc9a578600e8c819425"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d70905abded205926513feb63f02b269584a875a23e9adb16f29831c43054832"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "e012bf08a861a330ee38ca83ecc91709cab10aa8b72b19345c60cddf9cfa2c44"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cec2cdc1e25394f25d4ca6dfaafbb44c8a9fa8efe831b9334fe432e2b87609f4"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCore.xcframework.zip",
      checksum: "4af02442751f82176d780ada927c004758a216f2929c03d1738c4669b4bed61f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b76bfb623e81ee486b3016c8afc0c91491e91b33bc032371213c5cf7655e3e1b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "6cd7c38eb6b23f9840c97c71fc7eb25eeccb7477e04d871250638cb92689288d"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "582591e9e44eb71cd6f1346793e692e1497c26124efff3f9e34ca5f51cc5cb1a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3b0e3dc2f7bef5271f9395e4d93fb0f64b71ddf271ae6d1f69ca6b17e3fc79f5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2fd84b17f7d76d1db9c948ab823cbe0c2e34237e3d737a41a80bd4de5a58ef53"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "12b6ce68bdaa0249f864e3ec9ba01f5bb569b229584e81edd3d624fdebb9fe62"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "42e5b0c5100cf53334c8e2addbacfaff827e37ccb08c5b534f596e7ffcc70a09"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ca21d8b60467340595186e11c69706632bddd5fde2ba3e5c0c00b1ac52f7e306"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "fe89e82303a66b5cbaf9c7a37c50cbb5b71823792b6f92edb451c2f9d37be1da"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "9ab2e97abd30cb848991a655225889f511742a0770313f2282e5a1540292b8a8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2fc2c223f665a407997fc779bbd8df277b71fb65c7f78c02ca3464120fd99afc"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "75c6650af400273d8a51f53bf99a526c2cbb4529bd9b26bc908ed1cb67015511"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "da61eb04913e47cfae383de752b98760a63ba6b5be03da2d6c281ba77f63862c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "44e3ef38d727146ab74b703ab8631d844b974ece00104237425569135deb53bc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "61e76d1a02d8ce7dfd58d3188e58f26393f416f22d6384ca7a65553751f84241"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "2f4c3d2b317ba4d32aee0b0240a9087d0e1de08e1f89005a7e356d3c7f055c87"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "86184a46f5099d579a912dfc020c2afbb311a13c04203d121a4eabcab8538f37"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "f72627317e335b6464d99f3c0c9448e2be6b5f4dfb1f5168b7156a2ce9209cd1"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "c46cbfb6dde80eb0c2a8682755ed00be6dd67c525d2d747fd44ff779704474ce"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d38d05ad3fc1a4855dfde2c30435b83a374d0bf706e9d3426378afe0e1e911da"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "3a3d35a48703b429c7f3f99b582c3224ca57c09c551e22372d798106cf27ba9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8678d15a0a2bbb426d25447ab0446ffa29732cfbbf58d48f7ec2c32a8e2be399"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "19eb5978dd5162eb4ccac9c1d96e5b96e761543e9efbbb7c364ad45857b26733"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "c847aaea25db9da5f2313b06d9d5c2b4f0878f2f259a528b81dcf20a8d10a720"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "1bb5a285b281b362536bc06a75bc30b8fff6b417f7ea9f402866d0bbb7fe352f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "63ca5d32d91241d902e45a0ec7e847ebbf6aa7525d41a0fa2be949f033c94633"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_Promises.xcframework.zip",
      checksum: "4f58343a0666a8fcf33a54359d43c35bbdbeb8f1f4a04aa3d0a655e6b0301302"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6c5d9d6e77138cc6237ad3571c195c317572fc00f2cbf791ac17e3c4336b4f38"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "6e1d53c15c74410962987a99347bbd0a83d09eb339545bf204ba568ed56dfbca"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_absl.xcframework.zip",
      checksum: "129e279eaad71854e8e63925e5dca18756001d7b66f4bae964c2bd6b963cae37"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpc.xcframework.zip",
      checksum: "6971fe501d852cffef96ef5ef20664ef02605bda5df7c77c45d2ed205242328d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpcpp.xcframework.zip",
      checksum: "e6d4b9787b6c2b2188aa36e23602d7c64cc01e5309bf039649c1ddd139db8067"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_leveldb.xcframework.zip",
      checksum: "eb4aeacc1e67b39c7ac0c49c136ae5670859911966ff5b824d3b7df802819b42"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_nanopb.xcframework.zip",
      checksum: "6e188e536033778d12f82b411f0edf6f5981a61e674d46c32d044d39d74c452c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_openssl_grpc.xcframework.zip",
      checksum: "2312b1f3cd627ebf613b106aa5f8fccf7dbff3eff3c71703fecd00ea4af6996e"
    )
  ]
)
    