To use this:


in your `WORKSPACE` file:

```
http_archive(
    name = 'murtis_bazel_tools',
    urls = [
      'https://gitlab.com/murtis/bazel_tools/-/archive/master/bazel_tools-master.tar.gz',
    ],
    strip_prefix = 'bazel_tools-master',
)

load("@murtis_bazel_tools//tools:deps.bzl", "linter_dependencies")

linter_dependencies()
```

then in your `BUILD` files, you can add linter tests via the following:
```
load("@murtis_bazel_tools//tools:linters.bzl", "cpplint")

cc_library(
    name = "example_lib",
    srcs = ["example_lib.cpp"],
    hdrs = ["example_lib.h"],
)

cc_binary(
    name = "example",
    srcs = ["main.cpp"],
    deps = [":example_lib"],
)

cpplint()

```
