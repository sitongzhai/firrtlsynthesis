//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_INFER_H
#define ELABORATE_INFER_H

#include "db/fir_db.h"
#include "db/fir_module.h"
#include "db/fir_circuit.h"
#include "db/fir_type.h"
#include "db/fir_item.h"
#include "elaborate/width_infer.h"
#include "elaborate/mport_infer.h"
#include "elaborate/value_infer.h"

namespace firrtlsyn {

  class Infer {
  public:
    Infer();
    ~Infer();

    bool infer(firDB::firCircuit* circuit);
    bool mportInfer(firDB::firCircuit* circuit);
    bool widthInfer(firDB::firCircuit* circuit);
    bool valueInfer(firDB::firCircuit* circuit);
  private:
    WidthInfer* getWidthInfer() { return width_infer_; }
    MportInfer* getMPortInfer() { return mport_infer_; }
    ValueInfer* getValueInfer() { return value_infer_; }
    bool moduleTraverse(firDB::firModule* module);
    bool statementTraverse(firDB::firModule* module, firDB::firItem* stmt, firDB::firItemConditional* domain = NULL);
    void getUnknownWidthType(firDB::firType* type);
    void getVectorUnknownWidthType(firDB::firTypeVector* type);
    void getBundleUnknownWidthType(firDB::firTypeBundle* type);
    bool inferInstanceModule(firDB::firModule* module, firDB::firItemInstance* inst_item);

  private:
    WidthInfer* width_infer_;
    MportInfer* mport_infer_;
    ValueInfer* value_infer_;
  };

}

#endif