//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "parser/fir_analyzer.h"

extern int firrtlparse();
extern void firrtlset_in(FILE*);


namespace firrtlsyn {

  bool fir_parser(firDB::firLibrary* lib, std::string file_name, const bool debug) {
    FILE* in_file = fopen(file_name.c_str(), "r");
    if (in_file == NULL) {
      fs_error("%s does not exists!\n", file_name.c_str());
      return false;
    }
    firrtlset_in(in_file);
    int success = firrtlparse();
    fclose(in_file);
    if (success == 0) {
      return true;
    } else {
      return false;
    }
  }



  firAnalyzer::firAnalyzer(firDB::firLibrary* library) {
    library_ = library;
  }

  firAnalyzer::~firAnalyzer() {

  }

  bool firAnalyzer::analyze(const std::vector<std::string>& file_list, const bool debug) {
    if (file_list.empty()) return false;

    for (size_t f = 0; f < file_list.size(); f++) {
      library_->addFile(file_list[f]);
      if (!fir_parser(library_, file_list[f], debug)) {
        return false;
      }
    }
    
    return true;
  }


}
