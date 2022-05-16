//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_TIME_H
#define UTILITY_TIME_H

#include <stdio.h>
#include <time.h>
#ifdef WIN32
#include "utility/win32.h"
#else
#include <sys/time.h>
#endif // WIN32

#ifdef WIN32
#ifndef HAVE_STRUCT_TIMESPEC
#define HAVE_STRUCT_TIMESPEC 1
struct timespec {
  long tv_sec; //second
  long tv_nsec;//nanosecond
};
#endif
#endif // WIN32

namespace firrtlsyn {
  class Time {
  public:
    Time() {
      tp_prev.tv_sec = 0;
      tp_prev.tv_nsec = 0;
    }

    int getProcessCpuTime(struct timespec *tp);
    int getThreadCpuTime(struct timespec *tp);
    int getElapsedTime(struct timeval *tp);
  private:
    timespec tp_prev;
  };
}


#endif
