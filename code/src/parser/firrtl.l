
%{
//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* run with flex 2.5.35
//* command: flex -P firrtl firrtl.l
//* Last updated: 2022-05-15
//******************************************************************************

#include <stdbool.h>
#ifdef WIN32
#include <io.h>
#else
#include <unistd.h>
#endif
#include "db/fir_db.h"
#include "firrtl_tab.h"

bool double_quoted = false;
bool single_quoted = false;

int firrtlcolumn = 1;
#define YY_USER_ACTION firrtllloc.first_line = firrtllloc.last_line = firrtllineno; \
    firrtllloc.first_column = firrtlcolumn; firrtllloc.last_column = firrtlcolumn + firrtlleng - 1; \
    firrtlcolumn += firrtlleng;


%}

%option noyywrap
%option yylineno
%option prefix="firrtl"
%option outfile="firrtl_lex.cc"
%option case-sensitive
%option nounistd
/*%option debug*/


%x NORMAL
%x STATE_DOUBLE_QUOTED
%x STATE_SINGLE_QUOTED





LEGAL_START_CHAR          [a-zA-Z_$]
LEGAL_ID_CHAR             [a-zA-Z_0-9$]
ID                        {LEGAL_START_CHAR}{LEGAL_ID_CHAR}*
RELAXED_ID                {LEGAL_ID_CHAR}+
     
DIGIT                     [0-9]
HEXDIGIT                  [a-fA-F0-9]
OCTALDIGIT                [0-7]
BINARYDIGIT               [01]
UNSIGNEDINT               {DIGIT}+
SIGNEDINT                 [+-]{DIGIT}+
HEXLIT                    h([+-])?{HEXDIGIT}+
OCTALLIT                  o([+-])?{OCTALDIGIT}+
BINARYLIT                 b([+-])?{BINARYDIGIT}+
DOUBLELIT                 ([+-])?{DIGIT}+\.{DIGIT}+([eE]([+-])?{DIGIT}+)?
DOUBLE_QUOTED_STRING      ((\\\")|[^\"\r\n])+?
SINGLE_QUOTED_STRING      ((\\\')|[^\'\r\n])+?



%%

<NORMAL>circuit             { /*BEGIN(STATE_ID);*/ return kCIRCUIT; }
<NORMAL>module              { /*BEGIN(STATE_ID);*/ return kMODULE; }
<NORMAL>extmodule           { /*BEGIN(STATE_ID);*/ return kEXTMODULE; }
<NORMAL>input               { /*BEGIN(STATE_ID);*/ return kINPUT; }
<NORMAL>output              { /*BEGIN(STATE_ID);*/ return kOUTPUT; }
<NORMAL>UInt                { return kUINT; }
<NORMAL>SInt                { return kSINT; }
<NORMAL>Fixed               { return kFIXED; }
<NORMAL>Interval            { return kINTERVAL; }
<NORMAL>Clock               { return kCLOCK; }
<NORMAL>AsyncReset          { return kASYNCRESET; }
<NORMAL>Reset               { return kRESET; }
<NORMAL>Analog              { return kANALOG; }
<NORMAL>flip                { return kFLIP; }
<NORMAL>wire                { return kWIRE; }
<NORMAL>mem                 { return kMEM; }
<NORMAL>cmem                { return kCMEM; }
<NORMAL>smem                { return kSMEM; }
<NORMAL>old                 { return kOLD; }
<NORMAL>new                 { return kNEW; }
<NORMAL>undefined           { return kUNDEFINED; }
<NORMAL>inst                { return kINST; }
<NORMAL>of                  { return kOF; }
<NORMAL>skip                { return kSKIP; }
<NORMAL>data-type           { return kDATATYPE; }
<NORMAL>depth               { return kDEPTH; }
<NORMAL>read-latency        { return kREADLATENCY; }
<NORMAL>write-latency       { return kWRITELATENCY; }
<NORMAL>read-under-write    { return kREADUNDERWRITE; }
<NORMAL>reader              { return kREADER; }
<NORMAL>writer              { return kWRITER; }
<NORMAL>readwriter          { return kREADWRITER; }
<NORMAL>node                { return kNODE; }
<NORMAL>defname             { return kDEFNAME; }
<NORMAL>parameter           { return kPARAMETER; }
<NORMAL>mux                 { return kMUX; }
<NORMAL>validif             { return kVALIDIF; }
<NORMAL>add                 { return kPRIMOPADD; }
<NORMAL>sub                 { return kPRIMOPSUB; }
<NORMAL>mul                 { return kPRIMOPMUL; }
<NORMAL>div                 { return kPRIMOPDIV; }
<NORMAL>rem                 { return kPRIMOPREM; }
<NORMAL>lt                  { return kPRIMOPLT; }
<NORMAL>leq                 { return kPRIMOPLEQ; }
<NORMAL>gt                  { return kPRIMOPGT; }
<NORMAL>geq                 { return kPRIMOPGEQ; }
<NORMAL>eq                  { return kPRIMOPEQ; }
<NORMAL>neq                 { return kPRIMOPNEQ; }
<NORMAL>pad                 { return kPRIMOPPAD; }
<NORMAL>asUInt              { return kPRIMOPASUINT; }
<NORMAL>asAsyncReset        { return kPRIMOPASASYNCRESET; }
<NORMAL>asSInt              { return kPRIMOPASSINT; }
<NORMAL>asClock             { return kPRIMOPASCLOCK; }
<NORMAL>asFixedPoint        { return kPRIMOPASFIXEDPOINT; }
<NORMAL>asInterval          { return kPRIMOPASINTERVAL; }
<NORMAL>shl                 { return kPRIMOPSHL; }
<NORMAL>shr                 { return kPRIMOPSHR; }
<NORMAL>dshl                { return kPRIMOPDSHL; }
<NORMAL>dshr                { return kPRIMOPDSHR; }
<NORMAL>cvt                 { return kPRIMOPCVT; }
<NORMAL>neg                 { return kPRIMOPNEG; }
<NORMAL>not                 { return kPRIMOPNOT; }
<NORMAL>and                 { return kPRIMOPAND; }
<NORMAL>or                  { return kPRIMOPOR; }
<NORMAL>xor                 { return kPRIMOPXOR; }
<NORMAL>andr                { return kPRIMOPANDR; }
<NORMAL>orr                 { return kPRIMOPORR; }
<NORMAL>xorr                { return kPRIMOPXORR; }
<NORMAL>cat                 { return kPRIMOPCAT; }
<NORMAL>bits                { return kPRIMOPBITS; }
<NORMAL>head                { return kPRIMOPHEAD; }
<NORMAL>tail                { return kPRIMOPTAIL; }
<NORMAL>incp                { return kPRIMOPINCP; }
<NORMAL>decp                { return kPRIMOPDECP; }
<NORMAL>setp                { return kPRIMOPSETP; }
<NORMAL>wrap                { return kPRIMOPWRAP; }
<NORMAL>clip                { return kPRIMOPCLIP; }
<NORMAL>squz                { return kPRIMOPSQUZ; }
<NORMAL>reg                 { return kREG; }
<NORMAL>with                { return kWITH; }
<NORMAL>reset               { return kREGRESET; }
<NORMAL>mport               { return kMPORT; }
<NORMAL>infer               { return kINFER; }
<NORMAL>read                { return kREAD; }
<NORMAL>write               { return kWRITE; }
<NORMAL>rdwr                { return kRDWR; }
<NORMAL>(is[ ]+invalid)     { return kISINVALID; }
<NORMAL>is                  { return kIS; }
<NORMAL>invalid             { return kINVALID; }
<NORMAL>stop                { return kSTOP; }
<NORMAL>printf              { return kPRINTF; }
<NORMAL>attach              { return kATTACH; }
<NORMAL>when                { return kWHEN; }
<NORMAL>else                { return kELSE; }


<NORMAL>":"           { return kCOLON; }
<NORMAL>"."           { return kDOT; }
<NORMAL>"?"           { return kQUESTION_MARK; }
<NORMAL>","           { return kCOMMA; }
<NORMAL>"\""          { 
                        if (double_quoted) {
                          double_quoted = false;
                        } else {
                          BEGIN(STATE_DOUBLE_QUOTED);
                          double_quoted = true;
                        }
                        return kQUOTATION_MARK; 
                      }
<NORMAL>"'"           { 
                        if (single_quoted) {
                          single_quoted = false;
                        } else {
                          BEGIN(STATE_SINGLE_QUOTED);
                          single_quoted = true;
                        }
                        return kAPOSTROPHE; 
                      }
<NORMAL>"<="          { return kCONNECT; }
<NORMAL>"<-"          { return kPARTIAL_CONNECT; }
<NORMAL>"=>"          { return kASSIGN; }
<NORMAL>"<<"          { return kBRACKET_SL; }
<NORMAL>">>"          { return kBRACKET_SR; }
<NORMAL>"<"           { return kBRACKET_L; }
<NORMAL>">"           { return kBRACKET_R; }
<NORMAL>"="           { return kEQ; }
<NORMAL>"("           { return kPARENT_L; }
<NORMAL>")"           { return kPARENT_R; }
<NORMAL>"["           { return kSQUARE_LB; }
<NORMAL>"]"           { return kSQUARE_RB; }
<NORMAL>"{"           { return kBRACE_L; }
<NORMAL>"}"           { return kBRACE_R; }


<NORMAL,STATE_DOUBLE_QUOTED>{UNSIGNEDINT}           { 
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kUNSIGNEDINT; 
                                                    }
<NORMAL,STATE_DOUBLE_QUOTED>{SIGNEDINT}             { 
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kSIGNEDINT; 
                                                    }
<NORMAL,STATE_DOUBLE_QUOTED>{HEXLIT}                { 
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kHEXLIT; 
                                                    }
<NORMAL,STATE_DOUBLE_QUOTED>{OCTALLIT}              { 
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kOCTALLIT; 
                                                    }
<NORMAL,STATE_DOUBLE_QUOTED>{BINARYLIT}             { 
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kBINARYLIT; 
                                                    }
<NORMAL>{DOUBLELIT}                                 { 
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kDOUBLELIT; 
                                                    }
<STATE_DOUBLE_QUOTED>{DOUBLE_QUOTED_STRING}         {
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kQUOTED_STRING;
                                                    }
<STATE_SINGLE_QUOTED>{SINGLE_QUOTED_STRING}         {
                                                      BEGIN(NORMAL);
                                                      firrtllval.string_value = strdup(firrtltext);
                                                      return kQUOTED_STRING;
                                                    }


<NORMAL>{ID}              {
                            BEGIN(NORMAL);
                            firrtllval.string_value = strdup(firrtltext);
                            return kID;
                          }
<NORMAL>{RELAXED_ID}      {
                            BEGIN(NORMAL);
                            firrtllval.string_value = strdup(firrtltext);
                            return kRELAXED_ID;
                          } 


<NORMAL>[ \t]                   { /*do nothing*/ }
<NORMAL>"@["("\\]"|.)*?"]"      {
                                  firrtllval.string_value = strdup(firrtltext);
                                  return kINFO;
                                }
<NORMAL>";".*                   {
                                  firrtlcolumn = 1;
                                  firrtllval.string_value = strdup(firrtltext); 
                                  return kCOMMENT;
                                }
<NORMAL>(\r)?\n                 {
                                  firrtlcolumn = 1;
                                  BEGIN(INITIAL); 
                                  return kNEWLINE;
                                }



[\ \t]*                 {
                          firrtllval.string_value = strdup(firrtltext);
                          BEGIN(NORMAL);
                          return kINDENT;
                        }
[^\ \t]                 { 
                          firrtllval.string_value = strdup("");
                          unput(firrtltext[0]);
                          firrtlcolumn = firrtlcolumn - 1;
                          BEGIN(NORMAL);
                          return kINDENT;
                        }
<<EOF>>                 { 
                          yyterminate();
                        }
%%