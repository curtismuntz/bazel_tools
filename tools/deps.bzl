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
    http_archive(
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
    http_archive(
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
    http_archive(
        name = "platforms",
        sha256 = "54095d9e2a2c6c0d4629c99fc80ecf4f74f93771aea658c872db888c1103bb93",
        strip_prefix = "platforms-fbd0d188dac49fbcab3d2876a2113507e6fc68e9",
        urls = ["https://github.com/bazelbuild/platforms/archive/fbd0d188dac49fbcab3d2876a2113507e6fc68e9.zip"],
    )

    http_archive(
        name = "rules_cc",
        sha256 = "04d22a8c6f0caab1466ff9ae8577dbd12a0c7d0bc468425b75de094ec68ab4f9",
        strip_prefix = "rules_cc-0913abc3be0edff60af681c0473518f51fb9eeef",
        urls = ["https://github.com/bazelbuild/rules_cc/archive/0913abc3be0edff60af681c0473518f51fb9eeef.tar.gz"],
    )

    # GoogleTest/GoogleMock framework. Used by most unit-tests.
    # https://github.com/google/googletest/commits
    http_archive(
        name = "com_github_google_googletest",
        sha256 = "07680779551cdb1fde712c5c4a28f4a637aafa05b8683648c86480570cca43f6",
        strip_prefix = "googletest-c9461a9b55ba954df0489bab6420eb297bed846b",
        urls = ["https://github.com/google/googletest/archive/c9461a9b55ba954df0489bab6420eb297bed846b.tar.gz"],
    )

    # Google benchmark.
    # https://github.com/google/benchmark/commits
    http_archive(
        name = "com_github_google_benchmark",
        urls = ["https://github.com/google/benchmark/archive/e33986a000987387c92ad29590a88fefe12e746b.tar.gz"],
        strip_prefix = "benchmark-e33986a000987387c92ad29590a88fefe12e746b",
        sha256 = "73ec0c2317aead6df34d3c92811c7660f7b8270592822ca1da696eb5d232f787",
    )

    # GFlags
    # https://github.com/gflags/gflags/commits
    http_archive(
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-986e8eed00ded8168ef4eaa6f925dc6be50b40fa",
        urls = ["https://github.com/gflags/gflags/archive/986e8eed00ded8168ef4eaa6f925dc6be50b40fa.tar.gz"],
        sha256 = "94eee3622e33eb7641614964b4ea8b7a77ed8b6e6795ee2f73124f67fe99245e",
    )

    # Glog
    # https://github.com/google/glog/commits
    http_archive(
        name = "com_github_google_glog",
        urls = ["https://github.com/google/glog/archive/refs/tags/v0.6.0-rc1.tar.gz"],
        strip_prefix = "glog-0.6.0-rc1",
        sha256 = "3529e415a355a13fe63f6730fafbf50572174c094cb3ba0b38c99e4bec09d266",
    )

    # Abseil
    # https://github.com/abseil/abseil-cpp/commits
    http_archive(
        name = "com_google_absl",
        urls = ["https://github.com/abseil/abseil-cpp/archive/refs/tags/20211102.0.tar.gz"],
        strip_prefix = "abseil-cpp-20211102.0",
        sha256 = "dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4",
    )
