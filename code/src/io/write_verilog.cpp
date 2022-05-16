//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include <cstring>
#include <vector>
#include <map>
#include <fstream>
#include <iostream>
#include <algorithm>
#include <cmath>
#include "utility/app.h"
#include "utility/utility.h"
#include "io/write_verilog.h"
#include "utility/big_int.h"

namespace firrtlsyn {
  Backend::Backend() {
    interpunct_ = '$';
    temp_wire_id_ = "_WTEMP_";
    new_gate_num_ = 0;
    new_wire_num_ = 0;
    sync_read_addr_reg_suffix_ = "_pipe_0";
  }

  long long unsigned int Backend::getNewGateNum() {
    new_gate_num_++;
    return new_gate_num_;
  }

  std::string Backend::getTempWireId() {
    std::string wire_id = temp_wire_id_ + std::to_string(new_wire_num_);
    new_wire_num_++;
    return wire_id;
  }

  Backend::~Backend() {
    std::map<std::string, std::map<std::string, std::string> >().swap(unified_id_post_id_map_);
    std::map<std::string, std::map<std::string, std::string> >().swap(post_id_declared_id_map_);
  }



  bool Backend::read_lib() {
    std::string dir_slash = "";
#ifndef WIN32
    dir_slash = "/";
#else
    dir_slash = "\\";
#endif // !WIN32
    std::string db_path = App::getDBPath();
    if (db_path == "") {
      fs_error("*ERROR*: Failed to get the path of data-base to build up the macro cell library.\n");
      return false;
    }
    std::string filename = db_path + dir_slash + "macro_cells.txt";
    std::ifstream in(filename);
    std::string line;
    fs_info("*INFO*: Reading macro cell library '%s'.\n", filename.c_str());

    if (in) {
      int primitive_cnt = 0;
      std::getline(in, line);
      sscanf(line.c_str(), "Primitive Operation %d", &primitive_cnt);
      for (int i = 0; i < primitive_cnt; i++) {
        std::getline(in, line);
        std::getline(in, line);
        char inst_name[64];
        int port_cnt = 0;
        sscanf(line.c_str(), "%s %d", inst_name, &port_cnt);
        std::vector<std::string> ports;
        std::getline(in, line);
        char port_dir[64];
        char port_name[64];
        sscanf(line.c_str(), "%s %s", port_dir, port_name);
        ports.push_back(port_name);
        port_cnt--;
        for (int j = 0; j < port_cnt; j++) {
          std::getline(in, line);
          sscanf(line.c_str(), "%s %s", port_dir, port_name);
          if ((strcmp(port_dir, "input") != 0) && (strcmp(port_dir, "output") != 0) && (strcmp(port_dir, "inout") != 0)) {
            fs_error("*ERROR*: The direction of port '%s' was '%s'. The valid direction is 'input', 'output', or 'inout'. Correct the macro cell library and rerun.\n", port_name, port_dir);
            return false;
          }
          ports.push_back(port_name);
        }
        dataPathLib.insert(std::make_pair(inst_name, ports));
      }
    } else {
      fs_error("*ERROR*: The path for the macro cell library was wrong: %s. Correct the library path and rerun.\n", filename.c_str());
      return false;
    }
    return true;
  }

  bool Backend::writeVerilog(firDB::firLibrary* lib, std::string file_name, bool overwrite, bool /*debug*/) { 
    if (!overwrite) {
      if (App::avoidOverwrite(file_name) == false) {
        fs_error("*ERROR*: Failed to rename the existing Verilog file to avoid overwriting: '%s'.\n", file_name.c_str());
        return false;
      }
    }
    FILE* fp = NULL;
    if ((fp = fopen(file_name.c_str(), "w")) == NULL) {
      fs_error("*ERROR*: Failed to open the file to write Verilog into: '%s'.\n", file_name.c_str());
      return false;
    }

    fprintf(fp, "`include \"macro_cells.v\"\n");
    firDB::firCircuit* post_circuit = lib->post_circuit();
    fs_assert(post_circuit != NULL);
    firDB::firModule* top_module = post_circuit->top_module();
    fprintf(fp, "// NOTE_BEGIN top-module : %s NOTE_END\n", top_module->id().c_str());
    std::vector<firDB::firModule*> post_modules = post_circuit->modules();
    // check module ids

    // write verilog for top module first
    if (top_module->isExtModule()) {
      fs_error("*ERROR*: The top module was detected to be an ExtModule.\n");
      return false;
    }

    if (!writeModuleVerilog(fp, top_module, post_circuit)) {
      fs_error("*ERROR*: Failed to write Verilog for module '%s'.\n", top_module->id().c_str());
      return false;
    }
    for (size_t i = 0; i < post_modules.size(); i++) {
      firDB::firModule* module = post_modules[i];
      if (module->id() == top_module->id()) {
        continue;
      }
      if (!writeModuleVerilog(fp, module, post_circuit)) {
        fs_error("*ERROR*: Failed to write Verilog for module '%s'.\n", top_module->id().c_str());
        return false;
      }
    }
    fclose(fp);

    fs_info("*INFO*: Writing Verilog '%s' succeeded.\n", file_name.c_str());
    return true;
  }

  int Backend::getPostTypeWidth(firDB::firType* type_data) {
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
      return -1;
    }
    if (width < 1) {
      fs_error("*ERROR*: The width of data type was less than 1 at the back-end stage.\n");
      return -1;
    }
    return width;
  }

  bool Backend::getPostTypeSign(firDB::firType* type_data) {
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
      fs_error("*ERROR*: Failed to get the post-type sign, because the data type was not a post type at the back-end stage.\n");
      return false;
    }
    return isSigned;
  }

  std::string Backend::formBus(int width, int start_index) {
    if (width <= 0) {
      fs_error("*ERROR*: The width (%d) was invalid to form a bus.\n", width);
      fs_assert(0);
      return "";
    }
    if (start_index < 0) {
      fs_error("*ERROR*: The start index (%d) was invalid to form a bus.\n", start_index);
      fs_assert(0);
      return "";
    }
    std::string bus = "";
    if (width == 1) {
      bus = (start_index == 0) ? "" : ("[" + std::to_string(start_index) + ":" + std::to_string(start_index) + "]");
    } else {
      bus = "[" + std::to_string(start_index + width - 1) + ":" + std::to_string(start_index) + "]";
    }
    return bus;
  }

  bool Backend::AvoidRedclaredID(firDB::firModule* module) {
    if (module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to check the ID redeclaration.\n");
      return "";
    }
    for (std::map<std::string, firDB::firItem*>::iterator it = module->id_items_map().begin(); it != module->id_items_map().end(); it++) {
      std::string unified_id = unifyID(it->first);
      if (!addUnifiedID(module, unified_id, it->first)) {
        return false;
      }
    }
    return true;
  }

  bool Backend::addUnifiedID(firDB::firModule* module, const std::string & unified_id, const std::string & post_id) {
    if (module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to add unified ID.\n");
      return "";
    }
    std::map<std::string, std::map<std::string, std::string> >::iterator it = unified_id_post_id_map_.find(module->id());
    if (it == unified_id_post_id_map_.end()) {
      std::map<std::string, std::string> temp;
      temp.insert(std::make_pair(unified_id, post_id));
      unified_id_post_id_map_.insert(std::make_pair(module->id(), temp));
    } else {
      std::map<std::string, std::string>::iterator it2 = (it->second).find(unified_id);
      if (it2 == (it->second).end()) {
        (it->second).insert(std::make_pair(unified_id, post_id));
      } else {
        if (post_id == it2->second) {
          fs_error("*ERROR*: The ID '%s' has already been declared.\n", unified_id.c_str());
          return false;
        } else {
          std::string new_declared_id1 = reUnifyID(it2->second);
          if (new_declared_id1 != unified_id) {
            std::string original_post_id1 = it2->second;
            (it->second).insert(std::make_pair(new_declared_id1, original_post_id1));
            (it->second).erase(unified_id);
            (it->second).insert(std::make_pair(unified_id, post_id));
            addDeclaredID(module, original_post_id1, new_declared_id1);
            addDeclaredID(module, post_id, unified_id);
          } else {
            std::string new_declared_id2 = reUnifyID(post_id);
            if (new_declared_id2 != unified_id) {
              (it->second).insert(std::make_pair(new_declared_id2, post_id));
              addDeclaredID(module, post_id, new_declared_id2);
              addDeclaredID(module, it2->second, unified_id);
            }
          }
        }
      }
    }
    return true;
  }

  bool Backend::addDeclaredID(firDB::firModule* module, const std::string & post_id, const std::string & declared_id) {
    if (module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to add declared ID.\n");
      return "";
    }
    std::map<std::string, std::map<std::string, std::string> >::iterator it = post_id_declared_id_map_.find(module->id());
    if (it == post_id_declared_id_map_.end()) {
      std::map<std::string, std::string> temp;
      temp.insert(std::make_pair(post_id, declared_id));
      post_id_declared_id_map_.insert(std::make_pair(module->id(), temp));
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

  std::string Backend::unifyID(const std::string id) {
    std::string tmp_id = id;
    size_t found = tmp_id.find_first_of(interpunct());
    while (found != std::string::npos) {
      tmp_id.replace(found, 1, "_");
      found = tmp_id.find_first_of(interpunct());
    }
    return tmp_id;
  }

  std::string Backend::reUnifyID(const std::string id) {
    std::string tmp_id = id;
    size_t found = tmp_id.find_first_of(interpunct());
    while (found != std::string::npos) {
      tmp_id.replace(found, 1, "__"); // two underscores
      found = tmp_id.find_first_of(interpunct());
    }
    return tmp_id;
  }

  std::string Backend::getWriteID(firDB::firModule* module, const std::string id) {
    if (module == NULL) {
      fs_error("*ERROR*: The module was NULL and could not be used to get the writing ID.\n");
      return "";
    }
    std::string id_to_write = "";
    std::map<std::string, std::map<std::string, std::string> >::iterator it = post_id_declared_id_map_.find(module->id());
    if (it == post_id_declared_id_map_.end()) {
      id_to_write = unifyID(id);
    } else {
      std::map<std::string, std::string>::iterator it2 = (it->second).find(id);
      if (it2 != (it->second).end()) {
        id_to_write = it2->second;
      } else {
        id_to_write = unifyID(id);
      }
    }
    return id_to_write;
  }

  std::string Backend::getDffOutputQName(std::string dff_id_to_write) {
    std::string dff_q = "_" + dff_id_to_write + "__q";
    return dff_q;
  }

  std::string Backend::getDffInputDName(std::string dff_id_to_write) {
    std::string dff_d = "_" + dff_id_to_write + "__d";
    return dff_d;
  }

  std::string Backend::getDffClockClkName(std::string dff_id_to_write) {
    std::string dff_clk = "_" + dff_id_to_write + "__clk";
    return dff_clk;
  }

  std::string Backend::getDffRstValName(std::string dff_id_to_write) {
    std::string dff_rstval = "_" + dff_id_to_write + "__rstval";
    return dff_rstval;
  }

  std::string Backend::getInstancePinId(std::string inst_id_to_write, std::string port_id_to_write) {
    std::string pin_id = "_" + inst_id_to_write + "__" + port_id_to_write;
    return pin_id;
  }

  std::string Backend::getMemoryPinId(std::string mem_id_to_write, std::string mport_id_to_write, std::string pin_id_to_write) {
    std::string mem_id = mem_id_to_write + "_" + mport_id_to_write + "_" + pin_id_to_write;
    return mem_id;
  }

  OpInputInfo Backend::getOpInputInfo(firDB::firExp* input_exp, firDB::firModule* module) {
    OpInputInfo info;
    if (input_exp->isReferenceExpression()) {
      info.id_to_write = turnIdExpToWriteFormat(input_exp, module);
      firDB::firType* type_data = input_exp->getTypeData(module);
      if (type_data == NULL) {
        fs_error("*ERROR*: Could not get the type of the data for expression '%s' in module '%s'.\n", input_exp->toString().c_str(), module->id().c_str());
      }
      info.is_signed = getPostTypeSign(type_data);
      info.width = (unsigned int)getPostTypeWidth(type_data);
    } else if (input_exp->isUIntExpression()) {
      info.is_signed = false;
      firDB::firExpUInt* u_exp = dynamic_cast<firDB::firExpUInt*>(input_exp);
      info.width = u_exp->width();
      info.id_to_write = std::to_string(info.width) + "'d" + u_exp->big_value()->getOriginValue();
    } else if (input_exp->isUIntBitsExpression()) {
      info.is_signed = false;
      firDB::firExpUIntBits* ub_exp = dynamic_cast<firDB::firExpUIntBits*>(input_exp);
      info.width = ub_exp->width();
      info.id_to_write = std::to_string(info.width) + "'" + ub_exp->big_value()->getOriginValue();
    } else if (input_exp->isSIntExpression()) { 
      info.is_signed = true;
      firDB::firExpSInt* s_exp = dynamic_cast<firDB::firExpSInt*>(input_exp);
      info.width = s_exp->width();
      std::string value_str = s_exp->big_value()->getOriginValue();
      size_t found = value_str.find("-");
      if (found == std::string::npos) {
        info.id_to_write = std::to_string(info.width) + "'sd" + value_str;
      } else {
        info.id_to_write = "-" + std::to_string(info.width) + "'sd" + value_str.replace(found, 1, "");
      }
    } else if (input_exp->isSIntBitsExpression()) {
      info.is_signed = true;
      firDB::firExpSIntBits* sb_exp = dynamic_cast<firDB::firExpSIntBits*>(input_exp);
      info.width = sb_exp->width();
      size_t found = sb_exp->big_value()->getOriginValue().find("-");
      if (found == std::string::npos) {
        info.id_to_write = std::to_string(info.width) + "'s" + sb_exp->big_value()->getOriginValue();
      } else {
        std::string temp_value = sb_exp->big_value()->getOriginValue();
        info.id_to_write = "-" + std::to_string(info.width) + "'s" + temp_value.replace(found, 1, "");
      }
    } else if (input_exp->isSubfieldExpression()) {
      // instance port, register port, or mport
      info.id_to_write = turnIdExpToWriteFormat(input_exp, module);
      firDB::firType* type_data = input_exp->getTypeData(module);
      if (type_data == NULL) {
        fs_error("*ERROR*: Could not get the type of the data for expression '%s' in module '%s'.\n", input_exp->toString().c_str(), module->id().c_str());
      }
      info.is_signed = getPostTypeSign(type_data);
      info.width = (unsigned int)getPostTypeWidth(type_data);
    } else {
      fs_error("*ERROR*: The input expression '%s' was invalid for writing Verilog.\n", input_exp->toString().c_str());
    }
    firDB::firExp* exp_val = input_exp->exp_val();
    if (exp_val == NULL) {
      info.is_a_number = false;
      info.min_width_for_number = 0;
    } else {
      if (exp_val->isUIntBitsExpression()) {
        info.is_a_number = true;
        if (info.is_signed != false) {
          fs_error("*ERROR*: The expression '%s' was 'SInt' but the expression value is 'UIntBits'.\n", input_exp->toString().c_str());
        }
        firDB::firExpUIntBits* exp_val_ub = dynamic_cast<firDB::firExpUIntBits*>(exp_val);
        BigInt o_rtype(exp_val_ub->big_value()->getOriginValue(), false);
        info.min_width_for_number = o_rtype.getMinBinaryWidth();
      } else if (exp_val->isSIntBitsExpression()) {
        info.is_a_number = true;
        if (info.is_signed != true) {
          fs_error("*ERROR*: The expression '%s' was 'UInt' but the expression value is 'SIntBits'.\n", input_exp->toString().c_str());
        }
        firDB::firExpSIntBits* exp_val_sb = dynamic_cast<firDB::firExpSIntBits*>(exp_val);
        BigInt o_rtype(exp_val_sb->big_value()->getOriginValue(), true);
        info.min_width_for_number = o_rtype.getMinBinaryWidth();
      } else if (exp_val->isUIntExpression()) {
        info.is_a_number = true;
        if (info.is_signed != false) {
          fs_error("*ERROR*: The expression '%s' was 'SInt' but the expression value is 'UInt'.\n", input_exp->toString().c_str());
        }
        firDB::firExpUInt* exp_val_u = dynamic_cast<firDB::firExpUInt*>(exp_val);
        BigInt o_rtype(exp_val_u->big_value()->getOriginValue(), false);
        info.min_width_for_number = o_rtype.getMinBinaryWidth();
      } else if (exp_val->isSIntExpression()) {
        info.is_a_number = true;
        if (info.is_signed != true) {
          fs_error("*ERROR*: The expression '%s' was 'UInt' but the expression value is 'SInt'.\n", input_exp->toString().c_str());
        }
        firDB::firExpSInt* exp_val_sb = dynamic_cast<firDB::firExpSInt*>(exp_val);
        BigInt o_rtype(exp_val_sb->big_value()->getOriginValue(), true);
        info.min_width_for_number = o_rtype.getMinBinaryWidth();
      } else {
        fs_error("*ERROR*: The expression value '%s' was not a number.\n", exp_val->toString().c_str());
        info.is_a_number = false;
        info.min_width_for_number = 0;
      }
    }
    return info;
  }

  std::string Backend::turnIdExpToWriteFormat(firDB::firExp* id_exp, firDB::firModule* module) {
    std::string id_to_write = "";
    if (id_exp->isReferenceExpression()) {
      std::string id = dynamic_cast<firDB::firExpRef*>(id_exp)->id();
      firDB::firItem* item = module->findItemById(id);
      if (item == NULL) {
        fs_error("*ERROR*: Could not find an item with ID '%s' in module '%s'.\n", id.c_str(), module->id().c_str());
        return "";
      }
      id_to_write = getWriteID(module, id);
    } else if (id_exp->isSubfieldExpression()) {
      firDB::firExpSubfield* subfield_exp = dynamic_cast<firDB::firExpSubfield*>(id_exp);
      if ((subfield_exp->exp())->isReferenceExpression()) {
        // instance or register
        std::string pre_id = dynamic_cast<firDB::firExpRef*>(subfield_exp->exp())->id();
        firDB::firItem* pre_item = module->findItemById(pre_id);
        if (pre_item == NULL) {
          fs_error("*ERROR*: Could not find an item with ID '%s' in module '%s'.\n", pre_id.c_str(), module->id().c_str());
          return "";
        }
        if (pre_item->isInstanceItem() || pre_item->isRegisterItem()) {
          std::string pre_id_to_write = getWriteID(module, pre_id);
          std::string tail_id_to_write = getWriteID(module, subfield_exp->id());
          id_to_write = getInstancePinId(pre_id_to_write, tail_id_to_write);
        } else {
          fs_error("*ERROR*: The ID '%s' was expected to refer to an instance or a register but it was invalid for writing Verilog.\n", pre_id.c_str());
          return "";
        }
      } else if ((subfield_exp->exp())->isSubfieldExpression()) {
        // memory
        std::string pin_id = subfield_exp->id(); 
        std::string mport_id = dynamic_cast<firDB::firExpSubfield*>(subfield_exp->exp())->id();
        firDB::firExp* mem_exp = dynamic_cast<firDB::firExpSubfield*>(subfield_exp->exp())->exp();
        if (mem_exp->isReferenceExpression()) {
          std::string mem_id = dynamic_cast<firDB::firExpRef*>(mem_exp)->id();
          firDB::firItem* item = module->findItemById(mem_id);
          if (item == NULL) {
            fs_error("*ERROR*: Could not find an item with ID '%s' in module '%s'.\n", mem_id.c_str(), module->id().c_str());
            return "";
          }
          if (!item->isMemoryItem()) {
            fs_error("*ERROR*: The item '%s' was expected to be a memory in module '%s', but it was not.\n", mem_id.c_str(), module->id().c_str());
            return "";
          } else {
            firDB::firItemMemory* item_mem = dynamic_cast<firDB::firItemMemory*>(item);
            if (!item_mem->hasPort(mport_id)) {
              fs_error("*ERROR*: Could not find an MPort named '%s' in memory '%s' in module '%s'.\n", mport_id.c_str(), item_mem->id().c_str(), module->id().c_str());
              return "";
            }
          }
          std::string mem_id_to_write = getWriteID(module, mem_id);
          std::string mport_id_to_write = getWriteID(module, mport_id);
          std::string pin_id_to_write = getWriteID(module, pin_id);
          id_to_write = getMemoryPinId(mem_id_to_write, mport_id_to_write, pin_id_to_write);
        } else {
          fs_error("*ERROR*: The ID '%s' was expected to refer to a memory but it was invalid for writing Verilog.\n", subfield_exp->toString().c_str());
          return "";
        }
      } else {
        fs_error("*ERROR*: The sub-field expression '%s' was invalid for writing Verilog.\n", subfield_exp->toString().c_str());
        return "";
      }
    } else {
      fs_error("*ERROR*: The given expression '%s' was not a valid ID for writing Verilog.\n", id_exp->toString().c_str());
      return "";
    }
    return id_to_write;
  }

  bool Backend::getGateNamePorts(std::string prim_op, unsigned int port_num, std::string & cell_name, std::string & gate_name, std::vector<std::string> & ports) {
    std::string verilog = "";
    std::string prim_op_upper_case = prim_op;
    std::transform(prim_op_upper_case.begin(), prim_op_upper_case.end(), prim_op_upper_case.begin(), ::toupper);
    cell_name = prim_op_upper_case;
    std::string prim_op_lower_case = prim_op;
    std::transform(prim_op_lower_case.begin(), prim_op_lower_case.end(), prim_op_lower_case.begin(), ::tolower);
    gate_name += prim_op_lower_case + "_" + std::to_string(getNewGateNum());

    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return false;
    }
    ports = it->second;
    if ((unsigned int)ports.size() != port_num) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), port_num);
      fs_assert(0);
      return false;
    }
    return true;
  }

  bool Backend::getGateNamePorts(std::string prim_op, bool is_signed, unsigned int port_num, std::string & cell_name, std::string & gate_name, std::vector<std::string> & ports) {
    std::string prim_op_upper_case = prim_op;
    std::transform(prim_op_upper_case.begin(), prim_op_upper_case.end(), prim_op_upper_case.begin(), ::toupper);
    cell_name = prim_op_upper_case + "_" + (is_signed ? "SIGNED" : "UNSIGNED");
    gate_name = (is_signed ? "s" : "u");
    std::string prim_op_lower_case = prim_op;
    std::transform(prim_op_lower_case.begin(), prim_op_lower_case.end(), prim_op_lower_case.begin(), ::tolower);
    gate_name += "_" + prim_op_lower_case + "_" + std::to_string(getNewGateNum());

    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return false;
    }
    ports = it->second;
    if ((unsigned int)ports.size() != port_num) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), port_num);
      fs_assert(0);
      return false;
    }
    return true;
  }

  std::string Backend::writeAssignVerilog(std::string output_y, std::string in, std::string indent) {
    std::string assign_verilog = indent + "assign " + output_y + " = " + in + ";\n";
    return assign_verilog;
  }

  // FormatA: sign-width-y-a-b
  // Applications: add, sub, mul, div, rem, lt, leq, gt, geq, eq, neq
  std::string Backend::writeVerilogFormatA(std::string prim_op, bool is_signed, unsigned int width, std::string output_y, std::string input_a, std::string input_b, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, is_signed, 3, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + input_a + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + input_b + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatB: width-y-a-b
  // Application: bitwiseAnd, bitwiseOr, bitwiseXor, dff
  std::string Backend::writeVerilogFormatB(std::string prim_op, unsigned int width, std::string output_y, std::string input_a, std::string input_b, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, 3, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + input_a + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + input_b + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatC: sign-width-y-in
  // Application: cvt, neg
  std::string Backend::writeVerilogFormatC(std::string prim_op, bool is_signed, unsigned int width, std::string output_y, std::string in, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, is_signed, 2, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + in + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatD: width-y-in
  // Application: asUInt, asSInt, bitwiseNot, andr, orr, xorr
  std::string Backend::writeVerilogFormatD(std::string prim_op, unsigned int width, std::string output_y, std::string in, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, 2, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + in + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatE: sign-width-n-y-in
  // Application: pad, shl, shr
  std::string Backend::writeVerilogFormatE(std::string prim_op, bool is_signed, unsigned int width, unsigned int n, std::string output_y, std::string in, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, is_signed, 2, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ", " + std::to_string(n) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + in + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatF: width-n-y-in
  // Application: head, tail
  std::string Backend::writeVerilogFormatF(std::string prim_op, unsigned int width, unsigned int n, std::string output_y, std::string in, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, 2, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ", " + std::to_string(n) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + in + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatG: sign-width_in-width_n-y-in-n
  // Application: dshl, dshr, optimizedMul
  std::string Backend::writeVerilogFormatG(std::string prim_op, bool is_signed, unsigned int width_in, unsigned int width_n, std::string output_y, std::string in, std::string n, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, is_signed, 3, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width_in) + ", " + std::to_string(width_n) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + in + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + n + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatH: width_a-width_b-y-a-b
  // Application: cat
  std::string Backend::writeVerilogFormatH(std::string prim_op, unsigned int width_a, unsigned int width_b, std::string output_y, std::string input_a, std::string input_b, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, 3, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width_a) + ", " + std::to_string(width_b) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + input_a + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + input_b + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatI: width-high-low-y-in
  // Application: bits
  std::string Backend::writeVerilogFormatI(std::string prim_op, unsigned int width, unsigned int high, unsigned int low, std::string output_y, std::string in, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, 2, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ", " + std::to_string(high) + ", " + std::to_string(low) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + in + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  // FormatJ: width-y-sel-a-b
  // Application: mux
  std::string Backend::writeVerilogFormatJ(std::string prim_op, bool is_signed, unsigned int width, std::string output_y, std::string sel, std::string input_a, std::string input_b, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    std::string gate_name = "";
    std::vector<std::string> ports;
    getGateNamePorts(prim_op, is_signed, 4, cell_name, gate_name, ports);
    verilog += indent + cell_name + " #(" + std::to_string(width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + output_y + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + sel + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + input_a + "),\n";
    verilog += indent + indent + "." + ports[3] + "(" + input_b + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  std::string Backend::writeDirectConnectVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    if (output_y.is_signed != info_in.is_signed) {
      fs_error("*ERROR*: The right '%s' has type '%s' but the left '%s' has type '%s' for the assignment.\n", info_in.id_to_write.c_str(),
        info_in.is_signed ? "signed" : "unsigned", output_y.id_to_write.c_str(), output_y.is_signed ? "signed" : "unsigned");
      return "";
    }
    if (output_y.width != info_in.width) {
      OutputInfo buf_output;
      buf_output.is_signed = info_in.is_signed;
      buf_output.width = info_in.width;
      buf_output.id_to_write = info_in.id_to_write;
      verilog += alignOutputWidthAndType(output_y, buf_output, indent);
    } else {
      verilog += writeAssignVerilog(output_y.id_to_write, info_in.id_to_write, indent);
    }
    return verilog;
  }

  std::string Backend::writeOpAddVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo add_output;
    add_output.is_signed = new_info_a.is_signed;
    add_output.width = new_info_a.width + 1;
    if (add_output.width == output_y.width) {
      add_output.id_to_write = output_y.id_to_write;
    } else {
      add_output.id_to_write = getTempWireId();
      verilog += declareWire(add_output.width, add_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("ADD", new_info_a.is_signed, new_info_a.width, add_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, add_output, indent);
    return verilog;
  }

  std::string Backend::writeOpSubVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo sub_output;
    sub_output.is_signed = new_info_a.is_signed;
    sub_output.width = new_info_a.width + 1;
    if (sub_output.width == output_y.width) {
      sub_output.id_to_write = output_y.id_to_write;
    } else {
      sub_output.id_to_write = getTempWireId();
      verilog += declareWire(sub_output.width, sub_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("SUB", new_info_a.is_signed, new_info_a.width, sub_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, sub_output, indent);
    return verilog;
  }

  std::string Backend::writeOpMulVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo mul_output;
    mul_output.is_signed = new_info_a.is_signed;
    mul_output.width = new_info_a.width + new_info_b.width;
    if (mul_output.width == output_y.width) {
      mul_output.id_to_write = output_y.id_to_write;
    } else {
      mul_output.id_to_write = getTempWireId();
      verilog += declareWire(mul_output.width, mul_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("MUL", new_info_a.is_signed, new_info_a.width, mul_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, mul_output, indent);
    return verilog;
  }

  std::string Backend::writeOptimizedOpMulVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    if (!(info_a.is_a_number ^ info_b.is_a_number)) {
      fs_error("*ERROR*: The optimized method for 'Mul' operation is only suitable for the situation when one and only one input is a number.\n");
      return "";
    }
    if (info_a.is_a_number) {
      if (info_a.min_width_for_number == 0) {
        fs_error("*ERROR*: The detected minimum width for '%s' was 0.\n", info_a.id_to_write.c_str());
        return "";
      }
      OutputInfo a_as_output;
      a_as_output.is_signed = info_a.is_signed;
      a_as_output.width = info_a.width;
      a_as_output.id_to_write = info_a.id_to_write;
      OutputInfo bits_output;
      bits_output.is_signed = info_a.is_signed;
      bits_output.width = info_a.min_width_for_number;
      if (bits_output.width == a_as_output.width) {
        bits_output.id_to_write = a_as_output.id_to_write;
      } else {
        bits_output.id_to_write = getTempWireId();
        verilog += declareWire(bits_output.width, bits_output.id_to_write, indent);
      }
      verilog += alignOutputWidthAndType(bits_output, a_as_output, indent);
      OpInputInfo new_info_a;
      new_info_a.is_signed = bits_output.is_signed;
      new_info_a.width = bits_output.width;
      new_info_a.id_to_write = bits_output.id_to_write;
      new_info_a.is_a_number = true;
      new_info_a.min_width_for_number = bits_output.width;
      OutputInfo mul_output;
      mul_output.is_signed = new_info_a.is_signed;
      mul_output.width = new_info_a.width + info_b.width;
      if (mul_output.width == output_y.width) {
        mul_output.id_to_write = output_y.id_to_write;
      } else {
        mul_output.id_to_write = getTempWireId();
        verilog += declareWire(mul_output.width, mul_output.id_to_write, indent);
      }
      verilog += writeVerilogFormatG("Mul", new_info_a.is_signed, new_info_a.width, info_b.width, mul_output.id_to_write, new_info_a.id_to_write, info_b.id_to_write, indent);
      verilog += alignOutputWidthAndType(output_y, mul_output, indent);
    } else {
      if (info_b.min_width_for_number == 0) {
        fs_error("*ERROR*: The detected minimum width for '%s' was 0.\n", info_b.id_to_write.c_str());
        return "";
      }
      OutputInfo b_as_output;
      b_as_output.is_signed = info_b.is_signed;
      b_as_output.width = info_b.width;
      b_as_output.id_to_write = info_b.id_to_write;
      OutputInfo bits_output;
      bits_output.is_signed = info_b.is_signed;
      bits_output.width = info_b.min_width_for_number;
      if (bits_output.width == b_as_output.width) {
        bits_output.id_to_write = b_as_output.id_to_write;
      } else {
        bits_output.id_to_write = getTempWireId();
        verilog += declareWire(bits_output.width, bits_output.id_to_write, indent);
      }
      verilog += alignOutputWidthAndType(bits_output, b_as_output, indent);
      OpInputInfo new_info_b;
      new_info_b.is_signed = bits_output.is_signed;
      new_info_b.width = bits_output.width;
      new_info_b.id_to_write = bits_output.id_to_write;
      new_info_b.is_a_number = true;
      new_info_b.min_width_for_number = bits_output.width;
      OutputInfo mul_output;
      mul_output.is_signed = new_info_b.is_signed;
      mul_output.width = info_a.width + new_info_b.width;
      if (mul_output.width == output_y.width) {
        mul_output.id_to_write = output_y.id_to_write;
      } else {
        mul_output.id_to_write = getTempWireId();
        verilog += declareWire(mul_output.width, mul_output.id_to_write, indent);
      }
      verilog += writeVerilogFormatG("Mul", info_a.is_signed, info_a.width, new_info_b.width, mul_output.id_to_write, info_a.id_to_write, new_info_b.id_to_write, indent);
      verilog += alignOutputWidthAndType(output_y, mul_output, indent);
    }
    return verilog;
  }

  std::string Backend::writeOpDivVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo div_output;
    div_output.is_signed = new_info_a.is_signed;
    div_output.width = new_info_a.is_signed ? (new_info_a.width + 1) : new_info_a.width;
    if (div_output.width == output_y.width) {
      div_output.id_to_write = output_y.id_to_write;
    } else {
      div_output.id_to_write = getTempWireId();
      verilog += declareWire(div_output.width, div_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("DIV", new_info_a.is_signed, new_info_a.width, div_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, div_output, indent);
    return verilog;
  }

  std::string Backend::writeOpModVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo mod_output;
    mod_output.is_signed = new_info_a.is_signed;
    mod_output.width = new_info_a.width;
    if (mod_output.width == output_y.width) {
      mod_output.id_to_write = output_y.id_to_write;
    } else {
      mod_output.id_to_write = getTempWireId();
      verilog += declareWire(mod_output.width, mod_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("REM", new_info_a.is_signed, new_info_a.width, mod_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, mod_output, indent);
    return verilog;
  }

  std::string Backend::writeOpLtVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo lt_output;
    lt_output.is_signed = false;
    lt_output.width = 1;
    if (lt_output.width == output_y.width) {
      lt_output.id_to_write = output_y.id_to_write;
    } else {
      lt_output.id_to_write = getTempWireId();
      verilog += declareWire(lt_output.width, lt_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("LT", new_info_a.is_signed, new_info_a.width, lt_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, lt_output, indent);
    return verilog;
  }

  std::string Backend::writeOpLeqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo leq_output;
    leq_output.is_signed = false;
    leq_output.width = 1;
    if (leq_output.width == output_y.width) {
      leq_output.id_to_write = output_y.id_to_write;
    } else {
      leq_output.id_to_write = getTempWireId();
      verilog += declareWire(leq_output.width, leq_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("LEQ", new_info_a.is_signed, new_info_a.width, leq_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, leq_output, indent);
    return verilog;
  }

  std::string Backend::writeOpGtVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo gt_output;
    gt_output.is_signed = false;
    gt_output.width = 1;
    if (gt_output.width == output_y.width) {
      gt_output.id_to_write = output_y.id_to_write;
    } else {
      gt_output.id_to_write = getTempWireId();
      verilog += declareWire(gt_output.width, gt_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("GT", new_info_a.is_signed, new_info_a.width, gt_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, gt_output, indent);
    return verilog;
  }

  std::string Backend::writeOpGeqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo geq_output;
    geq_output.is_signed = false;
    geq_output.width = 1;
    if (geq_output.width == output_y.width) {
      geq_output.id_to_write = output_y.id_to_write;
    } else {
      geq_output.id_to_write = getTempWireId();
      verilog += declareWire(geq_output.width, geq_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("GEQ", new_info_a.is_signed, new_info_a.width, geq_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, geq_output, indent);
    return verilog;
  }

  std::string Backend::writeOpEqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo eq_output;
    eq_output.is_signed = false;
    eq_output.width = 1;
    if (eq_output.width == output_y.width) {
      eq_output.id_to_write = output_y.id_to_write;
    } else {
      eq_output.id_to_write = getTempWireId();
      verilog += declareWire(eq_output.width, eq_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("EQ", new_info_a.is_signed, new_info_a.width, eq_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, eq_output, indent);
    return verilog;
  }

  std::string Backend::writeOpNeqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo neq_output;
    neq_output.is_signed = false;
    neq_output.width = 1;
    if (neq_output.width == output_y.width) {
      neq_output.id_to_write = output_y.id_to_write;
    } else {
      neq_output.id_to_write = getTempWireId();
      verilog += declareWire(neq_output.width, neq_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatA("NEQ", new_info_a.is_signed, new_info_a.width, neq_output.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, neq_output, indent);
    return verilog;
  }

  std::string Backend::writeOpPadVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent) {
    std::string verilog = "";
    if (n < info_in.width) {
      fs_warning("*WARNING*: The target width (%u) was smaller than the input width (%u) for padding operation.\n", n, info_in.width);
    }
    OutputInfo pad_output;
    pad_output.is_signed = info_in.is_signed;
    pad_output.width = (n >= info_in.width) ? n : info_in.width;
    if (pad_output.width == output_y.width) {
      pad_output.id_to_write = output_y.id_to_write;
    } else {
      pad_output.id_to_write = getTempWireId();
      verilog += declareWire(pad_output.width, pad_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatE("PAD", info_in.is_signed, info_in.width, n, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, pad_output, indent);
    return verilog;
  }

  std::string Backend::writeOpAsUIntVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo asUInt_output;
    asUInt_output.is_signed = false;
    asUInt_output.width = info_in.width;
    if (asUInt_output.width == output_y.width) {
      asUInt_output.id_to_write = output_y.id_to_write;
    } else {
      asUInt_output.id_to_write = getTempWireId();
      verilog += declareWire(asUInt_output.width, asUInt_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatD("ASUINT", info_in.width, asUInt_output.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, asUInt_output, indent);
    return verilog;
  }

  std::string Backend::writeOpAsSIntVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo asSInt_output;
    asSInt_output.is_signed = true;
    asSInt_output.width = info_in.width;
    if (asSInt_output.width == output_y.width) {
      asSInt_output.id_to_write = output_y.id_to_write;
    } else {
      asSInt_output.id_to_write = getTempWireId();
      verilog += declareWire(asSInt_output.width, asSInt_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatD("ASSINT", info_in.width, asSInt_output.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, asSInt_output, indent);
    return verilog;
  }

  std::string Backend::writeOpShlVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent) {
    std::string verilog = "";
    OutputInfo shl_output;
    shl_output.is_signed = info_in.is_signed;
    shl_output.width = info_in.width + n;
    if (shl_output.width == output_y.width) {
      shl_output.id_to_write = output_y.id_to_write;
    } else {
      shl_output.id_to_write = getTempWireId();
      verilog += declareWire(shl_output.width, shl_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatE("SHL", info_in.is_signed, info_in.width, n, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, shl_output, indent);
    return verilog;
  }

  std::string Backend::writeOpShrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent) {
    std::string verilog = "";
    OutputInfo shr_output;
    shr_output.is_signed = info_in.is_signed;
    if (info_in.width - n < 1) {
      fs_warning("*WARNING*: The input width (%u) was not larger than the given bits (%u) to shift right. One-bit would be kept after shifting right.\n", info_in.width, n);
    }
    shr_output.width = (info_in.width > n + 1) ? (info_in.width - n) : 1;
    if (shr_output.width == output_y.width) {
      shr_output.id_to_write = output_y.id_to_write;
    } else {
      shr_output.id_to_write = getTempWireId();
      verilog += declareWire(shr_output.width, shr_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatE("SHR", info_in.is_signed, info_in.width, n, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, shr_output, indent);
    return verilog;
  }

  std::string Backend::writeOpDshlVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const OpInputInfo& info_n, std::string indent) {
    std::string verilog = "";
    if (info_n.is_signed) {
      fs_error("*ERROR*: The second input representing shift-bits was 'signed' but 'unsigned' was required.\n");
      return "";
    }
    OutputInfo dshl_output;
    dshl_output.is_signed = info_in.is_signed;
    dshl_output.width = info_in.width + (unsigned int)std::pow(2, info_n.width) - 1;
    if (dshl_output.width == output_y.width) {
      dshl_output.id_to_write = output_y.id_to_write;
    } else {
      dshl_output.id_to_write = getTempWireId();
      verilog += declareWire(dshl_output.width, dshl_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatG("DSHL", info_in.is_signed, info_in.width, info_n.width, output_y.id_to_write, info_in.id_to_write, info_n.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, dshl_output, indent);
    return verilog;
  }

  std::string Backend::writeOpDshrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const OpInputInfo& info_n, std::string indent) {
    std::string verilog = "";
    if (info_n.is_signed) {
      fs_error("*ERROR*: The second input representing shift-bits was 'signed' but 'unsigned' was required.\n");
      return "";
    }
    OutputInfo dshr_output;
    dshr_output.is_signed = info_in.is_signed;
    dshr_output.width = info_in.width;
    if (dshr_output.width == output_y.width) {
      dshr_output.id_to_write = output_y.id_to_write;
    } else {
      dshr_output.id_to_write = getTempWireId();
      verilog += declareWire(dshr_output.width, dshr_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatG("DSHR", info_in.is_signed, info_in.width, info_n.width, output_y.id_to_write, info_in.id_to_write, info_n.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, dshr_output, indent);
    return verilog;
  }

  std::string Backend::writeOpCvtVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo cvt_output;
    cvt_output.is_signed = true;
    cvt_output.width = info_in.is_signed ? info_in.width : (info_in.width + 1);
    if (cvt_output.width == output_y.width) {
      cvt_output.id_to_write = output_y.id_to_write;
    } else {
      cvt_output.id_to_write = getTempWireId();
      verilog += declareWire(cvt_output.width, cvt_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatC("CVT", info_in.is_signed, info_in.width, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, cvt_output, indent);
    return verilog;
  }

  std::string Backend::writeOpNegVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo neg_output;
    neg_output.is_signed = true;
    neg_output.width = info_in.width + 1;
    if (neg_output.width == output_y.width) {
      neg_output.id_to_write = output_y.id_to_write;
    } else {
      neg_output.id_to_write = getTempWireId();
      verilog += declareWire(neg_output.width, neg_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatC("NEG", info_in.is_signed, info_in.width, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, neg_output, indent);
    return verilog;
  }

  std::string Backend::writeOpBitwiseNotVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo bitwise_not_output;
    bitwise_not_output.is_signed = false;
    bitwise_not_output.width = info_in.width;
    if (bitwise_not_output.width == output_y.width) {
      bitwise_not_output.id_to_write = output_y.id_to_write;
    } else {
      bitwise_not_output.id_to_write = getTempWireId();
      verilog += declareWire(bitwise_not_output.width, bitwise_not_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatD("BITWISENOT", info_in.width, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, bitwise_not_output, indent);
    return verilog;
  }

  std::string Backend::writeOpBitwiseAndVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo bitwise_and_output;
    bitwise_and_output.is_signed = false;
    bitwise_and_output.width = new_info_a.width;
    if (bitwise_and_output.width == output_y.width) {
      bitwise_and_output.id_to_write = output_y.id_to_write;
    } else {
      bitwise_and_output.id_to_write = getTempWireId();
      verilog += declareWire(bitwise_and_output.width, bitwise_and_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatB("BITWISEAND", new_info_a.width, output_y.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, bitwise_and_output, indent);
    return verilog;
  }

  std::string Backend::writeOpBitwiseOrVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo bitwise_or_output;
    bitwise_or_output.is_signed = false;
    bitwise_or_output.width = new_info_a.width;
    if (bitwise_or_output.width == output_y.width) {
      bitwise_or_output.id_to_write = output_y.id_to_write;
    } else {
      bitwise_or_output.id_to_write = getTempWireId();
      verilog += declareWire(bitwise_or_output.width, bitwise_or_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatB("BITWISEOR", new_info_a.width, output_y.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, bitwise_or_output, indent);
    return verilog;
  }

  std::string Backend::writeOpBitwiseXorVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo bitwise_xor_output;
    bitwise_xor_output.is_signed = false;
    bitwise_xor_output.width = new_info_a.width;
    if (bitwise_xor_output.width == output_y.width) {
      bitwise_xor_output.id_to_write = output_y.id_to_write;
    } else {
      bitwise_xor_output.id_to_write = getTempWireId();
      verilog += declareWire(bitwise_xor_output.width, bitwise_xor_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatB("BITWISEXOR", new_info_a.width, output_y.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, bitwise_xor_output, indent);
    return verilog;
  }

  std::string Backend::writeOpAndrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo andr_output;
    andr_output.is_signed = false;
    andr_output.width = 1;
    if (andr_output.width == output_y.width) {
      andr_output.id_to_write = output_y.id_to_write;
    } else {
      andr_output.id_to_write = getTempWireId();
      verilog += declareWire(andr_output.width, andr_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatD("ANDR", info_in.width, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, andr_output, indent);
    return verilog;
  }

  std::string Backend::writeOpOrrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo orr_output;
    orr_output.is_signed = false;
    orr_output.width = 1;
    if (orr_output.width == output_y.width) {
      orr_output.id_to_write = output_y.id_to_write;
    } else {
      orr_output.id_to_write = getTempWireId();
      verilog += declareWire(orr_output.width, orr_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatD("ORR", info_in.width, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, orr_output, indent);
    return verilog;
  }

  std::string Backend::writeOpXorrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    OutputInfo xorr_output;
    xorr_output.is_signed = false;
    xorr_output.width = 1;
    if (xorr_output.width == output_y.width) {
      xorr_output.id_to_write = output_y.id_to_write;
    } else {
      xorr_output.id_to_write = getTempWireId();
      verilog += declareWire(xorr_output.width, xorr_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatD("XORR", info_in.width, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, xorr_output, indent);
    return verilog;
  }

  std::string Backend::writeOpCatVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OutputInfo cat_output;
    cat_output.is_signed = false;
    cat_output.width = info_a.width + info_b.width;
    if (cat_output.width == output_y.width) {
      cat_output.id_to_write = output_y.id_to_write;
    } else {
      cat_output.id_to_write = getTempWireId();
      verilog += declareWire(cat_output.width, cat_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatH("CAT", info_a.width, info_b.width, output_y.id_to_write, info_a.id_to_write, info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, cat_output, indent);
    return verilog;
  }

  std::string Backend::writeOpBitsVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int high, const unsigned int low, std::string indent) {
    std::string verilog = "";
    OutputInfo bits_output;
    bits_output.is_signed = false;
    bits_output.width = (high + 1) - low;
    if (bits_output.width == output_y.width) {
      bits_output.id_to_write = output_y.id_to_write;
    } else {
      bits_output.id_to_write = getTempWireId();
      verilog += declareWire(bits_output.width, bits_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatI("BITS", info_in.width, high, low, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, bits_output, indent);
    return verilog;
  }

  std::string Backend::writeOpHeadVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent) {
    std::string verilog = "";
    OutputInfo head_output;
    head_output.is_signed = false;
    head_output.width = n;
    if (head_output.width == output_y.width) {
      head_output.id_to_write = output_y.id_to_write;
    } else {
      head_output.id_to_write = getTempWireId();
      verilog += declareWire(head_output.width, head_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatF("HEAD", info_in.width, n, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, head_output, indent);
    return verilog;
  }

  std::string Backend::writeOpTailVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent) {
    std::string verilog = "";
    OutputInfo tail_output;
    tail_output.is_signed = false;
    tail_output.width = info_in.width - n;
    if (tail_output.width == output_y.width) {
      tail_output.id_to_write = output_y.id_to_write;
    } else {
      tail_output.id_to_write = getTempWireId();
      verilog += declareWire(tail_output.width, tail_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatF("TAIL", info_in.width, n, output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, tail_output, indent);
    return verilog;
  }

  std::string Backend::writeOpAsClockVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    if (info_in.width != 1 || info_in.is_signed) {
      fs_error("*ERROR*: The input signal ('%s', width %u) for 'asClock' operation was not one-bit 'UInt' type.\n", info_in.is_signed ? "signed" : "unsigned", info_in.width);
      return "";
    }
    if (output_y.width != 1 || output_y.is_signed) {
      fs_warning("*WARNING*: The signal ('%s', width %u) connecting to the output of 'asClock' operation was not one-bit 'UInt' type.\n", output_y.is_signed ? "signed" : "unsigned", output_y.width);
    }
    OutputInfo asClock_output;
    asClock_output.is_signed = false;
    asClock_output.width = 1;
    if (asClock_output.width == output_y.width) {
      asClock_output.id_to_write = output_y.id_to_write;
    } else {
      asClock_output.id_to_write = getTempWireId();
      verilog += declareWire(asClock_output.width, asClock_output.id_to_write, indent);
    }
    verilog += writeAssignVerilog(output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, asClock_output, indent);
    return verilog;
  }

  std::string Backend::writeOpAsAsyncResetVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent) {
    std::string verilog = "";
    if (info_in.width != 1 || info_in.is_signed) {
      fs_error("*ERROR*: The input signal ('%s', width %u) for 'asAsyncReset' operation was not one-bit 'UInt' type.\n", info_in.is_signed ? "signed" : "unsigned", info_in.width);
      return "";
    }
    if (output_y.width != 1 || output_y.is_signed) {
      fs_warning("*WARNING*: The signal ('%s', width %u) connecting to the output of 'asAsyncReset' operation was not one-bit 'UInt' type.\n", output_y.is_signed ? "signed" : "unsigned", output_y.width);
    }
    OutputInfo asAsyncReset_output;
    asAsyncReset_output.is_signed = false;
    asAsyncReset_output.width = 1;
    if (asAsyncReset_output.width == output_y.width) {
      asAsyncReset_output.id_to_write = output_y.id_to_write;
    } else {
      asAsyncReset_output.id_to_write = getTempWireId();
      verilog += declareWire(asAsyncReset_output.width, asAsyncReset_output.id_to_write, indent);
    }
    verilog += writeAssignVerilog(output_y.id_to_write, info_in.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, asAsyncReset_output, indent);
    return verilog;
  }

  std::string Backend::writeDffVerilog(const RegisterInfo & reg_info, std::string indent) {
    std::string verilog = "";
    std::string cell_name = reg_info.clock_posedge_active ? "DFF_POSCLK" : "DFF_NEGCLK";
    std::string gate_name = reg_info.reg_id_to_write;
    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return "";
    }
    std::vector<std::string> ports = it->second;
    if ((unsigned int)ports.size() != 3) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), 3);
      fs_assert(0);
      return "";
    }
    verilog += declareWire(reg_info.width, reg_info.output_q_id_to_write, indent);
    verilog += declareWire(reg_info.width, reg_info.input_d_id_to_write, indent);
    verilog += indent + cell_name + " #(" + std::to_string(reg_info.width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + reg_info.output_q_id_to_write + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + reg_info.input_d_id_to_write + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + reg_info.clock_id_to_write + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  std::string Backend::writeDffAsyncRstVerilog(const RegisterInfo & reg_info, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "";
    if (reg_info.clock_posedge_active) {
      cell_name = reg_info.reg_reset_posedge_active ? "DFF_POSCLK_POSASYNCRST" : "DFF_POSCLK_NEGASYNCRST";
    } else {
      cell_name = reg_info.reg_reset_posedge_active ? "DFF_NEGCLK_POSASYNCRST" : "DFF_NEGCLK_NEGASYNCRST";
    }
    std::string gate_name = reg_info.reg_id_to_write;
    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return "";
    }
    std::vector<std::string> ports = it->second;
    if ((unsigned int)ports.size() != 5) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), 5);
      fs_assert(0);
      return "";
    }
    verilog += declareWire(reg_info.width, reg_info.output_q_id_to_write, indent);
    verilog += declareWire(reg_info.width, reg_info.input_d_id_to_write, indent);
    OpInputInfo reg_init_in;
    reg_init_in.is_signed = reg_info.is_signed;
    reg_init_in.id_to_write = reg_info.reg_init_id_to_write;
    reg_init_in.width = reg_info.reg_init_width;
    OutputInfo reg_init_out;
    reg_init_out.is_signed = reg_info.is_signed;
    reg_init_out.id_to_write = getDffRstValName(reg_info.reg_id_to_write);
    reg_init_out.width = reg_info.width;
    verilog += declareWire(reg_init_out.width, reg_init_out.id_to_write, indent);
    verilog += writeDirectConnectVerilog(reg_init_out, reg_init_in, indent);
    verilog += indent + cell_name + " #(" + std::to_string(reg_info.width) + ") " + gate_name + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + reg_info.output_q_id_to_write + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + reg_info.input_d_id_to_write + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + reg_info.reg_reset_id_to_write + "),\n";
    verilog += indent + indent + "." + ports[3] + "(" + reg_init_out.id_to_write + "),\n";
    verilog += indent + indent + "." + ports[4] + "(" + reg_info.clock_id_to_write + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  std::string Backend::writeMuxVerilog(const OutputInfo& output_y, const OpInputInfo& sel, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent) {
    std::string verilog = "";
    OpInputInfo new_info_a;
    OpInputInfo new_info_b;
    verilog += alignWidthToMax(info_a, info_b, new_info_a, new_info_b, indent);
    OutputInfo mux_output;
    mux_output.is_signed = new_info_a.is_signed;
    mux_output.width = new_info_a.width;
    if (mux_output.width == output_y.width) {
      mux_output.id_to_write = output_y.id_to_write;
    } else {
      mux_output.id_to_write = getTempWireId();
      verilog += declareWire(mux_output.width, mux_output.id_to_write, indent);
    }
    verilog += writeVerilogFormatJ("MUX", new_info_a.is_signed, new_info_a.width, mux_output.id_to_write, sel.id_to_write, new_info_a.id_to_write, new_info_b.id_to_write, indent);
    verilog += alignOutputWidthAndType(output_y, mux_output, indent);
    return verilog;
  }

  bool Backend::getRegisterInfo(firDB::firItemRegister* post_register, firDB::firModule* module, RegisterInfo & reg_info) {
    fs_assert(post_register != NULL);
    reg_info.reg_id_to_write = getWriteID(module, post_register->id());
    reg_info.input_d_id_to_write = getDffInputDName(reg_info.reg_id_to_write);
    reg_info.output_q_id_to_write = getDffOutputQName(reg_info.reg_id_to_write);
    firDB::firType* type_data = post_register->type_data();
    reg_info.is_signed = getPostTypeSign(type_data);
    reg_info.width = (unsigned int)getPostTypeWidth(type_data);
    firDB::firExp* clock = post_register->clock_signal();
    OpInputInfo info_clock = getOpInputInfo(clock, module);
    if (!clock->isReferenceExpression() && !clock->isSubfieldExpression()) {
      fs_error("*ERROR*: The clock signal '%s' of register '%s' was invalid for writing Verilog.\n", clock->toString().c_str(), post_register->id().c_str());
      return false;
    }
    firDB::firType* clock_type = clock->getTypeData(module);
    if (clock_type != NULL) {
      if (!clock_type->isClockType()) {
        fs_error("*ERROR*: The clock signal '%s' of register '%s' was not 'Clock' type.\n", clock->toString().c_str(), post_register->id().c_str());
        return false;
      }
    }
    reg_info.clock_id_to_write = info_clock.id_to_write;
    // By default of Chisel Community, register is DFF with posedge-active clock;
    // In general, this should come from the program if considering all clock signal possibilities
    reg_info.clock_posedge_active = true;   

    firDB::firExp* reg_reset = post_register->reg_reset();
    firDB::firExp* reg_init = post_register->reg_init();
    if (reg_reset != NULL) {
      reg_info.has_reg_reset = true;
      OpInputInfo info_reg_reset = getOpInputInfo(reg_reset, module);
      if (info_reg_reset.width != 1 || info_reg_reset.is_signed != false) {
        fs_error("*ERROR*: The reset signal '%s' (%s, width %u) for register '%s' was not 'UInt' with 1-bit width.\n", reg_reset->toString().c_str(),
          info_reg_reset.is_signed ? "signed" : "unsigned", info_reg_reset.width, post_register->id().c_str());
        return false;
      }
      reg_info.reg_reset_id_to_write = info_reg_reset.id_to_write;
      firDB::firType* reg_reset_type = reg_reset->getTypeData(module);
      if (reg_reset_type->isAsyncResetType()) {
        // DFF with async reset
        reg_info.is_sync_reset = false;
        fs_warning("*WARNING*: The reset signal '%s' of register '%s' was 'AsyncReset' type.\n", reg_reset->toString().c_str(), post_register->id().c_str());
        // By default of Chisel Community, register is DFF with posedge-active async reset signal;
        // In general, this should come from the program if considering all async reset signal possibilities
        reg_info.reg_reset_posedge_active = true;
      } else {
        // DFF with sync reset
        reg_info.is_sync_reset = true;
        // By default of Chisel Community, register is DFF with posedge-active sync reset signal;
        // In general, this should come from the program if considering all sync reset signal possibilities
        reg_info.reg_reset_posedge_active = true;
      }
      if (reg_init == NULL) {
        fs_error("*ERROR*: Could not find the reset value for reset signal '%s' of register '%s'.\n", reg_reset->toString().c_str(), post_register->id().c_str());
        return false;
      }
      OpInputInfo info_reg_init = getOpInputInfo(reg_init, module);
      if (info_reg_init.is_signed != reg_info.is_signed) {
        fs_error("*ERROR*: The reset value type was '%s' while the data type was '%s' for register '%s'.\n",
          (info_reg_init.is_signed ? "signed" : "unsigned"), (reg_info.is_signed ? "signed" : "unsigned"), post_register->id().c_str());
        return false;
      }
      reg_info.reg_init_id_to_write = info_reg_init.id_to_write;
      reg_info.reg_init_width = info_reg_init.width;
    } else {
      // DFF without reset
      reg_info.has_reg_reset = false;
      if (reg_init != NULL) {
        fs_error("*ERROR*: A reset value ('%s') was found while no reset signal was found for register '%s'.\n", reg_init->toString().c_str(), post_register->id().c_str());
        return false;
      }
    }
    return true;
  }

  bool Backend::sameSign(const OpInputInfo& info_a, const OpInputInfo& info_b, firDB::firExp* exp) {
    if (info_a.is_signed != info_b.is_signed) {
      fs_error("*ERROR*: The two inputs had different signs ('%s' and '%s') in operation '%s'.\n", info_a.is_signed ? "signed" : "unsigned", info_b.is_signed ? "signed" : "unsigned", exp->toString().c_str());
      return false;
    }
    return true;
  }

  std::string Backend::extendBits(const OpInputInfo& info_x, unsigned int target_width, OpInputInfo& new_info_x, std::string indent) {
    std::string verilog = "";
    if (target_width <= info_x.width) {
      fs_error("*ERROR*: The target width (%u) was smaller than the input width (%u) for padding operation.\n", target_width, info_x.width);
      return "";
    }
    OutputInfo extended_x;
    extended_x.is_signed = info_x.is_signed;
    extended_x.width = target_width;
    extended_x.id_to_write = getTempWireId();
    verilog += declareWire(extended_x.width, extended_x.id_to_write, indent);
    verilog += writeOpPadVerilog(extended_x, info_x, target_width, indent);
    new_info_x.is_signed = extended_x.is_signed;
    new_info_x.width = extended_x.width;
    new_info_x.id_to_write = extended_x.id_to_write;
    return verilog;
  }

  std::string Backend::alignWidthToMax(const OpInputInfo& info_a, const OpInputInfo& info_b, OpInputInfo& new_info_a, OpInputInfo& new_info_b, std::string indent) {
    std::string verilog = "";
    if (info_a.width == info_b.width) {
      new_info_a = info_a;
      new_info_b = info_b;
    } else if (info_a.width > info_b.width) {
      verilog += extendBits(info_b, info_a.width, new_info_b, indent);
      new_info_a = info_a;
    } else {
      verilog += extendBits(info_a, info_b.width, new_info_a, indent);
      new_info_b = info_b;
    }
    if (new_info_a.width != new_info_b.width) {
      fs_error("*ERROR*: Failed to align the width, one was %u, the other was %u after the alignment.\n", new_info_a.width, new_info_b.width);
      fs_assert(0);
      return "";
    }
    return verilog;
  }

  std::string Backend::alignOutputWidthAndType(const OutputInfo& output_y, const OutputInfo& cell_output, std::string indent) {
    std::string verilog = "";
    if (output_y.is_signed != cell_output.is_signed) {
      fs_error("*ERROR*: The cell output '%s' has type '%s' but the connected output '%s' has type '%s'.\n", cell_output.id_to_write.c_str(),
        cell_output.is_signed ? "signed" : "unsigned", output_y.id_to_write.c_str(), output_y.is_signed ? "signed" : "unsigned");
      return "";
    }
    if (output_y.width == cell_output.width) {
      verilog += "";
    } else if (output_y.width > cell_output.width) {
      OpInputInfo pad_input;
      pad_input.is_signed = cell_output.is_signed;
      pad_input.width = cell_output.width;
      pad_input.id_to_write = cell_output.id_to_write;
      verilog += writeOpPadVerilog(output_y, pad_input, output_y.width, indent);
    } else {
      OutputInfo bits_output;
      bits_output.is_signed = false;
      bits_output.width = output_y.width;
      if (output_y.is_signed) {
        bits_output.id_to_write = getTempWireId();
        verilog += declareWire(bits_output.width, bits_output.id_to_write, indent);
      } else {
        bits_output.id_to_write = output_y.id_to_write;
      }
      OpInputInfo bits_input;
      bits_input.is_signed = cell_output.is_signed;
      bits_input.width = cell_output.width;
      bits_input.id_to_write = cell_output.id_to_write;
      verilog += writeOpBitsVerilog(bits_output, bits_input, bits_output.width - 1, 0, indent);
      if (output_y.is_signed) {
        OpInputInfo asSInt_input;
        asSInt_input.is_signed = bits_output.is_signed;
        asSInt_input.width = bits_output.width;
        asSInt_input.id_to_write = bits_output.id_to_write;
        verilog += writeOpAsSIntVerilog(output_y, asSInt_input, indent);
      }
    }
    return verilog;
  }

  std::string Backend::mapCell(OutputInfo& output_y, firDB::firModule* module, firDB::firExp* exp, std::string indent) {
    std::string gate_verilog = "";
    if (exp->isReferenceExpression()) {
      firDB::firExpRef* ref = dynamic_cast<firDB::firExpRef*>(exp);
      OpInputInfo info_ref = getOpInputInfo(ref, module);
      gate_verilog = writeDirectConnectVerilog(output_y, info_ref, indent);
    } else if (exp->isSubfieldExpression()) {
      firDB::firExpSubfield* module_port = dynamic_cast<firDB::firExpSubfield*>(exp);
      OpInputInfo info_module_port = getOpInputInfo(module_port, module);
      gate_verilog = writeDirectConnectVerilog(output_y, info_module_port, indent);
    } else if (exp->isMuxExpression()) {
      firDB::firExpMux* mux = dynamic_cast<firDB::firExpMux*>(exp);
      OpInputInfo info_sel = getOpInputInfo(mux->sel(), module);
      OpInputInfo info_a = getOpInputInfo(mux->input1(), module);
      OpInputInfo info_b = getOpInputInfo(mux->input2(), module);
      if (info_sel.width != 1 || info_sel.is_signed != false) {
        fs_error("*ERROR*: The selection signal (%s, width %u) in mux operation '%s' was not 'UInt' with 1-bit width.\n", 
          info_sel.is_signed ? "signed" : "unsigned", info_sel.width, mux->toString().c_str());
        return "";
      }
      if (!sameSign(info_a, info_b, mux)) {
        return "";
      }
      if (output_y.id_to_write == info_a.id_to_write) {
        fs_error("*ERROR*: In a MUX with output '%s', the first input '%s' was the same with the output, which would form a loop and become invalid.\n",
          output_y.id_to_write.c_str(), info_a.id_to_write.c_str());
        return "";
      } else if (output_y.id_to_write == info_b.id_to_write) {
        fs_error("*ERROR*: In a MUX with output '%s', the second input '%s' was the same with the output, which would form a loop and become invalid.\n",
          output_y.id_to_write.c_str(), info_b.id_to_write.c_str());
        return "";
      } else {
        gate_verilog = writeMuxVerilog(output_y, info_sel, info_a, info_b, indent);
      }
    } else if (exp->isNumberExpression()) {
      OpInputInfo info_num = getOpInputInfo(exp, module);
      gate_verilog = writeDirectConnectVerilog(output_y, info_num, indent);
    } else if (exp->isPrimOperationExpression()) {
      firDB::firExpPrimOperation* exp_op = dynamic_cast<firDB::firExpPrimOperation*>(exp);
      switch (exp_op->operator_type()) {
      case firDB::firExpPrimOperation::kOperatorTypeAdd: {
        firDB::firExpPrimOperation::firAdd* op_add = dynamic_cast<firDB::firExpPrimOperation::firAdd*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_add->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_add->exp2(), module);
        if (!sameSign(info_a, info_b, op_add)) {
          return "";
        }
        gate_verilog = writeOpAddVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeSub: {
        firDB::firExpPrimOperation::firSub* op_sub = dynamic_cast<firDB::firExpPrimOperation::firSub*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_sub->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_sub->exp2(), module);
        if (!sameSign(info_a, info_b, op_sub)) {
          return "";
        }
        gate_verilog = writeOpSubVerilog(output_y, info_a, info_b, indent);
        break;
      }   
      case firDB::firExpPrimOperation::kOperatorTypeMul: {
        firDB::firExpPrimOperation::firMul* op_mul = dynamic_cast<firDB::firExpPrimOperation::firMul*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_mul->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_mul->exp2(), module);
        if (!sameSign(info_a, info_b, op_mul)) {
          return "";
        }
        if (info_a.is_a_number == true && info_b.is_a_number == false) {
          gate_verilog = writeOptimizedOpMulVerilog(output_y, info_a, info_b, indent);
        } else if (info_a.is_a_number == false && info_b.is_a_number == true) {
          gate_verilog = writeOptimizedOpMulVerilog(output_y, info_a, info_b, indent);
        } else {
          gate_verilog = writeOpMulVerilog(output_y, info_a, info_b, indent);
        }
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeDiv: {
        firDB::firExpPrimOperation::firDiv* op_div = dynamic_cast<firDB::firExpPrimOperation::firDiv*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_div->num(), module);
        OpInputInfo info_b = getOpInputInfo(op_div->den(), module);
        if (!sameSign(info_a, info_b, op_div)) {
          return "";
        }
        gate_verilog = writeOpDivVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeMod: {
        firDB::firExpPrimOperation::firMod* op_mod = dynamic_cast<firDB::firExpPrimOperation::firMod*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_mod->num(), module);
        OpInputInfo info_b = getOpInputInfo(op_mod->den(), module);
        if (!sameSign(info_a, info_b, op_mod)) {
          return "";
        }
        gate_verilog = writeOpModVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeLt: {
        firDB::firExpPrimOperation::firLt* op_lt = dynamic_cast<firDB::firExpPrimOperation::firLt*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_lt->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_lt->exp2(), module);
        if (!sameSign(info_a, info_b, op_lt)) {
          return "";
        }
        gate_verilog = writeOpLtVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeLeq: {
        firDB::firExpPrimOperation::firLeq* op_leq = dynamic_cast<firDB::firExpPrimOperation::firLeq*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_leq->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_leq->exp2(), module);
        if (!sameSign(info_a, info_b, op_leq)) {
          return "";
        }
        gate_verilog = writeOpLeqVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeGt: {
        firDB::firExpPrimOperation::firGt* op_gt = dynamic_cast<firDB::firExpPrimOperation::firGt*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_gt->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_gt->exp2(), module);
        if (!sameSign(info_a, info_b, op_gt)) {
          return "";
        }
        gate_verilog = writeOpGtVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeGeq: {
        firDB::firExpPrimOperation::firGeq* op_geq = dynamic_cast<firDB::firExpPrimOperation::firGeq*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_geq->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_geq->exp2(), module);
        if (!sameSign(info_a, info_b, op_geq)) {
          return "";
        }
        gate_verilog = writeOpGeqVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeEq: {
        firDB::firExpPrimOperation::firEq* op_eq = dynamic_cast<firDB::firExpPrimOperation::firEq*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_eq->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_eq->exp2(), module);
        if (!sameSign(info_a, info_b, op_eq)) {
          return "";
        }
        gate_verilog = writeOpEqVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeNeq: {
        firDB::firExpPrimOperation::firNeq* op_neq = dynamic_cast<firDB::firExpPrimOperation::firNeq*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_neq->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_neq->exp2(), module);
        if (!sameSign(info_a, info_b, op_neq)) {
          return "";
        }
        gate_verilog = writeOpNeqVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypePad: {
        firDB::firExpPrimOperation::firPad* op_pad = dynamic_cast<firDB::firExpPrimOperation::firPad*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_pad->exp(), module);
        if (info_in.width > op_pad->n()) {
          fs_warning("*WARNING*: The input width (%u) was larger than the padding target width (%u) in operation '%s'. The padding operation might be not needed.\n",
            info_in.width, op_pad->n(), op_pad->toString().c_str());
        }
        gate_verilog = writeOpPadVerilog(output_y, info_in, op_pad->n(), indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeAsUInt: {
        firDB::firExpPrimOperation::firAsUInt* op_asUInt = dynamic_cast<firDB::firExpPrimOperation::firAsUInt*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_asUInt->exp(), module);
        gate_verilog = writeOpAsUIntVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeAsSInt: {
        firDB::firExpPrimOperation::firAsSInt* op_asSInt = dynamic_cast<firDB::firExpPrimOperation::firAsSInt*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_asSInt->exp(), module);
        gate_verilog = writeOpAsSIntVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeShl: {
        firDB::firExpPrimOperation::firShl* op_shl = dynamic_cast<firDB::firExpPrimOperation::firShl*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_shl->exp(), module);
        gate_verilog = writeOpShlVerilog(output_y, info_in, op_shl->n(), indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeShr: {
        firDB::firExpPrimOperation::firShr* op_shr = dynamic_cast<firDB::firExpPrimOperation::firShr*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_shr->exp(), module);
        gate_verilog = writeOpShrVerilog(output_y, info_in, op_shr->n(), indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeDshl: {
        firDB::firExpPrimOperation::firDshl* op_dshl = dynamic_cast<firDB::firExpPrimOperation::firDshl*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_dshl->exp1(), module);
        OpInputInfo info_n = getOpInputInfo(op_dshl->exp2(), module);
        if (info_n.is_signed) {
          fs_error("*ERROR*: The second input '%s' for shift-bits was not 'UInt' type in operation '%s'.\n", op_dshl->exp2()->toString().c_str(), op_dshl->toString().c_str());
          return "";
        }
        gate_verilog = writeOpDshlVerilog(output_y, info_in, info_n, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeDshr: {
        firDB::firExpPrimOperation::firDshr* op_dshr = dynamic_cast<firDB::firExpPrimOperation::firDshr*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_dshr->exp1(), module);
        OpInputInfo info_n = getOpInputInfo(op_dshr->exp2(), module);
        if (info_n.is_signed) {
          fs_error("*ERROR*: The second input for shift-bits was not 'UInt' type in operation '%s'.\n", op_dshr->toString().c_str());
          return "";
        }
        gate_verilog = writeOpDshrVerilog(output_y, info_in, info_n, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeCvt: {
        firDB::firExpPrimOperation::firCvt* op_cvt = dynamic_cast<firDB::firExpPrimOperation::firCvt*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_cvt->exp(), module);
        gate_verilog = writeOpCvtVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeNeg: {
        firDB::firExpPrimOperation::firNeg* op_neg = dynamic_cast<firDB::firExpPrimOperation::firNeg*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_neg->exp(), module);
        gate_verilog = writeOpNegVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeNot: {
        firDB::firExpPrimOperation::firNot* op_not = dynamic_cast<firDB::firExpPrimOperation::firNot*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_not->exp(), module);
        gate_verilog = writeOpBitwiseNotVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeAnd: {
        firDB::firExpPrimOperation::firAnd* op_and = dynamic_cast<firDB::firExpPrimOperation::firAnd*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_and->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_and->exp2(), module);
        if (!sameSign(info_a, info_b, op_and)) {
          return "";
        }
        gate_verilog = writeOpBitwiseAndVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeOr: {
        firDB::firExpPrimOperation::firOr* op_or = dynamic_cast<firDB::firExpPrimOperation::firOr*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_or->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_or->exp2(), module);
        if (!sameSign(info_a, info_b, op_or)) {
          return "";
        }
        gate_verilog = writeOpBitwiseOrVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeXor: {
        firDB::firExpPrimOperation::firXor* op_xor = dynamic_cast<firDB::firExpPrimOperation::firXor*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_xor->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_xor->exp2(), module);
        if (!sameSign(info_a, info_b, op_xor)) {
          return "";
        }
        gate_verilog = writeOpBitwiseXorVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeAndr: {
        firDB::firExpPrimOperation::firAndr* op_andr = dynamic_cast<firDB::firExpPrimOperation::firAndr*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_andr->exp(), module);
        if (info_in.is_signed) {
          fs_warning("*WARNING*: The input type was 'SInt' in operation '%s'. Operation 'andr' is suitable for 'UInt' type.\n", op_andr->toString().c_str());
        }
        gate_verilog = writeOpAndrVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeOrr: {
        firDB::firExpPrimOperation::firOrr* op_orr = dynamic_cast<firDB::firExpPrimOperation::firOrr*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_orr->exp(), module);
        if (info_in.is_signed) {
          fs_warning("*WARNING*: The input type was 'SInt' in operation '%s'. Operation 'orr' is suitable for 'UInt' type.\n", op_orr->toString().c_str());
        }
        gate_verilog = writeOpOrrVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeXorr: {
        firDB::firExpPrimOperation::firXorr* op_xorr = dynamic_cast<firDB::firExpPrimOperation::firXorr*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_xorr->exp(), module);
        if (info_in.is_signed) {
          fs_warning("*WARNING*: The input type was 'SInt' in operation '%s'. Operation 'xorr' is suitable for 'UInt' type.\n", op_xorr->toString().c_str());
        }
        gate_verilog = writeOpXorrVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeCat: {
        firDB::firExpPrimOperation::firCat* op_cat = dynamic_cast<firDB::firExpPrimOperation::firCat*>(exp_op);
        OpInputInfo info_a = getOpInputInfo(op_cat->exp1(), module);
        OpInputInfo info_b = getOpInputInfo(op_cat->exp2(), module);
        if (!sameSign(info_a, info_b, op_cat)) {
          return "";
        }
        gate_verilog = writeOpCatVerilog(output_y, info_a, info_b, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeBits: {
        firDB::firExpPrimOperation::firBits* op_bits = dynamic_cast<firDB::firExpPrimOperation::firBits*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_bits->exp(), module);
        if (op_bits->hi() < op_bits->lo()) {
          fs_error("*ERROR*: The index 'high' (%u) was smaller than the index 'low' (%u) in operation '%s'.\n", op_bits->hi(), op_bits->lo(), op_bits->toString().c_str());
          return "";
        }
        if (op_bits->hi() >= info_in.width) {
          fs_error("*ERROR*: The index 'high' (%u) was larger than the input width (%u) in operation '%s'.\n", op_bits->hi(), op_bits->toString().c_str());
          return "";
        }
        if (op_bits->lo() >= info_in.width) {
          fs_error("*ERROR*: The index 'low' (%u) was larger than the input width (%u) in operation '%s'.\n", op_bits->lo(), op_bits->toString().c_str());
          return "";
        }
        gate_verilog = writeOpBitsVerilog(output_y, info_in, op_bits->hi(), op_bits->lo(), indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeHead: {
        firDB::firExpPrimOperation::firHead* op_head = dynamic_cast<firDB::firExpPrimOperation::firHead*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_head->exp(), module);
        if (op_head->n() > info_in.width) {
          fs_error("*ERROR*: The number 'n' (%u) was larger than the input width (%u) in operation '%s'.\n", op_head->n(), info_in.width, op_head->toString().c_str());
          return "";
        }
        gate_verilog = writeOpHeadVerilog(output_y, info_in, op_head->n(), indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeTail: {
        firDB::firExpPrimOperation::firTail* op_tail = dynamic_cast<firDB::firExpPrimOperation::firTail*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_tail->exp(), module);
        if (op_tail->n() >= info_in.width) {
          fs_error("*ERROR*: The number 'n' (%u) was not smaller than the input width (%u) in operation '%s'.\n", op_tail->n(), info_in.width, op_tail->toString().c_str());
          return "";
        }
        gate_verilog = writeOpTailVerilog(output_y, info_in, op_tail->n(), indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeAsClock: {
        firDB::firExpPrimOperation::firAsClock* op_asClock = dynamic_cast<firDB::firExpPrimOperation::firAsClock*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_asClock->exp(), module);
        if (info_in.is_signed != false) {
          fs_error("*ERROR*: The type of the input was not 'UInt' in operation '%s'.\n", op_asClock->toString().c_str());
          return "";
        }
        if (info_in.width != 1) {
          fs_error("*ERROR*: The width (%d) of the input was not 1 in operation '%s'.\n", info_in.width, op_asClock->toString().c_str());
          return "";
        }
        gate_verilog = writeOpAsClockVerilog(output_y, info_in, indent);
        break;
      }
      case firDB::firExpPrimOperation::kOperatorTypeAsAsyncReset: {
        firDB::firExpPrimOperation::firAsAsyncReset* op_asAsyncReset = dynamic_cast<firDB::firExpPrimOperation::firAsAsyncReset*>(exp_op);
        OpInputInfo info_in = getOpInputInfo(op_asAsyncReset->exp(), module);
        if (info_in.is_signed != false) {
          fs_error("*ERROR*: The type of the input was not 'UInt' in operation '%s'.\n", op_asAsyncReset->toString().c_str());
          return "";
        }
        if (info_in.width != 1) {
          fs_error("*ERROR*: The width (%u) of the input was not 1 in operation '%s'.\n", info_in.width, op_asAsyncReset->toString().c_str());
          return "";
        }
        gate_verilog = writeOpAsAsyncResetVerilog(output_y, info_in, indent);
        break;
      }
      default: {
        fs_error("*ERROR*: Found an unexpected operation '%s'. The operation could not be mapped to a macro cell from the library.\n", exp_op->toString().c_str());
        return "";
      }
      }
    } else if (exp->isValidifExpression()) {
      firDB::firExpValidif* validif = dynamic_cast<firDB::firExpValidif*>(exp);
      firDB::firExp* valid = validif->valid();
      OpInputInfo info_valid = getOpInputInfo(valid, module);
      if (info_valid.is_signed) {
        fs_error("*ERROR*: The type of the valid condition was not 'UInt' in operation '%s'.\n", validif->toString().c_str());
        return "";
      }
      if (info_valid.width != 1) {
        fs_error("*ERROR*: The width (%u) of the valid condition was not 1 in operation '%s'.\n", info_valid.width, validif->toString().c_str());
        return "";
      }
      OpInputInfo info_in = getOpInputInfo(validif->exp(), module);
      gate_verilog = writeDirectConnectVerilog(output_y, info_in, indent);
    } else {
      fs_error("*ERROR*: The expression '%s' was invalid for writing Verilog.\n", exp->toString().c_str());
      return "";
    }
    return gate_verilog;
  }

  void Backend::netMapping(firDB::firModule* module, std::map<std::string, std::string> & bufferMap) {
    fs_assert(module != NULL);
    for (size_t i = 0; i < module->statements().size(); i++) {
      firDB::firItem* stmt = module->statements()[i];
      if (stmt->isConnectItem()) {
        firDB::firItemConnect* connect = dynamic_cast<firDB::firItemConnect*>(stmt);
        firDB::firExp* left_exp = connect->connect_l();
        firDB::firExp* right_exp = connect->connect_r();
        std::string left_id = "";
        if (left_exp->isReferenceExpression()) {
          left_id = dynamic_cast<firDB::firExpRef*>(left_exp)->id();
        } else if (left_exp->isSubfieldExpression()) {
          left_id = dynamic_cast<firDB::firExpSubfield*>(left_exp)->toString();
        } else {
          fs_error("*ERROR*: The left side expression in connect '%s' was not an ID.\n", connect->toString().c_str());
          return;
        }
       
        std::string right_id = "";
        if (right_exp->isReferenceExpression()) {
          right_id = dynamic_cast<firDB::firExpRef*>(right_exp)->id();
          bufferMap.insert(std::make_pair(right_id, left_id));
        } else if (right_exp->isSubfieldExpression()) {
          right_id = dynamic_cast<firDB::firExpSubfield*>(right_exp)->id();
          bufferMap.insert(std::make_pair(right_id, left_id));
        } else {
          continue;
        }
      } else if (stmt->isNodeItem()) {
        firDB::firItemNode* node = dynamic_cast<firDB::firItemNode*>(stmt);
        fs_assert(node);
        //FIXME: unfinished
      } else {
        continue;
      }
    }
  }

  bool Backend::writePortVerilog(FILE* fp, firDB::firModule* module, std::string indent) {
    fs_assert(fp != NULL);
    fs_assert(module != NULL);

    // module and ports
    std::string verilog = "";
    verilog += "module " + module->id() + "(\n";
    for (size_t i = 0; i < module->ports().size(); i++) {
      firDB::firItemPort* tmp_port = module->ports()[i];
      std::string dir = (tmp_port->dir() == firDB::kPortDirInput) ? "input" : "output";
      if (tmp_port->dir() == firDB::kPortDirInout) {
        fs_warning("*WARNING*: The direction of port '%s' was detected to be inout type.\n", tmp_port->id().c_str());
        dir = "inout";
      } else if (tmp_port->dir() == firDB::kPortDirUndef) {
        fs_error("*ERROR*: The direction of port '%s' was undefined. Define the port direction and rerun.\n", tmp_port->id().c_str());
        dir = "";
        return "";
      }
      firDB::firType* type_data = tmp_port->type_data();
      if (!type_data->isPostType()) {
        fs_error("*ERROR*: The data type of port '%s' was not a post type in the write_verilog process.\n", tmp_port->id().c_str());
        return "";
      }
      if (type_data->isAnalogType()) {
        dir = "inout";
      }
      int width = getPostTypeWidth(type_data);
      std::string bus = formBus(width);
      std::string port_id = getWriteID(module, tmp_port->id());
      if (bus == "") {
        verilog += indent + dir + " " + port_id;
      } else {
        verilog += indent + dir + " " + bus + " " + port_id;
      }
      if (i == module->ports().size() - 1) {
        verilog += "\n";
      } else {
        verilog += ",\n";
      }
    }
    verilog += ");\n";
    fprintf(fp, "%s", verilog.c_str());
    return true;
  }

  bool Backend::writeNodeVerilog(firDB::firItemNode* post_node, FILE* fp, firDB::firModule* module, std::string indent) {
    fs_assert(post_node != NULL);
    OutputInfo output_y;
    firDB::firExp* exp = post_node->exp();
    output_y.id_to_write = getWriteID(module, post_node->id());
    firDB::firType* type_data = exp->getTypeData(module);
    output_y.width = (unsigned int)getPostTypeWidth(type_data);
    output_y.is_signed = getPostTypeSign(type_data);
    std::string node_verilog = declareWire(output_y.width, output_y.id_to_write, indent);
    node_verilog += mapCell(output_y, module, exp, indent);
    if (node_verilog == "") {
      fs_error("*ERROR*: Failed to write Verilog for node '%s'.\n", post_node->id().c_str());
      return false;
    }
    fprintf(fp, "%s", node_verilog.c_str());
    return true;
  }

  std::string Backend::declareWire(unsigned int width, std::string id_to_write, std::string indent) {
    std::string wire_verilog = indent + "wire " + formBus((int)(width)) + " " + id_to_write + ";\n";
    return wire_verilog;
  }

  bool Backend::writeWireVerilog(firDB::firItemWire* post_wire, FILE* fp, firDB::firModule* module, std::string indent) {
    fs_assert(post_wire != NULL);
    std::string id = post_wire->id();
    firDB::firType* type_data = post_wire->type_data();
    if (type_data == NULL) {
      fs_error("*ERROR*: The type of data for wire '%s' was unspecified.\n", id.c_str());
      return false;
    }
    int width = getPostTypeWidth(type_data);
    if (width < 1) {
      fs_error("*ERROR*: The data width (%u) for wire '%s' was less than 1.\n", width, id.c_str());
      return false;
    }
    std::string id_to_write = getWriteID(module, id);
    std::string wire_verilog = declareWire(width, id_to_write, indent);
    fprintf(fp, "%s", wire_verilog.c_str());
    return true;
  }

  bool Backend::identifySyncReadPin(firDB::firExp* left_exp, std::string pin_component, firDB::firModule* module) {
    bool is_sync_read_pin = false;
    firDB::firItem* item = module->findItemByExpression(left_exp);
    if (item == NULL) {
      std::string msg = "Could not find item '" + left_exp->toString() + "' in module '" + module->id() + "'.";
      throw firrtlsyn::Exception(msg);
    }
    if (item->isMemoryItem()) {
      firDB::firItemMemory* item_mem = dynamic_cast<firDB::firItemMemory*>(item);
      if (item_mem->read_latency() > 0) {
        if (left_exp->isSubfieldExpression()) {
          firDB::firExpSubfield* mem_exp = dynamic_cast<firDB::firExpSubfield*>(left_exp);
          std::string mem_exp_id = mem_exp->id();
          firDB::firExp* mem_exp_exp = mem_exp->exp();
          if (!mem_exp_exp->isSubfieldExpression()) {
            std::string msg = "The expression for MPort '" + mem_exp_exp->toString() + "' was invalid.";
            throw firrtlsyn::Exception(msg);
          }
          std::string mport_id = dynamic_cast<firDB::firExpSubfield*>(mem_exp_exp)->id();
          if (!item_mem->hasPort(mport_id)) {
            std::string msg = "Could not find an MPort named '" + mport_id + "' in memory '" + item_mem->id() + "'.";
            throw firrtlsyn::Exception(msg);
          } else {
            // need to consider readwrite type
            if (item_mem->findPortDirById(mport_id) == firDB::kMPortDirRead) {
              if (mem_exp_id == pin_component) {
                is_sync_read_pin = true;
              }
            }
          }
        } else {
          std::string msg = "The expression for MPort pin '" + left_exp->toString() + "' was invalid.";
          throw firrtlsyn::Exception(msg);
        }
      }
    }
    return is_sync_read_pin;
  }
  bool Backend::writeConnectVerilog(firDB::firItemConnect* post_connect, FILE* fp, firDB::firModule* module, std::string indent) {
    fs_assert(post_connect != NULL);
    std::string connect_verilog = "";
    firDB::firExp* left_exp = post_connect->connect_l();
    firDB::firExp* right_exp = post_connect->connect_r();
    OutputInfo output_y;
    output_y.id_to_write = turnIdExpToWriteFormat(left_exp, module);
    firDB::firType* type_data = left_exp->getTypeData(module);
    output_y.width = (unsigned int)getPostTypeWidth(type_data);
    output_y.is_signed = getPostTypeSign(type_data);
    connect_verilog += mapCell(output_y, module, right_exp, indent);
    if (connect_verilog == "") {
      fs_error("*ERROR*: Failed to write Verilog for connect '%s'.\n", post_connect->toString().c_str());
      return false;
    }
    fprintf(fp, "%s", connect_verilog.c_str());
    return true;
  }

  bool Backend::writeRegisterVerilog(firDB::firItemRegister* post_register, FILE* fp, firDB::firModule* module, std::string indent) {
    fs_assert(post_register != NULL);
    RegisterInfo reg_info;
    if (!getRegisterInfo(post_register, module, reg_info)) {
      fs_error("*ERROR*: Failed to get the information of register '%s'.\n", post_register->id().c_str());
      return "";
    }
    std::string register_verilog = "";
    if (reg_info.has_reg_reset) {
      if (reg_info.is_sync_reset) {
        register_verilog += writeDffVerilog(reg_info, indent);
      } else {
        register_verilog += writeDffAsyncRstVerilog(reg_info, indent);
      }
    } else {
      register_verilog += writeDffVerilog(reg_info, indent);
    }
    fprintf(fp, "%s", register_verilog.c_str());
    return true;
  }

  bool Backend::writeInstanceVerilog(firDB::firItemInstance* post_instance, FILE* fp, firDB::firModule* module, firDB::firCircuit* post_circuit, std::vector<firDB::firItemAttach*>& attach_statements, std::string indent) {
    fs_assert(post_instance != NULL);
    std::string instance_verilog = "";
    std::string inst_id = post_instance->inst_id();
    std::string module_id = post_instance->module_id();
    firDB::firModule* used_module = post_circuit->findModuleById(module_id);
    if (used_module == NULL) {
      fs_error("*ERROR*: Could not find the corresponding module '%s' for the instance '%s'.\n", module_id.c_str(), inst_id.c_str());
      return false;
    }

    std::vector<std::tuple<std::string, int, std::string, bool> > port_width_pin_list;
    std::string inst_id_to_write = getWriteID(module, inst_id);
    std::string module_id_to_write = getWriteID(module, module_id);
    std::string parameters = "";
    if (used_module->isExtModule()) {
      if (used_module->defname() != NULL) {
        if (used_module->defname()->value() != "") {
          module_id_to_write = getWriteID(module, used_module->defname()->value());
          if (used_module->parameters().size() > 0) {
            parameters += "#(";
            size_t pcnt = 0;
            for (size_t p = 0; p < used_module->parameters().size(); p++) {
              pcnt++;
              std::string param_id = used_module->parameters()[p]->id();
              std::string param_value = used_module->parameters()[p]->value();
              if (param_value.size() > 2) {
                if (param_value[0] == '\'' && param_value[param_value.size() - 1] == '\'') {
                  std::string temp_value = param_value;
                  temp_value.replace(0, 1, "");
                  temp_value.replace(temp_value.size() - 1, 1, "");
                  param_value = temp_value;
                }
              }
              parameters += "." + param_id + "(" + param_value + ")";
              if (pcnt != used_module->parameters().size()) {
                parameters += ", ";
              }
            }
            parameters += ")";
          }
        }
      }
    }
    for (size_t i = 0; i < used_module->ports().size(); i++) {
      firDB::firItemPort* port = used_module->ports()[i];
      std::string port_id_to_write = getWriteID(module, port->id());
      int width = getPostTypeWidth(port->type_data());
      std::string pin_id = (inst_id + "." + port->id());
      std::string pin_id_to_write = "";
      std::tuple<std::string, int, std::string, bool> port_width_pin_existed;
      if (port->type_data()->isAnalogType()) {
        // do not create a new wire, but use the attached wire or port defined in original module
        bool found = false;
        for (std::vector<firDB::firItemAttach*>::iterator it = attach_statements.begin(); it != attach_statements.end(); it++) {
          bool succeeded = false;
          for (std::vector<firDB::firExp*>::iterator it2 = (*it)->nets().begin(); it2 != (*it)->nets().end(); it2++) {
            if ((*it2)->toString() == pin_id) {
              if (found == true) {
                fs_error("*ERROR*: The pin '%s' was attached more than once.\n", pin_id.c_str());
                return false;
              }
              found = true;
              for (std::vector<firDB::firExp*>::iterator it3 = (*it)->nets().begin(); it3 != (*it)->nets().end(); it3++) {
                if ((*it3)->isReferenceExpression()) {
                  std::string tmp_id = dynamic_cast<firDB::firExpRef*>(*it3)->id();
                  firDB::firItem* tmp_item = module->findItemById(tmp_id);
                  if (tmp_item == NULL) {
                    continue;
                  }
                  if (tmp_item->isPortItem() || tmp_item->isWireItem()) {
                    pin_id_to_write = getWriteID(module, tmp_id);
                    succeeded = true;
                    break;
                  }
                }
              }
              break;
            }
          }
          if (succeeded) {
            break;
          }
        }
        if (pin_id_to_write == "") {
          fs_warning("*WARNING*: Did not find the item attaching to analog pin '%s'.\n", pin_id.c_str());
          pin_id_to_write = getInstancePinId(inst_id_to_write, port_id_to_write);
          port_width_pin_existed = std::make_tuple(port_id_to_write, width, pin_id_to_write, false);
        } else {
          port_width_pin_existed = std::make_tuple(port_id_to_write, width, pin_id_to_write, true);
        }
      } else {
        pin_id_to_write = getInstancePinId(inst_id_to_write, port_id_to_write);
        port_width_pin_existed = std::make_tuple(port_id_to_write, width, pin_id_to_write, false);
      }
      port_width_pin_list.push_back(port_width_pin_existed);
    }
    for (std::vector<std::tuple<std::string, int, std::string, bool> >::iterator it = port_width_pin_list.begin(); it != port_width_pin_list.end(); it++) {
      if (std::get<3>(*it) == false) {
        instance_verilog += declareWire(std::get<1>(*it), std::get<2>(*it), indent);
      }
    }
    if (parameters == "") {
      instance_verilog += indent + module_id_to_write + " " + inst_id_to_write + " (\n";
    } else {
      instance_verilog += indent + module_id_to_write + " " + parameters + " " + inst_id_to_write + " (\n";
    }
    size_t cnt = 0;
    for (std::vector<std::tuple<std::string, int, std::string, bool> >::iterator it = port_width_pin_list.begin(); it != port_width_pin_list.end(); it++) {
      cnt++;
      if (cnt != port_width_pin_list.size()) {
        instance_verilog += indent + indent + "." + std::get<0>(*it) + "(" + std::get<2>(*it) + "),\n";
      } else {
        instance_verilog += indent + indent + "." + std::get<0>(*it) + "(" + std::get<2>(*it) + ")\n";
      }
    }
    instance_verilog += indent + ");\n";
 
    fprintf(fp, "%s", instance_verilog.c_str());
    return true;
  }

  std::vector<firDB::firItemAttach*> Backend::collectAttachStatements(firDB::firModule* module) {
    std::vector<firDB::firItemAttach*> attach_statements;
    for (size_t i = 0; i < module->statements().size(); i++) {
      firDB::firItem* stmt = module->statements()[i];
      if (stmt->isAttachItem()) {
        firDB::firItemAttach* attach_stmt = dynamic_cast<firDB::firItemAttach*>(stmt);
        attach_statements.push_back(attach_stmt);
      }
    }
    return attach_statements;
  }

  bool Backend::getMemoryInfo(firDB::firItemMemory* post_memory, firDB::firModule* module, MemoryInfo & mem_info) {
    fs_assert(post_memory != NULL);
    std::string mem_id = post_memory->id();
    mem_info.mem_id_to_write = getWriteID(module, mem_id);
    mem_info.depth = post_memory->depth();
    if (mem_info.depth == 0) {
      fs_error("*ERROR*: The depth (%u) was invalid for memory '%s' to write Verilog.\n", mem_info.depth, mem_id.c_str());
      fs_assert(0);
      return false;
    } else if (mem_info.depth == 1) {
      mem_info.expect_addrbits = 1;
    } else {
      unsigned int expect_addrbits = (unsigned int)std::log2(mem_info.depth);
      if ((unsigned int)std::pow(2, expect_addrbits) < mem_info.depth) {
        fs_warning("*WARNING*: The depth of memory '%s' was not an integer power of 2. One more bit would be added to the result of 'log2(depth)'.\n", mem_id.c_str());
        expect_addrbits += 1;
        fs_warning("*WARNING*: The expected number of address bits for memory '%s' (depth %u) was set to %u.\n", mem_id.c_str(), mem_info.depth, expect_addrbits);
      }
      mem_info.expect_addrbits = expect_addrbits;
    }
    mem_info.is_signed = getPostTypeSign(post_memory->type_data());
    mem_info.width = (unsigned int)getPostTypeWidth(post_memory->type_data());
    unsigned int read_latency = post_memory->read_latency();
    unsigned int write_latency = post_memory->write_latency();
    if (read_latency != 0 && read_latency != 1) {
      fs_warning("*WARNING*: The read latency (%u) of memory '%s' was not 0 or 1. By default, 0 is for 'cmem' and 1 for 'smem'.\n", read_latency, mem_id.c_str());
    }
    if (write_latency != 1) {
      fs_warning("*WARNING*: The write latency (%u) of memory '%s' was not 1. By default, the write latency of a memory is 1.\n", write_latency, mem_id.c_str());
    }
    mem_info.is_smem = read_latency > 0;

    std::vector<std::pair<std::string, firDB::MPortDir>>& post_memport_ports = post_memory->ports();
    for (size_t pmp = 0; pmp < post_memport_ports.size(); pmp++) {
      std::pair<std::string, firDB::MPortDir>& post_memport_port = post_memport_ports[pmp];
      if (post_memport_port.second == firDB::kMPortDirRead) {
        mem_info.readers_id_to_write.push_back(getWriteID(module, post_memport_port.first));
      } else if (post_memport_port.second == firDB::kMPortDirWrite) {
        mem_info.writers_id_to_write.push_back(getWriteID(module, post_memport_port.first));
      } else if (post_memport_port.second == firDB::kMPortDirRdwr) {
        mem_info.readwriters_id_to_write.push_back(getWriteID(module, post_memport_port.first));
      } else if (post_memport_port.second == firDB::kMPortDirInfer) {
        fs_error("*ERROR*: The type of MPort '%s' was 'infer'. The type should have been inferred to be 'read', 'write', or 'readwrite' before writing Verilog.\n", post_memport_port.first.c_str());
        fs_assert(0);
        return false;
      } else if (post_memport_port.second == firDB::kMPortDirUndef) {
        fs_error("*ERROR*: The type of MPort '%s' was undefined. The valid type should be 'read', 'write', or 'readwrite' before writing Verilog.\n", post_memport_port.first.c_str());
        fs_assert(0);
        return false;
      } else {
        fs_error("*ERROR*: The type of MPort '%s' was unknown to write Verilog.\n", post_memport_port.first.c_str());
        fs_assert(0);
        return false;
      }
    }
    if (mem_info.readers_id_to_write.size() + mem_info.readwriters_id_to_write.size() == 0) {
      fs_warning("*WARNING*: There is no 'read' type or 'readwrite' type MPort in memory '%s'.\n", mem_id.c_str());
    }
    if (mem_info.readers_id_to_write.size() + mem_info.writers_id_to_write.size() + mem_info.readwriters_id_to_write.size() == 0) {
      fs_warning("*WARNING*: There is no MPort in memory '%s', none of type 'read', 'write', or 'readwrite'.\n", mem_id.c_str());
    }
    return true;
  }

  void Backend::getReaderPinNames(const std::string & mem_id_to_write, const std::string & read_mport_id_to_write, ReaderPins & reader_pins) {
    reader_pins.read_data = mem_id_to_write + "_" + read_mport_id_to_write + "_data";
    reader_pins.read_clk = mem_id_to_write + "_" + read_mport_id_to_write + "_clk";
    reader_pins.read_en = mem_id_to_write + "_" + read_mport_id_to_write + "_en";
    reader_pins.read_addr = mem_id_to_write + "_" + read_mport_id_to_write + "_addr";
    return;
  }

  void Backend::getWriterPinNames(const std::string & mem_id_to_write, const std::string & write_mport_id_to_write, WriterPins & writer_pins) {
    writer_pins.write_clk = mem_id_to_write + "_" + write_mport_id_to_write + "_clk";
    writer_pins.write_en = mem_id_to_write + "_" + write_mport_id_to_write + "_en";
    writer_pins.write_mask = mem_id_to_write + "_" + write_mport_id_to_write + "_mask";
    writer_pins.write_addr = mem_id_to_write + "_" + write_mport_id_to_write + "_addr";
    writer_pins.write_data = mem_id_to_write + "_" + write_mport_id_to_write + "_data";
    return;
  }

  void Backend::getReadwriterPinNames(const std::string & mem_id_to_write, const std::string & readwrite_mport_id_to_write, ReadwriterPins & readwriter_pins) {
    readwriter_pins.readwrite_rdata = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_rdata";
    readwriter_pins.readwrite_wmode = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_wmode";
    readwriter_pins.readwrite_clk = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_clk";
    readwriter_pins.readwrite_en = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_en";
    readwriter_pins.readwrite_wmask = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_wmask";
    readwriter_pins.readwrite_addr = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_addr";
    readwriter_pins.readwrite_wdata = mem_id_to_write + "_" + readwrite_mport_id_to_write + "_wdata";
    return;
  }



  std::string Backend::declareReaderPinsInVerilog(const MemoryInfo & mem_info, const ReaderPins & reader_pins, std::string indent) {
    std::string verilog = "";
    verilog += declareWire(mem_info.width, reader_pins.read_data, indent);
    verilog += declareWire(1, reader_pins.read_clk, indent);
    verilog += declareWire(1, reader_pins.read_en, indent);
    verilog += declareWire(mem_info.expect_addrbits, reader_pins.read_addr, indent);
    return verilog;
  }

  std::string Backend::declareWriterPinsInVerilog(const MemoryInfo & mem_info, const WriterPins & writer_pins, std::string indent) {
    std::string verilog = "";
    verilog += declareWire(1, writer_pins.write_clk, indent);
    verilog += declareWire(1, writer_pins.write_en, indent);
    verilog += declareWire(1, writer_pins.write_mask, indent);
    verilog += declareWire(mem_info.expect_addrbits, writer_pins.write_addr, indent);
    verilog += declareWire(mem_info.width, writer_pins.write_data, indent);
    return verilog;
  }

  std::string Backend::declareReadwriterPinsInVerilog(const MemoryInfo & mem_info, const ReadwriterPins & readwriter_pins, std::string indent) {
    std::string verilog = "";
    verilog += declareWire(mem_info.width, readwriter_pins.readwrite_rdata, indent);
    verilog += declareWire(1, readwriter_pins.readwrite_wmode, indent);
    verilog += declareWire(1, readwriter_pins.readwrite_clk, indent);
    verilog += declareWire(1, readwriter_pins.readwrite_en, indent);
    verilog += declareWire(1, readwriter_pins.readwrite_wmask, indent);
    verilog += declareWire(mem_info.expect_addrbits, readwriter_pins.readwrite_addr, indent);
    verilog += declareWire(mem_info.width, readwriter_pins.readwrite_wdata, indent);
    return verilog;
  }

  std::string Backend::decoupleReadwriter(const ReadwriterPins & readwriter_pins, ReaderPins & reader_pins, WriterPins & writer_pins, std::string indent) {
    std::string verilog = "";
    reader_pins.read_data = readwriter_pins.readwrite_rdata;
    reader_pins.read_clk = readwriter_pins.readwrite_clk;
    // use an inverter to reverse the 'wmode' to get the read-enable signal 
    OpInputInfo wmode_inverter_input_info;
    wmode_inverter_input_info.id_to_write = readwriter_pins.readwrite_wmode;
    wmode_inverter_input_info.is_signed = false;
    wmode_inverter_input_info.width = 1;
    OutputInfo wmode_inverter_output_info;
    wmode_inverter_output_info.id_to_write = getTempWireId();
    wmode_inverter_output_info.is_signed = false;
    wmode_inverter_output_info.width = wmode_inverter_input_info.width;
    verilog += declareWire(wmode_inverter_output_info.width, wmode_inverter_output_info.id_to_write, indent);
    verilog += writeOpBitwiseNotVerilog(wmode_inverter_output_info, wmode_inverter_input_info, indent);
    reader_pins.read_en = wmode_inverter_output_info.id_to_write;
    reader_pins.read_addr = readwriter_pins.readwrite_addr;
    writer_pins.write_clk = readwriter_pins.readwrite_clk;
    writer_pins.write_en = readwriter_pins.readwrite_wmode;
    writer_pins.write_mask = readwriter_pins.readwrite_wmask;
    writer_pins.write_addr = readwriter_pins.readwrite_addr;
    writer_pins.write_data = readwriter_pins.readwrite_wdata;
    return verilog;
  }

  void Backend::formMRROMCombinedPins(const MemoryInfo & mem_info, MRROMMemPins & mr_rom_mem_pins) {
    mr_rom_mem_pins.read_datas.pin_name = mem_info.mem_id_to_write + "_read_datas";
    mr_rom_mem_pins.read_datas.is_mem_input = false;
    mr_rom_mem_pins.read_datas.width = mem_info.width * (unsigned int)mr_rom_mem_pins.readers.size();
    mr_rom_mem_pins.read_clks.pin_name = mem_info.mem_id_to_write + "_read_clks";
    mr_rom_mem_pins.read_clks.is_mem_input = true;
    mr_rom_mem_pins.read_clks.width = 1 * (unsigned int)mr_rom_mem_pins.readers.size();
    mr_rom_mem_pins.read_ens.pin_name = mem_info.mem_id_to_write + "_read_ens";
    mr_rom_mem_pins.read_ens.is_mem_input = true;
    mr_rom_mem_pins.read_ens.width = 1 * (unsigned int)mr_rom_mem_pins.readers.size();
    mr_rom_mem_pins.read_addrs.pin_name = mem_info.mem_id_to_write + "_read_addrs";
    mr_rom_mem_pins.read_addrs.is_mem_input = true;
    mr_rom_mem_pins.read_addrs.width = mem_info.expect_addrbits * (unsigned int)mr_rom_mem_pins.readers.size();
    return;
  }

  void Backend::formMRMWCombinedPins(const MemoryInfo & mem_info, MRMWMemPins & mrmw_mem_pins) {
    mrmw_mem_pins.read_datas.pin_name = mem_info.mem_id_to_write + "_read_datas";
    mrmw_mem_pins.read_datas.is_mem_input = false;
    mrmw_mem_pins.read_datas.width = mem_info.width * (unsigned int)mrmw_mem_pins.readers.size();
    mrmw_mem_pins.read_clks.pin_name = mem_info.mem_id_to_write + "_read_clks";
    mrmw_mem_pins.read_clks.is_mem_input = true;
    mrmw_mem_pins.read_clks.width = 1 * (unsigned int)mrmw_mem_pins.readers.size();
    mrmw_mem_pins.read_ens.pin_name = mem_info.mem_id_to_write + "_read_ens";
    mrmw_mem_pins.read_ens.is_mem_input = true;
    mrmw_mem_pins.read_ens.width = 1 * (unsigned int)mrmw_mem_pins.readers.size();
    mrmw_mem_pins.read_addrs.pin_name = mem_info.mem_id_to_write + "_read_addrs";
    mrmw_mem_pins.read_addrs.is_mem_input = true;
    mrmw_mem_pins.read_addrs.width = mem_info.expect_addrbits * (unsigned int)mrmw_mem_pins.readers.size();

    mrmw_mem_pins.write_clks.pin_name = mem_info.mem_id_to_write + "_write_clks";
    mrmw_mem_pins.write_clks.is_mem_input = true;
    mrmw_mem_pins.write_clks.width = 1 * (unsigned int)mrmw_mem_pins.writers.size();
    mrmw_mem_pins.write_ens.pin_name = mem_info.mem_id_to_write + "_write_ens";
    mrmw_mem_pins.write_ens.is_mem_input = true;
    mrmw_mem_pins.write_ens.width = 1 * (unsigned int)mrmw_mem_pins.writers.size();
    mrmw_mem_pins.write_masks.pin_name = mem_info.mem_id_to_write + "_write_masks";
    mrmw_mem_pins.write_masks.is_mem_input = true;
    mrmw_mem_pins.write_masks.width = 1 * (unsigned int)mrmw_mem_pins.writers.size();
    mrmw_mem_pins.write_addrs.pin_name = mem_info.mem_id_to_write + "_write_addrs";
    mrmw_mem_pins.write_addrs.is_mem_input = true;
    mrmw_mem_pins.write_addrs.width = mem_info.expect_addrbits * (unsigned int)mrmw_mem_pins.writers.size();
    mrmw_mem_pins.write_datas.pin_name = mem_info.mem_id_to_write + "_write_datas";
    mrmw_mem_pins.write_datas.is_mem_input = true;
    mrmw_mem_pins.write_datas.width = mem_info.width * (unsigned int)mrmw_mem_pins.writers.size();
    return;
  }

  std::string Backend::declareMRROMCombinedPinsInVerilog(const MRROMMemPins & mr_rom_mem_pins, std::string indent) {
    std::string verilog = "";
    verilog += declareWire(mr_rom_mem_pins.read_datas.width, mr_rom_mem_pins.read_datas.pin_name, indent);
    verilog += declareWire(mr_rom_mem_pins.read_clks.width, mr_rom_mem_pins.read_clks.pin_name, indent);
    verilog += declareWire(mr_rom_mem_pins.read_ens.width, mr_rom_mem_pins.read_ens.pin_name, indent);
    verilog += declareWire(mr_rom_mem_pins.read_addrs.width, mr_rom_mem_pins.read_addrs.pin_name, indent);
    return verilog;
  }

  std::string Backend::declareMRMWCombinedPinsInVerilog(const MRMWMemPins & mrmw_mem_pins, std::string indent) {
    std::string verilog = "";
    verilog += declareWire(mrmw_mem_pins.read_datas.width, mrmw_mem_pins.read_datas.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.read_clks.width, mrmw_mem_pins.read_clks.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.read_ens.width, mrmw_mem_pins.read_ens.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.read_addrs.width, mrmw_mem_pins.read_addrs.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.write_clks.width, mrmw_mem_pins.write_clks.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.write_ens.width, mrmw_mem_pins.write_ens.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.write_masks.width, mrmw_mem_pins.write_masks.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.write_addrs.width, mrmw_mem_pins.write_addrs.pin_name, indent);
    verilog += declareWire(mrmw_mem_pins.write_datas.width, mrmw_mem_pins.write_datas.pin_name, indent);
    return verilog;
  }

  std::string Backend::assignMRROMCombinedPinsInVerilog(const MemoryInfo & mem_info, const MRROMMemPins & mr_rom_mem_pins, std::string indent) {
    std::string verilog = "";
    std::string combined_read_clks = "}";
    std::string combined_read_ens = "}";
    std::string combined_read_addrs = "}";
    //read_datas is output, the others are inputs
    for (size_t i = 0; i < mr_rom_mem_pins.readers.size(); i++) {
      std::string read_datas_seg = mr_rom_mem_pins.read_datas.pin_name + "[" + std::to_string(mem_info.width * (i + 1) - 1) + ":" + std::to_string(mem_info.width * i) + "]";
      verilog += writeAssignVerilog(mr_rom_mem_pins.readers[i].read_data, read_datas_seg, indent);
      combined_read_clks = (("{" + mr_rom_mem_pins.readers[i].read_clk + "}") + combined_read_clks);
      combined_read_clks = (((i + 1 != mr_rom_mem_pins.readers.size()) ? "," : "{") + combined_read_clks);
      combined_read_ens = (("{" + mr_rom_mem_pins.readers[i].read_en + "}") + combined_read_ens);
      combined_read_ens = (((i + 1 != mr_rom_mem_pins.readers.size()) ? "," : "{") + combined_read_ens);
      combined_read_addrs = (("{" + mr_rom_mem_pins.readers[i].read_addr + "}") + combined_read_addrs);
      combined_read_addrs = (((i + 1 != mr_rom_mem_pins.readers.size()) ? "," : "{") + combined_read_addrs);
    }
    verilog += writeAssignVerilog(mr_rom_mem_pins.read_clks.pin_name, combined_read_clks, indent);
    verilog += writeAssignVerilog(mr_rom_mem_pins.read_ens.pin_name, combined_read_ens, indent);
    verilog += writeAssignVerilog(mr_rom_mem_pins.read_addrs.pin_name, combined_read_addrs, indent);
    return verilog;
  }

  std::string Backend::assignMRMWCombinedPinsInVerilog(const MemoryInfo & mem_info, const MRMWMemPins & mrmw_mem_pins, std::string indent) {
    std::string verilog = "";
    std::string combined_read_clks = "}";
    std::string combined_read_ens = "}";
    std::string combined_read_addrs = "}";
    //read_datas is output, the others are inputs
    for (size_t i = 0; i < mrmw_mem_pins.readers.size(); i++) {
      std::string read_datas_seg = mrmw_mem_pins.read_datas.pin_name + "[" + std::to_string(mem_info.width * (i + 1) - 1) + ":" + std::to_string(mem_info.width * i) + "]";
      verilog += writeAssignVerilog(mrmw_mem_pins.readers[i].read_data, read_datas_seg, indent);
      combined_read_clks = (("{" + mrmw_mem_pins.readers[i].read_clk + "}") + combined_read_clks);
      combined_read_clks = (((i + 1 != mrmw_mem_pins.readers.size()) ? "," : "{") + combined_read_clks);
      combined_read_ens = (("{" + mrmw_mem_pins.readers[i].read_en + "}") + combined_read_ens);
      combined_read_ens = (((i + 1 != mrmw_mem_pins.readers.size()) ? "," : "{") + combined_read_ens);
      combined_read_addrs = (("{" + mrmw_mem_pins.readers[i].read_addr + "}") + combined_read_addrs);
      combined_read_addrs = (((i + 1 != mrmw_mem_pins.readers.size()) ? "," : "{") + combined_read_addrs);
    }
    verilog += writeAssignVerilog(mrmw_mem_pins.read_clks.pin_name, combined_read_clks, indent);
    verilog += writeAssignVerilog(mrmw_mem_pins.read_ens.pin_name, combined_read_ens, indent);
    verilog += writeAssignVerilog(mrmw_mem_pins.read_addrs.pin_name, combined_read_addrs, indent);

    std::string combined_write_clks = "}";
    std::string combined_write_ens = "}";
    std::string combined_write_masks = "}";
    std::string combined_write_addrs = "}";
    std::string combined_write_datas = "}";
    for (size_t i = 0; i < mrmw_mem_pins.writers.size(); i++) {
      combined_write_clks = (("{" + mrmw_mem_pins.writers[i].write_clk + "}") + combined_write_clks);
      combined_write_clks = (((i + 1 != mrmw_mem_pins.writers.size()) ? "," : "{") + combined_write_clks);
      combined_write_ens = (("{" + mrmw_mem_pins.writers[i].write_en + "}") + combined_write_ens);
      combined_write_ens = (((i + 1 != mrmw_mem_pins.writers.size()) ? "," : "{") + combined_write_ens);
      combined_write_masks = (("{" + mrmw_mem_pins.writers[i].write_mask + "}") + combined_write_masks);
      combined_write_masks = (((i + 1 != mrmw_mem_pins.writers.size()) ? "," : "{") + combined_write_masks);
      combined_write_addrs = (("{" + mrmw_mem_pins.writers[i].write_addr + "}") + combined_write_addrs);
      combined_write_addrs = (((i + 1 != mrmw_mem_pins.writers.size()) ? "," : "{") + combined_write_addrs);
      combined_write_datas = (("{" + mrmw_mem_pins.writers[i].write_data + "}") + combined_write_datas);
      combined_write_datas = (((i + 1 != mrmw_mem_pins.writers.size()) ? "," : "{") + combined_write_datas);
    }
    verilog += writeAssignVerilog(mrmw_mem_pins.write_clks.pin_name, combined_write_clks, indent);
    verilog += writeAssignVerilog(mrmw_mem_pins.write_ens.pin_name, combined_write_ens, indent);
    verilog += writeAssignVerilog(mrmw_mem_pins.write_masks.pin_name, combined_write_masks, indent);
    verilog += writeAssignVerilog(mrmw_mem_pins.write_addrs.pin_name, combined_write_addrs, indent);
    verilog += writeAssignVerilog(mrmw_mem_pins.write_datas.pin_name, combined_write_datas, indent);

    return verilog;
  }

  std::string Backend::writeROMVerilog(const MemoryInfo & mem_info, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "ROMMEM";
    if (mem_info.readers_id_to_write.size() != 1 || mem_info.writers_id_to_write.size() != 0 || mem_info.readwriters_id_to_write.size() != 0) {
      fs_error("*ERROR*: Failed to write Verilog with cell '%s' because the read MPort number (%zu) was not 1, the write MPort number (%zu) was not 0, or the readwrite MPort number (%zu) was not 0.\n",
        cell_name.c_str(), mem_info.readers_id_to_write.size(), mem_info.writers_id_to_write.size(), mem_info.readwriters_id_to_write.size());
      return "";
    }
    std::string read_mport = mem_info.readers_id_to_write[0];
    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return "";
    }
    std::vector<std::string> ports = it->second;
    if ((unsigned int)ports.size() != 4) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), 4);
      fs_assert(0);
      return "";
    }

    ReaderPins reader_pins;
    getReaderPinNames(mem_info.mem_id_to_write, read_mport, reader_pins);
    verilog += declareReaderPinsInVerilog(mem_info, reader_pins, indent);

    std::string isSyncRead = mem_info.is_smem ? "1" : "0";
    verilog += indent + cell_name + " #(" + std::to_string(mem_info.depth) + ", " + std::to_string(mem_info.expect_addrbits) + ", " + std::to_string(mem_info.width) + ", " + isSyncRead + ") " + mem_info.mem_id_to_write + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + reader_pins.read_data + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + reader_pins.read_clk + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + reader_pins.read_en + "),\n";
    verilog += indent + indent + "." + ports[3] + "(" + reader_pins.read_addr + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  std::string Backend::writeMultiReaderROMVerilog(const MemoryInfo & mem_info, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "MRROMMEM";
    if (mem_info.readers_id_to_write.size() < 2 || mem_info.writers_id_to_write.size() != 0 || mem_info.readwriters_id_to_write.size() != 0) {
      fs_error("*ERROR*: Failed to write Verilog with cell '%s' because the read MPort number (%zu) was less than 2, the write MPort number (%zu) was not 0, or the readwrite MPort number (%zu) was not 0.\n",
        cell_name.c_str(), mem_info.readers_id_to_write.size(), mem_info.writers_id_to_write.size(), mem_info.readwriters_id_to_write.size());
      return "";
    }

    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return "";
    }
    std::vector<std::string> ports = it->second;
    if ((unsigned int)ports.size() != 4) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), 4);
      fs_assert(0);
      return "";
    }

    MRROMMemPins mr_rom_mem_pins;
    for (size_t i = 0; i < mem_info.readers_id_to_write.size(); i++) {
      std::string read_mport = mem_info.readers_id_to_write[i];
      ReaderPins reader_pins;
      getReaderPinNames(mem_info.mem_id_to_write, read_mport, reader_pins);
      verilog += declareReaderPinsInVerilog(mem_info, reader_pins, indent);
      mr_rom_mem_pins.readers.push_back(reader_pins);
    }

    formMRROMCombinedPins(mem_info, mr_rom_mem_pins);
    verilog += declareMRROMCombinedPinsInVerilog(mr_rom_mem_pins, indent);
    verilog += assignMRROMCombinedPinsInVerilog(mem_info, mr_rom_mem_pins, indent);

    std::string isSyncRead = mem_info.is_smem ? "1" : "0";
    verilog += indent + cell_name + " #(" + std::to_string(mem_info.depth) + ", " + std::to_string(mem_info.expect_addrbits) + ", " + std::to_string(mem_info.width) + ", " + 
      std::to_string(mr_rom_mem_pins.readers.size()) + ", " + isSyncRead + ") " + mem_info.mem_id_to_write + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + mr_rom_mem_pins.read_datas.pin_name + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + mr_rom_mem_pins.read_clks.pin_name + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + mr_rom_mem_pins.read_ens.pin_name + "),\n";
    verilog += indent + indent + "." + ports[3] + "(" + mr_rom_mem_pins.read_addrs.pin_name + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  std::string Backend::writeRAMVerilog(const MemoryInfo & mem_info, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "RAMMEM";
    size_t total_read_ports_num = mem_info.readers_id_to_write.size() + mem_info.readwriters_id_to_write.size();
    size_t total_write_ports_num = mem_info.writers_id_to_write.size() + mem_info.readwriters_id_to_write.size();
    if ((total_read_ports_num != 1) || (total_write_ports_num != 1)) {
      fs_error("*ERROR*: Failed to write Verilog with cell '%s' because the read port number (%zu) was not 1 or the write port number (%zu) was not 1.\n",
        cell_name.c_str(), total_read_ports_num, total_write_ports_num);
      return "";
    }
    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return "";
    }
    std::vector<std::string> ports = it->second;
    if ((unsigned int)ports.size() != 9) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), 9);
      fs_assert(0);
      return "";
    }

    RAMMemPins ram_mem_pins;
    if (mem_info.readwriters_id_to_write.size() == 0) {
      if (mem_info.readers_id_to_write.size() != 1) {
        return "";
      }
      std::string read_mport = mem_info.readers_id_to_write[0];
      ReaderPins reader_pins;
      getReaderPinNames(mem_info.mem_id_to_write, read_mport, reader_pins);
      verilog += declareReaderPinsInVerilog(mem_info, reader_pins, indent);
      if (mem_info.writers_id_to_write.size() != 1) {
        return "";
      }
      std::string write_mport = mem_info.writers_id_to_write[0];
      WriterPins writer_pins;
      getWriterPinNames(mem_info.mem_id_to_write, write_mport, writer_pins);
      verilog += declareWriterPinsInVerilog(mem_info, writer_pins, indent);
      ram_mem_pins.reader = reader_pins;
      ram_mem_pins.writer = writer_pins;
    } else {
      if (mem_info.readwriters_id_to_write.size() != 1) {
        return "";
      }
      std::string readwrite_mport = mem_info.readwriters_id_to_write[0];
      ReadwriterPins readwriter_pins;
      getReadwriterPinNames(mem_info.mem_id_to_write, readwrite_mport, readwriter_pins);
      verilog += declareReadwriterPinsInVerilog(mem_info, readwriter_pins, indent);

      ReaderPins reader_pins;
      WriterPins writer_pins;
      verilog += decoupleReadwriter(readwriter_pins, reader_pins, writer_pins, indent);
      ram_mem_pins.reader = reader_pins;
      ram_mem_pins.writer = writer_pins;
    }

    std::string isSyncRead = (mem_info.is_smem) ? "1" : "0";
    verilog += indent + cell_name + " #(" + std::to_string(mem_info.depth) + ", " + std::to_string(mem_info.expect_addrbits) + ", " + std::to_string(mem_info.width) + ", " + isSyncRead + ") " + mem_info.mem_id_to_write + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + ram_mem_pins.reader.read_data + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + ram_mem_pins.reader.read_clk + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + ram_mem_pins.reader.read_en + "),\n";
    verilog += indent + indent + "." + ports[3] + "(" + ram_mem_pins.reader.read_addr + "),\n";
    verilog += indent + indent + "." + ports[4] + "(" + ram_mem_pins.writer.write_clk + "),\n";
    verilog += indent + indent + "." + ports[5] + "(" + ram_mem_pins.writer.write_en + "),\n";
    verilog += indent + indent + "." + ports[6] + "(" + ram_mem_pins.writer.write_mask + "),\n";
    verilog += indent + indent + "." + ports[7] + "(" + ram_mem_pins.writer.write_addr + "),\n";
    verilog += indent + indent + "." + ports[8] + "(" + ram_mem_pins.writer.write_data + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  std::string Backend::writeMultiReaderMultiWriterRAMVerilog(const MemoryInfo & mem_info, std::string indent) {
    std::string verilog = "";
    std::string cell_name = "MRMWMEM";
    size_t total_read_ports_num = mem_info.readers_id_to_write.size() + mem_info.readwriters_id_to_write.size();
    size_t total_write_ports_num = mem_info.writers_id_to_write.size() + mem_info.readwriters_id_to_write.size();
    if (total_read_ports_num < 2 && total_write_ports_num < 2) {
      fs_error("*ERROR*: Failed to write Verilog with cell '%s' because the read port number (%zu) was less than 2 and the write port number (%zu) was less than 2.\n",
        cell_name.c_str(), total_read_ports_num, total_write_ports_num);
      return "";
    }
    std::map<std::string, std::vector<std::string>>::iterator it = dataPathLib.find(cell_name);
    if (it == dataPathLib.end()) {
      fs_error("*ERROR*: Could not find a cell named '%s' in the macro cell library.\n", cell_name.c_str());
      fs_assert(0);
      return "";
    }
    std::vector<std::string> ports = it->second;
    if ((unsigned int)ports.size() != 9) {
      fs_error("*ERROR*: The number of ports in macro cell '%s' was not %u. Correct the macro cell library and rerun.\n", cell_name.c_str(), 9);
      fs_assert(0);
      return "";
    }

    MRMWMemPins mrmw_mem_pins;
    for (size_t i = 0; i < mem_info.readers_id_to_write.size(); i++) {
      std::string read_mport = mem_info.readers_id_to_write[i];
      ReaderPins reader_pins;
      getReaderPinNames(mem_info.mem_id_to_write, read_mport, reader_pins);
      verilog += declareReaderPinsInVerilog(mem_info, reader_pins, indent);
      mrmw_mem_pins.readers.push_back(reader_pins);
    }
    for (size_t i = 0; i < mem_info.writers_id_to_write.size(); i++) {
      std::string write_mport = mem_info.writers_id_to_write[i];
      WriterPins writer_pins;
      getWriterPinNames(mem_info.mem_id_to_write, write_mport, writer_pins);
      verilog += declareWriterPinsInVerilog(mem_info, writer_pins, indent);
      mrmw_mem_pins.writers.push_back(writer_pins);
    }
    for (size_t i = 0; i < mem_info.readwriters_id_to_write.size(); i++) {
      std::string readwrite_mport = mem_info.readwriters_id_to_write[i];
      ReadwriterPins readwriter_pins;
      getReadwriterPinNames(mem_info.mem_id_to_write, readwrite_mport, readwriter_pins);
      verilog += declareReadwriterPinsInVerilog(mem_info, readwriter_pins, indent);

      ReaderPins reader_pins;
      WriterPins writer_pins;
      verilog += decoupleReadwriter(readwriter_pins, reader_pins, writer_pins, indent);
      mrmw_mem_pins.readers.push_back(reader_pins);
      mrmw_mem_pins.writers.push_back(writer_pins);
    }

    formMRMWCombinedPins(mem_info, mrmw_mem_pins);
    verilog += declareMRMWCombinedPinsInVerilog(mrmw_mem_pins, indent);
    verilog += assignMRMWCombinedPinsInVerilog(mem_info, mrmw_mem_pins, indent);

    std::string isSyncRead = mem_info.is_smem ? "1" : "0";
    verilog += indent + cell_name + " #(" + std::to_string(mem_info.depth) + ", " + std::to_string(mem_info.expect_addrbits) + ", " + std::to_string(mem_info.width) + ", " +
      std::to_string(mrmw_mem_pins.readers.size()) + ", " + std::to_string(mrmw_mem_pins.writers.size()) + ", " + isSyncRead + ") " + mem_info.mem_id_to_write + " (\n";
    verilog += indent + indent + "." + ports[0] + "(" + mrmw_mem_pins.read_datas.pin_name + "),\n";
    verilog += indent + indent + "." + ports[1] + "(" + mrmw_mem_pins.read_clks.pin_name + "),\n";
    verilog += indent + indent + "." + ports[2] + "(" + mrmw_mem_pins.read_ens.pin_name + "),\n";
    verilog += indent + indent + "." + ports[3] + "(" + mrmw_mem_pins.read_addrs.pin_name + "),\n";
    verilog += indent + indent + "." + ports[4] + "(" + mrmw_mem_pins.write_clks.pin_name + "),\n";
    verilog += indent + indent + "." + ports[5] + "(" + mrmw_mem_pins.write_ens.pin_name + "),\n";
    verilog += indent + indent + "." + ports[6] + "(" + mrmw_mem_pins.write_masks.pin_name + "),\n";
    verilog += indent + indent + "." + ports[7] + "(" + mrmw_mem_pins.write_addrs.pin_name + "),\n";
    verilog += indent + indent + "." + ports[8] + "(" + mrmw_mem_pins.write_datas.pin_name + ")\n";
    verilog += indent + ");\n";
    return verilog;
  }

  bool Backend::writeMemoryVerilog(firDB::firItemMemory* post_memory, FILE* fp, firDB::firModule* module, std::string indent) {
    fs_assert(post_memory != NULL);
    std::string mem_verilog = "";
    MemoryInfo mem_info;
    if (!getMemoryInfo(post_memory, module, mem_info)) {
      fs_error("*ERROR*: Failed to get the basic information of memory '%s'.\n", post_memory->id().c_str());
      return false;
    }

    if (mem_info.readers_id_to_write.size() + mem_info.readwriters_id_to_write.size() > 0) {
      if (mem_info.writers_id_to_write.size() + mem_info.readwriters_id_to_write.size() == 0) {
        if (mem_info.readers_id_to_write.size() == 1) {
          // (Single Reader) Read-Only-Memory
          mem_verilog += writeROMVerilog(mem_info, indent);
        } else {
          // Multi-Reader-Read-Only-Memory
          mem_verilog += writeMultiReaderROMVerilog(mem_info, indent);
        }
      } else {
        if ((mem_info.readers_id_to_write.size() + mem_info.readwriters_id_to_write.size() == 1) && (mem_info.writers_id_to_write.size() + mem_info.readwriters_id_to_write.size() == 1)) {
          // (Single Reader and Single Writer) Random-Access-Memory
          mem_verilog += writeRAMVerilog(mem_info, indent);
        } else {
          // Multi-Reader-Multi-Writer-Random-Access-Memory
          mem_verilog += writeMultiReaderMultiWriterRAMVerilog(mem_info, indent);
        }
      }
    } else {
      fs_warning("*WARNING*: No Verilog would be written for memory '%s' because it had no 'read' or 'readwrite' MPort.\n", mem_info.mem_id_to_write.c_str());
    }
    fprintf(fp, "%s", mem_verilog.c_str());
    return true;
  }

  bool Backend::writeStatementsVerilog(FILE* fp, firDB::firModule* module, firDB::firCircuit* post_circuit, std::string indent) {
    fs_assert(fp != NULL);
    fs_assert(module != NULL);

    std::map<std::string, std::string> bufferMap;
    netMapping(module, bufferMap);

    std::vector<firDB::firItemAttach*> attach_statements = collectAttachStatements(module);

    // statements
    for (size_t i = 0; i < module->statements().size(); i++) {
      firDB::firItem* stmt = module->statements()[i];
      switch (stmt->type()) {
      case firDB::kItemNode: {
        firDB::firItemNode* post_node = dynamic_cast<firDB::firItemNode*>(stmt);
        if (!writeNodeVerilog(post_node, fp, module, indent)) {
          return false;
        }
        break;
      }
      case firDB::kItemWire: {
        firDB::firItemWire* post_wire = dynamic_cast<firDB::firItemWire*>(stmt);
        if (!writeWireVerilog(post_wire, fp, module, indent)) {
          return false;
        }
        break;
      }
      case firDB::kItemConnect: {
        firDB::firItemConnect* post_connect = dynamic_cast<firDB::firItemConnect*>(stmt);
        if (!writeConnectVerilog(post_connect, fp, module, indent)) {
          return false;
        }
        break;
      }
      case firDB::kItemRegister: {
        firDB::firItemRegister* post_register = dynamic_cast<firDB::firItemRegister*>(stmt);
        if (!writeRegisterVerilog(post_register, fp, module, indent)) {
          return false;
        }
        break;
      }
      case firDB::kItemInstance: {
        firDB::firItemInstance* post_instance = dynamic_cast<firDB::firItemInstance*>(stmt);
        if (!writeInstanceVerilog(post_instance, fp, module, post_circuit, attach_statements, indent)) {
          return false;
        }
        break;
      }
      case firDB::kItemMemory: {
        firDB::firItemMemory* post_memory = dynamic_cast<firDB::firItemMemory*>(stmt);
        if (!writeMemoryVerilog(post_memory, fp, module, indent)) {
          return false;
        }
        break;
      }
      case firDB::kItemAttach: {
        break;
      }
      default: {
        fs_error("*ERROR*: The statement '%s' was invalid for writing Verilog.\n", stmt->toString().c_str());
        return false;
      }
      }

    }
    return true;
  }

  bool Backend::writeEndModule(FILE* fp, firDB::firModule* module) {
    fs_assert(fp != NULL);
    fs_assert(module != NULL);
    std::string verilog = "";
    verilog += "endmodule";
    verilog += " // " + module->id() + "\n";
    fprintf(fp, "%s\n", verilog.c_str());
    return true;
  }

  bool Backend::writeModuleVerilog(FILE* fp, firDB::firModule* module, firDB::firCircuit* post_circuit) {
    fs_assert(fp != NULL);
    fs_assert(module != NULL);
    std::string indent = std::string(VERILOG_INDENT_SPACE_NUM, ' ');

    if (module->isExtModule()) {
      fprintf(fp, "// NOTE_BEGIN ExtModule : %s NOTE_END\n", module->id().c_str());
      return true;
    }

    if (AvoidRedclaredID(module) == false) {
      return false;
    }

    if (!writePortVerilog(fp, module, indent)) {
      fs_error("*ERROR*: Failed to write Verilog for the ports in module '%s'.\n", module->id().c_str());
      return false;
    }

    if (!writeStatementsVerilog(fp, module, post_circuit, indent)) {
      fs_error("*ERROR*: Failed to write Verilog for the statements in module '%s'.\n", module->id().c_str());
      return false;
    }

    writeEndModule(fp, module);
    
    return true;
  }
}
