load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def linter_dependencies(**kwargs):
    pycodestyle_name = "pycodestyle_archive"
    if pycodestyle_name not in native.existing_rules():
        http_archive(
            name = pycodestyle_name,
            sha256 = "559a8c0aab9140ff897ca834f26b6a0328a11278936c8c6ff6653401904b4540",
            strip_prefix = "pycodestyle-f4f6e556faea76809b70413fea9f496288d56713",
            urls = ["https://github.com/PyCQA/pycodestyle/archive/f4f6e556faea76809b70413fea9f496288d56713.tar.gz"],
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

    cpplint_name = "cpplint_archive"
    if cpplint_name not in native.existing_rules():
        http_archive(
            name = cpplint_name,
            sha256 = "952d19b925ebfefbd2a7724f48682dc42617965131f8058a4732fa167734c416",
            strip_prefix = "cpplint-5a38c3a6446914740884a976c9b5cded86b98e1c",
            urls = ["https://github.com/cpplint/cpplint/archive/5a38c3a6446914740884a976c9b5cded86b98e1c.tar.gz"],
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
    google_test_archive = "com_github_google_googletest"
    if google_test_archive not in native.existing_rules():
        http_archive(
            name = google_test_archive,
            sha256 = "ff7a82736e158c077e76188232eac77913a15dac0b22508c390ab3f88e6d6d86",
            strip_prefix = "googletest-b6cd405286ed8635ece71c72f118e659f4ade3fb",
            urls = ["https://github.com/google/googletest/archive/b6cd405286ed8635ece71c72f118e659f4ade3fb.zip"],  # 2019-01-07
        )

    # Google benchmark.
    google_benchmark_archive = "com_github_google_benchmark"
    if google_benchmark_archive not in native.existing_rules():
        http_archive(
            name = google_benchmark_archive,
            sha256 = "59f918c8ccd4d74b6ac43484467b500f1d64b40cc1010daa055375b322a43ba3",
            strip_prefix = "benchmark-16703ff83c1ae6d53e5155df3bb3ab0bc96083be",
            urls = ["https://github.com/google/benchmark/archive/16703ff83c1ae6d53e5155df3bb3ab0bc96083be.zip"],
        )

    # GFlags
    gflags_archive = "com_github_gflags_gflags"
    if gflags_archive not in native.existing_rules():
        http_archive(
            name = gflags_archive,
            sha256 = "53b16091efa386ab11e33f018eef0ed489e0ab63554455293cbb0cc2a5f50e98",
            strip_prefix = "gflags-28f50e0fed19872e0fd50dd23ce2ee8cd759338e",
            urls = ["https://github.com/gflags/gflags/archive/28f50e0fed19872e0fd50dd23ce2ee8cd759338e.zip"],  # 2019-01-25
        )

    # Glog
    glog_archive = "com_github_google_glog"
    if glog_archive not in native.existing_rules():
        http_archive(
            name = glog_archive,
            sha256 = "6281aa4eeecb9e932d7091f99872e7b26fa6aacece49c15ce5b14af2b7ec050f",
            strip_prefix = "glog-96a2f23dca4cc7180821ca5f32e526314395d26a",
            urls = ["https://github.com/google/glog/archive/96a2f23dca4cc7180821ca5f32e526314395d26a.zip"],  # 2019-03-21
        )
