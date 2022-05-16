//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_VALUEINFER_H
#define ELABORATE_VALUEINFER_H

#include "db/fir_db.h"
#include "db/fir_module.h"
#include "db/fir_circuit.h"
#include "db/fir_type.h"
#include "db/fir_item.h"

namespace firrtlsyn {
  class ValueInfer
  {
  public:
    ValueInfer();
    ~ValueInfer();

    bool value_infer(firDB::firCircuit* circuit);

  private:
    bool moduleTraverse(firDB::firModule* module);
    bool statementTraverse(firDB::firModule* module, firDB::firItem* stmt, firDB::firItemConditional* domain = NULL);
  };
}

#endif
