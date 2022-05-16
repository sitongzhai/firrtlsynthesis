//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_EXCEPTION_H
#define UTILITY_EXCEPTION_H

#include <stdexcept>
#include <string>

namespace firrtlsyn {

  class Exception : public std::runtime_error {
  public:
    Exception() throw() : runtime_error(std::string()) {
#ifdef _DEBUG
      assert(0);
#endif
    }
    explicit Exception(const char* what_arg) throw () : runtime_error(what_arg) {
#ifdef _DEBUG
      assert(0);
#endif
    }
    explicit Exception(const std::string& what_arg) throw () : runtime_error(what_arg) {
#ifdef _DEBUG
      assert(0);
#endif
    }
  };

  class IOException : public Exception {
  public:
    IOException() throw () : Exception() {

    }
    explicit IOException(const std::string& what_arg) throw () :
      Exception(what_arg) {

    }
  };

}

#endif
