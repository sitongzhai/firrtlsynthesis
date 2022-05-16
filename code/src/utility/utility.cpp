//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <algorithm>
#include <fstream> 
#include <regex>
#ifndef WIN32
#include <execinfo.h>
#include <sys/resource.h>
#include <signal.h>
#include <unistd.h>
#include <sys/sysinfo.h>
#else
#include <Windows.h>
#include <Psapi.h>
#endif
#include "utility/utility.h"
#include "utility/assert.h"

namespace firrtlsyn {

  extern FILE* fp_;

  void firrtlsyn_print_cmd_profile(const char* cmd_name, const timeval time_begin, const timeval time_end, const timespec tp_begin, const timespec tp_end) {
    double elapsed_time = static_cast<double>(time_end.tv_sec - time_begin.tv_sec);
    elapsed_time += static_cast<double>(time_end.tv_usec - time_begin.tv_usec) / 1000000.0;

    double cpu_time = static_cast<double>(tp_end.tv_sec - tp_begin.tv_sec);
    cpu_time += static_cast<double>(tp_end.tv_nsec - tp_begin.tv_nsec) / 1000000000.0;

    if (elapsed_time > 0.01) {
      fs_info("*INFO*: %s elapsed time %.2f seconds, cpu_time %.2f seconds\n", cmd_name, elapsed_time, cpu_time);
    }

  }

  #define LOG_BUF_SIZE 10240
  void fs_info_print(const char* format, ...)
  {
    va_list args;
    va_start(args, format);
    char buffer[LOG_BUF_SIZE] = { 0 };
    vsnprintf(buffer, LOG_BUF_SIZE, format, args);
    va_end(args);
    if (fp_ != NULL) {
#ifdef WIN32
      fprintf_s(fp_, "%s", buffer);
      fflush(fp_);
#else
      fprintf(fp_, "%s", buffer);
#endif //  WIN32
    }
    printf("%s", buffer);
    fflush(stdout);
  }

  void fs_warning_print(const char* format, ...) {
    va_list args;
    va_start(args, format);
    char buffer[LOG_BUF_SIZE] = { 0 };
    vsnprintf(buffer, LOG_BUF_SIZE, format, args);
    va_end(args);
    if (fp_ != NULL) {
#ifdef WIN32
      fprintf_s(fp_, "%s", buffer);
      fflush(fp_);
#else
      fprintf(fp_, "%s", buffer);
#endif
    }

#ifdef WIN32
    //#define COLOR_YELLOW 6
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 0x06);
    printf("%s", buffer);
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 0x07);
#else
    printf("%s", buffer);
#endif
    fflush(stdout);
  }

  void fs_error_print(const char* format, ...) {
    va_list args;
    va_start(args, format);
    char buffer[LOG_BUF_SIZE] = { 0 };
    vsnprintf(buffer, LOG_BUF_SIZE, format, args);
    va_end(args);
    if (fp_ != NULL) {
#ifdef WIN32
      fprintf_s(fp_, "%s", buffer);
      fflush(fp_);
#else
      fprintf(fp_, "%s", buffer);
#endif
    }

#ifdef WIN32
    //#define COLOR_RED 4
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 0x04);
    printf("%s", buffer);
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 0x07);
#else
    printf("%s", buffer);
#endif
    fflush(stdout);
  }

  void fs_debug_print(const char* format, ...) {
#ifdef _DEBUG
    va_list args;
    va_start(args, format);
    char buffer[LOG_BUF_SIZE] = { 0 };
    vsnprintf(buffer, LOG_BUF_SIZE, format, args);
    va_end(args);
    if (fp_ != NULL) {
#ifdef WIN32
      fprintf_s(fp_, "%s", buffer);
      fflush(fp_);
#else
      fprintf(fp_, "%s", buffer);
#endif
    }
    printf("%s", buffer);
    fflush(stdout);
#endif // _DEBUG
  }

  int getCurrentUsedMemory() {
    int current_used_memory = 0;
#ifndef WIN32
    const int MAX_SIZE = 512;
    pid_t pid = getpid();
    char proc_status_file_name[MAX_SIZE];
    sprintf(proc_status_file_name, "/proc/%d/status", pid);
    std::fstream proc_status_stream(proc_status_file_name, std::ios::in);
    if (!proc_status_stream.good()) {
      rusage usage;
      getrusage(RUSAGE_SELF, &usage);
      current_used_memory = static_cast<int>((usage.ru_maxrss) / 1024);
    } else {
      char buf[MAX_SIZE];
      while (proc_status_stream.getline(buf, MAX_SIZE)) {
        if (!strncmp(buf, "VmRSS", 5)) {
          std::vector<std::string> split_strings = SplitStringWithDelim(buf, ' ');
          fs_assert(split_strings.size() > 1);
          current_used_memory = atoi(split_strings[1].c_str()) / 1024;
          break;
        }
      }
    }
    proc_status_stream.close();
#else
    PROCESS_MEMORY_COUNTERS info;
    GetProcessMemoryInfo(GetCurrentProcess(), &info, sizeof(info));
    current_used_memory = static_cast<int>(info.WorkingSetSize / 1024 / 1024);
#endif
    return current_used_memory;
  }


  void dump_stack() {
#ifdef WIN32
    fs_info("*INFO*: Dumping stack is not supported in windows.\n");
#else
    void *buffer[1024];
    int n = backtrace(buffer, 1024);
    char **infos = backtrace_symbols(buffer, n);
    //backtrace_symbols_fd(buffer, nptrs, STDOUT_FILENO);
    char exec_path[1024] = { 0 };
    if (readlink("/proc/self/exe", exec_path, sizeof(exec_path)) <= 0)
      fs_info("Could not get the execute binary's path!\n");
    char cmd[2048];
    sprintf(cmd, "addr2line -ifC -e %s", exec_path);
    size_t len = strlen(cmd);
    char *p = cmd + len;
    size_t s = sizeof(cmd) - len;
    for (int i = 0; i < n; i++) {
      if (s > 0) {
        len = snprintf(p, s, " %p", buffer[i]);
        p += len;
        s -= len;
      }
    }
    fs_info("=================\nFrame info:\n");
    FILE *fp = NULL;
    if ((fp = popen(cmd, "r")) != NULL) {
      char buf[128];
      while (fgets(buf, sizeof(buf), fp))
        fs_info("%s\n", buf);
      pclose(fp);
    }
    fs_info("=================\n");
    free(infos);
#endif // WIN32
  }


  std::vector<std::string> SplitStringWithDelim(const std::string &s, char delim, bool removeEmptyString) {
    std::string sTmp(s);
    size_t stringLocation;
    while ((stringLocation = sTmp.find("\r")) != std::string::npos)
      sTmp.replace(stringLocation, 1, "");
    while ((stringLocation = sTmp.find("\t")) != std::string::npos)
      sTmp.replace(stringLocation, 1, " ");
    while ((stringLocation = sTmp.find("\n")) != std::string::npos)
      sTmp.replace(stringLocation, 1, " ");
    if (delim != ' ') {
      while ((stringLocation = sTmp.find(" ")) != std::string::npos)
        sTmp.replace(stringLocation, 1, "");
    }
    std::stringstream ss(sTmp);
    std::string item;
    std::vector<std::string> elems;
    while (std::getline(ss, item, delim)) {
      if (removeEmptyString) {
        if (item.find_first_not_of(" ") == std::string::npos)
          continue;
      }
      elems.push_back(item);
    }
    return elems;
  }


  bool GetFilesByExtension(const char* str, const char* ext_regex, std::vector<std::string>& file_paths) {
    //std::string s(str);
    //std::string regex("\\s*([^{}\"]+?\\.");
    //regex += ext_regex;
    //regex += ")(([\\s}\"])|($))";
    //printf("%s\n", regex.c_str());
    //std::regex e(regex, std::regex_constants::icase);
    //std::regex_iterator<std::string::iterator> rit(s.begin(), s.end(), e);
    //std::regex_iterator<std::string::iterator> rend;
    //while (rit != rend) {
    //  file_paths.push_back((*rit).str(1));
    //  rit++;
    //}
    //return true;
    std::string s(str);
    const std::string c_delem = " ";
    s = s.substr(s.find_first_not_of(" "), s.find_last_not_of(" ") - s.find_first_not_of(" ") + 1);
    std::vector<std::string> res;
    std::string::size_type pos1 = 0, pos2 = 0;
    pos2 = s.find(c_delem);
    while (pos2 != std::string::npos) {
      std::string s_res = s.substr(pos1, pos2 - pos1);
      if (!s_res.empty()) {
        res.push_back(s_res);
      }
      pos1 = pos2 + c_delem.size();
      pos2 = s.find(c_delem, pos1);
    }
    if (pos1 != std::string::npos) {
      res.push_back(s.substr(pos1));
    }
    //if (res.size() < 1) {
    //  res.push_back(s);
    //}
    for (size_t i = 0; i < res.size(); ++i) {
      std::string s_data = res.at(i);
      std::string regex = ".+\\.";
      regex += ext_regex;
      regex += "$";
      std::regex e(regex, std::regex_constants::icase);
      std::regex_iterator<std::string::iterator> rit(s_data.begin(), s_data.end(), e);
      std::regex_iterator<std::string::iterator> rend;
      if (rit == rend) {
        return false;
      } 
      while (rit != rend) {
        std::string s_res = (*rit).str();
        //std::string s_res1 = (*rit).str(1);
        //printf("res: %s, res1: %s\n", s_res.c_str(), s_res1.c_str());
        file_paths.push_back(s_res);
        rit++;
      }
    }
    return true;
  }

}