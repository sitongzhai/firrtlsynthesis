!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}

TEMPLATE = app

unix {
    contains(QMAKE_HOST.arch, x86_64) {
        QMAKE_LFLAGS += -mcmodel=medium
    }
    QMAKE_LFLAGS_RELEASE -= -O1
    QMAKE_LFLAGS_RELEASE *= -O3
}

win32 {
    !contains(QMAKE_HOST.arch, x86_64) {
        QMAKE_LFLAGS += /LARGEADDRESSAWARE
    }
    QMAKE_LFLAGS += psapi.lib
    QMAKE_LFLAGS += /SAFESEH:NO
    QMAKE_LFLAGS += /NODEFAULTLIB:libc.lib /NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:libcd.lib /NODEFAULTLIB:libcmtd.lib
}

QMAKE_LIBDIR += $$top_srcdir/lib/$$ARCH/$$OPTMODE/

unix {
    LIBS += -Xlinker "'-('"
    for(module, MODULES) {
        LIBS += -l$$module
    }
    LIBS += -Xlinker "'-)'"
}
win32 {
    for(module, MODULES) {
        LIBS += $${module}.lib
    }
}

unix {
    for(module, MODULES) {
        PRE_TARGETDEPS += $$top_srcdir/lib/$$ARCH/$$OPTMODE/lib$${module}.a
    }
}

unix:LIBS += -L$$top_lib_path/miracl -lmiracl
win32:LIBS += $$top_lib_path/miracl/miracl.lib

unix:LIBS += -L$$top_lib_path/tcl -ltcl8.4
win32:LIBS += $$top_lib_path/tcl/tcl84.lib

#unix:
win32:LIBS += $$top_lib_path/pthread/pthreadVC2.lib

unix:LIBS += -L$$top_lib_path/readline -lreadline -lhistory
unix:LIBS += -L/lib/x86_64-linux-gnu -ltinfo

DESTDIR = ../../bin/$$ARCH/
OBJECTS_DIR = ../../obj/$$ARCH/$$OPTMODE/$$TARGET/

unix {
    QMAKE_CXXFLAGS -= -Werror
}

SOURCES += main.cpp 

TARGET = firrtlsyn
contains(CONFIG, gprof) {
    TARGET = $$join(TARGET,,,-gprof)
} else {
    CONFIG(debug, debug|release) {
        TARGET = $$join(TARGET,,,-debug)
    }
}

win32:QMAKE_PROJECT_NAME = firrtlsyn
