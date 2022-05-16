!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}
TEMPLATE = subdirs
CONFIG += ordered

win32: SUBDIRS += src/main

for(module, MODULES) {
    exists(src/$${module}) {
        SUBDIRS += src/$${module}
    }
}

unix: SUBDIRS += src/main

for(module, MODULES) {
    exists(src/$${module}) {
        main.depends += $${module}
    }
}
