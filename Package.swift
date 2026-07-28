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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppAuth.xcframework.zip",
      checksum: "f74d63f386f5736f60eccc4c52baab7d819de4735c1cf3725fa1f0b758214ba2"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppCheckCore.xcframework.zip",
      checksum: "cb3477216200a66179e25f1ee47eabe471264b7431e8ab9302ae41b2c334c37b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FBLPromises.xcframework.zip",
      checksum: "1a85fac336927958328e8835cb49b425e42891f5907865acd29ff0aabcd76d85"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8c502e9f3115b4a6ce97ce2cf438854b227f6d01aca2fed6bb756cd20ae94fbf"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAILogic.xcframework.zip",
      checksum: "1c2acbd20571132039cc4f30ac7c75a33589a74e41ced11ed7a01f0dc0e5cc48"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3630d447d0dc429448f4543e55349e3b4e4a7daea7a89b257aa27454b70d78cb"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8c87b12ae55884ee339886639b76911f9e1153f3dd813808a9800d0d42614a2e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e2a3f2d9b5bd85ffab55520dba0b1d9c99070fcf5e90922c6c6d748fb3176a02"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4d952b1be0417a155fd9c002d43fcd32d1fc2e956cc5f4842c7eb5ae7a2214d7"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuth.xcframework.zip",
      checksum: "1058cd1f270636f834c63fb3c6c832c4f6c026aecaca0b4d22a6f35249bdace3"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "49e65ddf1a011b8e500d58afe92211084a24e84dcc773b874ddeea81a43bc994"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCore.xcframework.zip",
      checksum: "4ea9769ac7d283c290c19fb647c4e4784984344852efa94113c5f9d2d98a28a0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7329cc0f6e09df2c4e8086271a4eee8a1d807526047261dbff31cb6cd829850d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b1c3ece2c7de50f900ebc822a5bf762890d7164d93b8b3905a5319e8ad23474b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "df193b71fa09c973cd89154dbe77560d89a74101ef9c69b638d55565fc654280"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseDatabase.xcframework.zip",
      checksum: "08c301b24bf68574ec1176999e560bb6af328303fea68e4dc0f81b42c259e71d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestore.xcframework.zip",
      checksum: "35f6f6ab1a1bcd1fed6df17335e7b9554c41320864bf432e3d8a08e1f711f1b9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "29188d1fef0ad9d2d09bad51029ffd15ff5691077be484815ff43bbd1d5ffa01"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFunctions.xcframework.zip",
      checksum: "918694d7d5bfebd634d3a250b6a38796fdc9b0198eeee577dc5380e2da369d09"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5c385bc00c5859576b29b27a17383df6463f53cf8cf122eb119d1bfe9be96fa5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInstallations.xcframework.zip",
      checksum: "243d17850e831ce3870340ac1761f6419ca4e19008d309b56a38b5e751c9da48"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e017f5f910f06ab4bf2817a132729e69df1720a8eb024678b9a8dd6c80c4c6be"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessaging.xcframework.zip",
      checksum: "81ebd2e4d5d280c1a0f4da8dab8a874362af8f590f598d9e1ee44964cbdbd457"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ef3192b3cf9768224befd320d1eb8fd8c3fbd563a44c5aab8e216861b42d5d81"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebasePerformance.xcframework.zip",
      checksum: "97f3323c1f9255d63efdf653d4ae1658be0ca292c10275a29b348ba03adc23db"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e4915c209066b7eb865e523f76a5c2ec6504f1c12ca11e6ee366d5a4c26c6d6d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "85848d9e1e9b7a7316a3b64fbbc028ef8d4e6ab46b0dc21052cb67cf84f30991"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSessions.xcframework.zip",
      checksum: "235074a8536c495e9b696bdecafd1032ac9df1914f258aad838214e0d10a601c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c7ce2a19347b27bfc54a9f14b292b8ea4a9a501653a7d8fef5073330f11d25f4"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseStorage.xcframework.zip",
      checksum: "23f1e3e2851437c2681beb3e591214498bc8a070fcc350e58560000d59d75bd8"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMAppAuth.xcframework.zip",
      checksum: "97bcf26e06717950c3d48ae19adad15747009d4e7316eb75444a1192b249f153"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3af76c27558161eb710d227989c29e893f57a3ab9d5541c54ce2006a42714ce8"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0f088b8a085e62a38b016e33f04d000511deb0e6a0b15ada507cd73512593582"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "247b4e1cae3cb70ffcb83ef1de4e1fcf97d15caf033dc92a516592cc9573c060"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2d2ce59ba24d02466da697bfab0865989c5eeaa01726995cff5ee22ed97e7955"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e7439f39e49fa34d4d52def9f18477dffb2cf74b9615042577530b7694b5e860"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleSignIn.xcframework.zip",
      checksum: "ac2300d1ace53732d347ed2877f4f7cdafeeac491619bca8fc02156058749572"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleUtilities.xcframework.zip",
      checksum: "9f2b87e52ee266762c7455544830b8afc13140b7a6b35381aa8e5721d9694c41"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_Promises.xcframework.zip",
      checksum: "9dff748b73a35b58c96d82079c254b831350b5502e6bb189e24785a6fac45001"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_RecaptchaInterop.xcframework.zip",
      checksum: "b012cc552cff5ebab6770f8eca3ef7c6524177738c4c10ef2ec04e2a8d814e36"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_absl.xcframework.zip",
      checksum: "b7732e6f0fa97b25f042bbf125d4c4aad879a39188271bc86bc5bb5b434b9bdc"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpc.xcframework.zip",
      checksum: "68284e5d0bb3c856ddb510db57638ea328398f51cfb7be1fd404d53a22863844"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpcpp.xcframework.zip",
      checksum: "cbbaf78f7dba9fb93513164f2dc200aee3a46c2f298fb8f4229a050c250a0790"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_leveldb.xcframework.zip",
      checksum: "ec23ecde5700a120732ebf05adc57a11221e160bce4e1f72bdd346d245229e01"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_nanopb.xcframework.zip",
      checksum: "e33fa9786b005552f28016929430f2b67d361a2f536c9c6c9cd6d92f92da37ab"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_openssl_grpc.xcframework.zip",
      checksum: "d1f5b0d9de9816ece3706e5e586d7a8394fbdf75ffb67544632441ee29c62ee3"
    )
  ]
)
    