//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "db/fir_circuit.h"

namespace firrtlsyn {

  firDB::firCircuit::firCircuit(const std::string& id, firLibrary* library) {
    id_ = id;
    top_module_ = NULL;
    library_ = library;
    info_ = firInfo();
  }
  firDB::firCircuit::~firCircuit() {
    for (size_t i = 0; i < modules_.size(); i++) {
      if (modules_[i]) delete modules_[i];
      modules_[i] = NULL;
    }
    modules_.clear();
    id_module_map_.clear();
    top_module_ = NULL;
  }
  firDB::firModule* firDB::firCircuit::findModuleById(const std::string& module_id) {
    auto iter = id_module_map_.find(module_id);
    if (iter != id_module_map_.end()) {
      return iter->second;
    } else {
      return NULL;
    }
  }
  firDB::firModule* firDB::firCircuit::addModule(ModuleType type, const std::string& id) {
    auto iter = id_module_map_.find(id);
    if (iter != id_module_map_.end()) {
      return iter->second;
    } else {
      firModule* module = new firModule(type, id, this);
      modules_.push_back(module);
      id_module_map_.insert(std::make_pair(module->id(), module));
      if (top_module_ == NULL && module->id() == id_) {
        top_module_ = module;
      }
      return module;
    }
  }
}