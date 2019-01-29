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

# We can't set name="cpplint" here because that's the directory name so the
# sandbox gets confused.  We'll give it a private name with a public alias.
py_binary(
    name = "cpplint_binary",
    srcs = ["cpplint.py"],
    main = "cpplint.py",
    visibility = [],
)

alias(
    name = "cpplint",
    actual = ":cpplint_binary",
)
""",
        )
