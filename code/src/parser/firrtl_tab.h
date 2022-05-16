
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
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

/* Line 1676 of yacc.c  */
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



/* Line 1676 of yacc.c  */
#line 199 "firrtl_tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE firrtllval;

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

extern YYLTYPE firrtllloc;

