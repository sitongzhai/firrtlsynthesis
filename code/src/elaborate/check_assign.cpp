

#include "elaborate/check_assign.h"

namespace firrtlsyn {
  CheckAssign::CheckAssign() {
    bundle_interpunct_ = ".";
    vector_left_interpunct_ = "[";
    vector_right_interpunct_ = "]";
    exp_type_map_.clear();
  }
  CheckAssign::~CheckAssign() {
    exp_type_map_.clear();
  }
  bool CheckAssign::checkPortAssign(firDB::firCircuit* circuit) {
    fs_info("*INFO*: Running check output assign...\n");
    firDB::firModule* top_module = circuit->top_module();
    if (!moduleTraverse(top_module)) {
      fs_assert(0);
      return false;
    }
    this->checkUnreferencedOutput();
    return true;
  }
  bool CheckAssign::moduleTraverse(firDB::firModule* module) {
    fs_assert(module != NULL);
    std::vector<firDB::firItemPort*>& ports = module->ports();
    for (size_t p = 0; p < ports.size(); p++) {
      firDB::firItemPort* port = ports[p];
      this->getAllPortsId(port);
    }
    std::vector<firDB::firItem*>& statements = module->statements();
    for (size_t stmt = 0; stmt < statements.size(); stmt++) {
      if (!statementTraverse(statements[stmt], module)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool CheckAssign::statementTraverse(firDB::firItem* stmt, firDB::firModule* module, firDB::firItemConditional* domain) {
    fs_assert(stmt != NULL);
    switch (stmt->type()) {
    case firDB::ItemType::kItemInstance: {
      firDB::firItemInstance* inst_item = dynamic_cast<firDB::firItemInstance*>(stmt);
      firDB::firModule* inst_module = module->circuit()->findModuleById(inst_item->module_id());
      fs_assert(inst_module != NULL);
      if (!inst_module->isExtModule()) {
        if (!moduleTraverse(inst_module)) {
          fs_assert(0);
          return false;
        }
      }
      break;
    }
    case firDB::ItemType::kItemConnect: {
      firDB::firItemConnect* connect = dynamic_cast<firDB::firItemConnect*>(stmt);
      expandConnect(module, connect, domain);
      break;
    }
    case firDB::ItemType::kItemPartialConnect: {
      firDB::firItemPartialConnect* partial_connect = dynamic_cast<firDB::firItemPartialConnect*>(stmt);
      expandPartialConnect(module, partial_connect, domain);
      break;
    }
    case firDB::ItemType::kItemConditional: {
      firDB::firItemConditional* when_stmt = dynamic_cast<firDB::firItemConditional*>(stmt);
      std::vector<firDB::firItem*>& stmts_under_when = when_stmt->when_statements();
      for (size_t k = 0; k < stmts_under_when.size(); k++) {
        firDB::firItem* tmp_stmt = stmts_under_when[k];
        fs_assert(tmp_stmt != NULL);
        if (!statementTraverse(tmp_stmt, module, when_stmt)) {
          return false;
        }
      }
      firDB::firItemConditional* else_stmt = when_stmt->else_cond();
      if (else_stmt != NULL) {
        if (!statementTraverse(else_stmt, module, else_stmt)) {
          return false;
        }
      }
      break;
    }
    case firDB::ItemType::kItemAttach: {
      if (exp_type_map_.empty()) return true;
      firDB::firItemAttach* attach = dynamic_cast<firDB::firItemAttach*>(stmt);
      std::vector<firDB::firExp*>& nets = attach->nets();
      for (size_t i = 0; i < nets.size(); i++) {
        firDB::firType* exp_type = nets[i]->getTypeData(module, domain);
        fs_assert(exp_type != NULL);
        auto iter = exp_type_map_.find(exp_type);
        if (iter != exp_type_map_.end()) {
          exp_type_map_.erase(iter);
        }
      }
      break;
    }
    default:
      break;
    }
    return true;
  }
  void CheckAssign::getAllPortsId(firDB::firItemPort* port) {
    firDB::firType* port_type = port->type_data();
    std::string port_id = port->id();
    firDB::PortDir port_dir = port->dir();
    expandPort(port_id, port_type, port_dir);
  }
  void CheckAssign::expandPort(std::string port_id, firDB::firType* port_type, firDB::PortDir port_dir) {
    fs_assert(port_type != NULL);
    if (port_type->isGroundType()) {
      if (port_dir == firDB::PortDir::kPortDirOutput) {
        exp_type_map_.insert(std::make_pair(port_type, port_id));
      }
    } else if (port_type->isVectorType()) {
      firDB::firTypeVector* v_type = dynamic_cast<firDB::firTypeVector*>(port_type);
      for (unsigned int i = 0; i < v_type->depth(); i++) {
        std::string new_port_id = port_id + vector_left_interpunct() + std::to_string(i) + vector_right_interpunct();
        firDB::firType* new_port_type = v_type->type_data();
        expandPort(new_port_id, new_port_type, port_dir);
      }
    } else if (port_type->isBundleType()) {
      firDB::firTypeBundle* b_type = dynamic_cast<firDB::firTypeBundle*>(port_type);
      std::vector<firDB::firField*>& type_datas = b_type->type_datas();
      firDB::PortDir dir_bak = port_dir;
      for (size_t i = 0; i < type_datas.size(); i++) {
        firDB::firType* btype_type_data = type_datas[i]->type_data();
        std::string new_port_id = port_id + bundle_interpunct() + type_datas[i]->field_id();
        bool flip = type_datas[i]->flip();
        if (flip) {
          if (dir_bak == firDB::PortDir::kPortDirInput) {
            port_dir = firDB::PortDir::kPortDirOutput;
          } else if (dir_bak == firDB::PortDir::kPortDirOutput) {
            port_dir = firDB::PortDir::kPortDirInput;
          }
        } else {
          port_dir = dir_bak;
        }
        expandPort(new_port_id, btype_type_data, port_dir);
      }
    } else {
      fs_assert(0);
    }
  }
  void CheckAssign::expandConnect(firDB::firModule* module, firDB::firItemConnect* item_connect, firDB::firItemConditional* domain) {
    fs_assert(module != NULL);
    fs_assert(item_connect != NULL);
    firDB::firExp* connect_l = item_connect->connect_l();
    firDB::firItem* item_l = module->findItemByExpression(connect_l, domain);
    fs_assert(item_l != NULL);
    firDB::firExp* connect_r = item_connect->connect_r();
    if (connect_r->isIdExpression()) {
      firDB::firItem* item_r = module->findItemByExpression(connect_r, domain);
      fs_assert(item_r != NULL);
    }
    if (item_l->isPortItem() || item_l->isInstanceItem()) {
      firDB::firType* type_l = connect_l->inferDataType(module, domain);
      firDB::firType* type_r = connect_r->inferDataType(module, domain);
      fs_assert(type_l != NULL);
      fs_assert(type_r != NULL);
      expandConnectExpressionType(type_l, type_r);
    } else {
      firDB::firItem* item_r = NULL;
      if (connect_r->isIdExpression()) {
        item_r = module->findItemByExpression(connect_r, domain);
        fs_assert(item_r != NULL);
      }
      if (item_r != NULL && (item_r->isPortItem() || item_r->isInstanceItem())) {
        firDB::firType* type_l = connect_l->inferDataType(module, domain);
        firDB::firType* type_r = connect_r->inferDataType(module, domain);
        fs_assert(type_l != NULL);
        fs_assert(type_r != NULL);
        if (type_l->isGroundType()) return;
        expandConnectExpressionType(type_l, type_r);
      }
    }
  }
  void CheckAssign::expandPartialConnect(firDB::firModule* module, firDB::firItemPartialConnect* item_partialConnect, firDB::firItemConditional* domain) {
    fs_assert(module != NULL);
    fs_assert(item_partialConnect != NULL);
    firDB::firExp* connect_l = item_partialConnect->connect_l();
    firDB::firItem* item_l = module->findItemByExpression(connect_l, domain);
    fs_assert(item_l != NULL);
    firDB::firExp* connect_r = item_partialConnect->connect_r();
    if (item_l->isPortItem() || item_l->isInstanceItem()) {
      firDB::firType* type_l = connect_l->inferDataType(module, domain);
      firDB::firType* type_r = connect_r->inferDataType(module, domain);
      fs_assert(type_l != NULL);
      fs_assert(type_r != NULL);
      expandConnectExpressionType(type_l, type_r);
    } else {
      firDB::firItem* item_r = NULL;
      if (connect_r->isIdExpression()) {
        item_r = module->findItemByExpression(connect_r, domain);
        fs_assert(item_r != NULL);
      }
      if (item_r != NULL && (item_r->isPortItem() || item_r->isInstanceItem())) {
        firDB::firType* type_l = connect_l->inferDataType(module, domain);
        firDB::firType* type_r = connect_r->inferDataType(module, domain);
        fs_assert(type_l != NULL);
        fs_assert(type_r != NULL);
        if (type_l->isGroundType()) return;
        expandConnectExpressionType(type_l, type_r);
      }
    }
  }
  void CheckAssign::checkUnreferencedOutput() {
    if (exp_type_map_.empty()) return;
    for (auto iter : exp_type_map_) {
      std::string output_id = iter.second;
      firDB::firType* output_type = iter.first;
      fs_warning("*WARNING*: In line %d, output '%s' is unconnect.\n", output_type->line_begin(), output_id.c_str());
    }
  }
  void CheckAssign::expandConnectExpressionType(firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (type_l->isGroundType()) {
      if (!type_l->isCompatible(type_r)) {
        fs_assert(0);
        return;
      }
      auto iter = exp_type_map_.find(type_l);
      if (iter != exp_type_map_.end()) {
        exp_type_map_.erase(iter);
      }
    } else if (type_l->isVectorType()) {
      firDB::firTypeVector* v_type_l = dynamic_cast<firDB::firTypeVector*>(type_l);
      firDB::firTypeVector* v_type_r = dynamic_cast<firDB::firTypeVector*>(type_r);
      for (unsigned int i = 0; i < v_type_l->depth(); i++) {
        firDB::firType* new_type_l = v_type_l->type_data();
        firDB::firType* new_type_r = v_type_r->type_data();
        expandConnectExpressionType(new_type_l, new_type_r);
      }
    } else if (type_l->isBundleType()) {
      firDB::firTypeBundle* b_type_l = dynamic_cast<firDB::firTypeBundle*>(type_l);
      firDB::firTypeBundle* b_type_r = dynamic_cast<firDB::firTypeBundle*>(type_r);
      std::vector<firDB::firField*>& type_datas_l = b_type_l->type_datas();
      std::vector<firDB::firField*>& type_datas_r = b_type_r->type_datas();
      std::map<std::string, firDB::firType*> id_type_data_map;
      for (size_t i = 0; i < type_datas_l.size(); i++) {
        id_type_data_map.insert(std::make_pair(type_datas_l[i]->field_id(), type_datas_l[i]->type_data()));
      }
      for (size_t i = 0; i < type_datas_r.size(); i++) {
        auto iter = id_type_data_map.find(type_datas_r[i]->field_id());
        if (iter != id_type_data_map.end()) {
          firDB::firType* new_type_l = iter->second;
          firDB::firType* new_type_r = type_datas_r[i]->type_data();
          if (type_datas_r[i]->flip()) {
            expandConnectExpressionType(new_type_r, new_type_l);
          } else {
            expandConnectExpressionType(new_type_l, new_type_r);
          }
        }
      }
    } else {
      fs_assert(0);
    }
  }
}