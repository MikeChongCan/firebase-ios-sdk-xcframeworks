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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_AppCheckCore.xcframework.zip",
      checksum: "d831719777e025e67d9ff47166d0349d9c477195c2c59f44366a899134705cd8"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FBLPromises.xcframework.zip",
      checksum: "edd8c94acc8e1e06de390b557ec05125bf4922b60282f8a5c637a48565dc7366"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseABTesting.xcframework.zip",
      checksum: "a6d4a58c17da5463309f54b971df4fff3ab3a7f66b373534327f3f4df476c510"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAILogic.xcframework.zip",
      checksum: "3f28fd95d2893d054f27171a28ed0616f88390f21c322cf80b4b4a3b416a5c85"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAnalytics.xcframework.zip",
      checksum: "ce28dd90e291c974ee9c3ee52c766e35369a256e83d5b5fe089f9f7bae28e138"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheck.xcframework.zip",
      checksum: "ed0a8f0c45c9b5c1a17e202a0ae5c4b9825ac2fea69139581d0c4a07538c42f2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1fe6dda6e2b076a3545ba26d58b386ac8f11c0bac6e328c61593290b1a080be2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppDistribution.xcframework.zip",
      checksum: "358301fc1f502f9899f8fe89b67581e2116cdefc5229e25573805ba88eaa66cc"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuth.xcframework.zip",
      checksum: "805ca9277ba106e1b1381caba2fbac76037e239312e1b6b5184433d99613cb61"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuthInterop.xcframework.zip",
      checksum: "88c8a2acfa7eb077add35021f1002484a26ca351b337214865d394a2fa661ad5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCore.xcframework.zip",
      checksum: "3042b9a2beab3f0b4ab584bbd63eeb4e85d23e528e19cffedb2e0b95564a5451"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2b8bece879889d3e11e0d3c594d2c6cbe5388f1a671c810a0dbc9c817c34cc2d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b9d965f76f3b6bfb8ff4cf59c4f29836328d874d59d8e41c41c30c9c57371f28"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCrashlytics.xcframework.zip",
      checksum: "557bf70bfe1326ec09e89b48bd5e7e0e3e082db7a18a645d0aeb50f896a93ef8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseDatabase.xcframework.zip",
      checksum: "d9f1ab2b128dec798b1eac79fccb82bca9719474174731b9db480774c769760c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestore.xcframework.zip",
      checksum: "9a19af225fbc1d3babc43752f791b01d7cfbe3d1721ae18bc118591344ca82ca"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b9a59124f33bc2e8171a232e9c725369a7b70fae6b6402c9e57a9c1ca143ff8f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFunctions.xcframework.zip",
      checksum: "703a87325ef9daffd7cecc3678c3e28d99ca3379ee9fb9c03247dfac4bbf37c5"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "50d5678379a6443aee4bd32265a52c81a30ebcd2625cd7885de3baf61c0f4e81"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInstallations.xcframework.zip",
      checksum: "8d228ad75150a5494fee5c3b5875232f842d468de07beb600628ed5b539ea1cc"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessaging.xcframework.zip",
      checksum: "0999f55813c800eecdbd9aaea9109bd836a85f2abbd3d60ee18f27d190ebd3f4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "56210d7105633efe85d319d580bf1443c7076b68064cfa335b7e08ee1e5ebe39"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebasePerformance.xcframework.zip",
      checksum: "4b5e9278923d0157592397f6b9d258ca9d594826b4679bc5bbfa0d8dd1c46d75"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "bc70f4a114076c8787b79ee5d20e3ede26210724422380c77e26aba859105104"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d1e0c0a06dcded0e468e4c1c6278b7aba5ddee3f8038aaa31a25c13537760cc5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSessions.xcframework.zip",
      checksum: "a1c42de1cad6dc5f9189ab4e8183f373033da9f7d2a0137f1cffd0400da84bbd"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSharedSwift.xcframework.zip",
      checksum: "833c64272ec19d4a54599195b9306769ac84a857f58326102fe86cde121c2d7c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseStorage.xcframework.zip",
      checksum: "b8534bd6a5de7ecdd05a6db2faeeb9b9c434cd10de7ef3076d5b722fc87b9ae4"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GTMSessionFetcher.xcframework.zip",
      checksum: "f00d248540ff5d8488479e9a38d4e4fff22c2bfd87f126506e57f91f951d091c"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "942034a316495d767694bffe60fbbe745169165c3f33ee30d40b13de8906ed97"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f98e32dced7114c00be8784e105bcce3940b8ba8c9250e6a84fe2123b441bf59"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "82e73782094f3fc471bdbed725083a7e84095c18413f242698b28e5abafb484a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleDataTransport.xcframework.zip",
      checksum: "3a28b4a7731a1aa0c1777fb3ddd6d53ffce1a38b51dbe93027776602865d93a5"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleUtilities.xcframework.zip",
      checksum: "b9540135d0093b195bf1ede106eaff6414c340b674d59484a517d02c793e1b29"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_RecaptchaInterop.xcframework.zip",
      checksum: "ff44b5b82f028b09b507f66c9c4c0748d21309f273c77a18938cdddf8abfdf12"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_absl.xcframework.zip",
      checksum: "69680359f15f1c510b1baecf604290cda678143428d50ab2977e6439b06b3b2a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpc.xcframework.zip",
      checksum: "bf32872c5c140a635210ff16d56723fa83252af738fe1e972bdca57c13504ccb"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpcpp.xcframework.zip",
      checksum: "d94584ead384732e1a191cd84d3d1a87294668ccc78d50b6c68a07eeafd5ab51"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_leveldb.xcframework.zip",
      checksum: "ef043409359b13fb9f441c229a1fe644b60d2ba84dfeb6656a2d548880762022"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_nanopb.xcframework.zip",
      checksum: "ac1d4b4534194d4a3e1b9c0b7e476dc466b6be1754c19086b44890c5184c6903"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_openssl_grpc.xcframework.zip",
      checksum: "543603b37dff94c11fdd6a90c1a9e06d81f5f5f0ea3fb34fccb97e14edc7cb8f"
    )
  ]
)
    