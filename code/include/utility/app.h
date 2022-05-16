//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_APP_H
#define UTILITY_APP_H

#include <string>

namespace firrtlsyn {
  class App {
  public:
    static bool canonicalFilePath(std::string &file_path, std::string &canonical_path);
    static std::string getDBPath();
    static bool avoidOverwrite(const std::string & file_name);
  };
}

#endif
