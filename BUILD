load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application", "ios_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

# MARK: - Gazelle
load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")
load("@cgrindel_swift_bazel//swiftpkg:defs.bzl", "swift_update_packages")

# Ignore the `.build` folder that is created by running Swift package manager
# commands. The Swift Gazelle plugin executes some Swift package manager
# commands to resolve external dependencies. This results in a `.build` file
# being created.
# NOTE: Swift package manager is not used to build any of the external packages.
# The `.build` directory should be ignored. Be sure to configure your source
# control to ignore it (i.e., add it to your `.gitignore`).
# gazelle:exclude .build

# This declaration builds a Gazelle binary that incorporates all of the Gazelle
# plugins for the languages that you use in your workspace. In this example, we
# are only listing the Gazelle plugin for Swift from cgrindel_swift_bazel.
gazelle_binary(
    name = "gazelle_bin",
    languages = [
        "@cgrindel_swift_bazel//gazelle",
    ],
)

# This macro defines two targets: `swift_update_pkgs` and
# `swift_update_pkgs_to_latest`.
#
# The `swift_update_pkgs` target should be run whenever the list of external
# dependencies is updated in the `Package.swift`. Running this target will
# populate the `swift_deps.bzl` with `swift_package` declarations for all of
# the direct and transitive Swift packages that your project uses.
#
# The `swift_update_pkgs_to_latest` target should be run when you want to
# update your Swift dependencies to their latest eligible version.
swift_update_packages(
    name = "swift_update_pkgs",
    gazelle = ":gazelle_bin",
)

# This target updates the Bazel build files for your project. Run this target
# whenever you add or remove source files from your project.
gazelle(
    name = "update_build_files",
    gazelle = ":gazelle_bin",
)

# MARK: - Sources
tests_sources = glob(["UrlGet/**/*Tests.swift"])
swift_library(
    name = "UrlGetClasses",
    module_name = "UrlGetClasses",
    srcs = glob(["UrlGet/**/*.swift"], exclude=tests_sources),
    deps = [
        "@swiftpkg_grpc_swift//:Sources_GRPC"
    ],
    visibility = ["//visibility:public"],
)

swift_library(
    name = "UrlGetClassesTests",
    module_name = "UrlGetClassesTests",
	testonly = True,
    srcs = tests_sources,
    deps = [
        "@swiftpkg_grpc_swift//:Sources_GRPC",
		"//:UrlGetClasses",
    ],
    visibility = ["//visibility:public"],
)

minimum_os_version="15.0"

# Top level targets
ios_unit_test(
    name = "UrlGetClassesUnitTests",
    test_host = "//:ios-app",
	minimum_os_version = minimum_os_version,
    deps = [
		"//:UrlGetClassesTests",
    ]
)

ios_application(
    name = "ios-app",
    bundle_id = "Google.UrlGet",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [":UrlGet/UrlGet-Info.plist"],
    launch_storyboard = "UrlGet/UrlGetViewController.xib",
    minimum_os_version = minimum_os_version,
    visibility = ["//visibility:public"],
    deps = [":UrlGetClasses"],
)

# Xcode related
xcodeproj(
    name = "xcodeproj",
    build_mode = "bazel",
    project_name = "ios-app",
    tags = ["manual"],
    top_level_targets = [
        ":ios-app",
		":UrlGetClassesUnitTests",
    ],
)
