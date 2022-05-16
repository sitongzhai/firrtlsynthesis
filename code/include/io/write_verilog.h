//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#ifndef IO_WRITEVERILOG_H
#define IO_WRITEVERILOG_H

#include <string>
#include <vector>
#include <map>
#include "utility/assert.h"
#include "utility/exception.h"
#include "db/fir_circuit.h"
#include "db/fir_module.h"
#include "db/fir_item.h"

#define VERILOG_INDENT_SPACE_NUM 4

namespace firrtlsyn {

  struct OpInputInfo {
    bool is_signed;
    unsigned int width;
    std::string id_to_write;
    bool is_a_number;
    unsigned int min_width_for_number;
  };

  struct OutputInfo {
    bool is_signed;
    unsigned int width;
    std::string id_to_write;
    bool remapped;
  };

  // flip-flop as register by default
  struct RegisterInfo {
    bool is_signed;
    unsigned int width;
    std::string reg_id_to_write;
    std::string input_d_id_to_write;
    std::string output_q_id_to_write;
    bool has_reg_reset;
    bool is_sync_reset;
    std::string reg_reset_id_to_write;
    std::string reg_init_id_to_write;
    unsigned int reg_init_width;
    std::string clock_id_to_write;
    bool clock_posedge_active;
    bool reg_reset_posedge_active;
  };

  struct MemoryInfo {
    std::string mem_id_to_write;
    bool is_signed;
    unsigned int width;
    unsigned int depth;
    unsigned int expect_addrbits;
    bool is_smem;
    std::vector<std::string> readers_id_to_write;
    std::vector<std::string> writers_id_to_write;
    std::vector<std::string> readwriters_id_to_write;
  };

  struct ReaderPins {
    std::string read_data;
    std::string read_clk;
    std::string read_en;
    std::string read_addr;
  };

  struct WriterPins {
    std::string write_clk;
    std::string write_en;
    std::string write_mask;
    std::string write_addr;
    std::string write_data;
  };

  struct ReadwriterPins {
    std::string readwrite_rdata;
    std::string readwrite_wmode;
    std::string readwrite_clk;
    std::string readwrite_en;
    std::string readwrite_wmask;
    std::string readwrite_addr;
    std::string readwrite_wdata;
  };

  struct RAMMemPins {
    ReaderPins reader;
    WriterPins writer;
  };

  struct CombinedPin {
    std::string pin_name;
    unsigned int width;
    bool is_mem_input;
  };

  struct MRROMMemPins {
    std::vector<ReaderPins> readers;
    CombinedPin read_datas;
    CombinedPin read_clks;
    CombinedPin read_ens;
    CombinedPin read_addrs;
  };

  struct MRMWMemPins {
    std::vector<ReaderPins> readers;
    std::vector<WriterPins> writers;
    CombinedPin read_datas;
    CombinedPin read_clks;
    CombinedPin read_ens;
    CombinedPin read_addrs;
    CombinedPin write_clks;
    CombinedPin write_ens;
    CombinedPin write_masks;
    CombinedPin write_addrs;
    CombinedPin write_datas;
  };

  class Backend {
  public:
    Backend();
    ~Backend();
    char interpunct() { return interpunct_; }
    std::string sync_read_addr_reg_suffix() { return sync_read_addr_reg_suffix_; }

    bool read_lib();
    bool writeVerilog(firDB::firLibrary* lib, std::string file_name, bool overwrite, bool debug);
    bool writeModuleVerilog(FILE* fp, firDB::firModule* module, firDB::firCircuit* post_circuit);
    bool writePortVerilog(FILE* fp, firDB::firModule* module, std::string indent);
    bool writeStatementsVerilog(FILE* fp, firDB::firModule* module, firDB::firCircuit* post_circuit, std::string indent);
    bool writeEndModule(FILE* fp, firDB::firModule* module);
    int getPostTypeWidth(firDB::firType* data_type);
    bool getPostTypeSign(firDB::firType* type_data);
    std::string formBus(int width, int start_index = 0);
    
    std::string mapCell(OutputInfo& output_y, firDB::firModule* module, firDB::firExp* exp, std::string indent);
    void netMapping(firDB::firModule* module, std::map<std::string, std::string> & bufferMap);
    bool AvoidRedclaredID(firDB::firModule* module);
    bool addUnifiedID(firDB::firModule* module, const std::string & unified_id, const std::string & post_id);
    bool addDeclaredID(firDB::firModule* module, const std::string & post_id, const std::string & declared_id);
    std::string unifyID(const std::string id);
    std::string reUnifyID(const std::string id);
    std::string getWriteID(firDB::firModule* module, const std::string id);
    long long unsigned int getNewGateNum();
    std::string getTempWireId();

    std::string getDffOutputQName(std::string dff_id_to_write);
    std::string getDffInputDName(std::string dff_id_to_write);
    std::string getDffClockClkName(std::string dff_id_to_write);
    std::string getDffRstValName(std::string dff_id_to_write);
    std::string getInstancePinId(std::string inst_id_to_write, std::string port_id_to_write);
    std::string getMemoryPinId(std::string mem_id_to_write, std::string mport_id_to_write, std::string pin_id_to_write);
    OpInputInfo getOpInputInfo(firDB::firExp* input_exp, firDB::firModule* module);
    bool sameSign(const OpInputInfo& info_a, const OpInputInfo& info_b, firDB::firExp* exp);
    std::string extendBits(const OpInputInfo& info_x, unsigned int target_width, OpInputInfo& new_info_x, std::string indent);
    std::string alignWidthToMax(const OpInputInfo& info_a, const OpInputInfo& info_b, OpInputInfo& new_info_a, OpInputInfo& new_info_b, std::string indent);
    std::string alignOutputWidthAndType(const OutputInfo& output_y, const OutputInfo& cell_output, std::string indent);
    std::string turnIdExpToWriteFormat(firDB::firExp* id_exp, firDB::firModule* module);
    bool getGateNamePorts(std::string prim_op, unsigned int port_num, std::string & cell_name, std::string & gate_name, std::vector<std::string> & ports);
    bool getGateNamePorts(std::string prim_op, bool is_signed, unsigned int port_num, std::string & cell_name, std::string & gate_name, std::vector<std::string> & ports);
    std::string writeAssignVerilog(std::string output_y, std::string in, std::string indent);
    std::string declareWire(unsigned int width, std::string id_to_write, std::string indent);
    std::string writeVerilogFormatA(std::string prim_op, bool is_signed, unsigned int width, std::string output_y, std::string input_a, std::string input_b, std::string indent);
    std::string writeVerilogFormatB(std::string prim_op, unsigned int width, std::string output_y, std::string input_a, std::string input_b, std::string indent);
    std::string writeVerilogFormatC(std::string prim_op, bool is_signed, unsigned int width, std::string output_y, std::string in, std::string indent);
    std::string writeVerilogFormatD(std::string prim_op, unsigned int width, std::string output_y, std::string in, std::string indent);
    std::string writeVerilogFormatE(std::string prim_op, bool is_signed, unsigned int width, unsigned int n, std::string output_y, std::string in, std::string indent);
    std::string writeVerilogFormatF(std::string prim_op, unsigned int width, unsigned int n, std::string output_y, std::string in, std::string indent);
    std::string writeVerilogFormatG(std::string prim_op, bool is_signed, unsigned int width_in, unsigned int width_n, std::string output_y, std::string in, std::string n, std::string indent);
    std::string writeVerilogFormatH(std::string prim_op, unsigned int width_a, unsigned int width_b, std::string output_y, std::string input_a, std::string input_b, std::string indent);
    std::string writeVerilogFormatI(std::string prim_op, unsigned int width, unsigned int high, unsigned int low, std::string output_y, std::string in, std::string indent);
    std::string writeVerilogFormatJ(std::string prim_op, bool is_signed, unsigned int width, std::string output_y, std::string sel, std::string input_a, std::string input_b, std::string indent);
    std::string writeDirectConnectVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpAddVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpSubVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpMulVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOptimizedOpMulVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpDivVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpModVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpLtVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpLeqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpGtVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpGeqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpEqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpNeqVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpPadVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent);
    std::string writeOpAsUIntVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpAsSIntVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpShlVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent);
    std::string writeOpShrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent);
    std::string writeOpDshlVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const OpInputInfo& info_n, std::string indent);
    std::string writeOpDshrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const OpInputInfo& info_n, std::string indent);
    std::string writeOpCvtVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpNegVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpBitwiseNotVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpBitwiseAndVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpBitwiseOrVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpBitwiseXorVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpAndrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpOrrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpXorrVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpCatVerilog(const OutputInfo& output_y, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);
    std::string writeOpBitsVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int high, const unsigned int low, std::string indent);
    std::string writeOpHeadVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent);
    std::string writeOpTailVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, const unsigned int n, std::string indent);
    std::string writeOpAsClockVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeOpAsAsyncResetVerilog(const OutputInfo& output_y, const OpInputInfo& info_in, std::string indent);
    std::string writeDffVerilog(const RegisterInfo & reg_info, std::string indent);
    std::string writeDffAsyncRstVerilog(const RegisterInfo & reg_info, std::string indent);
    std::string writeMuxVerilog(const OutputInfo& output_y, const OpInputInfo& sel, const OpInputInfo& info_a, const OpInputInfo& info_b, std::string indent);

    bool getRegisterInfo(firDB::firItemRegister* post_register, firDB::firModule* module, RegisterInfo & reg_info);

    bool identifySyncReadPin(firDB::firExp* left_exp, std::string pin_component, firDB::firModule* module); // May not need
    bool getMemoryInfo(firDB::firItemMemory* post_memory, firDB::firModule* module, MemoryInfo & mem_info);
    void getReaderPinNames(const std::string & mem_id_to_write, const std::string & read_mport_id_to_write, ReaderPins & reader_pins);
    void getWriterPinNames(const std::string & mem_id_to_write, const std::string & write_mport_id_to_write, WriterPins & writer_pins);
    void getReadwriterPinNames(const std::string & mem_id_to_write, const std::string & readwrite_mport_id_to_write, ReadwriterPins & readwriter_pins);
    std::string declareReaderPinsInVerilog(const MemoryInfo & mem_info, const ReaderPins & reader_pins, std::string indent);
    std::string declareWriterPinsInVerilog(const MemoryInfo & mem_info, const WriterPins & writer_pins, std::string indent);
    std::string declareReadwriterPinsInVerilog(const MemoryInfo & mem_info, const ReadwriterPins & readwriter_pins, std::string indent);
    std::string decoupleReadwriter(const ReadwriterPins & readwriter_pins, ReaderPins & reader_pins, WriterPins & writer_pins, std::string indent);
    void formMRROMCombinedPins(const MemoryInfo & mem_info, MRROMMemPins & mr_rom_mem_pins);
    void formMRMWCombinedPins(const MemoryInfo & mem_info, MRMWMemPins & mrmw_mem_pins);
    std::string declareMRROMCombinedPinsInVerilog(const MRROMMemPins & mr_rom_mem_pins, std::string indent);
    std::string declareMRMWCombinedPinsInVerilog(const MRMWMemPins & mrmw_mem_pins, std::string indent);
    std::string assignMRROMCombinedPinsInVerilog(const MemoryInfo & mem_info, const MRROMMemPins & mr_rom_mem_pins, std::string indent);
    std::string assignMRMWCombinedPinsInVerilog(const MemoryInfo & mem_info, const MRMWMemPins & mrmw_mem_pins, std::string indent);
    std::string writeROMVerilog(const MemoryInfo & mem_info, std::string indent);
    std::string writeMultiReaderROMVerilog(const MemoryInfo & mem_info, std::string indent);
    std::string writeRAMVerilog(const MemoryInfo & mem_info, std::string indent);
    std::string writeMultiReaderMultiWriterRAMVerilog(const MemoryInfo & mem_info, std::string indent);

    std::vector<firDB::firItemAttach*> collectAttachStatements(firDB::firModule* module);
    bool writeNodeVerilog(firDB::firItemNode* post_node, FILE* fp, firDB::firModule* module, std::string indent);
    bool writeWireVerilog(firDB::firItemWire* post_wire, FILE* fp, firDB::firModule* module, std::string indent);
    bool writeConnectVerilog(firDB::firItemConnect* post_connect, FILE* fp, firDB::firModule* module, std::string indent);
    bool writeRegisterVerilog(firDB::firItemRegister* post_register, FILE* fp, firDB::firModule* module, std::string indent);
    bool writeInstanceVerilog(firDB::firItemInstance* post_instance, FILE* fp, firDB::firModule* module, firDB::firCircuit* post_circuit, std::vector<firDB::firItemAttach*>& attach_statements, std::string indent);
    bool writeMemoryVerilog(firDB::firItemMemory* post_memory, FILE* fp, firDB::firModule* module, std::string indent);

  public:
    //0 for Output, others for inputs
    //static const std::map<std::string, std::pair<std::vector<std::string>, std::vector<std::string>>> dataPathLib;
    std::map<std::string, std::vector<std::string>> dataPathLib;

  private:
    char interpunct_;
    std::string temp_wire_id_;
    long long unsigned int new_gate_num_;
    long long unsigned int new_wire_num_;
    std::string sync_read_addr_reg_suffix_;
    std::map<std::string, std::map<std::string, std::string> > unified_id_post_id_map_; // pre-check of unified ID for items, including port, wire, register, instance memory
    std::map<std::string, std::map<std::string, std::string> > post_id_declared_id_map_; // final map for post_id and declared id to write into Verilog
  };

}

#endif