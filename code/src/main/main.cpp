//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <stdlib.h>
#include <string>
#include <pthread.h>
#include <time.h>
#include <stdlib.h>
#ifndef WIN32
#include <sys/resource.h>
#include <signal.h>
#include <unistd.h>
#include <execinfo.h>
#else
#include <Windows.h>
#include <Psapi.h>
#endif

#include "utility/var.h"
#include "utility/utility.h"
#include "tcl/commands.h"

namespace firrtlsyn {

  FILE* fp_ = NULL;

  void StartTime() {
    time_t rawtime;
    struct tm* timeinfo;
    char buffer[256];
    time(&rawtime);
    timeinfo = localtime(&rawtime);
    strftime(buffer, 256, "%Y-%m-%d %H:%M:%S", timeinfo);
    fs_info("Start Time: %s\n", buffer);
  }
  void BuildTime() {
    int year, day;
    char month[4];
    memset(month, 0, 3);
    uint8_t i_month = 0;
    sscanf(__DATE__, "%s %d %d", month, &day, &year);
    static const char *op_month[] = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
    for (int i = 0; i < 12; i++) {
      if (memcmp(month, op_month[i], 3) == 0) {
        i_month = (uint8_t)(i + 1);
        break;
      }
    }
    char buf[12] = { 0 };
    sprintf(buf, "%d-%02d-%02d", year, i_month, day);
    fs_info("Build Time: %s %s\n", buf, __TIME__);
  }
  void Version() {
    fs_info("FirrtlSyn 1.0\n");
#ifdef GIT_REVISION
    const char* reversion = GIT_REVISION;
    if (reversion != NULL) {
      fs_info("Git Version: %s\n", reversion);
    }
#endif
  }

  extern char* init_tcl_file;
}

void* MemoryTraceFunc(void*);

#ifdef WIN32
// hidden win32 dos-style window 
#pragma comment(linker, "/subsystem:\"windows\" /entry:\"mainCRTStartup\"")
long __stdcall CrashCallback(_EXCEPTION_POINTERS* excp) {
  fs_info("Error address: %p", excp->ExceptionRecord->ExceptionAddress);

  return EXCEPTION_EXECUTE_HANDLER;
}
#else
void SigRoutine(int signo) {
  switch (signo) {
  case SIGSEGV:
  case SIGBUS:
    fs_info("We encountered some problems while executing current command.\nIt may be caused by the environment, the input data, or other unexpected conditions.\nFatal error! Abnormal exit!\n");
    firrtlsyn::dump_stack();
    exit(-1);
    break;
  }
}
#endif

int main(int argc, char** argv) {

  std::string log_name = "./firrtlsyn.log";
  firrtlsyn::fp_ = fopen(log_name.c_str(), "w");

#ifdef WIN32
  SetUnhandledExceptionFilter(CrashCallback);
  AllocConsole();
  freopen("CONIN$", "r", stdin);
  freopen("CONOUT$", "w", stdout);
  freopen("CONOUT$", "w", stderr);
#else
  struct sigaction act, oldact;
  act.sa_handler = SigRoutine;
  act.sa_flags = SA_NODEFER;
  sigaction(SIGSEGV, &act, &oldact);
  sigaction(SIGBUS, &act, &oldact);
#endif

  firrtlsyn::Version();
  firrtlsyn::BuildTime();
  firrtlsyn::StartTime();

  firrtlsyn::init_tcl_file = NULL;
  if (argc > 1 && argv[1][0] != '-') {
    firrtlsyn::init_tcl_file = argv[1];
  }

  pthread_t thread_mem_trace;
  pthread_create(&thread_mem_trace, NULL, MemoryTraceFunc, NULL);

  firrtlsyn::Commands::init(argc, argv);

  fclose(firrtlsyn::fp_);
  firrtlsyn::fp_ = NULL;

  exit(0);
}

void* MemoryTraceFunc(void*) {
#ifdef WIN32
  while (true) {
    PROCESS_MEMORY_COUNTERS info;
    GetProcessMemoryInfo(GetCurrentProcess(), &info, sizeof(info));
    firrtlsyn::DataVar::firrtlsyn_peak_used_memory_ = static_cast<int>(info.PeakWorkingSetSize) / 1024 / 1024;
    firrtlsyn::DataVar::current_used_memory_ = static_cast<int>(info.WorkingSetSize) / 1024 / 1024;

    if (!firrtlsyn::DataVar::cmd_started_)
      firrtlsyn::DataVar::cmd_peak_used_memory_ = firrtlsyn::DataVar::current_used_memory_;
    else if (firrtlsyn::DataVar::cmd_peak_used_memory_ < firrtlsyn::DataVar::current_used_memory_)
      firrtlsyn::DataVar::cmd_peak_used_memory_ = firrtlsyn::DataVar::current_used_memory_;
    Sleep(1);
  }
#else
  while (true) {
    rusage usage;
    getrusage(RUSAGE_SELF, &usage);
    int ru_maxrss = static_cast<int>(usage.ru_maxrss / 1024); //MB
    firrtlsyn::DataVar::firrtlsyn_peak_used_memory_ = ru_maxrss; // MB
    firrtlsyn::DataVar::current_used_memory_ = firrtlsyn::getCurrentUsedMemory();
    if (!firrtlsyn::DataVar::cmd_started_)
      firrtlsyn::DataVar::cmd_peak_used_memory_ = firrtlsyn::DataVar::current_used_memory_;
    else if (firrtlsyn::DataVar::cmd_peak_used_memory_ < firrtlsyn::DataVar::current_used_memory_)
      firrtlsyn::DataVar::cmd_peak_used_memory_ = firrtlsyn::DataVar::current_used_memory_;
    usleep(1000);
  }
#endif
  return NULL;
}
