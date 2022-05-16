%{
//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* run with bison 2.4.1
//* command: bison -p firrtl -d firrtl.y
//* Last updated: 2022-05-15
//******************************************************************************

#include <stdlib.h>
#include <tuple>
#include <vector>
#include <stack>
#include "db/fir_db.h"
#include "db/fir_circuit.h"
#include "db/fir_module.h"
#include "db/fir_item.h"
#include "db/fir_type.h"
#include "db/fir_expression.h"
#include "utility/assert.h"


//#define YYINITDEPTH 10000
//#define YYMAXDEPTH 100000

void yyerror(const char *errMsg);
extern int firrtllex();
extern int firrtllineno;

enum IndentStatus {
    kIndent,
    kReplace,
    kDedent,
    kIndentStatusUndef
};


firrtlsyn::firDB::firLibrary* cur_lib = NULL;
firrtlsyn::firDB::firCircuit* cur_circuit = NULL;
firrtlsyn::firDB::firModule* cur_module = NULL;
firrtlsyn::firDB::firItemConditional* cur_cond = NULL;
firrtlsyn::firDB::firItemMemory* cur_mem = NULL;
firrtlsyn::firDB::firItemRegister* cur_reg = NULL;

std::stack<std::pair<char*, firrtlsyn::firDB::firLocObj*>> indents_stack;
IndentStatus check_indent_status(char* indent, char* last_indent) {
    size_t indent_length = strlen(indent);
    size_t last_length = strlen(last_indent);
    if (indent_length > last_length) {
        return IndentStatus::kIndent;
    } else if (indent_length == last_length) {
        return IndentStatus::kReplace;
    } else {
        return IndentStatus::kDedent;
    }
}
void add_circuit_indent(char* indent, firrtlsyn::firDB::firCircuit* circuit) {
    fs_assert(cur_circuit == NULL);
    fs_assert(indents_stack.empty());
    fs_assert(circuit != NULL);
    cur_circuit = circuit;
    indents_stack.push(std::make_pair(indent, circuit));
}
void add_module_indent(char* indent, firrtlsyn::firDB::firModule* module) {
    fs_assert(module != NULL);
    IndentStatus indent_status = check_indent_status(indent, indents_stack.top().first);
    if (indent_status == IndentStatus::kReplace) {
        char* current_indent = indents_stack.top().first;
        fs_assert(strcmp(indent, current_indent) == 0);
        free(current_indent);
        indents_stack.pop();
    } else if (indent_status == IndentStatus::kIndent) {
        fs_assert(indents_stack.size() == 1);
    } else if (indent_status == IndentStatus::kDedent) {
        char* current_indent = indents_stack.top().first;
        do {
            free(current_indent);
            indents_stack.pop();
            current_indent = indents_stack.top().first;
            indent_status = check_indent_status(indent, current_indent);
        } while (indent_status == IndentStatus::kDedent);
        fs_assert(indent_status == IndentStatus::kReplace);
        fs_assert(indents_stack.size() == 2);
        free(current_indent);
        indents_stack.pop();
    } else {
        fs_assert(0);
    }
    cur_module = module;
    cur_cond = NULL;
    cur_mem = NULL;
    indents_stack.push(std::make_pair(indent, module));
}
void add_item_indent(char* indent, firrtlsyn::firDB::firItem* item) {
    fs_assert(indents_stack.size() >= 2);
    IndentStatus indent_status = check_indent_status(indent, indents_stack.top().first);
    if (indent_status == IndentStatus::kReplace) {
        char* current_indent = indents_stack.top().first;
        fs_assert(strcmp(indent, current_indent) == 0);
        free(current_indent);
        indents_stack.pop();
        cur_cond = dynamic_cast<firrtlsyn::firDB::firItemConditional*>(indents_stack.top().second);
        cur_mem = dynamic_cast<firrtlsyn::firDB::firItemMemory*>(indents_stack.top().second);
        cur_reg = dynamic_cast<firrtlsyn::firDB::firItemRegister*>(indents_stack.top().second);
        indents_stack.push(std::make_pair(indent, item));
    } else if (indent_status == IndentStatus::kIndent) {
        indents_stack.push(std::make_pair(indent, item));
    } else if (indent_status == IndentStatus::kDedent) {
        char* current_indent = indents_stack.top().first;
        do {
            fs_assert(indents_stack.size() > 1);
            free(current_indent);
            indents_stack.pop();
            current_indent = indents_stack.top().first;
            indent_status = check_indent_status(indent, current_indent);
        } while (indent_status == IndentStatus::kDedent);
        fs_assert(indent_status == IndentStatus::kReplace);
        fs_assert(indents_stack.size() >= 3);
        free(current_indent);
        indents_stack.pop();
        cur_mem = dynamic_cast<firrtlsyn::firDB::firItemMemory*>(indents_stack.top().second);
        cur_cond = dynamic_cast<firrtlsyn::firDB::firItemConditional*>(indents_stack.top().second);
        cur_reg = dynamic_cast<firrtlsyn::firDB::firItemRegister*>(indents_stack.top().second);
        indents_stack.push(std::make_pair(indent, item));
    } else {
        fs_assert(0);
    }
}
void add_mem_field_indent(char* indent) {
    fs_assert(indents_stack.size() >= 3);
    fs_assert(cur_mem != NULL);
    IndentStatus indent_status = check_indent_status(indent, indents_stack.top().first);
    if (indent_status == IndentStatus::kIndent) {
        indents_stack.push(std::make_pair(indent, static_cast<firrtlsyn::firDB::firLocObj*>(NULL)));
    } else if (indent_status == IndentStatus::kReplace) {
        free(indents_stack.top().first);
        indents_stack.pop();
        indents_stack.push(std::make_pair(indent, static_cast<firrtlsyn::firDB::firLocObj*>(NULL)));
    } else {
        fs_assert(0);
    }
}
void add_regreset_block_indent(char* indent) {
    fs_assert(indents_stack.size() >= 3);
    fs_assert(cur_reg != NULL);
    IndentStatus indent_status = check_indent_status(indent, indents_stack.top().first);
    fs_assert(indent_status == IndentStatus::kIndent);
    indents_stack.push(std::make_pair(indent, static_cast<firrtlsyn::firDB::firLocObj*>(NULL)));
}
void add_extmodule_item_indent(char* indent) {
    fs_assert(cur_module->isExtModule());
    fs_assert(cur_cond == NULL);
    fs_assert(cur_mem == NULL);
    IndentStatus indent_status = check_indent_status(indent, indents_stack.top().first);
    if (indent_status == IndentStatus::kReplace) {
        fs_assert(indents_stack.size() == 3);
        fs_assert(strcmp(indent, indents_stack.top().first) == 0);
        free(indents_stack.top().first);
        indents_stack.pop();
    } else if (indent_status == IndentStatus::kIndent) {
        fs_assert(indents_stack.size() == 2);
    } else {
        fs_assert(0);
    }
    fs_assert(indents_stack.size() == 2);
    indents_stack.push(std::make_pair(indent, static_cast<firrtlsyn::firDB::firLocObj*>(NULL)));
}
firrtlsyn::firDB::firItemConditional* add_else_indent(char* indent, firrtlsyn::firDB::firItemConditional* item_else) {
    fs_assert(indents_stack.size() >= 3);
    firrtlsyn::firDB::firItemConditional* item_when = NULL;
    IndentStatus indent_status = check_indent_status(indent, indents_stack.top().first);
    if (indent_status == IndentStatus::kReplace) {
        item_when = dynamic_cast<firrtlsyn::firDB::firItemConditional*>(indents_stack.top().second);
        fs_assert(item_when != NULL);
        free(indents_stack.top().first);
        indents_stack.pop();
        //cur_cond = item_else;
        cur_cond = dynamic_cast<firrtlsyn::firDB::firItemConditional*>(indents_stack.top().second);
        cur_mem = dynamic_cast<firrtlsyn::firDB::firItemMemory*>(indents_stack.top().second);
        cur_reg = dynamic_cast<firrtlsyn::firDB::firItemRegister*>(indents_stack.top().second);
        indents_stack.push(std::make_pair(indent, item_else));
    } else if (indent_status == IndentStatus::kDedent) {
        char* current_indent = indents_stack.top().first;
        do {
            fs_assert(indents_stack.size() >= 3);
            free(current_indent);
            indents_stack.pop();
            current_indent = indents_stack.top().first;
            indent_status = check_indent_status(indent, current_indent);
        } while (indent_status == IndentStatus::kDedent);
        fs_assert(indent_status == IndentStatus::kReplace);
        item_when = dynamic_cast<firrtlsyn::firDB::firItemConditional*>(indents_stack.top().second);
        fs_assert(item_when != NULL);
        free(current_indent);
        indents_stack.pop();
        //cur_cond = item_else;
        cur_cond = dynamic_cast<firrtlsyn::firDB::firItemConditional*>(indents_stack.top().second);
        cur_mem = dynamic_cast<firrtlsyn::firDB::firItemMemory*>(indents_stack.top().second);
        cur_reg = dynamic_cast<firrtlsyn::firDB::firItemRegister*>(indents_stack.top().second);
        indents_stack.push(std::make_pair(indent, item_else));
    } else {
        fs_assert(0);
    }
    return item_when;   
}
void free_indents() {
    while (indents_stack.size() > 0) {
        free(indents_stack.top().first);
        indents_stack.pop();
    }
}

%}

%error-verbose
%name-prefix "firrtl"
%defines "firrtl_tab.h"
%output "firrtl_tab.cc"
%locations

%union {
    char* string_value;
    int int_value;
    char char_value;
    firrtlsyn::firDB::PortDir port_dir_value;
    firrtlsyn::firDB::firType* type_value;
    firrtlsyn::firDB::firField* field_value;
    std::vector<firrtlsyn::firDB::firField*>* multi_field_value;
    firrtlsyn::firDB::RUW ruw_value;
    firrtlsyn::firDB::firExp* exp_value;
    firrtlsyn::firDB::MPortDir mport_dir_value;
    std::vector<firrtlsyn::firDB::firExp*>* multi_exp_value;
};


%token <string_value> kID
%token <string_value> kRELAXED_ID
%token <string_value> kUNSIGNEDINT
%token <string_value> kSIGNEDINT
%token <string_value> kHEXLIT
%token <string_value> kOCTALLIT
%token <string_value> kBINARYLIT
%token <string_value> kDOUBLELIT
%token <string_value> kQUOTED_STRING

%token kCOLON
%token kDOT
%token kQUESTION_MARK
%token kCOMMA
%token kBRACKET_L
%token kBRACKET_R
%token kBRACKET_SL
%token kBRACKET_SR
%token kPARENT_L
%token kPARENT_R
%token kSQUARE_LB
%token kSQUARE_RB
%token kBRACE_L
%token kBRACE_R
%token kASSIGN
%token kEQ
%token kQUOTATION_MARK
%token kAPOSTROPHE

%token kCIRCUIT
%token kMODULE
%token kEXTMODULE
%token kINPUT
%token kOUTPUT
%token kUINT
%token kSINT
%token kFIXED
%token kINTERVAL
%token kCLOCK
%token kASYNCRESET
%token kRESET
%token kANALOG
%token kFLIP
%token kWIRE
%token kMEM
%token kCMEM
%token kSMEM
%token kOLD
%token kNEW
%token kUNDEFINED
%token kINST
%token kOF
%token kSKIP
%token kDATATYPE
%token kDEPTH
%token kREADLATENCY
%token kWRITELATENCY
%token kREADUNDERWRITE
%token kREADER
%token kWRITER
%token kREADWRITER
%token kNODE
%token kDEFNAME
%token kPARAMETER
%token kMUX
%token kVALIDIF
%token kPRIMOPADD
%token kPRIMOPSUB
%token kPRIMOPMUL
%token kPRIMOPDIV
%token kPRIMOPREM
%token kPRIMOPLT 
%token kPRIMOPLEQ
%token kPRIMOPGT 
%token kPRIMOPGEQ
%token kPRIMOPEQ 
%token kPRIMOPNEQ
%token kPRIMOPPAD
%token kPRIMOPASUINT
%token kPRIMOPASASYNCRESET
%token kPRIMOPASSINT
%token kPRIMOPASCLOCK
%token kPRIMOPASFIXEDPOINT
%token kPRIMOPASINTERVAL
%token kPRIMOPSHL
%token kPRIMOPSHR
%token kPRIMOPDSHL
%token kPRIMOPDSHR
%token kPRIMOPCVT
%token kPRIMOPNEG
%token kPRIMOPNOT
%token kPRIMOPAND
%token kPRIMOPOR
%token kPRIMOPXOR
%token kPRIMOPANDR
%token kPRIMOPORR
%token kPRIMOPXORR
%token kPRIMOPCAT
%token kPRIMOPBITS
%token kPRIMOPHEAD
%token kPRIMOPTAIL
%token kPRIMOPINCP
%token kPRIMOPDECP
%token kPRIMOPSETP
%token kPRIMOPWRAP
%token kPRIMOPCLIP
%token kPRIMOPSQUZ
%token kREG
%token kWITH
%token kREGRESET
%token kMPORT
%token kINFER
%token kREAD
%token kWRITE
%token kRDWR
%token kCONNECT
%token kPARTIAL_CONNECT
%token kISINVALID
%token kIS
%token kINVALID
%token kSTOP
%token kPRINTF
%token kATTACH
%token kWHEN
%token kELSE





%token <string_value> kINFO
%token kNEWLINE
%token <string_value> kINDENT
%token <string_value> kCOMMENT
%token kEOF 0




%type <port_dir_value> PortDir
%type <type_value> Type
%type <type_value> TypeUInt
%type <type_value> TypeSInt
%type <type_value> TypeFixed
%type <type_value> TypeInterval
%type <type_value> TypeClock
%type <type_value> TypeAsyncReset
%type <type_value> TypeReset
%type <type_value> TypeAnalog
%type <type_value> TypeVector
%type <type_value> TypeBundle
%type <string_value> IntLit
%type <char_value> LowerBound
%type <char_value> UpperBound
%type <string_value> BoundValue
%type <field_value> Field
%type <multi_field_value> MultiField
%type <ruw_value> Ruw
%type <exp_value> Expression
%type <exp_value> ExpUInt
%type <exp_value> ExpUIntBits
%type <exp_value> ExpSInt
%type <exp_value> ExpSIntBits
%type <exp_value> ExpId
%type <exp_value> ExpSubfield
%type <exp_value> ExpDouble
%type <exp_value> ExpSubindex
%type <exp_value> ExpSubaccess
%type <exp_value> ExpMux
%type <exp_value> ExpValidif
%type <exp_value> ExpPrimOp
%type <exp_value> ExpPrimOpAdd
%type <exp_value> ExpPrimOpSub
%type <exp_value> ExpPrimOpMul
%type <exp_value> ExpPrimOpDiv
%type <exp_value> ExpPrimOpRem
%type <exp_value> ExpPrimOpLt
%type <exp_value> ExpPrimOpLeq
%type <exp_value> ExpPrimOpGt
%type <exp_value> ExpPrimOpGeq
%type <exp_value> ExpPrimOpEq
%type <exp_value> ExpPrimOpNeq
%type <exp_value> ExpPrimOpPad
%type <exp_value> ExpPrimOpAsUInt
%type <exp_value> ExpPrimOpAsAsyncReset
%type <exp_value> ExpPrimOpAsSInt
%type <exp_value> ExpPrimOpAsClock
%type <exp_value> ExpPrimOpAsFixedPoint
%type <exp_value> ExpPrimOpAsInterval
%type <exp_value> ExpPrimOpShl
%type <exp_value> ExpPrimOpShr
%type <exp_value> ExpPrimOpDshl
%type <exp_value> ExpPrimOpDshr
%type <exp_value> ExpPrimOpCvt
%type <exp_value> ExpPrimOpNeg
%type <exp_value> ExpPrimOpNot
%type <exp_value> ExpPrimOpAnd
%type <exp_value> ExpPrimOpOr
%type <exp_value> ExpPrimOpXor
%type <exp_value> ExpPrimOpAndr
%type <exp_value> ExpPrimOpOrr
%type <exp_value> ExpPrimOpXorr
%type <exp_value> ExpPrimOpCat
%type <exp_value> ExpPrimOpBits
%type <exp_value> ExpPrimOpHead
%type <exp_value> ExpPrimOpTail
%type <exp_value> ExpPrimOpIncp
%type <exp_value> ExpPrimOpDecp
%type <exp_value> ExpPrimOpSetp
%type <exp_value> ExpPrimOpWrap
%type <exp_value> ExpPrimOpClip
%type <exp_value> ExpPrimOpSquz
%type <mport_dir_value> MPortDir
%type <multi_exp_value> MultiExpression

%type <string_value> Id
%type <string_value> RelaxedId
%type <string_value> FieldId
%type <string_value> KeyworkAsId
%type <string_value> PrimopAsId
%type <string_value> Indent
%type <string_value> Info




%nonassoc EMPTY
%nonassoc kSQUARE_LB kBRACKET_L kBRACKET_SL





%destructor { delete $$; } MultiField
%destructor { delete $$; } MultiExpression



%start Firrtl

%%

Firrtl :
    FirrtlFile /*Endfile*/ {
        cur_lib = NULL;
        cur_circuit = NULL;
        cur_module = NULL;
        cur_cond = NULL;
        cur_mem = NULL;
        cur_reg = NULL;
        free_indents();
    }
    ;

FirrtlFile :
    FirrtlFileContent
    | FirrtlFile FirrtlFileContent
    ;

FirrtlFileContent :
    EmptyLine
    | CommentLine
    | Circuit
    | Module
    | ModuleItem
    | MemField
    | RegResetBlock
    | ExtmoduleItem
    ;

Circuit :
    Indent kCIRCUIT Id kCOLON Info Newline {
        cur_lib = firrtlsyn::firDB::getLib("work");
        firrtlsyn::firDB::firCircuit* circuit = cur_lib->addCircuit($3);
        free($3);
        circuit->set_info($5);
        free($5);
        circuit->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
        add_circuit_indent($1, circuit);
    }
    ;

Module :
    Indent kMODULE Id kCOLON Info Newline {
        firrtlsyn::firDB::firModule* module = cur_circuit->addModule(firrtlsyn::firDB::ModuleType::kModule, $3);
        free($3);
        module->set_info($5);
        free($5);
        module->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
        add_module_indent($1, module);
    }
    | Indent kEXTMODULE Id kCOLON Info Newline {
        firrtlsyn::firDB::firModule* module = cur_circuit->addModule(firrtlsyn::firDB::ModuleType::kExtModule, $3);
        free($3);
        module->set_info($5);
        free($5);
        module->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
        add_module_indent($1, module);
    }
    ;

ModuleItem :
    ItemPort
    | ItemWire
    | ItemRegister
    | ItemMemory
    | ItemCMemory
    | ItemSMemory
    | ItemMPort
    | ItemInstance
    | ItemNode
    | ItemConnect
    | ItemPartialConnect
    | ItemInvalidate
    | ItemWhen
    | ItemElse
    | ItemStop
    | ItemPrintf
    | ItemEmpty
    | ItemAttach
    ;

ExtmoduleItem :
    Defname
    | Parameter
    ;

Defname :
    Indent kDEFNAME kEQ Id Info Newline {
        fs_assert(cur_module->defname() == NULL);
        cur_module->set_defname($4);
        free($4);
        firrtlsyn::firDB::firDefName* defname = cur_module->defname();
        defname->set_info($5);
        free($5);
        defname->set_doc_data(@2.first_line, @5.first_column, @2.last_line, @5.last_column, 0);
        add_extmodule_item_indent($1);
    }
    ;

Parameter :
    Indent kPARAMETER Id kEQ IntLit Info Newline {
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter($3, $5);
        free($3);
        free($5);
        parameter->set_info($6);
        free($6);
        parameter->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
        add_extmodule_item_indent($1);
    }
    | Indent kPARAMETER Id kEQ kQUOTATION_MARK kQUOTED_STRING kQUOTATION_MARK Info Newline {
        std::string value = "\"" + std::string($6) + "\"";
        free($6);
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter($3, value);
        free($3);
        parameter->set_info($8);
        free($8);
        parameter->set_doc_data(@2.first_line, @8.last_line, @2.first_column, @8.last_column, 0);
        add_extmodule_item_indent($1);
    }
    | Indent kPARAMETER Id kEQ kDOUBLELIT Info Newline {
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter($3, $5);
        free($3);
        free($5);
        parameter->set_info($6);
        free($6);
        parameter->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
        add_extmodule_item_indent($1);
    }
    | Indent kPARAMETER Id kEQ kAPOSTROPHE kQUOTED_STRING kAPOSTROPHE Info Newline {
        std::string value = "'" + std::string($6) + "'";
        free($6);
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter($3, value);
        free($3);
        parameter->set_info($8);
        free($8);
        parameter->set_doc_data(@2.first_line, @8.last_line, @2.first_column, @8.last_column, 0);
        add_extmodule_item_indent($1);
    }
    ;


ItemPort :
    Indent PortDir Id kCOLON Type Info Newline {
        fs_assert(cur_cond == NULL);
        firrtlsyn::firDB::firItemPort* port = cur_module->addItemPort($3, $2, $5);
        free($3);
        add_item_indent($1, port);
        port->set_info($6);
        free($6);
        port->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
        //if (strlen($6) > 0) free($6);
    }
    ;

PortDir :
    kINPUT { $$ = firrtlsyn::firDB::PortDir::kPortDirInput; }
    | kOUTPUT { $$ = firrtlsyn::firDB::PortDir::kPortDirOutput; }
    ;

ItemWire :
    Indent kWIRE Id kCOLON Type Info Newline {
        firrtlsyn::firDB::firItemWire* wire = cur_module->addItemWire($3, $5);
        free($3);
        add_item_indent($1, wire);
        if (cur_cond) {
            cur_cond->addStatement(wire);
        } else {
            cur_module->addStatement(wire);
        }
        wire->set_info($6);
        free($6);
        wire->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
    }
    ;

ItemRegister :
    Indent kREG Id kCOLON Type Expression Info Newline {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister($3, $5, $6);
        free($3);
        add_item_indent($1, item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info($7);
        free($7);
        item_reg->set_doc_data(@2.first_line, @7.last_line, @2.first_column, @7.last_column, 0);
        cur_reg = NULL;
    }
    | Indent kREG Id kCOLON Type kCOMMA Expression Info Newline {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister($3, $5, $7);
        free($3);
        add_item_indent($1, item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info($8);
        free($8);
        item_reg->set_doc_data(@2.first_line, @8.last_line, @2.first_column, @8.last_column, 0);
        cur_reg = NULL;
    }
    | Indent kREG Id kCOLON Type Expression kWITH kCOLON Newline {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister($3, $5, $6);
        free($3);
        add_item_indent($1, item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_doc_data(@2.first_line, @8.last_line, @2.first_column, @8.last_column, 0);
        cur_reg = item_reg;
    }
    | Indent kREG Id kCOLON Type kCOMMA Expression kWITH kCOLON Newline {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister($3, $5, $7);
        free($3);
        add_item_indent($1, item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_doc_data(@2.first_line, @9.last_line, @2.first_column, @9.last_column, 0);
        cur_reg = item_reg;
    }
    | Indent kREG Id kCOLON Type Expression kWITH kCOLON kPARENT_L kREGRESET kASSIGN kPARENT_L Expression kCOMMA Expression kPARENT_R kPARENT_R Info Newline {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister($3, $5, $6, $13, $15);
        free($3);
        add_item_indent($1, item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info($18);
        free($18);
        item_reg->set_doc_data(@2.first_line, @18.last_line, @2.first_column, @18.last_column, 0);
        cur_reg = NULL;
    }
    | Indent kREG Id kCOLON Type kCOMMA Expression kWITH kCOLON kPARENT_L kREGRESET kASSIGN kPARENT_L Expression kCOMMA Expression kPARENT_R kPARENT_R Info Newline {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister($3, $5, $7, $14, $16);
        free($3);
        add_item_indent($1, item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info($19);
        free($19);
        item_reg->set_doc_data(@2.first_line, @19.last_line, @2.first_column, @19.last_column, 0);
        cur_reg = NULL;
    }
    ;

RegResetBlock :
    Indent kREGRESET kASSIGN kPARENT_L Expression kCOMMA Expression kPARENT_R Info Newline {
        cur_reg->set_reset_block($5, $7);
        cur_reg->set_info($9);
        free($9);
        cur_reg->set_line_end(@9.last_line);
        cur_reg->set_col_end(@9.last_column);
        add_regreset_block_indent($1);
    }
    ;

ItemMemory :
    Indent kMEM Id kCOLON Info Newline {
        firrtlsyn::firDB::firItemMemory* mem = cur_module->addItemMemory($3);
        free($3);
        add_item_indent($1, mem);
        if (cur_cond) {
            cur_cond->addStatement(mem);
        } else {
            cur_module->addStatement(mem);
        }
        mem->set_info($5);
        free($5);
        mem->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
        cur_mem = mem;
    }
    ;

MemField :
    Indent kDATATYPE kASSIGN Type Newline {
        cur_mem->set_type_data($4);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kDEPTH kASSIGN IntLit Newline {
        unsigned int depth = atoi($4);
        free($4);
        cur_mem->set_depth(depth);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kREADLATENCY kASSIGN IntLit Newline {
        unsigned int read_latency = atoi($4);
        free($4);
        cur_mem->set_read_latency(read_latency);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kWRITELATENCY kASSIGN IntLit Newline {
        unsigned int write_latency = atoi($4);
        free($4);
        cur_mem->set_write_latency(write_latency);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kREADUNDERWRITE kASSIGN Ruw Newline {
        cur_mem->set_read_under_write($4);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kREADER kASSIGN Id Newline {
        cur_mem->addReadPorts($4);
        free($4);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kWRITER kASSIGN Id Newline {
        cur_mem->addWritePorts($4);
        free($4);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    | Indent kREADWRITER kASSIGN Id Newline {
        cur_mem->addReadWritePorts($4);
        free($4);
        cur_mem->set_line_end(@4.last_line);
        cur_mem->set_col_end(@4.last_column);
        add_mem_field_indent($1);
    }
    ;

ItemCMemory :
    Indent kCMEM Id kCOLON Type Info Newline {
        firrtlsyn::firDB::firItemCMemory* cmem = cur_module->addItemCMemory($3, $5);
        free($3);
        add_item_indent($1, cmem);
        if (cur_cond) {
            cur_cond->addStatement(cmem);
        } else {
            cur_module->addStatement(cmem);
        }
        cmem->set_info($6);
        free($6);
        cmem->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
    }
    ;

ItemSMemory :
    Indent kSMEM Id kCOLON Type Info Newline {
        firrtlsyn::firDB::firItemSMemory* smem = cur_module->addItemSMemory($3, $5);
        free($3);
        add_item_indent($1, smem);
        if (cur_cond) {
            cur_cond->addStatement(smem);
        } else {
            cur_module->addStatement(smem);
        }
        smem->set_info($6);
        free($6);
        smem->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
    }
    | Indent kSMEM Id kCOLON Type Ruw Info Newline {
        firrtlsyn::firDB::firItemSMemory* smem = cur_module->addItemSMemory($3, $5, $6);
        free($3);
        add_item_indent($1, smem);
        if (cur_cond) {
            cur_cond->addStatement(smem);
        } else {
            cur_module->addStatement(smem);
        }
        smem->set_info($7);
        free($7);
        smem->set_doc_data(@2.first_line, @7.last_line, @2.first_column, @7.last_column, 0);
    }
    ;

Ruw :
    kOLD { $$ = firrtlsyn::firDB::RUW::kRuwOld; }
    | kNEW { $$ = firrtlsyn::firDB::RUW::kRuwNew; }
    | kUNDEFINED { $$ = firrtlsyn::firDB::RUW::kRuwUndef; }
    ;

ItemMPort :
    Indent MPortDir kMPORT Id kEQ Id kSQUARE_LB Expression kSQUARE_RB kCOMMA Expression Info Newline {
        firrtlsyn::firDB::firItemMPort* mport = cur_module->addItemMPort($2, $4, $6, $8, $11);
        free($4);
        free($6);
        add_item_indent($1, mport);
        if (cur_cond) {
            cur_cond->addStatement(mport);
        } else {
            cur_module->addStatement(mport);
        }
        mport->set_info($12);
        free($12);
        mport->set_doc_data(@2.first_line, @12.last_line, @2.first_column, @12.last_column, 0);
    }
    ;

MPortDir :
    kINFER { $$ = firrtlsyn::firDB::MPortDir::kMPortDirInfer; }
    | kREAD { $$ = firrtlsyn::firDB::MPortDir::kMPortDirRead; }
    | kWRITE { $$ = firrtlsyn::firDB::MPortDir::kMPortDirWrite; }
    | kRDWR { $$ = firrtlsyn::firDB::MPortDir::kMPortDirRdwr; }
    ;

ItemInstance :
    Indent kINST Id kOF Id Info Newline {
        firrtlsyn::firDB::firItemInstance* inst = cur_module->addItemInstance($3, $5);
        free($3);
        free($5);
        add_item_indent($1, inst);
        if (cur_cond) {
            cur_cond->addStatement(inst);
        } else {
            cur_module->addStatement(inst);
        }
        inst->set_info($6);
        free($6);
        inst->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
    }
    ;

ItemNode :
    Indent kNODE Id kEQ Expression Info Newline {
        firrtlsyn::firDB::firItemNode* node = cur_module->addItemNode($3, $5);
        free($3);
        add_item_indent($1, node);
        if (cur_cond) {
            cur_cond->addStatement(node);
        } else {
            cur_module->addStatement(node);
        }
        node->set_info($6);
        free($6);
        node->set_doc_data(@2.first_line, @6.last_line, @2.first_column, @6.last_column, 0);
    }
    ;

ItemConnect :
    Indent Expression kCONNECT Expression Info Newline {
        firrtlsyn::firDB::firItemConnect* connect = cur_module->addItemConnect($2, $4);
        add_item_indent($1, connect);
        if (cur_cond) {
            cur_cond->addStatement(connect);
        } else {
            cur_module->addStatement(connect);
        }
        connect->set_info($5);
        free($5);
        connect->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
    }
    ;

ItemPartialConnect :
    Indent Expression kPARTIAL_CONNECT Expression Info Newline {
        firrtlsyn::firDB::firItemPartialConnect* partial_connect = cur_module->addItemPartialConnect($2, $4);
        add_item_indent($1, partial_connect);
        if (cur_cond) {
            cur_cond->addStatement(partial_connect);
        } else {
            cur_module->addStatement(partial_connect);
        }
        partial_connect->set_info($5);
        free($5);
        partial_connect->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
    }
    ;

ItemInvalidate :
    Indent Expression kISINVALID Info Newline {
        firrtlsyn::firDB::firItemInvalidate* invalid = cur_module->addItemInvalidate($2);
        add_item_indent($1, invalid);
        if (cur_cond) {
            cur_cond->addStatement(invalid);
        } else {
            cur_module->addStatement(invalid);
        }
        invalid->set_info($4);
        free($4);
        invalid->set_doc_data(@2.first_line, @4.last_line, @2.first_column, @4.last_column, 0);
    }
    ;

ItemWhen :
    Indent kWHEN Expression kCOLON Info Newline {
        firrtlsyn::firDB::firItemConditional* item_when = cur_module->addItemConditional();
        add_item_indent($1, item_when);
        if (cur_cond) {
            cur_cond->addStatement(item_when);
        } else {
            cur_module->addStatement(item_when);
        }
        item_when->set_when_exp($3);
        item_when->set_info($5);
        free($5);
        item_when->set_doc_data(@2.first_line, @5.last_line, @2.first_column, @5.last_column, 0);
        cur_cond = item_when;
    }
    ;

ItemElse :
    Indent kELSE kCOLON Info Newline {
        firrtlsyn::firDB::firItemConditional* item_else = cur_module->addItemConditional();
        item_else->set_info($4);
        free($4);
        item_else->set_doc_data(@2.first_line, @4.last_line, @2.first_column, @4.last_column, 0);
        firrtlsyn::firDB::firItemConditional* item_when = add_else_indent($1, item_else);
        item_when->set_else_cond(item_else);
        item_when->set_line_end(@4.last_line);
        item_when->set_col_end(@4.last_column);
        cur_cond = item_else;
    }
    ;


ItemStop :
    Indent kSTOP kPARENT_L Expression kCOMMA Expression kCOMMA IntLit kPARENT_R Info Newline {
        unsigned int exit_code = atoi($8);
        free($8);
        firrtlsyn::firDB::firItemStop* stop = cur_module->addItemStop($4, $6, exit_code);
        add_item_indent($1, stop);
        if (cur_cond) {
            cur_cond->addStatement(stop);
        } else {
            cur_module->addStatement(stop);
        }
        stop->set_info($10);
        free($10);
        stop->set_doc_data(@2.first_line, @10.last_line, @2.first_column, @10.last_column, 0);
    }
    | Indent kSTOP kPARENT_L Expression kCOMMA Expression kCOMMA IntLit kPARENT_R kCOLON Id Info Newline {
        unsigned int exit_code = atoi($8);
        free($8);
        firrtlsyn::firDB::firItemStop* stop = cur_module->addItemStop($4, $6, exit_code);
        add_item_indent($1, stop);
        if (cur_cond) {
            cur_cond->addStatement(stop);
        } else {
            cur_module->addStatement(stop);
        }
        stop->set_id($11);
        free($11);
        stop->set_info($12);
        free($12);
        stop->set_doc_data(@2.first_line, @12.last_line, @2.first_column, @12.last_column, 0);
    }
    ;

ItemPrintf :
    Indent kPRINTF kPARENT_L Expression kCOMMA Expression kCOMMA kQUOTATION_MARK kQUOTED_STRING kQUOTATION_MARK kPARENT_R Info Newline {
        std::string p_string = "\"" + std::string($9) + "\"";
        free($9);
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf($4, $6, p_string);
        add_item_indent($1, printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        printf->set_info($12);
        free($12);
        printf->set_doc_data(@2.first_line, @12.last_line, @2.first_column, @12.last_column, 0);
    }
    | Indent kPRINTF kPARENT_L Expression kCOMMA Expression kCOMMA kQUOTATION_MARK kQUOTED_STRING kQUOTATION_MARK kPARENT_R kCOLON Id Info Newline {
        std::string p_string = "\"" + std::string($9) + "\"";
        free($9);
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf($4, $6, p_string);
        add_item_indent($1, printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        printf->set_id($13);
        free($13);
        printf->set_info($14);
        free($14);
        printf->set_doc_data(@2.first_line, @14.last_line, @2.first_column, @14.last_column, 0);
    }
    | Indent kPRINTF kPARENT_L Expression kCOMMA Expression kCOMMA kQUOTATION_MARK kQUOTED_STRING kQUOTATION_MARK kCOMMA MultiExpression kPARENT_R Info Newline {
        std::string p_string = "\"" + std::string($9) + "\"";
        free($9);
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf($4, $6, p_string);
        add_item_indent($1, printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        for (size_t i = 0; i < $12->size(); i++) {
            printf->addPrint($12->at(i));
        }
        delete $12;
        printf->set_info($14);
        free($14);
        printf->set_doc_data(@2.first_line, @14.last_line, @2.first_column, @14.last_column, 0);
    }
    | Indent kPRINTF kPARENT_L Expression kCOMMA Expression kCOMMA kQUOTATION_MARK kQUOTED_STRING kQUOTATION_MARK kCOMMA MultiExpression kPARENT_R kCOLON Id Info Newline {
        std::string p_string = "\"" + std::string($9) + "\"";
        free($9);
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf($4, $6, p_string);
        add_item_indent($1, printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        for (size_t i = 0; i < $12->size(); i++) {
            printf->addPrint($12->at(i));
        }
        delete $12;
        printf->set_id($15);
        free($15);
        printf->set_info($16);
        free($16);
        printf->set_doc_data(@2.first_line, @16.last_line, @2.first_column, @16.last_column, 0);
    }
    ;

ItemEmpty :
    Indent kSKIP Info Newline {
        firrtlsyn::firDB::firItemEmpty* empty = cur_module->addItemEmpty();
        add_item_indent($1, empty);
        if (cur_cond) {
            cur_cond->addStatement(empty);
        } else {
            cur_module->addStatement(empty);
        }
        empty->set_info($3);
        free($3);
        empty->set_doc_data(@2.first_line, @3.last_line, @2.first_column, @3.last_column, 0);
    }
    ;

ItemAttach :
    Indent kATTACH kPARENT_L MultiExpression kPARENT_R Info Newline {
        firrtlsyn::firDB::firItemAttach* attach = cur_module->addItemAttach();
        add_item_indent($1, attach);
        if (cur_cond) {
            cur_cond->addStatement(attach);
        } else {
            cur_module->addStatement(attach);
        }
        for (size_t i = 0; i < $4->size(); i++) {
            attach->addNet($4->at(i));
        }
        delete $4;
        attach->set_info($6);
        free($6);
        attach->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
    }
    ;

MultiExpression :
    Expression {
        $$ = new std::vector<firrtlsyn::firDB::firExp*>(1, $1);
    }
    | MultiExpression kCOMMA Expression {
        $1->push_back($3);
        $$ = $1;
    }
    ;


Type :
    TypeUInt { $$ = $1; }
    | TypeSInt { $$ = $1; }
    | TypeFixed { $$ = $1; }
    | TypeInterval { $$ = $1; }
    | TypeClock { $$ = $1; }
    | TypeAsyncReset { $$ = $1; }
    | TypeReset { $$ = $1; }
    | TypeAnalog { $$ = $1; }
    | TypeVector { $$ = $1; }
    | TypeBundle { $$ = $1; }
    ;

TypeUInt :
    kUINT %prec EMPTY { 
        firrtlsyn::firDB::firTypeUInt* type_uint = cur_module->addTypeUInt(-1);
        type_uint->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_uint;
    }
    | kUINT kBRACKET_L IntLit kBRACKET_R {
        int width = atoi($3);
        free($3);
        firrtlsyn::firDB::firTypeUInt* type_uint = cur_module->addTypeUInt(width);
        type_uint->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = type_uint;
    }
    ;

TypeSInt :
    kSINT %prec EMPTY { 
        firrtlsyn::firDB::firTypeSInt* type_sint = cur_module->addTypeSInt(-1);
        type_sint->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_sint;
    }
    | kSINT kBRACKET_L IntLit kBRACKET_R {
        int width = atoi($3);
        free($3);
        firrtlsyn::firDB::firTypeSInt* type_sint = cur_module->addTypeSInt(width);
        type_sint->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = type_sint;
    }
    ;

TypeFixed :
    kFIXED %prec EMPTY { 
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        type_fixed->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_fixed;
    }
    | kFIXED kBRACKET_L IntLit kBRACKET_R {
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        int width = atoi($3);
        free($3);
        type_fixed->set_width(width);
        type_fixed->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = type_fixed;
    }
    | kFIXED kBRACKET_SL IntLit kBRACKET_SR {
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        int binary_point = atoi($3);
        free($3);
        type_fixed->set_binary_point(binary_point);
        type_fixed->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = type_fixed;
    }
    | kFIXED kBRACKET_L IntLit kBRACKET_R kBRACKET_SL IntLit kBRACKET_SR {
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        int width = atoi($3);
        free($3);
        type_fixed->set_width(width);
        int binary_point = atoi($6);
        free($6);
        type_fixed->set_binary_point(binary_point);
        type_fixed->set_doc_data(@1.first_line, @7.last_line, @1.first_column, @7.last_column, 0);
        $$ = type_fixed;
    }
    ;

TypeInterval :
    kINTERVAL %prec EMPTY {
        firrtlsyn::firDB::firTypeInterval* type_interval = cur_module->addTypeInterval();
        type_interval->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_interval;
    }
    | kINTERVAL LowerBound BoundValue kCOMMA BoundValue UpperBound {
        firrtlsyn::firDB::firTypeInterval* type_interval = cur_module->addTypeInterval();
        if (strcmp($3, "?") == 0 && strcmp($5, "?") == 0 ) {
            type_interval->set_value($2, '?', '?', $6);
        } else if (strcmp($3, "?") == 0) {
            free($3);
            double upper_value = atof($5);
            free($5);
            type_interval->set_value($2, '?', upper_value, $6);
        } else if (strcmp($5, "?") == 0) {
            free($5);
            double lower_value = atof($3);
            free($3);
            type_interval->set_value($2, lower_value, '?', $6);
        } else {
            double lower_value = atof($3);
            free($3);
            double upper_value = atof($5);
            free($5);
            type_interval->set_value($2, lower_value, upper_value, $6);
        }
        type_interval->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = type_interval;
    }
    | kINTERVAL LowerBound BoundValue kCOMMA BoundValue UpperBound kDOT IntLit {
        firrtlsyn::firDB::firTypeInterval* type_interval = cur_module->addTypeInterval();
        int binary_value = atoi($8);
        free($8);
        if (strcmp($3, "?") == 0 && strcmp($5, "?") == 0 ) {
            type_interval->set_value($2, '?', '?', $6, binary_value);
        } else if (strcmp($3, "?") == 0) {
            free($3);
            double upper_value = atof($5);
            free($5);
            type_interval->set_value($2, '?', upper_value, $6, binary_value);
        } else if (strcmp($5, "?") == 0) {
            free($5);
            double lower_value = atof($3);
            free($3);
            type_interval->set_value($2, lower_value, '?', $6, binary_value);
        } else {
            double lower_value = atof($3);
            free($3);
            double upper_value = atof($5);
            free($5);
            type_interval->set_value($2, lower_value, upper_value, $6, binary_value);
        }
        type_interval->set_doc_data(@1.first_line, @8.last_line, @1.first_column, @8.last_column, 0);
        $$ = type_interval;
    }
    ;

TypeClock :
    kCLOCK { 
        firrtlsyn::firDB::firTypeClock* type_clock = cur_module->addTypeClock();
        type_clock->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_clock;
    }
    ;

TypeAsyncReset :
    kASYNCRESET { 
        firrtlsyn::firDB::firTypeAsyncReset* type_asyncreset = cur_module->addTypeAsyncReset();
        type_asyncreset->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_asyncreset;
    }
    ;

TypeReset :
    kRESET { 
        firrtlsyn::firDB::firTypeReset* type_reset = cur_module->addTypeReset();
        type_reset->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_reset;
    }
    ;

TypeAnalog :
    kANALOG %prec EMPTY { 
        firrtlsyn::firDB::firTypeAnalog* type_analog = cur_module->addTypeAnalog(-1);
        type_analog->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = type_analog;
    }
    | kANALOG kBRACKET_L kUNSIGNEDINT kBRACKET_R {
        int width = atoi($3);
        free($3);
        firrtlsyn::firDB::firTypeAnalog* type_analog = cur_module->addTypeAnalog(width);
        type_analog->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = type_analog;
    }
    ;

TypeVector :
    Type kSQUARE_LB IntLit kSQUARE_RB {
        int depth = atoi($3);
        free($3);
        firrtlsyn::firDB::firTypeVector* type_vector = cur_module->addTypeVector(depth);
        type_vector->set_type_data($1);
        type_vector->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = type_vector;
    }
    ;

TypeBundle :
    kBRACE_L kBRACE_R {
        firrtlsyn::firDB::firTypeBundle* type_bundle = cur_module->addTypeBundle();
        type_bundle->set_doc_data(@1.first_line, @2.last_line, @1.first_column, @2.last_column, 0);
        $$ = type_bundle;
    }
    | kBRACE_L MultiField kBRACE_R {
        firrtlsyn::firDB::firTypeBundle* type_bundle = cur_module->addTypeBundle();
        for (size_t i = 0; i < $2->size(); i++) {
            type_bundle->addTypeData($2->at(i));
        }
        delete $2;
        type_bundle->set_doc_data(@1.first_line, @3.last_line, @1.first_column, @3.last_column, 0);
        $$ = type_bundle;
    }
    ;

MultiField :
    Field {
        $$ = new std::vector<firrtlsyn::firDB::firField*>(1, $1);
    }
    | MultiField kCOMMA Field {
        $1->push_back($3);
        $$ = $1;
    }
    ;

Field :
    FieldId kCOLON Type {
        $$ = cur_module->addField($1, $3, false);
        $$->set_doc_data(@1.first_line, @3.last_line, @1.first_column, @3.last_column, 0);
        free($1);
    }
    | kFLIP FieldId kCOLON Type {
        $$ = cur_module->addField($2, $4, true);
        $$->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        free($2);
    }
    ;


Expression :
    ExpUInt { $$ = $1; }
    | ExpUIntBits { $$ = $1; }
    | ExpSInt { $$ = $1; }
    | ExpSIntBits { $$ = $1; }
    | ExpId { $$ = $1; }
    | ExpSubfield { $$ = $1; }
    | ExpDouble { $$ = $1; }
    | ExpSubindex { $$ = $1; }
    | ExpSubaccess { $$ = $1; }
    | ExpMux { $$ = $1; }
    | ExpValidif { $$ = $1; }
    | ExpPrimOp { $$ = $1; }
    ;

ExpUInt :
    kUINT kPARENT_L IntLit kPARENT_R {
        long long unsigned int value = atoll($3);
        free($3);
        int width = 0;
        firrtlsyn::firDB::firExpUInt* uint = cur_module->addExpUInt(value, width);
        uint->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = uint;
    }
    | kUINT kBRACKET_L IntLit kBRACKET_R kPARENT_L IntLit kPARENT_R {
        int width = atoi($3);
        free($3);
        long long unsigned int value = atoll($6);
        free($6);
        firrtlsyn::firDB::firExpUInt* uint = cur_module->addExpUInt(value, width);
        uint->set_doc_data(@1.first_line, @7.last_line, @1.first_column, @7.last_column, 0);
        $$ = uint;
    }
    ;

ExpUIntBits :
    kUINT kPARENT_L kQUOTATION_MARK IntLit kQUOTATION_MARK kPARENT_R {
        int width = 0;
        firrtlsyn::firDB::firExpUIntBits* uint_bits = cur_module->addExpUIntBits($4, width);
        free($4);
        uint_bits->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = uint_bits;
    }
    | kUINT kBRACKET_L IntLit kBRACKET_R kPARENT_L kQUOTATION_MARK IntLit kQUOTATION_MARK kPARENT_R {
        int width = atoi($3);
        free($3);
        firrtlsyn::firDB::firExpUIntBits* uint_bits = cur_module->addExpUIntBits($7, width);
        free($7);
        uint_bits->set_doc_data(@1.first_line, @9.last_line, @1.first_column, @9.last_column, 0);
        $$ = uint_bits;
    }
    ;

ExpSInt :
    kSINT kPARENT_L IntLit kPARENT_R {
        long long int value = atoll($3);
        free($3);
        int width = 0;
        firrtlsyn::firDB::firExpSInt* sint = cur_module->addExpSInt(value, width);
        sint->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = sint;
    }
    | kSINT kBRACKET_L IntLit kBRACKET_R kPARENT_L IntLit kPARENT_R {
        int width = atoi($3);
        free($3);
        long long int value = atoll($6);
        free($6);
        firrtlsyn::firDB::firExpSInt* sint = cur_module->addExpSInt(value, width);
        sint->set_doc_data(@1.first_line, @7.last_line, @1.first_column, @7.last_column, 0);
        $$ = sint;
    }
    ;

ExpSIntBits :
    kSINT kPARENT_L kQUOTATION_MARK IntLit kQUOTATION_MARK kPARENT_R {
        int width = 0;
        firrtlsyn::firDB::firExpSIntBits* sint_bits = cur_module->addExpSIntBits($4, width);
        free($4);
        sint_bits->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = sint_bits;
    }
    | kSINT kBRACKET_L IntLit kBRACKET_R kPARENT_L kQUOTATION_MARK IntLit kQUOTATION_MARK kPARENT_R {
        int width = atoi($3);
        free($3);
        firrtlsyn::firDB::firExpSIntBits* sint_bits = cur_module->addExpSIntBits($7, width);
        free($7);
        sint_bits->set_doc_data(@1.first_line, @9.last_line, @1.first_column, @9.last_column, 0);
        $$ = sint_bits;
    }
    ;

ExpId :
    Id {
        firrtlsyn::firDB::firExpRef* ref = cur_module->addExpRef($1);
        free($1);
        ref->set_doc_data(@1.first_line, @1.last_line, @1.first_column, @1.last_column, 0);
        $$ = ref;
    }
    ;

ExpSubfield :
    Expression kDOT FieldId {
        firrtlsyn::firDB::firExpSubfield* subfield = cur_module->addExpSubfield($1, $3);
        free($3);
        subfield->set_doc_data(@1.first_line, @3.last_line, @1.first_column, @3.last_column, 0);
        $$ = subfield;
    }
    ;

ExpDouble :
    Expression kDOT kDOUBLELIT {
        //FIXME: TODO
        double value = atof($3);
        free($3);
        //firrtlsyn::firDB::firExpDouble* double = cur_module->addExpDouble($1, value);
        //double->set_doc_data(@1.first_line, @3.last_line, @1.first_column, @3.last_column, 0);
        //$$ = double;
        $$ = NULL;
    }
    ;

ExpSubindex :
    Expression kSQUARE_LB IntLit kSQUARE_RB {
        int index = atoi($3);
        free($3);
        firrtlsyn::firDB::firExpSubindex* subindex = cur_module->addExpSubindex($1, index);
        subindex->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = subindex;
    }
    ;

ExpSubaccess :
    Expression kSQUARE_LB Expression kSQUARE_RB {
        firrtlsyn::firDB::firExpSubaccess* subaccess = cur_module->addExpSubaccess($1, $3);
        subaccess->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = subaccess;
    }
    ;

ExpMux :
    kMUX kPARENT_L Expression kCOMMA Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpMux* mux = cur_module->addExpMux($3, $5, $7);
        mux->set_doc_data(@1.first_line, @8.last_line, @1.first_column, @8.last_column, 0);
        $$ = mux;
    }
    ;

ExpValidif :
    kVALIDIF kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpValidif* validif = cur_module->addExpValidif($3, $5);
        validif->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = validif;
    }
    ;

ExpPrimOp :
    ExpPrimOpAdd { $$ = $1; }
    | ExpPrimOpSub { $$ = $1; }
    | ExpPrimOpMul { $$ = $1; }
    | ExpPrimOpDiv { $$ = $1; }
    | ExpPrimOpRem { $$ = $1; }
    | ExpPrimOpLt { $$ = $1; }
    | ExpPrimOpLeq { $$ = $1; }
    | ExpPrimOpGt { $$ = $1; }
    | ExpPrimOpGeq { $$ = $1; }
    | ExpPrimOpEq { $$ = $1; }
    | ExpPrimOpNeq { $$ = $1; }
    | ExpPrimOpPad { $$ = $1; }
    | ExpPrimOpAsUInt { $$ = $1; }
    | ExpPrimOpAsAsyncReset { $$ = $1; }
    | ExpPrimOpAsSInt { $$ = $1; }
    | ExpPrimOpAsClock { $$ = $1; }
    | ExpPrimOpAsFixedPoint { $$ = $1; }
    | ExpPrimOpAsInterval { $$ = $1; }
    | ExpPrimOpShl { $$ = $1; }
    | ExpPrimOpShr { $$ = $1; }
    | ExpPrimOpDshl { $$ = $1; }
    | ExpPrimOpDshr { $$ = $1; }
    | ExpPrimOpCvt { $$ = $1; }
    | ExpPrimOpNeg { $$ = $1; }
    | ExpPrimOpNot { $$ = $1; }
    | ExpPrimOpAnd { $$ = $1; }
    | ExpPrimOpOr { $$ = $1; }
    | ExpPrimOpXor { $$ = $1; }
    | ExpPrimOpAndr { $$ = $1; }
    | ExpPrimOpOrr { $$ = $1; }
    | ExpPrimOpXorr { $$ = $1; }
    | ExpPrimOpCat { $$ = $1; }
    | ExpPrimOpBits { $$ = $1; }
    | ExpPrimOpHead { $$ = $1; }
    | ExpPrimOpTail { $$ = $1; }
    | ExpPrimOpIncp { $$ = $1; }
    | ExpPrimOpDecp { $$ = $1; }
    | ExpPrimOpSetp { $$ = $1; }
    | ExpPrimOpWrap { $$ = $1; }
    | ExpPrimOpClip { $$ = $1; }
    | ExpPrimOpSquz { $$ = $1; }
    ;

ExpPrimOpAdd :
    kPRIMOPADD kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAdd* add = cur_module->addExpAdd($3, $5);
        add->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = add;
    }
    ;

ExpPrimOpSub :
    kPRIMOPSUB kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firSub* sub = cur_module->addExpSub($3, $5);
        sub->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = sub;
    }
    ;

ExpPrimOpMul :
    kPRIMOPMUL kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firMul* mul = cur_module->addExpMul($3, $5);
        mul->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = mul;
    }
    ;

ExpPrimOpDiv :
    kPRIMOPDIV kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firDiv* div = cur_module->addExpDiv($3, $5);
        div->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = div;
    }
    ;

ExpPrimOpRem :
    kPRIMOPREM kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firMod* mod = cur_module->addExpMod($3, $5);
        mod->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = mod;
    }
    ;

ExpPrimOpLt :
    kPRIMOPLT kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firLt* lt = cur_module->addExpLt($3, $5);
        lt->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = lt;
    }
    ;

ExpPrimOpLeq :
    kPRIMOPLEQ kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firLeq* leq = cur_module->addExpLeq($3, $5);
        leq->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = leq;
    }
    ;

ExpPrimOpGt :
    kPRIMOPGT kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firGt* gt = cur_module->addExpGt($3, $5);
        gt->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = gt;
    }
    ;

ExpPrimOpGeq :
    kPRIMOPGEQ kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firGeq* geq = cur_module->addExpGeq($3, $5);
        geq->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = geq;
    }
    ;

ExpPrimOpEq :
    kPRIMOPEQ kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firEq* eq = cur_module->addExpEq($3, $5);
        eq->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = eq;
    }
    ;

ExpPrimOpNeq :
    kPRIMOPNEQ kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firNeq* neq = cur_module->addExpNeq($3, $5);
        neq->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = neq;
    }
    ;

ExpPrimOpPad :
    kPRIMOPPAD kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firPad* pad = cur_module->addExpPad($3, n);
        pad->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = pad;
    }
    ;

ExpPrimOpAsUInt :
    kPRIMOPASUINT kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAsUInt* asuint = cur_module->addExpAsUInt($3);
        asuint->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = asuint;
    }
    ;

ExpPrimOpAsSInt :
    kPRIMOPASSINT kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAsSInt* assint = cur_module->addExpAsSInt($3);
        assint->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = assint;
    }
    ;

ExpPrimOpAsClock :
    kPRIMOPASCLOCK kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAsClock* asclock = cur_module->addExpAsClock($3);
        asclock->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = asclock;
    }
    ;

ExpPrimOpAsFixedPoint :
    kPRIMOPASFIXEDPOINT kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        int binary_point = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firAsFixed* asfixed = cur_module->addExpAsFixed($3, binary_point);
        asfixed->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = asfixed;
    }
    ;

ExpPrimOpAsAsyncReset :
    kPRIMOPASASYNCRESET kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAsAsyncReset* asasyncreset = cur_module->addExpAsAsyncReset($3);
        asasyncreset->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = asasyncreset;
    }
    ;

ExpPrimOpAsInterval :
    kPRIMOPASINTERVAL kPARENT_L Expression kCOMMA IntLit kCOMMA IntLit kCOMMA IntLit kPARENT_R {
        int left = atoi($5);
        free($5);
        int right = atoi($7);
        free($7);
        unsigned int bit_width = atoi($9);
        free($9);
        firrtlsyn::firDB::firExpPrimOperation::firAsInterval* asinterval = cur_module->addExpAsInterval($3, left, right, bit_width);
        asinterval->set_doc_data(@1.first_line, @10.last_line, @1.first_column, @10.last_column, 0);
        $$ = asinterval;
    }
    ;

ExpPrimOpShl :
    kPRIMOPSHL kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firShl* shl = cur_module->addExpShl($3, n);
        shl->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = shl;
    }
    ;

ExpPrimOpShr :
    kPRIMOPSHR kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firShr* shr = cur_module->addExpShr($3, n);
        shr->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = shr;
    }
    ;

ExpPrimOpDshl :
    kPRIMOPDSHL kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firDshl* dshl = cur_module->addExpDshl($3, $5);
        dshl->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = dshl;
    }
    ;

ExpPrimOpDshr :
    kPRIMOPDSHR kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firDshr* dshr = cur_module->addExpDshr($3, $5);
        dshr->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = dshr;
    }
    ;

ExpPrimOpCvt :
    kPRIMOPCVT kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firCvt* cvt = cur_module->addExpCvt($3);
        cvt->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = cvt;
    }
    ;

ExpPrimOpNeg :
    kPRIMOPNEG kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firNeg* neg = cur_module->addExpNeg($3);
        neg->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = neg;
    }
    ;

ExpPrimOpNot :
    kPRIMOPNOT kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firNot* prim_not = cur_module->addExpNot($3);
        prim_not->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = prim_not;
    }
    ;

ExpPrimOpAnd :
    kPRIMOPAND kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAnd* prim_and = cur_module->addExpAnd($3, $5);
        prim_and->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = prim_and;
    }
    ;

ExpPrimOpOr :
    kPRIMOPOR kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firOr* prim_or = cur_module->addExpOr($3, $5);
        prim_or->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = prim_or;
    }
    ;

ExpPrimOpXor :
    kPRIMOPXOR kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firXor* prim_xor = cur_module->addExpXor($3, $5);
        prim_xor->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = prim_xor;
    }
    ;

ExpPrimOpAndr :
    kPRIMOPANDR kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firAndr* andr = cur_module->addExpAndr($3);
        andr->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = andr;
    }
    ;

ExpPrimOpOrr :
    kPRIMOPORR kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firOrr* orr = cur_module->addExpOrr($3);
        orr->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = orr;
    }
    ;

ExpPrimOpXorr :
    kPRIMOPXORR kPARENT_L Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firXorr* xorr = cur_module->addExpXorr($3);
        xorr->set_doc_data(@1.first_line, @4.last_line, @1.first_column, @4.last_column, 0);
        $$ = xorr;
    }
    ;

ExpPrimOpCat :
    kPRIMOPCAT kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firCat* cat = cur_module->addExpCat($3, $5);
        cat->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = cat;
    }
    ;

ExpPrimOpBits :
    kPRIMOPBITS kPARENT_L Expression kCOMMA IntLit kCOMMA IntLit kPARENT_R {
        unsigned int hi = atoi($5);
        free($5);
        unsigned int lo = atoi($7);
        free($7);
        firrtlsyn::firDB::firExpPrimOperation::firBits* bits = cur_module->addExpBits($3, hi, lo);
        bits->set_doc_data(@1.first_line, @8.last_line, @1.first_column, @8.last_column, 0);
        $$ = bits;
    }
    ;

ExpPrimOpHead :
    kPRIMOPHEAD kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firHead* head = cur_module->addExpHead($3, n);
        head->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = head;
    }
    ;

ExpPrimOpTail :
    kPRIMOPTAIL kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firTail* tail = cur_module->addExpTail($3, n);
        tail->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = tail;
    }
    ;

ExpPrimOpIncp :
    kPRIMOPINCP kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firIncp* incp = cur_module->addExpIncp($3, n);
        incp->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = incp;
    }
    ;

ExpPrimOpDecp :
    kPRIMOPDECP kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firDecp* decp = cur_module->addExpDecp($3, n);
        decp->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = decp;
    }
    ;

ExpPrimOpSetp :
    kPRIMOPSETP kPARENT_L Expression kCOMMA IntLit kPARENT_R {
        unsigned int n = atoi($5);
        free($5);
        firrtlsyn::firDB::firExpPrimOperation::firSetp* setp = cur_module->addExpSetp($3, n);
        setp->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = setp;
    }
    ;

ExpPrimOpWrap :
    kPRIMOPWRAP kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firWrap* wrap = cur_module->addExpWrap($3, $5);
        wrap->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = wrap;
    }
    ;

ExpPrimOpClip :
    kPRIMOPCLIP kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firClip* clip = cur_module->addExpClip($3, $5);
        clip->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = clip;
    }
    ;

ExpPrimOpSquz :
    kPRIMOPSQUZ kPARENT_L Expression kCOMMA Expression kPARENT_R {
        firrtlsyn::firDB::firExpPrimOperation::firSquz* squz = cur_module->addExpSquz($3, $5);
        squz->set_doc_data(@1.first_line, @6.last_line, @1.first_column, @6.last_column, 0);
        $$ = squz;
    }
    ;

    
Id :
    kID { $$ = $1; }
    | KeyworkAsId { $$ = $1; }
    ;

RelaxedId :
    kRELAXED_ID { $$ = $1; }
    ;

FieldId :
    Id { $$ = $1; }
    | RelaxedId { $$ = $1; }
    | kUNSIGNEDINT { $$ = $1; }
    ;

KeyworkAsId :
    kCIRCUIT { $$ = strdup("circuit"); }
    | kMODULE { $$ = strdup("module"); }
    | kEXTMODULE { $$ = strdup("extmodule"); }
    | kDEFNAME { $$ = strdup("defname"); }
    | kPARAMETER { $$ = strdup("parameter"); }
    | kINPUT { $$ = strdup("input"); }
    | kOUTPUT { $$ = strdup("output"); }
    | kUINT { $$ = strdup("UInt"); }
    | kSINT { $$ = strdup("SInt"); }
    | kCLOCK { $$ = strdup("Clock"); }
    | kASYNCRESET { $$ = strdup("AsyncReset"); }
    | kRESET { $$ = strdup("Reset"); }
    | kANALOG { $$ = strdup("Analog"); }
    | kFIXED { $$ = strdup("Fixed"); }
    | kINTERVAL { $$ = strdup("Interval"); }
    | kFLIP { $$ = strdup("flip"); }
    | kWIRE { $$ = strdup("wire"); }
    | kREG { $$ = strdup("reg"); }
    | kWITH { $$ = strdup("width"); }
    | kREGRESET { $$ = strdup("reset"); }
    | kMEM { $$ = strdup("mem"); }
    /*| kDATATYPE { $$ = strdup("data-type"); }*/
    | kDEPTH { $$ = strdup("depth"); }
    /*| kREADLATENCY { $$ = strdup("read-latency"); }*/
    /*| kWRITELATENCY { $$ = strdup("write-latency"); }*/
    /*| kREADUNDERWRITE { $$ = strdup("read-under-write"); }*/
    | kREADER { $$ = strdup("reader"); }
    | kWRITER { $$ = strdup("writer"); }
    | kREADWRITER { $$ = strdup("readwriter"); }
    | kINST { $$ = strdup("inst"); }
    | kOF { $$ = strdup("of"); }
    | kNODE { $$ = strdup("node"); }
    | kIS { $$ = strdup("is"); } /*"is" as keyword will result in kIS/keywork("is") conflict */
    | kINVALID { $$ = strdup("invalid"); }
    | kWHEN { $$ = strdup("when"); }
    | kELSE { $$ = strdup("else"); }
    | kSTOP { $$ = strdup("stop"); }
    | kPRINTF { $$ = strdup("printf"); }
    | kSKIP { $$ = strdup("skip"); }
    | kOLD { $$ = strdup("old"); }
    | kNEW { $$ = strdup("new"); }
    | kUNDEFINED { $$ = strdup("undefined"); }
    | kMUX { $$ = strdup("mux"); }
    | kVALIDIF { $$ = strdup("validif"); }
    | kCMEM { $$ = strdup("cmem"); }
    | kSMEM { $$ = strdup("smem"); }
    | kMPORT { $$ = strdup("mport"); }
    | kINFER { $$ = strdup("infer"); }
    | kREAD { $$ = strdup("read"); }
    | kWRITE { $$ = strdup("write"); }
    | kRDWR { $$ = strdup("rdwr"); }
    | PrimopAsId { $$ = $1; }
    ;

PrimopAsId :
    kPRIMOPADD { $$ = strdup("add"); }
    | kPRIMOPSUB { $$ = strdup("sub"); }
    | kPRIMOPMUL { $$ = strdup("mul"); }
    | kPRIMOPDIV { $$ = strdup("div"); }
    | kPRIMOPREM { $$ = strdup("rem"); }
    | kPRIMOPLT { $$ = strdup("lt"); }
    | kPRIMOPLEQ { $$ = strdup("leq"); }
    | kPRIMOPGT { $$ = strdup("gt"); }
    | kPRIMOPGEQ { $$ = strdup("geq"); }
    | kPRIMOPEQ { $$ = strdup("eq"); }
    | kPRIMOPNEQ { $$ = strdup("neq"); }
    | kPRIMOPPAD { $$ = strdup("pad"); }
    | kPRIMOPASUINT { $$ = strdup("asUInt"); }
    | kPRIMOPASASYNCRESET { $$ = strdup("asAsyncReset"); }
    | kPRIMOPASSINT { $$ = strdup("asSInt"); }
    | kPRIMOPASCLOCK { $$ = strdup("asClock"); }
    | kPRIMOPASFIXEDPOINT { $$ = strdup("asFixedPoint"); }
    | kPRIMOPASINTERVAL { $$ = strdup("asInterval"); }
    | kPRIMOPSHL { $$ = strdup("shl"); }
    | kPRIMOPSHR { $$ = strdup("shr"); }
    | kPRIMOPDSHL { $$ = strdup("dshl"); }
    | kPRIMOPDSHR { $$ = strdup("dshr"); }
    | kPRIMOPCVT { $$ = strdup("cvt"); }
    | kPRIMOPNEG { $$ = strdup("neg"); }
    | kPRIMOPNOT { $$ = strdup("not"); }
    | kPRIMOPAND { $$ = strdup("and"); }
    | kPRIMOPOR { $$ = strdup("or"); }
    | kPRIMOPXOR { $$ = strdup("xor"); }
    | kPRIMOPANDR { $$ = strdup("andr"); }
    | kPRIMOPORR { $$ = strdup("orr"); }
    | kPRIMOPXORR { $$ = strdup("xorr"); }
    | kPRIMOPCAT { $$ = strdup("cat"); }
    | kPRIMOPBITS { $$ = strdup("bits"); }
    | kPRIMOPHEAD { $$ = strdup("head"); }
    | kPRIMOPTAIL { $$ = strdup("tail"); }
    | kPRIMOPINCP { $$ = strdup("incp"); }
    | kPRIMOPDECP { $$ = strdup("decp"); }
    | kPRIMOPSETP { $$ = strdup("setp"); }
    | kPRIMOPWRAP { $$ = strdup("wrap"); }
    | kPRIMOPCLIP { $$ = strdup("clip"); }
    | kPRIMOPSQUZ { $$ = strdup("squz"); }
    ;


IntLit :
    kUNSIGNEDINT { $$ = $1; }
    | kSIGNEDINT { $$ = $1; }
    | kHEXLIT { $$ = $1; }
    | kOCTALLIT { $$ = $1; }
    | kBINARYLIT { $$ = $1; }
    ;

LowerBound :
    kSQUARE_LB { $$ = '['; }
    | kPARENT_L { $$ = '('; }
    ;

UpperBound :
    kSQUARE_RB { $$ = ']'; }
    | kPARENT_R { $$ = ')'; }
    ;

BoundValue :
    kQUESTION_MARK { $$ = strdup("?"); }
    | kDOUBLELIT { $$ = $1; }
    | kUNSIGNEDINT { $$ = $1; }
    | kSIGNEDINT { $$ = $1; }
    ;


Indent :
    kINDENT { $$ = $1; }
    ;

Info :
      { $$ = strdup(""); }
    | kINFO { $$ = $1; }
    ;

Newline :
    kNEWLINE { }
    | kEOF { }
    | kCOMMENT kNEWLINE { free($1); }
    | kCOMMENT kEOF { free($1); }

EmptyLine :
    Indent kNEWLINE { free($1); }
    | Indent kEOF { free($1); }
    ;

CommentLine :
    Indent kCOMMENT Newline { free($1); free($2); }
    ;


%%

void yyerror(const char *errMsg) {
    printf("%s", errMsg);
    return;
}