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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppAuth.xcframework.zip",
      checksum: "b499168e98e2c88f158a8512feaf9d8b794c4e78f2e54bf32304d5b61ad137bb"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppCheckCore.xcframework.zip",
      checksum: "866f2d8f4687dabc0bdf0de7fc419dcc31d8a8dce8dead80f5ada6bc1277fa98"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FBLPromises.xcframework.zip",
      checksum: "f9b9adf88c21d2880ed3f22b09d2997402094422790761b192ec1ee0fc468337"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "64229c66efe66c95046c135882929c243a713465277250e4f0803e01c6e37fac"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAI.xcframework.zip",
      checksum: "fc668f5425930d298166f8f79fbc58ff85dd0551b8b416a465cfbff8a6e0fb7e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "174e28d732d9fcb09c43c5f8ec6b7b81dbd581b91fadb15afd740edba8689318"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "3c727179b384a59af5d4e39aa0df43d40c83ed78f1cdf83e9b17636a8f8d402b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3170edb4e794e9bba02bc948fd392aafc53ec6d580faaab77032a8fb26605bbb"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "9063f190f2c6374730ae338272cb840c0b26b9f06ce3fd13ac91c53075455e0c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "1cb373acdaea837cfb550c5b3cbb9f9791f25b37c84bef1f75b5a0fd01ba4ff1"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "90987dc5e8c557dbd37b5b31a8db35259c180b7656639db2da9c0f8a74b26af2"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCore.xcframework.zip",
      checksum: "b6761bb8d6344949c702a33fb80d23676d2c8ecc16fa63e3c0a5f9c0bab1ba69"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "fbd445e58580ea17699f138e17b4ea5df672f08d764f5479cf5787b46ebb0ab6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7d2694d85a55151a9142d6a8138e08dae27b1a1e893214880380a04fd3a8f734"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "35dd4cccc5bc75db75eb292eb83208005dcd50130b01786e8cf1dcc8b8d563ac"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "04dfc64988af00bee4e2dd5395852848ca24642bcba7f82190fa45ac2479879f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "da12b2ba35ebae4907e5c23741efd636e0f22d7ac626415357a5948c54472628"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e38e7624baa55968d525a564cf93001ad262e0634e79108f4e7bb7aad17943c6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "84dcfa2258d7a0f44a42ae7c24a2d1bf6bbed6c659dd714b4afcbf99bef2eb0c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ef357b508081efc9fc3d0b094c8316c5cd03e50047177d884451ea5c497e090e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "262177e4f0289332d936b62bd46bd1c5cd727853d2738a99e431d358996d9d4d"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c7d95a12c94055d3ae683fafe6a5085258d22bf1a85e4c0e6a85feeb78db21ea"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "af263d710c0d9c833bf8e6375140d3ca8614e613ed0dfea7758104a961c9eb53"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "eee29e21a04621455e456329fff80fb89bf88b55b7b7089dc993a1b93688983d"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "31dde50f6e6bc87c227619062a9e6cebfaf4e9c7a2e5db3a3d0c9c48bc114d6e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "b5d1a2d72a0e7cdee4297335197214626acc7914cd0236949b4f78fbfc0a1383"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "0c25154ec540668623247f15c7acea796ab8817baada0c23133b6ef1a82822b6"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "87e85ffce1269127aaab8006de27d99c170f2993433269cbb4d07d6c3384e85d"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "426434b7c5e87957650a5c4d2fa62f5945372fe0f4e172d59b76559f052f3ac2"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "6d6932d2e1f746968cd8fb82c663c073099874d8f50771de695c90d04df6df41"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "5aef53b697bfbdb4717ca22725c0633523c81792081abb95e0491eb0b65d24e6"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ea70a6629142323e1b9c345a24b7224fae0dccfcb01e58fce4015283b46f3739"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0d6545c3d99a89f7aa7c7da2a5218dda619543c8a45a6c3c45e938a310f47f50"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4636de029ed05ebb7ae18dfa741a24933cc8c9c89d27d6e5059135ec9d723631"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e1c4cf8ced12d20cd147cf221f7eda9f7b54bd109b0f80f263f9266368a10bc7"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f638e195eb453a73ba9b14a22864f0f78bcd635809b5d6728c573640b2ef4773"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "7c80bc2a0e4c5b7f73427a5e460c4639c096b94fad50a5664cc3bf4c6bb105f0"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "0fed7b46771636ac310f510f1177bb2863e3502427ea8d94c5d64d02a57144f3"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_Promises.xcframework.zip",
      checksum: "71d2b9ef7f3c425422894ec7987d935ad676e1ebf9fd5d8abe7e3445f40e22f6"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ed24bfbbb5c00fecfe94e6b92cc67ffd8d68b6492e10d377599e7d54069086e1"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "bb4cd9722e144f8ecab63a4f14a0d7b5c46519843ca96ea8170f4864ddc0b7b3"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_absl.xcframework.zip",
      checksum: "8329f13df6bf5ff8aea5224fa81ae5418d7e36687036dd0e9cd2955ab8732516"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpc.xcframework.zip",
      checksum: "fa04b33e898f8f81c0f80d9c06632c9d805f7e26209fc1e7ccdb10a8129d06d7"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpcpp.xcframework.zip",
      checksum: "df9ae79649e40831808583f903cb3c1cc6a9d6d462db19450c73575286626f31"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_leveldb.xcframework.zip",
      checksum: "5d908d079b5f84458ad3e3567bdf235dcfa4d8102ae45bc1655d5264a7d26c72"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_nanopb.xcframework.zip",
      checksum: "13003395c84a88a0a11ec5cd3bd86c4815c748111ff9a6adbe8dbe8ca794c4fd"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_openssl_grpc.xcframework.zip",
      checksum: "97616f2903a7ce4b56061bea885045bb5f6edb6603367026e870baf143a32aa3"
    )
  ]
)
    