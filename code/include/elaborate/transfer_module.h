//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef ELABORATE_TRANSFERMODULE_H
#define ELABORATE_TRANSFERMODULE_H

#include <set>
#include "db/verilog_db.h"
#include "db/fir_module.h"
#include "db/fir_item.h"
#include "elaborate/macro_cells.h"

using namespace firrtlsyn;

namespace verilog {
  class TransferModule {
  public:
    TransferModule(firDB::firLibrary* firrtl_library, Library* veri_library);
    ~TransferModule();
    void clear();

  public:
    firDB::firLibrary* getFirrtlLibrary() { return firrtl_library_; }
    Library* getVerilogLibrary() { return verilog_library_; }
    firDB::firModule* getFirrtlModule() { return firrtl_module_; }
    Module* getVerilogModule() { return verilog_module_; }
    MacroCellLib* getMacroCellLib() { return macro_cell_lib_; }
    long long unsigned int getPrimInstNum();
    std::string getTempWireId();
    char getInterpunct() { return interpunct_; }
    void setModule(firDB::firModule* firrtl_module, Module* verilog_module) {
      firrtl_module_ = firrtl_module;
      verilog_module_ = verilog_module;
    }
  public:
    std::string unifyId(const std::string& id);
    std::string reUnifyId(const std::string& id);
    bool avoidRedeclaredId(firDB::firModule* firrtl_module);
    bool addUnifiedId(firDB::firModule* firrtl_module, const std::string& unified_id, const std::string& post_id);
    bool addDeclaredId(firDB::firModule* firrtl_module, const std::string& post_id, const std::string& declared_id);
    std::string getWriteId(const std::string& id, firDB::firModule* firrtl_module);
    std::string getDffPortId(const std::string& dff_id, const std::string& port_id);
    std::string getInstPortId(const std::string& inst_id, const std::string& port_id);
    std::string getNewOperationPortId(const std::string& operation_id, const std::string& port_id);
    bool transfer();
    bool transferLibraryToVerilogLibrary(firDB::firLibrary* firrtl_library);
    bool transferModuleToVerilogModule(firDB::firModule* module);
    bool transferExternModuleToVerilogModule(firDB::firModule* module);
    bool transferAllPortsToVerilogPorts(firDB::firModule* module);
    bool transferPortToVerilogPort(firDB::firItemPort* port);
    bool transferAllStatementsToVerilogItems(firDB::firModule* module);
    bool analyzeNumExpression(firDB::firExp* exp, char& sign, unsigned int& sized, bool& is_signed, std::string& value);
    bool transferStatementToVerilogItem(firDB::firItem* statement);
    bool transferItemWireToNetDecl(firDB::firItemWire* item_wire);
    bool transferItemInstanceToVerilogInstance(firDB::firItemInstance* item_instance);
    bool transferItemConnectToVerilog(firDB::firItemConnect* item_connect);
    bool transferItemNodeToVerilog(firDB::firItemNode* item_node);
    bool transferItemRegisterToVerilog(firDB::firItemRegister* item_register);
    bool transferItemMemoryToVerilog(firDB::firItemMemory* item_memory);
    bool transferItemAttachToVerilog(firDB::firItemAttach* item_attach);
    int getPostTypeWidth(firDB::firType* type_data);
    bool getPostTypeSign(firDB::firType* type_data);
    std::string getOperationInstName(MacroCellLib::ModuleType module_type);
    
    bool transferRightExpression(IdDef* left_id, firDB::firExp* exp);
    bool assignToRegisterMuxPortB(IdDef* net_b_def, firDB::firExp* exp);
    bool generateConstValAssign(IdDef* left_id, firDB::firExp* exp);
    bool generateIdDefAssign(IdDef* left_id, IdDef* right_id);
    IdDef* generateNetDecl(const std::string& name, firDB::firType* data_type);
    IdDef* generateNetDecl(const std::string& name, int width, bool is_signed);
    bool generateNumExpConnection(PortConnect* port_connect, firDB::firExp* exp);
    IdDef* getIdExpressionIdDef(firDB::firExp* exp);
    IdDef* getReferenceIdDef(firDB::firExpRef* exp);
    IdDef* getSubfieldIdDef(firDB::firExpSubfield* exp);
    bool generateOperationInst(IdDef* left_id, firDB::firExp* exp);
    bool generateMuxInst(IdDef* port_y_net, firDB::firExpMux* mux);
    bool generateValidifAssign(IdDef* port_y_net, firDB::firExpValidif* validif);
    bool generatePrimOpInst(IdDef* port_y_net, firDB::firExpPrimOperation* prim_op);
    void generatePortConnect(IdDef* inst_def, const std::string& port_id, IdDef* port_def, firDB::firExp* firrtl_exp);
    void generateSignedAddInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedAddInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedSubInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedSubInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedMulInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedMulInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedDivInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den);
    void generateUnsignedDivInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den);
    void generateSignedModInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den);
    void generateUnsignedModInst(IdDef* port_y_net, firDB::firExp* num, firDB::firExp* den);
    void generateSignedLtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedLtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedLeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedLeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedGtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedGtInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedGeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedGeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedEqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedEqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedNeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedNeqInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedPadInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateUnsignedPadInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateAsUIntInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateAsSIntInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateSignedShlInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateUnsignedShlInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateSignedShrInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateUnsignedShrInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateSignedDshlInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedDshlInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedDshrInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateUnsignedDshrInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateSignedCvtInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateUnsignedCvtInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateSignedNegInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateUnsignedNegInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateNotInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateAndInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateOrInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateXorInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateAndrInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateOrrInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateXorrInst(IdDef* port_y_net, firDB::firExp* exp);
    void generateCatInst(IdDef* port_y_net, firDB::firExp* exp1, firDB::firExp* exp2);
    void generateBitsInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int hi, unsigned int lo);
    void generateHeadInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    void generateTailInst(IdDef* port_y_net, firDB::firExp* exp, unsigned int n);
    bool generatePosClkDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal);
    bool generateNegClkDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal);
    bool generatePosClkPosAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value);
    bool generatePosClkNegAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value);
    bool generateNegClkPosAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value);
    bool generateNegClkNegAsyncResetDff(const std::string& inst_id, firDB::firType* reg_data_type, firDB::firExp* clk_signal, firDB::firExp* rst_signal, firDB::firExp* rst_value);
    bool generateRegisterResetMuxInst(const std::string& reg_id, firDB::firExp* reset_signal, firDB::firExp* reset_value, firDB::firType* reg_type_data);
    bool generateMemReaderNets(const std::string& mem_id, const std::string& mport_id, unsigned int depth, firDB::firType* mem_type);
    bool generateMemWriterNets(const std::string& mem_id, const std::string& mport_id, unsigned int depth, firDB::firType* mem_type);
    bool generateMemReadWriterNets(const std::string& mem_id, const std::string& mport_id, unsigned int depth, firDB::firType* mem_type);
    void generateMultiRomNets(const std::string& mem_id, int reader_num, unsigned int addrbits, firDB::firType* mem_type);
    void generateMultiRamNets(const std::string& mem_id, int reader_num, int writer_num, unsigned int addrbits, firDB::firType* mem_type);
    bool generateRomMem(const std::string& mem_id, std::pair<std::string, firDB::MPortDir> reader, firDB::firType* mem_type, unsigned int depth, bool is_sync_read);
    bool generateRamMem(const std::string& mem_id, std::pair<std::string, firDB::MPortDir> reader, std::pair<std::string, firDB::MPortDir> writer, firDB::firType* mem_type, unsigned int depth, bool is_sync_read);
    bool generateMultiRomMem(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, firDB::firType* mem_type, unsigned int depth, bool is_sync_read);
    bool generateMultiRamMem(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, std::vector<std::pair<std::string, firDB::MPortDir>> writers, firDB::firType* mem_type, unsigned int depth, bool is_sync_read);
    void generateMultiRomMemAssign(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, int width, unsigned int addrbits);
    void generateMultiRamMemAssign(const std::string& mem_id, std::vector<std::pair<std::string, firDB::MPortDir>> readers, std::vector<std::pair<std::string, firDB::MPortDir>> writers, int width, unsigned int addrbits);
    void generateMultiMemPortCatAssign(const std::string& mem_port_id, std::vector<std::string> mport_pins_id, int width);
    void generateMultiMemPortBitsAssign(const std::string& mem_port_id, std::vector<std::string> mport_pins_id, int width);
    IdDef* alignWidthToMax(firDB::firExp* align_exp, int align_width);
    IdDef* alignToOutputWidth(IdDef* output_def, int input_width);
    void alignWidthByInputDef(IdDef* output_def, IdDef* input_def);
    void padToOutputWidth(IdDef* output_def, IdDef* input_def, unsigned int n);
    void bitsToOutputWidth(IdDef* output_def, IdDef* input_def, unsigned int hi, unsigned int lo);
    void addAsSIntInst(IdDef* output_def, IdDef* input_def);
    IdDef* getIdDefByName(const std::string& name);
    std::string getDffPortQId(const std::string& dff_id);
    std::string getDffPortDId(const std::string& dff_id);
    std::string getInstancePinId(const std::string& inst_id, const std::string& port_id);
    std::string getMemoryPinId(const std::string& mem_id, const std::string& mport_id, const std::string& pin_id);
    std::string getMemModulePinId(const std::string& mem_id, const std::string& pin_id);

  private:
    char interpunct_;
    long long unsigned int prim_inst_num_;
    std::string temp_wire_id_;
    firDB::firLibrary* firrtl_library_;
    Library* verilog_library_;
    firDB::firModule* firrtl_module_;
    Module* verilog_module_;
    MacroCellLib* macro_cell_lib_;
    long long unsigned int new_wire_num_;
    std::map<IdDef*, IdDef*> register_mux_port_b_map_; //reg_d_def map to mux instantiation port_b_net
    std::map<firDB::firModule*, std::map<std::string, std::string>> unified_id_post_id_map_;
    std::map<firDB::firModule*, std::map<std::string, std::string>> post_id_declared_id_map_;
  };
}

#endif // !ELABORATE_TRANSFERMODULE_H