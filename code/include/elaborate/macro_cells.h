//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_MACROCELLS_H
#define ELABORATE_MACROCELLS_H

#include <string>
#include <vector>
#include <map>
#include "utility/assert.h"
#include "db/verilog_db.h"

namespace verilog {
  class MacroCellLib {
  public:
    enum ModuleType {
      kTypeAddUnsigned,
      kTypeAddSigned,
      kTypeSubUnsigned,
      kTypeSubSigned,
      kTypeMulUnsigned,
      kTypeMulSigned,
      kTypeDivUnsigned,
      kTypeDivSigned,
      kTypeRemUnsigned,
      kTypeRemSigned,
      kTypeLtUnsigned,
      kTypeLtSigned,
      kTypeLeqUnsigned,
      kTypeLeqSigned,
      kTypeGtUnsigned,
      kTypeGtSigned,
      kTypeGeqUnsigned,
      kTypeGeqSigned,
      kTypeEqUnsigned,
      kTypeEqSigned,
      kTypeNeqUnsigned,
      kTypeNeqSigned,
      kTypePadUnsigned,
      kTypePadSigned,
      kTypeAsUInt,
      kTypeAsSInt,
      kTypeShlUnsigned,
      kTypeShlSigned,
      kTypeShrUnsigned,
      kTypeShrSigned,
      kTypeDShlUnsigned,
      kTypeDShlSigned,
      kTypeDShrUnsigned,
      kTypeDShrSigned,
      kTypeCvtUnsigned,
      kTypeCvtSigned,
      kTypeNegUnsigned,
      kTypeNegSigned,
      kTypeBitwiseNot,
      kTypeBitwiseAnd,
      kTypeBitwiseOr,
      kTypeBitwiseXor,
      kTypeAndr,
      kTypeOrr,
      kTypeXorr,
      kTypeCat,
      kTypeBits,
      kTypeHead,
      kTypeTail,
      kTypeDffPosClk,
      kTypeDffNegClk,
      kTypeDffPosClkPosAsyncRst,
      kTypeDffPosClkNegAsyncRst,
      kTypeDffNegClkPosAsyncRst,
      kTypeDffNegClkNegAsyncRst,
      kTypeMuxUnsigned,
      kTypeMuxSigned,
      kTypeRomMem,
      kTypeRamMem,
      kTypeMRRomMem,
      kTypeMRMWMem,
      kTypeUndef
    };
  public:
    MacroCellLib(Library* library);
    ~MacroCellLib();
    Library* library() { return lib_; }

    ExternModule* addCellAddUnsigned(const std::string& indent = "");
    ExternModule* addCellAddSigned(const std::string& indent = "");
    ExternModule* addCellSubUnsigned(const std::string& indent = "");
    ExternModule* addCellSubSigned(const std::string& indent = "");
    ExternModule* addCellMulUnsigned(const std::string& indent = "");
    ExternModule* addCellMulSigned(const std::string& indent = "");
    ExternModule* addCellDivUnsigned(const std::string& indent = "");
    ExternModule* addCellDivSigned(const std::string& indent = "");
    ExternModule* addCellRemUnsigned(const std::string& indent = "");
    ExternModule* addCellRemSigned(const std::string& indent = "");
    ExternModule* addCellLtUnsigned(const std::string& indent = "");
    ExternModule* addCellLtSigned(const std::string& indent = "");
    ExternModule* addCellLeqUnsigned(const std::string& indent = "");
    ExternModule* addCellLeqSigned(const std::string& indent = "");
    ExternModule* addCellGtUnsigned(const std::string& indent = "");
    ExternModule* addCellGtSigned(const std::string& indent = "");
    ExternModule* addCellGeqUnsigned(const std::string& indent = "");
    ExternModule* addCellGeqSigned(const std::string& indent = "");
    ExternModule* addCellEqUnsigned(const std::string& indent = "");
    ExternModule* addCellEqSigned(const std::string& indent = "");
    ExternModule* addCellNeqUnsigned(const std::string& indent = "");
    ExternModule* addCellNeqSigned(const std::string& indent = "");
    ExternModule* addCellPadUnsigned(const std::string& indent = "");
    ExternModule* addCellPadSigned(const std::string& indent = "");
    ExternModule* addCellAsUInt(const std::string& indent = "");
    ExternModule* addCellAsSInt(const std::string& indent = "");
    ExternModule* addCellShlUnsigned(const std::string& indent = "");
    ExternModule* addCellShlSigned(const std::string& indent = "");
    ExternModule* addCellShrUnsigned(const std::string& indent = "");
    ExternModule* addCellShrSigned(const std::string& indent = "");
    ExternModule* addCellDShlUnsigned(const std::string& indent = "");
    ExternModule* addCellDShlSigned(const std::string& indent = "");
    ExternModule* addCellDShrUnsigned(const std::string& indent = "");
    ExternModule* addCellDShrSigned(const std::string& indent = "");
    ExternModule* addCellCvtUnsigned(const std::string& indent = "");
    ExternModule* addCellCvtSigned(const std::string& indent = "");
    ExternModule* addCellNegUnsigned(const std::string& indent = "");
    ExternModule* addCellNegSigned(const std::string& indent = "");
    ExternModule* addCellBitwiseNot(const std::string& indent = "");
    ExternModule* addCellBitwiseAnd(const std::string& indent = "");
    ExternModule* addCellBitwiseOr(const std::string& indent = "");
    ExternModule* addCellBitwiseXor(const std::string& indent = "");
    ExternModule* addCellAndr(const std::string& indent = "");
    ExternModule* addCellOrr(const std::string& indent = "");
    ExternModule* addCellXorr(const std::string& indent = "");
    ExternModule* addCellCat(const std::string& indent = "");
    ExternModule* addCellBits(const std::string& indent = "");
    ExternModule* addCellHead(const std::string& indent = "");
    ExternModule* addCellTail(const std::string& indent = "");
    ExternModule* addCellDffPosClk(const std::string& indent = "");
    ExternModule* addCellDffNegClk(const std::string& indent = "");
    ExternModule* addCellDffPosClkPosAsyncRst(const std::string& indent = "");
    ExternModule* addCellDffPosClkNegAsyncRst(const std::string& indent = "");
    ExternModule* addCellDffNegClkPosAsyncRst(const std::string& indent = "");
    ExternModule* addCellDffNegClkNegAsyncRst(const std::string& indent = "");
    ExternModule* addCellMuxUnsigned(const std::string& indent = "");
    ExternModule* addCellMuxSigned(const std::string& indent = "");
    ExternModule* addCellRomMem(const std::string& indent = "");
    ExternModule* addCellRamMem(const std::string& indent = "");
    ExternModule* addCellMRRomMem(const std::string& indent = "");
    ExternModule* addCellMRMWMem(const std::string& indent = "");

    static std::string getNameByModuleType(ModuleType type);
    static ModuleType getModuleTypeByName(const std::string& module_name);

    static std::string getAddUnsignedName() { return "ADD_UNSIGNED"; }
    static std::string getAddUnsignedParamWidth() { return "width"; }
    static std::string getAddUnsignedPortY() { return "y"; }
    static std::string getAddUnsignedPortA() { return "a"; }
    static std::string getAddUnsignedPortB() { return "b"; }

    static std::string getAddSignedName() { return "ADD_SIGNED"; }
    static std::string getAddSignedParamWidth() { return "width"; }
    static std::string getAddSignedPortY() { return "y"; }
    static std::string getAddSignedPortA() { return "a"; }
    static std::string getAddSignedPortB() { return "b"; }

    static std::string getSubUnsignedName() { return "SUB_UNSIGNED"; }
    static std::string getSubUnsignedParamWidth() { return "width"; }
    static std::string getSubUnsignedPortY() { return "y"; }
    static std::string getSubUnsignedPortA() { return "a"; }
    static std::string getSubUnsignedPortB() { return "b"; }

    static std::string getSubSignedName() { return "SUB_SIGNED"; }
    static std::string getSubSignedParamWidth() { return "width"; }
    static std::string getSubSignedPortY() { return "y"; }
    static std::string getSubSignedPortA() { return "a"; }
    static std::string getSubSignedPortB() { return "b"; }

    static std::string getMulUnsignedName() { return "MUL_UNSIGNED"; }
    static std::string getMulUnsignedParamWidthA() { return "width_a"; }
    static std::string getMulUnsignedParamWidthB() { return "width_b"; }
    static std::string getMulUnsignedPortY() { return "y"; }
    static std::string getMulUnsignedPortA() { return "a"; }
    static std::string getMulUnsignedPortB() { return "b"; }
    
    static std::string getMulSignedName() { return "MUL_SIGNED"; }
    static std::string getMulSignedParamWidthA() { return "width_a"; }
    static std::string getMulSignedParamWidthB() { return "width_b"; }
    static std::string getMulSignedPortY() { return "y"; }
    static std::string getMulSignedPortA() { return "a"; }
    static std::string getMulSignedPortB() { return "b"; }

    static std::string getDivUnsignedName() { return "DIV_UNSIGNED"; }
    //static std::string getDivUnsignedParamWidth() { return "width"; }
    static std::string getDivUnsignedParamNumWidth() { return "width_num"; }
    static std::string getDivUnsignedParamDenWidth() { return "width_den"; }
    static std::string getDivUnsignedPortY() { return "y"; }
    static std::string getDivUnsignedPortNum() { return "num"; }
    static std::string getDivUnsignedPortDen() { return "den"; }
    
    static std::string getDivSignedName() { return "DIV_SIGNED"; }
    //static std::string getDivSignedParamWidth() { return "width"; }
    static std::string getDivSignedParamNumWidth() { return "width_num"; }
    static std::string getDivSignedParamDenWidth() { return "width_den"; }
    static std::string getDivSignedPortY() { return "y"; }
    static std::string getDivSignedPortNum() { return "num"; }
    static std::string getDivSignedPortDen() { return "den"; }

    static std::string getRemUnsignedName() { return "REM_UNSIGNED"; }
    static std::string getRemUnsignedParamNumWidth() { return "width_num"; }
    static std::string getRemUnsignedParamDenWidth() { return "width_den"; }
    static std::string getRemUnsignedParamWidth() { return "width"; }
    static std::string getRemUnsignedPortY() { return "y"; }
    static std::string getRemUnsignedPortNum() { return "num"; }
    static std::string getRemUnsignedPortDen() { return "den"; }
    
    static std::string getRemSignedName() { return "REM_SIGNED"; }
    static std::string getRemSignedParamNumWidth() { return "width_num"; }
    static std::string getRemSignedParamDenWidth() { return "width_den"; }
    static std::string getRemSignedParamWidth() { return "width"; }
    static std::string getRemSignedPortY() { return "y"; }
    static std::string getRemSignedPortNum() { return "num"; }
    static std::string getRemSignedPortDen() { return "den"; }

    static std::string getLtUnsignedName() { return "LT_UNSIGNED"; }
    static std::string getLtUnsignedParamWidth() { return "width"; }
    static std::string getLtUnsignedPortY() { return "y"; }
    static std::string getLtUnsignedPortA() { return "a"; }
    static std::string getLtUnsignedPortB() { return "b"; }
    
    static std::string getLtSignedName() { return "LT_SIGNED"; }
    static std::string getLtSignedParamWidth() { return "width"; }
    static std::string getLtSignedPortY() { return "y"; }
    static std::string getLtSignedPortA() { return "a"; }
    static std::string getLtSignedPortB() { return "b"; }

    static std::string getLeqUnsignedName() { return "LEQ_UNSIGNED"; }
    static std::string getLeqUnsignedParamWidth() { return "width"; }
    static std::string getLeqUnsignedPortY() { return "y"; }
    static std::string getLeqUnsignedPortA() { return "a"; }
    static std::string getLeqUnsignedPortB() { return "b"; }
    
    static std::string getLeqSignedName() { return "LEQ_SIGNED"; }
    static std::string getLeqSignedParamWidth() { return "width"; }
    static std::string getLeqSignedPortY() { return "y"; }
    static std::string getLeqSignedPortA() { return "a"; }
    static std::string getLeqSignedPortB() { return "b"; }

    static std::string getGtUnsignedName() { return "GT_UNSIGNED"; }
    static std::string getGtUnsignedParamWidth() { return "width"; }
    static std::string getGtUnsignedPortY() { return "y"; }
    static std::string getGtUnsignedPortA() { return "a"; }
    static std::string getGtUnsignedPortB() { return "b"; }
    
    static std::string getGtSignedName() { return "GT_SIGNED"; }
    static std::string getGtSignedParamWidth() { return "width"; }
    static std::string getGtSignedPortY() { return "y"; }
    static std::string getGtSignedPortA() { return "a"; }
    static std::string getGtSignedPortB() { return "b"; }

    static std::string getGeqUnsignedName() { return "GEQ_UNSIGNED"; }
    static std::string getGeqUnsignedParamWidth() { return "width"; }
    static std::string getGeqUnsignedPortY() { return "y"; }
    static std::string getGeqUnsignedPortA() { return "a"; }
    static std::string getGeqUnsignedPortB() { return "b"; }
    
    static std::string getGeqSignedName() { return "GEQ_SIGNED"; }
    static std::string getGeqSignedParamWidth() { return "width"; }
    static std::string getGeqSignedPortY() { return "y"; }
    static std::string getGeqSignedPortA() { return "a"; }
    static std::string getGeqSignedPortB() { return "b"; }

    static std::string getEqUnsignedName() { return "EQ_UNSIGNED"; }
    static std::string getEqUnsignedParamWidth() { return "width"; }
    static std::string getEqUnsignedPortY() { return "y"; }
    static std::string getEqUnsignedPortA() { return "a"; }
    static std::string getEqUnsignedPortB() { return "b"; }
    
    static std::string getEqSignedName() { return "EQ_SIGNED"; }
    static std::string getEqSignedParamWidth() { return "width"; }
    static std::string getEqSignedPortY() { return "y"; }
    static std::string getEqSignedPortA() { return "a"; }
    static std::string getEqSignedPortB() { return "b"; }

    static std::string getNeqUnsignedName() { return "NEQ_UNSIGNED"; }
    static std::string getNeqUnsignedParamWidth() { return "width"; }
    static std::string getNeqUnsignedPortY() { return "y"; }
    static std::string getNeqUnsignedPortA() { return "a"; }
    static std::string getNeqUnsignedPortB() { return "b"; }
    
    static std::string getNeqSignedName() { return "NEQ_SIGNED"; }
    static std::string getNeqSignedParamWidth() { return "width"; }
    static std::string getNeqSignedPortY() { return "y"; }
    static std::string getNeqSignedPortA() { return "a"; }
    static std::string getNeqSignedPortB() { return "b"; }

    static std::string getPadUnsignedName() { return "PAD_UNSIGNED"; }
    static std::string getPadUnsignedParamWidth() { return "width"; }
    static std::string getPadUnsignedParamN() { return "n"; }
    static std::string getPadUnsignedPortY() { return "y"; }
    static std::string getPadUnsignedPortIn() { return "in"; }
    
    static std::string getPadSignedName() { return "PAD_SIGNED"; }
    static std::string getPadSignedParamWidth() { return "width"; }
    static std::string getPadSignedParamN() { return "n"; }
    static std::string getPadSignedPortY() { return "y"; }
    static std::string getPadSignedPortIn() { return "in"; }

    static std::string getAsUIntName() { return "ASUINT"; }
    static std::string getAsUIntParamWidth() { return "width"; }
    static std::string getAsUIntPortY() { return "y"; }
    static std::string getAsUIntPortIn() { return "in"; }

    static std::string getAsSIntName() { return "ASSINT"; }
    static std::string getAsSIntParamWidth() { return "width"; }
    static std::string getAsSIntPortY() { return "y"; }
    static std::string getAsSIntPortIn() { return "in"; }

    static std::string getShlUnsignedName() { return "SHL_UNSIGNED"; }
    static std::string getShlUnsignedParamWidth() { return "width"; }
    static std::string getShlUnsignedParamN() { return "n"; }
    static std::string getShlUnsignedPortY() { return "y"; }
    static std::string getShlUnsignedPortIn() { return "in"; }
    
    static std::string getShlSignedName() { return "SHL_SIGNED"; }
    static std::string getShlSignedParamWidth() { return "width"; }
    static std::string getShlSignedParamN() { return "n"; }
    static std::string getShlSignedPortY() { return "y"; }
    static std::string getShlSignedPortIn() { return "in"; }

    static std::string getShrUnsignedName() { return "SHR_UNSIGNED"; }
    static std::string getShrUnsignedParamWidth() { return "width"; }
    static std::string getShrUnsignedParamN() { return "n"; }
    static std::string getShrUnsignedPortY() { return "y"; }
    static std::string getShrUnsignedPortIn() { return "in"; }
    
    static std::string getShrSignedName() { return "SHR_SIGNED"; }
    static std::string getShrSignedParamWidth() { return "width"; }
    static std::string getShrSignedParamN() { return "n"; }
    static std::string getShrSignedPortY() { return "y"; }
    static std::string getShrSignedPortIn() { return "in"; }

    static std::string getDShlUnsignedName() { return "DSHL_UNSIGNED"; }
    static std::string getDShlUnsignedParamWidthIn() { return "width_in"; }
    static std::string getDShlUnsignedParamWidthN() { return "width_n"; }
    static std::string getDShlUnsignedPortY() { return "y"; }
    static std::string getDShlUnsignedPortIn() { return "in"; }
    static std::string getDShlUnsignedPortN() { return "n"; }
    
    static std::string getDShlSignedName() { return "DSHL_SIGNED"; }
    static std::string getDShlSignedParamWidthIn() { return "width_in"; }
    static std::string getDShlSignedParamWidthN() { return "width_n"; }
    static std::string getDShlSignedPortY() { return "y"; }
    static std::string getDShlSignedPortIn() { return "in"; }
    static std::string getDShlSignedPortN() { return "n"; }

    static std::string getDShrUnsignedName() { return "DSHR_UNSIGNED"; }
    static std::string getDShrUnsignedParamWidthIn() { return "width_in"; }
    static std::string getDShrUnsignedParamWidthN() { return "width_n"; }
    static std::string getDShrUnsignedPortY() { return "y"; }
    static std::string getDShrUnsignedPortIn() { return "in"; }
    static std::string getDShrUnsignedPortN() { return "n"; }
    
    static std::string getDShrSignedName() { return "DSHR_SIGNED"; }
    static std::string getDShrSignedParamWidthIn() { return "width_in"; }
    static std::string getDShrSignedParamWidthN() { return "width_n"; }
    static std::string getDShrSignedPortY() { return "y"; }
    static std::string getDShrSignedPortIn() { return "in"; }
    static std::string getDShrSignedPortN() { return "n"; }

    static std::string getCvtUnsignedName() { return "CVT_UNSIGNED"; }
    static std::string getCvtUnsignedParamWidth() { return "width"; }
    static std::string getCvtUnsignedPortY() { return "y"; }
    static std::string getCvtUnsignedPortIn() { return "in"; }
    
    static std::string getCvtSignedName() { return "CVT_SIGNED"; }
    static std::string getCvtSignedParamWidth() { return "width"; }
    static std::string getCvtSignedPortY() { return "y"; }
    static std::string getCvtSignedPortIn() { return "in"; }

    static std::string getNegUnsignedName() { return "NEG_UNSIGNED"; }
    static std::string getNegUnsignedParamWidth() { return "width"; }
    static std::string getNegUnsignedPortY() { return "y"; }
    static std::string getNegUnsignedPortIn() { return "in"; }
    
    static std::string getNegSignedName() { return "NEG_SIGNED"; }
    static std::string getNegSignedParamWidth() { return "width"; }
    static std::string getNegSignedPortY() { return "y"; }
    static std::string getNegSignedPortIn() { return "in"; }

    static std::string getBitwiseNotName() { return "BITWISENOT"; }
    static std::string getBitwiseNotParamWidth() { return "width"; }
    static std::string getBitwiseNotPortY() { return "y"; }
    static std::string getBitwiseNotPortIn() { return "in"; }

    static std::string getBitwiseAndName() { return "BITWISEAND"; }
    static std::string getBitwiseAndParamWidth() { return "width"; }
    static std::string getBitwiseAndPortY() { return "y"; }
    static std::string getBitwiseAndPortA() { return "a"; }
    static std::string getBitwiseAndPortB() { return "b"; }

    static std::string getBitwiseOrName() { return "BITWISEOR"; }
    static std::string getBitwiseOrParamWidth() { return "width"; }
    static std::string getBitwiseOrPortY() { return "y"; }
    static std::string getBitwiseOrPortA() { return "a"; }
    static std::string getBitwiseOrPortB() { return "b"; }

    static std::string getBitwiseXorName() { return "BITWISEXOR"; }
    static std::string getBitwiseXorParamWidth() { return "width"; }
    static std::string getBitwiseXorPortY() { return "y"; }
    static std::string getBitwiseXorPortA() { return "a"; }
    static std::string getBitwiseXorPortB() { return "b"; }

    static std::string getAndrName() { return "ANDR"; }
    static std::string getAndrParamWidth() { return "width"; }
    static std::string getAndrPortY() { return "y"; }
    static std::string getAndrPortIn() { return "in"; }

    static std::string getOrrName() { return "ORR"; }
    static std::string getOrrParamWidth() { return "width"; }
    static std::string getOrrPortY() { return "y"; }
    static std::string getOrrPortIn() { return "in"; }

    static std::string getXorrName() { return "XORR"; }
    static std::string getXorrParamWidth() { return "width"; }
    static std::string getXorrPortY() { return "y"; }
    static std::string getXorrPortIn() { return "in"; }

    static std::string getCatName() { return "CAT"; }
    static std::string getCatParamWidthA() { return "width_a"; }
    static std::string getCatParamWidthB() { return "width_b"; }
    static std::string getCatPortY() { return "y"; }
    static std::string getCatPortA() { return "a"; }
    static std::string getCatPortB() { return "b"; }

    static std::string getBitsName() { return "BITS"; }
    static std::string getBitsParamWidth() { return "width"; }
    static std::string getBitsParamHigh() { return "high"; }
    static std::string getBitsParamLow() { return "low"; }
    static std::string getBitsPortY() { return "y"; }
    static std::string getBitsPortIn() { return "in"; }

    static std::string getHeadName() { return "HEAD"; }
    static std::string getHeadParamWidth() { return "width"; }
    static std::string getHeadParamN() { return "n"; }
    static std::string getHeadPortY() { return "y"; }
    static std::string getHeadPortIn() { return "in"; }

    static std::string getTailName() { return "TAIL"; }
    static std::string getTailParamWidth() { return "width"; }
    static std::string getTailParamN() { return "n"; }
    static std::string getTailPortY() { return "y"; }
    static std::string getTailPortIn() { return "in"; }

    static std::string getDffPosClkName() { return "DFF_POSCLK"; }
    static std::string getDffPosClkParamWidth() { return "width"; }
    static std::string getDffPosClkPortQ() { return "q"; }
    static std::string getDffPosClkPortD() { return "d"; }
    static std::string getDffPosClkPortClk() { return "clk"; }

    static std::string getDffNegClkName() { return "DFF_NEGCLK"; }
    static std::string getDffNegClkParamWidth() { return "width"; }
    static std::string getDffNegClkPortQ() { return "q"; }
    static std::string getDffNegClkPortD() { return "d"; }
    static std::string getDffNegClkPortClk() { return "clk"; }

    static std::string getDffPosClkPosAsyncRstName() { return "DFF_POSCLK_POSASYNCRST"; }
    static std::string getDffPosClkPosAsyncRstParamWidth() { return "width"; }
    static std::string getDffPosClkPosAsyncRstPortQ() { return "q"; }
    static std::string getDffPosClkPosAsyncRstPortD() { return "d"; }
    static std::string getDffPosClkPosAsyncRstPortRst() { return "rst"; }
    static std::string getDffPosClkPosAsyncRstPortRstVal() { return "rstval"; }
    static std::string getDffPosClkPosAsyncRstPortClk() { return "clk"; }

    static std::string getDffPosClkNegAsyncRstName() { return "DFF_POSCLK_NEGASYNCRST"; }
    static std::string getDffPosClkNegAsyncRstParamWidth() { return "width"; }
    static std::string getDffPosClkNegAsyncRstPortQ() { return "q"; }
    static std::string getDffPosClkNegAsyncRstPortD() { return "d"; }
    static std::string getDffPosClkNegAsyncRstPortRst() { return "rst"; }
    static std::string getDffPosClkNegAsyncRstPortRstVal() { return "rstval"; }
    static std::string getDffPosClkNegAsyncRstPortClk() { return "clk"; }

    static std::string getDffNegClkPosAsyncRstName() { return "DFF_NEGCLK_POSASYNCRST"; }
    static std::string getDffNegClkPosAsyncRstParamWidth() { return "width"; }
    static std::string getDffNegClkPosAsyncRstPortQ() { return "q"; }
    static std::string getDffNegClkPosAsyncRstPortD() { return "d"; }
    static std::string getDffNegClkPosAsyncRstPortRst() { return "rst"; }
    static std::string getDffNegClkPosAsyncRstPortRstVal() { return "rstval"; }
    static std::string getDffNegClkPosAsyncRstPortClk() { return "clk"; }

    static std::string getDffNegClkNegAsyncRstName() { return "DFF_NEGCLK_NEGASYNCRST"; }
    static std::string getDffNegClkNegAsyncRstParamWidth() { return "width"; }
    static std::string getDffNegClkNegAsyncRstPortQ() { return "q"; }
    static std::string getDffNegClkNegAsyncRstPortD() { return "d"; }
    static std::string getDffNegClkNegAsyncRstPortRst() { return "rst"; }
    static std::string getDffNegClkNegAsyncRstPortRstVal() { return "rstval"; }
    static std::string getDffNegClkNegAsyncRstPortClk() { return "clk"; }

    static std::string getMuxUnsignedName() { return "MUX_UNSIGNED"; }
    static std::string getMuxUnsignedParamWidth() { return "width"; }
    static std::string getMuxUnsignedPortY() { return "y"; }
    static std::string getMuxUnsignedPortSel() { return "sel"; }
    static std::string getMuxUnsignedPortA() { return "a"; }
    static std::string getMuxUnsignedPortB() { return "b"; }

    static std::string getMuxSignedName() { return "MUX_SIGNED"; }
    static std::string getMuxSignedParamWidth() { return "width"; }
    static std::string getMuxSignedPortY() { return "y"; }
    static std::string getMuxSignedPortSel() { return "sel"; }
    static std::string getMuxSignedPortA() { return "a"; }
    static std::string getMuxSignedPortB() { return "b"; }

    static std::string getRomMemName() { return "ROMMEM"; }
    static std::string getRomMemParamWidth() { return "width"; }
    static std::string getRomMemParamDepth() { return "depth"; }
    static std::string getRomMemParamAddrbits() { return "addrbits"; }
    static std::string getRomMemParamIsSyncRead() { return "isSyncRead"; }
    static std::string getRomMemPortReadData() { return "read_data"; }
    static std::string getRomMemPortReadClk() { return "read_clk"; }
    static std::string getRomMemPortReadEn() { return "read_en"; }
    static std::string getRomMemPortReadAddr() { return "read_addr"; }

    static std::string getRamMemName() { return "RAMMEM"; }
    static std::string getRamMemParamWidth() { return "width"; }
    static std::string getRamMemParamDepth() { return "depth"; }
    static std::string getRamMemParamAddrbits() { return "addrbits"; }
    static std::string getRamMemParamIsSyncRead() { return "isSyncRead"; }
    static std::string getRamMemPortReadData() { return "read_data"; }
    static std::string getRamMemPortReadClk() { return "read_clk"; }
    static std::string getRamMemPortReadEn() { return "read_en"; }
    static std::string getRamMemPortReadAddr() { return "read_addr"; }
    static std::string getRamMemPortWriteClk() { return "write_clk"; }
    static std::string getRamMemPortWriteEn() { return "write_en"; }
    static std::string getRamMemPortWriteMask() { return "write_mask"; }
    static std::string getRamMemPortWriteAddr() { return "write_addr"; }
    static std::string getRamMemPortWriteData() { return "write_data"; }

    static std::string getMRRomMemName() { return "MRROMMEM"; }
    static std::string getMRRomMemParamWidth() { return "width"; }
    static std::string getMRRomMemParamDepth() { return "depth"; }
    static std::string getMRRomMemParamAddrbits() { return "addrbits"; }
    static std::string getMRRomMemParamReadernum() { return "readernum"; }
    static std::string getMRRomMemParamIsSyncRead() { return "isSyncRead"; }
    static std::string getMRRomMemPortReadDatas() { return "read_datas"; }
    static std::string getMRRomMemPortReadClks() { return "read_clks"; }
    static std::string getMRRomMemPortReadEns() { return "read_ens"; }
    static std::string getMRRomMemPortReadAddrs() { return "read_addrs"; }

    static std::string getMRMWMemName() { return "MRMWMEM"; }
    static std::string getMRMWMemParamWidth() { return "width"; }
    static std::string getMRMWMemParamDepth() { return "depth"; }
    static std::string getMRMWMemParamAddrbits() { return "addrbits"; }
    static std::string getMRMWMemParamReadernum() { return "readernum"; }
    static std::string getMRMWMemParamWriternum() { return "writernum"; }
    static std::string getMRMWMemParamIsSyncRead() { return "isSyncRead"; }
    static std::string getMRMWMemPortReadDatas() { return "read_datas"; }
    static std::string getMRMWMemPortReadClks() { return "read_clks"; }
    static std::string getMRMWMemPortReadEns() { return "read_ens"; }
    static std::string getMRMWMemPortReadAddrs() { return "read_addrs"; }
    static std::string getMRMWMemPortWriteClks() { return "write_clks"; }
    static std::string getMRMWMemPortWriteEns() { return "write_ens"; }
    static std::string getMRMWMemPortWriteMasks() { return "write_masks"; }
    static std::string getMRMWMemPortWriteAddrs() { return "write_addrs"; }
    static std::string getMRMWMemPortWriteDatas() { return "write_datas"; }

  private:
    Library* lib_;
  };

}
#endif
