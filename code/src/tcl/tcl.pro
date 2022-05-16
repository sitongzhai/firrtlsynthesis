!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}

TEMPLATE = lib
CONFIG += staticlib

SOURCES += commands.cpp register_commands.cpp tcl_init.cpp