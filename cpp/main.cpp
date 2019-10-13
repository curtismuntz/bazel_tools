#include <gflags/gflags.h>
#include <glog/logging.h>
#include <chrono>
#include <iostream>
#include <thread>
#include <vector>
#include "absl/strings/str_join.h"

#include "cpp/cpp_lib.h"

DEFINE_string(delimiter, "-", "getst print string");

int main(int argc, char **argv) {
  google::InitGoogleLogging(argv[0]);
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  FLAGS_logtostderr = 1;
  gflags::ShutDownCommandLineFlags();

  auto kMaxPrints = 5;
  auto printme = example_lib::constructString();
  std::vector<std::string> v = {"foo", "bar", "baz"};
  std::string s = absl::StrJoin(v, FLAGS_delimiter);

  for (auto i = 0; i < kMaxPrints; ++i) {
    LOG(INFO) << printme << i << " " << s;
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
  }
  return 0;
}
