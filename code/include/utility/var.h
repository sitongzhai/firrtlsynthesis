//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************
#ifndef UTILITY_VAR_H
#define UTILITY_VAR_H

#include <vector>
#include <list>
#include <string>

#include "utility/time.h"

namespace firrtlsyn {

  class DataVar {
  public:
    enum FlowStage {
      kStageUndef = 0,
      kStagePreSyn,
      kStagePostSyn,
      kStagePostProgram
    };
    
    static FlowStage stage() {
      return stage_;
    }

  public:
    static int current_used_memory_;
    static int cmd_peak_used_memory_;
    static int firrtlsyn_peak_used_memory_;

    static bool cmd_started_;
    static Time time_;


    static void setStage(FlowStage stage);

  private:
    static FlowStage stage_;
  };

}

#endif 
