//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "elaborate/width_infer.h"
#include <vector>

namespace firrtlsyn {

  WidthInfer::WidthInfer() {
    cur_cond_ = NULL;
    infer_width_type_.clear();
    fixed_type_map_.clear();
    interval_type_map_.clear();
  }

  WidthInfer::~WidthInfer() {
    infer_width_type_.clear();
    for (auto iter : fixed_type_map_) {
      firDB::firTypeFixed* copy_fixed_type = iter.second;
      if (copy_fixed_type != NULL) delete copy_fixed_type;
    }
    fixed_type_map_.clear();
    for (auto iter : interval_type_map_) {
      firDB::firTypeInterval* copy_interval_type = iter.second;
      if (copy_interval_type != NULL) delete copy_interval_type;
    }
    interval_type_map_.clear();
  }
  void WidthInfer::setCurCond(firDB::firItemConditional* cur_cond) {
    cur_cond_ = cur_cond;
  }
  firDB::firItemConditional* WidthInfer::getCurCond() {
    return cur_cond_;
  }
  bool WidthInfer::isNeedInferTypeWidth() {
    size_t need_infer_size = infer_width_type_.size();
    std::vector<firDB::firType*> erase_type;
    for (auto iter = infer_width_type_.begin(); iter != infer_width_type_.end(); iter++) {
      if (!isInvalidWidthType(*iter)) {
        erase_type.push_back(*iter);
      }
    }
    for (size_t i = 0; i < erase_type.size(); i++) {
      eraseInferWidthType(erase_type[i]);
    }
    if (infer_width_type_.empty()) return false;
    size_t cur_infer_size = infer_width_type_.size();
    if (cur_infer_size < need_infer_size) {
      return true;
    } else {
      for (auto iter : infer_width_type_) {
        fs_error("*ERROR*: The width of type '%s' in line '%d' is not given, and the bit width cannot be inferred.\n", iter->toString().c_str(), iter->line_begin());
        fs_assert(0);
      }
      return false;
    }
  }
  bool WidthInfer::isInvalidWidthType(firDB::firType* type) {
    fs_assert(type->isGroundType());
    if (type->isUIntType()) {
      firDB::firTypeUInt* utype = dynamic_cast<firDB::firTypeUInt*>(type);
      if (!utype->valid_width()) {
        if (utype->invalid_width() == 0) return false;
        return true;
      }
    } else if (type->isSIntType()) {
      firDB::firTypeSInt* stype = dynamic_cast<firDB::firTypeSInt*>(type);
      if (!stype->valid_width()) {
        if (stype->invalid_width() == 0) return false;
        return true;
      }
    } else if (type->isAnalogType()) {
      firDB::firTypeAnalog* atype = dynamic_cast<firDB::firTypeAnalog*>(type);
      if (!atype->valid_width()) {
        if (atype->invalid_width() == 0) return false;
        return true;
      }
    } else if (type->isFixedType()) {
      firDB::firTypeFixed* ftype = dynamic_cast<firDB::firTypeFixed*>(type);
      if (!ftype->valid_width() || !ftype->valid_binary()) return true;
    } else if (type->isIntervalType()) {
      firDB::firTypeInterval* itype = dynamic_cast<firDB::firTypeInterval*>(type);
      if (!itype->trimInterval()) return true;
    } else {
      return false;
    }
    return false;
  }
  void WidthInfer::insertInferWidthType(firDB::firType* type) {
    infer_width_type_.insert(type);
  }
  void WidthInfer::eraseInferWidthType(firDB::firType* type) {
    fs_assert(type != NULL);
    auto iter = infer_width_type_.find(type);
    if (iter != infer_width_type_.end()) {
      infer_width_type_.erase(type);
    }
  }
  void WidthInfer::insertOriginalFixedType(firDB::firTypeFixed* ftype) {
    firDB::firTypeFixed* copy_fixed_type = new firDB::firTypeFixed();
    if (ftype->valid_width()) {
      copy_fixed_type->set_width(ftype->width());
    } else if (ftype->valid_binary()) {
      copy_fixed_type->set_binary_point(ftype->binary_point());
    }
    fixed_type_map_.insert(std::make_pair(ftype, copy_fixed_type));
  }
  void WidthInfer::insertOriginalIntervalType(firDB::firTypeInterval* itype) {
    firDB::firTypeInterval* copy_interval_type = new firDB::firTypeInterval();
    if (itype->valid_binary()) {
      copy_interval_type->set_value(itype->binary());
    }
    if (itype->valid_lower_value() && itype->valid_upper_value()) {
      copy_interval_type->set_value(itype->lower_bound(), itype->lower_value(), itype->upper_value(), itype->upper_bound());
    } else if (itype->valid_lower_value() && !itype->valid_upper_value()) {
      copy_interval_type->set_value(itype->lower_bound(), itype->lower_value(), '?', itype->upper_bound());
    } else if (!itype->valid_lower_value() && itype->valid_upper_value()) {
      copy_interval_type->set_value(itype->lower_bound(), '?', itype->upper_value(), itype->upper_bound());
    } else if (!itype->valid_lower_value() && !itype->valid_upper_value()) {
      copy_interval_type->set_value(itype->lower_bound(), '?', '?', itype->upper_bound());
    }
    interval_type_map_.insert(std::make_pair(itype, copy_interval_type));
  }
  bool WidthInfer::width_infer(firDB::firCircuit* circuit) {
    if (circuit == NULL) {
      fs_error("*ERROR*: Empty circuit!\n");
      fs_assert(0);
      return false;
    }
    if (infer_width_type_.empty()) return true;
    fs_info("*INFO*: Running width infer...\n");
    do {
      if (!widthInferAndSetTypeWidth(circuit)) {
        return false;
      }
    } while (isNeedInferTypeWidth());
    return true;
  }
  bool WidthInfer::widthInferAndSetTypeWidth(firDB::firCircuit* circuit) {
    firDB::firModule* top_module = circuit->top_module();
    if (!moduleTraverse(top_module)) {
      fs_error("*ERROR*: Width infer failed!\n");
      return false;
    }
    return true;
  }
  bool WidthInfer::moduleTraverse(firDB::firModule* module) {
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
  bool WidthInfer::statementTraverse(firDB::firModule* module, firDB::firItem* stmt) {
    fs_assert(stmt != NULL);
    firDB::ItemType item_type = stmt->type();
    switch (item_type) {
    case firDB::ItemType::kItemNode: {
      firDB::firItemNode* item_node = dynamic_cast<firDB::firItemNode*>(stmt);
      firDB::firExp* node_exp = item_node->exp();
      firDB::firType* node_type = node_exp->inferDataType(module, getCurCond());
      fs_assert(node_type != NULL);
      break;
    }
    case firDB::ItemType::kItemInstance: {
      firDB::firItemInstance* item_inst = dynamic_cast<firDB::firItemInstance*>(stmt);
      if (!inferWidthByInstance(module, item_inst)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemConnect: {
      firDB::firItemConnect* item_connect = dynamic_cast<firDB::firItemConnect*>(stmt);
      if (!inferWidthByConnect(module, item_connect)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemPartialConnect: {
      firDB::firItemPartialConnect* item_partialconnect = dynamic_cast<firDB::firItemPartialConnect*>(stmt);
      if (!inferWidthByPartialConnect(module, item_partialconnect)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemAttach: {
      firDB::firItemAttach* item_attach = dynamic_cast<firDB::firItemAttach*>(stmt);
      if (!inferWidthByAttach(module, item_attach)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemConditional: {
      firDB::firItemConditional* item_conditional = dynamic_cast<firDB::firItemConditional*>(stmt);
      if (!inferWidthByConditional(module, item_conditional)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    default:
      break;
    }
    return true;
  }
  bool WidthInfer::inferWidthByConnect(firDB::firModule* module, firDB::firItemConnect* item_connect) {
    fs_assert(module != NULL);
    fs_assert(item_connect != NULL);
    firDB::firExp* connect_l = item_connect->connect_l();
    firDB::firExp* connect_r = item_connect->connect_r();
    firDB::firType* type_l = connect_l->inferDataType(module, getCurCond());
    firDB::firType* type_r = connect_r->inferDataType(module, getCurCond());
    inferWidthByDestType(module, type_l, type_r);
    return true;
  }
  bool WidthInfer::inferWidthByPartialConnect(firDB::firModule* module, firDB::firItemPartialConnect* partial_connect) {
    fs_assert(module != NULL);
    fs_assert(partial_connect != NULL);
    firDB::firExp* connect_l = partial_connect->connect_l();
    firDB::firExp* connect_r = partial_connect->connect_r();
    firDB::firType* type_l = connect_l->inferDataType(module, getCurCond());
    firDB::firType* type_r = connect_r->inferDataType(module, getCurCond());
    inferWidthByDestType(module, type_l, type_r);
    return true;
  }
  bool WidthInfer::inferWidthByInstance(firDB::firModule* module, firDB::firItemInstance* item_inst) {
    fs_assert(module != NULL);
    fs_assert(item_inst != NULL);
    firDB::firCircuit* circuit = module->circuit();
    std::string inst_module_id = item_inst->module_id();
    firDB::firModule* instance_module = circuit->findModuleById(inst_module_id);
    fs_assert(instance_module != NULL);
    if (!moduleTraverse(instance_module)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool WidthInfer::inferWidthByConditional(firDB::firModule* module, firDB::firItemConditional* item_conditional) {
    fs_assert(module != NULL);
    fs_assert(item_conditional != NULL);
    firDB::firItemConditional* cur_cond = getCurCond();
    setCurCond(item_conditional);
    std::vector<firDB::firItem*>& stmts_under_when = item_conditional->when_statements();
    for (size_t k = 0; k < stmts_under_when.size(); k++) {
      firDB::firItem* tmp_stmt = stmts_under_when[k];
      fs_assert(tmp_stmt != NULL);
      statementTraverse(module, tmp_stmt);
    }
    firDB::firItemConditional* else_stmt = item_conditional->else_cond();
    if (else_stmt != NULL) {
      statementTraverse(module, else_stmt);
    }
    setCurCond(cur_cond);
    return true;
  }
  bool WidthInfer::inferWidthByAttach(firDB::firModule* module, firDB::firItemAttach* item_attach) {
    fs_assert(module != NULL);
    fs_assert(item_attach != NULL);
    std::vector<firDB::firExp*>& exp_nets = item_attach->nets();
    firDB::firTypeAnalog* dest_type = NULL;
    std::vector<firDB::firTypeAnalog*> src_types;
    for (size_t i = 0; i < exp_nets.size(); i++) {
      firDB::firExp* cur_exp = exp_nets[i];
      firDB::firType* cur_exp_type = cur_exp->inferDataType(module, getCurCond());
      fs_assert(cur_exp_type != NULL);
      if (!cur_exp_type->isAnalogType()) {
        fs_assert(0);
        return false;
      }
      firDB::firTypeAnalog* atype = dynamic_cast<firDB::firTypeAnalog*>(cur_exp_type);
      auto need_infer_type = infer_width_type_.find(atype);
      if (need_infer_type != infer_width_type_.end()) {
        src_types.push_back(atype);
      } else {
        if (!atype->valid_width()) continue;
        int atype_width = atype->width();
        if (dest_type != NULL) {
          int dest_type_width = dest_type->width();
          if (atype_width > dest_type_width) {
            dest_type = atype;
          }
        }
      }
    }
    for (auto iter : src_types) {
      inferWidthByDestType(module, iter, dest_type);
    }
    return true;
  }
  void WidthInfer::inferWidthByDestType(firDB::firModule* module, firDB::firType* src_type, firDB::firType* dest_type) {
    fs_assert(module != NULL);
    fs_assert(src_type != NULL);
    fs_assert(dest_type != NULL);
    if (infer_width_type_.empty()) {
      fs_assert(0);
    }
    if (src_type->isGroundType()) {
      auto iter = infer_width_type_.find(src_type);
      if (iter == infer_width_type_.end()) {
        return;
      }
      setTypeWidthByDestType(src_type, dest_type);
    } else if (src_type->isVectorType()) {
      firDB::firTypeVector* v_src_type = dynamic_cast<firDB::firTypeVector*>(src_type);
      firDB::firTypeVector* v_dest_type = dynamic_cast<firDB::firTypeVector*>(dest_type);
      firDB::firType* new_src_type = v_src_type->type_data();
      firDB::firType* new_dest_type = v_dest_type->type_data();
      inferWidthByDestType(module, new_src_type, new_dest_type);
    } else if (src_type->isBundleType()) {
      firDB::firTypeBundle* b_src_type = dynamic_cast<firDB::firTypeBundle*>(src_type);
      firDB::firTypeBundle* b_dest_type = dynamic_cast<firDB::firTypeBundle*>(dest_type);
      std::vector<firDB::firField*>& type_datas_src = b_src_type->type_datas();
      std::vector<firDB::firField*>& type_datas_dest = b_dest_type->type_datas();
      std::map<std::string, firDB::firType*> id_type_data_map;
      for (size_t i = 0; i < type_datas_src.size(); i++) {
        id_type_data_map.insert(std::make_pair(type_datas_src[i]->field_id(), type_datas_src[i]->type_data()));
      }
      for (size_t i = 0; i < type_datas_dest.size(); i++) {
        auto iter = id_type_data_map.find(type_datas_dest[i]->field_id());
        if (iter != id_type_data_map.end()) {
          firDB::firType* new_src_type = iter->second;
          firDB::firType* new_dest_type = type_datas_dest[i]->type_data();
          inferWidthByDestType(module, new_src_type, new_dest_type);
        }
      }
      id_type_data_map.clear();
    }
  }
  void WidthInfer::setTypeWidthByDestType(firDB::firType* src_type, firDB::firType* dest_type) {
    fs_assert(src_type != NULL);
    fs_assert(dest_type != NULL);
    if (!src_type->isCompatible(dest_type)) {
      fs_assert(0);
      return;
    }
    if (src_type->isUIntType()) {
      firDB::firTypeUInt* u_src_type = dynamic_cast<firDB::firTypeUInt*>(src_type);
      firDB::firTypeUInt* u_dest_type = dynamic_cast<firDB::firTypeUInt*>(dest_type);
      if (!u_dest_type->valid_width()) return;
      int dest_width = u_dest_type->width();
      if (u_src_type->valid_width()) {
        int src_width = u_src_type->width();
        if (src_width < dest_width) {
          u_src_type->set_width(dest_width);
        }
      } else {
        u_src_type->set_width(dest_width);
      }
    } else if (src_type->isSIntType()) {
      firDB::firTypeSInt* s_src_type = dynamic_cast<firDB::firTypeSInt*>(src_type);
      firDB::firTypeSInt* s_dest_type = dynamic_cast<firDB::firTypeSInt*>(dest_type);
      if (!s_dest_type->valid_width()) return;
      int dest_width = s_dest_type->width();
      if (s_src_type->valid_width()) {
        int src_width = s_src_type->width();
        if (src_width < dest_width) {
          s_src_type->set_width(dest_width);
        }
      } else {
        s_src_type->set_width(dest_width);
      }
    } else if (src_type->isAnalogType()) {
      firDB::firTypeAnalog* a_src_type = dynamic_cast<firDB::firTypeAnalog*>(src_type);
      firDB::firTypeAnalog* a_dest_type = dynamic_cast<firDB::firTypeAnalog*>(dest_type);
      if (!a_dest_type->valid_width()) return;
      int dest_width = a_dest_type->width();
      if (a_src_type->valid_width()) {
        int src_width = a_src_type->width();
        if (src_width < dest_width) {
          a_src_type->set_width(dest_width);
        }
      } else {
        a_src_type->set_width(dest_width);
      }
    } else if (src_type->isFixedType()) {
      firDB::firTypeFixed* f_src_type = dynamic_cast<firDB::firTypeFixed*>(src_type);
      firDB::firTypeFixed* f_dest_type = dynamic_cast<firDB::firTypeFixed*>(dest_type);
      auto iter = fixed_type_map_.find(f_src_type);
      if (iter == fixed_type_map_.end()) {
        fs_assert(0);
        return;
      }
      firDB::firTypeFixed* fixed_type_bak = iter->second;
      if (!fixed_type_bak->valid_width() && f_dest_type->valid_width()) {
        int dest_width = f_dest_type->width();
        int src_width = dest_width;
        if (f_src_type->valid_width()) {
          src_width = std::max(dest_width, f_src_type->width());
        }
        f_src_type->set_width(src_width);
      }
      if (!fixed_type_bak->valid_binary() && f_dest_type->valid_binary()) {
        int dest_bp = f_dest_type->binary_point();
        int src_bp = dest_bp;
        if (f_src_type->valid_binary()) {
          src_bp = std::max(f_src_type->binary_point(), dest_bp);
        }
        f_src_type->set_binary_point(src_bp);
      }
    } else if (src_type->isIntervalType()) {
      firDB::firTypeInterval* i_src_type = dynamic_cast<firDB::firTypeInterval*>(src_type);
      firDB::firTypeInterval* i_dest_type = dynamic_cast<firDB::firTypeInterval*>(dest_type);
      auto iter = interval_type_map_.find(i_src_type);
      if (iter == interval_type_map_.end()) {
        fs_assert(0);
        return;
      }
      firDB::firTypeInterval* interval_type_bak = iter->second;
      if (!interval_type_bak->valid_binary() && i_dest_type->valid_binary()) {
        int binary_point = i_dest_type->binary();
        if (i_src_type->valid_binary()) {
          binary_point = std::max(i_src_type->binary(), binary_point);
        }
        i_src_type->set_binary_point(binary_point);
      }
      if (!interval_type_bak->valid_lower_value() && i_dest_type->valid_lower_value()) {
        double lower_value = i_dest_type->lower_value();
        if (i_src_type->valid_lower_value()) {
          double src_lower_value = i_src_type->lower_value();
          if (src_lower_value > lower_value) {
            i_src_type->set_lower_value(lower_value);
            i_src_type->set_lower_bound(i_dest_type->lower_bound());
          }
        } else {
          i_src_type->set_lower_value(lower_value);
          i_src_type->set_lower_bound(i_dest_type->lower_bound());
        }
      }
      if (!interval_type_bak->valid_upper_value() && i_dest_type->valid_upper_value()) {
        double upper_value = i_dest_type->upper_value();
        if (i_src_type->valid_upper_value()) {
          double src_upper_value = i_src_type->upper_value();
          if (src_upper_value < upper_value) {
            i_src_type->set_upper_bound(i_dest_type->upper_bound());
            i_src_type->set_upper_value(upper_value);
          }
        } else {
          i_src_type->set_upper_value(upper_value);
          i_src_type->set_upper_bound(i_dest_type->upper_bound());
        }
      }
    } else {
      return;
    }
  }
}

