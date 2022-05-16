//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "utility/utility.h"
#include "utility/assert.h"
#include "utility/time.h"

#ifdef WIN32

int gettimeofday(struct timeval *tp) {
  time_t clock;
  struct tm tm;
  SYSTEMTIME wtm;
  GetLocalTime(&wtm);
  tm.tm_year = wtm.wYear - 1900;
  tm.tm_mon = wtm.wMonth - 1;
  tm.tm_mday = wtm.wDay;
  tm.tm_hour = wtm.wHour;
  tm.tm_min = wtm.wMinute;
  tm.tm_sec = wtm.wSecond;
  tm.tm_isdst = -1;
  clock = mktime(&tm);
  tp->tv_sec = static_cast<long>(clock);
  tp->tv_usec = static_cast<long>(wtm.wMilliseconds * 1000);
  return (0);
}

LARGE_INTEGER getFILETIMEoffset() {
  SYSTEMTIME s;
  FILETIME f;
  LARGE_INTEGER t;

  s.wYear = 1970;
  s.wMonth = 1;
  s.wDay = 1;
  s.wHour = 0;
  s.wMinute = 0;
  s.wSecond = 0;
  s.wMilliseconds = 0;
  SystemTimeToFileTime(&s, &f);
  t.QuadPart = f.dwHighDateTime;
  t.QuadPart <<= 32;
  t.QuadPart |= f.dwLowDateTime;
  return (t);
}

int clock_gettime(int /*X*/, struct timespec *tv) {
  FILETIME createTime, exitTime, kernelTime, userTime;
  GetProcessTimes(GetCurrentProcess(), &createTime, &exitTime, &kernelTime, &userTime);
  //userTime and kernelTime's unit is 100-nanosecond
  LARGE_INTEGER user_time, kernel_time, cpu_time;
  user_time.HighPart = userTime.dwHighDateTime;
  user_time.LowPart = userTime.dwLowDateTime;
  kernel_time.HighPart = kernelTime.dwHighDateTime;
  kernel_time.LowPart = kernelTime.dwLowDateTime;

  cpu_time.QuadPart = (user_time.QuadPart + kernel_time.QuadPart) * 100;
  tv->tv_sec = static_cast<long>(cpu_time.QuadPart / 1000000000);
  tv->tv_nsec = static_cast<long>(cpu_time.QuadPart % 1000000000);
  return 0;
}

#endif

namespace firrtlsyn {

  int Time::getProcessCpuTime(struct timespec *tp) {
    if (tp == NULL) return 0;
#ifdef WIN32
    int ret_val = clock_gettime(0, tp);
#else
    int ret_val = clock_gettime(CLOCK_PROCESS_CPUTIME_ID, tp);
#endif
    tp_prev = *tp;
    fs_assert(ret_val == 0);
    return ret_val;
  }

  int Time::getThreadCpuTime(struct timespec *tp) {
    if (tp == NULL) return 0;
#ifdef WIN32
    int ret_val = clock_gettime(0, tp);
#else
    int ret_val = clock_gettime(CLOCK_THREAD_CPUTIME_ID, tp);
#endif
    fs_assert(ret_val == 0);
    return ret_val;
  }

  int Time::getElapsedTime(struct timeval *t) {
    if (t == NULL) return 0;
#ifdef WIN32
    int ret_val = gettimeofday(t);
#else
    int ret_val = gettimeofday(t, NULL);
#endif
    return ret_val;
  }

}