//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_FILE_H
#define UTILITY_FILE_H

#include <string>
#ifdef WIN32
#include <direct.h>
#include <io.h>
#else
#include <dirent.h>
#include <unistd.h>
#include <sys/stat.h>
#endif


#ifdef WIN32
#define ACCESS _access
#define MKDIR(a) _mkdir((a))
#else
#define ACCESS ::access
#define MKDIR(a) ::mkdir((a), 0755)
#endif

namespace firrtlsyn {

  class File {
  public:
    static int access(const char* file_name, int mode) {
      // mode 00: only check whether file exists
      // mode 02: write only
      // mode 04: read only
      // mode 06: read and write
      return ACCESS(file_name, mode);
    }
    static int mkdir(const char* dir_name) {
      return MKDIR(dir_name);
    }
    static int rename(const char* old_file_name, const char* new_file_name) {
      return ::rename(old_file_name, new_file_name);
    }
  };
}

#endif