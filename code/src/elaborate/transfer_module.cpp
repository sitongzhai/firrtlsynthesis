//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <iostream>
#include <fstream>
#include <algorithm>
#ifndef WIN32
#include <cmath>
#endif // !WIN32
#include "elaborate/transfer_module.h"
#include "db/fir_db.h"
#include "db/fir_circuit.h"
#include "db/fir_module.h"
#include "utility/utility.h"
#include "utility/big_int.h"

namespace verilog {

  TransferModule::TransferModule(firDB::firLibrary* firrtl_library, Library* veri_library) {
    firrtl_library_ = firrtl_library;
    verilog_library_ = veri_library;
    prim_inst_num_ = 0;
    new_wire_num_ = 0;
    temp_wire_id_ = "_WTEMP_";
    interpunct_ = '$';
    macro_cell_lib_ = new MacroCellLib(verilog_library_);
    register_mux_port_b_map_.clear();
    unified_id_post_id_map_.clear();
    post_id_declared_id_map_.clear();
  }
  TransferModule::~TransferModule() {
    clear();
  }
  void TransferModule::clear() {
    if (macro_cell_lib_ != NULL) delete macro_cell_lib_;
    macro_cell_lib_ = NULL;
    firrtl_library_ = NULL;
    verilog_library_ = NULL;
    //set firrtl_module_ = NULL and verilog_module_ = NULL after all library has been transfered
    register_mux_port_b_map_.clear();
    unified_id_post_id_map_.clear();
    post_id_declared_id_map_.clear();
  }
  long long unsigned int TransferModule::getPrimInstNum() {
    prim_inst_num_++;
    return prim_inst_num_;
  }
  std::string TransferModule::getTempWireId() {
    std::string wire_id = temp_wire_id_ + std::to_string(new_wire_num_);
    new_wire_num_++;
    return wire_id;
  }
  bool TransferModule::transfer() {
    if (!transferLibraryToVerilogLibrary(getFirrtlLibrary())) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  std::string TransferModule::unifyId(const std::string& id) {
    std::string tmp_id = id;
    size_t found = tmp_id.find_first_of(getInterpunct());
    while (found != std::string::npos) {
      tmp_id.replace(found, 1, "_");
      found = tmp_id.find_first_of(getInterpunct());
    }
    return tmp_id;
  }
  std::string TransferModule::reUnifyId(const std::string& id) {
    std::string tmp_id = id;
    size_t found = tmp_id.find_first_of(getInterpunct());
    while (found != std::string::npos) {
      tmp_id.replace(found, 1, "__"); // two underscores
      found = tmp_id.find_first_of(getInterpunct());
    }
    return tmp_id;
  }
  bool TransferModule::avoidRedeclaredId(firDB::firModule* firrtl_module) {
    if (firrtl_module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to check the ID redeclaration.\n");
      return false;
    }
    for (std::map<std::string, firDB::firItem*>::iterator it = firrtl_module->id_items_map().begin(); it != firrtl_module->id_items_map().end(); it++) {
      std::string unified_id = unifyId(it->first);
      if (!addUnifiedId(firrtl_module, unified_id, it->first)) {
        return false;
      }
    }
    return true;
  }
  bool TransferModule::addUnifiedId(firDB::firModule* firrtl_module, const std::string & unified_id, const std::string & post_id) {
    if (firrtl_module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to add unified ID.\n");
      return false;
    }
    std::map<firDB::firModule*, std::map<std::string, std::string>>::iterator it = unified_id_post_id_map_.find(firrtl_module);
    if (it == unified_id_post_id_map_.end()) {
      std::map<std::string, std::string> temp;
      temp.insert(std::make_pair(unified_id, post_id));
      unified_id_post_id_map_.insert(std::make_pair(firrtl_module, temp));
    } else {
      std::map<std::string, std::string>::iterator it2 = (it->second).find(unified_id);
      if (it2 == (it->second).end()) {
        (it->second).insert(std::make_pair(unified_id, post_id));
      } else {
        if (post_id == it2->second) {
          fs_error("*ERROR*: The ID '%s' has already been declared.\n", unified_id.c_str());
          return false;
        } else {
          std::string new_declared_id1 = reUnifyId(it2->second);
          if (new_declared_id1 != unified_id) {
            std::string original_post_id1 = it2->second;
            (it->second).insert(std::make_pair(new_declared_id1, original_post_id1));
            (it->second).erase(unified_id);
            (it->second).insert(std::make_pair(unified_id, post_id));
            addDeclaredId(firrtl_module, original_post_id1, new_declared_id1);
            addDeclaredId(firrtl_module, post_id, unified_id);
          } else {
            std::string new_declared_id2 = reUnifyId(post_id);
            if (new_declared_id2 != unified_id) {
              (it->second).insert(std::make_pair(new_declared_id2, post_id));
              addDeclaredId(firrtl_module, post_id, new_declared_id2);
              addDeclaredId(firrtl_module, it2->second, unified_id);
            }
          }
        }
      }
    }
    return true;
  }
  bool TransferModule::addDeclaredId(firDB::firModule* firrtl_module, const std::string & post_id, const std::string & declared_id) {
    if (firrtl_module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to add declared ID.\n");
      return false;
    }
    std::map<firDB::firModule*, std::map<std::string, std::string> >::iterator it = post_id_declared_id_map_.find(firrtl_module);
    if (it == post_id_declared_id_map_.end()) {
      std::map<std::string, std::string> temp;
      temp.insert(std::make_pair(post_id, declared_id));
      post_id_declared_id_map_.insert(std::make_pair(firrtl_module, temp));
    } else {
      std::map<std::string, std::string>::iterator it2 = (it->second).find(post_id);
      if (it2 != (it->second).end()) {
        fs_error("*ERROR*: The post ID '%s' has already been mapped to declared ID '%s'.\n", post_id.c_str(), (it2->second).c_str());
        return false;
      }
      (it->second).insert(std::make_pair(post_id, declared_id));
    }
    return true;
  }
  std::string TransferModule::getWriteId(const std::string& id, firDB::firModule* firrtl_module) {
    if (firrtl_module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to get the writing ID.\n");
      return "";
    }
    std::string id_to_write = "";
    std::map<firDB::firModule*, std::map<std::string, std::string> >::iterator it = post_id_declared_id_map_.find(firrtl_module);
    if (it == post_id_declared_id_map_.end()) {
      id_to_write = unifyId(id);
    } else {
      std::map<std::string, std::string>::iterator it2 = (it->second).find(id);
      if (it2 != (it->second).end()) {
        id_to_write = it2->second;
      } else {
        id_to_write = unifyId(id);
      }
    }
    return id_to_write;
  }
  std::string TransferModule::getDffPortId(const std::string& dff_id, const std::string& port_id) {
    std::string dff_net_id = "_" + dff_id + "__" + port_id;
    return dff_net_id;
  }
  std::string TransferModule::getInstPortId(const std::string& inst_id, const std::string& port_id) {
    std::string inst_port_id = "_" + inst_id + "__" + port_id;
    return inst_port_id;
  }
  std::string TransferModule::getNewOperationPortId(const std::string& operation_id, const std::string& port_id) {
    std::string operation_port_id = operation_id + "_" + port_id;
    return operation_port_id;
  }
  int TransferModule::getPostTypeWidth(firDB::firType* type_data) {
    fs_assert(type_data != NULL);
    int width = -1;
    if (type_data->isUIntType()) {
      firDB::firTypeUInt* utype = dynamic_cast<firDB::firTypeUInt*>(type_data);
      if (utype->valid_width()) {
        width = utype->width();
      }
    } else if (type_data->isSIntType()) {
      firDB::firTypeSInt* stype = dynamic_cast<firDB::firTypeSInt*>(type_data);
      if (stype->valid_width()) {
        width = stype->width();
      }
    } else if (type_data->isAnalogType()) {
      firDB::firTypeAnalog* atype = dynamic_cast<firDB::firTypeAnalog*>(type_data);
      if (atype->valid_width()) {
        width = atype->width();
      }
    } else if (type_data->isClockType() || type_data->isResetType() || type_data->isAsyncResetType()) {
      width = 1;
    } else {
      fs_error("*ERROR*: The data type was not a post type at the back-end stage.\n");
      fs_assert(0);
    }
    if (width < 1) {
      fs_assert(0);
      fs_error("*ERROR*: The width of data type '%s' was less than 1 at the back-end stage.\n", type_data->toString().c_str());
    }
    return width;
  }
  bool TransferModule::getPostTypeSign(firDB::firType* type_data) {
    // true: signed; false: unsigned
    fs_assert(type_data != NULL);
    bool isSigned = false;
    if (type_data->isUIntType()) {
      isSigned = false;
    } else if (type_data->isSIntType()) {
      isSigned = true;
    } else if (type_data->isAnalogType() || type_data->isClockType() || type_data->isResetType() || type_data->isAsyncResetType()) {
      isSigned = false;
    } else {
      fs_error("*ERROR*: Failed to get the post-type sign, because the data type '%s' was not a post type at the back-end stage.\n", type_data->toString().c_str());
      return false;
    }
    return isSigned;
  }
  std::string TransferModule::getOperationInstName(MacroCellLib::ModuleType module_type) {
    std::string inst_name;
    switch (module_type) {
    case MacroCellLib::ModuleType::kTypeAddUnsigned:
      inst_name = "u_add";
      break;
    case MacroCellLib::ModuleType::kTypeAddSigned:
      inst_name = "s_add";
      break;
    case MacroCellLib::ModuleType::kTypeSubUnsigned:
      inst_name = "u_sub";
      break;
    case MacroCellLib::ModuleType::kTypeSubSigned:
      inst_name = "s_sub";
      break;
    case MacroCellLib::ModuleType::kTypeMulUnsigned:
      inst_name = "u_mul";
      break;
    case MacroCellLib::ModuleType::kTypeMulSigned:
      inst_name = "s_mul";
      break;
    case MacroCellLib::ModuleType::kTypeDivUnsigned:
      inst_name = "u_div";
      break;
    case MacroCellLib::ModuleType::kTypeDivSigned:
      inst_name = "s_div";
      break;
    case MacroCellLib::ModuleType::kTypeRemUnsigned:
      inst_name = "u_rem";
      break;
    case MacroCellLib::ModuleType::kTypeRemSigned:
      inst_name = "s_rem";
      break;
    case MacroCellLib::ModuleType::kTypeLtUnsigned:
      inst_name = "u_lt";
      break;
    case MacroCellLib::ModuleType::kTypeLtSigned:
      inst_name = "s_lt";
      break;
    case MacroCellLib::ModuleType::kTypeLeqUnsigned:
      inst_name = "u_leq";
      break;
    case MacroCellLib::ModuleType::kTypeLeqSigned:
      inst_name = "s_leq";
      break;
    case MacroCellLib::ModuleType::kTypeGtUnsigned:
      inst_name = "u_gt";
      break;
    case MacroCellLib::ModuleType::kTypeGtSigned:
      inst_name = "s_gt";
      break;
    case MacroCellLib::ModuleType::kTypeGeqUnsigned:
      inst_name = "u_geq";
      break;
    case MacroCellLib::ModuleType::kTypeGeqSigned:
      inst_name = "s_geq";
      break;
    case MacroCellLib::ModuleType::kTypeEqUnsigned:
      inst_name = "u_eq";
      break;
    case MacroCellLib::ModuleType::kTypeEqSigned:
      inst_name = "s_eq";
      break;
    case MacroCellLib::ModuleType::kTypeNeqUnsigned:
      inst_name = "u_neq";
      break;
    case MacroCellLib::ModuleType::kTypeNeqSigned:
      inst_name = "s_neq";
      break;
    case MacroCellLib::ModuleType::kTypePadUnsigned:
      inst_name = "u_pad";
      break;
    case MacroCellLib::ModuleType::kTypePadSigned:
      inst_name = "s_pad";
      break;
    case MacroCellLib::ModuleType::kTypeAsUInt:
      inst_name = "asuint";
      break;
    case MacroCellLib::ModuleType::kTypeAsSInt:
      inst_name = "assint";
      break;
    case MacroCellLib::ModuleType::kTypeShlUnsigned:
      inst_name = "u_shl";
      break;
    case MacroCellLib::ModuleType::kTypeShlSigned:
      inst_name = "s_shl";
      break;
    case MacroCellLib::ModuleType::kTypeShrUnsigned:
      inst_name = "u_shr";
      break;
    case MacroCellLib::ModuleType::kTypeShrSigned:
      inst_name = "s_shr";
      break;
    case MacroCellLib::ModuleType::kTypeDShlUnsigned:
      inst_name = "u_dshl";
      break;
    case MacroCellLib::ModuleType::kTypeDShlSigned:
      inst_name = "s_dshl";
      break;
    case MacroCellLib::ModuleType::kTypeDShrUnsigned:
      inst_name = "u_dshr";
      break;
    case MacroCellLib::ModuleType::kTypeDShrSigned:
      inst_name = "s_dshr";
      break;
    case MacroCellLib::ModuleType::kTypeCvtUnsigned:
      inst_name = "u_cvt";
      break;
    case MacroCellLib::ModuleType::kTypeCvtSigned:
      inst_name = "s_cvt";
      break;
    case MacroCellLib::ModuleType::kTypeNegUnsigned:
      inst_name = "u_neg";
      break;
    case MacroCellLib::ModuleType::kTypeNegSigned:
      inst_name = "s_neg";
      break;
    case MacroCellLib::ModuleType::kTypeBitwiseNot:
      inst_name = "bitwisenot";
      break;
    case MacroCellLib::ModuleType::kTypeBitwiseAnd:
      inst_name = "bitwiseand";
      break;
    case MacroCellLib::ModuleType::kTypeBitwiseOr:
      inst_name = "bitwiseor";
      break;
    case MacroCellLib::ModuleType::kTypeBitwiseXor:
      inst_name = "bitwisexor";
      break;
    case MacroCellLib::ModuleType::kTypeAndr:
      inst_name = "andr";
      break;
    case MacroCellLib::ModuleType::kTypeOrr:
      inst_name = "orr";
      break;
    case MacroCellLib::ModuleType::kTypeXorr:
      inst_name = "xorr";
      break;
    case MacroCellLib::ModuleType::kTypeCat:
      inst_name = "cat";
      break;
    case MacroCellLib::ModuleType::kTypeBits:
      inst_name = "bits";
      break;
    case MacroCellLib::ModuleType::kTypeHead:
      inst_name = "head";
      break;
    case MacroCellLib::ModuleType::kTypeTail:
      inst_name = "tail";
      break;
    case MacroCellLib::ModuleType::kTypeDffPosClk:
      inst_name = "dff_posclk";
      break;
    case MacroCellLib::ModuleType::kTypeDffNegClk:
      inst_name = "dff_negclk";
      break;
    case MacroCellLib::ModuleType::kTypeDffPosClkPosAsyncRst:
      inst_name = "dff_posclk_posasyncrst";
      break;
    case MacroCellLib::ModuleType::kTypeDffPosClkNegAsyncRst:
      inst_name = "dff_posclk_negasyncrst";
      break;
    case MacroCellLib::ModuleType::kTypeDffNegClkPosAsyncRst:
      inst_name = "dff_negclk_posasyncrst";
      break;
    case MacroCellLib::ModuleType::kTypeDffNegClkNegAsyncRst:
      inst_name = "dff_negclk_negasyncrst";
      break;
    case MacroCellLib::ModuleType::kTypeMuxUnsigned:
      inst_name = "u_mux";
      break;
    case MacroCellLib::ModuleType::kTypeMuxSigned:
      inst_name = "s_mux";
      break;
    case MacroCellLib::ModuleType::kTypeRomMem:
      inst_name = "rommem";
      break;
    case MacroCellLib::ModuleType::kTypeRamMem:
      inst_name = "rammem";
      break;
    case MacroCellLib::ModuleType::kTypeMRRomMem:
      inst_name = "mrrommem";
      break;
    case MacroCellLib::ModuleType::kTypeMRMWMem:
      inst_name = "mrmwmem";
      break;
    case MacroCellLib::ModuleType::kTypeUndef:
      fs_assert(0);
      break;
    default: {
      break;
      return "";
    }
    }
    long long unsigned gate_num = this->getPrimInstNum();
    inst_name += "_" + std::to_string(gate_num);
    return inst_name;
  }
  bool TransferModule::transferRightExpression(IdDef* left_id_def, firDB::firExp* exp) {
    fs_assert(left_id_def != NULL);
    fs_assert(exp != NULL);
    if (exp->isNumberExpression()) {
      if (!generateConstValAssign(left_id_def, exp)) {
        fs_assert(0);
        return false;
      }
    } else if(exp->isReferenceExpression() || exp->isSubfieldExpression()) {
      IdDef* right_id_def = getIdExpressionIdDef(exp);
      if (!generateIdDefAssign(left_id_def, right_id_def)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isOperationExpression()) {
      if (!generateOperationInst(left_id_def, exp)) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferModule::assignToRegisterMuxPortB(IdDef* net_b_def, firDB::firExp* exp) {
    fs_assert(net_b_def != NULL);
    fs_assert(exp != NULL);
    int net_b_width = 1;
    Range* net_b_range = net_b_def->getRange();
    if (net_b_range != NULL) {
      net_b_width = net_b_range->rangeWidth();
    }
    firDB::firType* exp_type = exp->getTypeData(this->getFirrtlModule());
    fs_assert(exp_type != NULL);
    int exp_width = getPostTypeWidth(exp_type);
    bool is_signed = net_b_def->isSigned();
    if (net_b_width == exp_width) {
      if (!transferRightExpression(net_b_def, exp)) {
        fs_assert(0);
        return false;
      }
    } else if (net_b_width > exp_width) {
      if (exp->isOperationExpression()) {
        std::string right_net_id = getTempWireId();
        IdDef* right_net_def = generateNetDecl(right_net_id, exp_width, is_signed);
        fs_assert(right_net_def != NULL);
        if (!transferRightExpression(right_net_def, exp)) {
          fs_assert(0);
          return false;
        }
        padToOutputWidth(net_b_def, right_net_def, net_b_width);
      } else {
        if (is_signed) {
          generateSignedPadInst(net_b_def, exp, net_b_width);
        } else {
          generateUnsignedPadInst(net_b_def, exp, net_b_width);
        }
      }
    } else if (net_b_width < exp_width) {
      unsigned int bits_hi = net_b_width - 1;
      unsigned int bits_lo = 0;
      if (exp->isOperationExpression()) {
        std::string right_net_id = getTempWireId();
        IdDef* right_net_def = generateNetDecl(right_net_id, exp_width, is_signed);
        fs_assert(right_net_def != NULL);
        if (!transferRightExpression(right_net_def, exp)) {
          fs_assert(0);
          return false;
        }
        bitsToOutputWidth(net_b_def, right_net_def, bits_hi, bits_lo);
      } else {
        if (is_signed) {
          std::string bits_y_id = getTempWireId();
          IdDef* bits_id_def = generateNetDecl(bits_y_id, net_b_width, is_signed);
          fs_assert(bits_id_def != NULL);
          generateBitsInst(bits_id_def, exp, bits_hi, bits_lo);
          addAsSIntInst(net_b_def, bits_id_def);
        } else {
          generateBitsInst(net_b_def, exp, bits_hi, bits_lo);
        }
      }
    }
    return true;
  }
  bool TransferModule::generateConstValAssign(IdDef* left_id_def, firDB::firExp* exp) {
    fs_assert(left_id_def != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(this->getFirrtlModule(), NULL);
    fs_assert(exp_type);
    int output_width = 1;
    Range* output_range = left_id_def->getRange();
    if (output_range != NULL) {
      output_width = output_range->rangeWidth();
    }
    int input_width = getPostTypeWidth(exp_type);
    if (input_width > output_width) {
      unsigned int hi = output_width - 1;
      unsigned int lo = 0;
      if (left_id_def->isSigned()) {
        std::string bits_output_id = getTempWireId();
        IdDef* bits_output_def = generateNetDecl(bits_output_id, output_width, false);
        generateBitsInst(bits_output_def, exp, hi, lo);
        addAsSIntInst(left_id_def, bits_output_def);
      } else {
        generateBitsInst(left_id_def, exp, hi, lo);
      }
      //generateBitsInst(left_id, exp, hi, lo);
    } else if (input_width < output_width) {
      bool is_signed = getPostTypeSign(exp_type);
      if (is_signed) {
        generateSignedPadInst(left_id_def, exp, output_width);
      } else {
        generateUnsignedPadInst(left_id_def, exp, output_width);
      }
    } else {
      BlockingAssign* block_assign = getVerilogModule()->addBlockAssign();
      block_assign->setLeftValue(left_id_def->getName(), left_id_def);
      char sign = ' ';
      unsigned int size = 0;
      bool is_signed = false;
      std::string value = "";
      if (!analyzeNumExpression(exp, sign, size, is_signed, value)) {
        fs_error("*ERROR*: Illegal num expression '%s'.\n", exp->toString().c_str());
        fs_assert(0);
        return false;
      } else {
        block_assign->setRightValue(sign, size, is_signed, value);
      }
    }
    return true;
  }
  bool TransferModule::generateIdDefAssign(IdDef* left_id_def, IdDef* right_id_def) {
    fs_assert(left_id_def != NULL);
    fs_assert(right_id_def != NULL);
    int left_width = 1;
    Range* left_range = left_id_def->getRange();
    if (left_range != NULL) {
      left_width = left_range->rangeWidth();
    }
    int right_width = 1;
    Range* right_range = right_id_def->getRange();
    if (right_range != NULL) {
      right_width = right_range->rangeWidth();
    }
    if (left_width > right_width) {
      padToOutputWidth(left_id_def, right_id_def, left_width);
    } else if (left_width < right_width) {
      unsigned int hi = left_width - 1;
      unsigned int lo = 0;
      if (left_id_def->isSigned()) {
        std::string bits_output_id = getTempWireId();
        IdDef* bits_output_def = generateNetDecl(bits_output_id, left_width, false);
        bitsToOutputWidth(bits_output_def, right_id_def, hi, lo);
        addAsSIntInst(left_id_def, bits_output_def);
      } else {
        bitsToOutputWidth(left_id_def, right_id_def, hi, lo);
      }
    } else {
      std::string lval_id = left_id_def->getName();
      std::string rval_id = right_id_def->getName();
      BlockingAssign* block_assign = getVerilogModule()->addBlockAssign();
      block_assign->setLeftValue(lval_id, left_id_def);
      block_assign->setRightValue(rval_id, right_id_def);
    }
    return true;
  }
  IdDef* TransferModule::generateNetDecl(const std::string& name, firDB::firType* type_data) {
    fs_assert(type_data != NULL);
    int width = getPostTypeWidth(type_data);
    bool is_signed = getPostTypeSign(type_data);
    IdDef* net_id_def = NULL;
    if (width > 1) {
      int range_left = width - 1;
      int range_right = 0;
      net_id_def = getVerilogModule()->addNet(name, range_left, range_right);
    } else {
      net_id_def = getVerilogModule()->addNet(name);
    }
    BaseDataType* data_type = net_id_def->getDataType();
    data_type->setSigned(is_signed);
    return net_id_def;
  }
  IdDef* TransferModule::generateNetDecl(const std::string& name, int width, bool is_signed) {
    IdDef* net_id_def = NULL;
    if (width > 1) {
      int range_left = width - 1;
      int range_right = 0;
      net_id_def = getVerilogModule()->addNet(name, range_left, range_right);
    } else {
      net_id_def = getVerilogModule()->addNet(name);
    }
    BaseDataType* data_type = net_id_def->getDataType();
    data_type->setSigned(is_signed);
    return net_id_def;
  }
  bool TransferModule::generateNumExpConnection(PortConnect* port_connect, firDB::firExp* exp) {
    fs_assert(port_connect != NULL);
    fs_assert(exp != NULL);
    fs_assert(exp->isNumberExpression());
    char sign = ' ';
    unsigned int size = 0;
    bool is_signed = false;
    std::string value = "";
    if (!analyzeNumExpression(exp, sign, size, is_signed, value)) {
      fs_error("*ERROR*: Illegal num expression '%s'.\n", exp->toString().c_str());
      fs_assert(0);
      return false;
    }
    port_connect->setConnection(sign, size, is_signed, value);
    return true;
  }
  IdDef* TransferModule::getIdExpressionIdDef(firDB::firExp* exp) {
    fs_assert(exp != NULL);
    if (exp->isReferenceExpression()) {
      return getReferenceIdDef(dynamic_cast<firDB::firExpRef*>(exp));
    } else if (exp->isSubfieldExpression()) {
      return getSubfieldIdDef(dynamic_cast<firDB::firExpSubfield*>(exp));
    } else {
      fs_assert(0);
      return NULL;
    }
  }
  IdDef* TransferModule::getReferenceIdDef(firDB::firExpRef* exp) {
    fs_assert(exp != NULL);
    std::string rval_id = getWriteId(dynamic_cast<firDB::firExpRef*>(exp)->id(), getFirrtlModule());
    IdDef* rval_id_def = getVerilogModule()->findDeclared(rval_id);
    if (rval_id_def == NULL) {
      fs_error("*ERROR*: Id '%s' is undefined.\n", rval_id.c_str());
      return NULL;
    }
    return rval_id_def;
  }
  IdDef* TransferModule::getSubfieldIdDef(firDB::firExpSubfield* exp) {
    firDB::firExp* subfield_exp = exp->exp();
    firDB::firItem* item = getFirrtlModule()->findItemByExpression(exp);
    if (item == NULL) {
      fs_error("*ERROR*: Could not find an item with expression '%s' in module '%s'.\n", exp->toString().c_str(), getFirrtlModule()->id().c_str());
      return NULL;
    }
    if (subfield_exp->isReferenceExpression()) {
      firDB::firExpRef* reference = dynamic_cast<firDB::firExpRef*>(subfield_exp);
      if (item->isRegisterItem()) {
        std::string dff_inst_id = getWriteId(reference->id(), getFirrtlModule());
        std::string port_id = exp->id();
        std::string net_id = getDffPortId(dff_inst_id, port_id);
        IdDef* net_id_def = getVerilogModule()->findDeclared(net_id);
        fs_assert(net_id_def != NULL);
        fs_assert(net_id_def->isNet());
        return net_id_def;
      } else if (item->isInstanceItem()) {
        std::string inst_id = getWriteId(reference->id(), getFirrtlModule());
        std::string port_id = getWriteId(exp->id(), getFirrtlModule());
        std::string inst_port_id = getInstPortId(inst_id, port_id);
        IdDef* net_id_def = getVerilogModule()->findDeclared(inst_port_id);
        fs_assert(net_id_def != NULL);
        fs_assert(net_id_def->isNet());
        return net_id_def;
      } else {
        fs_assert(0);
        return NULL;
      }
    } else if (subfield_exp->isSubfieldExpression()) {
      firDB::firExpSubfield* subfield_subfieldexp = dynamic_cast<firDB::firExpSubfield*>(subfield_exp);
      std::string port_id = getWriteId(exp->id(), getFirrtlModule());
      std::string mport_id = subfield_subfieldexp->id();
      firDB::firExp* mem_exp = subfield_subfieldexp->exp();
      if (mem_exp->isReferenceExpression()) {
        std::string mem_id = dynamic_cast<firDB::firExpRef*>(mem_exp)->id();
        if (!item->isMemoryItem()) {
          fs_error("*ERROR*: The item '%s' was expected to be a memory in module '%s', but it was not.\n", mem_id.c_str(), getFirrtlModule()->id().c_str());
          return NULL;
        } else {
          firDB::firItemMemory* item_mem = dynamic_cast<firDB::firItemMemory*>(item);
          if (!item_mem->hasPort(mport_id)) {
            fs_error("*ERROR*: Could not find an MPort named '%s' in memory '%s' in module '%s'.\n", mport_id.c_str(), item_mem->id().c_str(), getFirrtlModule()->id().c_str());
            return NULL;
          }
        }
        std::string mem_id_to_write = getWriteId(mem_id, getFirrtlModule());
        std::string mport_id_to_write = getWriteId(mport_id, getFirrtlModule());
        std::string pin_id_to_write = getWriteId(port_id, getFirrtlModule());
        std::string net_id_to_write = getMemoryPinId(mem_id_to_write, mport_id_to_write, pin_id_to_write);
        IdDef* net_id = getVerilogModule()->findDeclared(net_id_to_write);
        fs_assert(net_id != NULL);
        fs_assert(net_id->isNet());
        return net_id;
      } else {
        fs_error("*ERROR*: The ID '%s' was expected to refer to a memory but it was invalid for writing Verilog.\n", exp->toString().c_str());
        return NULL;
      }
    } else {
      fs_error("*ERROR*: The ID '%s' was expected to refer to a memory but it was invalid for writing Verilog.\n", exp->toString().c_str());
      return NULL;
    }
  }
  bool TransferModule::generateOperationInst(IdDef* left_id_def, firDB::firExp* exp) {
    fs_assert(exp->isOperationExpression());
    if (exp->isMuxExpression()) {
      firDB::firExpMux* mux = dynamic_cast<firDB::firExpMux*>(exp);
      if (!generateMuxInst(left_id_def, mux)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isValidifExpression()) {
      firDB::firExpValidif* validif = dynamic_cast<firDB::firExpValidif*>(exp);
      if (!generateValidifAssign(left_id_def, validif)) {
        fs_assert(0);
        return false;
      }
    } else if (exp->isPrimOperationExpression()) {
      firDB::firExpPrimOperation* prim_op = dynamic_cast<firDB::firExpPrimOperation*>(exp);
      if (!generatePrimOpInst(left_id_def, prim_op)) {
        fs_assert(0);
        return false;
      }
    } else {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferModule::generateMuxInst(IdDef* port_y_net, firDB::firExpMux* mux) {
    fs_assert(port_y_net != NULL);
    fs_assert(mux != NULL);
    firDB::firModule* fir_module = this->getFirrtlModule();
    firDB::firExp* sel = mux->sel();
    firDB::firExp* input1 = mux->input1();
    firDB::firExp* input2 = mux->input2();
    firDB::firType* mux_type = mux->getTypeData(fir_module, NULL);
    int width = getPostTypeWidth(mux_type);
    IdDef* mux_output_def = alignToOutputWidth(port_y_net, width);
    fs_assert(mux_output_def != NULL);
    firDB::firType* exp1_type = input1->getTypeData(fir_module, NULL);
    firDB::firType* exp2_type = input2->getTypeData(fir_module, NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int type1_width = getPostTypeWidth(exp1_type);
    int type2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1 = NULL;
    IdDef* align_exp2 = NULL;
    if (type1_width > type2_width) {
      align_exp2 = alignWidthToMax(input2, type1_width);
    } else if (type2_width > type1_width) {
      align_exp1 = alignWidthToMax(input1, type2_width);
    }
    ExternModule* mux_module = NULL;
    std::string inst_name;
    std::string param_width_id;
    std::string port_y_id;
    std::string port_sel_id;
    std::string port_a_id;
    std::string port_b_id;
    if (mux_type->isSIntType()) {
      mux_module = this->getMacroCellLib()->addCellMuxSigned("");
      inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeMuxSigned);
      param_width_id = MacroCellLib::getMuxSignedParamWidth();
      port_y_id = MacroCellLib::getMuxSignedPortY();
      port_sel_id = MacroCellLib::getMuxSignedPortSel();
      port_a_id = MacroCellLib::getMuxSignedPortA();
      port_b_id = MacroCellLib::getMuxSignedPortB();
    } else {
      mux_module = this->getMacroCellLib()->addCellMuxUnsigned("");
      inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeMuxUnsigned);
      param_width_id = MacroCellLib::getMuxUnsignedParamWidth();
      port_y_id = MacroCellLib::getMuxUnsignedPortY();
      port_sel_id = MacroCellLib::getMuxUnsignedPortSel();
      port_a_id = MacroCellLib::getMuxUnsignedPortA();
      port_b_id = MacroCellLib::getMuxUnsignedPortB();
    }
    ModuleInstantiation* mux_instantiation = this->getVerilogModule()->addInstance(inst_name, mux_module->getName());
    fs_assert(mux_instantiation != NULL);
    PortConnect* width_connect = mux_instantiation->addParamValue(param_width_id);
    width_connect->setConnection(width);
    IdDef* inst_def = mux_instantiation->getInstance();
    PortConnect* y_connect = inst_def->addPortConnect(port_y_id);
    y_connect->setConnection(mux_output_def->getName());
    generatePortConnect(inst_def, port_sel_id, NULL, sel);
    generatePortConnect(inst_def, port_a_id, align_exp1, input1);
    generatePortConnect(inst_def, port_b_id, align_exp2, input2);
    return true;
  }
  bool TransferModule::generateValidifAssign(IdDef* port_y_net, firDB::firExpValidif* validif) {
    fs_assert(port_y_net != NULL);
    fs_assert(validif != NULL);
    firDB::firExp* valid = validif->valid();
    firDB::firExp* validif_exp = validif->exp();
    firDB::firType* valid_type = valid->getTypeData(this->getFirrtlModule(), NULL);
    fs_assert(valid_type != NULL);
    bool valid_is_signed = getPostTypeSign(valid_type);
    int valid_width = getPostTypeWidth(valid_type);
    if (valid_is_signed) {
      fs_error("*ERROR*: The type of the valid condition was not 'UInt' in operation '%s'.\n", validif->toString().c_str());
      return false;
    }
    if (valid_width != 1) {
      fs_error("*ERROR*: The width (%u) of the valid condition was not 1 in operation '%s'.\n", valid_width, validif->toString().c_str());
      return false;
    }
    firDB::firType* validif_type = validif->getTypeData(this->getFirrtlModule(), NULL);
    fs_assert(validif_type != NULL);
    int validif_width = getPostTypeWidth(validif_type);
    int output_width = 1;
    Range* output_range = port_y_net->getRange();
    if (output_range != NULL) {
      output_width = output_range->rangeWidth();
    }
    if (output_width > validif_width) {
      bool is_signed = getPostTypeSign(validif_type);
      if (is_signed) {
        generateSignedPadInst(port_y_net, validif_exp, output_width);
      } else {
        generateUnsignedPadInst(port_y_net, validif_exp, output_width);
      }
    } else if (output_width < validif_width) {
      unsigned int hi = output_width - 1;
      unsigned int lo = 0;
      generateBitsInst(port_y_net, validif_exp, hi, lo);
    } else {
      if (validif_exp->isNumberExpression()) {
        BlockingAssign* assign = this->getVerilogModule()->addBlockAssign();
        assign->setLeftValue(port_y_net->getName(), port_y_net);
        char sign = ' ';
        unsigned int size = 0;
        bool is_signed = false;
        std::string value = "";
        if (!analyzeNumExpression(validif_exp, sign, size, is_signed, value)) {
          fs_error("*ERROR*: Illegal num expression '%s'.\n", validif_exp->toString().c_str());
          fs_assert(0);
          return false;
        }
        assign->setRightValue(sign, size, is_signed, value);
      } else if (validif_exp->isIdExpression()) {
        BlockingAssign* assign = this->getVerilogModule()->addBlockAssign();
        assign->setLeftValue(port_y_net->getName(), port_y_net);
        IdDef* validif_exp_def = getIdExpressionIdDef(validif_exp);
        assign->setRightValue(validif_exp_def->getName());
      } else {
        fs_error("*ERROR*: Illegal expression '%s' of validif '%s'.\n", validif_exp->toString().c_str(), validif->toString().c_str());
        return false;
      }
    }
    return true;
  }
  bool TransferModule::generatePrimOpInst(IdDef* port_y_net, firDB::firExpPrimOperation* prim_op) {
    fs_assert(prim_op != NULL);
    firDB::firModule* fir_module = this->getFirrtlModule();
    fs_assert(fir_module != NULL);
    switch (prim_op->operator_type()) {
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAdd: {
      firDB::firExpPrimOperation::firAdd* prim_add = dynamic_cast<firDB::firExpPrimOperation::firAdd*>(prim_op);
      firDB::firType* add_type = prim_add->getTypeData(fir_module, NULL);
      fs_assert(add_type != NULL);
      bool is_signed = getPostTypeSign(add_type);
      firDB::firExp* exp1 = prim_add->exp1();
      firDB::firExp* exp2 = prim_add->exp2();
      if (is_signed) {
        generateSignedAddInst(port_y_net, exp1, exp2);
      } else {
        generateUnsignedAddInst(port_y_net, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeSub: {
      firDB::firExpPrimOperation::firSub* prim_sub = dynamic_cast<firDB::firExpPrimOperation::firSub*>(prim_op);
      firDB::firType* sub_type = prim_sub->getTypeData(fir_module, NULL);
      fs_assert(sub_type != NULL);
      bool is_signed = getPostTypeSign(sub_type);
      firDB::firExp* exp1 = prim_sub->exp1();
      firDB::firExp* exp2 = prim_sub->exp2();
      if (is_signed) {
        generateSignedSubInst(port_y_net, exp1, exp2);
      } else {
        generateUnsignedSubInst(port_y_net, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeMul: {
      firDB::firExpPrimOperation::firMul* prim_mul = dynamic_cast<firDB::firExpPrimOperation::firMul*>(prim_op);
      firDB::firType* mul_type = prim_mul->getTypeData(fir_module, NULL);
      fs_assert(mul_type != NULL);
      bool is_signed = getPostTypeSign(mul_type);
      firDB::firExp* exp1 = prim_mul->exp1();
      firDB::firExp* exp2 = prim_mul->exp2();
      firDB::firExp* exp1_value = exp1->getExpVal(fir_module, NULL);
      firDB::firExp* exp2_value = exp2->getExpVal(fir_module, NULL);
      if (is_signed) {
        if ((exp1_value && !exp2_value) || (!exp1_value && exp2_value)) {
          int mul_width = getPostTypeWidth(mul_type);
          IdDef* output_def = alignToOutputWidth(port_y_net, mul_width);
          generateSignedMulInst(output_def, exp1, exp2);
        } else {
          generateSignedMulInst(port_y_net, exp1, exp2);
        }
      } else {
        if ((exp1_value && !exp2_value) || (!exp1_value && exp2_value)) {
          int mul_width = getPostTypeWidth(mul_type);
          IdDef* output_def = alignToOutputWidth(port_y_net, mul_width);
          generateUnsignedMulInst(output_def, exp1, exp2);
        } else {
          generateUnsignedMulInst(port_y_net, exp1, exp2);
        }
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDiv: {
      firDB::firExpPrimOperation::firDiv* prim_div = dynamic_cast<firDB::firExpPrimOperation::firDiv*>(prim_op);
      firDB::firType* div_type = prim_div->getTypeData(fir_module, NULL);
      fs_assert(div_type != NULL);
      bool is_signed = getPostTypeSign(div_type);
      firDB::firExp* num = prim_div->num();
      firDB::firExp* den = prim_div->den();
      if (is_signed) {
        generateSignedDivInst(port_y_net, num, den);
      } else {
        generateUnsignedDivInst(port_y_net, num, den);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeMod: {
      firDB::firExpPrimOperation::firMod* prim_mod = dynamic_cast<firDB::firExpPrimOperation::firMod*>(prim_op);
      firDB::firType* mod_type = prim_mod->getTypeData(fir_module, NULL);
      fs_assert(mod_type != NULL);
      bool is_signed = getPostTypeSign(mod_type);
      firDB::firExp* num = prim_mod->num();
      firDB::firExp* den = prim_mod->den();
      if (is_signed) {
        generateSignedModInst(port_y_net, num, den);
      } else {
        generateUnsignedModInst(port_y_net, num, den);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeLt: {
      firDB::firExpPrimOperation::firLt* prim_lt = dynamic_cast<firDB::firExpPrimOperation::firLt*>(prim_op);
      firDB::firType* lt_type = prim_lt->getTypeData(fir_module, NULL);
      fs_assert(lt_type != NULL);
      int lt_width = getPostTypeWidth(lt_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, lt_width);
      firDB::firExp* exp1 = prim_lt->exp1();
      firDB::firExp* exp2 = prim_lt->exp2();
      firDB::firType* lt_module_type = exp1->getTypeData(fir_module, NULL);
      fs_assert(lt_module_type != NULL);
      bool lt_is_signed = getPostTypeSign(lt_module_type);
      if (lt_is_signed) {
        generateSignedLtInst(output_def, exp1, exp2);
      } else {
        generateUnsignedLtInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeLeq: {
      firDB::firExpPrimOperation::firLeq* prim_leq = dynamic_cast<firDB::firExpPrimOperation::firLeq*>(prim_op);
      firDB::firType* leq_type = prim_leq->getTypeData(fir_module, NULL);
      fs_assert(leq_type != NULL);
      int leq_width = getPostTypeWidth(leq_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, leq_width);
      firDB::firExp* exp1 = prim_leq->exp1();
      firDB::firExp* exp2 = prim_leq->exp2();
      firDB::firType* leq_module_type = exp1->getTypeData(fir_module, NULL);
      fs_assert(leq_module_type != NULL);
      bool leq_is_signed = getPostTypeSign(leq_module_type);
      if (leq_is_signed) {
        generateSignedLeqInst(output_def, exp1, exp2);
      } else {
        generateUnsignedLeqInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeGt: {
      firDB::firExpPrimOperation::firGt* prim_gt = dynamic_cast<firDB::firExpPrimOperation::firGt*>(prim_op);
      firDB::firType* gt_type = prim_gt->getTypeData(fir_module, NULL);
      fs_assert(gt_type != NULL);
      int gt_width = getPostTypeWidth(gt_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, gt_width);
      firDB::firExp* exp1 = prim_gt->exp1();
      firDB::firExp* exp2 = prim_gt->exp2();
      firDB::firType* gt_module_type = exp1->getTypeData(fir_module, NULL);
      fs_assert(gt_module_type != NULL);
      bool gt_is_signed = getPostTypeSign(gt_module_type);
      if (gt_is_signed) {
        generateSignedGtInst(output_def, exp1, exp2);
      } else {
        generateUnsignedGtInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeGeq: {
      firDB::firExpPrimOperation::firGeq* prim_geq = dynamic_cast<firDB::firExpPrimOperation::firGeq*>(prim_op);
      firDB::firType* geq_type = prim_geq->getTypeData(fir_module, NULL);
      fs_assert(geq_type != NULL);
      int geq_width = getPostTypeWidth(geq_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, geq_width);
      firDB::firExp* exp1 = prim_geq->exp1();
      firDB::firExp* exp2 = prim_geq->exp2();
      firDB::firType* geq_module_type = exp1->getTypeData(fir_module, NULL);
      fs_assert(geq_module_type != NULL);
      bool geq_is_signed = getPostTypeSign(geq_module_type);
      if (geq_is_signed) {
        generateSignedGeqInst(output_def, exp1, exp2);
      } else {
        generateUnsignedGeqInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeEq: {
      firDB::firExpPrimOperation::firEq* prim_eq = dynamic_cast<firDB::firExpPrimOperation::firEq*>(prim_op);
      firDB::firType* eq_type = prim_eq->getTypeData(fir_module, NULL);
      fs_assert(eq_type != NULL);
      int eq_width = getPostTypeWidth(eq_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, eq_width);
      firDB::firExp* exp1 = prim_eq->exp1();
      firDB::firExp* exp2 = prim_eq->exp2();
      firDB::firType* eq_module_type = exp1->getTypeData(fir_module, NULL);
      fs_assert(eq_module_type != NULL);
      bool eq_is_signed = getPostTypeSign(eq_module_type);
      if (eq_is_signed) {
        generateSignedEqInst(output_def, exp1, exp2);
      } else {
        generateUnsignedEqInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNeq: {
      firDB::firExpPrimOperation::firNeq* prim_neq = dynamic_cast<firDB::firExpPrimOperation::firNeq*>(prim_op);
      firDB::firType* neq_type = prim_neq->getTypeData(fir_module, NULL);
      fs_assert(neq_type != NULL);
      int neq_width = getPostTypeWidth(neq_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, neq_width);
      firDB::firExp* exp1 = prim_neq->exp1();
      firDB::firExp* exp2 = prim_neq->exp2();
      firDB::firType* neq_module_type = exp1->getTypeData(fir_module, NULL);
      fs_assert(neq_module_type != NULL);
      bool neq_is_signed = getPostTypeSign(neq_module_type);
      if (neq_is_signed) {
        generateSignedNeqInst(output_def, exp1, exp2);
      } else {
        generateUnsignedNeqInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypePad: {
      firDB::firExpPrimOperation::firPad* prim_pad = dynamic_cast<firDB::firExpPrimOperation::firPad*>(prim_op);
      firDB::firType* pad_type = prim_pad->getTypeData(fir_module, NULL);
      fs_assert(pad_type != NULL);
      int pad_width = getPostTypeWidth(pad_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, pad_width);
      bool is_signed = getPostTypeSign(pad_type);
      firDB::firExp* exp = prim_pad->exp();
      unsigned int n = prim_pad->n();
      if (is_signed) {
        generateSignedPadInst(output_def, exp, n);
      } else {
        generateUnsignedPadInst(output_def, exp, n);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsUInt: {
      firDB::firExpPrimOperation::firAsUInt* asuint = dynamic_cast<firDB::firExpPrimOperation::firAsUInt*>(prim_op);
      firDB::firType* asuint_type = asuint->getTypeData(fir_module, NULL);
      fs_assert(asuint_type != NULL);
      int asuint_width = getPostTypeWidth(asuint_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, asuint_width);
      firDB::firExp* exp = asuint->exp();
      generateAsUIntInst(output_def, exp);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsSInt: {
      firDB::firExpPrimOperation::firAsSInt* assint = dynamic_cast<firDB::firExpPrimOperation::firAsSInt*>(prim_op);
      firDB::firType* assint_type = assint->getTypeData(fir_module, NULL);
      fs_assert(assint_type != NULL);
      int assint_width = getPostTypeWidth(assint_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, assint_width);
      firDB::firExp* exp = assint->exp();
      generateAsSIntInst(output_def, exp);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsClock: {
      firDB::firExp* asclock_exp = dynamic_cast<firDB::firExpPrimOperation::firAsClock*>(prim_op)->exp();
      if (!transferRightExpression(port_y_net, asclock_exp)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAsAsyncReset: {
      firDB::firExp* asasyncreset_exp = dynamic_cast<firDB::firExpPrimOperation::firAsAsyncReset*>(prim_op)->exp();
      if (!transferRightExpression(port_y_net, asasyncreset_exp)) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeShl: {
      firDB::firExpPrimOperation::firShl* prim_shl = dynamic_cast<firDB::firExpPrimOperation::firShl*>(prim_op);
      firDB::firType* shl_type = prim_shl->getTypeData(fir_module, NULL);
      fs_assert(shl_type != NULL);
      bool is_signed = getPostTypeSign(shl_type);
      int shl_width = getPostTypeWidth(shl_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, shl_width);
      firDB::firExp* exp = prim_shl->exp();
      unsigned int n = prim_shl->n();
      if (is_signed) {
        generateSignedShlInst(output_def, exp, n);
      } else {
        generateUnsignedShlInst(output_def, exp, n);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeShr: {
      firDB::firExpPrimOperation::firShr* prim_shr = dynamic_cast<firDB::firExpPrimOperation::firShr*>(prim_op);
      firDB::firType* shr_type = prim_shr->getTypeData(fir_module, NULL);
      fs_assert(shr_type != NULL);
      bool is_signed = getPostTypeSign(shr_type);
      int shr_width = getPostTypeWidth(shr_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, shr_width);
      firDB::firExp* exp = prim_shr->exp();
      unsigned int n = prim_shr->n();
      if (is_signed) {
        generateSignedShrInst(output_def, exp, n);
      } else {
        generateUnsignedShrInst(output_def, exp, n);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDshl: {
      firDB::firExpPrimOperation::firDshl* prim_dshl = dynamic_cast<firDB::firExpPrimOperation::firDshl*>(prim_op);
      firDB::firExp* exp1 = prim_dshl->exp1();
      firDB::firExp* exp2 = prim_dshl->exp2();
      firDB::firType* dshl_type = prim_dshl->getTypeData(fir_module, NULL);
      fs_assert(dshl_type != NULL);
      int dshl_width = getPostTypeWidth(dshl_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, dshl_width);
      bool is_signed = getPostTypeSign(dshl_type);
      if (is_signed) {
        generateSignedDshlInst(output_def, exp1, exp2);
      } else {
        generateUnsignedDshlInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeDshr: {
      firDB::firExpPrimOperation::firDshr* prim_dshr = dynamic_cast<firDB::firExpPrimOperation::firDshr*>(prim_op);
      firDB::firExp* exp1 = prim_dshr->exp1();
      firDB::firExp* exp2 = prim_dshr->exp2();
      firDB::firType* dshr_type = prim_dshr->getTypeData(fir_module, NULL);
      fs_assert(dshr_type != NULL);
      int dshr_width = getPostTypeWidth(dshr_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, dshr_width);
      bool is_signed = getPostTypeSign(dshr_type);
      if (is_signed) {
        generateSignedDshrInst(output_def, exp1, exp2);
      } else {
        generateUnsignedDshrInst(output_def, exp1, exp2);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeCvt: {
      firDB::firExpPrimOperation::firCvt* prim_cvt = dynamic_cast<firDB::firExpPrimOperation::firCvt*>(prim_op);
      firDB::firType* cvt_type = prim_cvt->getTypeData(fir_module, NULL);
      fs_assert(cvt_type != NULL);
      int cvt_width = getPostTypeWidth(cvt_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, cvt_width);
      firDB::firExp* exp = prim_cvt->exp();
      firDB::firType* exp_type = exp->getTypeData(fir_module, NULL);
      fs_assert(exp_type != NULL);
      bool exp_is_signed = getPostTypeSign(exp_type);
      if (exp_is_signed) {
        generateSignedCvtInst(output_def, exp);
      } else {
        generateUnsignedCvtInst(output_def, exp);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNeg: {
      firDB::firExpPrimOperation::firNeg* prim_neg = dynamic_cast<firDB::firExpPrimOperation::firNeg*>(prim_op);
      firDB::firType* neg_type = prim_neg->getTypeData(fir_module, NULL);
      fs_assert(neg_type != NULL);
      int neg_width = getPostTypeWidth(neg_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, neg_width);
      firDB::firExp* exp = prim_neg->exp();
      firDB::firType* exp_type = exp->getTypeData(fir_module, NULL);
      fs_assert(exp_type != NULL);
      bool exp_is_signed = getPostTypeSign(exp_type);
      if (exp_is_signed) {
        generateSignedNegInst(output_def, exp);
      } else {
        generateUnsignedNegInst(output_def, exp);
      }
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeNot: {
      firDB::firExpPrimOperation::firNot* prim_not = dynamic_cast<firDB::firExpPrimOperation::firNot*>(prim_op);
      firDB::firType* not_type = prim_not->getTypeData(fir_module, NULL);
      fs_assert(not_type != NULL);
      int not_width = getPostTypeWidth(not_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, not_width);
      firDB::firExp* exp = prim_not->exp();
      generateNotInst(output_def, exp);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAnd: {
      firDB::firExpPrimOperation::firAnd* prim_and = dynamic_cast<firDB::firExpPrimOperation::firAnd*>(prim_op);
      firDB::firExp* exp1 = prim_and->exp1();
      firDB::firExp* exp2 = prim_and->exp2();
      generateAndInst(port_y_net, exp1, exp2);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeOr: {
      firDB::firExpPrimOperation::firOr* prim_or = dynamic_cast<firDB::firExpPrimOperation::firOr*>(prim_op);
      firDB::firExp* exp1 = prim_or->exp1();
      firDB::firExp* exp2 = prim_or->exp2();
      generateOrInst(port_y_net, exp1, exp2);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeXor: {
      firDB::firExpPrimOperation::firXor* prim_xor = dynamic_cast<firDB::firExpPrimOperation::firXor*>(prim_op);
      firDB::firExp* exp1 = prim_xor->exp1();
      firDB::firExp* exp2 = prim_xor->exp2();
      generateXorInst(port_y_net, exp1, exp2);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeAndr: {
      firDB::firExpPrimOperation::firAndr* prim_andr = dynamic_cast<firDB::firExpPrimOperation::firAndr*>(prim_op);
      firDB::firType* andr_type = prim_andr->getTypeData(fir_module, NULL);
      fs_assert(andr_type != NULL);
      int andr_width = getPostTypeWidth(andr_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, andr_width);
      firDB::firExp* exp = prim_andr->exp();
      generateAndrInst(output_def, exp);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeOrr: {
      firDB::firExpPrimOperation::firOrr* prim_orr = dynamic_cast<firDB::firExpPrimOperation::firOrr*>(prim_op);
      firDB::firType* orr_type = prim_orr->getTypeData(fir_module, NULL);
      fs_assert(orr_type != NULL);
      int orr_width = getPostTypeWidth(orr_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, orr_width);
      firDB::firExp* exp = prim_orr->exp();
      generateOrrInst(output_def, exp);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeXorr: {
      firDB::firExpPrimOperation::firXorr* prim_xorr = dynamic_cast<firDB::firExpPrimOperation::firXorr*>(prim_op);
      firDB::firType* xorr_type = prim_xorr->getTypeData(fir_module, NULL);
      fs_assert(xorr_type != NULL);
      int xorr_width = getPostTypeWidth(xorr_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, xorr_width);
      firDB::firExp* exp = prim_xorr->exp();
      generateXorrInst(output_def, exp);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeCat: {
      firDB::firExpPrimOperation::firCat* prim_cat = dynamic_cast<firDB::firExpPrimOperation::firCat*>(prim_op);
      firDB::firType* cat_type = prim_cat->getTypeData(fir_module, NULL);
      fs_assert(cat_type != NULL);
      int cat_width = getPostTypeWidth(cat_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, cat_width);
      firDB::firExp* exp1 = prim_cat->exp1();
      firDB::firExp* exp2 = prim_cat->exp2();
      generateCatInst(output_def, exp1, exp2);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeBits: {
      firDB::firExpPrimOperation::firBits* prim_bits = dynamic_cast<firDB::firExpPrimOperation::firBits*>(prim_op);
      firDB::firType* bits_type = prim_bits->getTypeData(fir_module, NULL);
      fs_assert(bits_type != NULL);
      int bits_width = getPostTypeWidth(bits_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, bits_width);
      firDB::firExp* exp = prim_bits->exp();
      unsigned int hi = prim_bits->hi();
      unsigned int lo = prim_bits->lo();
      generateBitsInst(output_def, exp, hi, lo);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeHead: {
      firDB::firExpPrimOperation::firHead* prim_head = dynamic_cast<firDB::firExpPrimOperation::firHead*>(prim_op);
      firDB::firType* head_type = prim_head->getTypeData(fir_module, NULL);
      fs_assert(head_type != NULL);
      int head_width = getPostTypeWidth(head_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, head_width);
      firDB::firExp* exp = prim_head->exp();
      unsigned int n = prim_head->n();
      generateHeadInst(output_def, exp, n);
      break;
    }
    case firDB::firExpPrimOperation::PrimOperationType::kOperatorTypeTail: {
      firDB::firExpPrimOperation::firTail* prim_tail = dynamic_cast<firDB::firExpPrimOperation::firTail*>(prim_op);
      firDB::firType* tail_type = prim_tail->getTypeData(fir_module, NULL);
      fs_assert(tail_type != NULL);
      int tail_width = getPostTypeWidth(tail_type);
      IdDef* output_def = alignToOutputWidth(port_y_net, tail_width);
      firDB::firExp* exp = prim_tail->exp();
      unsigned int n = prim_tail->n();
      generateTailInst(output_def, exp, n);
      break;
    }
    default: {
      fs_assert(0);
      break;
    }
    }
    return true;
  }
  void TransferModule::generatePortConnect(IdDef* inst_def, const std::string& port_id, IdDef* port_def, firDB::firExp* firrtl_exp) {
    fs_assert(inst_def != NULL);
    PortConnect* port_connect = inst_def->addPortConnect(port_id);
    fs_assert(port_connect != NULL);
    if (port_def == NULL) {
      fs_assert(firrtl_exp != NULL);
      if (firrtl_exp->isNumberExpression()) {
        char sign = ' ';
        unsigned int size = 0;
        bool is_signed = false;
        std::string value = "";
        if (!analyzeNumExpression(firrtl_exp, sign, size, is_signed, value)) {
          fs_error("*ERROR*: Illegal num expression '%s'.\n", firrtl_exp->toString().c_str());
          fs_assert(0);
        }
        port_connect->setConnection(sign, size, is_signed, value);
      } else if (firrtl_exp->isIdExpression()) {
        IdDef* net_id_def = getIdExpressionIdDef(firrtl_exp);
        port_connect->setConnection(net_id_def->getName());
      } else {
        fs_error("*ERROR*: Invalid expression '%s' in firrtl.\n", firrtl_exp->toString().c_str());
        fs_assert(0);
      }
    } else {
      port_connect->setConnection(port_def->getName());
    }
  }
  void TransferModule::generateSignedAddInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    int add_width = max_width + 1;
    IdDef* output_def = alignToOutputWidth(port_y_net, add_width);
    ExternModule* add_module = this->getMacroCellLib()->addCellAddSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeAddSigned);
    ModuleInstantiation* add_instantiation = this->getVerilogModule()->addInstance(inst_name, add_module->getName());
    PortConnect* param_connect = add_instantiation->addParamValue(MacroCellLib::getAddSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = add_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getAddSignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getAddSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getAddSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedAddInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    int add_width = max_width + 1;
    IdDef* output_def = alignToOutputWidth(port_y_net, add_width);
    ExternModule* add_module = this->getMacroCellLib()->addCellAddUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeAddUnsigned);
    ModuleInstantiation* add_instantiation = this->getVerilogModule()->addInstance(inst_name, add_module->getName());
    PortConnect* param_connect = add_instantiation->addParamValue(MacroCellLib::getAddUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = add_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getAddUnsignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getAddUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getAddUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedSubInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    int sub_width = max_width + 1;
    IdDef* output_def = alignToOutputWidth(port_y_net, sub_width);
    ExternModule* sub_module = this->getMacroCellLib()->addCellSubSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeSubSigned);
    ModuleInstantiation* sub_instantiation = this->getVerilogModule()->addInstance(inst_name, sub_module->getName());
    PortConnect* param_connect = sub_instantiation->addParamValue(MacroCellLib::getSubSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = sub_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getSubSignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getSubSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getSubSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedSubInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    int sub_width = max_width + 1;
    IdDef* output_def = alignToOutputWidth(port_y_net, sub_width);
    ExternModule* sub_module = this->getMacroCellLib()->addCellSubUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeSubUnsigned);
    ModuleInstantiation* sub_instantiation = this->getVerilogModule()->addInstance(inst_name, sub_module->getName());
    PortConnect* param_connect = sub_instantiation->addParamValue(MacroCellLib::getSubUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = sub_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getSubUnsignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getSubUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getSubUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedMulInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    //for multiplication with number expression
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int width_a = getPostTypeWidth(exp1_type);
    int width_b = getPostTypeWidth(exp2_type);
    int min_width_a = width_a;
    int min_width_b = width_b;
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    firDB::firExp* exp1_value = exp1->getExpVal(getFirrtlModule(), NULL);
    if (exp1_value != NULL) {
      if (exp1_value->isUIntBitsExpression()) {
        firDB::firExpUIntBits* exp_val_ub = dynamic_cast<firDB::firExpUIntBits*>(exp1_value);
        BigInt o_rtype(exp_val_ub->big_value()->getOriginValue(), false);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp1_value->isSIntBitsExpression()) {
        firDB::firExpSIntBits* exp_val_sb = dynamic_cast<firDB::firExpSIntBits*>(exp1_value);
        BigInt o_rtype(exp_val_sb->big_value()->getOriginValue(), true);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp1_value->isUIntExpression()) {
        firDB::firExpUInt* exp_val_u = dynamic_cast<firDB::firExpUInt*>(exp1_value);
        BigInt o_rtype(exp_val_u->big_value()->getOriginValue(), false);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp1_value->isSIntExpression()) {
        firDB::firExpSInt* exp_val_s = dynamic_cast<firDB::firExpSInt*>(exp1_value);
        BigInt o_rtype(exp_val_s->big_value()->getOriginValue(), true);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else {
        fs_error("*ERROR*: The expression value '%s' was not a number.\n", exp1_value->toString().c_str());
      }
      if (min_width_a < width_a) {
        align_exp1_def = alignWidthToMax(exp1, min_width_a);
      }
    }
    firDB::firExp* exp2_value = exp2->getExpVal(getFirrtlModule(), NULL);
    if (exp2_value != NULL) {
      if (exp2_value->isUIntBitsExpression()) {
        firDB::firExpUIntBits* exp_val_ub = dynamic_cast<firDB::firExpUIntBits*>(exp2_value);
        BigInt o_rtype(exp_val_ub->big_value()->getOriginValue(), false);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp2_value->isSIntBitsExpression()) {
        firDB::firExpSIntBits* exp_val_sb = dynamic_cast<firDB::firExpSIntBits*>(exp2_value);
        BigInt o_rtype(exp_val_sb->big_value()->getOriginValue(), true);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp2_value->isUIntExpression()) {
        firDB::firExpUInt* exp_val_u = dynamic_cast<firDB::firExpUInt*>(exp2_value);
        BigInt o_rtype(exp_val_u->big_value()->getOriginValue(), false);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp2_value->isSIntExpression()) {
        firDB::firExpSInt* exp_val_s = dynamic_cast<firDB::firExpSInt*>(exp2_value);
        BigInt o_rtype(exp_val_s->big_value()->getOriginValue(), true);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else {
        fs_error("*ERROR*: The expression value '%s' was not a number.\n", exp2_value->toString().c_str());
      }
      if (min_width_b < width_b) {
        align_exp2_def = alignWidthToMax(exp2, min_width_b);
      }
    }
    int mul_width = min_width_a + min_width_b;
    IdDef* output_def = alignToOutputWidth(port_y_net, mul_width);
    ExternModule* mul_module = this->getMacroCellLib()->addCellMulSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeMulSigned);
    ModuleInstantiation* mul_instantiation = this->getVerilogModule()->addInstance(inst_name, mul_module->getName());
    PortConnect* width_a_connect = mul_instantiation->addParamValue(MacroCellLib::getMulSignedParamWidthA());
    width_a_connect->setConnection(min_width_a);
    PortConnect* width_b_connect = mul_instantiation->addParamValue(MacroCellLib::getMulSignedParamWidthB());
    width_b_connect->setConnection(min_width_b);
    IdDef* inst_id_def = mul_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getMulSignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getMulSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getMulSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedMulInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int width_a = getPostTypeWidth(exp1_type);
    int width_b = getPostTypeWidth(exp2_type);
    int min_width_a = width_a;
    int min_width_b = width_b;
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    firDB::firExp* exp1_value = exp1->getExpVal(getFirrtlModule(), NULL);
    if (exp1_value != NULL) {
      if (exp1_value->isUIntBitsExpression()) {
        firDB::firExpUIntBits* exp_val_ub = dynamic_cast<firDB::firExpUIntBits*>(exp1_value);
        BigInt o_rtype(exp_val_ub->big_value()->getOriginValue(), false);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp1_value->isSIntBitsExpression()) {
        firDB::firExpSIntBits* exp_val_sb = dynamic_cast<firDB::firExpSIntBits*>(exp1_value);
        BigInt o_rtype(exp_val_sb->big_value()->getOriginValue(), true);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp1_value->isUIntExpression()) {
        firDB::firExpUInt* exp_val_u = dynamic_cast<firDB::firExpUInt*>(exp1_value);
        BigInt o_rtype(exp_val_u->big_value()->getOriginValue(), false);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp1_value->isSIntExpression()) {
        firDB::firExpSInt* exp_val_s = dynamic_cast<firDB::firExpSInt*>(exp1_value);
        BigInt o_rtype(exp_val_s->big_value()->getOriginValue(), true);
        min_width_a = (unsigned int)o_rtype.getMinBinaryWidth();
      } else {
        fs_error("*ERROR*: The expression value '%s' was not a number.\n", exp1_value->toString().c_str());
      }
      if (min_width_a < width_a) {
        align_exp1_def = alignWidthToMax(exp1, min_width_a);
      }
    }
    firDB::firExp* exp2_value = exp2->getExpVal(getFirrtlModule(), NULL);
    if (exp2_value != NULL) {
      if (exp2_value->isUIntBitsExpression()) {
        firDB::firExpUIntBits* exp_val_ub = dynamic_cast<firDB::firExpUIntBits*>(exp2_value);
        BigInt o_rtype(exp_val_ub->big_value()->getOriginValue(), false);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp2_value->isSIntBitsExpression()) {
        firDB::firExpSIntBits* exp_val_sb = dynamic_cast<firDB::firExpSIntBits*>(exp2_value);
        BigInt o_rtype(exp_val_sb->big_value()->getOriginValue(), true);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp2_value->isUIntExpression()) {
        firDB::firExpUInt* exp_val_u = dynamic_cast<firDB::firExpUInt*>(exp2_value);
        BigInt o_rtype(exp_val_u->big_value()->getOriginValue(), false);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else if (exp2_value->isSIntExpression()) {
        firDB::firExpSInt* exp_val_s = dynamic_cast<firDB::firExpSInt*>(exp2_value);
        BigInt o_rtype(exp_val_s->big_value()->getOriginValue(), true);
        min_width_b = (unsigned int)o_rtype.getMinBinaryWidth();
      } else {
        fs_error("*ERROR*: The expression value '%s' was not a number.\n", exp2_value->toString().c_str());
      }
      if (min_width_b < width_b) {
        align_exp2_def = alignWidthToMax(exp2, min_width_b);
      }
    }
    int mul_width = min_width_a + min_width_b;
    IdDef* output_def = alignToOutputWidth(port_y_net, mul_width);
    ExternModule* mul_module = this->getMacroCellLib()->addCellMulUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeMulUnsigned);
    ModuleInstantiation* mul_instantiation = this->getVerilogModule()->addInstance(inst_name, mul_module->getName());
    PortConnect* width_a_connect = mul_instantiation->addParamValue(MacroCellLib::getMulUnsignedParamWidthA());
    width_a_connect->setConnection(min_width_a);
    PortConnect* width_b_connect = mul_instantiation->addParamValue(MacroCellLib::getMulUnsignedParamWidthB());
    width_b_connect->setConnection(min_width_b);
    IdDef* inst_id_def = mul_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getMulUnsignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getMulUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getMulUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedDivInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den) {
    fs_assert(port_y_net != NULL);
    fs_assert(num != NULL);
    fs_assert(den != NULL);
    firDB::firType* num_type = num->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* den_type = den->getTypeData(getFirrtlModule(), NULL);
    fs_assert(num_type != NULL && den_type != NULL);
    int num_width = getPostTypeWidth(num_type);
    int den_width = getPostTypeWidth(den_type);
    int div_width = num_width + 1;
    IdDef* output_def = alignToOutputWidth(port_y_net, div_width);
    ExternModule* div_module = this->getMacroCellLib()->addCellDivSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeDivSigned);
    ModuleInstantiation* div_instantiation = this->getVerilogModule()->addInstance(inst_name, div_module->getName());
    PortConnect* num_width_connect = div_instantiation->addParamValue(MacroCellLib::getDivSignedParamNumWidth());
    num_width_connect->setConnection(num_width);
    PortConnect* den_width_connect = div_instantiation->addParamValue(MacroCellLib::getDivSignedParamDenWidth());
    den_width_connect->setConnection(den_width);
    IdDef* inst_id_def = div_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getDivSignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getDivSignedPortNum(), NULL, num);
    generatePortConnect(inst_id_def, MacroCellLib::getDivSignedPortDen(), NULL, den);
  }
  void TransferModule::generateUnsignedDivInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den) {
    fs_assert(port_y_net != NULL);
    fs_assert(num != NULL);
    fs_assert(den != NULL);
    firDB::firType* num_type = num->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* den_type = den->getTypeData(getFirrtlModule(), NULL);
    fs_assert(num_type != NULL && den_type != NULL);
    int num_width = getPostTypeWidth(num_type);
    int den_width = getPostTypeWidth(den_type);
    IdDef* output_def = alignToOutputWidth(port_y_net, num_width);
    ExternModule* div_module = this->getMacroCellLib()->addCellDivUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeDivUnsigned);
    ModuleInstantiation* div_instantiation = this->getVerilogModule()->addInstance(inst_name, div_module->getName());
    PortConnect* num_width_connect = div_instantiation->addParamValue(MacroCellLib::getDivUnsignedParamNumWidth());
    num_width_connect->setConnection(num_width);
    PortConnect* den_width_connect = div_instantiation->addParamValue(MacroCellLib::getDivUnsignedParamDenWidth());
    den_width_connect->setConnection(den_width);
    IdDef* inst_id_def = div_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getDivUnsignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getDivUnsignedPortNum(), NULL, num);
    generatePortConnect(inst_id_def, MacroCellLib::getDivUnsignedPortDen(), NULL, den);
  }
  void TransferModule::generateSignedModInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den) {
    fs_assert(port_y_net != NULL);
    fs_assert(num != NULL);
    fs_assert(den != NULL);
    firDB::firType* num_type = num->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* den_type = den->getTypeData(getFirrtlModule(), NULL);
    fs_assert(num_type != NULL && den_type != NULL);
    int num_width = getPostTypeWidth(num_type);
    int den_width = getPostTypeWidth(den_type);
    int min_width = std::min(num_width, den_width);
    IdDef* output_def = alignToOutputWidth(port_y_net, min_width);
    ExternModule* mod_module = this->getMacroCellLib()->addCellRemSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeRemSigned);
    ModuleInstantiation* rem_instantiation = this->getVerilogModule()->addInstance(inst_name, mod_module->getName());
    PortConnect* num_width_connect = rem_instantiation->addParamValue(MacroCellLib::getRemSignedParamNumWidth());
    num_width_connect->setConnection(num_width);
    PortConnect* den_width_connect = rem_instantiation->addParamValue(MacroCellLib::getRemSignedParamDenWidth());
    den_width_connect->setConnection(den_width);
    PortConnect* output_width_connect = rem_instantiation->addParamValue(MacroCellLib::getRemSignedParamWidth());
    output_width_connect->setConnection(min_width);
    IdDef* inst_id_def = rem_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getRemSignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getRemSignedPortNum(), NULL, num);
    generatePortConnect(inst_id_def, MacroCellLib::getRemSignedPortDen(), NULL, den);
  }
  void TransferModule::generateUnsignedModInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den) {
    fs_assert(port_y_net != NULL);
    fs_assert(num != NULL);
    fs_assert(den != NULL);
    firDB::firType* num_type = num->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* den_type = den->getTypeData(getFirrtlModule(), NULL);
    fs_assert(num_type != NULL && den_type != NULL);
    int num_width = getPostTypeWidth(num_type);
    int den_width = getPostTypeWidth(den_type);
    int min_width = std::min(num_width, den_width);
    IdDef* output_def = alignToOutputWidth(port_y_net, min_width);
    ExternModule* mod_module = this->getMacroCellLib()->addCellRemUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeRemUnsigned);
    ModuleInstantiation* rem_instantiation = this->getVerilogModule()->addInstance(inst_name, mod_module->getName());
    PortConnect* num_width_connect = rem_instantiation->addParamValue(MacroCellLib::getRemUnsignedParamNumWidth());
    num_width_connect->setConnection(num_width);
    PortConnect* den_width_connect = rem_instantiation->addParamValue(MacroCellLib::getRemUnsignedParamDenWidth());
    den_width_connect->setConnection(den_width);
    PortConnect* output_width_connect = rem_instantiation->addParamValue(MacroCellLib::getRemUnsignedParamWidth());
    output_width_connect->setConnection(min_width);
    IdDef* inst_id_def = rem_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getRemUnsignedPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getRemUnsignedPortNum(), NULL, num);
    generatePortConnect(inst_id_def, MacroCellLib::getRemUnsignedPortDen(), NULL, den);
  }
  void TransferModule::generateSignedLtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* lt_module = this->getMacroCellLib()->addCellLtSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeLtSigned);
    ModuleInstantiation* lt_instantiation = this->getVerilogModule()->addInstance(inst_name, lt_module->getName());
    PortConnect* param_connect = lt_instantiation->addParamValue(MacroCellLib::getLtSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = lt_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getLtSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getLtSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getLtSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedLtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* lt_module = this->getMacroCellLib()->addCellLtUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeLtUnsigned);
    ModuleInstantiation* lt_instantiation = this->getVerilogModule()->addInstance(inst_name, lt_module->getName());
    PortConnect* param_connect = lt_instantiation->addParamValue(MacroCellLib::getLtUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = lt_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getLtUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getLtUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getLtUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedLeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* leq_module = this->getMacroCellLib()->addCellLeqSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeLeqSigned);
    ModuleInstantiation* leq_instantiation = this->getVerilogModule()->addInstance(inst_name, leq_module->getName());
    PortConnect* param_connect = leq_instantiation->addParamValue(MacroCellLib::getLeqSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = leq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getLeqSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getLeqSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getLeqSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedLeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* leq_module = this->getMacroCellLib()->addCellLeqUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeLeqUnsigned);
    ModuleInstantiation* leq_instantiation = this->getVerilogModule()->addInstance(inst_name, leq_module->getName());
    PortConnect* param_connect = leq_instantiation->addParamValue(MacroCellLib::getLeqUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = leq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getLeqUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getLeqUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getLeqUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedGtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* gt_module = this->getMacroCellLib()->addCellGtSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeGtSigned);
    ModuleInstantiation* gt_instantiation = this->getVerilogModule()->addInstance(inst_name, gt_module->getName());
    PortConnect* param_connect = gt_instantiation->addParamValue(MacroCellLib::getGtSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = gt_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getGtSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getGtSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getGtSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedGtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* gt_module = this->getMacroCellLib()->addCellGtUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeGtUnsigned);
    ModuleInstantiation* gt_instantiation = this->getVerilogModule()->addInstance(inst_name, gt_module->getName());
    PortConnect* param_connect = gt_instantiation->addParamValue(MacroCellLib::getGtUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = gt_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getGtUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getGtUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getGtUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedGeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* geq_module = this->getMacroCellLib()->addCellGeqSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeGeqSigned);
    ModuleInstantiation* geq_instantiation = this->getVerilogModule()->addInstance(inst_name, geq_module->getName());
    PortConnect* param_connect = geq_instantiation->addParamValue(MacroCellLib::getGeqSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = geq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getGeqSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getGeqSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getGeqSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedGeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* geq_module = this->getMacroCellLib()->addCellGeqUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeGeqUnsigned);
    ModuleInstantiation* geq_instantiation = this->getVerilogModule()->addInstance(inst_name, geq_module->getName());
    PortConnect* param_connect = geq_instantiation->addParamValue(MacroCellLib::getGeqUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = geq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getGeqUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getGeqUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getGeqUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedEqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* eq_module = this->getMacroCellLib()->addCellEqSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeEqSigned);
    ModuleInstantiation* eq_instantiation = this->getVerilogModule()->addInstance(inst_name, eq_module->getName());
    PortConnect* param_connect = eq_instantiation->addParamValue(MacroCellLib::getEqSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = eq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getEqSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getEqSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getEqSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedEqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* eq_module = this->getMacroCellLib()->addCellEqUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeEqUnsigned);
    ModuleInstantiation* eq_instantiation = this->getVerilogModule()->addInstance(inst_name, eq_module->getName());
    PortConnect* param_connect = eq_instantiation->addParamValue(MacroCellLib::getEqUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = eq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getEqUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getEqUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getEqUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedNeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* neq_module = this->getMacroCellLib()->addCellNeqSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeNeqSigned);
    ModuleInstantiation* neq_instantiation = this->getVerilogModule()->addInstance(inst_name, neq_module->getName());
    PortConnect* param_connect = neq_instantiation->addParamValue(MacroCellLib::getNeqSignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = neq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getNeqSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getNeqSignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getNeqSignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateUnsignedNeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    ExternModule* neq_module = this->getMacroCellLib()->addCellNeqUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeNeqUnsigned);
    ModuleInstantiation* neq_instantiation = this->getVerilogModule()->addInstance(inst_name, neq_module->getName());
    PortConnect* param_connect = neq_instantiation->addParamValue(MacroCellLib::getNeqUnsignedParamWidth());
    param_connect->setConnection(max_width);
    IdDef* inst_id_def = neq_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getNeqUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getNeqUnsignedPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getNeqUnsignedPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateSignedPadInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* pad_module = this->getMacroCellLib()->addCellPadSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypePadSigned);
    ModuleInstantiation* pad_instantiation = this->getVerilogModule()->addInstance(inst_name, pad_module->getName());
    PortConnect* width_connect = pad_instantiation->addParamValue(MacroCellLib::getPadSignedParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = pad_instantiation->addParamValue(MacroCellLib::getPadSignedParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = pad_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getPadSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getPadSignedPortIn(), NULL, exp);
  }
  void TransferModule::generateUnsignedPadInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* pad_module = this->getMacroCellLib()->addCellPadUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypePadUnsigned);
    ModuleInstantiation* pad_instantiation = this->getVerilogModule()->addInstance(inst_name, pad_module->getName());
    PortConnect* width_connect = pad_instantiation->addParamValue(MacroCellLib::getPadUnsignedParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = pad_instantiation->addParamValue(MacroCellLib::getPadUnsignedParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = pad_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getPadUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getPadUnsignedPortIn(), NULL, exp);
  }
  void TransferModule::generateAsUIntInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* asuint_module = this->getMacroCellLib()->addCellAsUInt("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeAsUInt);
    ModuleInstantiation* asuint_instantiation = this->getVerilogModule()->addInstance(inst_name, asuint_module->getName());
    PortConnect* width_connect = asuint_instantiation->addParamValue(MacroCellLib::getAsUIntParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = asuint_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getAsUIntPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getAsUIntPortIn(), NULL, exp);
  }
  void TransferModule::generateAsSIntInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* assint_module = this->getMacroCellLib()->addCellAsSInt("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeAsSInt);
    ModuleInstantiation* assint_instantiation = this->getVerilogModule()->addInstance(inst_name, assint_module->getName());
    PortConnect* width_connect = assint_instantiation->addParamValue(MacroCellLib::getAsSIntParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = assint_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getAsSIntPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getAsSIntPortIn(), NULL, exp);
  }
  void TransferModule::generateSignedShlInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* shl_module = this->getMacroCellLib()->addCellShlSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeShlSigned);
    ModuleInstantiation* shl_instantiation = this->getVerilogModule()->addInstance(inst_name, shl_module->getName());
    PortConnect* width_connect = shl_instantiation->addParamValue(MacroCellLib::getShlSignedParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = shl_instantiation->addParamValue(MacroCellLib::getShlSignedParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = shl_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getShlSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getShlSignedPortIn(), NULL, exp);
  }
  void TransferModule::generateUnsignedShlInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* shl_module = this->getMacroCellLib()->addCellShlUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeShlUnsigned);
    ModuleInstantiation* shl_instantiation = this->getVerilogModule()->addInstance(inst_name, shl_module->getName());
    PortConnect* width_connect = shl_instantiation->addParamValue(MacroCellLib::getShlUnsignedParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = shl_instantiation->addParamValue(MacroCellLib::getShlUnsignedParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = shl_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getShlUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getShlUnsignedPortIn(), NULL, exp);
  }
  void TransferModule::generateSignedShrInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* shr_module = this->getMacroCellLib()->addCellShrSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeShrSigned);
    ModuleInstantiation* shr_instantiation = this->getVerilogModule()->addInstance(inst_name, shr_module->getName());
    PortConnect* width_connect = shr_instantiation->addParamValue(MacroCellLib::getShrSignedParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = shr_instantiation->addParamValue(MacroCellLib::getShrSignedParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = shr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getShrSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getShrSignedPortIn(), NULL, exp);
  }
  void TransferModule::generateUnsignedShrInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* shr_module = this->getMacroCellLib()->addCellShrUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeShrUnsigned);
    ModuleInstantiation* shr_instantiation = this->getVerilogModule()->addInstance(inst_name, shr_module->getName());
    PortConnect* width_connect = shr_instantiation->addParamValue(MacroCellLib::getShrUnsignedParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = shr_instantiation->addParamValue(MacroCellLib::getShrUnsignedParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = shr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getShrUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getShrUnsignedPortIn(), NULL, exp);
  }
  void TransferModule::generateSignedDshlInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int width_in = getPostTypeWidth(exp1_type);
    int width_n = getPostTypeWidth(exp2_type);
    ExternModule* dshl_module = this->getMacroCellLib()->addCellDShlSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeDShlSigned);
    ModuleInstantiation* dshl_instantiation = this->getVerilogModule()->addInstance(inst_name, dshl_module->getName());
    PortConnect* width_in_connect = dshl_instantiation->addParamValue(MacroCellLib::getDShlSignedParamWidthIn());
    width_in_connect->setConnection(width_in);
    PortConnect* width_n_connect = dshl_instantiation->addParamValue(MacroCellLib::getDShlSignedParamWidthN());
    width_n_connect->setConnection(width_n);
    IdDef* inst_id_def = dshl_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getDShlSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getDShlSignedPortIn(), NULL, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getDShlSignedPortN(), NULL, exp2);
  }
  void TransferModule::generateUnsignedDshlInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int width_in = getPostTypeWidth(exp1_type);
    int width_n = getPostTypeWidth(exp2_type);
    ExternModule* dshl_module = this->getMacroCellLib()->addCellDShlUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeDShlUnsigned);
    ModuleInstantiation* dshl_instantiation = this->getVerilogModule()->addInstance(inst_name, dshl_module->getName());
    PortConnect* width_in_connect = dshl_instantiation->addParamValue(MacroCellLib::getDShlUnsignedParamWidthIn());
    width_in_connect->setConnection(width_in);
    PortConnect* width_n_connect = dshl_instantiation->addParamValue(MacroCellLib::getDShlUnsignedParamWidthN());
    width_n_connect->setConnection(width_n);
    IdDef* inst_id_def = dshl_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getDShlUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getDShlUnsignedPortIn(), NULL, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getDShlUnsignedPortN(), NULL, exp2);
  }
  void TransferModule::generateSignedDshrInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int width_in = getPostTypeWidth(exp1_type);
    int width_n = getPostTypeWidth(exp2_type);
    ExternModule* dshr_module = this->getMacroCellLib()->addCellDShrSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeDShrSigned);
    ModuleInstantiation* dshr_instantiation = this->getVerilogModule()->addInstance(inst_name, dshr_module->getName());
    PortConnect* width_in_connect = dshr_instantiation->addParamValue(MacroCellLib::getDShrSignedParamWidthIn());
    width_in_connect->setConnection(width_in);
    PortConnect* width_n_connect = dshr_instantiation->addParamValue(MacroCellLib::getDShrSignedParamWidthN());
    width_n_connect->setConnection(width_n);
    IdDef* inst_id_def = dshr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getDShrSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getDShrSignedPortIn(), NULL, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getDShrSignedPortN(), NULL, exp2);
  }
  void TransferModule::generateUnsignedDshrInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int width_in = getPostTypeWidth(exp1_type);
    int width_n = getPostTypeWidth(exp2_type);
    ExternModule* dshr_module = this->getMacroCellLib()->addCellDShrUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeDShrUnsigned);
    ModuleInstantiation* dshr_instantiation = this->getVerilogModule()->addInstance(inst_name, dshr_module->getName());
    PortConnect* width_in_connect = dshr_instantiation->addParamValue(MacroCellLib::getDShrUnsignedParamWidthIn());
    width_in_connect->setConnection(width_in);
    PortConnect* width_n_connect = dshr_instantiation->addParamValue(MacroCellLib::getDShrUnsignedParamWidthN());
    width_n_connect->setConnection(width_n);
    IdDef* inst_id_def = dshr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getDShrUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getDShrUnsignedPortIn(), NULL, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getDShrUnsignedPortN(), NULL, exp2);
  }
  void TransferModule::generateSignedCvtInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* cvt_module = this->getMacroCellLib()->addCellCvtSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeCvtSigned);
    ModuleInstantiation* cvt_instantiation = this->getVerilogModule()->addInstance(inst_name, cvt_module->getName());
    PortConnect* width_connect = cvt_instantiation->addParamValue(MacroCellLib::getCvtSignedParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = cvt_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getCvtSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getCvtSignedPortIn(), NULL, exp);
  }
  void TransferModule::generateUnsignedCvtInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* cvt_module = this->getMacroCellLib()->addCellCvtUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeCvtUnsigned);
    ModuleInstantiation* cvt_instantiation = this->getVerilogModule()->addInstance(inst_name, cvt_module->getName());
    PortConnect* width_connect = cvt_instantiation->addParamValue(MacroCellLib::getCvtUnsignedParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = cvt_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getCvtUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getCvtUnsignedPortIn(), NULL, exp);
  }
  void TransferModule::generateSignedNegInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* neg_module = this->getMacroCellLib()->addCellNegSigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeNegSigned);
    ModuleInstantiation* neg_instantiation = this->getVerilogModule()->addInstance(inst_name, neg_module->getName());
    PortConnect* width_connect = neg_instantiation->addParamValue(MacroCellLib::getNegSignedParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = neg_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getNegSignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getNegSignedPortIn(), NULL, exp);
  }
  void TransferModule::generateUnsignedNegInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* neg_module = this->getMacroCellLib()->addCellNegUnsigned("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeNegUnsigned);
    ModuleInstantiation* neg_instantiation = this->getVerilogModule()->addInstance(inst_name, neg_module->getName());
    PortConnect* width_connect = neg_instantiation->addParamValue(MacroCellLib::getNegUnsignedParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = neg_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getNegUnsignedPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getNegUnsignedPortIn(), NULL, exp);
  }
  void TransferModule::generateNotInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* not_module = this->getMacroCellLib()->addCellBitwiseNot("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseNot);
    ModuleInstantiation* not_instantiation = this->getVerilogModule()->addInstance(inst_name, not_module->getName());
    PortConnect* width_connect = not_instantiation->addParamValue(MacroCellLib::getBitwiseNotParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = not_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortIn(), NULL, exp);
  }
  void TransferModule::generateAndInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    IdDef* output_def = alignToOutputWidth(port_y_net, max_width);
    ExternModule* and_module = this->getMacroCellLib()->addCellBitwiseAnd("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseAnd);
    std::string param_width_id = MacroCellLib::getBitwiseAndParamWidth();
    ModuleInstantiation* and_instantiation = this->getVerilogModule()->addInstance(inst_name, and_module->getName());
    PortConnect* width_connect = and_instantiation->addParamValue(param_width_id);
    width_connect->setConnection(max_width);
    IdDef* inst_id_def = and_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseAndPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseAndPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseAndPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateOrInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    IdDef* output_def = alignToOutputWidth(port_y_net, max_width);
    ExternModule* or_module = this->getMacroCellLib()->addCellBitwiseOr("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseOr);
    std::string param_width_id = MacroCellLib::getBitwiseOrParamWidth();
    ModuleInstantiation* or_instantiation = this->getVerilogModule()->addInstance(inst_name, or_module->getName());
    PortConnect* width_connect = or_instantiation->addParamValue(param_width_id);
    width_connect->setConnection(max_width);
    IdDef* inst_id_def = or_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseOrPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseOrPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseOrPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateXorInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int exp1_width = getPostTypeWidth(exp1_type);
    int exp2_width = getPostTypeWidth(exp2_type);
    IdDef* align_exp1_def = NULL;
    IdDef* align_exp2_def = NULL;
    if (exp1_width > exp2_width) {
      align_exp2_def = alignWidthToMax(exp2, exp1_width);
    } else if (exp1_width < exp2_width) {
      align_exp1_def = alignWidthToMax(exp1, exp2_width);
    }
    int max_width = std::max(exp1_width, exp2_width);
    IdDef* output_def = alignToOutputWidth(port_y_net, max_width);
    ExternModule* xor_module = this->getMacroCellLib()->addCellBitwiseXor("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseXor);
    std::string param_width_id = MacroCellLib::getBitwiseXorParamWidth();
    ModuleInstantiation* xor_instantiation = this->getVerilogModule()->addInstance(inst_name, xor_module->getName());
    PortConnect* width_connect = xor_instantiation->addParamValue(param_width_id);
    width_connect->setConnection(max_width);
    IdDef* inst_id_def = xor_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseXorPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseXorPortA(), align_exp1_def, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getBitwiseXorPortB(), align_exp2_def, exp2);
  }
  void TransferModule::generateAndrInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* andr_module = this->getMacroCellLib()->addCellAndr("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeAndr);
    ModuleInstantiation* andr_instantiation = this->getVerilogModule()->addInstance(inst_name, andr_module->getName());
    PortConnect* width_connect = andr_instantiation->addParamValue(MacroCellLib::getAndrParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = andr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getAndrPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getAndrPortIn(), NULL, exp);
  }
  void TransferModule::generateOrrInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* orr_module = this->getMacroCellLib()->addCellOrr("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeOrr);
    ModuleInstantiation* orr_instantiation = this->getVerilogModule()->addInstance(inst_name, orr_module->getName());
    PortConnect* width_connect = orr_instantiation->addParamValue(MacroCellLib::getOrrParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = orr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getOrrPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getOrrPortIn(), NULL, exp);
  }
  void TransferModule::generateXorrInst(IdDef* port_y_net, firDB::firExp* exp) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* xorr_module = this->getMacroCellLib()->addCellXorr("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeXorr);
    ModuleInstantiation* xorr_instantiation = this->getVerilogModule()->addInstance(inst_name, xorr_module->getName());
    PortConnect* width_connect = xorr_instantiation->addParamValue(MacroCellLib::getXorrParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_id_def = xorr_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getXorrPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getXorrPortIn(), NULL, exp);
  }
  void TransferModule::generateCatInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp1 != NULL);
    fs_assert(exp2 != NULL);
    firDB::firType* exp1_type = exp1->getTypeData(getFirrtlModule(), NULL);
    firDB::firType* exp2_type = exp2->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp1_type != NULL && exp2_type != NULL);
    int a_width = getPostTypeWidth(exp1_type);
    int b_width = getPostTypeWidth(exp2_type);
    ExternModule* cat_module = this->getMacroCellLib()->addCellCat("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeCat);
    ModuleInstantiation* cat_instantiation = this->getVerilogModule()->addInstance(inst_name, cat_module->getName());
    PortConnect* width_a_connect = cat_instantiation->addParamValue(MacroCellLib::getCatParamWidthA());
    width_a_connect->setConnection(a_width);
    PortConnect* width_b_connect = cat_instantiation->addParamValue(MacroCellLib::getCatParamWidthB());
    width_b_connect->setConnection(b_width);
    IdDef* inst_id_def = cat_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getCatPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getCatPortA(), NULL, exp1);
    generatePortConnect(inst_id_def, MacroCellLib::getCatPortB(), NULL, exp2);
  }
  void TransferModule::generateBitsInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int hi, unsigned int lo) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* bits_module = this->getMacroCellLib()->addCellBits("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBits);
    ModuleInstantiation* bits_instantiation = this->getVerilogModule()->addInstance(inst_name, bits_module->getName());
    PortConnect* width_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamWidth());
    width_connect->setConnection(width);
    PortConnect* high_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamHigh());
    high_connect->setConnection(hi);
    PortConnect* low_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamLow());
    low_connect->setConnection(lo);
    IdDef* inst_id_def = bits_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getBitsPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getBitsPortIn(), NULL, exp);
  }
  void TransferModule::generateHeadInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* head_module = this->getMacroCellLib()->addCellHead("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeHead);
    ModuleInstantiation* head_instantiation = this->getVerilogModule()->addInstance(inst_name, head_module->getName());
    PortConnect* width_connect = head_instantiation->addParamValue(MacroCellLib::getHeadParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = head_instantiation->addParamValue(MacroCellLib::getHeadParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = head_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getHeadPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getHeadPortIn(), NULL, exp);
  }
  void TransferModule::generateTailInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n) {
    fs_assert(port_y_net != NULL);
    fs_assert(exp != NULL);
    firDB::firType* exp_type = exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(exp_type != NULL);
    int width = getPostTypeWidth(exp_type);
    ExternModule* tail_module = this->getMacroCellLib()->addCellTail("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeTail);
    ModuleInstantiation* tail_instantiation = this->getVerilogModule()->addInstance(inst_name, tail_module->getName());
    PortConnect* width_connect = tail_instantiation->addParamValue(MacroCellLib::getTailParamWidth());
    width_connect->setConnection(width);
    PortConnect* n_connect = tail_instantiation->addParamValue(MacroCellLib::getTailParamN());
    n_connect->setConnection(n);
    IdDef* inst_id_def = tail_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getTailPortY(), port_y_net, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getTailPortIn(), NULL, exp);
  }
  bool TransferModule::transferLibraryToVerilogLibrary(firDB::firLibrary* fir_library) {
    fs_assert(fir_library != NULL);
    fs_assert(fir_library->name() == "work");
    firDB::firCircuit* post_circuit = fir_library->post_circuit();
    fs_assert(post_circuit != NULL);
    firDB::firModule* top_module = post_circuit->top_module();
    fs_assert(top_module != NULL);
    if (!transferModuleToVerilogModule(top_module)) {
      fs_assert(0);
      return false;
    }
    post_circuit = NULL;
    return true;
  }
  bool TransferModule::transferModuleToVerilogModule(firDB::firModule* module) {
    fs_assert(module != NULL);
    fs_assert(module->isModule());
    Library* veri_library = getVerilogLibrary();
    fs_assert(veri_library != NULL);
    std::string module_id = module->id();
    Module* veri_module = veri_library->addModule(module_id);
    this->setModule(module, veri_module);
    if (avoidRedeclaredId(module) == false) {
      return false;
    }
    if (!transferAllPortsToVerilogPorts(module)) {
      fs_assert(0);
      return false;
    }
    if (!transferAllStatementsToVerilogItems(module)) {
      fs_assert(0);
      return false;
    }
    this->setModule(NULL, NULL);
    return true;
  }
  bool TransferModule::transferExternModuleToVerilogModule(firDB::firModule* module) {
    fs_assert(module != NULL);
    fs_assert(module->isExtModule());
    //do nothing
    return true;
  }
  bool TransferModule::transferAllPortsToVerilogPorts(firDB::firModule* module) {
    fs_assert(module != NULL);
    std::vector<firDB::firItemPort*>& ports = module->ports();
    for (size_t p = 0; p < ports.size(); p++) {
      if (!transferPortToVerilogPort(ports[p])) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferModule::transferPortToVerilogPort(firDB::firItemPort* port) {
    fs_assert(port != NULL);
    firDB::firType* type_data = port->type_data();
    fs_assert(type_data != NULL);
    if (!type_data->isPostType()) {
      fs_error("*ERROR*: The data type of port '%s' was not a post type in the write_verilog process.\n", port->id().c_str());
      return false;
    }
    Module* veri_module = getVerilogModule();
    fs_assert(veri_module != NULL);
    std::string port_id = getWriteId(port->id(), getFirrtlModule());
    PortDir dir = PortDir::kPortDirUndef;
    if (port->isInput()) {
      dir = PortDir::kPortDirInput;
    } else if (port->isOutput()) {
      dir = PortDir::kPortDirOutput;
    } else if (port->isInout()) {
      fs_warning("*WARNING*: The direction of port '%s' was detected to be inout type.\n", port->id().c_str());
      dir = PortDir::kPortDirInout;
    } else {
      fs_error("*ERROR*: The direction of port '%s' was undefined. Define the port direction and rerun.\n", port->id().c_str());
      fs_assert(0);
      return false;
    }
    if (type_data->isAnalogType()) dir = PortDir::kPortDirInout;
    int width = getPostTypeWidth(type_data);
    bool is_signed = getPostTypeSign(type_data);
    IdDef* port_id_def = NULL;
    if (width > 1) {
      int range_left = width - 1;
      int range_right = 0;
      port_id_def = veri_module->addPort(port_id, dir, range_left, range_right);
    } else {
      port_id_def = veri_module->addPort(port_id, dir);
    }
    fs_assert(port_id_def != NULL);
    BaseDataType* data_type = port_id_def->getDataType();
    data_type->setSigned(is_signed);
    return true;
  }
  bool TransferModule::transferAllStatementsToVerilogItems(firDB::firModule* module) {
    fs_assert(module != NULL);
    std::vector<firDB::firItem*>& statements = module->statements();
    for (size_t s = 0; s < statements.size(); s++) {
      firDB::firItem* statement = statements[s];
      if (!transferStatementToVerilogItem(statement)) {
        fs_assert(0);
        return false;
      }
    }
    return true;
  }
  bool TransferModule::transferStatementToVerilogItem(firDB::firItem* statement) {
    fs_assert(statement != NULL);
    switch (statement->type()) {
    case firDB::ItemType::kItemWire: {
      if (!transferItemWireToNetDecl(dynamic_cast<firDB::firItemWire*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemRegister: {
      if (!transferItemRegisterToVerilog(dynamic_cast<firDB::firItemRegister*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemMemory: {
      if (!transferItemMemoryToVerilog(dynamic_cast<firDB::firItemMemory*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemInstance: {
      if (!transferItemInstanceToVerilogInstance(dynamic_cast<firDB::firItemInstance*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemNode: {
      if (!transferItemNodeToVerilog(dynamic_cast<firDB::firItemNode*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemConnect: {
      if (!transferItemConnectToVerilog(dynamic_cast<firDB::firItemConnect*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    case firDB::ItemType::kItemAttach: {
      if (!transferItemAttachToVerilog(dynamic_cast<firDB::firItemAttach*>(statement))) {
        fs_assert(0);
        return false;
      }
      break;
    }
    default: {
      fs_assert(0);
      return false;
    }
    }
    return true;
  }
  bool TransferModule::transferItemWireToNetDecl(firDB::firItemWire* item_wire) {
    fs_assert(item_wire != NULL);
    std::string id = getWriteId(item_wire->id(), getFirrtlModule());
    firDB::firType* type_data = item_wire->type_data();
    IdDef* wire_def = generateNetDecl(id, type_data);
    fs_assert(wire_def != NULL);
    return true;
  }
  bool TransferModule::transferItemInstanceToVerilogInstance(firDB::firItemInstance* item_instance) {
    fs_assert(item_instance != NULL);
    std::string inst_id = getWriteId(item_instance->inst_id(), this->getFirrtlModule());
    std::string module_id = getWriteId(item_instance->module_id(), this->getFirrtlModule());
    Module* current_verilog_module = getVerilogModule();
    firDB::firModule* current_firrtl_module = getFirrtlModule();
    firDB::firCircuit* circuit = current_firrtl_module->circuit();
    firDB::firModule* inst_firrtl_module = circuit->findModuleById(module_id);
    fs_assert(inst_firrtl_module != NULL);
    if (getVerilogLibrary()->getModule(module_id) == NULL) {
      switch (inst_firrtl_module->type()) {
      case firDB::ModuleType::kModule:
        if (!transferModuleToVerilogModule(inst_firrtl_module)) {
          return false;
        }
        setModule(current_firrtl_module, current_verilog_module);
        break;
      case firDB::ModuleType::kExtModule:
        if (!transferExternModuleToVerilogModule(inst_firrtl_module)) {
          return false;
        }
        setModule(current_firrtl_module, current_verilog_module);
        break;
      default:
        fs_assert(0);
        break;
      }
    }
    //generate instance net decls
    std::vector<firDB::firItemPort*>& item_ports = inst_firrtl_module->ports();
    for (size_t p = 0; p < item_ports.size(); p++) {
      std::string port_id = getWriteId(item_ports[p]->id(), getFirrtlModule());
      std::string inst_port_id = getInstPortId(inst_id, port_id);
      firDB::firType* type_data = item_ports[p]->type_data();
      if (type_data->isAnalogType()) continue;
      IdDef* port_def = generateNetDecl(inst_port_id, type_data);
      fs_assert(port_def != NULL);
    }
    if (inst_firrtl_module->isModule()) {
      Module* inst_module = getVerilogLibrary()->getModule(module_id);
      std::vector<IdDef*>& ports = inst_module->getPorts();
      ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, module_id);
      fs_assert(instantiation != NULL);
      IdDef* instance = instantiation->getInstance();
      for (size_t p = 0; p < ports.size(); p++) {
        PortConnect* port_connect = instance->addPortConnect(ports[p]->getName());
        if (!ports[p]->isInout()) {
          std::string port_net_id = getInstPortId(inst_id, ports[p]->getName());
          port_connect->setConnection(port_net_id);
        }
      }
    } else if (inst_firrtl_module->isExtModule()) {
      if (inst_firrtl_module->defname() != NULL) {
        module_id = getWriteId(inst_firrtl_module->defname()->value(), this->getFirrtlModule());
      }
      ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, module_id);
      fs_assert(instantiation != NULL);
      IdDef* instance = instantiation->getInstance();
      std::vector<firDB::firItemPort*>& ports = inst_firrtl_module->ports();
      for (size_t p = 0; p < ports.size(); p++) {
        std::string port_id = getWriteId(ports[p]->id(), getFirrtlModule());
        PortConnect* port_connect = instance->addPortConnect(port_id);
        std::string port_net_id = getInstPortId(inst_id, port_id);
        port_connect->setConnection(port_net_id);
      }
      std::vector<firDB::firParameter*>& parameters = inst_firrtl_module->parameters();
      for (size_t p = 0; p < parameters.size(); p++) {
        PortConnect* param_value = instantiation->addParamValue(parameters[p]->id());
        std::string parameter_value = parameters[p]->value();
        if (parameter_value.size() > 2) {
          if (parameter_value[0] == '\'' && parameter_value[parameter_value.size() - 1] == '\'') {
            std::string temp_value = parameter_value;
            temp_value.replace(0, 1, "");
            temp_value.replace(temp_value.size() - 1, 1, "");
            parameter_value = temp_value;
          }
        }
        param_value->setConnection(parameter_value);
      }
    } else {
      fs_assert(0);
    }
    return true;
  }
  bool TransferModule::analyzeNumExpression(firDB::firExp* exp, char& sign, unsigned int& sized, bool& is_signed, std::string& value) {
    fs_assert(exp != NULL);
    fs_assert(exp->isNumberExpression());
    if (exp->isUIntBitsExpression()) {
      firDB::firExpUIntBits* uint_bits = dynamic_cast<firDB::firExpUIntBits*>(exp);
      sized = uint_bits->width();
      sign = ' ';
      is_signed = false;
      //value = uint_bits->value();
      value = uint_bits->big_value()->getHexadecimalValue();
    } else if (exp->isUIntExpression()) {
      firDB::firExpUInt* uint = dynamic_cast<firDB::firExpUInt*>(exp);
      sized = uint->width();
      sign = ' ';
      is_signed = false;
      //unsigned long long i_value = uint->value();
      //value = "d" + std::to_string(i_value);
      value = uint->big_value()->getDecimalValue();
    } else if (exp->isSIntBitsExpression()) {
      firDB::firExpSIntBits* sint_bits = dynamic_cast<firDB::firExpSIntBits*>(exp);
      sized = sint_bits->width();
      sign = ' ';
      is_signed = true;
      value = "";
      //std::string s_value = sint_bits->value();
      std::string s_value = sint_bits->big_value()->getHexadecimalValue();
      unsigned int index = 0;
      char bit = s_value[index];
      //if (bit == 'b' || bit == 'o' || bit == 'd' || bit == 'h') {
      //  value += bit;
      //  index++;
      //}
      fs_assert(bit == 'h');
      value += "h";
      index++;
      bit = s_value[index];
      if (bit == '-') {
        sign = bit;
        index++;
      } else if (bit == '+') {
        sign = bit;
        index++;
      }
      value += s_value.substr(index);
    } else if (exp->isSIntExpression()) {
      firDB::firExpSInt* sint = dynamic_cast<firDB::firExpSInt*>(exp);
      sized = sint->width();
      is_signed = true;
      //unsigned long long i_value = sint->value();
      //if (i_value < 0) {
      //  sign = '-';
      //  i_value = 0 - i_value;
      //} else {
      //  sign = ' ';
      //}
      //value = "d" + std::to_string(i_value);
      std::string i_value = sint->big_value()->getDecimalValue();
      fs_assert(i_value[0] == 'd');
      if (i_value[1] == '-') {
        sign = '-';
        i_value = "d" + i_value.substr(2);
      } else {
        sign = ' ';
      }
      value = i_value;
    } else {
      sign = ' ';
      sized = UINT_MAX;
      is_signed = false;
      value = "";
      return false;
    }
    return true;
  }
  bool TransferModule::transferItemConnectToVerilog(firDB::firItemConnect* item_connect) {
    fs_assert(item_connect != NULL);
    firDB::firExp* connect_l = item_connect->connect_l();
    firDB::firExp* connect_r = item_connect->connect_r();
    IdDef* left_id_def = getIdExpressionIdDef(connect_l);
    fs_assert(left_id_def != NULL);
    firDB::firItem* item_l = this->getFirrtlModule()->findItemByExpression(connect_l);
    if (item_l->isRegisterItem()) {
      std::string left_id = left_id_def->getName();
      auto iter = register_mux_port_b_map_.find(left_id_def);
      if (iter != register_mux_port_b_map_.end()) {
        IdDef* net_b_def = iter->second;
        if (!assignToRegisterMuxPortB(net_b_def, connect_r)) {
          fs_assert(0);
          return false;
        }
        return true;
      }
    }
    if (!transferRightExpression(left_id_def, connect_r)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferModule::transferItemNodeToVerilog(firDB::firItemNode* item_node) {
    fs_assert(item_node != NULL);
    std::string node_id = item_node->id();
    firDB::firExp* node_exp = item_node->exp();
    std::string add_net_id = getWriteId(node_id, getFirrtlModule());
    firDB::firType* node_data_type = node_exp->getTypeData(getFirrtlModule(), NULL);
    fs_assert(node_data_type != NULL);
    int width = getPostTypeWidth(node_data_type);
    bool is_signed = getPostTypeSign(node_data_type);
    IdDef* net_id_def = NULL;
    if (width > 1) {
      int range_left = width - 1;
      int range_right = 0;
      net_id_def = getVerilogModule()->addNet(add_net_id, range_left, range_right);
    } else {
      net_id_def = getVerilogModule()->addNet(add_net_id);
    }
    BaseDataType* data_type = net_id_def->getDataType();
    data_type->setSigned(is_signed);
    if (!transferRightExpression(net_id_def, node_exp)) {
      fs_assert(0);
      return false;
    }
    return true;
  }
  bool TransferModule::transferItemRegisterToVerilog(firDB::firItemRegister* item_register) {
    fs_assert(item_register != NULL);
    bool is_pos_clk = true;
    bool is_pos_rst = true;
    bool is_asyncreset = false;
    firDB::firModule* fir_module = getFirrtlModule();
    fs_assert(fir_module != NULL);
    std::string reg_id = getWriteId(item_register->id(), getFirrtlModule());
    firDB::firType* type_data = item_register->type_data();
    std::string port_d_id = getDffPortId(reg_id, item_register->getPortDId());
    std::string port_q_id = getDffPortId(reg_id, item_register->getPortQId());
    //generate wire _regid__q;
    IdDef* net_q_def = generateNetDecl(port_q_id, type_data);
    fs_assert(net_q_def != NULL);
    //generate wire _regid__d;
    IdDef* net_d_def = generateNetDecl(port_d_id, type_data);
    fs_assert(net_d_def != NULL);
    firDB::firExp* clock_signal = item_register->clock_signal();
    if (!clock_signal->isReferenceExpression() && !clock_signal->isSubfieldExpression()) {
      fs_error("*ERROR*: The clock signal '%s' of register '%s' was invalid for transfer module.\n", clock_signal->toString().c_str(), item_register->id().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firType* clock_type = clock_signal->getTypeData(fir_module);
    fs_assert(clock_type != NULL);
    if (!clock_type->isClockType()) {
      fs_error("*ERROR*: The clock signal '%s' of register '%s' was not 'Clock' type.\n", clock_signal->toString().c_str(), item_register->id().c_str());
      fs_assert(0);
      return false;
    }
    firDB::firExp* reg_reset = item_register->reg_reset();
    firDB::firExp* reg_init = item_register->reg_init();
    if (reg_reset != NULL) {
      fs_assert(reg_init != NULL);
      firDB::firType* reset_type_data = reg_reset->getTypeData(fir_module, NULL);
      fs_assert(reset_type_data != NULL);
      if (reset_type_data->isUIntType() || reset_type_data->isResetType()) {
        is_asyncreset = false;
      } else if (reset_type_data->isAsyncResetType()) {
        is_asyncreset = true;
      }
    }
    if (is_pos_clk) {
      if (is_asyncreset) {
        if (is_pos_rst) {
          if (!generatePosClkPosAsyncResetDff(reg_id, type_data, clock_signal, reg_reset, reg_init)) {
            fs_assert(0);
            return false;
          }
        } else {
          if (!generatePosClkNegAsyncResetDff(reg_id, type_data, clock_signal, reg_reset, reg_init)) {
            fs_assert(0);
            return false;
          }
        }
      } else {
        if (!generatePosClkDff(reg_id, type_data, clock_signal)) {
          fs_assert(0);
          return false;
        }
        if (reg_reset != NULL) {
          fs_assert(reg_init != NULL);
          if (!generateRegisterResetMuxInst(reg_id, reg_reset, reg_init, type_data)) {
            fs_assert(0);
            return false;
          }
        }
      }
    } else {
      if (is_asyncreset) {
        if (is_pos_rst) {
          if (!generateNegClkPosAsyncResetDff(reg_id, type_data, clock_signal, reg_reset, reg_init)) {
            fs_assert(0);
            return false;
          }
        } else {
          if (!generateNegClkNegAsyncResetDff(reg_id, type_data, clock_signal, reg_reset, reg_init)) {
            fs_assert(0);
            return false;
          }
        }
      } else {
        if (!generateNegClkDff(reg_id, type_data, clock_signal)) {
          fs_assert(0);
          return false;
        }
        if (reg_reset != NULL) {
          fs_assert(reg_init != NULL);
          if (!generateRegisterResetMuxInst(reg_id, reg_reset, reg_init, type_data)) {
            fs_assert(0);
            return false;
          }
        }
      }
    }
    return true;
  }
  bool TransferModule::generatePosClkDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal) {
    fs_assert(reg_data_type != NULL);
    fs_assert(clk_signal != NULL);
    std::string dff_name = MacroCellLib::getDffPosClkName();
    ExternModule* dff_module = getMacroCellLib()->addCellDffPosClk("");
    fs_assert(dff_module != NULL);
    IdDef* param_width = dff_module->getParam(MacroCellLib::getDffPosClkParamWidth());
    fs_assert(param_width != NULL);
    std::vector<IdDef*>& ports = dff_module->getPorts();
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, dff_name);
    fs_assert(instantiation != NULL);
    //add param_value
    int width = getPostTypeWidth(reg_data_type);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    for (size_t p = 0; p < ports.size(); p++) {
      std::string port_id = ports[p]->getName();
      std::string net_id = getDffPortId(inst_id, port_id);
      if (port_id == MacroCellLib::getDffPosClkPortClk()) {
        generatePortConnect(inst_id_def, port_id, NULL, clk_signal);
      } else {
        PortConnect* port_connect = inst_id_def->addPortConnect(port_id);
        port_connect->setConnection(net_id);
      }
    }
    return true;
  }
  bool TransferModule::generateNegClkDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal) {
    fs_assert(reg_data_type != NULL);
    fs_assert(clk_signal != NULL);
    std::string dff_name = MacroCellLib::getDffNegClkName();
    ExternModule* dff_module = getMacroCellLib()->addCellDffNegClk("");
    fs_assert(dff_module != NULL);
    IdDef* param_width = dff_module->getParam(MacroCellLib::getDffNegClkParamWidth());
    fs_assert(param_width != NULL);
    std::vector<IdDef*>& ports = dff_module->getPorts();
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, dff_name);
    fs_assert(instantiation != NULL);
    //add param_value
    int width = getPostTypeWidth(reg_data_type);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    for (size_t p = 0; p < ports.size(); p++) {
      std::string port_id = ports[p]->getName();
      std::string net_id = getDffPortId(inst_id, port_id);
      if (port_id == MacroCellLib::getDffNegClkPortClk()) {
        generatePortConnect(inst_id_def, port_id, NULL, clk_signal);
      } else {
        PortConnect* port_connect = inst_id_def->addPortConnect(port_id);
        port_connect->setConnection(net_id);
      }
    }
    return true;
  }
  bool TransferModule::generatePosClkPosAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value) {
    fs_assert(reg_data_type != NULL);
    fs_assert(clk_signal != NULL);
    fs_assert(rst_signal != NULL);
    fs_assert(rst_value != NULL);
    IdDef* rst_value_def = NULL;
    if (rst_value->isOperationExpression()) {
      std::string rst_value_id = getDffPortId(inst_id, MacroCellLib::getDffPosClkPosAsyncRstPortRstVal());
      rst_value_def = generateNetDecl(rst_value_id, reg_data_type);
      if (!transferRightExpression(rst_value_def, rst_value)) {
        fs_assert(0);
        return false;
      }
    }
    std::string dff_name = MacroCellLib::getDffPosClkPosAsyncRstName();
    ExternModule* dff_module = getMacroCellLib()->addCellDffPosClkPosAsyncRst("");
    fs_assert(dff_module != NULL);
    IdDef* param_width = dff_module->getParam(MacroCellLib::getDffPosClkPosAsyncRstParamWidth());
    fs_assert(param_width != NULL);
    std::vector<IdDef*>& ports = dff_module->getPorts();
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, dff_name);
    fs_assert(instantiation != NULL);
    //add param_value
    int width = getPostTypeWidth(reg_data_type);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    for (size_t p = 0; p < ports.size(); p++) {
      std::string port_id = ports[p]->getName();
      std::string net_id = getDffPortId(inst_id, port_id);
      if (port_id == MacroCellLib::getDffPosClkPosAsyncRstPortClk()) {
        generatePortConnect(inst_id_def, port_id, NULL, clk_signal);
      } else if (port_id == MacroCellLib::getDffPosClkPosAsyncRstPortRst()) {
        generatePortConnect(inst_id_def, port_id, NULL, rst_signal);
      } else if (port_id == MacroCellLib::getDffPosClkPosAsyncRstPortRstVal()) {
        generatePortConnect(inst_id_def, port_id, rst_value_def, rst_value);
      } else {
        PortConnect* port_connect = inst_id_def->addPortConnect(port_id);
        port_connect->setConnection(net_id);
      }
    }
    return true;
  }
  bool TransferModule::generatePosClkNegAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value) {
    fs_assert(reg_data_type != NULL);
    fs_assert(clk_signal != NULL);
    fs_assert(rst_signal != NULL);
    fs_assert(rst_value != NULL);
    IdDef* rst_value_def = NULL;
    if (rst_value->isOperationExpression()) {
      std::string rst_value_id = getDffPortId(inst_id, MacroCellLib::getDffPosClkNegAsyncRstPortRstVal());
      rst_value_def = generateNetDecl(rst_value_id, reg_data_type);
      if (!transferRightExpression(rst_value_def, rst_value)) {
        fs_assert(0);
        return false;
      }
    }
    std::string dff_name = MacroCellLib::getDffPosClkNegAsyncRstName();
    ExternModule* dff_module = getMacroCellLib()->addCellDffPosClkNegAsyncRst("");
    fs_assert(dff_module != NULL);
    IdDef* param_width = dff_module->getParam(MacroCellLib::getDffPosClkNegAsyncRstParamWidth());
    fs_assert(param_width != NULL);
    std::vector<IdDef*>& ports = dff_module->getPorts();
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, dff_name);
    fs_assert(instantiation != NULL);
    //add param_value
    int width = getPostTypeWidth(reg_data_type);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    for (size_t p = 0; p < ports.size(); p++) {
      std::string port_id = ports[p]->getName();
      std::string net_id = getDffPortId(inst_id, port_id);
      if (port_id == MacroCellLib::getDffPosClkNegAsyncRstPortClk()) {
        generatePortConnect(inst_id_def, port_id, NULL, clk_signal);
      } else if (port_id == MacroCellLib::getDffPosClkNegAsyncRstPortRst()) {
        generatePortConnect(inst_id_def, port_id, NULL, rst_signal);
      } else if (port_id == MacroCellLib::getDffPosClkNegAsyncRstPortRstVal()) {
        generatePortConnect(inst_id_def, port_id, rst_value_def, rst_value);
      } else {
        PortConnect* port_connect = inst_id_def->addPortConnect(port_id);
        port_connect->setConnection(net_id);
      }
    }
    return true;
  }
  bool TransferModule::generateNegClkPosAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value) {
    fs_assert(reg_data_type != NULL);
    fs_assert(clk_signal != NULL);
    fs_assert(rst_signal != NULL);
    fs_assert(rst_value != NULL);
    IdDef* rst_value_def = NULL;
    if (rst_value->isOperationExpression()) {
      std::string rst_value_id = getDffPortId(inst_id, MacroCellLib::getDffNegClkPosAsyncRstPortRstVal());
      rst_value_def = generateNetDecl(rst_value_id, reg_data_type);
      if (!transferRightExpression(rst_value_def, rst_value)) {
        fs_assert(0);
        return false;
      }
    }
    std::string dff_name = MacroCellLib::getDffNegClkPosAsyncRstName();
    ExternModule* dff_module = getMacroCellLib()->addCellDffNegClkPosAsyncRst("");
    fs_assert(dff_module != NULL);
    IdDef* param_width = dff_module->getParam(MacroCellLib::getDffNegClkPosAsyncRstParamWidth());
    fs_assert(param_width != NULL);
    std::vector<IdDef*>& ports = dff_module->getPorts();
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, dff_name);
    fs_assert(instantiation != NULL);
    //add param_value
    int width = getPostTypeWidth(reg_data_type);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    for (size_t p = 0; p < ports.size(); p++) {
      std::string port_id = ports[p]->getName();
      std::string net_id = getDffPortId(inst_id, port_id);
      if (port_id == MacroCellLib::getDffNegClkPosAsyncRstPortClk()) {
        generatePortConnect(inst_id_def, port_id, NULL, clk_signal);
      } else if (port_id == MacroCellLib::getDffNegClkPosAsyncRstPortRst()) {
        generatePortConnect(inst_id_def, port_id, NULL, rst_signal);
      } else if (port_id == MacroCellLib::getDffNegClkPosAsyncRstPortRstVal()) {
        generatePortConnect(inst_id_def, port_id, rst_value_def, rst_value);
      } else {
        PortConnect* port_connect = inst_id_def->addPortConnect(port_id);
        port_connect->setConnection(net_id);
      }
    }
    return true;
  }
  bool TransferModule::generateNegClkNegAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value) {
    fs_assert(reg_data_type != NULL);
    fs_assert(clk_signal != NULL);
    fs_assert(rst_signal != NULL);
    fs_assert(rst_value != NULL);
    IdDef* rst_value_def = NULL;
    if (rst_value->isOperationExpression()) {
      std::string rst_value_id = getDffPortId(inst_id, MacroCellLib::getDffNegClkNegAsyncRstPortRstVal());
      rst_value_def = generateNetDecl(rst_value_id, reg_data_type);
      if (!transferRightExpression(rst_value_def, rst_value)) {
        fs_assert(0);
        return false;
      }
    }
    std::string dff_name = MacroCellLib::getDffNegClkNegAsyncRstName();
    ExternModule* dff_module = getMacroCellLib()->addCellDffNegClkNegAsyncRst("");
    fs_assert(dff_module != NULL);
    IdDef* param_width = dff_module->getParam(MacroCellLib::getDffNegClkNegAsyncRstParamWidth());
    fs_assert(param_width != NULL);
    std::vector<IdDef*>& ports = dff_module->getPorts();
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(inst_id, dff_name);
    fs_assert(instantiation != NULL);
    //add param_value
    int width = getPostTypeWidth(reg_data_type);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    for (size_t p = 0; p < ports.size(); p++) {
      std::string port_id = ports[p]->getName();
      std::string net_id = getDffPortId(inst_id, port_id);
      if (port_id == MacroCellLib::getDffNegClkNegAsyncRstPortClk()) {
        generatePortConnect(inst_id_def, port_id, NULL, clk_signal);
      } else if (port_id == MacroCellLib::getDffNegClkNegAsyncRstPortRst()) {
        generatePortConnect(inst_id_def, port_id, NULL, rst_signal);
      } else if (port_id == MacroCellLib::getDffNegClkNegAsyncRstPortRstVal()) {
        generatePortConnect(inst_id_def, port_id, rst_value_def, rst_value);
      } else {
        PortConnect* port_connect = inst_id_def->addPortConnect(port_id);
        port_connect->setConnection(net_id);
      }
    }
    return true;
  }
  bool TransferModule::generateRegisterResetMuxInst(const std::string& reg_id, firDB::firExp* reg_reset, firDB::firExp* reg_init, firDB::firType* reg_type_data) {
    fs_assert(reg_reset != NULL);
    fs_assert(reg_init != NULL);
    fs_assert(reg_type_data != NULL);
    std::string inst_name;
    std::string module_name;
    ExternModule* mux_module = NULL;
    IdDef* port_y = NULL;
    IdDef* port_sel = NULL;
    IdDef* port_a = NULL;
    IdDef* port_b = NULL;
    std::string reg_d_id = getDffPortDId(reg_id);  //get reg_d idDef
    IdDef* reg_d_def = this->getVerilogModule()->findDeclared(reg_d_id);
    fs_assert(reg_d_def != NULL);
    //std::string net_y = getTempWireId();
    //IdDef* net_y_def = generateNetDecl(net_y, reg_type_data);
    //fs_assert(net_y_def != NULL);
    std::string port_b_connect_id = getTempWireId();
    IdDef* net_b_def = generateNetDecl(port_b_connect_id, reg_type_data);
    fs_assert(net_b_def != NULL);
    if (register_mux_port_b_map_.find(reg_d_def) != register_mux_port_b_map_.end()) {
      fs_assert(0);
    }
    register_mux_port_b_map_.insert(std::make_pair(reg_d_def, net_b_def));

    std::string mux_param_width = "";
    if (reg_type_data->isSIntType()) {
      inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeMuxSigned);
      module_name = MacroCellLib::getMuxSignedName();
      mux_module = this->getMacroCellLib()->addCellMuxSigned("");
      port_y = mux_module->getPort(MacroCellLib::getMuxSignedPortY());
      port_sel = mux_module->getPort(MacroCellLib::getMuxSignedPortSel());
      port_a = mux_module->getPort(MacroCellLib::getMuxSignedPortA());
      port_b = mux_module->getPort(MacroCellLib::getMuxSignedPortB());
      mux_param_width = MacroCellLib::getMuxSignedParamWidth();
      fs_assert(port_y && port_sel && port_a && port_b);
    } else {
      inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeMuxUnsigned);
      module_name = MacroCellLib::getMuxUnsignedName();
      mux_module = this->getMacroCellLib()->addCellMuxUnsigned("");
      port_y = mux_module->getPort(MacroCellLib::getMuxUnsignedPortY());
      port_sel = mux_module->getPort(MacroCellLib::getMuxUnsignedPortSel());
      port_a = mux_module->getPort(MacroCellLib::getMuxUnsignedPortA());
      port_b = mux_module->getPort(MacroCellLib::getMuxUnsignedPortB());
      mux_param_width = MacroCellLib::getMuxUnsignedParamWidth();
      fs_assert(port_y && port_sel && port_a && port_b);
    }
    fs_assert(mux_module != NULL);
    IdDef* param_width = mux_module->getParam(mux_param_width);
    fs_assert(param_width != NULL);
    int width = getPostTypeWidth(reg_type_data);
    ModuleInstantiation* instantiation = this->getVerilogModule()->addInstance(inst_name, module_name);
    fs_assert(instantiation != NULL);
    PortConnect* param_connect = instantiation->addParamValue(param_width->getName());
    param_connect->setConnection(width);
    IdDef* inst_id_def = instantiation->getInstance();
    fs_assert(inst_id_def != NULL);
    PortConnect* port_y_connect = inst_id_def->addPortConnect(port_y->getName());
    fs_assert(port_y_connect);
    port_y_connect->setConnection(reg_d_id);
    PortConnect* port_sel_connect = inst_id_def->addPortConnect(port_sel->getName());
    fs_assert(port_sel_connect);
    if (reg_reset->isNumberExpression()) {
      if (!generateNumExpConnection(port_sel_connect, reg_reset)) {
        fs_assert(0);
        return false;
      }
    } else {
      IdDef* sel_id_def = getIdExpressionIdDef(reg_reset);
      fs_assert(sel_id_def);
      port_sel_connect->setConnection(sel_id_def->getName());
    }
    PortConnect* port_a_connect = inst_id_def->addPortConnect(port_a->getName());
    fs_assert(port_a_connect);
    if (reg_init->isNumberExpression()) {
      if (!generateNumExpConnection(port_a_connect, reg_init)) {
        fs_assert(0);
        return false;
      }
    } else {
      IdDef* a_id_def = getIdExpressionIdDef(reg_init);
      fs_assert(a_id_def);
      port_a_connect->setConnection(a_id_def->getName());
    }
    PortConnect* port_b_connect = inst_id_def->addPortConnect(port_b->getName());
    fs_assert(port_b_connect);
    port_b_connect->setConnection(port_b_connect_id);
    return true;
  }
  bool TransferModule::transferItemMemoryToVerilog(firDB::firItemMemory* item_memory) {
    fs_assert(item_memory != NULL);
    std::string mem_id = getWriteId(item_memory->id(), getFirrtlModule());
    firDB::firType* mem_type = item_memory->type_data();
    fs_assert(mem_type != NULL);
    unsigned int depth = item_memory->depth();
    unsigned int read_latency = item_memory->read_latency();
    unsigned int write_latency = item_memory->write_latency();
    if (read_latency != 0 && write_latency != 1) {
      fs_warning("*WARNING*: The read latency (%u) of memory '%s' was not 0 or 1. By default, 0 is for 'cmem' and 1 for 'smem'.\n", read_latency, mem_id.c_str());
    }
    if (write_latency != 1) {
      fs_warning("*WARNING*: The write latency (%u) of memory '%s' was not 1. By default, the write latency of a memory is 1.\n", write_latency, mem_id.c_str());
    }
    bool is_sync = read_latency > 0 ? 1 : 0;
    std::vector<std::pair<std::string, firDB::MPortDir>>& post_memport_ports = item_memory->ports();
    std::vector<std::pair<std::string, firDB::MPortDir>> readers;
    std::vector<std::pair<std::string, firDB::MPortDir>> writers;
    int reader_nums = 0;
    int writer_nums = 0;
    for (size_t pmp = 0; pmp < post_memport_ports.size(); pmp++) {
      std::pair<std::string, firDB::MPortDir>& post_memport_port = post_memport_ports[pmp];
      std::string mport_id = getWriteId(post_memport_port.first, this->getFirrtlModule());
      if (post_memport_port.second == firDB::MPortDir::kMPortDirRead) {
        reader_nums++;
        readers.push_back(std::make_pair(mport_id, post_memport_port.second));
        if (!generateMemReaderNets(mem_id, mport_id, depth, mem_type)) {
          fs_assert(0);
          return false;
        }
      } else if (post_memport_port.second == firDB::MPortDir::kMPortDirWrite) {
        writer_nums++;
        writers.push_back(std::make_pair(mport_id, post_memport_port.second));
        if (!generateMemWriterNets(mem_id, mport_id, depth, mem_type)) {
          fs_assert(0);
          return false;
        }
      } else if (post_memport_port.second == firDB::MPortDir::kMPortDirRdwr) {
        reader_nums++;
        writer_nums++;
        readers.push_back(std::make_pair(mport_id, post_memport_port.second));
        writers.push_back(std::make_pair(mport_id, post_memport_port.second));
        if (!generateMemReadWriterNets(mem_id, mport_id, depth, mem_type)) {
          fs_assert(0);
          return false;
        }
      } else if (post_memport_port.second == firDB::MPortDir::kMPortDirInfer) {
        fs_error("*ERROR*: The type of MPort '%s' was 'infer'. The type should have been inferred to be 'read', 'write', or 'readwrite' before writing Verilog.\n", post_memport_port.first.c_str());
        fs_assert(0);
        return false;
      } else if (post_memport_port.second == firDB::MPortDir::kMPortDirUndef) {
        fs_error("*ERROR*: The type of MPort '%s' was undefined. The valid type should be 'read', 'write', or 'readwrite' before writing Verilog.\n", post_memport_port.first.c_str());
        fs_assert(0);
        return false;
      } else {
        fs_error("*ERROR*: The type of MPort '%s' was unknown to write Verilog.\n", post_memport_port.first.c_str());
        fs_assert(0);
        return false;
      }
    }
    if (reader_nums == 0) {
      fs_warning("*WARNING*: There is no 'read' type or 'readwrite' type MPort in Memory '%s'.\n", mem_id.c_str());
    }
    if (reader_nums + writer_nums == 0) {
      fs_warning("*WARNING*: There is no MPort in memory '%s', none of type 'read', 'write', or 'readwrite'.\n", mem_id.c_str());
    }
    if (reader_nums > 0) {
      if (writer_nums == 0) {
        if (reader_nums == 1) {
          std::string readers_id = readers[0].first;
          firDB::MPortDir readers_dir = readers[0].second;
          if (!generateRomMem(mem_id, std::make_pair(readers_id, readers_dir), mem_type, depth, is_sync)) {
            fs_assert(0);
            return false;
          }
        } else {
          if (!generateMultiRomMem(mem_id, readers, mem_type, depth, is_sync)) {
            fs_assert(0);
            return false;
          }
        }
      } else {
        if (reader_nums == 1 && writer_nums == 1) {
          std::string readers_id = readers[0].first;
          firDB::MPortDir readers_dir = readers[0].second;
          std::string writers_id = writers[0].first;
          firDB::MPortDir writers_dir = writers[0].second;
          if (!generateRamMem(mem_id, std::make_pair(readers_id, readers_dir), std::make_pair(writers_id, writers_dir), mem_type, depth, is_sync)) {
            fs_assert(0);
            return false;
          }
        } else {
          if (!generateMultiRamMem(mem_id, readers, writers, mem_type, depth, is_sync)) {
            fs_assert(0);
            return false;
          }
        }
      }
    } else {
      fs_warning("*WARNING*: No Verilog would be written for memory '%s' because it had no 'read' or 'readwrite' MPort.\n", mem_id.c_str());
    }
    return true;
  }
  bool TransferModule::generateMemReaderNets(const std::string& mem_id, const std::string& mport_id, unsigned int depth, firDB::firType* mem_type) {
    fs_assert(mem_type != NULL);
    unsigned int addrbits = (unsigned int)std::log2(depth);
    if ((unsigned int)std::pow(2, addrbits) < depth) {
      fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
      addrbits += 1;
      fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, addrbits);
    }
    std::string data_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRead, firDB::MemPortType::kMemPortData);
    std::string data_net_id = getMemoryPinId(mem_id, mport_id, data_id);
    IdDef* data_net_def = generateNetDecl(data_net_id, mem_type);
    fs_assert(data_net_def != NULL);
    std::string clk_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRead, firDB::MemPortType::kMemPortClk);
    std::string clk_net_id = getMemoryPinId(mem_id, mport_id, clk_id);
    IdDef* clk_net_def = generateNetDecl(clk_net_id, 1, false);
    fs_assert(clk_net_def != NULL);
    std::string en_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRead, firDB::MemPortType::kMemPortEn);
    std::string en_net_id = getMemoryPinId(mem_id, mport_id, en_id);
    IdDef* en_net_def = generateNetDecl(en_net_id, 1, false);
    fs_assert(en_net_def != NULL);
    std::string addr_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRead, firDB::MemPortType::kMemPortAddr);
    std::string addr_net_id = getMemoryPinId(mem_id, mport_id, addr_id);
    IdDef* addr_net_def = generateNetDecl(addr_net_id, addrbits, false);
    fs_assert(addr_net_def != NULL);
    return true;
  }
  bool TransferModule::generateMemWriterNets(const std::string& mem_id, const std::string& mport_id, unsigned int depth, firDB::firType* mem_type) {
    fs_assert(mem_type != NULL);
    unsigned int addrbits = (unsigned int)std::log2(depth);
    if ((unsigned int)std::pow(2, addrbits) < depth) {
      fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
      addrbits += 1;
      fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, addrbits);
    }
    std::string clk_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirWrite, firDB::MemPortType::kMemPortClk);
    std::string clk_net_id = getMemoryPinId(mem_id, mport_id, clk_id);
    IdDef* clk_net_def = generateNetDecl(clk_net_id, 1, false);
    fs_assert(clk_net_def != NULL);
    std::string en_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirWrite, firDB::MemPortType::kMemPortEn);
    std::string en_net_id = getMemoryPinId(mem_id, mport_id, en_id);
    IdDef* en_net_def = generateNetDecl(en_net_id, 1, false);
    fs_assert(en_net_def != NULL);
    std::string mask_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirWrite, firDB::MemPortType::kMemPortMask);
    std::string mask_net_id = getMemoryPinId(mem_id, mport_id, mask_id);
    IdDef* mask_net_def = generateNetDecl(mask_net_id, 1, false);
    fs_assert(mask_net_def != NULL);
    std::string addr_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirWrite, firDB::MemPortType::kMemPortAddr);
    std::string addr_net_id = getMemoryPinId(mem_id, mport_id, addr_id);
    IdDef* addr_net_def = generateNetDecl(addr_net_id, addrbits, false);
    fs_assert(addr_net_def != NULL);
    std::string data_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirWrite, firDB::MemPortType::kMemPortData);
    std::string data_net_id = getMemoryPinId(mem_id, mport_id, data_id);
    IdDef* data_net_def = generateNetDecl(data_net_id, mem_type);
    fs_assert(data_net_def != NULL);
    return true;
  }
  bool TransferModule::generateMemReadWriterNets(const std::string& mem_id, const std::string& mport_id, unsigned int depth, firDB::firType* mem_type) {
    fs_assert(mem_type != NULL);
    unsigned int addrbits = (unsigned int)std::log2(depth);
    if ((unsigned int)std::pow(2, addrbits) < depth) {
      fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
      addrbits += 1;
      fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, addrbits);
    }
    std::string r_data_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortRData);
    std::string r_data_net_id = getMemoryPinId(mem_id, mport_id, r_data_id);
    IdDef* r_data_net_def = generateNetDecl(r_data_net_id, mem_type);
    fs_assert(r_data_net_def != NULL);
    std::string w_mode_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortWMode);
    std::string w_mode_net_id = getMemoryPinId(mem_id, mport_id, w_mode_id);
    IdDef* w_mode_net_def = generateNetDecl(w_mode_net_id, 1, false);
    fs_assert(w_mode_net_def != NULL);
    std::string clk_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortClk);
    std::string clk_net_id = getMemoryPinId(mem_id, mport_id, clk_id);
    IdDef* clk_net_def = generateNetDecl(clk_net_id, 1, false);
    fs_assert(clk_net_def != NULL);
    std::string en_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortEn);
    std::string en_net_id = getMemoryPinId(mem_id, mport_id, en_id);
    IdDef* en_net_def = generateNetDecl(en_net_id, 1, false);
    fs_assert(en_net_def != NULL);
    std::string w_mask_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortWMask);
    std::string w_mask_net_id = getMemoryPinId(mem_id, mport_id, w_mask_id);
    IdDef* w_mask_net_def = generateNetDecl(w_mask_net_id, 1, false);
    fs_assert(w_mask_net_def != NULL);
    std::string addr_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortAddr);
    std::string addr_net_id = getMemoryPinId(mem_id, mport_id, addr_id);
    IdDef* addr_net_def = generateNetDecl(addr_net_id, addrbits, false);
    fs_assert(addr_net_def != NULL);
    std::string w_data_id = firDB::firItemMemory::getMemPortId(firDB::MPortDir::kMPortDirRdwr, firDB::MemPortType::kMemPortWData);
    std::string w_data_net_id = getMemoryPinId(mem_id, mport_id, w_data_id);
    IdDef* w_data_net_def = generateNetDecl(w_data_net_id, mem_type);
    fs_assert(w_data_net_def != NULL);
    return true;
  }
  void TransferModule::generateMultiRomNets(const std::string& mem_id, int reader_num, unsigned int addrbits, firDB::firType* mem_type) {
    fs_assert(mem_type != NULL);
    int type_width = getPostTypeWidth(mem_type);
    int data_width = type_width * reader_num;
    bool is_signed = getPostTypeSign(mem_type);
    std::string datas_id = mem_id + "_" + MacroCellLib::getMRRomMemPortReadDatas();
    IdDef* datas_def = generateNetDecl(datas_id, data_width, is_signed);
    fs_assert(datas_def != NULL);
    std::string clocks_id = mem_id + "_" + MacroCellLib::getMRRomMemPortReadClks();
    IdDef* clocks_def = generateNetDecl(clocks_id, reader_num, false);
    fs_assert(clocks_def != NULL);
    std::string ens_id = mem_id + "_" + MacroCellLib::getMRRomMemPortReadEns();
    IdDef* ens_def = generateNetDecl(ens_id, reader_num, false);
    fs_assert(ens_def != NULL);
    int read_addrbits = addrbits * reader_num;
    std::string addrs_id = mem_id + "_" + MacroCellLib::getMRRomMemPortReadAddrs();
    IdDef* addr_def = generateNetDecl(addrs_id, read_addrbits, false);
    fs_assert(addr_def != NULL);
  }
  void TransferModule::generateMultiRamNets(const std::string& mem_id, int reader_num, int writer_num, unsigned int addrbits, firDB::firType* mem_type) {
    fs_assert(mem_type != NULL);
    int type_width = getPostTypeWidth(mem_type);
    bool is_signed = getPostTypeSign(mem_type);
    int read_data_width = reader_num * type_width;
    std::string read_datas_id = mem_id + "_" + MacroCellLib::getMRMWMemPortReadDatas();
    IdDef* read_datas_def = generateNetDecl(read_datas_id, read_data_width, is_signed);
    fs_assert(read_datas_def != NULL);
    std::string read_clocks_id = mem_id + "_" + MacroCellLib::getMRMWMemPortReadClks();
    IdDef* read_clocks_def = generateNetDecl(read_clocks_id, reader_num, false);
    fs_assert(read_clocks_def != NULL);
    std::string read_ens_id = mem_id + "_" + MacroCellLib::getMRMWMemPortReadEns();
    IdDef* read_ens_def = generateNetDecl(read_ens_id, reader_num, false);
    fs_assert(read_ens_def != NULL);
    int read_addrbits = addrbits * reader_num;
    std::string read_addrs_id = mem_id + "_" + MacroCellLib::getMRMWMemPortReadAddrs();
    IdDef* read_addr_def = generateNetDecl(read_addrs_id, read_addrbits, false);
    fs_assert(read_addr_def != NULL);
    std::string write_clocks_id = mem_id + "_" + MacroCellLib::getMRMWMemPortWriteClks();
    IdDef* write_clocks_def = generateNetDecl(write_clocks_id, writer_num, false);
    fs_assert(write_clocks_def != NULL);
    std::string write_ens_id = mem_id + "_" + MacroCellLib::getMRMWMemPortWriteEns();
    IdDef* write_ens_def = generateNetDecl(write_ens_id, writer_num, false);
    fs_assert(write_ens_def != NULL);
    std::string write_masks_id = mem_id + "_" + MacroCellLib::getMRMWMemPortWriteMasks();
    IdDef* write_masks_def = generateNetDecl(write_masks_id, writer_num, false);
    fs_assert(write_masks_def != NULL);
    int write_addrbits = addrbits * writer_num;
    std::string write_addrbits_id = mem_id + "_" + MacroCellLib::getMRMWMemPortWriteAddrs();
    IdDef* write_addrs_def = generateNetDecl(write_addrbits_id, write_addrbits, false);
    fs_assert(write_addrs_def != NULL);
    int write_datas_width = type_width * writer_num;
    std::string write_datas_id = mem_id + "_" + MacroCellLib::getMRMWMemPortWriteDatas();
    IdDef* write_datas_def = generateNetDecl(write_datas_id, write_datas_width, false);
    fs_assert(write_datas_def != NULL);
  }
  bool TransferModule::generateRomMem(const std::string& mem_id, std::pair<std::string, firDB::MPortDir> reader, firDB::firType* mem_type, unsigned int depth, bool is_sync_read) {
    fs_assert(mem_type != NULL);
    std::string mport_id = reader.first;
    firDB::MPortDir mport_dir = reader.second;
    int width = getPostTypeWidth(mem_type);
    unsigned int addrbits = 0;
    if (depth == 0) {
      fs_error("*ERROR*: The depth (%u) was invalid for memory '%s' to write Verilog.\n", depth, mem_id.c_str());
      fs_assert(0);
      return false;
    } else if (depth == 1) {
      addrbits = 1;
    } else {
      unsigned int expect_addrbits = (unsigned int)std::log2(depth);
      if ((unsigned int)std::pow(2, expect_addrbits) < depth) {
        fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
        expect_addrbits += 1;
        fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, expect_addrbits);
      }
      addrbits = expect_addrbits;
    }
    std::string module_name = MacroCellLib::getRomMemName();
    ExternModule* rom_module = getMacroCellLib()->addCellRomMem("");
    fs_assert(rom_module != NULL);
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(mem_id, module_name);
    fs_assert(instantiation != NULL);
    //parameter depth
    PortConnect* depth_connect = instantiation->addParamValue(MacroCellLib::getRomMemParamDepth());
    depth_connect->setConnection(depth);
    //parameter addrsbits
    PortConnect* addr_bits_connect = instantiation->addParamValue(MacroCellLib::getRomMemParamAddrbits());
    addr_bits_connect->setConnection(addrbits);
    //parameter width
    PortConnect* width_connect = instantiation->addParamValue(MacroCellLib::getRomMemParamWidth());
    width_connect->setConnection(width);
    //parameter isSync
    PortConnect* is_sync_connect = instantiation->addParamValue(MacroCellLib::getRomMemParamIsSyncRead());
    int is_sync = is_sync_read ? 1 : 0;
    is_sync_connect->setConnection(is_sync);
    IdDef* inst_def = instantiation->getInstance();
    fs_assert(inst_def != NULL);
    //read_data
    std::string read_data_id = rom_module->getPort(MacroCellLib::getRomMemPortReadData())->getName();
    PortConnect* data_connect = inst_def->addPortConnect(read_data_id);
    std::string mport_data;
    if (mport_dir == firDB::MPortDir::kMPortDirRead) {
      mport_data = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortData));
    } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
      mport_data = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortRData));
    } else {
      fs_assert(0);
      return false;
    }
    data_connect->setConnection(mport_data);
    //read_clk
    std::string read_clk_id = rom_module->getPort(MacroCellLib::getRomMemPortReadClk())->getName();
    PortConnect* clk_connect = inst_def->addPortConnect(read_clk_id);
    std::string mport_clk = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortClk));
    clk_connect->setConnection(mport_clk);
    //read_en
    std::string read_en_id = rom_module->getPort(MacroCellLib::getRomMemPortReadEn())->getName();
    PortConnect* en_connect = inst_def->addPortConnect(read_en_id);
    std::string mport_en = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortEn));
    en_connect->setConnection(mport_en);
    //read_addr
    std::string read_addr_id = rom_module->getPort(MacroCellLib::getRomMemPortReadAddr())->getName();
    PortConnect* addr_connect = inst_def->addPortConnect(read_addr_id);
    std::string mport_addr = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortAddr));
    addr_connect->setConnection(mport_addr);
    return true;
  }
  bool TransferModule::generateRamMem(const std::string& mem_id, std::pair<std::string, firDB::MPortDir> reader, std::pair<std::string, firDB::MPortDir> writer, firDB::firType* mem_type, unsigned int depth, bool is_sync_read) {
    fs_assert(mem_type != NULL);
    firDB::MPortDir read_dir = reader.second;
    firDB::MPortDir write_dir = writer.second;
    std::string read_mport_id = reader.first;
    std::string write_mport_id = writer.first;
    int width = getPostTypeWidth(mem_type);
    unsigned int addrbits = 0;
    if (depth == 0) {
      fs_error("*ERROR*: The depth (%u) was invalid for memory '%s' to write Verilog.\n", depth, mem_id.c_str());
      fs_assert(0);
      return false;
    } else if (depth == 1) {
      addrbits = 1;
    } else {
      unsigned int expect_addrbits = (unsigned int)std::log2(depth);
      if ((unsigned int)std::pow(2, expect_addrbits) < depth) {
        fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
        expect_addrbits += 1;
        fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, expect_addrbits);
      }
      addrbits = expect_addrbits;
    }
    std::string mport_rdata;
    std::string mport_wdata;
    std::string mport_wmask;
    std::string mport_ren = getMemoryPinId(mem_id, read_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortEn));
    if (read_dir == firDB::MPortDir::kMPortDirRead) {
      mport_rdata = getMemoryPinId(mem_id, read_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortData));
    } else if (read_dir == firDB::MPortDir::kMPortDirRdwr) {
      std::string rmode_id = getMemoryPinId(mem_id, read_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortWMode));
      IdDef* rmode_def = this->getVerilogModule()->findDeclared(rmode_id);
      fs_assert(rmode_def != NULL);
      std::string not_y_id = getTempWireId();
      IdDef* not_y_net = generateNetDecl(not_y_id, 1, false);
      ExternModule* not_module = this->getMacroCellLib()->addCellBitwiseNot("");
      std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseNot);
      ModuleInstantiation* not_instantiation = this->getVerilogModule()->addInstance(inst_name, not_module->getName());
      PortConnect* width_connect = not_instantiation->addParamValue(MacroCellLib::getBitwiseNotParamWidth());
      width_connect->setConnection(1);
      IdDef* inst_id_def = not_instantiation->getInstance();
      generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortY(), not_y_net, NULL);
      generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortIn(), rmode_def, NULL);
      mport_ren = not_y_id;
      mport_rdata = getMemoryPinId(mem_id, read_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortRData));
    } else {
      fs_assert(0);
      return false;
    }

    std::string mport_wen = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortEn));
    if (write_dir == firDB::MPortDir::kMPortDirWrite) {
      mport_wdata = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortData));
      mport_wmask = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortMask));
    } else if (write_dir == firDB::MPortDir::kMPortDirRdwr) {
      std::string wmode_id = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortWMode));
      mport_wen = wmode_id;
      mport_wdata = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortWData));
      mport_wmask = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortWMask));
    } else {
      fs_assert(0);
      return false;
    }
    std::string module_name = MacroCellLib::getRamMemName();
    ExternModule* ram_module = getMacroCellLib()->addCellRamMem("");
    fs_assert(ram_module != NULL);
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(mem_id, module_name);
    fs_assert(instantiation != NULL);
    //parameter depth
    PortConnect* depth_connect = instantiation->addParamValue(MacroCellLib::getRamMemParamDepth());
    depth_connect->setConnection(depth);
    //parameter addrsbits
    PortConnect* addr_bits_connect = instantiation->addParamValue(MacroCellLib::getRamMemParamAddrbits());
    addr_bits_connect->setConnection(addrbits);
    //parameter width
    PortConnect* width_connect = instantiation->addParamValue(MacroCellLib::getRamMemParamWidth());
    width_connect->setConnection(width);
    //parameter isSync
    PortConnect* is_sync_connect = instantiation->addParamValue(MacroCellLib::getRamMemParamIsSyncRead());
    int is_sync = is_sync_read ? 1 : 0;
    is_sync_connect->setConnection(is_sync);
    IdDef* inst_def = instantiation->getInstance();
    fs_assert(inst_def != NULL);
    //read_data
    std::string read_data_id = ram_module->getPort(MacroCellLib::getRamMemPortReadData())->getName();
    PortConnect* rdata_connect = inst_def->addPortConnect(read_data_id);
    rdata_connect->setConnection(mport_rdata);
    //read_clk
    std::string read_clk_id = ram_module->getPort(MacroCellLib::getRamMemPortReadClk())->getName();
    PortConnect* rclk_connect = inst_def->addPortConnect(read_clk_id);
    std::string mport_rclk = getMemoryPinId(mem_id, read_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortClk));
    rclk_connect->setConnection(mport_rclk);
    //read_en
    std::string read_en_id = ram_module->getPort(MacroCellLib::getRamMemPortReadEn())->getName();
    PortConnect* ren_connect = inst_def->addPortConnect(read_en_id);
    ren_connect->setConnection(mport_ren);
    //read_addr
    std::string read_addr_id = ram_module->getPort(MacroCellLib::getRamMemPortReadAddr())->getName();
    PortConnect* raddr_connect = inst_def->addPortConnect(read_addr_id);
    std::string mport_raddr = getMemoryPinId(mem_id, read_mport_id, firDB::firItemMemory::getMemPortId(read_dir, firDB::MemPortType::kMemPortAddr));
    raddr_connect->setConnection(mport_raddr);

    //write_clk
    std::string write_clk_id = ram_module->getPort(MacroCellLib::getRamMemPortWriteClk())->getName();
    PortConnect* wclk_connect = inst_def->addPortConnect(write_clk_id);
    std::string mport_wclk = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortClk));
    wclk_connect->setConnection(mport_wclk);
    //write_en
    std::string write_en_id = ram_module->getPort(MacroCellLib::getRamMemPortWriteEn())->getName();
    PortConnect* wen_connect = inst_def->addPortConnect(write_en_id);
    wen_connect->setConnection(mport_wen);
    //write_mask
    std::string write_mask_id = ram_module->getPort(MacroCellLib::getRamMemPortWriteMask())->getName();
    PortConnect* wmask_connect = inst_def->addPortConnect(write_mask_id);
    wmask_connect->setConnection(mport_wmask);
    //write_addr
    std::string write_addr_id = ram_module->getPort(MacroCellLib::getRamMemPortWriteAddr())->getName();
    PortConnect* waddr_connect = inst_def->addPortConnect(write_addr_id);
    std::string mport_waddr = getMemoryPinId(mem_id, write_mport_id, firDB::firItemMemory::getMemPortId(write_dir, firDB::MemPortType::kMemPortAddr));
    waddr_connect->setConnection(mport_waddr);
    //write_data
    std::string write_data_id = ram_module->getPort(MacroCellLib::getRamMemPortWriteData())->getName();
    PortConnect* wdata_connect = inst_def->addPortConnect(write_data_id);
    wdata_connect->setConnection(mport_wdata);
    return true;
  }
  bool TransferModule::generateMultiRomMem(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, firDB::firType* mem_type, unsigned int depth, bool is_sync_read) {
    fs_assert(mem_type != NULL);
    fs_assert(readers.size() > 1);
    int width = getPostTypeWidth(mem_type);
    unsigned int addrbits = 0;
    int readernum = static_cast<int>(readers.size());
    if (depth == 0) {
      fs_error("*ERROR*: The depth (%u) was invalid for memory '%s' to write Verilog.\n", depth, mem_id.c_str());
      fs_assert(0);
      return false;
    } else if (depth == 1) {
      addrbits = 1;
    } else {
      unsigned int expect_addrbits = (unsigned int)std::log2(depth);
      if ((unsigned int)std::pow(2, expect_addrbits) < depth) {
        fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
        expect_addrbits += 1;
        fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, expect_addrbits);
      }
      addrbits = expect_addrbits;
    }
    generateMultiRomNets(mem_id, readernum, addrbits, mem_type);
    generateMultiRomMemAssign(mem_id, readers, width, addrbits);
    std::string module_name = MacroCellLib::getMRRomMemName();
    ExternModule* mrrom_module = getMacroCellLib()->addCellMRRomMem("");
    fs_assert(mrrom_module != NULL);
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(mem_id, module_name);
    fs_assert(instantiation != NULL);
    //parameter depth
    PortConnect* depth_connect = instantiation->addParamValue(MacroCellLib::getMRRomMemParamDepth());
    depth_connect->setConnection(depth);
    //parameter addrsbits
    PortConnect* addr_bits_connect = instantiation->addParamValue(MacroCellLib::getMRRomMemParamAddrbits());
    addr_bits_connect->setConnection(addrbits);
    //parameter width
    PortConnect* width_connect = instantiation->addParamValue(MacroCellLib::getMRRomMemParamWidth());
    width_connect->setConnection(width);
    //parameter readernum
    PortConnect* readernum_connect = instantiation->addParamValue(MacroCellLib::getMRRomMemParamReadernum());
    readernum_connect->setConnection(readernum);
    //parameter isSync
    PortConnect* is_sync_connect = instantiation->addParamValue(MacroCellLib::getMRRomMemParamIsSyncRead());
    int is_sync = is_sync_read ? 1 : 0;
    is_sync_connect->setConnection(is_sync);
    IdDef* inst_def = instantiation->getInstance();
    fs_assert(inst_def != NULL);

    //read_data
    PortConnect* read_datas_connect = inst_def->addPortConnect(MacroCellLib::getMRRomMemPortReadDatas());
    std::string rdata_id = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadDatas());
    read_datas_connect->setConnection(rdata_id);
    //read_clk
    PortConnect* read_clks_connect = inst_def->addPortConnect(MacroCellLib::getMRRomMemPortReadClks());
    std::string rclk_id = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadClks());
    read_clks_connect->setConnection(rclk_id);
    //read_en
    PortConnect* read_ens_connect = inst_def->addPortConnect(MacroCellLib::getMRRomMemPortReadEns());
    std::string ren_id = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadEns());
    read_ens_connect->setConnection(ren_id);
    //read_addr
    PortConnect* read_addrs_connect = inst_def->addPortConnect(MacroCellLib::getMRRomMemPortReadAddrs());
    std::string raddr_id = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadAddrs());
    read_addrs_connect->setConnection(raddr_id);
    return true;
  }
  bool TransferModule::generateMultiRamMem(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, std::vector<std::pair<std::string, firDB::MPortDir>> writers, firDB::firType* mem_type, unsigned int depth, bool is_sync_read) {
    fs_assert(mem_type != NULL);
    int width = getPostTypeWidth(mem_type);
    unsigned int addrbits = 0;
    int readernum = static_cast<int>(readers.size());
    int writernum = static_cast<int>(writers.size());
    if (depth == 0) {
      fs_error("*ERROR*: The depth (%u) was invalid for memory '%s' to write Verilog.\n", depth, mem_id.c_str());
      fs_assert(0);
      return false;
    } else if (depth == 1) {
      addrbits = 1;
    } else {
      unsigned int expect_addrbits = (unsigned int)std::log2(depth);
      if ((unsigned int)std::pow(2, expect_addrbits) < depth) {
        fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
        expect_addrbits += 1;
        fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), depth, expect_addrbits);
      }
      addrbits = expect_addrbits;
    }
    generateMultiRamNets(mem_id, readernum, writernum, addrbits, mem_type);
    generateMultiRamMemAssign(mem_id, readers, writers, width, addrbits);

    std::string module_name = MacroCellLib::getMRMWMemName();
    ExternModule* mrram_module = getMacroCellLib()->addCellMRMWMem("");
    fs_assert(mrram_module != NULL);
    ModuleInstantiation* instantiation = getVerilogModule()->addInstance(mem_id, module_name);
    fs_assert(instantiation != NULL);
    //parameter depth
    PortConnect* depth_connect = instantiation->addParamValue(MacroCellLib::getMRMWMemParamDepth());
    depth_connect->setConnection(depth);
    //parameter addrsbits
    PortConnect* addr_bits_connect = instantiation->addParamValue(MacroCellLib::getMRMWMemParamAddrbits());
    addr_bits_connect->setConnection(addrbits);
    //parameter width
    PortConnect* width_connect = instantiation->addParamValue(MacroCellLib::getMRMWMemParamWidth());
    width_connect->setConnection(width);
    //parameter readernum
    PortConnect* readernum_connect = instantiation->addParamValue(MacroCellLib::getMRMWMemParamReadernum());
    readernum_connect->setConnection(readernum);
    //parameter writernum
    PortConnect* writernum_connect = instantiation->addParamValue(MacroCellLib::getMRMWMemParamWriternum());
    writernum_connect->setConnection(writernum);
    //parameter isSync
    PortConnect* is_sync_connect = instantiation->addParamValue(MacroCellLib::getMRMWMemParamIsSyncRead());
    int is_sync = is_sync_read ? 1 : 0;
    is_sync_connect->setConnection(is_sync);
    IdDef* inst_def = instantiation->getInstance();
    fs_assert(inst_def != NULL);

    //read_datas
    std::string read_datas_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadDatas());
    PortConnect* read_datas_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortReadDatas());
    read_datas_connect->setConnection(read_datas_id);
    //read_clk
    std::string read_clks_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadClks());
    PortConnect* read_clks_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortReadClks());
    read_clks_connect->setConnection(read_clks_id);
    //read_en
    std::string read_ens_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadEns());
    PortConnect* read_ens_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortReadEns());
    read_ens_connect->setConnection(read_ens_id);
    //read_addr
    std::string read_addrs_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadAddrs());
    PortConnect* read_addrs_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortReadAddrs());
    read_addrs_connect->setConnection(read_addrs_id);
    //write_clk
    std::string write_clks_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteClks());
    PortConnect* write_clks_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortWriteClks());
    write_clks_connect->setConnection(write_clks_id);
    //write_en
    std::string write_ens_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteEns());
    PortConnect* write_ens_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortWriteEns());
    write_ens_connect->setConnection(write_ens_id);
    //write_mask
    std::string write_masks_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteMasks());
    PortConnect* write_masks_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortWriteMasks());
    write_masks_connect->setConnection(write_masks_id);
    //write_addr
    std::string write_addrs_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteAddrs());
    PortConnect* write_addrs_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortWriteAddrs());
    write_addrs_connect->setConnection(write_addrs_id);
    //write_datas
    std::string write_datas_id = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteDatas());
    PortConnect* write_datas_connect = inst_def->addPortConnect(MacroCellLib::getMRMWMemPortWriteDatas());
    write_datas_connect->setConnection(write_datas_id);
    return true;
  }
  void TransferModule::generateMultiRomMemAssign(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, int width, unsigned int addrbits) {
    std::vector<std::string> mports_rdata_id;
    std::vector<std::string> mports_rclk_id;
    std::vector<std::string> mports_ren_id;
    std::vector<std::string> mports_raddr_id;
    for (size_t r = 0; r < readers.size(); r++) {
      std::string mport_id = readers[r].first;
      firDB::MPortDir mport_dir = readers[r].second;
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        std::string rdata_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortData));
        mports_rdata_id.push_back(rdata_id);
        std::string ren_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortEn));
        mports_ren_id.push_back(ren_id);
      } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
        std::string rdata_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortRData));
        mports_rdata_id.push_back(rdata_id);
        std::string rmode_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortWMode));
        IdDef* rmode_def = this->getVerilogModule()->findDeclared(rmode_id);
        fs_assert(rmode_def != NULL);
        std::string not_y_id = getTempWireId();
        IdDef* not_y_net = generateNetDecl(not_y_id, 1, false);
        ExternModule* not_module = this->getMacroCellLib()->addCellBitwiseNot("");
        std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseNot);
        ModuleInstantiation* not_instantiation = this->getVerilogModule()->addInstance(inst_name, not_module->getName());
        PortConnect* width_connect = not_instantiation->addParamValue(MacroCellLib::getBitwiseNotParamWidth());
        width_connect->setConnection(1);
        IdDef* inst_id_def = not_instantiation->getInstance();
        generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortY(), not_y_net, NULL);
        generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortIn(), rmode_def, NULL);
        mports_ren_id.push_back(not_y_id);
      } else {
        fs_assert(0);
      }
      std::string rclk_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortClk));
      mports_rclk_id.push_back(rclk_id);
      std::string raddr_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortAddr));
      mports_raddr_id.push_back(raddr_id);
    }
    std::string rommem_rdata_port = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadDatas());
    generateMultiMemPortBitsAssign(rommem_rdata_port, mports_rdata_id, width);
    std::string rommem_rclk_port = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadClks());
    generateMultiMemPortCatAssign(rommem_rclk_port, mports_rclk_id, 1);
    std::string rommem_ren_port = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadEns());
    generateMultiMemPortCatAssign(rommem_ren_port, mports_ren_id, 1);
    std::string rommem_raddr_port = getMemModulePinId(mem_id, MacroCellLib::getMRRomMemPortReadAddrs());
    generateMultiMemPortCatAssign(rommem_raddr_port, mports_raddr_id, addrbits);
    mports_rclk_id.clear();
    mports_ren_id.clear();
    mports_raddr_id.clear();
  }
  void TransferModule::generateMultiRamMemAssign(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, std::vector<std::pair<std::string, firDB::MPortDir>> writers, int width, unsigned int addrbits) {
    std::vector<std::string> mports_rdata_id;
    std::vector<std::string> mports_rclk_id;
    std::vector<std::string> mports_ren_id;
    std::vector<std::string> mports_raddr_id;
    for (size_t r = 0; r < readers.size(); r++) {
      std::string mport_id = readers[r].first;
      firDB::MPortDir mport_dir = readers[r].second;
      if (mport_dir == firDB::MPortDir::kMPortDirRead) {
        std::string rdata_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortData));
        mports_rdata_id.push_back(rdata_id);
        std::string ren_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortEn));
        mports_ren_id.push_back(ren_id);
      } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
        std::string rdata_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortRData));
        mports_rdata_id.push_back(rdata_id);
        std::string rmode_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortWMode));
        IdDef* rmode_def = this->getVerilogModule()->findDeclared(rmode_id);
        fs_assert(rmode_def != NULL);
        std::string not_y_id = getTempWireId();
        IdDef* not_y_net = generateNetDecl(not_y_id, 1, false);
        ExternModule* not_module = this->getMacroCellLib()->addCellBitwiseNot("");
        std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBitwiseNot);
        ModuleInstantiation* not_instantiation = this->getVerilogModule()->addInstance(inst_name, not_module->getName());
        PortConnect* width_connect = not_instantiation->addParamValue(MacroCellLib::getBitwiseNotParamWidth());
        width_connect->setConnection(1);
        IdDef* inst_id_def = not_instantiation->getInstance();
        generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortY(), not_y_net, NULL);
        generatePortConnect(inst_id_def, MacroCellLib::getBitwiseNotPortIn(), rmode_def, NULL);
        mports_ren_id.push_back(not_y_id);
      } else {
        fs_assert(0);
      }
      std::string rclk_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortClk));
      mports_rclk_id.push_back(rclk_id);
      std::string raddr_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortAddr));
      mports_raddr_id.push_back(raddr_id);
    }
    std::string mrram_rdata_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadDatas());
    generateMultiMemPortBitsAssign(mrram_rdata_port, mports_rdata_id, width);
    std::string mrram_rclk_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadClks());
    generateMultiMemPortCatAssign(mrram_rclk_port, mports_rclk_id, 1);
    std::string mrram_ren_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadEns());
    generateMultiMemPortCatAssign(mrram_ren_port, mports_ren_id, 1);
    std::string mrram_raddr_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortReadAddrs());
    generateMultiMemPortCatAssign(mrram_raddr_port, mports_raddr_id, addrbits);
    mports_rdata_id.clear();
    mports_rclk_id.clear();
    mports_ren_id.clear();
    mports_raddr_id.clear();

    std::vector<std::string> mports_wdata_id;
    std::vector<std::string> mports_wclk_id;
    std::vector<std::string> mports_wen_id;
    std::vector<std::string> mports_waddr_id;
    std::vector<std::string> mports_wmask_id;
    for (size_t w = 0; w < writers.size(); w++) {
      std::string mport_id = writers[w].first;
      firDB::MPortDir mport_dir = writers[w].second;
      if (mport_dir == firDB::MPortDir::kMPortDirWrite) {
        std::string wdata_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortData));
        mports_wdata_id.push_back(wdata_id);
        std::string wmask_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortMask));
        mports_wmask_id.push_back(wmask_id);
        std::string wen_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortEn));
        mports_wen_id.push_back(wen_id);
      } else if (mport_dir == firDB::MPortDir::kMPortDirRdwr) {
        std::string wdata_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortWData));
        mports_wdata_id.push_back(wdata_id);
        std::string wmask_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortWMask));
        mports_wmask_id.push_back(wmask_id);
        std::string wmode_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortWMode));
        mports_wen_id.push_back(wmode_id);
      } else {
        fs_assert(0);
      }
      std::string wclk_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortClk));
      mports_wclk_id.push_back(wclk_id);
      std::string waddr_id = getMemoryPinId(mem_id, mport_id, firDB::firItemMemory::getMemPortId(mport_dir, firDB::MemPortType::kMemPortAddr));
      mports_waddr_id.push_back(waddr_id);
    }
    std::string mrram_wdata_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteDatas());
    generateMultiMemPortCatAssign(mrram_wdata_port, mports_wdata_id, width);
    std::string mrram_wclk_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteClks());
    generateMultiMemPortCatAssign(mrram_wclk_port, mports_wclk_id, 1);
    std::string mrram_wen_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteEns());
    generateMultiMemPortCatAssign(mrram_wen_port, mports_wen_id, 1);
    std::string mrram_waddr_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteAddrs());
    generateMultiMemPortCatAssign(mrram_waddr_port, mports_waddr_id, addrbits);
    std::string mrram_wmask_port = getMemModulePinId(mem_id, MacroCellLib::getMRMWMemPortWriteMasks());
    generateMultiMemPortCatAssign(mrram_wmask_port, mports_wmask_id, 1);
    mports_wdata_id.clear();
    mports_wclk_id.clear();
    mports_wen_id.clear();
    mports_waddr_id.clear();
    mports_wmask_id.clear();
  }
  void TransferModule::generateMultiMemPortCatAssign(const std::string& mem_port_id, std::vector<std::string> mport_pins_id, int width) {
    Module* verilog_module = this->getVerilogModule();
    IdDef* mem_port_def = verilog_module->findDeclared(mem_port_id);
    fs_assert(mem_port_def != NULL);
    IdDef* pre_cat_output_def = NULL;
    int mp_size = static_cast<int>(mport_pins_id.size());
    int cat_y_id_width = width;
    if (mp_size > 1) {
      for (int mp = mp_size - 2; mp >= 0; mp--) {
        int a_width = width;
        int b_width = width;
        IdDef* cat_a_def = pre_cat_output_def;
        IdDef* cat_b_def = verilog_module->findDeclared(mport_pins_id[mp]);
        fs_assert(cat_b_def != NULL);
        if (pre_cat_output_def == NULL) {
          cat_a_def = verilog_module->findDeclared(mport_pins_id[mp + 1]);
          fs_assert(cat_a_def != NULL);
          ExternModule* cat_module = this->getMacroCellLib()->addCellCat();
          fs_assert(cat_module != NULL);
        } else {
          Range* a_range = cat_a_def->getRange();
          if (a_range != NULL) {
            a_width = a_range->rangeWidth();
          }
        }
        IdDef* cat_y_def = NULL;
        if (mp == 0) {
          cat_y_def = mem_port_def;
        } else {
          std::string cat_y_id = getTempWireId();
          BaseDataType* data_type = cat_a_def->getDataType();
          fs_assert(data_type != NULL);
          bool is_signed = data_type->isSigned();
          cat_y_id_width += width;
          cat_y_def = generateNetDecl(cat_y_id, cat_y_id_width, is_signed);
          fs_assert(cat_y_def != NULL);
        }
        std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeCat);
        ModuleInstantiation* cat_instantiation = this->getVerilogModule()->addInstance(inst_name, MacroCellLib::getCatName());
        PortConnect* width_a_connect = cat_instantiation->addParamValue(MacroCellLib::getCatParamWidthA());
        width_a_connect->setConnection(a_width);
        PortConnect* width_b_connect = cat_instantiation->addParamValue(MacroCellLib::getCatParamWidthB());
        width_b_connect->setConnection(b_width);
        IdDef* inst_id_def = cat_instantiation->getInstance();
        generatePortConnect(inst_id_def, MacroCellLib::getCatPortY(), cat_y_def, NULL);
        generatePortConnect(inst_id_def, MacroCellLib::getCatPortA(), cat_a_def, NULL);
        generatePortConnect(inst_id_def, MacroCellLib::getCatPortB(), cat_b_def, NULL);
        pre_cat_output_def = cat_y_def;
      }
    } else {
      IdDef* mport_pin_def = verilog_module->findDeclared(mport_pins_id[0]);
      fs_assert(mport_pin_def != NULL);
      BlockingAssign* mem_port_assign = verilog_module->addBlockAssign();
      mem_port_assign->setLeftValue(mem_port_id);
      mem_port_assign->setRightValue(mport_pins_id[0]);
    }
  }
  void TransferModule::generateMultiMemPortBitsAssign(const std::string& mem_port_id, std::vector<std::string> mport_pins_id, int width) {
    Module* verilog_module = this->getVerilogModule();
    IdDef* mem_port_def = verilog_module->findDeclared(mem_port_id);
    fs_assert(mem_port_def != NULL);
    unsigned int mem_port_width = 1;
    Range* mem_port_range = mem_port_def->getRange();
    if (mem_port_range != NULL) mem_port_width = mem_port_range->rangeWidth();
    int bits_lo = 0;
    int bits_hi = width - 1;
    int bits_input_width = 1;
    Range* bits_input_range = mem_port_def->getRange();
    if (bits_input_range != NULL) {
      bits_input_width = bits_input_range->rangeWidth();
    }
    for (size_t mp = 0; mp < mport_pins_id.size(); mp++) {
      std::string mport_pin_id = mport_pins_id[mp];
      IdDef* mport_pin_def = verilog_module->findDeclared(mport_pin_id);
      fs_assert(mport_pin_def != NULL);
      unsigned int mport_pin_width = 1;
      Range* mport_pin_range = mport_pin_def->getRange();
      if (mport_pin_range != NULL) mport_pin_width = mport_pin_range->rangeWidth();
      if (mem_port_width < mport_pin_width) {
        fs_assert(0);
      }
      ExternModule* bits_module = this->getMacroCellLib()->addCellBits();
      std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBits);
      ModuleInstantiation* bits_instantiation = this->getVerilogModule()->addInstance(inst_name, bits_module->getName());
      PortConnect* width_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamWidth());
      width_connect->setConnection(bits_input_width);
      PortConnect* high_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamHigh());
      high_connect->setConnection(bits_hi);
      PortConnect* low_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamLow());
      low_connect->setConnection(bits_lo);
      IdDef* inst_id_def = bits_instantiation->getInstance();
      generatePortConnect(inst_id_def, MacroCellLib::getBitsPortY(), mport_pin_def, NULL);
      generatePortConnect(inst_id_def, MacroCellLib::getBitsPortIn(), mem_port_def, NULL);
      bits_hi += width;
      bits_lo += width;
    }
  }
  bool TransferModule::transferItemAttachToVerilog(firDB::firItemAttach* item_attach) {
    fs_assert(item_attach != NULL);
    firDB::firModule* fir_module = this->getFirrtlModule();
    Module* verilog_module = this->getVerilogModule();
    std::vector<firDB::firExp*>& nets = item_attach->nets();
    fs_assert(!nets.empty());
    std::string inst_id;
    IdDef* inst_def = NULL;
    PortConnect* port_connect = NULL;
    IdDef* pin_def = NULL;
    for (size_t n = 0; n < nets.size(); n++) {
      firDB::firExp* nets_exp = nets[n];
      firDB::firItem* exp_item = fir_module->findItemByExpression(nets_exp);
      if (exp_item->isInstanceItem()) {
        firDB::firItemInstance* inst = dynamic_cast<firDB::firItemInstance*>(exp_item);
        firDB::firCircuit* circuit = fir_module->circuit();
        firDB::firItemPort* inst_port = inst->getPortByExpression(circuit, nets_exp);
        inst_id = getWriteId(inst->inst_id(), fir_module);
        inst_def = verilog_module->findDeclared(inst_id);
        fs_assert(inst_def != NULL);
        std::string port_id = getWriteId(inst_port->id(), fir_module);
        port_connect = inst_def->getPortConnect(port_id);
        if (pin_def != NULL) {
          port_connect->setConnection(pin_def->getName());
          break;
        }
      } else if (exp_item->isPortItem()) {
        firDB::firItemPort* item_port = dynamic_cast<firDB::firItemPort*>(exp_item);
        std::string pin_id = getWriteId(item_port->id(), fir_module);
        pin_def = verilog_module->findDeclared(pin_id);
        fs_assert(pin_def != NULL);
        if (port_connect != NULL) {
          port_connect->setConnection(pin_id);
          break;
        }
      } else if (exp_item->isWireItem()) {
        firDB::firItemWire* item_wire = dynamic_cast<firDB::firItemWire*>(exp_item);
        std::string pin_id = getWriteId(item_wire->id(), fir_module);
        pin_def = verilog_module->findDeclared(pin_id);
        fs_assert(pin_def != NULL);
        if (port_connect != NULL) {
          port_connect->setConnection(pin_id);
          break;
        }
      }
      continue;
    }
    return true;
  }
  IdDef* TransferModule::alignWidthToMax(firDB::firExp* align_exp, int align_width) {
    fs_assert(align_exp != NULL);
    IdDef* add_id_def = NULL;
    firDB::firModule* fir_module = this->getFirrtlModule();
    fs_assert(fir_module != NULL);
    firDB::firType* exp_type = align_exp->getTypeData(fir_module, NULL);
    fs_assert(exp_type != NULL);
    bool is_signed = getPostTypeSign(exp_type);
    int exp_width = getPostTypeWidth(exp_type);
    if (exp_width < align_width) {
      std::string pad_in_id = getTempWireId();
      add_id_def = generateNetDecl(pad_in_id, align_width, is_signed);
      fs_assert(add_id_def != NULL);
      if (align_exp->isOperationExpression()) {
        fs_assert(0);
        return NULL;
      }
      unsigned int pad_n = static_cast<int>(align_width);
      if (is_signed) {
        generateSignedPadInst(add_id_def, align_exp, pad_n);
      } else {
        generateUnsignedPadInst(add_id_def, align_exp, pad_n);
      }
    } else {
      if (align_exp->isOperationExpression()) {
        fs_assert(0);
        return NULL;
      }
      unsigned int bits_hi = align_width - 1;
      unsigned int bits_lo = 0;
      if (is_signed) {
        std::string bits_in_id = getTempWireId();
        IdDef* bits_id_def = generateNetDecl(bits_in_id, align_width, is_signed);
        fs_assert(bits_id_def != NULL);
        generateBitsInst(bits_id_def, align_exp, bits_hi, bits_lo);
        std::string assint_id = getTempWireId();
        add_id_def = generateNetDecl(assint_id, align_width, false);
        addAsSIntInst(add_id_def, bits_id_def);
      } else {
        std::string bits_in_id = getTempWireId();
        add_id_def = generateNetDecl(bits_in_id, align_width, is_signed);
        fs_assert(add_id_def != NULL);
        generateBitsInst(add_id_def, align_exp, bits_hi, bits_lo);
      }
    }
    return add_id_def;
  }
  IdDef* TransferModule::alignToOutputWidth(IdDef* output_def, int input_width) {
    fs_assert(output_def != NULL);
    IdDef* r_def = output_def;
    int output_width = 1;
    Range* output_range = output_def->getRange();
    if (output_range != NULL) {
      output_width = output_range->rangeWidth();
    }
    bool is_signed = output_def->isSigned();
    if (output_width > input_width) {
      std::string net_id = getTempWireId();
      r_def = generateNetDecl(net_id, input_width, is_signed);
      padToOutputWidth(output_def, r_def, output_width);
    } else if (output_width < input_width) {
      std::string net_id = getTempWireId();
      r_def = generateNetDecl(net_id, input_width, is_signed);
      unsigned int hi = output_width - 1;
      unsigned int lo = 0;
      if (output_def->isSigned()) {
        std::string bits_output_id = getTempWireId();
        IdDef* bits_output_def = generateNetDecl(bits_output_id, output_width, false);
        bitsToOutputWidth(bits_output_def, r_def, hi, lo);
        addAsSIntInst(output_def, bits_output_def);
      } else {
        bitsToOutputWidth(output_def, r_def, hi, lo);
      }
    }
    return r_def;
  }
  void TransferModule::alignWidthByInputDef(IdDef* output_def, IdDef* input_def) {
    fs_assert(output_def != NULL);
    fs_assert(input_def != NULL);
    int output_width = 1;
    Range* output_range = output_def->getRange();
    if (output_range != NULL) {
      output_width = output_range->rangeWidth();
    }
    int input_width = 1;
    Range* input_range = input_def->getRange();
    if (input_range != NULL) {
      input_width = input_range->rangeWidth();
    }
    if (output_width > input_width) {
      padToOutputWidth(output_def, input_def, output_width);
    } else if (output_width < input_width) {
      unsigned int hi = output_width - 1;
      unsigned int lo = 0;
      if (output_def->isSigned()) {
        std::string bits_output_id = getTempWireId();
        IdDef* bits_output_def = generateNetDecl(bits_output_id, output_width, false);
        bitsToOutputWidth(bits_output_def, input_def, hi, lo);
        addAsSIntInst(output_def, bits_output_def);
      } else {
        bitsToOutputWidth(output_def, input_def, hi, lo);
      }
    }
  }
  void TransferModule::padToOutputWidth(IdDef* output_def, IdDef* input_def, unsigned int n) {
    fs_assert(output_def != NULL);
    fs_assert(input_def != NULL);
    int input_width = 1;
    Range* input_range = input_def->getRange();
    if (input_range != NULL) {
      input_width = input_range->rangeWidth();
    }
    bool is_signed = input_def->isSigned();
    ExternModule* pad_module = NULL;
    std::string inst_name;
    std::string param_width_id;
    std::string param_n_id;
    std::string port_y_id;
    std::string port_in_id;
    if (is_signed) {
      pad_module = this->getMacroCellLib()->addCellPadSigned("");
      inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypePadSigned);
      param_width_id = MacroCellLib::getPadSignedParamWidth();
      param_n_id = MacroCellLib::getPadSignedParamN();
      port_y_id = MacroCellLib::getPadSignedPortY();
      port_in_id = MacroCellLib::getPadSignedPortIn();
    } else {
      pad_module = this->getMacroCellLib()->addCellPadUnsigned("");
      inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypePadUnsigned);
      param_width_id = MacroCellLib::getPadUnsignedParamWidth();
      param_n_id = MacroCellLib::getPadUnsignedParamN();
      port_y_id = MacroCellLib::getPadUnsignedPortY();
      port_in_id = MacroCellLib::getPadUnsignedPortIn();
    }
    ModuleInstantiation* pad_instantiation = this->getVerilogModule()->addInstance(inst_name, pad_module->getName());
    PortConnect* width_connect = pad_instantiation->addParamValue(param_width_id);
    width_connect->setConnection(input_width);
    PortConnect* n_connect = pad_instantiation->addParamValue(param_n_id);
    n_connect->setConnection(n);
    IdDef* inst_id_def = pad_instantiation->getInstance();
    generatePortConnect(inst_id_def, port_y_id, output_def, NULL);
    generatePortConnect(inst_id_def, port_in_id, input_def, NULL);
  }
  void TransferModule::bitsToOutputWidth(IdDef* output_def, IdDef* input_def, unsigned int hi, unsigned int lo) {
    fs_assert(output_def != NULL);
    fs_assert(input_def != NULL);
    int input_width = 1;
    Range* input_range = input_def->getRange();
    if (input_range != NULL) {
      input_width = input_range->rangeWidth();
    }
    ExternModule* bits_module = this->getMacroCellLib()->addCellBits("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeBits);
    ModuleInstantiation* bits_instantiation = this->getVerilogModule()->addInstance(inst_name, bits_module->getName());
    PortConnect* width_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamWidth());
    width_connect->setConnection(input_width);
    PortConnect* high_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamHigh());
    high_connect->setConnection(hi);
    PortConnect* low_connect = bits_instantiation->addParamValue(MacroCellLib::getBitsParamLow());
    low_connect->setConnection(lo);
    IdDef* inst_id_def = bits_instantiation->getInstance();
    generatePortConnect(inst_id_def, MacroCellLib::getBitsPortY(), output_def, NULL);
    generatePortConnect(inst_id_def, MacroCellLib::getBitsPortIn(), input_def, NULL);
  }
  void TransferModule::addAsSIntInst(IdDef* output_def, IdDef* input_def) {
    fs_assert(output_def != NULL);
    fs_assert(input_def != NULL);
    int width = 1;
    Range* input_def_range = input_def->getRange();
    if (input_def_range != NULL) {
      width = input_def_range->rangeWidth();
    }
    ExternModule* assint_module = this->getMacroCellLib()->addCellAsSInt("");
    std::string inst_name = getOperationInstName(MacroCellLib::ModuleType::kTypeAsSInt);
    ModuleInstantiation* assint_instantiation = this->getVerilogModule()->addInstance(inst_name, assint_module->getName());
    PortConnect* width_connect = assint_instantiation->addParamValue(MacroCellLib::getAsSIntParamWidth());
    width_connect->setConnection(width);
    IdDef* inst_def = assint_instantiation->getInstance();
    generatePortConnect(inst_def, MacroCellLib::getAsSIntPortY(), output_def, NULL);
    generatePortConnect(inst_def, MacroCellLib::getAsSIntPortIn(), input_def, NULL);
  }
  IdDef* TransferModule::getIdDefByName(const std::string& name) {
    IdDef* id_def = NULL;
    id_def = getVerilogModule()->getPort(name);
    if (id_def == NULL) {
      id_def = getVerilogModule()->findDeclared(name);
    }
    if (id_def == NULL) {
      id_def = getVerilogModule()->getParam(name);
    }
    return id_def;
  }
  std::string TransferModule::getDffPortQId(const std::string& dff_id) {
    std::string dff_q = "_" + dff_id + "__" + firDB::firItemRegister::getPortQId();
    return dff_q;
  }
  std::string TransferModule::getDffPortDId(const std::string& dff_id) {
    std::string dff_d = "_" + dff_id + "__" + firDB::firItemRegister::getPortDId();
    return dff_d;
  }
  std::string TransferModule::getInstancePinId(const std::string& inst_id, const std::string& port_id) {
    std::string pin_id = "_" + inst_id + "__" + port_id;
    return pin_id;
  }
  std::string TransferModule::getMemoryPinId(const std::string& mem_id, const std::string& mport_id, const std::string& pin_id) {
    std::string mem_pin_id = mem_id + "_" + mport_id + "_" + pin_id;
    return mem_pin_id;
  }
  std::string TransferModule::getMemModulePinId(const std::string& mem_id, const std::string& pin_id) {
    std::string mem_pin_id = mem_id + "_" + pin_id;
    return mem_pin_id;
  }
}