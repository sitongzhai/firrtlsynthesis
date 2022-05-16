!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}

TEMPLATE = lib
CONFIG += staticlib

SOURCES += fir_type.cpp fir_db.cpp fir_circuit.cpp fir_item.cpp fir_module.cpp fir_expression.cpp verilog_db.cpp