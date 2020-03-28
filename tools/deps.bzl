load("//tools:github_repo.bzl", "github_repo")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# https://github.com/PyCQA/pycodestyle
# https://github.com/bazelbuild/rules_cc
# https://github.com/abseil/abseil-cpp
# https://github.com/google/googletest
# https://github.com/google/benchmark
# https://github.com/gflags/gflags
# https://github.com/google/glog
# https://github.com/cpplint/cpplint

def linter_dependencies(**kwargs):
    # https://github.com/PyCQA/pycodestyle
    github_repo(
        name = "pycodestyle_archive",
        user = "PyCQA",
        repo = "pycodestyle",
        tag = "5c6044771ce627c95b234765063ce8d3897eadbf",
        sha256 = "eb4a7898230fc3b1ea8f736aacfd5b4ef3c7434b8b1bd94da42180985c18cf23",
        build_file_content = """
# Description:
#    Simple Python style checker in one Python file
package(default_visibility = ["//visibility:public"])

licenses(["notice"])

py_binary(
  name = "pycodestyle",
  srcs = ["pycodestyle.py"],
  main = "pycodestyle.py",
)
""",
    )

    # https://github.com/cpplint/cpplint
    github_repo(
        name = "cpplint_archive",
        user = "cpplint",
        repo = "cpplint",
        tag = "851ceb00cba6301b00167cf5c313532bc05cf1eb",
        sha256 = "6e272cfd8298017bd69421c6f236d0e9a577cabf3f28715b44238f46198b54d9",
        build_file_content = """
# Description:
#    Static code checker for C++
package(default_visibility = ["//visibility:public"])

licenses(["notice"])

py_binary(
    name = "cpplint",
    srcs = ["cpplint.py"],
    main = "cpplint.py",
)
""",
    )

def google_cpp_dependencies(**kwargs):
    # Bazel rules_cc
    # https://github.com/bazelbuild/rules_cc
    github_repo(
        name = "rules_cc",
        user = "bazelbuild",
        repo = "rules_cc",
        tag = "34ca16f4aa4bf2a5d3e4747229202d6cb630ebab",
        sha256 = "e637dc045e70e43b7431fbeacb68d569a84f9fe1cb5879c432aa0855097dce57",
    )

    # GoogleTest/GoogleMock framework. Used by most unit-tests.
    # https://github.com/google/googletest
    github_repo(
        name = "com_github_google_googletest",
        user = "google",
        repo = "googletest",
        tag = "67cc66080d64e3fa5124fe57ed0cf15e2cecfdeb",
        sha256 = "6b03f70e69c242d33195a0b9509eb8c5bafb502e2830bf1c21fe8b190ff7b19f",
    )

    # Google benchmark.
    # https://github.com/google/benchmark
    github_repo(
        name = "com_github_google_benchmark",
        user = "google",
        repo = "benchmark",
        tag = "e30cac6b06cf05416a9358df8be868ab01602a68",
        sha256 = "d602bb4726b149315a00fb057f107bf52bacc56a211160832bd8948f02c18a72",
    )

    # GFlags
    # https://github.com/gflags/gflags
    github_repo(
        name = "com_github_gflags_gflags",
        user = "gflags",
        repo = "gflags",
        tag = "addd749114fab4f24b7ea1e0f2f837584389e52c",
        sha256 = "68e26a487038a842da3ef2ddd1f886dad656e9efaf1a3d49e87d1d3a9fa3a8eb",
    )

    # Glog
    # https://github.com/google/glog
    github_repo(
        name = "com_github_google_glog",
        user = "google",
        repo = "glog",
        tag = "3ba8976592274bc1f907c402ce22558011d6fc5e",
        sha256 = "6fc352c434018b11ad312cd3b56be3597b4c6b88480f7bd4e18b3a3b2cf961aa",
    )

    # Abseil
    # https://github.com/abseil/abseil-cpp
    github_repo(
        name = "com_google_absl",
        user = "abseil",
        repo = "abseil-cpp",
        tag = "79e0dc11514df035a8d07a356f9ee1800fb2160c",
        sha256 = "d22cdc9f6d3fb68558d083d0229c5a0733d5bb4af1219eb670d5ca0bb57f4c16",
    )
