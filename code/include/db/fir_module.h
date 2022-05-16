//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef DB_FIRMODULE_H
#define DB_FIRMODULE_H

#include <stack>
#include <set>
#include <list>
#include "db/fir_db.h"
#include "db/fir_expression.h"
#include "db/fir_item.h"

namespace firrtlsyn {
  typedef std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*> MUX_TUPLE;

  class firDB::firModule : public firDB::firLocObj {
  public:
    firModule(ModuleType type, const std::string& id, firCircuit* circuit);
    ~firModule();
  public:
    std::string toString(std::string indent = "") {
      std::string module = "Undefine";
      if (type() == ModuleType::kModule) {
        module = "module";
      } else if (type() == ModuleType::kExtModule) {
        module = "extmodule";
      } else {
        fs_assert(0);
      }
      std::string str = indent + module + " " + id() + " : " + info() + "\n";
      for (size_t p = 0; p < ports_.size(); p++) {
        std::string s_port;
        if (ports_[p] != NULL) {
          s_port = ports_[p]->toString(indent + "  ");
        } else {
          fs_assert(0);
          s_port = "";
        }
        str += s_port + "\n";
      }
      if (defname_) {
        std::string s_defname = defname_->toString(indent + "  ");
        str += s_defname + "\n";
      }
      for (size_t p = 0; p < parameters_.size(); p++) {
        std::string s_parameter = parameters_[p]->toString(indent + "  ");
        str += s_parameter + "\n";
      }
      for (size_t s = 0; s < statements_.size(); s++) {
        std::string s_statement;
        if (statements_[s] != NULL) {
          s_statement = statements_[s]->toString(indent + "  ");
        } else {
          fs_assert(0);
          s_statement = "";
        }
        str += s_statement + "\n";
      }
      return str;
    }
    ModuleType type() const { return type_; }
    bool isModule() {
      return type() == ModuleType::kModule;
    }
    bool isExtModule() {
      return type() == ModuleType::kExtModule;
    }
    std::string id() const { return id_; }
    std::string info() const { return info_.content(); }
    void set_info(const std::string& info) { info_.set_content(info); }
    firDefName* defname() { return defname_; }
    void set_defname(const std::string& defname) {
      fs_assert(statements_.empty());
      fs_assert(isExtModule());
      if (defname_) {
        fs_warning("*WARNING*: defname: %s is changing to %s", this->defname()->value().c_str(), defname.c_str());
        defname_->set_defname(defname);
      } else {
        defname_ = new firDefName(defname);
      }
    }
    std::vector<firParameter*>& parameters() { return parameters_; }
    std::vector<firItemPort*>& ports() { return ports_; }
    firCircuit* circuit() { return circuit_; }
    std::vector<firItem*>& statements() { return statements_; }
    firLibrary* library();
    std::map<std::string, firItem*>& id_items_map() { return id_items_map_; }

    // add functions
    firParameter* addParameter(const std::string& id, const std::string& value);
    firField* addField(const char* field_id, firType* type_data, bool flip = false);
    void addStatement(firItem* statement);

    firTypeUInt* addTypeUInt(int width); //Please check the value of the width before using this function(during transfer the value of width should be bigger than 0)
    firTypeSInt* addTypeSInt(int width); //Please check the value of the width before using this function(during transfer the value of width should be bigger than 0)
    // use firTypeFixed*->set_integer_value()/binary_point() to set integer_value or binary_point
    firTypeFixed* addTypeFixed();
    // use firTypeInterval*->set_value() to set lower_bound lower_value upper_value upper_bound index
    firTypeInterval* addTypeInterval();
    firTypeClock* addTypeClock();
    firTypeAsyncReset* addTypeAsyncReset();
    firTypeReset* addTypeReset();
    firTypeAnalog* addTypeAnalog(int width);//Please check the value of the width before using this function(during transfer the value of width should be bigger than 0)
    firTypeVector* addTypeVector(int depth);
    firTypeBundle* addTypeBundle();

    firItemPort* addItemPort(const std::string& id, PortDir dir, firType* type_data);
    firItemWire* addItemWire(const std::string& id, firType* type_data);
    firItemRegister* addItemRegister(const std::string& id, firType* type_data, firExp* clock_signal, firExp* reg_reset = NULL, firExp* reg_init = NULL);
    firItemMemory* addItemMemory(const std::string& id);
    firItemMemory* addItemMemory(const std::string& id, firType* type_data, unsigned int depth, unsigned int read_latency, unsigned int write_latency, RUW read_under_write);
    firItemCMemory* addItemCMemory(const std::string& id, firType* type_data);
    firItemSMemory* addItemSMemory(const std::string& id, firType* type_data, RUW read_under_write = RUW::kRuwUndef);
    firItemMPort* addItemMPort(MPortDir dir, const std::string& mport_id, const std::string& mem_id, firExp* addr_exp, firExp* clk_exp);
    firItemInstance* addItemInstance(const std::string& inst_id, const std::string& module_id);
    firItemNode* addItemNode(const std::string& node_id, firExp* exp);
    firItemConnect* addItemConnect(firExp* connect_l, firExp* connect_r);
    firItemPartialConnect* addItemPartialConnect(firExp* connect_l, firExp* connect_r);
    firItemInvalidate* addItemInvalidate(firExp* exp);
    firItemAttach* addItemAttach();
    firItemConditional* addItemConditional();
    firItemStop* addItemStop(firExp* exp1, firExp* exp2, unsigned int exit_code);
    firItemEmpty* addItemEmpty();
    firItemPrintf* addItemPrintf(firExp* clk_signal, firExp* con_signal, const std::string& p_string);

    firExpUInt* addExpUInt(long long unsigned value, int width);
    firExpUIntBits* addExpUIntBits(const std::string& value, int width);
    firExpSInt* addExpSInt(long long int value, int width);
    firExpSIntBits* addExpSIntBits(const std::string& value, int width);
    firExpRef* addExpRef(const std::string& id);
    firExpSubfield* addExpSubfield(firExp* exp, const std::string& id);
    firExpDouble* addExpDouble(int right_side, int left_side);//FIXME: todo
    firExpSubindex* addExpSubindex(firExp* exp, int index);
    firExpSubaccess* addExpSubaccess(firExp* exp, firExp* access);
    firExpMux* addExpMux(firExp* sel, firExp* input1, firExp* input2);
    firExpValidif* addExpValidif(firExp* valid, firExp* exp);

    //add primitive operations API
    firExpPrimOperation::firAdd* addExpAdd(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firSub* addExpSub(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firMul* addExpMul(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firDiv* addExpDiv(firExp* num, firExp* den);
    firExpPrimOperation::firMod* addExpMod(firExp* num, firExp* den);
    firExpPrimOperation::firLt* addExpLt(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firLeq* addExpLeq(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firGt* addExpGt(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firGeq* addExpGeq(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firEq* addExpEq(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firNeq* addExpNeq(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firPad* addExpPad(firExp* exp, unsigned int n);
    firExpPrimOperation::firAsUInt* addExpAsUInt(firExp* exp);
    firExpPrimOperation::firAsSInt* addExpAsSInt(firExp* exp);
    firExpPrimOperation::firAsClock* addExpAsClock(firExp* exp);
    firExpPrimOperation::firAsFixed* addExpAsFixed(firExp* exp, int binary_point);
    firExpPrimOperation::firAsAsyncReset* addExpAsAsyncReset(firExp* exp);
    firExpPrimOperation::firAsInterval* addExpAsInterval(firExp* exp, int left, int right, unsigned int bit_width);
    firExpPrimOperation::firShl* addExpShl(firExp* exp, unsigned int n);
    firExpPrimOperation::firShr* addExpShr(firExp* exp, unsigned int n);
    firExpPrimOperation::firDshl* addExpDshl(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firDshr* addExpDshr(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firCvt* addExpCvt(firExp* exp);
    firExpPrimOperation::firNeg* addExpNeg(firExp* exp);
    firExpPrimOperation::firNot* addExpNot(firExp* exp);
    firExpPrimOperation::firAnd* addExpAnd(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firOr* addExpOr(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firXor* addExpXor(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firAndr* addExpAndr(firExp* exp);
    firExpPrimOperation::firOrr* addExpOrr(firExp* exp);
    firExpPrimOperation::firXorr* addExpXorr(firExp* exp);
    firExpPrimOperation::firCat* addExpCat(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firBits* addExpBits(firExp* exp, unsigned int hi, unsigned int lo);
    firExpPrimOperation::firHead* addExpHead(firExp* exp, unsigned int n);
    firExpPrimOperation::firTail* addExpTail(firExp* exp, unsigned int n);
    firExpPrimOperation::firIncp* addExpIncp(firExp* exp, unsigned int n);
    firExpPrimOperation::firDecp* addExpDecp(firExp* exp, unsigned int n);
    firExpPrimOperation::firSetp* addExpSetp(firExp* exp, unsigned int n);
    firExpPrimOperation::firWrap* addExpWrap(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firClip* addExpClip(firExp* exp1, firExp* exp2);
    firExpPrimOperation::firSquz* addExpSquz(firExp* exp1, firExp* exp2);
    // find functions
    firParameter* findParameterById(const std::string& id);
    firItem* findItemById(const std::string& item_id, firItemConditional* domain = NULL);
    // FIXME:mport will be defined in conditional statement because the mask/enable signal will transfer
    // Chisel to a conditional statement in firrtl, but this is uncorrect! mport.mask/en should be
    // used to connect an expression as mport's mask/en signal
    firItem* findMPortInStmts(const std::string& item_id, firItemConditional* domain);
    firItem* findItemExceptMPort(const std::string& item_id, firItemConditional* domain);
    firItem* findItemByExpression(firExp* exp, firItemConditional* domain = NULL);
    firType* getOriginTypeByExpression(firExp* exp, firItemConditional* domain = NULL);
    firType* getItemType(firItem* item, firItemConditional* domain = NULL);
    firType* getItemTypeById(const std::string& item_id, firItemConditional* domain = NULL);
    firExp* getItemExpVal(firItem* item, firItemConditional* domain = NULL);
    firExp* getItemExpValById(const std::string& item_id, firItemConditional* domain = NULL);

    //copy API
    firType* copyType(firType* type);
    firItem* copyItem(firItem* item);
    firExp* copyExpression(firExp* expression);

  private:
    void addLocTypeData(firType* type_data);
    void addLocItem(firItem* item);
    void addLocExpression(firExp* expression);
    firType* getTypeTypeDataByExpressionSequence(firType* type, std::list<firExp*>& exp_list);

  private:
    ModuleType type_;
    std::string id_;
    firInfo info_;
    firCircuit* circuit_;
    std::vector<firItemPort*> ports_;
    std::vector<firItem*> statements_;
    firDefName* defname_;
    std::vector<firParameter*> parameters_;

    std::map<std::string, firItem*> id_items_map_;
    std::map<std::string, firParameter*> id_parameters_map_;
    std::vector<firItem*> loc_items_;
    std::vector<firType*> loc_types_;
    std::vector<firExp*> loc_expressions_;
    std::vector<firField*> loc_fields_;
  };

}
#endif