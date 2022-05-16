//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "elaborate/value_infer.h"
#include <vector>

namespace firrtlsyn {
  ValueInfer::ValueInfer() {}
  ValueInfer::~ValueInfer(){}

  bool ValueInfer::value_infer(firDB::firCircuit* circuit) {
    firDB::firModule* top_module = circuit->top_module();
    if (!moduleTraverse(top_module)) {
      fs_error("*ERROR*: Width infer failed!\n");
      return false;
    }
    return true;
  }

  bool ValueInfer::moduleTraverse(firDB::firModule* module) {
    fs_assert(module != NULL);
    std::vector<firDB::firItem*>& statements = module->statements();
    for (size_t stmt = 0; stmt < statements.size(); stmt++) {
      if (!statementTraverse(module, statements[stmt])) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool ValueInfer::statementTraverse(firDB::firModule* module, firDB::firItem* stmt, firDB::firItemConditional* domain) {
    fs_assert(stmt != NULL);
    switch (stmt->type()) {
    case firDB::ItemType::kItemRegister: {
      firDB::firItemRegister* item_reg = dynamic_cast<firDB::firItemRegister*>(stmt);
      firDB::firExp* reg_reset = item_reg->reg_reset();
      if (reg_reset != NULL) {
        firDB::firExp* reg_init = item_reg->reg_init();
        reg_init->inferExpVal(module, domain);
        firDB::firType* reg_init_type = reg_init->inferDataType(module, domain);
        fs_assert(reg_init_type != NULL);
      }
      break;
    }
    case firDB::ItemType::kItemInstance: {
      firDB::firItemInstance* inst_item = dynamic_cast<firDB::firItemInstance*>(stmt);
      firDB::firCircuit* circuit = module->circuit();
      std::string inst_id = inst_item->inst_id();
      std::string inst_module_id = inst_item->module_id();
      firDB::firModule* inst_module = circuit->findModuleById(inst_module_id);
      if (inst_module == NULL) {
        fs_error("*ERROR*: Could not find the module named '%s' corresponding to instance '%s' in the circuit.\n", inst_module_id.c_str(), inst_id.c_str());
        return false;
      }
      if (!moduleTraverse(inst_module)) {
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemNode: {
      firDB::firItemNode* node_item = dynamic_cast<firDB::firItemNode*>(stmt);
      firDB::firExp* node_exp = node_item->exp();
      node_exp->inferExpVal(module, domain);
      break;
    }
    case firDB::ItemType::kItemConnect: {
      firDB::firItemConnect* connect = dynamic_cast<firDB::firItemConnect*>(stmt);
      firDB::firExp* left = connect->connect_l();
      firDB::firExp* right = connect->connect_r();
      left->inferExpVal(module, domain);
      right->inferExpVal(module, domain);
      break;
    }
    case firDB::ItemType::kItemPartialConnect: {
      firDB::firItemPartialConnect* partial_connect = dynamic_cast<firDB::firItemPartialConnect*>(stmt);
      firDB::firExp* left = partial_connect->connect_l();
      firDB::firExp* right = partial_connect->connect_r();
      left->inferExpVal(module, domain);
      right->inferExpVal(module, domain);
      break;
    }
    case firDB::ItemType::kItemInvalidate: {
      firDB::firItemInvalidate* invalidate = dynamic_cast<firDB::firItemInvalidate*>(stmt);
      firDB::firExp* invalid_exp = invalidate->exp();
      firDB::firType* invalid_type = invalid_exp->inferDataType(module, domain);
      fs_assert(invalid_type);
      invalid_exp->inferExpVal(module, domain);
      break;
    }
    case firDB::ItemType::kItemAttach: {
      firDB::firItemAttach* attach = dynamic_cast<firDB::firItemAttach*>(stmt);
      std::vector<firDB::firExp*>& nets = attach->nets();
      for (size_t n = 0; n < nets.size(); n++) {
        firDB::firType* net_type = nets[n]->inferDataType(module, domain);
        fs_assert(net_type);
        nets[n]->inferExpVal(module, domain);
      }
      break;
    }
    case firDB::ItemType::kItemConditional: {
      firDB::firItemConditional* when_stmt = dynamic_cast<firDB::firItemConditional*>(stmt);
      std::vector<firDB::firItem*>& stmts_under_when = when_stmt->when_statements();
      for (size_t k = 0; k < stmts_under_when.size(); k++) {
        firDB::firItem* tmp_stmt = stmts_under_when[k];
        fs_assert(tmp_stmt != NULL);
        if (!statementTraverse(module, tmp_stmt, when_stmt)) {
          return false;
        }
      }
      firDB::firItemConditional* else_stmt = when_stmt->else_cond();
      if (else_stmt != NULL) {
        if (!statementTraverse(module, else_stmt, else_stmt)) {
          return false;
        }
      }
      break;
    }
    case firDB::ItemType::kItemStop: {
      firDB::firItemStop* stop = dynamic_cast<firDB::firItemStop*>(stmt);
      firDB::firExp* exp1 = stop->exp1();
      firDB::firExp* exp2 = stop->exp2();
      exp1->inferExpVal(module, domain);
      exp2->inferExpVal(module, domain);
      break;
    }
    case firDB::ItemType::kItemPrintf: {
      firDB::firItemPrintf* printf = dynamic_cast<firDB::firItemPrintf*>(stmt);
      firDB::firExp* clk = printf->clk_signal();
      firDB::firExp* con = printf->con_signal();
      clk->inferExpVal(module, domain);
      con->inferExpVal(module, domain);
      break;
    }
    default:
      break;
    }
    return true;
  }
}