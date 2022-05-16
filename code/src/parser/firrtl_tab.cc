
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 1

/* Substitute the variable and function names.  */
#define yyparse         firrtlparse
#define yylex           firrtllex
#define yyerror         firrtlerror
#define yylval          firrtllval
#define yychar          firrtlchar
#define yydebug         firrtldebug
#define yynerrs         firrtlnerrs
#define yylloc          firrtllloc

/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 1 "firrtl.y"

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



/* Line 189 of yacc.c  */
#line 296 "firrtl_tab.cc"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     kEOF = 0,
     kID = 258,
     kRELAXED_ID = 259,
     kUNSIGNEDINT = 260,
     kSIGNEDINT = 261,
     kHEXLIT = 262,
     kOCTALLIT = 263,
     kBINARYLIT = 264,
     kDOUBLELIT = 265,
     kQUOTED_STRING = 266,
     kCOLON = 267,
     kDOT = 268,
     kQUESTION_MARK = 269,
     kCOMMA = 270,
     kBRACKET_L = 271,
     kBRACKET_R = 272,
     kBRACKET_SL = 273,
     kBRACKET_SR = 274,
     kPARENT_L = 275,
     kPARENT_R = 276,
     kSQUARE_LB = 277,
     kSQUARE_RB = 278,
     kBRACE_L = 279,
     kBRACE_R = 280,
     kASSIGN = 281,
     kEQ = 282,
     kQUOTATION_MARK = 283,
     kAPOSTROPHE = 284,
     kCIRCUIT = 285,
     kMODULE = 286,
     kEXTMODULE = 287,
     kINPUT = 288,
     kOUTPUT = 289,
     kUINT = 290,
     kSINT = 291,
     kFIXED = 292,
     kINTERVAL = 293,
     kCLOCK = 294,
     kASYNCRESET = 295,
     kRESET = 296,
     kANALOG = 297,
     kFLIP = 298,
     kWIRE = 299,
     kMEM = 300,
     kCMEM = 301,
     kSMEM = 302,
     kOLD = 303,
     kNEW = 304,
     kUNDEFINED = 305,
     kINST = 306,
     kOF = 307,
     kSKIP = 308,
     kDATATYPE = 309,
     kDEPTH = 310,
     kREADLATENCY = 311,
     kWRITELATENCY = 312,
     kREADUNDERWRITE = 313,
     kREADER = 314,
     kWRITER = 315,
     kREADWRITER = 316,
     kNODE = 317,
     kDEFNAME = 318,
     kPARAMETER = 319,
     kMUX = 320,
     kVALIDIF = 321,
     kPRIMOPADD = 322,
     kPRIMOPSUB = 323,
     kPRIMOPMUL = 324,
     kPRIMOPDIV = 325,
     kPRIMOPREM = 326,
     kPRIMOPLT = 327,
     kPRIMOPLEQ = 328,
     kPRIMOPGT = 329,
     kPRIMOPGEQ = 330,
     kPRIMOPEQ = 331,
     kPRIMOPNEQ = 332,
     kPRIMOPPAD = 333,
     kPRIMOPASUINT = 334,
     kPRIMOPASASYNCRESET = 335,
     kPRIMOPASSINT = 336,
     kPRIMOPASCLOCK = 337,
     kPRIMOPASFIXEDPOINT = 338,
     kPRIMOPASINTERVAL = 339,
     kPRIMOPSHL = 340,
     kPRIMOPSHR = 341,
     kPRIMOPDSHL = 342,
     kPRIMOPDSHR = 343,
     kPRIMOPCVT = 344,
     kPRIMOPNEG = 345,
     kPRIMOPNOT = 346,
     kPRIMOPAND = 347,
     kPRIMOPOR = 348,
     kPRIMOPXOR = 349,
     kPRIMOPANDR = 350,
     kPRIMOPORR = 351,
     kPRIMOPXORR = 352,
     kPRIMOPCAT = 353,
     kPRIMOPBITS = 354,
     kPRIMOPHEAD = 355,
     kPRIMOPTAIL = 356,
     kPRIMOPINCP = 357,
     kPRIMOPDECP = 358,
     kPRIMOPSETP = 359,
     kPRIMOPWRAP = 360,
     kPRIMOPCLIP = 361,
     kPRIMOPSQUZ = 362,
     kREG = 363,
     kWITH = 364,
     kREGRESET = 365,
     kMPORT = 366,
     kINFER = 367,
     kREAD = 368,
     kWRITE = 369,
     kRDWR = 370,
     kCONNECT = 371,
     kPARTIAL_CONNECT = 372,
     kISINVALID = 373,
     kIS = 374,
     kINVALID = 375,
     kSTOP = 376,
     kPRINTF = 377,
     kATTACH = 378,
     kWHEN = 379,
     kELSE = 380,
     kINFO = 381,
     kNEWLINE = 382,
     kINDENT = 383,
     kCOMMENT = 384,
     EMPTY = 385
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 221 "firrtl.y"

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



/* Line 214 of yacc.c  */
#line 479 "firrtl_tab.cc"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 504 "firrtl_tab.cc"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  34
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1949

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  131
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  115
/* YYNRULES -- Number of rules.  */
#define YYNRULES  348
/* YYNRULES -- Number of states.  */
#define YYNSTATES  814

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   385

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    26,    33,    40,    47,    49,    51,    53,
      55,    57,    59,    61,    63,    65,    67,    69,    71,    73,
      75,    77,    79,    81,    83,    85,    87,    94,   102,   112,
     120,   130,   138,   140,   142,   150,   159,   169,   179,   190,
     210,   231,   242,   249,   255,   261,   267,   273,   279,   285,
     291,   297,   305,   313,   322,   324,   326,   328,   342,   344,
     346,   348,   350,   358,   366,   373,   380,   386,   393,   399,
     411,   425,   439,   455,   471,   489,   494,   502,   504,   508,
     510,   512,   514,   516,   518,   520,   522,   524,   526,   528,
     530,   535,   537,   542,   544,   549,   554,   562,   564,   571,
     580,   582,   584,   586,   588,   593,   598,   601,   605,   607,
     611,   615,   620,   622,   624,   626,   628,   630,   632,   634,
     636,   638,   640,   642,   644,   649,   657,   664,   674,   679,
     687,   694,   704,   706,   710,   714,   719,   724,   733,   740,
     742,   744,   746,   748,   750,   752,   754,   756,   758,   760,
     762,   764,   766,   768,   770,   772,   774,   776,   778,   780,
     782,   784,   786,   788,   790,   792,   794,   796,   798,   800,
     802,   804,   806,   808,   810,   812,   814,   816,   818,   820,
     822,   829,   836,   843,   850,   857,   864,   871,   878,   885,
     892,   899,   906,   911,   916,   921,   928,   933,   944,   951,
     958,   965,   972,   977,   982,   987,   994,  1001,  1008,  1013,
    1018,  1023,  1030,  1039,  1046,  1053,  1060,  1067,  1074,  1081,
    1088,  1095,  1097,  1099,  1101,  1103,  1105,  1107,  1109,  1111,
    1113,  1115,  1117,  1119,  1121,  1123,  1125,  1127,  1129,  1131,
    1133,  1135,  1137,  1139,  1141,  1143,  1145,  1147,  1149,  1151,
    1153,  1155,  1157,  1159,  1161,  1163,  1165,  1167,  1169,  1171,
    1173,  1175,  1177,  1179,  1181,  1183,  1185,  1187,  1189,  1191,
    1193,  1195,  1197,  1199,  1201,  1203,  1205,  1207,  1209,  1211,
    1213,  1215,  1217,  1219,  1221,  1223,  1225,  1227,  1229,  1231,
    1233,  1235,  1237,  1239,  1241,  1243,  1245,  1247,  1249,  1251,
    1253,  1255,  1257,  1259,  1261,  1263,  1265,  1267,  1269,  1271,
    1273,  1275,  1277,  1279,  1281,  1283,  1285,  1287,  1289,  1291,
    1293,  1295,  1297,  1299,  1301,  1303,  1305,  1307,  1309,  1311,
    1313,  1314,  1316,  1318,  1320,  1323,  1326,  1329,  1332
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     132,     0,    -1,   133,    -1,   134,    -1,   133,   134,    -1,
     244,    -1,   245,    -1,   135,    -1,   136,    -1,   137,    -1,
     147,    -1,   145,    -1,   138,    -1,   241,    30,   232,    12,
     242,   243,    -1,   241,    31,   232,    12,   242,   243,    -1,
     241,    32,   232,    12,   242,   243,    -1,   141,    -1,   143,
      -1,   144,    -1,   146,    -1,   148,    -1,   149,    -1,   151,
      -1,   153,    -1,   154,    -1,   155,    -1,   156,    -1,   157,
      -1,   158,    -1,   159,    -1,   160,    -1,   161,    -1,   162,
      -1,   163,    -1,   139,    -1,   140,    -1,   241,    63,    27,
     232,   242,   243,    -1,   241,    64,   232,    27,   237,   242,
     243,    -1,   241,    64,   232,    27,    28,    11,    28,   242,
     243,    -1,   241,    64,   232,    27,    10,   242,   243,    -1,
     241,    64,   232,    27,    29,    11,    29,   242,   243,    -1,
     241,   142,   232,    12,   165,   242,   243,    -1,    33,    -1,
      34,    -1,   241,    44,   232,    12,   165,   242,   243,    -1,
     241,   108,   232,    12,   165,   178,   242,   243,    -1,   241,
     108,   232,    12,   165,    15,   178,   242,   243,    -1,   241,
     108,   232,    12,   165,   178,   109,    12,   243,    -1,   241,
     108,   232,    12,   165,    15,   178,   109,    12,   243,    -1,
     241,   108,   232,    12,   165,   178,   109,    12,    20,   110,
      26,    20,   178,    15,   178,    21,    21,   242,   243,    -1,
     241,   108,   232,    12,   165,    15,   178,   109,    12,    20,
     110,    26,    20,   178,    15,   178,    21,    21,   242,   243,
      -1,   241,   110,    26,    20,   178,    15,   178,    21,   242,
     243,    -1,   241,    45,   232,    12,   242,   243,    -1,   241,
      54,    26,   165,   243,    -1,   241,    55,    26,   237,   243,
      -1,   241,    56,    26,   237,   243,    -1,   241,    57,    26,
     237,   243,    -1,   241,    58,    26,   150,   243,    -1,   241,
      59,    26,   232,   243,    -1,   241,    60,    26,   232,   243,
      -1,   241,    61,    26,   232,   243,    -1,   241,    46,   232,
      12,   165,   242,   243,    -1,   241,    47,   232,    12,   165,
     242,   243,    -1,   241,    47,   232,    12,   165,   150,   242,
     243,    -1,    48,    -1,    49,    -1,    50,    -1,   241,   152,
     111,   232,    27,   232,    22,   178,    23,    15,   178,   242,
     243,    -1,   112,    -1,   113,    -1,   114,    -1,   115,    -1,
     241,    51,   232,    52,   232,   242,   243,    -1,   241,    62,
     232,    27,   178,   242,   243,    -1,   241,   178,   116,   178,
     242,   243,    -1,   241,   178,   117,   178,   242,   243,    -1,
     241,   178,   118,   242,   243,    -1,   241,   124,   178,    12,
     242,   243,    -1,   241,   125,    12,   242,   243,    -1,   241,
     121,    20,   178,    15,   178,    15,   237,    21,   242,   243,
      -1,   241,   121,    20,   178,    15,   178,    15,   237,    21,
      12,   232,   242,   243,    -1,   241,   122,    20,   178,    15,
     178,    15,    28,    11,    28,    21,   242,   243,    -1,   241,
     122,    20,   178,    15,   178,    15,    28,    11,    28,    21,
      12,   232,   242,   243,    -1,   241,   122,    20,   178,    15,
     178,    15,    28,    11,    28,    15,   164,    21,   242,   243,
      -1,   241,   122,    20,   178,    15,   178,    15,    28,    11,
      28,    15,   164,    21,    12,   232,   242,   243,    -1,   241,
      53,   242,   243,    -1,   241,   123,    20,   164,    21,   242,
     243,    -1,   178,    -1,   164,    15,   178,    -1,   166,    -1,
     167,    -1,   168,    -1,   169,    -1,   170,    -1,   171,    -1,
     172,    -1,   173,    -1,   174,    -1,   175,    -1,    35,    -1,
      35,    16,   237,    17,    -1,    36,    -1,    36,    16,   237,
      17,    -1,    37,    -1,    37,    16,   237,    17,    -1,    37,
      18,   237,    19,    -1,    37,    16,   237,    17,    18,   237,
      19,    -1,    38,    -1,    38,   238,   240,    15,   240,   239,
      -1,    38,   238,   240,    15,   240,   239,    13,   237,    -1,
      39,    -1,    40,    -1,    41,    -1,    42,    -1,    42,    16,
       5,    17,    -1,   165,    22,   237,    23,    -1,    24,    25,
      -1,    24,   176,    25,    -1,   177,    -1,   176,    15,   177,
      -1,   234,    12,   165,    -1,    43,   234,    12,   165,    -1,
     179,    -1,   180,    -1,   181,    -1,   182,    -1,   183,    -1,
     184,    -1,   185,    -1,   186,    -1,   187,    -1,   188,    -1,
     189,    -1,   190,    -1,    35,    20,   237,    21,    -1,    35,
      16,   237,    17,    20,   237,    21,    -1,    35,    20,    28,
     237,    28,    21,    -1,    35,    16,   237,    17,    20,    28,
     237,    28,    21,    -1,    36,    20,   237,    21,    -1,    36,
      16,   237,    17,    20,   237,    21,    -1,    36,    20,    28,
     237,    28,    21,    -1,    36,    16,   237,    17,    20,    28,
     237,    28,    21,    -1,   232,    -1,   178,    13,   234,    -1,
     178,    13,    10,    -1,   178,    22,   237,    23,    -1,   178,
      22,   178,    23,    -1,    65,    20,   178,    15,   178,    15,
     178,    21,    -1,    66,    20,   178,    15,   178,    21,    -1,
     191,    -1,   192,    -1,   193,    -1,   194,    -1,   195,    -1,
     196,    -1,   197,    -1,   198,    -1,   199,    -1,   200,    -1,
     201,    -1,   202,    -1,   203,    -1,   207,    -1,   204,    -1,
     205,    -1,   206,    -1,   208,    -1,   209,    -1,   210,    -1,
     211,    -1,   212,    -1,   213,    -1,   214,    -1,   215,    -1,
     216,    -1,   217,    -1,   218,    -1,   219,    -1,   220,    -1,
     221,    -1,   222,    -1,   223,    -1,   224,    -1,   225,    -1,
     226,    -1,   227,    -1,   228,    -1,   229,    -1,   230,    -1,
     231,    -1,    67,    20,   178,    15,   178,    21,    -1,    68,
      20,   178,    15,   178,    21,    -1,    69,    20,   178,    15,
     178,    21,    -1,    70,    20,   178,    15,   178,    21,    -1,
      71,    20,   178,    15,   178,    21,    -1,    72,    20,   178,
      15,   178,    21,    -1,    73,    20,   178,    15,   178,    21,
      -1,    74,    20,   178,    15,   178,    21,    -1,    75,    20,
     178,    15,   178,    21,    -1,    76,    20,   178,    15,   178,
      21,    -1,    77,    20,   178,    15,   178,    21,    -1,    78,
      20,   178,    15,   237,    21,    -1,    79,    20,   178,    21,
      -1,    81,    20,   178,    21,    -1,    82,    20,   178,    21,
      -1,    83,    20,   178,    15,   237,    21,    -1,    80,    20,
     178,    21,    -1,    84,    20,   178,    15,   237,    15,   237,
      15,   237,    21,    -1,    85,    20,   178,    15,   237,    21,
      -1,    86,    20,   178,    15,   237,    21,    -1,    87,    20,
     178,    15,   178,    21,    -1,    88,    20,   178,    15,   178,
      21,    -1,    89,    20,   178,    21,    -1,    90,    20,   178,
      21,    -1,    91,    20,   178,    21,    -1,    92,    20,   178,
      15,   178,    21,    -1,    93,    20,   178,    15,   178,    21,
      -1,    94,    20,   178,    15,   178,    21,    -1,    95,    20,
     178,    21,    -1,    96,    20,   178,    21,    -1,    97,    20,
     178,    21,    -1,    98,    20,   178,    15,   178,    21,    -1,
      99,    20,   178,    15,   237,    15,   237,    21,    -1,   100,
      20,   178,    15,   237,    21,    -1,   101,    20,   178,    15,
     237,    21,    -1,   102,    20,   178,    15,   237,    21,    -1,
     103,    20,   178,    15,   237,    21,    -1,   104,    20,   178,
      15,   237,    21,    -1,   105,    20,   178,    15,   178,    21,
      -1,   106,    20,   178,    15,   178,    21,    -1,   107,    20,
     178,    15,   178,    21,    -1,     3,    -1,   235,    -1,     4,
      -1,   232,    -1,   233,    -1,     5,    -1,    30,    -1,    31,
      -1,    32,    -1,    63,    -1,    64,    -1,    33,    -1,    34,
      -1,    35,    -1,    36,    -1,    39,    -1,    40,    -1,    41,
      -1,    42,    -1,    37,    -1,    38,    -1,    43,    -1,    44,
      -1,   108,    -1,   109,    -1,   110,    -1,    45,    -1,    55,
      -1,    59,    -1,    60,    -1,    61,    -1,    51,    -1,    52,
      -1,    62,    -1,   119,    -1,   120,    -1,   124,    -1,   125,
      -1,   121,    -1,   122,    -1,    53,    -1,    48,    -1,    49,
      -1,    50,    -1,    65,    -1,    66,    -1,    46,    -1,    47,
      -1,   111,    -1,   112,    -1,   113,    -1,   114,    -1,   115,
      -1,   236,    -1,    67,    -1,    68,    -1,    69,    -1,    70,
      -1,    71,    -1,    72,    -1,    73,    -1,    74,    -1,    75,
      -1,    76,    -1,    77,    -1,    78,    -1,    79,    -1,    80,
      -1,    81,    -1,    82,    -1,    83,    -1,    84,    -1,    85,
      -1,    86,    -1,    87,    -1,    88,    -1,    89,    -1,    90,
      -1,    91,    -1,    92,    -1,    93,    -1,    94,    -1,    95,
      -1,    96,    -1,    97,    -1,    98,    -1,    99,    -1,   100,
      -1,   101,    -1,   102,    -1,   103,    -1,   104,    -1,   105,
      -1,   106,    -1,   107,    -1,     5,    -1,     6,    -1,     7,
      -1,     8,    -1,     9,    -1,    22,    -1,    20,    -1,    23,
      -1,    21,    -1,    14,    -1,    10,    -1,     5,    -1,     6,
      -1,   128,    -1,    -1,   126,    -1,   127,    -1,     0,    -1,
     129,   127,    -1,   129,     0,    -1,   241,   127,    -1,   241,
       0,    -1,   241,   129,   243,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   479,   479,   491,   492,   496,   497,   498,   499,   500,
     501,   502,   503,   507,   519,   527,   538,   539,   540,   541,
     542,   543,   544,   545,   546,   547,   548,   549,   550,   551,
     552,   553,   554,   555,   559,   560,   564,   577,   586,   596,
     605,   619,   632,   633,   637,   653,   667,   681,   693,   705,
     719,   736,   747,   764,   770,   778,   786,   794,   800,   807,
     814,   824,   840,   853,   869,   870,   871,   875,   892,   893,
     894,   895,   899,   916,   932,   947,   962,   977,   994,  1009,
    1023,  1042,  1056,  1072,  1090,  1113,  1128,  1147,  1150,  1158,
    1159,  1160,  1161,  1162,  1163,  1164,  1165,  1166,  1167,  1171,
    1176,  1186,  1191,  1201,  1206,  1214,  1222,  1236,  1241,  1265,
    1294,  1302,  1310,  1318,  1323,  1333,  1344,  1349,  1361,  1364,
    1371,  1376,  1385,  1386,  1387,  1388,  1389,  1390,  1391,  1392,
    1393,  1394,  1395,  1396,  1400,  1408,  1420,  1427,  1438,  1446,
    1458,  1465,  1476,  1485,  1494,  1506,  1516,  1524,  1532,  1540,
    1541,  1542,  1543,  1544,  1545,  1546,  1547,  1548,  1549,  1550,
    1551,  1552,  1553,  1554,  1555,  1556,  1557,  1558,  1559,  1560,
    1561,  1562,  1563,  1564,  1565,  1566,  1567,  1568,  1569,  1570,
    1571,  1572,  1573,  1574,  1575,  1576,  1577,  1578,  1579,  1580,
    1584,  1592,  1600,  1608,  1616,  1624,  1632,  1640,  1648,  1656,
    1664,  1672,  1682,  1690,  1698,  1706,  1716,  1724,  1738,  1748,
    1758,  1766,  1774,  1782,  1790,  1798,  1806,  1814,  1822,  1830,
    1838,  1846,  1854,  1866,  1876,  1886,  1896,  1906,  1916,  1924,
    1932,  1941,  1942,  1946,  1950,  1951,  1952,  1956,  1957,  1958,
    1959,  1960,  1961,  1962,  1963,  1964,  1965,  1966,  1967,  1968,
    1969,  1970,  1971,  1972,  1973,  1974,  1975,  1976,  1978,  1982,
    1983,  1984,  1985,  1986,  1987,  1988,  1989,  1990,  1991,  1992,
    1993,  1994,  1995,  1996,  1997,  1998,  1999,  2000,  2001,  2002,
    2003,  2004,  2005,  2006,  2007,  2011,  2012,  2013,  2014,  2015,
    2016,  2017,  2018,  2019,  2020,  2021,  2022,  2023,  2024,  2025,
    2026,  2027,  2028,  2029,  2030,  2031,  2032,  2033,  2034,  2035,
    2036,  2037,  2038,  2039,  2040,  2041,  2042,  2043,  2044,  2045,
    2046,  2047,  2048,  2049,  2050,  2051,  2056,  2057,  2058,  2059,
    2060,  2064,  2065,  2069,  2070,  2074,  2075,  2076,  2077,  2082,
    2086,  2087,  2091,  2092,  2093,  2094,  2097,  2098,  2102
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "kEOF", "error", "$undefined", "kID", "kRELAXED_ID", "kUNSIGNEDINT",
  "kSIGNEDINT", "kHEXLIT", "kOCTALLIT", "kBINARYLIT", "kDOUBLELIT",
  "kQUOTED_STRING", "kCOLON", "kDOT", "kQUESTION_MARK", "kCOMMA",
  "kBRACKET_L", "kBRACKET_R", "kBRACKET_SL", "kBRACKET_SR", "kPARENT_L",
  "kPARENT_R", "kSQUARE_LB", "kSQUARE_RB", "kBRACE_L", "kBRACE_R",
  "kASSIGN", "kEQ", "kQUOTATION_MARK", "kAPOSTROPHE", "kCIRCUIT",
  "kMODULE", "kEXTMODULE", "kINPUT", "kOUTPUT", "kUINT", "kSINT", "kFIXED",
  "kINTERVAL", "kCLOCK", "kASYNCRESET", "kRESET", "kANALOG", "kFLIP",
  "kWIRE", "kMEM", "kCMEM", "kSMEM", "kOLD", "kNEW", "kUNDEFINED", "kINST",
  "kOF", "kSKIP", "kDATATYPE", "kDEPTH", "kREADLATENCY", "kWRITELATENCY",
  "kREADUNDERWRITE", "kREADER", "kWRITER", "kREADWRITER", "kNODE",
  "kDEFNAME", "kPARAMETER", "kMUX", "kVALIDIF", "kPRIMOPADD", "kPRIMOPSUB",
  "kPRIMOPMUL", "kPRIMOPDIV", "kPRIMOPREM", "kPRIMOPLT", "kPRIMOPLEQ",
  "kPRIMOPGT", "kPRIMOPGEQ", "kPRIMOPEQ", "kPRIMOPNEQ", "kPRIMOPPAD",
  "kPRIMOPASUINT", "kPRIMOPASASYNCRESET", "kPRIMOPASSINT",
  "kPRIMOPASCLOCK", "kPRIMOPASFIXEDPOINT", "kPRIMOPASINTERVAL",
  "kPRIMOPSHL", "kPRIMOPSHR", "kPRIMOPDSHL", "kPRIMOPDSHR", "kPRIMOPCVT",
  "kPRIMOPNEG", "kPRIMOPNOT", "kPRIMOPAND", "kPRIMOPOR", "kPRIMOPXOR",
  "kPRIMOPANDR", "kPRIMOPORR", "kPRIMOPXORR", "kPRIMOPCAT", "kPRIMOPBITS",
  "kPRIMOPHEAD", "kPRIMOPTAIL", "kPRIMOPINCP", "kPRIMOPDECP",
  "kPRIMOPSETP", "kPRIMOPWRAP", "kPRIMOPCLIP", "kPRIMOPSQUZ", "kREG",
  "kWITH", "kREGRESET", "kMPORT", "kINFER", "kREAD", "kWRITE", "kRDWR",
  "kCONNECT", "kPARTIAL_CONNECT", "kISINVALID", "kIS", "kINVALID", "kSTOP",
  "kPRINTF", "kATTACH", "kWHEN", "kELSE", "kINFO", "kNEWLINE", "kINDENT",
  "kCOMMENT", "EMPTY", "$accept", "Firrtl", "FirrtlFile",
  "FirrtlFileContent", "Circuit", "Module", "ModuleItem", "ExtmoduleItem",
  "Defname", "Parameter", "ItemPort", "PortDir", "ItemWire",
  "ItemRegister", "RegResetBlock", "ItemMemory", "MemField", "ItemCMemory",
  "ItemSMemory", "Ruw", "ItemMPort", "MPortDir", "ItemInstance",
  "ItemNode", "ItemConnect", "ItemPartialConnect", "ItemInvalidate",
  "ItemWhen", "ItemElse", "ItemStop", "ItemPrintf", "ItemEmpty",
  "ItemAttach", "MultiExpression", "Type", "TypeUInt", "TypeSInt",
  "TypeFixed", "TypeInterval", "TypeClock", "TypeAsyncReset", "TypeReset",
  "TypeAnalog", "TypeVector", "TypeBundle", "MultiField", "Field",
  "Expression", "ExpUInt", "ExpUIntBits", "ExpSInt", "ExpSIntBits",
  "ExpId", "ExpSubfield", "ExpDouble", "ExpSubindex", "ExpSubaccess",
  "ExpMux", "ExpValidif", "ExpPrimOp", "ExpPrimOpAdd", "ExpPrimOpSub",
  "ExpPrimOpMul", "ExpPrimOpDiv", "ExpPrimOpRem", "ExpPrimOpLt",
  "ExpPrimOpLeq", "ExpPrimOpGt", "ExpPrimOpGeq", "ExpPrimOpEq",
  "ExpPrimOpNeq", "ExpPrimOpPad", "ExpPrimOpAsUInt", "ExpPrimOpAsSInt",
  "ExpPrimOpAsClock", "ExpPrimOpAsFixedPoint", "ExpPrimOpAsAsyncReset",
  "ExpPrimOpAsInterval", "ExpPrimOpShl", "ExpPrimOpShr", "ExpPrimOpDshl",
  "ExpPrimOpDshr", "ExpPrimOpCvt", "ExpPrimOpNeg", "ExpPrimOpNot",
  "ExpPrimOpAnd", "ExpPrimOpOr", "ExpPrimOpXor", "ExpPrimOpAndr",
  "ExpPrimOpOrr", "ExpPrimOpXorr", "ExpPrimOpCat", "ExpPrimOpBits",
  "ExpPrimOpHead", "ExpPrimOpTail", "ExpPrimOpIncp", "ExpPrimOpDecp",
  "ExpPrimOpSetp", "ExpPrimOpWrap", "ExpPrimOpClip", "ExpPrimOpSquz", "Id",
  "RelaxedId", "FieldId", "KeyworkAsId", "PrimopAsId", "IntLit",
  "LowerBound", "UpperBound", "BoundValue", "Indent", "Info", "Newline",
  "EmptyLine", "CommentLine", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382,   383,   384,
     385
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   131,   132,   133,   133,   134,   134,   134,   134,   134,
     134,   134,   134,   135,   136,   136,   137,   137,   137,   137,
     137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
     137,   137,   137,   137,   138,   138,   139,   140,   140,   140,
     140,   141,   142,   142,   143,   144,   144,   144,   144,   144,
     144,   145,   146,   147,   147,   147,   147,   147,   147,   147,
     147,   148,   149,   149,   150,   150,   150,   151,   152,   152,
     152,   152,   153,   154,   155,   156,   157,   158,   159,   160,
     160,   161,   161,   161,   161,   162,   163,   164,   164,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   166,
     166,   167,   167,   168,   168,   168,   168,   169,   169,   169,
     170,   171,   172,   173,   173,   174,   175,   175,   176,   176,
     177,   177,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   179,   179,   180,   180,   181,   181,
     182,   182,   183,   184,   185,   186,   187,   188,   189,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     191,   192,   193,   194,   195,   196,   197,   198,   199,   200,
     201,   202,   203,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,   214,   215,   216,   217,   218,   219,   220,
     221,   222,   223,   224,   225,   226,   227,   228,   229,   230,
     231,   232,   232,   233,   234,   234,   234,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   237,   237,   237,   237,
     237,   238,   238,   239,   239,   240,   240,   240,   240,   241,
     242,   242,   243,   243,   243,   243,   244,   244,   245
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     6,     6,     6,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     6,     7,     9,     7,
       9,     7,     1,     1,     7,     8,     9,     9,    10,    19,
      20,    10,     6,     5,     5,     5,     5,     5,     5,     5,
       5,     7,     7,     8,     1,     1,     1,    13,     1,     1,
       1,     1,     7,     7,     6,     6,     5,     6,     5,    11,
      13,    13,    15,    15,    17,     4,     7,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     4,     1,     4,     4,     7,     1,     6,     8,
       1,     1,     1,     1,     4,     4,     2,     3,     1,     3,
       3,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     7,     6,     9,     4,     7,
       6,     9,     1,     3,     3,     4,     4,     8,     6,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       6,     6,     6,     6,     6,     6,     6,     6,     6,     6,
       6,     6,     4,     4,     4,     6,     4,    10,     6,     6,
       6,     6,     4,     4,     4,     6,     6,     6,     4,     4,
       4,     6,     8,     6,     6,     6,     6,     6,     6,     6,
       6,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     1,     1,     1,     2,     2,     2,     2,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,   339,     0,     2,     3,     7,     8,     9,    12,    34,
      35,    16,    17,    18,    11,    19,    10,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,     0,     5,     6,     1,     4,   347,   231,   237,   238,
     239,    42,    43,   244,   245,   250,   251,   246,   247,   248,
     249,   252,   253,   257,   277,   278,   272,   273,   274,   262,
     263,   271,     0,   258,     0,     0,     0,   259,   260,   261,
     264,   240,   241,   275,   276,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   296,   297,   298,   299,
     300,   301,   302,   303,   304,   305,   306,   307,   308,   309,
     310,   311,   312,   313,   314,   315,   316,   317,   318,   319,
     320,   321,   322,   323,   324,   325,   254,   255,   256,   279,
     280,   281,   282,   283,   265,   266,   269,   270,     0,   267,
     268,   346,     0,     0,     0,     0,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   149,   150,
     151,   152,   153,   154,   155,   156,   157,   158,   159,   160,
     161,   163,   164,   165,   162,   166,   167,   168,   169,   170,
     171,   172,   173,   174,   175,   176,   177,   178,   179,   180,
     181,   182,   183,   184,   185,   186,   187,   188,   189,   142,
     232,   284,   237,   238,   239,   242,   243,   244,   245,   253,
     257,   277,   278,   262,   271,   258,   259,   260,   261,   264,
     240,   241,   275,   276,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   298,   299,   300,
     301,   302,   303,   304,   305,   306,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   325,   254,   256,   280,   281,   282,
     283,   269,   270,   267,   268,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   341,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   340,
     343,   342,     0,   348,     0,     0,     0,     0,     0,     0,
     340,   340,   340,   340,   326,   327,   328,   329,   330,     0,
       0,     0,     0,     0,     0,     0,   340,     0,     0,     0,
      85,     0,    99,   101,   103,   107,   110,   111,   112,   113,
       0,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,     0,     0,     0,    64,    65,    66,     0,     0,     0,
       0,     0,   340,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    87,   340,     0,   345,   344,     0,     0,   233,
     236,   144,   234,   235,   143,     0,     0,   340,   340,     0,
       0,     0,     0,     0,     0,   134,     0,     0,   138,   340,
       0,   340,   340,   340,   116,   252,     0,   118,     0,     0,
       0,     0,     0,   332,   331,     0,     0,     0,    53,    54,
      55,    56,    57,    58,    59,    60,   340,     0,   340,     0,
       0,   340,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   202,   206,   203,   204,
       0,     0,     0,     0,     0,     0,   212,   213,   214,     0,
       0,     0,   218,   219,   220,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     340,     0,    78,   340,     0,   146,   145,     0,     0,    76,
      13,    14,    15,     0,     0,     0,     0,     0,    52,     0,
     340,     0,     0,     0,     0,   117,     0,     0,     0,     0,
       0,   337,   338,   336,   335,     0,     0,     0,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   340,     0,
       0,     0,    88,     0,    77,     0,     0,    74,    75,     0,
       0,   136,     0,     0,   140,    44,    61,     0,    62,    72,
       0,   119,   120,   100,   102,   104,   105,     0,   114,   115,
      73,    39,   340,   340,    37,     0,   148,   190,   191,   192,
     193,   194,   195,   196,   197,   198,   199,   200,   201,   205,
       0,   208,   209,   210,   211,   215,   216,   217,   221,     0,
     223,   224,   225,   226,   227,   228,   229,   230,   340,     0,
       0,     0,     0,     0,    86,    41,     0,     0,   135,     0,
     139,    63,   121,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    45,   340,     0,     0,     0,     0,     0,
       0,   334,   333,   108,    38,    40,   147,     0,   222,     0,
      46,     0,    47,     0,   340,     0,     0,   137,   141,   106,
       0,     0,     0,    48,     0,    51,     0,     0,     0,     0,
     109,   207,     0,     0,   340,    79,     0,   340,   340,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   340,
     340,    81,    67,     0,     0,     0,     0,     0,     0,     0,
     340,    83,    82,     0,     0,     0,     0,   340,    84,   340,
       0,     0,    49,    50
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,   133,    12,    13,    14,    15,    16,    17,    18,   397,
      19,   134,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,   451,   380,   381,   382,   383,   384,   385,
     386,   387,   388,   389,   390,   486,   487,   452,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,   147,
     148,   149,   150,   151,   152,   153,   154,   155,   156,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,   176,   177,
     178,   179,   180,   181,   182,   183,   184,   185,   186,   187,
     188,   189,   463,   488,   190,   191,   359,   495,   743,   595,
      31,   278,   343,    32,    33
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -355
static const yytype_int16 yypact[] =
{
    -111,  -355,    24,  -111,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,   114,  -355,  -355,  -355,  -355,  -355,  -355,  1711,  1711,
    1711,     5,   235,    81,    99,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  1711,  1711,  1711,  1711,  -355,  -355,  -355,  1711,
    -355,     2,    26,    60,    63,    76,    78,   100,   107,   216,
    1711,    39,  1711,    31,   105,   226,   236,   238,   294,   295,
     314,   315,   320,   323,   329,   336,   359,   366,   409,   426,
     428,   433,   439,   450,   474,   475,   480,   481,   482,   487,
     492,   495,   497,   499,   505,   510,   522,   529,   559,   566,
     579,   580,   582,   583,   585,   597,  1711,  -355,   223,  -355,
     -26,   196,   219,   220,  -355,  -355,   599,   604,   632,  1824,
     343,  -355,    12,  1711,   256,   289,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,   370,   380,   383,   628,    40,
     628,    50,   386,   396,   397,   408,   319,  -355,    12,    71,
     628,   628,   628,   387,  1711,  1711,  1711,   414,  1711,   449,
    1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,
    1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,
    1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,
    1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,
    1824,  1824,  1824,   418,   633,  1824,  1824,  1824,    28,   419,
    -355,  -355,    15,  -355,   460,  1711,  1146,  1033,  1824,  1824,
     419,   419,   419,   419,  -355,  -355,  -355,  -355,  -355,   531,
     628,   542,   547,   628,   553,    71,   419,    71,    71,  1711,
    -355,  1259,   638,   639,    20,    59,  -355,  -355,  -355,   640,
       3,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,    12,    12,    12,  -355,  -355,  -355,    12,    12,    12,
      12,  1824,   419,    25,   306,   307,   310,   311,   324,   332,
     335,   346,   347,   350,   351,   361,   362,   365,   368,   372,
     375,   378,   388,   389,   399,   400,   403,   411,   406,   410,
     421,   432,   445,   453,   452,   456,   458,   483,   484,   498,
     524,   525,   528,   539,   540,   543,   544,    71,  1824,   554,
     555,    84,    69,   419,    12,  -355,  -355,    71,   533,  -355,
    -355,  -355,  -355,  -355,  -355,    47,   598,   121,   121,    12,
      12,    12,    12,   637,   641,  -355,   661,   658,  -355,     1,
      12,     1,    -6,   419,  -355,  1372,    65,  -355,   576,   628,
     628,   628,   628,  -355,  -355,    82,   687,   628,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,   121,    12,   419,   682,
     692,   419,  1824,  1824,  1824,  1824,  1824,  1824,  1824,  1824,
    1824,  1824,  1824,  1824,  1824,   628,  -355,  -355,  -355,  -355,
     628,   628,   628,   628,  1824,  1824,  -355,  -355,  -355,  1824,
    1824,  1824,  -355,  -355,  -355,  1824,   628,   628,   628,   628,
     628,   628,  1824,  1824,  1824,  1485,   560,  1824,  1824,  1824,
     419,    12,  -355,     1,  1711,  -355,  -355,    12,    12,  -355,
    -355,  -355,  -355,    56,   683,    66,   689,    12,  -355,    12,
     419,    12,    12,   696,  1598,  -355,    71,   694,   697,   712,
     716,  -355,  -355,  -355,  -355,   725,   730,   735,    12,  -355,
      12,   731,   741,    12,   565,   568,   570,   572,   588,   591,
     594,   601,   605,   607,   617,   627,   629,   743,   750,   757,
     752,   754,   650,   652,   655,   657,   662,   667,   761,   756,
     758,   759,   760,   762,   669,   674,   684,  1824,   218,  1824,
     710,   721,    69,    12,  -355,    12,   763,  -355,  -355,   628,
     765,  -355,   628,   766,  -355,  -355,  -355,    12,  -355,  -355,
      71,  -355,   769,  -355,  -355,   764,  -355,    82,  -355,  -355,
    -355,  -355,   419,   419,  -355,  1824,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
     628,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,   628,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,   232,   772,
      12,   709,   628,   770,  -355,  -355,  1824,   771,  -355,   773,
    -355,  -355,   769,   628,   287,    12,    12,   724,   777,   767,
     781,    12,     8,  -355,   419,   776,   783,    54,   779,   782,
     785,  -355,  -355,   789,  -355,  -355,  -355,   628,  -355,     9,
    -355,   668,  -355,    12,    -8,   778,   792,  -355,  -355,  -355,
     628,   788,   700,  -355,   786,  -355,  1711,    12,   229,  1824,
    -355,  -355,   790,   791,   419,  -355,  1824,    -2,   121,   794,
    1824,    12,   288,  1711,    12,    12,  1824,   726,  -355,   104,
     419,  -355,  -355,   739,  1824,  1711,    12,    12,  1824,   744,
     419,  -355,  -355,   747,   798,    12,   799,   419,  -355,   419,
      12,    12,  -355,  -355
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -355,  -355,  -355,   812,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,   340,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,    48,  -354,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,   239,   -31,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,   -33,  -355,  -345,  -355,  -355,   169,  -355,  -355,   159,
    -355,   245,    64,  -355,  -355
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -341
static const yytype_int16 yytable[] =
{
     135,   464,  -340,   340,   766,   265,   266,   267,   340,   340,
     783,   479,   340,   481,   482,   455,   497,     1,  -242,   272,
     273,   274,   275,   497,    34,   497,   276,  -242,   751,   762,
     354,   355,   356,   357,   358,   508,   491,   287,   492,   289,
     453,   346,   394,   395,   396,   354,   355,   356,   357,   358,
     347,   290,   279,   509,   510,   354,   355,   356,   357,   358,
     346,   354,   355,   356,   357,   358,   288,   346,   360,   347,
     565,   354,   355,   356,   357,   358,   347,   756,   363,   493,
     584,   494,   346,   333,   649,   -68,   280,   591,   592,   281,
     585,   347,   593,   555,   652,   371,   594,   268,   338,   559,
     344,   269,   282,   563,   283,   560,   372,   373,   374,   375,
     376,   377,   378,   379,    36,   270,   795,    37,   277,   271,
     277,  -242,  -242,  -242,   277,   291,   284,   277,   277,  -340,
     341,  -340,   342,   285,   346,   341,   341,   342,   342,   341,
     583,   342,   456,   347,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     277,   346,   662,   124,   125,   126,   127,   128,   129,   130,
     347,   131,   286,   132,   776,   346,   292,   277,  -243,   334,
     777,   398,   399,   400,   347,   402,   293,  -243,   294,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   413,   414,
     415,   416,   417,   418,   419,   420,   421,   422,   423,   424,
     425,   426,   427,   428,   429,   430,   431,   432,   433,   434,
     435,   436,   437,   438,   439,   440,   441,   442,   443,   444,
     445,   446,   346,   559,   449,   450,   722,   -69,   741,   789,
     742,   347,   458,   462,   295,   296,   465,   467,   468,   346,
     346,   512,   513,   346,   346,   514,   515,   709,   347,   347,
     -70,   -71,   347,   347,   297,   298,   483,   346,   462,   516,
     299,   730,   370,   300,   277,   346,   347,   517,   346,   301,
     518,  -243,  -243,  -243,   347,   339,   302,   347,   277,   346,
     346,   519,   520,   346,   346,   521,   522,   345,   347,   347,
     506,   369,   347,   347,   346,   346,   523,   524,   346,   303,
     525,   346,   351,   347,   347,   346,   304,   347,   346,   526,
     347,   346,   352,   527,   347,   353,   528,   347,   365,   529,
     347,   346,   346,   530,   531,   348,   349,   350,   366,   367,
     347,   347,   346,   346,   532,   533,   346,   556,   534,   346,
     368,   347,   347,   346,   346,   347,   535,   536,   347,   305,
     447,   537,   347,   347,   346,   394,   395,   396,   361,   362,
     364,   401,   538,   347,   498,   346,   306,   539,   307,   391,
     392,   393,   462,   308,   347,   499,   500,   501,   346,   309,
     540,   502,   503,   504,   505,   346,   346,   347,   541,   346,
     310,   346,   457,   542,   347,   347,   403,   543,   347,   544,
     347,   604,   605,   606,   607,   608,   609,   610,   611,   612,
     613,   614,   615,   616,   311,   312,   346,   346,   545,   546,
     313,   314,   315,   622,   623,   347,   347,   316,   624,   625,
     626,   346,   317,   547,   627,   318,   466,   319,   562,   320,
     347,   634,   635,   636,   638,   321,   640,   641,   642,   474,
     322,   646,   477,   569,   570,   571,   572,   346,   346,   548,
     549,   346,   323,   550,   578,   277,   347,   347,   473,   324,
     347,   462,   346,   346,   551,   552,   346,   346,   553,   554,
     564,   347,   347,   475,   476,   347,   347,   346,   346,   557,
     558,   599,   511,   346,   478,   639,   347,   347,   346,   325,
     675,   346,   347,   346,   454,   346,   326,   347,   586,   676,
     347,   677,   347,   678,   347,   469,   470,   471,   472,   327,
     328,   346,   329,   330,   346,   331,   708,   346,   711,   679,
     347,   480,   680,   347,   346,   681,   347,   332,   346,   335,
     346,   566,   682,   347,   336,   644,   683,   347,   684,   347,
     346,   647,   648,   354,   355,   356,   357,   358,   685,   347,
     346,   655,   346,   656,   727,   658,   659,   507,   686,   347,
     687,   347,   337,   448,   489,   490,   496,   573,   587,   588,
     589,   590,   670,   346,   671,   346,   597,   674,   346,   574,
     346,   693,   347,   694,   347,   346,   695,   347,   696,   347,
     346,   575,   346,   697,   347,   737,   576,   346,   698,   347,
     705,   347,   596,   601,   617,   706,   347,   346,   561,   618,
     619,   620,   621,   602,   651,   707,   347,   714,   660,   715,
     654,   663,   567,   568,   664,   628,   629,   630,   631,   632,
     633,   721,   346,   346,   577,   712,   579,   581,   582,   665,
     734,   347,   347,   774,   346,   666,   713,   346,   778,   346,
     667,   794,   650,   347,   653,   746,   347,   668,   347,   787,
     790,   598,   346,   600,   798,   793,   603,   346,   669,   672,
     346,   347,   800,   799,   688,   804,   347,   803,   806,   347,
     673,   689,   690,   691,   733,   692,   699,   700,   764,   701,
     702,   703,   723,   704,   732,   716,   718,   720,   748,   744,
     745,   497,   747,   749,   755,   750,   752,   754,   736,   738,
     757,   739,   760,   758,   759,   643,   768,   769,   645,   771,
     772,   780,   773,   763,   786,    35,   779,   765,   717,   807,
     809,   719,   580,   661,   782,   657,   724,     0,     0,     0,
       0,   775,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   788,     0,     0,   791,   792,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   728,
     801,   802,     0,     0,     0,     0,     0,     0,   729,   808,
       0,     0,     0,     0,   812,   813,     0,     0,     0,     0,
       0,   735,     0,   710,     0,     0,     0,     0,     0,     0,
       0,     0,   740,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   761,   725,   726,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   770,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   731,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   753,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   767,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   781,
       0,     0,   784,   785,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   796,   797,    37,     0,   354,   355,
     356,   357,   358,     0,     0,   805,     0,     0,     0,     0,
       0,     0,   810,     0,   811,     0,     0,     0,     0,     0,
       0,     0,     0,   192,   193,   194,   195,   196,    43,    44,
      45,    46,    47,    48,    49,    50,    51,   199,   200,   201,
     202,    56,    57,    58,   203,    60,   204,     0,   205,     0,
       0,     0,   206,   207,   208,   209,   210,   211,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   255,   117,   256,   119,   257,   258,   259,   260,    37,
     459,   460,   124,   125,   261,   262,   461,   263,   264,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   192,   193,   194,   195,
     196,   197,   198,    45,    46,    47,    48,    49,    50,    51,
     199,   200,   201,   202,    56,    57,    58,   203,    60,   204,
       0,   205,     0,     0,     0,   206,   207,   208,   209,   210,
     211,   212,   213,   214,   215,   216,   217,   218,   219,   220,
     221,   222,   223,   224,   225,   226,   227,   228,   229,   230,
     231,   232,   233,   234,   235,   236,   237,   238,   239,   240,
     241,   242,   243,   244,   245,   246,   247,   248,   249,   250,
     251,   252,   253,   254,   255,   117,   256,   119,   257,   258,
     259,   260,    37,   459,   460,   124,   125,   261,   262,     0,
     263,   264,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   484,     0,     0,     0,     0,   192,
     193,   194,   195,   196,   197,   198,    45,    46,    47,    48,
      49,    50,   485,   199,   200,   201,   202,    56,    57,    58,
     203,    60,   204,     0,   205,     0,     0,     0,   206,   207,
     208,   209,   210,   211,   212,   213,   214,   215,   216,   217,
     218,   219,   220,   221,   222,   223,   224,   225,   226,   227,
     228,   229,   230,   231,   232,   233,   234,   235,   236,   237,
     238,   239,   240,   241,   242,   243,   244,   245,   246,   247,
     248,   249,   250,   251,   252,   253,   254,   255,   117,   256,
     119,   257,   258,   259,   260,    37,   459,   460,   124,   125,
     261,   262,     0,   263,   264,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   192,   193,   194,   195,   196,   197,   198,    45,
      46,    47,    48,    49,    50,    51,   199,   200,   201,   202,
      56,    57,    58,   203,    60,   204,     0,   205,     0,     0,
       0,   206,   207,   208,   209,   210,   211,   212,   213,   214,
     215,   216,   217,   218,   219,   220,   221,   222,   223,   224,
     225,   226,   227,   228,   229,   230,   231,   232,   233,   234,
     235,   236,   237,   238,   239,   240,   241,   242,   243,   244,
     245,   246,   247,   248,   249,   250,   251,   252,   253,   254,
     255,   117,   256,   119,   257,   258,   259,   260,    37,     0,
       0,   124,   125,   261,   262,     0,   263,   264,     0,     0,
     637,     0,     0,     0,     0,     0,     0,   497,     0,     0,
       0,     0,     0,     0,     0,   192,   193,   194,   195,   196,
      43,    44,    45,    46,    47,    48,    49,    50,    51,   199,
     200,   201,   202,    56,    57,    58,   203,    60,   204,     0,
     205,     0,     0,     0,   206,   207,   208,   209,   210,   211,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   255,   117,   256,   119,   257,   258,   259,
     260,    37,   459,   460,   124,   125,   261,   262,     0,   263,
     264,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   192,   193,
     194,   195,   196,   197,   198,    45,    46,    47,    48,    49,
      50,   485,   199,   200,   201,   202,    56,    57,    58,   203,
      60,   204,     0,   205,     0,     0,     0,   206,   207,   208,
     209,   210,   211,   212,   213,   214,   215,   216,   217,   218,
     219,   220,   221,   222,   223,   224,   225,   226,   227,   228,
     229,   230,   231,   232,   233,   234,   235,   236,   237,   238,
     239,   240,   241,   242,   243,   244,   245,   246,   247,   248,
     249,   250,   251,   252,   253,   254,   255,   117,   256,   119,
     257,   258,   259,   260,    37,     0,     0,   124,   125,   261,
     262,     0,   263,   264,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   192,   193,   194,   195,   196,   197,   198,    45,    46,
      47,    48,    49,    50,    51,   199,   200,   201,   202,    56,
      57,    58,   203,    60,   204,     0,   205,     0,     0,     0,
     206,   207,   208,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,   219,   220,   221,   222,   223,   224,   225,
     226,   227,   228,   229,   230,   231,   232,   233,   234,   235,
     236,   237,   238,   239,   240,   241,   242,   243,   244,   245,
     246,   247,   248,   249,   250,   251,   252,   253,   254,   255,
     117,   256,   119,   257,   258,   259,   260,    37,     0,     0,
     124,   125,   261,   262,     0,   263,   264,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   192,   193,   194,   195,   196,    43,
      44,    45,    46,    47,    48,    49,    50,    51,   199,   200,
     201,   202,    56,    57,    58,   203,    60,   204,     0,   205,
       0,     0,     0,   206,   207,   208,   209,   210,   211,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   255,   117,   256,   119,   257,   258,   259,   260,
       0,     0,     0,   124,   125,   261,   262,     0,   263,   264
};

static const yytype_int16 yycheck[] =
{
      31,   346,     0,     0,    12,    38,    39,    40,     0,     0,
      12,   365,     0,   367,   368,     0,    22,   128,    13,    52,
      53,    54,    55,    22,     0,    22,    59,    22,    20,    20,
       5,     6,     7,     8,     9,    10,    16,    70,    18,    72,
      12,    13,    48,    49,    50,     5,     6,     7,     8,     9,
      22,    20,    26,    28,    29,     5,     6,     7,     8,     9,
      13,     5,     6,     7,     8,     9,    27,    13,    28,    22,
      23,     5,     6,     7,     8,     9,    22,    23,    28,    20,
      15,    22,    13,   116,    28,   111,    26,     5,     6,    26,
      25,    22,    10,   447,    28,    24,    14,    16,   129,    15,
     133,    20,    26,   457,    26,    21,    35,    36,    37,    38,
      39,    40,    41,    42,     0,    16,    12,     3,   126,    20,
     126,   116,   117,   118,   126,    20,    26,   126,   126,   127,
     127,   129,   129,    26,    13,   127,   127,   129,   129,   127,
     485,   129,   127,    22,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     126,    13,   586,   119,   120,   121,   122,   123,   124,   125,
      22,   127,    26,   129,    15,    13,    20,   126,    13,    26,
      21,   284,   285,   286,    22,   288,    20,    22,    20,   290,
     291,   292,   293,   294,   295,   296,   297,   298,   299,   300,
     301,   302,   303,   304,   305,   306,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   325,   326,   327,   328,   329,   330,
     331,   332,    13,    15,   335,   336,   660,   111,    21,    21,
      23,    22,   345,   346,    20,    20,   347,   348,   349,    13,
      13,    15,    15,    13,    13,    15,    15,   109,    22,    22,
     111,   111,    22,    22,    20,    20,   369,    13,   371,    15,
      20,   109,   278,    20,   126,    13,    22,    15,    13,    20,
      15,   116,   117,   118,    22,    12,    20,    22,   126,    13,
      13,    15,    15,    13,    13,    15,    15,   111,    22,    22,
     401,    52,    22,    22,    13,    13,    15,    15,    13,    20,
      15,    13,    12,    22,    22,    13,    20,    22,    13,    21,
      22,    13,    12,    21,    22,    12,    21,    22,    12,    21,
      22,    13,    13,    15,    15,   116,   117,   118,    12,    12,
      22,    22,    13,    13,    15,    15,    13,   448,    15,    13,
      12,    22,    22,    13,    13,    22,    15,    21,    22,    20,
      12,    21,    22,    22,    13,    48,    49,    50,   269,   270,
     271,    27,    21,    22,   380,    13,    20,    15,    20,   280,
     281,   282,   485,    20,    22,   391,   392,   393,    13,    20,
      15,   397,   398,   399,   400,    13,    13,    22,    15,    13,
      20,    13,    12,    21,    22,    22,    27,    21,    22,    21,
      22,   512,   513,   514,   515,   516,   517,   518,   519,   520,
     521,   522,   523,   524,    20,    20,    13,    13,    15,    15,
      20,    20,    20,   534,   535,    22,    22,    20,   539,   540,
     541,    13,    20,    15,   545,    20,   347,    20,   454,    20,
      22,   552,   553,   554,   555,    20,   557,   558,   559,   360,
      20,   564,   363,   469,   470,   471,   472,    13,    13,    15,
      15,    13,    20,    15,   480,   126,    22,    22,    17,    20,
      22,   584,    13,    13,    15,    15,    13,    13,    15,    15,
      27,    22,    22,    21,    17,    22,    22,    13,    13,    15,
      15,   507,   403,    13,    21,    15,    22,    22,    13,    20,
      15,    13,    22,    13,   339,    13,    20,    22,    12,    21,
      22,    21,    22,    21,    22,   350,   351,   352,   353,    20,
      20,    13,    20,    20,    13,    20,   637,    13,   639,    21,
      22,   366,    21,    22,    13,    21,    22,    20,    13,    20,
      13,    23,    21,    22,    20,   561,    21,    22,    21,    22,
      13,   567,   568,     5,     6,     7,     8,     9,    21,    22,
      13,   577,    13,   579,   675,   581,   582,   402,    21,    22,
      21,    22,    20,    20,    16,    16,    16,    20,   489,   490,
     491,   492,   598,    13,   600,    13,   497,   603,    13,    28,
      13,    21,    22,    21,    22,    13,    21,    22,    21,    22,
      13,    20,    13,    21,    22,   716,    28,    13,    21,    22,
      21,    22,     5,    11,   525,    21,    22,    13,   453,   530,
     531,   532,   533,    11,    21,    21,    22,   643,    12,   645,
      21,    17,   467,   468,    17,   546,   547,   548,   549,   550,
     551,   657,    13,    13,   479,    15,   481,   482,   483,    17,
      21,    22,    22,   766,    13,    19,    15,    13,   769,    13,
      15,    15,   573,    22,   575,    21,    22,    17,    22,   780,
     783,   506,    13,   508,    15,   786,   511,    13,    23,    28,
      13,    22,   795,   794,    21,    21,    22,   798,    21,    22,
      29,    21,    15,    21,   710,    21,    15,    21,   110,    21,
      21,    21,    18,    21,    12,    22,    21,    21,    21,   725,
     726,    22,    15,    12,    11,   731,   732,    21,    28,    28,
      21,    28,    13,    21,    19,   560,    28,    15,   563,    21,
     110,    20,    26,   749,    20,     3,    26,   753,   649,    21,
      21,   652,   482,   584,   776,   580,   667,    -1,    -1,    -1,
      -1,   767,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   781,    -1,    -1,   784,   785,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   690,
     796,   797,    -1,    -1,    -1,    -1,    -1,    -1,   699,   805,
      -1,    -1,    -1,    -1,   810,   811,    -1,    -1,    -1,    -1,
      -1,   712,    -1,   638,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   723,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   747,   672,   673,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   760,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   708,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   734,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   754,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   774,
      -1,    -1,   777,   778,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   789,   790,     3,    -1,     5,     6,
       7,     8,     9,    -1,    -1,   800,    -1,    -1,    -1,    -1,
      -1,    -1,   807,    -1,   809,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    55,    -1,
      -1,    -1,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,     3,
       4,     5,   119,   120,   121,   122,    10,   124,   125,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      -1,    55,    -1,    -1,    -1,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,     3,     4,     5,   119,   120,   121,   122,    -1,
     124,   125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    25,    -1,    -1,    -1,    -1,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    55,    -1,    -1,    -1,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,     3,     4,     5,   119,   120,
     121,   122,    -1,   124,   125,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    55,    -1,    -1,
      -1,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,     3,    -1,
      -1,   119,   120,   121,   122,    -1,   124,   125,    -1,    -1,
      15,    -1,    -1,    -1,    -1,    -1,    -1,    22,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      55,    -1,    -1,    -1,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,     3,     4,     5,   119,   120,   121,   122,    -1,   124,
     125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    55,    -1,    -1,    -1,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,     3,    -1,    -1,   119,   120,   121,
     122,    -1,   124,   125,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    55,    -1,    -1,    -1,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,     3,    -1,    -1,
     119,   120,   121,   122,    -1,   124,   125,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      -1,    -1,    -1,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
      -1,    -1,    -1,   119,   120,   121,   122,    -1,   124,   125
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,   128,   132,   133,   134,   135,   136,   137,   138,   139,
     140,   141,   143,   144,   145,   146,   147,   148,   149,   151,
     153,   154,   155,   156,   157,   158,   159,   160,   161,   162,
     163,   241,   244,   245,     0,   134,     0,     3,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   119,   120,   121,   122,   123,   124,
     125,   127,   129,   142,   152,   178,   179,   180,   181,   182,
     183,   184,   185,   186,   187,   188,   189,   190,   191,   192,
     193,   194,   195,   196,   197,   198,   199,   200,   201,   202,
     203,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,   214,   215,   216,   217,   218,   219,   220,   221,   222,
     223,   224,   225,   226,   227,   228,   229,   230,   231,   232,
     235,   236,    30,    31,    32,    33,    34,    35,    36,    44,
      45,    46,    47,    51,    53,    55,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   110,   112,   113,   114,
     115,   121,   122,   124,   125,   232,   232,   232,    16,    20,
      16,    20,   232,   232,   232,   232,   232,   126,   242,    26,
      26,    26,    26,    26,    26,    26,    26,   232,    27,   232,
      20,    20,    20,    20,    20,    20,    20,    20,    20,    20,
      20,    20,    20,    20,    20,    20,    20,    20,    20,    20,
      20,    20,    20,    20,    20,    20,    20,    20,    20,    20,
      20,    20,    20,    20,    20,    20,    20,    20,    20,    20,
      20,    20,    20,   232,    26,    20,    20,    20,   178,    12,
       0,   127,   129,   243,   232,   111,    13,    22,   116,   117,
     118,    12,    12,    12,     5,     6,     7,     8,     9,   237,
      28,   237,   237,    28,   237,    12,    12,    12,    12,    52,
     243,    24,    35,    36,    37,    38,    39,    40,    41,    42,
     165,   166,   167,   168,   169,   170,   171,   172,   173,   174,
     175,   237,   237,   237,    48,    49,    50,   150,   232,   232,
     232,    27,   232,    27,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,    12,    20,   178,
     178,   164,   178,    12,   242,     0,   127,    12,   232,     4,
       5,    10,   232,   233,   234,   178,   237,   178,   178,   242,
     242,   242,   242,    17,   237,    21,    17,   237,    21,   165,
     242,   165,   165,   232,    25,    43,   176,   177,   234,    16,
      16,    16,    18,    20,    22,   238,    16,    22,   243,   243,
     243,   243,   243,   243,   243,   243,   178,   242,    10,    28,
      29,   237,    15,    15,    15,    15,    15,    15,    15,    15,
      15,    15,    15,    15,    15,    15,    21,    21,    21,    21,
      15,    15,    15,    15,    15,    15,    21,    21,    21,    15,
      15,    15,    21,    21,    21,    15,    15,    15,    15,    15,
      15,    15,    15,    15,    15,   165,   178,    15,    15,    15,
      21,   242,   243,   165,    27,    23,    23,   242,   242,   243,
     243,   243,   243,    20,    28,    20,    28,   242,   243,   242,
     150,   242,   242,   234,    15,    25,    12,   237,   237,   237,
     237,     5,     6,    10,    14,   240,     5,   237,   242,   243,
     242,    11,    11,   242,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   237,   237,   237,
     237,   237,   178,   178,   178,   178,   178,   178,   237,   237,
     237,   237,   237,   237,   178,   178,   178,    15,   178,    15,
     178,   178,   178,   242,   243,   242,   232,   243,   243,    28,
     237,    21,    28,   237,    21,   243,   243,   242,   243,   243,
      12,   177,   165,    17,    17,    17,    19,    15,    17,    23,
     243,   243,    28,    29,   243,    15,    21,    21,    21,    21,
      21,    21,    21,    21,    21,    21,    21,    21,    21,    21,
      15,    21,    21,    21,    21,    21,    21,    21,    21,    15,
      21,    21,    21,    21,    21,    21,    21,    21,   178,   109,
     242,   178,    15,    15,   243,   243,    22,   237,    21,   237,
      21,   243,   165,    18,   240,   242,   242,   178,   237,   237,
     109,   242,    12,   243,    21,   237,    28,   178,    28,    28,
     237,    21,    23,   239,   243,   243,    21,    15,    21,    12,
     243,    20,   243,   242,    21,    11,    23,    21,    21,    19,
      13,   237,    20,   243,   110,   243,    12,   242,    28,    15,
     237,    21,   110,    26,   232,   243,    15,    21,   178,    26,
      20,   242,   164,    12,   242,   242,    20,   178,   243,    21,
     232,   243,   243,   178,    15,    12,   242,   242,    15,   178,
     232,   243,   243,   178,    21,   242,    21,    21,   243,    21,
     242,   242,   243,   243
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {
      case 164: /* "MultiExpression" */

/* Line 1000 of yacc.c  */
#line 470 "firrtl.y"
	{ delete (yyvaluep->multi_exp_value); };

/* Line 1000 of yacc.c  */
#line 2391 "firrtl_tab.cc"
	break;
      case 176: /* "MultiField" */

/* Line 1000 of yacc.c  */
#line 469 "firrtl.y"
	{ delete (yyvaluep->multi_field_value); };

/* Line 1000 of yacc.c  */
#line 2400 "firrtl_tab.cc"
	break;

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.
       `yyls': related to locations.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[2];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;

#if YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 1;
#endif

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);

	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
	YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1455 of yacc.c  */
#line 479 "firrtl.y"
    {
        cur_lib = NULL;
        cur_circuit = NULL;
        cur_module = NULL;
        cur_cond = NULL;
        cur_mem = NULL;
        cur_reg = NULL;
        free_indents();
    ;}
    break;

  case 13:

/* Line 1455 of yacc.c  */
#line 507 "firrtl.y"
    {
        cur_lib = firrtlsyn::firDB::getLib("work");
        firrtlsyn::firDB::firCircuit* circuit = cur_lib->addCircuit((yyvsp[(3) - (6)].string_value));
        free((yyvsp[(3) - (6)].string_value));
        circuit->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        circuit->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
        add_circuit_indent((yyvsp[(1) - (6)].string_value), circuit);
    ;}
    break;

  case 14:

/* Line 1455 of yacc.c  */
#line 519 "firrtl.y"
    {
        firrtlsyn::firDB::firModule* module = cur_circuit->addModule(firrtlsyn::firDB::ModuleType::kModule, (yyvsp[(3) - (6)].string_value));
        free((yyvsp[(3) - (6)].string_value));
        module->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        module->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
        add_module_indent((yyvsp[(1) - (6)].string_value), module);
    ;}
    break;

  case 15:

/* Line 1455 of yacc.c  */
#line 527 "firrtl.y"
    {
        firrtlsyn::firDB::firModule* module = cur_circuit->addModule(firrtlsyn::firDB::ModuleType::kExtModule, (yyvsp[(3) - (6)].string_value));
        free((yyvsp[(3) - (6)].string_value));
        module->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        module->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
        add_module_indent((yyvsp[(1) - (6)].string_value), module);
    ;}
    break;

  case 36:

/* Line 1455 of yacc.c  */
#line 564 "firrtl.y"
    {
        fs_assert(cur_module->defname() == NULL);
        cur_module->set_defname((yyvsp[(4) - (6)].string_value));
        free((yyvsp[(4) - (6)].string_value));
        firrtlsyn::firDB::firDefName* defname = cur_module->defname();
        defname->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        defname->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).first_column, (yylsp[(2) - (6)]).last_line, (yylsp[(5) - (6)]).last_column, 0);
        add_extmodule_item_indent((yyvsp[(1) - (6)].string_value));
    ;}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 577 "firrtl.y"
    {
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].string_value));
        free((yyvsp[(3) - (7)].string_value));
        free((yyvsp[(5) - (7)].string_value));
        parameter->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        parameter->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
        add_extmodule_item_indent((yyvsp[(1) - (7)].string_value));
    ;}
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 586 "firrtl.y"
    {
        std::string value = "\"" + std::string((yyvsp[(6) - (9)].string_value)) + "\"";
        free((yyvsp[(6) - (9)].string_value));
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter((yyvsp[(3) - (9)].string_value), value);
        free((yyvsp[(3) - (9)].string_value));
        parameter->set_info((yyvsp[(8) - (9)].string_value));
        free((yyvsp[(8) - (9)].string_value));
        parameter->set_doc_data((yylsp[(2) - (9)]).first_line, (yylsp[(8) - (9)]).last_line, (yylsp[(2) - (9)]).first_column, (yylsp[(8) - (9)]).last_column, 0);
        add_extmodule_item_indent((yyvsp[(1) - (9)].string_value));
    ;}
    break;

  case 39:

/* Line 1455 of yacc.c  */
#line 596 "firrtl.y"
    {
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].string_value));
        free((yyvsp[(3) - (7)].string_value));
        free((yyvsp[(5) - (7)].string_value));
        parameter->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        parameter->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
        add_extmodule_item_indent((yyvsp[(1) - (7)].string_value));
    ;}
    break;

  case 40:

/* Line 1455 of yacc.c  */
#line 605 "firrtl.y"
    {
        std::string value = "'" + std::string((yyvsp[(6) - (9)].string_value)) + "'";
        free((yyvsp[(6) - (9)].string_value));
        firrtlsyn::firDB::firParameter* parameter = cur_module->addParameter((yyvsp[(3) - (9)].string_value), value);
        free((yyvsp[(3) - (9)].string_value));
        parameter->set_info((yyvsp[(8) - (9)].string_value));
        free((yyvsp[(8) - (9)].string_value));
        parameter->set_doc_data((yylsp[(2) - (9)]).first_line, (yylsp[(8) - (9)]).last_line, (yylsp[(2) - (9)]).first_column, (yylsp[(8) - (9)]).last_column, 0);
        add_extmodule_item_indent((yyvsp[(1) - (9)].string_value));
    ;}
    break;

  case 41:

/* Line 1455 of yacc.c  */
#line 619 "firrtl.y"
    {
        fs_assert(cur_cond == NULL);
        firrtlsyn::firDB::firItemPort* port = cur_module->addItemPort((yyvsp[(3) - (7)].string_value), (yyvsp[(2) - (7)].port_dir_value), (yyvsp[(5) - (7)].type_value));
        free((yyvsp[(3) - (7)].string_value));
        add_item_indent((yyvsp[(1) - (7)].string_value), port);
        port->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        port->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
        //if (strlen($6) > 0) free($6);
    ;}
    break;

  case 42:

/* Line 1455 of yacc.c  */
#line 632 "firrtl.y"
    { (yyval.port_dir_value) = firrtlsyn::firDB::PortDir::kPortDirInput; ;}
    break;

  case 43:

/* Line 1455 of yacc.c  */
#line 633 "firrtl.y"
    { (yyval.port_dir_value) = firrtlsyn::firDB::PortDir::kPortDirOutput; ;}
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 637 "firrtl.y"
    {
        firrtlsyn::firDB::firItemWire* wire = cur_module->addItemWire((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].type_value));
        free((yyvsp[(3) - (7)].string_value));
        add_item_indent((yyvsp[(1) - (7)].string_value), wire);
        if (cur_cond) {
            cur_cond->addStatement(wire);
        } else {
            cur_module->addStatement(wire);
        }
        wire->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        wire->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
    ;}
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 653 "firrtl.y"
    {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister((yyvsp[(3) - (8)].string_value), (yyvsp[(5) - (8)].type_value), (yyvsp[(6) - (8)].exp_value));
        free((yyvsp[(3) - (8)].string_value));
        add_item_indent((yyvsp[(1) - (8)].string_value), item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info((yyvsp[(7) - (8)].string_value));
        free((yyvsp[(7) - (8)].string_value));
        item_reg->set_doc_data((yylsp[(2) - (8)]).first_line, (yylsp[(7) - (8)]).last_line, (yylsp[(2) - (8)]).first_column, (yylsp[(7) - (8)]).last_column, 0);
        cur_reg = NULL;
    ;}
    break;

  case 46:

/* Line 1455 of yacc.c  */
#line 667 "firrtl.y"
    {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister((yyvsp[(3) - (9)].string_value), (yyvsp[(5) - (9)].type_value), (yyvsp[(7) - (9)].exp_value));
        free((yyvsp[(3) - (9)].string_value));
        add_item_indent((yyvsp[(1) - (9)].string_value), item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info((yyvsp[(8) - (9)].string_value));
        free((yyvsp[(8) - (9)].string_value));
        item_reg->set_doc_data((yylsp[(2) - (9)]).first_line, (yylsp[(8) - (9)]).last_line, (yylsp[(2) - (9)]).first_column, (yylsp[(8) - (9)]).last_column, 0);
        cur_reg = NULL;
    ;}
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 681 "firrtl.y"
    {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister((yyvsp[(3) - (9)].string_value), (yyvsp[(5) - (9)].type_value), (yyvsp[(6) - (9)].exp_value));
        free((yyvsp[(3) - (9)].string_value));
        add_item_indent((yyvsp[(1) - (9)].string_value), item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_doc_data((yylsp[(2) - (9)]).first_line, (yylsp[(8) - (9)]).last_line, (yylsp[(2) - (9)]).first_column, (yylsp[(8) - (9)]).last_column, 0);
        cur_reg = item_reg;
    ;}
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 693 "firrtl.y"
    {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister((yyvsp[(3) - (10)].string_value), (yyvsp[(5) - (10)].type_value), (yyvsp[(7) - (10)].exp_value));
        free((yyvsp[(3) - (10)].string_value));
        add_item_indent((yyvsp[(1) - (10)].string_value), item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_doc_data((yylsp[(2) - (10)]).first_line, (yylsp[(9) - (10)]).last_line, (yylsp[(2) - (10)]).first_column, (yylsp[(9) - (10)]).last_column, 0);
        cur_reg = item_reg;
    ;}
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 705 "firrtl.y"
    {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister((yyvsp[(3) - (19)].string_value), (yyvsp[(5) - (19)].type_value), (yyvsp[(6) - (19)].exp_value), (yyvsp[(13) - (19)].exp_value), (yyvsp[(15) - (19)].exp_value));
        free((yyvsp[(3) - (19)].string_value));
        add_item_indent((yyvsp[(1) - (19)].string_value), item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info((yyvsp[(18) - (19)].string_value));
        free((yyvsp[(18) - (19)].string_value));
        item_reg->set_doc_data((yylsp[(2) - (19)]).first_line, (yylsp[(18) - (19)]).last_line, (yylsp[(2) - (19)]).first_column, (yylsp[(18) - (19)]).last_column, 0);
        cur_reg = NULL;
    ;}
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 719 "firrtl.y"
    {
        firrtlsyn::firDB::firItemRegister* item_reg = cur_module->addItemRegister((yyvsp[(3) - (20)].string_value), (yyvsp[(5) - (20)].type_value), (yyvsp[(7) - (20)].exp_value), (yyvsp[(14) - (20)].exp_value), (yyvsp[(16) - (20)].exp_value));
        free((yyvsp[(3) - (20)].string_value));
        add_item_indent((yyvsp[(1) - (20)].string_value), item_reg);
        if (cur_cond) {
            cur_cond->addStatement(item_reg);
        } else {
            cur_module->addStatement(item_reg);
        }
        item_reg->set_info((yyvsp[(19) - (20)].string_value));
        free((yyvsp[(19) - (20)].string_value));
        item_reg->set_doc_data((yylsp[(2) - (20)]).first_line, (yylsp[(19) - (20)]).last_line, (yylsp[(2) - (20)]).first_column, (yylsp[(19) - (20)]).last_column, 0);
        cur_reg = NULL;
    ;}
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 736 "firrtl.y"
    {
        cur_reg->set_reset_block((yyvsp[(5) - (10)].exp_value), (yyvsp[(7) - (10)].exp_value));
        cur_reg->set_info((yyvsp[(9) - (10)].string_value));
        free((yyvsp[(9) - (10)].string_value));
        cur_reg->set_line_end((yylsp[(9) - (10)]).last_line);
        cur_reg->set_col_end((yylsp[(9) - (10)]).last_column);
        add_regreset_block_indent((yyvsp[(1) - (10)].string_value));
    ;}
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 747 "firrtl.y"
    {
        firrtlsyn::firDB::firItemMemory* mem = cur_module->addItemMemory((yyvsp[(3) - (6)].string_value));
        free((yyvsp[(3) - (6)].string_value));
        add_item_indent((yyvsp[(1) - (6)].string_value), mem);
        if (cur_cond) {
            cur_cond->addStatement(mem);
        } else {
            cur_module->addStatement(mem);
        }
        mem->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        mem->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
        cur_mem = mem;
    ;}
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 764 "firrtl.y"
    {
        cur_mem->set_type_data((yyvsp[(4) - (5)].type_value));
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 770 "firrtl.y"
    {
        unsigned int depth = atoi((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        cur_mem->set_depth(depth);
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 55:

/* Line 1455 of yacc.c  */
#line 778 "firrtl.y"
    {
        unsigned int read_latency = atoi((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        cur_mem->set_read_latency(read_latency);
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 786 "firrtl.y"
    {
        unsigned int write_latency = atoi((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        cur_mem->set_write_latency(write_latency);
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 794 "firrtl.y"
    {
        cur_mem->set_read_under_write((yyvsp[(4) - (5)].ruw_value));
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 58:

/* Line 1455 of yacc.c  */
#line 800 "firrtl.y"
    {
        cur_mem->addReadPorts((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 807 "firrtl.y"
    {
        cur_mem->addWritePorts((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 60:

/* Line 1455 of yacc.c  */
#line 814 "firrtl.y"
    {
        cur_mem->addReadWritePorts((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        cur_mem->set_line_end((yylsp[(4) - (5)]).last_line);
        cur_mem->set_col_end((yylsp[(4) - (5)]).last_column);
        add_mem_field_indent((yyvsp[(1) - (5)].string_value));
    ;}
    break;

  case 61:

/* Line 1455 of yacc.c  */
#line 824 "firrtl.y"
    {
        firrtlsyn::firDB::firItemCMemory* cmem = cur_module->addItemCMemory((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].type_value));
        free((yyvsp[(3) - (7)].string_value));
        add_item_indent((yyvsp[(1) - (7)].string_value), cmem);
        if (cur_cond) {
            cur_cond->addStatement(cmem);
        } else {
            cur_module->addStatement(cmem);
        }
        cmem->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        cmem->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
    ;}
    break;

  case 62:

/* Line 1455 of yacc.c  */
#line 840 "firrtl.y"
    {
        firrtlsyn::firDB::firItemSMemory* smem = cur_module->addItemSMemory((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].type_value));
        free((yyvsp[(3) - (7)].string_value));
        add_item_indent((yyvsp[(1) - (7)].string_value), smem);
        if (cur_cond) {
            cur_cond->addStatement(smem);
        } else {
            cur_module->addStatement(smem);
        }
        smem->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        smem->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
    ;}
    break;

  case 63:

/* Line 1455 of yacc.c  */
#line 853 "firrtl.y"
    {
        firrtlsyn::firDB::firItemSMemory* smem = cur_module->addItemSMemory((yyvsp[(3) - (8)].string_value), (yyvsp[(5) - (8)].type_value), (yyvsp[(6) - (8)].ruw_value));
        free((yyvsp[(3) - (8)].string_value));
        add_item_indent((yyvsp[(1) - (8)].string_value), smem);
        if (cur_cond) {
            cur_cond->addStatement(smem);
        } else {
            cur_module->addStatement(smem);
        }
        smem->set_info((yyvsp[(7) - (8)].string_value));
        free((yyvsp[(7) - (8)].string_value));
        smem->set_doc_data((yylsp[(2) - (8)]).first_line, (yylsp[(7) - (8)]).last_line, (yylsp[(2) - (8)]).first_column, (yylsp[(7) - (8)]).last_column, 0);
    ;}
    break;

  case 64:

/* Line 1455 of yacc.c  */
#line 869 "firrtl.y"
    { (yyval.ruw_value) = firrtlsyn::firDB::RUW::kRuwOld; ;}
    break;

  case 65:

/* Line 1455 of yacc.c  */
#line 870 "firrtl.y"
    { (yyval.ruw_value) = firrtlsyn::firDB::RUW::kRuwNew; ;}
    break;

  case 66:

/* Line 1455 of yacc.c  */
#line 871 "firrtl.y"
    { (yyval.ruw_value) = firrtlsyn::firDB::RUW::kRuwUndef; ;}
    break;

  case 67:

/* Line 1455 of yacc.c  */
#line 875 "firrtl.y"
    {
        firrtlsyn::firDB::firItemMPort* mport = cur_module->addItemMPort((yyvsp[(2) - (13)].mport_dir_value), (yyvsp[(4) - (13)].string_value), (yyvsp[(6) - (13)].string_value), (yyvsp[(8) - (13)].exp_value), (yyvsp[(11) - (13)].exp_value));
        free((yyvsp[(4) - (13)].string_value));
        free((yyvsp[(6) - (13)].string_value));
        add_item_indent((yyvsp[(1) - (13)].string_value), mport);
        if (cur_cond) {
            cur_cond->addStatement(mport);
        } else {
            cur_module->addStatement(mport);
        }
        mport->set_info((yyvsp[(12) - (13)].string_value));
        free((yyvsp[(12) - (13)].string_value));
        mport->set_doc_data((yylsp[(2) - (13)]).first_line, (yylsp[(12) - (13)]).last_line, (yylsp[(2) - (13)]).first_column, (yylsp[(12) - (13)]).last_column, 0);
    ;}
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 892 "firrtl.y"
    { (yyval.mport_dir_value) = firrtlsyn::firDB::MPortDir::kMPortDirInfer; ;}
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 893 "firrtl.y"
    { (yyval.mport_dir_value) = firrtlsyn::firDB::MPortDir::kMPortDirRead; ;}
    break;

  case 70:

/* Line 1455 of yacc.c  */
#line 894 "firrtl.y"
    { (yyval.mport_dir_value) = firrtlsyn::firDB::MPortDir::kMPortDirWrite; ;}
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 895 "firrtl.y"
    { (yyval.mport_dir_value) = firrtlsyn::firDB::MPortDir::kMPortDirRdwr; ;}
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 899 "firrtl.y"
    {
        firrtlsyn::firDB::firItemInstance* inst = cur_module->addItemInstance((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].string_value));
        free((yyvsp[(3) - (7)].string_value));
        free((yyvsp[(5) - (7)].string_value));
        add_item_indent((yyvsp[(1) - (7)].string_value), inst);
        if (cur_cond) {
            cur_cond->addStatement(inst);
        } else {
            cur_module->addStatement(inst);
        }
        inst->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        inst->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
    ;}
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 916 "firrtl.y"
    {
        firrtlsyn::firDB::firItemNode* node = cur_module->addItemNode((yyvsp[(3) - (7)].string_value), (yyvsp[(5) - (7)].exp_value));
        free((yyvsp[(3) - (7)].string_value));
        add_item_indent((yyvsp[(1) - (7)].string_value), node);
        if (cur_cond) {
            cur_cond->addStatement(node);
        } else {
            cur_module->addStatement(node);
        }
        node->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        node->set_doc_data((yylsp[(2) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(2) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
    ;}
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 932 "firrtl.y"
    {
        firrtlsyn::firDB::firItemConnect* connect = cur_module->addItemConnect((yyvsp[(2) - (6)].exp_value), (yyvsp[(4) - (6)].exp_value));
        add_item_indent((yyvsp[(1) - (6)].string_value), connect);
        if (cur_cond) {
            cur_cond->addStatement(connect);
        } else {
            cur_module->addStatement(connect);
        }
        connect->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        connect->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
    ;}
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 947 "firrtl.y"
    {
        firrtlsyn::firDB::firItemPartialConnect* partial_connect = cur_module->addItemPartialConnect((yyvsp[(2) - (6)].exp_value), (yyvsp[(4) - (6)].exp_value));
        add_item_indent((yyvsp[(1) - (6)].string_value), partial_connect);
        if (cur_cond) {
            cur_cond->addStatement(partial_connect);
        } else {
            cur_module->addStatement(partial_connect);
        }
        partial_connect->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        partial_connect->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
    ;}
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 962 "firrtl.y"
    {
        firrtlsyn::firDB::firItemInvalidate* invalid = cur_module->addItemInvalidate((yyvsp[(2) - (5)].exp_value));
        add_item_indent((yyvsp[(1) - (5)].string_value), invalid);
        if (cur_cond) {
            cur_cond->addStatement(invalid);
        } else {
            cur_module->addStatement(invalid);
        }
        invalid->set_info((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        invalid->set_doc_data((yylsp[(2) - (5)]).first_line, (yylsp[(4) - (5)]).last_line, (yylsp[(2) - (5)]).first_column, (yylsp[(4) - (5)]).last_column, 0);
    ;}
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 977 "firrtl.y"
    {
        firrtlsyn::firDB::firItemConditional* item_when = cur_module->addItemConditional();
        add_item_indent((yyvsp[(1) - (6)].string_value), item_when);
        if (cur_cond) {
            cur_cond->addStatement(item_when);
        } else {
            cur_module->addStatement(item_when);
        }
        item_when->set_when_exp((yyvsp[(3) - (6)].exp_value));
        item_when->set_info((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        item_when->set_doc_data((yylsp[(2) - (6)]).first_line, (yylsp[(5) - (6)]).last_line, (yylsp[(2) - (6)]).first_column, (yylsp[(5) - (6)]).last_column, 0);
        cur_cond = item_when;
    ;}
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 994 "firrtl.y"
    {
        firrtlsyn::firDB::firItemConditional* item_else = cur_module->addItemConditional();
        item_else->set_info((yyvsp[(4) - (5)].string_value));
        free((yyvsp[(4) - (5)].string_value));
        item_else->set_doc_data((yylsp[(2) - (5)]).first_line, (yylsp[(4) - (5)]).last_line, (yylsp[(2) - (5)]).first_column, (yylsp[(4) - (5)]).last_column, 0);
        firrtlsyn::firDB::firItemConditional* item_when = add_else_indent((yyvsp[(1) - (5)].string_value), item_else);
        item_when->set_else_cond(item_else);
        item_when->set_line_end((yylsp[(4) - (5)]).last_line);
        item_when->set_col_end((yylsp[(4) - (5)]).last_column);
        cur_cond = item_else;
    ;}
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 1009 "firrtl.y"
    {
        unsigned int exit_code = atoi((yyvsp[(8) - (11)].string_value));
        free((yyvsp[(8) - (11)].string_value));
        firrtlsyn::firDB::firItemStop* stop = cur_module->addItemStop((yyvsp[(4) - (11)].exp_value), (yyvsp[(6) - (11)].exp_value), exit_code);
        add_item_indent((yyvsp[(1) - (11)].string_value), stop);
        if (cur_cond) {
            cur_cond->addStatement(stop);
        } else {
            cur_module->addStatement(stop);
        }
        stop->set_info((yyvsp[(10) - (11)].string_value));
        free((yyvsp[(10) - (11)].string_value));
        stop->set_doc_data((yylsp[(2) - (11)]).first_line, (yylsp[(10) - (11)]).last_line, (yylsp[(2) - (11)]).first_column, (yylsp[(10) - (11)]).last_column, 0);
    ;}
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 1023 "firrtl.y"
    {
        unsigned int exit_code = atoi((yyvsp[(8) - (13)].string_value));
        free((yyvsp[(8) - (13)].string_value));
        firrtlsyn::firDB::firItemStop* stop = cur_module->addItemStop((yyvsp[(4) - (13)].exp_value), (yyvsp[(6) - (13)].exp_value), exit_code);
        add_item_indent((yyvsp[(1) - (13)].string_value), stop);
        if (cur_cond) {
            cur_cond->addStatement(stop);
        } else {
            cur_module->addStatement(stop);
        }
        stop->set_id((yyvsp[(11) - (13)].string_value));
        free((yyvsp[(11) - (13)].string_value));
        stop->set_info((yyvsp[(12) - (13)].string_value));
        free((yyvsp[(12) - (13)].string_value));
        stop->set_doc_data((yylsp[(2) - (13)]).first_line, (yylsp[(12) - (13)]).last_line, (yylsp[(2) - (13)]).first_column, (yylsp[(12) - (13)]).last_column, 0);
    ;}
    break;

  case 81:

/* Line 1455 of yacc.c  */
#line 1042 "firrtl.y"
    {
        std::string p_string = "\"" + std::string((yyvsp[(9) - (13)].string_value)) + "\"";
        free((yyvsp[(9) - (13)].string_value));
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf((yyvsp[(4) - (13)].exp_value), (yyvsp[(6) - (13)].exp_value), p_string);
        add_item_indent((yyvsp[(1) - (13)].string_value), printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        printf->set_info((yyvsp[(12) - (13)].string_value));
        free((yyvsp[(12) - (13)].string_value));
        printf->set_doc_data((yylsp[(2) - (13)]).first_line, (yylsp[(12) - (13)]).last_line, (yylsp[(2) - (13)]).first_column, (yylsp[(12) - (13)]).last_column, 0);
    ;}
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 1056 "firrtl.y"
    {
        std::string p_string = "\"" + std::string((yyvsp[(9) - (15)].string_value)) + "\"";
        free((yyvsp[(9) - (15)].string_value));
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf((yyvsp[(4) - (15)].exp_value), (yyvsp[(6) - (15)].exp_value), p_string);
        add_item_indent((yyvsp[(1) - (15)].string_value), printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        printf->set_id((yyvsp[(13) - (15)].string_value));
        free((yyvsp[(13) - (15)].string_value));
        printf->set_info((yyvsp[(14) - (15)].string_value));
        free((yyvsp[(14) - (15)].string_value));
        printf->set_doc_data((yylsp[(2) - (15)]).first_line, (yylsp[(14) - (15)]).last_line, (yylsp[(2) - (15)]).first_column, (yylsp[(14) - (15)]).last_column, 0);
    ;}
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 1072 "firrtl.y"
    {
        std::string p_string = "\"" + std::string((yyvsp[(9) - (15)].string_value)) + "\"";
        free((yyvsp[(9) - (15)].string_value));
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf((yyvsp[(4) - (15)].exp_value), (yyvsp[(6) - (15)].exp_value), p_string);
        add_item_indent((yyvsp[(1) - (15)].string_value), printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        for (size_t i = 0; i < (yyvsp[(12) - (15)].multi_exp_value)->size(); i++) {
            printf->addPrint((yyvsp[(12) - (15)].multi_exp_value)->at(i));
        }
        delete (yyvsp[(12) - (15)].multi_exp_value);
        printf->set_info((yyvsp[(14) - (15)].string_value));
        free((yyvsp[(14) - (15)].string_value));
        printf->set_doc_data((yylsp[(2) - (15)]).first_line, (yylsp[(14) - (15)]).last_line, (yylsp[(2) - (15)]).first_column, (yylsp[(14) - (15)]).last_column, 0);
    ;}
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 1090 "firrtl.y"
    {
        std::string p_string = "\"" + std::string((yyvsp[(9) - (17)].string_value)) + "\"";
        free((yyvsp[(9) - (17)].string_value));
        firrtlsyn::firDB::firItemPrintf* printf = cur_module->addItemPrintf((yyvsp[(4) - (17)].exp_value), (yyvsp[(6) - (17)].exp_value), p_string);
        add_item_indent((yyvsp[(1) - (17)].string_value), printf);
        if (cur_cond) {
            cur_cond->addStatement(printf);
        } else {
            cur_module->addStatement(printf);
        }
        for (size_t i = 0; i < (yyvsp[(12) - (17)].multi_exp_value)->size(); i++) {
            printf->addPrint((yyvsp[(12) - (17)].multi_exp_value)->at(i));
        }
        delete (yyvsp[(12) - (17)].multi_exp_value);
        printf->set_id((yyvsp[(15) - (17)].string_value));
        free((yyvsp[(15) - (17)].string_value));
        printf->set_info((yyvsp[(16) - (17)].string_value));
        free((yyvsp[(16) - (17)].string_value));
        printf->set_doc_data((yylsp[(2) - (17)]).first_line, (yylsp[(16) - (17)]).last_line, (yylsp[(2) - (17)]).first_column, (yylsp[(16) - (17)]).last_column, 0);
    ;}
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 1113 "firrtl.y"
    {
        firrtlsyn::firDB::firItemEmpty* empty = cur_module->addItemEmpty();
        add_item_indent((yyvsp[(1) - (4)].string_value), empty);
        if (cur_cond) {
            cur_cond->addStatement(empty);
        } else {
            cur_module->addStatement(empty);
        }
        empty->set_info((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        empty->set_doc_data((yylsp[(2) - (4)]).first_line, (yylsp[(3) - (4)]).last_line, (yylsp[(2) - (4)]).first_column, (yylsp[(3) - (4)]).last_column, 0);
    ;}
    break;

  case 86:

/* Line 1455 of yacc.c  */
#line 1128 "firrtl.y"
    {
        firrtlsyn::firDB::firItemAttach* attach = cur_module->addItemAttach();
        add_item_indent((yyvsp[(1) - (7)].string_value), attach);
        if (cur_cond) {
            cur_cond->addStatement(attach);
        } else {
            cur_module->addStatement(attach);
        }
        for (size_t i = 0; i < (yyvsp[(4) - (7)].multi_exp_value)->size(); i++) {
            attach->addNet((yyvsp[(4) - (7)].multi_exp_value)->at(i));
        }
        delete (yyvsp[(4) - (7)].multi_exp_value);
        attach->set_info((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        attach->set_doc_data((yylsp[(1) - (7)]).first_line, (yylsp[(6) - (7)]).last_line, (yylsp[(1) - (7)]).first_column, (yylsp[(6) - (7)]).last_column, 0);
    ;}
    break;

  case 87:

/* Line 1455 of yacc.c  */
#line 1147 "firrtl.y"
    {
        (yyval.multi_exp_value) = new std::vector<firrtlsyn::firDB::firExp*>(1, (yyvsp[(1) - (1)].exp_value));
    ;}
    break;

  case 88:

/* Line 1455 of yacc.c  */
#line 1150 "firrtl.y"
    {
        (yyvsp[(1) - (3)].multi_exp_value)->push_back((yyvsp[(3) - (3)].exp_value));
        (yyval.multi_exp_value) = (yyvsp[(1) - (3)].multi_exp_value);
    ;}
    break;

  case 89:

/* Line 1455 of yacc.c  */
#line 1158 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 90:

/* Line 1455 of yacc.c  */
#line 1159 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 91:

/* Line 1455 of yacc.c  */
#line 1160 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 92:

/* Line 1455 of yacc.c  */
#line 1161 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 93:

/* Line 1455 of yacc.c  */
#line 1162 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 94:

/* Line 1455 of yacc.c  */
#line 1163 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 95:

/* Line 1455 of yacc.c  */
#line 1164 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 96:

/* Line 1455 of yacc.c  */
#line 1165 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 97:

/* Line 1455 of yacc.c  */
#line 1166 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 98:

/* Line 1455 of yacc.c  */
#line 1167 "firrtl.y"
    { (yyval.type_value) = (yyvsp[(1) - (1)].type_value); ;}
    break;

  case 99:

/* Line 1455 of yacc.c  */
#line 1171 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeUInt* type_uint = cur_module->addTypeUInt(-1);
        type_uint->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_uint;
    ;}
    break;

  case 100:

/* Line 1455 of yacc.c  */
#line 1176 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        firrtlsyn::firDB::firTypeUInt* type_uint = cur_module->addTypeUInt(width);
        type_uint->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.type_value) = type_uint;
    ;}
    break;

  case 101:

/* Line 1455 of yacc.c  */
#line 1186 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeSInt* type_sint = cur_module->addTypeSInt(-1);
        type_sint->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_sint;
    ;}
    break;

  case 102:

/* Line 1455 of yacc.c  */
#line 1191 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        firrtlsyn::firDB::firTypeSInt* type_sint = cur_module->addTypeSInt(width);
        type_sint->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.type_value) = type_sint;
    ;}
    break;

  case 103:

/* Line 1455 of yacc.c  */
#line 1201 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        type_fixed->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_fixed;
    ;}
    break;

  case 104:

/* Line 1455 of yacc.c  */
#line 1206 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        int width = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        type_fixed->set_width(width);
        type_fixed->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.type_value) = type_fixed;
    ;}
    break;

  case 105:

/* Line 1455 of yacc.c  */
#line 1214 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        int binary_point = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        type_fixed->set_binary_point(binary_point);
        type_fixed->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.type_value) = type_fixed;
    ;}
    break;

  case 106:

/* Line 1455 of yacc.c  */
#line 1222 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeFixed* type_fixed = cur_module->addTypeFixed();
        int width = atoi((yyvsp[(3) - (7)].string_value));
        free((yyvsp[(3) - (7)].string_value));
        type_fixed->set_width(width);
        int binary_point = atoi((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        type_fixed->set_binary_point(binary_point);
        type_fixed->set_doc_data((yylsp[(1) - (7)]).first_line, (yylsp[(7) - (7)]).last_line, (yylsp[(1) - (7)]).first_column, (yylsp[(7) - (7)]).last_column, 0);
        (yyval.type_value) = type_fixed;
    ;}
    break;

  case 107:

/* Line 1455 of yacc.c  */
#line 1236 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeInterval* type_interval = cur_module->addTypeInterval();
        type_interval->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_interval;
    ;}
    break;

  case 108:

/* Line 1455 of yacc.c  */
#line 1241 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeInterval* type_interval = cur_module->addTypeInterval();
        if (strcmp((yyvsp[(3) - (6)].string_value), "?") == 0 && strcmp((yyvsp[(5) - (6)].string_value), "?") == 0 ) {
            type_interval->set_value((yyvsp[(2) - (6)].char_value), '?', '?', (yyvsp[(6) - (6)].char_value));
        } else if (strcmp((yyvsp[(3) - (6)].string_value), "?") == 0) {
            free((yyvsp[(3) - (6)].string_value));
            double upper_value = atof((yyvsp[(5) - (6)].string_value));
            free((yyvsp[(5) - (6)].string_value));
            type_interval->set_value((yyvsp[(2) - (6)].char_value), '?', upper_value, (yyvsp[(6) - (6)].char_value));
        } else if (strcmp((yyvsp[(5) - (6)].string_value), "?") == 0) {
            free((yyvsp[(5) - (6)].string_value));
            double lower_value = atof((yyvsp[(3) - (6)].string_value));
            free((yyvsp[(3) - (6)].string_value));
            type_interval->set_value((yyvsp[(2) - (6)].char_value), lower_value, '?', (yyvsp[(6) - (6)].char_value));
        } else {
            double lower_value = atof((yyvsp[(3) - (6)].string_value));
            free((yyvsp[(3) - (6)].string_value));
            double upper_value = atof((yyvsp[(5) - (6)].string_value));
            free((yyvsp[(5) - (6)].string_value));
            type_interval->set_value((yyvsp[(2) - (6)].char_value), lower_value, upper_value, (yyvsp[(6) - (6)].char_value));
        }
        type_interval->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.type_value) = type_interval;
    ;}
    break;

  case 109:

/* Line 1455 of yacc.c  */
#line 1265 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeInterval* type_interval = cur_module->addTypeInterval();
        int binary_value = atoi((yyvsp[(8) - (8)].string_value));
        free((yyvsp[(8) - (8)].string_value));
        if (strcmp((yyvsp[(3) - (8)].string_value), "?") == 0 && strcmp((yyvsp[(5) - (8)].string_value), "?") == 0 ) {
            type_interval->set_value((yyvsp[(2) - (8)].char_value), '?', '?', (yyvsp[(6) - (8)].char_value), binary_value);
        } else if (strcmp((yyvsp[(3) - (8)].string_value), "?") == 0) {
            free((yyvsp[(3) - (8)].string_value));
            double upper_value = atof((yyvsp[(5) - (8)].string_value));
            free((yyvsp[(5) - (8)].string_value));
            type_interval->set_value((yyvsp[(2) - (8)].char_value), '?', upper_value, (yyvsp[(6) - (8)].char_value), binary_value);
        } else if (strcmp((yyvsp[(5) - (8)].string_value), "?") == 0) {
            free((yyvsp[(5) - (8)].string_value));
            double lower_value = atof((yyvsp[(3) - (8)].string_value));
            free((yyvsp[(3) - (8)].string_value));
            type_interval->set_value((yyvsp[(2) - (8)].char_value), lower_value, '?', (yyvsp[(6) - (8)].char_value), binary_value);
        } else {
            double lower_value = atof((yyvsp[(3) - (8)].string_value));
            free((yyvsp[(3) - (8)].string_value));
            double upper_value = atof((yyvsp[(5) - (8)].string_value));
            free((yyvsp[(5) - (8)].string_value));
            type_interval->set_value((yyvsp[(2) - (8)].char_value), lower_value, upper_value, (yyvsp[(6) - (8)].char_value), binary_value);
        }
        type_interval->set_doc_data((yylsp[(1) - (8)]).first_line, (yylsp[(8) - (8)]).last_line, (yylsp[(1) - (8)]).first_column, (yylsp[(8) - (8)]).last_column, 0);
        (yyval.type_value) = type_interval;
    ;}
    break;

  case 110:

/* Line 1455 of yacc.c  */
#line 1294 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeClock* type_clock = cur_module->addTypeClock();
        type_clock->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_clock;
    ;}
    break;

  case 111:

/* Line 1455 of yacc.c  */
#line 1302 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeAsyncReset* type_asyncreset = cur_module->addTypeAsyncReset();
        type_asyncreset->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_asyncreset;
    ;}
    break;

  case 112:

/* Line 1455 of yacc.c  */
#line 1310 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeReset* type_reset = cur_module->addTypeReset();
        type_reset->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_reset;
    ;}
    break;

  case 113:

/* Line 1455 of yacc.c  */
#line 1318 "firrtl.y"
    { 
        firrtlsyn::firDB::firTypeAnalog* type_analog = cur_module->addTypeAnalog(-1);
        type_analog->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.type_value) = type_analog;
    ;}
    break;

  case 114:

/* Line 1455 of yacc.c  */
#line 1323 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        firrtlsyn::firDB::firTypeAnalog* type_analog = cur_module->addTypeAnalog(width);
        type_analog->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.type_value) = type_analog;
    ;}
    break;

  case 115:

/* Line 1455 of yacc.c  */
#line 1333 "firrtl.y"
    {
        int depth = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        firrtlsyn::firDB::firTypeVector* type_vector = cur_module->addTypeVector(depth);
        type_vector->set_type_data((yyvsp[(1) - (4)].type_value));
        type_vector->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.type_value) = type_vector;
    ;}
    break;

  case 116:

/* Line 1455 of yacc.c  */
#line 1344 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeBundle* type_bundle = cur_module->addTypeBundle();
        type_bundle->set_doc_data((yylsp[(1) - (2)]).first_line, (yylsp[(2) - (2)]).last_line, (yylsp[(1) - (2)]).first_column, (yylsp[(2) - (2)]).last_column, 0);
        (yyval.type_value) = type_bundle;
    ;}
    break;

  case 117:

/* Line 1455 of yacc.c  */
#line 1349 "firrtl.y"
    {
        firrtlsyn::firDB::firTypeBundle* type_bundle = cur_module->addTypeBundle();
        for (size_t i = 0; i < (yyvsp[(2) - (3)].multi_field_value)->size(); i++) {
            type_bundle->addTypeData((yyvsp[(2) - (3)].multi_field_value)->at(i));
        }
        delete (yyvsp[(2) - (3)].multi_field_value);
        type_bundle->set_doc_data((yylsp[(1) - (3)]).first_line, (yylsp[(3) - (3)]).last_line, (yylsp[(1) - (3)]).first_column, (yylsp[(3) - (3)]).last_column, 0);
        (yyval.type_value) = type_bundle;
    ;}
    break;

  case 118:

/* Line 1455 of yacc.c  */
#line 1361 "firrtl.y"
    {
        (yyval.multi_field_value) = new std::vector<firrtlsyn::firDB::firField*>(1, (yyvsp[(1) - (1)].field_value));
    ;}
    break;

  case 119:

/* Line 1455 of yacc.c  */
#line 1364 "firrtl.y"
    {
        (yyvsp[(1) - (3)].multi_field_value)->push_back((yyvsp[(3) - (3)].field_value));
        (yyval.multi_field_value) = (yyvsp[(1) - (3)].multi_field_value);
    ;}
    break;

  case 120:

/* Line 1455 of yacc.c  */
#line 1371 "firrtl.y"
    {
        (yyval.field_value) = cur_module->addField((yyvsp[(1) - (3)].string_value), (yyvsp[(3) - (3)].type_value), false);
        (yyval.field_value)->set_doc_data((yylsp[(1) - (3)]).first_line, (yylsp[(3) - (3)]).last_line, (yylsp[(1) - (3)]).first_column, (yylsp[(3) - (3)]).last_column, 0);
        free((yyvsp[(1) - (3)].string_value));
    ;}
    break;

  case 121:

/* Line 1455 of yacc.c  */
#line 1376 "firrtl.y"
    {
        (yyval.field_value) = cur_module->addField((yyvsp[(2) - (4)].string_value), (yyvsp[(4) - (4)].type_value), true);
        (yyval.field_value)->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        free((yyvsp[(2) - (4)].string_value));
    ;}
    break;

  case 122:

/* Line 1455 of yacc.c  */
#line 1385 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 123:

/* Line 1455 of yacc.c  */
#line 1386 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 124:

/* Line 1455 of yacc.c  */
#line 1387 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 125:

/* Line 1455 of yacc.c  */
#line 1388 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 126:

/* Line 1455 of yacc.c  */
#line 1389 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 127:

/* Line 1455 of yacc.c  */
#line 1390 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 128:

/* Line 1455 of yacc.c  */
#line 1391 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 129:

/* Line 1455 of yacc.c  */
#line 1392 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 130:

/* Line 1455 of yacc.c  */
#line 1393 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 131:

/* Line 1455 of yacc.c  */
#line 1394 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 132:

/* Line 1455 of yacc.c  */
#line 1395 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 133:

/* Line 1455 of yacc.c  */
#line 1396 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 134:

/* Line 1455 of yacc.c  */
#line 1400 "firrtl.y"
    {
        long long unsigned int value = atoll((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        int width = 0;
        firrtlsyn::firDB::firExpUInt* uint = cur_module->addExpUInt(value, width);
        uint->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = uint;
    ;}
    break;

  case 135:

/* Line 1455 of yacc.c  */
#line 1408 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (7)].string_value));
        free((yyvsp[(3) - (7)].string_value));
        long long unsigned int value = atoll((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        firrtlsyn::firDB::firExpUInt* uint = cur_module->addExpUInt(value, width);
        uint->set_doc_data((yylsp[(1) - (7)]).first_line, (yylsp[(7) - (7)]).last_line, (yylsp[(1) - (7)]).first_column, (yylsp[(7) - (7)]).last_column, 0);
        (yyval.exp_value) = uint;
    ;}
    break;

  case 136:

/* Line 1455 of yacc.c  */
#line 1420 "firrtl.y"
    {
        int width = 0;
        firrtlsyn::firDB::firExpUIntBits* uint_bits = cur_module->addExpUIntBits((yyvsp[(4) - (6)].string_value), width);
        free((yyvsp[(4) - (6)].string_value));
        uint_bits->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = uint_bits;
    ;}
    break;

  case 137:

/* Line 1455 of yacc.c  */
#line 1427 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (9)].string_value));
        free((yyvsp[(3) - (9)].string_value));
        firrtlsyn::firDB::firExpUIntBits* uint_bits = cur_module->addExpUIntBits((yyvsp[(7) - (9)].string_value), width);
        free((yyvsp[(7) - (9)].string_value));
        uint_bits->set_doc_data((yylsp[(1) - (9)]).first_line, (yylsp[(9) - (9)]).last_line, (yylsp[(1) - (9)]).first_column, (yylsp[(9) - (9)]).last_column, 0);
        (yyval.exp_value) = uint_bits;
    ;}
    break;

  case 138:

/* Line 1455 of yacc.c  */
#line 1438 "firrtl.y"
    {
        long long int value = atoll((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        int width = 0;
        firrtlsyn::firDB::firExpSInt* sint = cur_module->addExpSInt(value, width);
        sint->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = sint;
    ;}
    break;

  case 139:

/* Line 1455 of yacc.c  */
#line 1446 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (7)].string_value));
        free((yyvsp[(3) - (7)].string_value));
        long long int value = atoll((yyvsp[(6) - (7)].string_value));
        free((yyvsp[(6) - (7)].string_value));
        firrtlsyn::firDB::firExpSInt* sint = cur_module->addExpSInt(value, width);
        sint->set_doc_data((yylsp[(1) - (7)]).first_line, (yylsp[(7) - (7)]).last_line, (yylsp[(1) - (7)]).first_column, (yylsp[(7) - (7)]).last_column, 0);
        (yyval.exp_value) = sint;
    ;}
    break;

  case 140:

/* Line 1455 of yacc.c  */
#line 1458 "firrtl.y"
    {
        int width = 0;
        firrtlsyn::firDB::firExpSIntBits* sint_bits = cur_module->addExpSIntBits((yyvsp[(4) - (6)].string_value), width);
        free((yyvsp[(4) - (6)].string_value));
        sint_bits->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = sint_bits;
    ;}
    break;

  case 141:

/* Line 1455 of yacc.c  */
#line 1465 "firrtl.y"
    {
        int width = atoi((yyvsp[(3) - (9)].string_value));
        free((yyvsp[(3) - (9)].string_value));
        firrtlsyn::firDB::firExpSIntBits* sint_bits = cur_module->addExpSIntBits((yyvsp[(7) - (9)].string_value), width);
        free((yyvsp[(7) - (9)].string_value));
        sint_bits->set_doc_data((yylsp[(1) - (9)]).first_line, (yylsp[(9) - (9)]).last_line, (yylsp[(1) - (9)]).first_column, (yylsp[(9) - (9)]).last_column, 0);
        (yyval.exp_value) = sint_bits;
    ;}
    break;

  case 142:

/* Line 1455 of yacc.c  */
#line 1476 "firrtl.y"
    {
        firrtlsyn::firDB::firExpRef* ref = cur_module->addExpRef((yyvsp[(1) - (1)].string_value));
        free((yyvsp[(1) - (1)].string_value));
        ref->set_doc_data((yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).first_column, (yylsp[(1) - (1)]).last_column, 0);
        (yyval.exp_value) = ref;
    ;}
    break;

  case 143:

/* Line 1455 of yacc.c  */
#line 1485 "firrtl.y"
    {
        firrtlsyn::firDB::firExpSubfield* subfield = cur_module->addExpSubfield((yyvsp[(1) - (3)].exp_value), (yyvsp[(3) - (3)].string_value));
        free((yyvsp[(3) - (3)].string_value));
        subfield->set_doc_data((yylsp[(1) - (3)]).first_line, (yylsp[(3) - (3)]).last_line, (yylsp[(1) - (3)]).first_column, (yylsp[(3) - (3)]).last_column, 0);
        (yyval.exp_value) = subfield;
    ;}
    break;

  case 144:

/* Line 1455 of yacc.c  */
#line 1494 "firrtl.y"
    {
        //FIXME: TODO
        double value = atof((yyvsp[(3) - (3)].string_value));
        free((yyvsp[(3) - (3)].string_value));
        //firrtlsyn::firDB::firExpDouble* double = cur_module->addExpDouble($1, value);
        //double->set_doc_data(@1.first_line, @3.last_line, @1.first_column, @3.last_column, 0);
        //$$ = double;
        (yyval.exp_value) = NULL;
    ;}
    break;

  case 145:

/* Line 1455 of yacc.c  */
#line 1506 "firrtl.y"
    {
        int index = atoi((yyvsp[(3) - (4)].string_value));
        free((yyvsp[(3) - (4)].string_value));
        firrtlsyn::firDB::firExpSubindex* subindex = cur_module->addExpSubindex((yyvsp[(1) - (4)].exp_value), index);
        subindex->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = subindex;
    ;}
    break;

  case 146:

/* Line 1455 of yacc.c  */
#line 1516 "firrtl.y"
    {
        firrtlsyn::firDB::firExpSubaccess* subaccess = cur_module->addExpSubaccess((yyvsp[(1) - (4)].exp_value), (yyvsp[(3) - (4)].exp_value));
        subaccess->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = subaccess;
    ;}
    break;

  case 147:

/* Line 1455 of yacc.c  */
#line 1524 "firrtl.y"
    {
        firrtlsyn::firDB::firExpMux* mux = cur_module->addExpMux((yyvsp[(3) - (8)].exp_value), (yyvsp[(5) - (8)].exp_value), (yyvsp[(7) - (8)].exp_value));
        mux->set_doc_data((yylsp[(1) - (8)]).first_line, (yylsp[(8) - (8)]).last_line, (yylsp[(1) - (8)]).first_column, (yylsp[(8) - (8)]).last_column, 0);
        (yyval.exp_value) = mux;
    ;}
    break;

  case 148:

/* Line 1455 of yacc.c  */
#line 1532 "firrtl.y"
    {
        firrtlsyn::firDB::firExpValidif* validif = cur_module->addExpValidif((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        validif->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = validif;
    ;}
    break;

  case 149:

/* Line 1455 of yacc.c  */
#line 1540 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 150:

/* Line 1455 of yacc.c  */
#line 1541 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 151:

/* Line 1455 of yacc.c  */
#line 1542 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 152:

/* Line 1455 of yacc.c  */
#line 1543 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 153:

/* Line 1455 of yacc.c  */
#line 1544 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 154:

/* Line 1455 of yacc.c  */
#line 1545 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 155:

/* Line 1455 of yacc.c  */
#line 1546 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 156:

/* Line 1455 of yacc.c  */
#line 1547 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 157:

/* Line 1455 of yacc.c  */
#line 1548 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 158:

/* Line 1455 of yacc.c  */
#line 1549 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 159:

/* Line 1455 of yacc.c  */
#line 1550 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 160:

/* Line 1455 of yacc.c  */
#line 1551 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 161:

/* Line 1455 of yacc.c  */
#line 1552 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 162:

/* Line 1455 of yacc.c  */
#line 1553 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 163:

/* Line 1455 of yacc.c  */
#line 1554 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 164:

/* Line 1455 of yacc.c  */
#line 1555 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 165:

/* Line 1455 of yacc.c  */
#line 1556 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 166:

/* Line 1455 of yacc.c  */
#line 1557 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 167:

/* Line 1455 of yacc.c  */
#line 1558 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 168:

/* Line 1455 of yacc.c  */
#line 1559 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 169:

/* Line 1455 of yacc.c  */
#line 1560 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 170:

/* Line 1455 of yacc.c  */
#line 1561 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 171:

/* Line 1455 of yacc.c  */
#line 1562 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 172:

/* Line 1455 of yacc.c  */
#line 1563 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 173:

/* Line 1455 of yacc.c  */
#line 1564 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 174:

/* Line 1455 of yacc.c  */
#line 1565 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 175:

/* Line 1455 of yacc.c  */
#line 1566 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 176:

/* Line 1455 of yacc.c  */
#line 1567 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 177:

/* Line 1455 of yacc.c  */
#line 1568 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 178:

/* Line 1455 of yacc.c  */
#line 1569 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 179:

/* Line 1455 of yacc.c  */
#line 1570 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 180:

/* Line 1455 of yacc.c  */
#line 1571 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 181:

/* Line 1455 of yacc.c  */
#line 1572 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 182:

/* Line 1455 of yacc.c  */
#line 1573 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 183:

/* Line 1455 of yacc.c  */
#line 1574 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 184:

/* Line 1455 of yacc.c  */
#line 1575 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 185:

/* Line 1455 of yacc.c  */
#line 1576 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 186:

/* Line 1455 of yacc.c  */
#line 1577 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 187:

/* Line 1455 of yacc.c  */
#line 1578 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 188:

/* Line 1455 of yacc.c  */
#line 1579 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 189:

/* Line 1455 of yacc.c  */
#line 1580 "firrtl.y"
    { (yyval.exp_value) = (yyvsp[(1) - (1)].exp_value); ;}
    break;

  case 190:

/* Line 1455 of yacc.c  */
#line 1584 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAdd* add = cur_module->addExpAdd((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        add->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = add;
    ;}
    break;

  case 191:

/* Line 1455 of yacc.c  */
#line 1592 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firSub* sub = cur_module->addExpSub((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        sub->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = sub;
    ;}
    break;

  case 192:

/* Line 1455 of yacc.c  */
#line 1600 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firMul* mul = cur_module->addExpMul((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        mul->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = mul;
    ;}
    break;

  case 193:

/* Line 1455 of yacc.c  */
#line 1608 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firDiv* div = cur_module->addExpDiv((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        div->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = div;
    ;}
    break;

  case 194:

/* Line 1455 of yacc.c  */
#line 1616 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firMod* mod = cur_module->addExpMod((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        mod->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = mod;
    ;}
    break;

  case 195:

/* Line 1455 of yacc.c  */
#line 1624 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firLt* lt = cur_module->addExpLt((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        lt->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = lt;
    ;}
    break;

  case 196:

/* Line 1455 of yacc.c  */
#line 1632 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firLeq* leq = cur_module->addExpLeq((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        leq->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = leq;
    ;}
    break;

  case 197:

/* Line 1455 of yacc.c  */
#line 1640 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firGt* gt = cur_module->addExpGt((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        gt->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = gt;
    ;}
    break;

  case 198:

/* Line 1455 of yacc.c  */
#line 1648 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firGeq* geq = cur_module->addExpGeq((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        geq->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = geq;
    ;}
    break;

  case 199:

/* Line 1455 of yacc.c  */
#line 1656 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firEq* eq = cur_module->addExpEq((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        eq->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = eq;
    ;}
    break;

  case 200:

/* Line 1455 of yacc.c  */
#line 1664 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firNeq* neq = cur_module->addExpNeq((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        neq->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = neq;
    ;}
    break;

  case 201:

/* Line 1455 of yacc.c  */
#line 1672 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firPad* pad = cur_module->addExpPad((yyvsp[(3) - (6)].exp_value), n);
        pad->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = pad;
    ;}
    break;

  case 202:

/* Line 1455 of yacc.c  */
#line 1682 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAsUInt* asuint = cur_module->addExpAsUInt((yyvsp[(3) - (4)].exp_value));
        asuint->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = asuint;
    ;}
    break;

  case 203:

/* Line 1455 of yacc.c  */
#line 1690 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAsSInt* assint = cur_module->addExpAsSInt((yyvsp[(3) - (4)].exp_value));
        assint->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = assint;
    ;}
    break;

  case 204:

/* Line 1455 of yacc.c  */
#line 1698 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAsClock* asclock = cur_module->addExpAsClock((yyvsp[(3) - (4)].exp_value));
        asclock->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = asclock;
    ;}
    break;

  case 205:

/* Line 1455 of yacc.c  */
#line 1706 "firrtl.y"
    {
        int binary_point = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firAsFixed* asfixed = cur_module->addExpAsFixed((yyvsp[(3) - (6)].exp_value), binary_point);
        asfixed->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = asfixed;
    ;}
    break;

  case 206:

/* Line 1455 of yacc.c  */
#line 1716 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAsAsyncReset* asasyncreset = cur_module->addExpAsAsyncReset((yyvsp[(3) - (4)].exp_value));
        asasyncreset->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = asasyncreset;
    ;}
    break;

  case 207:

/* Line 1455 of yacc.c  */
#line 1724 "firrtl.y"
    {
        int left = atoi((yyvsp[(5) - (10)].string_value));
        free((yyvsp[(5) - (10)].string_value));
        int right = atoi((yyvsp[(7) - (10)].string_value));
        free((yyvsp[(7) - (10)].string_value));
        unsigned int bit_width = atoi((yyvsp[(9) - (10)].string_value));
        free((yyvsp[(9) - (10)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firAsInterval* asinterval = cur_module->addExpAsInterval((yyvsp[(3) - (10)].exp_value), left, right, bit_width);
        asinterval->set_doc_data((yylsp[(1) - (10)]).first_line, (yylsp[(10) - (10)]).last_line, (yylsp[(1) - (10)]).first_column, (yylsp[(10) - (10)]).last_column, 0);
        (yyval.exp_value) = asinterval;
    ;}
    break;

  case 208:

/* Line 1455 of yacc.c  */
#line 1738 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firShl* shl = cur_module->addExpShl((yyvsp[(3) - (6)].exp_value), n);
        shl->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = shl;
    ;}
    break;

  case 209:

/* Line 1455 of yacc.c  */
#line 1748 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firShr* shr = cur_module->addExpShr((yyvsp[(3) - (6)].exp_value), n);
        shr->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = shr;
    ;}
    break;

  case 210:

/* Line 1455 of yacc.c  */
#line 1758 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firDshl* dshl = cur_module->addExpDshl((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        dshl->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = dshl;
    ;}
    break;

  case 211:

/* Line 1455 of yacc.c  */
#line 1766 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firDshr* dshr = cur_module->addExpDshr((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        dshr->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = dshr;
    ;}
    break;

  case 212:

/* Line 1455 of yacc.c  */
#line 1774 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firCvt* cvt = cur_module->addExpCvt((yyvsp[(3) - (4)].exp_value));
        cvt->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = cvt;
    ;}
    break;

  case 213:

/* Line 1455 of yacc.c  */
#line 1782 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firNeg* neg = cur_module->addExpNeg((yyvsp[(3) - (4)].exp_value));
        neg->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = neg;
    ;}
    break;

  case 214:

/* Line 1455 of yacc.c  */
#line 1790 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firNot* prim_not = cur_module->addExpNot((yyvsp[(3) - (4)].exp_value));
        prim_not->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = prim_not;
    ;}
    break;

  case 215:

/* Line 1455 of yacc.c  */
#line 1798 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAnd* prim_and = cur_module->addExpAnd((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        prim_and->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = prim_and;
    ;}
    break;

  case 216:

/* Line 1455 of yacc.c  */
#line 1806 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firOr* prim_or = cur_module->addExpOr((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        prim_or->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = prim_or;
    ;}
    break;

  case 217:

/* Line 1455 of yacc.c  */
#line 1814 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firXor* prim_xor = cur_module->addExpXor((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        prim_xor->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = prim_xor;
    ;}
    break;

  case 218:

/* Line 1455 of yacc.c  */
#line 1822 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firAndr* andr = cur_module->addExpAndr((yyvsp[(3) - (4)].exp_value));
        andr->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = andr;
    ;}
    break;

  case 219:

/* Line 1455 of yacc.c  */
#line 1830 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firOrr* orr = cur_module->addExpOrr((yyvsp[(3) - (4)].exp_value));
        orr->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = orr;
    ;}
    break;

  case 220:

/* Line 1455 of yacc.c  */
#line 1838 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firXorr* xorr = cur_module->addExpXorr((yyvsp[(3) - (4)].exp_value));
        xorr->set_doc_data((yylsp[(1) - (4)]).first_line, (yylsp[(4) - (4)]).last_line, (yylsp[(1) - (4)]).first_column, (yylsp[(4) - (4)]).last_column, 0);
        (yyval.exp_value) = xorr;
    ;}
    break;

  case 221:

/* Line 1455 of yacc.c  */
#line 1846 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firCat* cat = cur_module->addExpCat((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        cat->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = cat;
    ;}
    break;

  case 222:

/* Line 1455 of yacc.c  */
#line 1854 "firrtl.y"
    {
        unsigned int hi = atoi((yyvsp[(5) - (8)].string_value));
        free((yyvsp[(5) - (8)].string_value));
        unsigned int lo = atoi((yyvsp[(7) - (8)].string_value));
        free((yyvsp[(7) - (8)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firBits* bits = cur_module->addExpBits((yyvsp[(3) - (8)].exp_value), hi, lo);
        bits->set_doc_data((yylsp[(1) - (8)]).first_line, (yylsp[(8) - (8)]).last_line, (yylsp[(1) - (8)]).first_column, (yylsp[(8) - (8)]).last_column, 0);
        (yyval.exp_value) = bits;
    ;}
    break;

  case 223:

/* Line 1455 of yacc.c  */
#line 1866 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firHead* head = cur_module->addExpHead((yyvsp[(3) - (6)].exp_value), n);
        head->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = head;
    ;}
    break;

  case 224:

/* Line 1455 of yacc.c  */
#line 1876 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firTail* tail = cur_module->addExpTail((yyvsp[(3) - (6)].exp_value), n);
        tail->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = tail;
    ;}
    break;

  case 225:

/* Line 1455 of yacc.c  */
#line 1886 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firIncp* incp = cur_module->addExpIncp((yyvsp[(3) - (6)].exp_value), n);
        incp->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = incp;
    ;}
    break;

  case 226:

/* Line 1455 of yacc.c  */
#line 1896 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firDecp* decp = cur_module->addExpDecp((yyvsp[(3) - (6)].exp_value), n);
        decp->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = decp;
    ;}
    break;

  case 227:

/* Line 1455 of yacc.c  */
#line 1906 "firrtl.y"
    {
        unsigned int n = atoi((yyvsp[(5) - (6)].string_value));
        free((yyvsp[(5) - (6)].string_value));
        firrtlsyn::firDB::firExpPrimOperation::firSetp* setp = cur_module->addExpSetp((yyvsp[(3) - (6)].exp_value), n);
        setp->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = setp;
    ;}
    break;

  case 228:

/* Line 1455 of yacc.c  */
#line 1916 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firWrap* wrap = cur_module->addExpWrap((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        wrap->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = wrap;
    ;}
    break;

  case 229:

/* Line 1455 of yacc.c  */
#line 1924 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firClip* clip = cur_module->addExpClip((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        clip->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = clip;
    ;}
    break;

  case 230:

/* Line 1455 of yacc.c  */
#line 1932 "firrtl.y"
    {
        firrtlsyn::firDB::firExpPrimOperation::firSquz* squz = cur_module->addExpSquz((yyvsp[(3) - (6)].exp_value), (yyvsp[(5) - (6)].exp_value));
        squz->set_doc_data((yylsp[(1) - (6)]).first_line, (yylsp[(6) - (6)]).last_line, (yylsp[(1) - (6)]).first_column, (yylsp[(6) - (6)]).last_column, 0);
        (yyval.exp_value) = squz;
    ;}
    break;

  case 231:

/* Line 1455 of yacc.c  */
#line 1941 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 232:

/* Line 1455 of yacc.c  */
#line 1942 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 233:

/* Line 1455 of yacc.c  */
#line 1946 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 234:

/* Line 1455 of yacc.c  */
#line 1950 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 235:

/* Line 1455 of yacc.c  */
#line 1951 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 236:

/* Line 1455 of yacc.c  */
#line 1952 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 237:

/* Line 1455 of yacc.c  */
#line 1956 "firrtl.y"
    { (yyval.string_value) = strdup("circuit"); ;}
    break;

  case 238:

/* Line 1455 of yacc.c  */
#line 1957 "firrtl.y"
    { (yyval.string_value) = strdup("module"); ;}
    break;

  case 239:

/* Line 1455 of yacc.c  */
#line 1958 "firrtl.y"
    { (yyval.string_value) = strdup("extmodule"); ;}
    break;

  case 240:

/* Line 1455 of yacc.c  */
#line 1959 "firrtl.y"
    { (yyval.string_value) = strdup("defname"); ;}
    break;

  case 241:

/* Line 1455 of yacc.c  */
#line 1960 "firrtl.y"
    { (yyval.string_value) = strdup("parameter"); ;}
    break;

  case 242:

/* Line 1455 of yacc.c  */
#line 1961 "firrtl.y"
    { (yyval.string_value) = strdup("input"); ;}
    break;

  case 243:

/* Line 1455 of yacc.c  */
#line 1962 "firrtl.y"
    { (yyval.string_value) = strdup("output"); ;}
    break;

  case 244:

/* Line 1455 of yacc.c  */
#line 1963 "firrtl.y"
    { (yyval.string_value) = strdup("UInt"); ;}
    break;

  case 245:

/* Line 1455 of yacc.c  */
#line 1964 "firrtl.y"
    { (yyval.string_value) = strdup("SInt"); ;}
    break;

  case 246:

/* Line 1455 of yacc.c  */
#line 1965 "firrtl.y"
    { (yyval.string_value) = strdup("Clock"); ;}
    break;

  case 247:

/* Line 1455 of yacc.c  */
#line 1966 "firrtl.y"
    { (yyval.string_value) = strdup("AsyncReset"); ;}
    break;

  case 248:

/* Line 1455 of yacc.c  */
#line 1967 "firrtl.y"
    { (yyval.string_value) = strdup("Reset"); ;}
    break;

  case 249:

/* Line 1455 of yacc.c  */
#line 1968 "firrtl.y"
    { (yyval.string_value) = strdup("Analog"); ;}
    break;

  case 250:

/* Line 1455 of yacc.c  */
#line 1969 "firrtl.y"
    { (yyval.string_value) = strdup("Fixed"); ;}
    break;

  case 251:

/* Line 1455 of yacc.c  */
#line 1970 "firrtl.y"
    { (yyval.string_value) = strdup("Interval"); ;}
    break;

  case 252:

/* Line 1455 of yacc.c  */
#line 1971 "firrtl.y"
    { (yyval.string_value) = strdup("flip"); ;}
    break;

  case 253:

/* Line 1455 of yacc.c  */
#line 1972 "firrtl.y"
    { (yyval.string_value) = strdup("wire"); ;}
    break;

  case 254:

/* Line 1455 of yacc.c  */
#line 1973 "firrtl.y"
    { (yyval.string_value) = strdup("reg"); ;}
    break;

  case 255:

/* Line 1455 of yacc.c  */
#line 1974 "firrtl.y"
    { (yyval.string_value) = strdup("width"); ;}
    break;

  case 256:

/* Line 1455 of yacc.c  */
#line 1975 "firrtl.y"
    { (yyval.string_value) = strdup("reset"); ;}
    break;

  case 257:

/* Line 1455 of yacc.c  */
#line 1976 "firrtl.y"
    { (yyval.string_value) = strdup("mem"); ;}
    break;

  case 258:

/* Line 1455 of yacc.c  */
#line 1978 "firrtl.y"
    { (yyval.string_value) = strdup("depth"); ;}
    break;

  case 259:

/* Line 1455 of yacc.c  */
#line 1982 "firrtl.y"
    { (yyval.string_value) = strdup("reader"); ;}
    break;

  case 260:

/* Line 1455 of yacc.c  */
#line 1983 "firrtl.y"
    { (yyval.string_value) = strdup("writer"); ;}
    break;

  case 261:

/* Line 1455 of yacc.c  */
#line 1984 "firrtl.y"
    { (yyval.string_value) = strdup("readwriter"); ;}
    break;

  case 262:

/* Line 1455 of yacc.c  */
#line 1985 "firrtl.y"
    { (yyval.string_value) = strdup("inst"); ;}
    break;

  case 263:

/* Line 1455 of yacc.c  */
#line 1986 "firrtl.y"
    { (yyval.string_value) = strdup("of"); ;}
    break;

  case 264:

/* Line 1455 of yacc.c  */
#line 1987 "firrtl.y"
    { (yyval.string_value) = strdup("node"); ;}
    break;

  case 265:

/* Line 1455 of yacc.c  */
#line 1988 "firrtl.y"
    { (yyval.string_value) = strdup("is"); ;}
    break;

  case 266:

/* Line 1455 of yacc.c  */
#line 1989 "firrtl.y"
    { (yyval.string_value) = strdup("invalid"); ;}
    break;

  case 267:

/* Line 1455 of yacc.c  */
#line 1990 "firrtl.y"
    { (yyval.string_value) = strdup("when"); ;}
    break;

  case 268:

/* Line 1455 of yacc.c  */
#line 1991 "firrtl.y"
    { (yyval.string_value) = strdup("else"); ;}
    break;

  case 269:

/* Line 1455 of yacc.c  */
#line 1992 "firrtl.y"
    { (yyval.string_value) = strdup("stop"); ;}
    break;

  case 270:

/* Line 1455 of yacc.c  */
#line 1993 "firrtl.y"
    { (yyval.string_value) = strdup("printf"); ;}
    break;

  case 271:

/* Line 1455 of yacc.c  */
#line 1994 "firrtl.y"
    { (yyval.string_value) = strdup("skip"); ;}
    break;

  case 272:

/* Line 1455 of yacc.c  */
#line 1995 "firrtl.y"
    { (yyval.string_value) = strdup("old"); ;}
    break;

  case 273:

/* Line 1455 of yacc.c  */
#line 1996 "firrtl.y"
    { (yyval.string_value) = strdup("new"); ;}
    break;

  case 274:

/* Line 1455 of yacc.c  */
#line 1997 "firrtl.y"
    { (yyval.string_value) = strdup("undefined"); ;}
    break;

  case 275:

/* Line 1455 of yacc.c  */
#line 1998 "firrtl.y"
    { (yyval.string_value) = strdup("mux"); ;}
    break;

  case 276:

/* Line 1455 of yacc.c  */
#line 1999 "firrtl.y"
    { (yyval.string_value) = strdup("validif"); ;}
    break;

  case 277:

/* Line 1455 of yacc.c  */
#line 2000 "firrtl.y"
    { (yyval.string_value) = strdup("cmem"); ;}
    break;

  case 278:

/* Line 1455 of yacc.c  */
#line 2001 "firrtl.y"
    { (yyval.string_value) = strdup("smem"); ;}
    break;

  case 279:

/* Line 1455 of yacc.c  */
#line 2002 "firrtl.y"
    { (yyval.string_value) = strdup("mport"); ;}
    break;

  case 280:

/* Line 1455 of yacc.c  */
#line 2003 "firrtl.y"
    { (yyval.string_value) = strdup("infer"); ;}
    break;

  case 281:

/* Line 1455 of yacc.c  */
#line 2004 "firrtl.y"
    { (yyval.string_value) = strdup("read"); ;}
    break;

  case 282:

/* Line 1455 of yacc.c  */
#line 2005 "firrtl.y"
    { (yyval.string_value) = strdup("write"); ;}
    break;

  case 283:

/* Line 1455 of yacc.c  */
#line 2006 "firrtl.y"
    { (yyval.string_value) = strdup("rdwr"); ;}
    break;

  case 284:

/* Line 1455 of yacc.c  */
#line 2007 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 285:

/* Line 1455 of yacc.c  */
#line 2011 "firrtl.y"
    { (yyval.string_value) = strdup("add"); ;}
    break;

  case 286:

/* Line 1455 of yacc.c  */
#line 2012 "firrtl.y"
    { (yyval.string_value) = strdup("sub"); ;}
    break;

  case 287:

/* Line 1455 of yacc.c  */
#line 2013 "firrtl.y"
    { (yyval.string_value) = strdup("mul"); ;}
    break;

  case 288:

/* Line 1455 of yacc.c  */
#line 2014 "firrtl.y"
    { (yyval.string_value) = strdup("div"); ;}
    break;

  case 289:

/* Line 1455 of yacc.c  */
#line 2015 "firrtl.y"
    { (yyval.string_value) = strdup("rem"); ;}
    break;

  case 290:

/* Line 1455 of yacc.c  */
#line 2016 "firrtl.y"
    { (yyval.string_value) = strdup("lt"); ;}
    break;

  case 291:

/* Line 1455 of yacc.c  */
#line 2017 "firrtl.y"
    { (yyval.string_value) = strdup("leq"); ;}
    break;

  case 292:

/* Line 1455 of yacc.c  */
#line 2018 "firrtl.y"
    { (yyval.string_value) = strdup("gt"); ;}
    break;

  case 293:

/* Line 1455 of yacc.c  */
#line 2019 "firrtl.y"
    { (yyval.string_value) = strdup("geq"); ;}
    break;

  case 294:

/* Line 1455 of yacc.c  */
#line 2020 "firrtl.y"
    { (yyval.string_value) = strdup("eq"); ;}
    break;

  case 295:

/* Line 1455 of yacc.c  */
#line 2021 "firrtl.y"
    { (yyval.string_value) = strdup("neq"); ;}
    break;

  case 296:

/* Line 1455 of yacc.c  */
#line 2022 "firrtl.y"
    { (yyval.string_value) = strdup("pad"); ;}
    break;

  case 297:

/* Line 1455 of yacc.c  */
#line 2023 "firrtl.y"
    { (yyval.string_value) = strdup("asUInt"); ;}
    break;

  case 298:

/* Line 1455 of yacc.c  */
#line 2024 "firrtl.y"
    { (yyval.string_value) = strdup("asAsyncReset"); ;}
    break;

  case 299:

/* Line 1455 of yacc.c  */
#line 2025 "firrtl.y"
    { (yyval.string_value) = strdup("asSInt"); ;}
    break;

  case 300:

/* Line 1455 of yacc.c  */
#line 2026 "firrtl.y"
    { (yyval.string_value) = strdup("asClock"); ;}
    break;

  case 301:

/* Line 1455 of yacc.c  */
#line 2027 "firrtl.y"
    { (yyval.string_value) = strdup("asFixedPoint"); ;}
    break;

  case 302:

/* Line 1455 of yacc.c  */
#line 2028 "firrtl.y"
    { (yyval.string_value) = strdup("asInterval"); ;}
    break;

  case 303:

/* Line 1455 of yacc.c  */
#line 2029 "firrtl.y"
    { (yyval.string_value) = strdup("shl"); ;}
    break;

  case 304:

/* Line 1455 of yacc.c  */
#line 2030 "firrtl.y"
    { (yyval.string_value) = strdup("shr"); ;}
    break;

  case 305:

/* Line 1455 of yacc.c  */
#line 2031 "firrtl.y"
    { (yyval.string_value) = strdup("dshl"); ;}
    break;

  case 306:

/* Line 1455 of yacc.c  */
#line 2032 "firrtl.y"
    { (yyval.string_value) = strdup("dshr"); ;}
    break;

  case 307:

/* Line 1455 of yacc.c  */
#line 2033 "firrtl.y"
    { (yyval.string_value) = strdup("cvt"); ;}
    break;

  case 308:

/* Line 1455 of yacc.c  */
#line 2034 "firrtl.y"
    { (yyval.string_value) = strdup("neg"); ;}
    break;

  case 309:

/* Line 1455 of yacc.c  */
#line 2035 "firrtl.y"
    { (yyval.string_value) = strdup("not"); ;}
    break;

  case 310:

/* Line 1455 of yacc.c  */
#line 2036 "firrtl.y"
    { (yyval.string_value) = strdup("and"); ;}
    break;

  case 311:

/* Line 1455 of yacc.c  */
#line 2037 "firrtl.y"
    { (yyval.string_value) = strdup("or"); ;}
    break;

  case 312:

/* Line 1455 of yacc.c  */
#line 2038 "firrtl.y"
    { (yyval.string_value) = strdup("xor"); ;}
    break;

  case 313:

/* Line 1455 of yacc.c  */
#line 2039 "firrtl.y"
    { (yyval.string_value) = strdup("andr"); ;}
    break;

  case 314:

/* Line 1455 of yacc.c  */
#line 2040 "firrtl.y"
    { (yyval.string_value) = strdup("orr"); ;}
    break;

  case 315:

/* Line 1455 of yacc.c  */
#line 2041 "firrtl.y"
    { (yyval.string_value) = strdup("xorr"); ;}
    break;

  case 316:

/* Line 1455 of yacc.c  */
#line 2042 "firrtl.y"
    { (yyval.string_value) = strdup("cat"); ;}
    break;

  case 317:

/* Line 1455 of yacc.c  */
#line 2043 "firrtl.y"
    { (yyval.string_value) = strdup("bits"); ;}
    break;

  case 318:

/* Line 1455 of yacc.c  */
#line 2044 "firrtl.y"
    { (yyval.string_value) = strdup("head"); ;}
    break;

  case 319:

/* Line 1455 of yacc.c  */
#line 2045 "firrtl.y"
    { (yyval.string_value) = strdup("tail"); ;}
    break;

  case 320:

/* Line 1455 of yacc.c  */
#line 2046 "firrtl.y"
    { (yyval.string_value) = strdup("incp"); ;}
    break;

  case 321:

/* Line 1455 of yacc.c  */
#line 2047 "firrtl.y"
    { (yyval.string_value) = strdup("decp"); ;}
    break;

  case 322:

/* Line 1455 of yacc.c  */
#line 2048 "firrtl.y"
    { (yyval.string_value) = strdup("setp"); ;}
    break;

  case 323:

/* Line 1455 of yacc.c  */
#line 2049 "firrtl.y"
    { (yyval.string_value) = strdup("wrap"); ;}
    break;

  case 324:

/* Line 1455 of yacc.c  */
#line 2050 "firrtl.y"
    { (yyval.string_value) = strdup("clip"); ;}
    break;

  case 325:

/* Line 1455 of yacc.c  */
#line 2051 "firrtl.y"
    { (yyval.string_value) = strdup("squz"); ;}
    break;

  case 326:

/* Line 1455 of yacc.c  */
#line 2056 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 327:

/* Line 1455 of yacc.c  */
#line 2057 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 328:

/* Line 1455 of yacc.c  */
#line 2058 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 329:

/* Line 1455 of yacc.c  */
#line 2059 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 330:

/* Line 1455 of yacc.c  */
#line 2060 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 331:

/* Line 1455 of yacc.c  */
#line 2064 "firrtl.y"
    { (yyval.char_value) = '['; ;}
    break;

  case 332:

/* Line 1455 of yacc.c  */
#line 2065 "firrtl.y"
    { (yyval.char_value) = '('; ;}
    break;

  case 333:

/* Line 1455 of yacc.c  */
#line 2069 "firrtl.y"
    { (yyval.char_value) = ']'; ;}
    break;

  case 334:

/* Line 1455 of yacc.c  */
#line 2070 "firrtl.y"
    { (yyval.char_value) = ')'; ;}
    break;

  case 335:

/* Line 1455 of yacc.c  */
#line 2074 "firrtl.y"
    { (yyval.string_value) = strdup("?"); ;}
    break;

  case 336:

/* Line 1455 of yacc.c  */
#line 2075 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 337:

/* Line 1455 of yacc.c  */
#line 2076 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 338:

/* Line 1455 of yacc.c  */
#line 2077 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 339:

/* Line 1455 of yacc.c  */
#line 2082 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 340:

/* Line 1455 of yacc.c  */
#line 2086 "firrtl.y"
    { (yyval.string_value) = strdup(""); ;}
    break;

  case 341:

/* Line 1455 of yacc.c  */
#line 2087 "firrtl.y"
    { (yyval.string_value) = (yyvsp[(1) - (1)].string_value); ;}
    break;

  case 342:

/* Line 1455 of yacc.c  */
#line 2091 "firrtl.y"
    { ;}
    break;

  case 343:

/* Line 1455 of yacc.c  */
#line 2092 "firrtl.y"
    { ;}
    break;

  case 344:

/* Line 1455 of yacc.c  */
#line 2093 "firrtl.y"
    { free((yyvsp[(1) - (2)].string_value)); ;}
    break;

  case 345:

/* Line 1455 of yacc.c  */
#line 2094 "firrtl.y"
    { free((yyvsp[(1) - (2)].string_value)); ;}
    break;

  case 346:

/* Line 1455 of yacc.c  */
#line 2097 "firrtl.y"
    { free((yyvsp[(1) - (2)].string_value)); ;}
    break;

  case 347:

/* Line 1455 of yacc.c  */
#line 2098 "firrtl.y"
    { free((yyvsp[(1) - (2)].string_value)); ;}
    break;

  case 348:

/* Line 1455 of yacc.c  */
#line 2102 "firrtl.y"
    { free((yyvsp[(1) - (3)].string_value)); free((yyvsp[(2) - (3)].string_value)); ;}
    break;



/* Line 1455 of yacc.c  */
#line 5879 "firrtl_tab.cc"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 2106 "firrtl.y"


void yyerror(const char *errMsg) {
    printf("%s", errMsg);
    return;
}
