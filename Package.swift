// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ios_sdk",
    platforms: [
            .iOS(.v13),
            .macOS(.v10_12)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ios_sdk",
            type: .dynamic,
            targets: ["ios_sdk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.2")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git",.upToNextMajor(from: "8.3.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ios_sdk",
            dependencies: ["Alamofire", "SwiftyJSON", "RxSwift",
                           .product(name: "JWTKit", package: "jwt-kit"),
                           .product(name: "FirebaseAuth", package: "Firebase"),
                           .product(name: "FirebaseMessaging", package: "Firebase"),
            
            ],
            resources: [
                Resource.process("Assets.xcassets"),
                Resource.process("Resources/Login/LoginView.xib"),
                Resource.process("Resources/Dashboard/DashboardView.xib"),
                Resource.process("Resources/Dashboard/PersonalHeaderView.xib"),
            ]
        ),
            //dependencies: ["SwiftyJSON", "RxSwift"]),
        .testTarget(
            name: "ios_sdkTests",
            dependencies: ["ios_sdk"]),
    ]
)
 
