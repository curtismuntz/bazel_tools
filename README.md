Some commonly used bazel macros and tools that I use.

* `github_repo` macro
* linters for cpp and python
* google cpp dependencies for

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
```

## Github macro
This is useful if you're defining many github third party tools that need to be `http_archive`'d from github.

In your `WORKSPACE` file:
```
load("@murtis_bazel_tools//tools:github_repo.bzl", "github_repo")
```

then you can add projects like the following (in your `WORKSPACE` file):

```
github_repo(
    name = "murtis_bazel_compilers",
    repo = "bazel_compilers",
    sha256 = "6d0f5efaa3ac073906ef3351da4038bfd081296d6307e0e87c33ffc2cc876a4f",
    tag = "eaafbe4ee813b2d1363e8022eee2218ac3e2da06",
    user = "curtismuntz",
)
```

## Linters

In your `WORKSPACE` file:
```

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

## Google C++ Dependencies

In your `WORKSPACE` file:

```
load("@murtis_bazel_tools//tools:deps.bzl", "google_cpp_dependencies")
google_cpp_dependencies()
```
