Some commonly used bazel macros and tools that I use.

* `github_repo` macro
* linters for cpp and python


## Usage


in your `WORKSPACE` file:

```
http_archive(
    name = "murtis_bazel_tools",
    urls = [
      "https://gitlab.com/murtis/bazel_tools/-/archive/master/bazel_tools-master.tar.gz",
    ],
    strip_prefix = "bazel_tools-master",
)

load("@murtis_bazel_tools//tools:deps.bzl", "linter_dependencies")

linter_dependencies()
```

then in your `BUILD` files, you can add linter tests via the following:

```
load("@murtis_bazel_tools//tools:linters.bzl", "cpplint", "pylint")


# place at the end of the file
cpplint()
pylint()
```

Note to make these work, you'll need config files: `CPPLINT.cfg` and `pycodestyle.cfg` present at the root of the workspace. Be sure to also export these in the `//BUILD.bazel` file:

```
exports_files([
    "pycodestyle.cfg",
    "CPPLINT.cfg",
])
```
