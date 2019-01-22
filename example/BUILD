load("//tools:linters.bzl", "cpplint", "pylint")

cc_library(
    name = "cpp_lib",
    srcs = ["cpp_lib.cpp"],
    hdrs = ["cpp_lib.h"],
)

cc_binary(
    name = "cpp_example",
    srcs = ["main.cpp"],
    deps = [":cpp_lib"],
)

py_binary(
    name = "py_example",
    srcs = ["py_example.py"],
)

cpplint()
pylint()
