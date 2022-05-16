//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_WIN32_H
#define UTILITY_WIN32_H

#ifdef WIN32

#include <windows.h>
#include <windef.h>

#ifdef min
#undef min
#endif

#ifdef max
#undef max
#endif

#ifndef _WIN_TOLOWER_
#define _WIN_TOLOWER_
//#define __tolower(c) ((('A' <= (c))&&((c) <= 'Z')) ? ((c) - 'A' + 'a') : (c))
inline char __tolower(char c) {
  if ('A' <= c && c <= 'Z') return c - 'A' + 'a';
  else return c;
}
#endif

#ifndef _WIN_STRCASECMP_
#define _WIN_STRCASECMP_
inline int strcasecmp(const char *s1, const char *s2) {
  const unsigned char *p1 = (const unsigned char *)s1;
  const unsigned char *p2 = (const unsigned char *)s2;
  int result = 0;

  if (p1 == p2) {
    return 0;
  }

  while ((result = __tolower(*p1) - __tolower(*p2)) == 0) {
    if (*p1++ == '\0') {
      break;
    }
    p2++;
  }

  return result;
}
#endif

#ifndef _WIN_STRNCASECMP_
#define _WIN_STRNCASECMP_
inline int strncasecmp(const char *s1, const char *s2, const size_t length) {
  const unsigned char *p1 = (const unsigned char *)s1;
  const unsigned char *p2 = (const unsigned char *)s2;

  if (p1 == p2) {
    return 0;
  }

  int n = (int)(length);
  while (--n >= 0 && __tolower(*p1) == __tolower(*p2++)) {
    if (*p1++ == '\0') {
      return 0;
    }
  }

  return(n < 0 ? 0 : __tolower(*p1) - __tolower(*--p2));
}
#endif

#endif

#endif
