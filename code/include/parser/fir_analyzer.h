//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef PARSER_FIRANALYZER_H
#define PARSER_FIRANALYZER_H

#include "db/fir_db.h"

namespace firrtlsyn {

  class firAnalyzer {
  public:
    firAnalyzer(firDB::firLibrary* library);
    ~firAnalyzer();

    bool analyze(const std::vector<std::string>& file_list, const bool debug = false);
  private:
    firDB::firLibrary* library_;
  };

}


#endif