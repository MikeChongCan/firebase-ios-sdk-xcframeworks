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
        "_FirebaseAI",
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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppAuth.xcframework.zip",
      checksum: "b252f02d0711852abb20fbafecac1e1d8f70c5706dcda53ab555aa3926ce3e7e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppCheckCore.xcframework.zip",
      checksum: "d15c30497fd942470ffef27f19145641286983a81be861355554c299d41d0718"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FBLPromises.xcframework.zip",
      checksum: "e4b2f8e838d8bdbc2cf03e6992b2b63bd7e46e369b9b2ffa1a1a67f8c48057b6"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c60132abccb07dc72035861279ee5dd0ecfbe1bc8585b0840deea94eb7ec29f5"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAI.xcframework.zip",
      checksum: "759cb5b9fbfcd8e4c8ada46e807b4aa7aeff9535ebb0ad67f3b96dcdad573d53"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "8b83c63e8678656d471fb21ec0eecc637252c60408b99f7f97cc3f04e185ccb5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0b911d6724b38f47cbe028ae58eac36cd29b8396cf1b7227d95ce06b239ecda4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "2c647eeb4ab3f55b3152d05aae7039164e941ed36ad0c3d85de39b8aec9fe929"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f8b0d971b5045cf2931d4c527f72697f51b616f8993509061040fb902a0f4b59"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f8103c769654a33671a2a40bdad6354a561e64fef8e87c7472d210c45fbfa588"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "660fbd2a851a677e0957fd014cd125b77b7d0babba82f99df1e06009dfce9c17"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "c59d73cb06a6b4bb338f88e1e11957b9dd28622b41da1f18ec6589fa91effbd4"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCore.xcframework.zip",
      checksum: "e108b47bf9bcb1db791204580ad9bea92cb1688c25dc47516caad82af682f550"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7ce59e2269a9f99b61c5bb9aae5e5964a108536c063cc29af367cc0a54319db7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0f4ff73335b9c8b64db12e3282d52380155fce12dc70b9d576152ee84299ba15"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "b523a290d2b82c4f45e64cd21caa9af0c150e32b2292c9db7f719bad0a208fd9"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "33d4212db205c36ab67fd8e399b040e30327b08152dc188f03d5a6f32f82c9a1"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "35fbfba07efa57fbd14c35543025201555ef98665ae0d884b69363a1f785fcd2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "eb1483b933113aeb10218894b6ed20d69570227460c2d7a3d2a4a5d0245f2ca9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "3c6dea92e38257ecdbdaefd4ba23126528c3e4ead2941409781c83a0dcf75fa6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ed6cbfc7237276d14246e7e499d3ccf48095a6d4857dc5533aea88d45e784e21"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fa9d7b9792f285540be6eb477d2c77d9542db1a586a6a4ced54f5b4f4bb55361"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "8e0c8804d7e135a0f92263932a427488af91f98ac1d940cededa96f6045f8bf6"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b152c0559412e396b77ed4840a9854e3bd9913e9f449195642489e770b09bb49"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "eaa1644889d4615534b15fe0b93627883846dad86853cb0b444384bd733013bb"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5e4a6184ba25b5e66ea6ab0af719e3ddb0ff0ef663f1fc60817f4aaaf0bfb58e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "e743b508af41ce2781c88fb10e8ec48fc87d19070c9ce491eb2ca5f7845f3b3f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ac3eacacdfa9c3bf66e03d3d672fda1308fd8c72a3ec425609d11660555795bb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "29416e3d638225f65ab03b0de61a5131470598001e4526d8abc47d2efcbadba5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "7347f668a5ca1edd5e0d556d2042a638cf8e39d22846de6e32969563b0bf9075"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "2d86ffc82a2540ffdf143464ae2a0d6fddbfd19259211bef2fbb0dc58f41bd39"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "cf3ede118794184c96c337b975141a209f0404019a27d3d2059eddf002a09421"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "034e39b2ca812dbdc472b1d6f64c1f45b07eca335a136c512116133ea43babb8"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "7fc346960e49d8a17f7475e445ea64fe7646919aaf7096ba37d2fac832293033"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "27da727e9b8c6a8890b6fc92f0b99bc08426c5dd863e775575a9ea4f79261028"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "4b89eefd4502a5e9d735f010530815b88f565301a2871a4850749fd4950a65e4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e43e388cee4b93b68309fe41e18458c6bd9f60dc96b44b78a10473cb1c877603"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f4d2d2225d9d6822a2b83af54253557afcd7295307bee55db88ad1a8fae25424"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f220885cc2005477d9610233b45eb8f53cca976f8bd7095e75039eab58ff04dd"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b985e4e8c0bf39184a332475dc5e065145cac6ac12513daedc96ac32208c1793"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cce96eea650a223c6a094a5a8a02ef028b246ee29b687b58ccf9e384b108019"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "f278e0d9c8d6d4a3c83420a3d4662aeeaf779644c380039c556c23eee2325876"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "624050e6a53235766c498568d26a6ed4908f26ee2bc2fbf0987d10c007c75bf4"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_Promises.xcframework.zip",
      checksum: "9262ae7f6cb8d1ed02e85d6c2d63af289c795a90260caf528f54683db4ba592b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "651153063d2dd7c552f2413bcd4645320cdd6c71308e493f89006fc26c577bd9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_SwiftProtobuf.xcframework.zip",
      checksum: "18c8e014499065d1a2e26100b693824a5acf4938111d4f2f904c1c30d2b9f00a"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "d6db0f82ba96022250f6381d71be79905bfd0ceaef3240761580beba15acc189"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_absl.xcframework.zip",
      checksum: "54a102d601ef122eb61cfe6cd7b06923f57e0bbab57d9abc6c1835d10350a74c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpc.xcframework.zip",
      checksum: "c29f700139f72fbcc8e367581dbcc842f8c9f13d28ea6bca24821272a5d70b3d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpcpp.xcframework.zip",
      checksum: "6704d5a828abf645d1e58eb387f864ce0b097dc5d9918bf527379184cddbfdd4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_leveldb.xcframework.zip",
      checksum: "301073479672473d24fce24e5329ed5e0bc467159b9cfee318ab7b4c8a0d108d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_nanopb.xcframework.zip",
      checksum: "f1aae6d41821a06c41fad561fc74488ed4a8a61d4e17c8edaf2e13cb1f368589"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_openssl_grpc.xcframework.zip",
      checksum: "d4d382ac2f4a902d34ee93a0918cc42dfb9f2ab35c788d37103cd7ca7ed6c2c2"
    )
  ]
)
    