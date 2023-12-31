#include "taichi/ir/offloaded_task_type.h"

namespace taichi::lang {

std::string offloaded_task_type_name(OffloadedTaskType tt) {
  if (false) {
  }
#define PER_TASK_TYPE(x) else if (tt == OffloadedTaskType::x) return #x;
#include "taichi/inc/offloaded_task_type.inc.h"
#undef PER_TASK_TYPE
  else
    TI_NOT_IMPLEMENTED
}

}  // namespace taichi::lang
