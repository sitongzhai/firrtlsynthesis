//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_TRANSFERPOST_H
#define ELABORATE_TRANSFERPOST_H

#include "db/fir_module.h"
#include "db/fir_item.h"

namespace firrtlsyn {

  class TransferPost {
  public:
    class Option {
    public:
      Option() { optimize_exp_ = true; }
      ~Option() {}
      void set_optimize_exp(bool optimize_exp) { optimize_exp_ = optimize_exp; }
      bool get_optimize_exp() { return optimize_exp_; }
    private:
      bool optimize_exp_;
    };

  public:
    TransferPost(firDB::firLibrary* library);
    ~TransferPost();

    void clear();
    bool transfer();

  private:
    struct cmpByRegisterId {
      bool operator()(firDB::firItemRegister* reg1, firDB::firItemRegister* reg2) const {
        std::string reg1_id = reg1->id();
        std::string reg2_id = reg2->id();
        return reg1_id < reg2_id;
      }
    };
    struct Mux {
      Mux() {
        sel = NULL;
        tval = NULL;
        fval = NULL;
      }
      Mux(firDB::firExp* mux_sel, firDB::firExp* mux_tval, firDB::firExp* mux_fval) {
        sel = mux_sel;
        tval = mux_tval;
        fval = mux_fval;
      }
      firDB::firExp* sel;
      firDB::firExp* tval;
      firDB::firExp* fval;
    };
    struct Connect {
      Connect() {
        left = NULL;
        right = NULL;
      }
      Connect(firDB::firExp* connect_left, firDB::firExp* connect_right) {
        left = connect_left;
        right = connect_right;
      }
      firDB::firExp* left;
      firDB::firExp* right;
    };

  private:
    char interpunct() { return interpunct_; }
    char instance_label() { return instance_label_; }
    std::string getAddNodeId() {
      std::string r_node_id = node_id_ + std::to_string(add_node_num_);
      add_node_num_++;
      return r_node_id;
    }
    void set_interpunct(char interpunct) { interpunct_ = interpunct; }
    void set_instance_label(char instance_label) { instance_label_ = instance_label; }
    firDB::firLibrary* library() { return library_; }
    firDB::firCircuit* post_circuit() { return post_circuit_; }
    firDB::firCircuit* fir_circuit() { return fir_circuit_; }
    void set_circuit(firDB::firCircuit* fir_circuit, firDB::firCircuit* post_circuit) {
      fir_circuit_ = fir_circuit;
      post_circuit_ = post_circuit; 
    }
    firDB::firModule* post_module() { return post_module_; }
    firDB::firModule* fir_module() { return fir_module_; }
    void set_module(firDB::firModule* fir_module, firDB::firModule* post_module) {
      fir_module_ = fir_module;
      post_module_ = post_module; 
    }
    firDB::firItemConditional* cur_cond();
    bool pushCondition(firDB::firExp* when_condition, bool is_when_block);
    bool popCondition();
    bool isWhenBlock();
    firDB::firExp* getAbsoluteCondition();
    firDB::firExp* getMportMaskCondition(const std::string& item_id);
    firDB::firExp* getMportEnableCondition(const std::string& item_id);
    void generateMPortMaskConnect(const std::string& connect_l_id, firDB::firItemMPort* item_mport);
    void set_cur_cond(firDB::firItemConditional* cur_cond);
    firDB::firItem* findItemExceptInstance(firDB::firModule* module, firDB::firExp* exp, firDB::firItemConditional* cur_cond);
    firDB::firExp* createNewExpById(const std::string& id, const bool mport_wmode = false);
    bool getRefIdByExpression(std::string &refid, firDB::firExp* exp);

    firDB::firExp* getExpressionByRefid(const std::string& refid);
    void mapPostModuleToOrigin(firDB::firModule* origin_module, firDB::firModule* post_module);
    void mapPostMuxToRegister(firDB::firItemRegister* post_register, firDB::firExpMux* post_mux);
    firDB::firModule* findPostModuleByOrigin(firDB::firModule* origin_module);
    bool isZeroWidthType(firDB::firType* type);
    firDB::firExp* transferZeroWidthExp(firDB::firType* zero_width_type);

    bool transferLibraryToPost(firDB::firLibrary* ori_library);
    bool transferCircuitToPost(firDB::firCircuit* circuit, firDB::firLibrary* post_library);
    bool transferModuleToPost(firDB::firModule* module, firDB::firCircuit* post_circuit);
    bool transferExtModuleToPost(firDB::firModule* ext_module, firDB::firCircuit* post_circuit);

    bool transferAllPortsToPost(firDB::firModule* module);
    bool transferPortToPost(firDB::firItemPort* port);
    bool transferTypeToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firType* type);
    bool transferTypeUIntToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeUInt* type);
    bool transferTypeSIntToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeSInt* type);
    bool transferTypeFixedToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeFixed* type);
    bool transferTypeIntervalToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeInterval* type);
    bool transferTypeClockToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeClock* type);
    bool transferTypeAsyncResetToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeAsyncReset* type);
    bool transferTypeResetToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeReset* type);
    bool transferTypeAnalogToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeAnalog* type);
    bool transferTypeVectorToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeVector* type);
    bool transferTypeBundleToPostPort(const std::string& id, firDB::firItemPort* port, firDB::firTypeBundle* type);
    bool transferAllStatementsToPost(firDB::firModule* module);
    bool transferStatementToPost(firDB::firItem* statement);
    //bool generateAllRegisterConnect();
    bool generateAllConnect();
    //transfer Item to post

    bool hasSubaccess(firDB::firExp* exp);
    firDB::firExp* collectHasSubaccessExps(firDB::firExp* exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs);
    firDB::firExp* mergeNestSubaccess(firDB::firExp* exp);
    bool collectIdExpressionExps(firDB::firExp* exp, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs);
    bool collectReferenceExps(firDB::firExpRef* reference, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs);
    bool collectSubfieldExps(firDB::firExpSubfield* subfield, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs);
    bool collectSubindexExps(firDB::firExpSubindex* subindex, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs);
    bool collectSubaccessExps(firDB::firExpSubaccess* subaccess, firDB::firExp*& up_exp, std::vector<std::pair<firDB::firExp*, firDB::firExp*>>& exp_pairs);

    bool transferItemWireToPost(firDB::firItemWire* item_wire);
    bool transferTypeToPostWire(const std::string& id, firDB::firType* type);
    bool transferTypeUIntToPostWire(const std::string& id, firDB::firTypeUInt* type);
    bool transferTypeSIntToPostWire(const std::string& id, firDB::firTypeSInt* type);
    bool transferTypeFixedToPostWire(const std::string& id, firDB::firTypeFixed* type);
    bool transferTypeIntervalToPostWire(const std::string& id, firDB::firTypeInterval* type);
    bool transferTypeClockToPostWire(const std::string& id, firDB::firTypeClock* type);
    bool transferTypeAsyncResetToPostWire(const std::string& id, firDB::firTypeAsyncReset* type);
    bool transferTypeResetToPostWire(const std::string& id, firDB::firTypeReset* type);
    bool transferTypeAnalogToPostWire(const std::string& id, firDB::firTypeAnalog* type);
    bool transferTypeVectorToPostWire(const std::string& id, firDB::firTypeVector* type);
    bool transferTypeBundleToPostWire(const std::string& id, firDB::firTypeBundle* type);
    bool transferItemRegisterToPost(firDB::firItemRegister* item_register);
    bool transferResetUIntToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExpUInt* reset_value_exp);
    bool transferResetUIntBitsToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExpUIntBits* reset_value_exp);
    bool transferResetSIntToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExpSInt* reset_value_exp);
    bool transferResetSIntBitsToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExpSIntBits* reset_value_exp);
    bool transferResetToPostRegisterByIdExpression(const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firType* reset_value_type);
    bool transferResetIdExpByType(std::string& tail_id, const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firType* reset_value_type);
    bool transferResetIdExpByGroundType(std::string& tail_id, const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firType* reset_value_type);
    bool transferResetPrimOptToPostRegister(const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firType* reset_value_type);
    bool transferResetPrimOptTypeUIntToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp);
    bool transferResetPrimOptTypeSIntToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp);
    bool transferResetIdRegisterTypeUIntToPost(std::string& tail_id, const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firTypeUInt* reset_value_type);
    bool transferResetIdRegisterTypeSIntToPost(std::string& tail_id, const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firTypeSInt* reset_value_type);
    bool transferResetIdRegisterTypeFixedToPost(std::string& tail_id, const std::string& id, firDB::firTypeFixed* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firTypeFixed* reset_value_type);
    bool transferResetIdRegisterTypeIntervalToPost(std::string& tail_id, const std::string& id, firDB::firTypeInterval* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firTypeInterval* reset_value_type);
    bool transferResetIdRegisterTypeVectorToPost(std::string& tail_id, const std::string& id, firDB::firTypeVector* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firTypeVector* reset_value_type);
    bool transferResetIdRegisterTypeBundleToPost(std::string& tail_id, const std::string& id, firDB::firTypeBundle* type, firDB::firExp* clock_signal_exp, firDB::firExp* reset_signal_exp, firDB::firExp* reset_value_exp, firDB::firTypeBundle* reset_value_type);

    bool transferTypeToPostRegister(const std::string& id, firDB::firType* type, firDB::firExp* clock_signal_exp);
    bool transferTypeUIntToPostRegister(const std::string& id, firDB::firTypeUInt* type, firDB::firExp* clock_signal_exp);
    bool transferTypeSIntToPostRegister(const std::string& id, firDB::firTypeSInt* type, firDB::firExp* clock_signal_exp);
    bool transferTypeFixedToPostRegister(const std::string& id, firDB::firTypeFixed* type, firDB::firExp* clock_signal_exp);
    bool transferTypeIntervalToPostRegister(const std::string& id, firDB::firTypeInterval* type, firDB::firExp* clock_signal_exp);
    bool transferTypeVectorToPostRegister(const std::string& id, firDB::firTypeVector* type, firDB::firExp* clock_signal_exp);
    bool transferTypeBundleToPostRegister(const std::string& id, firDB::firTypeBundle* type, firDB::firExp* clock_signal_exp);

    bool transferItemCMemoryToPost(firDB::firItemCMemory* item_cmemory);
    bool transferItemSMemoryToPost(firDB::firItemSMemory* item_smemory);
    bool transferItemMemoryToPost(firDB::firItemMemory* item_memory);
    bool transferVectorTypeToPostMemory(firDB::firItem* item, const std::string& id, firDB::firType* type, unsigned int depth);
    bool transferTypeUIntToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeUInt* type, unsigned int depth);
    bool transferTypeSIntToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeSInt* type, unsigned int depth);
    bool transferTypeFixedToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeFixed* type, unsigned int depth);
    bool transferTypeIntervalToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeInterval* type, unsigned int depth);
    bool transferTypeBundleToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeBundle* type, unsigned int depth);
    bool transferTypeVectorToPostMemory(firDB::firItem* item, const std::string& id, firDB::firTypeVector* type, unsigned int depth);
    
    //transferMport
    bool transferItemMPortToPost(firDB::firItemMPort* item_mport);
    bool transferTypeToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firType* type);
    bool transferTypeGroundToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport);
    bool transferTypeVectorToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeVector* type);
    bool transferTypeBundleToPostMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeBundle* type);
    bool transferTypeToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firType* type, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp);
    bool transferTypeGroundToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp);
    bool transferTypeVectorToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeVector* type, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp);
    bool transferTypeBundleToPostWhenMPort(const std::string& mem_id, firDB::firItemMPort* mport, firDB::firTypeBundle* type, firDB::firExp* addr_exp, firDB::firExp* en_exp, firDB::firExp* clk_exp);
    bool transferItemInstanceToPost(firDB::firItemInstance* item_instance);
    bool alignBinaryToSpecifiedType(firDB::firExp*& exp, firDB::firType* target_type, firDB::firType* original_type);
    bool alignBinaryToMaxBPType(firDB::firExp*& exp1, firDB::firExp*& exp2, firDB::firType* type1, firDB::firType* type2);
    bool alignMuxInputBinary(firDB::firExpMux*& exp, firDB::firType* tval_type, firDB::firType* fval_type);
    firDB::firExp* alignFixedBinary(firDB::firExp* exp, firDB::firTypeFixed* type, int binary);
    firDB::firExp* alignIntervalBinary(firDB::firExp* exp, firDB::firTypeInterval* type, int binary);
    firDB::firExp* transferNestExpression(firDB::firExp* exp, bool add_node_flag);
    firDB::firExp* transferPrimOperation(firDB::firExpPrimOperation* exp, bool add_node_flag);

    //transferItemNodeToPost
    bool transferItemNodeToPost(firDB::firItemNode* item_node);
    bool transferNodeByExpression(const std::string& node_id, firDB::firExp* exp);
    bool transferNodeByNumExpression(const std::string& node_id, firDB::firExp* exp);
    bool transferNodeByIdExpression(const std::string& node_id, firDB::firExp* exp);
    bool transferIdExpNodeByType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp, firDB::firType* type);
    bool transferIdExpNodeByGroundType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp);
    bool transferIdExpNodeByVectorType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp, firDB::firTypeVector* type);
    bool transferIdExpNodeByBundleType(const std::string& node_id, const std::string& tail_id, firDB::firExp* exp, firDB::firTypeBundle* type);
    bool transferNodeByMuxExpression(const std::string& node_id, firDB::firExpMux* exp);
    bool transferMuxNodeByType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp, firDB::firType* type);
    bool transferMuxNodeByGroundType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp);
    bool transferMuxNodeByVectorType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp, firDB::firTypeVector* type);
    bool transferMuxNodeByBundleType(const std::string& node_id, const std::string& tail_id, firDB::firExpMux* exp, firDB::firTypeBundle* type);
    bool transferNodeByValidifExpression(const std::string& node_id, firDB::firExpValidif* exp);
    bool transferValidifNodeByType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firType* type);
    bool transferValidifNodeByGroundType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firType* type);
    bool transferValidifNodeByVectorType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firTypeVector* type);
    bool transferValidifNodeByBundleType(const std::string& node_id, const std::string& tail_id, firDB::firExpValidif* exp, firDB::firTypeBundle* type);

    bool transferItemConnectToPost(firDB::firItemConnect* item_connect);
    bool transferConnectByExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferConnectByNumExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferConnectByIdExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferConnectByGroundType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferConnectByVectorType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r);
    bool transferConnectByBundleType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r);
    bool transferConnectByMux(firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferMuxConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferMuxConnectByGroundType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferConnectVectorMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r);
    bool transferConnectBundleMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r);
    bool transferConnectByValidif(firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r);
    bool transferValidifConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r);
    bool transferValidifConnectByGroundType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r);
    bool transferValidifConnectByVectorType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r);
    bool transferValidifConnectByBundleType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r);
    bool transferPrimOpConnectToPost(firDB::firExp* exp_l, firDB::firExpPrimOperation* prim_op, firDB::firType* type_l, firDB::firType* type_r);
    bool transferIdExpression(std::string& exp_id, const std::string& tail_id, firDB::firExp* exp);
    bool transferIdExpByExpType(std::string& exp_id, const std::string& tail_id, firDB::firExp* exp, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node);
    bool transferReferenceExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpRef* exp_ref, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node);
    bool transferSubfieldExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpSubfield* subfield, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node);
    bool transferSubindexExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpSubindex* subindex, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node);
    bool transferSubaccessExpression(std::string& exp_id, const std::string& tail_id, firDB::firExpSubaccess* subaccess, firDB::firItemNode* sel_node, firDB::firItemNode*& last_node);
    std::pair<firDB::firType*, firDB::firType*> getMuxInputExpressionType(const std::string& tail_id, std::string mux_suffix, firDB::firType* tval_type, firDB::firType* fval_type);
    firDB::firExp* transferMux(const std::string& tail_id, firDB::firExpMux* mux, firDB::firExp* left_exp, bool add_node_flag = false);
    firDB::firExp* transferValidif(const std::string& tail_id, firDB::firExpValidif* validif, bool add_node_flag = false);
    firDB::firExp* transferOperationInputExp(const std::string& tail_id, firDB::firExp* input_exp, firDB::firType* input_type, firDB::firExp* left_exp);

    //transferPartialConnectToPost
    bool transferItemPartialConnectToPost(firDB::firItemPartialConnect* item_partialconnect);
    bool transferPartialConnectByExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferPartialConnectByIdExpression(firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferPartialConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferPartialConnectByVectorType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r);
    bool transferPartialConnectByBundleType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExp* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r);
    bool transferPartialConnectByMux(firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferMuxPartialConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firType* type_l, firDB::firType* type_r);
    bool transferPartialConnectVectorMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r);
    bool transferPartialConnectBundleMux(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpMux* exp_r, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r);
    bool transferPartialConnectByValidif(firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r);
    bool transferValidifPartialConnectByType(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firType* type_l, firDB::firType* type_r);
    bool transferPartialConnectVectorValidif(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeVector* type_l, firDB::firTypeVector* type_r);
    bool transferPartialConnectBundleValidif(const std::string& tail_id, firDB::firExp* exp_l, firDB::firExpValidif* validif, firDB::firTypeBundle* type_l, firDB::firTypeBundle* type_r);

    bool transferItemConditionalToPost(firDB::firItemConditional* item_conditional);
    firDB::firExp* findUpLevelConnectRightExp(const std::string& left_exp_id, firDB::firLocObj* item_conditional);
    bool transferConditionalItem(firDB::firItemConditional* item_conditional);
    void mergeConditionalConnect(firDB::firItemConditional* item_conditional, std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>& connect_exps_map);
    bool transferWhenAndElseItem(firDB::firItemConditional* item_conditional, std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>& connect_exps_map);
    void mapToConnectExpsMap(std::map<std::string, std::tuple<firDB::firExp*, firDB::firExp*, firDB::firExp*>>& connect_exps_map);
    void eraseConditionalConnectMap(firDB::firLocObj* item_conditional);
    void mapConnectExpsInCurConditional(firDB::firLocObj* item_conditional, const std::string& left_exp_id, firDB::firExp* left_exp, firDB::firExp* right_exp);
    bool transferConditionalConnectToPost(firDB::firItemConnect* item_connect);
    bool transferConditionalPartialConnectToPost(firDB::firItemPartialConnect* item_partial_connect);
    bool transferConditionalMPortToPost(firDB::firItemMPort* item_mport);

    bool transferItemAttachToPost(firDB::firItemAttach* item_attach);
    bool transferItemPrintfToPost(firDB::firItemPrintf* item_printf);
    void mapTransferExps(firDB::firExp* ori_exp, firDB::firExp* post_exp);
  public:
    static Option opt;
  private:
    firDB::firLibrary* library_;
    firDB::firCircuit* post_circuit_;
    firDB::firCircuit* fir_circuit_;
    firDB::firModule* post_module_;
    firDB::firModule* fir_module_;
    long long unsigned int add_node_num_;
    std::string node_id_;
    char interpunct_;
    char instance_label_;
    std::map<firDB::firModule*, firDB::firModule*> module_postmodule_map_;
    std::map<firDB::firLocObj*, std::map<std::string, Connect>> cond_connect_exps_map_;
    std::map<firDB::firModule*, firDB::firItemConditional*> cur_cond_;
    std::map<firDB::firExp*, firDB::firExp*> transfer_exps_map_;
    std::map<firDB::firModule*, std::stack<std::pair<firDB::firExp*, bool>>> when_cond_stack_;
  };
}

#endif
