//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_WIDTHINFER_H
#define ELABORATE_WIDTHINFER_H

#include "db/fir_db.h"
#include "db/fir_module.h"
#include "db/fir_circuit.h"
#include "db/fir_type.h"
#include "db/fir_item.h"

#include <map>
#include <set>
#include <queue>

namespace firrtlsyn {

  class WidthInfer {
  public:
    WidthInfer();
    ~WidthInfer();

    bool width_infer(firDB::firCircuit* circuit);
    bool widthInferAndSetTypeWidth(firDB::firCircuit* circuit);
    void insertInferWidthType(firDB::firType* type);
    void eraseInferWidthType(firDB::firType* type);
    void insertOriginalFixedType(firDB::firTypeFixed* ftype);
    void insertOriginalIntervalType(firDB::firTypeInterval* itype);
    bool isInvalidWidthType(firDB::firType* type);

  private:
    void setCurCond(firDB::firItemConditional* cur_cond);
    firDB::firItemConditional* getCurCond();
    bool isNeedInferTypeWidth();
    bool moduleTraverse(firDB::firModule* module);
    bool statementTraverse(firDB::firModule* module, firDB::firItem* stmt);
    bool inferWidthByConnect(firDB::firModule* module, firDB::firItemConnect* item_connect);
    bool inferWidthByPartialConnect(firDB::firModule* module, firDB::firItemPartialConnect* partial_connect);
    bool inferWidthByInstance(firDB::firModule* module, firDB::firItemInstance* item_inst);
    bool inferWidthByConditional(firDB::firModule* module, firDB::firItemConditional* item_conditional);
    bool inferWidthByAttach(firDB::firModule* module, firDB::firItemAttach* item_attach);
    void inferWidthByDestType(firDB::firModule* module, firDB::firType* src_type, firDB::firType* dest_type);
    void setTypeWidthByDestType(firDB::firType* src_type, firDB::firType* dest_type);

  private:
    firDB::firItemConditional* cur_cond_;
    std::set<firDB::firType*> infer_width_type_;
    std::map<firDB::firTypeFixed*, firDB::firTypeFixed*> fixed_type_map_;
    std::map<firDB::firTypeInterval*, firDB::firTypeInterval*> interval_type_map_;
  };
}

#endif