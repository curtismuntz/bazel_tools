#include <gflags/gflags.h>
#include <glog/logging.h>
#include <chrono>
#include <iostream>
#include <thread>
#include <vector>
#include "absl/strings/str_join.h"

#include "example/cpp_lib.h"

DEFINE_string(name, "gtest", "getst print string");

int main(int argc, char **argv) {
  google::InitGoogleLogging(argv[0]);
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  FLAGS_logtostderr = 1;
  gflags::ShutDownCommandLineFlags();

  auto kMaxPrints = 5;
  auto printme = example_lib::constructString();
  std::vector<std::string> v = {"foo", "bar", "baz"};
  std::string s = absl::StrJoin(v, "-");

  for (auto i = 0; i < kMaxPrints; ++i) {
    LOG(INFO) << printme << i;
    LOG(INFO) << FLAGS_name;
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
  }
  return 0;
}
