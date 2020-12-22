// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "cmark-gfm",
    products: [
        .library(
            name: "cmark-gfm",
            targets: [ "cmark_gfm", "cmark_gfm_extensions" ]),
    ],
    targets: [
        .target(
            name: "cmark_gfm",
            path: "src",
            exclude: [
              "case_fold_switch.inc",
              "CMakeLists.txt",
              "cmark-gfm_version.h.in",
              "config.h.in",
              "entities.inc",
              "libcmark-gfm.pc.in",
              "main.c",
              "scanners.re"
            ],
            publicHeadersPath: "."),
        .target(
            name: "cmark_gfm_extensions",
            dependencies: [ "cmark_gfm" ],
            path: "extensions",
            exclude: [
              "CMakeLists.txt",
              "ext_scanners.re",
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../src")
            ]),
    ])
