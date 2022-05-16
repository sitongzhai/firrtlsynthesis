//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef DB_FIRCIRCUIT_H
#define DB_FIRCIRCUIT_H

#include "db/fir_db.h"
#include "db/fir_module.h"

namespace firrtlsyn {

  class firDB::firCircuit : public firLocObj {
  public:
    firCircuit(const std::string& id, firLibrary* library);
    ~firCircuit();
  public:
    std::string toString(std::string indent = "") {
      std::string str = indent + "circuit " + id_ + " : " + info_.content() + "\n";
      std::string s_module;
      for (size_t i = 0; i < modules_.size(); i++) {
        if (modules_[i] != NULL) {
          s_module = modules_[i]->toString(indent + "  ");
        } else {
          fs_assert(0);
          s_module = "";
        }
        str += s_module + "\n";
      }
      return str;
    }
    std::string info() const { return info_.content(); }
    void set_info(const std::string& info) { info_.set_content(info); }
    void set_info(const char* info) { info_.set_content(info); }
    firLibrary* library() { return library_; }
    std::string id() const { return id_; }
    firModule* top_module() { return top_module_; }
    std::vector<firModule*>& modules() { return modules_; }
    firModule* addModule(ModuleType type, const std::string& id);
    firModule* findModuleById(const std::string& module_id);
  private:
    std::string id_;
    firLibrary* library_;
    firInfo info_;
    firModule* top_module_;
    std::vector<firModule*> modules_;
    std::map<std::string, firModule*> id_module_map_;
  };
}

#endif
