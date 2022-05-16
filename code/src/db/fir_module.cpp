//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************
#include <cmath>
#include <algorithm>
#include "db/fir_module.h"
#include "db/fir_circuit.h"
#include "utility/utility.h"
#include "utility/exception.h"

namespace firrtlsyn {

  firDB::firModule::firModule(ModuleType type, const std::string& id, firCircuit* circuit) {
    type_ = type;
    id_ = id;
    info_ = firInfo();
    circuit_ = circuit;
    defname_ = NULL;
  }
  firDB::firModule::~firModule() {
    if (defname_) delete defname_;
    defname_ = NULL;
    for (size_t p = 0; p < parameters_.size(); p++) {
      if (parameters_[p]) delete parameters_[p];
      parameters_[p] = NULL;
    }
    parameters_.clear();
    for (size_t l = 0; l < loc_items_.size(); l++) {
      if (loc_items_[l]) delete loc_items_[l];
      loc_items_[l] = NULL;
    }
    loc_items_.clear();
    for (size_t l = 0; l < loc_types_.size(); l++) {
      if (loc_types_[l]) delete loc_types_[l];
      loc_types_[l] = NULL;
    }
    loc_types_.clear();
    for (size_t l = 0; l < loc_expressions_.size(); l++) {
      if (loc_expressions_[l]) delete loc_expressions_[l];
      loc_expressions_[l] = NULL;
    }
    loc_expressions_.clear();
    for (size_t l = 0; l < loc_fields_.size(); l++) {
      if (loc_fields_[l]) delete loc_fields_[l];
      loc_fields_[l] = NULL;
    }
    loc_fields_.clear();

    circuit_ = NULL;
    ports_.clear();
    statements_.clear();
    id_items_map_.clear();
  }
  firDB::firLibrary* firDB::firModule::library() {
    return circuit()->library();
  }
  firDB::firParameter* firDB::firModule::findParameterById(const std::string& id) {
    fs_assert(statements_.empty());
    fs_assert(isExtModule());
    auto iter = id_parameters_map_.find(id);
    if (iter != id_parameters_map_.end()) {
      return iter->second;
    } else {
      fs_debug("*DEBUG*: Could not find parameter '%s' in ExtModule '%s'.\n", id.c_str(), this->id().c_str());
      return NULL;
    }
  }
  firDB::firParameter* firDB::firModule::addParameter(const std::string& id, const std::string& value) {
    fs_assert(statements_.empty());
    fs_assert(isExtModule());
    firParameter* parameter = findParameterById(id);
    if (parameter != NULL) {
      fs_warning("*WARNING*: \"Parameter '%s' : '%s'\" has existed in ExtModule '%s'.\n", parameter->id().c_str(), parameter->value().c_str(), this->id().c_str());
      parameter->set_value(value);
      fs_warning("*WARNING*: \"Parameter '%s' : '%s'\" in ExtModule '%s' is changing to \"Parameter '%s' : '%s'\".\n", parameter->id().c_str(), parameter->value().c_str(), this->id().c_str(), id.c_str(), value.c_str());
    } else {
      parameter = new firParameter(id, value);
      parameters_.push_back(parameter);
      id_parameters_map_.insert(std::make_pair(id, parameter));
    }
    return parameter;
  }
  firDB::firField* firDB::firModule::addField(const char* field_id, firType* type_data, bool flip) {
    firField* field = new firField(field_id, type_data, flip);
    loc_fields_.push_back(field);
    return field;
  }
  firDB::firItem* firDB::firModule::findItemById(const std::string& item_id, firItemConditional* domain){
    firItem* item = findItemExceptMPort(item_id, domain);
    if (item != NULL) return item;
    item = findMPortInStmts(item_id, domain);
    if (item == NULL) return NULL;
    firItemMPort* mport = dynamic_cast<firItemMPort*>(item);
    fs_assert(mport != NULL);
    //fs_assert(findItemExceptMPort(mport->mem_id(), domain) != NULL);
    return mport;
  }
  firDB::firItem* firDB::firModule::findItemExceptMPort(const std::string& item_id, firItemConditional* domain) {
    if (domain == NULL) {
      auto iter = id_items_map_.find(item_id);
      if (iter != id_items_map_.end()) {
        return iter->second;
      } else {
        return NULL;
      }
    } else {
      firItem* item = domain->findItemById(item_id);
      if (item != NULL) {
        return item;
      } else {
        return findItemExceptMPort(item_id, domain->parent());
      }
    }
  }
  firDB::firItem* firDB::firModule::findMPortInStmts(const std::string& item_id, firItemConditional* domain) {
    if (domain == NULL) {
      for (size_t s = 0; s < statements_.size(); s++) {
        if (!statements_[s]->isConditionalItem()) continue;
        firItem* mport = dynamic_cast<firItemConditional*>(statements_[s])->findItemById(item_id);
        if (mport == NULL) continue;
        fs_assert(mport->isMPortItem());
        return mport;
      }
      return NULL;
    } else {
      firItem* mport = domain->findMPortInStmts(item_id);
      if (mport == NULL) {
        firItemConditional* domain_parent = domain->parent();
        if (domain_parent == NULL) {
          mport = this->findMPortInStmts(item_id, NULL);
        } else {
          mport = domain_parent->findMPortInStmts(item_id);
        }
      }
      return mport;
    }
  }
  void firDB::firModule::addLocExpression(firExp* expression) {
    loc_expressions_.push_back(expression);
  }
  void firDB::firModule::addLocTypeData(firType* type_data) {
    loc_types_.push_back(type_data);
  }
  void firDB::firModule::addLocItem(firItem* item) {
    loc_items_.push_back(item);
  }
  firDB::firTypeUInt* firDB::firModule::addTypeUInt(int width) {
    fs_assert(width >= -1);
    firTypeUInt* utype = new firTypeUInt(width);
    addLocTypeData(utype);
    return utype;
  }
  firDB::firTypeSInt* firDB::firModule::addTypeSInt(int width) {
    fs_assert(width >= -1);
    firTypeSInt* stype = new firTypeSInt(width);
    addLocTypeData(stype);
    return stype;
  }
  firDB::firTypeFixed* firDB::firModule::addTypeFixed() {
    firTypeFixed* ftype = new firTypeFixed();
    addLocTypeData(ftype);
    return ftype;
  }
  firDB::firTypeInterval* firDB::firModule::addTypeInterval() {
    firTypeInterval* itype = new firTypeInterval();
    addLocTypeData(itype);
    return itype;
  }
  firDB::firTypeClock* firDB::firModule::addTypeClock() {
    firTypeClock* ctype = new firTypeClock();
    addLocTypeData(ctype);
    return ctype;
  }
  firDB::firTypeAsyncReset* firDB::firModule::addTypeAsyncReset() {
    firTypeAsyncReset* atype = new firTypeAsyncReset();
    addLocTypeData(atype);
    return atype;
  }
  firDB::firTypeReset* firDB::firModule::addTypeReset() {
    firTypeReset* rtype = new firTypeReset();
    addLocTypeData(rtype);
    return rtype;
  }
  firDB::firTypeAnalog* firDB::firModule::addTypeAnalog(int width) {
    fs_assert(width >= -1);
    firTypeAnalog* atype = new firTypeAnalog(width);
    addLocTypeData(atype);
    return atype;
  }
  firDB::firTypeVector* firDB::firModule::addTypeVector(int depth) {
    fs_assert(depth >= 0);
    firTypeVector* vtype = new firTypeVector(static_cast<unsigned int>(depth));
    addLocTypeData(vtype);
    return vtype;
  }
  firDB::firTypeBundle* firDB::firModule::addTypeBundle() {
    firTypeBundle* btype = new firTypeBundle();
    addLocTypeData(btype);
    return btype;
  }
  void firDB::firModule::addStatement(firItem* statement) {
    //module->removeStatement(statement);
    switch (statement->type()) {
    case ItemType::kItemWire: {
      firItemWire* wire = dynamic_cast<firItemWire*>(statement);
      if (findItemExceptMPort(wire->id(), NULL) != NULL) {
        throw Exception("The Wire had already been defined.");
      }
      fs_assert(wire->type_data() != NULL);
      id_items_map_.insert(std::make_pair(wire->id(), wire));
      break;
    }
    case ItemType::kItemNode: {
      firItemNode* node = dynamic_cast<firItemNode*>(statement);
      if (findItemExceptMPort(node->id(), NULL) != NULL) {
        throw Exception("The Node had already been defined.");
      }
      id_items_map_.insert(std::make_pair(node->id(), node));
      break;
    }
    case ItemType::kItemInstance: {
      firItemInstance* instance = dynamic_cast<firItemInstance*>(statement);
      if (findItemExceptMPort(instance->inst_id(), NULL) != NULL) {
        throw Exception("The Instance had already been defined.");
      }
      id_items_map_.insert(std::make_pair(instance->inst_id(), instance));
      break;
    }
    case ItemType::kItemRegister: {
      firItemRegister* reg = dynamic_cast<firItemRegister*>(statement);
      if (findItemExceptMPort(reg->id(), NULL) != NULL) {
        throw Exception("The Register had already been defined.");
      }
      id_items_map_.insert(std::make_pair(reg->id(), reg));
      break;
    }
    case ItemType::kItemMemory: {
      firItemMemory* mem = dynamic_cast<firItemMemory*>(statement);
      if (findItemExceptMPort(mem->id(), NULL) != NULL) {
        throw Exception("The Memory had already been defined.");
      }
      id_items_map_.insert(std::make_pair(mem->id(), mem));
      break;
    }
    case ItemType::kItemCMemory: {
      firItemCMemory* cmem = dynamic_cast<firItemCMemory*>(statement);
      if (findItemExceptMPort(cmem->id(), NULL) != NULL) {
        throw Exception("The CMemory had already been defined.");
      }
      id_items_map_.insert(std::make_pair(cmem->id(), cmem));
      break;
    }
    case ItemType::kItemSMemory: {
      firItemSMemory* smem = dynamic_cast<firItemSMemory*>(statement);
      if (findItemExceptMPort(smem->id(), NULL) != NULL) {
        throw Exception("The SMemory had already been defined.");
      }
      id_items_map_.insert(std::make_pair(smem->id(), smem));
      break;
    }
    case ItemType::kItemMPort: {
      firItemMPort* mport = dynamic_cast<firItemMPort*>(statement);
      if (findItemExceptMPort(mport->mport_id(), NULL) != NULL) {
        throw Exception("The MPort had already been defined.");
      }
      firItem* memory = findItemExceptMPort(mport->mem_id(), NULL);
      if (memory == NULL) {
        fs_error("*ERROR*: Could not find the memory with ID '%s'. Use the correct memory ID for MPort and rerun.\n", mport->mem_id().c_str());
        fs_assert(0);
      } else if (!(memory->isCMemoryItem() || memory->isMemoryItem() || memory->isSMemoryItem())) {
        fs_error("*ERROR*: The memory with ID '%s' is not a correct memory type. Use the correct memory ID for MPort and rerun.\n", mport->mem_id().c_str());
        fs_assert(0);
      }
      id_items_map_.insert(std::make_pair(mport->mport_id(), mport));
      break;
    }
    default: {
      break;
    }
    }
    statements_.push_back(statement);
  }
  firDB::firItemPort* firDB::firModule::addItemPort(const std::string& id, PortDir dir, firType* type_data) {
    if (findItemExceptMPort(id, NULL) != NULL) {
      throw Exception("The Port had already been defined.");
    }
    fs_assert(type_data != NULL);
    fs_assert(dir == PortDir::kPortDirInput || dir == PortDir::kPortDirOutput);
    firItemPort* port = new firItemPort(id, dir, type_data);
    ports_.push_back(port);
    addLocItem(port);
    id_items_map_.insert(std::make_pair(id, port));
    return port;
  }
  firDB::firItemWire* firDB::firModule::addItemWire(const std::string& id, firType* type_data) {
    fs_assert(type_data != NULL);
    firItemWire* wire = new firItemWire(id, type_data);
    addLocItem(wire);
    return wire;
  }
  firDB::firItemRegister* firDB::firModule::addItemRegister(const std::string& id, firType* type_data, firExp* clock_signal, firExp* reg_reset, firExp* reg_init) {
    fs_assert(type_data != NULL);
    firItemRegister* reg = new firItemRegister(id, type_data, clock_signal, reg_reset, reg_init);
    addLocItem(reg);
    return reg;
  }
  firDB::firItemMemory* firDB::firModule::addItemMemory(const std::string& id, firType* type_data, unsigned int depth, unsigned int read_latency, unsigned int write_latency, RUW read_under_write) {
    fs_assert(type_data != NULL);
    firItemMemory* memory = new firItemMemory(id, type_data, depth, read_latency, write_latency, read_under_write);
    addLocItem(memory);
    return memory;
  }
  firDB::firItemMemory* firDB::firModule::addItemMemory(const std::string& id) {
    firItemMemory* memory = new firItemMemory(id);
    addLocItem(memory);
    return memory;
  }
  firDB::firItemCMemory* firDB::firModule::addItemCMemory(const std::string& id, firType* type_data) {
    fs_assert(type_data != NULL);
    firItemCMemory* cmemory = new firItemCMemory(id, type_data);
    addLocItem(cmemory);
    return cmemory;
  }
  firDB::firItemSMemory* firDB::firModule::addItemSMemory(const std::string& id, firType* type_data, RUW read_under_write) {
    fs_assert(type_data != NULL);
    firItemSMemory* smemory = new firItemSMemory(id, type_data, read_under_write);
    addLocItem(smemory);
    return smemory;
  }
  firDB::firItemMPort* firDB::firModule::addItemMPort(MPortDir dir, const std::string& mport_id, const std::string& mem_id, firExp* addr_exp, firExp* clk_exp) {
    firItemMPort* mport = new firItemMPort(dir, mport_id, mem_id, addr_exp, clk_exp);
    addLocItem(mport);
    return mport;
  }
  firDB::firItemInstance* firDB::firModule::addItemInstance(const std::string& inst_id, const std::string& module_id) {
    firItemInstance* instance = new firItemInstance(inst_id, module_id);
    addLocItem(instance);
    return instance;
  }
  firDB::firItemNode* firDB::firModule::addItemNode(const std::string& node_id, firExp* exp) {
    firItemNode* node = new firItemNode(node_id, exp);
    addLocItem(node);
    return node;
  }
  firDB::firItemConnect* firDB::firModule::addItemConnect(firExp* connect_l, firExp* connect_r) {
    //type and width check will be done later
    firItemConnect* connect = new firItemConnect(connect_l, connect_r);
    addLocItem(connect);
    return connect;
  }
  firDB::firItemPartialConnect* firDB::firModule::addItemPartialConnect(firExp* connect_l, firExp* connect_r) {
    //type and width check will be done later
    firItemPartialConnect* partialconnect = new firItemPartialConnect(connect_l, connect_r);
    addLocItem(partialconnect);
    return partialconnect;
  }
  firDB::firItemInvalidate* firDB::firModule::addItemInvalidate(firExp* exp) {
    //type check will be done later
    firItemInvalidate* invalidate = new firItemInvalidate(exp);
    addLocItem(invalidate);
    return invalidate;
  }
  firDB::firItemAttach* firDB::firModule::addItemAttach() {
    firItemAttach* attach = new firItemAttach();
    addLocItem(attach);
    return attach;
  }
  firDB::firItemConditional* firDB::firModule::addItemConditional() {
    firItemConditional* condition = new firItemConditional();
    addLocItem(condition);
    return condition;
  }
  firDB::firItemStop* firDB::firModule::addItemStop(firExp* exp1, firExp* exp2, unsigned int exit_code) {
    firItemStop* stop = new firItemStop(exp1, exp2, exit_code);
    addLocItem(stop);
    return stop;
  }
  firDB::firItemEmpty* firDB::firModule::addItemEmpty() {
    firItemEmpty* empty = new firItemEmpty();
    addLocItem(empty);
    return empty;
  }
  firDB::firItemPrintf* firDB::firModule::addItemPrintf(firExp* clk_signal, firExp* con_signal, const std::string& p_string) {
    firItemPrintf* printf = new firItemPrintf(clk_signal, con_signal, p_string);
    addLocItem(printf);
    return printf;
  }
  firDB::firExpUInt* firDB::firModule::addExpUInt(long long unsigned value, int width) {
    // the width may be not specified in the expression, such as UInt(7)
    if (width < 0) {
      fs_error("*ERROR*: The width (%d) was invalid for 'UInt' expression.\n", width);
      fs_assert(0);
      return NULL;
    }
    size_t max_width = sizeof(unsigned long long *) * 8;
    if (width >= 1 && width < (int)max_width) {
      unsigned long long range_max = 1ULL << width;
      if (range_max <= value) {
        fs_error("*ERROR*: The value (%llu) was out of range for 'UInt' expression with width %d.\n", value, width);
        fs_assert(0);
        return NULL;
      }
    }
    firExpUInt* uint = new firExpUInt(value, width);
    addLocExpression(uint);
    return uint;
  }
  firDB::firExpUIntBits* firDB::firModule::addExpUIntBits(const std::string& value, int width) {
    if (width < 0) {
      fs_error("*ERROR*: The width (%d) was invalid for 'UInt bits' expression.\n", width);
      fs_assert(0);
      return NULL;
    }
    if (width > 1) {
      BigInt o_big(value, false);
      if (o_big.getMinBinaryWidth() > width) {
        fs_error("*ERROR*: The width (%d) was not big enough to store the value.\n", width);
        return NULL;
      }
    }
    firExpUIntBits* uintbits = new firExpUIntBits(value, width);
    addLocExpression(uintbits);
    return uintbits;
  }
  firDB::firExpSInt* firDB::firModule::addExpSInt(long long int value, int width) {
    // the width may be not specified in the expression, such as SInt(8)
    if (width < 0) {
      fs_error("*ERROR*: The width (%d) was invalid for 'SInt' expression.\n", width);
      fs_assert(0);
      return NULL;
    }
    size_t max_width = sizeof(long long *) * 8;
    if (width >= 1 && width < (int)max_width) {
      long long range_max = (1LL << (width - 1));
      if (range_max <= value) {
        fs_error("*ERROR*: The value (%lld) was out of range for 'SInt' expression with width %d.\n", value, width);
        fs_assert(0);
        return NULL;
      }
    }
    firExpSInt* sint = new firExpSInt(value, width);
    addLocExpression(sint);
    return sint;
  }
  firDB::firExpSIntBits* firDB::firModule::addExpSIntBits(const std::string& value, int width) {
    if (width < 0) {
      fs_error("*ERROR*: The width (%d) was invalid for 'SInt bits' expression.\n", width);
      fs_assert(0);
      return NULL;
    }
    if (width > 0) {
      BigInt o_big(value, true);
      if (o_big.getMinBinaryWidth() > width) {
        fs_error("*ERROR*: The width (%d) was not big enough to store the value.\n", width);
        return NULL;
      }
    }
    firExpSIntBits* sintbits = new firExpSIntBits(value, width);
    addLocExpression(sintbits);
    return sintbits;
  }
  firDB::firExpRef* firDB::firModule::addExpRef(const std::string& id) {
    firExpRef* ref = new firExpRef(id);
    addLocExpression(ref);
    return ref;
  }
  firDB::firExpSubfield* firDB::firModule::addExpSubfield(firExp* exp, const std::string& id) {
    firExpSubfield* subfield = new firExpSubfield(exp, id);
    addLocExpression(subfield);
    return subfield;
  }
  firDB::firExpDouble* firDB::firModule::addExpDouble(int right_side, int left_side) {
    firExpDouble* firdouble = new firExpDouble(left_side, right_side);
    addLocExpression(firdouble);
    return firdouble;
  }
  firDB::firExpSubindex* firDB::firModule::addExpSubindex(firExp* exp, int index) {
    firExpSubindex* subindex = new firExpSubindex(exp, index);
    addLocExpression(subindex);
    return subindex;
  }
  firDB::firExpSubaccess* firDB::firModule::addExpSubaccess(firExp* exp, firExp* access) {
    firExpSubaccess* subaccess = new firExpSubaccess(exp, access);
    addLocExpression(subaccess);
    return subaccess;
  }
  firDB::firExpMux* firDB::firModule::addExpMux(firExp* sel, firExp* input1, firExp* input2) {
    firExpMux* mux = new firExpMux(sel, input1, input2);
    addLocExpression(mux);
    return mux;
  }
  firDB::firExpValidif* firDB::firModule::addExpValidif(firExp* valid, firExp* exp) {
    firExpValidif* validif = new firExpValidif(valid, exp);
    addLocExpression(validif);
    return validif;
  }

  firDB::firExpPrimOperation::firAdd* firDB::firModule::addExpAdd(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firAdd* add = new firExpPrimOperation::firAdd(exp1, exp2);
    addLocExpression(add);
    return add;
  }
  firDB::firExpPrimOperation::firSub* firDB::firModule::addExpSub(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firSub* sub = new firExpPrimOperation::firSub(exp1, exp2);
    addLocExpression(sub);
    return sub;
  }
  firDB::firExpPrimOperation::firMul* firDB::firModule::addExpMul(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firMul* mul = new firExpPrimOperation::firMul(exp1, exp2);
    addLocExpression(mul);
    return mul;
  }
  firDB::firExpPrimOperation::firDiv* firDB::firModule::addExpDiv(firExp* num, firExp* den) {
    firExpPrimOperation::firDiv* div = new firExpPrimOperation::firDiv(num, den);
    addLocExpression(div);
    return div;
  }
  firDB::firExpPrimOperation::firMod* firDB::firModule::addExpMod(firExp* num, firExp* den) {
    firExpPrimOperation::firMod* mod = new firExpPrimOperation::firMod(num, den);
    addLocExpression(mod);
    return mod;
  }
  firDB::firExpPrimOperation::firLt* firDB::firModule::addExpLt(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firLt* lt = new firExpPrimOperation::firLt(exp1, exp2);
    addLocExpression(lt);
    return lt;
  }
  firDB::firExpPrimOperation::firLeq* firDB::firModule::addExpLeq(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firLeq* leq = new firExpPrimOperation::firLeq(exp1, exp2);
    addLocExpression(leq);
    return leq;
  }
  firDB::firExpPrimOperation::firGt* firDB::firModule::addExpGt(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firGt* gt = new firExpPrimOperation::firGt(exp1, exp2);
    addLocExpression(gt);
    return gt;
  }
  firDB::firExpPrimOperation::firGeq* firDB::firModule::addExpGeq(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firGeq* geq = new firExpPrimOperation::firGeq(exp1, exp2);
    addLocExpression(geq);
    return geq;
  }
  firDB::firExpPrimOperation::firEq* firDB::firModule::addExpEq(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firEq* eq = new firExpPrimOperation::firEq(exp1, exp2);
    addLocExpression(eq);
    return eq;
  }
  firDB::firExpPrimOperation::firNeq* firDB::firModule::addExpNeq(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firNeq* neq = new firExpPrimOperation::firNeq(exp1, exp2);
    addLocExpression(neq);
    return neq;
  }
  firDB::firExpPrimOperation::firPad* firDB::firModule::addExpPad(firExp* exp, unsigned int n) {
    firExpPrimOperation::firPad* pad = new firExpPrimOperation::firPad(exp, n);
    addLocExpression(pad);
    return pad;
  }
  firDB::firExpPrimOperation::firAsUInt* firDB::firModule::addExpAsUInt(firExp* exp) {
    firExpPrimOperation::firAsUInt* asuint = new firExpPrimOperation::firAsUInt(exp);
    addLocExpression(asuint);
    return asuint;
  }
  firDB::firExpPrimOperation::firAsSInt* firDB::firModule::addExpAsSInt(firExp* exp) {
    firExpPrimOperation::firAsSInt* assint = new firExpPrimOperation::firAsSInt(exp);
    addLocExpression(assint);
    return assint;
  }
  firDB::firExpPrimOperation::firAsClock* firDB::firModule::addExpAsClock(firExp* exp) {
    firExpPrimOperation::firAsClock* asclock = new firExpPrimOperation::firAsClock(exp);
    addLocExpression(asclock);
    return asclock;
  }
  firDB::firExpPrimOperation::firAsFixed* firDB::firModule::addExpAsFixed(firExp* exp, int binary_point) {
    firExpPrimOperation::firAsFixed* asfixed = new firExpPrimOperation::firAsFixed(exp, binary_point);
    addLocExpression(asfixed);
    return asfixed;
  }
  firDB::firExpPrimOperation::firAsAsyncReset* firDB::firModule::addExpAsAsyncReset(firExp* exp) {
    firExpPrimOperation::firAsAsyncReset* asasyncreset = new firExpPrimOperation::firAsAsyncReset(exp);
    addLocExpression(asasyncreset);
    return asasyncreset;
  }
  firDB::firExpPrimOperation::firAsInterval* firDB::firModule::addExpAsInterval(firExp* exp, int left, int right, unsigned int bit_width) {
    firExpPrimOperation::firAsInterval* asinterval = new firExpPrimOperation::firAsInterval(exp, left, right, bit_width);
    addLocExpression(asinterval);
    return asinterval;
  }
  firDB::firExpPrimOperation::firShl* firDB::firModule::addExpShl(firExp* exp, unsigned int n) {
    firExpPrimOperation::firShl* shl = new firExpPrimOperation::firShl(exp, n);
    addLocExpression(shl);
    return shl;
  }
  firDB::firExpPrimOperation::firShr* firDB::firModule::addExpShr(firExp* exp, unsigned int n) {
    firExpPrimOperation::firShr* shr = new firExpPrimOperation::firShr(exp, n);
    addLocExpression(shr);
    return shr;
  }
  firDB::firExpPrimOperation::firDshl* firDB::firModule::addExpDshl(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firDshl* dshl = new firExpPrimOperation::firDshl(exp1, exp2);
    addLocExpression(dshl);
    return dshl;
  }
  firDB::firExpPrimOperation::firDshr* firDB::firModule::addExpDshr(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firDshr* dshr = new firExpPrimOperation::firDshr(exp1, exp2);
    addLocExpression(dshr);
    return dshr;
  }
  firDB::firExpPrimOperation::firCvt* firDB::firModule::addExpCvt(firExp* exp) {
    firExpPrimOperation::firCvt* cvt = new firExpPrimOperation::firCvt(exp);
    addLocExpression(cvt);
    return cvt;
  }
  firDB::firExpPrimOperation::firNeg* firDB::firModule::addExpNeg(firExp* exp) {
    firExpPrimOperation::firNeg* neg = new firExpPrimOperation::firNeg(exp);
    addLocExpression(neg);
    return neg;
  }
  firDB::firExpPrimOperation::firNot* firDB::firModule::addExpNot(firExp* exp) {
    firExpPrimOperation::firNot* prim_not = new firExpPrimOperation::firNot(exp);
    addLocExpression(prim_not);
    return prim_not;
  }
  firDB::firExpPrimOperation::firAnd* firDB::firModule::addExpAnd(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firAnd* prim_and = new firExpPrimOperation::firAnd(exp1, exp2);
    addLocExpression(prim_and);
    return prim_and;
  }
  firDB::firExpPrimOperation::firOr* firDB::firModule::addExpOr(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firOr* prim_or = new firExpPrimOperation::firOr(exp1, exp2);
    addLocExpression(prim_or);
    return prim_or;
  }
  firDB::firExpPrimOperation::firXor* firDB::firModule::addExpXor(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firXor* prim_xor = new firExpPrimOperation::firXor(exp1, exp2);
    addLocExpression(prim_xor);
    return prim_xor;
  }
  firDB::firExpPrimOperation::firAndr* firDB::firModule::addExpAndr(firExp* exp) {
    firExpPrimOperation::firAndr* andr = new firExpPrimOperation::firAndr(exp);
    addLocExpression(andr);
    return andr;
  }
  firDB::firExpPrimOperation::firOrr* firDB::firModule::addExpOrr(firExp* exp) {
    firExpPrimOperation::firOrr* orr = new firExpPrimOperation::firOrr(exp);
    addLocExpression(orr);
    return orr;
  }
  firDB::firExpPrimOperation::firXorr* firDB::firModule::addExpXorr(firExp* exp) {
    firExpPrimOperation::firXorr* xorr = new firExpPrimOperation::firXorr(exp);
    addLocExpression(xorr);
    return xorr;
  }
  firDB::firExpPrimOperation::firCat* firDB::firModule::addExpCat(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firCat* cat = new firExpPrimOperation::firCat(exp1, exp2);
    addLocExpression(cat);
    return cat;
  }
  firDB::firExpPrimOperation::firBits* firDB::firModule::addExpBits(firExp* exp, unsigned int hi, unsigned int lo) {
    firExpPrimOperation::firBits* bits = new firExpPrimOperation::firBits(exp, hi, lo);
    addLocExpression(bits);
    return bits;
  }
  firDB::firExpPrimOperation::firHead* firDB::firModule::addExpHead(firExp* exp, unsigned int n) {
    firExpPrimOperation::firHead* head = new firExpPrimOperation::firHead(exp, n);
    addLocExpression(head);
    return head;
  }
  firDB::firExpPrimOperation::firTail* firDB::firModule::addExpTail(firExp* exp, unsigned int n) {
    firExpPrimOperation::firTail* tail = new firExpPrimOperation::firTail(exp, n);
    addLocExpression(tail);
    return tail;
  }
  firDB::firExpPrimOperation::firIncp* firDB::firModule::addExpIncp(firExp* exp, unsigned int n) {
    firExpPrimOperation::firIncp* incp = new firExpPrimOperation::firIncp(exp, n);
    addLocExpression(incp);
    return incp;
  }
  firDB::firExpPrimOperation::firDecp* firDB::firModule::addExpDecp(firExp* exp, unsigned int n) {
    firExpPrimOperation::firDecp* decp = new firExpPrimOperation::firDecp(exp, n);
    addLocExpression(decp);
    return decp;
  }
  firDB::firExpPrimOperation::firSetp* firDB::firModule::addExpSetp(firExp* exp, unsigned int n) {
    firExpPrimOperation::firSetp* setp = new firExpPrimOperation::firSetp(exp, n);
    addLocExpression(setp);
    return setp;
  }
  firDB::firExpPrimOperation::firWrap* firDB::firModule::addExpWrap(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firWrap* wrap = new firExpPrimOperation::firWrap(exp1, exp2);
    addLocExpression(wrap);
    return wrap;
  }
  firDB::firExpPrimOperation::firClip* firDB::firModule::addExpClip(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firClip* clip = new firExpPrimOperation::firClip(exp1, exp2);
    addLocExpression(clip);
    return clip;
  }
  firDB::firExpPrimOperation::firSquz* firDB::firModule::addExpSquz(firExp* exp1, firExp* exp2) {
    firExpPrimOperation::firSquz* squz = new firExpPrimOperation::firSquz(exp1, exp2);
    addLocExpression(squz);
    return squz;
  }

  firDB::firType* firDB::firModule::copyType(firType* type) {
    if (type == NULL) return NULL;
    firType* result = NULL;
    switch (type->type()) {
    case Type::kTypeUInt: {
      firTypeUInt* utype = dynamic_cast<firTypeUInt*>(type);
      int width = -1;
      if (utype->valid_width()) {
        width = utype->width();
      } else {
        width = utype->invalid_width();
      }
      result = addTypeUInt(width);
      break;
    }
    case Type::kTypeSInt: {
      firTypeSInt* stype = dynamic_cast<firTypeSInt*>(type);
      int width = -1;
      if (stype->valid_width()) {
        width = stype->width();
      } else {
        width = stype->invalid_width();
      }
      result = addTypeSInt(width);
      break;
    }
    case Type::kTypeFixed: {
      firTypeFixed* ftype = dynamic_cast<firTypeFixed*>(type);
      firTypeFixed* new_fixed = addTypeFixed();
      if (ftype->valid_width()) new_fixed->set_width(ftype->width());
      if (ftype->valid_binary()) new_fixed->set_binary_point(ftype->binary_point());
      result = new_fixed;
      break;
    }
    case Type::kTypeInterval: {
      firTypeInterval* itype = dynamic_cast<firTypeInterval*>(type);
      firTypeInterval* new_interval = addTypeInterval();
      if (itype->valid_binary())
        new_interval->set_value(itype->binary());
      if (itype->valid_lower_value() && itype->valid_upper_value()) {
        new_interval->set_value(itype->lower_bound(), itype->lower_value(), itype->upper_value(), itype->upper_bound());
      } else if (itype->valid_lower_value() && !itype->valid_upper_value()) {
        new_interval->set_value(itype->lower_bound(), itype->lower_value(), '?', itype->upper_bound());
      } else if (!itype->valid_lower_value() && itype->valid_upper_value()) {
        new_interval->set_value(itype->lower_bound(), '?', itype->upper_value(), itype->upper_bound());
      } else if (!itype->valid_lower_value() && !itype->valid_upper_value()) {
        new_interval->set_value(itype->lower_bound(), '?', '?', itype->upper_bound());
      }
      result = new_interval;
      break;
    }
    case Type::kTypeClock: {
      result = addTypeClock();
      break;
    }
    case Type::kTypeAsyncReset: {
      result = addTypeAsyncReset();
      break;
    }
    case Type::kTypeReset: {
      result = addTypeReset();
      break;
    }
    case Type::kTypeAnalog: {
      firTypeAnalog* atype = dynamic_cast<firTypeAnalog*>(type);
      int width = -1;
      if (atype->valid_width()) {
        width = atype->width();
      } else {
        width = atype->invalid_width();
      }
      result = addTypeAnalog(width);
      break;
    }
    case Type::kTypeVector: {
      firTypeVector* vtype = dynamic_cast<firTypeVector*>(type);
      firTypeVector* new_vector = addTypeVector(vtype->depth());
      new_vector->set_type_data(copyType(vtype->type_data()));
      result = new_vector;
      break;
    }
    case Type::kTypeBundle: {
      firTypeBundle* btype = dynamic_cast<firTypeBundle*>(type);
      firTypeBundle* new_bundle = addTypeBundle();
      //std::vector<std::tuple<std::string, firType*, bool>>& types = btype->type_datas();
      std::vector<firField*>& types = btype->type_datas();
      for (size_t t = 0; t < types.size(); t++) {
        //new_bundle->addTypeData(copyType(std::get<1>(types[t])), std::get<0>(types[t]), std::get<2>(types[t]));
        firField* new_field = addField(types[t]->field_id().c_str(), copyType(types[t]->type_data()), types[t]->flip());
        new_bundle->addTypeData(new_field);
      }
      result = new_bundle;
      break;
    }
    default: {
      fs_assert(0);
      break;
    }
    }
    return result;
  }
  firDB::firItem* firDB::firModule::copyItem(firItem* item) {
    if (item == NULL) return NULL;
    firItem* result = NULL;
    switch (item->type()) {
    case ItemType::kItemPort: {
      firItemPort* port = dynamic_cast<firItemPort*>(item);
      firType* port_type = copyType(port->type_data());
      result = addItemPort(port->id(), port->dir(), port_type);
      break;
    }
    case ItemType::kItemWire: {
      firItemWire* wire = dynamic_cast<firItemWire*>(item);
      firType* wire_type = copyType(wire->type_data());
      result = addItemWire(wire->id(), wire_type);
      break;
    }
    case ItemType::kItemRegister: {
      firItemRegister* reg = dynamic_cast<firItemRegister*>(item);
      firType* reg_type = copyType(reg->type_data());
      firExp* clock_signal = copyExpression(reg->clock_signal());
      firExp* reg_reset = copyExpression(reg->reg_reset());
      firExp* reg_init = copyExpression(reg->reg_init());
      result = addItemRegister(reg->id(), reg_type, clock_signal, reg_reset, reg_init);
      break;
    }
    case ItemType::kItemNode: {
      firItemNode* node = dynamic_cast<firItemNode*>(item);
      firExp* node_exp = copyExpression(node->exp());
      result = addItemNode(node->id(), node_exp);
      break;
    }
    case ItemType::kItemMemory: {
      firItemMemory* mem = dynamic_cast<firItemMemory*>(item);
      firType* mem_type = copyType(mem->type_data());
      result = addItemMemory(mem->id(), mem_type, mem->depth(), mem->read_latency(), mem->write_latency(), mem->read_under_write());
      break;
    }
    case ItemType::kItemCMemory: {
      firItemCMemory* cmem = dynamic_cast<firItemCMemory*>(item);
      firType* cmem_type = copyType(cmem->type_data());
      result = addItemCMemory(cmem->id(), cmem_type);
      break;
    }
    case ItemType::kItemSMemory: {
      firItemSMemory* smem = dynamic_cast<firItemSMemory*>(item);
      firType* smem_type = copyType(smem->type_data());
      result = addItemSMemory(smem->id(), smem_type, smem->read_under_write());
      break;
    }
    case ItemType::kItemInstance: {
      firItemInstance* instance = dynamic_cast<firItemInstance*>(item);
      result = addItemInstance(instance->inst_id(), instance->module_id());
      break;
    }
    case ItemType::kItemConnect: {
      firItemConnect* connect = dynamic_cast<firItemConnect*>(item);
      firExp* connect_l_exp = copyExpression(connect->connect_l());
      firExp* connect_r_exp = copyExpression(connect->connect_r());
      result = addItemConnect(connect_l_exp, connect_r_exp);
      break;
    }
    case ItemType::kItemPartialConnect: {
      firItemPartialConnect* pconnect = dynamic_cast<firItemPartialConnect*>(item);
      firExp* connect_l_exp = copyExpression(pconnect->connect_l());
      firExp* connect_r_exp = copyExpression(pconnect->connect_r());
      result = addItemPartialConnect(connect_l_exp, connect_r_exp);
      break;
    }
    case ItemType::kItemConditional: {
      firItemConditional* conditional = dynamic_cast<firItemConditional*>(item);
      firItemConditional* conditional_new = addItemConditional();
      firExp* when_exp = conditional->when_exp();
      if (when_exp != NULL) {
        conditional_new->set_when_exp(copyExpression(when_exp));
      }
      firItemConditional* else_cond = conditional->else_cond();
      if (else_cond != NULL) {
        conditional_new->set_else_cond(dynamic_cast<firItemConditional*>(copyItem(else_cond)));
      }
      std::vector<firItem*>& when_statements = conditional->when_statements();
      for (size_t i = 0; i < when_statements.size(); i++) {
        firItem* statement = when_statements[i];
        conditional_new->addStatement(copyItem(statement));
      }
      result = conditional_new;
      break;
    }
    case ItemType::kItemAttach: {
      firItemAttach* attach = dynamic_cast<firItemAttach*>(item);
      fs_assert(attach);
      result = addItemAttach();
      break;
    }
    case ItemType::kItemMPort: {
      firItemMPort* mport = dynamic_cast<firItemMPort*>(item);
      firExp* addr_exp = copyExpression(mport->addr_exp());
      firExp* clk_exp = copyExpression(mport->clk_exp());
      result = addItemMPort(mport->dir(), mport->mport_id(), mport->mem_id(), addr_exp, clk_exp);
      break;
    }
    case ItemType::kItemStop: {
      firItemStop* stop = dynamic_cast<firItemStop*>(item);
      firExp* stop_exp1 = copyExpression(stop->exp1());
      firExp* stop_exp2 = copyExpression(stop->exp2());
      result = addItemStop(stop_exp1, stop_exp2, stop->exit_code());
      break;
    }
    case ItemType::kItemEmpty: {
      firItemEmpty* empty = dynamic_cast<firItemEmpty*>(item);
      fs_assert(empty);
      result = addItemEmpty();
      break;
    }
    case ItemType::kItemInvalidate: {
      firItemInvalidate* invalidate = dynamic_cast<firItemInvalidate*>(item);
      firExp* invalid_exp = copyExpression(invalidate->exp());
      result = addItemInvalidate(invalid_exp);
      break;
    }
    case ItemType::kItemPrintf: {
      firItemPrintf* printf = dynamic_cast<firItemPrintf*>(item);
      firExp* clk_signal = copyExpression(printf->clk_signal());
      firExp* con_signal = copyExpression(printf->con_signal());
      result = addItemPrintf(clk_signal, con_signal, printf->p_string());
      break;
    }
    default: {
      break;
    }
    }
    return result;
  }
  firDB::firExp* firDB::firModule::copyExpression(firExp* expression) {
    if (expression == NULL) return NULL;
    firExp* result = NULL;
    switch (expression->type()) {
    case ExpressionType::kExpTypeUInt: {
      firExpUInt* uint = dynamic_cast<firExpUInt*>(expression);
      //result = addExpUInt(uint->value(), uint->width());
      result = addExpUInt(uint->big_value()->getUIntValue(), uint->width());
      break;
    }
    case ExpressionType::kExpTypeUIntBits: {
      firExpUIntBits* uintbits = dynamic_cast<firExpUIntBits*>(expression);
      //result = addExpUIntBits(uintbits->value(), uintbits->width());
      result = addExpUIntBits(uintbits->big_value()->getOriginValue(), uintbits->width());
      break;
    }
    case ExpressionType::kExpTypeSInt: {
      firExpSInt* sint = dynamic_cast<firExpSInt*>(expression);
      //result = addExpSInt(sint->value(), sint->width());
      result = addExpSInt(sint->big_value()->getSIntValue(), sint->width());
      break;
    }
    case ExpressionType::kExpTypeSIntBits: {
      firExpSIntBits* sintbits = dynamic_cast<firExpSIntBits*>(expression);
      //result = addExpSIntBits(sintbits->value(), sintbits->width());
      result = addExpSIntBits(sintbits->big_value()->getOriginValue(), sintbits->width());
      break;
    }
    case ExpressionType::kExpTypeRef: {
      firExpRef* ref = dynamic_cast<firExpRef*>(expression);
      result = addExpRef(ref->id());
      break;
    }
    case ExpressionType::kExpTypeSubfield: {
      firExpSubfield* subfield = dynamic_cast<firExpSubfield*>(expression);
      result = addExpSubfield(copyExpression(subfield->exp()), subfield->id());
      break;
    }
    case ExpressionType::kExpTypeDouble: {
      firExpDouble* firdouble = dynamic_cast<firExpDouble*>(expression);
      result = addExpDouble(firdouble->left_side(), firdouble->right_side());
      break;
    }
    case ExpressionType::kExpTypeSubindex: {
      firExpSubindex* subindex = dynamic_cast<firExpSubindex*>(expression);
      result = addExpSubindex(copyExpression(subindex->exp()), subindex->index());
      break;
    }
    case ExpressionType::kExpTypeSubaccess: {
      firExpSubaccess* subaccess = dynamic_cast<firExpSubaccess*>(expression);
      result = addExpSubaccess(copyExpression(subaccess->exp()), copyExpression(subaccess->access()));
      break;
    }
    case ExpressionType::kExpTypeMux: {
      firExpMux* mux = dynamic_cast<firExpMux*>(expression);
      result = addExpMux(copyExpression(mux->sel()), copyExpression(mux->input1()), copyExpression(mux->input2()));
      break;
    }
    case ExpressionType::kExpTypeValidif: {
      firExpValidif* validif = dynamic_cast<firExpValidif*>(expression);
      result = addExpValidif(copyExpression(validif->valid()), copyExpression(validif->exp()));
      break;
    }
    case ExpressionType::kExpTypePrimOperation: {
      firExpPrimOperation* prim = dynamic_cast<firExpPrimOperation*>(expression);
      switch (prim->operator_type()) {
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAdd: {
        firExpPrimOperation::firAdd* add = dynamic_cast<firExpPrimOperation::firAdd*>(prim);
        result = addExpAdd(copyExpression(add->exp1()), copyExpression(add->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeSub: {
        firExpPrimOperation::firSub* sub = dynamic_cast<firExpPrimOperation::firSub*>(prim);
        result = addExpSub(copyExpression(sub->exp1()), copyExpression(sub->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeMul: {
        firExpPrimOperation::firMul* mul = dynamic_cast<firExpPrimOperation::firMul*>(prim);
        result = addExpMul(copyExpression(mul->exp1()), copyExpression(mul->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeDiv: {
        firExpPrimOperation::firDiv* div = dynamic_cast<firExpPrimOperation::firDiv*>(prim);
        result = addExpDiv(copyExpression(div->num()), copyExpression(div->den()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeMod: {
        firExpPrimOperation::firMod* mod = dynamic_cast<firExpPrimOperation::firMod*>(prim);
        result = addExpMod(copyExpression(mod->num()), copyExpression(mod->den()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeLt: {
        firExpPrimOperation::firLt* lt = dynamic_cast<firExpPrimOperation::firLt*>(prim);
        result = addExpLt(copyExpression(lt->exp1()), copyExpression(lt->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeLeq: {
        firExpPrimOperation::firLeq* leq = dynamic_cast<firExpPrimOperation::firLeq*>(prim);
        result = addExpLeq(copyExpression(leq->exp1()), copyExpression(leq->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeGt: {
        firExpPrimOperation::firGt* gt = dynamic_cast<firExpPrimOperation::firGt*>(prim);
        result = addExpGt(copyExpression(gt->exp1()), copyExpression(gt->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeGeq: {
        firExpPrimOperation::firGeq* geq = dynamic_cast<firExpPrimOperation::firGeq*>(prim);
        result = addExpGeq(copyExpression(geq->exp1()), copyExpression(geq->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeEq: {
        firExpPrimOperation::firEq* eq = dynamic_cast<firExpPrimOperation::firEq*>(prim);
        result = addExpEq(copyExpression(eq->exp1()), copyExpression(eq->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeNeq: {
        firExpPrimOperation::firNeq* neq = dynamic_cast<firExpPrimOperation::firNeq*>(prim);
        result = addExpNeq(copyExpression(neq->exp1()), copyExpression(neq->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypePad: {
        firExpPrimOperation::firPad* pad = dynamic_cast<firExpPrimOperation::firPad*>(prim);
        result = addExpPad(copyExpression(pad->exp()), pad->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAsUInt: {
        firExpPrimOperation::firAsUInt* asuint = dynamic_cast<firExpPrimOperation::firAsUInt*>(prim);
        result = addExpAsUInt(copyExpression(asuint->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAsSInt: {
        firExpPrimOperation::firAsSInt* assint = dynamic_cast<firExpPrimOperation::firAsSInt*>(prim);
        result = addExpAsSInt(copyExpression(assint->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAsClock: {
        firExpPrimOperation::firAsClock* asclock = dynamic_cast<firExpPrimOperation::firAsClock*>(prim);
        result = addExpAsClock(copyExpression(asclock->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAsFixed: {
        firExpPrimOperation::firAsFixed* asfixed = dynamic_cast<firExpPrimOperation::firAsFixed*>(prim);
        result = addExpAsFixed(copyExpression(asfixed->exp()), asfixed->binary_point());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAsAsyncReset: {
        firExpPrimOperation::firAsAsyncReset* asasyncreset = dynamic_cast<firExpPrimOperation::firAsAsyncReset*>(prim);
        result = addExpAsAsyncReset(copyExpression(asasyncreset->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAsInterval: {
        firExpPrimOperation::firAsInterval* asinterval = dynamic_cast<firExpPrimOperation::firAsInterval*>(prim);
        result = addExpAsInterval(copyExpression(asinterval->exp()), asinterval->left(), asinterval->right(), asinterval->bit_width());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeShl: {
        firExpPrimOperation::firShl* shl = dynamic_cast<firExpPrimOperation::firShl*>(prim);
        result = addExpShl(copyExpression(shl->exp()), shl->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeShr: {
        firExpPrimOperation::firShr* shr = dynamic_cast<firExpPrimOperation::firShr*>(prim);
        result = addExpShr(copyExpression(shr->exp()), shr->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeDshl: {
        firExpPrimOperation::firDshl* dshl = dynamic_cast<firExpPrimOperation::firDshl*>(prim);
        result = addExpDshl(copyExpression(dshl->exp1()), copyExpression(dshl->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeDshr: {
        firExpPrimOperation::firDshr* dshr = dynamic_cast<firExpPrimOperation::firDshr*>(prim);
        result = addExpDshr(copyExpression(dshr->exp1()), copyExpression(dshr->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeCvt: {
        firExpPrimOperation::firCvt* cvt = dynamic_cast<firExpPrimOperation::firCvt*>(prim);
        result = addExpCvt(copyExpression(cvt->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeNeg: {
        firExpPrimOperation::firNeg* neg = dynamic_cast<firExpPrimOperation::firNeg*>(prim);
        result = addExpNeg(copyExpression(neg->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeNot: {
        firExpPrimOperation::firNot* prim_not = dynamic_cast<firExpPrimOperation::firNot*>(prim);
        result = addExpNot(copyExpression(prim_not->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAnd: {
        firExpPrimOperation::firAnd* prim_and = dynamic_cast<firExpPrimOperation::firAnd*>(prim);
        result = addExpAnd(copyExpression(prim_and->exp1()), copyExpression(prim_and->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeOr: {
        firExpPrimOperation::firOr* prim_or = dynamic_cast<firExpPrimOperation::firOr*>(prim);
        result = addExpOr(copyExpression(prim_or->exp1()), copyExpression(prim_or->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeXor: {
        firExpPrimOperation::firXor* prim_xor = dynamic_cast<firExpPrimOperation::firXor*>(prim);
        result = addExpXor(copyExpression(prim_xor->exp1()), copyExpression(prim_xor->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeAndr: {
        firExpPrimOperation::firAndr* andr = dynamic_cast<firExpPrimOperation::firAndr*>(prim);
        result = addExpAndr(copyExpression(andr->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeOrr: {
        firExpPrimOperation::firOrr* orr = dynamic_cast<firExpPrimOperation::firOrr*>(prim);
        result = addExpOrr(copyExpression(orr->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeXorr: {
        firExpPrimOperation::firXorr* xorr = dynamic_cast<firExpPrimOperation::firXorr*>(prim);
        result = addExpXorr(copyExpression(xorr->exp()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeCat: {
        firExpPrimOperation::firCat* cat = dynamic_cast<firExpPrimOperation::firCat*>(prim);
        result = addExpCat(copyExpression(cat->exp1()), copyExpression(cat->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeBits: {
        firExpPrimOperation::firBits* bits = dynamic_cast<firExpPrimOperation::firBits*>(prim);
        result = addExpBits(copyExpression(bits->exp()), bits->hi(), bits->lo());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeHead: {
        firExpPrimOperation::firHead* head = dynamic_cast<firExpPrimOperation::firHead*>(prim);
        result = addExpHead(copyExpression(head->exp()), head->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeTail: {
        firExpPrimOperation::firTail* tail = dynamic_cast<firExpPrimOperation::firTail*>(prim);
        result = addExpTail(copyExpression(tail->exp()), tail->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeIncp: {
        firExpPrimOperation::firIncp* incp = dynamic_cast<firExpPrimOperation::firIncp*>(prim);
        result = addExpIncp(copyExpression(incp->exp()), incp->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeDecp: {
        firExpPrimOperation::firDecp* decp = dynamic_cast<firExpPrimOperation::firDecp*>(prim);
        result = addExpDecp(copyExpression(decp->exp()), decp->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeSetp: {
        firExpPrimOperation::firSetp* setp = dynamic_cast<firExpPrimOperation::firSetp*>(prim);
        result = addExpSetp(copyExpression(setp->exp()), setp->n());
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeWrap: {
        firExpPrimOperation::firWrap* wrap = dynamic_cast<firExpPrimOperation::firWrap*>(prim);
        result = addExpWrap(copyExpression(wrap->exp1()), copyExpression(wrap->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeClip: {
        firExpPrimOperation::firClip* clip = dynamic_cast<firExpPrimOperation::firClip*>(prim);
        result = addExpClip(copyExpression(clip->exp1()), copyExpression(clip->exp2()));
        break;
      }
      case firExpPrimOperation::PrimOperationType::kOperatorTypeSquz: {
        firExpPrimOperation::firSquz* squz = dynamic_cast<firExpPrimOperation::firSquz*>(prim);
        result = addExpSquz(copyExpression(squz->exp1()), copyExpression(squz->exp2()));
        break;
      }
      default: {
        fs_assert(0);
        break;
      }
      }
      break;
    }
    default: {
      fs_assert(0);
      break;
    }
    }
    return result;
  }
  firDB::firItem* firDB::firModule::findItemByExpression(firExp* exp, firItemConditional* domain) {
    std::list<firExp*> exp_list = exp->generateExpPositiveSequence();
    if (exp_list.empty()) return NULL;
    firExpRef* head_expression = dynamic_cast<firExpRef*>(exp_list.front());
    if (head_expression == NULL) return NULL;
    firItem* fir_item = this->findItemById(head_expression->id(), domain);
    return fir_item;
  }
  firDB::firType* firDB::firModule::getOriginTypeByExpression(firExp* exp, firItemConditional* domain) {
    std::list<firExp*> exp_list = exp->generateExpPositiveSequence();
    if (exp_list.empty()) return NULL;
    firExpRef* head_expression = dynamic_cast<firExpRef*>(exp_list.front());
    if (head_expression == NULL) return NULL;
    firItem* item = this->findItemById(head_expression->id(), domain);
    exp_list.pop_front();
    firType* item_type = this->getItemType(item, domain);
    if (item->isInstanceItem()) {
      fs_assert(item_type == NULL);
      firItemInstance* inst_item = dynamic_cast<firItemInstance*>(item);
      fs_assert(inst_item != NULL);
      firExpSubfield* port_expression = dynamic_cast<firExpSubfield*>(exp_list.front());
      if (port_expression != NULL) {
        firModule* inst_module = this->circuit()->findModuleById(inst_item->module_id());
        if (inst_module != NULL) {
          firItemPort* inst_port = dynamic_cast<firItemPort*>(inst_module->findItemById(port_expression->id(), NULL));
          exp_list.pop_front();
          item_type = inst_port->type_data();
        }
      }
    } else if (item->isMemoryItem()) {
      fs_assert(item_type->isMemoryType());
      firExpSubfield* port_expression = dynamic_cast<firExpSubfield*>(exp_list.front());
      if (port_expression != NULL) {
        firItemMemory* mem_item = dynamic_cast<firItemMemory*>(item);
        MPortDir port_dir = mem_item->findPortDirById(port_expression->id());
        exp_list.pop_front();
        firExpSubfield* mport_port_expression = dynamic_cast<firExpSubfield*>(exp_list.front());
        if (mport_port_expression != NULL) {
          MemPortType mport_port = mem_item->getMemPortTypeById(port_dir, mport_port_expression->id());
          exp_list.pop_front();
          if (mport_port != MemPortType::kMemPortData &&
            mport_port != MemPortType::kMemPortWData &&
            mport_port != MemPortType::kMemPortRData) {
            fs_assert(exp_list.size() == 1 && exp_list.front() == NULL);
            return NULL;
          }
        }
      }
    }
    return this->getTypeTypeDataByExpressionSequence(item_type, exp_list);
  }
  // type\expression NULL    Subfield     Subindex     Subaccess
  // NULL            NULL    NULL         NULL         NULL
  // Bundle          Bundle  <recursion>  NULL         NULL
  // Vector          Vector  NULL         <recursion>  <recursion>
  // Ground          Ground  NULL         NULL         NULL
  //
  // last element pushed in exp_list must be NULL
  firDB::firType* firDB::firModule::getTypeTypeDataByExpressionSequence(firType* type, std::list<firExp*>& exp_list) {
    fs_assert(exp_list.size() >= 1);
    if (exp_list.size() == 1) fs_assert(exp_list.front() == NULL);
    if (type == NULL) return NULL;
    firExp* expression = exp_list.front();
    exp_list.pop_front();
    if (expression == NULL) return type;
    fs_assert(expression->isSubfieldExpression() || expression->isSubindexExpression() || expression->isSubaccessExpression());
    if (type->isBundleType()) {
      firTypeBundle* btype = dynamic_cast<firTypeBundle*>(type);
      if (expression->isSubfieldExpression()) {
        firExpSubfield* bexp = dynamic_cast<firExpSubfield*>(expression);
        firType* type_data = btype->findTypeDataById(bexp->id());
        return getTypeTypeDataByExpressionSequence(type_data, exp_list);
      } else {
        return NULL;
      }
    } else if (type->isVectorType()) {
      firTypeVector* vtype = dynamic_cast<firTypeVector*>(type);
      if (expression->isSubindexExpression()) {
        firExpSubindex* iexp = dynamic_cast<firExpSubindex*>(expression);
        if (iexp->index() >= 0 && iexp->index() < vtype->depth()) {
          return getTypeTypeDataByExpressionSequence(vtype->type_data(), exp_list);
        } else {
          return NULL;
        }
      } else if (expression->isSubaccessExpression()) {
        return getTypeTypeDataByExpressionSequence(vtype->type_data(), exp_list);
      } else {
        return NULL;
      }
    } else if (type->isGroundType()) {
      fs_assert(expression != NULL);
      return NULL;
    } else {
      fs_assert(0);
      return NULL;
    }
    return NULL;
  }
  firDB::firType* firDB::firModule::getItemType(firItem* item, firItemConditional* domain) {
    if (item == NULL) return NULL;
    switch (item->type()) {
    case ItemType::kItemPort: {
      firItemPort* pitem = dynamic_cast<firItemPort*>(item);
      return pitem->type_data();
    }
    case ItemType::kItemWire: {
      firItemWire* witem = dynamic_cast<firItemWire*>(item);
      return witem->type_data();
    }
    case ItemType::kItemRegister: {
      firItemRegister* regitem = dynamic_cast<firItemRegister*>(item);
      return regitem->type_data();
    }
    case ItemType::kItemMemory: {
      firItemMemory* mem = dynamic_cast<firItemMemory*>(item);
      firType* rtype = mem->type_data();
      fs_assert(rtype->isMemoryType());
      return rtype;
    }
    case ItemType::kItemCMemory: {
      firItemCMemory* cmem = dynamic_cast<firItemCMemory*>(item);
      return cmem->type_data();
    }
    case ItemType::kItemSMemory: {
      firItemSMemory* smem = dynamic_cast<firItemSMemory*>(item);
      return smem->type_data();
    }
    case ItemType::kItemMPort: {
      firItemMPort* mport = dynamic_cast<firItemMPort*>(item);
      std::string mem_id = mport->mem_id();
      firItem* mem = this->findItemExceptMPort(mem_id, domain);
      fs_assert(mem != NULL);
      if (mem->isCMemoryItem()) {
        firItemCMemory* cmem = dynamic_cast<firItemCMemory*>(mem);
        firType* cmem_type_data = cmem->type_data();
        fs_assert(cmem_type_data != NULL);
        fs_assert(cmem_type_data->isVectorType());
        return dynamic_cast<firTypeVector*>(cmem_type_data)->type_data();
      } else if (mem->isSMemoryItem()) {
        firItemSMemory* smem = dynamic_cast<firItemSMemory*>(mem);
        firType* smem_type_data = smem->type_data();
        fs_assert(smem_type_data != NULL);
        fs_assert(smem_type_data->isVectorType());
        return dynamic_cast<firTypeVector*>(smem_type_data)->type_data();
      } else {
        fs_error("*ERROR*: The MPort '%s' was not attached to a memory. Attach the MPort to a correct memory and rerun.\n", mport->mport_id().c_str());
        fs_assert(0);
        return NULL;
      }
    }
    case ItemType::kItemInstance: {
      return NULL;
    }
    case ItemType::kItemNode: {
      firItemNode* nitem = dynamic_cast<firItemNode*>(item);
      return nitem->exp()->getTypeData(this, domain);
    }
    case ItemType::kItemConnect: {
      return NULL;
    }
    case ItemType::kItemPartialConnect: {
      return NULL;
    }
    case ItemType::kItemInvalidate: {
      return NULL;
    }
    case ItemType::kItemAttach: {
      return NULL;
    }
    case ItemType::kItemConditional: {
      return NULL;
    }
    case ItemType::kItemStop: {
      return NULL;
    }
    case ItemType::kItemPrintf: {
      return NULL;
    }
    case ItemType::kItemEmpty: {
      return NULL;
    }
    default:
      fs_debug("*DEBUG*: Can not find type of expression \"%s\"!\n", item->toString().c_str());
      return NULL;
    }
  }
  firDB::firType* firDB::firModule::getItemTypeById(const std::string& item_id, firItemConditional* domain) {
    firItem* item = this->findItemById(item_id, domain);
    return this->getItemType(item, domain);
  }
  firDB::firExp* firDB::firModule::getItemExpVal(firItem* item, firItemConditional* /*domain*/) {
    if (item == NULL) return NULL;
    if (item->isNodeItem()) {
      return dynamic_cast<firItemNode*>(item)->exp()->exp_val();
    } else {
      return NULL;
    }
  }
  firDB::firExp* firDB::firModule::getItemExpValById(const std::string& item_id, firItemConditional* domain) {
    firItem* item = this->findItemById(item_id, domain);
    return this->getItemExpVal(item, domain);
  }

}