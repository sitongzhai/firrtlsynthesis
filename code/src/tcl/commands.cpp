//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-09-01
//* Last updated: 2022-05-15
//******************************************************************************

#include <stdlib.h>
#ifndef WIN32
#include <unistd.h>
#endif
#include <string.h>
#include <assert.h>
#include <iostream>
#include <fstream>
#include "tcl/commands.h"
#include "utility/utility.h"
#include "utility/assert.h"
#include "utility/var.h"

namespace firrtlsyn {
  
  extern int tclInitProc(Tcl_Interp* interp);

  Tcl_Interp* Commands::interp_ = NULL;

  void Commands::init(int argc, char* argv[]) {
    //register all commands before Tclsh is invoked
    //To register a command, please modify RegisterAllCmds()
    Tcl_Main(argc, argv, tclInitProc);
  }
  void Commands::register_cmd(Tcl_Interp* interp, const std::string cmd_name, const std::string cmd_options, CommandFunction cmd_func) {
    commands_.push_back(cmd_name);
    options_.push_back(cmd_options);
    cmd_funcs_.push_back(cmd_func);

    //register options
    std::string s_arguments;
    std::vector<Option> vec_options;
    splitString(cmd_options, s_arguments, vec_options);
    cmd_opts_.insert(std::pair<std::string, std::vector<Option>>(cmd_name, vec_options));
    cmd_args_.insert(std::pair<std::string, std::string>(cmd_name, s_arguments));

    //register cmd_name and cmd_func with tclsh
    Tcl_CreateObjCommand(interp, cmd_name.c_str(), cmd_func, (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL);
  }

  int Commands::getOptionIndex(const int objc, Tcl_Obj* const objv[], const char* optionName) {
    for (int i = 1; i < objc; i++) {
      if (strcmp(optionName, Tcl_GetString(objv[i])) == 0) {
        return i;
      }
    }
    return -1;
  }
  bool Commands::isOptionUsed(const int objc, Tcl_Obj* const objv[], const char* optionName) {
    if (getOptionIndex(objc, objv, optionName) > -1)
      return true;
    else
      return false;
  }
  bool Commands::getBoolOption(const int objc, Tcl_Obj* const objv[], const char* option_name, bool& value) {
    int i = getOptionIndex(objc, objv, option_name);
    if (i > -1) {
      if (i == objc - 1) {
        fs_assert(0);
        return false;
      } else {
        const char* v = Tcl_GetString(objv[i + 1]);
        if (strcasecmp(v, "true") == 0) {
          value = true;
          return true;
        } else if (strcasecmp(v, "false") == 0) {
          value = false;
          return true;
        } else {
          fs_assert(0);
          return false;
        }
      }
    }
    return false;
  }
  bool Commands::getIntOption(const int objc, Tcl_Obj* const objv[], const char* option_name, int& value) {
    int i = getOptionIndex(objc, objv, option_name);
    if (i > -1) {
      if (i == objc - 1) {
        fs_assert(0);
      } else {
        if (Tcl_GetInt(NULL, Tcl_GetString(objv[i + 1]), &value) == TCL_OK)
          return true;
        fs_assert(0);
      }
      return false;
    }
    return false;
  }
  bool Commands::getFloatOption(const int objc, Tcl_Obj* const objv[], const char* option_name, float& value) {
    int i = getOptionIndex(objc, objv, option_name);
    if (i > -1) {
      if (i == objc - 1) {
        fs_assert(0);
      } else {
        double tmp_double;
        if (Tcl_GetDouble(NULL, Tcl_GetString(objv[i + 1]), &tmp_double) == TCL_OK) {
          value = static_cast<float>(tmp_double);
          return true;
        }
        fs_assert(0);
      }
      return false;
    }
    return false;
  }
  bool Commands::getDoubleOption(const int objc, Tcl_Obj* const objv[], const char* option_name, double& value) {
    int i = getOptionIndex(objc, objv, option_name);
    if (i > -1) {
      if (i == objc - 1) {
        fs_assert(0);
      } else {
        if (Tcl_GetDouble(NULL, Tcl_GetString(objv[i + 1]), &value) == TCL_OK)
          return true;
        fs_assert(0);
      }
      return false;
    }
    return false;
  }

  bool isSeperator(const std::string& sName) {
    return sName[0] == '-' && sName.length() > 1 && !isdigit(sName[1]);
  }
  bool Commands::getStringOption(const int objc, Tcl_Obj* const objv[], const char* option_name, std::string& value) {
    int i = getOptionIndex(objc, objv, option_name);
    if (i > -1) {
      if (i == objc - 1) {
        fs_assert(0);
      } else {
        bool is_valid = true;
        do {
          std::string tmp = Tcl_GetString(objv[++i]);
          if (isSeperator(tmp) || tmp[0] == '$')
            break;
          if (value.length() > 0) {
            value += " ";
          }
          value += tmp;
          is_valid = true;
        } while (i < objc - 1);
        if (is_valid) {
          return true;
        }
        fs_assert(0);
      }
    }
    return false;
  }

  bool Commands::preRun(int objc, Tcl_Obj* const objv[]) {
    if (Commands::isOptionUsed(objc, objv, "-help") || Commands::isOptionUsed(objc, objv, "-h")) {
      //gCCommands.printHelp(objv);
      return false;
    }
    DataVar::cmd_started_ = true;
#ifndef WIN32
    usleep(2000);
#endif
    //FIXME: TODO check arguments and options

    if (verbose_) {
      DataVar::time_.getProcessCpuTime(&tp_begin_);
      DataVar::time_.getElapsedTime(&time_begin_);
      memory_begin_ = DataVar::current_used_memory_;
    }
    return true;
  }
  bool Commands::postRun(int objc, Tcl_Obj* const objv[]) {
    std::string cmd_full_name;
    Commands::getFullName(objc, objv, cmd_full_name);
    if (verbose_) {
      DataVar::time_.getElapsedTime(&time_end_);
      DataVar::time_.getProcessCpuTime(&tp_end_);
      char* cmd_name = Tcl_GetString(objv[0]);
#ifndef WIN32
      usleep(6000);
#endif
      firrtlsyn_print_cmd_profile(cmd_name, time_begin_, time_end_, tp_begin_, tp_end_);
      int cmd_used_mem = DataVar::cmd_peak_used_memory_ - memory_begin_;
      fs_info("*INFO*: %s used memory %dMb, firrtlsyn used peak memory %dMb, current used memory %dMb.\n", cmd_name, cmd_used_mem, DataVar::firrtlsyn_peak_used_memory_, DataVar::current_used_memory_);
    }
    DataVar::cmd_started_ = false;
#ifndef WIN32
    usleep(2000);
#endif // !WIN32
    return true;
  }


  int Commands::splitString(const std::string& sStr, std::vector<std::string>& vecRet, std::string sSep) {
    if (sStr.empty()) 
      return 0;

    std::string s_tmp;
    std::string::size_type i_pos_begin = sStr.find_first_not_of(sSep);
    std::string::size_type i_comma_pos = 0;
    while (i_pos_begin != std::string::npos) {
      i_comma_pos = sStr.find(sSep, i_pos_begin);
      if (i_comma_pos != std::string::npos) {
        s_tmp = sStr.substr(i_pos_begin, i_comma_pos - i_pos_begin);
        i_pos_begin = i_comma_pos + sSep.length();
      } else {
        s_tmp = sStr.substr(i_pos_begin);
        i_pos_begin = i_comma_pos;
      }
      if (!s_tmp.empty()) {
        vecRet.push_back(s_tmp);
        s_tmp.clear();
      }
    }
    return 0;
  }


  int Commands::splitString(const std::string& str, std::string& arguments, std::vector<Option>& ret, std::string sep) {
    if (str.empty()) {
      return 0;
    }

    std::vector<std::string> vec_opts;
    splitString(str, vec_opts, sep);

    int i_opts_num = static_cast<int>(vec_opts.size());
    for (int i = 0; i < i_opts_num; i++) {
      while (i < i_opts_num && !isSeperator(vec_opts[i])) {
        if (!arguments.empty())
          arguments += " ";
        arguments += vec_opts[i];
        i++;
      }
      if (i == i_opts_num)
        break;

      Option o_opt;
      o_opt.option = vec_opts[i];
      if (vec_opts[i] == "-" && (i + 1) < i_opts_num) {
        o_opt.option = vec_opts[++i];
      }

      std::string regex = "";
      while (++i < i_opts_num) {
        if (isSeperator(vec_opts[i])) {
          --i;
          break;
        }
        regex += " ";
        regex += vec_opts[i];
      }
      o_opt.regex = regex;

      ret.push_back(o_opt);
    }

    return 0;
  }
}