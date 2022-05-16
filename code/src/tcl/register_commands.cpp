//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <tcl.h>

#include "tcl/commands.h"

namespace firrtlsyn {

  extern int ReadFirrtl(ClientData data, Tcl_Interp* interp, int objc, Tcl_Obj* const objv[]);
  extern int Elaborate(ClientData data, Tcl_Interp* interp, int objc, Tcl_Obj* const objv[]);
  extern int ClearFirDB(ClientData data, Tcl_Interp* interp, int objc, Tcl_Obj* const objv[]);
  extern int Source(ClientData data, Tcl_Interp* interp, int objc, Tcl_Obj* const objv[]);
  extern int WriteVerilog(ClientData data, Tcl_Interp* interp, int objc, Tcl_Obj* const objv[]);
  Commands gCommands;

  int registerAllCmds(Tcl_Interp* interp) {
    Commands::set_interp(interp);

    gCommands.register_cmd(interp, "read_firrtl", "<string>", ReadFirrtl);
    gCommands.register_cmd(interp, "elaborate", "-optimize_exp <bool>", Elaborate);
    gCommands.register_cmd(interp, "clear_firdb", "-all -lib <string>", ClearFirDB);
    gCommands.register_cmd(interp, "source", "file_name", Source);
    gCommands.register_cmd(interp, "write_verilog", "<string> -overwrite -debug", WriteVerilog);

    return TCL_OK;
  }
}