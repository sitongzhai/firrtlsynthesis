//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "db/fir_item.h"
#include "db/fir_module.h"
#include "db/fir_circuit.h"

namespace firrtlsyn {
  const std::vector<std::string> firDB::firItemRegister::register_ports = { "d", "q", "clk" };
  const std::map<firDB::MPortDir, std::vector<std::string>> firDB::firItemMemory::mem_ports = {
    { MPortDir::kMPortDirRead, { "data", "addr", "en", "clk" } },
    { MPortDir::kMPortDirWrite, { "data", "mask", "addr", "en", "clk" } },
    { MPortDir::kMPortDirRdwr, { "wmode", "wdata", "rdata", "wmask", "addr", "en", "clk" } },
    { MPortDir::kMPortDirInfer, {} },
    { MPortDir::kMPortDirUndef, {} }
  };
  bool firDB::firItemPort::evaluatePassive(firType* type_data, PortDir type_data_dir, bool type_flip) {
    if (type_data->isGroundType()) {
      type_flip_passive_dir_.insert(std::make_pair(type_data, std::make_tuple(type_flip, true, type_data_dir)));
      return true;
    } else if (type_data->isVectorType()) {
      firTypeVector* vector_data = dynamic_cast<firTypeVector*>(type_data);
      bool passive = evaluatePassive(vector_data->type_data(), type_data_dir, false);
      type_flip_passive_dir_.insert(std::make_pair(vector_data, std::make_tuple(type_flip, passive, type_data_dir)));
      return passive;
    } else if (type_data->isBundleType()) {
      firTypeBundle* bundle_data = dynamic_cast<firTypeBundle*>(type_data);
      std::vector<firField*>& type_datas = bundle_data->type_datas();
      bool result = true;
      for (size_t i = 0; i < type_datas.size(); i++) {
        firField* type_data = type_datas[i];
        firType* bundle_type_data = type_data->type_data();
        bool flip = type_data->flip();
        PortDir dir = flipDirection(type_data_dir, flip);
        bool passive = evaluatePassive(bundle_type_data, dir, type_data->flip());
        auto begin_iter = type_flip_passive_dir_.find(type_datas[0]->type_data());
        fs_assert(begin_iter != type_flip_passive_dir_.end());
        if (!passive || dir != std::get<2>(begin_iter->second)) {
          result = false;
        }
      }
      type_flip_passive_dir_.insert(std::make_pair(bundle_data, std::make_tuple(type_flip, result, type_data_dir)));
      return result;
    } else {
      fs_assert(0);
      return false;
    }
  }
  firDB::PortDir firDB::firItemPort::flipDirection(PortDir dir, bool& flip) {
    PortDir rdir = dir;
    if (flip) {
      if (dir == PortDir::kPortDirInput) {
        rdir = PortDir::kPortDirOutput;
      } else if (dir == PortDir::kPortDirOutput) {
        rdir = PortDir::kPortDirInput;
      } else {
        fs_assert(0);
      }
    }
    return rdir;
  }
  firDB::firItem* firDB::firItemConditional::findItemById(const std::string& id) {
    auto iter = id_items_map_.find(id);
    if (iter == id_items_map_.end()) {
      return NULL;
    } else {
      return iter->second;
    }
  }
  firDB::firItem* firDB::firItemConditional::findMPortInStmts(const std::string& item_id) {
    for (size_t s = 0; s < when_statements_.size(); s++) {
      if (!when_statements_[s]->isConditionalItem()) continue;
      firItem* mport = dynamic_cast<firItemConditional*>(when_statements_[s])->findItemById(item_id);
      if (mport == NULL) continue;
      if (mport->isMPortItem()) {
        return mport;
      } else {
        //item must be mport, if others, return NULL
        return NULL;
      }
      //fs_assert(mport->isMPortItem());
      //return mport;
    }
    return NULL;
  }
  void firDB::firItemConditional::addStatement(firItem* statement) {
    //FIXME: should use module->findItemExceptMPort for same id check, but cannot get module pointer now
    switch (statement->type()) {
    case ItemType::kItemWire: {
      firItemWire* wire = dynamic_cast<firItemWire*>(statement);
      fs_assert(findItemById(wire->id()) == NULL);
      fs_assert(wire->type_data() != NULL);
      id_items_map_.insert(std::make_pair(wire->id(), wire));
      break;
    }
    case ItemType::kItemNode: {
      firItemNode* node = dynamic_cast<firItemNode*>(statement);
      fs_assert(findItemById(node->id()) == NULL);
      id_items_map_.insert(std::make_pair(node->id(), node));
      break;
    }
    case ItemType::kItemInstance: {
      firItemInstance* instance = dynamic_cast<firItemInstance*>(statement);
      fs_assert(findItemById(instance->inst_id()) == NULL);
      id_items_map_.insert(std::make_pair(instance->inst_id(), instance));
      break;
    }
    case ItemType::kItemRegister: {
      firItemRegister* reg = dynamic_cast<firItemRegister*>(statement);
      fs_assert(findItemById(reg->id()) == NULL);
      id_items_map_.insert(std::make_pair(reg->id(), reg));
      break;
    }
    case ItemType::kItemMemory: {
      firItemMemory* mem = dynamic_cast<firItemMemory*>(statement);
      fs_assert(findItemById(mem->id()) == NULL);
      id_items_map_.insert(std::make_pair(mem->id(), mem));
      break;
    }
    case ItemType::kItemCMemory: {
      firItemCMemory* cmem = dynamic_cast<firItemCMemory*>(statement);
      fs_assert(findItemById(cmem->id()) == NULL);
      id_items_map_.insert(std::make_pair(cmem->id(), cmem));
      break;
    }
    case ItemType::kItemSMemory: {
      firItemSMemory* smem = dynamic_cast<firItemSMemory*>(statement);
      fs_assert(findItemById(smem->id()) == NULL);
      id_items_map_.insert(std::make_pair(smem->id(), smem));
      break;
    }
    case ItemType::kItemMPort: {
      firItemMPort* mport = dynamic_cast<firItemMPort*>(statement);
      fs_assert(findItemById(mport->mport_id()) == NULL);
      id_items_map_.insert(std::make_pair(mport->mport_id(), mport));
      break;
    }
    case ItemType::kItemConditional: {
      firItemConditional* cond = dynamic_cast<firItemConditional*>(statement);
      cond->set_parent(this);
      break;
    }
    default: {
      break;
    }
    }
    when_statements_.push_back(statement);
  }
  firDB::firItemPort* firDB::firItemInstance::getPortByExpression(firCircuit* circuit, firExp* exp) {
    if (exp == NULL) return NULL;
    if (circuit == NULL) return NULL;
    firModule* inst_module = circuit->findModuleById(this->module_id());
    if (inst_module == NULL) return NULL;
    std::list<firExp*> exp_list = exp->generateExpPositiveSequence();
    if (exp_list.empty()) return NULL;
    firExpRef* head_exp = dynamic_cast<firExpRef*>(exp_list.front());
    if (head_exp == NULL || head_exp->id() != this->inst_id()) return NULL;
    exp_list.pop_front();
    firExpSubfield* port_exp = dynamic_cast<firExpSubfield*>(exp_list.front());
    if (port_exp == NULL) return NULL;
    firItem* inst_port = inst_module->findItemById(port_exp->id(), NULL);
    return dynamic_cast<firItemPort*>(inst_port);
  }
  std::string firDB::firItemMemory::getMemPortId(MPortDir mport_dir, MemPortType port_type) {
    if (mport_dir == MPortDir::kMPortDirRead) {
      if (port_type == MemPortType::kMemPortData) {
        return mem_ports.find(mport_dir)->second[0];
      } else if (port_type == MemPortType::kMemPortAddr) {
        return mem_ports.find(mport_dir)->second[1];
      } else if (port_type == MemPortType::kMemPortEn) {
        return mem_ports.find(mport_dir)->second[2];
      } else if (port_type == MemPortType::kMemPortClk) {
        return mem_ports.find(mport_dir)->second[3];
      }
    } else if (mport_dir == MPortDir::kMPortDirWrite) {
      if (port_type == MemPortType::kMemPortData) {
        return mem_ports.find(mport_dir)->second[0];
      } else if (port_type == MemPortType::kMemPortMask) {
        return mem_ports.find(mport_dir)->second[1];
      } else if (port_type == MemPortType::kMemPortAddr) {
        return mem_ports.find(mport_dir)->second[2];
      } else if (port_type == MemPortType::kMemPortEn) {
        return mem_ports.find(mport_dir)->second[3];
      } else if (port_type == MemPortType::kMemPortClk) {
        return mem_ports.find(mport_dir)->second[4];
      }
    } else if (mport_dir == MPortDir::kMPortDirRdwr) {
      if (port_type == MemPortType::kMemPortWMode) {
        return mem_ports.find(mport_dir)->second[0];
      } else if (port_type == MemPortType::kMemPortWData) {
        return mem_ports.find(mport_dir)->second[1];
      } else if (port_type == MemPortType::kMemPortRData) {
        return mem_ports.find(mport_dir)->second[2];
      } else if (port_type == MemPortType::kMemPortWMask) {
        return mem_ports.find(mport_dir)->second[3];
      } else if (port_type == MemPortType::kMemPortAddr) {
        return mem_ports.find(mport_dir)->second[4];
      } else if (port_type == MemPortType::kMemPortEn) {
        return mem_ports.find(mport_dir)->second[5];
      } else if (port_type == MemPortType::kMemPortClk) {
        return mem_ports.find(mport_dir)->second[6];
      }
    }
    return "";
  }
  firDB::MemPortType firDB::firItemMemory::getMemPortTypeById(MPortDir mport_dir, const std::string& port_id) {
    if (mport_dir == MPortDir::kMPortDirRead) {
      std::vector<std::string> read_ports = mem_ports.find(mport_dir)->second;
      if (port_id == read_ports[0]) {
        return MemPortType::kMemPortData;
      } else if (port_id == read_ports[1]) {
        return MemPortType::kMemPortAddr;
      } else if (port_id == read_ports[2]) {
        return MemPortType::kMemPortEn;
      } else if (port_id == read_ports[3]) {
        return MemPortType::kMemPortClk;
      }
    } else if (mport_dir == MPortDir::kMPortDirWrite) {
      std::vector<std::string> write_ports = mem_ports.find(mport_dir)->second;
      if (port_id == write_ports[0]) {
        return MemPortType::kMemPortData;
      } else if (port_id == write_ports[1]) {
        return MemPortType::kMemPortMask;
      } else if (port_id == write_ports[2]) {
        return MemPortType::kMemPortAddr;
      } else if (port_id == write_ports[3]) {
        return MemPortType::kMemPortEn;
      } else if (port_id == write_ports[4]) {
        return MemPortType::kMemPortClk;
      }
    } else if (mport_dir == MPortDir::kMPortDirRdwr) {
      std::vector<std::string> readwrite_ports = mem_ports.find(mport_dir)->second;
      if (port_id == readwrite_ports[0]) {
        return MemPortType::kMemPortWMode;
      } else if (port_id == readwrite_ports[1]) {
        return MemPortType::kMemPortWData;
      } else if (port_id == readwrite_ports[2]) {
        return MemPortType::kMemPortRData;
      } else if (port_id == readwrite_ports[3]) {
        return MemPortType::kMemPortWMask;
      } else if (port_id == readwrite_ports[4]) {
        return MemPortType::kMemPortAddr;
      } else if (port_id == readwrite_ports[5]) {
        return MemPortType::kMemPortEn;
      } else if (port_id == readwrite_ports[6]) {
        return MemPortType::kMemPortClk;
      }
    }
    return MemPortType::kMemPortUndef;
  }
}