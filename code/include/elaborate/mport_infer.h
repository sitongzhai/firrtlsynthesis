//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_MPORTINFER_H
#define ELABORATE_MPORTINFER_H

#include "db/fir_circuit.h"
#include "db/fir_db.h"
#include "db/fir_module.h"
#include "db/fir_item.h"
#include <set>

namespace firrtlsyn {
  class MportInfer {
  public:
    MportInfer();
    ~MportInfer();

    bool inferMportDir(firDB::firCircuit* circuit);
    bool moduleTraverse(firDB::firModule* module);
    bool statementTraverse(firDB::firModule* module, firDB::firItem* stmt, firDB::firItemConditional* domain = NULL);
  public:
    void setMportDirection(firDB::firItemMPort* mport, firDB::MPortDir direction, std::set<firDB::firItemMPort*>& infer_mport);
    void extractReadMportByExp(firDB::firModule* module, firDB::firExp* exp, std::set<firDB::firItemMPort*>& infer_mport, firDB::firItemConditional* domain = NULL);
    void extractReadMportByPrimOp(firDB::firModule* module, firDB::firExpPrimOperation* prim_op, std::set<firDB::firItemMPort*>& infer_mport, firDB::firItemConditional* domain = NULL);
    void extractWriteMportByExp(firDB::firModule* module, firDB::firExp* exp, std::set<firDB::firItemMPort*>& infer_mport, firDB::firItemConditional* domain = NULL);

  private:
    std::set<firDB::firItemMPort*> infer_mport_dir_;
  };
}
#endif