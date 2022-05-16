//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <stdlib.h>
#include <tcl.h>
#include <string.h>
#include <iostream>
//#include <Windows.h>
#ifndef WIN32
#include "readline.h"
#include "history.h"
#endif // !WIN32

#include "tcl/commands.h"

namespace firrtlsyn {

  extern int registerAllCmds(Tcl_Interp* pInterp);

  char* init_tcl_file = NULL;
  void FirrtlsynReadLineLoop(Tcl_Interp* interp);
  int tclInitProc(Tcl_Interp* interp) {
    if (interp == NULL) {
      return TCL_ERROR;
    }

    if (TCL_ERROR == Tcl_Init(interp)) {
      return TCL_ERROR;
    }

#ifdef WIN32
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 0x07);
#endif

    Commands::set_interp(interp);

    registerAllCmds(interp);

    FirrtlsynReadLineLoop(interp);

    return TCL_OK;
  }
#ifndef WIN32
  enum {
    LINE_PENDING = -1,
    LINE_EOF = (1 << 8),
    LINE_COMPLETE = (1 << 9)
  };
  int tclrl_state = TCL_OK;
  char* tclrl_last_line = (char*)NULL;
  Tcl_Interp* tclrl_interp = (Tcl_Interp*)NULL;

  const char *rl_readline_name = "other";
  const char *rl_basic_word_break_characters = " \t\n\"\\'`@$><=;|&{(";
  const char *rl_special_prefixes = (const char *)NULL;
  rl_completion_func_t *rl_attempted_completion_function = (rl_completion_func_t *)NULL;

  #define MALLOC(size) malloc((int) size);
  #define FREE(ptr) if(ptr){free((char*) ptr); ptr = 0;}
  char* stripleft(char* in) {
    char* ptr = in;
    while (*ptr && *ptr <= ' ')
      ptr++;
    if (in != ptr)
      memmove(in, ptr, strlen(ptr) + 1);
    return in;
  }
  char* stripright(char* in) {
    char* ptr;
    for (ptr = strchr(in, '\0') - 1; ptr >= in&&*ptr <= ' '; ptr--)
      *ptr = '\0';
    return in;
  }
  char* stripwhite(char* in) {
    stripleft(in);
    stripright(in);
    return in;
  }
  int blank_line(char* str) {
    char* ptr;
    for (ptr = str; ptr&&*ptr; ptr++) {
      char c = *ptr;
      if (!((' ' == c) || ('\t' == c) || ('\n' == c))) return 0;
    }
    return 1;
  }
  int TclReadlineLineComplete() {
    return !(tclrl_state == LINE_PENDING);
  }
  void TclReadlineTerminate(int state) {
    tclrl_state = state;
    rl_callback_handler_remove();
  }
  void TclReadlineReadHandler(ClientData, int mask) {
    if (mask && TCL_READABLE) {
      rl_callback_read_char();
    }
  }
  void TclReadlineLineCompleteHandler(char* ptr) {
    if (!ptr) {
      TclReadlineTerminate(LINE_EOF);
    } else {
      char* expansion = (char*)NULL;
      int status = history_expand(ptr, &expansion);
      if (status >= 1) {
        printf("%s\n", expansion);
      } else if (status == -1) {
        Tcl_AppendResult(tclrl_interp, "error in history expansion\n", (char*)NULL);
        TclReadlineTerminate(TCL_ERROR);
      }
      Tcl_AppendResult(tclrl_interp, expansion, (char*)NULL);
      if (expansion && *expansion && (!tclrl_last_line || strcmp(tclrl_last_line, expansion))) {
        add_history(expansion);
      }
      if (tclrl_last_line) FREE(tclrl_last_line);
      tclrl_last_line = strdup(expansion);
      TclReadlineTerminate(LINE_COMPLETE);
      free(ptr);
      FREE(expansion);
    }
  }
  char* FirrtlsynCommandsGenerator(const char* text, int state) {
    static int list_index;
    static size_t len;
    const char *name;
    if (!state) {
      list_index = 0;
      len = strlen(text);
    }
    int num_internal_cmds = 1;
    static const char* internal_cmds[] = { "ls" };
    int num_firrtlsyn_cmds = gCommands.numCmds();
    int num_cmds = num_firrtlsyn_cmds + num_internal_cmds;
    while (list_index < num_cmds) {
      if (list_index < num_firrtlsyn_cmds) {
        name = gCommands.commands(list_index).c_str();
      } else {
        name = internal_cmds[list_index - num_firrtlsyn_cmds];
      }
      list_index++;
      if (strncmp(name, text, len) == 0) {
        return (strdup(name));
      }
    }
    return ((char *)NULL);
  }
  char* FirrtlsynCommandsOptionGenerator(const char* text, int state) {
    static int list_index;
    static size_t len;
    if (text == NULL || text[0] != '-')
      return ((char *)NULL);
    if (!state) {
      list_index = 0;
      len = strlen(text);
    }
    char* cmd = strdup(rl_line_buffer);
    stripwhite(cmd);
    char* p = cmd;
    while (*p && *p != ' ') {
      p++;
    }
    if (*p == ' ') { 
      (*p) = '\0';
    }
    std::vector<std::string> option_names;
    std::vector<Commands::Option> options = gCommands.command_options(cmd);
    if (options.size() > 0) {
      for (size_t i = 0; i < options.size(); i++) {
        option_names.push_back(options[i].option);
      }
    } else {
      // for external lib commands 
    }
    FREE(cmd);
    int num_options = static_cast<int>(option_names.size());
    while (list_index < num_options) {
      const char* name = option_names[list_index].c_str();
      list_index++;
      if (strncmp(name, text, len) == 0) {
        return (strdup(name));
      }
    }
    return ((char*)NULL);
  }
  char* FirrtlsynTclVarGenerator(const char* text, int state) {
    static int list_index;
    static size_t len;
    static Tcl_Obj** objv;
    static int objc = 0;
    static char** matches;
    int length;
    if (text == NULL || text[0] != '$')
      return ((char*)NULL);
    if (!state) {
      list_index = 0;
      len = strlen(text);
      for (int i = 0; i < objc; i++) {
        FREE(matches[i]);
      }
      FREE(matches);
      objc = 0;
      Tcl_ResetResult(tclrl_interp);
      Tcl_Eval(tclrl_interp, "info_vars");
      static Tcl_Obj* obj = Tcl_GetObjResult(tclrl_interp);
      int status = Tcl_ListObjGetElements(tclrl_interp, obj, &objc, &objv);
      if (TCL_OK != status) {
        return ((char*)NULL);
      }
      if (objc > 0) {
        matches = (char**)MALLOC(sizeof(char*) * (objc + 1));
        for (int i = 0; i < objc; i++) {
          char* match = Tcl_GetStringFromObj(objv[i], &length);
          matches[i] = (char*)MALLOC(length + 2);
          strcpy(matches[i], "$");
          strcat(matches[i], match);
        }
      }
      Tcl_ResetResult(tclrl_interp);
    }
    while (list_index < objc) {
      const char *name = matches[list_index];
      list_index++;
      if (strncmp(name, text, len) == 0) {
        return (strdup(name));
      }
    }
    return ((char*)NULL);
  }
  char** FirrtlsynCommandsCompletion(const char* text, int start, int end) {
    char **matches;
    matches = (char **)NULL;
    if (start == 0)
      matches = rl_completion_matches(text, FirrtlsynCommandsGenerator);
    else if (text && text[0] == '-')
      matches = rl_completion_matches(text, FirrtlsynCommandsOptionGenerator);
    else if (text && text[0] == '$')
      matches = rl_completion_matches(text, FirrtlsynTclVarGenerator);
    return matches;
  }
  void FirrtlsynReadLineInit(const char* history_file) {
    rl_readline_name = "firrtlsyn_tclreadline";
    rl_basic_word_break_characters = " \t\n\\@$=;|&[]";
    rl_special_prefixes = "$";

    using_history();

    // auto command completion
    rl_attempted_completion_function = FirrtlsynCommandsCompletion;
    if (read_history(history_file)) {
      if (write_history(history_file)) {
        Tcl_AppendResult(tclrl_interp, "warning: `", history_file, "` is not writable.", (char*)NULL);
      }
    }
  }
#endif
  void FirrtlsynReadLineLoop(Tcl_Interp* interp) {
#ifndef WIN32
    const char* prompt = "FirrtlSyn>";
    tclrl_interp = interp;
    const char* history_file = ".firrtlsyn_history_cmd";
    FirrtlsynReadLineInit(history_file);
#endif
    if (init_tcl_file) {
      Tcl_EvalFile(interp, init_tcl_file);
      const char* result = Tcl_GetStringResult(interp);
      if (strlen(result) > 0)
        printf("%s\n", result);
      Tcl_Eval(interp, "exit");
    }
#ifndef WIN32
    while (true) {
      rl_callback_handler_install(prompt, TclReadlineLineCompleteHandler);
      Tcl_CreateFileHandler(0, TCL_READABLE, TclReadlineReadHandler, (ClientData)NULL);
      tclrl_state = LINE_PENDING;
      while (!TclReadlineLineComplete()) {
        Tcl_DoOneEvent(TCL_ALL_EVENTS);
      }
      Tcl_DeleteFileHandler(0);
      if (tclrl_last_line) {
        Tcl_Eval(interp, tclrl_last_line);
        write_history(history_file);
        const char *result = Tcl_GetStringResult(interp);
        if (strlen(result) > 0)
          printf("%s\n", result);
      }
    }
#endif // !WIN32
  }

}
