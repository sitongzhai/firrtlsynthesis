//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************
#include "db/fir_db.h"
#include "db/fir_circuit.h"

namespace firrtlsyn {
  std::map<std::string, firDB::firLibrary*> firDB::libs_;

  void firDB::destroy(firLibrary* library) {
    auto iter = libs_.find(library->name());
    if (iter == libs_.end()) return;
    libs_.erase(iter);
    if (iter->second != NULL) delete iter->second;
    iter->second = NULL;
  }
  void firDB::release() {
    for (auto iter = libs_.begin(); iter != libs_.end(); iter++) {
      if (iter->second) delete iter->second;
      iter->second = NULL;
    }
    libs_.clear();
  }
  firDB::firLibrary* firDB::getLib(const std::string& lib_name) {
    std::map<std::string, firLibrary*>::iterator iter = libs_.find(lib_name);
    if (iter == libs_.end()) {
      firLibrary* lib = new firLibrary(lib_name);
      libs_.insert(std::make_pair(lib_name, lib));
      return lib;
    } else {
      return iter->second;
    }
  }
  firDB::firLibrary* firDB::findLib(const std::string& lib_name) {
    std::map<std::string, firLibrary*>::iterator iter = libs_.find(lib_name);
    if (iter == libs_.end()) {
      return NULL;
    } else {
      return iter->second;
    }
  }
  firDB::firLibrary::firLibrary(const std::string& lib_name) {
    lib_name_ = lib_name;
  }
  firDB::firLibrary::~firLibrary() {
    clear();
  }
  void firDB::firLibrary::clear() {
    for (size_t i = 0; i < post_circuits_.size(); i++) {
      if (post_circuits_[i]) delete post_circuits_[i];
      post_circuits_[i] = NULL;
    }
    post_circuits_.clear();
    id_post_circuit_map_.clear();
    circuit_to_post_map_.clear();
    for (size_t i = 0; i < circuits_.size(); i++) {
      if (circuits_[i]) delete circuits_[i];
      circuits_[i] = NULL;
    }
    circuits_.clear();
    id_circuit_map_.clear();
    files_.clear();
    file_id_map_.clear();
  }
  firDB::firCircuit* firDB::firLibrary::addCircuit(const std::string& cir_name) {
    fs_assert(this->name() == "work");
    auto iter = id_circuit_map_.find(cir_name);
    if (iter != id_circuit_map_.end()) {
      return iter->second;
    } else {
      fs_assert(circuits_.size() == 0);
      firCircuit* circuit = new firCircuit(cir_name, this);
      circuits_.push_back(circuit);
      id_circuit_map_.insert(std::make_pair(cir_name, circuit));
      return circuit;
    }
  }
  firDB::firCircuit* firDB::firLibrary::addPostCircuit(firCircuit* circuit) {
    auto iter = id_post_circuit_map_.find(circuit->id());
    if (iter != id_post_circuit_map_.end()) {
      fs_assert(0);
      return iter->second;
    } else {
      fs_assert(circuits_.size() == 1);
      firCircuit* post_circuit = new firCircuit(circuit->id(), this);
      post_circuits_.push_back(post_circuit);
      id_post_circuit_map_.insert(std::make_pair(post_circuit->id(), post_circuit));
      circuit_to_post_map_.insert(std::make_pair(circuit, post_circuit));
      fs_assert(circuit->library()->name() == "work");
      return post_circuit;
    }
  }
  firDB::firCircuit* firDB::firLibrary::fir_circuit() {
    //FIXME: rewrite this once support multi circuit or standard library circuits
    if (circuits_.size() == 0) {
      return NULL;
    } else if (circuits_.size() == 1) {
      return circuits_[0];
    } else {
      fs_assert(0);
      return NULL;
    }
  }
  firDB::firCircuit* firDB::firLibrary::post_circuit() {
    if (post_circuits_.size() == 0) {
      return NULL;
    } else if (post_circuits_.size() == 1) {
      return post_circuits_[0];
    } else {
      fs_assert(0);
      return NULL;
    }
  }
  firDB::firCircuit* firDB::firLibrary::findCircuitByName(const std::string& cir_name) {
    auto iter = id_circuit_map_.find(cir_name);
    if (iter != id_circuit_map_.end()) {
      return iter->second;
    } else {
      return NULL;
    }
  }
  firDB::firCircuit* firDB::firLibrary::findPostCircuitByName(const std::string& cir_name) {
    auto iter = id_post_circuit_map_.find(cir_name);
    if (iter != id_post_circuit_map_.end()) {
      return iter->second;
    } else {
      return NULL;
    }
  }
  firDB::firCircuit* firDB::firLibrary::findPostCircuitByOrigin(firCircuit* circuit) {
    auto iter = circuit_to_post_map_.find(circuit);
    if (iter != circuit_to_post_map_.end()) {
      return iter->second;
    } else {
      return NULL;
    }
  }
  void firDB::firLibrary::addFile(const std::string& file) {
    if (file_id_map_.find(file) == file_id_map_.end()) {
      file_id_map_.insert(std::make_pair(file, static_cast<int>(files_.size())));
      files_.push_back(file);
    }
  }
  int firDB::firLibrary::findIdByFileName(const std::string& file) {
    auto iter = file_id_map_.find(file);
    if (iter != file_id_map_.end()) {
      return iter->second;
    } else {
      fs_assert(0);
      return -1;
    }
  }
  std::string firDB::firLibrary::findFileById(int id) {
    if (id < 0 || id >= static_cast<int>(files_.size())) {
      return "";
    } else {
      return files_[id];
    }
  }
  void firDB::firLibrary::releasePostCircuits() {
    for (size_t i = 0; i < post_circuits_.size(); i++) {
      if (post_circuits_[i] != NULL) {
        delete post_circuits_[i];
      }
    }
    post_circuits_.clear();
    id_post_circuit_map_.clear();
    circuit_to_post_map_.clear();
  }
}
