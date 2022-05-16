//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************
#ifndef  UTILITY_UTILITY_H
#define  UTILITY_UTILITY_H

#include <climits>
#include <stdint.h>
#include <string.h>
#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <stdarg.h>
#include <stdio.h>

#include "utility/win32.h"
#include "utility/time.h"
#include "utility/assert.h"

namespace firrtlsyn {

  void firrtlsyn_print_cmd_profile(const char* cmd_name, const timeval time_begin, const timeval time_end, const timespec tp_begin, const timespec tp_end);



  void fs_info_print(const char* format, ...);
  void fs_warning_print(const char* format, ...);
  void fs_error_print(const char* format, ...);
  void fs_debug_print(const char* format, ...);

#define fs_info firrtlsyn::fs_info_print
#define fs_warning firrtlsyn::fs_warning_print
#define fs_error firrtlsyn::fs_error_print
#define fs_debug firrtlsyn::fs_debug_print


  int getCurrentUsedMemory();


  void dump_stack();


  std::vector<std::string> SplitStringWithDelim(const std::string &s, char delim, bool removeEmptyString = true);


  bool GetFilesByExtension(const char* str, const char* ext_regex, std::vector<std::string>& file_paths);

}
#endif
