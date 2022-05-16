CONFIG -= flat
CONFIG += depend_includepath

DEFINES += GIT_REVISION='\\"$$system(git describe --always --tags)\\"'

CONFIG += debug_and_release
CONFIG(debug, debug|release) {
    OPTMODE = dbg
} else {
    OPTMODE = opt
}

ARCH = $$QMAKE_HOST.os

OBJECTS_DIR = ../../obj/$$ARCH/$$OPTMODE/$$TARGET
DESTDIR = ../../lib/$$ARCH/$$OPTMODE

unix:top_include_path = ../../../thirdparty/Linux/
win32:top_include_path = ../../../thirdparty/Windows/
unix:top_lib_path = ../../../thirdparty/Linux/
win32:top_lib_path = ../../../thirdparty/Windows/

unix {
    QMAKE_CXXFLAGS += -ansi -pedantic
#    QMAKE_CXXFLAGS += -Werror
    QMAKE_CXXFLAGS += -Wall -W
    QMAKE_CXXFLAGS += -Wconversion
    QMAKE_CXXFLAGS += -Wwrite-strings
    QMAKE_CXXFLAGS += -Wpointer-arith -Wcast-qual -Wcast-align
    QMAKE_CXXFLAGS += -std=c++11
    QMAKE_CXXFLAGS_DEBUG += -femit-class-debug-always
    QMAKE_CXXFLAGS_DEBUG *= -O0
    QMAKE_CXXFLAGS_RELEASE -= -O2
    QMAKE_CXXFLAGS_RELEASE *= -O3
}
win32 {
    QMAKE_CXXFLAGS += /bigobj
    QMAKE_CXXFLAGS += /MP
    QMAKE_CXXFLAGS += /Wall
    QMAKE_CFLAGS_RELEASE -= Zc:strictStrings
    QMAKE_CXXFLAGS_RELEASE -= Zc:strictStrings
}

DEFINES += READLINE_LIBRARY
CONFIG(debug, debug|release) {
    DEFINES += DEBUG
}


MODULES = io utility tcl parser elaborate db


INCLUDEPATH += . \
               $$top_srcdir/include \
               $$top_include_path/tcl/include \
               $$top_include_path/miracl/include \

unix: INCLUDEPATH += $$top_include_path/readline/include/readline

win32: INCLUDEPATH += $$top_include_path/pthread/include              

