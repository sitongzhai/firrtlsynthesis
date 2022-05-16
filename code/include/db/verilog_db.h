//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************
#include <string>
#include <set>
#include <vector>
#include <map>
#include <limits.h>
#include "utility/assert.h"

#ifndef DB_VERIDB_H
#define DB_VERIDB_H

namespace verilog {
  class VNode;
  class Library;
  class IdDef;
  class Variable;
  class InstId;
  class ModuleId;
  class ParamId;
  class ModuleItem;
  class BaseModule;
  class Module;
  class ExternModule;
  class ModuleInstantiation;
  class DataDecl;
  class NetDecl;
  class Statement;
  class BlockingAssign;
  class Expression;
  class PortConnect;
  class BaseDataType;
  class NetDataType;
  class Const;
  class ConstVal;
  class IntVal;
  class Name;
  class IdRef;
  class Range;

  enum PortDir {
    kPortDirInput,
    kPortDirOutput,
    kPortDirInout,
    kPortDirUndef
  };
  enum DataType {
    kDataTypePort,
    kDataTypeParameter,
    kDataTypeNet,
    kDataTypeUndef
  };
  enum DeclType {
    kPort,
    kParameter,
    kWire,
    kUndef
  };
  enum NetType {
    kNetWire,
    kNetUndef
  };

  class VNode {
  public:
    VNode() {}
    virtual ~VNode() {
      //this->release();
    }
  public:
    static Library* getLib(const std::string& lib_name);
    static void release();
    static void destory(Library* library);
  private:
    static std::map<std::string, Library*> libs_;
  };

  class Library : public VNode {
  public:
    Library(const std::string& name);
    ~Library();
    void clear();
  public:
    std::string toString(const std::string& indent = "");
    std::string getName() const { return name_; }
    Module* addModule(const std::string& module_name);
    Module* getModule(const std::string& module_name);
    ExternModule* addExternModule(const std::string& module_name);
    ExternModule* getExternModule(const std::string& module_name);
    std::vector<BaseModule*>& getAllModules() { return modules_; }
  private:
    std::string name_;
    std::vector<BaseModule*> modules_;
    std::map<std::string, Module*> id_module_map_;
    std::map<std::string, ExternModule*> extern_module_map_; //include module
  };

  class IdDef : public VNode {
  public:
    IdDef(const std::string& name) {
      name_ = name;
    }
    virtual ~IdDef() {}
  public:
    std::string getName() const { return name_; }
    virtual std::string toString(const std::string& indent = "") = 0;
    virtual bool isPort() const { return false; }
    virtual bool isNet() const { return false; }
    virtual bool isInst() const { return false; }
    virtual bool isParam() const { return false; }
    virtual bool isModule() const { return false; }
    virtual void setDataType(BaseDataType* /*data_type*/) { }
    virtual BaseDataType* getDataType() const { return NULL; }

    virtual std::string getInstName() const { return ""; }
    virtual void setInitialValue(int /*int_initial_value*/) {}
    virtual void setInitialValue(char /*sign*/, unsigned int /*sized*/, bool /*is_signed*/, const std::string& /*value*/) {}
    virtual void setInitialValue(unsigned int /*sized*/, bool /*is_signed*/, const std::string& /*value*/) {}
    virtual Expression* getInitialValue() const { return NULL; }
    virtual void setValue(int /*value*/) { }
    virtual int getValue() const { return INT_MAX; }
    virtual Range* getRange() { return NULL; }
    virtual void setRange(int /*range_left*/, int /*range_right*/) {}
    virtual NetType getNetType() const { return NetType::kNetUndef; }
    virtual void setDir(PortDir /*dir*/) { }
    virtual void setNetType(NetType /*net_type*/) { }
    virtual DeclType getDeclType() const { return DeclType::kUndef; }
    virtual bool isSigned() const { return false; }
    virtual PortConnect* addPortConnect(const std::string& /*port_ref_name*/) { return NULL; }
    //virtual std::vector<PortConnect*> getPortConnects() {
    //  return std::vector<PortConnect*>();
    //}
    virtual PortConnect* getPortConnect(const std::string& /*port_ref_name*/) { return NULL; }
    virtual PortDir getDir() { return PortDir::kPortDirUndef; }
    virtual bool isInput() const { return false; }
    virtual bool isInout() const { return false; }
    virtual bool isOutput() const { return false; }
    //virtual bool isAssigned() const { return false; }
    //virtual void setAssigned() { }
    virtual int getMsbOfRange() { return INT_MAX; }
    virtual int getLsbOfRange() { return INT_MAX; }
  protected:
    std::string name_;
  };

  class Variable : public IdDef {
  public:
    Variable(DeclType decl_type, const std::string& name, PortDir dir, NetType net_type) : IdDef(name) {
      data_type_ = NULL;
      range_ = NULL;
      dir_ = dir;
      net_type_ = net_type;
      decl_type_ = decl_type;
    }
    ~Variable() {}
  public:
    std::string toString(const std::string& indent = "");
    void setDataType(BaseDataType* data_type);
    BaseDataType* getDataType() const { return data_type_; }
    void setDir(PortDir dir) { dir_ = dir; }
    PortDir getDir() const { return dir_; }
    bool isInput() const { return dir_ == PortDir::kPortDirInput; }
    bool isOutput() const { return dir_ == PortDir::kPortDirOutput; }
    bool isInout() const { return dir_ == PortDir::kPortDirInout; }
    bool isPort() const { return decl_type_ == DeclType::kPort; }
    bool isNet() const { return decl_type_ == DeclType::kWire; }
    bool isSigned() const;
    NetType getNetType() const { return net_type_; }
    void setNetType(NetType net_type) { net_type_ = net_type; }
    void setDeclType(DeclType decl_type) { decl_type_ = decl_type; }
    DeclType getDeclType() const { return decl_type_; }
    //virtual bool isAssigned() const { return is_assigned_; }
    //virtual void setAssigned() { is_assigned_ = true; }
    Range* getRange() { return range_; }
    void setRange(int range_left, int range_right);
    int getMsbOfRange();
    int getLsbOfRange();
    
  private:
    BaseDataType* data_type_;
    Range* range_;
    //bool is_assigned_;
    PortDir dir_;
    NetType net_type_;
    DeclType decl_type_;
  };

  class InstId : public IdDef {
  public:
    InstId(const std::string& name) : IdDef(name) { }
    ~InstId();
  public:
    std::string toString(const std::string& indent = "");
    std::string getInstName() const { return name_; }
    bool isInst() const { return true; }
    PortConnect* addPortConnect(const std::string& port_ref_name);
    PortConnect* getPortConnect(const std::string& port_ref_name);
    //std::vector<PortConnect*> getPortConnects() { return port_connects_; }
  private:
    std::vector<PortConnect*> port_connects_;
    std::map<std::string, PortConnect*> name_connects_map_;
  };

  class ModuleId : public IdDef {
  public:
    ModuleId(const std::string& name, bool is_extern) : IdDef(name) {
      is_extern_ = is_extern;
    }
    ~ModuleId() {}
  public:
    std::string toString(const std::string& /*indent = ""*/) { return name_; }
    bool isModule() const { return true; }
    bool isExtern() const { return is_extern_; }

  private:
    bool is_extern_;
  };

  class ParamId : public IdDef {
  public:
    ParamId(const std::string& name) : IdDef(name) {
      data_type_ = NULL;
      range_ = NULL;
      initial_value_ = NULL;
      value_ = INT_MAX;
      decl_type_ = DeclType::kParameter;
    }
    ~ParamId();
  public:
    std::string toString(const std::string& indent = "");
    bool isParam() const { return true; }
    void setInitialValue(int int_initial_value);
    void setInitialValue(char sign, unsigned int sized, bool is_signed, const std::string& value);
    void setInitialValue(unsigned int sized, bool is_signed, const std::string& value);
    Expression* getInitialValue() const { return initial_value_; }
    void setDataType(BaseDataType* data_type);
    BaseDataType* getDataType() const { return data_type_; }
    Range* getRange() const { return range_; }
    void setValue(int value) { value_ = value; }
    int getValue() const { return value_; }
    DeclType getDeclType() const { return decl_type_; }
    bool isSigned() const;
    //virtual bool isAssigned() const { return is_assigned_; }
    int getMsbOfRange();
    int getLsbOfRange();
  private:
    BaseDataType* data_type_;
    Range* range_;
    Expression* initial_value_;
    //bool is_assigned_;
    int value_; 
    DeclType decl_type_;
  };

  class ModuleItem : public VNode {
  public:
    ModuleItem() {}
    virtual ~ModuleItem() {}
  public:
    virtual std::string toString(const std::string& indent = "") = 0;
    virtual bool isModule() const { return false; }
    virtual bool isStatement() const { return false; }
    virtual bool isDataDecl() const { return false; }
    virtual bool isPortDecl() const { return false; }
    virtual bool isInstantiation() const { return false; }
    virtual bool isParamDecl() const { return false; }
    virtual bool isNetDecl() const { return false; }
    virtual bool isIODecl() const { return false; }
  };

  class BaseModule : public ModuleItem {
  public:
    BaseModule() {}
    virtual ~BaseModule();
  public:
    void clear();
    bool isModule() const { return true; }
    virtual std::string toString(const std::string& indent = "") = 0;
    Library* getLibrary() { return library_; }
    std::string getName() const;
    IdDef* getId() const { return module_id_; }
    std::vector<IdDef*>& getPorts() { return ports_; }
    IdDef* getPort(const std::string& name) const;
    std::vector<IdDef*>& getParameters() { return parameters_; }
    IdDef* getParam(const std::string& name) const;
    std::vector<ModuleItem*>& getItems() { return module_items_; }
    IdDef* addParameter(const std::string& parameter_name);
    IdDef* addParameter(const std::string& parameter_name, int range_left, int range_right);
    void addLocModuleItem(ModuleItem* module_item);
  protected:
    IdDef* module_id_;
    std::vector<IdDef*> ports_;
    std::vector<IdDef*> parameters_;
    Library* library_;
    std::vector<ModuleItem*> module_items_;
    std::map<std::string, IdDef*> port_iddef_map_;
    std::map<std::string, IdDef*> param_iddef_map_;
  };

  class Module : public BaseModule {
  public:
    Module(const std::string& module_name, Library* library);
    ~Module();
  public:
    IdDef* findDeclared(const std::string& name) const;
    std::string toString(const std::string& indent = "");

    IdDef* addPort(const std::string& port_name, PortDir port_dir);
    IdDef* addPort(const std::string& port_name, PortDir port_dir, int range_left, int range_right);
    IdDef* addNet(const std::string& net_name);
    IdDef* addNet(const std::string& net_name, int range_left, int range_right);
    ModuleInstantiation* addInstance(const std::string& inst_name, const std::string& inst_module_name);
    BlockingAssign* addBlockAssign();

  private:
    std::vector<IdDef*> item_ids_;
    //std::vector<Expression*> port_connects_;
    //std::vector<DataDecl*> param_connects_;
    std::map<std::string, IdDef*> decl_iddef_map_;
  };

  class ExternModule : public BaseModule {
  public:
    ExternModule(const std::string& module_name, Library* library);
    ~ExternModule() {}
  public:
    std::string toString(const std::string& indent = "");
    void addContent(const std::string& content) {
      contents_.push_back(content);
    }
    IdDef* addPort(const std::string& port_name);
  private:
    std::vector<std::string> contents_;
  };

  class ModuleInstantiation : public ModuleItem {
  public:
    ModuleInstantiation(const std::string& module_name, IdDef* id, Library* library);
    ~ModuleInstantiation();
  public:
    bool isInstantiation() const { return true; }
    std::string toString(const std::string& indent = "");
    //std::vector<PortConnect*>& getParamValues() { return param_values_; }
    PortConnect* getParamValue(const std::string& name);
    IdDef* getInstance() const { return inst_id_; }
    std::string getModuleName() const { return module_name_; }
    Library* getLibrary() const { return library_; }
    //Const* addParamValue(char sign, unsigned int sized, bool is_signed, const std::string& value);
    //Const* addParamValue(unsigned int sized, bool is_signed, const std::string& value);
    //Const* addParamValue(int value);
    PortConnect* addParamValue(const std::string& name);
  private:
    std::string module_name_;
    IdDef* inst_id_;
    Library* library_;
    std::vector<PortConnect*> param_values_;  //parameter_assignments
    std::map<std::string, PortConnect*> name_params_map_;
  };

  class DataDecl : public ModuleItem {
  public:
    DataDecl(DeclType decl_type, IdDef* id_def);
    DataDecl(DeclType decl_type, IdDef* id_def, int range_left, int range_right);
    ~DataDecl();
  public:
    std::string toString(const std::string& indent = "");
    virtual bool isDataDecl() const { return true; }
    virtual bool isPortDecl() const { return decl_type_ == DeclType::kPort; }
    virtual bool isParamDecl() const { return decl_type_ == DeclType::kParameter; }
    virtual bool isIODecl() const { return decl_type_ == DeclType::kPort; }
    virtual bool isNetDecl() const { return false; }
    //virtual void addDataType(DataType type, bool signing/*, int range_left, int range_right*/);
    virtual void setDataType(BaseDataType* data_type) { data_type_ = data_type; }
    BaseDataType* getDataType() const { return data_type_; }
    IdDef* getId() const { return id_; }
    DeclType getDeclType() const { return decl_type_; }
    PortDir getDir() const;
  private:
    IdDef* id_;
    DeclType decl_type_;
    BaseDataType* data_type_;
  };

  // contain 'strength' and 'delay' info
  class NetDecl : public DataDecl {
  public:
    NetDecl(IdDef* id) : DataDecl(DeclType::kWire, id) { }
    NetDecl(IdDef* id, int range_left, int range_right) : DataDecl(DeclType::kWire, id, range_left, range_right) { }
    ~NetDecl() {}

  public:
    virtual bool isNetDecl() const { return true; }
  };

  class Statement : public ModuleItem {
  public:
    Statement() {}
    virtual ~Statement() {}
  public:
    virtual bool isStatement() const { return true; }
    virtual std::string toString(const std::string& indent = "") = 0;
  };

  class BlockingAssign : public Statement {
  public:
    BlockingAssign();
    ~BlockingAssign();
  public:
    std::string toString(const std::string& indent = "");
    void setLeftValue(const std::string& ref_name, IdDef* ref_id_def = NULL);
    void setRightValue(char sign, unsigned int sized, bool is_signed, const std::string& value);
    void setRightValue(unsigned int sized, bool is_signed, const std::string& value);
    void setRightValue(const std::string& connection_id, IdDef* ref_id_def = NULL);
    IdRef* getLVal() const { return lval_; }
    Expression* getRVal() const { return rval_; }
  private:
    IdRef* lval_;
    Expression* rval_;
  };

  class Expression : public VNode {
  public:
    Expression() {}
    virtual ~Expression() {}
  public:
    virtual std::string toString(const std::string& indent = "") = 0;
    virtual bool isConst() const { return false; }
    virtual bool isRange() const { return false; }
    virtual bool isIdRef() const { return false; }
    virtual bool isInt() const { return false; }
    virtual bool isDataType() const { return false; }
    virtual bool isNetDataType() const { return false; }
    virtual std::string getPortRefName() const { return ""; }
    virtual Expression* getConnection() { return NULL; }
    virtual DataType getDataType() { return DataType::kDataTypeUndef; }
    virtual Range* getRange() { return NULL; }
    virtual bool isSigned() const { return false; }
    virtual std::string getStringValue() const { return ""; }
    virtual unsigned int getSized() const { return UINT_MAX; }
    virtual char getSign() const { return '\0'; }
    virtual int getIntValue() const { return INT_MAX; }
    virtual std::string getName() const { return ""; }
    virtual IdDef* getIdDef() { return NULL; }
    virtual Expression* getLeft() { return NULL; }
    virtual Expression* getRight() { return NULL; }
    virtual unsigned int rangeWidth() const { return INT_MAX; }
    virtual int getMsbOfRange() const { return INT_MAX; }
    virtual int getLsbOfRange() const { return INT_MAX; }
  };

  class PortConnect : public Expression {
  public:
    PortConnect(const std::string& port_ref_name);
    ~PortConnect();
  public:
    std::string toString(const std::string& indent = "");
    std::string getPortRefName() const { return port_ref_name_; }
    Expression* getConnection() { return connection_; }
    void setConnection(char sign, unsigned int sized, bool is_signed, const std::string& value);
    void setConnection(unsigned int sized, bool is_signed, const std::string& value);
    void setConnection(const std::string& connection_id);
    void setConnection(int value);
  private:
    std::string port_ref_name_;
    Expression* connection_;
  };

  class BaseDataType : public Expression {
  public:
    BaseDataType(DataType data_type);
    BaseDataType(DataType data_type, int range_left, int range_right);
    virtual ~BaseDataType();
  public:
    virtual std::string toString(const std::string& /*indent = ""*/) { return ""; }
    virtual bool isDataType() const { return true; }
    virtual bool isNetDataType() const { return false; }
    virtual bool isSigned() { return is_signed_; }
    DataType getDataType() { return data_type_; }
    Range* getRange() { return range_; }
    void setRange(int range_left, int range_right);
    void setSigned(bool is_signed) { is_signed_ = is_signed; }
  protected:
    bool is_signed_;
    DataType data_type_;
    Range* range_;
  };

  class NetDataType : public BaseDataType {
  public:
    NetDataType(NetType net_type, DataType data_type) : BaseDataType(data_type) {
      net_type_ = net_type;
    }
    NetDataType(NetType net_type, DataType data_type, int range_left, int range_right) : BaseDataType(data_type, range_left, range_right) {
      net_type_ = net_type;
    }
    ~NetDataType();
  public:
    bool isNetDataType() const { return true; }
    std::string toString(const std::string& /*indent = ""*/) { return ""; }
  private:
    NetType net_type_;
  };

  class Const : public Expression {
  public:
    Const() {}
    virtual ~Const() {}
  public:
    virtual std::string toString(const std::string& indent = "") = 0;
    virtual bool isConst() const { return true; }
    virtual std::string getStringValue() const { return ""; }
    virtual unsigned int getSized() const { return UINT_MAX; }
    virtual bool isSigned() const { return false; }
    virtual char getSign() const { return '\0'; }
    virtual int getIntValue() const { return INT_MAX; }
  };

  //unsized constant numbers: 659  'h837FF  'o7560
  //sized constant numbers: 4'b1001  5'D3  3'b011
  //sign with constant numbers: -8'd6 4'shf(4-bit number '1111' equivalent to -4'h1)  -4'sd15(is equivalent to -(-4'd1))
  class ConstVal : public Const {
  public:
    ConstVal(char sign, unsigned int sized, bool is_signed, const std::string& value) {
      sign_ = sign;
      sized_ = sized;
      is_signed_ = is_signed;
      value_ = value;
    }
    ConstVal(unsigned int sized, bool is_signed, const std::string& value) {
      sign_ = ' ';
      sized_ = sized;
      is_signed_ = is_signed;
      value_ = value;
    }
    virtual ~ConstVal() {}
  public:
    std::string toString(const std::string& indent = "");
    std::string getStringValue() const { return value_; }
    unsigned int getSized() { return sized_; }
    bool isSigned() { return is_signed_; }
    char getSign() { return sign_; }
  private:
    std::string value_;
    unsigned int sized_;
    bool is_signed_; //signed
    char sign_;
  };

  class IntVal : public Const {
  public:
    IntVal(int value) {
      value_ = value;
    }
    ~IntVal() {}
  public:
    std::string toString(const std::string& indent = "");
    virtual bool isInt() const { return true; }
    int getIntValue() const { return value_; }
  private:
    int value_;
  };

  class Name : public Expression {
  public:
    Name() {}
    virtual ~Name() {}
  public:
    virtual bool isIdRef() const { return false; }
    virtual std::string getName() const { return ""; }
    virtual IdDef* getIdDef() const { return NULL; }
    virtual std::string toString(const std::string& indent = "") = 0;
  };

  class IdRef : public Name {
  public:
    IdRef(const std::string& name) {
      name_ = name;
      id_def_ = NULL;
    }
    IdRef(const std::string& name, IdDef* id_def) {
      name_ = name;
      id_def_ = id_def;
    }
    ~IdRef() {}
  public:
    virtual bool isIdRef() const { return true; }
    virtual std::string getName() const { return name_; }
    virtual IdDef* getIdDef() const { return id_def_; }
    std::string toString(const std::string& indent = "");
  private:
    std::string name_;
    IdDef* id_def_;
  };

  class Range : public Expression {
  public:
    Range();
    Range(int range_left, int range_right);
    ~Range();
  public:
    bool isRange() const { return true; }
    std::string toString(const std::string& indent = "");
    Expression* getLeft() { return left_; }
    Expression* getRight() { return right_; }
    void setLeft(int range_left);
    void setRight(int range_right);
    unsigned int rangeWidth();
    int getMsbOfRange() const;
    int getLsbOfRange() const;
  private:
    Expression* left_; //IntVal
    Expression* right_;//IntVal
  };
}
#endif
