#include "gtest/gtest.h"

#include "example/cpp_lib.h"

using ::testing::EmptyTestEventListener;
using ::testing::InitGoogleTest;

namespace {

TEST(FactorialTest, Negative) {
  EXPECT_EQ(1, example_lib::add_two_ints(0, 1));
  EXPECT_EQ(-1, example_lib::add_two_ints(-2, 1));
  EXPECT_EQ(0, example_lib::add_two_ints(0, 0));
  EXPECT_EQ(20, example_lib::add_two_ints(10, 10));
}

}  //  namespace

int main(int argc, char **argv) {
  InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
