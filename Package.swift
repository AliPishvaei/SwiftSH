 // swift-tools-version:5.3
 import PackageDescription

 let package = Package(
     name: "SwiftSH",
     platforms: [
         .iOS(.v8)
     ],
     products: [
         .library(
             name: "SwiftSH",
             targets: ["Libssh2"]
         )
     ],
     targets: [
         .target(
             name: "Core",
             path: "SwiftSH",
             exclude: ["Libssh2.h", "Libssh2.m"],
             sources: [
                 // All Swift files except Libssh2*.{h,m,swift}
             ],
             publicHeadersPath: ""
         ),
         .target(
             name: "Libssh2",
             dependencies: ["Core"],
             path: "SwiftSH",
             sources: ["Libssh2.h", "Libssh2.m", "Libssh2.swift"],
             publicHeadersPath: "libssh2",
             cSettings: [
                 .headerSearchPath("libssh2")
             ],
             linkerSettings: [
                 .linkedLibrary("z"),
                 .unsafeFlags([
                     "-L$(PODS_ROOT)/SwiftSH/libssh2",
                     "-F$(PODS_ROOT)/SwiftSH/libssh2"
                 ])
             ]
         )
     ]
 )