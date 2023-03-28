load("@cgrindel_swift_bazel//swiftpkg:defs.bzl", "swift_package")

# Contents of swift_deps.bzl
def swift_dependencies():
    # version: 1.14.2
    swift_package(
        name = "swiftpkg_grpc_swift",
        commit = "f09cfb4d36315e2b48dbba1359179abf3cb2e6ac",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/grpc/grpc-swift",
    )

    # version: 1.0.3
    swift_package(
        name = "swiftpkg_swift_atomics",
        commit = "ff3d2212b6b093db7f177d0855adbc4ef9c5f036",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-atomics.git",
    )

    # version: 1.0.4
    swift_package(
        name = "swiftpkg_swift_collections",
        commit = "937e904258d22af6e447a0b72c0bc67583ef64a2",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-collections.git",
    )

    # version: 1.5.2
    swift_package(
        name = "swiftpkg_swift_log",
        commit = "32e8d724467f8fe623624570367e3d50c5638e46",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-log.git",
    )

    # version: 2.48.0
    swift_package(
        name = "swiftpkg_swift_nio",
        commit = "45167b8006448c79dda4b7bd604e07a034c15c49",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-nio.git",
    )

    # version: 1.17.0
    swift_package(
        name = "swiftpkg_swift_nio_extras",
        commit = "d75ed708d00353acf173ca23018b6bd46f949464",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-nio-extras.git",
    )

    # version: 1.25.2
    swift_package(
        name = "swiftpkg_swift_nio_http2",
        commit = "38feec96bcd929028939107684073554bf01abeb",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-nio-http2.git",
    )

    # version: 2.23.0
    swift_package(
        name = "swiftpkg_swift_nio_ssl",
        commit = "4fb7ead803e38949eb1d6fabb849206a72c580f3",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-nio-ssl.git",
    )

    # version: 1.15.0
    swift_package(
        name = "swiftpkg_swift_nio_transport_services",
        commit = "c0d9a144cfaec8d3d596aadde3039286a266c15c",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-nio-transport-services.git",
    )

    # version: 1.21.0
    swift_package(
        name = "swiftpkg_swift_protobuf",
        commit = "0af9125c4eae12a4973fb66574c53a54962a9e1e",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-protobuf.git",
    )
