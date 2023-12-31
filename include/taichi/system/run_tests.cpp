/*******************************************************************************
    Copyright (c) The Taichi Authors (2016- ). All Rights Reserved.
    The use of this software is governed by the LICENSE file.
*******************************************************************************/

#include "taichi/common/core.h"
#include "taichi/common/task.h"
#include "taichi/util/testing.h"

namespace taichi {

class RunTests : public Task {
  std::string run(const std::vector<std::string> &parameters) override {
    return std::to_string(run_tests(parameters));
  }
};

TI_IMPLEMENTATION(Task, RunTests, "test");

}  // namespace taichi
