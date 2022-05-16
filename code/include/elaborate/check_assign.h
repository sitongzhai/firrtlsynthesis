//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_CHECK_ASSIGN_H
#define ELABORATE_CHECK_ASSIGN_H

#include "db/fir_db.h"
#include "db/fir_module.h"
#include "db/fir_circuit.h"
#include "db/fir_type.h"
#include "db/fir_item.h"
#include <map>
#include <string>

namespace firrtlsyn {
  class CheckAssign {
  public:
    CheckAssign();
    ~CheckAssign();
  public:
    bool checkPortAssign(firDB::firCircuit* circuit);
  private:
    std::string bundle_interpunct() { return bundle_interpunct_; }
    std::string vector_left_interpunct() { return vector_left_interpunct_; }
    std::string vector_right_interpunct() { return vector_right_interpunct_; }
    bool moduleTraverse(firDB::firModule* module);
    bool statementTraverse(firDB::firItem* stmt, firDB::firModule* module, firDB::firItemConditional* domain = NULL);
    void getAllPortsId(firDB::firItemPort* port);
    void expandConnect(firDB::firModule* module, firDB::firItemConnect* item_connect, firDB::firItemConditional* domain = NULL);
    void expandPartialConnect(firDB::firModule* module, firDB::firItemPartialConnect* item_partialConnect, firDB::firItemConditional* domain = NULL);
    void checkUnreferencedOutput();
    void expandPort(std::string port_id, firDB::firType* port_type, firDB::PortDir port_dir);
    void expandConnectExpressionType(firDB::firType* type_l, firDB::firType* type_r);
  private:
    std::string bundle_interpunct_;
    std::string vector_left_interpunct_;
    std::string vector_right_interpunct_;
    std::map<firDB::firType*, std::string> exp_type_map_;
  };
}


#endif
