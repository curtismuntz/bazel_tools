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
        tag = "c47f5c1f977c20f16c19bc282834c70c9b40d800",
        sha256 = "259b55c158c000d5e4aa406aff452eaceaff4ce66c51d49454fcbfb39aec6770",
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
        tag = "fa30cca65ff7da6fcb8773725bda7c8455d292a6",
        sha256 = "97fc4276d658e7ffad72432b1ad17eeaaa31ba95a08b47a055d9b2f93994ac53",
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
        tag = "40548a2974f1aea06215272d9c2b47a14a24e556",
        sha256 = "cb8ce8a25464b2a8536450971ad1b45ee309491c1f5e052a611b9e249cfdd35d",
    )

    # GoogleTest/GoogleMock framework. Used by most unit-tests.
    # https://github.com/google/googletest
    github_repo(
        name = "com_github_google_googletest",
        user = "google",
        repo = "googletest",
        tag = "f3ef7e173fd0853069f16c4b5afc7e80a350604b",
        sha256 = "c9c916fa8e4ccc3ac53a5882563a8626e5878c3220bb14b13caf153f2f7d1d05",
    )

    # Google benchmark.
    # https://github.com/google/benchmark
    github_repo(
        name = "com_github_google_benchmark",
        user = "google",
        repo = "benchmark",
        tag = "8df87f6c879cbcabd17c5cfcec7b89687df36953",
        sha256 = "800112ff3ca87344e034d8f8f2d081c945d218c02a2ab6dc1025a091e29f279e",
    )

    # GFlags
    # https://github.com/gflags/gflags
    github_repo(
        name = "com_github_gflags_gflags",
        user = "gflags",
        repo = "gflags",
        tag = "827c769e5fc98e0f2a34c47cef953cc6328abced",
        sha256 = "ce2931dd537eaab7dab78b25bec6136a0756ca0b2acbdab9aec0266998c0d9a7",
    )

    # Glog
    # https://github.com/google/glog
    github_repo(
        name = "com_github_google_glog",
        user = "google",
        repo = "glog",
        tag = "c8f8135a5720aee7de8328b42e4c43f8aa2e60aa",
        sha256 = "e71eee9b71c69e9c378efd474d9d8a389492cca43b02977813b961f8fc16d30e",
    )

    # Abseil
    # https://github.com/abseil/abseil-cpp
    github_repo(
        name = "com_google_absl",
        user = "abseil",
        repo = "abseil-cpp",
        tag = "9c6a50fdd80bb39fabd95faeda84f04062685ff3",
        sha256 = "8b55c4262cd7acf30a087aab7f643a59598e0f66f891cba682d7d981e548a9bc",
    )
