!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}

TEMPLATE = lib
CONFIG += staticlib

SOURCES += infer.cpp width_infer.cpp mport_infer.cpp value_infer.cpp check_assign.cpp transfer_post.cpp transfer_module.cpp macro_cells.cpp