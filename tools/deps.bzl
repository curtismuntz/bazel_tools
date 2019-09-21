load("//tools:github_repo.bzl", "github_repo")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def linter_dependencies(**kwargs):
    github_repo(
        name = "pycodestyle_archive",
        user = "PyCQA",
        repo = "pycodestyle",
        tag = "f4f6e556faea76809b70413fea9f496288d56713",
        sha256 = "559a8c0aab9140ff897ca834f26b6a0328a11278936c8c6ff6653401904b4540",
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
        tag = "5a38c3a6446914740884a976c9b5cded86b98e1c",
        sha256 = "952d19b925ebfefbd2a7724f48682dc42617965131f8058a4732fa167734c416",
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
        tag = "b6cd405286ed8635ece71c72f118e659f4ade3fb",
        sha256 = "8d9aa381a6885fe480b7d0ce8ef747a0b8c6ee92f99d74ab07e3503434007cb0",
    )

    # Google benchmark.
    github_repo(
        name = "com_github_google_benchmark",
        user = "google",
        repo = "benchmark",
        tag = "16703ff83c1ae6d53e5155df3bb3ab0bc96083be",
        sha256 = "6e40ccab16a91a7beff4b5b640b84846867e125ebce6ac0fe3a70c5bae39675f",
    )

    # GFlags
    github_repo(
        name = "com_github_gflags_gflags",
        user = "gflags",
        repo = "gflags",
        tag = "28f50e0fed19872e0fd50dd23ce2ee8cd759338e",
        sha256 = "63ae70ea3e05780f7547d03503a53de3a7d2d83ad1caaa443a31cb20aea28654",
    )

    # Glog
    github_repo(
        name = "com_github_google_glog",
        user = "google",
        repo = "glog",
        tag = "4cc89c9e2b452db579397887c37f302fb28f6ca1",
        sha256 = "ec4a7a3d256ee0a192334644839f00dfdce78949cfdeba673b7339982e573db6",
    )
