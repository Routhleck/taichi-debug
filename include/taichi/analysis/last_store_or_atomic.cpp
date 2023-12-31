#include "taichi/ir/ir.h"
#include "taichi/ir/analysis.h"
#include "taichi/ir/statements.h"
#include "taichi/ir/visitors.h"

namespace taichi::lang {

// Find the **last** store, or return invalid if there is an AtomicOpStmt
// after the last store.
class LocalStoreForwarder : public BasicStmtVisitor {
 private:
  Stmt *var_;
  bool is_valid_;
  Stmt *result_;

 public:
  using BasicStmtVisitor::visit;

  explicit LocalStoreForwarder(Stmt *var)
      : var_(var), is_valid_(true), result_(nullptr) {
    TI_ASSERT(var->is<AllocaStmt>());
    allow_undefined_visitor = true;
    invoke_default_visitor = true;
  }

  void visit(LocalStoreStmt *stmt) override {
    if (stmt->dest == var_) {
      is_valid_ = true;
      result_ = stmt;
    }
  }

  void visit(AllocaStmt *stmt) override {
    if (stmt == var_) {
      is_valid_ = true;
      result_ = stmt;
    }
  }

  void visit(AtomicOpStmt *stmt) override {
    if (stmt->dest == var_) {
      is_valid_ = false;
    }
  }

  // Only if **both** branches finally store the variable with exactly the same
  // data, can we forward it to the local load statement.
  void visit(IfStmt *if_stmt) override {
    // the default return value: valid, no stores
    std::pair<bool, Stmt *> true_branch(true, nullptr);
    if (if_stmt->true_statements) {
      // create a new LocalStoreForwarder instance
      true_branch = run(if_stmt->true_statements.get(), var_);
    }
    std::pair<bool, Stmt *> false_branch(true, nullptr);
    if (if_stmt->false_statements) {
      false_branch = run(if_stmt->false_statements.get(), var_);
    }
    auto true_stmt = true_branch.second;
    auto false_stmt = false_branch.second;
    if (!true_branch.first || !false_branch.first) {
      // at least one branch finally modifies the variable without storing
      is_valid_ = false;
    } else if (true_stmt == nullptr && false_stmt == nullptr) {
      // both branches don't modify the variable
      return;
    } else if (true_stmt == nullptr || false_stmt == nullptr) {
      // only one branch modifies the variable
      is_valid_ = false;
    } else {
      TI_ASSERT(true_stmt->is<LocalStoreStmt>());
      TI_ASSERT(false_stmt->is<LocalStoreStmt>());
      if (true_stmt->as<LocalStoreStmt>()->val !=
          false_stmt->as<LocalStoreStmt>()->val) {
        // two branches finally store the variable differently
        is_valid_ = false;
      } else {
        is_valid_ = true;
        result_ = true_stmt;  // same as false_stmt
      }
    }
  }

  // We don't know if a loop's body will be executed, so we cannot forward
  // the "last" store inside a loop to the local load statement.
  // What we can do is just check if the loop doesn't modify the variable.
  void visit(WhileStmt *stmt) override {
    if (irpass::analysis::has_store_or_atomic(stmt, {var_})) {
      is_valid_ = false;
    }
  }

  void visit(RangeForStmt *stmt) override {
    if (irpass::analysis::has_store_or_atomic(stmt, {var_})) {
      is_valid_ = false;
    }
  }

  void visit(StructForStmt *stmt) override {
    if (irpass::analysis::has_store_or_atomic(stmt, {var_})) {
      is_valid_ = false;
    }
  }

  void visit(OffloadedStmt *stmt) override {
    if (irpass::analysis::has_store_or_atomic(stmt, {var_})) {
      is_valid_ = false;
    }
  }

  static std::pair<bool, Stmt *> run(IRNode *root, Stmt *var) {
    LocalStoreForwarder searcher(var);
    root->accept(&searcher);
    return std::make_pair(searcher.is_valid_, searcher.result_);
  }
};

namespace irpass::analysis {
std::pair<bool, Stmt *> last_store_or_atomic(IRNode *root, Stmt *var) {
  return LocalStoreForwarder::run(root, var);
}
}  // namespace irpass::analysis

}  // namespace taichi::lang
