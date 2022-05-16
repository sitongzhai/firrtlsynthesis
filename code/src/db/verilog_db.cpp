//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "db/verilog_db.h"
#include "utility/exception.h"

using namespace firrtlsyn;

namespace verilog {
  std::map<std::string, Library*> VNode::libs_;
  void VNode::destory(Library* lib) {
    std::string lib_name = lib->getName();
    std::map<std::string, Library*>::iterator it = libs_.find(lib_name);
    if (it == libs_.end()) return;
    libs_.erase(it);
    if (it->second != NULL) delete it->second;
    it->second = NULL;
  }
  void VNode::release() {
    for (auto iter = libs_.begin(); iter != libs_.end(); iter++) {
      if (iter->second) delete iter->second;
      iter->second = NULL;
    }
    libs_.clear();
  }
  Library* VNode::getLib(const std::string& lib_name) {
    std::map<std::string, Library*>::iterator it = libs_.find(lib_name);
    if (it == libs_.end()) {
      Library* library = new Library(lib_name);
      libs_.insert(std::make_pair(lib_name, library));
      return library;
    } else {
      return it->second;
    }
  }

  Library::Library(const std::string& name) {
    this->name_ = name;
  }
  Library::~Library() {
    clear();
  }
  void Library::clear() {
    for (size_t i = 0; i < modules_.size(); i++) {
      if (modules_[i]) delete modules_[i];
      modules_[i] = NULL;
    }
    modules_.clear();
    id_module_map_.clear();
    extern_module_map_.clear();
  }
  std::string Library::toString(const std::string& indent) {
    std::string str = indent;
    std::string s_module;
    for (size_t m = 0; m < modules_.size(); m++) {
      if (modules_[m] != NULL) {
        s_module = modules_[m]->toString(indent);
      } else {
        fs_assert(0);
        s_module = "??";
      }
      str += s_module + "\n";
    }
    return str;
  }
  Module* Library::addModule(const std::string& module_name) {
    Module* new_module = getModule(module_name);
    if (new_module == NULL) {
      new_module = new Module(module_name, this);
      modules_.push_back(new_module);
      id_module_map_.insert(std::make_pair(module_name, new_module));
    } else {
      fs_error("*ERROR*: Module '%s' has been defined.\n", module_name.c_str());
    }
    return new_module;
  }
  ExternModule* Library::addExternModule(const std::string& module_name) {
    ExternModule* new_module = getExternModule(module_name);
    if (new_module == NULL) {
      new_module = new ExternModule(module_name, this);
      modules_.push_back(new_module);
      extern_module_map_.insert(std::make_pair(module_name, new_module));
    } else {
      fs_error("*ERROR*: Extern Module '%s' has been defined.\n", module_name.c_str());
    }
    return new_module;
  }
  Module* Library::getModule(const std::string& module_name) {
    auto iter = id_module_map_.find(module_name);
    if (iter != id_module_map_.end()) {
      return iter->second;
    }
    return NULL;
  }
  ExternModule* Library::getExternModule(const std::string& module_name) {
    auto iter = extern_module_map_.find(module_name);
    if (iter != extern_module_map_.end()) {
      return iter->second;
    }
    return NULL;
  }
  std::string Variable::toString(const std::string& indent) {
    std::string str = indent;
    if (this->isPort()) {
      std::string dir_str = "";
      if (this->isInout()) dir_str = "inout ";
      else if (this->isInput()) dir_str = "input ";
      else if (this->isOutput()) dir_str = "output ";
      else dir_str = "";
      str += dir_str;
    } else if (this->isNet()) {
      if (net_type_ == NetType::kNetWire) {
        str += "wire ";
      }
    }
    Range* range = this->getRange();
    if (range != NULL) {
      std::string range_str = range->toString();
      str += range_str + " ";
    }
    str += this->getName();
    return str;
  }
  void Variable::setDataType(BaseDataType* data_type) {
    data_type_ = data_type;
    range_ = data_type->getRange();
  }
  bool Variable::isSigned() const {
    BaseDataType* data_type = this->getDataType();
    if (data_type != NULL) {
      return data_type->isSigned();
    } else {
      return false;
    }
  }
  void Variable::setRange(int range_left, int range_right) {
    if (data_type_ != NULL) {
      data_type_->setRange(range_left, range_right);
      range_ = data_type_->getRange();
    }
  }
  int Variable::getMsbOfRange() {
    Range* range = this->getRange();
    if (range == NULL) return INT_MAX;
    IntVal* range_left = dynamic_cast<IntVal*>(range->getLeft());
    fs_assert(range_left != NULL);
    return range_left->getIntValue();
  }
  int Variable::getLsbOfRange() {
    Range* range = this->getRange();
    if (range == NULL) return INT_MAX;
    IntVal* range_right = dynamic_cast<IntVal*>(range->getRight());
    fs_assert(range_right != NULL);
    return range_right->getIntValue();
  }
  InstId::~InstId() {
    for (size_t p = 0; p < port_connects_.size(); p++) {
      if (port_connects_[p] != NULL) delete port_connects_[p];
      port_connects_[p] = NULL;
    }
    port_connects_.clear();
    name_connects_map_.clear();
  }
  PortConnect* InstId::addPortConnect(const std::string& port_ref_name) {
    PortConnect* inst_port_connect = getPortConnect(port_ref_name);
    if (inst_port_connect == NULL) {
      inst_port_connect = new PortConnect(port_ref_name);
      port_connects_.push_back(inst_port_connect);
      name_connects_map_.insert(std::make_pair(port_ref_name, inst_port_connect));
    } else {
      fs_warning("*WARNING*: Port '%s' has been defined in instantiation '%s'.\n", port_ref_name.c_str(), this->getName().c_str());
    }
    return inst_port_connect;
  }
  PortConnect* InstId::getPortConnect(const std::string& port_ref_name) {
    auto iter = name_connects_map_.find(port_ref_name);
    if (iter == name_connects_map_.end()) {
      return NULL;
    } else {
      return iter->second;
    }
  }
  std::string InstId::toString(const std::string& indent) {
    std::string str = this->getName() + " (\n";
    size_t p = 0;
    for (p = 0; p < port_connects_.size() - 1; p++) {
      str += "    " + port_connects_[p]->toString(indent) + ",\n";
    }
    str += "    " + port_connects_[p]->toString(indent) + "\n";
    str += indent + ")";
    return str;
  }
  ParamId::~ParamId() {
    if (initial_value_ != NULL) delete initial_value_;
    initial_value_ = NULL;
  }
  void ParamId::setInitialValue(int int_initial_value) {
    initial_value_ = new IntVal(int_initial_value);
  }
  void ParamId::setInitialValue(char sign, unsigned int sized, bool is_signed, const std::string& value) {
    initial_value_ = new ConstVal(sign, sized, is_signed, value);
  }
  void ParamId::setInitialValue(unsigned int sized, bool is_signed, const std::string& value) {
    initial_value_ = new ConstVal(sized, is_signed, value);
  }
  void ParamId::setDataType(BaseDataType* data_type) {
    data_type_ = data_type;
    range_ = data_type->getRange();
  }
  bool ParamId::isSigned() const {
    BaseDataType* data_type = this->getDataType();
    if (data_type != NULL) {
      return data_type->isSigned();
    } else {
      return false;
    }
  }
  int ParamId::getMsbOfRange() {
    Range* range = this->getRange();
    if (range == NULL) return INT_MAX;
    IntVal* range_left = dynamic_cast<IntVal*>(range->getLeft());
    fs_assert(range_left != NULL);
    return range_left->getIntValue();
  }
  int ParamId::getLsbOfRange() {
    Range* range = this->getRange();
    if (range == NULL) return INT_MAX;
    IntVal* range_right = dynamic_cast<IntVal*>(range->getRight());
    fs_assert(range_right != NULL);
    return range_right->getIntValue();
  }
  std::string ParamId::toString(const std::string& indent) {
    std::string str = indent + "parameter " + this->getName() + " = " + this->getInitialValue()->toString();
    return str;
  }
  BaseModule::~BaseModule() {
    clear();
  }
  std::string BaseModule::getName() const {
    return this->getId()->getName();
  }
  IdDef* BaseModule::getPort(const std::string& name) const {
    auto iter = port_iddef_map_.find(name);
    if (iter != port_iddef_map_.end()) {
      return iter->second;
    } else {
      return NULL;
    }
  }
  IdDef* BaseModule::getParam(const std::string& name) const {
    auto iter = param_iddef_map_.find(name);
    if (iter != param_iddef_map_.end()) {
      return iter->second;
    } else {
      return NULL;
    }
  }
  IdDef* BaseModule::addParameter(const std::string& parameter_name) {
    IdDef* param_id_def = getParam(parameter_name);
    if (param_id_def != NULL) {
      fs_warning("*WARNING*: Parameter '%s' has been defined.\n", parameter_name.c_str());
    }
    param_id_def = new ParamId(parameter_name);
    parameters_.push_back(param_id_def);
    param_iddef_map_.insert(std::make_pair(parameter_name, param_id_def));
    DataDecl* param_decl = new DataDecl(DeclType::kParameter, param_id_def);
    addLocModuleItem(param_decl);
    return param_id_def;
  }
  IdDef* BaseModule::addParameter(const std::string& parameter_name, int range_left, int range_right) {
    IdDef* param_id_def = getParam(parameter_name);
    if (param_id_def != NULL) {
      fs_warning("*WARNING*: Parameter '%s' has been defined.\n", parameter_name.c_str());
    }
    param_id_def = new ParamId(parameter_name);
    parameters_.push_back(param_id_def);
    param_iddef_map_.insert(std::make_pair(parameter_name, param_id_def));
    DataDecl* param_decl = new DataDecl(DeclType::kParameter, param_id_def, range_left, range_right);
    addLocModuleItem(param_decl);
    return param_id_def;
  }
  void BaseModule::addLocModuleItem(ModuleItem* module_item) {
    module_items_.push_back(module_item);
  }
  void BaseModule::clear() {
    if (module_id_ != NULL) delete module_id_;
    module_id_ = NULL;
    library_ = NULL;
    for (size_t p = 0; p < ports_.size(); p++) {
      if (ports_[p] != NULL) delete ports_[p];
      ports_[p] = NULL;
    }
    ports_.clear();
    for (size_t p = 0; p < parameters_.size(); p++) {
      if (parameters_[p] != NULL) delete parameters_[p];
      parameters_[p] = NULL;
    }
    parameters_.clear();
    for (size_t i = 0; i < module_items_.size(); i++) {
      if (module_items_[i] != NULL) delete module_items_[i];
      module_items_[i] = NULL;
    }
    module_items_.clear();
    port_iddef_map_.clear();
    param_iddef_map_.clear();
  }
  Module::Module(const std::string& module_name, Library* library) {
    module_id_ = new ModuleId(module_name, false);
    library_ = library;
  }
  Module::~Module() {
    for (size_t i = 0; i < item_ids_.size(); i++) {
      if (item_ids_[i] != NULL) delete item_ids_[i];
      item_ids_[i] = NULL;
    }
    item_ids_.clear();
    decl_iddef_map_.clear();
  }
  IdDef* Module::findDeclared(const std::string& name) const {
    auto iter = decl_iddef_map_.find(name);
    if (iter != decl_iddef_map_.end()) {
      return iter->second;
    }
    return getPort(name);
  }
  IdDef* Module::addPort(const std::string& port_name, PortDir port_dir) {
    IdDef* port_id_def = getPort(port_name);
    if (port_id_def != NULL) {
      fs_warning("*WARNING*: Port '%s' has been defined.\n", port_name.c_str());
    }
    port_id_def = new Variable(DeclType::kPort, port_name, port_dir, NetType::kNetUndef);
    ports_.push_back(port_id_def);
    port_iddef_map_.insert(std::make_pair(port_name, port_id_def));
    DataDecl* port_decl = new DataDecl(DeclType::kPort, port_id_def);
    addLocModuleItem(port_decl);
    return port_id_def;
  }
  IdDef* Module::addPort(const std::string& port_name, PortDir port_dir, int range_left, int range_right) {
    IdDef* port_id_def = getPort(port_name);
    if (port_id_def != NULL) {
      fs_warning("*WARNING*: Port '%s' has been defined.\n", port_name.c_str());
    }
    port_id_def = new Variable(DeclType::kPort, port_name, port_dir, NetType::kNetUndef);
    ports_.push_back(port_id_def);
    port_iddef_map_.insert(std::make_pair(port_name, port_id_def));
    DataDecl* port_decl = new DataDecl(DeclType::kPort, port_id_def, range_left, range_right);
    addLocModuleItem(port_decl);
    return port_id_def;
  }
  IdDef* Module::addNet(const std::string& net_name) {
    IdDef* net_id_def = findDeclared(net_name);
    if (net_id_def != NULL) {
      fs_warning("*WARNING*: Net '%s' has been defined.\n", net_name.c_str());
    }
    net_id_def = new Variable(DeclType::kWire, net_name, PortDir::kPortDirUndef, NetType::kNetWire);
    item_ids_.push_back(net_id_def);
    decl_iddef_map_.insert(std::make_pair(net_name, net_id_def));
    NetDecl* net_decl = new NetDecl(net_id_def);
    addLocModuleItem(net_decl);
    return net_id_def;
  }
  IdDef* Module::addNet(const std::string& net_name, int range_left, int range_right) {
    IdDef* net_id_def = findDeclared(net_name);
    if (net_id_def != NULL) {
      fs_warning("*WARNING*: Net '%s' has been defined.\n", net_name.c_str());
    }
    net_id_def = new Variable(DeclType::kWire, net_name, PortDir::kPortDirUndef, NetType::kNetWire);
    item_ids_.push_back(net_id_def);
    decl_iddef_map_.insert(std::make_pair(net_name, net_id_def));
    NetDecl* net_decl = new NetDecl(net_id_def, range_left, range_right);
    addLocModuleItem(net_decl);
    return net_id_def;
  }
  ModuleInstantiation* Module::addInstance(const std::string& inst_name, const std::string& inst_module_name) {
    IdDef* inst_id_def = findDeclared(inst_name);
    if (inst_id_def != NULL) {
      fs_warning("*WARNING*: Instance '%s' has been defined in module '%s'.\n", inst_name.c_str(), this->getName().c_str());
    }
    inst_id_def = new InstId(inst_name);
    item_ids_.push_back(inst_id_def);
    decl_iddef_map_.insert(std::make_pair(inst_name, inst_id_def));
    ModuleInstantiation* instantiation = new ModuleInstantiation(inst_module_name, inst_id_def, library_);
    addLocModuleItem(instantiation);
    return instantiation;
  }
  BlockingAssign* Module::addBlockAssign() {
    BlockingAssign* block_assign = new BlockingAssign();
    addLocModuleItem(block_assign);
    return block_assign;
  }
  std::string Module::toString(const std::string& indent) {
    std::string str = indent + "module " + module_id_->toString() + "(\n";
    size_t p = 0;
    for (p = 0; p < ports_.size() - 1; p++) {
      str += ports_[p]->toString(indent + "    ") + ",\n";
    }
    str += ports_[p]->toString(indent + "    ") + "\n" + ");\n";
    for (p = 0; p < module_items_.size(); p++) {
      if (module_items_[p]->isPortDecl()) continue;
      str +=  module_items_[p]->toString(indent + "    ") + "\n";
    }
    str += indent + "endmodule //" + this->getName();
    return str;
  }
  ExternModule::ExternModule(const std::string& module_name, Library* library) {
    module_id_ = new ModuleId(module_name, true);
    library_ = library;
  }
  IdDef* ExternModule::addPort(const std::string& port_name) {
    IdDef* port_id_def = getPort(port_name);
    if (port_id_def != NULL) {
      fs_warning("*WARNING*: Port '%s' has been defined.\n", port_name.c_str());
    }
    port_id_def = new Variable(DeclType::kPort, port_name, PortDir::kPortDirUndef, NetType::kNetUndef);
    ports_.push_back(port_id_def);
    port_iddef_map_.insert(std::make_pair(port_name, port_id_def));
    return port_id_def;
  }
  std::string ExternModule::toString(const std::string& indent) {
    std::string str = indent + "module " + module_id_->toString() + "(";
    size_t p = 0;
    for (p = 0; p < ports_.size() - 1; p++) {
      str += ports_[p]->toString(indent) + ", ";
    }
    str += ports_[p]->toString(indent) + ");\n";
    for (p = 0; p < module_items_.size(); p++) {
      if (module_items_[p]->isPortDecl()) continue;
      str += module_items_[p]->toString(indent + "    ") + "\n";
    }
    for (p = 0; p < contents_.size(); p++) {
      str += indent + "    " + contents_[p] + "\n";
    }
    str += indent + "endmodule // " + this->getName();
    return str;
  }
  DataDecl::DataDecl(DeclType decl_type, IdDef* id_def) {
    if (decl_type == DeclType::kPort) {
      data_type_ = new BaseDataType(DataType::kDataTypePort);
    } else if (decl_type == DeclType::kParameter) {
      data_type_ = new BaseDataType(DataType::kDataTypeParameter);
    } else {
      data_type_ = new BaseDataType(DataType::kDataTypeNet);
    }
    id_ = id_def;
    decl_type_ = decl_type;
    id_->setDataType(data_type_);
  }
  DataDecl::DataDecl(DeclType decl_type, IdDef* id_def, int range_left, int range_right) {
    if (decl_type == DeclType::kPort) {
      data_type_ = new BaseDataType(DataType::kDataTypePort, range_left, range_right);
    } else if (decl_type == DeclType::kParameter) {
      data_type_ = new BaseDataType(DataType::kDataTypeParameter, range_left, range_right);
    } else {
      data_type_ = new BaseDataType(DataType::kDataTypeNet, range_left, range_right);
    }
    decl_type_ = decl_type;
    id_ = id_def;
    id_->setDataType(data_type_);
  }
  DataDecl::~DataDecl() {
    if (data_type_ != NULL) delete data_type_;
    data_type_ = NULL;
  }
  PortDir DataDecl::getDir() const {
    if (this->isIODecl()) {
      return this->getId()->getDir();
    } else {
      return PortDir::kPortDirUndef;
    }
  }
  std::string DataDecl::toString(const std::string& indent) {
    std::string str = this->getId()->toString(indent) + ";";
    return str;
  }
  ModuleInstantiation::ModuleInstantiation(const std::string& module_name, IdDef* id, Library* library) {
    module_name_ = module_name;
    inst_id_ = id;
    library_ = library;
  }
  ModuleInstantiation::~ModuleInstantiation() {
    //if (inst_id_ != NULL) delete inst_id_;
    for (size_t p = 0; p < param_values_.size(); p++) {
      if (param_values_[p]) delete param_values_[p];
      param_values_[p] = NULL;
    }
    param_values_.clear();
  }
  //Const* ModuleInstantiation::addParamValue(char sign, unsigned int sized, bool is_signed, const std::string& value) {
  //  ConstVal* param_value = new ConstVal(sign, sized, is_signed, value);
  //  param_values_.push_back(param_value);
  //  return param_value;
  //}
  //Const* ModuleInstantiation::addParamValue(unsigned int sized, bool is_signed, const std::string& value) {
  //  ConstVal* param_value = new ConstVal(sized, is_signed, value);
  //  param_values_.push_back(param_value);
  //  return param_value;
  //}
  //Const* ModuleInstantiation::addParamValue(int value) {
  //  IntVal* param_value = new IntVal(value);
  //  param_values_.push_back(param_value);
  //  return param_value;
  //}
  PortConnect* ModuleInstantiation::addParamValue(const std::string& name) {
    PortConnect* param_value = getParamValue(name);
    if (param_value == NULL) {
      param_value = new PortConnect(name);
      param_values_.push_back(param_value);
      name_params_map_.insert(std::make_pair(name, param_value));
    } else {
      fs_warning("*WARNING*: Parameter '%s' has been defined in instantiation '%s'.\n", name.c_str(), this->getInstance()->getName().c_str());
    }
    return param_value;
  }
  PortConnect* ModuleInstantiation::getParamValue(const std::string& name) {
    auto iter = name_params_map_.find(name);
    if (iter != name_params_map_.end()) return iter->second;
    else return NULL;
  }
  std::string ModuleInstantiation::toString(const std::string& indent) {
    std::string str = indent + module_name_ + " ";
    if (param_values_.size() > 0) {
      str += "#(";
      size_t p = 0;
      for (p = 0; p < param_values_.size() - 1; p++) {
        str += param_values_[p]->toString() + ", ";
      }
      str += param_values_[p]->toString() + ") ";
    }
    str += inst_id_->toString(indent) + ";";
    return str;
  }
  BlockingAssign::BlockingAssign() {
    lval_ = NULL;
    rval_ = NULL;
  }
  BlockingAssign::~BlockingAssign() {
    if (lval_ != NULL) delete lval_;
    lval_ = NULL;
    if (rval_ != NULL) delete rval_;
    rval_ = NULL;
  }
  void BlockingAssign::setLeftValue(const std::string& ref_name, IdDef* ref_id_def) {
    if (lval_ != NULL) delete lval_;
    lval_ = new IdRef(ref_name, ref_id_def);
  }
  void BlockingAssign::setRightValue(char sign, unsigned int sized, bool is_signed, const std::string& value) {
    if (rval_ != NULL) delete rval_;
    rval_ = new ConstVal(sign, sized, is_signed, value);
  }
  void BlockingAssign::setRightValue(unsigned int sized, bool is_signed, const std::string& value) {
    if (rval_ != NULL) delete rval_;
    rval_ = new ConstVal(sized, is_signed, value);
  }
  void BlockingAssign::setRightValue(const std::string& connection_id, IdDef* ref_id_def) {
    if (rval_ != NULL) delete rval_;
    rval_ = new IdRef(connection_id, ref_id_def);
  }
  std::string BlockingAssign::toString(const std::string& indent) {
    std::string str = indent + "assign ";
    if (lval_ == NULL) {
      str += "??";
    } else {
      str += lval_->toString() + " = ";
    }
    if (rval_ == NULL) {
      str += "??";
    } else {
      str += rval_->toString();
    }
    str += ";";
    return str;
  }
  BaseDataType::BaseDataType(DataType data_type) {
    //set is_signed on transferModule::addPort/addParam
    is_signed_ = false;
    data_type_ = data_type;
    range_ = NULL;
  }
  BaseDataType::BaseDataType(DataType data_type, int range_left, int range_right) {
    //set is_signed on transferModule::addPort/addParam
    is_signed_ = false;
    data_type_ = data_type;
    range_ = NULL;
    setRange(range_left, range_right);
  }
  BaseDataType::~BaseDataType() {
    if (range_ != NULL) delete range_;
    range_ = NULL;
  }
  void BaseDataType::setRange(int range_left, int range_right) {
    if (range_ == NULL) {
      range_ = new Range(range_left, range_right);
    } else {
      range_->setLeft(range_left);
      range_->setRight(range_right);
    }
  }
  NetDataType::~NetDataType() {
    if (range_ != NULL) delete range_;
    range_ = NULL;
  }
  PortConnect::PortConnect(const std::string& port_ref_name) {
    port_ref_name_ = port_ref_name;
    connection_ = NULL;
  }
  PortConnect::~PortConnect() {
    if (connection_ != NULL) delete connection_;
    connection_ = NULL;
  }
  void PortConnect::setConnection(char sign, unsigned int sized, bool is_signed, const std::string& value) {
    if (connection_ != NULL) delete connection_;
    connection_ = new ConstVal(sign, sized, is_signed, value);
  }
  void PortConnect::setConnection(unsigned int sized, bool is_signed, const std::string& value) {
    if (connection_ != NULL) delete connection_;
    connection_ = new ConstVal(sized, is_signed, value);
  }
  void PortConnect::setConnection(const std::string& connection_id) {
    if (connection_ != NULL) delete connection_;
    connection_ = new IdRef(connection_id);
  }
  void PortConnect::setConnection(int value) {
    if (connection_ != NULL) delete connection_;
    connection_ = new IntVal(value);
  }
  std::string PortConnect::toString(const std::string& indent) {
    std::string port_str = indent;
    port_str += "." + port_ref_name_ + "(";
    port_str += connection_->toString();
    port_str += ")";
    return port_str;
  }
  std::string ConstVal::toString(const std::string& /*indent*/) {
    std::string str = "";
    if (sign_ == '-') {
      str += "-";
    } else if (sign_ == '+') {
      str += "+";
    }
    str += std::to_string(sized_) + "'";
    str += (is_signed_) ? "s" : "";
    str += value_;
    return str;
  }
  std::string IntVal::toString(const std::string& /*indent*/) {
    std::string str = std::to_string(value_);
    return str;
  }
  std::string IdRef::toString(const std::string& /*indent*/) {
    return name_;
  }
  Range::Range() {
    left_ = NULL;
    right_ = NULL;
  }
  Range::Range(int range_left, int range_right) {
    if (range_left <= range_right) {
      fs_warning("*WARNING*: Illegal range [%d:%d].\n", range_left, range_right);
    }
    left_ = NULL;
    right_ = NULL;
    this->setLeft(range_left);
    this->setRight(range_right);
  }
  Range::~Range() {
    if (left_ != NULL) delete left_;
    left_ = NULL;
    if (right_ != NULL) delete right_;
    right_ = NULL;
  }
  void Range::setLeft(int range_left) {
    if (right_ != NULL && range_left <= right_->getIntValue()) {
      fs_warning("*WARNING*: Illegal range [%d:%d].\n", range_left, right_->getIntValue());
    }
    if (left_ != NULL) delete left_;
    left_ = new IntVal(range_left);
  }
  void Range::setRight(int range_right) {
    if (left_ != NULL && left_->getIntValue() <= range_right) {
      fs_warning("*WARNING*: Illegal range [%d:%d].\n", left_->getIntValue(), range_right);
    }
    if (right_ != NULL) delete right_;
    right_ = new IntVal(range_right);
  }
  unsigned int Range::rangeWidth() {
    int left = this->getMsbOfRange();
    int right = this->getLsbOfRange();
    if (left <= right) {
      fs_warning("*WARNING*: Illegal range [%d:%d].\n", left, right);
      return (right - left + 1);
    } else {
      return (left - right + 1);
    }
  }
  int Range::getMsbOfRange() const {
    if (left_ != NULL) {
      return left_->getIntValue();
    } else {
      fs_error("*ERROR*: Failed to get Msb of range.\n");
      return INT_MAX;
    }
  }
  int Range::getLsbOfRange() const {
    if (right_ != NULL) {
      return right_->getIntValue();
    } else {
      fs_error("*ERROR*: Failed to get Lsb of range.\n");
      return INT_MAX;
    }
  }
  std::string Range::toString(const std::string& /*indent*/) {
    std::string str = "[" + left_->toString() + ":" + right_->toString() + "]";
    return str;
  }
}