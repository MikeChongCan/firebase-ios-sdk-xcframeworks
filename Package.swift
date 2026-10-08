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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_AppCheckCore.xcframework.zip",
      checksum: "bb28577da78d5eb8e8087fc165724e0a058bf159a593f1993fd117f7f88ad034"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FBLPromises.xcframework.zip",
      checksum: "5b077be43294035688fca3ca1f2feae77f294a4ea307f59f113b837a0a635968"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseABTesting.xcframework.zip",
      checksum: "a27631f94b8c35074f82a7e27467d4e81b4bb3a9e141c83612b567bb62787482"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAILogic.xcframework.zip",
      checksum: "f15acd668dc3470643c7f158bdfb72e99b8acdf4b6a985fc95b6355f5fa55d5f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "990193149ad1d608f102d1646ccd8ef2eb6b0e7794dd566b30b5f9d88299f76e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "eb5bf7c13ca577d6bf6543f3ae4a2175095cf937f777d673d8ca754cb582255f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6d2a2a4f62345f7abfbf694ba9eb6573780475868293da616fd999dafaf696b5"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f70ea8e76b7556d0299986b9c5e66e5b843826d523dd44a3244f0f5210c98c6b"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuth.xcframework.zip",
      checksum: "49a12d9bcf127cc49836528313be45caa62317e9a55e9aa53fa3c230a409f20e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "eb7dca1b275b6c265594200ad0ff9f7393d987807253ce5bc40b9032eb96829a"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCore.xcframework.zip",
      checksum: "fbb68d7c4b3ff33029b8623005f2708f9ab25fe7b766494c732f49166a716a1a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f0084b0564db535544894f6aa09ad0c056d0ae1b3c4e14097ea7c99297ed21f6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b33aa7d0aa8268ed4744cdc0c9a41789d032a06c707c2019ed8199a5e1c2deee"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "69dcef7aa09182e4c2451189b5eb2cf7e981b630bf9d556d86823b97ddfbf962"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseDatabase.xcframework.zip",
      checksum: "7ad49d9ebfbc74302196057d4894d92e7b47c4142d2890e72ca6c606356f2f28"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestore.xcframework.zip",
      checksum: "a76972712651de7eda4c49e18099d7bbbeeab93722fb526557e817b2076af40f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "93288cb47bb1dbe2f11c5b6ea675a702c3a417f393a7115675e5d559b0f98354"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFunctions.xcframework.zip",
      checksum: "60bd5a5161f6b5f3aac3802367692fff772d431ab53a57ca904dcc9e1fc12ca1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "aca527e2e3b71eedacfd856bdd769d78d20dea7ef7c4fb44fe2555c3c111e43e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInstallations.xcframework.zip",
      checksum: "a8cee4970fa12274fc7baa1fe6947ec4bb4e41422b7ac73817e1b3ed3c1ae698"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessaging.xcframework.zip",
      checksum: "bbe780c1a326fe5f9ef7f8f869886a3e0d8b92e36fe4bab5d9b03b42a535eeea"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e2e4bc252036dff24b9e5db264138f9c3db0d26b212523ee86fd3ad87765bdd8"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebasePerformance.xcframework.zip",
      checksum: "2c4e8422822283cfce68e402ee53e5c4893aaa23189ef8fd2e52f51775a45edf"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3a24e2684ae024c47e630ef288096d9b7d6bd955826b6f19a75746ff161e20cd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "b876c054f88288a1855a5331518197a5bd709d81913e7d08e2d9418a6c7f8742"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSessions.xcframework.zip",
      checksum: "52ef555bcb72468feb5155b3ac761abce54feab29a01c1584e28d80fb7ff8851"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ee4b18696ff79654a6e326ba84775f1be205dde185d97038f0e295dd1214b7dd"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseStorage.xcframework.zip",
      checksum: "9c2c4c3cc57eb88f5ded99fd9177cc22228c5ccca864f6cc30585f3eb755cf8d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "73ce90ed46c269afd9f6584b44f6da54672dbbca59c0cd91e4c1a5a0b7fbb7d6"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "70f013777ffcb9591b0d66a4cefddf6c9682717374cb504beb39a62b3ecc986e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8293ae6ffa367041cf555491ee648a75b7fdfd8de6a00f5607319ae98b5d2fb9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4fa7e406c7dd99a94126449ece821144a48ffac38e61fc40677ead1be93c5963"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleDataTransport.xcframework.zip",
      checksum: "7481768a97d78f9bdd23fb369023e989c90e3225e7847e865c025dc1062039ac"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleUtilities.xcframework.zip",
      checksum: "89eaa9d44e43fb9f231db0317052c9cf291de111ebfebe0c4ad09c9695263bc7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_RecaptchaInterop.xcframework.zip",
      checksum: "5a17a7a056858f0603a76f2aae3d8cfc1d0deb1226271a71af718e4dc8278214"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_absl.xcframework.zip",
      checksum: "1a40bb0f45d70518c4b550f1d5508af8bf92e5fd631ab9a9d16306c0a5b94a25"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpc.xcframework.zip",
      checksum: "2048f28f94fdaeb6b4ea5a909028a3fd0280117df05c76de287794db2cb5abba"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpcpp.xcframework.zip",
      checksum: "122acc1dc5ab6bf9af54291e231d0d5b9e0aa532e9be0324a9156a2a6145eafc"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_leveldb.xcframework.zip",
      checksum: "f4445f69bb797987cbded76cadadcfa00bd9f76c5c08ab865a96b00c497947a9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_nanopb.xcframework.zip",
      checksum: "35a3be861daafaac8f8b1f00a995cf05503d449a3567f3a228a4a561dc4b9574"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_openssl_grpc.xcframework.zip",
      checksum: "8922a1283a4aa68884af047c0e003bf7dce03a031c304670ab7d68980089535f"
    )
  ]
)
    