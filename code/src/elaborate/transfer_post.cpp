//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "elaborate/transfer_post.h"
#include "db/fir_db.h"
#include "db/fir_circuit.h"
#include "db/fir_module.h"
#include "utility/utility.h"
#include "utility/big_int.h"
#include <queue>
#include <list>
#include <fstream>
#include <cmath>
#include <algorithm>

namespace firrtlsyn {
  TransferPost::Option TransferPost::opt;

  TransferPost::TransferPost(firDB::firLibrary* library) {
    clear();
    instance_label_ = '.';
    add_node_num_ = 0;
    node_id_ = "$node$";
    library_ = library;
  }
  TransferPost::~TransferPost() {
    clear();
  }
  void TransferPost::clear() {
    library_ = NULL;
    fir_circuit_ = NULL;
    post_circuit_ = NULL;
    fir_module_ = NULL;
    post_module_ = NULL;
    module_postmodule_map_.clear();
    //postreg_mux_map_.clear();
    cond_connect_exps_map_.clear();
    cur_cond_.clear();
    when_cond_stack_.clear();
    transfer_exps_map_.clear();
  }
  bool TransferPost::transfer() {
    if (!transferLibraryToPost(library()))
      return false;
    return true;
  }
  firDB::firItem* TransferPost::findItemExceptInstance(firDB::firModule* module, firDB::firExp* exp, firDB::firItemConditional* cur_cond) {
    fs_assert(module != NULL);
    fs_assert(exp != NULL);
    firDB::firItem* item = module->findItemByExpression(exp, cur_cond);
    if (item->isInstanceItem()) {
      firDB::firItemInstance* inst_item = dynamic_cast<firDB::firItemInstance*>(item);
      firDB::firCircuit* cur_circuit = module->circuit();
      firDB::firItem* port_item = inst_item->getPortByExpression(cur_circuit, exp);
      item = port_item;
    }
    fs_assert(item != NULL);
    return item;
  }
  firDB::firExp* TransferPost::createNewExpById(const std::string& id, const bool mport_wmode) {
    firDB::firExp* rexp = NULL;
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    string label;
    size_t pos_start = 0;
    size_t pos_label = id.find(instance_label());
    label.push_back(instance_label());
    if (pos_label != id.npos) {
      std::string pre_id = id.substr(pos_start, pos_label);
      firDB::firItem* post_item = post_module()->findItemById(pre_id);
      if (post_item == NULL) {
        firDB::firItem* fir_item = module->findItemById(pre_id, cur_cond());
        fs_assert(fir_item != NULL);
        if (fir_item->isMPortItem()) {
          firDB::firItemMPort* mport = dynamic_cast<firDB::firItemMPort*>(fir_item);
          std::string mem_id = id.substr(pos_label + label.size());
          firDB::firExp* mpost_ref = post_module()->addExpRef(mem_id);
          firDB::firExp* mport_exp = post_module()->addExpSubfield(mpost_ref, pre_id);
          std::string data_id;
          firDB::MPortDir dir = mport->dir();
          if (dir == firDB::MPortDir::kMPortDirRead) {
            if (mport_wmode) {
              fs_error("*ERROR*: The MPort '%s' is read type but was used as write type.\n", pre_id.c_str());
              fs_assert(0);
              return NULL;
            }
            data_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortData);
          } else if (dir == firDB::MPortDir::kMPortDirWrite) {
            if (!mport_wmode) {
              fs_error("*ERROR*: The MPort '%s' is write type but was used as read type.\n", pre_id.c_str());
              fs_assert(0);
              return NULL;
            }
            data_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortData);
          } else if (dir == firDB::MPortDir::kMPortDirRdwr) {
            if (mport_wmode) {
              data_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortRData);
            } else {
              data_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortWData);
            }
          } else {
            fs_error("*ERROR*: The type of MPort '%s' was unspecified. Its type should be specified or inferred as read, write, or readwrite.\n", pre_id.c_str());
            fs_assert(0);
            return NULL;
          }
          firDB::firExp* mport_data_exp = post_module()->addExpSubfield(mport_exp, data_id);
          rexp = mport_data_exp;
        }
      } else {
        if (post_item->isInstanceItem()) {
          std::string exp_id = id.substr(pos_label + label.size());
          firDB::firExp* sub_exp = post_module()->addExpRef(pre_id);
          firDB::firExp* subfield = post_module()->addExpSubfield(sub_exp, exp_id);
          if (findItemExceptInstance(post_module(), subfield, cur_cond()) == NULL) return NULL;
          rexp = subfield;
        } else if (post_item->isMemoryItem()) {
          std::vector<std::string> vec_id;
          vec_id.push_back(pre_id);
          pos_start = pos_label + label.size();
          pos_label = id.find(instance_label(), pos_start);
          while (id.npos != pos_label) {
            vec_id.push_back(id.substr(pos_start, pos_label - pos_start));
            pos_start = pos_label + label.size();
            pos_label = id.find(instance_label(), pos_start);
          }
          if (pos_start != id.length()) {
            vec_id.push_back(id.substr(pos_start));
          }
          firDB::firExp* mem_ref = post_module()->addExpRef(vec_id[0]);
          firDB::firExp* mem = mem_ref;
          for (size_t i = 1; i < vec_id.size(); i++) {
            firDB::firExp* port = post_module()->addExpSubfield(mem, vec_id[i]);
            mem = port;
          }
          rexp = mem;
        }
      }
    } else {
      if (post_module()->findItemById(id) == NULL) {
        fs_assert(0);
        return NULL;
      }
      rexp = post_module()->addExpRef(id);
    }
    return rexp;
  }
  void TransferPost::mapPostModuleToOrigin(firDB::firModule* origin_module, firDB::firModule* post_module) {
    fs_assert(findPostModuleByOrigin(origin_module) == NULL);
    module_postmodule_map_.insert(std::make_pair(origin_module, post_module));
  }
  firDB::firModule* TransferPost::findPostModuleByOrigin(firDB::firModule* origin_module) {
    auto iter = module_postmodule_map_.find(origin_module);
    if (iter == module_postmodule_map_.end()) {
      return NULL;
    } else {
      return iter->second;
    }
  }
  bool TransferPost::isZeroWidthType(firDB::firType* type) {
    fs_assert(type != NULL);
    fs_assert(type->isGroundType());
    bool is_zero_width = false;
    if (type->isUIntType()) {
      firDB::firTypeUInt* utype = dynamic_cast<firDB::firTypeUInt*>(type);
      if (!utype->valid_width()) {
        if (utype->invalid_width() == 0) is_zero_width = true;
      }
    } else if (type->isSIntType()) {
      firDB::firTypeSInt* stype = dynamic_cast<firDB::firTypeSInt*>(type);
      if (!stype->valid_width()) {
        if (stype->invalid_width() == 0) is_zero_width = true;
      }
    } else if (type->isFixedType()) {
      firDB::firTypeFixed* ftype = dynamic_cast<firDB::firTypeFixed*>(type);
      if (!ftype->valid_width()) {
        if (ftype->invalid_width() == 0) is_zero_width = true;
      }
    } else if (type->isIntervalType()) {
      firDB::firTypeInterval* itype = dynamic_cast<firDB::firTypeInterval*>(type);
      int width = 0;
      if (itype->getWidth(width)) {
        if (width == 0) is_zero_width = true;
      }
    } else if (type->isAnalogType()) {
      firDB::firTypeAnalog* atype = dynamic_cast<firDB::firTypeAnalog*>(type);
      if (!atype->valid_width()) {
        if (atype->invalid_width() == 0) is_zero_width = true;
      }
    }
    return is_zero_width;
  }
  firDB::firExp* TransferPost::transferZeroWidthExp(firDB::firType* zero_width_type) {
    fs_assert(zero_width_type != NULL);
    firDB::firExp* rexp = NULL;
    std::string intbits_value = "h0";
    if (zero_width_type->isUIntType()) {
      rexp = post_module()->addExpUIntBits(intbits_value, 1);
    } else if (zero_width_type->isSIntType()) {
      rexp = post_module()->addExpSIntBits(intbits_value, 1);
    } else if (zero_width_type->isFixedType()) {
      rexp = post_module()->addExpSIntBits(intbits_value, 1);
    } else if (zero_width_type->isIntervalType()) {
      rexp = post_module()->addExpSIntBits(intbits_value, 1);
    } else {
      fs_assert(0);
      rexp = NULL;
    }
    return rexp;
  }
  bool TransferPost::transferLibraryToPost(firDB::firLibrary* ori_library) {
    fs_assert(ori_library == library());
    fs_assert(ori_library->name() == "work");
    firDB::firCircuit* circuit = ori_library->fir_circuit();
    if (circuit == NULL) {
      fs_assert(0);
      return false;
    }
    if (!transferCircuitToPost(circuit, ori_library)) {
      return false;
    }
    return true;
  }
  bool TransferPost::transferCircuitToPost(firDB::firCircuit* circuit, firDB::firLibrary* post_library) {
    fs_assert(post_library == library());
    fs_assert(post_library->name() == "work");
    fs_assert(post_library->fir_circuit() == circuit);
    if (circuit == NULL) {
      fs_assert(0);
      return false;
    }
    firDB::firCircuit* post_circuit = post_library->addPostCircuit(circuit);
    fs_assert(post_circuit_ != post_circuit);
    set_circuit(circuit, post_circuit);
    char post_circuit_info[1024];
    sprintf(post_circuit_info, "%d %d: %s", circuit->file_id(), circuit->line_begin(), circuit->id().c_str());
    post_circuit->set_info(post_circuit_info);
    firDB::firModule* top_module = circuit->top_module();
    fs_assert(top_module);
    if (!transferModuleToPost(top_module, post_circuit)) {
      fs_assert(0);
      return false;
    }
    set_circuit(NULL, NULL);

    return true;
  }
  bool TransferPost::transferModuleToPost(firDB::firModule* module, firDB::firCircuit* post_circuit) {
    fs_assert(module);
    fs_assert(post_circuit);
    fs_assert(post_circuit->findModuleById(module->id()) == NULL);
    firDB::firModule* post_module = post_circuit->addModule(firDB::ModuleType::kModule, module->id());
    mapPostModuleToOrigin(module, post_module);
    fs_assert(post_module_ != post_module);
    set_module(module, post_module);
    if (!transferAllPortsToPost(module)) return false;
    if (!transferAllStatementsToPost(module)) return false;
    set_module(NULL, NULL);
    fs_info("*INFO*: Transferring Module '%s' succeeded.\n", module->id().c_str());
    return true;
  }
  bool TransferPost::transferExtModuleToPost(firDB::firModule* ext_module, firDB::firCircuit* post_circuit) {
    fs_assert(ext_module);
    fs_assert(post_circuit);
    fs_assert(post_circuit->findModuleById(ext_module->id()) == NULL);
    firDB::firModule* post_module = post_circuit->addModule(firDB::ModuleType::kExtModule, ext_module->id());
    mapPostModuleToOrigin(ext_module, post_module);
    fs_assert(post_module_ != post_module);
    set_module(ext_module, post_module);
    if (!transferAllPortsToPost(ext_module)) return false;
    if (ext_module->defname() != NULL) {
      post_module->set_defname(ext_module->defname()->value());
    }
    std::vector<firDB::firParameter*>& parameters = ext_module->parameters();
    for(size_t p = 0; p < parameters.size(); p++) {
      post_module->addParameter(parameters[p]->id(), parameters[p]->value());
    }
    set_module(NULL, NULL);
    fs_info("*INFO*: Transferring ExtModule '%s' succeeded.\n", ext_module->id().c_str());
    return true;
  }
  bool TransferPost::transferAllPortsToPost(firDB::firModule* module) {
    fs_assert(module == fir_module());
    std::vector<firDB::firItemPort*>& ports = fir_module()->ports();
    for (size_t p = 0; p < ports.size(); p++) {
      firDB::firItemPort* port = ports[p];
      if (!transferPortToPost(port)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPortToPost(firDB::firItemPort* port) {
    firDB::firType* type_data = port->type_data();
    if (!transferTypeToPostPort(port->id(), port, type_data)) {
      return false;
    } else {
      fs_info("*INFO*: Transferring Port '%s' succeeded.\n", port->id().c_str());
    }
    return true;
  }
  bool TransferPost::transferTypeToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firType* type) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt:
      if (!transferTypeUIntToPostPort(id, port, dynamic_cast<firDB::firTypeUInt*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeSInt:
      if (!transferTypeSIntToPostPort(id, port, dynamic_cast<firDB::firTypeSInt*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeFixed:
      if (!transferTypeFixedToPostPort(id, port, dynamic_cast<firDB::firTypeFixed*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeInterval:
      if (!transferTypeIntervalToPostPort(id, port, dynamic_cast<firDB::firTypeInterval*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeClock:
      if (!transferTypeClockToPostPort(id, port, dynamic_cast<firDB::firTypeClock*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeAsyncReset:
      if (!transferTypeAsyncResetToPostPort(id, port, dynamic_cast<firDB::firTypeAsyncReset*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeReset:
      if (!transferTypeResetToPostPort(id, port, dynamic_cast<firDB::firTypeReset*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeAnalog:
      if (!transferTypeAnalogToPostPort(id, port, dynamic_cast<firDB::firTypeAnalog*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeVector:
      if (!transferTypeVectorToPostPort(id, port, dynamic_cast<firDB::firTypeVector*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeBundle:
      if (!transferTypeBundleToPostPort(id, port, dynamic_cast<firDB::firTypeBundle*>(type))) {
        return false;
      }
      break;
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferTypeUIntToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeUInt* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of port '%s' was invalid.\n", type->invalid_width(), port->id().c_str());
      return true;
    }
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, utype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeSIntToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeSInt* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of port '%s' was invalid.\n", type->invalid_width(), port->id().c_str());
      return true;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, stype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeFixedToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeFixed* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of port '%s' was invalid.\n", type->invalid_width(), port->id().c_str());
      return true;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, stype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeIntervalToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeInterval* type) {
    fs_assert(type != NULL && port != NULL);
    int width;
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    if (!type->getWidth(width)) {
      fs_warning("*WARNING*: The width (%d) of port '%s' was invalid.\n", width, port->id().c_str());
      return false;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(width);
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, stype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeClockToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeClock* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    firDB::firTypeClock* ctype = post_module()->addTypeClock();
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, ctype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeAsyncResetToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeAsyncReset* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    firDB::firTypeAsyncReset* atype = post_module()->addTypeAsyncReset();
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, atype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeResetToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeReset* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    firDB::firTypeReset* rtype = post_module()->addTypeReset();
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, rtype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeAnalogToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeAnalog* type) {
    fs_assert(type != NULL && port != NULL);
    firDB::PortDir direction = port->getPortDirection(type);
    if (direction != firDB::PortDir::kPortDirInput && direction != firDB::PortDir::kPortDirOutput) {
      fs_assert(0);
      return false;
    }
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of port '%s' was invalid.\n", type->invalid_width(), port->id().c_str());
      return true;
    }
    firDB::firTypeAnalog* atype = post_module()->addTypeAnalog(type->width());
    firDB::firItemPort* post_port = post_module()->addItemPort(id, direction, atype);
    fs_assert(post_port);
    return true;
  }
  bool TransferPost::transferTypeVectorToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeVector* type) {
    fs_assert(type != NULL && port != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      firDB::firType* vtype = type->type_data();
      std::string new_id = id + opt.hyphen() + std::to_string(i);
      if (!transferTypeToPostPort(new_id, port, vtype)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferTypeBundleToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeBundle* type) {
    fs_assert(type != NULL && port != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_id = id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferTypeToPostPort(new_id, port, btype)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferAllStatementsToPost(firDB::firModule* module) {
    fs_assert(module == fir_module());
    std::vector<firDB::firItem*>& statements = module->statements();
    for (size_t s = 0; s < statements.size(); s++) {
      firDB::firItem* statement = statements[s];
      if (!transferStatementToPost(statement)) {
        return false;
      }
    }
    if (!generateAllConnect()) {
      return false;
    }
    return true;
  }
  bool TransferPost::transferStatementToPost(firDB::firItem* statement) {
    switch (statement->type()) {
    case firDB::ItemType::kItemWire:
      if (!transferItemWireToPost(dynamic_cast<firDB::firItemWire*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemRegister:
      if (!transferItemRegisterToPost(dynamic_cast<firDB::firItemRegister*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemMemory:
      if (!transferItemMemoryToPost(dynamic_cast<firDB::firItemMemory*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemCMemory:
      if (!transferItemCMemoryToPost(dynamic_cast<firDB::firItemCMemory*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemSMemory:
      if (!transferItemSMemoryToPost(dynamic_cast<firDB::firItemSMemory*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemMPort:
      if (!transferItemMPortToPost(dynamic_cast<firDB::firItemMPort*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemInstance:
      if (!transferItemInstanceToPost(dynamic_cast<firDB::firItemInstance*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemNode:
      if (!transferItemNodeToPost(dynamic_cast<firDB::firItemNode*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemConnect:
      if (!transferItemConnectToPost(dynamic_cast<firDB::firItemConnect*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemPartialConnect:
      if (!transferItemPartialConnectToPost(dynamic_cast<firDB::firItemPartialConnect*>(statement))) {
        return false;
      }
      break;
//    case firDB::ItemType::kItemInvalidate:
//      if (!transferItemInvalidateToPost(dynamic_cast<firDB::firItemInvalidate*>(statement), module)) {
//        return false;
//      }
//      break;
    case firDB::ItemType::kItemAttach:
      if (!transferItemAttachToPost(dynamic_cast<firDB::firItemAttach*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemConditional:
      if (!transferItemConditionalToPost(dynamic_cast<firDB::firItemConditional*>(statement))) {
        return false;
      }
      break;
    case firDB::ItemType::kItemPrintf:
      if (!transferItemPrintfToPost(dynamic_cast<firDB::firItemPrintf*>(statement))) {
        return false;
      }
      break;
//    case firDB::ItemType::kItemStop:
//      if (!transferItemStopToPost(dynamic_cast<firDB::firItemStop*>(statement), module)) {
//        return false;
//      }
//      break;
//    case firDB::ItemType::kItemEmpty:
//      if (!transferItemEmptyToPost(dynamic_cast<firDB::firItemEmpty*>(statement), module)) {
//        return false;
//      }
//      break;
//    case firDB::ItemType::kItemGroup:
//      if (!transferItemStatementGroupToPost(dynamic_cast<firDB::firItemStatementGroup*>(statement), module)) {
//        return false;
//      }
//      break;
    default:
      fs_debug("*DEBUG*: Other types...\n");
      break;
    }
    return true;
  }
  bool TransferPost::generateAllConnect() {
    auto iter = cond_connect_exps_map_.find(fir_module());
    if (iter != cond_connect_exps_map_.end()) {
      std::map<std::string, Connect> id_exps_map = iter->second;
      for (auto it = id_exps_map.begin(); it != id_exps_map.end(); it++) {
        Connect connect_exps = it->second;
        firDB::firExp* connect_l = connect_exps.left;
        firDB::firExp* connect_r = connect_exps.right;
        if (connect_l == NULL || connect_r == NULL) {
          fs_assert(0);
          return false;
        }
        firDB::firItemConnect* connect = post_module()->addItemConnect(connect_l, connect_r);
        post_module()->addStatement(connect);
      }
    }
    eraseConditionalConnectMap(fir_module());
    return true;
  }
  bool TransferPost::hasSubaccess(firDB::firExp* exp) {
    fs_assert(exp != NULL);
    if (exp->isReferenceExpression()) {
      return false;
    } else if (exp->isSubfieldExpression()) {
      firDB::firExp* subfield_exp = dynamic_cast<firDB::firExpSubfield*>(exp)->exp();
      return hasSubaccess(subfield_exp);
    } else if (exp->isSubindexExpression()) {
      firDB::firExp* subindex_exp = dynamic_cast<firDB::firExpSubindex*>(exp)->exp();
      return hasSubaccess(subindex_exp);
    } else if (exp->isSubaccessExpression()) {
      return true;
    } else {
      fs_assert(0);
      return false;
    }
  }
  firDB::firExp* TransferPost::mergeNestSubaccess(firDB::firExp* exp) {
    fs_assert(exp != NULL);
    fs_assert(exp->isIdExpression());
    firDB::firExp* last_mux = NULL;
    firDB::firExp* rexp = exp;
    std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs;
    rexp = collectHasSubaccessExps(exp, exp_pairs);
    if (!exp_pairs.empty()) {
      for (size_t p = 0; p < exp_pairs.size(); p++) {
        std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs[p];
        firDB::firExp* eq_value = exp_pair.first;
        firDB::firExp* sub_id_exp = exp_pair.second;
        if (p == 0) {
          firDB::firExpValidif* validif = fir_module()->addExpValidif(eq_value, sub_id_exp);
          last_mux = validif;
        } else {
          firDB::firExpMux* current_mux = fir_module()->addExpMux(eq_value, sub_id_exp, last_mux);
          last_mux = current_mux;
        }
      }
      exp_pairs.clear();
    }
    rexp = last_mux;
    fs_assert(rexp != NULL);
    return rexp;
  }
  firDB::firExp* TransferPost::collectHasSubaccessExps(firDB::firExp* exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs) {
    fs_assert(exp != NULL);
    fs_assert(exp->isIdExpression());
    firDB::firExp* rexp = NULL;
    if (!collectIdExpressionExps(exp, rexp, exp_pairs)) {
      fs_assert(0);
      return NULL;
    }
    if (exp_pairs.empty()) {
      if (rexp == NULL) {
        fs_assert(0);
        return NULL;
      }
    } else {
      rexp = NULL;
    }
    return rexp;
  }
  bool TransferPost::collectIdExpressionExps(firDB::firExp* exp, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs) {
    fs_assert(exp != NULL);
    if (!hasSubaccess(exp)) {
      up_exp = exp;
      return true;
    }
    if (exp->isReferenceExpression()) {
      if (!collectReferenceExps(dynamic_cast<firDB::firExpRef*>(exp), up_exp, exp_pairs)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isSubfieldExpression()) {
      if (!collectSubfieldExps(dynamic_cast<firDB::firExpSubfield*>(exp), up_exp, exp_pairs)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isSubindexExpression()) {
      if (!collectSubindexExps(dynamic_cast<firDB::firExpSubindex*>(exp), up_exp, exp_pairs)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isSubaccessExpression()) {
      if (!collectSubaccessExps(dynamic_cast<firDB::firExpSubaccess*>(exp), up_exp, exp_pairs)) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::collectReferenceExps(firDB::firExpRef* reference, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs) {
    fs_assert(reference != NULL);
    if (exp_pairs.empty() && up_exp == NULL) {
      up_exp = reference;
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::collectSubfieldExps(firDB::firExpSubfield* subfield, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs) {
    fs_assert(subfield != NULL);
    firDB::firExp* subfield_exp = subfield->exp();
    if (!collectIdExpressionExps(subfield_exp, up_exp, exp_pairs)) {
      fs_assert(0);
      return false;
    }
    if (exp_pairs.empty()) {
      fs_assert(up_exp != NULL);
      up_exp = fir_module()->addExpSubfield(up_exp, subfield->id());
    } else {
      std::string id = subfield->id();
      std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs_bak = exp_pairs;
      exp_pairs.clear();
      for (size_t p = 0; p < exp_pairs_bak.size(); p++) {
        std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs_bak[p];
        firDB::firExp* subfield_exp = exp_pair.second;
        firDB::firExp* push_subfield = fir_module()->addExpSubfield(subfield_exp, id);
        exp_pairs.push_back(std::make_pair(exp_pair.first, push_subfield));
      }
    }
    return true;
  }
  bool TransferPost::collectSubindexExps(firDB::firExpSubindex* subindex, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs) {
    fs_assert(subindex != NULL);
    firDB::firExp* subindex_exp = subindex->exp();
    if (!collectIdExpressionExps(subindex_exp, up_exp, exp_pairs)) {
      fs_assert(0);
      return false;
    }
    if (exp_pairs.empty()) {
      fs_assert(up_exp != NULL);
      up_exp = fir_module()->addExpSubindex(up_exp, subindex->index());
    } else {
      std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs_bak = exp_pairs;
      exp_pairs.clear();
      int index = subindex->index();
      for (size_t p = 0; p < exp_pairs_bak.size(); p++) {
        std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs_bak[p];
        firDB::firExp* subindex_exp = exp_pair.second;
        firDB::firExp* push_subindex = fir_module()->addExpSubindex(subindex_exp, index);
        exp_pairs.push_back(std::make_pair(exp_pair.first, push_subindex));
      }
    }
    return true;
  }
  bool TransferPost::collectSubaccessExps(firDB::firExpSubaccess* subaccess, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs) {
    fs_assert(subaccess != NULL);
    firDB::firExp* subaccess_exp = subaccess->exp();
    firDB::firExp* access = subaccess->access();
    if (!collectIdExpressionExps(subaccess_exp, up_exp, exp_pairs)) {
      fs_assert(0);
      return false;
    }
    fs_assert(up_exp != NULL);
    firDB::firType* access_type = access->getTypeData(fir_module(), cur_cond());
    if (access->isIdExpression() && hasSubaccess(access)) {
      access = mergeNestSubaccess(access);
      mapTransferExps(access, NULL);
    }
    firDB::firType* subaccess_exp_type = subaccess_exp->getTypeData(fir_module(), cur_cond());
    if (!access_type->isUIntType()) {
      fs_error("*ERROR*: The access type of sub-access '%s' was not UInt. The valid type is UInt.\n", subaccess->toString().c_str());
      fs_assert(0);
      return false;
    }
    if (!subaccess_exp_type->isVectorType()) {
      fs_error("*ERROR*: The main-body type of sub-access '%s' was not vector. The valid type is vector.\n", subaccess->toString().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firExp* access_value = NULL;
    try {
      access_value = access->inferExpVal(fir_module(), cur_cond());
    } catch (Exception &e) {
      fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", subaccess->toString().c_str(), e.what());
      fs_assert(0);
    }
    firDB::firTypeVector* vtype = dynamic_cast<firDB::firTypeVector*>(subaccess_exp_type);
    if (exp_pairs.empty()) {
      if (access_value != NULL) {
        if (access_value->isUIntNumberExpression()) {
          BigInt* value_calc = NULL;
          if (access_value->isUIntExpression()) {
            value_calc = dynamic_cast<firDB::firExpUInt*>(access_value)->big_value();
          } else if (access_value->isUIntBitsExpression()) {
            value_calc = dynamic_cast<firDB::firExpUIntBits*>(access_value)->big_value();
          }
          unsigned int index = value_calc->getUIntValue();
          if (index >= vtype->depth()) {
            fs_error("*ERROR*: The sub-index value (%u) was not within the type depth range (0 to %u) of expression '%s'.\n", index, vtype->depth(), subaccess->toString().c_str());
            fs_assert(0);
            return false;
          }
          firDB::firExp* subindex = fir_module()->addExpSubindex(up_exp, index);
          up_exp = subindex;
          return true;
        } else {
          fs_error("*ERROR*: The access type of sub-access '%s' was not 'UInt'. The valid type is 'UInt'.\n", subaccess->toString().c_str());
          fs_assert(0);
          return false;
        }
      } else {
        unsigned int depth = vtype->depth();
        std::string s_depth = std::to_string(depth - 1);
        BigInt o_depth(s_depth, false);
        int depth_width = o_depth.getMinBinaryWidth();
        int width = dynamic_cast<firDB::firTypeUInt*>(access_type)->width();
        int min_width = std::min(depth_width, width);
        unsigned int max_value = std::min(static_cast<unsigned int>(std::pow(2, min_width)), depth);
        for (unsigned int i = 0; i < max_value; i++) {
          firDB::firExp* eq_value = fir_module()->addExpUInt(i, depth_width);
          firDB::firExpPrimOperation::firEq* eq_exp = fir_module()->addExpEq(access, eq_value);
          firDB::firExpSubindex* subindex = fir_module()->addExpSubindex(up_exp, i);
          exp_pairs.push_back(std::make_pair(eq_exp, subindex));
        }
      }
    } else {
      if (access_value != NULL) {
        if (access_value->isUIntNumberExpression()) {
          BigInt* value_calc = NULL;
          if (access_value->isUIntExpression()) {
            value_calc = dynamic_cast<firDB::firExpUInt*>(access_value)->big_value();
          } else if (access_value->isUIntBitsExpression()) {
            value_calc = dynamic_cast<firDB::firExpUIntBits*>(access_value)->big_value();
          }
          unsigned int index = value_calc->getUIntValue();
          if (index >= vtype->depth()) {
            fs_error("*ERROR*: The sub-index value (%u) was not within the type depth range (0 to %u) of expression '%s'.\n", index, vtype->depth(), subaccess->toString().c_str());
            fs_assert(0);
            return false;
          }
          std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs_bak = exp_pairs;
          exp_pairs.clear();
          for (size_t i = 0; i < exp_pairs_bak.size(); i++) {
            std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs_bak[i];
            firDB::firExp* subindex_exp = exp_pair.second;
            firDB::firExp* subindex = fir_module()->addExpSubindex(subindex_exp, index);
            exp_pairs.push_back(std::make_pair(exp_pair.first, subindex));
          }
          return true;
        } else {
          fs_error("*ERROR*: The access type of sub-access '%s' was not UInt. The valid type is UInt.\n", subaccess->toString().c_str());
          fs_assert(0);
          return false;
        }
      } else {
        unsigned int depth = vtype->depth();
        std::string s_depth = std::to_string(depth - 1);
        BigInt o_depth(s_depth, false);
        int depth_width = o_depth.getMinBinaryWidth();
        int width = dynamic_cast<firDB::firTypeUInt*>(access_type)->width();
        int min_width = std::min(depth_width, width);
        unsigned int max_value = std::min(static_cast<unsigned int>(std::pow(2, min_width)), depth);
        std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs_bak;
        exp_pairs_bak = exp_pairs;
        exp_pairs.clear();
        for (unsigned int v = 0; v < max_value; v++) {
          for (size_t p = 0; p < exp_pairs_bak.size(); p++) {
            std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs_bak[p];
            firDB::firExp* eq_exp = exp_pair.first;
            firDB::firExp* subindex_exp = exp_pair.second;
            firDB::firExp* eq_value = fir_module()->addExpUInt(v, depth_width);
            firDB::firExp* current_eq_exp = fir_module()->addExpEq(access, eq_value);
            firDB::firExpPrimOperation::firAnd* and_sel = fir_module()->addExpAnd(eq_exp, current_eq_exp);
            firDB::firExp* subindex = fir_module()->addExpSubindex(subindex_exp, static_cast<int>(v));
            exp_pairs.push_back(std::make_pair(and_sel, subindex));
          }
        }
      }
    }
    return true;
  }
  bool TransferPost::transferItemWireToPost(firDB::firItemWire* item_wire) {
    firDB::firType* type_data = item_wire->type_data();
    if (!transferTypeToPostWire(item_wire->id(), type_data)) {
      return false;
    } else {
      fs_info("*INFO*: Transferring Wire '%s' succeeded.\n", item_wire->id().c_str());
    }
    return true;
  }
  bool TransferPost::transferTypeToPostWire(const std::string& id, firDB::firType* type) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt:
      if (!transferTypeUIntToPostWire(id, dynamic_cast<firDB::firTypeUInt*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeSInt:
      if (!transferTypeSIntToPostWire(id, dynamic_cast<firDB::firTypeSInt*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeFixed:
      if (!transferTypeFixedToPostWire(id, dynamic_cast<firDB::firTypeFixed*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeInterval:
      if (!transferTypeIntervalToPostWire(id, dynamic_cast<firDB::firTypeInterval*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeClock:
      if (!transferTypeClockToPostWire(id, dynamic_cast<firDB::firTypeClock*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeAsyncReset:
      if (!transferTypeAsyncResetToPostWire(id, dynamic_cast<firDB::firTypeAsyncReset*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeReset:
      if (!transferTypeResetToPostWire(id, dynamic_cast<firDB::firTypeReset*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeAnalog:
      if (!transferTypeAnalogToPostWire(id, dynamic_cast<firDB::firTypeAnalog*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeVector:
      if (!transferTypeVectorToPostWire(id, dynamic_cast<firDB::firTypeVector*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeBundle:
      if (!transferTypeBundleToPostWire(id, dynamic_cast<firDB::firTypeBundle*>(type))) {
        return false;
      }
      break;
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferTypeUIntToPostWire(const std::string& id, firDB::firTypeUInt* type) {
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of wire '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return true;
    }
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, utype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeSIntToPostWire(const std::string& id, firDB::firTypeSInt* type) {
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of wire '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return false;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, stype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeFixedToPostWire(const std::string& id, firDB::firTypeFixed* type) {
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of wire '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return true;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, stype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeIntervalToPostWire(const std::string& id, firDB::firTypeInterval* type) {
    fs_assert(type != NULL);
    int width = 0;
    if (!type->getWidth(width)) {
      fs_warning("*WARNING*: The width (%d) of wire '%s' was invalid.\n", width, id.c_str());
      return false;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(width);
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, stype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeClockToPostWire(const std::string& id, firDB::firTypeClock* type) {
    fs_assert(type != NULL);
    firDB::firTypeClock* ctype = post_module()->addTypeClock();
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, ctype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeAsyncResetToPostWire(const std::string& id, firDB::firTypeAsyncReset* type) {
    fs_assert(type != NULL);
    firDB::firTypeAsyncReset* atype = post_module()->addTypeAsyncReset();
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, atype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeResetToPostWire(const std::string& id, firDB::firTypeReset* type) {
    fs_assert(type != NULL);
    firDB::firTypeReset* rtype = post_module()->addTypeReset();
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, rtype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeAnalogToPostWire(const std::string& id, firDB::firTypeAnalog* type) {
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of wire '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return false;
    }
    firDB::firTypeAnalog* atype = post_module()->addTypeAnalog(type->width());
    firDB::firItemWire* post_wire = post_module()->addItemWire(id, atype);
    post_module()->addStatement(post_wire);
    return true;
  }
  bool TransferPost::transferTypeVectorToPostWire(const std::string& id, firDB::firTypeVector* type) {
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      firDB::firType* vtype = type->type_data();
      std::string new_id = id + opt.hyphen() + std::to_string(i);
      if (!transferTypeToPostWire(new_id, vtype)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferTypeBundleToPostWire(const std::string& id, firDB::firTypeBundle* type) {
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_id = id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferTypeToPostWire(new_id, btype)) {
        return false;
      }
    }
    return true;
  }
  void TransferPost::mapTransferExps(firDB::firExp* ori_exp, firDB::firExp* post_exp) {
    fs_assert(ori_exp != NULL);
    auto item = transfer_exps_map_.find(ori_exp);
    if (item != transfer_exps_map_.end()) {
      if (ori_exp == NULL) {
        item->second = post_exp;
      }
    } else {
      transfer_exps_map_.insert(std::make_pair(ori_exp, post_exp));
    }
  }
  bool TransferPost::transferItemRegisterToPost(firDB::firItemRegister* item_register) {
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    const std::string& register_id = item_register->id();
    firDB::firType* type_data = item_register->type_data();
    fs_assert(type_data != NULL);
    firDB::firExp* clock_signal_exp = item_register->clock_signal();
    firDB::firExp* reg_reset_exp = item_register->reg_reset();
    firDB::firExp* reg_init_exp = item_register->reg_init();

    //clock-signal check
    fs_assert(clock_signal_exp != NULL);
    firDB::firType* clock_type = clock_signal_exp->getTypeData(module, cur_cond());
    if (clock_type == NULL) {
      fs_assert(0);
      return false;
    } else if (!clock_type->isClockType()) {
      fs_error("*ERROR*: The type of clock '%s' was illegal. The legal type for clock is 'Clock'.\n", clock_signal_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firExp* clock_signal_rexp = NULL;
    if (clock_signal_exp->isIdExpression()) {
      firDB::firItem* clock_item = module->findItemByExpression(clock_signal_exp, cur_cond());
      if (clock_item->isInstanceItem()) {
        firDB::firItemInstance* inst_clock = dynamic_cast<firDB::firItemInstance*>(clock_item);
        clock_item = inst_clock->getPortByExpression(fir_circuit(), clock_signal_exp);
        fs_assert(clock_item != NULL);
      }
      if (clock_item->isWireItem() || clock_item->isPortItem() || clock_item->isNodeItem()) {
        std::string clock_refid;
        if (!transferIdExpression(clock_refid, "", clock_signal_exp)) {
          fs_assert(0);
          return false;
        }
        clock_signal_rexp = createNewExpById(clock_refid);
      } else if (clock_item == NULL) {
        fs_error("*ERROR*: Could not find the matching item for clock signal '%s'.\n", clock_signal_exp->toString().c_str());
        fs_assert(0);
        return false;
      } else {
        fs_error("*ERROR*: The item-definition for clock signal '%s' was incorrect.\n", clock_signal_exp->toString().c_str());
        fs_assert(0);
        return false;
      }
    } else if (clock_signal_exp->isPrimOperationExpression()) {
      clock_signal_rexp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(clock_signal_exp), false);
    } else {
      fs_error("*ERROR*: The expression for clock signal '%s' was incorrect.\n", clock_signal_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    fs_assert(clock_signal_rexp != NULL);

    if (reg_reset_exp != NULL) {
      //register with reset-signal
      fs_assert(reg_init_exp != NULL);
      //reset-signal check
      firDB::firType* reset_type = reg_reset_exp->getTypeData(module, cur_cond());
      if (reset_type == NULL) {
        fs_assert(0);
        return false;
      } else if (reset_type->isResetType() || reset_type->isAsyncResetType()) {
      } else if (reset_type->isUIntType()) {
        if (isZeroWidthType(reset_type)) {
          throw Exception("The zero width expression '" + reg_reset_exp->toString() + "' was invalid, and connot be used as the reset signal of '" + item_register->toString() + "'.");
        }
        if (dynamic_cast<firDB::firTypeUInt*>(reset_type)->width() != 1) {
          fs_error("*ERROR*: The width (%d) of reset signal '%s' was not 1.\n", dynamic_cast<firDB::firTypeUInt*>(reset_type)->width(), reg_reset_exp->toString().c_str());
          fs_assert(0);
          return false;
        }
      } else {
        fs_error("*ERROR*: The type of reset signal '%s' was illegal.\n", reg_reset_exp->toString().c_str());
        fs_assert(0);
        return false;
      }
      firDB::firExp* reg_reset_rexp = NULL;
      if (reg_reset_exp->isIdExpression()) {
        firDB::firItem* reset_item = module->findItemByExpression(reg_reset_exp, cur_cond());
        if (reset_item->isInstanceItem()) {
          firDB::firItemInstance* inst_reset = dynamic_cast<firDB::firItemInstance*>(reset_item);
          fs_assert(inst_reset != NULL);
          reset_item = inst_reset->getPortByExpression(fir_circuit(), reg_reset_exp);
          fs_assert(reset_item != NULL);
        }
        if (reset_item->isWireItem() || reset_item->isPortItem() || reset_item->isNodeItem()) {
          std::string reset_refid;
          if (!transferIdExpression(reset_refid, "", reg_reset_exp)) {
            fs_assert(0);
            return false;
          }
          reg_reset_rexp = createNewExpById(reset_refid);
        } else if (reset_item == NULL) {
          fs_error("*ERROR*: Could not find the matching item for reset signal '%s'.\n", reg_reset_exp->toString().c_str());
          fs_assert(0);
          return false;
        } else {
          fs_error("*ERROR*: The item-definition for reset signal '%s' was incorrect.\n", reg_reset_exp->toString().c_str());
          fs_assert(0);
          return false;
        }
      } else if (reg_reset_exp->isPrimOperationExpression()) {
        reg_reset_rexp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(reg_reset_exp), false);
      } else if (reg_reset_exp->isUIntExpression() || reg_reset_exp->isUIntBitsExpression()) {
        if (reg_reset_exp->isUIntExpression()) {
          if (dynamic_cast<firDB::firExpUInt*>(reg_reset_exp)->big_value()->getUIntValue() == 1) {
            fs_error("*ERROR*: The expression for reset signal '%s' can not be 1.\n", reg_reset_exp->toString().c_str());
          }
        } else {
          BigInt* o_reset = dynamic_cast<firDB::firExpUIntBits*>(reg_reset_exp)->big_value();
          if (o_reset->getUIntValue() != 0) {
            fs_error("*ERROR*: The expression for reset signal '%s' can not be 1.\n", reg_reset_exp->toString().c_str());
          }
        }
        if (!transferTypeToPostRegister(register_id, type_data, clock_signal_rexp)) {
          return false;
        }
        fs_info("*INFO*: Transferring Register '%s' succeeded.\n", item_register->id().c_str());
        return true;
      } else {
        fs_error("*ERROR*: The expression for reset signal '%s' was incorrect.\n", reg_reset_exp->toString().c_str());
        fs_assert(0);
        return false;
      }
      fs_assert(reg_reset_rexp != NULL);

      if (reg_init_exp->isNumberExpression()) {
        if (!type_data->isGroundType()) {
          fs_error("*ERROR*: The types of register '%s' and reset value '%s' are not the same.\n", register_id.c_str(), reg_reset_exp->toString().c_str());
          fs_assert(0);
          return false;
        }
        if (isZeroWidthType(type_data)) {
          fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", register_id.c_str());
          return true;
        }
        if (reg_init_exp->isUIntExpression()) {
          if (!type_data->isUIntType()) {
            fs_error("*ERROR*: The types of register '%s' and reset value '%s' are not the same.\n", register_id.c_str(), reg_reset_exp->toString().c_str());
            fs_assert(0);
            return false;
          }
          if (!transferResetUIntToPostRegister(register_id, dynamic_cast<firDB::firTypeUInt*>(type_data), clock_signal_rexp, reg_reset_rexp, dynamic_cast<firDB::firExpUInt*>(reg_init_exp))) {
            return false;
          }
        } else if (reg_init_exp->isUIntBitsExpression()) {
          if (!type_data->isUIntType()) {
            fs_error("*ERROR*: The types of register '%s' and reset value '%s' are not the same.\n", register_id.c_str(), reg_reset_exp->toString().c_str());
            fs_assert(0);
            return false;
          }
          if (!transferResetUIntBitsToPostRegister(register_id, dynamic_cast<firDB::firTypeUInt*>(type_data), clock_signal_rexp, reg_reset_rexp, dynamic_cast<firDB::firExpUIntBits*>(reg_init_exp))) {
            return false;
          }
        } else if (reg_init_exp->isSIntExpression()) {
          if (!type_data->isSIntType()) {
            fs_error("*ERROR*: The types of register '%s' and reset value '%s' are not the same.\n", register_id.c_str(), reg_reset_exp->toString().c_str());
            fs_assert(0);
            return false;
          }
          if (!transferResetSIntToPostRegister(register_id, dynamic_cast<firDB::firTypeSInt*>(type_data), clock_signal_rexp, reg_reset_rexp, dynamic_cast<firDB::firExpSInt*>(reg_init_exp))) {
            return false;
          }
        } else if (reg_init_exp->isSIntBitsExpression()) {
          if (!type_data->isSIntType()) {
            fs_error("*ERROR*: The types of register '%s' and reset value '%s' are not the same.\n", register_id.c_str(), reg_reset_exp->toString().c_str());
            fs_assert(0);
            return false;
          }
          if (!transferResetSIntBitsToPostRegister(register_id, dynamic_cast<firDB::firTypeSInt*>(type_data), clock_signal_rexp, reg_reset_rexp, dynamic_cast<firDB::firExpSIntBits*>(reg_init_exp))) {
            return false;
          }
        }
      } else if (reg_init_exp->isReferenceExpression()) {
        firDB::firModule* module = fir_module();
        if (module == NULL) {
          fs_assert(0);
          return false;
        }
        firDB::firType* reg_init_type = reg_init_exp->getTypeData(module, cur_cond());
        if (reg_init_type == NULL) {
          fs_assert(0);
          return false;
        }
        firDB::firItem* reg_init_item = module->findItemByExpression(reg_init_exp, cur_cond());
        if (!(reg_init_item->isPortItem() || reg_init_item->isNodeItem() || reg_init_item->isWireItem() || reg_init_item->isRegisterItem())) {
          fs_error("*ERROR*: The item-type for reset value '%s' must be a port, a node, a wire or a register.\n", reg_init_exp->toString().c_str());
          fs_assert(0);
          return false;
        }
        if (!transferResetToPostRegisterByIdExpression(register_id, type_data, clock_signal_rexp, reg_reset_rexp, reg_init_exp, reg_init_type)) {
          fs_assert(0);
          return false;
        }
      } else if (reg_init_exp->isPrimOperationExpression()) {
        firDB::firModule* module = fir_module();
        if (module == NULL) {
          fs_assert(0);
          return false;
        }
        firDB::firType* reg_init_type = reg_init_exp->getTypeData(module, cur_cond());
        if (!type_data->isCompatible(reg_init_type)) {
          fs_error("*ERROR*: The type for reset value '%s' must as same as the related register.\n", reg_init_exp->toString().c_str());
          fs_assert(0);
          return false;
        }
        fs_assert(reg_init_type->isGroundType());
        if (isZeroWidthType(reg_init_type)) {
          throw Exception("The zero width expression '" + reg_init_exp->toString() + "' was invalid, and connot be used as the reset value of '" + register_id + "'.");
        }
        if (isZeroWidthType(type_data)) {
          fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", register_id.c_str());
          return true;
        }
        firDB::firExp* new_reg_init_exp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(reg_init_exp), false);
        firDB::firType* new_reg_init_type = new_reg_init_exp->getTypeData(module, cur_cond());
        if (new_reg_init_type == NULL) {
          fs_assert(0);
          return false;
        }
        if (!transferResetPrimOptToPostRegister(register_id, type_data, clock_signal_exp, reg_reset_exp, new_reg_init_exp, new_reg_init_type)) {
          return false;
        }
      } else {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(reg_init_exp == NULL);
      if (!transferTypeToPostRegister(register_id, type_data, clock_signal_rexp)) {
        return false;
      }
    }
    fs_info("*INFO*: Transferring Register '%s' succeeded.\n", item_register->id().c_str());
    return true;
  }
  bool TransferPost::transferResetToPostRegisterByIdExpression(const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firType* reg_init_type) {
    fs_assert(type != NULL);
    fs_assert(reg_init_exp != NULL);
    fs_assert(reg_init_type != NULL);
    std::string tail_id = "";
    if (!transferResetIdExpByType(tail_id, id, type, clock_signal_exp, reg_reset_exp, reg_init_exp, reg_init_type)) {
      return false;
    }
    return true;
  }
  bool TransferPost::transferResetIdExpByType(std::string& tail_id, const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firType* reg_init_type) {
    if (type->isGroundType()) {
      if (isZeroWidthType(type)) {
        fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", id.c_str());
        return true;
      }
      if (isZeroWidthType(reg_init_type)) {
        throw Exception("The zero width expression '" + reg_init_exp->toString() + "' was invalid, and connot be used as the reset value of '" + id + "'.");
      }
      if (!transferResetIdExpByGroundType(tail_id, id, type, clock_signal_exp, reg_reset_exp, reg_init_exp, reg_init_type)) {
        fs_assert(0);
        return false;
      }
    } else if (type->isVectorType()) {
      if (!transferResetIdRegisterTypeVectorToPost(tail_id, id, dynamic_cast<firDB::firTypeVector*>(type), clock_signal_exp, reg_reset_exp, reg_init_exp, dynamic_cast<firDB::firTypeVector*>(reg_init_type))) {
        fs_assert(0);
        return false;
      }
    } else if (type->isBundleType()) {
      if (!transferResetIdRegisterTypeBundleToPost(tail_id, id, dynamic_cast<firDB::firTypeBundle*>(type), clock_signal_exp, reg_reset_exp, reg_init_exp, dynamic_cast<firDB::firTypeBundle*>(reg_init_type))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferResetIdExpByGroundType(std::string& tail_id, const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firType* reg_init_type) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt:
      if (!transferResetIdRegisterTypeUIntToPost(tail_id, id, dynamic_cast<firDB::firTypeUInt*>(type), clock_signal_exp, reg_reset_exp, reg_init_exp, dynamic_cast<firDB::firTypeUInt*>(reg_init_type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeSInt:
      if (!transferResetIdRegisterTypeSIntToPost(tail_id, id, dynamic_cast<firDB::firTypeSInt*>(type), clock_signal_exp, reg_reset_exp, reg_init_exp, dynamic_cast<firDB::firTypeSInt*>(reg_init_type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeFixed:
      if (!transferResetIdRegisterTypeFixedToPost(tail_id, id, dynamic_cast<firDB::firTypeFixed*>(type), clock_signal_exp, reg_reset_exp, reg_init_exp, dynamic_cast<firDB::firTypeFixed*>(reg_init_type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeInterval:
      if (!transferResetIdRegisterTypeIntervalToPost(tail_id, id, dynamic_cast<firDB::firTypeInterval*>(type), clock_signal_exp, reg_reset_exp, reg_init_exp, dynamic_cast<firDB::firTypeInterval*>(reg_init_type))) {
        return false;
      }
      break;
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferTypeToPostRegister(const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt: {
      if (!transferTypeUIntToPostRegister(id, dynamic_cast<firDB::firTypeUInt*>(type), clock_signal_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeSInt: {
      if (!transferTypeSIntToPostRegister(id, dynamic_cast<firDB::firTypeSInt*>(type), clock_signal_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeFixed: {
      if (!transferTypeFixedToPostRegister(id, dynamic_cast<firDB::firTypeFixed*>(type), clock_signal_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeInterval: {
      if (!transferTypeIntervalToPostRegister(id, dynamic_cast<firDB::firTypeInterval*>(type), clock_signal_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeVector: {
      if (!transferTypeVectorToPostRegister(id, dynamic_cast<firDB::firTypeVector*>(type), clock_signal_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeBundle: {
      if (!transferTypeBundleToPostRegister(id, dynamic_cast<firDB::firTypeBundle*>(type), clock_signal_exp)) {
        return false;
      }
      break;
    }
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferResetPrimOptToPostRegister(const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firType* reg_init_type) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt: {
      fs_assert(type->isCompatible(reg_init_type));
      firDB::firTypeUInt* reg_init_utype = dynamic_cast<firDB::firTypeUInt*>(reg_init_type);
      firDB::firTypeUInt* utype = dynamic_cast<firDB::firTypeUInt*>(type);
      if (!utype->valid_width()) return false;
      if (reg_init_utype->width() > utype->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n",
          reg_init_utype->width(), utype->width());
      }
      if (!transferResetPrimOptTypeUIntToPostRegister(id, utype, clock_signal_exp, reg_reset_exp, reg_init_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeSInt: {
      fs_assert(type->isCompatible(reg_init_type));
      firDB::firTypeSInt* reg_init_stype = dynamic_cast<firDB::firTypeSInt*>(reg_init_type);
      firDB::firTypeSInt* stype = dynamic_cast<firDB::firTypeSInt*>(type);
      if (!stype->valid_width()) return false;
      if (reg_init_stype->width() > stype->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n",
          reg_init_stype->width(), stype->width());
      }
      if (!transferResetPrimOptTypeSIntToPostRegister(id, stype, clock_signal_exp, reg_reset_exp, reg_init_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeFixed: {
      fs_assert(type != NULL);
      firDB::firTypeSInt* reg_init_stype = dynamic_cast<firDB::firTypeSInt*>(reg_init_type);
      firDB::firTypeFixed* ftype = dynamic_cast<firDB::firTypeFixed*>(type);
      if (!ftype->valid_width()) {
        fs_assert(0);
        return false;
      }
      firDB::firTypeSInt* new_stype = post_module()->addTypeSInt(ftype->width());
      if (reg_init_stype->width() > ftype->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n",
          reg_init_stype->width(), ftype->width());
      }
      if (!transferResetPrimOptTypeSIntToPostRegister(id, new_stype, clock_signal_exp, reg_reset_exp, reg_init_exp)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeInterval: {
      fs_assert(type != NULL);
      firDB::firTypeSInt* reg_init_stype = dynamic_cast<firDB::firTypeSInt*>(reg_init_type);
      firDB::firTypeInterval* itype = dynamic_cast<firDB::firTypeInterval*>(type);
      int bitWidth = 0;
      if (!itype->getWidth(bitWidth)) {
        fs_assert(0);
        return false;
      }
      firDB::firTypeSInt* new_stype = post_module()->addTypeSInt(bitWidth);
      if (reg_init_stype->width() > new_stype->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n",
          reg_init_stype->width(), new_stype->width());
      }
      if (!transferResetPrimOptTypeSIntToPostRegister(id, new_stype, clock_signal_exp, reg_reset_exp, reg_init_exp)) {
        return false;
      }
      break;
    }
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferResetUIntToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExpUInt* reg_init_exp) {
    if (!type->valid_width()) return false;
    firDB::firExp* reg_init_rexp = NULL;
    reg_init_rexp = post_module()->copyExpression(reg_init_exp);
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, utype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    fs_assert(reg_init_exp != NULL);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      int reg_init_width = static_cast<int>(reg_init_exp->width());
      if (reg_init_width > type->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_exp->width(), type->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetUIntBitsToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExpUIntBits* reg_init_exp) {
    if (!type->valid_width()) return false;
    firDB::firExp* reg_init_rexp = NULL;
    reg_init_rexp = post_module()->copyExpression(reg_init_exp);
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, utype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    fs_assert(reg_init_exp != NULL);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      int reg_init_width = static_cast<int>(reg_init_exp->width());
      if (reg_init_width > type->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_exp->width(), type->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetSIntToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExpSInt* reg_init_exp) {
    if (!type->valid_width()) return false;
    firDB::firExp* reg_init_rexp = NULL;
    reg_init_rexp = post_module()->copyExpression(reg_init_exp);
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    fs_assert(reg_init_exp != NULL);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      int reg_init_width = static_cast<int>(reg_init_exp->width());
      if (reg_init_width > type->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_exp->width(), type->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetSIntBitsToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExpSIntBits* reg_init_exp) {
    if (!type->valid_width()) return false;
    firDB::firExp* reg_init_rexp = NULL;
    reg_init_rexp = post_module()->copyExpression(reg_init_exp);
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    fs_assert(reg_init_exp != NULL);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      int reg_init_width = static_cast<int>(reg_init_exp->width());
      if (reg_init_width > type->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_exp->width(), type->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetIdRegisterTypeUIntToPost(std::string& tail_id, const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firTypeUInt* reg_init_type) {
    if (!type->valid_width()) return false;
    std::string reg_init_id;
    if (!transferIdExpression(reg_init_id, tail_id, reg_init_exp)) {
      fs_assert(0);
      return false;
    }
    firDB::firExp* reg_init_rexp = createNewExpById(reg_init_id);
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, utype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      if (reg_init_type->width() > type->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_type->width(), type->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetIdRegisterTypeSIntToPost(std::string& tail_id, const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firTypeSInt* reg_init_type) {
    if (!type->valid_width()) return false;
    std::string reg_init_id;
    if (!transferIdExpression(reg_init_id, tail_id, reg_init_exp)) {
      fs_assert(0);
      return false;
    }
    firDB::firExp* reg_init_rexp = createNewExpById(reg_init_id);
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      if (reg_init_type->width() > type->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_type->width(), type->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetIdRegisterTypeFixedToPost(std::string& tail_id, const std::string& id, firDB::firTypeFixed* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firTypeFixed* reg_init_type) {
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_assert(0);
      return false;
    }
    std::string reg_init_id;
    if (!transferIdExpression(reg_init_id, tail_id, reg_init_exp)) {
      fs_assert(0);
      return false;
    }
    firDB::firExp* reg_init_rexp = createNewExpById(reg_init_id);
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      firDB::firTypeSInt* reg_init_stype = post_module()->addTypeSInt(reg_init_type->width());
      if (reg_init_stype->width() > stype->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_stype->width(), stype->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetIdRegisterTypeIntervalToPost(std::string& tail_id, const std::string& id, firDB::firTypeInterval* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firTypeInterval* reg_init_type) {
    fs_assert(type != NULL);
    int bitWidth = 0;
    if (!type->getWidth(bitWidth)) {
      fs_assert(0);
      return false;
    }
    std::string reg_init_id;
    if (!transferIdExpression(reg_init_id, tail_id, reg_init_exp)) {
      fs_assert(0);
      return false;
    }
    firDB::firExp* reg_init_rexp = createNewExpById(reg_init_id);
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(bitWidth);
    fs_assert(reg_init_type != NULL);
    int reg_init_bitWidth = 0;
    if (!reg_init_type->getWidth(reg_init_bitWidth)) {
      fs_assert(0);
      return false;
    }
    firDB::firTypeSInt* reg_init_stype = post_module()->addTypeSInt(reg_init_bitWidth);
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp, reg_reset_exp, reg_init_rexp);
    post_module()->addStatement(post_register);
    firDB::firType* reg_reset_type = reg_reset_exp->getTypeData(this->post_module(), cur_cond());
    fs_assert(reg_reset_type != NULL);
    if (!reg_reset_type->isAsyncResetType()) {
      if (reg_init_stype->width() > stype->width()) {
        fs_warning("*WARNING*: The width (%d) of reset value was larger than the width (%d) of register.\n", reg_init_stype->width(), stype->width());
      }
    }
    return true;
  }
  bool TransferPost::transferResetIdRegisterTypeVectorToPost(std::string& tail_id, const std::string& id, firDB::firTypeVector* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firTypeVector* reg_init_type) {
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      firDB::firType* vtype = type->type_data();
      firDB::firType* reset_vtype = reg_init_type->type_data();
      std::string new_id = id + opt.hyphen() + std::to_string(i);
      std::string new_reg_init_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferResetIdExpByType(new_reg_init_tail_id, new_id, vtype, clock_signal_exp, reg_reset_exp, reg_init_exp, reset_vtype)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferResetIdRegisterTypeBundleToPost(std::string& tail_id, const std::string& id, firDB::firTypeBundle* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp, firDB::firTypeBundle* reg_init_type) {
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    std::vector<firDB::firField*>& reset_type_datas = reg_init_type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      firDB::firType* reg_init_btype = reset_type_datas[i]->type_data();
      std::string new_id = id + opt.hyphen() + type_datas[i]->field_id();
      std::string new_reset_tail_id = tail_id + opt.hyphen() + reset_type_datas[i]->field_id();
      if (!transferResetIdExpByType(new_reset_tail_id, new_id, btype, clock_signal_exp, reg_reset_exp, reg_init_exp, reg_init_btype)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferResetPrimOptTypeUIntToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp) {
    if (!type->valid_width()) return false;
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, utype, clock_signal_exp);
    post_module()->addStatement(post_register);
    
    if (!reg_reset_exp->isUIntNumberExpression()) {
      fs_assert(reg_init_exp != NULL);
    }
    return true;
  }
  bool TransferPost::transferResetPrimOptTypeSIntToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reg_reset_exp, firDB::firExp* reg_init_exp) {
    if (!type->valid_width()) return false;
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp);
    post_module()->addStatement(post_register);

    if (!reg_reset_exp->isUIntNumberExpression()) {
      fs_assert(reg_init_exp != NULL);
    }
    return true;
  }
  bool TransferPost::transferTypeUIntToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp) {
    fs_assert(clock_signal_exp != NULL);
    if (isZeroWidthType(type)) {
      fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", id.c_str());
      return true;
    }
    firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, utype, clock_signal_exp);
    post_module()->addStatement(post_register);
    return true;
  }
  bool TransferPost::transferTypeSIntToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp) {
    fs_assert(clock_signal_exp != NULL);
    if (isZeroWidthType(type)) {
      fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", id.c_str());
      return true;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp);
    post_module()->addStatement(post_register);
    return true;
  }
  bool TransferPost::transferTypeFixedToPostRegister(const std::string& id, firDB::firTypeFixed* type, firDB::firExp* clock_signal_exp) {
    fs_assert(type != NULL);
    if (isZeroWidthType(type)) {
      fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", id.c_str());
      return true;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp);
    post_module()->addStatement(post_register);
    return true;
  }
  bool TransferPost::transferTypeIntervalToPostRegister(const std::string& id, firDB::firTypeInterval* type, firDB::firExp* clock_signal_exp) {
    fs_assert(type != NULL);
    if (isZeroWidthType(type)) {
      fs_warning("*WARNING*: The register '%s' has an invalid zero bit width type definition.\n", id.c_str());
      return true;
    }
    int bitWidth = 0;
    if (!type->getWidth(bitWidth)) {
      fs_assert(0);
      return false;
    }
    firDB::firTypeSInt* stype = post_module()->addTypeSInt(bitWidth);
    firDB::firItemRegister* post_register = post_module()->addItemRegister(id, stype, clock_signal_exp);
    post_module()->addStatement(post_register);
    return true;
  }
  bool TransferPost::transferTypeVectorToPostRegister(const std::string& id, firDB::firTypeVector* type, firDB::firExp* clock_signal_exp) {
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      firDB::firType* vtype = type->type_data();
      std::string new_id = id + opt.hyphen() + std::to_string(i);
      if (!transferTypeToPostRegister(new_id, vtype, clock_signal_exp)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferTypeBundleToPostRegister(const std::string& id, firDB::firTypeBundle* type, firDB::firExp* clock_signal_exp) {
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_id = id + opt.hyphen() + type_datas[i]->field_id();
      std::string reg_init_refid;
      if (!transferTypeToPostRegister(new_id, btype, clock_signal_exp)) {
        return false;
      }
    }
    return true;
  }

  bool TransferPost::transferItemMemoryToPost(firDB::firItemMemory* item_memory) {
    fs_assert(item_memory != NULL);
    std::string memName = item_memory->id();
    firDB::firType* type_data = item_memory->type_data();
    unsigned int depth = item_memory->depth();
    fs_assert(depth > 0);
    fs_assert(type_data->isMemoryType());
    if (!transferVectorTypeToPostMemory(item_memory, memName, type_data, depth)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Memory '%s' succeeded.\n", memName.c_str());
    return true;
  }
  bool TransferPost::transferItemCMemoryToPost(firDB::firItemCMemory* item_cmemory) {
    fs_assert(item_cmemory != NULL);
    std::string cmemName = item_cmemory->id();
    firDB::firType* type_data = item_cmemory->type_data();
    fs_assert(type_data != NULL);
    if (type_data->isVectorType()) {
      unsigned int depth = dynamic_cast<firDB::firTypeVector*>(type_data)->depth();
      fs_assert(depth > 0);
      firDB::firType* data_type = dynamic_cast<firDB::firTypeVector*>(type_data)->type_data();
      if (!transferVectorTypeToPostMemory(item_cmemory, cmemName, data_type, depth)) {
        fs_assert(0);
        return false;
      }
    } else if (type_data->isGroundType()) {
      fs_error("*ERROR*: The depth of the memory '%s' was not specified. Specify the memory depth and rerun.\n", cmemName.c_str());
      fs_assert(0);
      return false;
    } else {
      fs_error("*ERROR*: The data type of memory '%s' was invalid. Correct the data-type and depth of the memory and rerun.\n", cmemName.c_str());
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring CMemory '%s' succeeded.\n", cmemName.c_str());
    return true;
  }
  bool TransferPost::transferVectorTypeToPostMemory(firDB::firItem* item, const std::string& id, firDB::firType* type, unsigned int depth) {
    fs_assert(type != NULL);
    switch (type->type()) {
    case firDB::Type::kTypeUInt: {
      if (!transferTypeUIntToPostMemory(item, id, dynamic_cast<firDB::firTypeUInt*>(type), depth)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::Type::kTypeSInt: {
      if (!transferTypeSIntToPostMemory(item, id, dynamic_cast<firDB::firTypeSInt*>(type), depth)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::Type::kTypeFixed: {
      if (!transferTypeFixedToPostMemory(item, id, dynamic_cast<firDB::firTypeFixed*>(type), depth)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::Type::kTypeInterval: {
      if (!transferTypeIntervalToPostMemory(item, id, dynamic_cast<firDB::firTypeInterval*>(type), depth)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::Type::kTypeBundle: {
      if (!transferTypeBundleToPostMemory(item, id, dynamic_cast<firDB::firTypeBundle*>(type), depth)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::Type::kTypeVector: {
      if (!transferTypeVectorToPostMemory(item, id, dynamic_cast<firDB::firTypeVector*>(type), depth)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    default: {
      fs_error("*ERROR*: The data type of memory '%s' was not supported. The optional data types are UInt, SInt, Fixed, Interval, and bundle or vector of these ground types.\n", id.c_str());
      fs_assert(0);
      return false;
      break;
    }
    }
    return true;
  }
  bool TransferPost::transferTypeUIntToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeUInt* type, unsigned int depth) {
    fs_assert(item != NULL);
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return true;
    }
    unsigned int read_latency = 1;
    unsigned int write_latency = 1;
    firDB::RUW read_under_write = firDB::RUW::kRuwUndef;
    if (item->isCMemoryItem()) {
      read_latency = 0;
      firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, utype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isSMemoryItem()) {
      firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, utype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isMemoryItem()) {
      firDB::firItemMemory* memory_item = dynamic_cast<firDB::firItemMemory*>(item);
      read_latency = memory_item->read_latency();
      write_latency = memory_item->write_latency();
      read_under_write = memory_item->read_under_write();
      std::vector<std::pair<std::string, firDB::MPortDir>>& memory_ports = memory_item->ports();
      firDB::firTypeUInt* utype = post_module()->addTypeUInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, utype, depth, read_latency, write_latency, read_under_write);
      for (size_t mp = 0; mp < memory_ports.size(); mp++) {
        std::string mport_id = memory_ports[mp].first;
        firDB::MPortDir mport_dir = memory_ports[mp].second;
        if (mport_dir == firDB::MPortDir::kMPortDirRead) {
          memory->addReadPorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
          memory->addWritePorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
          memory->addReadWritePorts(mport_id);
        } else {
          fs_assert(0);
          return false;
        }
      }
      post_module()->addStatement(memory);
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferTypeSIntToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeSInt* type, unsigned int depth) {
    fs_assert(item != NULL);
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return true;
    }
    unsigned int read_latency = 1;
    unsigned int write_latency = 1;
    firDB::RUW read_under_write = firDB::RUW::kRuwUndef;
    if (item->isCMemoryItem()) {
      read_latency = 0;
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isSMemoryItem()) {
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isMemoryItem()) {
      firDB::firItemMemory* memory_item = dynamic_cast<firDB::firItemMemory*>(item);
      read_latency = memory_item->read_latency();
      write_latency = memory_item->write_latency();
      read_under_write = memory_item->read_under_write();
      std::vector<std::pair<std::string, firDB::MPortDir>>& memory_ports = memory_item->ports();
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      for (size_t mp = 0; mp < memory_ports.size(); mp++) {
        std::string mport_id = memory_ports[mp].first;
        firDB::MPortDir mport_dir = memory_ports[mp].second;
        if (mport_dir == firDB::MPortDir::kMPortDirRead) {
          memory->addReadPorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
          memory->addWritePorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
          memory->addReadWritePorts(mport_id);
        } else {
          fs_assert(0);
          return false;
        }
      }
      post_module()->addStatement(memory);
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferTypeFixedToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeFixed* type, unsigned int depth) {
    fs_assert(item != NULL);
    fs_assert(type != NULL);
    if (!type->valid_width()) {
      fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", type->invalid_width(), id.c_str());
      return true;
    }
    unsigned int read_latency = 1;
    unsigned int write_latency = 1;
    firDB::RUW read_under_write = firDB::RUW::kRuwUndef;
    if (item->isCMemoryItem()) {
      read_latency = 0;
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isSMemoryItem()) {
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isMemoryItem()) {
      firDB::firItemMemory* memory_item = dynamic_cast<firDB::firItemMemory*>(item);
      read_latency = memory_item->read_latency();
      write_latency = memory_item->write_latency();
      read_under_write = memory_item->read_under_write();
      std::vector<std::pair<std::string, firDB::MPortDir>>& memory_ports = memory_item->ports();
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(type->width());
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      for (size_t mp = 0; mp < memory_ports.size(); mp++) {
        std::string mport_id = memory_ports[mp].first;
        firDB::MPortDir mport_dir = memory_ports[mp].second;
        if (mport_dir == firDB::MPortDir::kMPortDirRead) {
          memory->addReadPorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
          memory->addWritePorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
          memory->addReadWritePorts(mport_id);
        } else {
          fs_assert(0);
          return false;
        }
      }
      post_module()->addStatement(memory);
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferTypeIntervalToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeInterval* type, unsigned int depth) {
    fs_assert(item != NULL);
    fs_assert(type != NULL);
    int bitWidth = 0;
    if (!type->getWidth(bitWidth)) {
      fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", bitWidth, id.c_str());
      return true;
    }
    unsigned int read_latency = 1;
    unsigned int write_latency = 1;
    firDB::RUW read_under_write = firDB::RUW::kRuwUndef;
    if (item->isCMemoryItem()) {
      read_latency = 0;
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(bitWidth);
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isSMemoryItem()) {
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(bitWidth);
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      post_module()->addStatement(memory);
    } else if (item->isMemoryItem()) {
      firDB::firItemMemory* memory_item = dynamic_cast<firDB::firItemMemory*>(item);
      read_latency = memory_item->read_latency();
      write_latency = memory_item->write_latency();
      read_under_write = memory_item->read_under_write();
      std::vector<std::pair<std::string, firDB::MPortDir>>& memory_ports = memory_item->ports();
      firDB::firTypeSInt* stype = post_module()->addTypeSInt(bitWidth);
      firDB::firItemMemory* memory = post_module()->addItemMemory(id, stype, depth, read_latency, write_latency, read_under_write);
      for (size_t mp = 0; mp < memory_ports.size(); mp++) {
        std::string mport_id = memory_ports[mp].first;
        firDB::MPortDir mport_dir = memory_ports[mp].second;
        if (mport_dir == firDB::MPortDir::kMPortDirRead) {
          memory->addReadPorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
          memory->addWritePorts(mport_id);
        } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
          memory->addReadWritePorts(mport_id);
        } else {
          fs_assert(0);
          return false;
        }
      }
      post_module()->addStatement(memory);
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferTypeBundleToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeBundle* type, unsigned int depth) {
    fs_assert(item != NULL);
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_id = id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferVectorTypeToPostMemory(item, new_id, btype, depth)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferTypeVectorToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeVector* type, unsigned int depth) {
    fs_assert(item != NULL);
    fs_assert(type != NULL);
    firDB::firType* btype = type->type_data();
    for (unsigned int i = 0; i < type->depth(); i++) {
      std::string new_id = id + opt.hyphen() + std::to_string(i);
      if (!transferVectorTypeToPostMemory(item, new_id, btype, depth)) {
        return false;
      }
    }
    return true;
  }

  bool TransferPost::transferItemSMemoryToPost(firDB::firItemSMemory* item_smemory) {
    fs_assert(item_smemory != NULL);
    std::string smemName = item_smemory->id();
    firDB::firType* type_data = item_smemory->type_data();
    fs_assert(type_data != NULL);
    if (type_data->isVectorType()) {
      unsigned int depth = dynamic_cast<firDB::firTypeVector*>(type_data)->depth(); // vector size indicates the 'rows' of the memory
      fs_assert(depth > 0);
      firDB::firType* data_type = dynamic_cast<firDB::firTypeVector*>(type_data)->type_data();
      if (!transferVectorTypeToPostMemory(item_smemory, smemName, data_type, depth)) {
        fs_assert(0);
        return false;
      }
    } else if (type_data->isGroundType()) {
      fs_error("*ERROR*: The depth of memory '%s' was not specified. Specify the memory depth and rerun.\n", smemName.c_str());
      fs_assert(0);
      return false;
    } else {
      fs_error("*ERROR*: The data type of memory '%s' was invalid. Correct the data-type and depth of the memory and rerun.\n", smemName.c_str());
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring SMemory '%s' succeeded.\n", smemName.c_str());
    return true;
  }
  bool TransferPost::alignBinaryToSpecifiedType(firDB::firExp*& exp, firDB::firType* target_type, firDB::firType* original_type) {
    fs_assert(target_type != NULL);
    fs_assert(original_type != NULL);
    if (!target_type->isCompatible(original_type)) {
      fs_assert(0);
      return false;
    }
    if (target_type->isFixedType()) {
      firDB::firTypeFixed* f_target_type = dynamic_cast<firDB::firTypeFixed*>(target_type);
      firDB::firTypeFixed* f_original_type = dynamic_cast<firDB::firTypeFixed*>(original_type);
      fs_assert(f_target_type->valid_binary());
      fs_assert(f_original_type->valid_binary());
      int binary = f_target_type->binary_point();
      exp = alignFixedBinary(exp, f_original_type, binary);
    } else if (target_type->isIntervalType()) {
      firDB::firTypeInterval* i_target_type = dynamic_cast<firDB::firTypeInterval*>(target_type);
      firDB::firTypeInterval* i_original_type = dynamic_cast<firDB::firTypeInterval*>(original_type);
      fs_assert(i_target_type->trimInterval());
      int binary = i_target_type->binary();
      exp = alignIntervalBinary(exp, i_original_type, binary);
    }
    return true;
  }
  bool TransferPost::alignBinaryToMaxBPType(firDB::firExp*& exp1, firDB::firExp*& exp2, firDB::firType* type1, firDB::firType* type2) {
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    if (type1->isFixedType()) {
      firDB::firTypeFixed* f_type1 = dynamic_cast<firDB::firTypeFixed*>(type1);
      firDB::firTypeFixed* f_type2 = dynamic_cast<firDB::firTypeFixed*>(type2);
      fs_assert(f_type1->valid_binary());
      fs_assert(f_type2->valid_binary());
      int type1_binary = f_type1->binary_point();
      int type2_binary = f_type2->binary_point();
      if (type1_binary > type2_binary) {
        exp2 = alignFixedBinary(exp2, f_type2, type1_binary);
      } else if (type1_binary < type2_binary) {
        exp1 = alignFixedBinary(exp1, f_type1, type2_binary);
      }
    } else if (type1->isIntervalType()) {
      firDB::firTypeInterval* i_type1 = dynamic_cast<firDB::firTypeInterval*>(type1);
      firDB::firTypeInterval* i_type2 = dynamic_cast<firDB::firTypeInterval*>(type2);
      bool trim_type1 = i_type1->trimInterval();
      bool trim_type2 = i_type2->trimInterval();
      fs_assert(trim_type1 && trim_type2);
      int type1_binary = i_type1->binary();
      int type2_binary = i_type2->binary();
      if (type1_binary > type2_binary) {
        exp2 = alignIntervalBinary(exp2, i_type2, type1_binary);
      } else if (type1_binary < type2_binary) {
        exp1 = alignIntervalBinary(exp1, i_type1, type2_binary);
      }
    }
    return true;
  }
  bool TransferPost::alignMuxInputBinary(firDB::firExpMux*& exp, firDB::firType* tval_type, firDB::firType* fval_type) {
    fs_assert(tval_type != NULL);
    fs_assert(fval_type != NULL);
    firDB::firExp* new_input1 = exp->input1();
    firDB::firExp* new_input2 = exp->input2();
    fs_assert(tval_type->isCompatible(fval_type));
    if (tval_type->isFixedType()) {
      firDB::firTypeFixed* tval_ftype = dynamic_cast<firDB::firTypeFixed*>(tval_type);
      firDB::firTypeFixed* fval_ftype = dynamic_cast<firDB::firTypeFixed*>(fval_type);
      fs_assert(tval_ftype->valid_binary());
      fs_assert(fval_ftype->valid_binary());
      int tval_binary = tval_ftype->binary_point();
      int fval_binary = fval_ftype->binary_point();
      if (tval_binary > fval_binary) {
        new_input2 = alignFixedBinary(new_input2, fval_ftype, tval_binary);
        exp->set_input2(new_input2);
      } else if (tval_binary < fval_binary) {
        new_input1 = alignFixedBinary(new_input1, tval_ftype, fval_binary);
        exp->set_input1(new_input1);
      }
    } else if (tval_type->isIntervalType()) {
      firDB::firTypeInterval* tval_itype = dynamic_cast<firDB::firTypeInterval*>(tval_type);
      firDB::firTypeInterval* fval_itype = dynamic_cast<firDB::firTypeInterval*>(fval_type);
      bool trim_typet = tval_itype->trimInterval();
      bool trim_typef = fval_itype->trimInterval();
      fs_assert(trim_typet && trim_typef);
      int tval_binary = tval_itype->binary();
      int fval_binary = fval_itype->binary();
      if (tval_binary > fval_binary) {
        new_input2 = alignIntervalBinary(new_input2, fval_itype, tval_binary);
        exp->set_input2(new_input2);
      } else if (tval_binary < fval_binary) {
        new_input1 = alignIntervalBinary(new_input1, tval_itype, fval_binary);
        exp->set_input1(new_input1);
      }
    }
    return true;
  }
  firDB::firExp* TransferPost::alignFixedBinary(firDB::firExp* exp, firDB::firTypeFixed* type, int binary) {
    firDB::firExp* rexp = exp;
    if (!type->valid_width() || !type->valid_binary()) {
      fs_assert(0);
      return NULL;
    }
    int exp_binary = type->binary_point();
    if (binary < exp_binary) {
      int point = exp_binary - binary;
      firDB::firExp* new_input_exp = exp;
      if (exp->isOperationExpression()) {
        firDB::firItemNode* op_node = post_module()->addItemNode(getAddNodeId(), exp);
        post_module()->addStatement(op_node);
        new_input_exp = post_module()->addExpRef(op_node->id());
      }
      firDB::firExpPrimOperation::firShr* shr = post_module()->addExpShr(new_input_exp, point);
      firDB::firItemNode* add_node = post_module()->addItemNode(getAddNodeId(), shr);
      post_module()->addStatement(add_node);
      rexp = post_module()->addExpRef(add_node->id());
    } else if (binary > exp_binary) {
      int point = binary - exp_binary;
      firDB::firExp* new_input_exp = exp;
      if (exp->isOperationExpression()) {
        firDB::firItemNode* op_node = post_module()->addItemNode(getAddNodeId(), exp);
        post_module()->addStatement(op_node);
        new_input_exp = post_module()->addExpRef(op_node->id());
      }
      firDB::firExpPrimOperation::firShl* shl = post_module()->addExpShl(new_input_exp, point);
      firDB::firItemNode* add_node = post_module()->addItemNode(getAddNodeId(), shl);
      post_module()->addStatement(add_node);
      rexp = post_module()->addExpRef(add_node->id());
    }
    return rexp;
  }
  firDB::firExp* TransferPost::alignIntervalBinary(firDB::firExp* exp, firDB::firTypeInterval* type, int binary) {
    firDB::firExp* rexp = exp;
    if (!type->valid_binary()) {
      fs_assert(0);
      return NULL;
    }
    int exp_binary = type->binary();
    if (binary < exp_binary) {
      int point = exp_binary - binary;
      firDB::firExp* new_input_exp = exp;
      if (exp->isOperationExpression()) {
        firDB::firItemNode* op_node = post_module()->addItemNode(getAddNodeId(), exp);
        post_module()->addStatement(op_node);
        new_input_exp = post_module()->addExpRef(op_node->id());
      }
      firDB::firExpPrimOperation::firShr* shr = post_module()->addExpShr(new_input_exp, point);
      firDB::firItemNode* add_node = post_module()->addItemNode(getAddNodeId(), shr);
      post_module()->addStatement(add_node);
      rexp = post_module()->addExpRef(add_node->id());
    } else if (binary > exp_binary) {
      int point = binary - exp_binary;
      firDB::firExp* new_input_exp = exp;
      if (exp->isOperationExpression()) {
        firDB::firItemNode* op_node = post_module()->addItemNode(getAddNodeId(), exp);
        post_module()->addStatement(op_node);
        new_input_exp = post_module()->addExpRef(op_node->id());
      }
      firDB::firExpPrimOperation::firShl* shl = post_module()->addExpShl(new_input_exp, point);
      firDB::firItemNode* add_node = post_module()->addItemNode(getAddNodeId(), shl);
      post_module()->addStatement(add_node);
      rexp = post_module()->addExpRef(add_node->id());
    }
    return rexp;
  }
  firDB::firExp* TransferPost::transferNestExpression(firDB::firExp* exp, bool add_node_flag) {
    firDB::firExp* rexp = NULL;
    switch (exp->type()) {
    case firDB::ExpressionType::kExpTypeUInt: {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      rexp = post_module()->copyExpression(exp);
      firDB::firExpUInt* uexp = dynamic_cast<firDB::firExpUInt*>(rexp);
      if (uexp->width() == 0) {
        unsigned int width = uexp->big_value()->getMinBinaryWidth();
        uexp->set_width(width);
      }
      break;
    }
    case firDB::ExpressionType::kExpTypeUIntBits: {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      rexp = post_module()->copyExpression(exp);
      firDB::firExpUIntBits* uint_bits = dynamic_cast<firDB::firExpUIntBits*>(rexp);
      if (uint_bits->width() == 0) {
        unsigned int width = uint_bits->big_value()->getMinBinaryWidth();
        uint_bits->set_width(width);
      }
      break;
    }
    case firDB::ExpressionType::kExpTypeSInt: {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      rexp = post_module()->copyExpression(exp);
      firDB::firExpSInt* sexp = dynamic_cast<firDB::firExpSInt*>(rexp);
      if (sexp->width() == 0) {
        unsigned int width = sexp->big_value()->getMinBinaryWidth();
        sexp->set_width(width);
      }
      break;
    }
    case firDB::ExpressionType::kExpTypeSIntBits: {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      rexp = post_module()->copyExpression(exp);
      firDB::firExpSIntBits* sint_bits = dynamic_cast<firDB::firExpSIntBits*>(rexp);
      if (sint_bits->width() == 0) {
        unsigned int width = sint_bits->big_value()->getMinBinaryWidth();
        sint_bits->set_width(width);
      }
      break;
    }
    case firDB::ExpressionType::kExpTypeRef:
    case firDB::ExpressionType::kExpTypeSubfield:
    case firDB::ExpressionType::kExpTypeSubindex:
    case firDB::ExpressionType::kExpTypeSubaccess: {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      firDB::firType* type = exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      fs_assert(type->isGroundType());
      if (isZeroWidthType(type)) {
        rexp = transferZeroWidthExp(type);
      } else {
        std::string refid;
        std::string tail_id = "";
        if (!transferIdExpression(refid, tail_id, exp)) {
          fs_assert(0);
          return NULL;
        }
        rexp = createNewExpById(refid);
        if (rexp->isReferenceExpression()) {
          firDB::firItem* reference_item = findItemExceptInstance(post_module(), rexp, cur_cond());
          fs_assert(reference_item != NULL);
          if (reference_item->isRegisterItem()) {
            firDB::firItemRegister* reg_item = dynamic_cast<firDB::firItemRegister*>(reference_item);
            fs_assert(reg_item);
            std::string q_id = reg_item->getPortQId();
            firDB::firExp* reg_exp = post_module()->addExpSubfield(rexp, q_id);
            rexp = reg_exp;
          }
        }
      }
      break;
    }
    case firDB::ExpressionType::kExpTypeMux: {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      firDB::firExpMux* mux = dynamic_cast<firDB::firExpMux*>(exp);
      std::string tail_id = "";
      firDB::firExp* post_mux = transferMux(tail_id, mux, NULL, add_node_flag);
      if (post_mux->isOperationExpression() && add_node_flag) {
        firDB::firItemNode* mux_node = post_module()->addItemNode(getAddNodeId(), post_mux);
        post_module()->addStatement(mux_node);
        rexp = post_module()->addExpRef(mux_node->id());
      } else {
        rexp = post_mux;
      }
      break;
    }
    case firDB::ExpressionType::kExpTypeValidif: {
      firDB::firExpValidif* validif = dynamic_cast<firDB::firExpValidif*>(exp);
      std::string tail_id = "";
      firDB::firExp* post_validif = transferValidif(tail_id, validif, add_node_flag);
      fs_assert(post_validif != NULL);
      if (add_node_flag) {
        firDB::firItemNode* validif_node = post_module()->addItemNode(getAddNodeId(), post_validif);
        post_module()->addStatement(validif_node);
        rexp = post_module()->addExpRef(validif_node->id());
      } else {
        rexp = post_validif;
      }
      break;
    }
    case firDB::ExpressionType::kExpTypePrimOperation: {
      rexp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(exp), true);
      break;
    }
    default: {
      fs_assert(0);
      break;
    }
    }
    return rexp;
  }
  firDB::firExp* TransferPost::transferPrimOperation(firDB::firExpPrimOperation* primOp, bool add_node_flag) {
    firDB::firExp* rexp = NULL;
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    if (TransferPost::opt.optimize_exp()) {
      firDB::firExp* exp_value = NULL;
      try {
        exp_value = primOp->inferExpVal(module, cur_cond());
      } catch (Exception &e) {
        fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", primOp->toString().c_str(), e.what());
        fs_assert(0);
      }
      if (exp_value != NULL) {
        rexp = transferNestExpression(exp_value, add_node_flag);
        return rexp;
      }
    }
    switch (primOp->operator_type()) {
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAdd: {
      firDB::firExpPrimOperation::firAdd* prim_add = dynamic_cast<firDB::firExpPrimOperation::firAdd*>(primOp);
      firDB::firExp* exp1 = prim_add->exp1();
      firDB::firExp* exp2 = prim_add->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAdd* radd = post_module()->addExpAdd(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* add_node = post_module()->addItemNode(getAddNodeId(), radd);
        post_module()->addStatement(add_node);
        rexp = post_module()->addExpRef(add_node->id());
      } else {
        rexp = radd;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSub: {
      firDB::firExpPrimOperation::firSub* prim_sub = dynamic_cast<firDB::firExpPrimOperation::firSub*>(primOp);
      firDB::firExp* exp1 = prim_sub->exp1();
      firDB::firExp* exp2 = prim_sub->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firSub* rsub = post_module()->addExpSub(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* sub_node = post_module()->addItemNode(getAddNodeId(), rsub);
        post_module()->addStatement(sub_node);
        rexp = post_module()->addExpRef(sub_node->id());
      } else {
        rexp = rsub;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeMul: {
      firDB::firExpPrimOperation::firMul* prim_mul = dynamic_cast<firDB::firExpPrimOperation::firMul*>(primOp);
      firDB::firExp* exp1 = prim_mul->exp1();
      firDB::firExp* exp2 = prim_mul->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firMul* mul = post_module()->addExpMul(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* mul_node = post_module()->addItemNode(getAddNodeId(), mul);
        post_module()->addStatement(mul_node);
        rexp = post_module()->addExpRef(mul_node->id());
      } else {
        rexp = mul;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDiv: {
      firDB::firExpPrimOperation::firDiv* prim_div = dynamic_cast<firDB::firExpPrimOperation::firDiv*>(primOp);
      firDB::firExp* num_exp = prim_div->num();
      firDB::firExp* den_exp = prim_div->den();
      firDB::firType* num_type = num_exp->getTypeData(module, cur_cond());
      firDB::firType* den_type = den_exp->getTypeData(module, cur_cond());
      fs_assert(num_type != NULL);
      fs_assert(den_type != NULL);
      if (!num_type->isCompatible(den_type)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* new_exp_num = NULL;
      firDB::firExp* new_exp_den = NULL;
      if (isZeroWidthType(num_type)) {
        new_exp_num = transferZeroWidthExp(num_type);
      } else {
        new_exp_num = transferNestExpression(num_exp, true);
      }
      if (isZeroWidthType(den_type)) {
        new_exp_den = transferZeroWidthExp(den_type);
      } else {
        new_exp_den = transferNestExpression(den_exp, true);
      }
      if (new_exp_num == NULL || new_exp_den == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firDiv* div = post_module()->addExpDiv(new_exp_num, new_exp_den);
      if (add_node_flag) {
        firDB::firItemNode* div_node = post_module()->addItemNode(getAddNodeId(), div);
        post_module()->addStatement(div_node);
        rexp = post_module()->addExpRef(div_node->id());
      } else {
        rexp = div;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeMod: {
      firDB::firExpPrimOperation::firMod* prim_mod = dynamic_cast<firDB::firExpPrimOperation::firMod*>(primOp);
      firDB::firExp* num_exp = prim_mod->num();
      firDB::firExp* den_exp = prim_mod->den();
      firDB::firType* num_type = num_exp->getTypeData(module, cur_cond());
      firDB::firType* den_type = den_exp->getTypeData(module, cur_cond());
      fs_assert(num_type != NULL);
      fs_assert(den_type != NULL);
      if (!num_type->isCompatible(den_type)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* new_exp_num = NULL;
      firDB::firExp* new_exp_den = NULL;
      if (isZeroWidthType(num_type)) {
        new_exp_num = transferZeroWidthExp(num_type);
      } else {
        new_exp_num = transferNestExpression(num_exp, true);
      }
      if (isZeroWidthType(den_type)) {
        new_exp_den = transferZeroWidthExp(den_type);
      } else {
        new_exp_den = transferNestExpression(den_exp, true);
      }
      if (new_exp_num == NULL || new_exp_den == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firMod* mod = post_module()->addExpMod(new_exp_num, new_exp_den);
      if (add_node_flag) {
        firDB::firItemNode* mod_node = post_module()->addItemNode(getAddNodeId(), mod);
        post_module()->addStatement(mod_node);
        rexp = post_module()->addExpRef(mod_node->id());
      } else {
        rexp = mod;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeLt: {
      firDB::firExpPrimOperation::firLt* prim_lt = dynamic_cast<firDB::firExpPrimOperation::firLt*>(primOp);
      firDB::firExp* exp1 = prim_lt->exp1();
      firDB::firExp* exp2 = prim_lt->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firLt* lt = post_module()->addExpLt(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* lt_node = post_module()->addItemNode(getAddNodeId(), lt);
        post_module()->addStatement(lt_node);
        rexp = post_module()->addExpRef(lt_node->id());
      } else {
        rexp = lt;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeLeq: {
      firDB::firExpPrimOperation::firLeq* prim_leq = dynamic_cast<firDB::firExpPrimOperation::firLeq*>(primOp);
      firDB::firExp* exp1 = prim_leq->exp1();
      firDB::firExp* exp2 = prim_leq->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firLeq* leq = post_module()->addExpLeq(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* leq_node = post_module()->addItemNode(getAddNodeId(), leq);
        post_module()->addStatement(leq_node);
        rexp = post_module()->addExpRef(leq_node->id());
      } else {
        rexp = leq;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeGt: {
      firDB::firExpPrimOperation::firGt* prim_gt = dynamic_cast<firDB::firExpPrimOperation::firGt*>(primOp);
      firDB::firExp* exp1 = prim_gt->exp1();
      firDB::firExp* exp2 = prim_gt->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firGt* gt = post_module()->addExpGt(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* gt_node = post_module()->addItemNode(getAddNodeId(), gt);
        post_module()->addStatement(gt_node);
        rexp = post_module()->addExpRef(gt_node->id());
      } else {
        rexp = gt;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeGeq: {
      firDB::firExpPrimOperation::firGeq* prim_geq = dynamic_cast<firDB::firExpPrimOperation::firGeq*>(primOp);
      firDB::firExp* exp1 = prim_geq->exp1();
      firDB::firExp* exp2 = prim_geq->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firGeq* geq = post_module()->addExpGeq(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* geq_node = post_module()->addItemNode(getAddNodeId(), geq);
        post_module()->addStatement(geq_node);
        rexp = post_module()->addExpRef(geq_node->id());
      } else {
        rexp = geq;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeEq: {
      firDB::firExpPrimOperation::firEq* prim_eq = dynamic_cast<firDB::firExpPrimOperation::firEq*>(primOp);
      firDB::firExp* exp1 = prim_eq->exp1();
      firDB::firExp* exp2 = prim_eq->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firEq* eq = post_module()->addExpEq(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* eq_node = post_module()->addItemNode(getAddNodeId(), eq);
        post_module()->addStatement(eq_node);
        rexp = post_module()->addExpRef(eq_node->id());
      } else {
        rexp = eq;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNeq: {
      firDB::firExpPrimOperation::firNeq* prim_neq = dynamic_cast<firDB::firExpPrimOperation::firNeq*>(primOp);
      firDB::firExp* exp1 = prim_neq->exp1();
      firDB::firExp* exp2 = prim_neq->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      if (!type1->isCompatible(type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (!alignBinaryToMaxBPType(newexp1, newexp2, type1, type2)) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firNeq* neq = post_module()->addExpNeq(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* neq_node = post_module()->addItemNode(getAddNodeId(), neq);
        post_module()->addStatement(neq_node);
        rexp = post_module()->addExpRef(neq_node->id());
      } else {
        rexp = neq;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypePad: {
      firDB::firExpPrimOperation::firPad* prim_pad = dynamic_cast<firDB::firExpPrimOperation::firPad*>(primOp);
      firDB::firExp* pad_exp = prim_pad->exp();
      firDB::firType* type = pad_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* new_pad_exp = NULL;
      if (isZeroWidthType(type)) {
        new_pad_exp = transferZeroWidthExp(type);
      } else {
        new_pad_exp = transferNestExpression(pad_exp, true);
      }
      if (new_pad_exp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firPad* pad = post_module()->addExpPad(new_pad_exp, prim_pad->n());
      if (add_node_flag) {
        firDB::firItemNode* pad_node = post_module()->addItemNode(getAddNodeId(), pad);
        post_module()->addStatement(pad_node);
        rexp = post_module()->addExpRef(pad_node->id());
      } else {
        rexp = pad;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsUInt: {
      firDB::firExp* asuint_exp = dynamic_cast<firDB::firExpPrimOperation::firAsUInt*>(primOp)->exp();
      firDB::firType* type = asuint_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(asuint_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAsUInt* asuint = post_module()->addExpAsUInt(newexp);
      if (add_node_flag) {
        firDB::firItemNode* asuint_node = post_module()->addItemNode(getAddNodeId(), asuint);
        post_module()->addStatement(asuint_node);
        rexp = post_module()->addExpRef(asuint_node->id());
      } else {
        rexp = asuint;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsSInt: {
      firDB::firExp* assint_exp = dynamic_cast<firDB::firExpPrimOperation::firAsSInt*>(primOp)->exp();
      firDB::firType* type = assint_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(assint_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAsSInt* assint = post_module()->addExpAsSInt(newexp);
      if (add_node_flag) {
        firDB::firItemNode* assint_node = post_module()->addItemNode(getAddNodeId(), assint);
        post_module()->addStatement(assint_node);
        rexp = post_module()->addExpRef(assint_node->id());
      } else {
        rexp = assint;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsClock: {
      firDB::firExp* asclock_exp = dynamic_cast<firDB::firExpPrimOperation::firAsClock*>(primOp)->exp();
      firDB::firType* type = asclock_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(asclock_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAsClock* asclock = post_module()->addExpAsClock(newexp);
      if (add_node_flag) {
        firDB::firItemNode* asclock_node = post_module()->addItemNode(getAddNodeId(), asclock);
        post_module()->addStatement(asclock_node);
        rexp = post_module()->addExpRef(asclock_node->id());
      } else {
        rexp = asclock;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsAsyncReset: {
      firDB::firExp* asreset_exp = dynamic_cast<firDB::firExpPrimOperation::firAsAsyncReset*>(primOp)->exp();
      firDB::firType* type = asreset_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(asreset_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAsAsyncReset* asreset = post_module()->addExpAsAsyncReset(newexp);
      if (add_node_flag) {
        firDB::firItemNode* asreset_node = post_module()->addItemNode(getAddNodeId(), asreset);
        post_module()->addStatement(asreset_node);
        rexp = post_module()->addExpRef(asreset_node->id());
      } else {
        rexp = asreset;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsFixed: {
      firDB::firExp* asfixed_exp = dynamic_cast<firDB::firExpPrimOperation::firAsFixed*>(primOp)->exp();
      firDB::firType* type = asfixed_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(asfixed_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAsSInt* asfixed = post_module()->addExpAsSInt(newexp);
      if (add_node_flag) {
        firDB::firItemNode* asfixed_node = post_module()->addItemNode(getAddNodeId(), asfixed);
        post_module()->addStatement(asfixed_node);
        rexp = post_module()->addExpRef(asfixed_node->id());
      } else {
        rexp = asfixed;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsInterval: {
      firDB::firExp* asinterval_exp = dynamic_cast<firDB::firExpPrimOperation::firAsInterval*>(primOp)->exp();
      firDB::firType* type = asinterval_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(asinterval_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAsSInt* asinterval = post_module()->addExpAsSInt(newexp);
      if (add_node_flag) {
        firDB::firItemNode* asinterval_node = post_module()->addItemNode(getAddNodeId(), asinterval);
        post_module()->addStatement(asinterval_node);
        rexp = post_module()->addExpRef(asinterval_node->id());
      } else {
        rexp = asinterval;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeShl: {
      firDB::firExpPrimOperation::firShl* shl = dynamic_cast<firDB::firExpPrimOperation::firShl*>(primOp);
      firDB::firExp* shl_exp = shl->exp();
      firDB::firType* type = shl_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(shl_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firShl* post_shl = post_module()->addExpShl(newexp, shl->n());
      if (add_node_flag) {
        firDB::firItemNode* shl_node = post_module()->addItemNode(getAddNodeId(), post_shl);
        post_module()->addStatement(shl_node);
        rexp = post_module()->addExpRef(shl_node->id());
      } else {
        rexp = post_shl;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeShr: {
      firDB::firExpPrimOperation::firShr* shr = dynamic_cast<firDB::firExpPrimOperation::firShr*>(primOp);
      firDB::firExp* shr_exp = shr->exp();
      firDB::firType* type = shr_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(shr_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firShr* post_shr = post_module()->addExpShr(newexp, shr->n());
      if (add_node_flag) {
        firDB::firItemNode* shr_node = post_module()->addItemNode(getAddNodeId(), post_shr);
        post_module()->addStatement(shr_node);
        rexp = post_module()->addExpRef(shr_node->id());
      } else {
        rexp = post_shr;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDshl: {
      firDB::firExpPrimOperation::firDshl* prim_dshl = dynamic_cast<firDB::firExpPrimOperation::firDshl*>(primOp);
      firDB::firExp* exp1 = prim_dshl->exp1();
      firDB::firExp* exp2 = prim_dshl->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firDshl* dshl = post_module()->addExpDshl(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* dshl_node = post_module()->addItemNode(getAddNodeId(), dshl);
        post_module()->addStatement(dshl_node);
        rexp = post_module()->addExpRef(dshl_node->id());
      } else {
        rexp = dshl;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDshr: {
      firDB::firExpPrimOperation::firDshr* prim_dshr = dynamic_cast<firDB::firExpPrimOperation::firDshr*>(primOp);
      firDB::firExp* exp1 = prim_dshr->exp1();
      firDB::firExp* exp2 = prim_dshr->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firDshr* dshr = post_module()->addExpDshr(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* dshr_node = post_module()->addItemNode(getAddNodeId(), dshr);
        post_module()->addStatement(dshr_node);
        rexp = post_module()->addExpRef(dshr_node->id());
      } else {
        rexp = dshr;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeCvt: {
      firDB::firExp* cvt_exp = dynamic_cast<firDB::firExpPrimOperation::firCvt*>(primOp)->exp();
      firDB::firType* type = cvt_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(cvt_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firCvt* cvt = post_module()->addExpCvt(newexp);
      if (add_node_flag) {
        firDB::firItemNode* cvt_node = post_module()->addItemNode(getAddNodeId(), cvt);
        post_module()->addStatement(cvt_node);
        rexp = post_module()->addExpRef(cvt_node->id());
      } else {
        rexp = cvt;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNeg: {
      firDB::firExp* neg_exp = dynamic_cast<firDB::firExpPrimOperation::firNeg*>(primOp)->exp();
      firDB::firType* type = neg_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(neg_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firNeg* neg = post_module()->addExpNeg(newexp);
      if (add_node_flag) {
        firDB::firItemNode* neg_node = post_module()->addItemNode(getAddNodeId(), neg);
        post_module()->addStatement(neg_node);
        rexp = post_module()->addExpRef(neg_node->id());
      } else {
        rexp = neg;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNot: {
      firDB::firExp* not_exp = dynamic_cast<firDB::firExpPrimOperation::firNot*>(primOp)->exp();
      firDB::firType* type = not_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      if (isZeroWidthType(type)) {
        if (type->isUIntType()) {
          rexp = post_module()->addExpUIntBits("h0", 1);
        } else if (type->isSIntType()) {
          rexp = post_module()->addExpSIntBits("h0", 1);
        }
      } else {
        firDB::firExp* newexp = transferNestExpression(not_exp, true);
        if (newexp == NULL) {
          fs_assert(0);
          return NULL;
        }
        firDB::firExpPrimOperation::firNot* prim_not = post_module()->addExpNot(newexp);
        if (add_node_flag) {
          firDB::firItemNode* not_node = post_module()->addItemNode(getAddNodeId(), prim_not);
          post_module()->addStatement(not_node);
          rexp = post_module()->addExpRef(not_node->id());
        } else {
          rexp = prim_not;
        }
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAnd: {
      firDB::firExpPrimOperation::firAnd* prim_and = dynamic_cast<firDB::firExpPrimOperation::firAnd*>(primOp);
      firDB::firExp* exp1 = prim_and->exp1();
      firDB::firExp* exp2 = prim_and->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAnd* add_and = post_module()->addExpAnd(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* and_node = post_module()->addItemNode(getAddNodeId(), add_and);
        post_module()->addStatement(and_node);
        rexp = post_module()->addExpRef(and_node->id());
      } else {
        rexp = add_and;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeOr: {
      firDB::firExpPrimOperation::firOr* prim_or = dynamic_cast<firDB::firExpPrimOperation::firOr*>(primOp);
      firDB::firExp* exp1 = prim_or->exp1();
      firDB::firExp* exp2 = prim_or->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firOr* add_or = post_module()->addExpOr(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* or_node = post_module()->addItemNode(getAddNodeId(), add_or);
        post_module()->addStatement(or_node);
        rexp = post_module()->addExpRef(or_node->id());
      } else {
        rexp = add_or;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeXor: {
      firDB::firExpPrimOperation::firXor* prim_xor = dynamic_cast<firDB::firExpPrimOperation::firXor*>(primOp);
      firDB::firExp* exp1 = prim_xor->exp1();
      firDB::firExp* exp2 = prim_xor->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      firDB::firExp* newexp1 = NULL;
      firDB::firExp* newexp2 = NULL;
      if (isZeroWidthType(type1)) {
        newexp1 = transferZeroWidthExp(type1);
      } else {
        newexp1 = transferNestExpression(exp1, true);
      }
      if (isZeroWidthType(type2)) {
        newexp2 = transferZeroWidthExp(type2);
      } else {
        newexp2 = transferNestExpression(exp2, true);
      }
      if (newexp1 == NULL || newexp2 == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firXor* add_xor = post_module()->addExpXor(newexp1, newexp2);
      if (add_node_flag) {
        firDB::firItemNode* xor_node = post_module()->addItemNode(getAddNodeId(), add_xor);
        post_module()->addStatement(xor_node);
        rexp = post_module()->addExpRef(xor_node->id());
      } else {
        rexp = add_xor;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAndr: {
      firDB::firExp* andr_exp = dynamic_cast<firDB::firExpPrimOperation::firAndr*>(primOp)->exp();
      firDB::firType* type = andr_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(andr_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firAndr* andr = post_module()->addExpAndr(newexp);
      if (add_node_flag) {
        firDB::firItemNode* andr_node = post_module()->addItemNode(getAddNodeId(), andr);
        post_module()->addStatement(andr_node);
        rexp = post_module()->addExpRef(andr_node->id());
      } else {
        rexp = andr;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeOrr: {
      firDB::firExp* orr_exp = dynamic_cast<firDB::firExpPrimOperation::firOrr*>(primOp)->exp();
      firDB::firType* type = orr_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(orr_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firOrr* orr = post_module()->addExpOrr(newexp);
      if (add_node_flag) {
        firDB::firItemNode* orr_node = post_module()->addItemNode(getAddNodeId(), orr);
        post_module()->addStatement(orr_node);
        rexp = post_module()->addExpRef(orr_node->id());
      } else {
        rexp = orr;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeXorr: {
      firDB::firExp* xorr_exp = dynamic_cast<firDB::firExpPrimOperation::firXorr*>(primOp)->exp();
      firDB::firType* type = xorr_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      firDB::firExp* newexp = NULL;
      if (isZeroWidthType(type)) {
        newexp = transferZeroWidthExp(type);
      } else {
        newexp = transferNestExpression(xorr_exp, true);
      }
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firXorr* prim_xorr = post_module()->addExpXorr(newexp);
      if (add_node_flag) {
        firDB::firItemNode* xorr_node = post_module()->addItemNode(getAddNodeId(), prim_xorr);
        post_module()->addStatement(xorr_node);
        rexp = post_module()->addExpRef(xorr_node->id());
      } else {
        rexp = prim_xorr;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeCat: {
      firDB::firExpPrimOperation::firCat* prim_cat = dynamic_cast<firDB::firExpPrimOperation::firCat*>(primOp);
      firDB::firExp* exp1 = prim_cat->exp1();
      firDB::firExp* exp2 = prim_cat->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      fs_assert(type2 != NULL);
      bool type1_is_zero = isZeroWidthType(type1);
      bool type2_is_zero = isZeroWidthType(type2);
      if (type1_is_zero && type2_is_zero) {
        rexp = post_module()->addExpUIntBits("h0", 1);
      } else if (type1_is_zero) {
        firDB::firExp* new_exp2 = transferNestExpression(exp2, true);
        firDB::firExpPrimOperation::firAsUInt* asuint = post_module()->addExpAsUInt(new_exp2);
        if (add_node_flag) {
          firDB::firItemNode* asuint_node = post_module()->addItemNode(getAddNodeId(), asuint);
          post_module()->addStatement(asuint_node);
          rexp = post_module()->addExpRef(asuint_node->id());
        } else {
          rexp = asuint;
        }
      } else if (type2_is_zero) {
        firDB::firExp* new_exp1 = transferNestExpression(exp1, true);
        firDB::firExpPrimOperation::firAsUInt* asuint = post_module()->addExpAsUInt(new_exp1);
        if (add_node_flag) {
          firDB::firItemNode* asuint_node = post_module()->addItemNode(getAddNodeId(), asuint);
          post_module()->addStatement(asuint_node);
          rexp = post_module()->addExpRef(asuint_node->id());
        } else {
          rexp = asuint;
        }
      } else {
        firDB::firExp* newexp1 = transferNestExpression(exp1, true);
        firDB::firExp* newexp2 = transferNestExpression(exp2, true);
        firDB::firExpPrimOperation::firCat* add_cat = post_module()->addExpCat(newexp1, newexp2);
        if (add_node_flag) {
          firDB::firItemNode* cat_node = post_module()->addItemNode(getAddNodeId(), add_cat);
          post_module()->addStatement(cat_node);
          rexp = post_module()->addExpRef(cat_node->id());
        } else {
          rexp = add_cat;
        }
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeBits: {
      firDB::firExpPrimOperation::firBits* prim_bits = dynamic_cast<firDB::firExpPrimOperation::firBits*>(primOp);
      firDB::firExp* bits_exp = prim_bits->exp();
      firDB::firType* type = bits_exp->getTypeData(module, cur_cond());
      unsigned int hi = prim_bits->hi();
      unsigned int lo = prim_bits->lo();
      fs_assert(type != NULL);
      if (isZeroWidthType(type)) {
        fs_error("*ERROR*: High bit %d in bits operator is larger than input width 0 in '%s'.\n", hi, prim_bits->toString().c_str());
        fs_assert(0);
        return NULL;
      }
      firDB::firExp* newexp = transferNestExpression(bits_exp, true);
      firDB::firExpPrimOperation::firBits* add_bits = post_module()->addExpBits(newexp, hi, lo);
      if (add_node_flag) {
        firDB::firItemNode* bits_node = post_module()->addItemNode(getAddNodeId(), add_bits);
        post_module()->addStatement(bits_node);
        rexp = post_module()->addExpRef(bits_node->id());
      } else {
        rexp = add_bits;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeHead: {
      firDB::firExpPrimOperation::firHead* prim_head = dynamic_cast<firDB::firExpPrimOperation::firHead*>(primOp);
      firDB::firExp* head_exp = prim_head->exp();
      unsigned int head_n = prim_head->n();
      firDB::firType* type = head_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      if (isZeroWidthType(type)) {
        if (head_n > 0) {
          fs_error("*ERROR*: Parameter %d in head operator is larger than input width 0.\n", head_n);
          fs_assert(0);
          return NULL;
        } else {
          rexp = post_module()->addExpUIntBits("h0", 1);
        }
      } else {
        firDB::firExp* newexp = transferNestExpression(head_exp, true);
        if (newexp == NULL) {
          fs_assert(0);
          return NULL;
        }
        firDB::firExpPrimOperation::firHead* add_head = post_module()->addExpHead(newexp, head_n);
        if (add_node_flag) {
          firDB::firItemNode* head_node = post_module()->addItemNode(getAddNodeId(), add_head);
          post_module()->addStatement(head_node);
          rexp = post_module()->addExpRef(head_node->id());
        } else {
          rexp = add_head;
        }
      }     
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeTail: {
      firDB::firExpPrimOperation::firTail* prim_tail = dynamic_cast<firDB::firExpPrimOperation::firTail*>(primOp);
      firDB::firExp* tail_exp = prim_tail->exp();
      unsigned int tail_n = prim_tail->n();
      firDB::firType* type = tail_exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      if (isZeroWidthType(type)) {
        throw Exception("The zero width expression '" +
          tail_exp->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      firDB::firExp* newexp = transferNestExpression(tail_exp, true);
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      firDB::firExpPrimOperation::firTail* add_tail = post_module()->addExpTail(newexp, tail_n);
      if (add_node_flag) {
        firDB::firItemNode* tail_node = post_module()->addItemNode(getAddNodeId(), add_tail);
        post_module()->addStatement(tail_node);
        rexp = post_module()->addExpRef(tail_node->id());
      } else {
        rexp = add_tail;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeIncp: {
      firDB::firExpPrimOperation::firIncp* prim_incp = dynamic_cast<firDB::firExpPrimOperation::firIncp*>(primOp);
      firDB::firExp* exp = prim_incp->exp();
      firDB::firType* type = exp->getTypeData(module, cur_cond());
      if (type == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (isZeroWidthType(type)) {
        throw Exception("The zero width expression '" +
          exp->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      unsigned int n = prim_incp->n();
      firDB::firExp* newexp = transferNestExpression(exp, true);
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (type->isFixedType() || type->isIntervalType()) {
        firDB::firExpPrimOperation::firShl* add_incp = post_module()->addExpShl(newexp, n);
        if (add_node_flag) {
          firDB::firItemNode* incp_node = post_module()->addItemNode(getAddNodeId(), add_incp);
          post_module()->addStatement(incp_node);
          rexp = post_module()->addExpRef(incp_node->id());
        } else {
          rexp = add_incp;
        }
      } else {
        fs_assert(0);
        return NULL;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDecp: {
      firDB::firExpPrimOperation::firDecp* prim_decp = dynamic_cast<firDB::firExpPrimOperation::firDecp*>(primOp);
      firDB::firExp* exp = prim_decp->exp();
      firDB::firType* type = exp->getTypeData(module, cur_cond());
      if (type == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (isZeroWidthType(type)) {
        throw Exception("The zero width expression '" +
          exp->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      unsigned int n = prim_decp->n();
      firDB::firExp* newexp = transferNestExpression(exp, true);
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (type->isFixedType() || type->isIntervalType()) {
        firDB::firExpPrimOperation::firShr* add_decp = post_module()->addExpShr(newexp, n);
        if (add_node_flag) {
          firDB::firItemNode* decp_node = post_module()->addItemNode(getAddNodeId(), add_decp);
          post_module()->addStatement(decp_node);
          rexp = post_module()->addExpRef(decp_node->id());
        } else {
          rexp = add_decp;
        }
      } else {
        fs_assert(0);
        return NULL;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSetp: {
      firDB::firExpPrimOperation::firSetp* prim_setp = dynamic_cast<firDB::firExpPrimOperation::firSetp*>(primOp);
      firDB::firExp* exp = prim_setp->exp();
      unsigned int n = prim_setp->n();
      firDB::firType* type = exp->getTypeData(module, cur_cond());
      if (type == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (isZeroWidthType(type)) {
        throw Exception("The zero width expression '" +
          exp->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      firDB::firExp* newexp = transferNestExpression(exp, true);
      if (newexp == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (type->isFixedType()) {
        firDB::firTypeFixed* ftype = dynamic_cast<firDB::firTypeFixed*>(type);
        int current_bp = ftype->binary_point();
        if (static_cast<int>(n) > current_bp) {
          firDB::firExpPrimOperation::firShl* post_setp = post_module()->addExpShl(newexp, (n - current_bp));
          if (add_node_flag) {
            firDB::firItemNode* setp_node = post_module()->addItemNode(getAddNodeId(), post_setp);
            post_module()->addStatement(setp_node);
            rexp = post_module()->addExpRef(setp_node->id());
          } else {
            rexp = post_setp;
          }
        } else if (static_cast<int>(n) < current_bp) {
          firDB::firExpPrimOperation::firShr* post_setp = post_module()->addExpShr(newexp, (current_bp - n));
          if (add_node_flag) {
            firDB::firItemNode* setp_node = post_module()->addItemNode(getAddNodeId(), post_setp);
            post_module()->addStatement(setp_node);
            rexp = post_module()->addExpRef(setp_node->id());
          } else {
            rexp = post_setp;
          }
        } else {
          if (add_node_flag) {
            firDB::firItemNode* setp_node = post_module()->addItemNode(getAddNodeId(), newexp);
            post_module()->addStatement(setp_node);
            rexp = post_module()->addExpRef(setp_node->id());
          } else {
            rexp = newexp;
          }
        }
      } else if (type->isIntervalType()) {
        int current_bp = dynamic_cast<firDB::firTypeInterval*>(type)->binary();
        if (static_cast<int>(n) > current_bp) {
          firDB::firExpPrimOperation::firShl* post_setp = post_module()->addExpShl(newexp, (n - current_bp));
          if (add_node_flag) {
            firDB::firItemNode* setp_node = post_module()->addItemNode(getAddNodeId(), post_setp);
            post_module()->addStatement(setp_node);
            rexp = post_module()->addExpRef(setp_node->id());
          } else {
            rexp = post_setp;
          }
        } else if (static_cast<int>(n) < current_bp) {
          firDB::firExpPrimOperation::firShr* post_setp = post_module()->addExpShr(newexp, (current_bp - n));
          if (add_node_flag) {
            firDB::firItemNode* setp_node = post_module()->addItemNode(getAddNodeId(), post_setp);
            post_module()->addStatement(setp_node);
            rexp = post_module()->addExpRef(setp_node->id());
          } else {
            rexp = post_setp;
          }
        } else {
          if (add_node_flag) {
            firDB::firItemNode* setp_node = post_module()->addItemNode(getAddNodeId(), newexp);
            post_module()->addStatement(setp_node);
            rexp = post_module()->addExpRef(setp_node->id());
          } else {
            rexp = newexp;
          }
        }
      } else {
        fs_assert(0);
        return NULL;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeWrap: {
      firDB::firExpPrimOperation::firWrap* prim_wrap = dynamic_cast<firDB::firExpPrimOperation::firWrap*>(primOp);
      firDB::firExp* exp1 = prim_wrap->exp1();
      firDB::firExp* exp2 = prim_wrap->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type2 != NULL);
      if (isZeroWidthType(type1)) {
        throw Exception("The zero width expression '" +
          exp1->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      if (isZeroWidthType(type2)) {
        throw Exception("The zero width expression '" +
          exp2->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      firDB::firExp* newexp1 = transferNestExpression(exp1, true);
      if (newexp1 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (type1->isIntervalType() && type2->isIntervalType()) {
        firDB::firTypeInterval* itype1 = dynamic_cast<firDB::firTypeInterval*>(type1);
        firDB::firTypeInterval* itype2 = dynamic_cast<firDB::firTypeInterval*>(type2);
        int wraplo = static_cast<int>(itype1->lower_value() * pow(2, itype2->binary()));
        int wraphi = static_cast<int>(itype1->upper_value() * pow(2, itype2->binary()));
        int inlo = static_cast<int>(itype2->lower_value() * pow(2, itype1->binary()));
        int inhi = static_cast<int>(itype2->upper_value() * pow(2, itype1->binary()));
        int range = wraplo - wraphi;
        BigInt range_binary_form(range);
        firDB::firExpSInt* s_range = post_module()->addExpSInt(range, range_binary_form.getMinBinaryWidth());
        firDB::firExpPrimOperation::firAdd* ltopt = post_module()->addExpAdd(newexp1, s_range);
        firDB::firExpPrimOperation::firSub* gtopt = post_module()->addExpSub(newexp1, s_range);
        if (wraphi >= inhi && wraplo <= inlo) {
          if (add_node_flag) {
            firDB::firItemNode* wrap_node = post_module()->addItemNode(getAddNodeId(), newexp1);
            post_module()->addStatement(wrap_node);
            rexp = post_module()->addExpRef(wrap_node->id());
          } else {
            rexp = newexp1;
          }
        } else if (wraphi >= inhi && (inlo + range + 1) >= wraplo) {
          BigInt wraplo_binary_form(wraplo);
          firDB::firExpSInt* s_wraplo = post_module()->addExpSInt(wraplo, wraplo_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firLt* lt = post_module()->addExpLt(newexp1, s_wraplo);
          firDB::firItemNode* node_lt = post_module()->addItemNode(getAddNodeId(), lt);
          post_module()->addStatement(node_lt);
          firDB::firExpRef* lt_ref = post_module()->addExpRef(node_lt->id());
          firDB::firItemNode* node_ltopt = post_module()->addItemNode(getAddNodeId(), ltopt);
          post_module()->addStatement(node_ltopt);
          firDB::firExpRef* ltopt_ref = post_module()->addExpRef(node_ltopt->id());
          firDB::firExpMux* post_wrap = post_module()->addExpMux(lt_ref, ltopt_ref, newexp1);
          if (add_node_flag) {
            firDB::firItemNode* wrap_node = post_module()->addItemNode(getAddNodeId(), post_wrap);
            post_module()->addStatement(wrap_node);
            rexp = post_module()->addExpRef(wrap_node->id());
          } else {
            rexp = post_wrap;
          }
        } else if ((inhi - range - 1) <= wraphi && wraplo <= inlo) {
          BigInt wraphi_binary_form(wraphi);
          firDB::firExpSInt* s_wraphi = post_module()->addExpSInt(wraphi, wraphi_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firGt* gt = post_module()->addExpGt(newexp1, s_wraphi);
          firDB::firItemNode* gt_node = post_module()->addItemNode(getAddNodeId(), gt);
          post_module()->addStatement(gt_node);
          firDB::firExpRef* gt_ref = post_module()->addExpRef(gt_node->id());
          firDB::firItemNode* gtopt_node = post_module()->addItemNode(getAddNodeId(), gtopt);
          post_module()->addStatement(gtopt_node);
          firDB::firExpRef* gtopt_ref = post_module()->addExpRef(gtopt_node->id());
          firDB::firExpMux* post_wrap = post_module()->addExpMux(gt_ref, gtopt_ref, newexp1);
          if (add_node_flag) {
            firDB::firItemNode* wrap_node = post_module()->addItemNode(getAddNodeId(), post_wrap);
            post_module()->addStatement(wrap_node);
            rexp = post_module()->addExpRef(wrap_node->id());
          } else {
            rexp = post_wrap;
          }
        } else if ((inhi - range - 1) <= wraphi && (inlo + range + 1) >= wraplo) {
          BigInt wraphi_binary_form(wraphi);
          BigInt wraplo_binary_form(wraplo);
          firDB::firExpSInt* s_wrapHi = post_module()->addExpSInt(wraphi, wraphi_binary_form.getMinBinaryWidth());
          firDB::firExpSInt* s_wrapLo = post_module()->addExpSInt(wraplo, wraplo_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firGt* gt = post_module()->addExpGt(newexp1, s_wrapHi);
          firDB::firExpPrimOperation::firLt* lt = post_module()->addExpLt(newexp1, s_wrapLo);
          firDB::firItemNode* lt_node = post_module()->addItemNode(getAddNodeId(), lt);
          post_module()->addStatement(lt_node);
          firDB::firExpRef* lt_ref = post_module()->addExpRef(lt_node->id());
          firDB::firItemNode* gt_node = post_module()->addItemNode(getAddNodeId(), gt);
          post_module()->addStatement(gt_node);
          firDB::firExpRef* gt_ref = post_module()->addExpRef(gt_node->id());
          firDB::firItemNode* gtopt_node = post_module()->addItemNode(getAddNodeId(), gtopt);
          post_module()->addStatement(gtopt_node);
          firDB::firExpRef* gtopt_ref = post_module()->addExpRef(gtopt_node->id());
          firDB::firItemNode* ltopt_node = post_module()->addItemNode(getAddNodeId(), ltopt);
          post_module()->addStatement(ltopt_node);
          firDB::firExpRef* ltopt_ref = post_module()->addExpRef(ltopt_node->id());
          firDB::firExpMux* post_wrap_input2 = post_module()->addExpMux(lt_ref, ltopt_ref, newexp1);
          firDB::firItemNode* input2_node = post_module()->addItemNode(getAddNodeId(), post_wrap_input2);
          post_module()->addStatement(input2_node);
          firDB::firExpRef* input2_ref = post_module()->addExpRef(input2_node->id());
          firDB::firExpMux* post_wrap = post_module()->addExpMux(gt_ref, gtopt_ref, input2_ref);
          if (add_node_flag) {
            firDB::firItemNode* wrap_node = post_module()->addItemNode(getAddNodeId(), post_wrap);
            post_module()->addStatement(wrap_node);
            rexp = post_module()->addExpRef(wrap_node->id());
          } else {
            rexp = post_wrap;
          }
        } else {
          BigInt wraphi_binary_form(wraphi);
          BigInt wraplo_binary_form(wraplo);
          firDB::firExpSInt* s_wrapHi = post_module()->addExpSInt(wraphi, wraphi_binary_form.getMinBinaryWidth());
          firDB::firExpSInt* s_wrapLo = post_module()->addExpSInt(wraplo, wraplo_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firSub* sub_lo = post_module()->addExpSub(newexp1, s_wrapLo);
          firDB::firItemNode* node_sub_lo = post_module()->addItemNode(getAddNodeId(), sub_lo);
          post_module()->addStatement(node_sub_lo);
          firDB::firExpRef* sub_lo_ref = post_module()->addExpRef(node_sub_lo->id());
          firDB::firExpPrimOperation::firSub* sub_hi = post_module()->addExpSub(s_wrapHi, s_wrapLo);
          firDB::firItemNode* node_sub_hi = post_module()->addItemNode(getAddNodeId(), sub_hi);
          post_module()->addStatement(node_sub_hi);
          firDB::firExpRef* sub_hi_ref = post_module()->addExpRef(node_sub_hi->id());
          firDB::firExpPrimOperation::firMod* mod = post_module()->addExpMod(sub_lo_ref, sub_hi_ref);
          firDB::firItemNode* mod_node = post_module()->addItemNode(getAddNodeId(), mod);
          post_module()->addStatement(mod_node);
          firDB::firExpRef* mod_ref = post_module()->addExpRef(mod_node->id());
          firDB::firExpPrimOperation::firAdd* add = post_module()->addExpAdd(mod_ref, s_wrapLo);
          fs_warning("*WARNING*: The wrap operation could not be performed on the two Interval inputs.\n");
          if (add_node_flag) {
            firDB::firItemNode* wrap_node = post_module()->addItemNode(getAddNodeId(), add);
            post_module()->addStatement(wrap_node);
            rexp = post_module()->addExpRef(wrap_node->id());
          } else {
            rexp = add;
          }
        }
      } else {
        fs_assert(0);
        return NULL;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeClip: {
      firDB::firExpPrimOperation::firClip* prim_clip = dynamic_cast<firDB::firExpPrimOperation::firClip*>(primOp);
      firDB::firExp* exp1 = prim_clip->exp1();
      firDB::firExp* exp2 = prim_clip->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type2 != NULL);
      if (isZeroWidthType(type1)) {
        throw Exception("The zero width expression '" +
          exp1->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      if (isZeroWidthType(type2)) {
        throw Exception("The zero width expression '" +
          exp2->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      firDB::firExp* newexp1 = transferNestExpression(exp1, true);
      if (newexp1 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (type1->isIntervalType() && type2->isIntervalType()) {
        firDB::firTypeInterval* itype1 = dynamic_cast<firDB::firTypeInterval*>(type1);
        firDB::firTypeInterval* itype2 = dynamic_cast<firDB::firTypeInterval*>(type2);
        int cliplo = static_cast<int>(itype1->lower_value() * pow(2, itype2->binary()));
        int cliphi = static_cast<int>(itype1->upper_value() * pow(2, itype2->binary()));
        int inlo = static_cast<int>(itype2->lower_value() * pow(2, itype2->binary()));
        int inhi = static_cast<int>(itype2->upper_value() * pow(2, itype2->binary()));
        bool gtopt = cliphi >= inhi;
        bool ltopt = cliplo <= inlo;
        if (gtopt && ltopt) {
          firDB::firItemNode* clip_node = post_module()->addItemNode(getAddNodeId(), newexp1);
          post_module()->addStatement(clip_node);
          rexp = post_module()->addExpRef(clip_node->id());
        } else if (gtopt && !ltopt) {
          BigInt cliplo_binary_form(cliplo);
          firDB::firExpSInt* s_cliplo = post_module()->addExpSInt(cliplo, cliplo_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firLt* lt = post_module()->addExpLt(newexp1, s_cliplo);
          firDB::firItemNode* node_lt = post_module()->addItemNode(getAddNodeId(), lt);
          post_module()->addStatement(node_lt);
          firDB::firExpRef* lt_ref = post_module()->addExpRef(node_lt->id());
          firDB::firExpMux* post_clip = post_module()->addExpMux(lt_ref, s_cliplo, newexp1);
          if (add_node_flag) {
            firDB::firItemNode* clip_node = post_module()->addItemNode(getAddNodeId(), post_clip);
            post_module()->addStatement(clip_node);
            rexp = post_module()->addExpRef(clip_node->id());
          } else {
            rexp = post_clip;
          }
        } else if (!gtopt && ltopt) {
          BigInt cliphi_binary_form(cliplo);
          firDB::firExpSInt* s_cliphi = post_module()->addExpSInt(cliphi, cliphi_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firGt* gt = post_module()->addExpGt(newexp1, s_cliphi);
          firDB::firItemNode* node_gt = post_module()->addItemNode(getAddNodeId(), gt);
          post_module()->addStatement(node_gt);
          firDB::firExpRef* gt_ref = post_module()->addExpRef(node_gt->id());
          rexp = post_module()->addExpMux(gt_ref, s_cliphi, newexp1);
        } else {
          BigInt cliplo_binary_form(cliplo);
          BigInt cliphi_binary_form(cliphi);
          firDB::firExpSInt* s_cliplo = post_module()->addExpSInt(cliplo, cliplo_binary_form.getMinBinaryWidth());
          firDB::firExpSInt* s_cliphi = post_module()->addExpSInt(cliphi, cliphi_binary_form.getMinBinaryWidth());
          firDB::firExpPrimOperation::firGt* gt = post_module()->addExpGt(newexp1, s_cliphi);
          firDB::firItemNode* node_gt = post_module()->addItemNode(getAddNodeId(), gt);
          post_module()->addStatement(node_gt);
          firDB::firExpRef* gt_ref = post_module()->addExpRef(node_gt->id());
          firDB::firExpPrimOperation::firLt* lt = post_module()->addExpLt(newexp1, s_cliplo);
          firDB::firItemNode* node_lt = post_module()->addItemNode(getAddNodeId(), lt);
          post_module()->addStatement(node_lt);
          firDB::firExpRef* lt_ref = post_module()->addExpRef(node_lt->id());
          firDB::firExpMux* post_clip_input2 = post_module()->addExpMux(lt_ref, s_cliplo, newexp1);
          firDB::firItemNode* input2_node = post_module()->addItemNode(getAddNodeId(), post_clip_input2);
          post_module()->addStatement(input2_node);
          firDB::firExpRef* input2_ref = post_module()->addExpRef(input2_node->id());
          firDB::firExpMux* post_clip = post_module()->addExpMux(gt_ref, s_cliphi, input2_ref);
          if (add_node_flag) {
            firDB::firItemNode* clip_node = post_module()->addItemNode(getAddNodeId(), post_clip);
            post_module()->addStatement(clip_node);
            rexp = post_module()->addExpRef(clip_node->id());
          } else {
            rexp = post_clip;
          }
        }
      } else {
        fs_error("*ERROR*: The types of the two inputs for the clip operation did not match. Both types should be Interval.\n");
        fs_assert(0);
        return NULL;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSquz: {
      firDB::firExpPrimOperation::firSquz* prim_squz = dynamic_cast<firDB::firExpPrimOperation::firSquz*>(primOp);
      firDB::firExp* exp1 = prim_squz->exp1();
      firDB::firExp* exp2 = prim_squz->exp2();
      firDB::firType* type1 = exp1->getTypeData(module, cur_cond());
      fs_assert(type1 != NULL);
      firDB::firType* type2 = exp2->getTypeData(module, cur_cond());
      fs_assert(type2 != NULL);
      if (isZeroWidthType(type1)) {
        throw Exception("The zero width expression '" +
          exp1->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      if (isZeroWidthType(type2)) {
        throw Exception("The zero width expression '" +
          exp2->toString() + "' was invalid, and cannot be used as the input of '" + primOp->toString() + "'.");
      }
      firDB::firExp* newexp1 = transferNestExpression(exp1, true);
      if (newexp1 == NULL) {
        fs_assert(0);
        return NULL;
      }
      if (type1->isIntervalType() && type2->isIntervalType()) {
        firDB::firTypeInterval* itype1 = dynamic_cast<firDB::firTypeInterval*>(type1);
        firDB::firTypeInterval* itype2 = dynamic_cast<firDB::firTypeInterval*>(type2);
        int width1 = 0;
        if (itype1->getWidth(width1)) {
          fs_assert(0);
          return NULL;
        }
        BigInt type1_binary_binary_form(itype1->binary());
        int point_width = 1 << type1_binary_binary_form.getMinBinaryWidth();
        double min2 = itype2->lower_value() * static_cast<double>(point_width);
        double max2 = itype2->upper_value() * static_cast<double>(point_width);
        int w1 = width1 + 1;
        double minopt2 = floor(min2);
        double maxopt2 = ceil(max2);
        BigInt minopt2_binary_form(static_cast<int>(minopt2));
        BigInt maxopt2_binary_form(static_cast<int>(maxopt2));
        int w2 = std::max(minopt2_binary_form.getMinBinaryWidth(), maxopt2_binary_form.getMinBinaryWidth());
        if (w1 < w2) {
          firDB::firItemNode* squz_node = post_module()->addItemNode(getAddNodeId(), newexp1);
          post_module()->addStatement(squz_node);
          rexp = post_module()->addExpRef(squz_node->id());
        } else {
          firDB::firExpPrimOperation::firBits* bits = post_module()->addExpBits(newexp1, (w2 - 1), 0);
          firDB::firItemNode* bits_node = post_module()->addItemNode(getAddNodeId(), bits);
          post_module()->addStatement(bits_node);
          firDB::firExpRef* bits_ref = post_module()->addExpRef(bits_node->id());
          firDB::firExpPrimOperation::firAsSInt* post_squz = post_module()->addExpAsSInt(bits_ref);
          if (add_node_flag) {
            firDB::firItemNode* squz_node = post_module()->addItemNode(getAddNodeId(), post_squz);
            post_module()->addStatement(squz_node);
            rexp = post_module()->addExpRef(squz_node->id());
          } else {
            rexp = post_squz;
          }
        }
      } else {
        fs_error("*ERROR*: The types of the two inputs for the squeeze operation did not match. Both types should be Interval.\n");
        fs_assert(0);
        return NULL;
      }
      break;
    }
    default: {
      fs_assert(0);
      return NULL;
    }
    }
    return rexp;
  }

  bool TransferPost::transferItemNodeToPost(firDB::firItemNode* item_node) {
    fs_assert(item_node != NULL);
    firDB::firExp* exp = item_node->exp();
    std::string node_id = item_node->id();
    if (!transferNodeByExpression(node_id, exp)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Node '%s' succeeded.\n", node_id.c_str());
    return true;
  }
  bool TransferPost::transferNodeByExpression(const std::string& node_id, firDB::firExp* exp) {
    fs_assert(exp != NULL);
    if (exp->isNumberExpression()) {
      if (!transferNodeByNumExpression(node_id, exp)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isIdExpression()) {
      if (!transferNodeByIdExpression(node_id, exp)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isMuxExpression()) {
      if (!transferNodeByMuxExpression(node_id, dynamic_cast<firDB::firExpMux*>(exp))) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isValidifExpression()) {
      if (!transferNodeByValidifExpression(node_id, dynamic_cast<firDB::firExpValidif*>(exp))) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isPrimOperationExpression()) {
      firDB::firExp* post_exp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(exp), false);
      firDB::firItemNode* node_item = post_module()->addItemNode(node_id, post_exp);
      post_module()->addStatement(node_item);
    }
    return true;
  }
  bool TransferPost::transferNodeByNumExpression(const std::string& node_id, firDB::firExp* exp) {
    fs_assert(exp != NULL);
    firDB::firType* type = exp->getTypeData(fir_module(), cur_cond());
    fs_assert(type != NULL);
    if (isZeroWidthType(type)) {
      fs_warning("*WARNING*: The width (0) of node expression '%s' was invalid.\n", exp->toString().c_str());
      return true;
    }
    firDB::firExp* post_exp = post_module()->copyExpression(exp);
    firDB::firItemNode* node_item = post_module()->addItemNode(node_id, post_exp);
    post_module()->addStatement(node_item);
    return true;
  }
  bool TransferPost::transferNodeByIdExpression(const std::string& node_id, firDB::firExp* exp) {
    fs_assert(exp != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* exp_value = NULL;
    if (TransferPost::opt.optimize_exp()) {
      exp_value = exp->inferExpVal(module, cur_cond());
    }
    if (exp_value != NULL) {
      fs_assert(exp_value->isNumberExpression());
      if (!transferNodeByExpression(node_id, exp_value)) {
        fs_assert(0);
        return false;
      }
    } else {
      firDB::firType* type = exp->getTypeData(module, cur_cond());
      fs_assert(type != NULL);
      std::string tail_id = "";
      if (!transferIdExpNodeByType(node_id, tail_id, exp, type)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferIdExpNodeByType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp, firDB::firType* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    if (type->isGroundType()) {
      if (isZeroWidthType(type)) {
        fs_warning("*WARNING*: The width (0) of node expression '%s' was invalid.\n", exp->toString().c_str());
        return true;
      }
      if (!transferIdExpNodeByGroundType(node_id, tail_id, exp)) {
        fs_assert(0);
        return false;
      }
    } else if (type->isVectorType()) {
      if (!transferIdExpNodeByVectorType(node_id, tail_id, exp, dynamic_cast<firDB::firTypeVector*>(type))) {
        fs_assert(0);
        return false;
      }
    } else if (type->isBundleType()) {
      if (!transferIdExpNodeByBundleType(node_id, tail_id, exp, dynamic_cast<firDB::firTypeBundle*>(type))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferIdExpNodeByGroundType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp) {
    fs_assert(exp != NULL);
    std::string exp_id;
    if (!transferIdExpression(exp_id, tail_id, exp)) {
      fs_assert(0);
      return false;
    }
    if (post_module()->findItemById(exp_id) == NULL) {
      fs_assert(0);
      return false;
    }
    firDB::firExp* post_exp = createNewExpById(exp_id);
    if (post_exp->isReferenceExpression()) {
      firDB::firItem* reference_item = findItemExceptInstance(post_module(), post_exp, cur_cond());
      fs_assert(reference_item != NULL);
      if (reference_item->isRegisterItem()) {
        firDB::firItemRegister* reg_item = dynamic_cast<firDB::firItemRegister*>(reference_item);
        fs_assert(reg_item);
        std::string q_id = reg_item->getPortQId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(post_exp, q_id);
        post_exp = reg_exp;
      }
    }
    firDB::firItemNode* node_item = post_module()->addItemNode(node_id, post_exp);
    post_module()->addStatement(node_item);
    return true;
  }
  bool TransferPost::transferIdExpNodeByVectorType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp, firDB::firTypeVector* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      std::string new_node_id = node_id + opt.hyphen() + std::to_string(i);
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      firDB::firType* type_data = type->type_data();
      if (!transferIdExpNodeByType(new_node_id, new_tail_id, exp, type_data)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferIdExpNodeByBundleType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp, firDB::firTypeBundle* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_node_id = node_id + opt.hyphen() + type_datas[i]->field_id();
      std::string new_tail_id = tail_id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferIdExpNodeByType(new_node_id, new_tail_id, exp, btype)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferNodeByMuxExpression(const std::string& node_id, firDB::firExpMux* exp) {
    fs_assert(exp != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firType* type = exp->getTypeData(module, cur_cond());
    fs_assert(type != NULL);
    std::string tail_id = "";
    if (!transferMuxNodeByType(node_id, tail_id, exp, type)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferMuxNodeByType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp, firDB::firType* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    if (type->isGroundType()) {
      if (isZeroWidthType(type)) {
        fs_warning("*WARNING*: The width (0) of node expression '%s' was invalid.\n", exp->toString().c_str());
        return true;
      }
      if (!transferMuxNodeByGroundType(node_id, tail_id, exp)) {
        fs_assert(0);
        return false;
      }
    } else if (type->isVectorType()) {
      if (!transferMuxNodeByVectorType(node_id, tail_id, exp, dynamic_cast<firDB::firTypeVector*>(type))) {
        fs_assert(0);
        return false;
      }
    } else if (type->isBundleType()) {
      if (!transferMuxNodeByBundleType(node_id, tail_id, exp, dynamic_cast<firDB::firTypeBundle*>(type))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferMuxNodeByGroundType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp) {
    fs_assert(exp != NULL);
    firDB::firExp* post_mux = transferMux(tail_id, exp, NULL);
    firDB::firItemNode* node = post_module()->addItemNode(node_id, post_mux);
    post_module()->addStatement(node);
    return true;
  }
  bool TransferPost::transferMuxNodeByVectorType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp, firDB::firTypeVector* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      firDB::firType* type_data = type->type_data();
      std::string new_node_id = node_id + opt.hyphen() + std::to_string(i);
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferMuxNodeByType(new_node_id, new_tail_id, exp, type_data)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferMuxNodeByBundleType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp, firDB::firTypeBundle* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_node_id = node_id + opt.hyphen() + type_datas[i]->field_id();
      std::string new_tail_id = tail_id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferMuxNodeByType(new_node_id, new_tail_id, exp, btype)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferNodeByValidifExpression(const std::string& node_id, firDB::firExpValidif* exp) {
    fs_assert(exp != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firType* type = exp->getTypeData(module, cur_cond());
    fs_assert(type != NULL);
    std::string tail_id = "";
    if (!transferValidifNodeByType(node_id, tail_id, exp, type)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferValidifNodeByType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firType* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    if (type->isGroundType()) {
      if (isZeroWidthType(type)) {
        fs_warning("*WARNING*: The width (0) of node expression '%s' was invalid.\n", exp->toString().c_str());
        return true;
      }
      if (!transferValidifNodeByGroundType(node_id, tail_id, exp, type)) {
        fs_assert(0);
        return false;
      }
    } else if (type->isVectorType()) {
      if (!transferValidifNodeByVectorType(node_id, tail_id, exp, dynamic_cast<firDB::firTypeVector*>(type))) {
        fs_assert(0);
        return false;
      }
    } else if (type->isBundleType()) {
      if (!transferValidifNodeByBundleType(node_id, tail_id, exp, dynamic_cast<firDB::firTypeBundle*>(type))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferValidifNodeByGroundType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firType* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    if (isZeroWidthType(type)) {
      throw Exception("The zero width expression '" +
        exp->exp()->toString() + "' was invalid, and cannot be used as the input of '" + exp->toString() + "'.");
    }
    firDB::firExp* post_validif = transferValidif(tail_id, exp);
    firDB::firItemNode* node = post_module()->addItemNode(node_id, post_validif);
    post_module()->addStatement(node);
    return true;
  }
  bool TransferPost::transferValidifNodeByVectorType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firTypeVector* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      firDB::firType* type_data = type->type_data();
      std::string new_node_id = node_id + opt.hyphen() + std::to_string(i);
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferValidifNodeByType(new_node_id, new_tail_id, exp, type_data)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferValidifNodeByBundleType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firTypeBundle* type) {
    fs_assert(exp != NULL);
    fs_assert(type != NULL);
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_node_id = node_id + opt.hyphen() + type_datas[i]->field_id();
      std::string new_tail_id = tail_id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferValidifNodeByType(new_node_id, new_tail_id, exp, btype)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }

  bool TransferPost::transferItemMPortToPost(firDB::firItemMPort* item_mport) {
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);

    //direction check, mem id check
    firDB::MPortDir dir = item_mport->dir();
    std::string mport_id = item_mport->mport_id();
    if (dir == firDB::MPortDir::kMPortDirUndef || dir == firDB::MPortDir::kMPortDirInfer) {
      fs_warning("*WARNING*: The direction of mport '%s' cannot be inferred, cause it has not been used.\n", mport_id.c_str());
      return true;
    }
    std::string mem_id = item_mport->mem_id();
    firDB::firItem* mem_id_item = module->findItemExceptMPort(mem_id, cur_cond());
    fs_assert(mem_id_item != NULL);
    unsigned int memory_depth = 0;
    firDB::firType* memory_type = NULL;
    if (mem_id_item->isMemoryItem()) {
      firDB::firItemMemory* memory = dynamic_cast<firDB::firItemMemory*>(mem_id_item);
      memory_depth = memory->depth();
      memory_type = memory->type_data();
    } else if (mem_id_item->isCMemoryItem()) {
      firDB::firItemCMemory* cmemory = dynamic_cast<firDB::firItemCMemory*>(mem_id_item);
      firDB::firTypeVector* cmem_type = dynamic_cast<firDB::firTypeVector*>(cmemory->type_data());
      memory_type = cmem_type->type_data();
      memory_depth = cmem_type->depth();
    } else if (mem_id_item->isSMemoryItem()) {
      firDB::firItemSMemory* smemory = dynamic_cast<firDB::firItemSMemory*>(mem_id_item);
      firDB::firTypeVector* smem_type = dynamic_cast<firDB::firTypeVector*>(smemory->type_data());
      memory_type = smem_type->type_data();
      memory_depth = smem_type->depth();
    } else {
      fs_error("*ERROR*: The item-definition for memory '%s' was incorrect.\n", mem_id.c_str());
      return false;
    }
    fs_assert(memory_depth > 0);
    fs_assert(memory_type != NULL);

    //address check(type + item + depth)
    firDB::firExp* addr_exp = item_mport->addr_exp();
    fs_assert(addr_exp != NULL);
    firDB::firType* addr_type = addr_exp->getTypeData(fir_module(), cur_cond());
    fs_assert(addr_type != NULL);
    fs_assert(addr_type->isUIntType());
    if (addr_exp->isIdExpression()) {
      firDB::firItem* addr_item = findItemExceptInstance(module, addr_exp, cur_cond());
      if (!(addr_item->isPortItem() || addr_item->isWireItem() || addr_item->isRegisterItem() || addr_item->isNodeItem())) {
        fs_error("*ERROR*: Using item '%s' as address was invalid.\n", addr_item->toString().c_str());
        return false;
      }
    } else if (!(addr_exp->isUIntNumberExpression())) {
      fs_error("*ERROR*: The item-definition for address '%s' was incorrect.\n", addr_exp->toString().c_str());
      return false;
    }

    //clock check(type + item)
    firDB::firExp* clk_exp = item_mport->clk_exp();
    fs_assert(clk_exp != NULL);
    firDB::firType* clock_type = clk_exp->getTypeData(module, cur_cond());
    if (clock_type == NULL) {
      fs_assert(0);
      return false;
    } else if (!clock_type->isClockType()) {
      fs_error("*ERROR*: The type of clock '%s' was illegal. The legal type for clock is 'Clock'.\n", clk_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firType* mport_type = module->getItemType(item_mport, cur_cond());
    if (!transferTypeToPostMPort(mem_id, item_mport, mport_type)) {
      return false;
    } else {
      fs_info("*INFO*: Transferring MPort '%s' succeeded.\n", mport_id.c_str());
    }
    return true;
  }
  bool TransferPost::transferTypeToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firType* type) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt: {
      firDB::firTypeUInt* utype = dynamic_cast<firDB::firTypeUInt*>(type);
      if (!utype->valid_width()) {
        fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", utype->invalid_width(), mem_id.c_str());
        return true;
      }
      if (!transferTypeGroundToPostMPort(mem_id, mport)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeSInt: {
      firDB::firTypeSInt* stype = dynamic_cast<firDB::firTypeSInt*>(type);
      if (!stype->valid_width()) {
        fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", stype->invalid_width(), mem_id.c_str());
        return true;
      }
      if (!transferTypeGroundToPostMPort(mem_id, mport)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeFixed: {
      firDB::firTypeFixed* ftype = dynamic_cast<firDB::firTypeFixed*>(type);
      if (!ftype->valid_width()) {
        fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", ftype->invalid_width(), mem_id.c_str());
        return true;
      }
      if (!transferTypeGroundToPostMPort(mem_id, mport)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeInterval: {
      firDB::firTypeInterval* itype = dynamic_cast<firDB::firTypeInterval*>(type);
      int bitWidth = 0;
      if (!itype->getWidth(bitWidth)) {
        fs_warning("*WARNING*: The width (%d) of memory '%s' was invalid.\n", bitWidth, mem_id.c_str());
        return true;
      }
      if (!transferTypeGroundToPostMPort(mem_id, mport)) {
        return false;
      }
      break;
    }
    case firDB::Type::kTypeVector:
      if (!transferTypeVectorToPostMPort(mem_id, mport, dynamic_cast<firDB::firTypeVector*>(type))) {
        return false;
      }
      break;
    case firDB::Type::kTypeBundle:
      if (!transferTypeBundleToPostMPort(mem_id, mport, dynamic_cast<firDB::firTypeBundle*>(type))) {
        return false;
      }
      break;
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferTypeGroundToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport) {
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::string mport_id = mport->mport_id();
    firDB::firItem* post_item = post_module()->findItemById(mem_id);
    fs_assert(post_item->isMemoryItem());
    firDB::firItemMemory* post_memory = dynamic_cast<firDB::firItemMemory*>(post_item);

    firDB::firExpRef* mem_id_ref = post_module()->addExpRef(mem_id);
    firDB::firExpSubfield* mem_name = post_module()->addExpSubfield(mem_id_ref, mport_id);
    firDB::firExp* addr_exp = mport->addr_exp();

    firDB::firExp* addr_rexp = NULL;
    if (addr_exp->isUIntNumberExpression()) {
      addr_rexp = post_module()->copyExpression(addr_exp);
    } else if (addr_exp->isIdExpression()) {
      std::string addr_refid;
      if (!transferIdExpression(addr_refid, "", addr_exp)) {
        fs_assert(0);
        return false;
      }
      addr_rexp = createNewExpById(addr_refid);
      if (addr_rexp->isReferenceExpression()) {
        firDB::firItem* addr_item = findItemExceptInstance(post_module(), addr_rexp, cur_cond());
        fs_assert(addr_item != NULL);
        if (addr_item->isRegisterItem()) {
          std::string id_q = dynamic_cast<firDB::firItemRegister*>(addr_item)->getPortQId();
          firDB::firExpSubfield* new_addr_rexp = post_module()->addExpSubfield(addr_rexp, id_q);
          addr_rexp = new_addr_rexp;
        }
      }
    } else {
      fs_assert(0);
      return false;
    }
    fs_assert(addr_exp != NULL);

    std::string value = "h1";
    firDB::firExpUIntBits* en_exp = post_module()->addExpUIntBits(value, 1);

    firDB::firExp* clk_exp = mport->clk_exp();
    firDB::firExp* clk_rexp = NULL;
    if (clk_exp->isIdExpression()) {
      firDB::firItem* clock_item = module->findItemByExpression(clk_exp, cur_cond());
      if (clock_item->isWireItem() || clock_item->isPortItem() || clock_item->isNodeItem()) {
        std::string clk_refid;
        if (!transferIdExpression(clk_refid, "", clk_exp)) {
          fs_assert(0);
          return false;
        }
        clk_rexp = createNewExpById(clk_refid);
      } else if (clock_item == NULL) {
        fs_error("*ERROR*: Could not find the matching item for clock signal '%s'.\n", clk_exp->toString().c_str());
        fs_assert(0);
        return false;
      } else {
        fs_error("*ERROR*: The item-definition for clock signal '%s' was incorrect.\n", clk_exp->toString().c_str());
        fs_assert(0);
        return false;
      }
    } else if (clk_exp->isPrimOperationExpression()) {
      clk_rexp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(clk_exp), false);
    } else {
      fs_error("*ERROR*: The expression for clock signal '%s' was incorrect.\n", clk_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    fs_assert(clk_rexp != NULL);

    firDB::MPortDir dir = mport->dir();
    if (dir == firDB::MPortDir::kMPortDirRead) {
      post_memory->addReadPorts(mport_id);
      std::string addr_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortAddr);
      firDB::firExpSubfield* mem_port_addr = post_module()->addExpSubfield(mem_name, addr_id);
      firDB::firItemConnect* addr_connect = post_module()->addItemConnect(mem_port_addr, addr_rexp);
      post_module()->addStatement(addr_connect);

      std::string en_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortEn);
      firDB::firExpSubfield* mem_port_en = post_module()->addExpSubfield(mem_name, en_id);
      firDB::firItemConnect* en_connect = post_module()->addItemConnect(mem_port_en, en_exp);
      post_module()->addStatement(en_connect);

      std::string clk_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortClk);
      firDB::firExpSubfield* mem_port_clk = post_module()->addExpSubfield(mem_name, clk_id);
      firDB::firItemConnect* clk_connect = post_module()->addItemConnect(mem_port_clk, clk_rexp);
      post_module()->addStatement(clk_connect);
    } else if (dir == firDB::MPortDir::kMPortDirWrite) {
      post_memory->addWritePorts(mport_id);

      std::string addr_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortAddr);
      firDB::firExpSubfield* mem_port_addr = post_module()->addExpSubfield(mem_name, addr_id);
      firDB::firItemConnect* addr_connect = post_module()->addItemConnect(mem_port_addr, addr_rexp);
      post_module()->addStatement(addr_connect);

      std::string en_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortEn);
      firDB::firExpSubfield* mem_port_en = post_module()->addExpSubfield(mem_name, en_id);
      firDB::firItemConnect* en_connect = post_module()->addItemConnect(mem_port_en, en_exp);
      post_module()->addStatement(en_connect);

      std::string clk_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortClk);
      firDB::firExpSubfield* mem_port_clk = post_module()->addExpSubfield(mem_name, clk_id);
      firDB::firItemConnect* clk_connect = post_module()->addItemConnect(mem_port_clk, clk_rexp);
      post_module()->addStatement(clk_connect);
    } else if (dir == firDB::MPortDir::kMPortDirRdwr) {
      fs_error("*ERROR*: Port '%s' is a readwrite port, but this type has not been supported yet.\n", mport_id.c_str());
      return false;
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferTypeVectorToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeVector* type) {
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      std::string new_mem_id = mem_id + opt.hyphen() + std::to_string(i);
      if (!transferTypeToPostMPort(new_mem_id, mport, type->type_data())) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferTypeBundleToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeBundle* type) {
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_mem_id = mem_id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferTypeToPostMPort(new_mem_id, mport, btype)) {
        return false;
      }
    }
    return true;
  }

  bool TransferPost::transferTypeToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firType* type, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp) {
    switch (type->type()) {
    case firDB::Type::kTypeUInt:
      if (!dynamic_cast<firDB::firTypeUInt*>(type)->valid_width()) return false;
      if (!transferTypeGroundToPostWhenMPort(mem_id, mport, addr_exp, en_exp, clk_exp)) {
        return false;
      }
      break;
    case firDB::Type::kTypeSInt:
      if (!dynamic_cast<firDB::firTypeSInt*>(type)->valid_width()) return false;
      if (!transferTypeGroundToPostWhenMPort(mem_id, mport, addr_exp, en_exp, clk_exp)) {
        return false;
      }
      break;
    case firDB::Type::kTypeFixed:
      if (!transferTypeGroundToPostWhenMPort(mem_id, mport, addr_exp, en_exp, clk_exp)) {
        return false;
      }
      break;
    case firDB::Type::kTypeInterval:
      if (!transferTypeGroundToPostWhenMPort(mem_id, mport, addr_exp, en_exp, clk_exp)) {
        return false;
      }
      break;
    case firDB::Type::kTypeVector:
      if (!transferTypeVectorToPostWhenMPort(mem_id, mport, dynamic_cast<firDB::firTypeVector*>(type), addr_exp, en_exp, clk_exp)) {
        return false;
      }
      break;
    case firDB::Type::kTypeBundle:
      if (!transferTypeBundleToPostWhenMPort(mem_id, mport, dynamic_cast<firDB::firTypeBundle*>(type), addr_exp, en_exp, clk_exp)) {
        return false;
      }
      break;
    default:
      fs_assert(0);
      break;
    }
    return true;
  }
  bool TransferPost::transferTypeGroundToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp) {
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::string mport_id = mport->mport_id();
    firDB::firItem* post_item = post_module()->findItemById(mem_id);
    fs_assert(post_item->isMemoryItem());
    firDB::firItemMemory* post_memory = dynamic_cast<firDB::firItemMemory*>(post_item);

    firDB::firExpRef* mem_id_ref = post_module()->addExpRef(mem_id);
    firDB::firExpSubfield* mem_name = post_module()->addExpSubfield(mem_id_ref, mport_id);

    firDB::MPortDir dir = mport->dir();
    if (dir == firDB::MPortDir::kMPortDirRead) {
      post_memory->addReadPorts(mport_id);
      std::string addr_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortAddr);
      firDB::firExpSubfield* mem_port_addr = post_module()->addExpSubfield(mem_name, addr_id);
      firDB::firItemConnect* addr_connect = post_module()->addItemConnect(mem_port_addr, addr_exp);
      post_module()->addStatement(addr_connect);

      std::string en_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortEn);
      firDB::firExpSubfield* mem_port_en = post_module()->addExpSubfield(mem_name, en_id);
      firDB::firItemConnect* en_connect = post_module()->addItemConnect(mem_port_en, en_exp);
      post_module()->addStatement(en_connect);

      std::string clk_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortClk);
      firDB::firExpSubfield* mem_port_clk = post_module()->addExpSubfield(mem_name, clk_id);
      firDB::firItemConnect* clk_connect = post_module()->addItemConnect(mem_port_clk, clk_exp);
      post_module()->addStatement(clk_connect);
    } else if (dir == firDB::MPortDir::kMPortDirWrite) {
      post_memory->addWritePorts(mport_id);

      std::string addr_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortAddr);
      firDB::firExpSubfield* mem_port_addr = post_module()->addExpSubfield(mem_name, addr_id);
      firDB::firItemConnect* addr_connect = post_module()->addItemConnect(mem_port_addr, addr_exp);
      post_module()->addStatement(addr_connect);

      std::string en_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortEn);
      firDB::firExpSubfield* mem_port_en = post_module()->addExpSubfield(mem_name, en_id);
      firDB::firItemConnect* en_connect = post_module()->addItemConnect(mem_port_en, en_exp);
      post_module()->addStatement(en_connect);

      std::string clk_id = firDB::firItemMemory::getMemPortId(dir, firDB::MemPortType::kMemPortClk);
      firDB::firExpSubfield* mem_port_clk = post_module()->addExpSubfield(mem_name, clk_id);
      firDB::firItemConnect* clk_connect = post_module()->addItemConnect(mem_port_clk, clk_exp);
      post_module()->addStatement(clk_connect);
    } else if (dir == firDB::MPortDir::kMPortDirRdwr) {
      fs_error("*ERROR*: Port '%s' is a readwrite port, but this type has not been supported yet.\n", mport_id.c_str());
      return false;
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferTypeVectorToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeVector* type, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp) {
    fs_assert(type != NULL);
    for (unsigned int i = 0; i < type->depth(); i++) {
      std::string new_mem_id = mem_id + opt.hyphen() + std::to_string(i);
      if (!transferTypeToPostWhenMPort(new_mem_id, mport, type->type_data(), addr_exp, en_exp, clk_exp)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferTypeBundleToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeBundle* type, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp) {
    std::vector<firDB::firField*>& type_datas = type->type_datas();
    for (size_t i = 0; i < type_datas.size(); i++) {
      firDB::firType* btype = type_datas[i]->type_data();
      std::string new_mem_id = mem_id + opt.hyphen() + type_datas[i]->field_id();
      if (!transferTypeToPostWhenMPort(new_mem_id, mport, btype, addr_exp, en_exp, clk_exp)) {
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferItemInstanceToPost(firDB::firItemInstance* inst) {
    fs_assert(inst != NULL);
    firDB::firModule* current_post_module = post_module();
    firDB::firModule* current_fir_module = fir_module();
    fs_assert(current_post_module->findItemById(inst->inst_id()) == NULL);

    firDB::firModule* inst_base_module = fir_circuit()->findModuleById(inst->module_id());
    fs_assert(inst_base_module != NULL);
    fs_assert(inst_base_module->id() == inst->module_id());

    if (post_circuit()->findModuleById(inst_base_module->id()) == NULL) {
      fs_assert(findPostModuleByOrigin(inst_base_module) == NULL);
      switch (inst_base_module->type()) {
      case firDB::ModuleType::kModule:
        if (!transferModuleToPost(inst_base_module, post_circuit())) {
          return false;
        }
        set_module(current_fir_module, current_post_module);
        break;
      case firDB::ModuleType::kExtModule:
        if (!transferExtModuleToPost(inst_base_module, post_circuit())) {
          return false;
        }
        set_module(current_fir_module, current_post_module);
        break;
      default:
        fs_assert(0);
        break;
      }
    }

    firDB::firModule* inst_post_module = findPostModuleByOrigin(inst_base_module);
    fs_assert(inst_post_module != NULL);
    firDB::firItemInstance* post_instance = post_module()->addItemInstance(inst->inst_id(), inst_post_module->id());
    post_module()->addStatement(post_instance);
    fs_info("*INFO*: Transferring Instance '%s' succeeded.\n", inst->inst_id().c_str());

    return true;
  }

  /*********************************************************
  * Function: transferIdExpression
  * Input:
  *   exp_id: 转换表达式得到的ID.
  *   tail_id: 解析Type得到的ID后缀，传入用于拼接表达式ID.
  *   exp: 待转换的表达式.
  * Return: 返回表达式转换是否成功.
  * Example:
  * exp: T_11[T_26].valid[0]
  * tail_id: $x
  **********************************************************/
  bool TransferPost::transferIdExpression(std::string& exp_id, const std::string& tail_id, firDB::firExp* exp) {
    fs_assert(exp != NULL);
    firDB::firItemNode* sel_node = NULL;
    firDB::firItemNode* last_node = NULL;
    if (!transferIdExpByExpType(exp_id, tail_id, exp, sel_node, last_node)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  /*********************************************************
  * Function: transferIdExpByExpType
  * Input:
  *   exp_id: 转换表达式得到的ID.
  *   tail_id: 解析Type得到的ID后缀，传入用于拼接表达式ID.
  *   exp: 待转换的表达式.
  *   sel_node: 解析subaccess时产生的select信号
  *   last_node: 解析subaccess时轮询depth时上次产生的mux_node
  * Return: 返回表达式转换是否成功.
  * Example:
  * exp: T_11[T_26].valid[0]
  * tail_id: $x
  * exp_id: ""
  **********************************************************/
  bool TransferPost::transferIdExpByExpType(std::string& exp_id, const std::string& tail_id, firDB::firExp* exp, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node) {
    fs_assert(exp != NULL);
    if (exp->isReferenceExpression()) {
      if (!transferReferenceExpression(exp_id, tail_id, dynamic_cast<firDB::firExpRef*>(exp), sel_node, last_node)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isSubfieldExpression()) {
      if (!transferSubfieldExpression(exp_id, tail_id, dynamic_cast<firDB::firExpSubfield*>(exp), sel_node, last_node)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isSubindexExpression()) {
      if (!transferSubindexExpression(exp_id, tail_id, dynamic_cast<firDB::firExpSubindex*>(exp), sel_node, last_node)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isSubaccessExpression()) {
      if (!transferSubaccessExpression(exp_id, tail_id, dynamic_cast<firDB::firExpSubaccess*>(exp), sel_node, last_node)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  /*********************************************************************
  * Function: transferReferenceExpression
  * Input:
  *   exp_id: 转换表达式得到的ID.
  *   tail_id: 解析Type得到的ID后缀，传入用于拼接表达式ID.
  *   exp: 待转换的表达式.
  *   sel_node: 解析subaccess时产生的select信号
  *   last_node: 解析subaccess时轮询depth时上次产生的mux_node
  * Return: 返回表达式转换是否成功.
  * Example:
  *   Input:
  *     exp: T_11
  *     tail_id: $x
  *     exp_id: "$valid$0$0"
  *     sel_node:node(node_id, eq(UInt(0), T_26))
  *     last_node:NULL
  * After executed transferReferenceExpression:
  *   exp:NULL
  *   exp_id:"last_node_id$x"
  *   last_node:node(node_id, mux(sel_node, T_11$0$valid$0, NULL))
  ********************************************************************/
  bool TransferPost::transferReferenceExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpRef* exp_ref, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node) {
    fs_assert(exp_ref != NULL);
    std::string ref_id = "";
    std::string current_id;
    firDB::firItem* fir_item = this->fir_module()->findItemByExpression(exp_ref, cur_cond());
    fs_assert(fir_item != NULL);
    std::string space = "";
    if (fir_item->isMemoryItem()) {
      ref_id = exp_ref->id();
      if (exp_id.empty()) {
        current_id = ref_id + tail_id;
      } else {
        current_id = ref_id + exp_id + tail_id;
      }
    } else if (fir_item->isInstanceItem()) {
      ref_id = exp_ref->id();
      if (exp_id.empty()) {
        current_id = ref_id + tail_id;
      } else {
        current_id = ref_id + exp_id + tail_id;
      }
    } else if (fir_item->isMPortItem()) {
      firDB::firItemMPort* fir_mport = dynamic_cast<firDB::firItemMPort*>(fir_item);
      std::string mem_id = fir_mport->mem_id();
      std::string mport_id = fir_mport->mport_id();
      ref_id = mport_id + instance_label() + mem_id;
      if (exp_id.empty()) {
        current_id = ref_id + tail_id;
      } else {
        current_id = ref_id + exp_id + tail_id;
      }
    } else {
      ref_id = exp_ref->id();
      if (exp_id.empty()) {
        current_id = ref_id + tail_id;
      } else {
        current_id = ref_id + exp_id + tail_id;
      }
    }
    if (sel_node != NULL) {
      firDB::firExp* input1 = post_module()->addExpRef(current_id);
      fs_assert(input1 != NULL);
      firDB::firItem* item_input1 = findItemExceptInstance(post_module(), input1, cur_cond());
      fs_assert(item_input1 != NULL);
      if (item_input1->isRegisterItem()) {
        std::string read_id = dynamic_cast<firDB::firItemRegister*>(item_input1)->getPortQId();
        firDB::firExpSubfield* input1_q = post_module()->addExpSubfield(input1, read_id);
        input1 = input1_q;
      }
      firDB::firExp* sel_exp = post_module()->addExpRef(sel_node->id());
      fs_assert(sel_exp != NULL);
      if (last_node != NULL) {
        firDB::firExp* input2 = post_module()->addExpRef(last_node->id());
        fs_assert(input2 != NULL);
        firDB::firExpMux* mux = post_module()->addExpMux(sel_exp, input1, input2);
        firDB::firItemNode* current_node = post_module()->addItemNode(getAddNodeId(), mux);
        fs_assert(current_node != NULL);
        post_module()->addStatement(current_node);
        last_node = current_node;
        exp_id = last_node->id();
      } else {
        firDB::firExpValidif* validif = post_module()->addExpValidif(sel_exp, input1);
        firDB::firItemNode* current_node = post_module()->addItemNode(getAddNodeId(), validif);
        fs_assert(current_node != NULL);
        post_module()->addStatement(current_node);
        last_node = current_node;
        exp_id = last_node->id();
      }
    } else {
      exp_id = current_id;
    }
    return true;
  }
  /*********************************************************
  * Function: transferSubfieldExpression
  * Input:
  *   exp_id: 转换表达式得到的ID.
  *   tail_id: 解析Type得到的ID后缀，传入用于拼接表达式ID.
  *   exp: 待转换的表达式.
  *   sel_node: 解析subaccess时产生的select信号
  *   last_node: 解析subaccess时轮询depth时上次产生的mux_node
  * Return: 返回表达式转换是否成功.
  * Example:
  *   Input:
  *     exp: T_11[T_26].valid
  *     tail_id: "$x"
  *     exp_id: "$0"
  *     sel_node:NULL
  *     last_node:NULL
  * After executed transferReferenceExpression:
  *   exp: T_11[T_26]
  *   exp_id: "$0$valid"
  *   last_node:NULL
  **********************************************************/
  bool TransferPost::transferSubfieldExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpSubfield* subfield, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node) {
    fs_assert(subfield != NULL);
    firDB::firExp* exp = subfield->exp();
    std::string subfield_id = subfield->id();
    firDB::firItem* fir_item = this->fir_module()->findItemByExpression(subfield, cur_cond());
    fs_assert(fir_item != NULL);
    if (fir_item->isMemoryItem()) {
      if (exp_id.empty()) {
        exp_id = instance_label() + subfield_id;
      } else {
        firDB::firItemMemory* item_memory = dynamic_cast<firDB::firItemMemory*>(fir_item);
        if (item_memory->hasPort(subfield_id)) {
          exp_id = instance_label() + subfield_id + exp_id;
        } else {
          exp_id = opt.hyphen() + subfield_id + exp_id;
        }
      }
    } else if (fir_item->isInstanceItem()) {
      if (exp->isReferenceExpression()) {
        exp_id = instance_label() + subfield_id + exp_id;
      } else {
        exp_id = opt.hyphen() + subfield_id + exp_id;
      }
    } else {
      if (exp_id.empty()) {
        exp_id = opt.hyphen() + subfield_id;
      } else {
        exp_id = opt.hyphen() + subfield_id + exp_id;
      }
    }
    if (!transferIdExpByExpType(exp_id, tail_id, exp, sel_node, last_node)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  /*********************************************************
  * Function: transferSubindexExpression
  * Input:
  *   exp_id: 转换表达式得到的ID.
  *   tail_id: 解析Type得到的ID后缀，传入用于拼接表达式ID.
  *   exp: 待转换的表达式.
  *   sel_node: 解析subaccess时产生的select信号
  *   last_node: 解析subaccess时轮询depth时上次产生的mux_node
  * Return: 返回表达式转换是否成功.
  * Example:
  *   Input:
  *     exp: T_11[T_26].valid[0]
  *     tail_id: "$x"
  *     exp_id: ""
  *     sel_node:NULL
  *     last_node:NULL
  * After executed transferReferenceExpression:
  *   exp: T_11[T_26].valid
  *   exp_id: "$0"
  *   last_node: NULL
  **********************************************************/
  bool TransferPost::transferSubindexExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpSubindex* subindex, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node) {
    fs_assert(subindex != NULL);
    firDB::firExp* exp = subindex->exp();
    int index = subindex->index();
    firDB::firItem* fir_item = this->fir_module()->findItemByExpression(subindex, cur_cond());
    fs_assert(fir_item != NULL);
    if (fir_item->isMemoryItem()) {
      if (exp_id.empty()) {
        fs_error("*ERROR*: The memory '%s' is invalid. The memory needs to be applied through the mport.\n", subindex->toString().c_str());
        fs_assert(0);
        return false;
      } else {
        exp_id = opt.hyphen() + std::to_string(index) + exp_id;
      }
    } else {
      if (exp_id.empty()) {
        exp_id = opt.hyphen() + std::to_string(index);
      } else {
        exp_id = opt.hyphen() + std::to_string(index) + exp_id;
      }
    }
    if (!transferIdExpByExpType(exp_id, tail_id, exp, sel_node, last_node)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  /*********************************************************
  * Function: transferSubaccessExpression
  * Input:
  *   exp_id: 转换表达式得到的ID.
  *   tail_id: 解析Type得到的ID后缀，传入用于拼接表达式ID.
  *   exp: 待转换的表达式.
  *   sel_node: 解析subaccess时产生的select信号
  *   last_node: 解析subaccess时轮询depth时上次产生的mux_node
  * Return: 返回表达式转换是否成功.
  * Example:
  *   Input:
  *     exp: T_11[T_26]
  *     tail_id: "$x"
  *     exp_id: "$valid$0"
  *     sel_node:NULL
  *     last_node:NULL
  * After executed transferReferenceExpression:
  *   exp:T_11
  *   exp_id:"$valid$0$0"
  *   last_node:node(node_id, eq(UInt(0), T_26))
  *   sel_node:NULL
  **********************************************************/
  bool TransferPost::transferSubaccessExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpSubaccess* subaccess, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node) {
    fs_assert(subaccess != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* access = subaccess->access();
    firDB::firExp* exp = subaccess->exp();
    firDB::firExp* access_value = NULL;
    try {
      access_value = access->inferExpVal(module, cur_cond());
    } catch (Exception &e) {
      fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", exp->toString().c_str(), e.what());
      fs_assert(0);
    }
    if (access_value != NULL) {
      firDB::firType* subexp_type = exp->getTypeData(module, cur_cond());
      if (!subexp_type->isVectorType()) {
        fs_assert(0);
        return false;
      }
      if (access_value->isUIntNumberExpression()) {
        firDB::firTypeVector* vtype = dynamic_cast<firDB::firTypeVector*>(subexp_type);
        unsigned int index = 0;
        if (access_value->isUIntExpression()) {
          index = dynamic_cast<firDB::firExpUInt*>(access_value)->big_value()->getUIntValue();
        } else if (access_value->isUIntBitsExpression()) {
          index = dynamic_cast<firDB::firExpUIntBits*>(access_value)->big_value()->getUIntValue();
        }
        if (index >= vtype->depth()) {
          fs_error("*ERROR*: The sub-index value (%u) was not within the type depth range (0 to %u) of expression '%s'.\n", index, vtype->depth(), exp->toString().c_str());
          fs_assert(0);
          return false;
        }
        if (exp_id.empty()) {
          exp_id = opt.hyphen() + std::to_string(index);
        } else {
          exp_id = opt.hyphen() + std::to_string(index) + exp_id;
        }
        if (!transferIdExpByExpType(exp_id, tail_id, exp, sel_node, last_node)) {
          fs_assert(0);
          return false;
        }
      } else {
        fs_error("*ERROR*: The access type of sub-access '%s' was not UInt. The valid type is UInt.\n", subaccess->toString().c_str());
        fs_assert(0);
        return false;
      }
    } else {
      std::string ori_exp_id = exp_id;
      firDB::firType* access_type = access->getTypeData(module, cur_cond());
      firDB::firType* exp_type = exp->getTypeData(module, cur_cond());
      if (!access_type->isUIntType()) {
        fs_error("*ERROR*: The access type of sub-access '%s' was not UInt. The valid type is UInt.\n", subaccess->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!exp_type->isVectorType()) {
        fs_error("*ERROR*: The main-body type of sub-access '%s' was not vector. The valid type is vector.\n", subaccess->toString().c_str());
        fs_assert(0);
        return false;
      }
      firDB::firExp* new_access = NULL;
      if (isZeroWidthType(access_type)) {
        new_access = transferZeroWidthExp(access_type);
      } else {
        new_access = transferNestExpression(access, true);
      }
      firDB::firTypeVector* v_type = dynamic_cast<firDB::firTypeVector*>(exp_type);
      unsigned int depth = v_type->depth();
      std::string s_depth = std::to_string(depth - 1);
      BigInt o_depth(s_depth, false);
      int depth_width = o_depth.getMinBinaryWidth();
      int width = dynamic_cast<firDB::firTypeUInt*>(access_type)->width();
      int min_width = std::min(depth_width, width);
      unsigned int max_value = std::min(static_cast<unsigned int>(std::pow(2, min_width)), depth);
      for (unsigned int i = 0; i < max_value; i++) {
        exp_id = ori_exp_id;
        if (exp_id.empty()) {
          exp_id = opt.hyphen() + std::to_string(i);
        } else {
          exp_id = opt.hyphen() + std::to_string(i) + exp_id;
        }
        firDB::firItemNode* new_sel_node = NULL;
        if (sel_node != NULL) {
          firDB::firExp* eq_sel = post_module()->addExpUInt(i, depth_width);
          firDB::firExpPrimOperation::firEq* eq = post_module()->addExpEq(eq_sel, new_access);
          firDB::firItemNode* cur_node = post_module()->addItemNode(getAddNodeId(), eq);
          post_module()->addStatement(cur_node);
          firDB::firExp* cur_node_ref = post_module()->addExpRef(cur_node->id());
          firDB::firExp* pre_node_ref = post_module()->addExpRef(sel_node->id());
          firDB::firExp* and_sel = post_module()->addExpAnd(cur_node_ref, pre_node_ref);
          firDB::firItemNode* and_node = post_module()->addItemNode(getAddNodeId(), and_sel);
          post_module()->addStatement(and_node);
          new_sel_node = and_node;
        } else {
          firDB::firExp* eq_sel = post_module()->addExpUInt(i, depth_width);
          firDB::firExpPrimOperation::firEq* eq = post_module()->addExpEq(eq_sel, new_access);
          new_sel_node = post_module()->addItemNode(getAddNodeId(), eq);
          post_module()->addStatement(new_sel_node);
        }
        if (!transferIdExpByExpType(exp_id, tail_id, exp, new_sel_node, last_node)) {
          fs_assert(0);
          return false;
        }
      }
    }
    return true;
  }
  std::pair<firDB::firType*, firDB::firType*> TransferPost::getMuxInputExpressionType(const std::string& tail_id, std::string mux_suffix, firDB::firType* tval_type, firDB::firType* fval_type) {
    fs_assert(tval_type != NULL);
    fs_assert(fval_type != NULL);
    if (!tval_type->isCompatible(fval_type)) {
      fs_assert(0);
      return std::pair<firDB::firType*, firDB::firType*>(NULL, NULL);
    }
    if (tval_type->isGroundType()) {
      if (tail_id == mux_suffix) {
        std::pair<firDB::firType*, firDB::firType*> mux_inputs_type = std::make_pair(tval_type, fval_type);
        return mux_inputs_type;
      } else {
        return std::pair<firDB::firType*, firDB::firType*>(NULL, NULL);
      }
    } else if (tval_type->isVectorType()) {
      firDB::firTypeVector* v_tval_type = dynamic_cast<firDB::firTypeVector*>(tval_type);
      firDB::firTypeVector* v_fval_type = dynamic_cast<firDB::firTypeVector*>(fval_type);
      for (unsigned int i = 0; i < v_tval_type->depth(); i++) {
        firDB::firType* l_type_data = v_tval_type->type_data();
        firDB::firType* r_type_data = v_fval_type->type_data();
        std::string new_suffix = mux_suffix + opt.hyphen() + std::to_string(i);
        std::pair<firDB::firType*, firDB::firType*> mux_inputs_type = getMuxInputExpressionType(tail_id, new_suffix, l_type_data, r_type_data);
        if (mux_inputs_type.first != NULL && mux_inputs_type.second != NULL) {
          return mux_inputs_type;
        }
      }
    } else if (tval_type->isBundleType()) {
      firDB::firTypeBundle* b_tval_type = dynamic_cast<firDB::firTypeBundle*>(tval_type);
      firDB::firTypeBundle* b_fval_type = dynamic_cast<firDB::firTypeBundle*>(fval_type);
      std::vector<firDB::firField*>& tval_type_datas = b_tval_type->type_datas();
      std::vector<firDB::firField*>& fval_type_datas = b_fval_type->type_datas();
      for (size_t i = 0; i < tval_type_datas.size(); i++) {
        firDB::firType* btype_tval = tval_type_datas[i]->type_data();
        firDB::firType* btype_fval = fval_type_datas[i]->type_data();
        std::string new_suffix_id = mux_suffix + opt.hyphen() + tval_type_datas[i]->field_id();
        std::pair<firDB::firType*, firDB::firType*> mux_inputs_type = getMuxInputExpressionType(tail_id, new_suffix_id, btype_tval, btype_fval);
        if (mux_inputs_type.first != NULL && mux_inputs_type.second != NULL) {
          return mux_inputs_type;
        }
      }
    }
    return std::pair<firDB::firType*, firDB::firType*>(NULL, NULL);
  }
  firDB::firExp* TransferPost::transferMux(const std::string& tail_id, firDB::firExpMux* mux, firDB::firExp* left_exp, bool add_node_flag) {
    fs_assert(mux != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* rexp = NULL;
    firDB::firExp* sel = mux->sel();
    firDB::firExp* input1 = mux->input1();
    firDB::firExp* input2 = mux->input2();
    firDB::firType* tval_type = input1->getTypeData(module, cur_cond());
    firDB::firType* fval_type = input2->getTypeData(module, cur_cond());
    fs_assert(tval_type != NULL);
    fs_assert(fval_type != NULL);
    std::string mux_suffix = "";
    if (!tval_type->isGroundType() && !fval_type->isGroundType()) {
      std::pair<firDB::firType*, firDB::firType*> mux_inputs_type = getMuxInputExpressionType(tail_id, mux_suffix, tval_type, fval_type);
      firDB::firType* ground_tval_type = mux_inputs_type.first;
      firDB::firType* ground_fval_type = mux_inputs_type.second;
      fs_assert(ground_tval_type != NULL && ground_fval_type != NULL);
      fs_assert(ground_tval_type->isCompatible(ground_fval_type));
      tval_type = ground_tval_type;
      fval_type = ground_fval_type;
    }
    auto iter = transfer_exps_map_.find(mux);
    if (iter != transfer_exps_map_.end()) {
      if (iter->second != NULL) {
        return iter->second;
      }
    }
    if (TransferPost::opt.optimize_exp()) {
      firDB::firExp* mux_value = NULL;
      try {
        mux_value = mux->inferExpVal(module, cur_cond());
      } catch (Exception &e) {
        fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", mux->toString().c_str(), e.what());
        fs_assert(0);
      }
      if (mux_value != NULL) {
        fs_assert(mux_value->isNumberExpression());
        rexp = post_module()->copyExpression(mux_value);
        return rexp;
      } else {
        firDB::firExp* mux_sel_value = NULL;
        try {
          mux_sel_value = sel->inferExpVal(module, cur_cond());
        } catch (Exception &e) {
          fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", mux->toString().c_str(), e.what());
          fs_assert(0);
        }
        if (mux_sel_value != NULL) {
          if (!mux_sel_value->isUIntNumberExpression()) {
            fs_error("*ERROR*: The selection signal value of the '%s' must be of the UInt type.\n", mux->toString().c_str());
            fs_assert(0);
            return NULL;
          }
          BigInt* mux_sel_calc = NULL;
          if (mux_sel_value->isUIntExpression()) {
            mux_sel_calc = dynamic_cast<firDB::firExpUInt*>(mux_sel_value)->big_value();
          } else if (mux_sel_value->isUIntBitsExpression()) {
            mux_sel_calc = dynamic_cast<firDB::firExpUIntBits*>(mux_sel_value)->big_value();
          }
          if (mux_sel_calc->getUIntValue() == 1) {
            rexp = transferOperationInputExp(tail_id, input1, tval_type, left_exp);
            return rexp;
          } else if (mux_sel_calc->getUIntValue() == 0) {
            rexp = transferOperationInputExp(tail_id, input2, fval_type, left_exp);
            return rexp;
          } else {
            fs_error("*ERROR*: Invalid expression '%s'.\n", mux->toString().c_str());
            fs_assert(0);
            return NULL;
          }
        } else {
          if (input1->isSameExpression(input2)) {
            rexp = transferOperationInputExp(tail_id, input1, tval_type, left_exp);
            return rexp;
          }
        }
      }
    }
    firDB::firType* sel_type = sel->getTypeData(module, cur_cond());
    firDB::firExp* post_sel = NULL;
    if (sel_type->isUIntType()) {
      firDB::firTypeUInt* u_sel_type = dynamic_cast<firDB::firTypeUInt*>(sel_type);
      if (u_sel_type->valid_width()) {
        firDB::firExp* ground_sel = transferNestExpression(sel, true);
        int width = u_sel_type->width();
        if (width > 1) {
          firDB::firExpUInt* eq_exp = post_module()->addExpUInt(1, 1);
          firDB::firExpPrimOperation::firEq* eq = post_module()->addExpEq(ground_sel, eq_exp);
          firDB::firItemNode* new_node = post_module()->addItemNode(getAddNodeId(), eq);
          post_module()->addStatement(new_node);
          post_sel = post_module()->addExpRef(new_node->id());
        } else {
          post_sel = ground_sel;
        }
      } else {
        if (u_sel_type->invalid_width()) {
          fs_error("*ERROR*: Invalid bit width for expression '%s'.\n", mux->toString().c_str());
          fs_assert(0);
          return NULL;
        }
        if (isZeroWidthType(sel_type)) {
          post_sel = transferZeroWidthExp(sel_type);
        }
      }
    } else {
      fs_error("*ERROR*: The selection in expression '%s' must be UInt type.\n", mux->toString().c_str());
      fs_assert(0);
      return NULL;
    }
    firDB::firExp* post_input1 = transferOperationInputExp(tail_id, input1, tval_type, left_exp);
    firDB::firExp* post_input2 = transferOperationInputExp(tail_id, input2, fval_type, left_exp);
    fs_assert(post_input1 != NULL);
    fs_assert(post_input2 != NULL);
    if (left_exp != NULL) {
      firDB::firExp* post_exp = NULL;
      std::string left_exp_id = left_exp->toString();
      std::string input1_id = post_input1->toString();
      std::string input2_id = post_input2->toString();
      if (left_exp_id == input1_id) {
        fs_warning("*WARNING*: In a MUX with output '%s', the first input '%s' was the same with the output, which would form a loop and become invalid.\n",
          left_exp_id.c_str(), input1_id.c_str());
        firDB::firExpPrimOperation::firNot* not_exp = post_module()->addExpNot(post_sel);
        firDB::firItemNode* not_node = post_module()->addItemNode(getAddNodeId(), not_exp);
        post_module()->addStatement(not_node);
        firDB::firExpRef* not_sel = post_module()->addExpRef(not_node->id());
        post_exp = post_module()->addExpValidif(not_sel, post_input2);
        fs_assert(post_exp != NULL);
      } else if (left_exp_id == input2_id) {
        fs_warning("*WARNING*: In a MUX with output '%s', the second input '%s' was the same with the output, which would form a loop and become invalid.\n",
          left_exp_id.c_str(), input2_id.c_str());
        post_exp = post_module()->addExpValidif(post_sel, post_input1);
        fs_assert(post_exp != NULL);
      }
      if (post_exp != NULL) {
        if (add_node_flag) {
          firDB::firItemNode* mux_node = post_module()->addItemNode(getAddNodeId(), post_exp);
          post_module()->addStatement(mux_node);
          rexp = post_module()->addExpRef(mux_node->id());
        } else {
          rexp = post_exp;
        }
        return rexp;
      }
    }
    firDB::firExpMux* post_mux = post_module()->addExpMux(post_sel, post_input1, post_input2);
    if (!alignMuxInputBinary(post_mux, tval_type, fval_type)) {
      fs_assert(0);
      return NULL;
    }
    if (add_node_flag) {
      firDB::firItemNode* mux_node = post_module()->addItemNode(getAddNodeId(), post_mux);
      post_module()->addStatement(mux_node);
      rexp = post_module()->addExpRef(mux_node->id());
    } else {
      rexp = post_mux;
    }
    if (iter != transfer_exps_map_.end()) {
      if (iter->second == NULL) {
        iter->second = rexp;
      }
    }
    fs_assert(rexp != NULL);
    return rexp;
  }
  firDB::firExp* TransferPost::transferValidif(const std::string& tail_id, firDB::firExpValidif* validif, bool add_node_flag) {
    fs_assert(validif != NULL);
    firDB::firExp* post_exp = NULL;
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* val = validif->exp();
    firDB::firExp* valid = validif->valid();
    firDB::firType* validif_type = val->getTypeData(module, cur_cond());
    fs_assert(validif_type != NULL);
    if (TransferPost::opt.optimize_exp()) {
      firDB::firExp* validif_value = NULL;
      try {
        validif_value = validif->inferExpVal(module, cur_cond());
      } catch (Exception &e) {
        fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", validif->toString().c_str(), e.what());
        fs_assert(0);
      }
      if (validif_value != NULL) {
        fs_assert(validif_value->isNumberExpression());
        post_exp = post_module()->copyExpression(validif_value);
      } else {
        firDB::firExp* valid_value = NULL;
        try {
          valid_value = valid->inferExpVal(module, cur_cond());
        } catch (Exception &e) {
          fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", validif->toString().c_str(), e.what());
          fs_assert(0);
        }
        if (valid_value != NULL) {
          if (!valid_value->isUIntNumberExpression()) {
            fs_error("*ERROR*: The selection signal value of the '%s' must be of the UInt type.\n", validif->toString().c_str());
            fs_assert(0);
            return NULL;
          }
          BigInt* mux_sel_calc = NULL;
          if (valid_value->isUIntExpression()) {
            mux_sel_calc = dynamic_cast<firDB::firExpUInt*>(valid_value)->big_value();
          } else if (valid_value->isUIntBitsExpression()) {
            mux_sel_calc = dynamic_cast<firDB::firExpUIntBits*>(valid_value)->big_value();
          }
          if (mux_sel_calc->getUIntValue() == 1) {
            post_exp = transferOperationInputExp(tail_id, val, validif_type, NULL);
            return post_exp;
          } else {
            fs_error("*ERROR*: Invalid expression '%s'.\n", validif->toString().c_str());
            fs_assert(0);
            return NULL;
          }
        }
      }
    }
    firDB::firExp* post_valid = NULL;
    firDB::firType* valid_type = valid->getTypeData(module, cur_cond());
    if (valid_type->isUIntType()) {
      firDB::firTypeUInt* u_valid_type = dynamic_cast<firDB::firTypeUInt*>(valid_type);
      if (u_valid_type->valid_width()) {
        firDB::firExp* ground_valid = transferNestExpression(valid, true);
        int width = u_valid_type->width();
        if (width > 1) {
          firDB::firExpUInt* eq_exp = post_module()->addExpUInt(1, 1);
          firDB::firExpPrimOperation::firEq* eq = post_module()->addExpEq(ground_valid, eq_exp);
          firDB::firItemNode* new_node = post_module()->addItemNode(getAddNodeId(), eq);
          post_module()->addStatement(new_node);
          post_valid = post_module()->addExpRef(new_node->id());
        } else {
          post_valid = ground_valid;
        }
      } else {
        if (u_valid_type->invalid_width()) {
          fs_error("*ERROR*: Invalid bit width for expression '%s'.\n", validif->toString().c_str());
          fs_assert(0);
          return NULL;
        }
        if (isZeroWidthType(u_valid_type)) {
          post_valid = transferZeroWidthExp(u_valid_type);
        }
      }
    } else {
      fs_error("*ERROR*: The selection in expression '%s' must be UInt type.\n", validif->toString().c_str());
      fs_assert(0);
      return NULL;
    }
    firDB::firExp* post_val = transferOperationInputExp(tail_id, val, validif_type, NULL);
    fs_assert(post_val != NULL);
    firDB::firExpValidif* post_validif = post_module()->addExpValidif(post_valid, post_val);
    if (add_node_flag) {
      firDB::firItemNode* validif_node = post_module()->addItemNode(getAddNodeId(), post_validif);
      post_module()->addStatement(validif_node);
      post_exp = post_module()->addExpRef(validif_node->id());
    } else {
      post_exp = post_validif;
    }
    fs_assert(post_exp != NULL);
    return post_exp;
  }
  firDB::firExp* TransferPost::transferOperationInputExp(const std::string& tail_id, firDB::firExp* input_exp, firDB::firType* input_type, firDB::firExp* left_exp) {
    fs_assert(input_exp != NULL);
    fs_assert(input_type != NULL);
    firDB::firExp* post_input = NULL;
    if (input_exp->isNumberExpression()) {
      post_input = post_module()->copyExpression(input_exp);
    } else if (input_exp->isIdExpression()) {
      bool is_zero_width = false;
      if (input_type->isGroundType()) {
        is_zero_width = isZeroWidthType(input_type);
      }
      if (is_zero_width) {
        post_input = transferZeroWidthExp(input_type);
      } else {
        auto iter = transfer_exps_map_.find(input_exp);
        if (iter != transfer_exps_map_.end()) {
          if (iter->second != NULL) return iter->second;
        }
        std::string input_id;
        if (!transferIdExpression(input_id, tail_id, input_exp)) {
          fs_assert(0);
          return NULL;
        }
        post_input = createNewExpById(input_id);
      }
      fs_assert(post_input != NULL);
      if (left_exp != NULL) {
        std::string left_id = left_exp->toString();
        std::string right_id = post_input->toString();
        if (left_id == right_id) {
          firDB::firLocObj* cur_conditional = NULL;
          if (cur_cond() == NULL) {
            cur_conditional = fir_module();
          } else {
            cur_conditional = cur_cond();
          }
          firDB::firExp* upper_level_save_exp = findUpLevelConnectRightExp(left_id, cur_conditional);
          if (upper_level_save_exp != NULL) {
            post_input = upper_level_save_exp;
            if (upper_level_save_exp->isOperationExpression()) {
              firDB::firItemNode* gen_node = post_module()->addItemNode(getAddNodeId(), upper_level_save_exp);
              post_module()->addStatement(gen_node);
              post_input = post_module()->addExpRef(gen_node->id());
            }
          }
        }
      }
      if (post_input->isReferenceExpression()) {
        firDB::firItem* item = findItemExceptInstance(post_module(), post_input, cur_cond());
        fs_assert(item != NULL);
        if (item->isRegisterItem()) {
          std::string subfield_id = dynamic_cast<firDB::firItemRegister*>(item)->getPortQId();
          firDB::firExp* reg_subfield = post_module()->addExpSubfield(post_input, subfield_id);
          return reg_subfield;
        }
      }
    } else if (input_exp->isMuxExpression()) {
      post_input = transferMux(tail_id, dynamic_cast<firDB::firExpMux*>(input_exp), left_exp, true);
    } else if (input_exp->isValidifExpression()) {
      post_input = transferValidif(tail_id, dynamic_cast<firDB::firExpValidif*>(input_exp), true);
    } else if (input_exp->isPrimOperationExpression()) {
      post_input = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(input_exp), true);
    }
    fs_assert(post_input != NULL);
    return post_input;
  }
  bool TransferPost::transferItemConnectToPost(firDB::firItemConnect* item_connect) {
    fs_assert(item_connect != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* exp_l = item_connect->connect_l();
    firDB::firExp* exp_r = item_connect->connect_r();
    firDB::firType* type_l = exp_l->getTypeData(module, cur_cond());
    firDB::firType* type_r = exp_r->getTypeData(module, cur_cond());
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (!type_l->isCompatible(type_r)) {
      fs_error("*ERROR*: The data types on the left side and right side of the connect '%s' were different.\n", item_connect->toString().c_str());
      fs_assert(0);
      return false;
    }
    if (type_l->isAnalogType()) {
      firDB::firItemAttach* add_attach = module->addItemAttach();
      add_attach->addNet(exp_l);
      add_attach->addNet(exp_r);
      if (!transferItemAttachToPost(add_attach)) {
        fs_assert(0);
        return false;
      }
      return true;
    }
    firDB::firItem* fir_item_l = module->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isNodeItem()) {
      fs_error("*ERROR*: The Node '%s' does not support re-assignment.\n", exp_l->toString().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firExp* new_connect_l = exp_l;
    firDB::firExp* new_connect_r = exp_r;
    std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs;
    if (hasSubaccess(exp_l)) {
      new_connect_l = collectHasSubaccessExps(exp_l, exp_pairs);
      if (!exp_pairs.empty()) {
        for (size_t p = 0; p < exp_pairs.size(); p++) {
          std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs[p];
          firDB::firExp* eq_value = exp_pair.first;
          new_connect_l = exp_pair.second;
          firDB::firExpMux* connect_r_mux = fir_module()->addExpMux(eq_value, exp_r, new_connect_l);
          mapTransferExps(connect_r_mux, NULL);
          if (!transferConnectByExpression(new_connect_l, connect_r_mux, type_l, type_r)) {
            fs_assert(0);
            return false;
          }
        }
        exp_pairs.clear();
        fs_info("*INFO*: Transferring Connect '%s' succeeded.\n", item_connect->toString().c_str());
        return true;
      }
    }
    if (!transferConnectByExpression(new_connect_l, new_connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Connect '%s' succeeded.\n", item_connect->toString().c_str());
    return true;
  }
  bool TransferPost::transferConnectByExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (exp_r->isNumberExpression()) {
      if (!transferConnectByNumExpression(exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isIdExpression()) {
      if (!transferConnectByIdExpression(exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isMuxExpression()) {
      if (!transferConnectByMux(exp_l, dynamic_cast<firDB::firExpMux*>(exp_r), type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isValidifExpression()) {
      if (!transferConnectByValidif(exp_l, dynamic_cast<firDB::firExpValidif*>(exp_r), type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isPrimOperationExpression()) {
      if (!transferPrimOpConnectToPost(exp_l, dynamic_cast<firDB::firExpPrimOperation*>(exp_r), type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferConnectByNumExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    if (isZeroWidthType(type_l)) {
      fs_warning("*WARNING*: The width (0) of connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
      return true;
    }
    if (isZeroWidthType(type_r)) {
      fs_warning("*WARNING*: The width (0) of connect right expression '%s' was invalid.\n", exp_r->toString().c_str());
      return true;
    }
    std::string id_l;
    std::string tail_id = "";
    try {
      exp_r = exp_r->inferExpVal(module, cur_cond());
    } catch (Exception &e) {
      fs_warning("*WARNING*: An exception is captured when infer value of '%s', '%s'.\n", exp_r->toString().c_str(), e.what());
      fs_assert(0);
    }
    firDB::firExp* connect_r = post_module()->copyExpression(exp_r);
    if (!transferIdExpression(id_l, tail_id, exp_l)) {
      fs_assert(0);
      return false;
    }
    firDB::firItem* fir_item_l = module->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isMPortItem()) {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(fir_item_l);
      firDB::MPortDir mport_dir = item_mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        fs_error("*ERROR*: The MPort '%s' is read type but was used as the left side reference of connect.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
        generateMPortMaskConnect(id_l, item_mport);
      }
    }
    firDB::firExp* connect_l = createNewExpById(id_l, true);
    std::string connect_l_id = connect_l->toString();
    if (connect_l == NULL || connect_r == NULL) {
      fs_assert(0);
      return false;
    }
    if (!alignBinaryToSpecifiedType(connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    if (connect_l->isReferenceExpression()) {
      firDB::firItem* item_l = findItemExceptInstance(post_module(), connect_l, cur_cond());
      fs_assert(item_l != NULL);
      if (item_l->isPortItem()) {
        if (dynamic_cast<firDB::firItemPort*>(item_l)->isInput()) {
          fs_error("*ERROR*: The '%s' is an input port but was used as the left side reference of connect.\n", dynamic_cast<firDB::firItemPort*>(item_l)->id().c_str());
          fs_assert(0);
          return false;
        }
      } else if (item_l->isRegisterItem()) {
        firDB::firItemRegister* post_reg = dynamic_cast<firDB::firItemRegister*>(item_l);
        fs_assert(post_reg);
        std::string reg_d = post_reg->getPortDId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(connect_l, reg_d);
        connect_l = reg_exp;
      }
    }
    firDB::firLocObj* cur_block = cur_cond();
    if (cur_block == NULL) cur_block = fir_module();
    mapConnectExpsInCurConditional(cur_block, connect_l_id, connect_l, connect_r);
    return true;
  }
  bool TransferPost::transferConnectByIdExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    firDB::firExp* expr_value = NULL;
    if (TransferPost::opt.optimize_exp()) {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      expr_value = exp_r->inferExpVal(module, cur_cond());
    }
    if (expr_value != NULL) {
      fs_assert(expr_value->isNumberExpression());
      if (!transferConnectByExpression(exp_l, expr_value, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else {
      std::string tail_id = "";
      if (!transferConnectByType(tail_id, exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (!type_l->isCompatible(type_r)) {
      fs_error("*ERROR*: The data types on the left side and right side of the connect '%s' <= '%s' were different.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
      fs_assert(0);
      return false;
    }
    if (type_l->isGroundType()) {
      if (isZeroWidthType(type_l)) {
        fs_warning("*WARNING*: The width (0) of connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
        return true;
      }
      if (isZeroWidthType(type_r)) {
        fs_warning("*WARNING*: The width (0) of connect right expression '%s' was invalid.\n", exp_r->toString().c_str());
        return true;
      }
      if (!transferConnectByGroundType(tail_id, exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isVectorType()) {
      if (!transferConnectByVectorType(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeVector*>(type_l), dynamic_cast<firDB::firTypeVector*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isBundleType()) {
      if (!transferConnectByBundleType(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeBundle*>(type_l), dynamic_cast<firDB::firTypeBundle*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferConnectByGroundType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    std::string id_l;
    if (!transferIdExpression(id_l, tail_id, exp_l)) {
      fs_assert(0);
      return false;
    }
    firDB::firItem* fir_item_l = this->fir_module()->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isMPortItem()) {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(fir_item_l);
      firDB::MPortDir mport_dir = item_mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        fs_error("*ERROR*: The MPort '%s' is read type but was used as the left side reference of connect.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
        generateMPortMaskConnect(id_l, item_mport);
      }
    }
    std::string id_r;
    if (!transferIdExpression(id_r, tail_id, exp_r)) {
      fs_assert(0);
      return false;
    }
    firDB::firExp* connect_l = createNewExpById(id_l, true);
    std::string connect_l_id = connect_l->toString();
    firDB::firExp* connect_r = createNewExpById(id_r);
    if (connect_l == NULL || connect_r == NULL) {
      fs_assert(0);
      return false;
    }
    if (connect_r->isReferenceExpression()) {
      firDB::firItem* post_item = findItemExceptInstance(post_module(), connect_r, cur_cond());
      fs_assert(post_item != NULL);
      if (post_item->isRegisterItem()) {
        std::string reg_q = dynamic_cast<firDB::firItemRegister*>(post_item)->getPortQId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(connect_r, reg_q);
        connect_r = reg_exp;
      }
    }
    if (!alignBinaryToSpecifiedType(connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    if (connect_l->isReferenceExpression()) {
      firDB::firItem* item_l = findItemExceptInstance(post_module(), connect_l, cur_cond());
      fs_assert(item_l != NULL);
      if (item_l->isPortItem()) {
        if (dynamic_cast<firDB::firItemPort*>(item_l)->isInput()) {
          fs_error("*ERROR*: The '%s' is an input port but was used as the left side reference of connect.\n", dynamic_cast<firDB::firItemPort*>(item_l)->id().c_str());
          fs_assert(0);
          return false;
        }
      } else if (item_l->isRegisterItem()) {
        firDB::firItemRegister* post_reg = dynamic_cast<firDB::firItemRegister*>(item_l);
        fs_assert(post_reg);
        std::string reg_d = post_reg->getPortDId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(connect_l, reg_d);
        connect_l = reg_exp;
      }
    }
    firDB::firLocObj* cur_block = cur_cond();
    if (cur_block == NULL) cur_block = fir_module();
    mapConnectExpsInCurConditional(cur_block, connect_l_id, connect_l, connect_r);
    return true;
  }
  bool TransferPost::transferConnectByVectorType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_r->isVectorType());
    for (unsigned int i = 0; i < type_r->depth(); i++) {
      firDB::firType* l_type_data = type_l->type_data();
      firDB::firType* r_type_data = type_r->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferConnectByType(new_tail_id, exp_l, exp_r, l_type_data, r_type_data)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferConnectByBundleType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_r->isBundleType());
    std::vector<firDB::firField*>& type_datas_l = type_l->type_datas();
    std::vector<firDB::firField*>& type_datas_r = type_r->type_datas();
    for (size_t i = 0; i < type_datas_l.size(); i++) {
      firDB::firType* btype_l = type_datas_l[i]->type_data();
      firDB::firType* btype_r = type_datas_r[i]->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + type_datas_l[i]->field_id();
      if (type_datas_l[i]->flip() && type_datas_r[i]->flip()) {
        if (!transferConnectByType(new_tail_id, exp_r, exp_l, btype_r, btype_l)) {
          fs_assert(0);
          return false;
        }
      } else {
        if (!transferConnectByType(new_tail_id, exp_l, exp_r, btype_l, btype_r)) {
          fs_assert(0);
          return false;
        }
      }
    }
    return true;
  }
  bool TransferPost::transferConnectByMux(firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::string tail_id = "";
    if (!transferMuxConnectByType(tail_id, exp_l, dynamic_cast<firDB::firExpMux*>(exp_r), type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferMuxConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (!type_l->isCompatible(type_r)) {
      fs_error("*ERROR*: The data types on the left side and right side of the connect '%s' <= '%s' were different.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
      fs_assert(0);
      return false;
    }
    if (type_l->isGroundType()) {
      if (isZeroWidthType(type_l)) {
        fs_warning("*WARNING*: The width (0) of connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
        return true;
      }
      if (isZeroWidthType(type_r)) {
        fs_warning("*WARNING*: The width (0) of connect right expression '%s' was invalid.\n", exp_r->toString().c_str());
        return true;
      }
      if (!transferMuxConnectByGroundType(tail_id, exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isVectorType()) {
      if (!transferConnectVectorMux(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeVector*>(type_l), dynamic_cast<firDB::firTypeVector*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isBundleType()) {
      if (!transferConnectBundleMux(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeBundle*>(type_l), dynamic_cast<firDB::firTypeBundle*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferMuxConnectByGroundType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    std::string id_l;
    if (!transferIdExpression(id_l, tail_id, exp_l)) {
      fs_assert(0);
      return false;
    }
    firDB::firItem* fir_item_l = this->fir_module()->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isMPortItem()) {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(fir_item_l);
      firDB::MPortDir mport_dir = item_mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        fs_error("*ERROR*: The MPort '%s' is read type but was used as the left side reference of connect.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
        generateMPortMaskConnect(id_l, item_mport);
      }
    }
    firDB::firExp* connect_l = createNewExpById(id_l, true);
    std::string connect_l_id = connect_l->toString();
    firDB::firExp* connect_r = transferMux(tail_id, exp_r, connect_l);
    if (connect_l == NULL || connect_r == NULL) {
      fs_assert(0);
      return false;
    }
    if (!alignBinaryToSpecifiedType(connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    if (connect_l->isReferenceExpression()) {
      firDB::firItem* item_l = findItemExceptInstance(post_module(), connect_l, cur_cond());
      fs_assert(item_l != NULL);
      if (item_l->isPortItem()) {
        if (dynamic_cast<firDB::firItemPort*>(item_l)->isInput()) {
          fs_error("*ERROR*: The '%s' is an input port but was used as the left side reference of connect.\n", dynamic_cast<firDB::firItemPort*>(item_l)->id().c_str());
          fs_assert(0);
          return false;
        }
      } else if (item_l->isRegisterItem()) {
        firDB::firItemRegister* post_reg = dynamic_cast<firDB::firItemRegister*>(item_l);
        fs_assert(post_reg);
        std::string reg_d = post_reg->getPortDId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(connect_l, reg_d);
        connect_l = reg_exp;
      }
    }
    firDB::firLocObj* cur_block = cur_cond();
    if (cur_block == NULL) cur_block = fir_module();
    mapConnectExpsInCurConditional(cur_block, connect_l_id, connect_l, connect_r);
    return true;
  }
  bool TransferPost::transferConnectVectorMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    fs_assert(type_r->isVectorType());
    for (unsigned int i = 0; i < type_r->depth(); i++) {
      firDB::firType* l_type_data = type_l->type_data();
      firDB::firType* r_type_data = type_r->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferMuxConnectByType(new_tail_id, exp_l, exp_r, l_type_data, r_type_data)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferConnectBundleMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    fs_assert(type_r->isBundleType());
    std::vector<firDB::firField*>& type_datas_l = type_l->type_datas();
    std::vector<firDB::firField*>& type_datas_r = type_r->type_datas();
    for (size_t i = 0; i < type_datas_l.size(); i++) {
      firDB::firType* btype_l = type_datas_l[i]->type_data();
      firDB::firType* btype_r = type_datas_r[i]->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + type_datas_l[i]->field_id();
      if (!transferMuxConnectByType(new_tail_id, exp_l, exp_r, btype_l, btype_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferConnectByValidif(firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::string tail_id = "";
    if (!transferValidifConnectByType(tail_id, exp_l, validif, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferValidifConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (!type_l->isCompatible(type_r)) {
      fs_error("*ERROR*: The data types on the left side and right side of the connect '%s' <= '%s' were different.\n", exp_l->toString().c_str(), validif->toString().c_str());
      fs_assert(0);
      return false;
    }
    if (type_l->isGroundType()) {
      if (isZeroWidthType(type_l)) {
        fs_warning("*WARNING*: The width (0) of connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
        return true;
      }
      if (isZeroWidthType(type_r)) {
        fs_warning("*WARNING*: The width (0) of connect right expression '%s' was invalid.\n", validif->toString().c_str());
        return true;
      }
      if (!transferValidifConnectByGroundType(tail_id, exp_l, validif, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isVectorType()) {
      if (!transferValidifConnectByVectorType(tail_id, exp_l, validif, dynamic_cast<firDB::firTypeVector*>(type_l), dynamic_cast<firDB::firTypeVector*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isBundleType()) {
      if (!transferValidifConnectByBundleType(tail_id, exp_l, validif, dynamic_cast<firDB::firTypeBundle*>(type_l), dynamic_cast<firDB::firTypeBundle*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferValidifConnectByGroundType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    std::string id_l;
    if (!transferIdExpression(id_l, tail_id, exp_l)) {
      fs_assert(0);
      return false;
    }
    firDB::firItem* fir_item_l = this->fir_module()->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isMPortItem()) {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(fir_item_l);
      firDB::MPortDir mport_dir = item_mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        fs_error("*ERROR*: The MPort '%s' is read type but was used as the left side reference of connect.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
        generateMPortMaskConnect(id_l, item_mport);
      }
    }
    firDB::firExp* connect_l = createNewExpById(id_l, true);
    std::string connect_l_id = connect_l->toString();
    firDB::firExp* connect_r = transferValidif(tail_id, validif);
    if (connect_l == NULL || connect_r == NULL) {
      fs_assert(0);
      return false;
    }
    if (!alignBinaryToSpecifiedType(connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    if (connect_l->isReferenceExpression()) {
      firDB::firItem* item_l = findItemExceptInstance(post_module(), connect_l, cur_cond());
      fs_assert(item_l != NULL);
      if (item_l->isPortItem()) {
        if (dynamic_cast<firDB::firItemPort*>(item_l)->isInput()) {
          fs_error("*ERROR*: The '%s' is an input port but was used as the left side reference of connect.\n", dynamic_cast<firDB::firItemPort*>(item_l)->id().c_str());
          fs_assert(0);
          return false;
        }
      } else if (item_l->isRegisterItem()) {
        firDB::firItemRegister* post_reg = dynamic_cast<firDB::firItemRegister*>(item_l);
        fs_assert(post_reg);
        std::string reg_d = post_reg->getPortDId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(connect_l, reg_d);
        connect_l = reg_exp;
      }
    }
    firDB::firLocObj* cur_block = cur_cond();
    if (cur_block == NULL) cur_block = fir_module();
    mapConnectExpsInCurConditional(cur_block, connect_l_id, connect_l, connect_r);
    return true;
  }
  bool TransferPost::transferValidifConnectByVectorType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    fs_assert(type_r->isVectorType());
    for (unsigned int i = 0; i < type_r->depth(); i++) {
      firDB::firType* l_type_data = type_l->type_data();
      firDB::firType* r_type_data = type_r->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferValidifConnectByType(new_tail_id, exp_l, validif, l_type_data, r_type_data)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferValidifConnectByBundleType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    fs_assert(type_r->isBundleType());
    std::vector<firDB::firField*>& type_datas_l = type_l->type_datas();
    std::vector<firDB::firField*>& type_datas_r = type_r->type_datas();
    for (size_t i = 0; i < type_datas_l.size(); i++) {
      firDB::firType* btype_l = type_datas_l[i]->type_data();
      firDB::firType* btype_r = type_datas_r[i]->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + type_datas_l[i]->field_id();
      if (!transferValidifConnectByType(new_tail_id, exp_l, validif, btype_l, btype_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPrimOpConnectToPost(firDB::firExp* exp_l, firDB::firExpPrimOperation* prim_op, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(prim_op != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (isZeroWidthType(type_l)) {
      fs_warning("*WARNING*: The width (0) of connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
      return true;
    }
    if (isZeroWidthType(type_r)) {
      fs_warning("*WARNING*: The width (0) of connect right expression '%s' was invalid.\n", prim_op->toString().c_str());
      return true;
    }
    std::string tail_id = "";
    std::string id_l = "";
    if (!transferIdExpression(id_l, tail_id, exp_l)) {
      fs_assert(0);
      return false;
    }
    firDB::firItem* fir_item_l = this->fir_module()->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isMPortItem()) {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(fir_item_l);
      std::string mport_id = item_mport->mport_id();
      firDB::MPortDir mport_dir = item_mport->dir();
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        fs_error("*ERROR*: The MPort '%s' is read type but was used as the left side reference of connect.\n", item_mport->mport_id().c_str());
        fs_assert(0);
        return false;
      }
      if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
        generateMPortMaskConnect(id_l, item_mport);
      }
    }
    firDB::firExp* connect_l = createNewExpById(id_l, true);
    std::string connect_l_id = connect_l->toString();
    firDB::firExp* connect_r = transferPrimOperation(prim_op, false);
    if (connect_l == NULL || connect_r == NULL) {
      fs_assert(0);
      return false;
    }
    if (!alignBinaryToSpecifiedType(connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    if (connect_l->isReferenceExpression()) {
      firDB::firItem* item_l = findItemExceptInstance(post_module(), connect_l, cur_cond());
      fs_assert(item_l != NULL);
      if (item_l->isPortItem()) {
        if (dynamic_cast<firDB::firItemPort*>(item_l)->isInput()) {
          fs_error("*ERROR*: The '%s' is an input port but was used as the left side reference of connect.\n", dynamic_cast<firDB::firItemPort*>(item_l)->id().c_str());
          fs_assert(0);
          return false;
        }
      } else if (item_l->isRegisterItem()) {
        firDB::firItemRegister* post_reg = dynamic_cast<firDB::firItemRegister*>(item_l);
        fs_assert(post_reg);
        std::string reg_d = post_reg->getPortDId();
        firDB::firExp* reg_exp = post_module()->addExpSubfield(connect_l, reg_d);
        connect_l = reg_exp;
      }
    }
    firDB::firLocObj* cur_block = cur_cond();
    if (cur_block == NULL) cur_block = fir_module();
    mapConnectExpsInCurConditional(cur_block, connect_l_id, connect_l, connect_r);
    return true;
  }

  bool TransferPost::transferItemPartialConnectToPost(firDB::firItemPartialConnect* item_partialconnect) {
    fs_assert(item_partialconnect != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* exp_l = item_partialconnect->connect_l();
    firDB::firExp* exp_r = item_partialconnect->connect_r();
    firDB::firType* type_l = exp_l->getTypeData(module, cur_cond());
    firDB::firType* type_r = exp_r->getTypeData(module, cur_cond());
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (type_l->isAnalogType()) {
      firDB::firItemAttach* add_attach = module->addItemAttach();
      add_attach->addNet(exp_l);
      add_attach->addNet(exp_r);
      if (!transferItemAttachToPost(add_attach)) {
        fs_assert(0);
        return false;
      }
      return true;
    }
    firDB::firItem* fir_item_l = module->findItemByExpression(exp_l, cur_cond());
    fs_assert(fir_item_l != NULL);
    if (fir_item_l->isMPortItem()) {
      firDB::firItemMPort* item_mport = dynamic_cast<firDB::firItemMPort*>(fir_item_l);
      std::string mport_id = item_mport->mport_id();
      firDB::MPortDir dir = item_mport->dir();
      if (dir == firDB::MPortDir::kMPortDirRead) {
        fs_error("*ERROR*: The MPort '%s' is read type but was used as the left side reference of connect.\n", mport_id.c_str());
        fs_assert(0);
        return false;
      }
    } else if (fir_item_l->isNodeItem()) {
      fs_error("*ERROR*: The Node '%s' does not support re-assignment.\n", exp_l->toString().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firExp* new_connect_l = exp_l;
    firDB::firExp* new_connect_r = exp_r;
    std::vector<std::pair<firDB::firExp*, firDB::firExp*>> exp_pairs;
    if (hasSubaccess(exp_l)) {
      new_connect_l = collectHasSubaccessExps(exp_l, exp_pairs);
      if (!exp_pairs.empty()) {
        for (size_t p = 0; p < exp_pairs.size(); p++) {
          std::pair<firDB::firExp*, firDB::firExp*> exp_pair = exp_pairs[p];
          firDB::firExp* eq_value = exp_pair.first;
          firDB::firExp* sub_id_exp = exp_pair.second;
          new_connect_l = exp_pair.second;
          firDB::firExpMux* connect_r_mux = fir_module()->addExpMux(eq_value, exp_r, sub_id_exp);
          mapTransferExps(exp_r, NULL);
          if (!transferPartialConnectByExpression(new_connect_l, connect_r_mux, type_l, type_r)) {
            fs_assert(0);
            return false;
          }
        }
        exp_pairs.clear();
        fs_info("*INFO*: Transferring Partial Connect '%s' succeeded.\n", item_partialconnect->toString().c_str());
        return true;
      }
    }
    if (!transferPartialConnectByExpression(new_connect_l, new_connect_r, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Partial Connect '%s' succeeded.\n", item_partialconnect->toString().c_str());
    return true;
  }
  bool TransferPost::transferPartialConnectByExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (exp_r->isNumberExpression()) {
      if (!transferConnectByNumExpression(exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isIdExpression()) {
      if (!transferPartialConnectByIdExpression(exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isMuxExpression()) {
      if (!transferPartialConnectByMux(exp_l, dynamic_cast<firDB::firExpMux*>(exp_r), type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isValidifExpression()) {
      if (!transferPartialConnectByValidif(exp_l, dynamic_cast<firDB::firExpValidif*>(exp_r), type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (exp_r->isPrimOperationExpression()) {
      if (!transferPrimOpConnectToPost(exp_l, dynamic_cast<firDB::firExpPrimOperation*>(exp_r), type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPartialConnectByIdExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    firDB::firExp* expr_value = NULL;
    if (TransferPost::opt.optimize_exp()) {
      firDB::firModule* module = fir_module();
      fs_assert(module != NULL);
      expr_value = exp_r->inferExpVal(module, cur_cond());
    }
    if (expr_value != NULL) {
      fs_assert(expr_value->isNumberExpression());
      if (!transferConnectByExpression(exp_l, expr_value, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else {
      std::string tail_id = "";
      if (!transferPartialConnectByType(tail_id, exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPartialConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (type_l->isGroundType()) {
      if (!type_l->isCompatible(type_r)) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' were different.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (isZeroWidthType(type_l)) {
        fs_warning("*WARNING*: The width (0) of partial connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
        return true;
      }
      if (isZeroWidthType(type_r)) {
        fs_warning("*WARNING*: The width (0) of partial connect right expression '%s' was invalid.\n", exp_r->toString().c_str());
        return true;
      }
      if (!transferConnectByGroundType(tail_id, exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isVectorType()) {
      if (!type_r->isVectorType()) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' not match.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!transferPartialConnectByVectorType(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeVector*>(type_l), dynamic_cast<firDB::firTypeVector*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isBundleType()) {
      if (!type_r->isBundleType()) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' not match.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!transferPartialConnectByBundleType(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeBundle*>(type_l), dynamic_cast<firDB::firTypeBundle*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferPartialConnectByVectorType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    unsigned int depth_l = type_l->depth();
    unsigned int depth_r = type_r->depth();
    unsigned int size = std::min(depth_l, depth_r);
    for (unsigned int i = 0; i < size; i++) {
      firDB::firType* type_data_l = type_l->type_data();
      firDB::firType* type_data_r = type_r->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferPartialConnectByType(new_tail_id, exp_l, exp_r, type_data_l, type_data_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPartialConnectByBundleType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    std::vector<firDB::firField*>& type_datas_l = type_l->type_datas();
    std::vector<firDB::firField*>& type_datas_r = type_r->type_datas();
    std::map<std::string, firDB::firType*> id_type_map;
    for (size_t i = 0; i < type_datas_r.size(); i++) {
      id_type_map.insert(std::make_pair(type_datas_r[i]->field_id(), type_datas_r[i]->type_data()));
    }
    for (size_t i = 0; i < type_datas_l.size(); i++) {
      auto iter = id_type_map.find(type_datas_l[i]->field_id());
      if (iter != id_type_map.end()) {
        firDB::firType* data_type_r = iter->second;
        firDB::firType* data_type_l = type_datas_l[i]->type_data();
        std::string new_tail_id = tail_id + opt.hyphen() + type_datas_l[i]->field_id();
        if (type_datas_l[i]->flip()) {
          if (!transferPartialConnectByType(new_tail_id, exp_r, exp_l, data_type_r, data_type_l)) {
            fs_assert(0);
            return false;
          }
        } else {
          if (!transferPartialConnectByType(new_tail_id, exp_l, exp_r, data_type_l, data_type_r)) {
            fs_assert(0);
            return false;
          }
        }
      }
    }
    id_type_map.clear();
    return true;
  }
  bool TransferPost::transferPartialConnectByMux(firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::string tail_id = "";
    if (!transferMuxPartialConnectByType(tail_id, exp_l, dynamic_cast<firDB::firExpMux*>(exp_r), type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferMuxPartialConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (type_l->isGroundType()) {
      if (!type_l->isCompatible(type_r)) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' were different.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (isZeroWidthType(type_l)) {
        fs_warning("*WARNING*: The width (0) of partial connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
        return true;
      }
      if (isZeroWidthType(type_r)) {
        fs_warning("*WARNING*: The width (0) of partial connect right expression '%s' was invalid.\n", exp_r->toString().c_str());
        return true;
      }
      if (!transferMuxConnectByGroundType(tail_id, exp_l, exp_r, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isVectorType()) {
      if (!type_r->isVectorType()) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' not match.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!transferPartialConnectVectorMux(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeVector*>(type_l), dynamic_cast<firDB::firTypeVector*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isBundleType()) {
      if (!type_r->isBundleType()) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' not match.\n", exp_l->toString().c_str(), exp_r->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!transferPartialConnectBundleMux(tail_id, exp_l, exp_r, dynamic_cast<firDB::firTypeBundle*>(type_l), dynamic_cast<firDB::firTypeBundle*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferPartialConnectVectorMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    unsigned int size_l = type_l->depth();
    unsigned int size_r = type_r->depth();
    unsigned int size = std::min(size_l, size_r);
    for (unsigned int i = 0; i < size; i++) {
      firDB::firType* type_data_l = type_l->type_data();
      firDB::firType* type_data_r = type_r->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferMuxPartialConnectByType(new_tail_id, exp_l, exp_r, type_data_l, type_data_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPartialConnectBundleMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(exp_r != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    std::vector<firDB::firField*>& type_datas_l = type_l->type_datas();
    std::vector<firDB::firField*>& type_datas_r = type_r->type_datas();
    std::map<std::string, firDB::firType*> id_type_data_map;
    for (size_t i = 0; i < type_datas_l.size(); i++) {
      id_type_data_map.insert(std::make_pair(type_datas_l[i]->field_id(), type_datas_l[i]->type_data()));
    }
    for (size_t i = 0; i < type_datas_r.size(); i++) {
      auto iter = id_type_data_map.find(type_datas_r[i]->field_id());
      if (iter != id_type_data_map.end()) {
        firDB::firType* new_type_r = type_datas_r[i]->type_data();
        firDB::firType* new_type_l = iter->second;
        std::string new_tail_id = tail_id + opt.hyphen() + iter->first;
        if (!transferMuxPartialConnectByType(new_tail_id, exp_l, exp_r, new_type_l, new_type_r)) {
          fs_assert(0);
          return false;
        }
      }
    }
    id_type_data_map.clear();
    return true;
  }
  bool TransferPost::transferPartialConnectByValidif(firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::string tail_id = "";
    if (!transferValidifPartialConnectByType(tail_id, exp_l, validif, type_l, type_r)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferValidifPartialConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    if (type_l->isGroundType()) {
      if (!type_l->isCompatible(type_r)) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' were different.\n", exp_l->toString().c_str(), validif->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (isZeroWidthType(type_l)) {
        fs_warning("*WARNING*: The width (0) of partial connect left expression '%s' was invalid.\n", exp_l->toString().c_str());
        return true;
      }
      if (isZeroWidthType(type_r)) {
        fs_warning("*WARNING*: The width (0) of partial connect right expression '%s' was invalid.\n", validif->toString().c_str());
        return true;
      }
      if (!transferValidifConnectByGroundType(tail_id, exp_l, validif, type_l, type_r)) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isVectorType()) {
      if (!type_r->isVectorType()) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' not match.\n", exp_l->toString().c_str(), validif->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!transferPartialConnectVectorValidif(tail_id, exp_l, validif, dynamic_cast<firDB::firTypeVector*>(type_l), dynamic_cast<firDB::firTypeVector*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else if (type_l->isBundleType()) {
      if (!type_r->isBundleType()) {
        fs_error("*ERROR*: The data types on the left side and right side of the partial connect '%s' <- '%s' not match.\n", exp_l->toString().c_str(), validif->toString().c_str());
        fs_assert(0);
        return false;
      }
      if (!transferPartialConnectBundleValidif(tail_id, exp_l, validif, dynamic_cast<firDB::firTypeBundle*>(type_l), dynamic_cast<firDB::firTypeBundle*>(type_r))) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferPost::transferPartialConnectVectorValidif(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    unsigned int size_l = type_l->depth();
    unsigned int size_r = type_r->depth();
    unsigned int size = std::min(size_l, size_r);
    for (unsigned int i = 0; i < size; i++) {
      firDB::firType* type_data_l = type_l->type_data();
      firDB::firType* type_data_r = type_r->type_data();
      std::string new_tail_id = tail_id + opt.hyphen() + std::to_string(i);
      if (!transferValidifPartialConnectByType(new_tail_id, exp_l, validif, type_data_l, type_data_r)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferPost::transferPartialConnectBundleValidif(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r) {
    fs_assert(exp_l != NULL);
    fs_assert(validif != NULL);
    fs_assert(type_l != NULL);
    fs_assert(type_r != NULL);
    std::vector<firDB::firField*>& type_datas_l = type_l->type_datas();
    std::vector<firDB::firField*>& type_datas_r = type_r->type_datas();
    std::map<std::string, firDB::firType*> id_type_data_map;
    for (size_t i = 0; i < type_datas_l.size(); i++) {
      id_type_data_map.insert(std::make_pair(type_datas_l[i]->field_id(), type_datas_l[i]->type_data()));
    }
    for (size_t i = 0; i < type_datas_r.size(); i++) {
      auto iter = id_type_data_map.find(type_datas_r[i]->field_id());
      if (iter != id_type_data_map.end()) {
        firDB::firType* new_type_r = type_datas_r[i]->type_data();
        firDB::firType* new_type_l = iter->second;
        std::string new_tail_id = tail_id + opt.hyphen() + iter->first;
        if (!transferValidifPartialConnectByType(new_tail_id, exp_l, validif, new_type_l, new_type_r)) {
          fs_assert(0);
          return false;
        }
      }
    }
    id_type_data_map.clear();
    return true;
  }
  bool TransferPost::transferItemAttachToPost(firDB::firItemAttach* item_attach) {
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    std::vector<firDB::firExp*> nets = item_attach->nets();
    fs_assert(nets.size() > 1);
    firDB::firExp* golden_exp = nets[0];
    if (!golden_exp->isIdExpression()) {
      fs_error("*ERROR*: The type of expression '%s' for Attach was invalid.\n", golden_exp->toString().c_str());
      return false;
    }
    firDB::firType* golden_type = golden_exp->getTypeData(module, cur_cond());
    fs_assert(golden_type->isAnalogType());
    fs_assert(dynamic_cast<firDB::firTypeAnalog*>(golden_type)->valid_width());
    unsigned int golden_width = dynamic_cast<firDB::firTypeAnalog*>(golden_type)->width();
    firDB::firExp* golden_rexp = NULL;
    std::string golden_refid;
    if (!transferIdExpression(golden_refid, "", golden_exp)) {
      fs_assert(0);
      return false;
    }
    golden_rexp = createNewExpById(golden_refid);
    fs_assert(golden_rexp != NULL);
    firDB::firItem* golden_item = findItemExceptInstance(post_module(), golden_rexp, cur_cond());
    fs_assert(golden_item != NULL);
    if (!(golden_item->isWireItem() || golden_item->isPortItem())) {
      fs_error("*ERROR*: Using item '%s' as Analog type in Attach was invalid.\n", golden_item->toString().c_str());
      return false;
    }
    std::vector<firDB::firExp*> post_nets;
    post_nets.push_back(golden_rexp);

    for (size_t i = 1; i < nets.size(); i++) {
      firDB::firExp* attach_exp = nets[i];
      if (!attach_exp->isIdExpression()) {
        fs_error("*ERROR*: The type of expression '%s' for Attach was invalid.\n", attach_exp->toString().c_str());
        return false;
      }
      firDB::firType* attach_type = attach_exp->getTypeData(module, cur_cond());
      if (!golden_type->isCompatible(attach_type)) {
        return false;
      }
      fs_assert(dynamic_cast<firDB::firTypeAnalog*>(attach_type)->valid_width());
      fs_assert(dynamic_cast<firDB::firTypeAnalog*>(attach_type)->width() == (int)golden_width);
      firDB::firItem* attach_item = findItemExceptInstance(fir_module(), attach_exp, cur_cond());
      if (!(attach_item->isWireItem() || attach_item->isPortItem())) {
        fs_error("*ERROR*: Using item '%s' as Analog type in Attach was invalid.\n", attach_item->toString().c_str());
        fs_assert(0);
        return false;
      }
      firDB::firExp* attach_rexp = NULL;
      std::string attach_refid;
      if (!transferIdExpression(attach_refid, "", attach_exp)) {
        fs_assert(0);
        return false;
      }
      attach_rexp = createNewExpById(attach_refid);
      fs_assert(attach_rexp != NULL);
      post_nets.push_back(attach_rexp);
    }
    fs_assert(post_nets.size() == nets.size());

    firDB::firItemAttach* post_attach = post_module()->addItemAttach();
    post_module()->addStatement(post_attach);
    for (size_t i = 0; i < post_nets.size(); i++) {
      post_attach->addNet(post_nets[i]);
    }
    fs_info("*INFO*: Transferring Attach in line %d succeeded.\n", item_attach->line_begin());
    return true;
  }
  bool TransferPost::transferItemPrintfToPost(firDB::firItemPrintf* item_printf) {
    fs_assert(item_printf != NULL);
    firDB::firExp* clk_signal_exp = item_printf->clk_signal();
    firDB::firExp* con_signal_exp = item_printf->con_signal();
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firType* clk_signal_type = clk_signal_exp->getTypeData(module, cur_cond());
    firDB::firType* con_signal_type = con_signal_exp->getTypeData(module, cur_cond());
    fs_assert(clk_signal_type != NULL);
    fs_assert(con_signal_type != NULL);
    if (!clk_signal_type->isClockType()) {
      fs_error("*ERROR*: The type of clock signal '%s' was illegal. The legal type for clock signal is 'Clock'.\n", item_printf->toString().c_str());
    }
    if (!con_signal_type->isUIntType()) {
      fs_error("*ERROR*: The type of condition signal '%s' was illegal. The legal type for condition signal is 'UInt<1>'.\n", item_printf->toString().c_str());
    } else {
      firDB::firTypeUInt* ucon_signal_type = dynamic_cast<firDB::firTypeUInt*>(con_signal_type);
      if (ucon_signal_type->valid_width()) {
        int width = ucon_signal_type->width();
        if (width > 1) {
          fs_error("*ERROR*: The type of condition signal '%s' was illegal. The legal type for condition signal is 'UInt<1>'.\n", item_printf->toString().c_str());
        }
      } else {
        fs_warning("*WARNING*: The width (%d) of condition signal '%s' was invalid.\n", ucon_signal_type->invalid_width(), item_printf->toString().c_str());
      }
    }
    return true;
  }
  //bool TransferPost::transferItemInvalidateToPost(firDB::firItemInvalidate* item_invalidate, firDB::PostModule* post_module) {
  //
  //  return true;
  //}

  void TransferPost::set_cur_cond(firDB::firItemConditional* cur_cond) {
    fs_assert(fir_module() != NULL);
    std::map<firDB::firModule*, firDB::firItemConditional*>::iterator it = cur_cond_.find(fir_module());
    if (it == cur_cond_.end()) {
      cur_cond_.insert(std::make_pair(fir_module(), cur_cond));
    } else {
      it->second = cur_cond;
    }
  }

  firDB::firItemConditional* TransferPost::cur_cond() {
    fs_assert(fir_module() != NULL);
    std::map<firDB::firModule*, firDB::firItemConditional*>::iterator it = cur_cond_.find(fir_module());
    if (it == cur_cond_.end()) {
      return NULL;
    } else {
      return (it->second);
    }
  }

  bool TransferPost::pushCondition(firDB::firExp* when_condition, bool is_when_block) {
    fs_assert(fir_module() != NULL);
    std::map<firDB::firModule*, std::stack<std::pair<firDB::firExp*, bool>>>::iterator it = when_cond_stack_.find(fir_module());
    if (it == when_cond_stack_.end()) {
      std::stack<std::pair<firDB::firExp*, bool>> temp;
      temp.push(std::make_pair(when_condition, is_when_block));
      when_cond_stack_.insert(std::make_pair(fir_module(), temp));
      return true;
    } else {
      (it->second).push(std::make_pair(when_condition, is_when_block));
      return true;
    }
  }
  bool TransferPost::popCondition() {
    fs_assert(fir_module() != NULL);
    std::map<firDB::firModule*, std::stack<std::pair<firDB::firExp*, bool>>>::iterator it = when_cond_stack_.find(fir_module());
    if (it == when_cond_stack_.end()) {
      fs_error("*ERROR*: Failed to pop the condition because the condition stack was not found for module '%s'.\n", fir_module()->id());
      fs_assert(0);
      return false;
    } else {
      (it->second).pop();
      return true;
    }
  }

  bool TransferPost::isWhenBlock() {
    fs_assert(fir_module() != NULL);
    std::map<firDB::firModule*, std::stack<std::pair<firDB::firExp*, bool>>>::iterator it = when_cond_stack_.find(fir_module());
    if (it == when_cond_stack_.end()) {
      return false;
    } else {
      if ((it->second).size() == 0) {
        return false;
      } else {
        return (it->second).top().second;
      }
    }
  }
  firDB::firExp* TransferPost::getAbsoluteCondition() {
    firDB::firExp* abs_cond = NULL;
    auto iter = when_cond_stack_.find(fir_module());
    if (iter != when_cond_stack_.end()) {
      std::stack<std::pair<firDB::firExp*, bool>> cond_stack = iter->second;
      std::stack<std::pair<firDB::firExp*, bool>> cond_stack_bak;
      firDB::firItemConditional* cur_conditional = cur_cond();
      while (!cond_stack.empty()) {
        if (abs_cond == NULL) {
          abs_cond = cond_stack.top().first;
        } else {
          abs_cond = fir_module()->addExpAnd(abs_cond, cond_stack.top().first);
        }
        cond_stack_bak.push(std::make_pair(cond_stack.top().first, cond_stack.top().second));
        cond_stack.pop();
        cur_conditional = cur_conditional->parent();
      }
      while (!cond_stack_bak.empty()) {
        cond_stack.push(std::make_pair(cond_stack_bak.top().first, cond_stack_bak.top().second));
        cond_stack_bak.pop();
      }
    }
    if (abs_cond == NULL) {
      firDB::firExp* value = fir_module()->addExpUIntBits("h1", 1);
      abs_cond = value;
    }
    return abs_cond;
  }
  firDB::firExp* TransferPost::getMportMaskCondition(const std::string& item_id) {
    firDB::firExp* relative_cond = NULL;
    auto iter = when_cond_stack_.find(fir_module());
    if (iter != when_cond_stack_.end()) {
      std::stack<std::pair<firDB::firExp*, bool>> cond_stack = iter->second;
      std::stack<std::pair<firDB::firExp*, bool>> cond_stack_bak;
      firDB::firItemConditional* cur_conditional = cur_cond();
      while (!cond_stack.empty()) {
        firDB::firItem* mport_item = cur_conditional->findItemById(item_id);
        if (mport_item == NULL) {
          if (relative_cond == NULL) {
            relative_cond = cond_stack.top().first;
          } else {
            relative_cond = fir_module()->addExpAnd(relative_cond, cond_stack.top().first);
          }
          cond_stack_bak.push(std::make_pair(cond_stack.top().first, cond_stack.top().second));
          cond_stack.pop();
          cur_conditional = cur_conditional->parent();
        } else {
          if (!mport_item->isMPortItem()) {
            fs_assert(0);
            return NULL;
          }
          break;
        }
      }
      while (!cond_stack_bak.empty()) {
        cond_stack.push(std::make_pair(cond_stack_bak.top().first, cond_stack_bak.top().second));
        cond_stack_bak.pop();
      }
    }
    if (relative_cond == NULL) {
      firDB::firExp* value = fir_module()->addExpUIntBits("h1", 1);
      relative_cond = value;
    }
    return relative_cond;
  }
  firDB::firExp* TransferPost::getMportEnableCondition(const std::string& item_id) {
    firDB::firExp* relative_cond = NULL;
    auto iter = when_cond_stack_.find(fir_module());
    if (iter != when_cond_stack_.end()) {
      std::stack<std::pair<firDB::firExp*, bool>> cond_stack = iter->second;
      std::stack<std::pair<firDB::firExp*, bool>> cond_stack_bak;
      firDB::firItemConditional* cur_conditional = cur_cond();
      while (!cond_stack.empty()) {
        firDB::firItem* mport_item = cur_conditional->findItemById(item_id);
        if (mport_item == NULL) {
          if (relative_cond == NULL) {
            relative_cond = cond_stack.top().first;
          } else {
            relative_cond = fir_module()->addExpAnd(relative_cond, cond_stack.top().first);
          }
          cond_stack_bak.push(std::make_pair(cond_stack.top().first, cond_stack.top().second));
          cond_stack.pop();
          cur_conditional = cur_conditional->parent();
        } else {
          if (!mport_item->isCMemoryItem() && !mport_item->isSMemoryItem()) {
            fs_assert(0);
            return NULL;
          }
          break;
        }
      }
      while (!cond_stack_bak.empty()) {
        cond_stack.push(std::make_pair(cond_stack_bak.top().first, cond_stack_bak.top().second));
        cond_stack_bak.pop();
      }
    }
    if (relative_cond == NULL) {
      firDB::firExp* value = fir_module()->addExpUIntBits("h1", 1);
      relative_cond = value;
    }
    return relative_cond;
  }
  void TransferPost::generateMPortMaskConnect(const std::string& connect_l_id, firDB::firItemMPort* item_mport) {
    fs_assert(item_mport != NULL);
    std::string mport_id = item_mport->mport_id();
    //connect_l_id: mport.mem  memory_id: mem
    std::string mem_id = connect_l_id.substr((connect_l_id.find_first_of(instance_label()) + 1));
    firDB::firExp* mask_exp = getMportMaskCondition(mport_id);
    fs_assert(mask_exp != NULL);
    firDB::firExpRef* mem_id_ref = post_module()->addExpRef(mem_id);
    firDB::firExpSubfield* mem_name = post_module()->addExpSubfield(mem_id_ref, mport_id);
    std::string mask_id = firDB::firItemMemory::getMemPortId(item_mport->dir(), firDB::MemPortType::kMemPortMask);
    firDB::firExpSubfield* mem_port_mask = post_module()->addExpSubfield(mem_name, mask_id);
    firDB::firExp* post_mask_exp = transferNestExpression(mask_exp, false);
    firDB::firItemConnect* mask_connect = post_module()->addItemConnect(mem_port_mask, post_mask_exp);
    post_module()->addStatement(mask_connect);
  }
  bool TransferPost::transferItemConditionalToPost(firDB::firItemConditional* item_conditional) {
    fs_assert(item_conditional != NULL);
    set_cur_cond(item_conditional);
    if (!transferConditionalItem(item_conditional)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Conditional Statement beginning from line %d succeeded.\n", item_conditional->line_begin());
    return true;
  }
  firDB::firExp* TransferPost::findUpLevelConnectRightExp(const std::string& left_exp_id, firDB::firLocObj* item_conditional) {
    firDB::firExp* rexp = NULL;
    firDB::firItemConditional* cur_conditional = dynamic_cast<firDB::firItemConditional*>(item_conditional);
    while (cur_conditional != NULL) {
      auto iter = cond_connect_exps_map_.find(cur_conditional);
      if (iter != cond_connect_exps_map_.end()) {
        std::map<std::string, Connect>::iterator connect_exps_map = iter->second.find(left_exp_id);
        if (connect_exps_map != iter->second.end()) {
          return connect_exps_map->second.right;
        }
      }
      cur_conditional = cur_conditional->parent();
    }
    auto iter = cond_connect_exps_map_.find(fir_module());
    if (iter != cond_connect_exps_map_.end()) {
      std::map<std::string, Connect>::iterator connect_exps_map = iter->second.find(left_exp_id);
      if (connect_exps_map != iter->second.end()) {
        return connect_exps_map->second.right;
      }
    }
    return rexp;
  }
  bool TransferPost::transferConditionalItem(firDB::firItemConditional* item_conditional) {
    fs_assert(item_conditional != NULL);
    std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>> cur_level_connect_exps_map;
    if (!transferWhenAndElseItem(item_conditional, cur_level_connect_exps_map)) {
      fs_assert(0);
      return false;
    }
    mergeConditionalConnect(item_conditional, cur_level_connect_exps_map);
    set_cur_cond(item_conditional->parent());
    return true;
  }
  void TransferPost::mergeConditionalConnect(firDB::firItemConditional* item_conditional, std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>& connect_exps_map) {
    fs_assert(item_conditional != NULL);
    if (!connect_exps_map.empty()) {
      firDB::firExp* sel = item_conditional->when_exp();
      firDB::firExp* post_sel = transferNestExpression(sel, true);
      for (auto iter = connect_exps_map.begin(); iter != connect_exps_map.end(); iter++) {
        std::string left_exp_id = iter->first;
        firDB::firExp* left_exp = std::get<0>(iter->second);
        firDB::firExp* when_right_exp = std::get<1>(iter->second);
        firDB::firExp* else_right_exp = std::get<2>(iter->second);
        if (when_right_exp == NULL) {
          when_right_exp = findUpLevelConnectRightExp(left_exp_id, cur_cond()->parent());
          if (when_right_exp == NULL) {
            firDB::firItem* item = findItemExceptInstance(post_module(), left_exp, cur_cond());
            fs_assert(item != NULL);
            if (!item->isRegisterItem()) when_right_exp = NULL;
            else {
              fs_assert(left_exp->isSubfieldExpression());
              firDB::firExpSubfield* subfield_exp = dynamic_cast<firDB::firExpSubfield*>(left_exp);
              std::string reg_d_id = dynamic_cast<firDB::firItemRegister*>(item)->getPortDId();
              std::string reg_q_id = dynamic_cast<firDB::firItemRegister*>(item)->getPortQId();
              fs_assert(subfield_exp->id() == reg_d_id);
              firDB::firExp* reg_ref = subfield_exp->exp();
              firDB::firExp* post_q_exp = post_module()->copyExpression(reg_ref);
              when_right_exp = post_module()->addExpSubfield(post_q_exp, reg_q_id);
            }
          }
        }
        if (else_right_exp == NULL) {
          else_right_exp = findUpLevelConnectRightExp(left_exp_id, cur_cond()->parent());
          if (else_right_exp == NULL) {
            firDB::firItem* item = findItemExceptInstance(post_module(), left_exp, cur_cond());
            fs_assert(item != NULL);
            if (!item->isRegisterItem()) else_right_exp = NULL;
            else {
              fs_assert(left_exp->isSubfieldExpression());
              firDB::firExpSubfield* subfield_exp = dynamic_cast<firDB::firExpSubfield*>(left_exp);
              std::string reg_d_id = dynamic_cast<firDB::firItemRegister*>(item)->getPortDId();
              std::string reg_q_id = dynamic_cast<firDB::firItemRegister*>(item)->getPortQId();
              fs_assert(subfield_exp->id() == reg_d_id);
              firDB::firExp* reg_ref = subfield_exp->exp();
              firDB::firExp* post_q_exp = post_module()->copyExpression(reg_ref);
              else_right_exp = post_module()->addExpSubfield(post_q_exp, reg_q_id);
            }
          }
        }
        if (when_right_exp != NULL && when_right_exp->isOperationExpression()) {
          firDB::firItemNode* gen_node = post_module()->addItemNode(getAddNodeId(), when_right_exp);
          post_module()->addStatement(gen_node);
          when_right_exp = post_module()->addExpRef(gen_node->id());
        }
        if (else_right_exp != NULL && else_right_exp->isOperationExpression()) {
          firDB::firItemNode* gen_node = post_module()->addItemNode(getAddNodeId(), else_right_exp);
          post_module()->addStatement(gen_node);
          else_right_exp = post_module()->addExpRef(gen_node->id());
        }
        firDB::firExp* gen_right_exp = NULL;
        fs_assert(!(when_right_exp == NULL && else_right_exp == NULL));
        if (when_right_exp == NULL) {
          firDB::firExp* not_sel = post_module()->addExpNot(post_sel);
          firDB::firItemNode* not_node = post_module()->addItemNode(getAddNodeId(), not_sel);
          post_module()->addStatement(not_node);
          firDB::firExp* sel_ref = post_module()->addExpRef(not_node->id());
          gen_right_exp = post_module()->addExpValidif(sel_ref, else_right_exp);
        } else if (else_right_exp == NULL) {
          gen_right_exp = post_module()->addExpValidif(post_sel, when_right_exp);
        } else {
          if (when_right_exp->isSameExpression(else_right_exp)) {
            gen_right_exp = when_right_exp;
          } else {
            firDB::firExpMux* mux = post_module()->addExpMux(post_sel, when_right_exp, else_right_exp);
            firDB::firExp* mux_value = mux->inferExpVal(post_module(), cur_cond());
            if (mux_value != NULL) {
              gen_right_exp = mux_value;
            } else {
              gen_right_exp = mux;
            }
          }
        }
        firDB::firLocObj* map_condition = item_conditional->parent();
        if (map_condition == NULL) map_condition = fir_module();
        mapConnectExpsInCurConditional(map_condition, left_exp_id, left_exp, gen_right_exp);
      }
    }
    eraseConditionalConnectMap(item_conditional);
    connect_exps_map.clear();
    if (item_conditional->else_cond() != NULL) {
      eraseConditionalConnectMap(item_conditional->else_cond());
    }
  }
  bool TransferPost::transferWhenAndElseItem(firDB::firItemConditional* item_conditional, std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>& connect_exps_map) {
    set_cur_cond(item_conditional);
    firDB::firExp* when_condition = item_conditional->when_exp();
    if (when_condition != NULL) {
      firDB::firType* when_cond_type = when_condition->getTypeData(fir_module(), cur_cond());
      fs_assert(when_cond_type != NULL);
      if (!when_cond_type->isUIntType()) {
        unsigned int begin_line = when_condition->line_begin();
        unsigned int file_id = when_condition->file_id();
        std::string file_name = this->library()->findFileById((int)file_id);
        fs_error("*ERROR*: The type of the when condition expression was not UInt at: %s %u.\n", file_name.c_str(), begin_line);
      }
      pushCondition(when_condition, true);
    } else {
      when_condition = fir_module()->addExpNot(when_condition);
      pushCondition(when_condition, false);
    }
    std::vector<firDB::firItem*>& when_statements = item_conditional->when_statements();
    if (when_statements.size() == 0) {
      fs_warning("*WARNING*: No statements were specified under the '%s' conditional item.\n", isWhenBlock() ? "when" : "else");
    }
    for (size_t i = 0; i < when_statements.size(); i++) {
      firDB::firItem* statement = when_statements[i];
      switch (statement->type()) {
      case firDB::ItemType::kItemNode:
        if (!transferItemNodeToPost(dynamic_cast<firDB::firItemNode*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemWire:
        if (!transferItemWireToPost(dynamic_cast<firDB::firItemWire*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemRegister:
        if (!transferItemRegisterToPost(dynamic_cast<firDB::firItemRegister*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemConnect:
        if (!transferConditionalConnectToPost(dynamic_cast<firDB::firItemConnect*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemPartialConnect:
        if (!transferConditionalPartialConnectToPost(dynamic_cast<firDB::firItemPartialConnect*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemAttach:
        fs_assert(0);
        break;  // Need attach transfer
      case firDB::ItemType::kItemConditional:
        // when under when
        if (!transferConditionalItem(dynamic_cast<firDB::firItemConditional*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemMPort:
        if (!transferConditionalMPortToPost(dynamic_cast<firDB::firItemMPort*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemMemory:
        if (!transferItemMemoryToPost(dynamic_cast<firDB::firItemMemory*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemCMemory:
        if (!transferItemCMemoryToPost(dynamic_cast<firDB::firItemCMemory*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemSMemory:
        if (!transferItemSMemoryToPost(dynamic_cast<firDB::firItemSMemory*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemInstance:
        if (!transferItemInstanceToPost(dynamic_cast<firDB::firItemInstance*>(statement))) {
          fs_assert(0);
          return false;
        }
        break;
      case firDB::ItemType::kItemInvalidate:
        //fs_assert(0);
        break;
      case firDB::ItemType::kItemPrintf:
        // need printf
        break;
      case firDB::ItemType::kItemStop:
        // need stop
        break;
      case firDB::ItemType::kItemEmpty:
        // end of when block or else block
        break;
      default:
        fs_assert(0);
        return false;
      }
    }
    mapToConnectExpsMap(connect_exps_map);
    if (item_conditional->else_cond() != NULL) {
      if (!transferWhenAndElseItem(item_conditional->else_cond(), connect_exps_map)) {
        fs_assert(0);
        return false;
      }
    }
    popCondition();
    set_cur_cond(item_conditional);
    return true;
  }
  void TransferPost::mapToConnectExpsMap(std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>& connect_exps_map) {
    auto it = cond_connect_exps_map_.find(cur_cond());
    if (it == cond_connect_exps_map_.end()) return;
    if (!it->second.empty()) {
      for (auto iter = it->second.begin(); iter != it->second.end(); iter++) {
        std::string left_exp_id = iter->first;
        Connect exps = iter->second;
        firDB::firExp* left_exp = exps.left;
        firDB::firExp* right_exp = exps.right;
        std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>::iterator connect_exps_tuple = connect_exps_map.find(left_exp_id);
        if (connect_exps_tuple != connect_exps_map.end()) {
          std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*> exps = connect_exps_tuple->second;
          firDB::firExp* when_right_exp = std::get<1>(exps);
          firDB::firExp* else_right_exp = std::get<0>(exps);
          if (isWhenBlock()) {
            connect_exps_map.erase(left_exp_id);
            connect_exps_map.insert(std::make_pair(left_exp_id, std::make_tuple(left_exp, right_exp, else_right_exp)));
          } else {
            connect_exps_map.erase(left_exp_id);
            connect_exps_map.insert(std::make_pair(left_exp_id, std::make_tuple(left_exp, when_right_exp, right_exp)));
          }
        } else {
          if (isWhenBlock()) {
            firDB::firExp* else_exp = NULL;
            connect_exps_map.insert(std::make_pair(left_exp_id, std::make_tuple(left_exp, right_exp, else_exp)));
          } else {
            firDB::firExp* when_exp = NULL;
            connect_exps_map.insert(std::make_pair(left_exp_id, std::make_tuple(left_exp, when_exp, right_exp)));
          }
        }
      }
    }
  }
  void TransferPost::mapConnectExpsInCurConditional(firDB::firLocObj* item_conditional, const std::string& left_exp_id, firDB::firExp* left_exp, firDB::firExp* right_exp) {
    fs_assert(left_exp != NULL);
    fs_assert(right_exp != NULL);
    Connect connect_exps(left_exp, right_exp);
    auto iter = cond_connect_exps_map_.find(item_conditional);
    if (iter != cond_connect_exps_map_.end()) {
      std::map<std::string, Connect>::iterator connect_exps_map = iter->second.find(left_exp_id);
      if (connect_exps_map != iter->second.end()) {
        iter->second.erase(connect_exps_map);
        iter->second.insert(std::make_pair(left_exp_id, connect_exps));
      } else {
        iter->second.insert(std::make_pair(left_exp_id, connect_exps));
      }
    } else {
      std::map<std::string, Connect> connect_exps_map;
      connect_exps_map.insert(std::make_pair(left_exp_id, connect_exps));
      cond_connect_exps_map_.insert(std::make_pair(item_conditional, connect_exps_map));
    }
  }
  void TransferPost::eraseConditionalConnectMap(firDB::firLocObj* item_conditional) {
    fs_assert(item_conditional != NULL);
    auto iter = cond_connect_exps_map_.find(item_conditional);
    if (iter != cond_connect_exps_map_.end()) {
      cond_connect_exps_map_.erase(iter);
    }
  }
  bool TransferPost::transferConditionalConnectToPost(firDB::firItemConnect* item_connect) {
    fs_assert(item_connect != NULL);
    fs_assert(item_connect->connect_l() != NULL);
    fs_assert(item_connect->connect_r() != NULL);
    fs_assert(item_connect->connect_l()->isIdExpression());
    firDB::firExp* left_exp = item_connect->connect_l();
    firDB::firExp* right_exp = item_connect->connect_r();
    firDB::firType* left_type = left_exp->getTypeData(fir_module(), cur_cond());
    firDB::firType* right_type = right_exp->getTypeData(fir_module(), cur_cond());
    fs_assert(left_type != NULL);
    fs_assert(right_type != NULL);
    if (!transferItemConnectToPost(item_connect)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Conditional Connect in line %d succeeded.\n", item_connect->line_begin());
    return true;
  }
  bool TransferPost::transferConditionalPartialConnectToPost(firDB::firItemPartialConnect* item_partial_connect) {
    fs_assert(item_partial_connect != NULL);
    fs_assert(item_partial_connect->connect_l() != NULL);
    fs_assert(item_partial_connect->connect_r() != NULL);
    fs_assert(item_partial_connect->connect_l()->isIdExpression());
    if (!transferItemPartialConnectToPost(item_partial_connect)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Conditional Partial Connect in line %d succeeded.\n", item_partial_connect->line_begin());
    return true;
  }
  bool TransferPost::transferConditionalMPortToPost(firDB::firItemMPort* item_mport) {
    fs_assert(item_mport != NULL);
    firDB::firModule* module = fir_module();
    fs_assert(module != NULL);
    firDB::firExp* valid_exp = getAbsoluteCondition();
    firDB::firExp* valid_rexp = NULL;
    fs_assert(valid_exp != NULL);
    if (valid_exp->isIdExpression()) {
      firDB::firItem* valid_item = findItemExceptInstance(module, valid_exp, cur_cond());
      if (!(valid_item->isPortItem() || valid_item->isWireItem() || valid_item->isRegisterItem() || valid_item->isNodeItem())) {
        fs_error("*ERROR*: Using item '%s' as condition was invalid.\n", valid_item->toString().c_str());
        return false;
      }
      std::string valid_refid;
      if (!transferIdExpression(valid_refid, "", valid_exp)) {
        fs_assert(0);
        return false;
      }
      valid_rexp = createNewExpById(valid_refid);
      fs_assert(valid_rexp != NULL);
      firDB::firItem* item_valid = findItemExceptInstance(post_module(), valid_rexp, cur_cond());
      fs_assert(item_valid != NULL);
      if (item_valid->isRegisterItem()) {
        std::string read_id = dynamic_cast<firDB::firItemRegister*>(item_valid)->getPortQId();
        firDB::firExpSubfield* valid_q = post_module()->addExpSubfield(valid_rexp, read_id);
        valid_rexp = valid_q;
      }
    } else if (valid_exp->isUIntNumberExpression()) {
      valid_rexp = post_module()->copyExpression(valid_exp);
    } else if (valid_exp->isPrimOperationExpression()) {
      valid_rexp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(valid_exp), true);
    } else {
      fs_error("*ERROR*: The expression for condition '%s' was incorrect.\n", valid_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    fs_assert(valid_rexp != NULL);
    //direction check, mem id check
    firDB::MPortDir dir = item_mport->dir();
    fs_assert(dir != firDB::MPortDir::kMPortDirUndef && dir != firDB::MPortDir::kMPortDirInfer);
    std::string mport_id = item_mport->mport_id();
    std::string mem_id = item_mport->mem_id();
    firDB::firExp* enable_exp = getMportEnableCondition(mem_id);
    firDB::firType* enable_exp_type = enable_exp->getTypeData(fir_module(), cur_cond());
    fs_assert(enable_exp_type != NULL);
    firDB::firExp* post_enable_exp = transferNestExpression(enable_exp, false);
    fs_assert(enable_exp != NULL);
    //address check(type + item)
    firDB::firExp* addr_exp = item_mport->addr_exp();
    fs_assert(addr_exp != NULL);
    firDB::firExp* addr_rexp = NULL;
    if (addr_exp->isIdExpression()) {
      firDB::firItem* addr_item = findItemExceptInstance(module, addr_exp, cur_cond());
      if (!(addr_item->isPortItem() || addr_item->isWireItem() || addr_item->isRegisterItem() || addr_item->isNodeItem())) {
        fs_error("*ERROR*: Using item '%s' as address was invalid.\n", addr_item->toString().c_str());
        return false;
      }
      std::string addr_refid;
      if (!transferIdExpression(addr_refid, "", addr_exp)) {
        fs_assert(0);
        return false;
      }
      addr_rexp = createNewExpById(addr_refid);
      fs_assert(addr_rexp != NULL);
      firDB::firItem* item_addr = findItemExceptInstance(post_module(), addr_rexp, cur_cond());
      fs_assert(item_addr != NULL);
      if (item_addr->isRegisterItem()) {
        std::string read_id = dynamic_cast<firDB::firItemRegister*>(item_addr)->getPortQId();
        firDB::firExpSubfield* addr_q = post_module()->addExpSubfield(addr_rexp, read_id);
        addr_rexp = addr_q;
      }
    } else if (addr_exp->isUIntNumberExpression()) {
      addr_rexp = post_module()->copyExpression(addr_exp);
    } else {
      fs_error("*ERROR*: The item-definition for address '%s' was incorrect.\n", addr_exp->toString().c_str());
      return false;
    }
    fs_assert(addr_rexp != NULL);
    firDB::firExpValidif* addr_validif = post_module()->addExpValidif(valid_rexp, addr_rexp);
    //clock check(type + item)
    firDB::firExp* clk_exp = item_mport->clk_exp();
    fs_assert(clk_exp != NULL);
    firDB::firType* clock_type = clk_exp->getTypeData(module, cur_cond());
    if (clock_type == NULL) {
      fs_assert(0);
    } else if (!clock_type->isClockType()) {
      fs_error("*ERROR*: The type of clock '%s' was illegal. The legal type for clock is 'Clock'.\n", clk_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firExp* clk_rexp = NULL;
    if (clk_exp->isIdExpression()) {
      firDB::firItem* clock_item = module->findItemByExpression(clk_exp, cur_cond());
      if (clock_item->isWireItem() || clock_item->isPortItem() || clock_item->isNodeItem()) {
        std::string clk_refid;
        if (!transferIdExpression(clk_refid, "", clk_exp)) {
          fs_assert(0);
          return false;
        }
        clk_rexp = createNewExpById(clk_refid);
      } else if (clock_item == NULL) {
        fs_error("*ERROR*: Could not find the matching item for clock signal '%s'.\n", clk_exp->toString().c_str());
        fs_assert(0);
        return false;
      } else {
        fs_error("*ERROR*: The item-definition for clock signal '%s' was incorrect.\n", clk_exp->toString().c_str());
        fs_assert(0);
        return false;
      }
    } else if (clk_exp->isPrimOperationExpression()) {
      clk_rexp = transferPrimOperation(dynamic_cast<firDB::firExpPrimOperation*>(clk_exp), false);
    } else {
      fs_error("*ERROR*: The expression for clock signal '%s' was incorrect.\n", clk_exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    fs_assert(clk_rexp != NULL);
    firDB::firExpValidif* clk_validif = post_module()->addExpValidif(valid_rexp, clk_rexp);

    firDB::firExp* en_exp = NULL;
    std::string value = "h1";
    if (item_mport->dir() == firDB::MPortDir::kMPortDirWrite) {
      en_exp = post_enable_exp;
    } else if (item_mport->dir() == firDB::MPortDir::kMPortDirRdwr) {
      en_exp = post_enable_exp;
    } else if (item_mport->dir() == firDB::MPortDir::kMPortDirRead) {
      en_exp = post_enable_exp;
    } else {
      fs_error("*ERROR*: The type of MPort '%s' was unspecified. Its type should be specified or inferred as read, write, or readwrite.\n", item_mport->mport_id().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firType* mport_type = module->getItemType(item_mport, cur_cond());
    fs_assert(mport_type != NULL);
    if (!transferTypeToPostWhenMPort(mem_id, item_mport, mport_type, addr_validif, en_exp, clk_validif)) {
      fs_assert(0);
      return false;
    }
    fs_info("*INFO*: Transferring Conditional Mport '%s' succeeded.\n", mport_id.c_str());
    return true;
  }

//  bool TransferPost::transferItemStopToPost(firDB::firItemStop* item_stop, firDB::PostModule* post_module) {
//
//    return true;
//  }
//  bool TransferPost::transferItemEmptyToPost(firDB::firItemEmpty* item_empty, firDB::PostModule* post_module) {
//
//    return true;
//  }
//  bool TransferPost::transferItemStatementGroupToPost(firDB::firItemStatementGroup* item_statementgroup, firDB::PostModule* post_module) {
//
//    return true;
//  }
}
