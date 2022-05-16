//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef UTILITY_ASSERT_H
#define UTILITY_ASSERT_H

#include <assert.h>
#include "utility/utility.h"
#include "utility/exception.h"

#ifndef _EF_FUNC_
#ifdef WIN32
#define _EF_FUNC_  __FUNCTION__
#else
#define _EF_FUNC_  __func__
#endif
#endif

namespace firrtlsyn {
#define fs_assert(exp) { \
  if(!(exp)){ \
    fs_info("%s:%d:%s\n\"%s\"\n", __FILE__, __LINE__, _EF_FUNC_, #exp); \
    firrtlsyn::dump_stack(); \
    throw firrtlsyn::Exception("assert error!"); \
  } \
}

}


#endif
