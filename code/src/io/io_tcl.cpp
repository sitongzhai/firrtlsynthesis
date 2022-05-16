//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string.h>

#include "utility/app.h"
#include "tcl/commands.h"
#include "utility/utility.h"
#include "utility/var.h"
#include "parser/fir_analyzer.h"
#include "db/fir_db.h"
#include "db/fir_circuit.h"
#include "db/fir_module.h"
#include "db/verilog_db.h"
#include "elaborate/transfer_post.h"
#include "elaborate/infer.h"
#include "elaborate/check_assign.h"
#include "io/write_verilog.h"
#include "elaborate/transfer_module.h"
#include "utility/exception.h"

namespace firrtlsyn {
  bool ReadFirrtlImpl(std::vector<std::string>& files, int /*verbose*/, bool debug) {
    firDB::firLibrary* lib = firDB::getLib("work");
    if (lib->fir_circuit() != NULL) {
      fs_warning("*WARNING*: Reading FIRRTL file failed. Clear the existing working libraries by command \"clear_firdb -all\" first.\n");
      return false;
    }
    fs_assert(lib->fir_circuit() == NULL);
    firAnalyzer analyzer(lib);
    if (!analyzer.analyze(files, debug)) {
      fs_error("*ERROR*: firrtl parser failed, please check syntax!\n");
      return false;
    }
    return true;
  }
  int ReadFirrtl(ClientData /*data*/, Tcl_Interp* /*interp*/, int objc, Tcl_Obj* const objv[]) {
    if (!gCommands.preRun(objc, objv)) return TCL_OK;

    try {
      if (objc < 2) {
        fs_error("*ERROR*: No FIRRTL file was specified to read. Specify a FIRRTL file to read and rerun.\n");
        gCommands.postRun(objc, objv);
        return TCL_ERROR;
      }
      int verbose = 0;
      if (Commands::isOptionUsed(objc, objv, "-verbose")) {
        gCommands.getIntOption(objc, objv, "-verbose", verbose);
      }
      bool isDebug = false;
      if (Commands::isOptionUsed(objc, objv, "-debug")) {
        isDebug = true;
      }
      std::vector<std::string> file_paths;
      for (int i = 1; i < objc; i++) {
        char* arg = Tcl_GetString(objv[i]);
        if (arg[0] == '-') {
          i++;
          continue;
        }
        if (!GetFilesByExtension(arg, "fir", file_paths)) {
          fs_error("*ERROR*: The input FIRRTL file '%s' was invalid. Specify a valid FIRRTL file with suffix '.fir' and rerun.\n", arg);
          gCommands.postRun(objc, objv);
          return TCL_ERROR;
        }
      }

      if (file_paths.size() == 0) {
        fs_error("*ERROR*: No FIRRTL file was specified to read. Specify the correct FIRRTL file with suffix '.fir' to read and rerun.\n");
        gCommands.postRun(objc, objv);
        return TCL_ERROR;
      } else if (file_paths.size() > 1) {
        fs_error("*ERROR*: More than one FIRRTL files were specified to read. Specify only one FIRRTL file to read every time and rerun.\n");
        gCommands.postRun(objc, objv);
        return TCL_ERROR;
      }
      if (ReadFirrtlImpl(file_paths, verbose, isDebug) == false) {
        gCommands.postRun(objc, objv);
        return TCL_ERROR;
      }
      fs_info("*INFO*: Read firrtl files succeeded.\n");
    } catch (Exception& e) {
      fs_error("*ERROR*: Exception: %s \n", e.what());
      firDB::firLibrary* lib = firDB::findLib("work");
      firDB::destroy(lib);
      fs_error("*ERROR*: Failed to read the input FIRRTL file. Fix the problems mentioned in the log messages and rerun.\n");
      fs_info("");
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    } catch (...) {
      fs_error("*ERROR*: Failed to read the input FIRRTL file. Fix the problems mentioned in the log messages and rerun.\n");
      fs_assert(0);
      firDB::firLibrary* lib = firDB::findLib("work");
      firDB::destroy(lib);
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    }

    gCommands.postRun(objc, objv);
    return TCL_OK;
  }
  bool ElaborateImpl() {
    firDB::firLibrary* lib = firDB::getLib("work");
    if (lib == NULL) {
      fs_error("*ERROR*: Failed to elaborate because no library existed. Read a FIRRTL file to build up a library and rerun.\n");
      return false;
    }
    firDB::firCircuit* fir_circuit = lib->fir_circuit();
    if (fir_circuit == NULL) {
      fs_warning("*WARNING*: Failed to elaborate because no circuit existed. Read in a circuit from FIRRTL file by command \"read_firrtl xxxx.fir\" first.\n");
      return false;
    }
    firDB::firModule* top_module = fir_circuit->top_module();
    if (top_module == NULL) {
      fs_error("*ERROR*: Failed to elaborate because no top module was found. Name the top module in the FIRRTL file with the circuit name and rerun.\n");
      return false;
    }
    //width infer
    firrtlsyn::Infer infer;
    if (!infer.infer(fir_circuit)) {
      fs_error("*ERROR*: Infer width of circuit '%s' failed!\n", fir_circuit->id().c_str());
      return false;
    }
    firrtlsyn::CheckAssign check_output_assign;
    if (!check_output_assign.checkPortAssign(fir_circuit)) {
      fs_error("*ERROR*: Check output assign of circuit '%s' failed!\n", fir_circuit->id().c_str());
      return false;
    }
    fs_info("*INFO*: Running elaborate...\n");
    TransferPost transfer_post(lib);
    if (!transfer_post.transfer()) {
      fs_error("*ERROR*: Transfer to post module failed!\n");
      return false;
    }

    return true;
  }

  int Elaborate(ClientData /*data*/, Tcl_Interp* /*interp*/, int objc, Tcl_Obj* const objv[]) {
    if (!gCommands.preRun(objc, objv)) return TCL_OK;

    try {
      bool optimize_exp = true;
      if (Commands::isOptionUsed(objc, objv, "-optimize_exp")) {
        gCommands.getBoolOption(objc, objv, "-optimize_exp", optimize_exp);
      }
      TransferPost::opt.set_optimize_exp(optimize_exp);
      if (!ElaborateImpl()) {
        fs_error("*ERROR*: Elaborate failed!\n");
        gCommands.postRun(objc, objv);
        return TCL_ERROR;
      }
      fs_info("*INFO*: Elaborate succeeded.\n");
    } catch (const Exception &e) {
      fs_error("*ERROR*: Exception: %s.\n", e.what());
      fs_error("*ERROR*: Elaborate failed! Fix the problems mentioned in the log messages and rerun.\n");
      firDB::firLibrary* lib = firDB::findLib("work");
      lib->releasePostCircuits();
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    } catch (...) {
      fs_error("*ERROR*: Elaborate failed! Fix the problems mentioned in the log messages and rerun.\n");
      firDB::firLibrary* lib = firDB::findLib("work");
      lib->releasePostCircuits();
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    }

    gCommands.postRun(objc, objv);
    return TCL_OK;
  }

  int ClearFirDB(ClientData /*data*/, Tcl_Interp* /*interp*/, int objc, Tcl_Obj* const objv[]) {
    if (!gCommands.preRun(objc, objv)) return TCL_OK;

    if (Commands::isOptionUsed(objc, objv, "-all")) {
      firDB::release();
      verilog::VNode::release();
      fs_info("*INFO*: Clearing all existing libraries succeeded.\n");
    } else if (Commands::isOptionUsed(objc, objv, "-lib")) {
      std::string lib_name;
      gCommands.getStringOption(objc, objv, "-lib", lib_name);
      firDB::firLibrary* library = firDB::findLib(lib_name);
      if (library == NULL) {
        fs_warning("*WARNING*: Library '%s' does not exist. Specify the correct library name with the option '-lib' and rerun.\n", lib_name.c_str());
      } else {
        firDB::destroy(library);
        fs_info("*INFO*: Clearing library '%s' successed.\n", lib_name.c_str());
      }
    }

    gCommands.postRun(objc, objv);
    return TCL_OK;
  }

  int Source(ClientData /*data*/, Tcl_Interp* interp, int objc, Tcl_Obj* const objv[]) {
    if (objc < 2) {
      fs_error("*ERROR*: No file was specified to source. Specify the file name and rerun.\n");
      return TCL_ERROR;
    }
    char* file_name = Tcl_GetString(objv[1]);
    struct timespec tp_begin, tp_end;
    timeval time_begin, time_end;
    DataVar::time_.getProcessCpuTime(&tp_begin);
    DataVar::time_.getElapsedTime(&time_begin);
    Tcl_EvalFile(interp, file_name);
    DataVar::time_.getProcessCpuTime(&tp_end);
    DataVar::time_.getElapsedTime(&time_end);
    std::string cmd_name = "source ";
    cmd_name += file_name;
    firrtlsyn_print_cmd_profile(cmd_name.c_str(), time_begin, time_end, tp_begin, tp_end);
    return TCL_OK;
  }

  bool WriteVerilogImpl(std::string file_name, bool overwrite) {
    firDB::firLibrary* lib = firDB::getLib("work");
    if (lib == NULL) {
      fs_error("*ERROR*: Failed to write Verilog because no library existed. Read a FIRRTL file to build up a library and rerun.\n");
      return false;
    }
    if (lib->post_circuit() == NULL) {
      fs_warning("*WARNING*: Failed to write Verilog because the circuit had not been elaborated. Elaborate the circuit by command \"elaborate\" and rerun.\n");
      return false;
    }
    firrtlsyn::Infer infer;
    if (!infer.infer(lib->post_circuit())) {
      fs_error("*ERROR*: Infer width of circuit '%s' failed!\n", lib->post_circuit()->id().c_str());
      return false;
    }
    verilog::Library* veri_lib = verilog::VNode::getLib("work");
    verilog::TransferModule trans(lib, veri_lib);
    if (!trans.transfer()) {
      fs_error("*ERROR*: Transfer to verilog module failed!\n");
      return false;
    }
    if (!overwrite) {
      if (App::avoidOverwrite(file_name) == false) {
        fs_error("*ERROR*: Failed to rename the existing Verilog file to avoid overwriting: '%s'.\n", file_name.c_str());
        return false;
      }
    }
    std::ofstream out_verilog(file_name);
    out_verilog << trans.getVerilogLibrary()->toString();
    out_verilog.close();
    return true;
  }

  int WriteVerilog(ClientData /*data*/, Tcl_Interp* /*interp*/, int objc, Tcl_Obj* const objv[]) {
    if (!gCommands.preRun(objc, objv)) return TCL_OK;
    if (objc < 2) {
      fs_error("*ERROR*: No file was specified to write Verilog into. Specify a Verilog file with suffix '.v' and rerun.\n");
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    }
    std::vector<std::string> file_paths;
    for (int i = 1; i < objc; i++) {
      char* arg = Tcl_GetString(objv[i]);
      if (arg[0] == '-') {
        i++;
        continue;
      }
      if (!GetFilesByExtension(arg, "v", file_paths)) {
        fs_error("*ERROR*: The input Verilog file '%s' was invalid. Specify a valid Verilog file with suffix '.v' and rerun.\n", arg);
        gCommands.postRun(objc, objv);
        return TCL_ERROR;
      }
    }

    if (file_paths.size() == 0) {
      fs_error("*ERROR*: No Verilog file was specified to write Verilog into. Specify the correct Verilog file with suffix '.v' and rerun.\n");
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    } else if (file_paths.size() > 1) {
      fs_error("*ERROR*: More than one Verilog files were specified. Specify only one Verilog file to write Verilog into and rerun.\n");
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    }

    char* file_name = Tcl_GetString(objv[1]);

    bool overwrite = false;
    if (Commands::isOptionUsed(objc, objv, "-overwrite")) {
      overwrite = true;
    }
    if (!WriteVerilogImpl(file_name, overwrite)) {
      fs_error("*ERROR*: Write verilog '%s' failed!\n", file_name);
      gCommands.postRun(objc, objv);
      return TCL_ERROR;
    }
    fs_info("*INFO*: Write verilog '%s' succeeded.\n", file_name);
    gCommands.postRun(objc, objv);
    return TCL_OK;
  }
}