//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "elaborate/infer.h"
#include <cmath>
#include <vector>

namespace firrtlsyn {
  Infer::Infer() {
    width_infer_ = new WidthInfer();
    mport_infer_ = new MportInfer();
    value_infer_ = new ValueInfer();
  }
  Infer::~Infer() {
    if (width_infer_ != NULL) {
      delete width_infer_;
      width_infer_ = NULL;
    }
    if (mport_infer_ != NULL) {
      delete mport_infer_;
      mport_infer_ = NULL;
    }
    if (value_infer_ != NULL) {
      delete value_infer_;
      value_infer_ = NULL;
    }
  }
  bool Infer::infer(firDB::firCircuit* circuit) {
    fs_info("*INFO*: Running infer...\n");
    firDB::firModule* top_module = circuit->top_module();
    if (!moduleTraverse(top_module)) {
      fs_error("*ERROR*: Traverse module '%s' failed!\n", top_module->id().c_str());
      return false;
    }
    if (!mportInfer(circuit)) {
      fs_error("*ERROR*: Infer mport direction failed!\n");
      return false;
    }
    if (!widthInfer(circuit)) {
      fs_error("*ERROR*: Infer width failed!\n");
      return false;
    }
    if (!valueInfer(circuit)) {
      fs_error("*ERROR*: Infer value failed!\n");
      return false;
    }
    return true;
  }
  bool Infer::mportInfer(firDB::firCircuit* circuit) {
    fs_assert(circuit != NULL);
    if (!this->getMPortInfer()->inferMportDir(circuit)) {
      return false;
    }
    return true;
  }
  bool Infer::widthInfer(firDB::firCircuit* circuit) {
    fs_assert(circuit != NULL);
    if (!this->getWidthInfer()->width_infer(circuit)) {
      return false;
    }
    return true;
  }
  bool Infer::valueInfer(firDB::firCircuit* circuit) {
    fs_assert(circuit != NULL);
    if (!this->getValueInfer()->value_infer(circuit)) {
      return false;
    }
    return true;
  }
  bool Infer::moduleTraverse(firDB::firModule* module) {
    fs_assert(module != NULL);
    std::vector<firDB::firItemPort*>& ports = module->ports();
    for (size_t p = 0; p < ports.size(); p++) {
      firDB::firItemPort* port = ports[p];
      firDB::firType* port_type = port->type_data();
      getUnknownWidthType(port_type);
      bool passive = port->evaluatePassive(port_type, port->dir(), false);
      port->set_passive(passive);
    }
    std::vector<firDB::firItem*>& statements = module->statements();
    for (size_t stmt = 0; stmt < statements.size(); stmt++) {
      firDB::firItem* statement = statements[stmt];
      if (!statementTraverse(module, statement)) {
        fs_error("*ERROR*: Traverse statement '%s' failed!\n", statement->toString().c_str());
        return false;
      }
    }
    return true;
  }
  bool Infer::statementTraverse(firDB::firModule* module, firDB::firItem* stmt, firDB::firItemConditional* domain) {
    fs_assert(stmt != NULL);
    switch (stmt->type()) {
    case firDB::ItemType::kItemWire: {
      firDB::firItemWire* item_wire = dynamic_cast<firDB::firItemWire*>(stmt);
      firDB::firType* wire_type = item_wire->type_data();
      getUnknownWidthType(wire_type);
      break;
    }
    case firDB::ItemType::kItemRegister: {
      firDB::firItemRegister* item_reg = dynamic_cast<firDB::firItemRegister*>(stmt);
      firDB::firType* reg_type = item_reg->type_data();
      getUnknownWidthType(reg_type);
      firDB::firExp* clock_signal = item_reg->clock_signal();
      firDB::firType* clock_type = clock_signal->inferDataType(module, domain);
      fs_assert(clock_type != NULL);
      firDB::firExp* reg_reset = item_reg->reg_reset();
      if (reg_reset != NULL) {
        firDB::firType* reset_type = reg_reset->inferDataType(module, domain);
        if (!reset_type) {
          fs_error("*ERROR*: In line %d, the type of reset signal was not found for the register statement. Specify the type of the reset signal and rerun.\n", item_reg->line_begin());
          return false;
        }
        firDB::firExp* reg_init = item_reg->reg_init();
        firDB::firType* reg_init_type = reg_init->inferDataType(module, domain);
        fs_assert(reg_init_type != NULL);
      }
      break;
    }
    case firDB::ItemType::kItemMemory: {
      firDB::firItemMemory* item_mem = dynamic_cast<firDB::firItemMemory*>(stmt);
      firDB::firType* mem_type = item_mem->type_data();
      getUnknownWidthType(mem_type);
      break;
    }
    case firDB::ItemType::kItemCMemory: {
      firDB::firItemCMemory* item_cmem = dynamic_cast<firDB::firItemCMemory*>(stmt);
      firDB::firType* cmem_type = item_cmem->type_data();
      getUnknownWidthType(cmem_type);
      break;
    }
    case firDB::ItemType::kItemSMemory: {
      firDB::firItemSMemory* item_smem = dynamic_cast<firDB::firItemSMemory*>(stmt);
      firDB::firType* smem_type = item_smem->type_data();
      getUnknownWidthType(smem_type);
      break;
    }
    case firDB::ItemType::kItemMPort: {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(stmt);
      std::string mem_id = item_mport->mem_id();
      firDB::firItem* mem_item = module->findItemExceptMPort(mem_id, domain);
      fs_assert(mem_item != NULL);
      firDB::firType* mport_type = NULL;
      unsigned int mport_depth = 0;
      if (mem_item->isCMemoryItem()) {
        firDB::firItemCMemory* cmem = dynamic_cast<firDB::firItemCMemory*>(mem_item);
        firDB::firType* cmem_type_data = cmem->type_data();
        fs_assert(cmem_type_data != NULL);
        fs_assert(cmem_type_data->isVectorType());
        mport_type = dynamic_cast<firDB::firTypeVector*>(cmem_type_data)->type_data();
        mport_depth = dynamic_cast<firDB::firTypeVector*>(cmem_type_data)->depth();
      } else if (mem_item->isSMemoryItem()) {
        firDB::firItemSMemory* smem = dynamic_cast<firDB::firItemSMemory*>(mem_item);
        firDB::firType* smem_type_data = smem->type_data();
        fs_assert(smem_type_data != NULL);
        fs_assert(smem_type_data->isVectorType());
        mport_type = dynamic_cast<firDB::firTypeVector*>(smem_type_data)->type_data();
        mport_depth = dynamic_cast<firDB::firTypeVector*>(smem_type_data)->depth();
      } else {
        fs_error("*ERROR*: The MPort '%s' was not attached to a memory. Attach the MPort to a correct memory and rerun.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      fs_assert(mport_type != NULL);
      fs_assert(mport_depth > 0);
      firDB::firExp* addr_exp = item_mport->addr_exp();
      fs_assert(addr_exp != NULL);
      firDB::firType* addr_type = addr_exp->inferDataType(module, domain);
      fs_assert(addr_type != NULL);
      fs_assert(addr_type->isUIntType());
      if (addr_exp->isUIntNumberExpression()) {
        if (addr_exp->isUIntExpression()) {
          firDB::firExpUInt* addr_exp_uint = dynamic_cast<firDB::firExpUInt*>(addr_exp);
          BigInt* addr_exp_bigint = addr_exp_uint->big_value();
          unsigned int addr_exp_value = addr_exp_bigint->getUIntValue();
          if (addr_exp_value >= mport_depth) {
            fs_error("*ERROR*: The address value (%llu) was larger than or equal to the memory depth (%zu). Correct the address value and rerun.\n",
              addr_exp_value, mport_depth);
            return false;
          }
        } else {
          fs_assert(addr_exp->isUIntBitsExpression());
          firDB::firExpUIntBits* addr_exp_uintbits = dynamic_cast<firDB::firExpUIntBits*>(addr_exp);
          BigInt* addr_exp_bigint = addr_exp_uintbits->big_value();
          Big* o_addr = addr_exp_bigint->getBig();
          std::string s_mport = std::to_string(mport_depth);
          BigInt o_mport(s_mport, false);
          Big* big_mport = o_mport.getBig();
          if ((*o_addr) >= (*big_mport)) {
            fs_error("*ERROR*: The address value (%s) was larger than or equal to the memory depth (%zu). Correct the address value and rerun.\n",
              addr_exp_bigint->getOriginValue().c_str(), mport_depth);
            return false;
          }
        }
      } else if (addr_exp->isIdExpression()) {
        if (dynamic_cast<firDB::firTypeUInt*>(addr_type)->valid_width()) {
          if (std::pow(2, dynamic_cast<firDB::firTypeUInt*>(addr_type)->width()) > mport_depth) {
            fs_warning("*WARNING*: The width (%d) of address '%s' was larger than the needed width for the memory depth (%zu).\n",
              dynamic_cast<firDB::firTypeUInt*>(addr_type)->width(), addr_exp->toString().c_str(), mport_depth);
          }
        }
      } else {
        fs_error("*ERROR*: The type of the address for MPort '%s' was invalid. Correct the type of the address and rerun.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemInstance: {
      firDB::firItemInstance* inst_item = dynamic_cast<firDB::firItemInstance*>(stmt);
      if (!inferInstanceModule(module, inst_item)) {
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemNode: {
      firDB::firItemNode* node_item = dynamic_cast<firDB::firItemNode*>(stmt);
      firDB::firExp* node_exp = node_item->exp();
      firDB::firType* type_data = node_exp->inferDataType(module, domain);
      fs_assert(type_data);
      break;
    }
    case firDB::ItemType::kItemConnect: {
      firDB::firItemConnect* connect = dynamic_cast<firDB::firItemConnect*>(stmt);
      firDB::firExp* left = connect->connect_l();
      firDB::firExp* right = connect->connect_r();
      firDB::firType* left_type = left->inferDataType(module, domain);
      firDB::firType* right_type = right->inferDataType(module, domain);
      fs_assert(left_type && right_type);
      break;
    }
    case firDB::ItemType::kItemPartialConnect: {
      firDB::firItemPartialConnect* partial_connect = dynamic_cast<firDB::firItemPartialConnect*>(stmt);
      firDB::firExp* left = partial_connect->connect_l();
      firDB::firExp* right = partial_connect->connect_r();
      firDB::firType* left_type = left->inferDataType(module, domain);
      firDB::firType* right_type = right->inferDataType(module, domain);
      fs_assert(left_type && right_type);
      break;
    }
    case firDB::ItemType::kItemInvalidate: {
      firDB::firItemInvalidate* invalidate = dynamic_cast<firDB::firItemInvalidate*>(stmt);
      firDB::firExp* invalid_exp = invalidate->exp();
      firDB::firType* invalid_type = invalid_exp->inferDataType(module, domain);
      fs_assert(invalid_type);
      break;
    }
    case firDB::ItemType::kItemAttach: {
      firDB::firItemAttach* attach = dynamic_cast<firDB::firItemAttach*>(stmt);
      std::vector<firDB::firExp*>& nets = attach->nets();
      for (size_t n = 0; n < nets.size(); n++) {
        firDB::firType* net_type = nets[n]->inferDataType(module, domain);
        fs_assert(net_type);
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
      firDB::firType* exp1_type = exp1->inferDataType(module, domain);
      firDB::firType* exp2_type = exp2->inferDataType(module, domain);
      fs_assert(exp1_type && exp2_type);
      break;
    }
    case firDB::ItemType::kItemPrintf: {
      firDB::firItemPrintf* printf = dynamic_cast<firDB::firItemPrintf*>(stmt);
      firDB::firExp* clk = printf->clk_signal();
      firDB::firExp* con = printf->con_signal();
      firDB::firType* clk_type = clk->inferDataType(module, domain);
      firDB::firType* con_type = con->inferDataType(module, domain);
      fs_assert(clk_type && con_type);
      break;
    }
    default:
      break;
    }
    return true;
  }
  bool Infer::inferInstanceModule(firDB::firModule* module, firDB::firItemInstance* inst_item) {
    fs_assert(inst_item != NULL);
    fs_assert(module != NULL);
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
    return true;
  }
  void Infer::getUnknownWidthType(firDB::firType* type) {
    if (type->isGroundType()) {
      if (this->getWidthInfer()->isInvalidWidthType(type)) {
        this->getWidthInfer()->insertInferWidthType(type);
        if (type->isFixedType()) {
          this->getWidthInfer()->insertOriginalFixedType(dynamic_cast<firDB::firTypeFixed*>(type));
        } else if (type->isIntervalType()) {
          this->getWidthInfer()->insertOriginalIntervalType(dynamic_cast<firDB::firTypeInterval*>(type));
        }
      }
    } else if (type->isVectorType()) {
      firDB::firTypeVector* vtype = dynamic_cast<firDB::firTypeVector*>(type);
      getVectorUnknownWidthType(vtype);
    } else if (type->isBundleType()) {
      firDB::firTypeBundle* btype = dynamic_cast<firDB::firTypeBundle*>(type);
      getBundleUnknownWidthType(btype);
    }
  }
  void Infer::getVectorUnknownWidthType(firDB::firTypeVector* type) {
    fs_assert(type != NULL);
    firDB::firType* vtype_type_data = type->type_data();
    getUnknownWidthType(vtype_type_data);
  }
  void Infer::getBundleUnknownWidthType(firDB::firTypeBundle* type) {
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype_type_data = type_datas[i]->type_data();
      getUnknownWidthType(btype_type_data);
    }
  }
}
