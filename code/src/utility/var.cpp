//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <vector>
#include "utility/utility.h"
#include "utility/var.h"
#include <tcl.h>

namespace firrtlsyn {

  int DataVar::current_used_memory_ = 0;
  int DataVar::cmd_peak_used_memory_ = 0;
  int DataVar::firrtlsyn_peak_used_memory_ = 0;

  bool DataVar::cmd_started_ = 0;
  Time DataVar::time_;
  DataVar::FlowStage DataVar::stage_ = DataVar::kStageUndef;


  void DataVar::setStage(DataVar::FlowStage stage) {
    stage_ = stage;

  }
}