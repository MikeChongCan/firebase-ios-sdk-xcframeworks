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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_AppAuth.xcframework.zip",
      checksum: "2a7ef95da37f103da110c3e681270f777e83496d430c86ba34d8dcce5b322071"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_AppCheckCore.xcframework.zip",
      checksum: "0557646906dc81762a071f51b84b437d8ecd1a35e9d8da5afe59509eb99efeed"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FBLPromises.xcframework.zip",
      checksum: "ebd2c0be11c73c2165d18d8ac069fb158438dd836efd139b3455a6d54818506d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "3f580e765ba928728b44f2dc7e33101689128710481b0320dbd36849e79cfea4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "9b83a3fa52ebc04f2462383d475fe8824705c2f1539349ab1ef61cc59851cb0c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "2db4f500ceb678c41dfdf2febf176d891c437ca1f5f4769e84731611f3ab346e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c396d781dbc1428a4422c73e10b7d78af89a81b5fbcf9ae55187ba950e233f0b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "23dbe96b041c49259ee80b762c4beb919f3e06f38bf29508d25ae1209b839aa6"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "107d83ea8b4364a6ecb1158df50e3ef2912b527bba34d00bb2ad0b56e33337eb"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "aaf13b113fac72353523b36597dc71d87d821502d109fcfd4ef429853bb963f2"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "bb09097318177923d3b9cdf442c178867d8db5a51d81503c33e7c0bdd18d3fe8"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCore.xcframework.zip",
      checksum: "f15be68f44ac969ac584e0e23591bfa99be8ba658f6528981e9390a3953ba63e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "6b93fefbef11bef2a2b3f7182f26a3b2291798a0f267cd8ba545acca4c79f8c9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "9d223703b8ffb1e2a97796169d54c262a6a611889ef121a01d8aa16d16dfe551"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "00b0b61f417d8af7094c5d5dac1a2929d9449fef1f359cd5b968d167f7c29e0e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "cb8205f1acc95529b977978bd3d275324760208830e950608e6b569b2e81bf1d"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "3ea28d88f632b09d7b13206259609f1ec2daf3b4258cfb40f3297c2c3c4b190c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ce2c9d648669748ea0520143d319a8c95e0dbe8df0d8f06931b31946ccaef572"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8f450481f2f2d2e0cd5589460c1770acd900eb0c4d558b070def8f61321333d8"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ee860fdd6d8bbdfe89380ec23c4524799e70a9c96bab09def65dfc44dc791d1e"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "252c08957b6c89ba38a09c9d9de3142d3db216b4b7d51f35a74c03ba58222246"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "2af0fb456223f4e582f464af30dead44aeee7d8eabdae1356d20f8d0465f0c2a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "92be33226179176355b0e9e0fdf0bc3ac5149820f71e7d3dde884b3ccc74112a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "65b4dac6c09305b6725cc47bc85d55317a3d09bd86fb3f2be9c5fcceea953a84"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "a8b60374145f65a8319b06c50e18cf139e159b2c3ed78c55ef9f55f01d11acc0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "3177c374e7f43dbf44a3be39f1cfc20626b835ef8cac6478050110b8155f5875"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3bf6298475248fc0b1b7ccadbcddee1b9584814a4c569c31a6af8994364f54a6"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "e2992a98633ded18e945ec07e98f7a998d6a739975b09df04a43ac9b9d873e29"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "f8c04cab176819bfec233de6a8a984eee66844bc52af408fa74caf3241c92210"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "76453659ce9c8ca8bb3de982284ebd2947386478ada5c5d46856b34065a6c6ef"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "95fa16b5a726c73a45c4a294d809015e3534fcea30eb6ecbbce2043e96b5e8eb"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "4c5a0f0e98efccca9348c87bf4ceabd860abdb50218fb71666755072c753ff61"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "7172b78d4dc1bb9d9738130c8a02bf6fec77208b1210e6edb43928062953cc37"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "98c29017008c9110c5750b8a7565faf23157c5d77b7d611ccda58814e8d2387c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "681747e0b13e1c76d9da0b37f73a40c940396a93ca79274941fb027d87b9fdd3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "53efdeb0c12d6adc70a4bc42697d6b15219f5b245bff10bb2fe9364fb3de2662"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7865f74b63243c5df80d8258699182ced86ceff45e43f4b11ba168755315cd41"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4e4bdeab0dd6156e13cb7ce9375b2181c9485e3f84fe311a051aee8d5e870885"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cad716bac97766305f30ec8fed066f6d8f35dd1057609a78496f9d6ba623918"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "2baa3668f721d876151310eace874a3d7fb686fe406b166cc9c397e55c5aee58"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "e1b8999971ea4dafbb407bb38855cc7fee5f1119a088c2c1789886a83e2f85bc"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_Promises.xcframework.zip",
      checksum: "384fcf716e43579912576a8f6b32e00c16356e9adef57a7281e0fc2dd4d2f07b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_RecaptchaInterop.xcframework.zip",
      checksum: "188c6332c59da52c7ee33c391c70ec4d1730a9f28aae7e7b72b62eaa585af53f"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_SwiftProtobuf.xcframework.zip",
      checksum: "5034c7dabc5e9c6c17aaf20e0a1810670cc1577502097987daa97a94dbd1c403"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7f3dc415bf1c84fe50b38c70cb3aef9275dfe35642efef1f20f60a93839f2556"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_absl.xcframework.zip",
      checksum: "8a44381e08c9d03ee08fdc58b37151d17479a53191922955eb2b433bbf2390ae"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_grpc.xcframework.zip",
      checksum: "2bd404577e4fa76a1f457614e61d9c4234888c57d81461c6f4ce291f463adbf9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_grpcpp.xcframework.zip",
      checksum: "9f197cd243f97ea17a3f26cd28a5526d3fead8f49e8be0537e50b174be30c4a6"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_leveldb.xcframework.zip",
      checksum: "ce191158bfd326a8c714387b4522f6a2ea673c72a3936c2b026b87af88c28954"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_nanopb.xcframework.zip",
      checksum: "19a0d40d994b652710c5b55d7ac4cb782d9cc1fe46b5e8998243f70235a7f856"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_openssl_grpc.xcframework.zip",
      checksum: "44822d59bddd8ed3b6718b8e6ec818e60b63dd26a7081e78b69ac2501dd1330f"
    )
  ]
)
    