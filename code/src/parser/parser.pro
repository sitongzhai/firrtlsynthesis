!include($$top_srcdir/common.pri) {
    error("Couldn't find the common.pri file!")
}

#unix: {
#    #FLEX_SOURCE = firrtl.l
#    #BISON_SOURCE = firrtl.y
#
#    #flex.input = FLEX_SOURCE
#    #flex.output = firrtl_lexer.cc
#    #flex.commands = flex -d --nounistd -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_IN}
#    #flex.clean = ${QMAKE_FILE_OUT}
#    #flex.variable_out = SOURCES
#    #flex.CONFIG = targe_predeps
#    #QMAKE_EXTRA_COMPILERS += flex
#
#    #bison.input = BISON_SOURCE
#    #bison.output = firrtl_parser.tab.cc
#    #bison.commands = bison -o ${QMAKE_FILE_OUT} -t -d -r all ${QMAKE_FILE_IN}
#    #bison.clean = firrtl_parser.tab.cc firrtl_parser.output
#    #bison.variable_out = SOURCES
#    #bison.CONFIG = target_predeps
#    #QMAKE_EXTRA_COMPILERS += bison
#
#    BISON_RUN = bison.run
#    csh.input = BISON_RUN
#    csh.output = bison.log
#    csh.commands = /bin/csh -f ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
#    csh.clean = ${QMAKE_FILE_OUT}
#    csh.CONFIG = target_predeps
#    QMAKE_EXTRA_COMPILERS += csh
#}


TEMPLATE = lib
CONFIG += staticlib

QMAKE_CXXFLAGS -= /WX

SOURCES += fir_analyzer.cpp firrtl_tab.cc firrtl_lex.cc
HEADERS += firrtl_tab.h

RESOURCES += firrtl.l firrtl.y            