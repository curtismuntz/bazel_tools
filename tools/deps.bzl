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
        tag = "9726e10004e5615c432f126530ee0540b9903f6e",
        sha256 = "fb3b819e67230be8f34cbdfe9ec13e87941cab593fdb002f02a87c9de51c255f",
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
        tag = "dfd26b636c1307556ceedfb148d94fac1349fae8",
        sha256 = "6eb681d226706552a5259feb38a800f46e860ed318946ae6f1d2402b641c71c0",
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
        tag = "12a2d801f69ca8fff9128a8044549d7cbac306f1",
        sha256 = "7bf35294e204d8f68a282060690a9be80ccbbd478619c3f98cdc3110d1f3594e",
    )
    # GoogleTest/GoogleMock framework. Used by most unit-tests.
    # https://github.com/google/googletest
    github_repo(
        name = "com_github_google_googletest",
        user = "google",
        repo = "googletest",
        tag = "ba513d2c9525a7c986c115ed5d603f2cf17c6016",
        sha256 = "15e558e199cc51b813d44c2e8c08e5c608828b8a40632a544dcc4baaa5fc8750",
    )

    # Google benchmark.
    # https://github.com/google/benchmark
    github_repo(
        name = "com_github_google_benchmark",
        user = "google",
        repo = "benchmark",
        tag = "309de5988eb949a27e077a24a1d83c0687d10d57",
        sha256 = "d72d82607eaf525138d7cf0a32e98e03ae584579df964d8f05fb1512f9c5c4af",
    )

    # GFlags
    # https://github.com/gflags/gflags
    github_repo(
        name = "com_github_gflags_gflags",
        user = "gflags",
        repo = "gflags",
        tag = "0b7f8db2c6b1b0b2451da0923a9ab09cc610e8d1",
        sha256 = "55e4b0f7111d7b87cb99b1edc8d7c753a3bfdd783e929698d36482e1161ad2ab",
    )

    # Glog
    # https://github.com/google/glog
    github_repo(
        name = "com_github_google_glog",
        user = "google",
        repo = "glog",
        tag = "4cc89c9e2b452db579397887c37f302fb28f6ca1",
        sha256 = "ec4a7a3d256ee0a192334644839f00dfdce78949cfdeba673b7339982e573db6",
    )

    # Abseil
    # https://github.com/abseil/abseil-cpp
    github_repo(
        name = "com_google_absl",
        user = "abseil",
        repo = "abseil-cpp",
        tag = "e9f9000c7c80993cb589d011616b7a8016e42f4a",
        sha256 = "d7bc757613cc7701813a9686cd9c62610538f1098bb07dca23f3056afd9e79ad",
    )
