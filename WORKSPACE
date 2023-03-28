workspace(name = "bazel_playground")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

# MARK: - SwiftBazel
http_archive(
    name = "cgrindel_swift_bazel",
    sha256 = "434cf75cbd6c3f9bd4b750a7f9c9b5bc2cc662922d24862d559abf6ecaff8b72",
    urls = [
        "https://github.com/cgrindel/swift_bazel/releases/download/v0.3.2/swift_bazel.v0.3.2.tar.gz",
    ],
)

load("@cgrindel_swift_bazel//:deps.bzl", "swift_bazel_dependencies")

swift_bazel_dependencies()

load("@cgrindel_bazel_starlib//:deps.bzl", "bazel_starlib_dependencies")

bazel_starlib_dependencies()

# MARK: - Gazelle

# gazelle:repo bazel_gazelle

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@cgrindel_swift_bazel//:go_deps.bzl", "swift_bazel_go_dependencies")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# Declare Go dependencies before calling go_rules_dependencies.
swift_bazel_go_dependencies()

go_rules_dependencies()

go_register_toolchains(version = "1.19.1")

gazelle_dependencies()

# MARK: - Xcode
http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "d02932255ba3ffaab1859e44528c69988e93fa353fa349243e1ef5054bd1ba80",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/releases/download/1.2.0/release.tar.gz",
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

# MARK: - Protobuf
http_archive(
    name = "com_google_protobuf",
    sha256 = "bf0e5070b4b99240183b29df78155eee335885e53a8af8683964579c214ad301",
    strip_prefix = "protobuf-3.14.0",
    type = "zip",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.14.0.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# MARK: - Rules apple
http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "3e2c7ae0ddd181c4053b6491dad1d01ae29011bc322ca87eea45957c76d3a0c3",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/2.1.0/rules_apple.2.1.0.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

http_archive(
    name = "rules_pods",
    sha256 = "c96bbfb6364a76e09d8239914990328e66074096038728f1a1b26c62d9081af6",
    urls = ["https://github.com/pinterest/PodToBUILD/releases/download/4.1.0-412495/PodToBUILD.zip"],
)

# MARK: - Load swift rules
http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "d25a3f11829d321e0afb78b17a06902321c27b83376b31e3481f0869c28e1660",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.6.0/rules_swift.1.6.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)
load("//:swift_deps.bzl", "swift_dependencies")

# gazelle:repository_macro swift_deps.bzl%swift_dependencies
swift_dependencies()

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

# MARK: - SwiftLint
http_archive(
    name = "SwiftLint",
    sha256 = "b8c4d765bcd8b533fcc2e15f32482a1a17572f143b65af388f7d5ac99994a99a",
    url = "https://github.com/realm/SwiftLint/releases/download/0.50.3/bazel.tar.gz",
)

load("@SwiftLint//bazel:repos.bzl", "swiftlint_repos")

swiftlint_repos()

load("@SwiftLint//bazel:deps.bzl", "swiftlint_deps")

swiftlint_deps()
