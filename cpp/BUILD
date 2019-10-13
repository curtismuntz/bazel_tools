load("//tools:linters.bzl", "cpplint", "pylint")

cc_library(
    name = "cpp_lib",
    srcs = ["cpp_lib.cpp"],
    hdrs = ["cpp_lib.h"],
)

cc_binary(
    name = "cpp",
    srcs = ["main.cpp"],
    deps = [
      ":cpp_lib",
      "@com_github_google_glog//:glog",
      "@com_google_absl//absl/strings",
    ],
)

cc_test(
    name = "cpp_test",
    srcs = ["cpp_test.cpp"],
    deps = [
        ":cpp_lib",
        "@com_github_google_googletest//:gtest",
    ],
)

cc_test(
    name = "benchmark_test",
    srcs = ["benchmark.cpp"],
    deps = [
        ":cpp_lib",
        "@com_github_google_benchmark//:benchmark",
    ],
)

cpplint()
