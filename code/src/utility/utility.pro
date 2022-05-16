!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}

TEMPLATE = lib
CONFIG += staticlib

unix {
    QMAKE_CXXFLAGS -= -Werror
}
win32 {
    QMAKE_CXXFLAGS -= /WX
}

SOURCES += app.cpp time.cpp utility.cpp var.cpp big_int.cpp