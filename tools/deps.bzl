load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Last updated: August 22, 2021
# https://github.com/PyCQA/pycodestyle/commits
# https://github.com/bazelbuild/rules_cc/commits
# https://github.com/abseil/abseil-cpp/commits
# https://github.com/google/googletest/commits
# https://github.com/google/benchmark/commits
# https://github.com/gflags/gflags/commits
# https://github.com/google/glog/commits
# https://github.com/cpplint/cpplint/commits

def linter_dependencies(**kwargs):
    # https://github.com/PyCQA/pycodestyle/commits
    maybe(
        http_archive,
        name = "pycodestyle_archive",
        urls = ["https://github.com/PyCQA/pycodestyle/archive/aa3417b6a51f5912e32d9c8c879e1b9dd660d5f8.tar.gz"],
        strip_prefix = "pycodestyle-aa3417b6a51f5912e32d9c8c879e1b9dd660d5f8",
        sha256 = "21653cea212b8c3e3ab5934afb3138fe3b5601dc480d98d6a7c12905fb80f9cb",
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

    # https://github.com/cpplint/cpplint/commits
    maybe(
        http_archive,
        name = "cpplint_archive",
        urls = ["https://github.com/cpplint/cpplint/archive/6b1d29874dc5d7c3c9201b70e760b3eb9468a60d.tar.gz"],
        strip_prefix = "cpplint-6b1d29874dc5d7c3c9201b70e760b3eb9468a60d",
        sha256 = "153a77054c488df63a6c49fb5eed9a60b7d82afc42216dc6090cf314168e253a",
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
    # https://github.com/bazelbuild/rules_cc/commits
    # Bazel platform rules.
    maybe(
        http_archive,
        name = "platforms",
        sha256 = "b601beaf841244de5c5a50d2b2eddd34839788000fa1be4260ce6603ca0d8eb7",
        strip_prefix = "platforms-98939346da932eef0b54cf808622f5bb0928f00b",
        urls = ["https://github.com/bazelbuild/platforms/archive/98939346da932eef0b54cf808622f5bb0928f00b.zip"],
    )

    maybe(
        http_archive,
        name = "rules_cc",
        sha256 = "04d22a8c6f0caab1466ff9ae8577dbd12a0c7d0bc468425b75de094ec68ab4f9",
        strip_prefix = "rules_cc-0913abc3be0edff60af681c0473518f51fb9eeef",
        urls = ["https://github.com/bazelbuild/rules_cc/archive/0913abc3be0edff60af681c0473518f51fb9eeef.tar.gz"],
    )

    # GoogleTest/GoogleMock framework. Used by most unit-tests.
    # https://github.com/google/googletest/commits
    maybe(
        http_archive,
        name = "com_github_google_googletest",
        sha256 = "3e7bfa4a38df9e5b7b653a2e44d25306a3b31bd0ad0ec3286e22b4af60550d3a",
        strip_prefix = "googletest-2f80c2ba71c0e8922a03b9b855e5b019ad1f7064",
        urls = ["https://github.com/google/googletest/archive/2f80c2ba71c0e8922a03b9b855e5b019ad1f7064.tar.gz"],
    )

    # Google benchmark.
    # https://github.com/google/benchmark/commits
    maybe(
        http_archive,
        name = "com_github_google_benchmark",
        urls = ["https://github.com/google/benchmark/archive/8fd49d66719b37156d8e4f7bc2817665ce43664a.tar.gz"],
        strip_prefix = "benchmark-8fd49d66719b37156d8e4f7bc2817665ce43664a",
        sha256 = "08ca840df9976ff90774bc6370ad486da4b797612e091feba600277e4a72595b",
    )

    # GFlags
    # https://github.com/gflags/gflags/commits
    maybe(
        http_archive,
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-827c769e5fc98e0f2a34c47cef953cc6328abced",
        urls = ["https://github.com/gflags/gflags/archive/827c769e5fc98e0f2a34c47cef953cc6328abced.tar.gz"],
        sha256 = "ce2931dd537eaab7dab78b25bec6136a0756ca0b2acbdab9aec0266998c0d9a7",
    )

    # Glog
    # https://github.com/google/glog/commits
    maybe(
        http_archive,
        name = "com_github_google_glog",
        urls = ["https://github.com/google/glog/archive/refs/tags/v0.6.0-rc1.tar.gz"],
        strip_prefix = "glog-0.6.0-rc1",
        sha256 = "3529e415a355a13fe63f6730fafbf50572174c094cb3ba0b38c99e4bec09d266",
    )

    # Abseil
    # https://github.com/abseil/abseil-cpp/commits
    maybe(
        http_archive,
        name = "com_google_absl",
        urls = ["https://github.com/abseil/abseil-cpp/archive/refs/tags/20211102.0.tar.gz"],
        strip_prefix = "abseil-cpp-20211102.0",
        sha256 = "dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4",
    )
