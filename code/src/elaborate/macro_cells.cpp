//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "elaborate/macro_cells.h"

using namespace firrtlsyn;

namespace verilog {
  MacroCellLib::MacroCellLib(Library* library) {
    lib_ = library;
  }

  MacroCellLib::~MacroCellLib() {

  }

  ExternModule* MacroCellLib::addCellAddUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getAddUnsignedName();
    ExternModule* add_unsigned_module = this->library()->getExternModule(module_name);
    if (add_unsigned_module == NULL) {
      add_unsigned_module = this->library()->addExternModule(module_name);
      add_unsigned_module->addPort(MacroCellLib::getAddUnsignedPortY());
      add_unsigned_module->addPort(MacroCellLib::getAddUnsignedPortA());
      add_unsigned_module->addPort(MacroCellLib::getAddUnsignedPortB());
      IdDef* param_id = add_unsigned_module->addParameter(MacroCellLib::getAddUnsignedParamWidth());
      param_id->setInitialValue(4);
      add_unsigned_module->addContent(indent + "output [width:0] y;");
      add_unsigned_module->addContent(indent + "input [width-1:0] a;");
      add_unsigned_module->addContent(indent + "input [width-1:0] b;");
      add_unsigned_module->addContent(indent + "assign y = a + b;");
    }
    return add_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellAddSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getAddSignedName();
    ExternModule* add_signed_module = this->library()->getExternModule(module_name);
    if (add_signed_module == NULL) {
      add_signed_module = this->library()->addExternModule(module_name);
      add_signed_module->addPort(MacroCellLib::getAddSignedPortY());
      add_signed_module->addPort(MacroCellLib::getAddSignedPortA());
      add_signed_module->addPort(MacroCellLib::getAddSignedPortB());
      IdDef* param_id = add_signed_module->addParameter(MacroCellLib::getAddSignedParamWidth());
      param_id->setInitialValue(4);
      add_signed_module->addContent(indent + "output [width:0] y;");
      add_signed_module->addContent(indent + "input [width-1:0] a;");
      add_signed_module->addContent(indent + "input [width-1:0] b;");
      add_signed_module->addContent(indent + "assign y = $signed(a) + $signed(b);");
    }
    return add_signed_module;
  }
  ExternModule* MacroCellLib::addCellSubUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getSubUnsignedName();
    ExternModule* sub_unsigned_module = this->library()->getExternModule(module_name);
    if (sub_unsigned_module == NULL) {
      sub_unsigned_module = this->library()->addExternModule(module_name);
      sub_unsigned_module->addPort(MacroCellLib::getSubUnsignedPortY());
      sub_unsigned_module->addPort(MacroCellLib::getSubUnsignedPortA());
      sub_unsigned_module->addPort(MacroCellLib::getSubUnsignedPortB());
      IdDef* param_id = sub_unsigned_module->addParameter(MacroCellLib::getSubUnsignedParamWidth());
      param_id->setInitialValue(4);
      sub_unsigned_module->addContent(indent + "output [width:0] y;");
      sub_unsigned_module->addContent(indent + "input [width-1:0] a;");
      sub_unsigned_module->addContent(indent + "input [width-1:0] b;");
      sub_unsigned_module->addContent(indent + "assign y = a - b;");
    }
    return sub_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellSubSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getSubSignedName();
    ExternModule* sub_signed_module = this->library()->getExternModule(module_name);
    if (sub_signed_module == NULL) {
      sub_signed_module = this->library()->addExternModule(module_name);
      sub_signed_module->addPort(MacroCellLib::getSubSignedPortY());
      sub_signed_module->addPort(MacroCellLib::getSubSignedPortA());
      sub_signed_module->addPort(MacroCellLib::getSubSignedPortB());
      IdDef* param_id = sub_signed_module->addParameter(MacroCellLib::getSubSignedParamWidth());
      param_id->setInitialValue(4);
      sub_signed_module->addContent(indent + "output [width:0] y;");
      sub_signed_module->addContent(indent + "input [width-1:0] a;");
      sub_signed_module->addContent(indent + "input [width-1:0] b;");
      sub_signed_module->addContent(indent + "assign y = $signed(a) - $signed(b);");
    }
    return sub_signed_module;
  }
  ExternModule* MacroCellLib::addCellMulUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getMulUnsignedName();
    ExternModule* mul_unsigned_module = this->library()->getExternModule(module_name);
    if (mul_unsigned_module == NULL) {
      mul_unsigned_module = this->library()->addExternModule(module_name);
      mul_unsigned_module->addPort(MacroCellLib::getMulUnsignedPortY());
      mul_unsigned_module->addPort(MacroCellLib::getMulUnsignedPortA());
      mul_unsigned_module->addPort(MacroCellLib::getMulUnsignedPortB());
      IdDef* param_a_id = mul_unsigned_module->addParameter(MacroCellLib::getMulUnsignedParamWidthA());
      param_a_id->setInitialValue(4);
      IdDef* param_b_id = mul_unsigned_module->addParameter(MacroCellLib::getMulUnsignedParamWidthB());
      param_b_id->setInitialValue(4);
      mul_unsigned_module->addContent(indent + "output [width_a+width_b-1:0] y;");
      mul_unsigned_module->addContent(indent + "input [width_a-1:0] a;");
      mul_unsigned_module->addContent(indent + "input [width_b-1:0] b;");
      mul_unsigned_module->addContent(indent + "assign y = a * b;");
    }
    return mul_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellMulSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getMulSignedName();
    ExternModule* mul_signed_module = this->library()->getExternModule(module_name);
    if (mul_signed_module == NULL) {
      mul_signed_module = this->library()->addExternModule(module_name);
      mul_signed_module->addPort(MacroCellLib::getMulSignedPortY());
      mul_signed_module->addPort(MacroCellLib::getMulSignedPortA());
      mul_signed_module->addPort(MacroCellLib::getMulSignedPortB());
      IdDef* param_a_id = mul_signed_module->addParameter(MacroCellLib::getMulSignedParamWidthA());
      param_a_id->setInitialValue(4);
      IdDef* param_b_id = mul_signed_module->addParameter(MacroCellLib::getMulSignedParamWidthB());
      param_b_id->setInitialValue(4);
      mul_signed_module->addContent(indent + "output [width_a+width_b-1:0] y;");
      mul_signed_module->addContent(indent + "input [width_a-1:0] a;");
      mul_signed_module->addContent(indent + "input [width_b-1:0] b;");
      mul_signed_module->addContent(indent + "assign y = $signed(a) * $signed(b);");
    }
    return mul_signed_module;
  }
  ExternModule* MacroCellLib::addCellDivUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getDivUnsignedName();
    ExternModule* div_unsigned_module = this->library()->getExternModule(module_name);
    if (div_unsigned_module == NULL) {
      div_unsigned_module = this->library()->addExternModule(module_name);
      div_unsigned_module->addPort(MacroCellLib::getDivUnsignedPortY());
      div_unsigned_module->addPort(MacroCellLib::getDivUnsignedPortNum());
      div_unsigned_module->addPort(MacroCellLib::getDivUnsignedPortDen());
      //IdDef* param_id = div_unsigned_module->addParameter(MacroCellLib::getDivUnsignedParamWidth());
      //param_id->setInitialValue(4);
      IdDef* width_num_id = div_unsigned_module->addParameter(MacroCellLib::getDivUnsignedParamNumWidth());
      width_num_id->setInitialValue(4);
      IdDef* width_den_id = div_unsigned_module->addParameter(MacroCellLib::getDivUnsignedParamDenWidth());
      width_den_id->setInitialValue(4);
      div_unsigned_module->addContent(indent + "output [width_num-1:0] y;");
      div_unsigned_module->addContent(indent + "input [width_num-1:0] num;");
      div_unsigned_module->addContent(indent + "input [width_den-1:0] den;");
      div_unsigned_module->addContent(indent + "assign y = num / den;");
    }
    return div_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellDivSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getDivSignedName();
    ExternModule* div_signed_module = this->library()->getExternModule(module_name);
    if (div_signed_module == NULL) {
      div_signed_module = this->library()->addExternModule(module_name);
      div_signed_module->addPort(MacroCellLib::getDivSignedPortY());
      div_signed_module->addPort(MacroCellLib::getDivSignedPortNum());
      div_signed_module->addPort(MacroCellLib::getDivSignedPortDen());
      //IdDef* param_id = div_signed_module->addParameter(MacroCellLib::getDivSignedParamWidth());
      //param_id->setInitialValue(4);
      IdDef* width_num_id = div_signed_module->addParameter(MacroCellLib::getDivSignedParamNumWidth());
      width_num_id->setInitialValue(4);
      IdDef* width_den_id = div_signed_module->addParameter(MacroCellLib::getDivSignedParamDenWidth());
      width_den_id->setInitialValue(4);
      div_signed_module->addContent(indent + "output [width_num:0] y;");
      div_signed_module->addContent(indent + "input [width_num-1:0] num;");
      div_signed_module->addContent(indent + "input [width_den-1:0] den;");
      div_signed_module->addContent(indent + "assign y = $signed(num) / $signed(den);");
    }
    return div_signed_module;
  }
  ExternModule* MacroCellLib::addCellRemUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getRemUnsignedName();
    ExternModule* rem_unsigned_module = this->library()->getExternModule(module_name);
    if (rem_unsigned_module == NULL) {
      rem_unsigned_module = this->library()->addExternModule(module_name);
      rem_unsigned_module->addPort(MacroCellLib::getRemUnsignedPortY());
      rem_unsigned_module->addPort(MacroCellLib::getRemUnsignedPortNum());
      rem_unsigned_module->addPort(MacroCellLib::getRemUnsignedPortDen());
      IdDef* num_width_id = rem_unsigned_module->addParameter(MacroCellLib::getRemUnsignedParamNumWidth());
      num_width_id->setInitialValue(4);
      IdDef* den_width_id = rem_unsigned_module->addParameter(MacroCellLib::getRemUnsignedParamDenWidth());
      den_width_id->setInitialValue(4);
      IdDef* output_width_id = rem_unsigned_module->addParameter(MacroCellLib::getRemUnsignedParamWidth());
      output_width_id->setInitialValue(4);
      rem_unsigned_module->addContent(indent + "output [width-1:0] y;");
      rem_unsigned_module->addContent(indent + "input [width_num-1:0] num;");
      rem_unsigned_module->addContent(indent + "input [width_den-1:0] den;");
      rem_unsigned_module->addContent(indent + "assign y = num % den;");
    }
    return rem_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellRemSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getRemSignedName();
    ExternModule* rem_signed_module = this->library()->getExternModule(module_name);
    if (rem_signed_module == NULL) {
      rem_signed_module = this->library()->addExternModule(module_name);
      rem_signed_module->addPort(MacroCellLib::getRemSignedPortY());
      rem_signed_module->addPort(MacroCellLib::getRemSignedPortNum());
      rem_signed_module->addPort(MacroCellLib::getRemSignedPortDen());
      IdDef* num_width_id = rem_signed_module->addParameter(MacroCellLib::getRemSignedParamNumWidth());
      num_width_id->setInitialValue(4);
      IdDef* den_width_id = rem_signed_module->addParameter(MacroCellLib::getRemSignedParamDenWidth());
      den_width_id->setInitialValue(4);
      IdDef* output_width_id = rem_signed_module->addParameter(MacroCellLib::getRemSignedParamWidth());
      output_width_id->setInitialValue(4);
      rem_signed_module->addContent(indent + "output [width-1:0] y;");
      rem_signed_module->addContent(indent + "input [width_num-1:0] num;");
      rem_signed_module->addContent(indent + "input [width_den-1:0] den;");
      rem_signed_module->addContent(indent + "assign y = $signed(num) % $signed(den);");
    }
    return rem_signed_module;
  }
  ExternModule* MacroCellLib::addCellLtUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getLtUnsignedName();
    ExternModule* lt_unsigned_module = this->library()->getExternModule(module_name);
    if (lt_unsigned_module == NULL) {
      lt_unsigned_module = this->library()->addExternModule(module_name);
      lt_unsigned_module->addPort(MacroCellLib::getLtUnsignedPortY());
      lt_unsigned_module->addPort(MacroCellLib::getLtUnsignedPortA());
      lt_unsigned_module->addPort(MacroCellLib::getLtUnsignedPortB());
      IdDef* param_id = lt_unsigned_module->addParameter(MacroCellLib::getLtUnsignedParamWidth());
      param_id->setInitialValue(4);
      lt_unsigned_module->addContent(indent + "output y;");
      lt_unsigned_module->addContent(indent + "input [width-1:0] a;");
      lt_unsigned_module->addContent(indent + "input [width-1:0] b;");
      lt_unsigned_module->addContent(indent + "assign y = a < b;");
    }
    return lt_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellLtSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getLtSignedName();
    ExternModule* lt_signed_module = this->library()->getExternModule(module_name);
    if (lt_signed_module == NULL) {
      lt_signed_module = this->library()->addExternModule(module_name);
      lt_signed_module->addPort(MacroCellLib::getLtSignedPortY());
      lt_signed_module->addPort(MacroCellLib::getLtSignedPortA());
      lt_signed_module->addPort(MacroCellLib::getLtSignedPortB());
      IdDef* param_id = lt_signed_module->addParameter(MacroCellLib::getLtSignedParamWidth());
      param_id->setInitialValue(4);
      lt_signed_module->addContent(indent + "output y;");
      lt_signed_module->addContent(indent + "input [width-1:0] a;");
      lt_signed_module->addContent(indent + "input [width-1:0] b;");
      lt_signed_module->addContent(indent + "assign y = $signed(a) < $signed(b);");
    }
    return lt_signed_module;
  }
  ExternModule* MacroCellLib::addCellLeqUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getLeqUnsignedName();
    ExternModule* leq_unsigned_module = this->library()->getExternModule(module_name);
    if (leq_unsigned_module == NULL) {
      leq_unsigned_module = this->library()->addExternModule(module_name);
      leq_unsigned_module->addPort(MacroCellLib::getLeqUnsignedPortY());
      leq_unsigned_module->addPort(MacroCellLib::getLeqUnsignedPortA());
      leq_unsigned_module->addPort(MacroCellLib::getLeqUnsignedPortB());
      IdDef* param_id = leq_unsigned_module->addParameter(MacroCellLib::getLeqUnsignedParamWidth());
      param_id->setInitialValue(4);
      leq_unsigned_module->addContent(indent + "output y;");
      leq_unsigned_module->addContent(indent + "input [width-1:0] a;");
      leq_unsigned_module->addContent(indent + "input [width-1:0] b;");
      leq_unsigned_module->addContent(indent + "assign y = a <= b;");
    }
    return leq_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellLeqSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getLeqSignedName();
    ExternModule* leq_signed_module = this->library()->getExternModule(module_name);
    if (leq_signed_module == NULL) {
      leq_signed_module = this->library()->addExternModule(module_name);
      leq_signed_module->addPort(MacroCellLib::getLeqSignedPortY());
      leq_signed_module->addPort(MacroCellLib::getLeqSignedPortA());
      leq_signed_module->addPort(MacroCellLib::getLeqSignedPortB());
      IdDef* param_id = leq_signed_module->addParameter(MacroCellLib::getLeqSignedParamWidth());
      param_id->setInitialValue(4);
      leq_signed_module->addContent(indent + "output y;");
      leq_signed_module->addContent(indent + "input [width-1:0] a;");
      leq_signed_module->addContent(indent + "input [width-1:0] b;");
      leq_signed_module->addContent(indent + "assign y = $signed(a) <= $signed(b);");
    }
    return leq_signed_module;
  }
  ExternModule* MacroCellLib::addCellGtUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getGtUnsignedName();
    ExternModule* gt_unsigned_module = this->library()->getExternModule(module_name);
    if (gt_unsigned_module == NULL) {
      gt_unsigned_module = this->library()->addExternModule(module_name);
      gt_unsigned_module->addPort(MacroCellLib::getGtUnsignedPortY());
      gt_unsigned_module->addPort(MacroCellLib::getGtUnsignedPortA());
      gt_unsigned_module->addPort(MacroCellLib::getGtUnsignedPortB());
      IdDef* param_id = gt_unsigned_module->addParameter(MacroCellLib::getGtUnsignedParamWidth());
      param_id->setInitialValue(4);
      gt_unsigned_module->addContent(indent + "output y;");
      gt_unsigned_module->addContent(indent + "input [width-1:0] a;");
      gt_unsigned_module->addContent(indent + "input [width-1:0] b;");
      gt_unsigned_module->addContent(indent + "assign y = a > b;");
    }
    return gt_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellGtSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getGtSignedName();
    ExternModule* gt_signed_module = this->library()->getExternModule(module_name);
    if (gt_signed_module == NULL) {
      gt_signed_module = this->library()->addExternModule(module_name);
      gt_signed_module->addPort(MacroCellLib::getGtSignedPortY());
      gt_signed_module->addPort(MacroCellLib::getGtSignedPortA());
      gt_signed_module->addPort(MacroCellLib::getGtSignedPortB());
      IdDef* param_id = gt_signed_module->addParameter(MacroCellLib::getGtSignedParamWidth());
      param_id->setInitialValue(4);
      gt_signed_module->addContent(indent + "output y;");
      gt_signed_module->addContent(indent + "input [width-1:0] a;");
      gt_signed_module->addContent(indent + "input [width-1:0] b;");
      gt_signed_module->addContent(indent + "assign y = $signed(a) > $signed(b);");
    }
    return gt_signed_module;
  }
  ExternModule* MacroCellLib::addCellGeqUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getGeqUnsignedName();
    ExternModule* geq_unsigned_module = this->library()->getExternModule(module_name);
    if (geq_unsigned_module == NULL) {
      geq_unsigned_module = this->library()->addExternModule(module_name);
      geq_unsigned_module->addPort(MacroCellLib::getGeqUnsignedPortY());
      geq_unsigned_module->addPort(MacroCellLib::getGeqUnsignedPortA());
      geq_unsigned_module->addPort(MacroCellLib::getGeqUnsignedPortB());
      IdDef* param_id = geq_unsigned_module->addParameter(MacroCellLib::getGeqUnsignedParamWidth());
      param_id->setInitialValue(4);
      geq_unsigned_module->addContent(indent + "output y;");
      geq_unsigned_module->addContent(indent + "input [width-1:0] a;");
      geq_unsigned_module->addContent(indent + "input [width-1:0] b;");
      geq_unsigned_module->addContent(indent + "assign y = a >= b;");
    }
    return geq_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellGeqSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getGeqSignedName();
    ExternModule* geq_signed_module = this->library()->getExternModule(module_name);
    if (geq_signed_module == NULL) {
      geq_signed_module = this->library()->addExternModule(module_name);
      geq_signed_module->addPort(MacroCellLib::getGeqSignedPortY());
      geq_signed_module->addPort(MacroCellLib::getGeqSignedPortA());
      geq_signed_module->addPort(MacroCellLib::getGeqSignedPortB());
      IdDef* param_id = geq_signed_module->addParameter(MacroCellLib::getGeqSignedParamWidth());
      param_id->setInitialValue(4);
      geq_signed_module->addContent(indent + "output y;");
      geq_signed_module->addContent(indent + "input [width-1:0] a;");
      geq_signed_module->addContent(indent + "input [width-1:0] b;");
      geq_signed_module->addContent(indent + "assign y = $signed(a) >= $signed(b);");
    }
    return geq_signed_module;
  }
  ExternModule* MacroCellLib::addCellEqUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getEqUnsignedName();
    ExternModule* eq_unsigned_module = this->library()->getExternModule(module_name);
    if (eq_unsigned_module == NULL) {
      eq_unsigned_module = this->library()->addExternModule(module_name);
      eq_unsigned_module->addPort(MacroCellLib::getEqUnsignedPortY());
      eq_unsigned_module->addPort(MacroCellLib::getEqUnsignedPortA());
      eq_unsigned_module->addPort(MacroCellLib::getEqUnsignedPortB());
      IdDef* param_id = eq_unsigned_module->addParameter(MacroCellLib::getEqUnsignedParamWidth());
      param_id->setInitialValue(4);
      eq_unsigned_module->addContent(indent + "output y;");
      eq_unsigned_module->addContent(indent + "input [width-1:0] a;");
      eq_unsigned_module->addContent(indent + "input [width-1:0] b;");
      eq_unsigned_module->addContent(indent + "assign y = a == b;");
    }
    return eq_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellEqSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getEqSignedName();
    ExternModule* eq_signed_module = this->library()->getExternModule(module_name);
    if (eq_signed_module == NULL) {
      eq_signed_module = this->library()->addExternModule(module_name);
      eq_signed_module->addPort(MacroCellLib::getEqSignedPortY());
      eq_signed_module->addPort(MacroCellLib::getEqSignedPortA());
      eq_signed_module->addPort(MacroCellLib::getEqSignedPortB());
      IdDef* param_id = eq_signed_module->addParameter(MacroCellLib::getEqSignedParamWidth());
      param_id->setInitialValue(4);
      eq_signed_module->addContent(indent + "output y;");
      eq_signed_module->addContent(indent + "input [width-1:0] a;");
      eq_signed_module->addContent(indent + "input [width-1:0] b;");
      eq_signed_module->addContent(indent + "assign y = $signed(a) == $signed(b);");
    }
    return eq_signed_module;
  }
  ExternModule* MacroCellLib::addCellNeqUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getNeqUnsignedName();
    ExternModule* neq_unsigned_module = this->library()->getExternModule(module_name);
    if (neq_unsigned_module == NULL) {
      neq_unsigned_module = this->library()->addExternModule(module_name);
      neq_unsigned_module->addPort(MacroCellLib::getNeqUnsignedPortY());
      neq_unsigned_module->addPort(MacroCellLib::getNeqUnsignedPortA());
      neq_unsigned_module->addPort(MacroCellLib::getNeqUnsignedPortB());
      IdDef* param_id = neq_unsigned_module->addParameter(MacroCellLib::getNeqUnsignedParamWidth());
      param_id->setInitialValue(4);
      neq_unsigned_module->addContent(indent + "output y;");
      neq_unsigned_module->addContent(indent + "input [width-1:0] a;");
      neq_unsigned_module->addContent(indent + "input [width-1:0] b;");
      neq_unsigned_module->addContent(indent + "assign y = a != b;");
    }
    return neq_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellNeqSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getNeqSignedName();
    ExternModule* neq_signed_module = this->library()->getExternModule(module_name);
    if (neq_signed_module == NULL) {
      neq_signed_module = this->library()->addExternModule(module_name);
      neq_signed_module->addPort(MacroCellLib::getNeqSignedPortY());
      neq_signed_module->addPort(MacroCellLib::getNeqSignedPortA());
      neq_signed_module->addPort(MacroCellLib::getNeqSignedPortB());
      IdDef* param_id = neq_signed_module->addParameter(MacroCellLib::getNeqSignedParamWidth());
      param_id->setInitialValue(4);
      neq_signed_module->addContent(indent + "output y;");
      neq_signed_module->addContent(indent + "input [width-1:0] a;");
      neq_signed_module->addContent(indent + "input [width-1:0] b;");
      neq_signed_module->addContent(indent + "assign y = $signed(a) != $signed(b);");
    }
    return neq_signed_module;
  }
  ExternModule* MacroCellLib::addCellPadUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getPadUnsignedName();
    ExternModule* pad_unsigned_module = this->library()->getExternModule(module_name);
    if (pad_unsigned_module == NULL) {
      pad_unsigned_module = this->library()->addExternModule(module_name);
      pad_unsigned_module->addPort(MacroCellLib::getPadUnsignedPortY());
      pad_unsigned_module->addPort(MacroCellLib::getPadUnsignedPortIn());
      IdDef* param_width = pad_unsigned_module->addParameter(MacroCellLib::getPadUnsignedParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = pad_unsigned_module->addParameter(MacroCellLib::getPadUnsignedParamN());
      param_n->setInitialValue(4);
      pad_unsigned_module->addContent(indent + "output [(n > width ? n : width)-1:0] y;");
      pad_unsigned_module->addContent(indent + "input [width-1:0] in;");
      pad_unsigned_module->addContent(indent + "assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;");
    }
    return pad_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellPadSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getPadSignedName();
    ExternModule* pad_signed_module = this->library()->getExternModule(module_name);
    if (pad_signed_module == NULL) {
      pad_signed_module = this->library()->addExternModule(module_name);
      pad_signed_module->addPort(MacroCellLib::getPadSignedPortY());
      pad_signed_module->addPort(MacroCellLib::getPadSignedPortIn());
      IdDef* param_width = pad_signed_module->addParameter(MacroCellLib::getPadSignedParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = pad_signed_module->addParameter(MacroCellLib::getPadSignedParamN());
      param_n->setInitialValue(4);
      pad_signed_module->addContent(indent + "output [(n > width ? n : width)-1:0] y;");
      pad_signed_module->addContent(indent + "input [width-1:0] in;");
      pad_signed_module->addContent(indent + "assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;");
    }
    return pad_signed_module;
  }
  ExternModule* MacroCellLib::addCellAsUInt(const std::string& indent) {
    std::string module_name = MacroCellLib::getAsUIntName();
    ExternModule* asuint_module = this->library()->getExternModule(module_name);
    if (asuint_module == NULL) {
      asuint_module = this->library()->addExternModule(module_name);
      asuint_module->addPort(MacroCellLib::getAsUIntPortY());
      asuint_module->addPort(MacroCellLib::getAsUIntPortIn());
      IdDef* param_width = asuint_module->addParameter(MacroCellLib::getAsUIntParamWidth());
      param_width->setInitialValue(4);
      asuint_module->addContent(indent + "output [width-1:0] y;");
      asuint_module->addContent(indent + "input [width-1:0] in;");
      asuint_module->addContent(indent + "assign y = $unsigned(in);");
    }
    return asuint_module;
  }
  ExternModule* MacroCellLib::addCellAsSInt(const std::string& indent) {
    std::string module_name = MacroCellLib::getAsSIntName();
    ExternModule* assint_module = this->library()->getExternModule(module_name);
    if (assint_module == NULL) {
      assint_module = this->library()->addExternModule(module_name);
      assint_module->addPort(MacroCellLib::getAsSIntPortY());
      assint_module->addPort(MacroCellLib::getAsSIntPortIn());
      IdDef* param_width = assint_module->addParameter(MacroCellLib::getAsSIntParamWidth());
      param_width->setInitialValue(4);
      assint_module->addContent(indent + "output [width-1:0] y;");
      assint_module->addContent(indent + "input [width-1:0] in;");
      assint_module->addContent(indent + "assign y = $signed(in);");
    }
    return assint_module;
  }
  ExternModule* MacroCellLib::addCellShlUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getShlUnsignedName();
    ExternModule* shl_unsigned_module = this->library()->getExternModule(module_name);
    if (shl_unsigned_module == NULL) {
      shl_unsigned_module = this->library()->addExternModule(module_name);
      shl_unsigned_module->addPort(MacroCellLib::getShlUnsignedPortY());
      shl_unsigned_module->addPort(MacroCellLib::getShlUnsignedPortIn());
      IdDef* param_width = shl_unsigned_module->addParameter(MacroCellLib::getShlUnsignedParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = shl_unsigned_module->addParameter(MacroCellLib::getShlUnsignedParamN());
      param_n->setInitialValue(4);
      shl_unsigned_module->addContent(indent + "output [width+n-1:0] y;");
      shl_unsigned_module->addContent(indent + "input [width-1:0] in;");
      shl_unsigned_module->addContent(indent + "wire [width+n-1:0] temp;");
      shl_unsigned_module->addContent(indent + "assign temp = {{n{1'b0}}, in};");
      shl_unsigned_module->addContent(indent + "assign y = temp << n;");
    }
    return shl_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellShlSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getShlSignedName();
    ExternModule* shl_signed_module = this->library()->getExternModule(module_name);
    if (shl_signed_module == NULL) {
      shl_signed_module = this->library()->addExternModule(module_name);
      shl_signed_module->addPort(MacroCellLib::getShlSignedPortY());
      shl_signed_module->addPort(MacroCellLib::getShlSignedPortIn());
      IdDef* param_width = shl_signed_module->addParameter(MacroCellLib::getShlSignedParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = shl_signed_module->addParameter(MacroCellLib::getShlSignedParamN());
      param_n->setInitialValue(4);
      shl_signed_module->addContent(indent + "output [width+n-1:0] y;");
      shl_signed_module->addContent(indent + "input [width-1:0] in;");
      shl_signed_module->addContent(indent + "wire [width+n-1:0] temp;");
      shl_signed_module->addContent(indent + "assign temp = {{n{in[width-1]}}, in};");
      shl_signed_module->addContent(indent + "assign y = $signed(temp) << n;");
    }
    return shl_signed_module;
  }
  ExternModule* MacroCellLib::addCellShrUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getShrUnsignedName();
    ExternModule* shr_unsigned_module = this->library()->getExternModule(module_name);
    if (shr_unsigned_module == NULL) {
      shr_unsigned_module = this->library()->addExternModule(module_name);
      shr_unsigned_module->addPort(MacroCellLib::getShrUnsignedPortY());
      shr_unsigned_module->addPort(MacroCellLib::getShrUnsignedPortIn());
      IdDef* param_width = shr_unsigned_module->addParameter(MacroCellLib::getShrUnsignedParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = shr_unsigned_module->addParameter(MacroCellLib::getShrUnsignedParamN());
      param_n->setInitialValue(2);
      shr_unsigned_module->addContent(indent + "output [(n < width ? (width-n-1) : 0):0] y;");
      shr_unsigned_module->addContent(indent + "input [width-1:0] in;");
      shr_unsigned_module->addContent(indent + "assign y = n < width ? in[width-1:n] : 1'b0;");
    }
    return shr_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellShrSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getShrSignedName();
    ExternModule* shr_signed_module = this->library()->getExternModule(module_name);
    if (shr_signed_module == NULL) {
      shr_signed_module = this->library()->addExternModule(module_name);
      shr_signed_module->addPort(MacroCellLib::getShrSignedPortY());
      shr_signed_module->addPort(MacroCellLib::getShrSignedPortIn());
      IdDef* param_width = shr_signed_module->addParameter(MacroCellLib::getShrSignedParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = shr_signed_module->addParameter(MacroCellLib::getShrSignedParamN());
      param_n->setInitialValue(2);
      shr_signed_module->addContent(indent + "output [(n < width ? (width-n-1) : 0):0] y;");
      shr_signed_module->addContent(indent + "input [width-1:0] in;");
      shr_signed_module->addContent(indent + "assign y = n < width ? in[width-1:n] : in[width-1:width-1];");
    }
    return shr_signed_module;
  }
  ExternModule* MacroCellLib::addCellDShlUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getDShlUnsignedName();
    ExternModule* dshl_unsigned_module = this->library()->getExternModule(module_name);
    if (dshl_unsigned_module == NULL) {
      dshl_unsigned_module = this->library()->addExternModule(module_name);
      dshl_unsigned_module->addPort(MacroCellLib::getDShlUnsignedPortY());
      dshl_unsigned_module->addPort(MacroCellLib::getDShlUnsignedPortIn());
      dshl_unsigned_module->addPort(MacroCellLib::getDShlUnsignedPortN());
      IdDef* param_width = dshl_unsigned_module->addParameter(MacroCellLib::getDShlUnsignedParamWidthIn());
      param_width->setInitialValue(4);
      IdDef* param_n = dshl_unsigned_module->addParameter(MacroCellLib::getDShlUnsignedParamWidthN());
      param_n->setInitialValue(2);
      dshl_unsigned_module->addContent(indent + "output [(width_in+2**width_n-1)-1:0] y;");
      dshl_unsigned_module->addContent(indent + "input [width_in-1:0] in;");
      dshl_unsigned_module->addContent(indent + "input [width_n-1:0] n;");
      dshl_unsigned_module->addContent(indent + "wire [(width_in+2**width_n-1)-1:0] temp;");
      dshl_unsigned_module->addContent(indent + "assign temp = {{(2**width_n-1){1'b0}}, in};");
      dshl_unsigned_module->addContent(indent + "assign y = temp << n;");
    }
    return dshl_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellDShlSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getDShlSignedName();
    ExternModule* dshl_signed_module = this->library()->getExternModule(module_name);
    if (dshl_signed_module == NULL) {
      dshl_signed_module = this->library()->addExternModule(module_name);
      dshl_signed_module->addPort(MacroCellLib::getDShlSignedPortY());
      dshl_signed_module->addPort(MacroCellLib::getDShlSignedPortIn());
      dshl_signed_module->addPort(MacroCellLib::getDShlSignedPortN());
      IdDef* param_width = dshl_signed_module->addParameter(MacroCellLib::getDShlSignedParamWidthIn());
      param_width->setInitialValue(4);
      IdDef* param_n = dshl_signed_module->addParameter(MacroCellLib::getDShlSignedParamWidthN());
      param_n->setInitialValue(2);
      dshl_signed_module->addContent(indent + "output [(width_in+2**width_n-1)-1:0] y;");
      dshl_signed_module->addContent(indent + "input [width_in-1:0] in;");
      dshl_signed_module->addContent(indent + "input [width_n-1:0] n;");
      dshl_signed_module->addContent(indent + "wire [(width_in+2**width_n-1)-1:0] temp;");
      dshl_signed_module->addContent(indent + "assign temp = {{(2**width_n-1){in[width_in-1]}}, in};");
      dshl_signed_module->addContent(indent + "assign y = $signed(temp) << n;");
    }
    return dshl_signed_module;
  }
  ExternModule* MacroCellLib::addCellDShrUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getDShrUnsignedName();
    ExternModule* dshr_unsigned_module = this->library()->getExternModule(module_name);
    if (dshr_unsigned_module == NULL) {
      dshr_unsigned_module = this->library()->addExternModule(module_name);
      dshr_unsigned_module->addPort(MacroCellLib::getDShrUnsignedPortY());
      dshr_unsigned_module->addPort(MacroCellLib::getDShrUnsignedPortIn());
      dshr_unsigned_module->addPort(MacroCellLib::getDShrUnsignedPortN());
      IdDef* param_width = dshr_unsigned_module->addParameter(MacroCellLib::getDShrUnsignedParamWidthIn());
      param_width->setInitialValue(4);
      IdDef* param_n = dshr_unsigned_module->addParameter(MacroCellLib::getDShrUnsignedParamWidthN());
      param_n->setInitialValue(2);
      dshr_unsigned_module->addContent(indent + "output [width_in-1:0] y;");
      dshr_unsigned_module->addContent(indent + "input [width_in-1:0] in;");
      dshr_unsigned_module->addContent(indent + "input [width_n-1:0] n;");
      dshr_unsigned_module->addContent(indent + "assign y = in >> n;");
    }
    return dshr_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellDShrSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getDShrSignedName();
    ExternModule* dshr_signed_module = this->library()->getExternModule(module_name);
    if (dshr_signed_module == NULL) {
      dshr_signed_module = this->library()->addExternModule(module_name);
      dshr_signed_module->addPort(MacroCellLib::getDShrSignedPortY());
      dshr_signed_module->addPort(MacroCellLib::getDShrSignedPortIn());
      dshr_signed_module->addPort(MacroCellLib::getDShrSignedPortN());
      IdDef* param_width = dshr_signed_module->addParameter(MacroCellLib::getDShrSignedParamWidthIn());
      param_width->setInitialValue(4);
      IdDef* param_n = dshr_signed_module->addParameter(MacroCellLib::getDShrSignedParamWidthN());
      param_n->setInitialValue(2);
      dshr_signed_module->addContent(indent + "output [width_in-1:0] y;");
      dshr_signed_module->addContent(indent + "input [width_in-1:0] in;");
      dshr_signed_module->addContent(indent + "input [width_n-1:0] n;");
      dshr_signed_module->addContent(indent + "assign y = $signed(in) >>> n;");
    }
    return dshr_signed_module;
  }
  ExternModule* MacroCellLib::addCellCvtUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getCvtUnsignedName();
    ExternModule* cvt_unsigned_module = this->library()->getExternModule(module_name);
    if (cvt_unsigned_module == NULL) {
      cvt_unsigned_module = this->library()->addExternModule(module_name);
      cvt_unsigned_module->addPort(MacroCellLib::getCvtUnsignedPortY());
      cvt_unsigned_module->addPort(MacroCellLib::getCvtUnsignedPortIn());
      IdDef* param_width = cvt_unsigned_module->addParameter(MacroCellLib::getCvtUnsignedParamWidth());
      param_width->setInitialValue(4);
      cvt_unsigned_module->addContent(indent + "output [width:0] y;");
      cvt_unsigned_module->addContent(indent + "input [width-1:0] in;");
      cvt_unsigned_module->addContent(indent + "assign y = $signed({1'b0, in});");
    }
    return cvt_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellCvtSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getCvtSignedName();
    ExternModule* cvt_signed_module = this->library()->getExternModule(module_name);
    if (cvt_signed_module == NULL) {
      cvt_signed_module = this->library()->addExternModule(module_name);
      cvt_signed_module->addPort(MacroCellLib::getCvtSignedPortY());
      cvt_signed_module->addPort(MacroCellLib::getCvtSignedPortIn());
      IdDef* param_width = cvt_signed_module->addParameter(MacroCellLib::getCvtSignedParamWidth());
      param_width->setInitialValue(4);
      cvt_signed_module->addContent(indent + "output [width-1:0] y;");
      cvt_signed_module->addContent(indent + "input [width-1:0] in;");
      cvt_signed_module->addContent(indent + "assign y = $signed(in);");
    }
    return cvt_signed_module;
  }
  ExternModule* MacroCellLib::addCellNegUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getNegUnsignedName();
    ExternModule* neg_unsigned_module = this->library()->getExternModule(module_name);
    if (neg_unsigned_module == NULL) {
      neg_unsigned_module = this->library()->addExternModule(module_name);
      neg_unsigned_module->addPort(MacroCellLib::getNegUnsignedPortY());
      neg_unsigned_module->addPort(MacroCellLib::getNegUnsignedPortIn());
      IdDef* param_width = neg_unsigned_module->addParameter(MacroCellLib::getNegUnsignedParamWidth());
      param_width->setInitialValue(4);
      neg_unsigned_module->addContent(indent + "output [width:0] y;");
      neg_unsigned_module->addContent(indent + "input [width-1:0] in;");
      neg_unsigned_module->addContent(indent + "wire [width-1:0] zero;");
      neg_unsigned_module->addContent(indent + "assign zero = {{width{1'b0}}};");
      neg_unsigned_module->addContent(indent + "wire [width-1:0] temp;");
      neg_unsigned_module->addContent(indent + "assign temp = $signed(zero) - $signed(in);");
      neg_unsigned_module->addContent(indent + "assign y = {temp[width-1], temp};");
    }
    return neg_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellNegSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getNegSignedName();
    ExternModule* neg_signed_module = this->library()->getExternModule(module_name);
    if (neg_signed_module == NULL) {
      neg_signed_module = this->library()->addExternModule(module_name);
      neg_signed_module->addPort(MacroCellLib::getNegSignedPortY());
      neg_signed_module->addPort(MacroCellLib::getNegSignedPortIn());
      IdDef* param_width = neg_signed_module->addParameter(MacroCellLib::getNegSignedParamWidth());
      param_width->setInitialValue(4);
      neg_signed_module->addContent(indent + "output [width:0] y;");
      neg_signed_module->addContent(indent + "input [width-1:0] in;");
      neg_signed_module->addContent(indent + "wire [width-1:0] zero;");
      neg_signed_module->addContent(indent + "assign zero = {{width{1'b0}}};");
      neg_signed_module->addContent(indent + "wire [width-1:0] temp;");
      neg_signed_module->addContent(indent + "assign temp = $signed(zero) - $signed(in);");
      neg_signed_module->addContent(indent + "assign y = {temp[width-1], temp};");
    }
    return neg_signed_module;
  }
  ExternModule* MacroCellLib::addCellBitwiseNot(const std::string& indent) {
    std::string module_name = MacroCellLib::getBitwiseNotName();
    ExternModule* bitwisenot_module = this->library()->getExternModule(module_name);
    if (bitwisenot_module == NULL) {
      bitwisenot_module = this->library()->addExternModule(module_name);
      bitwisenot_module->addPort(MacroCellLib::getBitwiseNotPortY());
      bitwisenot_module->addPort(MacroCellLib::getBitwiseNotPortIn());
      IdDef* param_width = bitwisenot_module->addParameter(MacroCellLib::getBitwiseNotParamWidth());
      param_width->setInitialValue(4);
      bitwisenot_module->addContent(indent + "output [width-1:0] y;");
      bitwisenot_module->addContent(indent + "input [width-1:0] in;");
      bitwisenot_module->addContent(indent + "assign y = ~in;");
    }
    return bitwisenot_module;
  }
  ExternModule* MacroCellLib::addCellBitwiseAnd(const std::string& indent) {
    std::string module_name = MacroCellLib::getBitwiseAndName();
    ExternModule* bitwiseand_module = this->library()->getExternModule(module_name);
    if (bitwiseand_module == NULL) {
      bitwiseand_module = this->library()->addExternModule(module_name);
      bitwiseand_module->addPort(MacroCellLib::getBitwiseAndPortY());
      bitwiseand_module->addPort(MacroCellLib::getBitwiseAndPortA());
      bitwiseand_module->addPort(MacroCellLib::getBitwiseAndPortB());
      IdDef* param_width = bitwiseand_module->addParameter(MacroCellLib::getBitwiseAndParamWidth());
      param_width->setInitialValue(4);
      bitwiseand_module->addContent(indent + "output [width-1:0] y;");
      bitwiseand_module->addContent(indent + "input [width-1:0] a;");
      bitwiseand_module->addContent(indent + "input [width-1:0] b;");
      bitwiseand_module->addContent(indent + "assign y = a & b;");
    }
    return bitwiseand_module;
  }
  ExternModule* MacroCellLib::addCellBitwiseOr(const std::string& indent) {
    std::string module_name = MacroCellLib::getBitwiseOrName();
    ExternModule* bitwiseor_module = this->library()->getExternModule(module_name);
    if (bitwiseor_module == NULL) {
      bitwiseor_module = this->library()->addExternModule(module_name);
      bitwiseor_module->addPort(MacroCellLib::getBitwiseOrPortY());
      bitwiseor_module->addPort(MacroCellLib::getBitwiseOrPortA());
      bitwiseor_module->addPort(MacroCellLib::getBitwiseOrPortB());
      IdDef* param_width = bitwiseor_module->addParameter(MacroCellLib::getBitwiseOrParamWidth());
      param_width->setInitialValue(4);
      bitwiseor_module->addContent(indent + "output [width-1:0] y;");
      bitwiseor_module->addContent(indent + "input [width-1:0] a;");
      bitwiseor_module->addContent(indent + "input [width-1:0] b;");
      bitwiseor_module->addContent(indent + "assign y = a | b;");
    }
    return bitwiseor_module;
  }
  ExternModule* MacroCellLib::addCellBitwiseXor(const std::string& indent) {
    std::string module_name = MacroCellLib::getBitwiseXorName();
    ExternModule* bitwisexor_module = this->library()->getExternModule(module_name);
    if (bitwisexor_module == NULL) {
      bitwisexor_module = this->library()->addExternModule(module_name);
      bitwisexor_module->addPort(MacroCellLib::getBitwiseXorPortY());
      bitwisexor_module->addPort(MacroCellLib::getBitwiseXorPortA());
      bitwisexor_module->addPort(MacroCellLib::getBitwiseXorPortB());
      IdDef* param_width = bitwisexor_module->addParameter(MacroCellLib::getBitwiseXorParamWidth());
      param_width->setInitialValue(4);
      bitwisexor_module->addContent(indent + "output [width-1:0] y;");
      bitwisexor_module->addContent(indent + "input [width-1:0] a;");
      bitwisexor_module->addContent(indent + "input [width-1:0] b;");
      bitwisexor_module->addContent(indent + "assign y = a ^ b;");
    }
    return bitwisexor_module;
  }
  ExternModule* MacroCellLib::addCellAndr(const std::string& indent) {
    std::string module_name = MacroCellLib::getAndrName();
    ExternModule* andr_module = this->library()->getExternModule(module_name);
    if (andr_module == NULL) {
      andr_module = this->library()->addExternModule(module_name);
      andr_module->addPort(MacroCellLib::getAndrPortY());
      andr_module->addPort(MacroCellLib::getAndrPortIn());
      IdDef* param_width = andr_module->addParameter(MacroCellLib::getAndrParamWidth());
      param_width->setInitialValue(4);
      andr_module->addContent(indent + "output y;");
      andr_module->addContent(indent + "input [width-1:0] in;");
      andr_module->addContent(indent + "assign y = &in;");
    }
    return andr_module;
  }
  ExternModule* MacroCellLib::addCellOrr(const std::string& indent) {
    std::string module_name = MacroCellLib::getOrrName();
    ExternModule* orr_module = this->library()->getExternModule(module_name);
    if (orr_module == NULL) {
      orr_module = this->library()->addExternModule(module_name);
      orr_module->addPort(MacroCellLib::getOrrPortY());
      orr_module->addPort(MacroCellLib::getOrrPortIn());
      IdDef* param_width = orr_module->addParameter(MacroCellLib::getOrrParamWidth());
      param_width->setInitialValue(4);
      orr_module->addContent(indent + "output y;");
      orr_module->addContent(indent + "input [width-1:0] in;");
      orr_module->addContent(indent + "assign y = |in;");
    }
    return orr_module;
  }
  ExternModule* MacroCellLib::addCellXorr(const std::string& indent) {
    std::string module_name = MacroCellLib::getXorrName();
    ExternModule* xorr_module = this->library()->getExternModule(module_name);
    if (xorr_module == NULL) {
      xorr_module = this->library()->addExternModule(module_name);
      xorr_module->addPort(MacroCellLib::getXorrPortY());
      xorr_module->addPort(MacroCellLib::getXorrPortIn());
      IdDef* param_width = xorr_module->addParameter(MacroCellLib::getXorrParamWidth());
      param_width->setInitialValue(4);
      xorr_module->addContent(indent + "output y;");
      xorr_module->addContent(indent + "input [width-1:0] in;");
      xorr_module->addContent(indent + "assign y = ^in;");
    }
    return xorr_module;
  }
  ExternModule* MacroCellLib::addCellCat(const std::string& indent) {
    std::string module_name = MacroCellLib::getCatName();
    ExternModule* cat_module = this->library()->getExternModule(module_name);
    if (cat_module == NULL) {
      cat_module = this->library()->addExternModule(module_name);
      cat_module->addPort(MacroCellLib::getCatPortY());
      cat_module->addPort(MacroCellLib::getCatPortA());
      cat_module->addPort(MacroCellLib::getCatPortB());
      IdDef* param_width_a = cat_module->addParameter(MacroCellLib::getCatParamWidthA());
      param_width_a->setInitialValue(4);
      IdDef* param_width_b = cat_module->addParameter(MacroCellLib::getCatParamWidthB());
      param_width_b->setInitialValue(4);
      cat_module->addContent(indent + "output [width_a+width_b-1:0] y;");
      cat_module->addContent(indent + "input [width_a-1:0] a;");
      cat_module->addContent(indent + "input [width_b-1:0] b;");
      cat_module->addContent(indent + "assign y = {a, b};");
    }
    return cat_module;
  }
  ExternModule* MacroCellLib::addCellBits(const std::string& indent) {
    std::string module_name = MacroCellLib::getBitsName();
    ExternModule* bits_module = this->library()->getExternModule(module_name);
    if (bits_module == NULL) {
      bits_module = this->library()->addExternModule(module_name);
      bits_module->addPort(MacroCellLib::getBitsPortY());
      bits_module->addPort(MacroCellLib::getBitsPortIn());
      IdDef* param_width = bits_module->addParameter(MacroCellLib::getBitsParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_high = bits_module->addParameter(MacroCellLib::getBitsParamHigh());
      param_high->setInitialValue(2);
      IdDef* param_low = bits_module->addParameter(MacroCellLib::getBitsParamLow());
      param_low->setInitialValue(0);
      bits_module->addContent(indent + "output [high-low:0] y;");
      bits_module->addContent(indent + "input [width-1:0] in;");
      bits_module->addContent(indent + "assign y = in[high:low];");
    }
    return bits_module;
  }
  ExternModule* MacroCellLib::addCellHead(const std::string& indent) {
    std::string module_name = MacroCellLib::getHeadName();
    ExternModule* head_module = this->library()->getExternModule(module_name);
    if (head_module == NULL) {
      head_module = this->library()->addExternModule(module_name);
      head_module->addPort(MacroCellLib::getHeadPortY());
      head_module->addPort(MacroCellLib::getHeadPortIn());
      IdDef* param_width = head_module->addParameter(MacroCellLib::getHeadParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = head_module->addParameter(MacroCellLib::getHeadParamN());
      param_n->setInitialValue(2);
      head_module->addContent(indent + "output [n-1:0] y;");
      head_module->addContent(indent + "input [width-1:0] in;");
      head_module->addContent(indent + "assign y = in[width-1:width-n];");
    }
    return head_module;
  }
  ExternModule* MacroCellLib::addCellTail(const std::string& indent) {
    std::string module_name = MacroCellLib::getTailName();
    ExternModule* tail_module = this->library()->getExternModule(module_name);
    if (tail_module == NULL) {
      tail_module = this->library()->addExternModule(module_name);
      tail_module->addPort(MacroCellLib::getTailPortY());
      tail_module->addPort(MacroCellLib::getTailPortIn());
      IdDef* param_width = tail_module->addParameter(MacroCellLib::getTailParamWidth());
      param_width->setInitialValue(4);
      IdDef* param_n = tail_module->addParameter(MacroCellLib::getTailParamN());
      param_n->setInitialValue(2);
      tail_module->addContent(indent + "output [width-n-1:0] y;");
      tail_module->addContent(indent + "input [width-1:0] in;");
      tail_module->addContent(indent + "assign y = in[width-n-1:0];");
    }
    return tail_module;
  }
  ExternModule* MacroCellLib::addCellDffPosClk(const std::string& indent) {
    std::string module_name = MacroCellLib::getDffPosClkName();
    ExternModule* posclkdff_module = this->library()->getExternModule(module_name);
    if (posclkdff_module == NULL) {
      posclkdff_module = this->library()->addExternModule(module_name);
      posclkdff_module->addPort(MacroCellLib::getDffPosClkPortQ());
      posclkdff_module->addPort(MacroCellLib::getDffPosClkPortD());
      posclkdff_module->addPort(MacroCellLib::getDffPosClkPortClk());
      IdDef* param_width = posclkdff_module->addParameter(MacroCellLib::getDffPosClkParamWidth());
      param_width->setInitialValue(4);
      posclkdff_module->addContent(indent + "output reg [width-1:0] q;");
      posclkdff_module->addContent(indent + "input [width-1:0] d;");
      posclkdff_module->addContent(indent + "input clk;");
      posclkdff_module->addContent(indent + "always @(posedge clk) begin");
      posclkdff_module->addContent(indent + "    q <= d;");
      posclkdff_module->addContent(indent + "end");
    }
    return posclkdff_module;
  }
  ExternModule* MacroCellLib::addCellDffNegClk(const std::string& indent) {
    std::string module_name = MacroCellLib::getDffNegClkName();
    ExternModule* negclkdff_module = this->library()->getExternModule(module_name);
    if (negclkdff_module == NULL) {
      negclkdff_module = this->library()->addExternModule(module_name);
      negclkdff_module->addPort(MacroCellLib::getDffNegClkPortQ());
      negclkdff_module->addPort(MacroCellLib::getDffNegClkPortD());
      negclkdff_module->addPort(MacroCellLib::getDffNegClkPortClk());
      IdDef* param_width = negclkdff_module->addParameter(MacroCellLib::getDffNegClkParamWidth());
      param_width->setInitialValue(4);
      negclkdff_module->addContent(indent + "output reg [width-1:0] q;");
      negclkdff_module->addContent(indent + "input [width-1:0] d;");
      negclkdff_module->addContent(indent + "input clk;");
      negclkdff_module->addContent(indent + "always @(negedge clk) begin");
      negclkdff_module->addContent(indent + "    q <= d;");
      negclkdff_module->addContent(indent + "end");
    }
    return negclkdff_module;
  }
  ExternModule* MacroCellLib::addCellDffPosClkPosAsyncRst(const std::string& indent) {
    std::string module_name = MacroCellLib::getDffPosClkPosAsyncRstName();
    ExternModule* posclkposrst_module = this->library()->getExternModule(module_name);
    if (posclkposrst_module == NULL) {
      posclkposrst_module = this->library()->addExternModule(module_name);
      posclkposrst_module->addPort(MacroCellLib::getDffPosClkPosAsyncRstPortQ());
      posclkposrst_module->addPort(MacroCellLib::getDffPosClkPosAsyncRstPortD());
      posclkposrst_module->addPort(MacroCellLib::getDffPosClkPosAsyncRstPortRst());
      posclkposrst_module->addPort(MacroCellLib::getDffPosClkPosAsyncRstPortRstVal());
      posclkposrst_module->addPort(MacroCellLib::getDffPosClkPosAsyncRstPortClk());
      IdDef* param_width = posclkposrst_module->addParameter(MacroCellLib::getDffPosClkPosAsyncRstParamWidth());
      param_width->setInitialValue(4);
      posclkposrst_module->addContent(indent + "output reg [width-1:0] q;");
      posclkposrst_module->addContent(indent + "input [width-1:0] d;");
      posclkposrst_module->addContent(indent + "input rst;");
      posclkposrst_module->addContent(indent + "input [width-1:0] rstval;");
      posclkposrst_module->addContent(indent + "input clk;");
      posclkposrst_module->addContent(indent + "always @(posedge clk or posedge rst) begin");
      posclkposrst_module->addContent(indent + "    if (rst) begin");
      posclkposrst_module->addContent(indent + "        q <= rstval;");
      posclkposrst_module->addContent(indent + "    end else begin");
      posclkposrst_module->addContent(indent + "        q <= d;");
      posclkposrst_module->addContent(indent + "    end");
      posclkposrst_module->addContent(indent + "end");
    }
    return posclkposrst_module;
  }
  ExternModule* MacroCellLib::addCellDffPosClkNegAsyncRst(const std::string& indent) {
    std::string module_name = MacroCellLib::getDffPosClkNegAsyncRstName();
    ExternModule* posclknegrst_module = this->library()->getExternModule(module_name);
    if (posclknegrst_module == NULL) {
      posclknegrst_module = this->library()->addExternModule(module_name);
      posclknegrst_module->addPort(MacroCellLib::getDffPosClkNegAsyncRstPortQ());
      posclknegrst_module->addPort(MacroCellLib::getDffPosClkNegAsyncRstPortD());
      posclknegrst_module->addPort(MacroCellLib::getDffPosClkNegAsyncRstPortRst());
      posclknegrst_module->addPort(MacroCellLib::getDffPosClkNegAsyncRstPortRstVal());
      posclknegrst_module->addPort(MacroCellLib::getDffPosClkNegAsyncRstPortClk());
      IdDef* param_width = posclknegrst_module->addParameter(MacroCellLib::getDffPosClkNegAsyncRstParamWidth());
      param_width->setInitialValue(4);
      posclknegrst_module->addContent(indent + "output reg [width-1:0] q;");
      posclknegrst_module->addContent(indent + "input [width-1:0] d;");
      posclknegrst_module->addContent(indent + "input rst;");
      posclknegrst_module->addContent(indent + "input [width-1:0] rstval;");
      posclknegrst_module->addContent(indent + "input clk;");
      posclknegrst_module->addContent(indent + "always @(posedge clk or negedge rst) begin");
      posclknegrst_module->addContent(indent + "    if (~rst) begin");
      posclknegrst_module->addContent(indent + "        q <= rstval;");
      posclknegrst_module->addContent(indent + "    end else begin");
      posclknegrst_module->addContent(indent + "        q <= d;");
      posclknegrst_module->addContent(indent + "    end");
      posclknegrst_module->addContent(indent + "end");
    }
    return posclknegrst_module;
  }
  ExternModule* MacroCellLib::addCellDffNegClkPosAsyncRst(const std::string& indent) {
    std::string module_name = MacroCellLib::getDffNegClkPosAsyncRstName();
    ExternModule* negclkposrst_module = this->library()->getExternModule(module_name);
    if (negclkposrst_module == NULL) {
      negclkposrst_module = this->library()->addExternModule(module_name);
      negclkposrst_module->addPort(MacroCellLib::getDffNegClkPosAsyncRstPortQ());
      negclkposrst_module->addPort(MacroCellLib::getDffNegClkPosAsyncRstPortD());
      negclkposrst_module->addPort(MacroCellLib::getDffNegClkPosAsyncRstPortRst());
      negclkposrst_module->addPort(MacroCellLib::getDffNegClkPosAsyncRstPortRstVal());
      negclkposrst_module->addPort(MacroCellLib::getDffNegClkPosAsyncRstPortClk());
      IdDef* param_width = negclkposrst_module->addParameter(MacroCellLib::getDffNegClkPosAsyncRstParamWidth());
      param_width->setInitialValue(4);
      negclkposrst_module->addContent(indent + "output reg [width-1:0] q;");
      negclkposrst_module->addContent(indent + "input [width-1:0] d;");
      negclkposrst_module->addContent(indent + "input rst;");
      negclkposrst_module->addContent(indent + "input [width-1:0] rstval;");
      negclkposrst_module->addContent(indent + "input clk;");
      negclkposrst_module->addContent(indent + "always @(negedge clk or posedge rst) begin");
      negclkposrst_module->addContent(indent + "    if (rst) begin");
      negclkposrst_module->addContent(indent + "        q <= rstval;");
      negclkposrst_module->addContent(indent + "    end else begin");
      negclkposrst_module->addContent(indent + "        q <= d;");
      negclkposrst_module->addContent(indent + "    end");
      negclkposrst_module->addContent(indent + "end");
    }
    return negclkposrst_module;
  }
  ExternModule* MacroCellLib::addCellDffNegClkNegAsyncRst(const std::string& indent) {
    std::string module_name = MacroCellLib::getDffNegClkNegAsyncRstName();
    ExternModule* negclknegrst_module = this->library()->getExternModule(module_name);
    if (negclknegrst_module == NULL) {
      negclknegrst_module = this->library()->addExternModule(module_name);
      negclknegrst_module->addPort(MacroCellLib::getDffNegClkNegAsyncRstPortQ());
      negclknegrst_module->addPort(MacroCellLib::getDffNegClkNegAsyncRstPortD());
      negclknegrst_module->addPort(MacroCellLib::getDffNegClkNegAsyncRstPortRst());
      negclknegrst_module->addPort(MacroCellLib::getDffNegClkNegAsyncRstPortRstVal());
      negclknegrst_module->addPort(MacroCellLib::getDffNegClkNegAsyncRstPortClk());
      IdDef* param_width = negclknegrst_module->addParameter(MacroCellLib::getDffNegClkNegAsyncRstParamWidth());
      param_width->setInitialValue(4);
      negclknegrst_module->addContent(indent + "output reg [width-1:0] q;");
      negclknegrst_module->addContent(indent + "input [width-1:0] d;");
      negclknegrst_module->addContent(indent + "input rst;");
      negclknegrst_module->addContent(indent + "input [width-1:0] rstval;");
      negclknegrst_module->addContent(indent + "input clk;");
      negclknegrst_module->addContent(indent + "always @(negedge clk or negedge rst) begin");
      negclknegrst_module->addContent(indent + "    if (~rst) begin");
      negclknegrst_module->addContent(indent + "        q <= rstval;");
      negclknegrst_module->addContent(indent + "    end else begin");
      negclknegrst_module->addContent(indent + "        q <= d;");
      negclknegrst_module->addContent(indent + "    end");
      negclknegrst_module->addContent(indent + "end");
    }
    return negclknegrst_module;
  }
  ExternModule* MacroCellLib::addCellMuxUnsigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getMuxUnsignedName();
    ExternModule* mux_unsigned_module = this->library()->getExternModule(module_name);
    if (mux_unsigned_module == NULL) {
      mux_unsigned_module = this->library()->addExternModule(module_name);
      mux_unsigned_module->addPort(MacroCellLib::getMuxUnsignedPortY());
      mux_unsigned_module->addPort(MacroCellLib::getMuxUnsignedPortSel());
      mux_unsigned_module->addPort(MacroCellLib::getMuxUnsignedPortA());
      mux_unsigned_module->addPort(MacroCellLib::getMuxUnsignedPortB());
      IdDef* param_width = mux_unsigned_module->addParameter(MacroCellLib::getMuxUnsignedParamWidth());
      param_width->setInitialValue(4);
      mux_unsigned_module->addContent(indent + "output [width-1:0] y;");
      mux_unsigned_module->addContent(indent + "input sel;");
      mux_unsigned_module->addContent(indent + "input [width-1:0] a;");
      mux_unsigned_module->addContent(indent + "input [width-1:0] b;");
      mux_unsigned_module->addContent(indent + "assign y = sel ? a : b;");
    }
    return mux_unsigned_module;
  }
  ExternModule* MacroCellLib::addCellMuxSigned(const std::string& indent) {
    std::string module_name = MacroCellLib::getMuxSignedName();
    ExternModule* mux_signed_module = this->library()->getExternModule(module_name);
    if (mux_signed_module == NULL) {
      mux_signed_module = this->library()->addExternModule(module_name);
      mux_signed_module->addPort(MacroCellLib::getMuxSignedPortY());
      mux_signed_module->addPort(MacroCellLib::getMuxSignedPortSel());
      mux_signed_module->addPort(MacroCellLib::getMuxSignedPortA());
      mux_signed_module->addPort(MacroCellLib::getMuxSignedPortB());
      IdDef* param_width = mux_signed_module->addParameter(MacroCellLib::getMuxSignedParamWidth());
      param_width->setInitialValue(4);
      mux_signed_module->addContent(indent + "output [width-1:0] y;");
      mux_signed_module->addContent(indent + "input sel;");
      mux_signed_module->addContent(indent + "input [width-1:0] a;");
      mux_signed_module->addContent(indent + "input [width-1:0] b;");
      mux_signed_module->addContent(indent + "assign y = sel ? $signed(a) : $signed(b);");
    }
    return mux_signed_module;
  }
  ExternModule* MacroCellLib::addCellRomMem(const std::string& indent) {
    std::string module_name = MacroCellLib::getRomMemName();
    ExternModule* rommem_module = this->library()->getExternModule(module_name);
    if (rommem_module == NULL) {
      rommem_module = this->library()->addExternModule(module_name);
      rommem_module->addPort(MacroCellLib::getRomMemPortReadData());
      rommem_module->addPort(MacroCellLib::getRomMemPortReadClk());
      rommem_module->addPort(MacroCellLib::getRomMemPortReadEn());
      rommem_module->addPort(MacroCellLib::getRomMemPortReadAddr());
      IdDef* param_depth = rommem_module->addParameter(MacroCellLib::getRomMemParamDepth());
      param_depth->setInitialValue(16);
      IdDef* param_addrbits = rommem_module->addParameter(MacroCellLib::getRomMemParamAddrbits());
      param_addrbits->setInitialValue(4);
      IdDef* param_width = rommem_module->addParameter(MacroCellLib::getRomMemParamWidth());
      param_width->setInitialValue(32);
      IdDef* param_issyncread = rommem_module->addParameter(MacroCellLib::getRomMemParamIsSyncRead());
      param_issyncread->setInitialValue(0);
      rommem_module->addContent(indent + "output [width-1:0] read_data;");
      rommem_module->addContent(indent + "input read_clk;");
      rommem_module->addContent(indent + "input read_en;");
      rommem_module->addContent(indent + "input [addrbits-1:0] read_addr;");
      rommem_module->addContent(indent + "reg [width-1:0] memcore [0:depth-1];");
      rommem_module->addContent(indent + "wire [addrbits-1:0] final_read_addr;");
      rommem_module->addContent(indent + "generate");
      rommem_module->addContent(indent + "    if (isSyncRead) begin: raddr_processor");
      rommem_module->addContent(indent + "        reg [addrbits-1:0] read_addr_pipe_0;");
      rommem_module->addContent(indent + "        always @(posedge read_clk) begin");
      rommem_module->addContent(indent + "            if (read_en) begin");
      rommem_module->addContent(indent + "                read_addr_pipe_0 <= read_addr;");
      rommem_module->addContent(indent + "            end");
      rommem_module->addContent(indent + "        end");
      rommem_module->addContent(indent + "        assign final_read_addr = read_addr_pipe_0;");
      rommem_module->addContent(indent + "    end else begin: raddr_processor");
      rommem_module->addContent(indent + "        assign final_read_addr = read_addr;");
      rommem_module->addContent(indent + "    end");
      rommem_module->addContent(indent + "endgenerate");
      rommem_module->addContent(indent + "assign read_data = memcore[final_read_addr];");
    }
    return rommem_module;
  }
  ExternModule* MacroCellLib::addCellRamMem(const std::string& indent) {
    std::string module_name = MacroCellLib::getRamMemName();
    ExternModule* rammem_module = this->library()->getExternModule(module_name);
    if (rammem_module == NULL) {
      rammem_module = this->library()->addExternModule(module_name);
      rammem_module->addPort(MacroCellLib::getRamMemPortReadData());
      rammem_module->addPort(MacroCellLib::getRamMemPortReadClk());
      rammem_module->addPort(MacroCellLib::getRamMemPortReadEn());
      rammem_module->addPort(MacroCellLib::getRamMemPortReadAddr());
      rammem_module->addPort(MacroCellLib::getRamMemPortWriteClk());
      rammem_module->addPort(MacroCellLib::getRamMemPortWriteEn());
      rammem_module->addPort(MacroCellLib::getRamMemPortWriteMask());
      rammem_module->addPort(MacroCellLib::getRamMemPortWriteAddr());
      rammem_module->addPort(MacroCellLib::getRamMemPortWriteData());
      IdDef* param_depth = rammem_module->addParameter(MacroCellLib::getRamMemParamDepth());
      param_depth->setInitialValue(16);
      IdDef* param_addrbits = rammem_module->addParameter(MacroCellLib::getRamMemParamAddrbits());
      param_addrbits->setInitialValue(4);
      IdDef* param_width = rammem_module->addParameter(MacroCellLib::getRamMemParamWidth());
      param_width->setInitialValue(32);
      IdDef* param_issyncread = rammem_module->addParameter(MacroCellLib::getRamMemParamIsSyncRead());
      param_issyncread->setInitialValue(0);
      rammem_module->addContent(indent + "output [width-1:0] read_data;");
      rammem_module->addContent(indent + "input read_clk;");
      rammem_module->addContent(indent + "input read_en;");
      rammem_module->addContent(indent + "input [addrbits-1:0] read_addr;");
      rammem_module->addContent(indent + "input write_clk;");
      rammem_module->addContent(indent + "input write_en;");
      rammem_module->addContent(indent + "input write_mask;");
      rammem_module->addContent(indent + "input [addrbits-1:0] write_addr;");
      rammem_module->addContent(indent + "input [width-1:0] write_data;");
      rammem_module->addContent(indent + "reg [width-1:0] memcore [0:depth-1];");
      rammem_module->addContent(indent + "wire [addrbits-1:0] final_read_addr;");
      rammem_module->addContent(indent + "generate");
      rammem_module->addContent(indent + "    if (isSyncRead) begin: raddr_processor");
      rammem_module->addContent(indent + "        reg [addrbits-1:0] read_addr_pipe_0;");
      rammem_module->addContent(indent + "        always @(posedge read_clk) begin");
      rammem_module->addContent(indent + "            if (read_en) begin");
      rammem_module->addContent(indent + "                read_addr_pipe_0 <= read_addr;");
      rammem_module->addContent(indent + "            end");
      rammem_module->addContent(indent + "        end");
      rammem_module->addContent(indent + "        assign final_read_addr = read_addr_pipe_0;");
      rammem_module->addContent(indent + "    end else begin: raddr_processor");
      rammem_module->addContent(indent + "        assign final_read_addr = read_addr;");
      rammem_module->addContent(indent + "    end");
      rammem_module->addContent(indent + "endgenerate");
      rammem_module->addContent(indent + "assign read_data = memcore[final_read_addr];");
      rammem_module->addContent(indent + "always @(posedge write_clk) begin");
      rammem_module->addContent(indent + "    if (write_en & write_mask) begin");
      rammem_module->addContent(indent + "        memcore[write_addr] <= write_data;");
      rammem_module->addContent(indent + "    end");
      rammem_module->addContent(indent + "end");
    }
    return rammem_module;
  }
  ExternModule* MacroCellLib::addCellMRRomMem(const std::string& indent) {
    std::string module_name = MacroCellLib::getMRRomMemName();
    ExternModule* mrrommem_module = this->library()->getExternModule(module_name);
    if (mrrommem_module == NULL) {
      mrrommem_module = this->library()->addExternModule(module_name);
      mrrommem_module->addPort(MacroCellLib::getMRRomMemPortReadDatas());
      mrrommem_module->addPort(MacroCellLib::getMRRomMemPortReadClks());
      mrrommem_module->addPort(MacroCellLib::getMRRomMemPortReadEns());
      mrrommem_module->addPort(MacroCellLib::getMRRomMemPortReadAddrs());
      IdDef* param_depth = mrrommem_module->addParameter(MacroCellLib::getMRRomMemParamDepth());
      param_depth->setInitialValue(16);
      IdDef* param_addrbits = mrrommem_module->addParameter(MacroCellLib::getMRRomMemParamAddrbits());
      param_addrbits->setInitialValue(4);
      IdDef* param_width = mrrommem_module->addParameter(MacroCellLib::getMRRomMemParamWidth());
      param_width->setInitialValue(32);
      IdDef* param_readernum = mrrommem_module->addParameter(MacroCellLib::getMRRomMemParamReadernum());
      param_readernum->setInitialValue(2);
      IdDef* param_issyncread = mrrommem_module->addParameter(MacroCellLib::getMRRomMemParamIsSyncRead());
      param_issyncread->setInitialValue(0);
      mrrommem_module->addContent(indent + "output [(width*readernum-1):0] read_datas;");
      mrrommem_module->addContent(indent + "input [(1*readernum-1):0] read_clks;");
      mrrommem_module->addContent(indent + "input [(1*readernum-1):0] read_ens;");
      mrrommem_module->addContent(indent + "input [(addrbits*readernum-1):0] read_addrs;");
      mrrommem_module->addContent(indent + "reg [width-1:0] memcore [0:depth-1];");
      mrrommem_module->addContent(indent + "wire [(addrbits*readernum-1):0] final_read_addrs;");
      mrrommem_module->addContent(indent + "genvar gv_n;");
      mrrommem_module->addContent(indent + "generate");
      mrrommem_module->addContent(indent + "    for (gv_n = 0; gv_n < readernum; gv_n = gv_n + 1) begin: get_final_raddrs");
      mrrommem_module->addContent(indent + "        if (isSyncRead) begin: raddr_processor");
      mrrommem_module->addContent(indent + "            reg [addrbits-1:0] read_addr_pipe_0;");
      mrrommem_module->addContent(indent + "            always @(posedge read_clks[gv_n]) begin");
      mrrommem_module->addContent(indent + "                if (read_ens[gv_n]) begin");
      mrrommem_module->addContent(indent + "                    read_addr_pipe_0 <= read_addrs[gv_n*addrbits +: addrbits];");
      mrrommem_module->addContent(indent + "                end");
      mrrommem_module->addContent(indent + "            end");
      mrrommem_module->addContent(indent + "            assign final_read_addrs[gv_n*addrbits +: addrbits] = read_addr_pipe_0;");
      mrrommem_module->addContent(indent + "        end else begin: raddr_processor");
      mrrommem_module->addContent(indent + "            assign final_read_addrs[gv_n*addrbits +: addrbits] = read_addrs[gv_n*addrbits +: addrbits];");
      mrrommem_module->addContent(indent + "        end");
      mrrommem_module->addContent(indent + "    end");
      mrrommem_module->addContent(indent + "endgenerate");
      mrrommem_module->addContent(indent + "genvar gv_k;");
      mrrommem_module->addContent(indent + "generate");
      mrrommem_module->addContent(indent + "    for (gv_k = 0; gv_k < readernum; gv_k = gv_k + 1) begin: form_read_datas");
      mrrommem_module->addContent(indent + "        assign read_datas[gv_k*width +: width] = memcore[final_read_addrs[gv_k*addrbits +: addrbits]];");
      mrrommem_module->addContent(indent + "    end");
      mrrommem_module->addContent(indent + "endgenerate");
    }
    return mrrommem_module;
  }
  ExternModule* MacroCellLib::addCellMRMWMem(const std::string& indent) {
    std::string module_name = MacroCellLib::getMRMWMemName();
    ExternModule* mrmwmem_module = this->library()->getExternModule(module_name);
    if (mrmwmem_module == NULL) {
      mrmwmem_module = this->library()->addExternModule(module_name);
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortReadDatas());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortReadClks());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortReadEns());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortReadAddrs());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortWriteClks());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortWriteEns());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortWriteMasks());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortWriteAddrs());
      mrmwmem_module->addPort(MacroCellLib::getMRMWMemPortWriteDatas());
      IdDef* param_depth = mrmwmem_module->addParameter(MacroCellLib::getMRMWMemParamDepth());
      param_depth->setInitialValue(16);
      IdDef* param_addrbits = mrmwmem_module->addParameter(MacroCellLib::getMRMWMemParamAddrbits());
      param_addrbits->setInitialValue(4);
      IdDef* param_width = mrmwmem_module->addParameter(MacroCellLib::getMRMWMemParamWidth());
      param_width->setInitialValue(32);
      IdDef* param_readernum = mrmwmem_module->addParameter(MacroCellLib::getMRMWMemParamReadernum());
      param_readernum->setInitialValue(2);
      IdDef* param_writernum = mrmwmem_module->addParameter(MacroCellLib::getMRMWMemParamWriternum());
      param_writernum->setInitialValue(2);
      IdDef* param_issyncread = mrmwmem_module->addParameter(MacroCellLib::getMRMWMemParamIsSyncRead());
      param_issyncread->setInitialValue(0);
      mrmwmem_module->addContent(indent + "output [(width*readernum-1):0] read_datas;");
      mrmwmem_module->addContent(indent + "input [(1*readernum-1):0] read_clks;");
      mrmwmem_module->addContent(indent + "input [(1*readernum-1):0] read_ens;");
      mrmwmem_module->addContent(indent + "input [(addrbits*readernum-1):0] read_addrs;");
      mrmwmem_module->addContent(indent + "input [1*writernum-1:0] write_clks;");
      mrmwmem_module->addContent(indent + "input [1*writernum-1:0] write_ens;");
      mrmwmem_module->addContent(indent + "input [1*writernum-1:0] write_masks;");
      mrmwmem_module->addContent(indent + "input [(addrbits*writernum-1):0] write_addrs;");
      mrmwmem_module->addContent(indent + "input [(width*writernum-1):0] write_datas;");
      mrmwmem_module->addContent(indent + "reg [width-1:0] memcore [0:depth-1];");
      mrmwmem_module->addContent(indent + "wire [(addrbits*readernum-1):0] final_read_addrs;");
      mrmwmem_module->addContent(indent + "genvar gv_n;");
      mrmwmem_module->addContent(indent + "generate");
      mrmwmem_module->addContent(indent + "    for (gv_n = 0; gv_n < readernum; gv_n = gv_n + 1) begin: get_final_raddrs");
      mrmwmem_module->addContent(indent + "        if (isSyncRead) begin: raddr_processor");
      mrmwmem_module->addContent(indent + "            reg [addrbits-1:0] read_addr_pipe_0;");
      mrmwmem_module->addContent(indent + "            always @(posedge read_clks[gv_n]) begin");
      mrmwmem_module->addContent(indent + "                if (read_ens[gv_n]) begin");
      mrmwmem_module->addContent(indent + "                    read_addr_pipe_0 <= read_addrs[gv_n*addrbits +: addrbits];");
      mrmwmem_module->addContent(indent + "                end");
      mrmwmem_module->addContent(indent + "            end");
      mrmwmem_module->addContent(indent + "            assign final_read_addrs[gv_n*addrbits +: addrbits] = read_addr_pipe_0;");
      mrmwmem_module->addContent(indent + "        end else begin: raddr_processor");
      mrmwmem_module->addContent(indent + "            assign final_read_addrs[gv_n*addrbits +: addrbits] = read_addrs[gv_n*addrbits +: addrbits];");
      mrmwmem_module->addContent(indent + "        end");
      mrmwmem_module->addContent(indent + "    end");
      mrmwmem_module->addContent(indent + "endgenerate");
      mrmwmem_module->addContent(indent + "genvar gv_k;");
      mrmwmem_module->addContent(indent + "generate");
      mrmwmem_module->addContent(indent + "    for (gv_k = 0; gv_k < readernum; gv_k = gv_k + 1) begin: form_read_datas");
      mrmwmem_module->addContent(indent + "        assign read_datas[gv_k*width +: width] = memcore[final_read_addrs[gv_k*addrbits +: addrbits]];");
      mrmwmem_module->addContent(indent + "    end");
      mrmwmem_module->addContent(indent + "endgenerate");
      mrmwmem_module->addContent(indent + "integer i;");
      mrmwmem_module->addContent(indent + "always @(posedge write_clks[0]) begin");
      mrmwmem_module->addContent(indent + "    for (i = 0; i < writernum; i = i + 1) begin");
      mrmwmem_module->addContent(indent + "        if (write_ens[i] & write_masks[i]) begin");
      mrmwmem_module->addContent(indent + "            memcore[write_addrs[i*addrbits +: addrbits]] <= write_datas[i*width +: width];");
      mrmwmem_module->addContent(indent + "        end");
      mrmwmem_module->addContent(indent + "    end");
      mrmwmem_module->addContent(indent + "end");
    }
    return mrmwmem_module;
  }
  std::string MacroCellLib::getNameByModuleType(ModuleType type) {
    std::string module_name;
    switch (type)
    {
    case ModuleType::kTypeAddUnsigned:
      module_name = "ADD_UNSIGNED";
      break;
    case ModuleType::kTypeAddSigned:
      module_name = "ADD_SIGNED";
      break;
    case ModuleType::kTypeSubUnsigned:
      module_name = "SUB_UNSIGNED";
      break;
    case ModuleType::kTypeSubSigned:
      module_name = "SUB_SIGNED";
      break;
    case ModuleType::kTypeMulUnsigned:
      module_name = "MUL_UNSIGNED";
      break;
    case ModuleType::kTypeMulSigned:
      module_name = "MUL_SIGNED";
      break;
    case ModuleType::kTypeDivUnsigned:
      module_name = "DIV_UNSIGNED";
      break;
    case ModuleType::kTypeDivSigned:
      module_name = "DIV_SIGNED";
      break;
    case ModuleType::kTypeRemUnsigned:
      module_name = "REM_UNSIGNED";
      break;
    case ModuleType::kTypeRemSigned:
      module_name = "REM_SIGNED";
      break;
    case ModuleType::kTypeLtUnsigned:
      module_name = "LT_UNSIGNED";
      break;
    case ModuleType::kTypeLtSigned:
      module_name = "LT_SIGNED";
      break;
    case ModuleType::kTypeLeqUnsigned:
      module_name = "LEQ_UNSIGNED";
      break;
    case ModuleType::kTypeLeqSigned:
      module_name = "LEQ_SIGNED";
      break;
    case ModuleType::kTypeGtUnsigned:
      module_name = "GT_UNSIGNED";
      break;
    case ModuleType::kTypeGtSigned:
      module_name = "GT_SIGNED";
      break;
    case ModuleType::kTypeGeqUnsigned:
      module_name = "GEQ_UNSIGNED";
      break;
    case ModuleType::kTypeGeqSigned:
      module_name = "GEQ_SIGNED";
      break;
    case ModuleType::kTypeEqUnsigned:
      module_name = "EQ_UNSIGNED";
      break;
    case ModuleType::kTypeEqSigned:
      module_name = "EQ_SIGNED";
      break;
    case ModuleType::kTypeNeqUnsigned:
      module_name = "NEQ_UNSIGNED";
      break;
    case ModuleType::kTypeNeqSigned:
      module_name = "NEQ_SIGNED";
      break;
    case ModuleType::kTypePadUnsigned:
      module_name = "PAD_UNSIGNED";
      break;
    case ModuleType::kTypePadSigned:
      module_name = "PAD_SIGNED";
      break;
    case ModuleType::kTypeAsUInt:
      module_name = "ASUINT";
      break;
    case ModuleType::kTypeAsSInt:
      module_name = "ASSINT";
      break;
    case ModuleType::kTypeShlUnsigned:
      module_name = "SHL_UNSIGNED";
      break;
    case ModuleType::kTypeShlSigned:
      module_name = "SHL_SIGNED";
      break;
    case ModuleType::kTypeShrUnsigned:
      module_name = "SHR_UNSIGNED";
      break;
    case ModuleType::kTypeShrSigned:
      module_name = "SHR_SIGNED";
      break;
    case ModuleType::kTypeDShlUnsigned:
      module_name = "DSHL_UNSIGNED";
      break;
    case ModuleType::kTypeDShlSigned:
      module_name = "DSHL_SIGNED";
      break;
    case ModuleType::kTypeDShrUnsigned:
      module_name = "DSHR_UNSIGNED";
      break;
    case ModuleType::kTypeDShrSigned:
      module_name = "DSHR_SIGNED";
      break;
    case ModuleType::kTypeCvtUnsigned:
      module_name = "CVT_UNSIGNED";
      break;
    case ModuleType::kTypeCvtSigned:
      module_name = "CVT_SIGNED";
      break;
    case ModuleType::kTypeNegUnsigned:
      module_name = "NEG_UNSIGNED";
      break;
    case ModuleType::kTypeNegSigned:
      module_name = "NEG_SIGNED";
      break;
    case ModuleType::kTypeBitwiseNot:
      module_name = "BITWISENOT";
      break;
    case ModuleType::kTypeBitwiseAnd:
      module_name = "BITWISEAND";
      break;
    case ModuleType::kTypeBitwiseOr:
      module_name = "BITWISEOR";
      break;
    case ModuleType::kTypeBitwiseXor:
      module_name = "BITWISEXOR";
      break;
    case ModuleType::kTypeAndr:
      module_name = "ANDR";
      break;
    case ModuleType::kTypeOrr:
      module_name = "ORR";
      break;
    case ModuleType::kTypeXorr:
      module_name = "XORR";
      break;
    case ModuleType::kTypeCat:
      module_name = "CAT";
      break;
    case ModuleType::kTypeBits:
      module_name = "BITS";
      break;
    case ModuleType::kTypeHead:
      module_name = "HEAD";
      break;
    case ModuleType::kTypeTail:
      module_name = "TAIL";
      break;
    case ModuleType::kTypeDffPosClk:
      module_name = "DFF_POSCLK";
      break;
    case ModuleType::kTypeDffNegClk:
      module_name = "DFF_NEGCLK";
      break;
    case ModuleType::kTypeDffPosClkPosAsyncRst:
      module_name = "DFF_POSCLK_POSASYNCRST";
      break;
    case ModuleType::kTypeDffPosClkNegAsyncRst:
      module_name = "DFF_POSCLK_NEGASYNCRST";
      break;
    case ModuleType::kTypeDffNegClkPosAsyncRst:
      module_name = "DFF_NEGCLK_POSASYNCRST";
      break;
    case ModuleType::kTypeDffNegClkNegAsyncRst:
      module_name = "DFF_NEGCLK_NEGASYNCRST";
      break;
    case ModuleType::kTypeMuxUnsigned:
      module_name = "MUX_UNSIGNED";
      break;
    case ModuleType::kTypeMuxSigned:
      module_name = "MUX_SIGNED";
      break;
    case ModuleType::kTypeRomMem:
      module_name = "ROMMEM";
      break;
    case ModuleType::kTypeRamMem:
      module_name = "RAMMEM";
      break;
    case ModuleType::kTypeMRRomMem:
      module_name = "MRROMMEM";
      break;
    case ModuleType::kTypeMRMWMem:
      module_name = "MRMWMEM";
      break;
    case ModuleType::kTypeUndef:
      fs_assert(0);
      break;
    default:
      break;
    }
    return module_name;
  }
  MacroCellLib::ModuleType MacroCellLib::getModuleTypeByName(const std::string& module_name) {
    if (module_name == "ADD_UNSIGNED")
      return ModuleType::kTypeAddUnsigned;
    else if (module_name == "ADD_SIGNED")
      return ModuleType::kTypeAddSigned;
    else if (module_name == "SUB_UNSIGNED")
      return ModuleType::kTypeSubUnsigned;
    else if (module_name == "SUB_SIGNED")
      return ModuleType::kTypeSubSigned;
    else if (module_name == "MUL_UNSIGNED")
      return ModuleType::kTypeMulUnsigned;
    else if (module_name == "MUL_SIGNED")
      return ModuleType::kTypeMulSigned;
    else if (module_name == "DIV_UNSIGNED")
      return ModuleType::kTypeDivUnsigned;
    else if (module_name == "DIV_SIGNED")
      return ModuleType::kTypeDivSigned;
    else if (module_name == "REM_UNSIGNED")
      return ModuleType::kTypeRemUnsigned;
    else if (module_name == "REM_SIGNED")
      return ModuleType::kTypeRemSigned;
    else if (module_name == "LT_UNSIGNED")
      return ModuleType::kTypeLtUnsigned;
    else if (module_name == "LT_SIGNED")
      return ModuleType::kTypeLtSigned;
    else if (module_name == "LEQ_UNSIGNED")
      return ModuleType::kTypeLeqUnsigned;
    else if (module_name == "LEQ_SIGNED")
      return ModuleType::kTypeLeqSigned;
    else if (module_name == "GT_UNSIGNED")
      return ModuleType::kTypeGtUnsigned;
    else if (module_name == "GT_SIGNED")
      return ModuleType::kTypeGtSigned;
    else if (module_name == "GEQ_UNSIGNED")
      return ModuleType::kTypeGeqUnsigned;
    else if (module_name == "GEQ_SIGNED")
      return ModuleType::kTypeGeqSigned;
    else if (module_name == "EQ_UNSIGNED")
      return ModuleType::kTypeEqUnsigned;
    else if (module_name == "EQ_SIGNED")
      return ModuleType::kTypeEqSigned;
    else if (module_name == "NEQ_UNSIGNED")
      return ModuleType::kTypeNeqUnsigned;
    else if (module_name == "NEQ_SIGNED")
      return ModuleType::kTypeNeqSigned;
    else if (module_name == "PAD_UNSIGNED")
      return ModuleType::kTypePadUnsigned;
    else if (module_name == "PAD_SIGNED")
      return ModuleType::kTypePadSigned;
    else if (module_name == "ASUINT")
      return ModuleType::kTypeAsUInt;
    else if (module_name == "ASSINT")
      return ModuleType::kTypeAsSInt;
    else if (module_name == "SHL_UNSIGNED")
      return ModuleType::kTypeShlUnsigned;
    else if (module_name == "SHL_SIGNED")
      return ModuleType::kTypeShlSigned;
    else if (module_name == "SHR_UNSIGNED")
      return ModuleType::kTypeShrUnsigned;
    else if (module_name == "SHR_SIGNED")
      return ModuleType::kTypeShrSigned;
    else if (module_name == "DSHL_UNSIGNED")
      return ModuleType::kTypeDShlUnsigned;
    else if (module_name == "DSHL_SIGNED")
      return ModuleType::kTypeDShlSigned;
    else if (module_name == "DSHR_UNSIGNED")
      return ModuleType::kTypeDShrUnsigned;
    else if (module_name == "DSHR_SIGNED")
      return ModuleType::kTypeDShrSigned;
    else if (module_name == "CVT_UNSIGNED")
      return ModuleType::kTypeCvtUnsigned;
    else if (module_name == "CVT_SIGNED")
      return ModuleType::kTypeCvtSigned;
    else if (module_name == "NEG_UNSIGNED")
      return ModuleType::kTypeNegUnsigned;
    else if (module_name == "NEG_SIGNED")
      return ModuleType::kTypeNegSigned;
    else if (module_name == "BITWISENOT")
      return ModuleType::kTypeBitwiseNot;
    else if (module_name == "BITWISEAND")
      return ModuleType::kTypeBitwiseAnd;
    else if (module_name == "BITWISEOR")
      return ModuleType::kTypeBitwiseOr;
    else if (module_name == "BITWISEXOR")
      return ModuleType::kTypeBitwiseXor;
    else if (module_name == "ANDR")
      return ModuleType::kTypeAndr;
    else if (module_name == "ORR")
      return ModuleType::kTypeOrr;
    else if (module_name == "XORR")
      return ModuleType::kTypeXorr;
    else if (module_name == "CAT")
      return ModuleType::kTypeCat;
    else if (module_name == "BITS")
      return ModuleType::kTypeBits;
    else if (module_name == "HEAD")
      return ModuleType::kTypeHead;
    else if (module_name == "TAIL")
      return ModuleType::kTypeTail;
    else if (module_name == "DFF_POSCLK")
      return ModuleType::kTypeDffPosClk;
    else if (module_name == "DFF_NEGCLK")
      return ModuleType::kTypeDffNegClk;
    else if (module_name == "DFF_POSCLK_POSASYNCRST")
      return ModuleType::kTypeDffPosClkPosAsyncRst;
    else if (module_name == "DFF_POSCLK_NEGASYNCRST")
      return ModuleType::kTypeDffPosClkNegAsyncRst;
    else if (module_name == "DFF_NEGCLK_POSASYNCRST")
      return ModuleType::kTypeDffNegClkPosAsyncRst;
    else if (module_name == "DFF_NEGCLK_NEGASYNCRST")
      return ModuleType::kTypeDffNegClkNegAsyncRst;
    else if (module_name == "MUX_UNSIGNED")
      return ModuleType::kTypeMuxUnsigned;
    else if (module_name == "MUX_SIGNED")
      return ModuleType::kTypeMuxSigned;
    else if (module_name == "ROMMEM")
      return ModuleType::kTypeRomMem;
    else if (module_name == "RAMMEM")
      return ModuleType::kTypeRamMem;
    else if (module_name == "MRROMMEM")
      return ModuleType::kTypeMRRomMem;
    else if (module_name == "MRMWMEM")
      return ModuleType::kTypeMRMWMem;
    else
      return ModuleType::kTypeUndef;
  }
}
