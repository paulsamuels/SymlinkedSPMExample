// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "web-api",
    targets: [
        .target(name: "web-api", dependencies: [ "WebService" ]),
        .target(name: "WebService"),
    ]
)
