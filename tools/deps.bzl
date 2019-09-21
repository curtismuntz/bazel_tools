load("//tools:github_repo.bzl", "github_repo")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def linter_dependencies(**kwargs):
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
    # GoogleTest/GoogleMock framework. Used by most unit-tests.
    github_repo(
        name = "com_github_google_googletest",
        user = "google",
        repo = "googletest",
        tag = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528",
        sha256 = "89439545b04326bc8a9540c665aee5cdb23b728e75ef6cfbfa85b0508ee278e2",
    )

    # Google benchmark.
    github_repo(
        name = "com_github_google_benchmark",
        user = "google",
        repo = "benchmark",
        tag = "e7e3d976ef7d89ffc6bd6a53a6ea13ec35bb411d",
        sha256 = "0d792b82be4ffa66a0ba49006ada626c81a9ce38bf6755ba184acb6eb0da01e1",
    )

    # GFlags
    github_repo(
        name = "com_github_gflags_gflags",
        user = "gflags",
        repo = "gflags",
        tag = "2cac878761b29776f0e95a191a03c08a2ac0f014",
        sha256 = "94bac08d85632e6d32b7f090c218756b33cc898ba55ab5845060bbb4660e02e5",
    )

    # Glog
    github_repo(
        name = "com_github_google_glog",
        user = "google",
        repo = "glog",
        tag = "4cc89c9e2b452db579397887c37f302fb28f6ca1",
        sha256 = "ec4a7a3d256ee0a192334644839f00dfdce78949cfdeba673b7339982e573db6",
    )
