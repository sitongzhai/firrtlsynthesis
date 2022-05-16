module RocketCore(
  input         clock,
  input         reset,
  input         io_interrupts_debug,
  input         io_interrupts_mtip,
  input         io_interrupts_msip,
  input         io_interrupts_meip,
  input         io_interrupts_seip,
  input  [63:0] io_hartid,
  output        io_imem_req_valid,
  output [39:0] io_imem_req_bits_pc,
  output        io_imem_req_bits_speculative,
  output        io_imem_resp_ready,
  input         io_imem_resp_valid,
  input         io_imem_resp_bits_btb_valid,
  input         io_imem_resp_bits_btb_bits_taken,
  input  [1:0]  io_imem_resp_bits_btb_bits_mask,
  input         io_imem_resp_bits_btb_bits_bridx,
  input  [38:0] io_imem_resp_bits_btb_bits_target,
  input  [5:0]  io_imem_resp_bits_btb_bits_entry,
  input  [6:0]  io_imem_resp_bits_btb_bits_bht_history,
  input  [1:0]  io_imem_resp_bits_btb_bits_bht_value,
  input  [39:0] io_imem_resp_bits_pc,
  input  [31:0] io_imem_resp_bits_data,
  input  [1:0]  io_imem_resp_bits_mask,
  input         io_imem_resp_bits_xcpt_if,
  input         io_imem_resp_bits_replay,
  output        io_imem_btb_update_valid,
  output        io_imem_btb_update_bits_prediction_valid,
  output        io_imem_btb_update_bits_prediction_bits_taken,
  output [1:0]  io_imem_btb_update_bits_prediction_bits_mask,
  output        io_imem_btb_update_bits_prediction_bits_bridx,
  output [38:0] io_imem_btb_update_bits_prediction_bits_target,
  output [5:0]  io_imem_btb_update_bits_prediction_bits_entry,
  output [6:0]  io_imem_btb_update_bits_prediction_bits_bht_history,
  output [1:0]  io_imem_btb_update_bits_prediction_bits_bht_value,
  output [38:0] io_imem_btb_update_bits_pc,
  output [38:0] io_imem_btb_update_bits_target,
  output        io_imem_btb_update_bits_taken,
  output        io_imem_btb_update_bits_isValid,
  output        io_imem_btb_update_bits_isJump,
  output        io_imem_btb_update_bits_isReturn,
  output [38:0] io_imem_btb_update_bits_br_pc,
  output        io_imem_bht_update_valid,
  output        io_imem_bht_update_bits_prediction_valid,
  output        io_imem_bht_update_bits_prediction_bits_taken,
  output [1:0]  io_imem_bht_update_bits_prediction_bits_mask,
  output        io_imem_bht_update_bits_prediction_bits_bridx,
  output [38:0] io_imem_bht_update_bits_prediction_bits_target,
  output [5:0]  io_imem_bht_update_bits_prediction_bits_entry,
  output [6:0]  io_imem_bht_update_bits_prediction_bits_bht_history,
  output [1:0]  io_imem_bht_update_bits_prediction_bits_bht_value,
  output [38:0] io_imem_bht_update_bits_pc,
  output        io_imem_bht_update_bits_taken,
  output        io_imem_bht_update_bits_mispredict,
  output        io_imem_ras_update_valid,
  output        io_imem_ras_update_bits_isCall,
  output        io_imem_ras_update_bits_isReturn,
  output [38:0] io_imem_ras_update_bits_returnAddr,
  output        io_imem_ras_update_bits_prediction_valid,
  output        io_imem_ras_update_bits_prediction_bits_taken,
  output [1:0]  io_imem_ras_update_bits_prediction_bits_mask,
  output        io_imem_ras_update_bits_prediction_bits_bridx,
  output [38:0] io_imem_ras_update_bits_prediction_bits_target,
  output [5:0]  io_imem_ras_update_bits_prediction_bits_entry,
  output [6:0]  io_imem_ras_update_bits_prediction_bits_bht_history,
  output [1:0]  io_imem_ras_update_bits_prediction_bits_bht_value,
  output        io_imem_flush_icache,
  output        io_imem_flush_tlb,
  input  [39:0] io_imem_npc,
  input         io_imem_acquire,
  input         io_dmem_req_ready,
  output        io_dmem_req_valid,
  output [39:0] io_dmem_req_bits_addr,
  output [6:0]  io_dmem_req_bits_tag,
  output [4:0]  io_dmem_req_bits_cmd,
  output [2:0]  io_dmem_req_bits_typ,
  output        io_dmem_req_bits_phys,
  output [63:0] io_dmem_req_bits_data,
  output        io_dmem_s1_kill,
  output [63:0] io_dmem_s1_data,
  input         io_dmem_s2_nack,
  input         io_dmem_acquire,
  input         io_dmem_release,
  input         io_dmem_resp_valid,
  input  [39:0] io_dmem_resp_bits_addr,
  input  [6:0]  io_dmem_resp_bits_tag,
  input  [4:0]  io_dmem_resp_bits_cmd,
  input  [2:0]  io_dmem_resp_bits_typ,
  input  [63:0] io_dmem_resp_bits_data,
  input         io_dmem_resp_bits_replay,
  input         io_dmem_resp_bits_has_data,
  input  [63:0] io_dmem_resp_bits_data_word_bypass,
  input  [63:0] io_dmem_resp_bits_store_data,
  input         io_dmem_replay_next,
  input         io_dmem_xcpt_ma_ld,
  input         io_dmem_xcpt_ma_st,
  input         io_dmem_xcpt_pf_ld,
  input         io_dmem_xcpt_pf_st,
  output        io_dmem_invalidate_lr,
  input         io_dmem_ordered,
  output [3:0]  io_ptw_ptbr_mode,
  output [15:0] io_ptw_ptbr_asid,
  output [43:0] io_ptw_ptbr_ppn,
  output        io_ptw_invalidate,
  output        io_ptw_status_debug,
  output [31:0] io_ptw_status_isa,
  output [1:0]  io_ptw_status_prv,
  output        io_ptw_status_sd,
  output [26:0] io_ptw_status_zero2,
  output [1:0]  io_ptw_status_sxl,
  output [1:0]  io_ptw_status_uxl,
  output        io_ptw_status_sd_rv32,
  output [7:0]  io_ptw_status_zero1,
  output        io_ptw_status_tsr,
  output        io_ptw_status_tw,
  output        io_ptw_status_tvm,
  output        io_ptw_status_mxr,
  output        io_ptw_status_pum,
  output        io_ptw_status_mprv,
  output [1:0]  io_ptw_status_xs,
  output [1:0]  io_ptw_status_fs,
  output [1:0]  io_ptw_status_mpp,
  output [1:0]  io_ptw_status_hpp,
  output        io_ptw_status_spp,
  output        io_ptw_status_mpie,
  output        io_ptw_status_hpie,
  output        io_ptw_status_spie,
  output        io_ptw_status_upie,
  output        io_ptw_status_mie,
  output        io_ptw_status_hie,
  output        io_ptw_status_sie,
  output        io_ptw_status_uie,
  output [31:0] io_fpu_inst,
  output [63:0] io_fpu_fromint_data,
  output [2:0]  io_fpu_fcsr_rm,
  input         io_fpu_fcsr_flags_valid,
  input  [4:0]  io_fpu_fcsr_flags_bits,
  input  [63:0] io_fpu_store_data,
  input  [63:0] io_fpu_toint_data,
  output        io_fpu_dmem_resp_val,
  output [2:0]  io_fpu_dmem_resp_type,
  output [4:0]  io_fpu_dmem_resp_tag,
  output [63:0] io_fpu_dmem_resp_data,
  output        io_fpu_valid,
  input         io_fpu_fcsr_rdy,
  input         io_fpu_nack_mem,
  input         io_fpu_illegal_rm,
  output        io_fpu_killx,
  output        io_fpu_killm,
  input  [4:0]  io_fpu_dec_cmd,
  input         io_fpu_dec_ldst,
  input         io_fpu_dec_wen,
  input         io_fpu_dec_ren1,
  input         io_fpu_dec_ren2,
  input         io_fpu_dec_ren3,
  input         io_fpu_dec_swap12,
  input         io_fpu_dec_swap23,
  input         io_fpu_dec_single,
  input         io_fpu_dec_fromint,
  input         io_fpu_dec_toint,
  input         io_fpu_dec_fastpipe,
  input         io_fpu_dec_fma,
  input         io_fpu_dec_div,
  input         io_fpu_dec_sqrt,
  input         io_fpu_dec_wflags,
  input         io_fpu_sboard_set,
  input         io_fpu_sboard_clr,
  input  [4:0]  io_fpu_sboard_clra,
  input         io_rocc_cmd_ready,
  output        io_rocc_cmd_valid,
  output [6:0]  io_rocc_cmd_bits_inst_funct,
  output [4:0]  io_rocc_cmd_bits_inst_rs2,
  output [4:0]  io_rocc_cmd_bits_inst_rs1,
  output        io_rocc_cmd_bits_inst_xd,
  output        io_rocc_cmd_bits_inst_xs1,
  output        io_rocc_cmd_bits_inst_xs2,
  output [4:0]  io_rocc_cmd_bits_inst_rd,
  output [6:0]  io_rocc_cmd_bits_inst_opcode,
  output [63:0] io_rocc_cmd_bits_rs1,
  output [63:0] io_rocc_cmd_bits_rs2,
  output        io_rocc_cmd_bits_status_debug,
  output [31:0] io_rocc_cmd_bits_status_isa,
  output [1:0]  io_rocc_cmd_bits_status_prv,
  output        io_rocc_cmd_bits_status_sd,
  output [26:0] io_rocc_cmd_bits_status_zero2,
  output [1:0]  io_rocc_cmd_bits_status_sxl,
  output [1:0]  io_rocc_cmd_bits_status_uxl,
  output        io_rocc_cmd_bits_status_sd_rv32,
  output [7:0]  io_rocc_cmd_bits_status_zero1,
  output        io_rocc_cmd_bits_status_tsr,
  output        io_rocc_cmd_bits_status_tw,
  output        io_rocc_cmd_bits_status_tvm,
  output        io_rocc_cmd_bits_status_mxr,
  output        io_rocc_cmd_bits_status_pum,
  output        io_rocc_cmd_bits_status_mprv,
  output [1:0]  io_rocc_cmd_bits_status_xs,
  output [1:0]  io_rocc_cmd_bits_status_fs,
  output [1:0]  io_rocc_cmd_bits_status_mpp,
  output [1:0]  io_rocc_cmd_bits_status_hpp,
  output        io_rocc_cmd_bits_status_spp,
  output        io_rocc_cmd_bits_status_mpie,
  output        io_rocc_cmd_bits_status_hpie,
  output        io_rocc_cmd_bits_status_spie,
  output        io_rocc_cmd_bits_status_upie,
  output        io_rocc_cmd_bits_status_mie,
  output        io_rocc_cmd_bits_status_hie,
  output        io_rocc_cmd_bits_status_sie,
  output        io_rocc_cmd_bits_status_uie,
  output        io_rocc_resp_ready,
  input         io_rocc_resp_valid,
  input  [4:0]  io_rocc_resp_bits_rd,
  input  [63:0] io_rocc_resp_bits_data,
  output        io_rocc_mem_req_ready,
  input         io_rocc_mem_req_valid,
  input  [39:0] io_rocc_mem_req_bits_addr,
  input  [6:0]  io_rocc_mem_req_bits_tag,
  input  [4:0]  io_rocc_mem_req_bits_cmd,
  input  [2:0]  io_rocc_mem_req_bits_typ,
  input         io_rocc_mem_req_bits_phys,
  input  [63:0] io_rocc_mem_req_bits_data,
  input         io_rocc_mem_s1_kill,
  input  [63:0] io_rocc_mem_s1_data,
  output        io_rocc_mem_s2_nack,
  output        io_rocc_mem_acquire,
  output        io_rocc_mem_release,
  output        io_rocc_mem_resp_valid,
  output [39:0] io_rocc_mem_resp_bits_addr,
  output [6:0]  io_rocc_mem_resp_bits_tag,
  output [4:0]  io_rocc_mem_resp_bits_cmd,
  output [2:0]  io_rocc_mem_resp_bits_typ,
  output [63:0] io_rocc_mem_resp_bits_data,
  output        io_rocc_mem_resp_bits_replay,
  output        io_rocc_mem_resp_bits_has_data,
  output [63:0] io_rocc_mem_resp_bits_data_word_bypass,
  output [63:0] io_rocc_mem_resp_bits_store_data,
  output        io_rocc_mem_replay_next,
  output        io_rocc_mem_xcpt_ma_ld,
  output        io_rocc_mem_xcpt_ma_st,
  output        io_rocc_mem_xcpt_pf_ld,
  output        io_rocc_mem_xcpt_pf_st,
  input         io_rocc_mem_invalidate_lr,
  output        io_rocc_mem_ordered,
  input         io_rocc_busy,
  input         io_rocc_interrupt,
  output        io_rocc_exception
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [63:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [63:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [63:0] _RAND_95;
  reg [63:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [63:0] _RAND_98;
`endif // RANDOMIZE_REG_INIT
  wire  ibuf_clock; // @[Rocket.scala 165:20]
  wire  ibuf_reset; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_ready; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_valid; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_bits_btb_valid; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_bits_btb_bits_taken; // @[Rocket.scala 165:20]
  wire [1:0] ibuf_io_imem_bits_btb_bits_mask; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_bits_btb_bits_bridx; // @[Rocket.scala 165:20]
  wire [38:0] ibuf_io_imem_bits_btb_bits_target; // @[Rocket.scala 165:20]
  wire [5:0] ibuf_io_imem_bits_btb_bits_entry; // @[Rocket.scala 165:20]
  wire [6:0] ibuf_io_imem_bits_btb_bits_bht_history; // @[Rocket.scala 165:20]
  wire [1:0] ibuf_io_imem_bits_btb_bits_bht_value; // @[Rocket.scala 165:20]
  wire [39:0] ibuf_io_imem_bits_pc; // @[Rocket.scala 165:20]
  wire [31:0] ibuf_io_imem_bits_data; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_bits_xcpt_if; // @[Rocket.scala 165:20]
  wire  ibuf_io_imem_bits_replay; // @[Rocket.scala 165:20]
  wire  ibuf_io_kill; // @[Rocket.scala 165:20]
  wire [39:0] ibuf_io_pc; // @[Rocket.scala 165:20]
  wire  ibuf_io_btb_resp_taken; // @[Rocket.scala 165:20]
  wire [1:0] ibuf_io_btb_resp_mask; // @[Rocket.scala 165:20]
  wire  ibuf_io_btb_resp_bridx; // @[Rocket.scala 165:20]
  wire [38:0] ibuf_io_btb_resp_target; // @[Rocket.scala 165:20]
  wire [5:0] ibuf_io_btb_resp_entry; // @[Rocket.scala 165:20]
  wire [6:0] ibuf_io_btb_resp_bht_history; // @[Rocket.scala 165:20]
  wire [1:0] ibuf_io_btb_resp_bht_value; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_ready; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_valid; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_bits_pf0; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_bits_pf1; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_bits_replay; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_bits_btb_hit; // @[Rocket.scala 165:20]
  wire  ibuf_io_inst_0_bits_rvc; // @[Rocket.scala 165:20]
  wire [31:0] ibuf_io_inst_0_bits_inst_bits; // @[Rocket.scala 165:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rd; // @[Rocket.scala 165:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 165:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 165:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs3; // @[Rocket.scala 165:20]
  wire [31:0] ibuf_io_inst_0_bits_raw; // @[Rocket.scala 165:20]
  reg [63:0] _T_3331 [0:30]; // @[Rocket.scala 682:23]
  wire  _T_3331__T_3340_en; // @[Rocket.scala 682:23]
  wire [4:0] _T_3331__T_3340_addr; // @[Rocket.scala 682:23]
  wire [63:0] _T_3331__T_3340_data; // @[Rocket.scala 682:23]
  wire  _T_3331__T_3350_en; // @[Rocket.scala 682:23]
  wire [4:0] _T_3331__T_3350_addr; // @[Rocket.scala 682:23]
  wire [63:0] _T_3331__T_3350_data; // @[Rocket.scala 682:23]
  wire [63:0] _T_3331__T_4200_data; // @[Rocket.scala 682:23]
  wire [4:0] _T_3331__T_4200_addr; // @[Rocket.scala 682:23]
  wire  _T_3331__T_4200_mask; // @[Rocket.scala 682:23]
  wire  _T_3331__T_4200_en; // @[Rocket.scala 682:23]
  wire  csr_clock; // @[Rocket.scala 187:19]
  wire  csr_reset; // @[Rocket.scala 187:19]
  wire  csr_io_interrupts_debug; // @[Rocket.scala 187:19]
  wire  csr_io_interrupts_mtip; // @[Rocket.scala 187:19]
  wire  csr_io_interrupts_msip; // @[Rocket.scala 187:19]
  wire  csr_io_interrupts_meip; // @[Rocket.scala 187:19]
  wire  csr_io_interrupts_seip; // @[Rocket.scala 187:19]
  wire [63:0] csr_io_hartid; // @[Rocket.scala 187:19]
  wire [11:0] csr_io_rw_addr; // @[Rocket.scala 187:19]
  wire [2:0] csr_io_rw_cmd; // @[Rocket.scala 187:19]
  wire [63:0] csr_io_rw_rdata; // @[Rocket.scala 187:19]
  wire [63:0] csr_io_rw_wdata; // @[Rocket.scala 187:19]
  wire [11:0] csr_io_decode_csr; // @[Rocket.scala 187:19]
  wire  csr_io_decode_fp_illegal; // @[Rocket.scala 187:19]
  wire  csr_io_decode_read_illegal; // @[Rocket.scala 187:19]
  wire  csr_io_decode_write_illegal; // @[Rocket.scala 187:19]
  wire  csr_io_decode_write_flush; // @[Rocket.scala 187:19]
  wire  csr_io_decode_system_illegal; // @[Rocket.scala 187:19]
  wire  csr_io_csr_stall; // @[Rocket.scala 187:19]
  wire  csr_io_eret; // @[Rocket.scala 187:19]
  wire  csr_io_singleStep; // @[Rocket.scala 187:19]
  wire  csr_io_status_debug; // @[Rocket.scala 187:19]
  wire [31:0] csr_io_status_isa; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_prv; // @[Rocket.scala 187:19]
  wire  csr_io_status_sd; // @[Rocket.scala 187:19]
  wire [26:0] csr_io_status_zero2; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_sxl; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_uxl; // @[Rocket.scala 187:19]
  wire  csr_io_status_sd_rv32; // @[Rocket.scala 187:19]
  wire [7:0] csr_io_status_zero1; // @[Rocket.scala 187:19]
  wire  csr_io_status_tsr; // @[Rocket.scala 187:19]
  wire  csr_io_status_tw; // @[Rocket.scala 187:19]
  wire  csr_io_status_tvm; // @[Rocket.scala 187:19]
  wire  csr_io_status_mxr; // @[Rocket.scala 187:19]
  wire  csr_io_status_pum; // @[Rocket.scala 187:19]
  wire  csr_io_status_mprv; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_xs; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_fs; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_mpp; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_status_hpp; // @[Rocket.scala 187:19]
  wire  csr_io_status_spp; // @[Rocket.scala 187:19]
  wire  csr_io_status_mpie; // @[Rocket.scala 187:19]
  wire  csr_io_status_hpie; // @[Rocket.scala 187:19]
  wire  csr_io_status_spie; // @[Rocket.scala 187:19]
  wire  csr_io_status_upie; // @[Rocket.scala 187:19]
  wire  csr_io_status_mie; // @[Rocket.scala 187:19]
  wire  csr_io_status_hie; // @[Rocket.scala 187:19]
  wire  csr_io_status_sie; // @[Rocket.scala 187:19]
  wire  csr_io_status_uie; // @[Rocket.scala 187:19]
  wire [3:0] csr_io_ptbr_mode; // @[Rocket.scala 187:19]
  wire [43:0] csr_io_ptbr_ppn; // @[Rocket.scala 187:19]
  wire [39:0] csr_io_evec; // @[Rocket.scala 187:19]
  wire  csr_io_exception; // @[Rocket.scala 187:19]
  wire  csr_io_retire; // @[Rocket.scala 187:19]
  wire [63:0] csr_io_cause; // @[Rocket.scala 187:19]
  wire [39:0] csr_io_pc; // @[Rocket.scala 187:19]
  wire [39:0] csr_io_badaddr; // @[Rocket.scala 187:19]
  wire  csr_io_fatc; // @[Rocket.scala 187:19]
  wire [63:0] csr_io_time; // @[Rocket.scala 187:19]
  wire [2:0] csr_io_fcsr_rm; // @[Rocket.scala 187:19]
  wire  csr_io_fcsr_flags_valid; // @[Rocket.scala 187:19]
  wire [4:0] csr_io_fcsr_flags_bits; // @[Rocket.scala 187:19]
  wire  csr_io_rocc_interrupt; // @[Rocket.scala 187:19]
  wire  csr_io_interrupt; // @[Rocket.scala 187:19]
  wire [63:0] csr_io_interrupt_cause; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_action; // @[Rocket.scala 187:19]
  wire [1:0] csr_io_bp_0_control_tmatch; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_m; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_s; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_u; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_x; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_w; // @[Rocket.scala 187:19]
  wire  csr_io_bp_0_control_r; // @[Rocket.scala 187:19]
  wire [38:0] csr_io_bp_0_address; // @[Rocket.scala 187:19]
  wire  bpu_io_status_debug; // @[Rocket.scala 215:19]
  wire [1:0] bpu_io_status_prv; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_action; // @[Rocket.scala 215:19]
  wire [1:0] bpu_io_bp_0_control_tmatch; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_m; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_s; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_u; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_x; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_w; // @[Rocket.scala 215:19]
  wire  bpu_io_bp_0_control_r; // @[Rocket.scala 215:19]
  wire [38:0] bpu_io_bp_0_address; // @[Rocket.scala 215:19]
  wire [38:0] bpu_io_pc; // @[Rocket.scala 215:19]
  wire [38:0] bpu_io_ea; // @[Rocket.scala 215:19]
  wire  bpu_io_xcpt_if; // @[Rocket.scala 215:19]
  wire  bpu_io_xcpt_ld; // @[Rocket.scala 215:19]
  wire  bpu_io_xcpt_st; // @[Rocket.scala 215:19]
  wire  bpu_io_debug_if; // @[Rocket.scala 215:19]
  wire  bpu_io_debug_ld; // @[Rocket.scala 215:19]
  wire  bpu_io_debug_st; // @[Rocket.scala 215:19]
  wire  alu_io_dw; // @[Rocket.scala 261:19]
  wire [3:0] alu_io_fn; // @[Rocket.scala 261:19]
  wire [63:0] alu_io_in2; // @[Rocket.scala 261:19]
  wire [63:0] alu_io_in1; // @[Rocket.scala 261:19]
  wire [63:0] alu_io_out; // @[Rocket.scala 261:19]
  wire [63:0] alu_io_adder_out; // @[Rocket.scala 261:19]
  wire  alu_io_cmp_out; // @[Rocket.scala 261:19]
  wire  div_clock; // @[Rocket.scala 268:19]
  wire  div_reset; // @[Rocket.scala 268:19]
  wire  div_io_req_ready; // @[Rocket.scala 268:19]
  wire  div_io_req_valid; // @[Rocket.scala 268:19]
  wire [3:0] div_io_req_bits_fn; // @[Rocket.scala 268:19]
  wire  div_io_req_bits_dw; // @[Rocket.scala 268:19]
  wire [63:0] div_io_req_bits_in1; // @[Rocket.scala 268:19]
  wire [63:0] div_io_req_bits_in2; // @[Rocket.scala 268:19]
  wire [4:0] div_io_req_bits_tag; // @[Rocket.scala 268:19]
  wire  div_io_kill; // @[Rocket.scala 268:19]
  wire  div_io_resp_ready; // @[Rocket.scala 268:19]
  wire  div_io_resp_valid; // @[Rocket.scala 268:19]
  wire [63:0] div_io_resp_bits_data; // @[Rocket.scala 268:19]
  wire [4:0] div_io_resp_bits_tag; // @[Rocket.scala 268:19]
  reg  ex_ctrl_fp; // @[Rocket.scala 115:20]
  reg  ex_ctrl_branch; // @[Rocket.scala 115:20]
  reg  ex_ctrl_jal; // @[Rocket.scala 115:20]
  reg  ex_ctrl_jalr; // @[Rocket.scala 115:20]
  reg  ex_ctrl_rxs2; // @[Rocket.scala 115:20]
  reg [1:0] ex_ctrl_sel_alu2; // @[Rocket.scala 115:20]
  reg [1:0] ex_ctrl_sel_alu1; // @[Rocket.scala 115:20]
  reg [2:0] ex_ctrl_sel_imm; // @[Rocket.scala 115:20]
  reg  ex_ctrl_alu_dw; // @[Rocket.scala 115:20]
  reg [3:0] ex_ctrl_alu_fn; // @[Rocket.scala 115:20]
  reg  ex_ctrl_mem; // @[Rocket.scala 115:20]
  reg [4:0] ex_ctrl_mem_cmd; // @[Rocket.scala 115:20]
  reg [2:0] ex_ctrl_mem_type; // @[Rocket.scala 115:20]
  reg  ex_ctrl_wfd; // @[Rocket.scala 115:20]
  reg  ex_ctrl_div; // @[Rocket.scala 115:20]
  reg  ex_ctrl_wxd; // @[Rocket.scala 115:20]
  reg [2:0] ex_ctrl_csr; // @[Rocket.scala 115:20]
  reg  ex_ctrl_fence_i; // @[Rocket.scala 115:20]
  reg  mem_ctrl_fp; // @[Rocket.scala 116:21]
  reg  mem_ctrl_branch; // @[Rocket.scala 116:21]
  reg  mem_ctrl_jal; // @[Rocket.scala 116:21]
  reg  mem_ctrl_jalr; // @[Rocket.scala 116:21]
  reg  mem_ctrl_mem; // @[Rocket.scala 116:21]
  reg  mem_ctrl_wfd; // @[Rocket.scala 116:21]
  reg  mem_ctrl_div; // @[Rocket.scala 116:21]
  reg  mem_ctrl_wxd; // @[Rocket.scala 116:21]
  reg [2:0] mem_ctrl_csr; // @[Rocket.scala 116:21]
  reg  mem_ctrl_fence_i; // @[Rocket.scala 116:21]
  reg  wb_ctrl_mem; // @[Rocket.scala 117:20]
  reg  wb_ctrl_wfd; // @[Rocket.scala 117:20]
  reg  wb_ctrl_div; // @[Rocket.scala 117:20]
  reg  wb_ctrl_wxd; // @[Rocket.scala 117:20]
  reg [2:0] wb_ctrl_csr; // @[Rocket.scala 117:20]
  reg  wb_ctrl_fence_i; // @[Rocket.scala 117:20]
  reg  ex_reg_xcpt_interrupt; // @[Rocket.scala 119:35]
  reg  ex_reg_valid; // @[Rocket.scala 120:35]
  reg  ex_reg_rvc; // @[Rocket.scala 121:35]
  reg  ex_reg_btb_hit; // @[Rocket.scala 122:35]
  reg  ex_reg_btb_resp_taken; // @[Rocket.scala 123:35]
  reg [1:0] ex_reg_btb_resp_mask; // @[Rocket.scala 123:35]
  reg  ex_reg_btb_resp_bridx; // @[Rocket.scala 123:35]
  reg [38:0] ex_reg_btb_resp_target; // @[Rocket.scala 123:35]
  reg [5:0] ex_reg_btb_resp_entry; // @[Rocket.scala 123:35]
  reg [6:0] ex_reg_btb_resp_bht_history; // @[Rocket.scala 123:35]
  reg [1:0] ex_reg_btb_resp_bht_value; // @[Rocket.scala 123:35]
  reg  ex_reg_xcpt; // @[Rocket.scala 124:35]
  reg  ex_reg_flush_pipe; // @[Rocket.scala 125:35]
  reg  ex_reg_load_use; // @[Rocket.scala 126:35]
  reg [63:0] ex_cause; // @[Rocket.scala 127:35]
  reg  ex_reg_replay; // @[Rocket.scala 128:26]
  reg [39:0] ex_reg_pc; // @[Rocket.scala 129:22]
  reg [31:0] ex_reg_inst; // @[Rocket.scala 130:24]
  reg  mem_reg_xcpt_interrupt; // @[Rocket.scala 132:36]
  reg  mem_reg_valid; // @[Rocket.scala 133:36]
  reg  mem_reg_rvc; // @[Rocket.scala 134:36]
  reg  mem_reg_btb_hit; // @[Rocket.scala 135:36]
  reg  mem_reg_btb_resp_taken; // @[Rocket.scala 136:36]
  reg [1:0] mem_reg_btb_resp_mask; // @[Rocket.scala 136:36]
  reg  mem_reg_btb_resp_bridx; // @[Rocket.scala 136:36]
  reg [38:0] mem_reg_btb_resp_target; // @[Rocket.scala 136:36]
  reg [5:0] mem_reg_btb_resp_entry; // @[Rocket.scala 136:36]
  reg [6:0] mem_reg_btb_resp_bht_history; // @[Rocket.scala 136:36]
  reg [1:0] mem_reg_btb_resp_bht_value; // @[Rocket.scala 136:36]
  reg  mem_reg_xcpt; // @[Rocket.scala 137:36]
  reg  mem_reg_replay; // @[Rocket.scala 138:36]
  reg  mem_reg_flush_pipe; // @[Rocket.scala 139:36]
  reg [63:0] mem_reg_cause; // @[Rocket.scala 140:36]
  reg  mem_reg_slow_bypass; // @[Rocket.scala 141:36]
  reg  mem_reg_load; // @[Rocket.scala 142:36]
  reg  mem_reg_store; // @[Rocket.scala 143:36]
  reg [39:0] mem_reg_pc; // @[Rocket.scala 144:23]
  reg [31:0] mem_reg_inst; // @[Rocket.scala 145:25]
  reg [63:0] mem_reg_wdata; // @[Rocket.scala 146:26]
  reg [63:0] mem_reg_rs2; // @[Rocket.scala 147:24]
  reg  wb_reg_valid; // @[Rocket.scala 150:35]
  reg  wb_reg_xcpt; // @[Rocket.scala 151:35]
  reg  wb_reg_replay; // @[Rocket.scala 152:35]
  reg [63:0] wb_reg_cause; // @[Rocket.scala 153:35]
  reg [39:0] wb_reg_pc; // @[Rocket.scala 154:22]
  reg [31:0] wb_reg_inst; // @[Rocket.scala 155:24]
  reg [63:0] wb_reg_wdata; // @[Rocket.scala 156:25]
  wire  replay_wb_common = io_dmem_s2_nack | wb_reg_replay; // @[Rocket.scala 416:42]
  wire  take_pc_wb = replay_wb_common | wb_reg_xcpt | csr_io_eret; // @[Rocket.scala 420:38]
  wire  ex_pc_valid = ex_reg_valid | ex_reg_replay | ex_reg_xcpt_interrupt; // @[Rocket.scala 323:51]
  wire [1:0] _T_4003 = mem_reg_wdata[39:38]; // @[Rocket.scala 654:39]
  wire [25:0] _T_4011 = mem_reg_wdata[63:38]; // @[Rocket.scala 657:13]
  wire  _T_4021 = $signed(_T_4011) == -26'sh1 | $signed(_T_4011) == -26'sh2 ? $signed(_T_4003) == -2'sh1 : _T_4003[0]; // @[Rocket.scala 657:10]
  wire  _T_4022 = mem_reg_wdata[63:38] == 26'h0 | mem_reg_wdata[63:38] == 26'h1 ? $signed(_T_4003) != 2'sh0 : _T_4021; // @[Rocket.scala 656:10]
  wire [39:0] _T_4025 = {_T_4022,mem_reg_wdata[38:0]}; // @[Rocket.scala 343:88]
  wire  mem_br_taken = mem_reg_wdata[0]; // @[Rocket.scala 338:35]
  wire  _T_3821 = mem_ctrl_branch & mem_br_taken; // @[Rocket.scala 340:25]
  wire  _T_3827 = mem_reg_inst[31]; // @[Rocket.scala 704:53]
  wire  _T_3902 = mem_reg_inst[31]; // @[Cat.scala 30:58]
  wire [10:0] _T_3901 = {11{_T_3827}}; // @[Cat.scala 30:58]
  wire [7:0] _T_3899 = {8{_T_3827}}; // @[Cat.scala 30:58]
  wire  _T_3898 = mem_reg_inst[7]; // @[Cat.scala 30:58]
  wire [31:0] _T_3906 = {_T_3902,_T_3901,_T_3899,_T_3898,mem_reg_inst[30:25],mem_reg_inst[11:8],1'h0}; // @[Rocket.scala 718:53]
  wire [7:0] _T_3986 = mem_reg_inst[19:12]; // @[Cat.scala 30:58]
  wire  _T_3985 = mem_reg_inst[20]; // @[Cat.scala 30:58]
  wire [31:0] _T_3993 = {_T_3902,_T_3901,_T_3986,_T_3985,mem_reg_inst[30:25],mem_reg_inst[24:21],1'h0}; // @[Rocket.scala 718:53]
  wire [3:0] _T_3996 = mem_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); // @[Rocket.scala 342:8]
  wire [31:0] _T_3997 = mem_ctrl_jal ? $signed(_T_3993) : $signed({{28{_T_3996[3]}},_T_3996}); // @[Rocket.scala 341:8]
  wire [31:0] _T_3998 = mem_ctrl_branch & mem_br_taken ? $signed(_T_3906) : $signed(_T_3997); // @[Rocket.scala 340:8]
  wire [39:0] _GEN_128 = {{8{_T_3998[31]}},_T_3998}; // @[Rocket.scala 339:41]
  wire [39:0] mem_br_target = $signed(mem_reg_pc) + $signed(_GEN_128); // @[Rocket.scala 339:41]
  wire [39:0] _T_4026 = mem_ctrl_jalr ? $signed(_T_4025) : $signed(mem_br_target); // @[Rocket.scala 343:21]
  wire [39:0] mem_npc = $signed(_T_4026) & -40'sh2; // @[Rocket.scala 343:123]
  wire  _T_4033 = ibuf_io_inst_0_valid ? mem_npc != ibuf_io_pc : 1'h1; // @[Rocket.scala 344:66]
  wire  mem_misprediction = ex_pc_valid ? mem_npc != ex_reg_pc : _T_4033; // @[Rocket.scala 344:26]
  wire  take_pc_mem = mem_reg_valid & (mem_misprediction | mem_reg_flush_pipe); // @[Rocket.scala 351:32]
  wire  take_pc_mem_wb = take_pc_wb | take_pc_mem; // @[Rocket.scala 161:35]
  wire [31:0] _T_2856 = ibuf_io_inst_0_bits_inst_bits & 32'h44; // @[Decode.scala 13:65]
  wire  _T_2858 = _T_2856 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2860 = ibuf_io_inst_0_bits_inst_bits & 32'h4024; // @[Decode.scala 13:65]
  wire  _T_2862 = _T_2860 == 32'h20; // @[Decode.scala 13:121]
  wire [31:0] _T_2864 = ibuf_io_inst_0_bits_inst_bits & 32'h38; // @[Decode.scala 13:65]
  wire  _T_2866 = _T_2864 == 32'h20; // @[Decode.scala 13:121]
  wire [31:0] _T_2868 = ibuf_io_inst_0_bits_inst_bits & 32'h2050; // @[Decode.scala 13:65]
  wire  _T_2870 = _T_2868 == 32'h2000; // @[Decode.scala 13:121]
  wire [31:0] _T_2872 = ibuf_io_inst_0_bits_inst_bits & 32'h90000034; // @[Decode.scala 13:65]
  wire  _T_2874 = _T_2872 == 32'h90000010; // @[Decode.scala 13:121]
  wire  id_ctrl_rxs1 = _T_2858 | _T_2862 | _T_2866 | _T_2870 | _T_2874; // @[Decode.scala 14:30]
  wire  _T_4233 = id_ctrl_rxs1 & ibuf_io_inst_0_bits_inst_rs1 != 5'h0; // @[Rocket.scala 479:42]
  wire [4:0] ex_waddr = ex_reg_inst[11:7]; // @[Rocket.scala 235:29]
  wire  _T_4275 = ibuf_io_inst_0_bits_inst_rs1 == ex_waddr; // @[Rocket.scala 494:70]
  wire [31:0] _T_2835 = ibuf_io_inst_0_bits_inst_bits & 32'h64; // @[Decode.scala 13:65]
  wire  _T_2837 = _T_2835 == 32'h20; // @[Decode.scala 13:121]
  wire [31:0] _T_2839 = ibuf_io_inst_0_bits_inst_bits & 32'h34; // @[Decode.scala 13:65]
  wire  _T_2841 = _T_2839 == 32'h20; // @[Decode.scala 13:121]
  wire [31:0] _T_2843 = ibuf_io_inst_0_bits_inst_bits & 32'h2048; // @[Decode.scala 13:65]
  wire  _T_2845 = _T_2843 == 32'h2008; // @[Decode.scala 13:121]
  wire [31:0] _T_2847 = ibuf_io_inst_0_bits_inst_bits & 32'h42003024; // @[Decode.scala 13:65]
  wire  _T_2849 = _T_2847 == 32'h2000020; // @[Decode.scala 13:121]
  wire  id_ctrl_rxs2 = _T_2837 | _T_2841 | _T_2845 | _T_2849; // @[Decode.scala 14:30]
  wire  _T_4236 = id_ctrl_rxs2 & ibuf_io_inst_0_bits_inst_rs2 != 5'h0; // @[Rocket.scala 480:42]
  wire  _T_4277 = ibuf_io_inst_0_bits_inst_rs2 == ex_waddr; // @[Rocket.scala 494:70]
  wire  _T_3240 = _T_2835 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_3242 = ibuf_io_inst_0_bits_inst_bits & 32'h50; // @[Decode.scala 13:65]
  wire  _T_3244 = _T_3242 == 32'h10; // @[Decode.scala 13:121]
  wire [31:0] _T_3246 = ibuf_io_inst_0_bits_inst_bits & 32'h2024; // @[Decode.scala 13:65]
  wire  _T_3248 = _T_3246 == 32'h24; // @[Decode.scala 13:121]
  wire [31:0] _T_3250 = ibuf_io_inst_0_bits_inst_bits & 32'h28; // @[Decode.scala 13:65]
  wire  _T_3252 = _T_3250 == 32'h28; // @[Decode.scala 13:121]
  wire [31:0] _T_3254 = ibuf_io_inst_0_bits_inst_bits & 32'h1030; // @[Decode.scala 13:65]
  wire  _T_3256 = _T_3254 == 32'h1030; // @[Decode.scala 13:121]
  wire [31:0] _T_3258 = ibuf_io_inst_0_bits_inst_bits & 32'h2030; // @[Decode.scala 13:65]
  wire  _T_3260 = _T_3258 == 32'h2030; // @[Decode.scala 13:121]
  wire [31:0] _T_3262 = ibuf_io_inst_0_bits_inst_bits & 32'h90000010; // @[Decode.scala 13:65]
  wire  _T_3264 = _T_3262 == 32'h80000010; // @[Decode.scala 13:121]
  wire  id_ctrl_wxd = _T_3240 | _T_3244 | _T_3248 | _T_3252 | _T_3256 | _T_3260 | _T_3264; // @[Decode.scala 14:30]
  wire  _T_4239 = id_ctrl_wxd & ibuf_io_inst_0_bits_inst_rd != 5'h0; // @[Rocket.scala 481:42]
  wire  _T_4279 = ibuf_io_inst_0_bits_inst_rd == ex_waddr; // @[Rocket.scala 494:70]
  wire  _T_4282 = _T_4233 & _T_4275 | _T_4236 & _T_4277 | _T_4239 & _T_4279; // @[Rocket.scala 648:50]
  wire  data_hazard_ex = ex_ctrl_wxd & _T_4282; // @[Rocket.scala 494:36]
  wire  ex_cannot_bypass = ex_ctrl_csr != 3'h0 | ex_ctrl_jalr | ex_ctrl_mem | ex_ctrl_div | ex_ctrl_fp; // @[Rocket.scala 493:94]
  wire  _T_4287 = ibuf_io_inst_0_bits_inst_rs3 == ex_waddr; // @[Rocket.scala 495:76]
  wire  _T_4293 = io_fpu_dec_ren1 & _T_4275 | io_fpu_dec_ren2 & _T_4277 | io_fpu_dec_ren3 & _T_4287 | io_fpu_dec_wen &
    _T_4279; // @[Rocket.scala 648:50]
  wire  fp_data_hazard_ex = ex_ctrl_wfd & _T_4293; // @[Rocket.scala 495:39]
  wire  id_ex_hazard = ex_reg_valid & (data_hazard_ex & ex_cannot_bypass | fp_data_hazard_ex); // @[Rocket.scala 496:35]
  wire [4:0] mem_waddr = mem_reg_inst[11:7]; // @[Rocket.scala 236:31]
  wire  _T_4303 = ibuf_io_inst_0_bits_inst_rs1 == mem_waddr; // @[Rocket.scala 503:72]
  wire  _T_4305 = ibuf_io_inst_0_bits_inst_rs2 == mem_waddr; // @[Rocket.scala 503:72]
  wire  _T_4307 = ibuf_io_inst_0_bits_inst_rd == mem_waddr; // @[Rocket.scala 503:72]
  wire  _T_4310 = _T_4233 & _T_4303 | _T_4236 & _T_4305 | _T_4239 & _T_4307; // @[Rocket.scala 648:50]
  wire  data_hazard_mem = mem_ctrl_wxd & _T_4310; // @[Rocket.scala 503:38]
  wire  mem_cannot_bypass = mem_ctrl_csr != 3'h0 | mem_ctrl_mem & mem_reg_slow_bypass | mem_ctrl_div | mem_ctrl_fp; // @[Rocket.scala 502:100]
  wire  _T_4315 = ibuf_io_inst_0_bits_inst_rs3 == mem_waddr; // @[Rocket.scala 504:78]
  wire  _T_4321 = io_fpu_dec_ren1 & _T_4303 | io_fpu_dec_ren2 & _T_4305 | io_fpu_dec_ren3 & _T_4315 | io_fpu_dec_wen &
    _T_4307; // @[Rocket.scala 648:50]
  wire  fp_data_hazard_mem = mem_ctrl_wfd & _T_4321; // @[Rocket.scala 504:41]
  wire  id_mem_hazard = mem_reg_valid & (data_hazard_mem & mem_cannot_bypass | fp_data_hazard_mem); // @[Rocket.scala 505:37]
  wire [4:0] wb_waddr = wb_reg_inst[11:7]; // @[Rocket.scala 237:29]
  wire  _T_4326 = ibuf_io_inst_0_bits_inst_rs1 == wb_waddr; // @[Rocket.scala 509:70]
  wire  _T_4328 = ibuf_io_inst_0_bits_inst_rs2 == wb_waddr; // @[Rocket.scala 509:70]
  wire  _T_4330 = ibuf_io_inst_0_bits_inst_rd == wb_waddr; // @[Rocket.scala 509:70]
  wire  _T_4333 = _T_4233 & _T_4326 | _T_4236 & _T_4328 | _T_4239 & _T_4330; // @[Rocket.scala 648:50]
  wire  data_hazard_wb = wb_ctrl_wxd & _T_4333; // @[Rocket.scala 509:36]
  wire  wb_dcache_miss = wb_ctrl_mem & ~io_dmem_resp_valid; // @[Rocket.scala 324:36]
  wire  wb_set_sboard = wb_ctrl_div | wb_dcache_miss; // @[Rocket.scala 415:35]
  wire  _T_4338 = ibuf_io_inst_0_bits_inst_rs3 == wb_waddr; // @[Rocket.scala 510:76]
  wire  _T_4344 = io_fpu_dec_ren1 & _T_4326 | io_fpu_dec_ren2 & _T_4328 | io_fpu_dec_ren3 & _T_4338 | io_fpu_dec_wen &
    _T_4330; // @[Rocket.scala 648:50]
  wire  fp_data_hazard_wb = wb_ctrl_wfd & _T_4344; // @[Rocket.scala 510:39]
  wire  id_wb_hazard = wb_reg_valid & (data_hazard_wb & wb_set_sboard | fp_data_hazard_wb); // @[Rocket.scala 511:35]
  reg [31:0] _T_4241; // @[Rocket.scala 668:25]
  wire [31:0] _T_4243 = {_T_4241[31:1], 1'h0}; // @[Rocket.scala 669:40]
  wire [31:0] _T_4252 = _T_4243 >> ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 665:35]
  wire [31:0] _T_4255 = _T_4243 >> ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 665:35]
  wire [31:0] _T_4258 = _T_4243 >> ibuf_io_inst_0_bits_inst_rd; // @[Rocket.scala 665:35]
  wire  id_sboard_hazard = _T_4233 & _T_4252[0] | _T_4236 & _T_4255[0] | _T_4239 & _T_4258[0]; // @[Rocket.scala 648:50]
  wire [31:0] _T_2805 = ibuf_io_inst_0_bits_inst_bits & 32'h5c; // @[Decode.scala 13:65]
  wire  _T_2807 = _T_2805 == 32'h4; // @[Decode.scala 13:121]
  wire [31:0] _T_2809 = ibuf_io_inst_0_bits_inst_bits & 32'h60; // @[Decode.scala 13:65]
  wire  _T_2811 = _T_2809 == 32'h40; // @[Decode.scala 13:121]
  wire  id_ctrl_fp = _T_2807 | _T_2811; // @[Decode.scala 14:30]
  wire [31:0] _T_3286 = ibuf_io_inst_0_bits_inst_bits & 32'h3070; // @[Decode.scala 13:65]
  wire  _T_3288 = _T_3286 == 32'h70; // @[Decode.scala 13:121]
  wire [31:0] _T_3280 = ibuf_io_inst_0_bits_inst_bits & 32'h2070; // @[Decode.scala 13:65]
  wire  _T_3282 = _T_3280 == 32'h2070; // @[Decode.scala 13:121]
  wire [31:0] _T_3274 = ibuf_io_inst_0_bits_inst_bits & 32'h1070; // @[Decode.scala 13:65]
  wire  _T_3276 = _T_3274 == 32'h1070; // @[Decode.scala 13:121]
  wire [2:0] id_ctrl_csr = {_T_3288,_T_3282,_T_3276}; // @[Cat.scala 30:58]
  wire  _T_3453 = id_ctrl_csr == 3'h2 | id_ctrl_csr == 3'h3; // @[Package.scala 7:62]
  wire  id_csr_en = id_ctrl_csr == 3'h2 | id_ctrl_csr == 3'h3 | id_ctrl_csr == 3'h1; // @[Package.scala 7:62]
  reg [31:0] _T_4348; // @[Rocket.scala 668:25]
  wire [31:0] _T_4377 = _T_4348 >> ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 665:35]
  wire [31:0] _T_4380 = _T_4348 >> ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 665:35]
  wire [31:0] _T_4383 = _T_4348 >> ibuf_io_inst_0_bits_inst_rs3; // @[Rocket.scala 665:35]
  wire [31:0] _T_4386 = _T_4348 >> ibuf_io_inst_0_bits_inst_rd; // @[Rocket.scala 665:35]
  wire  _T_4391 = io_fpu_dec_ren1 & _T_4377[0] | io_fpu_dec_ren2 & _T_4380[0] | io_fpu_dec_ren3 & _T_4383[0] |
    io_fpu_dec_wen & _T_4386[0]; // @[Rocket.scala 648:50]
  wire  id_stall_fpu = id_csr_en & ~io_fpu_fcsr_rdy | _T_4391; // @[Rocket.scala 519:35]
  wire  _T_4408 = id_ctrl_fp & id_stall_fpu; // @[Rocket.scala 529:16]
  wire  _T_4409 = id_ex_hazard | id_mem_hazard | id_wb_hazard | id_sboard_hazard | _T_4408; // @[Rocket.scala 528:71]
  wire [31:0] _T_3083 = ibuf_io_inst_0_bits_inst_bits & 32'h405f; // @[Decode.scala 13:65]
  wire  _T_3085 = _T_3083 == 32'h3; // @[Decode.scala 13:121]
  wire [31:0] _T_2603 = ibuf_io_inst_0_bits_inst_bits & 32'h207f; // @[Decode.scala 13:65]
  wire  _T_2605 = _T_2603 == 32'h3; // @[Decode.scala 13:121]
  wire [31:0] _T_3087 = ibuf_io_inst_0_bits_inst_bits & 32'h107f; // @[Decode.scala 13:65]
  wire  _T_3089 = _T_3087 == 32'h3; // @[Decode.scala 13:121]
  wire [31:0] _T_3091 = ibuf_io_inst_0_bits_inst_bits & 32'h707f; // @[Decode.scala 13:65]
  wire  _T_3093 = _T_3091 == 32'h100f; // @[Decode.scala 13:121]
  wire [31:0] _T_2659 = ibuf_io_inst_0_bits_inst_bits & 32'h605b; // @[Decode.scala 13:65]
  wire  _T_2661 = _T_2659 == 32'h2003; // @[Decode.scala 13:121]
  wire [31:0] _T_2667 = ibuf_io_inst_0_bits_inst_bits & 32'h1800607f; // @[Decode.scala 13:65]
  wire  _T_2669 = _T_2667 == 32'h202f; // @[Decode.scala 13:121]
  wire [31:0] _T_2691 = ibuf_io_inst_0_bits_inst_bits & 32'he800607f; // @[Decode.scala 13:65]
  wire  _T_2693 = _T_2691 == 32'h800202f; // @[Decode.scala 13:121]
  wire [31:0] _T_2695 = ibuf_io_inst_0_bits_inst_bits & 32'hf9f0607f; // @[Decode.scala 13:65]
  wire  _T_2697 = _T_2695 == 32'h1000202f; // @[Decode.scala 13:121]
  wire  id_ctrl_mem = _T_3085 | _T_2605 | _T_3089 | _T_3093 | _T_2661 | _T_2669 | _T_2693 | _T_2697; // @[Decode.scala 14:30]
  reg  dcache_blocked; // @[Rocket.scala 522:27]
  wire  _T_4410 = id_ctrl_mem & dcache_blocked; // @[Rocket.scala 530:17]
  wire  _T_4411 = _T_4409 | _T_4410; // @[Rocket.scala 529:32]
  wire [31:0] _T_3232 = ibuf_io_inst_0_bits_inst_bits & 32'h2000074; // @[Decode.scala 13:65]
  wire  id_ctrl_div = _T_3232 == 32'h2000030; // @[Decode.scala 13:121]
  wire  wb_wxd = wb_reg_valid & wb_ctrl_wxd; // @[Rocket.scala 414:29]
  wire  _T_4415 = ~wb_wxd; // @[Rocket.scala 532:65]
  wire  _T_4421 = id_ctrl_div & (~(div_io_req_ready | div_io_resp_valid & ~wb_wxd) | div_io_req_valid); // @[Rocket.scala 532:17]
  wire  _T_4422 = _T_4411 | _T_4421; // @[Rocket.scala 531:34]
  wire [31:0] _T_3300 = ibuf_io_inst_0_bits_inst_bits & 32'h3058; // @[Decode.scala 13:65]
  wire  id_ctrl_fence = _T_3300 == 32'h8; // @[Decode.scala 13:121]
  wire  id_mem_busy = ~io_dmem_ordered | io_dmem_req_valid; // @[Rocket.scala 207:38]
  wire [31:0] _T_3306 = ibuf_io_inst_0_bits_inst_bits & 32'h6048; // @[Decode.scala 13:65]
  wire  id_ctrl_amo = _T_3306 == 32'h2008; // @[Decode.scala 13:121]
  wire  id_amo_aq = ibuf_io_inst_0_bits_inst_bits[26]; // @[Rocket.scala 204:29]
  wire  id_ctrl_fence_i = _T_3300 == 32'h1008; // @[Decode.scala 13:121]
  reg  id_reg_fence; // @[Rocket.scala 178:25]
  wire  id_do_fence = id_mem_busy & (id_ctrl_amo & id_amo_aq | id_ctrl_fence_i | id_reg_fence & id_ctrl_mem); // @[Rocket.scala 213:17]
  wire  _T_4423 = _T_4422 | id_do_fence; // @[Rocket.scala 532:96]
  wire  ctrl_stalld = _T_4423 | csr_io_csr_stall; // @[Rocket.scala 533:17]
  wire  ctrl_killd = ~ibuf_io_inst_0_valid | ibuf_io_inst_0_bits_replay | take_pc_mem_wb | ctrl_stalld |
    csr_io_interrupt; // @[Rocket.scala 535:104]
  wire  _T_3444 = ~ctrl_killd; // @[Rocket.scala 185:34]
  wire [31:0] _T_2823 = ibuf_io_inst_0_bits_inst_bits & 32'h68; // @[Decode.scala 13:65]
  wire  id_ctrl_jal = _T_2823 == 32'h68; // @[Decode.scala 13:121]
  wire [31:0] _T_2607 = ibuf_io_inst_0_bits_inst_bits & 32'h106f; // @[Decode.scala 13:65]
  wire  _T_2609 = _T_2607 == 32'h3; // @[Decode.scala 13:121]
  wire [31:0] _T_2611 = ibuf_io_inst_0_bits_inst_bits & 32'h607f; // @[Decode.scala 13:65]
  wire  _T_2613 = _T_2611 == 32'hf; // @[Decode.scala 13:121]
  wire [31:0] _T_2615 = ibuf_io_inst_0_bits_inst_bits & 32'h7077; // @[Decode.scala 13:65]
  wire  _T_2617 = _T_2615 == 32'h13; // @[Decode.scala 13:121]
  wire [31:0] _T_2619 = ibuf_io_inst_0_bits_inst_bits & 32'h5f; // @[Decode.scala 13:65]
  wire  _T_2621 = _T_2619 == 32'h17; // @[Decode.scala 13:121]
  wire [31:0] _T_2623 = ibuf_io_inst_0_bits_inst_bits & 32'hfc00007f; // @[Decode.scala 13:65]
  wire  _T_2625 = _T_2623 == 32'h33; // @[Decode.scala 13:121]
  wire [31:0] _T_2627 = ibuf_io_inst_0_bits_inst_bits & 32'hbe007077; // @[Decode.scala 13:65]
  wire  _T_2629 = _T_2627 == 32'h33; // @[Decode.scala 13:121]
  wire [31:0] _T_2631 = ibuf_io_inst_0_bits_inst_bits & 32'h4000073; // @[Decode.scala 13:65]
  wire  _T_2633 = _T_2631 == 32'h43; // @[Decode.scala 13:121]
  wire [31:0] _T_2635 = ibuf_io_inst_0_bits_inst_bits & 32'he400007f; // @[Decode.scala 13:65]
  wire  _T_2637 = _T_2635 == 32'h53; // @[Decode.scala 13:121]
  wire [31:0] _T_2639 = ibuf_io_inst_0_bits_inst_bits & 32'h707b; // @[Decode.scala 13:65]
  wire  _T_2641 = _T_2639 == 32'h63; // @[Decode.scala 13:121]
  wire [31:0] _T_2643 = ibuf_io_inst_0_bits_inst_bits & 32'h7f; // @[Decode.scala 13:65]
  wire  _T_2645 = _T_2643 == 32'h6f; // @[Decode.scala 13:121]
  wire [31:0] _T_2647 = ibuf_io_inst_0_bits_inst_bits & 32'hffefffff; // @[Decode.scala 13:65]
  wire  _T_2649 = _T_2647 == 32'h73; // @[Decode.scala 13:121]
  wire [31:0] _T_2651 = ibuf_io_inst_0_bits_inst_bits & 32'hfc00305f; // @[Decode.scala 13:65]
  wire  _T_2653 = _T_2651 == 32'h1013; // @[Decode.scala 13:121]
  wire [31:0] _T_2655 = ibuf_io_inst_0_bits_inst_bits & 32'hfe00305f; // @[Decode.scala 13:65]
  wire  _T_2657 = _T_2655 == 32'h101b; // @[Decode.scala 13:121]
  wire  _T_2665 = _T_2603 == 32'h2013; // @[Decode.scala 13:121]
  wire  _T_2673 = _T_2603 == 32'h2073; // @[Decode.scala 13:121]
  wire [31:0] _T_2675 = ibuf_io_inst_0_bits_inst_bits & 32'hbc00707f; // @[Decode.scala 13:65]
  wire  _T_2677 = _T_2675 == 32'h5013; // @[Decode.scala 13:121]
  wire [31:0] _T_2679 = ibuf_io_inst_0_bits_inst_bits & 32'hbe00705f; // @[Decode.scala 13:65]
  wire  _T_2681 = _T_2679 == 32'h501b; // @[Decode.scala 13:121]
  wire  _T_2685 = _T_2627 == 32'h5033; // @[Decode.scala 13:121]
  wire [31:0] _T_2687 = ibuf_io_inst_0_bits_inst_bits & 32'hfe004077; // @[Decode.scala 13:65]
  wire  _T_2689 = _T_2687 == 32'h2004033; // @[Decode.scala 13:121]
  wire [31:0] _T_2699 = ibuf_io_inst_0_bits_inst_bits & 32'hdfffffff; // @[Decode.scala 13:65]
  wire  _T_2701 = _T_2699 == 32'h10200073; // @[Decode.scala 13:121]
  wire  _T_2703 = ibuf_io_inst_0_bits_inst_bits == 32'h10500073; // @[Decode.scala 13:121]
  wire [31:0] _T_2705 = ibuf_io_inst_0_bits_inst_bits & 32'hfe007fff; // @[Decode.scala 13:65]
  wire  _T_2707 = _T_2705 == 32'h12000073; // @[Decode.scala 13:121]
  wire [31:0] _T_2709 = ibuf_io_inst_0_bits_inst_bits & 32'hf400607f; // @[Decode.scala 13:65]
  wire  _T_2711 = _T_2709 == 32'h20000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2713 = ibuf_io_inst_0_bits_inst_bits & 32'h7c00607f; // @[Decode.scala 13:65]
  wire  _T_2715 = _T_2713 == 32'h20000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2717 = ibuf_io_inst_0_bits_inst_bits & 32'h7c00507f; // @[Decode.scala 13:65]
  wire  _T_2719 = _T_2717 == 32'h20000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2721 = ibuf_io_inst_0_bits_inst_bits & 32'h7ff0007f; // @[Decode.scala 13:65]
  wire  _T_2723 = _T_2721 == 32'h40100053; // @[Decode.scala 13:121]
  wire  _T_2727 = _T_2721 == 32'h42000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2729 = ibuf_io_inst_0_bits_inst_bits & 32'hfdf0007f; // @[Decode.scala 13:65]
  wire  _T_2731 = _T_2729 == 32'h58000053; // @[Decode.scala 13:121]
  wire  _T_2733 = ibuf_io_inst_0_bits_inst_bits == 32'h7b200073; // @[Decode.scala 13:121]
  wire [31:0] _T_2735 = ibuf_io_inst_0_bits_inst_bits & 32'hedc0007f; // @[Decode.scala 13:65]
  wire  _T_2737 = _T_2735 == 32'hc0000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2739 = ibuf_io_inst_0_bits_inst_bits & 32'hfdf0607f; // @[Decode.scala 13:65]
  wire  _T_2741 = _T_2739 == 32'he0000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2743 = ibuf_io_inst_0_bits_inst_bits & 32'hedf0707f; // @[Decode.scala 13:65]
  wire  _T_2745 = _T_2743 == 32'he0000053; // @[Decode.scala 13:121]
  wire [31:0] _T_2747 = ibuf_io_inst_0_bits_inst_bits & 32'h603f; // @[Decode.scala 13:65]
  wire  _T_2749 = _T_2747 == 32'h23; // @[Decode.scala 13:121]
  wire [31:0] _T_2751 = ibuf_io_inst_0_bits_inst_bits & 32'h306f; // @[Decode.scala 13:65]
  wire  _T_2753 = _T_2751 == 32'h1063; // @[Decode.scala 13:121]
  wire [31:0] _T_2755 = ibuf_io_inst_0_bits_inst_bits & 32'h407f; // @[Decode.scala 13:65]
  wire  _T_2757 = _T_2755 == 32'h4063; // @[Decode.scala 13:121]
  wire [31:0] _T_2759 = ibuf_io_inst_0_bits_inst_bits & 32'hfc007077; // @[Decode.scala 13:65]
  wire  _T_2761 = _T_2759 == 32'h33; // @[Decode.scala 13:121]
  wire  _T_2793 = _T_2605 | _T_2609 | _T_2613 | _T_2617 | _T_2621 | _T_2625 | _T_2629 | _T_2633 | _T_2637 | _T_2641 |
    _T_2645 | _T_2649 | _T_2653 | _T_2657 | _T_2661 | _T_2665 | _T_2669 | _T_2673 | _T_2677 | _T_2681 | _T_2685 |
    _T_2689 | _T_2693 | _T_2697 | _T_2701 | _T_2703 | _T_2707 | _T_2711 | _T_2715 | _T_2719 | _T_2723; // @[Decode.scala 14:30]
  wire  id_ctrl_legal = _T_2793 | _T_2727 | _T_2731 | _T_2733 | _T_2737 | _T_2741 | _T_2745 | _T_2749 | _T_2753 |
    _T_2757 | _T_2761; // @[Decode.scala 14:30]
  wire [31:0] _T_2817 = ibuf_io_inst_0_bits_inst_bits & 32'h74; // @[Decode.scala 13:65]
  wire  id_ctrl_branch = _T_2817 == 32'h60; // @[Decode.scala 13:121]
  wire [31:0] _T_2829 = ibuf_io_inst_0_bits_inst_bits & 32'h203c; // @[Decode.scala 13:65]
  wire  id_ctrl_jalr = _T_2829 == 32'h24; // @[Decode.scala 13:121]
  wire [31:0] _T_2882 = ibuf_io_inst_0_bits_inst_bits & 32'h58; // @[Decode.scala 13:65]
  wire  _T_2884 = _T_2882 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2886 = ibuf_io_inst_0_bits_inst_bits & 32'h20; // @[Decode.scala 13:65]
  wire  _T_2888 = _T_2886 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2890 = ibuf_io_inst_0_bits_inst_bits & 32'hc; // @[Decode.scala 13:65]
  wire  _T_2892 = _T_2890 == 32'h4; // @[Decode.scala 13:121]
  wire [31:0] _T_2894 = ibuf_io_inst_0_bits_inst_bits & 32'h48; // @[Decode.scala 13:65]
  wire  _T_2896 = _T_2894 == 32'h48; // @[Decode.scala 13:121]
  wire [31:0] _T_2898 = ibuf_io_inst_0_bits_inst_bits & 32'h4050; // @[Decode.scala 13:65]
  wire  _T_2900 = _T_2898 == 32'h4050; // @[Decode.scala 13:121]
  wire  _T_2906 = _T_2884 | _T_2888 | _T_2892 | _T_2896 | _T_2900; // @[Decode.scala 14:30]
  wire  _T_2910 = _T_2894 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2912 = ibuf_io_inst_0_bits_inst_bits & 32'h18; // @[Decode.scala 13:65]
  wire  _T_2914 = _T_2912 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2916 = ibuf_io_inst_0_bits_inst_bits & 32'h4008; // @[Decode.scala 13:65]
  wire  _T_2918 = _T_2916 == 32'h4000; // @[Decode.scala 13:121]
  wire  _T_2923 = _T_2910 | _T_2858 | _T_2914 | _T_2918; // @[Decode.scala 14:30]
  wire [1:0] id_ctrl_sel_alu2 = {_T_2923,_T_2906}; // @[Cat.scala 30:58]
  wire [31:0] _T_2926 = ibuf_io_inst_0_bits_inst_bits & 32'h4004; // @[Decode.scala 13:65]
  wire  _T_2928 = _T_2926 == 32'h0; // @[Decode.scala 13:121]
  wire  _T_2932 = _T_3242 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2934 = ibuf_io_inst_0_bits_inst_bits & 32'h24; // @[Decode.scala 13:65]
  wire  _T_2936 = _T_2934 == 32'h0; // @[Decode.scala 13:121]
  wire  _T_2942 = _T_2928 | _T_2932 | _T_2858 | _T_2936 | _T_2914; // @[Decode.scala 14:30]
  wire  _T_2946 = _T_2839 == 32'h14; // @[Decode.scala 13:121]
  wire  _T_2949 = _T_2946 | _T_2896; // @[Decode.scala 14:30]
  wire [1:0] id_ctrl_sel_alu1 = {_T_2949,_T_2942}; // @[Cat.scala 30:58]
  wire  _T_2954 = _T_2912 == 32'h8; // @[Decode.scala 13:121]
  wire  _T_2958 = _T_2856 == 32'h40; // @[Decode.scala 13:121]
  wire  _T_2961 = _T_2954 | _T_2958; // @[Decode.scala 14:30]
  wire [31:0] _T_2963 = ibuf_io_inst_0_bits_inst_bits & 32'h14; // @[Decode.scala 13:65]
  wire  _T_2965 = _T_2963 == 32'h14; // @[Decode.scala 13:121]
  wire  _T_2968 = _T_2954 | _T_2965; // @[Decode.scala 14:30]
  wire [31:0] _T_2970 = ibuf_io_inst_0_bits_inst_bits & 32'h30; // @[Decode.scala 13:65]
  wire  _T_2972 = _T_2970 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2974 = ibuf_io_inst_0_bits_inst_bits & 32'h201c; // @[Decode.scala 13:65]
  wire  _T_2976 = _T_2974 == 32'h4; // @[Decode.scala 13:121]
  wire  _T_2980 = _T_2963 == 32'h10; // @[Decode.scala 13:121]
  wire  _T_2984 = _T_2972 | _T_2976 | _T_2980; // @[Decode.scala 14:30]
  wire [2:0] id_ctrl_sel_imm = {_T_2984,_T_2968,_T_2961}; // @[Cat.scala 30:58]
  wire [31:0] _T_2988 = ibuf_io_inst_0_bits_inst_bits & 32'h10; // @[Decode.scala 13:65]
  wire  _T_2990 = _T_2988 == 32'h0; // @[Decode.scala 13:121]
  wire [31:0] _T_2992 = ibuf_io_inst_0_bits_inst_bits & 32'h8; // @[Decode.scala 13:65]
  wire  _T_2994 = _T_2992 == 32'h0; // @[Decode.scala 13:121]
  wire  id_ctrl_alu_dw = _T_2990 | _T_2994; // @[Decode.scala 14:30]
  wire [31:0] _T_2999 = ibuf_io_inst_0_bits_inst_bits & 32'h3054; // @[Decode.scala 13:65]
  wire  _T_3001 = _T_2999 == 32'h1010; // @[Decode.scala 13:121]
  wire [31:0] _T_3003 = ibuf_io_inst_0_bits_inst_bits & 32'h1058; // @[Decode.scala 13:65]
  wire  _T_3005 = _T_3003 == 32'h1040; // @[Decode.scala 13:121]
  wire [31:0] _T_3007 = ibuf_io_inst_0_bits_inst_bits & 32'h7044; // @[Decode.scala 13:65]
  wire  _T_3009 = _T_3007 == 32'h7000; // @[Decode.scala 13:121]
  wire  _T_3013 = _T_3001 | _T_3005 | _T_3009; // @[Decode.scala 14:30]
  wire [31:0] _T_3015 = ibuf_io_inst_0_bits_inst_bits & 32'h4054; // @[Decode.scala 13:65]
  wire  _T_3017 = _T_3015 == 32'h40; // @[Decode.scala 13:121]
  wire [31:0] _T_3019 = ibuf_io_inst_0_bits_inst_bits & 32'h2058; // @[Decode.scala 13:65]
  wire  _T_3021 = _T_3019 == 32'h2040; // @[Decode.scala 13:121]
  wire  _T_3025 = _T_2999 == 32'h3010; // @[Decode.scala 13:121]
  wire [31:0] _T_3027 = ibuf_io_inst_0_bits_inst_bits & 32'h6054; // @[Decode.scala 13:65]
  wire  _T_3029 = _T_3027 == 32'h6010; // @[Decode.scala 13:121]
  wire [31:0] _T_3031 = ibuf_io_inst_0_bits_inst_bits & 32'h40003034; // @[Decode.scala 13:65]
  wire  _T_3033 = _T_3031 == 32'h40000030; // @[Decode.scala 13:121]
  wire [31:0] _T_3035 = ibuf_io_inst_0_bits_inst_bits & 32'h40001054; // @[Decode.scala 13:65]
  wire  _T_3037 = _T_3035 == 32'h40001010; // @[Decode.scala 13:121]
  wire  _T_3044 = _T_3017 | _T_3021 | _T_3025 | _T_3029 | _T_3033 | _T_3037; // @[Decode.scala 14:30]
  wire [31:0] _T_3046 = ibuf_io_inst_0_bits_inst_bits & 32'h2054; // @[Decode.scala 13:65]
  wire  _T_3048 = _T_3046 == 32'h2010; // @[Decode.scala 13:121]
  wire [31:0] _T_3050 = ibuf_io_inst_0_bits_inst_bits & 32'h40004054; // @[Decode.scala 13:65]
  wire  _T_3052 = _T_3050 == 32'h4010; // @[Decode.scala 13:121]
  wire [31:0] _T_3054 = ibuf_io_inst_0_bits_inst_bits & 32'h5054; // @[Decode.scala 13:65]
  wire  _T_3056 = _T_3054 == 32'h4010; // @[Decode.scala 13:121]
  wire [31:0] _T_3058 = ibuf_io_inst_0_bits_inst_bits & 32'h4058; // @[Decode.scala 13:65]
  wire  _T_3060 = _T_3058 == 32'h4040; // @[Decode.scala 13:121]
  wire  _T_3065 = _T_3048 | _T_3052 | _T_3056 | _T_3060; // @[Decode.scala 14:30]
  wire  _T_3069 = _T_3027 == 32'h2010; // @[Decode.scala 13:121]
  wire [31:0] _T_3071 = ibuf_io_inst_0_bits_inst_bits & 32'h40003054; // @[Decode.scala 13:65]
  wire  _T_3073 = _T_3071 == 32'h40001010; // @[Decode.scala 13:121]
  wire  _T_3078 = _T_3069 | _T_3060 | _T_3033 | _T_3073; // @[Decode.scala 14:30]
  wire [3:0] id_ctrl_alu_fn = {_T_3078,_T_3065,_T_3044,_T_3013}; // @[Cat.scala 30:58]
  wire [31:0] _T_3104 = ibuf_io_inst_0_bits_inst_bits & 32'h2008; // @[Decode.scala 13:65]
  wire  _T_3106 = _T_3104 == 32'h8; // @[Decode.scala 13:121]
  wire  _T_3110 = _T_3250 == 32'h20; // @[Decode.scala 13:121]
  wire [31:0] _T_3112 = ibuf_io_inst_0_bits_inst_bits & 32'h18000020; // @[Decode.scala 13:65]
  wire  _T_3114 = _T_3112 == 32'h18000020; // @[Decode.scala 13:121]
  wire [31:0] _T_3116 = ibuf_io_inst_0_bits_inst_bits & 32'h20000020; // @[Decode.scala 13:65]
  wire  _T_3118 = _T_3116 == 32'h20000020; // @[Decode.scala 13:121]
  wire  _T_3123 = _T_3106 | _T_3110 | _T_3114 | _T_3118; // @[Decode.scala 14:30]
  wire [31:0] _T_3125 = ibuf_io_inst_0_bits_inst_bits & 32'h10002008; // @[Decode.scala 13:65]
  wire  _T_3127 = _T_3125 == 32'h10002008; // @[Decode.scala 13:121]
  wire [31:0] _T_3129 = ibuf_io_inst_0_bits_inst_bits & 32'h40002008; // @[Decode.scala 13:65]
  wire  _T_3131 = _T_3129 == 32'h40002008; // @[Decode.scala 13:121]
  wire  _T_3134 = _T_3127 | _T_3131; // @[Decode.scala 14:30]
  wire [31:0] _T_3136 = ibuf_io_inst_0_bits_inst_bits & 32'h8000008; // @[Decode.scala 13:65]
  wire  _T_3138 = _T_3136 == 32'h8000008; // @[Decode.scala 13:121]
  wire [31:0] _T_3140 = ibuf_io_inst_0_bits_inst_bits & 32'h10000008; // @[Decode.scala 13:65]
  wire  _T_3142 = _T_3140 == 32'h10000008; // @[Decode.scala 13:121]
  wire [31:0] _T_3144 = ibuf_io_inst_0_bits_inst_bits & 32'h80000008; // @[Decode.scala 13:65]
  wire  _T_3146 = _T_3144 == 32'h80000008; // @[Decode.scala 13:121]
  wire  _T_3151 = _T_3106 | _T_3138 | _T_3142 | _T_3146; // @[Decode.scala 14:30]
  wire [31:0] _T_3153 = ibuf_io_inst_0_bits_inst_bits & 32'h18002008; // @[Decode.scala 13:65]
  wire  _T_3155 = _T_3153 == 32'h2008; // @[Decode.scala 13:121]
  wire [4:0] id_ctrl_mem_cmd = {1'h0,_T_3155,_T_3151,_T_3134,_T_3123}; // @[Cat.scala 30:58]
  wire [31:0] _T_3164 = ibuf_io_inst_0_bits_inst_bits & 32'h1000; // @[Decode.scala 13:65]
  wire  _T_3166 = _T_3164 == 32'h1000; // @[Decode.scala 13:121]
  wire [31:0] _T_3170 = ibuf_io_inst_0_bits_inst_bits & 32'h2000; // @[Decode.scala 13:65]
  wire  _T_3172 = _T_3170 == 32'h2000; // @[Decode.scala 13:121]
  wire [31:0] _T_3176 = ibuf_io_inst_0_bits_inst_bits & 32'h4000; // @[Decode.scala 13:65]
  wire  _T_3178 = _T_3176 == 32'h4000; // @[Decode.scala 13:121]
  wire [2:0] id_ctrl_mem_type = {_T_3178,_T_3172,_T_3166}; // @[Cat.scala 30:58]
  wire [31:0] _T_3184 = ibuf_io_inst_0_bits_inst_bits & 32'h80000060; // @[Decode.scala 13:65]
  wire  _T_3186 = _T_3184 == 32'h40; // @[Decode.scala 13:121]
  wire [31:0] _T_3188 = ibuf_io_inst_0_bits_inst_bits & 32'h10000060; // @[Decode.scala 13:65]
  wire [31:0] _T_3192 = ibuf_io_inst_0_bits_inst_bits & 32'h70; // @[Decode.scala 13:65]
  wire  id_ctrl_rfs3 = _T_3192 == 32'h40; // @[Decode.scala 13:121]
  wire [31:0] _T_3219 = ibuf_io_inst_0_bits_inst_bits & 32'h3c; // @[Decode.scala 13:65]
  wire  _T_3221 = _T_3219 == 32'h4; // @[Decode.scala 13:121]
  wire  _T_3225 = _T_3188 == 32'h10000040; // @[Decode.scala 13:121]
  wire  id_ctrl_wfd = _T_3221 | _T_3186 | id_ctrl_rfs3 | _T_3225; // @[Decode.scala 14:30]
  wire [31:0] _T_3312 = ibuf_io_inst_0_bits_inst_bits & 32'h105c; // @[Decode.scala 13:65]
  wire  _T_3314 = _T_3312 == 32'h1004; // @[Decode.scala 13:121]
  wire [31:0] _T_3316 = ibuf_io_inst_0_bits_inst_bits & 32'h2000060; // @[Decode.scala 13:65]
  wire  _T_3318 = _T_3316 == 32'h2000040; // @[Decode.scala 13:121]
  wire [31:0] _T_3320 = ibuf_io_inst_0_bits_inst_bits & 32'hd0000070; // @[Decode.scala 13:65]
  wire  _T_3322 = _T_3320 == 32'h40000050; // @[Decode.scala 13:121]
  wire  id_ctrl_dp = _T_3314 | _T_3318 | _T_3322; // @[Decode.scala 14:30]
  wire  _T_3335 = ibuf_io_inst_0_bits_inst_rs1 == 5'h0; // @[Rocket.scala 689:45]
  wire [4:0] _T_3338 = ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 683:44]
  wire [63:0] _T_3341 = _T_3331__T_3340_data; // @[Rocket.scala 689:25]
  wire [4:0] _T_3348 = ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 683:44]
  wire [63:0] _T_3351 = _T_3331__T_3350_data; // @[Rocket.scala 689:25]
  wire  id_system_insn = id_ctrl_csr >= 3'h4; // @[Rocket.scala 189:36]
  wire  id_csr_ren = _T_3453 & _T_3335; // @[Rocket.scala 190:54]
  wire  _T_3464 = ~id_csr_ren; // @[Rocket.scala 192:54]
  wire  id_csr_flush = id_system_insn | id_csr_en & ~id_csr_ren & csr_io_decode_write_flush; // @[Rocket.scala 192:37]
  wire  _T_3472 = id_ctrl_div & ~csr_io_status_isa[12]; // @[Rocket.scala 195:17]
  wire  _T_3473 = ~id_ctrl_legal | _T_3472; // @[Rocket.scala 194:40]
  wire  _T_3477 = id_ctrl_amo & ~csr_io_status_isa[0]; // @[Rocket.scala 196:17]
  wire  _T_3478 = _T_3473 | _T_3477; // @[Rocket.scala 195:48]
  wire  _T_3480 = id_ctrl_fp & (csr_io_decode_fp_illegal | io_fpu_illegal_rm); // @[Rocket.scala 197:16]
  wire  _T_3481 = _T_3478 | _T_3480; // @[Rocket.scala 196:48]
  wire  _T_3485 = id_ctrl_dp & ~csr_io_status_isa[3]; // @[Rocket.scala 198:16]
  wire  _T_3486 = _T_3481 | _T_3485; // @[Rocket.scala 197:67]
  wire  _T_3489 = ~csr_io_status_isa[2]; // @[Rocket.scala 199:33]
  wire  _T_3490 = ibuf_io_inst_0_bits_rvc & ~csr_io_status_isa[2]; // @[Rocket.scala 199:30]
  wire  _T_3491 = _T_3486 | _T_3490; // @[Rocket.scala 198:47]
  wire  _T_3498 = id_csr_en & (csr_io_decode_read_illegal | _T_3464 & csr_io_decode_write_illegal); // @[Rocket.scala 201:15]
  wire  _T_3499 = _T_3491 | _T_3498; // @[Rocket.scala 200:48]
  wire  _T_3500 = id_system_insn & csr_io_decode_system_illegal; // @[Rocket.scala 202:20]
  wire  id_illegal_insn = _T_3499 | _T_3500; // @[Rocket.scala 201:93]
  wire  id_amo_rl = ibuf_io_inst_0_bits_inst_bits[25]; // @[Rocket.scala 205:29]
  wire  id_fence_next = id_ctrl_fence | id_ctrl_amo & id_amo_rl; // @[Rocket.scala 206:37]
  wire  id_xcpt_if = ibuf_io_inst_0_bits_pf0 | ibuf_io_inst_0_bits_pf1; // @[Rocket.scala 221:45]
  wire  id_xcpt = csr_io_interrupt | bpu_io_debug_if | bpu_io_xcpt_if | id_xcpt_if | id_illegal_insn; // @[Rocket.scala 645:26]
  wire [1:0] _T_3555 = id_xcpt_if ? 2'h1 : 2'h2; // @[Mux.scala 31:69]
  wire [1:0] _T_3556 = bpu_io_xcpt_if ? 2'h3 : _T_3555; // @[Mux.scala 31:69]
  wire [3:0] _T_3557 = bpu_io_debug_if ? 4'hd : {{2'd0}, _T_3556}; // @[Mux.scala 31:69]
  wire  _T_3561 = ex_reg_valid & ex_ctrl_wxd; // @[Rocket.scala 240:19]
  wire  _T_3562 = mem_reg_valid & mem_ctrl_wxd; // @[Rocket.scala 241:20]
  wire  _T_3565 = mem_reg_valid & mem_ctrl_wxd & ~mem_ctrl_mem; // @[Rocket.scala 241:36]
  wire  id_bypass_src_0_0 = 5'h0 == ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 243:82]
  wire  id_bypass_src_0_1 = _T_3561 & ex_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 243:74]
  wire  id_bypass_src_0_2 = _T_3565 & mem_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 243:74]
  wire  id_bypass_src_0_3 = _T_3562 & mem_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[Rocket.scala 243:74]
  wire  id_bypass_src_1_0 = 5'h0 == ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 243:82]
  wire  id_bypass_src_1_1 = _T_3561 & ex_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 243:74]
  wire  id_bypass_src_1_2 = _T_3565 & mem_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 243:74]
  wire  id_bypass_src_1_3 = _T_3562 & mem_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[Rocket.scala 243:74]
  reg  ex_reg_rs_bypass_0; // @[Rocket.scala 247:29]
  reg  ex_reg_rs_bypass_1; // @[Rocket.scala 247:29]
  reg [1:0] ex_reg_rs_lsb_0; // @[Rocket.scala 248:26]
  reg [1:0] ex_reg_rs_lsb_1; // @[Rocket.scala 248:26]
  reg [61:0] ex_reg_rs_msb_0; // @[Rocket.scala 249:26]
  reg [61:0] ex_reg_rs_msb_1; // @[Rocket.scala 249:26]
  wire [63:0] _T_3605 = {ex_reg_rs_msb_0,ex_reg_rs_lsb_0}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_1 = 2'h1 == ex_reg_rs_lsb_0 ? mem_reg_wdata : 64'h0; // @[Rocket.scala 251:14 Rocket.scala 251:14]
  wire [63:0] _GEN_2 = 2'h2 == ex_reg_rs_lsb_0 ? wb_reg_wdata : _GEN_1; // @[Rocket.scala 251:14 Rocket.scala 251:14]
  wire [63:0] _GEN_3 = 2'h3 == ex_reg_rs_lsb_0 ? io_dmem_resp_bits_data_word_bypass : _GEN_2; // @[Rocket.scala 251:14 Rocket.scala 251:14]
  wire [63:0] ex_rs_0 = ex_reg_rs_bypass_0 ? _GEN_3 : _T_3605; // @[Rocket.scala 251:14]
  wire [63:0] _T_3607 = {ex_reg_rs_msb_1,ex_reg_rs_lsb_1}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_5 = 2'h1 == ex_reg_rs_lsb_1 ? mem_reg_wdata : 64'h0; // @[Rocket.scala 251:14 Rocket.scala 251:14]
  wire [63:0] _GEN_6 = 2'h2 == ex_reg_rs_lsb_1 ? wb_reg_wdata : _GEN_5; // @[Rocket.scala 251:14 Rocket.scala 251:14]
  wire [63:0] _GEN_7 = 2'h3 == ex_reg_rs_lsb_1 ? io_dmem_resp_bits_data_word_bypass : _GEN_6; // @[Rocket.scala 251:14 Rocket.scala 251:14]
  wire  _T_3609 = ex_ctrl_sel_imm == 3'h5; // @[Rocket.scala 704:24]
  wire  _T_3612 = ex_reg_inst[31]; // @[Rocket.scala 704:53]
  wire  _T_3613 = ex_ctrl_sel_imm == 3'h5 ? $signed(1'sh0) : $signed(_T_3612); // @[Rocket.scala 704:19]
  wire  _T_3615 = ex_ctrl_sel_imm == 3'h2; // @[Rocket.scala 705:26]
  wire [10:0] _T_3617 = ex_reg_inst[30:20]; // @[Rocket.scala 705:49]
  wire [7:0] _T_3625 = ex_reg_inst[19:12]; // @[Rocket.scala 706:73]
  wire  _T_3631 = _T_3615 | _T_3609; // @[Rocket.scala 707:33]
  wire  _T_3636 = ex_reg_inst[20]; // @[Rocket.scala 708:44]
  wire  _T_3638 = ex_ctrl_sel_imm == 3'h1; // @[Rocket.scala 709:23]
  wire  _T_3640 = ex_reg_inst[7]; // @[Rocket.scala 709:43]
  wire  _T_3641 = ex_ctrl_sel_imm == 3'h1 ? $signed(_T_3640) : $signed(_T_3613); // @[Rocket.scala 709:18]
  wire  _T_3642 = ex_ctrl_sel_imm == 3'h3 ? $signed(_T_3636) : $signed(_T_3641); // @[Rocket.scala 708:18]
  wire [5:0] _T_3651 = _T_3631 ? 6'h0 : ex_reg_inst[30:25]; // @[Rocket.scala 710:20]
  wire  _T_3656 = ex_ctrl_sel_imm == 3'h0; // @[Rocket.scala 712:24]
  wire [3:0] _T_3665 = _T_3609 ? ex_reg_inst[19:16] : ex_reg_inst[24:21]; // @[Rocket.scala 713:19]
  wire [3:0] _T_3666 = ex_ctrl_sel_imm == 3'h0 | _T_3638 ? ex_reg_inst[11:8] : _T_3665; // @[Rocket.scala 712:19]
  wire [3:0] _T_3667 = _T_3615 ? 4'h0 : _T_3666; // @[Rocket.scala 711:19]
  wire  _T_3678 = _T_3609 & ex_reg_inst[15]; // @[Rocket.scala 716:17]
  wire  _T_3679 = ex_ctrl_sel_imm == 3'h4 ? ex_reg_inst[20] : _T_3678; // @[Rocket.scala 715:17]
  wire  _T_3680 = _T_3656 ? ex_reg_inst[7] : _T_3679; // @[Rocket.scala 714:17]
  wire  _T_3683 = _T_3615 | _T_3609 ? $signed(1'sh0) : $signed(_T_3642); // @[Cat.scala 30:58]
  wire [7:0] _T_3684 = ex_ctrl_sel_imm != 3'h2 & ex_ctrl_sel_imm != 3'h3 ? $signed({8{_T_3613}}) : $signed(_T_3625); // @[Cat.scala 30:58]
  wire [10:0] _T_3686 = ex_ctrl_sel_imm == 3'h2 ? $signed(_T_3617) : $signed({11{_T_3613}}); // @[Cat.scala 30:58]
  wire  _T_3687 = ex_ctrl_sel_imm == 3'h5 ? $signed(1'sh0) : $signed(_T_3612); // @[Cat.scala 30:58]
  wire [31:0] ex_imm = {_T_3687,_T_3686,_T_3684,_T_3683,_T_3651,_T_3667,_T_3680}; // @[Rocket.scala 718:53]
  wire [63:0] _T_3693 = ex_reg_rs_bypass_0 ? _GEN_3 : _T_3605; // @[Rocket.scala 254:24]
  wire [39:0] _T_3697 = 2'h2 == ex_ctrl_sel_alu1 ? $signed(ex_reg_pc) : $signed(40'sh0); // @[Mux.scala 46:16]
  wire [63:0] _T_3701 = ex_reg_rs_bypass_1 ? _GEN_7 : _T_3607; // @[Rocket.scala 257:24]
  wire [3:0] _T_3706 = ex_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); // @[Rocket.scala 259:19]
  wire [3:0] _T_3708 = 2'h1 == ex_ctrl_sel_alu2 ? $signed(_T_3706) : $signed(4'sh0); // @[Mux.scala 46:16]
  wire [31:0] _T_3710 = 2'h3 == ex_ctrl_sel_alu2 ? $signed(ex_imm) : $signed({{28{_T_3708[3]}},_T_3708}); // @[Mux.scala 46:16]
  wire  _T_3718 = ~take_pc_mem_wb; // @[Rocket.scala 277:20]
  wire  _T_3719 = ~take_pc_mem_wb & ibuf_io_inst_0_valid; // @[Rocket.scala 277:29]
  wire  _GEN_17 = ~bpu_io_xcpt_if & ~ibuf_io_inst_0_bits_pf0 & ibuf_io_inst_0_bits_pf1 | ibuf_io_inst_0_bits_rvc; // @[Rocket.scala 293:87 Rocket.scala 295:20 Rocket.scala 286:16]
  wire  _GEN_19 = id_xcpt | id_ctrl_alu_dw; // @[Rocket.scala 288:20 Rocket.scala 290:22 Rocket.scala 285:13]
  wire  _GEN_23 = id_ctrl_jalr & csr_io_status_debug | (id_ctrl_fence_i | id_csr_flush | csr_io_singleStep); // @[Rocket.scala 301:48 Rocket.scala 302:25 Rocket.scala 298:23]
  wire  _GEN_24 = id_ctrl_jalr & csr_io_status_debug | id_ctrl_fence_i; // @[Rocket.scala 301:48 Rocket.scala 303:23 Rocket.scala 285:13]
  wire  _T_3749 = id_bypass_src_0_0 | id_bypass_src_0_1 | id_bypass_src_0_2 | id_bypass_src_0_3; // @[Rocket.scala 307:48]
  wire [1:0] _T_3754 = id_bypass_src_0_2 ? 2'h2 : 2'h3; // @[Mux.scala 31:69]
  wire  wb_valid = wb_reg_valid & ~replay_wb_common & ~wb_reg_xcpt; // @[Rocket.scala 450:45]
  wire  wb_wen = wb_valid & wb_ctrl_wxd; // @[Rocket.scala 451:25]
  wire  dmem_resp_valid = io_dmem_resp_valid & io_dmem_resp_bits_has_data; // @[Rocket.scala 426:44]
  wire  dmem_resp_replay = dmem_resp_valid & io_dmem_resp_bits_replay; // @[Rocket.scala 427:42]
  wire  dmem_resp_xpu = ~io_dmem_resp_bits_tag[0]; // @[Rocket.scala 423:23]
  wire  _T_4182 = div_io_resp_ready & div_io_resp_valid; // @[Decoupled.scala 30:37]
  wire  ll_wen = dmem_resp_replay & dmem_resp_xpu | _T_4182; // @[Rocket.scala 442:44 Rocket.scala 447:12]
  wire  rf_wen = wb_wen | ll_wen; // @[Rocket.scala 452:23]
  wire [4:0] dmem_resp_waddr = io_dmem_resp_bits_tag[5:1]; // @[Rocket.scala 425:46]
  wire [4:0] ll_waddr = dmem_resp_replay & dmem_resp_xpu ? dmem_resp_waddr : div_io_resp_bits_tag; // @[Rocket.scala 442:44 Rocket.scala 446:14]
  wire [4:0] rf_waddr = ll_wen ? ll_waddr : wb_waddr; // @[Rocket.scala 453:21]
  wire  _T_4197 = rf_waddr != 5'h0; // @[Rocket.scala 694:16]
  wire  _T_4191 = dmem_resp_valid & dmem_resp_xpu; // @[Rocket.scala 454:38]
  wire [63:0] ll_wdata = div_io_resp_bits_data;
  wire [63:0] _T_4194 = wb_ctrl_csr != 3'h0 ? csr_io_rw_rdata : wb_reg_wdata; // @[Rocket.scala 456:21]
  wire [63:0] _T_4195 = ll_wen ? ll_wdata : _T_4194; // @[Rocket.scala 455:21]
  wire [63:0] rf_wdata = dmem_resp_valid & dmem_resp_xpu ? io_dmem_resp_bits_data : _T_4195; // @[Rocket.scala 454:21]
  wire [63:0] _GEN_107 = rf_waddr == ibuf_io_inst_0_bits_inst_rs1 ? rf_wdata : _T_3341; // @[Rocket.scala 697:31 Rocket.scala 697:39 Rocket.scala 689:19]
  wire [63:0] _GEN_114 = rf_waddr != 5'h0 ? _GEN_107 : _T_3341; // @[Rocket.scala 694:29 Rocket.scala 689:19]
  wire [63:0] id_rs_0 = rf_wen ? _GEN_114 : _T_3341; // @[Rocket.scala 458:17 Rocket.scala 689:19]
  wire  _T_3764 = id_bypass_src_1_0 | id_bypass_src_1_1 | id_bypass_src_1_2 | id_bypass_src_1_3; // @[Rocket.scala 307:48]
  wire [1:0] _T_3769 = id_bypass_src_1_2 ? 2'h2 : 2'h3; // @[Mux.scala 31:69]
  wire [63:0] _GEN_108 = rf_waddr == ibuf_io_inst_0_bits_inst_rs2 ? rf_wdata : _T_3351; // @[Rocket.scala 697:31 Rocket.scala 697:39 Rocket.scala 689:19]
  wire [63:0] _GEN_115 = rf_waddr != 5'h0 ? _GEN_108 : _T_3351; // @[Rocket.scala 694:29 Rocket.scala 689:19]
  wire [63:0] id_rs_1 = rf_wen ? _GEN_115 : _T_3351; // @[Rocket.scala 458:17 Rocket.scala 689:19]
  wire  id_load_use = mem_reg_valid & data_hazard_mem & mem_ctrl_mem; // @[Rocket.scala 506:51]
  wire  _T_3785 = ~io_dmem_req_ready; // @[Rocket.scala 325:45]
  wire  _T_3789 = ex_ctrl_div & ~div_io_req_ready; // @[Rocket.scala 326:42]
  wire  replay_ex_structural = ex_ctrl_mem & ~io_dmem_req_ready | _T_3789; // @[Rocket.scala 325:64]
  wire  replay_ex_load_use = wb_dcache_miss & ex_reg_load_use; // @[Rocket.scala 327:43]
  wire  replay_ex = ex_reg_replay | ex_reg_valid & (replay_ex_structural | replay_ex_load_use); // @[Rocket.scala 328:33]
  wire  ctrl_killx = take_pc_mem_wb | replay_ex | ~ex_reg_valid; // @[Rocket.scala 329:48]
  wire  _T_3796 = ex_ctrl_mem_cmd == 5'h7; // @[Rocket.scala 331:40]
  wire  ex_slow_bypass = ex_ctrl_mem_cmd == 5'h7 | (3'h0 == ex_ctrl_mem_type | 3'h4 == ex_ctrl_mem_type | 3'h1 ==
    ex_ctrl_mem_type | 3'h5 == ex_ctrl_mem_type); // @[Rocket.scala 331:50]
  wire  ex_xcpt = ex_reg_xcpt_interrupt | ex_reg_xcpt; // @[Rocket.scala 334:28]
  wire  mem_pc_valid = mem_reg_valid | mem_reg_replay | mem_reg_xcpt_interrupt; // @[Rocket.scala 337:54]
  wire  mem_npc_misaligned = _T_3489 & mem_npc[1]; // @[Rocket.scala 345:56]
  wire  _T_4039 = ~mem_reg_xcpt; // @[Rocket.scala 346:27]
  wire [63:0] mem_int_wdata = ~mem_reg_xcpt & (mem_ctrl_jalr ^ mem_npc_misaligned) ? $signed({{24{mem_br_target[39]}},
    mem_br_target}) : $signed(mem_reg_wdata); // @[Rocket.scala 346:119]
  wire  mem_cfi = mem_ctrl_branch | mem_ctrl_jalr | mem_ctrl_jal; // @[Rocket.scala 347:50]
  wire  mem_cfi_taken = _T_3821 | mem_ctrl_jalr | mem_ctrl_jal; // @[Rocket.scala 348:74]
  wire  _T_4054 = ~ctrl_killx; // @[Rocket.scala 353:20]
  wire  _T_4075 = ex_ctrl_mem_cmd[3] | ex_ctrl_mem_cmd == 5'h4; // @[Consts.scala 33:33]
  wire  _T_4076 = ex_ctrl_mem_cmd == 5'h0 | ex_ctrl_mem_cmd == 5'h6 | _T_3796 | _T_4075; // @[Consts.scala 35:75]
  wire  _T_4087 = ex_ctrl_mem_cmd == 5'h1 | _T_3796 | _T_4075; // @[Consts.scala 36:59]
  wire  mem_breakpoint = mem_reg_load & bpu_io_xcpt_ld | mem_reg_store & bpu_io_xcpt_st; // @[Rocket.scala 377:57]
  wire  mem_debug_breakpoint = mem_reg_load & bpu_io_debug_ld | mem_reg_store & bpu_io_debug_st; // @[Rocket.scala 378:64]
  wire  _T_4126 = mem_ctrl_mem & io_dmem_xcpt_ma_st; // @[Rocket.scala 383:19]
  wire  _T_4128 = mem_ctrl_mem & io_dmem_xcpt_ma_ld; // @[Rocket.scala 384:19]
  wire  _T_4130 = mem_ctrl_mem & io_dmem_xcpt_pf_st; // @[Rocket.scala 385:19]
  wire  _T_4132 = mem_ctrl_mem & io_dmem_xcpt_pf_ld; // @[Rocket.scala 386:19]
  wire  mem_new_xcpt = mem_debug_breakpoint | mem_breakpoint | mem_npc_misaligned | _T_4126 | _T_4128 | _T_4130 |
    _T_4132; // @[Rocket.scala 645:26]
  wire [2:0] _T_4139 = _T_4130 ? 3'h7 : 3'h5; // @[Mux.scala 31:69]
  wire [2:0] _T_4140 = _T_4128 ? 3'h4 : _T_4139; // @[Mux.scala 31:69]
  wire [2:0] _T_4141 = _T_4126 ? 3'h6 : _T_4140; // @[Mux.scala 31:69]
  wire [2:0] _T_4142 = mem_npc_misaligned ? 3'h0 : _T_4141; // @[Mux.scala 31:69]
  wire [2:0] _T_4143 = mem_breakpoint ? 3'h3 : _T_4142; // @[Mux.scala 31:69]
  wire [3:0] mem_new_cause = mem_debug_breakpoint ? 4'hd : {{1'd0}, _T_4143}; // @[Mux.scala 31:69]
  wire  _T_4144 = mem_reg_xcpt_interrupt | mem_reg_xcpt; // @[Rocket.scala 389:29]
  wire  _T_4145 = mem_reg_valid & mem_new_xcpt; // @[Rocket.scala 390:20]
  wire  mem_xcpt = _T_4144 | _T_4145; // @[Rocket.scala 645:26]
  wire  dcache_kill_mem = _T_3562 & io_dmem_replay_next; // @[Rocket.scala 392:55]
  wire  fpu_kill_mem = mem_reg_valid & mem_ctrl_fp & io_fpu_nack_mem; // @[Rocket.scala 393:51]
  wire  replay_mem = dcache_kill_mem | mem_reg_replay | fpu_kill_mem; // @[Rocket.scala 394:55]
  wire  killm_common = dcache_kill_mem | take_pc_wb | mem_reg_xcpt | ~mem_reg_valid; // @[Rocket.scala 395:68]
  reg  _T_4154; // @[Rocket.scala 396:37]
  wire  ctrl_killm = killm_common | mem_xcpt | fpu_kill_mem; // @[Rocket.scala 397:45]
  wire  _T_4160 = ~take_pc_wb; // @[Rocket.scala 401:34]
  wire [1:0] _T_4206 = wb_reg_wdata[39:38]; // @[Rocket.scala 654:39]
  wire [25:0] _T_4214 = wb_reg_wdata[63:38]; // @[Rocket.scala 657:13]
  wire  _T_4224 = $signed(_T_4214) == -26'sh1 | $signed(_T_4214) == -26'sh2 ? $signed(_T_4206) == -2'sh1 : _T_4206[0]; // @[Rocket.scala 657:10]
  wire  _T_4225 = wb_reg_wdata[63:38] == 26'h0 | wb_reg_wdata[63:38] == 26'h1 ? $signed(_T_4206) != 2'sh0 : _T_4224; // @[Rocket.scala 656:10]
  wire [31:0] _T_4246 = 32'h1 << ll_waddr; // @[Rocket.scala 672:62]
  wire [31:0] _T_4248 = ll_wen ? _T_4246 : 32'h0; // @[Rocket.scala 672:49]
  wire [31:0] _T_4249 = ~_T_4248; // @[Rocket.scala 664:64]
  wire [31:0] _T_4250 = _T_4243 & _T_4249; // @[Rocket.scala 664:62]
  wire  _T_4262 = wb_set_sboard & wb_wen; // @[Rocket.scala 490:28]
  wire [31:0] _T_4264 = 32'h1 << wb_waddr; // @[Rocket.scala 672:62]
  wire [31:0] _T_4266 = _T_4262 ? _T_4264 : 32'h0; // @[Rocket.scala 672:49]
  wire [31:0] _T_4267 = _T_4250 | _T_4266; // @[Rocket.scala 663:60]
  wire  _T_4268 = ll_wen | _T_4262; // @[Rocket.scala 675:17]
  wire  _T_4352 = (wb_dcache_miss & wb_ctrl_wfd | io_fpu_sboard_set) & wb_valid; // @[Rocket.scala 515:72]
  wire [31:0] _T_4356 = _T_4352 ? _T_4264 : 32'h0; // @[Rocket.scala 672:49]
  wire [31:0] _T_4357 = _T_4348 | _T_4356; // @[Rocket.scala 663:60]
  wire  _T_4359 = dmem_resp_replay & io_dmem_resp_bits_tag[0]; // @[Rocket.scala 516:38]
  wire [31:0] _T_4361 = 32'h1 << dmem_resp_waddr; // @[Rocket.scala 672:62]
  wire [31:0] _T_4363 = _T_4359 ? _T_4361 : 32'h0; // @[Rocket.scala 672:49]
  wire [31:0] _T_4364 = ~_T_4363; // @[Rocket.scala 664:64]
  wire [31:0] _T_4365 = _T_4357 & _T_4364; // @[Rocket.scala 664:62]
  wire  _T_4366 = _T_4352 | _T_4359; // @[Rocket.scala 675:17]
  wire [31:0] _T_4368 = 32'h1 << io_fpu_sboard_clra; // @[Rocket.scala 672:62]
  wire [31:0] _T_4370 = io_fpu_sboard_clr ? _T_4368 : 32'h0; // @[Rocket.scala 672:49]
  wire [31:0] _T_4371 = ~_T_4370; // @[Rocket.scala 664:64]
  wire [31:0] _T_4372 = _T_4365 & _T_4371; // @[Rocket.scala 664:62]
  wire  _T_4373 = _T_4352 | _T_4359 | io_fpu_sboard_clr; // @[Rocket.scala 675:17]
  wire [39:0] _T_4436 = replay_wb_common ? wb_reg_pc : mem_npc; // @[Rocket.scala 541:8]
  wire  _T_4448 = mem_reg_valid & _T_4160; // @[Rocket.scala 549:85]
  wire [4:0] _T_4468 = mem_reg_inst[19:15] & 5'h1b; // @[Rocket.scala 552:76]
  wire [1:0] _T_4473 = mem_reg_rvc ? 2'h0 : 2'h2; // @[Rocket.scala 554:74]
  wire [39:0] _GEN_130 = {{38'd0}, _T_4473}; // @[Rocket.scala 554:69]
  wire [39:0] _T_4475 = mem_reg_pc + _GEN_130; // @[Rocket.scala 554:69]
  wire [38:0] _T_4476 = ~io_imem_btb_update_bits_br_pc; // @[Rocket.scala 555:35]
  wire [38:0] _T_4478 = _T_4476 | 39'h3; // @[Rocket.scala 555:66]
  wire [5:0] ex_dcache_tag = {ex_waddr,ex_ctrl_fp}; // @[Cat.scala 30:58]
  wire [1:0] _T_4497 = alu_io_adder_out[39:38]; // @[Rocket.scala 654:39]
  wire [25:0] _T_4505 = ex_rs_0[63:38]; // @[Rocket.scala 657:13]
  wire  _T_4515 = $signed(_T_4505) == -26'sh1 | $signed(_T_4505) == -26'sh2 ? $signed(_T_4497) == -2'sh1 : _T_4497[0]; // @[Rocket.scala 657:10]
  wire  _T_4516 = ex_rs_0[63:38] == 26'h0 | ex_rs_0[63:38] == 26'h1 ? $signed(_T_4497) != 2'sh0 : _T_4515; // @[Rocket.scala 656:10]
  wire  _T_4524 = mem_ctrl_mem & mem_xcpt & ~io_dmem_s1_kill; // @[Rocket.scala 592:34]
  wire [3:0] _T_4527 = {io_dmem_xcpt_ma_ld,io_dmem_xcpt_ma_st,io_dmem_xcpt_pf_ld,io_dmem_xcpt_pf_st}; // @[Rocket.scala 593:25]
  wire [4:0] _T_4579 = rf_wen ? rf_waddr : 5'h0; // @[Rocket.scala 638:13]
  reg [63:0] _T_4581; // @[Rocket.scala 639:42]
  reg [63:0] _T_4582; // @[Rocket.scala 639:33]
  reg [63:0] _T_4584; // @[Rocket.scala 640:42]
  reg [63:0] _T_4585; // @[Rocket.scala 640:33]
  IBuf ibuf ( // @[Rocket.scala 165:20]
    .clock(ibuf_clock),
    .reset(ibuf_reset),
    .io_imem_ready(ibuf_io_imem_ready),
    .io_imem_valid(ibuf_io_imem_valid),
    .io_imem_bits_btb_valid(ibuf_io_imem_bits_btb_valid),
    .io_imem_bits_btb_bits_taken(ibuf_io_imem_bits_btb_bits_taken),
    .io_imem_bits_btb_bits_mask(ibuf_io_imem_bits_btb_bits_mask),
    .io_imem_bits_btb_bits_bridx(ibuf_io_imem_bits_btb_bits_bridx),
    .io_imem_bits_btb_bits_target(ibuf_io_imem_bits_btb_bits_target),
    .io_imem_bits_btb_bits_entry(ibuf_io_imem_bits_btb_bits_entry),
    .io_imem_bits_btb_bits_bht_history(ibuf_io_imem_bits_btb_bits_bht_history),
    .io_imem_bits_btb_bits_bht_value(ibuf_io_imem_bits_btb_bits_bht_value),
    .io_imem_bits_pc(ibuf_io_imem_bits_pc),
    .io_imem_bits_data(ibuf_io_imem_bits_data),
    .io_imem_bits_xcpt_if(ibuf_io_imem_bits_xcpt_if),
    .io_imem_bits_replay(ibuf_io_imem_bits_replay),
    .io_kill(ibuf_io_kill),
    .io_pc(ibuf_io_pc),
    .io_btb_resp_taken(ibuf_io_btb_resp_taken),
    .io_btb_resp_mask(ibuf_io_btb_resp_mask),
    .io_btb_resp_bridx(ibuf_io_btb_resp_bridx),
    .io_btb_resp_target(ibuf_io_btb_resp_target),
    .io_btb_resp_entry(ibuf_io_btb_resp_entry),
    .io_btb_resp_bht_history(ibuf_io_btb_resp_bht_history),
    .io_btb_resp_bht_value(ibuf_io_btb_resp_bht_value),
    .io_inst_0_ready(ibuf_io_inst_0_ready),
    .io_inst_0_valid(ibuf_io_inst_0_valid),
    .io_inst_0_bits_pf0(ibuf_io_inst_0_bits_pf0),
    .io_inst_0_bits_pf1(ibuf_io_inst_0_bits_pf1),
    .io_inst_0_bits_replay(ibuf_io_inst_0_bits_replay),
    .io_inst_0_bits_btb_hit(ibuf_io_inst_0_bits_btb_hit),
    .io_inst_0_bits_rvc(ibuf_io_inst_0_bits_rvc),
    .io_inst_0_bits_inst_bits(ibuf_io_inst_0_bits_inst_bits),
    .io_inst_0_bits_inst_rd(ibuf_io_inst_0_bits_inst_rd),
    .io_inst_0_bits_inst_rs1(ibuf_io_inst_0_bits_inst_rs1),
    .io_inst_0_bits_inst_rs2(ibuf_io_inst_0_bits_inst_rs2),
    .io_inst_0_bits_inst_rs3(ibuf_io_inst_0_bits_inst_rs3),
    .io_inst_0_bits_raw(ibuf_io_inst_0_bits_raw)
  );
  CSRFile csr ( // @[Rocket.scala 187:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_interrupts_debug(csr_io_interrupts_debug),
    .io_interrupts_mtip(csr_io_interrupts_mtip),
    .io_interrupts_msip(csr_io_interrupts_msip),
    .io_interrupts_meip(csr_io_interrupts_meip),
    .io_interrupts_seip(csr_io_interrupts_seip),
    .io_hartid(csr_io_hartid),
    .io_rw_addr(csr_io_rw_addr),
    .io_rw_cmd(csr_io_rw_cmd),
    .io_rw_rdata(csr_io_rw_rdata),
    .io_rw_wdata(csr_io_rw_wdata),
    .io_decode_csr(csr_io_decode_csr),
    .io_decode_fp_illegal(csr_io_decode_fp_illegal),
    .io_decode_read_illegal(csr_io_decode_read_illegal),
    .io_decode_write_illegal(csr_io_decode_write_illegal),
    .io_decode_write_flush(csr_io_decode_write_flush),
    .io_decode_system_illegal(csr_io_decode_system_illegal),
    .io_csr_stall(csr_io_csr_stall),
    .io_eret(csr_io_eret),
    .io_singleStep(csr_io_singleStep),
    .io_status_debug(csr_io_status_debug),
    .io_status_isa(csr_io_status_isa),
    .io_status_prv(csr_io_status_prv),
    .io_status_sd(csr_io_status_sd),
    .io_status_zero2(csr_io_status_zero2),
    .io_status_sxl(csr_io_status_sxl),
    .io_status_uxl(csr_io_status_uxl),
    .io_status_sd_rv32(csr_io_status_sd_rv32),
    .io_status_zero1(csr_io_status_zero1),
    .io_status_tsr(csr_io_status_tsr),
    .io_status_tw(csr_io_status_tw),
    .io_status_tvm(csr_io_status_tvm),
    .io_status_mxr(csr_io_status_mxr),
    .io_status_pum(csr_io_status_pum),
    .io_status_mprv(csr_io_status_mprv),
    .io_status_xs(csr_io_status_xs),
    .io_status_fs(csr_io_status_fs),
    .io_status_mpp(csr_io_status_mpp),
    .io_status_hpp(csr_io_status_hpp),
    .io_status_spp(csr_io_status_spp),
    .io_status_mpie(csr_io_status_mpie),
    .io_status_hpie(csr_io_status_hpie),
    .io_status_spie(csr_io_status_spie),
    .io_status_upie(csr_io_status_upie),
    .io_status_mie(csr_io_status_mie),
    .io_status_hie(csr_io_status_hie),
    .io_status_sie(csr_io_status_sie),
    .io_status_uie(csr_io_status_uie),
    .io_ptbr_mode(csr_io_ptbr_mode),
    .io_ptbr_ppn(csr_io_ptbr_ppn),
    .io_evec(csr_io_evec),
    .io_exception(csr_io_exception),
    .io_retire(csr_io_retire),
    .io_cause(csr_io_cause),
    .io_pc(csr_io_pc),
    .io_badaddr(csr_io_badaddr),
    .io_fatc(csr_io_fatc),
    .io_time(csr_io_time),
    .io_fcsr_rm(csr_io_fcsr_rm),
    .io_fcsr_flags_valid(csr_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(csr_io_fcsr_flags_bits),
    .io_rocc_interrupt(csr_io_rocc_interrupt),
    .io_interrupt(csr_io_interrupt),
    .io_interrupt_cause(csr_io_interrupt_cause),
    .io_bp_0_control_action(csr_io_bp_0_control_action),
    .io_bp_0_control_tmatch(csr_io_bp_0_control_tmatch),
    .io_bp_0_control_m(csr_io_bp_0_control_m),
    .io_bp_0_control_s(csr_io_bp_0_control_s),
    .io_bp_0_control_u(csr_io_bp_0_control_u),
    .io_bp_0_control_x(csr_io_bp_0_control_x),
    .io_bp_0_control_w(csr_io_bp_0_control_w),
    .io_bp_0_control_r(csr_io_bp_0_control_r),
    .io_bp_0_address(csr_io_bp_0_address)
  );
  BreakpointUnit bpu ( // @[Rocket.scala 215:19]
    .io_status_debug(bpu_io_status_debug),
    .io_status_prv(bpu_io_status_prv),
    .io_bp_0_control_action(bpu_io_bp_0_control_action),
    .io_bp_0_control_tmatch(bpu_io_bp_0_control_tmatch),
    .io_bp_0_control_m(bpu_io_bp_0_control_m),
    .io_bp_0_control_s(bpu_io_bp_0_control_s),
    .io_bp_0_control_u(bpu_io_bp_0_control_u),
    .io_bp_0_control_x(bpu_io_bp_0_control_x),
    .io_bp_0_control_w(bpu_io_bp_0_control_w),
    .io_bp_0_control_r(bpu_io_bp_0_control_r),
    .io_bp_0_address(bpu_io_bp_0_address),
    .io_pc(bpu_io_pc),
    .io_ea(bpu_io_ea),
    .io_xcpt_if(bpu_io_xcpt_if),
    .io_xcpt_ld(bpu_io_xcpt_ld),
    .io_xcpt_st(bpu_io_xcpt_st),
    .io_debug_if(bpu_io_debug_if),
    .io_debug_ld(bpu_io_debug_ld),
    .io_debug_st(bpu_io_debug_st)
  );
  ALU alu ( // @[Rocket.scala 261:19]
    .io_dw(alu_io_dw),
    .io_fn(alu_io_fn),
    .io_in2(alu_io_in2),
    .io_in1(alu_io_in1),
    .io_out(alu_io_out),
    .io_adder_out(alu_io_adder_out),
    .io_cmp_out(alu_io_cmp_out)
  );
  MulDiv div ( // @[Rocket.scala 268:19]
    .clock(div_clock),
    .reset(div_reset),
    .io_req_ready(div_io_req_ready),
    .io_req_valid(div_io_req_valid),
    .io_req_bits_fn(div_io_req_bits_fn),
    .io_req_bits_dw(div_io_req_bits_dw),
    .io_req_bits_in1(div_io_req_bits_in1),
    .io_req_bits_in2(div_io_req_bits_in2),
    .io_req_bits_tag(div_io_req_bits_tag),
    .io_kill(div_io_kill),
    .io_resp_ready(div_io_resp_ready),
    .io_resp_valid(div_io_resp_valid),
    .io_resp_bits_data(div_io_resp_bits_data),
    .io_resp_bits_tag(div_io_resp_bits_tag)
  );
  assign _T_3331__T_3340_en = 1'h1;
  assign _T_3331__T_3340_addr = ~_T_3338;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_3331__T_3340_data = _T_3331[_T_3331__T_3340_addr]; // @[Rocket.scala 682:23]
  `else
  assign _T_3331__T_3340_data = _T_3331__T_3340_addr >= 5'h1f ? _RAND_1[63:0] : _T_3331[_T_3331__T_3340_addr]; // @[Rocket.scala 682:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_3331__T_3350_en = 1'h1;
  assign _T_3331__T_3350_addr = ~_T_3348;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_3331__T_3350_data = _T_3331[_T_3331__T_3350_addr]; // @[Rocket.scala 682:23]
  `else
  assign _T_3331__T_3350_data = _T_3331__T_3350_addr >= 5'h1f ? _RAND_2[63:0] : _T_3331[_T_3331__T_3350_addr]; // @[Rocket.scala 682:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_3331__T_4200_data = _T_4191 ? io_dmem_resp_bits_data : _T_4195;
  assign _T_3331__T_4200_addr = ~rf_waddr;
  assign _T_3331__T_4200_mask = 1'h1;
  assign _T_3331__T_4200_en = rf_wen & _T_4197;
  assign io_imem_req_valid = take_pc_wb | take_pc_mem; // @[Rocket.scala 161:35]
  assign io_imem_req_bits_pc = wb_reg_xcpt | csr_io_eret ? csr_io_evec : _T_4436; // @[Rocket.scala 540:8]
  assign io_imem_req_bits_speculative = ~take_pc_wb; // @[Rocket.scala 538:35]
  assign io_imem_resp_ready = ibuf_io_imem_ready; // @[Rocket.scala 168:16]
  assign io_imem_btb_update_valid = mem_reg_replay & mem_reg_btb_hit | mem_reg_valid & _T_4160 & ((mem_cfi_taken | ~
    mem_cfi) & mem_misprediction); // @[Rocket.scala 549:67]
  assign io_imem_btb_update_bits_prediction_valid = mem_reg_btb_hit; // @[Rocket.scala 556:44]
  assign io_imem_btb_update_bits_prediction_bits_taken = mem_reg_btb_resp_taken; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_prediction_bits_mask = mem_reg_btb_resp_mask; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_prediction_bits_bridx = mem_reg_btb_resp_bridx; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_prediction_bits_target = mem_reg_btb_resp_target; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_prediction_bits_entry = mem_reg_btb_resp_entry; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_prediction_bits_bht_history = mem_reg_btb_resp_bht_history; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_prediction_bits_bht_value = mem_reg_btb_resp_bht_value; // @[Rocket.scala 557:43]
  assign io_imem_btb_update_bits_pc = ~_T_4478; // @[Rocket.scala 555:33]
  assign io_imem_btb_update_bits_target = io_imem_req_bits_pc[38:0]; // @[Rocket.scala 553:34]
  assign io_imem_btb_update_bits_taken = 1'h0;
  assign io_imem_btb_update_bits_isValid = ~mem_reg_replay & mem_cfi; // @[Rocket.scala 550:54]
  assign io_imem_btb_update_bits_isJump = mem_ctrl_jal | mem_ctrl_jalr; // @[Rocket.scala 551:50]
  assign io_imem_btb_update_bits_isReturn = mem_ctrl_jalr & 5'h1 == _T_4468; // @[Rocket.scala 552:53]
  assign io_imem_btb_update_bits_br_pc = _T_4475[38:0]; // @[Rocket.scala 554:33]
  assign io_imem_bht_update_valid = _T_4448 & mem_ctrl_branch; // @[Rocket.scala 559:60]
  assign io_imem_bht_update_bits_prediction_valid = io_imem_btb_update_bits_prediction_valid; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_taken = io_imem_btb_update_bits_prediction_bits_taken; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_mask = io_imem_btb_update_bits_prediction_bits_mask; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_bridx = io_imem_btb_update_bits_prediction_bits_bridx; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_target = io_imem_btb_update_bits_prediction_bits_target; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_entry = io_imem_btb_update_bits_prediction_bits_entry; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_bht_history = io_imem_btb_update_bits_prediction_bits_bht_history; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_prediction_bits_bht_value = io_imem_btb_update_bits_prediction_bits_bht_value; // @[Rocket.scala 563:38]
  assign io_imem_bht_update_bits_pc = io_imem_btb_update_bits_pc; // @[Rocket.scala 560:30]
  assign io_imem_bht_update_bits_taken = mem_reg_wdata[0]; // @[Rocket.scala 338:35]
  assign io_imem_bht_update_bits_mispredict = ex_pc_valid ? mem_npc != ex_reg_pc : _T_4033; // @[Rocket.scala 344:26]
  assign io_imem_ras_update_valid = mem_reg_valid & _T_4160; // @[Rocket.scala 565:45]
  assign io_imem_ras_update_bits_isCall = io_imem_btb_update_bits_isJump & mem_waddr[0]; // @[Rocket.scala 567:68]
  assign io_imem_ras_update_bits_isReturn = io_imem_btb_update_bits_isReturn; // @[Rocket.scala 568:36]
  assign io_imem_ras_update_bits_returnAddr = mem_int_wdata[38:0]; // @[Rocket.scala 566:38]
  assign io_imem_ras_update_bits_prediction_valid = io_imem_btb_update_bits_prediction_valid; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_taken = io_imem_btb_update_bits_prediction_bits_taken; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_mask = io_imem_btb_update_bits_prediction_bits_mask; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_bridx = io_imem_btb_update_bits_prediction_bits_bridx; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_target = io_imem_btb_update_bits_prediction_bits_target; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_entry = io_imem_btb_update_bits_prediction_bits_entry; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_bht_history = io_imem_btb_update_bits_prediction_bits_bht_history; // @[Rocket.scala 569:38]
  assign io_imem_ras_update_bits_prediction_bits_bht_value = io_imem_btb_update_bits_prediction_bits_bht_value; // @[Rocket.scala 569:38]
  assign io_imem_flush_icache = wb_reg_valid & wb_ctrl_fence_i & ~io_dmem_s2_nack; // @[Rocket.scala 544:59]
  assign io_imem_flush_tlb = csr_io_fatc; // @[Rocket.scala 545:21]
  assign io_dmem_req_valid = ex_reg_valid & ex_ctrl_mem; // @[Rocket.scala 581:41]
  assign io_dmem_req_bits_addr = {_T_4516,alu_io_adder_out[38:0]}; // @[Cat.scala 30:58]
  assign io_dmem_req_bits_tag = {{1'd0}, ex_dcache_tag}; // @[Cat.scala 30:58]
  assign io_dmem_req_bits_cmd = ex_ctrl_mem_cmd; // @[Rocket.scala 585:25]
  assign io_dmem_req_bits_typ = ex_ctrl_mem_type; // @[Rocket.scala 586:25]
  assign io_dmem_req_bits_phys = 1'h0; // @[Rocket.scala 587:25]
  assign io_dmem_req_bits_data = 64'h0;
  assign io_dmem_s1_kill = killm_common | mem_breakpoint; // @[Rocket.scala 591:35]
  assign io_dmem_s1_data = mem_ctrl_fp ? io_fpu_store_data : mem_reg_rs2; // @[Rocket.scala 590:25]
  assign io_dmem_invalidate_lr = wb_reg_xcpt; // @[Rocket.scala 589:25]
  assign io_ptw_ptbr_mode = csr_io_ptbr_mode; // @[Rocket.scala 472:15]
  assign io_ptw_ptbr_asid = 16'h0; // @[Rocket.scala 472:15]
  assign io_ptw_ptbr_ppn = csr_io_ptbr_ppn; // @[Rocket.scala 472:15]
  assign io_ptw_invalidate = csr_io_fatc; // @[Rocket.scala 473:21]
  assign io_ptw_status_debug = csr_io_status_debug; // @[Rocket.scala 474:17]
  assign io_ptw_status_isa = csr_io_status_isa; // @[Rocket.scala 474:17]
  assign io_ptw_status_prv = csr_io_status_prv; // @[Rocket.scala 474:17]
  assign io_ptw_status_sd = csr_io_status_sd; // @[Rocket.scala 474:17]
  assign io_ptw_status_zero2 = 27'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_sxl = 2'h2; // @[Rocket.scala 474:17]
  assign io_ptw_status_uxl = 2'h2; // @[Rocket.scala 474:17]
  assign io_ptw_status_sd_rv32 = 1'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_zero1 = 8'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_tsr = csr_io_status_tsr; // @[Rocket.scala 474:17]
  assign io_ptw_status_tw = csr_io_status_tw; // @[Rocket.scala 474:17]
  assign io_ptw_status_tvm = csr_io_status_tvm; // @[Rocket.scala 474:17]
  assign io_ptw_status_mxr = csr_io_status_mxr; // @[Rocket.scala 474:17]
  assign io_ptw_status_pum = csr_io_status_pum; // @[Rocket.scala 474:17]
  assign io_ptw_status_mprv = csr_io_status_mprv; // @[Rocket.scala 474:17]
  assign io_ptw_status_xs = 2'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_fs = csr_io_status_fs; // @[Rocket.scala 474:17]
  assign io_ptw_status_mpp = csr_io_status_mpp; // @[Rocket.scala 474:17]
  assign io_ptw_status_hpp = 2'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_spp = csr_io_status_spp; // @[Rocket.scala 474:17]
  assign io_ptw_status_mpie = csr_io_status_mpie; // @[Rocket.scala 474:17]
  assign io_ptw_status_hpie = 1'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_spie = csr_io_status_spie; // @[Rocket.scala 474:17]
  assign io_ptw_status_upie = 1'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_mie = csr_io_status_mie; // @[Rocket.scala 474:17]
  assign io_ptw_status_hie = 1'h0; // @[Rocket.scala 474:17]
  assign io_ptw_status_sie = csr_io_status_sie; // @[Rocket.scala 474:17]
  assign io_ptw_status_uie = 1'h0; // @[Rocket.scala 474:17]
  assign io_fpu_inst = ibuf_io_inst_0_bits_inst_bits; // @[Rocket.scala 574:15]
  assign io_fpu_fromint_data = ex_reg_rs_bypass_0 ? _GEN_3 : _T_3605; // @[Rocket.scala 251:14]
  assign io_fpu_fcsr_rm = csr_io_fcsr_rm; // @[Rocket.scala 467:18]
  assign io_fpu_dmem_resp_val = dmem_resp_valid & io_dmem_resp_bits_tag[0]; // @[Rocket.scala 576:43]
  assign io_fpu_dmem_resp_type = io_dmem_resp_bits_typ; // @[Rocket.scala 578:25]
  assign io_fpu_dmem_resp_tag = io_dmem_resp_bits_tag[5:1]; // @[Rocket.scala 425:46]
  assign io_fpu_dmem_resp_data = io_dmem_resp_bits_data_word_bypass; // @[Rocket.scala 577:25]
  assign io_fpu_valid = _T_3444 & id_ctrl_fp; // @[Rocket.scala 571:31]
  assign io_fpu_killx = take_pc_mem_wb | replay_ex | ~ex_reg_valid; // @[Rocket.scala 329:48]
  assign io_fpu_killm = dcache_kill_mem | take_pc_wb | mem_reg_xcpt | ~mem_reg_valid; // @[Rocket.scala 395:68]
  assign io_rocc_cmd_valid = 1'h0; // @[Rocket.scala 596:53]
  assign io_rocc_cmd_bits_inst_funct = wb_reg_inst[31:25]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_rs2 = wb_reg_inst[24:20]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_rs1 = wb_reg_inst[19:15]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_xd = wb_reg_inst[14]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_xs1 = wb_reg_inst[13]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_xs2 = wb_reg_inst[12]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_rd = wb_reg_inst[11:7]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_inst_opcode = wb_reg_inst[6:0]; // @[Rocket.scala 599:58]
  assign io_rocc_cmd_bits_rs1 = wb_reg_wdata; // @[Rocket.scala 600:24]
  assign io_rocc_cmd_bits_rs2 = 64'h0; // @[Rocket.scala 601:24]
  assign io_rocc_cmd_bits_status_debug = csr_io_status_debug; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_isa = csr_io_status_isa; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_prv = csr_io_status_prv; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_sd = csr_io_status_sd; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_zero2 = 27'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_sxl = 2'h2; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_uxl = 2'h2; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_sd_rv32 = 1'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_zero1 = 8'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_tsr = csr_io_status_tsr; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_tw = csr_io_status_tw; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_tvm = csr_io_status_tvm; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_mxr = csr_io_status_mxr; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_pum = csr_io_status_pum; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_mprv = csr_io_status_mprv; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_xs = 2'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_fs = csr_io_status_fs; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_mpp = csr_io_status_mpp; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_hpp = 2'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_spp = csr_io_status_spp; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_mpie = csr_io_status_mpie; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_hpie = 1'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_spie = csr_io_status_spie; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_upie = 1'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_mie = csr_io_status_mie; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_hie = 1'h0; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_sie = csr_io_status_sie; // @[Rocket.scala 598:27]
  assign io_rocc_cmd_bits_status_uie = 1'h0; // @[Rocket.scala 598:27]
  assign io_rocc_resp_ready = 1'h0;
  assign io_rocc_mem_req_ready = 1'h0;
  assign io_rocc_mem_s2_nack = 1'h0;
  assign io_rocc_mem_acquire = 1'h0;
  assign io_rocc_mem_release = 1'h0;
  assign io_rocc_mem_resp_valid = 1'h0;
  assign io_rocc_mem_resp_bits_addr = 40'h0;
  assign io_rocc_mem_resp_bits_tag = 7'h0;
  assign io_rocc_mem_resp_bits_cmd = 5'h0;
  assign io_rocc_mem_resp_bits_typ = 3'h0;
  assign io_rocc_mem_resp_bits_data = 64'h0;
  assign io_rocc_mem_resp_bits_replay = 1'h0;
  assign io_rocc_mem_resp_bits_has_data = 1'h0;
  assign io_rocc_mem_resp_bits_data_word_bypass = 64'h0;
  assign io_rocc_mem_resp_bits_store_data = 64'h0;
  assign io_rocc_mem_replay_next = 1'h0;
  assign io_rocc_mem_xcpt_ma_ld = 1'h0;
  assign io_rocc_mem_xcpt_ma_st = 1'h0;
  assign io_rocc_mem_xcpt_pf_ld = 1'h0;
  assign io_rocc_mem_xcpt_pf_st = 1'h0;
  assign io_rocc_mem_ordered = 1'h0;
  assign io_rocc_exception = 1'h0; // @[Rocket.scala 597:32]
  assign ibuf_clock = clock;
  assign ibuf_reset = reset;
  assign ibuf_io_imem_valid = io_imem_resp_valid; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_valid = io_imem_resp_bits_btb_valid; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_taken = io_imem_resp_bits_btb_bits_taken; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_mask = io_imem_resp_bits_btb_bits_mask; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_bridx = io_imem_resp_bits_btb_bits_bridx; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_target = io_imem_resp_bits_btb_bits_target; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_entry = io_imem_resp_bits_btb_bits_entry; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_bht_history = io_imem_resp_bits_btb_bits_bht_history; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_btb_bits_bht_value = io_imem_resp_bits_btb_bits_bht_value; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_pc = io_imem_resp_bits_pc; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_data = io_imem_resp_bits_data; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_xcpt_if = io_imem_resp_bits_xcpt_if; // @[Rocket.scala 168:16]
  assign ibuf_io_imem_bits_replay = io_imem_resp_bits_replay; // @[Rocket.scala 168:16]
  assign ibuf_io_kill = take_pc_wb | take_pc_mem; // @[Rocket.scala 161:35]
  assign ibuf_io_inst_0_ready = ~ctrl_stalld | csr_io_interrupt; // @[Rocket.scala 547:41]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_interrupts_debug = io_interrupts_debug; // @[Rocket.scala 465:21]
  assign csr_io_interrupts_mtip = io_interrupts_mtip; // @[Rocket.scala 465:21]
  assign csr_io_interrupts_msip = io_interrupts_msip; // @[Rocket.scala 465:21]
  assign csr_io_interrupts_meip = io_interrupts_meip; // @[Rocket.scala 465:21]
  assign csr_io_interrupts_seip = io_interrupts_seip; // @[Rocket.scala 465:21]
  assign csr_io_hartid = io_hartid; // @[Rocket.scala 466:17]
  assign csr_io_rw_addr = wb_reg_inst[31:20]; // @[Rocket.scala 475:32]
  assign csr_io_rw_cmd = wb_reg_valid ? wb_ctrl_csr : 3'h0; // @[Rocket.scala 476:23]
  assign csr_io_rw_wdata = wb_reg_wdata; // @[Rocket.scala 477:19]
  assign csr_io_decode_csr = ibuf_io_inst_0_bits_raw[31:20]; // @[Rocket.scala 461:48]
  assign csr_io_exception = wb_reg_xcpt; // @[Rocket.scala 462:20]
  assign csr_io_retire = wb_reg_valid & ~replay_wb_common & ~wb_reg_xcpt; // @[Rocket.scala 450:45]
  assign csr_io_cause = wb_reg_cause; // @[Rocket.scala 463:16]
  assign csr_io_pc = wb_reg_pc; // @[Rocket.scala 470:13]
  assign csr_io_badaddr = {_T_4225,wb_reg_wdata[38:0]}; // @[Cat.scala 30:58]
  assign csr_io_fcsr_flags_valid = io_fpu_fcsr_flags_valid; // @[Rocket.scala 468:21]
  assign csr_io_fcsr_flags_bits = io_fpu_fcsr_flags_bits; // @[Rocket.scala 468:21]
  assign csr_io_rocc_interrupt = io_rocc_interrupt; // @[Rocket.scala 469:25]
  assign bpu_io_status_debug = csr_io_status_debug; // @[Rocket.scala 216:17]
  assign bpu_io_status_prv = csr_io_status_prv; // @[Rocket.scala 216:17]
  assign bpu_io_bp_0_control_action = csr_io_bp_0_control_action; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_tmatch = csr_io_bp_0_control_tmatch; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_m = csr_io_bp_0_control_m; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_s = csr_io_bp_0_control_s; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_u = csr_io_bp_0_control_u; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_x = csr_io_bp_0_control_x; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_w = csr_io_bp_0_control_w; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_control_r = csr_io_bp_0_control_r; // @[Rocket.scala 217:13]
  assign bpu_io_bp_0_address = csr_io_bp_0_address; // @[Rocket.scala 217:13]
  assign bpu_io_pc = ibuf_io_pc[38:0]; // @[Rocket.scala 218:13]
  assign bpu_io_ea = mem_reg_wdata[38:0]; // @[Rocket.scala 219:13]
  assign alu_io_dw = ex_ctrl_alu_dw; // @[Rocket.scala 262:13]
  assign alu_io_fn = ex_ctrl_alu_fn; // @[Rocket.scala 263:13]
  assign alu_io_in2 = 2'h2 == ex_ctrl_sel_alu2 ? $signed(_T_3701) : $signed({{32{_T_3710[31]}},_T_3710}); // @[Rocket.scala 264:24]
  assign alu_io_in1 = 2'h1 == ex_ctrl_sel_alu1 ? $signed(_T_3693) : $signed({{24{_T_3697[39]}},_T_3697}); // @[Rocket.scala 265:24]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_req_valid = ex_reg_valid & ex_ctrl_div; // @[Rocket.scala 269:36]
  assign div_io_req_bits_fn = ex_ctrl_alu_fn; // @[Rocket.scala 271:22]
  assign div_io_req_bits_dw = ex_ctrl_alu_dw; // @[Rocket.scala 270:22]
  assign div_io_req_bits_in1 = ex_reg_rs_bypass_0 ? _GEN_3 : _T_3605; // @[Rocket.scala 251:14]
  assign div_io_req_bits_in2 = ex_reg_rs_bypass_1 ? _GEN_7 : _T_3607; // @[Rocket.scala 251:14]
  assign div_io_req_bits_tag = ex_reg_inst[11:7]; // @[Rocket.scala 235:29]
  assign div_io_kill = killm_common & _T_4154; // @[Rocket.scala 396:31]
  assign div_io_resp_ready = dmem_resp_replay & dmem_resp_xpu ? 1'h0 : _T_4415; // @[Rocket.scala 442:44 Rocket.scala 443:23 Rocket.scala 429:21]
  always @(posedge clock) begin
    if (_T_3331__T_4200_en & _T_3331__T_4200_mask) begin
      _T_3331[_T_3331__T_4200_addr] <= _T_3331__T_4200_data; // @[Rocket.scala 682:23]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_fp <= id_ctrl_fp; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_branch <= id_ctrl_branch; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_jal <= id_ctrl_jal; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_jalr <= id_ctrl_jalr; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_rxs2 <= id_ctrl_rxs2; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_xcpt) begin // @[Rocket.scala 288:20]
        if (~bpu_io_xcpt_if & ~ibuf_io_inst_0_bits_pf0 & ibuf_io_inst_0_bits_pf1) begin // @[Rocket.scala 293:87]
          ex_ctrl_sel_alu2 <= 2'h1; // @[Rocket.scala 294:26]
        end else begin
          ex_ctrl_sel_alu2 <= 2'h0; // @[Rocket.scala 292:24]
        end
      end else begin
        ex_ctrl_sel_alu2 <= id_ctrl_sel_alu2; // @[Rocket.scala 285:13]
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_xcpt) begin // @[Rocket.scala 288:20]
        ex_ctrl_sel_alu1 <= 2'h2; // @[Rocket.scala 291:24]
      end else begin
        ex_ctrl_sel_alu1 <= id_ctrl_sel_alu1; // @[Rocket.scala 285:13]
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_sel_imm <= id_ctrl_sel_imm; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_alu_dw <= _GEN_19;
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_xcpt) begin // @[Rocket.scala 288:20]
        ex_ctrl_alu_fn <= 4'h0; // @[Rocket.scala 289:22]
      end else begin
        ex_ctrl_alu_fn <= id_ctrl_alu_fn; // @[Rocket.scala 285:13]
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_mem <= id_ctrl_mem; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_mem_cmd <= id_ctrl_mem_cmd; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_mem_type <= id_ctrl_mem_type; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_wfd <= id_ctrl_wfd; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_div <= id_ctrl_div; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_wxd <= id_ctrl_wxd; // @[Rocket.scala 285:13]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_csr_ren) begin // @[Rocket.scala 191:19]
        ex_ctrl_csr <= 3'h5;
      end else begin
        ex_ctrl_csr <= id_ctrl_csr;
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_ctrl_fence_i <= _GEN_24;
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_fp <= ex_ctrl_fp; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_branch <= ex_ctrl_branch; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_jal <= ex_ctrl_jal; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_jalr <= ex_ctrl_jalr; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_mem <= ex_ctrl_mem; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_wfd <= ex_ctrl_wfd; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_div <= ex_ctrl_div; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_wxd <= ex_ctrl_wxd; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_csr <= ex_ctrl_csr; // @[Rocket.scala 360:14]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_ctrl_fence_i <= ex_ctrl_fence_i; // @[Rocket.scala 360:14]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_ctrl_mem <= mem_ctrl_mem; // @[Rocket.scala 405:13]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_ctrl_wfd <= mem_ctrl_wfd; // @[Rocket.scala 405:13]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_ctrl_div <= mem_ctrl_div; // @[Rocket.scala 405:13]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_ctrl_wxd <= mem_ctrl_wxd; // @[Rocket.scala 405:13]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_ctrl_csr <= mem_ctrl_csr; // @[Rocket.scala 405:13]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_ctrl_fence_i <= mem_ctrl_fence_i; // @[Rocket.scala 405:13]
    end
    ex_reg_xcpt_interrupt <= _T_3719 & csr_io_interrupt; // @[Rocket.scala 279:62]
    ex_reg_valid <= ~ctrl_killd; // @[Rocket.scala 276:19]
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_xcpt) begin // @[Rocket.scala 288:20]
        ex_reg_rvc <= _GEN_17;
      end else begin
        ex_reg_rvc <= ibuf_io_inst_0_bits_rvc; // @[Rocket.scala 286:16]
      end
    end
    ex_reg_btb_hit <= ibuf_io_inst_0_bits_btb_hit; // @[Rocket.scala 281:18]
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_taken <= ibuf_io_btb_resp_taken; // @[Rocket.scala 282:57]
    end
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_mask <= ibuf_io_btb_resp_mask; // @[Rocket.scala 282:57]
    end
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_bridx <= ibuf_io_btb_resp_bridx; // @[Rocket.scala 282:57]
    end
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_target <= ibuf_io_btb_resp_target; // @[Rocket.scala 282:57]
    end
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_entry <= ibuf_io_btb_resp_entry; // @[Rocket.scala 282:57]
    end
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_bht_history <= ibuf_io_btb_resp_bht_history; // @[Rocket.scala 282:57]
    end
    if (ibuf_io_inst_0_bits_btb_hit) begin // @[Rocket.scala 282:39]
      ex_reg_btb_resp_bht_value <= ibuf_io_btb_resp_bht_value; // @[Rocket.scala 282:57]
    end
    ex_reg_xcpt <= _T_3444 & id_xcpt; // @[Rocket.scala 278:30]
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_reg_flush_pipe <= _GEN_23;
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_reg_load_use <= id_load_use; // @[Rocket.scala 299:21]
    end
    if (id_xcpt) begin // @[Rocket.scala 280:18]
      if (csr_io_interrupt) begin // @[Mux.scala 31:69]
        ex_cause <= csr_io_interrupt_cause;
      end else begin
        ex_cause <= {{60'd0}, _T_3557};
      end
    end
    ex_reg_replay <= ~take_pc_mem_wb & ibuf_io_inst_0_valid & ibuf_io_inst_0_bits_replay; // @[Rocket.scala 277:54]
    if (_T_3444 | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[Rocket.scala 317:73]
      ex_reg_pc <= ibuf_io_pc; // @[Rocket.scala 319:15]
    end
    if (_T_3444 | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[Rocket.scala 317:73]
      ex_reg_inst <= ibuf_io_inst_0_bits_inst_bits; // @[Rocket.scala 318:17]
    end
    mem_reg_xcpt_interrupt <= _T_3718 & ex_reg_xcpt_interrupt; // @[Rocket.scala 356:45]
    mem_reg_valid <= ~ctrl_killx; // @[Rocket.scala 353:20]
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_rvc <= ex_reg_rvc; // @[Rocket.scala 361:17]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_btb_hit <= ex_reg_btb_hit; // @[Rocket.scala 364:21]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_taken <= ex_reg_btb_resp_taken; // @[Rocket.scala 365:46]
      end
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_mask <= ex_reg_btb_resp_mask; // @[Rocket.scala 365:46]
      end
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_bridx <= ex_reg_btb_resp_bridx; // @[Rocket.scala 365:46]
      end
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_target <= ex_reg_btb_resp_target; // @[Rocket.scala 365:46]
      end
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_entry <= ex_reg_btb_resp_entry; // @[Rocket.scala 365:46]
      end
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_bht_history <= ex_reg_btb_resp_bht_history; // @[Rocket.scala 365:46]
      end
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_reg_btb_hit) begin // @[Rocket.scala 365:27]
        mem_reg_btb_resp_bht_value <= ex_reg_btb_resp_bht_value; // @[Rocket.scala 365:46]
      end
    end
    mem_reg_xcpt <= _T_4054 & ex_xcpt; // @[Rocket.scala 355:31]
    mem_reg_replay <= _T_3718 & replay_ex; // @[Rocket.scala 354:37]
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_flush_pipe <= ex_reg_flush_pipe; // @[Rocket.scala 366:24]
    end
    if (ex_xcpt) begin // @[Rocket.scala 357:18]
      mem_reg_cause <= ex_cause; // @[Rocket.scala 357:34]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_slow_bypass <= ex_slow_bypass; // @[Rocket.scala 367:25]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_load <= ex_ctrl_mem & _T_4076; // @[Rocket.scala 362:18]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_store <= ex_ctrl_mem & _T_4087; // @[Rocket.scala 363:19]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_pc <= ex_reg_pc; // @[Rocket.scala 370:16]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_inst <= ex_reg_inst; // @[Rocket.scala 369:18]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      mem_reg_wdata <= alu_io_out; // @[Rocket.scala 371:19]
    end
    if (ex_pc_valid) begin // @[Rocket.scala 359:22]
      if (ex_ctrl_rxs2 & ex_ctrl_mem) begin // @[Rocket.scala 372:58]
        if (ex_reg_rs_bypass_1) begin // @[Rocket.scala 251:14]
          if (2'h3 == ex_reg_rs_lsb_1) begin // @[Rocket.scala 251:14]
            mem_reg_rs2 <= io_dmem_resp_bits_data_word_bypass; // @[Rocket.scala 251:14]
          end else begin
            mem_reg_rs2 <= _GEN_6;
          end
        end else begin
          mem_reg_rs2 <= _T_3607;
        end
      end
    end
    wb_reg_valid <= ~ctrl_killm; // @[Rocket.scala 400:19]
    wb_reg_xcpt <= mem_xcpt & _T_4160; // @[Rocket.scala 402:27]
    wb_reg_replay <= replay_mem & ~take_pc_wb; // @[Rocket.scala 401:31]
    if (mem_xcpt) begin // @[Rocket.scala 403:19]
      if (_T_4144) begin // @[Mux.scala 31:69]
        wb_reg_cause <= mem_reg_cause;
      end else begin
        wb_reg_cause <= {{60'd0}, mem_new_cause};
      end
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_reg_pc <= mem_reg_pc; // @[Rocket.scala 411:15]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      wb_reg_inst <= mem_reg_inst; // @[Rocket.scala 410:17]
    end
    if (mem_pc_valid) begin // @[Rocket.scala 404:23]
      if (_T_4039 & mem_ctrl_fp & mem_ctrl_wxd) begin // @[Rocket.scala 406:24]
        wb_reg_wdata <= io_fpu_toint_data;
      end else begin
        wb_reg_wdata <= mem_int_wdata;
      end
    end
    if (reset) begin // @[Rocket.scala 668:25]
      _T_4241 <= 32'h0; // @[Rocket.scala 668:25]
    end else if (_T_4268) begin // @[Rocket.scala 676:18]
      _T_4241 <= _T_4267; // @[Rocket.scala 676:23]
    end else if (ll_wen) begin // @[Rocket.scala 676:18]
      _T_4241 <= _T_4250; // @[Rocket.scala 676:23]
    end
    if (reset) begin // @[Rocket.scala 668:25]
      _T_4348 <= 32'h0; // @[Rocket.scala 668:25]
    end else if (_T_4373) begin // @[Rocket.scala 676:18]
      _T_4348 <= _T_4372; // @[Rocket.scala 676:23]
    end else if (_T_4366) begin // @[Rocket.scala 676:18]
      _T_4348 <= _T_4365; // @[Rocket.scala 676:23]
    end else if (_T_4352) begin // @[Rocket.scala 676:18]
      _T_4348 <= _T_4357; // @[Rocket.scala 676:23]
    end
    dcache_blocked <= _T_3785 & (io_dmem_req_valid | dcache_blocked); // @[Rocket.scala 523:40]
    if (reset) begin // @[Rocket.scala 178:25]
      id_reg_fence <= 1'h0; // @[Rocket.scala 178:25]
    end else begin
      id_reg_fence <= id_fence_next | id_reg_fence & id_mem_busy; // @[Rocket.scala 211:16]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_reg_rs_bypass_0 <= _T_3749; // @[Rocket.scala 309:27]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      ex_reg_rs_bypass_1 <= _T_3764; // @[Rocket.scala 309:27]
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_ctrl_rxs1 & ~_T_3749) begin // @[Rocket.scala 311:38]
        ex_reg_rs_lsb_0 <= id_rs_0[1:0]; // @[Rocket.scala 312:26]
      end else if (id_bypass_src_0_0) begin // @[Mux.scala 31:69]
        ex_reg_rs_lsb_0 <= 2'h0;
      end else if (id_bypass_src_0_1) begin // @[Mux.scala 31:69]
        ex_reg_rs_lsb_0 <= 2'h1;
      end else begin
        ex_reg_rs_lsb_0 <= _T_3754;
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_ctrl_rxs2 & ~_T_3764) begin // @[Rocket.scala 311:38]
        ex_reg_rs_lsb_1 <= id_rs_1[1:0]; // @[Rocket.scala 312:26]
      end else if (id_bypass_src_1_0) begin // @[Mux.scala 31:69]
        ex_reg_rs_lsb_1 <= 2'h0;
      end else if (id_bypass_src_1_1) begin // @[Mux.scala 31:69]
        ex_reg_rs_lsb_1 <= 2'h1;
      end else begin
        ex_reg_rs_lsb_1 <= _T_3769;
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_ctrl_rxs1 & ~_T_3749) begin // @[Rocket.scala 311:38]
        ex_reg_rs_msb_0 <= id_rs_0[63:2]; // @[Rocket.scala 313:26]
      end
    end
    if (_T_3444) begin // @[Rocket.scala 284:22]
      if (id_ctrl_rxs2 & ~_T_3764) begin // @[Rocket.scala 311:38]
        ex_reg_rs_msb_1 <= id_rs_1[63:2]; // @[Rocket.scala 313:26]
      end
    end
    _T_4154 <= div_io_req_ready & div_io_req_valid; // @[Decoupled.scala 30:37]
    if (ex_reg_rs_bypass_0) begin // @[Rocket.scala 251:14]
      if (2'h3 == ex_reg_rs_lsb_0) begin // @[Rocket.scala 251:14]
        _T_4581 <= io_dmem_resp_bits_data_word_bypass; // @[Rocket.scala 251:14]
      end else if (2'h2 == ex_reg_rs_lsb_0) begin // @[Rocket.scala 251:14]
        _T_4581 <= wb_reg_wdata; // @[Rocket.scala 251:14]
      end else if (2'h1 == ex_reg_rs_lsb_0) begin // @[Rocket.scala 251:14]
        _T_4581 <= mem_reg_wdata; // @[Rocket.scala 251:14]
      end else begin
        _T_4581 <= 64'h0;
      end
    end else begin
      _T_4581 <= _T_3605;
    end
    _T_4582 <= _T_4581; // @[Rocket.scala 639:33]
    if (ex_reg_rs_bypass_1) begin // @[Rocket.scala 251:14]
      if (2'h3 == ex_reg_rs_lsb_1) begin // @[Rocket.scala 251:14]
        _T_4584 <= io_dmem_resp_bits_data_word_bypass; // @[Rocket.scala 251:14]
      end else if (2'h2 == ex_reg_rs_lsb_1) begin // @[Rocket.scala 251:14]
        _T_4584 <= wb_reg_wdata; // @[Rocket.scala 251:14]
      end else if (2'h1 == ex_reg_rs_lsb_1) begin // @[Rocket.scala 251:14]
        _T_4584 <= mem_reg_wdata; // @[Rocket.scala 251:14]
      end else begin
        _T_4584 <= 64'h0;
      end
    end else begin
      _T_4584 <= _T_3607;
    end
    _T_4585 <= _T_4584; // @[Rocket.scala 640:33]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4524 & ~(_T_4527 != 4'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Rocket.scala:593 assert(io.dmem.xcpt.asUInt.orR) // make sure s1_kill is exhaustive\n"
            ); // @[Rocket.scala 593:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_4524 & ~(_T_4527 != 4'h0 | reset)) begin
          $fatal; // @[Rocket.scala 593:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"C%d: %d [%d] pc=[%x] W[r%d=%x][%d] R[r%d=%x] R[r%d=%x] inst=[%x] DASM(%x)\n",io_hartid,
            csr_io_time[31:0],wb_valid,wb_reg_pc,_T_4579,rf_wdata,rf_wen,wb_reg_inst[19:15],_T_4582,wb_reg_inst[24:20],
            _T_4585,wb_reg_inst,wb_reg_inst); // @[Rocket.scala 636:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
  _RAND_2 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 31; initvar = initvar+1)
    _T_3331[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ex_ctrl_fp = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ex_ctrl_branch = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ex_ctrl_jal = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ex_ctrl_jalr = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ex_ctrl_rxs2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ex_ctrl_sel_alu2 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  ex_ctrl_sel_alu1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  ex_ctrl_sel_imm = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  ex_ctrl_alu_dw = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ex_ctrl_alu_fn = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  ex_ctrl_mem = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ex_ctrl_mem_cmd = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  ex_ctrl_mem_type = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  ex_ctrl_wfd = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  ex_ctrl_div = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  ex_ctrl_wxd = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  ex_ctrl_csr = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  ex_ctrl_fence_i = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  mem_ctrl_fp = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  mem_ctrl_branch = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_ctrl_jal = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  mem_ctrl_jalr = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mem_ctrl_mem = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  mem_ctrl_wfd = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_ctrl_div = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  mem_ctrl_wxd = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  mem_ctrl_csr = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  mem_ctrl_fence_i = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  wb_ctrl_mem = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  wb_ctrl_wfd = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  wb_ctrl_div = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  wb_ctrl_wxd = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  wb_ctrl_csr = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  wb_ctrl_fence_i = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  ex_reg_xcpt_interrupt = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  ex_reg_valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  ex_reg_rvc = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  ex_reg_btb_hit = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  ex_reg_btb_resp_taken = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  ex_reg_btb_resp_mask = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  ex_reg_btb_resp_bridx = _RAND_43[0:0];
  _RAND_44 = {2{`RANDOM}};
  ex_reg_btb_resp_target = _RAND_44[38:0];
  _RAND_45 = {1{`RANDOM}};
  ex_reg_btb_resp_entry = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  ex_reg_btb_resp_bht_history = _RAND_46[6:0];
  _RAND_47 = {1{`RANDOM}};
  ex_reg_btb_resp_bht_value = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  ex_reg_xcpt = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  ex_reg_flush_pipe = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  ex_reg_load_use = _RAND_50[0:0];
  _RAND_51 = {2{`RANDOM}};
  ex_cause = _RAND_51[63:0];
  _RAND_52 = {1{`RANDOM}};
  ex_reg_replay = _RAND_52[0:0];
  _RAND_53 = {2{`RANDOM}};
  ex_reg_pc = _RAND_53[39:0];
  _RAND_54 = {1{`RANDOM}};
  ex_reg_inst = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  mem_reg_xcpt_interrupt = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  mem_reg_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  mem_reg_rvc = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  mem_reg_btb_hit = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  mem_reg_btb_resp_taken = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  mem_reg_btb_resp_mask = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  mem_reg_btb_resp_bridx = _RAND_61[0:0];
  _RAND_62 = {2{`RANDOM}};
  mem_reg_btb_resp_target = _RAND_62[38:0];
  _RAND_63 = {1{`RANDOM}};
  mem_reg_btb_resp_entry = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  mem_reg_btb_resp_bht_history = _RAND_64[6:0];
  _RAND_65 = {1{`RANDOM}};
  mem_reg_btb_resp_bht_value = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  mem_reg_xcpt = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  mem_reg_replay = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  mem_reg_flush_pipe = _RAND_68[0:0];
  _RAND_69 = {2{`RANDOM}};
  mem_reg_cause = _RAND_69[63:0];
  _RAND_70 = {1{`RANDOM}};
  mem_reg_slow_bypass = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  mem_reg_load = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  mem_reg_store = _RAND_72[0:0];
  _RAND_73 = {2{`RANDOM}};
  mem_reg_pc = _RAND_73[39:0];
  _RAND_74 = {1{`RANDOM}};
  mem_reg_inst = _RAND_74[31:0];
  _RAND_75 = {2{`RANDOM}};
  mem_reg_wdata = _RAND_75[63:0];
  _RAND_76 = {2{`RANDOM}};
  mem_reg_rs2 = _RAND_76[63:0];
  _RAND_77 = {1{`RANDOM}};
  wb_reg_valid = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  wb_reg_xcpt = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  wb_reg_replay = _RAND_79[0:0];
  _RAND_80 = {2{`RANDOM}};
  wb_reg_cause = _RAND_80[63:0];
  _RAND_81 = {2{`RANDOM}};
  wb_reg_pc = _RAND_81[39:0];
  _RAND_82 = {1{`RANDOM}};
  wb_reg_inst = _RAND_82[31:0];
  _RAND_83 = {2{`RANDOM}};
  wb_reg_wdata = _RAND_83[63:0];
  _RAND_84 = {1{`RANDOM}};
  _T_4241 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  _T_4348 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  dcache_blocked = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  id_reg_fence = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  ex_reg_rs_bypass_0 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  ex_reg_rs_bypass_1 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  ex_reg_rs_lsb_0 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  ex_reg_rs_lsb_1 = _RAND_91[1:0];
  _RAND_92 = {2{`RANDOM}};
  ex_reg_rs_msb_0 = _RAND_92[61:0];
  _RAND_93 = {2{`RANDOM}};
  ex_reg_rs_msb_1 = _RAND_93[61:0];
  _RAND_94 = {1{`RANDOM}};
  _T_4154 = _RAND_94[0:0];
  _RAND_95 = {2{`RANDOM}};
  _T_4581 = _RAND_95[63:0];
  _RAND_96 = {2{`RANDOM}};
  _T_4582 = _RAND_96[63:0];
  _RAND_97 = {2{`RANDOM}};
  _T_4584 = _RAND_97[63:0];
  _RAND_98 = {2{`RANDOM}};
  _T_4585 = _RAND_98[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IBuf(
  input         clock,
  input         reset,
  output        io_imem_ready,
  input         io_imem_valid,
  input         io_imem_bits_btb_valid,
  input         io_imem_bits_btb_bits_taken,
  input  [1:0]  io_imem_bits_btb_bits_mask,
  input         io_imem_bits_btb_bits_bridx,
  input  [38:0] io_imem_bits_btb_bits_target,
  input  [5:0]  io_imem_bits_btb_bits_entry,
  input  [6:0]  io_imem_bits_btb_bits_bht_history,
  input  [1:0]  io_imem_bits_btb_bits_bht_value,
  input  [39:0] io_imem_bits_pc,
  input  [31:0] io_imem_bits_data,
  input         io_imem_bits_xcpt_if,
  input         io_imem_bits_replay,
  input         io_kill,
  output [39:0] io_pc,
  output        io_btb_resp_taken,
  output [1:0]  io_btb_resp_mask,
  output        io_btb_resp_bridx,
  output [38:0] io_btb_resp_target,
  output [5:0]  io_btb_resp_entry,
  output [6:0]  io_btb_resp_bht_history,
  output [1:0]  io_btb_resp_bht_value,
  input         io_inst_0_ready,
  output        io_inst_0_valid,
  output        io_inst_0_bits_pf0,
  output        io_inst_0_bits_pf1,
  output        io_inst_0_bits_replay,
  output        io_inst_0_bits_btb_hit,
  output        io_inst_0_bits_rvc,
  output [31:0] io_inst_0_bits_inst_bits,
  output [4:0]  io_inst_0_bits_inst_rd,
  output [4:0]  io_inst_0_bits_inst_rs1,
  output [4:0]  io_inst_0_bits_inst_rs2,
  output [4:0]  io_inst_0_bits_inst_rs3,
  output [31:0] io_inst_0_bits_raw
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] RVCExpander_io_in; // @[IBuf.scala 93:21]
  wire [31:0] RVCExpander_io_out_bits; // @[IBuf.scala 93:21]
  wire [4:0] RVCExpander_io_out_rd; // @[IBuf.scala 93:21]
  wire [4:0] RVCExpander_io_out_rs1; // @[IBuf.scala 93:21]
  wire [4:0] RVCExpander_io_out_rs2; // @[IBuf.scala 93:21]
  wire [4:0] RVCExpander_io_out_rs3; // @[IBuf.scala 93:21]
  wire  RVCExpander_io_rvc; // @[IBuf.scala 93:21]
  reg  nBufValid; // @[IBuf.scala 35:47]
  reg [39:0] buf_pc; // @[IBuf.scala 36:16]
  reg [31:0] buf_data; // @[IBuf.scala 36:16]
  reg  buf_xcpt_if; // @[IBuf.scala 36:16]
  reg  buf_replay; // @[IBuf.scala 36:16]
  reg  ibufBTBHit; // @[IBuf.scala 37:23]
  reg  ibufBTBResp_taken; // @[IBuf.scala 38:24]
  reg [1:0] ibufBTBResp_mask; // @[IBuf.scala 38:24]
  reg  ibufBTBResp_bridx; // @[IBuf.scala 38:24]
  reg [38:0] ibufBTBResp_target; // @[IBuf.scala 38:24]
  reg [5:0] ibufBTBResp_entry; // @[IBuf.scala 38:24]
  reg [6:0] ibufBTBResp_bht_history; // @[IBuf.scala 38:24]
  reg [1:0] ibufBTBResp_bht_value; // @[IBuf.scala 38:24]
  wire  pcWordBits = io_imem_bits_pc[1]; // @[Package.scala 44:13]
  wire [1:0] _T_377 = io_imem_bits_btb_bits_bridx + 1'h1; // @[IBuf.scala 43:100]
  wire [1:0] _T_379 = io_imem_bits_btb_valid & io_imem_bits_btb_bits_taken ? _T_377 : 2'h2; // @[IBuf.scala 43:16]
  wire [1:0] _GEN_31 = {{1'd0}, pcWordBits}; // @[IBuf.scala 43:124]
  wire [1:0] nIC = _T_379 - _GEN_31; // @[IBuf.scala 43:124]
  wire  _T_565 = io_inst_0_ready & io_inst_0_valid; // @[Decoupled.scala 30:37]
  wire [1:0] _T_572 = RVCExpander_io_rvc ? 2'h1 : 2'h2; // @[IBuf.scala 107:47]
  wire [1:0] nReady = _T_565 ? _T_572 : 2'h0; // @[IBuf.scala 107:32 IBuf.scala 107:41]
  wire [1:0] _GEN_32 = {{1'd0}, nBufValid}; // @[IBuf.scala 44:25]
  wire [1:0] nICReady = nReady - _GEN_32; // @[IBuf.scala 44:25]
  wire [1:0] _T_385 = io_imem_valid ? nIC : 2'h0; // @[IBuf.scala 45:19]
  wire [1:0] nValid = _T_385 + _GEN_32; // @[IBuf.scala 45:49]
  wire  _T_387 = nReady >= _GEN_32; // @[IBuf.scala 46:27]
  wire [1:0] _T_392 = nIC - nICReady; // @[IBuf.scala 46:72]
  wire  _T_393 = 2'h1 >= _T_392; // @[IBuf.scala 46:65]
  wire [1:0] _T_400 = _GEN_32 - nReady; // @[IBuf.scala 49:62]
  wire [1:0] _T_401 = _T_387 ? 2'h0 : _T_400; // @[IBuf.scala 49:21]
  wire [1:0] _T_413 = _GEN_31 + nICReady; // @[IBuf.scala 57:30]
  wire [63:0] _T_419 = {io_imem_bits_data[31:16],io_imem_bits_data[31:16],io_imem_bits_data}; // @[Cat.scala 30:58]
  wire [5:0] _T_420 = {_T_413, 4'h0}; // @[IBuf.scala 134:19]
  wire [63:0] _T_421 = _T_419 >> _T_420; // @[IBuf.scala 134:10]
  wire [39:0] _T_424 = io_imem_bits_pc & 40'hfffffffffc; // @[IBuf.scala 61:33]
  wire [2:0] _T_425 = {nICReady, 1'h0}; // @[IBuf.scala 61:78]
  wire [39:0] _GEN_39 = {{37'd0}, _T_425}; // @[IBuf.scala 61:66]
  wire [39:0] _T_427 = io_imem_bits_pc + _GEN_39; // @[IBuf.scala 61:66]
  wire [39:0] _T_428 = _T_427 & 40'h3; // @[IBuf.scala 61:107]
  wire [39:0] _T_429 = _T_424 | _T_428; // @[IBuf.scala 61:47]
  wire [1:0] _GEN_40 = {{1'd0}, io_imem_bits_btb_bits_bridx}; // @[IBuf.scala 65:58]
  wire [1:0] _T_431 = _GEN_40 + nICReady; // @[IBuf.scala 65:58]
  wire [1:0] _GEN_2 = io_imem_bits_btb_valid ? _T_431 : {{1'd0}, ibufBTBResp_bridx}; // @[IBuf.scala 63:37 IBuf.scala 65:27 IBuf.scala 38:24]
  wire [1:0] _GEN_7 = io_imem_valid & _T_387 & nICReady < nIC & _T_393 ? _T_392 : _T_401; // @[IBuf.scala 56:90 IBuf.scala 58:17 IBuf.scala 49:15]
  wire [1:0] _GEN_24 = io_imem_valid & _T_387 & nICReady < nIC & _T_393 ? _GEN_2 : {{1'd0}, ibufBTBResp_bridx}; // @[IBuf.scala 56:90 IBuf.scala 38:24]
  wire [1:0] _GEN_29 = io_kill ? 2'h0 : _GEN_7; // @[IBuf.scala 68:20 IBuf.scala 69:17]
  wire [1:0] _T_435 = 2'h2 + _GEN_32; // @[IBuf.scala 73:32]
  wire [1:0] icShiftAmt = _T_435 - _GEN_31; // @[IBuf.scala 73:44]
  wire [63:0] _T_441 = {io_imem_bits_data,io_imem_bits_data[15:0],io_imem_bits_data[15:0]}; // @[Cat.scala 30:58]
  wire [127:0] _T_445 = {_T_441[63:48],_T_441[63:48],_T_441[63:48],_T_441[63:48],io_imem_bits_data,io_imem_bits_data[15:
    0],io_imem_bits_data[15:0]}; // @[Cat.scala 30:58]
  wire [5:0] _T_446 = {icShiftAmt, 4'h0}; // @[IBuf.scala 127:19]
  wire [190:0] _GEN_43 = {{63'd0}, _T_445}; // @[IBuf.scala 127:10]
  wire [190:0] _T_447 = _GEN_43 << _T_446; // @[IBuf.scala 127:10]
  wire [31:0] icData = _T_447[95:64]; // @[Package.scala 44:13]
  wire [4:0] _T_450 = {nBufValid, 4'h0}; // @[IBuf.scala 76:65]
  wire [62:0] _T_451 = 63'hffffffff << _T_450; // @[IBuf.scala 76:51]
  wire [31:0] icMask = _T_451[31:0]; // @[IBuf.scala 76:92]
  wire [31:0] _T_452 = icData & icMask; // @[IBuf.scala 77:21]
  wire [31:0] _T_453 = ~icMask; // @[IBuf.scala 77:43]
  wire [31:0] _T_454 = buf_data & _T_453; // @[IBuf.scala 77:41]
  wire [3:0] _T_456 = 4'h1 << nValid; // @[OneHot.scala 47:11]
  wire [3:0] _T_460 = _T_456 - 4'h1; // @[IBuf.scala 79:33]
  wire [1:0] valid = _T_460[1:0]; // @[IBuf.scala 79:37]
  wire [1:0] _T_462 = 2'h1 << nBufValid; // @[OneHot.scala 47:11]
  wire [1:0] bufMask = _T_462 - 2'h1; // @[IBuf.scala 80:37]
  wire [1:0] _T_467 = buf_xcpt_if ? bufMask : 2'h0; // @[IBuf.scala 81:29]
  wire [1:0] _T_468 = ~bufMask; // @[IBuf.scala 81:89]
  wire [1:0] _T_470 = io_imem_bits_xcpt_if ? _T_468 : 2'h0; // @[IBuf.scala 81:66]
  wire [1:0] _T_471 = _T_467 | _T_470; // @[IBuf.scala 81:61]
  wire [1:0] xcpt_if = valid & _T_471; // @[IBuf.scala 81:23]
  wire [1:0] _T_473 = buf_replay ? bufMask : 2'h0; // @[IBuf.scala 82:31]
  wire [1:0] _T_476 = io_imem_bits_replay ? _T_468 : 2'h0; // @[IBuf.scala 82:67]
  wire [1:0] _T_477 = _T_473 | _T_476; // @[IBuf.scala 82:62]
  wire [1:0] ic_replay = valid & _T_477; // @[IBuf.scala 82:25]
  wire [1:0] _T_479 = 2'h1 << ibufBTBResp_bridx; // @[OneHot.scala 47:11]
  wire [1:0] ibufBTBHitMask = ibufBTBHit ? _T_479 : 2'h0; // @[IBuf.scala 83:27]
  wire [1:0] _T_488 = io_imem_bits_btb_bits_bridx + nBufValid; // @[IBuf.scala 85:87]
  wire [1:0] _T_491 = _T_488 - _GEN_31; // @[IBuf.scala 85:100]
  wire [3:0] _T_493 = 4'h1 << _T_491; // @[OneHot.scala 47:11]
  wire [3:0] icBTBHitMask = io_imem_bits_btb_valid ? _T_493 : 4'h0; // @[IBuf.scala 85:25]
  wire [1:0] _T_495 = ibufBTBHitMask & bufMask; // @[IBuf.scala 86:35]
  wire [3:0] _GEN_45 = {{2'd0}, _T_468}; // @[IBuf.scala 86:60]
  wire [3:0] _T_497 = icBTBHitMask & _GEN_45; // @[IBuf.scala 86:60]
  wire [3:0] _GEN_46 = {{2'd0}, _T_495}; // @[IBuf.scala 86:45]
  wire [3:0] btbHitMask = _GEN_46 | _T_497; // @[IBuf.scala 86:45]
  wire  _T_517 = ~RVCExpander_io_rvc; // @[IBuf.scala 99:37]
  wire [1:0] _T_523 = {{1'd0}, ic_replay[1]}; // @[IBuf.scala 99:79]
  wire  _T_527 = ic_replay[0] | ~RVCExpander_io_rvc & (btbHitMask[0] | _T_523[0]); // @[IBuf.scala 99:33]
  wire [1:0] _T_533 = {{1'd0}, valid[1]}; // @[IBuf.scala 100:59]
  wire [1:0] _T_539 = {{1'd0}, xcpt_if[1]}; // @[IBuf.scala 100:75]
  wire [3:0] _T_561 = {{1'd0}, btbHitMask[3:1]}; // @[IBuf.scala 104:77]
  RVCExpander RVCExpander ( // @[IBuf.scala 93:21]
    .io_in(RVCExpander_io_in),
    .io_out_bits(RVCExpander_io_out_bits),
    .io_out_rd(RVCExpander_io_out_rd),
    .io_out_rs1(RVCExpander_io_out_rs1),
    .io_out_rs2(RVCExpander_io_out_rs2),
    .io_out_rs3(RVCExpander_io_out_rs3),
    .io_rvc(RVCExpander_io_rvc)
  );
  assign io_imem_ready = nReady >= _GEN_32 & (nICReady >= nIC | 2'h1 >= _T_392); // @[IBuf.scala 46:40]
  assign io_pc = nBufValid > 1'h0 ? buf_pc : io_imem_bits_pc; // @[IBuf.scala 89:15]
  assign io_btb_resp_taken = _T_495 != 2'h0 ? ibufBTBResp_taken : io_imem_bits_btb_bits_taken; // @[IBuf.scala 88:21]
  assign io_btb_resp_mask = _T_495 != 2'h0 ? ibufBTBResp_mask : io_imem_bits_btb_bits_mask; // @[IBuf.scala 88:21]
  assign io_btb_resp_bridx = _T_495 != 2'h0 ? ibufBTBResp_bridx : io_imem_bits_btb_bits_bridx; // @[IBuf.scala 88:21]
  assign io_btb_resp_target = _T_495 != 2'h0 ? ibufBTBResp_target : io_imem_bits_btb_bits_target; // @[IBuf.scala 88:21]
  assign io_btb_resp_entry = _T_495 != 2'h0 ? ibufBTBResp_entry : io_imem_bits_btb_bits_entry; // @[IBuf.scala 88:21]
  assign io_btb_resp_bht_history = _T_495 != 2'h0 ? ibufBTBResp_bht_history : io_imem_bits_btb_bits_bht_history; // @[IBuf.scala 88:21]
  assign io_btb_resp_bht_value = _T_495 != 2'h0 ? ibufBTBResp_bht_value : io_imem_bits_btb_bits_bht_value; // @[IBuf.scala 88:21]
  assign io_inst_0_valid = valid[0] & (RVCExpander_io_rvc | _T_533[0] | _T_539[0] | _T_527); // @[IBuf.scala 100:36]
  assign io_inst_0_bits_pf0 = xcpt_if[0]; // @[IBuf.scala 101:37]
  assign io_inst_0_bits_pf1 = _T_517 & _T_539[0]; // @[IBuf.scala 102:42]
  assign io_inst_0_bits_replay = ic_replay[0] | ~RVCExpander_io_rvc & (btbHitMask[0] | _T_523[0]); // @[IBuf.scala 99:33]
  assign io_inst_0_bits_btb_hit = btbHitMask[0] | _T_517 & _T_561[0]; // @[IBuf.scala 104:48]
  assign io_inst_0_bits_rvc = RVCExpander_io_rvc; // @[IBuf.scala 105:27]
  assign io_inst_0_bits_inst_bits = RVCExpander_io_out_bits; // @[IBuf.scala 95:26]
  assign io_inst_0_bits_inst_rd = RVCExpander_io_out_rd; // @[IBuf.scala 95:26]
  assign io_inst_0_bits_inst_rs1 = RVCExpander_io_out_rs1; // @[IBuf.scala 95:26]
  assign io_inst_0_bits_inst_rs2 = RVCExpander_io_out_rs2; // @[IBuf.scala 95:26]
  assign io_inst_0_bits_inst_rs3 = RVCExpander_io_out_rs3; // @[IBuf.scala 95:26]
  assign io_inst_0_bits_raw = _T_452 | _T_454; // @[IBuf.scala 77:30]
  assign RVCExpander_io_in = _T_452 | _T_454; // @[IBuf.scala 77:30]
  always @(posedge clock) begin
    if (reset) begin // @[IBuf.scala 35:47]
      nBufValid <= 1'h0; // @[IBuf.scala 35:47]
    end else begin
      nBufValid <= _GEN_29[0];
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      buf_pc <= _T_429; // @[IBuf.scala 61:14]
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      buf_data <= {{16'd0}, _T_421[15:0]}; // @[IBuf.scala 60:16]
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      buf_xcpt_if <= io_imem_bits_xcpt_if; // @[IBuf.scala 59:11]
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      buf_replay <= io_imem_bits_replay; // @[IBuf.scala 59:11]
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      ibufBTBHit <= io_imem_bits_btb_valid; // @[IBuf.scala 62:18]
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      if (io_imem_bits_btb_valid) begin // @[IBuf.scala 63:37]
        ibufBTBResp_taken <= io_imem_bits_btb_bits_taken; // @[IBuf.scala 64:21]
      end
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      if (io_imem_bits_btb_valid) begin // @[IBuf.scala 63:37]
        ibufBTBResp_mask <= io_imem_bits_btb_bits_mask; // @[IBuf.scala 64:21]
      end
    end
    ibufBTBResp_bridx <= _GEN_24[0];
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      if (io_imem_bits_btb_valid) begin // @[IBuf.scala 63:37]
        ibufBTBResp_target <= io_imem_bits_btb_bits_target; // @[IBuf.scala 64:21]
      end
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      if (io_imem_bits_btb_valid) begin // @[IBuf.scala 63:37]
        ibufBTBResp_entry <= io_imem_bits_btb_bits_entry; // @[IBuf.scala 64:21]
      end
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      if (io_imem_bits_btb_valid) begin // @[IBuf.scala 63:37]
        ibufBTBResp_bht_history <= io_imem_bits_btb_bits_bht_history; // @[IBuf.scala 64:21]
      end
    end
    if (io_imem_valid & _T_387 & nICReady < nIC & _T_393) begin // @[IBuf.scala 56:90]
      if (io_imem_bits_btb_valid) begin // @[IBuf.scala 63:37]
        ibufBTBResp_bht_value <= io_imem_bits_btb_bits_bht_value; // @[IBuf.scala 64:21]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~io_imem_bits_btb_valid | io_imem_bits_btb_bits_bridx >= pcWordBits | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at IBuf.scala:84 assert(!io.imem.bits.btb.valid || io.imem.bits.btb.bits.bridx >= pcWordBits)\n"
            ); // @[IBuf.scala 84:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_imem_bits_btb_valid | io_imem_bits_btb_bits_bridx >= pcWordBits | reset)) begin
          $fatal; // @[IBuf.scala 84:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  nBufValid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  buf_pc = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  buf_data = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  buf_xcpt_if = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  buf_replay = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ibufBTBHit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ibufBTBResp_taken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ibufBTBResp_mask = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  ibufBTBResp_bridx = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  ibufBTBResp_target = _RAND_9[38:0];
  _RAND_10 = {1{`RANDOM}};
  ibufBTBResp_entry = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  ibufBTBResp_bht_history = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  ibufBTBResp_bht_value = _RAND_12[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CSRFile(
  input         clock,
  input         reset,
  input         io_interrupts_debug,
  input         io_interrupts_mtip,
  input         io_interrupts_msip,
  input         io_interrupts_meip,
  input         io_interrupts_seip,
  input  [63:0] io_hartid,
  input  [11:0] io_rw_addr,
  input  [2:0]  io_rw_cmd,
  output [63:0] io_rw_rdata,
  input  [63:0] io_rw_wdata,
  input  [11:0] io_decode_csr,
  output        io_decode_fp_illegal,
  output        io_decode_read_illegal,
  output        io_decode_write_illegal,
  output        io_decode_write_flush,
  output        io_decode_system_illegal,
  output        io_csr_stall,
  output        io_eret,
  output        io_singleStep,
  output        io_status_debug,
  output [31:0] io_status_isa,
  output [1:0]  io_status_prv,
  output        io_status_sd,
  output [26:0] io_status_zero2,
  output [1:0]  io_status_sxl,
  output [1:0]  io_status_uxl,
  output        io_status_sd_rv32,
  output [7:0]  io_status_zero1,
  output        io_status_tsr,
  output        io_status_tw,
  output        io_status_tvm,
  output        io_status_mxr,
  output        io_status_pum,
  output        io_status_mprv,
  output [1:0]  io_status_xs,
  output [1:0]  io_status_fs,
  output [1:0]  io_status_mpp,
  output [1:0]  io_status_hpp,
  output        io_status_spp,
  output        io_status_mpie,
  output        io_status_hpie,
  output        io_status_spie,
  output        io_status_upie,
  output        io_status_mie,
  output        io_status_hie,
  output        io_status_sie,
  output        io_status_uie,
  output [3:0]  io_ptbr_mode,
  output [43:0] io_ptbr_ppn,
  output [39:0] io_evec,
  input         io_exception,
  input         io_retire,
  input  [63:0] io_cause,
  input  [39:0] io_pc,
  input  [39:0] io_badaddr,
  output        io_fatc,
  output [63:0] io_time,
  output [2:0]  io_fcsr_rm,
  input         io_fcsr_flags_valid,
  input  [4:0]  io_fcsr_flags_bits,
  input         io_rocc_interrupt,
  output        io_interrupt,
  output [63:0] io_interrupt_cause,
  output        io_bp_0_control_action,
  output [1:0]  io_bp_0_control_tmatch,
  output        io_bp_0_control_m,
  output        io_bp_0_control_s,
  output        io_bp_0_control_u,
  output        io_bp_0_control_x,
  output        io_bp_0_control_w,
  output        io_bp_0_control_r,
  output [38:0] io_bp_0_address
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_mstatus_prv; // @[CSR.scala 197:24]
  reg  reg_mstatus_tsr; // @[CSR.scala 197:24]
  reg  reg_mstatus_tw; // @[CSR.scala 197:24]
  reg  reg_mstatus_tvm; // @[CSR.scala 197:24]
  reg  reg_mstatus_mxr; // @[CSR.scala 197:24]
  reg  reg_mstatus_pum; // @[CSR.scala 197:24]
  reg  reg_mstatus_mprv; // @[CSR.scala 197:24]
  reg [1:0] reg_mstatus_fs; // @[CSR.scala 197:24]
  reg [1:0] reg_mstatus_mpp; // @[CSR.scala 197:24]
  reg  reg_mstatus_spp; // @[CSR.scala 197:24]
  reg  reg_mstatus_mpie; // @[CSR.scala 197:24]
  reg  reg_mstatus_spie; // @[CSR.scala 197:24]
  reg  reg_mstatus_mie; // @[CSR.scala 197:24]
  reg  reg_mstatus_sie; // @[CSR.scala 197:24]
  wire  system_insn = io_rw_cmd == 3'h4; // @[CSR.scala 409:31]
  wire [7:0] opcode = 8'h1 << io_rw_addr[2:0]; // @[CSR.scala 410:24]
  wire  insn_ret = system_insn & opcode[2]; // @[CSR.scala 414:30]
  wire  _T_2465 = ~(~io_rw_addr[9]); // @[CSR.scala 506:44]
  wire  _T_2468 = _T_2465 & ~io_rw_addr[10]; // @[CSR.scala 512:53]
  reg [1:0] reg_dcsr_prv; // @[CSR.scala 205:21]
  wire  insn_rs2 = io_rw_addr[5]; // @[CSR.scala 411:28]
  wire  insn_call = system_insn & ~insn_rs2 & opcode[0]; // @[CSR.scala 412:44]
  wire  insn_break = system_insn & opcode[1]; // @[CSR.scala 413:32]
  wire  _T_2344 = insn_call | insn_break; // @[CSR.scala 461:29]
  wire  exception = insn_call | insn_break | io_exception; // @[CSR.scala 461:43]
  reg  reg_singleStepped; // @[CSR.scala 236:30]
  wire [3:0] _GEN_218 = {{2'd0}, reg_mstatus_prv}; // @[CSR.scala 437:36]
  wire [3:0] _T_2248 = _GEN_218 + 4'h8; // @[CSR.scala 437:36]
  wire [63:0] _T_2250 = insn_break ? 64'h3 : io_cause; // @[CSR.scala 438:14]
  wire [63:0] cause = insn_call ? {{60'd0}, _T_2248} : _T_2250; // @[CSR.scala 437:8]
  wire [5:0] cause_lsbs = cause[5:0]; // @[CSR.scala 439:25]
  wire  _T_2267 = cause_lsbs == 6'hd; // @[CSR.scala 440:53]
  wire  causeIsDebugInt = cause[63] & cause_lsbs == 6'hd; // @[CSR.scala 440:39]
  wire  _T_2270 = ~cause[63]; // @[CSR.scala 441:29]
  wire  causeIsDebugTrigger = ~cause[63] & _T_2267; // @[CSR.scala 441:44]
  reg  reg_dcsr_ebreakm; // @[CSR.scala 205:21]
  reg  reg_dcsr_ebreaks; // @[CSR.scala 205:21]
  reg  reg_dcsr_ebreaku; // @[CSR.scala 205:21]
  wire [3:0] _T_2307 = {reg_dcsr_ebreakm,1'h0,reg_dcsr_ebreaks,reg_dcsr_ebreaku}; // @[Cat.scala 30:58]
  wire [3:0] _T_2308 = _T_2307 >> reg_mstatus_prv; // @[CSR.scala 442:134]
  wire  causeIsDebugBreak = _T_2270 & insn_break & _T_2308[0]; // @[CSR.scala 442:56]
  reg  reg_debug; // @[CSR.scala 232:22]
  wire  trapToDebug = reg_singleStepped | causeIsDebugInt | causeIsDebugTrigger | causeIsDebugBreak | reg_debug; // @[CSR.scala 443:123]
  wire  _T_2435 = ~trapToDebug; // @[CSR.scala 481:24]
  wire  _T_2317 = reg_mstatus_prv <= 2'h1; // @[CSR.scala 444:51]
  reg [63:0] reg_mideleg; // @[CSR.scala 242:24]
  wire [63:0] _T_2320 = reg_mideleg >> cause_lsbs; // @[CSR.scala 444:93]
  reg [63:0] reg_medeleg; // @[CSR.scala 243:24]
  wire [63:0] _T_2322 = reg_medeleg >> cause_lsbs; // @[CSR.scala 444:118]
  wire  _T_2324 = cause[63] ? _T_2320[0] : _T_2322[0]; // @[CSR.scala 444:66]
  wire  delegate = reg_mstatus_prv <= 2'h1 & _T_2324; // @[CSR.scala 444:60]
  wire  _T_2438 = _T_2435 & ~delegate; // @[CSR.scala 486:27]
  wire [1:0] _GEN_19 = _T_2435 & delegate ? 2'h1 : reg_mstatus_prv; // @[CSR.scala 486:27 CSR.scala 493:15]
  wire [1:0] _GEN_27 = _T_2438 ? 2'h3 : _GEN_19; // @[CSR.scala 494:17 CSR.scala 501:15]
  wire [1:0] _GEN_38 = exception ? _GEN_27 : reg_mstatus_prv; // @[CSR.scala 473:20]
  wire [1:0] _GEN_49 = ~io_rw_addr[9] ? {{1'd0}, reg_mstatus_spp} : _GEN_38; // @[CSR.scala 506:44 CSR.scala 510:15]
  wire [1:0] _GEN_51 = _T_2465 & io_rw_addr[10] ? reg_dcsr_prv : _GEN_49; // @[CSR.scala 512:53 CSR.scala 513:15]
  wire [1:0] _GEN_60 = _T_2468 ? reg_mstatus_mpp : _GEN_51; // @[CSR.scala 516:17 CSR.scala 521:15]
  wire [1:0] new_prv = insn_ret ? _GEN_60 : _GEN_38; // @[CSR.scala 505:19]
  reg [2:0] reg_dcsr_cause; // @[CSR.scala 205:21]
  reg  reg_dcsr_debugint; // @[CSR.scala 205:21]
  reg  reg_dcsr_halt; // @[CSR.scala 205:21]
  reg  reg_dcsr_step; // @[CSR.scala 205:21]
  wire [2:0] effective_prv = {reg_debug,reg_mstatus_prv}; // @[Cat.scala 30:58]
  reg [39:0] reg_dpc; // @[CSR.scala 234:20]
  reg [63:0] reg_dscratch; // @[CSR.scala 235:25]
  reg  reg_bp_0_control_dmode; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_action; // @[CSR.scala 239:19]
  reg [1:0] reg_bp_0_control_tmatch; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_m; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_s; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_u; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_x; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_w; // @[CSR.scala 239:19]
  reg  reg_bp_0_control_r; // @[CSR.scala 239:19]
  reg [38:0] reg_bp_0_address; // @[CSR.scala 239:19]
  reg [63:0] reg_mie; // @[CSR.scala 241:20]
  reg  reg_mip_meip; // @[CSR.scala 244:20]
  reg  reg_mip_seip; // @[CSR.scala 244:20]
  reg  reg_mip_mtip; // @[CSR.scala 244:20]
  reg  reg_mip_stip; // @[CSR.scala 244:20]
  reg  reg_mip_msip; // @[CSR.scala 244:20]
  reg  reg_mip_ssip; // @[CSR.scala 244:20]
  reg [39:0] reg_mepc; // @[CSR.scala 245:21]
  reg [63:0] reg_mcause; // @[CSR.scala 246:23]
  reg [39:0] reg_mbadaddr; // @[CSR.scala 247:25]
  reg [63:0] reg_mscratch; // @[CSR.scala 248:25]
  reg [31:0] reg_mtvec; // @[CSR.scala 251:27]
  reg [31:0] reg_mcounteren; // @[CSR.scala 254:27]
  reg [31:0] reg_scounteren; // @[CSR.scala 255:27]
  reg [39:0] reg_sepc; // @[CSR.scala 258:21]
  reg [63:0] reg_scause; // @[CSR.scala 259:23]
  reg [39:0] reg_sbadaddr; // @[CSR.scala 260:25]
  reg [63:0] reg_sscratch; // @[CSR.scala 261:25]
  reg [38:0] reg_stvec; // @[CSR.scala 262:22]
  reg [3:0] reg_sptbr_mode; // @[CSR.scala 263:22]
  reg [43:0] reg_sptbr_ppn; // @[CSR.scala 263:22]
  reg  reg_wfi; // @[CSR.scala 264:20]
  reg [4:0] reg_fflags; // @[CSR.scala 266:23]
  reg [2:0] reg_frm; // @[CSR.scala 267:20]
  reg [5:0] _T_931; // @[Counters.scala 47:37]
  wire [5:0] _GEN_219 = {{5'd0}, io_retire}; // @[Counters.scala 48:33]
  wire [6:0] _T_932 = _T_931 + _GEN_219; // @[Counters.scala 48:33]
  reg [57:0] _T_934; // @[Counters.scala 52:27]
  wire [57:0] _T_938 = _T_934 + 58'h1; // @[Counters.scala 53:43]
  wire [57:0] _GEN_0 = _T_932[6] ? _T_938 : _T_934; // @[Counters.scala 53:34 Counters.scala 53:38 Counters.scala 52:27]
  wire [63:0] _T_939 = {_T_934,_T_931}; // @[Cat.scala 30:58]
  reg [5:0] _T_942; // @[Counters.scala 47:37]
  wire [6:0] _T_943 = _T_942 + 6'h1; // @[Counters.scala 48:33]
  reg [57:0] _T_945; // @[Counters.scala 52:27]
  wire [57:0] _T_949 = _T_945 + 58'h1; // @[Counters.scala 53:43]
  wire [57:0] _GEN_1 = _T_943[6] ? _T_949 : _T_945; // @[Counters.scala 53:34 Counters.scala 53:38 Counters.scala 52:27]
  wire [63:0] _T_950 = {_T_945,_T_942}; // @[Cat.scala 30:58]
  wire  _T_953 = reg_mstatus_prv == 2'h1; // @[CSR.scala 274:71]
  wire [31:0] _T_956 = reg_mstatus_prv == 2'h1 ? 32'h7 : reg_scounteren; // @[CSR.scala 274:38]
  wire [31:0] hpm_mask = reg_mcounteren & _T_956; // @[CSR.scala 274:33]
  wire [5:0] _T_974 = {reg_mip_stip,1'h0,reg_mip_msip,1'h0,reg_mip_ssip,1'h0}; // @[CSR.scala 278:22]
  wire [12:0] _T_981 = {io_rocc_interrupt,reg_mip_meip,1'h0,reg_mip_seip,1'h0,reg_mip_mtip,1'h0,_T_974}; // @[CSR.scala 278:22]
  wire [12:0] read_mip = _T_981 & 13'haaa; // @[CSR.scala 278:29]
  wire [63:0] _GEN_220 = {{51'd0}, read_mip}; // @[CSR.scala 280:37]
  wire [63:0] pending_interrupts = _GEN_220 & reg_mie; // @[CSR.scala 280:37]
  wire [63:0] _T_988 = ~reg_mideleg; // @[CSR.scala 281:123]
  wire [63:0] _T_989 = pending_interrupts & _T_988; // @[CSR.scala 281:121]
  wire [63:0] m_interrupts = _T_2317 | reg_mstatus_prv == 2'h3 & reg_mstatus_mie ? _T_989 : 64'h0; // @[CSR.scala 281:25]
  wire [63:0] _T_1000 = pending_interrupts & reg_mideleg; // @[CSR.scala 282:144]
  wire [63:0] s_interrupts = m_interrupts == 64'h0 & (reg_mstatus_prv < 2'h1 | _T_953 & reg_mstatus_sie) ? _T_1000 : 64'h0
    ; // @[CSR.scala 282:25]
  wire [63:0] all_interrupts = m_interrupts | s_interrupts; // @[CSR.scala 283:37]
  wire [5:0] _T_1131 = all_interrupts[62] ? 6'h3e : 6'h3f; // @[Mux.scala 31:69]
  wire [5:0] _T_1132 = all_interrupts[61] ? 6'h3d : _T_1131; // @[Mux.scala 31:69]
  wire [5:0] _T_1133 = all_interrupts[60] ? 6'h3c : _T_1132; // @[Mux.scala 31:69]
  wire [5:0] _T_1134 = all_interrupts[59] ? 6'h3b : _T_1133; // @[Mux.scala 31:69]
  wire [5:0] _T_1135 = all_interrupts[58] ? 6'h3a : _T_1134; // @[Mux.scala 31:69]
  wire [5:0] _T_1136 = all_interrupts[57] ? 6'h39 : _T_1135; // @[Mux.scala 31:69]
  wire [5:0] _T_1137 = all_interrupts[56] ? 6'h38 : _T_1136; // @[Mux.scala 31:69]
  wire [5:0] _T_1138 = all_interrupts[55] ? 6'h37 : _T_1137; // @[Mux.scala 31:69]
  wire [5:0] _T_1139 = all_interrupts[54] ? 6'h36 : _T_1138; // @[Mux.scala 31:69]
  wire [5:0] _T_1140 = all_interrupts[53] ? 6'h35 : _T_1139; // @[Mux.scala 31:69]
  wire [5:0] _T_1141 = all_interrupts[52] ? 6'h34 : _T_1140; // @[Mux.scala 31:69]
  wire [5:0] _T_1142 = all_interrupts[51] ? 6'h33 : _T_1141; // @[Mux.scala 31:69]
  wire [5:0] _T_1143 = all_interrupts[50] ? 6'h32 : _T_1142; // @[Mux.scala 31:69]
  wire [5:0] _T_1144 = all_interrupts[49] ? 6'h31 : _T_1143; // @[Mux.scala 31:69]
  wire [5:0] _T_1145 = all_interrupts[48] ? 6'h30 : _T_1144; // @[Mux.scala 31:69]
  wire [5:0] _T_1146 = all_interrupts[47] ? 6'h2f : _T_1145; // @[Mux.scala 31:69]
  wire [5:0] _T_1147 = all_interrupts[46] ? 6'h2e : _T_1146; // @[Mux.scala 31:69]
  wire [5:0] _T_1148 = all_interrupts[45] ? 6'h2d : _T_1147; // @[Mux.scala 31:69]
  wire [5:0] _T_1149 = all_interrupts[44] ? 6'h2c : _T_1148; // @[Mux.scala 31:69]
  wire [5:0] _T_1150 = all_interrupts[43] ? 6'h2b : _T_1149; // @[Mux.scala 31:69]
  wire [5:0] _T_1151 = all_interrupts[42] ? 6'h2a : _T_1150; // @[Mux.scala 31:69]
  wire [5:0] _T_1152 = all_interrupts[41] ? 6'h29 : _T_1151; // @[Mux.scala 31:69]
  wire [5:0] _T_1153 = all_interrupts[40] ? 6'h28 : _T_1152; // @[Mux.scala 31:69]
  wire [5:0] _T_1154 = all_interrupts[39] ? 6'h27 : _T_1153; // @[Mux.scala 31:69]
  wire [5:0] _T_1155 = all_interrupts[38] ? 6'h26 : _T_1154; // @[Mux.scala 31:69]
  wire [5:0] _T_1156 = all_interrupts[37] ? 6'h25 : _T_1155; // @[Mux.scala 31:69]
  wire [5:0] _T_1157 = all_interrupts[36] ? 6'h24 : _T_1156; // @[Mux.scala 31:69]
  wire [5:0] _T_1158 = all_interrupts[35] ? 6'h23 : _T_1157; // @[Mux.scala 31:69]
  wire [5:0] _T_1159 = all_interrupts[34] ? 6'h22 : _T_1158; // @[Mux.scala 31:69]
  wire [5:0] _T_1160 = all_interrupts[33] ? 6'h21 : _T_1159; // @[Mux.scala 31:69]
  wire [5:0] _T_1161 = all_interrupts[32] ? 6'h20 : _T_1160; // @[Mux.scala 31:69]
  wire [5:0] _T_1162 = all_interrupts[31] ? 6'h1f : _T_1161; // @[Mux.scala 31:69]
  wire [5:0] _T_1163 = all_interrupts[30] ? 6'h1e : _T_1162; // @[Mux.scala 31:69]
  wire [5:0] _T_1164 = all_interrupts[29] ? 6'h1d : _T_1163; // @[Mux.scala 31:69]
  wire [5:0] _T_1165 = all_interrupts[28] ? 6'h1c : _T_1164; // @[Mux.scala 31:69]
  wire [5:0] _T_1166 = all_interrupts[27] ? 6'h1b : _T_1165; // @[Mux.scala 31:69]
  wire [5:0] _T_1167 = all_interrupts[26] ? 6'h1a : _T_1166; // @[Mux.scala 31:69]
  wire [5:0] _T_1168 = all_interrupts[25] ? 6'h19 : _T_1167; // @[Mux.scala 31:69]
  wire [5:0] _T_1169 = all_interrupts[24] ? 6'h18 : _T_1168; // @[Mux.scala 31:69]
  wire [5:0] _T_1170 = all_interrupts[23] ? 6'h17 : _T_1169; // @[Mux.scala 31:69]
  wire [5:0] _T_1171 = all_interrupts[22] ? 6'h16 : _T_1170; // @[Mux.scala 31:69]
  wire [5:0] _T_1172 = all_interrupts[21] ? 6'h15 : _T_1171; // @[Mux.scala 31:69]
  wire [5:0] _T_1173 = all_interrupts[20] ? 6'h14 : _T_1172; // @[Mux.scala 31:69]
  wire [5:0] _T_1174 = all_interrupts[19] ? 6'h13 : _T_1173; // @[Mux.scala 31:69]
  wire [5:0] _T_1175 = all_interrupts[18] ? 6'h12 : _T_1174; // @[Mux.scala 31:69]
  wire [5:0] _T_1176 = all_interrupts[17] ? 6'h11 : _T_1175; // @[Mux.scala 31:69]
  wire [5:0] _T_1177 = all_interrupts[16] ? 6'h10 : _T_1176; // @[Mux.scala 31:69]
  wire [5:0] _T_1178 = all_interrupts[15] ? 6'hf : _T_1177; // @[Mux.scala 31:69]
  wire [5:0] _T_1179 = all_interrupts[14] ? 6'he : _T_1178; // @[Mux.scala 31:69]
  wire [5:0] _T_1180 = all_interrupts[13] ? 6'hd : _T_1179; // @[Mux.scala 31:69]
  wire [5:0] _T_1181 = all_interrupts[12] ? 6'hc : _T_1180; // @[Mux.scala 31:69]
  wire [5:0] _T_1182 = all_interrupts[11] ? 6'hb : _T_1181; // @[Mux.scala 31:69]
  wire [5:0] _T_1183 = all_interrupts[10] ? 6'ha : _T_1182; // @[Mux.scala 31:69]
  wire [5:0] _T_1184 = all_interrupts[9] ? 6'h9 : _T_1183; // @[Mux.scala 31:69]
  wire [5:0] _T_1185 = all_interrupts[8] ? 6'h8 : _T_1184; // @[Mux.scala 31:69]
  wire [5:0] _T_1186 = all_interrupts[7] ? 6'h7 : _T_1185; // @[Mux.scala 31:69]
  wire [5:0] _T_1187 = all_interrupts[6] ? 6'h6 : _T_1186; // @[Mux.scala 31:69]
  wire [5:0] _T_1188 = all_interrupts[5] ? 6'h5 : _T_1187; // @[Mux.scala 31:69]
  wire [5:0] _T_1189 = all_interrupts[4] ? 6'h4 : _T_1188; // @[Mux.scala 31:69]
  wire [5:0] _T_1190 = all_interrupts[3] ? 6'h3 : _T_1189; // @[Mux.scala 31:69]
  wire [5:0] _T_1191 = all_interrupts[2] ? 6'h2 : _T_1190; // @[Mux.scala 31:69]
  wire [5:0] _T_1192 = all_interrupts[1] ? 6'h1 : _T_1191; // @[Mux.scala 31:69]
  wire [5:0] _T_1193 = all_interrupts[0] ? 6'h0 : _T_1192; // @[Mux.scala 31:69]
  wire [63:0] _GEN_221 = {{58'd0}, _T_1193}; // @[CSR.scala 285:43]
  wire [63:0] interruptCause = 64'h8000000000000000 + _GEN_221; // @[CSR.scala 285:43]
  wire  _T_1198 = ~reg_debug; // @[CSR.scala 286:41]
  wire  _T_1201 = ~io_singleStep; // @[CSR.scala 286:55]
  reg [63:0] reg_misa; // @[CSR.scala 307:21]
  wire [6:0] _T_1234 = {io_status_hpie,io_status_spie,io_status_upie,io_status_mie,io_status_hie,io_status_sie,
    io_status_uie}; // @[CSR.scala 308:38]
  wire [17:0] _T_1241 = {io_status_mprv,io_status_xs,io_status_fs,io_status_mpp,io_status_hpp,io_status_spp,
    io_status_mpie,_T_1234}; // @[CSR.scala 308:38]
  wire [13:0] _T_1247 = {io_status_sd_rv32,io_status_zero1,io_status_tsr,io_status_tw,io_status_tvm,io_status_mxr,
    io_status_pum}; // @[CSR.scala 308:38]
  wire [98:0] _T_1255 = {io_status_debug,io_status_isa,io_status_prv,io_status_sd,io_status_zero2,io_status_sxl,
    io_status_uxl,_T_1247,_T_1241}; // @[CSR.scala 308:38]
  wire [63:0] read_mstatus = _T_1255[63:0]; // @[CSR.scala 308:40]
  wire [6:0] _T_1296 = {reg_bp_0_control_m,1'h0,reg_bp_0_control_s,reg_bp_0_control_u,reg_bp_0_control_x,
    reg_bp_0_control_w,reg_bp_0_control_r}; // @[CSR.scala 312:48]
  wire [63:0] _T_1304 = {4'h2,reg_bp_0_control_dmode,46'h40000000000,reg_bp_0_control_action,1'h0,2'h0,
    reg_bp_0_control_tmatch,_T_1296}; // @[CSR.scala 312:48]
  wire [24:0] _T_1344 = reg_bp_0_address[38] ? 25'h1ffffff : 25'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_1345 = {_T_1344,reg_bp_0_address}; // @[Cat.scala 30:58]
  wire [23:0] _T_1353 = reg_mepc[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_1354 = {_T_1353,reg_mepc}; // @[Cat.scala 30:58]
  wire [23:0] _T_1359 = reg_mbadaddr[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_1360 = {_T_1359,reg_mbadaddr}; // @[Cat.scala 30:58]
  wire [10:0] _T_1367 = {2'h0,reg_dcsr_cause,reg_dcsr_debugint,1'h0,reg_dcsr_halt,reg_dcsr_step,reg_dcsr_prv}; // @[CSR.scala 333:27]
  wire [31:0] _T_1376 = {4'h4,12'h0,reg_dcsr_ebreakm,1'h0,reg_dcsr_ebreaks,reg_dcsr_ebreaku,1'h0,_T_1367}; // @[CSR.scala 333:27]
  wire [7:0] _T_1377 = {reg_frm,reg_fflags}; // @[Cat.scala 30:58]
  wire [63:0] _T_1380 = reg_mie & reg_mideleg; // @[CSR.scala 360:28]
  wire [63:0] _T_1381 = _GEN_220 & reg_mideleg; // @[CSR.scala 361:29]
  wire [6:0] _T_1423 = {1'h0,io_status_spie,io_status_upie,1'h0,1'h0,io_status_sie,io_status_uie}; // @[CSR.scala 371:57]
  wire [17:0] _T_1430 = {1'h0,io_status_xs,io_status_fs,2'h0,2'h0,io_status_spp,1'h0,_T_1423}; // @[CSR.scala 371:57]
  wire [98:0] _T_1444 = {io_status_debug,io_status_isa,io_status_prv,io_status_sd,io_status_zero2,io_status_sxl,
    io_status_uxl,_T_1247,_T_1430}; // @[CSR.scala 371:57]
  wire [23:0] _T_1450 = reg_sbadaddr[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_1451 = {_T_1450,reg_sbadaddr}; // @[Cat.scala 30:58]
  wire [63:0] _T_1453 = {reg_sptbr_mode,16'h0,reg_sptbr_ppn}; // @[CSR.scala 377:45]
  wire [23:0] _T_1458 = reg_sepc[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_1459 = {_T_1458,reg_sepc}; // @[Cat.scala 30:58]
  wire [24:0] _T_1464 = reg_stvec[38] ? 25'h1ffffff : 25'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_1465 = {_T_1464,reg_stvec}; // @[Cat.scala 30:58]
  wire  _T_1469 = io_rw_addr == 12'h7a1; // @[CSR.scala 405:73]
  wire  _T_1471 = io_rw_addr == 12'h7a2; // @[CSR.scala 405:73]
  wire  _T_1479 = io_rw_addr == 12'hb00; // @[CSR.scala 405:73]
  wire  _T_1481 = io_rw_addr == 12'hb02; // @[CSR.scala 405:73]
  wire  _T_1483 = io_rw_addr == 12'h301; // @[CSR.scala 405:73]
  wire  _T_1485 = io_rw_addr == 12'h300; // @[CSR.scala 405:73]
  wire  _T_1487 = io_rw_addr == 12'h305; // @[CSR.scala 405:73]
  wire  _T_1489 = io_rw_addr == 12'h344; // @[CSR.scala 405:73]
  wire  _T_1491 = io_rw_addr == 12'h304; // @[CSR.scala 405:73]
  wire  _T_1493 = io_rw_addr == 12'h303; // @[CSR.scala 405:73]
  wire  _T_1495 = io_rw_addr == 12'h302; // @[CSR.scala 405:73]
  wire  _T_1497 = io_rw_addr == 12'h340; // @[CSR.scala 405:73]
  wire  _T_1499 = io_rw_addr == 12'h341; // @[CSR.scala 405:73]
  wire  _T_1501 = io_rw_addr == 12'h343; // @[CSR.scala 405:73]
  wire  _T_1503 = io_rw_addr == 12'h342; // @[CSR.scala 405:73]
  wire  _T_1505 = io_rw_addr == 12'hf14; // @[CSR.scala 405:73]
  wire  _T_1507 = io_rw_addr == 12'h7b0; // @[CSR.scala 405:73]
  wire  _T_1509 = io_rw_addr == 12'h7b1; // @[CSR.scala 405:73]
  wire  _T_1511 = io_rw_addr == 12'h7b2; // @[CSR.scala 405:73]
  wire  _T_1513 = io_rw_addr == 12'h1; // @[CSR.scala 405:73]
  wire  _T_1515 = io_rw_addr == 12'h2; // @[CSR.scala 405:73]
  wire  _T_1517 = io_rw_addr == 12'h3; // @[CSR.scala 405:73]
  wire  _T_1693 = io_rw_addr == 12'h100; // @[CSR.scala 405:73]
  wire  _T_1695 = io_rw_addr == 12'h144; // @[CSR.scala 405:73]
  wire  _T_1697 = io_rw_addr == 12'h104; // @[CSR.scala 405:73]
  wire  _T_1699 = io_rw_addr == 12'h140; // @[CSR.scala 405:73]
  wire  _T_1701 = io_rw_addr == 12'h142; // @[CSR.scala 405:73]
  wire  _T_1703 = io_rw_addr == 12'h143; // @[CSR.scala 405:73]
  wire  _T_1705 = io_rw_addr == 12'h180; // @[CSR.scala 405:73]
  wire  _T_1707 = io_rw_addr == 12'h141; // @[CSR.scala 405:73]
  wire  _T_1709 = io_rw_addr == 12'h105; // @[CSR.scala 405:73]
  wire  _T_1711 = io_rw_addr == 12'h106; // @[CSR.scala 405:73]
  wire  _T_1713 = io_rw_addr == 12'h306; // @[CSR.scala 405:73]
  wire  _T_1715 = io_rw_addr == 12'hc00; // @[CSR.scala 405:73]
  wire  _T_1717 = io_rw_addr == 12'hc02; // @[CSR.scala 405:73]
  wire  _T_1721 = io_rw_cmd == 3'h3; // @[Package.scala 7:47]
  wire  _T_1722 = io_rw_cmd == 3'h2 | io_rw_cmd == 3'h3; // @[Package.scala 7:62]
  wire [63:0] _T_1724 = _T_1722 ? io_rw_rdata : 64'h0; // @[CSR.scala 406:19]
  wire [63:0] _T_1725 = _T_1724 | io_rw_wdata; // @[CSR.scala 406:75]
  wire [63:0] _T_1729 = _T_1721 ? io_rw_wdata : 64'h0; // @[CSR.scala 407:19]
  wire [63:0] _T_1730 = ~_T_1729; // @[CSR.scala 407:15]
  wire [63:0] wdata = _T_1725 & _T_1730; // @[CSR.scala 406:90]
  wire  insn_wfi = system_insn & opcode[5]; // @[CSR.scala 415:30]
  wire  _T_1743 = effective_prv > 3'h1; // @[CSR.scala 418:51]
  wire  allow_wfi = effective_prv > 3'h1 | ~reg_mstatus_tw; // @[CSR.scala 418:59]
  wire  allow_sfence_vma = _T_1743 | ~reg_mstatus_tvm; // @[CSR.scala 419:66]
  wire  allow_sret = _T_1743 | ~reg_mstatus_tsr; // @[CSR.scala 420:60]
  wire [2:0] _GEN_223 = {{1'd0}, io_decode_csr[9:8]}; // @[CSR.scala 423:43]
  wire  _T_1772 = effective_prv < _GEN_223; // @[CSR.scala 423:43]
  wire  _T_1814 = io_decode_csr == 12'h7b0; // @[CSR.scala 424:42]
  wire  _T_1816 = io_decode_csr == 12'h7b1; // @[CSR.scala 424:42]
  wire  _T_1818 = io_decode_csr == 12'h7b2; // @[CSR.scala 424:42]
  wire  _T_1820 = io_decode_csr == 12'h1; // @[CSR.scala 424:42]
  wire  _T_1822 = io_decode_csr == 12'h2; // @[CSR.scala 424:42]
  wire  _T_1824 = io_decode_csr == 12'h3; // @[CSR.scala 424:42]
  wire  _T_1872 = io_decode_csr == 12'hc0a; // @[CSR.scala 424:42]
  wire  _T_2012 = io_decode_csr == 12'h180; // @[CSR.scala 424:42]
  wire  _T_2039 = io_decode_csr == 12'h338 | io_decode_csr == 12'h1 | io_decode_csr == 12'hb09 | io_decode_csr == 12'h140
     | io_decode_csr == 12'hb1c | io_decode_csr == 12'h337 | io_decode_csr == 12'h324 | io_decode_csr == 12'h303 |
    io_decode_csr == 12'h306 | io_decode_csr == 12'hc11 | io_decode_csr == 12'hb0b | io_decode_csr == 12'hc12 |
    io_decode_csr == 12'hb02 | io_decode_csr == 12'h326 | io_decode_csr == 12'hb0d | _T_1872; // @[CSR.scala 424:57]
  wire  _T_2054 = _T_2039 | io_decode_csr == 12'h33e | io_decode_csr == 12'h331 | io_decode_csr == 12'hb13 |
    io_decode_csr == 12'h7a1 | io_decode_csr == 12'h343 | io_decode_csr == 12'h32e | io_decode_csr == 12'hb05 |
    io_decode_csr == 12'hc18 | io_decode_csr == 12'h143 | io_decode_csr == 12'h32a | io_decode_csr == 12'h100 |
    io_decode_csr == 12'hc0b | io_decode_csr == 12'hb16 | io_decode_csr == 12'hf14 | io_decode_csr == 12'hc1b; // @[CSR.scala 424:57]
  wire  _T_2069 = _T_2054 | io_decode_csr == 12'hc1a | io_decode_csr == 12'hf13 | io_decode_csr == 12'hc04 |
    io_decode_csr == 12'hb1f | io_decode_csr == 12'h7b0 | io_decode_csr == 12'hb0f | io_decode_csr == 12'hb06 |
    io_decode_csr == 12'hc14 | io_decode_csr == 12'h33a | io_decode_csr == 12'hf12 | io_decode_csr == 12'h330 |
    io_decode_csr == 12'hc1e | io_decode_csr == 12'hc08 | io_decode_csr == 12'h340 | io_decode_csr == 12'hb15; // @[CSR.scala 424:57]
  wire  _T_2084 = _T_2069 | io_decode_csr == 12'hb19 | io_decode_csr == 12'hb03 | io_decode_csr == 12'hc10 |
    io_decode_csr == 12'hc02 | io_decode_csr == 12'h104 | io_decode_csr == 12'h328 | io_decode_csr == 12'h336 |
    io_decode_csr == 12'h300 | io_decode_csr == 12'hb1b | io_decode_csr == 12'h3 | io_decode_csr == 12'hc0e |
    io_decode_csr == 12'h334 | io_decode_csr == 12'h344 | io_decode_csr == 12'hb12 | io_decode_csr == 12'hb00; // @[CSR.scala 424:57]
  wire  _T_2099 = _T_2084 | io_decode_csr == 12'hc1c | io_decode_csr == 12'h7a0 | io_decode_csr == 12'hc03 |
    io_decode_csr == 12'hc0d | io_decode_csr == 12'h106 | io_decode_csr == 12'h332 | io_decode_csr == 12'hc0c |
    io_decode_csr == 12'h329 | io_decode_csr == 12'hb17 | io_decode_csr == 12'h304 | io_decode_csr == 12'h33c |
    io_decode_csr == 12'h32d | io_decode_csr == 12'hc17 | io_decode_csr == 12'h7b2 | io_decode_csr == 12'h33d; // @[CSR.scala 424:57]
  wire  _T_2114 = _T_2099 | io_decode_csr == 12'h327 | io_decode_csr == 12'h342 | io_decode_csr == 12'hc16 |
    io_decode_csr == 12'h141 | io_decode_csr == 12'h325 | io_decode_csr == 12'hb18 | io_decode_csr == 12'hb0a |
    io_decode_csr == 12'hc1d | io_decode_csr == 12'h142 | io_decode_csr == 12'h333 | io_decode_csr == 12'h7a2 |
    io_decode_csr == 12'h341 | io_decode_csr == 12'hc05 | io_decode_csr == 12'h32b | io_decode_csr == 12'h32c; // @[CSR.scala 424:57]
  wire  _T_2129 = _T_2114 | io_decode_csr == 12'h180 | io_decode_csr == 12'hb11 | io_decode_csr == 12'h302 |
    io_decode_csr == 12'h335 | io_decode_csr == 12'hc06 | io_decode_csr == 12'hc19 | io_decode_csr == 12'hf11 |
    io_decode_csr == 12'hc0f | io_decode_csr == 12'h33f | io_decode_csr == 12'h105 | io_decode_csr == 12'hb14 |
    io_decode_csr == 12'h7b1 | io_decode_csr == 12'hb04 | io_decode_csr == 12'hb1a | io_decode_csr == 12'h32f; // @[CSR.scala 424:57]
  wire  _T_2144 = _T_2129 | io_decode_csr == 12'hc09 | io_decode_csr == 12'hc1f | io_decode_csr == 12'hc13 |
    io_decode_csr == 12'h305 | io_decode_csr == 12'hb0c | io_decode_csr == 12'h33b | io_decode_csr == 12'h2 |
    io_decode_csr == 12'hb0e | io_decode_csr == 12'h144 | io_decode_csr == 12'hc07 | io_decode_csr == 12'hc15 |
    io_decode_csr == 12'hb1d | io_decode_csr == 12'h301 | io_decode_csr == 12'hb07 | io_decode_csr == 12'h339; // @[CSR.scala 424:57]
  wire  _T_2151 = ~(_T_2144 | io_decode_csr == 12'h323 | io_decode_csr == 12'hc00 | io_decode_csr == 12'hb10 |
    io_decode_csr == 12'hb1e | io_decode_csr == 12'hb08); // @[CSR.scala 424:5]
  wire  _T_2152 = effective_prv < _GEN_223 | _T_2151; // @[CSR.scala 423:64]
  wire  _T_2156 = ~allow_sfence_vma; // @[CSR.scala 425:37]
  wire  _T_2157 = _T_2012 & ~allow_sfence_vma; // @[CSR.scala 425:34]
  wire  _T_2158 = _T_2152 | _T_2157; // @[CSR.scala 424:62]
  wire  _T_2163 = io_decode_csr >= 12'hc00 & io_decode_csr < 12'hc20; // @[Package.scala 47:55]
  wire  _T_2168 = io_decode_csr >= 12'hc80 & io_decode_csr < 12'hca0; // @[Package.scala 47:55]
  wire [31:0] _T_2174 = hpm_mask >> io_decode_csr; // @[CSR.scala 426:171]
  wire  _T_2176 = (_T_2163 | _T_2168) & effective_prv <= 3'h1 & _T_2174[0]; // @[CSR.scala 426:160]
  wire  _T_2177 = _T_2158 | _T_2176; // @[CSR.scala 425:55]
  wire  _T_2190 = _T_1198 & (_T_1814 | _T_1816 | _T_1818); // @[CSR.scala 427:36]
  wire  _T_2191 = _T_2177 | _T_2190; // @[CSR.scala 426:215]
  wire  _T_2202 = (_T_1820 | _T_1822 | _T_1824) & io_decode_fp_illegal; // @[CSR.scala 428:74]
  wire [1:0] _T_2205 = ~io_decode_csr[11:10]; // @[CSR.scala 429:51]
  wire  _T_2225 = ~io_decode_csr[5]; // @[CSR.scala 432:5]
  wire  _T_2230 = ~io_decode_csr[5] & io_decode_csr[2] & ~allow_wfi; // @[CSR.scala 432:43]
  wire  _T_2231 = _T_1772 | _T_2230; // @[CSR.scala 431:66]
  wire  _T_2239 = _T_2225 & io_decode_csr[1] & ~allow_sret; // @[CSR.scala 433:43]
  wire  _T_2240 = _T_2231 | _T_2239; // @[CSR.scala 432:57]
  wire  _T_2244 = io_decode_csr[5] & _T_2156; // @[CSR.scala 434:22]
  wire [11:0] debugTVec = reg_debug ? 12'h808 : 12'h800; // @[CSR.scala 445:22]
  wire [39:0] _T_2328 = {reg_stvec[38],reg_stvec}; // @[Cat.scala 30:58]
  wire [39:0] _T_2329 = delegate ? _T_2328 : {{8'd0}, reg_mtvec}; // @[CSR.scala 446:45]
  wire [39:0] tvec = trapToDebug ? {{28'd0}, debugTVec} : _T_2329; // @[CSR.scala 446:17]
  wire [1:0] _T_2335 = ~io_status_fs; // @[CSR.scala 453:32]
  wire [1:0] _T_2338 = ~io_status_xs; // @[CSR.scala 453:53]
  wire [1:0] _T_2345 = insn_ret + insn_call; // @[Bitwise.scala 48:55]
  wire [1:0] _T_2346 = insn_break + io_exception; // @[Bitwise.scala 48:55]
  wire [2:0] _T_2347 = _T_2345 + _T_2346; // @[Bitwise.scala 48:55]
  wire  _GEN_4 = insn_wfi | reg_wfi; // @[CSR.scala 464:19 CSR.scala 464:29 CSR.scala 264:20]
  wire  _T_2361 = ~io_retire; // @[CSR.scala 466:32]
  wire  _GEN_6 = io_retire | reg_singleStepped; // @[CSR.scala 468:23 CSR.scala 468:43 CSR.scala 236:30]
  wire [39:0] _T_2387 = ~io_pc; // @[CSR.scala 474:17]
  wire [39:0] _T_2389 = _T_2387 | 40'h1; // @[CSR.scala 474:24]
  wire [39:0] _T_2390 = ~_T_2389; // @[CSR.scala 474:15]
  wire [63:0] _T_2391 = read_mstatus >> reg_mstatus_prv; // @[CSR.scala 475:27]
  wire  _T_2412 = cause == 64'h3 | cause == 64'h4 | cause == 64'h6 | cause == 64'h0 | cause == 64'h5 | cause == 64'h7 |
    cause == 64'h1; // @[Package.scala 7:62]
  wire [1:0] _T_2418 = causeIsDebugTrigger ? 2'h2 : 2'h1; // @[CSR.scala 484:84]
  wire [1:0] _T_2419 = causeIsDebugInt ? 2'h3 : _T_2418; // @[CSR.scala 484:54]
  wire  _GEN_8 = trapToDebug | reg_debug; // @[CSR.scala 481:24 CSR.scala 482:17 CSR.scala 232:22]
  wire [39:0] _GEN_9 = trapToDebug ? _T_2390 : reg_dpc; // @[CSR.scala 481:24 CSR.scala 483:15 CSR.scala 234:20]
  wire [1:0] _GEN_11 = trapToDebug ? reg_mstatus_prv : reg_dcsr_prv; // @[CSR.scala 481:24 CSR.scala 485:20 CSR.scala 205:21]
  wire [39:0] _T_2424 = ~_T_2390; // @[CSR.scala 714:28]
  wire  _T_2427 = ~reg_misa[2]; // @[CSR.scala 714:37]
  wire [1:0] _T_2429 = {_T_2427,1'h1}; // @[Cat.scala 30:58]
  wire [39:0] _GEN_225 = {{38'd0}, _T_2429}; // @[CSR.scala 714:31]
  wire [39:0] _T_2430 = _T_2424 | _GEN_225; // @[CSR.scala 714:31]
  wire [39:0] _T_2431 = ~_T_2430; // @[CSR.scala 714:26]
  wire [39:0] _GEN_12 = _T_2412 ? io_badaddr : reg_sbadaddr; // @[CSR.scala 489:28 CSR.scala 489:43 CSR.scala 260:25]
  wire [39:0] _GEN_13 = _T_2435 & delegate ? _T_2431 : reg_sepc; // @[CSR.scala 486:27 CSR.scala 487:16 CSR.scala 258:21]
  wire [63:0] _GEN_14 = _T_2435 & delegate ? cause : reg_scause; // @[CSR.scala 486:27 CSR.scala 488:18 CSR.scala 259:23]
  wire [39:0] _GEN_15 = _T_2435 & delegate ? _GEN_12 : reg_sbadaddr; // @[CSR.scala 486:27 CSR.scala 260:25]
  wire  _GEN_16 = _T_2435 & delegate ? _T_2391[0] : reg_mstatus_spie; // @[CSR.scala 486:27 CSR.scala 490:24 CSR.scala 197:24]
  wire [1:0] _GEN_17 = _T_2435 & delegate ? reg_mstatus_prv : {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 486:27 CSR.scala 491:23 CSR.scala 197:24]
  wire  _GEN_18 = _T_2435 & delegate ? 1'h0 : reg_mstatus_sie; // @[CSR.scala 486:27 CSR.scala 492:23 CSR.scala 197:24]
  wire [39:0] _GEN_20 = _T_2412 ? io_badaddr : reg_mbadaddr; // @[CSR.scala 497:28 CSR.scala 497:43 CSR.scala 247:25]
  wire [39:0] _GEN_21 = _T_2438 ? _T_2431 : reg_mepc; // @[CSR.scala 494:17 CSR.scala 495:16 CSR.scala 245:21]
  wire [63:0] _GEN_22 = _T_2438 ? cause : reg_mcause; // @[CSR.scala 494:17 CSR.scala 496:18 CSR.scala 246:23]
  wire [39:0] _GEN_23 = _T_2438 ? _GEN_20 : reg_mbadaddr; // @[CSR.scala 494:17 CSR.scala 247:25]
  wire  _GEN_24 = _T_2438 ? _T_2391[0] : reg_mstatus_mpie; // @[CSR.scala 494:17 CSR.scala 498:24 CSR.scala 197:24]
  wire [1:0] _GEN_25 = _T_2438 ? reg_mstatus_prv : reg_mstatus_mpp; // @[CSR.scala 494:17 CSR.scala 499:23 CSR.scala 197:24]
  wire  _GEN_26 = _T_2438 ? 1'h0 : reg_mstatus_mie; // @[CSR.scala 494:17 CSR.scala 500:23 CSR.scala 197:24]
  wire  _GEN_28 = exception ? _GEN_8 : reg_debug; // @[CSR.scala 473:20 CSR.scala 232:22]
  wire [39:0] _GEN_29 = exception ? _GEN_9 : reg_dpc; // @[CSR.scala 473:20 CSR.scala 234:20]
  wire [1:0] _GEN_31 = exception ? _GEN_11 : reg_dcsr_prv; // @[CSR.scala 473:20 CSR.scala 205:21]
  wire [39:0] _GEN_32 = exception ? _GEN_13 : reg_sepc; // @[CSR.scala 473:20 CSR.scala 258:21]
  wire [63:0] _GEN_33 = exception ? _GEN_14 : reg_scause; // @[CSR.scala 473:20 CSR.scala 259:23]
  wire [39:0] _GEN_34 = exception ? _GEN_15 : reg_sbadaddr; // @[CSR.scala 473:20 CSR.scala 260:25]
  wire  _GEN_35 = exception ? _GEN_16 : reg_mstatus_spie; // @[CSR.scala 473:20 CSR.scala 197:24]
  wire [1:0] _GEN_36 = exception ? _GEN_17 : {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 473:20 CSR.scala 197:24]
  wire  _GEN_37 = exception ? _GEN_18 : reg_mstatus_sie; // @[CSR.scala 473:20 CSR.scala 197:24]
  wire [39:0] _GEN_39 = exception ? _GEN_21 : reg_mepc; // @[CSR.scala 473:20 CSR.scala 245:21]
  wire [63:0] _GEN_40 = exception ? _GEN_22 : reg_mcause; // @[CSR.scala 473:20 CSR.scala 246:23]
  wire [39:0] _GEN_41 = exception ? _GEN_23 : reg_mbadaddr; // @[CSR.scala 473:20 CSR.scala 247:25]
  wire  _GEN_42 = exception ? _GEN_24 : reg_mstatus_mpie; // @[CSR.scala 473:20 CSR.scala 197:24]
  wire [1:0] _GEN_43 = exception ? _GEN_25 : reg_mstatus_mpp; // @[CSR.scala 473:20 CSR.scala 197:24]
  wire  _GEN_44 = exception ? _GEN_26 : reg_mstatus_mie; // @[CSR.scala 473:20 CSR.scala 197:24]
  wire  _GEN_45 = reg_mstatus_spp ? reg_mstatus_spie : _GEN_37; // @[CSR.scala 507:37 CSR.scala 507:55]
  wire  _GEN_46 = ~io_rw_addr[9] ? _GEN_45 : _GEN_37; // @[CSR.scala 506:44]
  wire  _GEN_47 = ~io_rw_addr[9] | _GEN_35; // @[CSR.scala 506:44 CSR.scala 508:24]
  wire [1:0] _GEN_48 = ~io_rw_addr[9] ? 2'h0 : _GEN_36; // @[CSR.scala 506:44 CSR.scala 509:23]
  wire [39:0] _GEN_50 = ~io_rw_addr[9] ? reg_sepc : tvec; // @[CSR.scala 506:44 CSR.scala 511:15 CSR.scala 448:11]
  wire [39:0] _GEN_53 = _T_2465 & io_rw_addr[10] ? reg_dpc : _GEN_50; // @[CSR.scala 512:53 CSR.scala 515:15]
  wire  _GEN_54 = reg_mstatus_mpp[1] ? reg_mstatus_mpie : _GEN_44; // @[CSR.scala 517:33 CSR.scala 517:51]
  wire  _T_2474 = ~reg_mstatus_mpp[1]; // @[CSR.scala 517:33]
  wire  _GEN_55 = _T_2474 & reg_mstatus_mpp[0] ? reg_mstatus_mpie : _GEN_46; // @[CSR.scala 518:55 CSR.scala 518:73]
  wire  _GEN_56 = _T_2468 ? _GEN_54 : _GEN_44; // @[CSR.scala 516:17]
  wire  _GEN_57 = _T_2468 ? _GEN_55 : _GEN_46; // @[CSR.scala 516:17]
  wire  _GEN_58 = _T_2468 | _GEN_42; // @[CSR.scala 516:17 CSR.scala 519:24]
  wire [1:0] _GEN_59 = _T_2468 ? 2'h0 : _GEN_43; // @[CSR.scala 516:17 CSR.scala 520:23]
  wire [39:0] _GEN_61 = _T_2468 ? reg_mepc : _GEN_53; // @[CSR.scala 516:17 CSR.scala 522:15]
  wire  _GEN_62 = insn_ret ? _GEN_57 : _GEN_37; // @[CSR.scala 505:19]
  wire  _GEN_63 = insn_ret ? _GEN_47 : _GEN_35; // @[CSR.scala 505:19]
  wire [1:0] _GEN_64 = insn_ret ? _GEN_48 : _GEN_36; // @[CSR.scala 505:19]
  wire  _GEN_68 = insn_ret ? _GEN_56 : _GEN_44; // @[CSR.scala 505:19]
  wire  _GEN_69 = insn_ret ? _GEN_58 : _GEN_42; // @[CSR.scala 505:19]
  wire [1:0] _GEN_70 = insn_ret ? _GEN_59 : _GEN_43; // @[CSR.scala 505:19]
  wire [63:0] _T_2485 = _T_1469 ? _T_1304 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2487 = _T_1471 ? _T_1345 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2495 = _T_1479 ? _T_950 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2497 = _T_1481 ? _T_939 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2499 = _T_1483 ? reg_misa : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2501 = _T_1485 ? read_mstatus : 64'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_2503 = _T_1487 ? reg_mtvec : 32'h0; // @[Mux.scala 19:72]
  wire [12:0] _T_2505 = _T_1489 ? read_mip : 13'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2507 = _T_1491 ? reg_mie : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2509 = _T_1493 ? reg_mideleg : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2511 = _T_1495 ? reg_medeleg : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2513 = _T_1497 ? reg_mscratch : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2515 = _T_1499 ? _T_1354 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2517 = _T_1501 ? _T_1360 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2519 = _T_1503 ? reg_mcause : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2521 = _T_1505 ? io_hartid : 64'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_2523 = _T_1507 ? _T_1376 : 32'h0; // @[Mux.scala 19:72]
  wire [39:0] _T_2525 = _T_1509 ? reg_dpc : 40'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2527 = _T_1511 ? reg_dscratch : 64'h0; // @[Mux.scala 19:72]
  wire [4:0] _T_2529 = _T_1513 ? reg_fflags : 5'h0; // @[Mux.scala 19:72]
  wire [2:0] _T_2531 = _T_1515 ? reg_frm : 3'h0; // @[Mux.scala 19:72]
  wire [7:0] _T_2533 = _T_1517 ? _T_1377 : 8'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2709 = _T_1693 ? _T_1444[63:0] : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2711 = _T_1695 ? _T_1381 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2713 = _T_1697 ? _T_1380 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2715 = _T_1699 ? reg_sscratch : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2717 = _T_1701 ? reg_scause : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2719 = _T_1703 ? _T_1451 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2721 = _T_1705 ? _T_1453 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2723 = _T_1707 ? _T_1459 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2725 = _T_1709 ? _T_1465 : 64'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_2727 = _T_1711 ? reg_scounteren : 32'h0; // @[Mux.scala 19:72]
  wire [31:0] _T_2729 = _T_1713 ? reg_mcounteren : 32'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2731 = _T_1715 ? _T_950 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2733 = _T_1717 ? _T_939 : 64'h0; // @[Mux.scala 19:72]
  wire [63:0] _T_2736 = _T_2485 | _T_2487; // @[Mux.scala 19:72]
  wire [63:0] _T_2740 = _T_2736 | _T_2495; // @[Mux.scala 19:72]
  wire [63:0] _T_2741 = _T_2740 | _T_2497; // @[Mux.scala 19:72]
  wire [63:0] _T_2742 = _T_2741 | _T_2499; // @[Mux.scala 19:72]
  wire [63:0] _T_2743 = _T_2742 | _T_2501; // @[Mux.scala 19:72]
  wire [63:0] _GEN_227 = {{32'd0}, _T_2503}; // @[Mux.scala 19:72]
  wire [63:0] _T_2744 = _T_2743 | _GEN_227; // @[Mux.scala 19:72]
  wire [63:0] _GEN_228 = {{51'd0}, _T_2505}; // @[Mux.scala 19:72]
  wire [63:0] _T_2745 = _T_2744 | _GEN_228; // @[Mux.scala 19:72]
  wire [63:0] _T_2746 = _T_2745 | _T_2507; // @[Mux.scala 19:72]
  wire [63:0] _T_2747 = _T_2746 | _T_2509; // @[Mux.scala 19:72]
  wire [63:0] _T_2748 = _T_2747 | _T_2511; // @[Mux.scala 19:72]
  wire [63:0] _T_2749 = _T_2748 | _T_2513; // @[Mux.scala 19:72]
  wire [63:0] _T_2750 = _T_2749 | _T_2515; // @[Mux.scala 19:72]
  wire [63:0] _T_2751 = _T_2750 | _T_2517; // @[Mux.scala 19:72]
  wire [63:0] _T_2752 = _T_2751 | _T_2519; // @[Mux.scala 19:72]
  wire [63:0] _T_2753 = _T_2752 | _T_2521; // @[Mux.scala 19:72]
  wire [63:0] _GEN_229 = {{32'd0}, _T_2523}; // @[Mux.scala 19:72]
  wire [63:0] _T_2754 = _T_2753 | _GEN_229; // @[Mux.scala 19:72]
  wire [63:0] _GEN_230 = {{24'd0}, _T_2525}; // @[Mux.scala 19:72]
  wire [63:0] _T_2755 = _T_2754 | _GEN_230; // @[Mux.scala 19:72]
  wire [63:0] _T_2756 = _T_2755 | _T_2527; // @[Mux.scala 19:72]
  wire [63:0] _GEN_231 = {{59'd0}, _T_2529}; // @[Mux.scala 19:72]
  wire [63:0] _T_2757 = _T_2756 | _GEN_231; // @[Mux.scala 19:72]
  wire [63:0] _GEN_232 = {{61'd0}, _T_2531}; // @[Mux.scala 19:72]
  wire [63:0] _T_2758 = _T_2757 | _GEN_232; // @[Mux.scala 19:72]
  wire [63:0] _GEN_233 = {{56'd0}, _T_2533}; // @[Mux.scala 19:72]
  wire [63:0] _T_2759 = _T_2758 | _GEN_233; // @[Mux.scala 19:72]
  wire [63:0] _T_2847 = _T_2759 | _T_2709; // @[Mux.scala 19:72]
  wire [63:0] _T_2848 = _T_2847 | _T_2711; // @[Mux.scala 19:72]
  wire [63:0] _T_2849 = _T_2848 | _T_2713; // @[Mux.scala 19:72]
  wire [63:0] _T_2850 = _T_2849 | _T_2715; // @[Mux.scala 19:72]
  wire [63:0] _T_2851 = _T_2850 | _T_2717; // @[Mux.scala 19:72]
  wire [63:0] _T_2852 = _T_2851 | _T_2719; // @[Mux.scala 19:72]
  wire [63:0] _T_2853 = _T_2852 | _T_2721; // @[Mux.scala 19:72]
  wire [63:0] _T_2854 = _T_2853 | _T_2723; // @[Mux.scala 19:72]
  wire [63:0] _T_2855 = _T_2854 | _T_2725; // @[Mux.scala 19:72]
  wire [63:0] _GEN_234 = {{32'd0}, _T_2727}; // @[Mux.scala 19:72]
  wire [63:0] _T_2856 = _T_2855 | _GEN_234; // @[Mux.scala 19:72]
  wire [63:0] _GEN_235 = {{32'd0}, _T_2729}; // @[Mux.scala 19:72]
  wire [63:0] _T_2857 = _T_2856 | _GEN_235; // @[Mux.scala 19:72]
  wire [63:0] _T_2858 = _T_2857 | _T_2731; // @[Mux.scala 19:72]
  wire [4:0] _T_2862 = reg_fflags | io_fcsr_flags_bits; // @[CSR.scala 533:30]
  wire [4:0] _GEN_71 = io_fcsr_flags_valid ? _T_2862 : reg_fflags; // @[CSR.scala 532:30 CSR.scala 533:16 CSR.scala 266:23]
  wire  _T_2870 = io_rw_cmd == 3'h2 | io_rw_cmd == 3'h3 | io_rw_cmd == 3'h1; // @[Package.scala 7:62]
  wire [98:0] _T_2959 = {{35'd0}, wdata};
  wire  _T_2989 = _T_2959[14:13] != 2'h0; // @[CSR.scala 557:73]
  wire [1:0] _T_2993 = _T_2989 ? 2'h3 : 2'h0; // @[Bitwise.scala 71:12]
  wire [1:0] _GEN_78 = _T_1485 ? {{1'd0}, _T_2959[8]} : _GEN_64; // @[CSR.scala 537:39 CSR.scala 548:27]
  wire [63:0] _T_2996 = ~wdata; // @[CSR.scala 563:21]
  wire  _T_2998 = ~wdata[5]; // @[CSR.scala 563:31]
  wire [3:0] _T_2999 = {_T_2998, 3'h0}; // @[CSR.scala 563:34]
  wire [63:0] _GEN_236 = {{60'd0}, _T_2999}; // @[CSR.scala 563:28]
  wire [63:0] _T_3000 = _T_2996 | _GEN_236; // @[CSR.scala 563:28]
  wire [63:0] _T_3001 = ~_T_3000; // @[CSR.scala 563:19]
  wire [63:0] _T_3002 = _T_3001 & 64'h102d; // @[CSR.scala 563:51]
  wire [63:0] _T_3004 = reg_misa & 64'hfd2; // @[CSR.scala 563:69]
  wire [63:0] _T_3005 = _T_3002 | _T_3004; // @[CSR.scala 563:58]
  wire [63:0] _T_3063 = wdata & 64'haaa; // @[CSR.scala 572:59]
  wire [63:0] _GEN_237 = {{62'd0}, _T_2429}; // @[CSR.scala 714:31]
  wire [63:0] _T_3070 = _T_2996 | _GEN_237; // @[CSR.scala 714:31]
  wire [63:0] _T_3071 = ~_T_3070; // @[CSR.scala 714:26]
  wire [63:0] _GEN_89 = _T_1499 ? _T_3071 : {{24'd0}, _GEN_39}; // @[CSR.scala 573:40 CSR.scala 573:51]
  wire [63:0] _T_3073 = {wdata[63:2], 2'h0}; // @[CSR.scala 576:66]
  wire [63:0] _GEN_91 = _T_1487 ? _T_3073 : {{32'd0}, reg_mtvec}; // @[CSR.scala 576:40 CSR.scala 576:52 CSR.scala 251:27]
  wire [63:0] _T_3075 = wdata & 64'h800000000000001f; // @[CSR.scala 577:62]
  wire [63:0] _GEN_94 = _T_1479 ? wdata : {{57'd0}, _T_943}; // @[CSR.scala 711:31 Counters.scala 67:11 Counters.scala 49:9]
  wire [63:0] _GEN_96 = _T_1481 ? wdata : {{57'd0}, _T_932}; // @[CSR.scala 711:31 Counters.scala 67:11 Counters.scala 49:9]
  wire [63:0] _GEN_98 = _T_1513 ? wdata : {{59'd0}, _GEN_71}; // @[CSR.scala 588:40 CSR.scala 588:53]
  wire [63:0] _GEN_99 = _T_1515 ? wdata : {{61'd0}, reg_frm}; // @[CSR.scala 589:40 CSR.scala 589:50 CSR.scala 267:20]
  wire [63:0] _GEN_100 = _T_1517 ? wdata : _GEN_98; // @[CSR.scala 590:40 CSR.scala 590:53]
  wire [63:0] _GEN_101 = _T_1517 ? {{5'd0}, wdata[63:5]} : _GEN_99; // @[CSR.scala 590:40 CSR.scala 590:71]
  wire [63:0] _T_3157 = _T_2996 | 64'h1; // @[CSR.scala 602:64]
  wire [63:0] _T_3158 = ~_T_3157; // @[CSR.scala 602:55]
  wire [63:0] _GEN_108 = _T_1509 ? _T_3158 : {{24'd0}, _GEN_29}; // @[CSR.scala 602:42 CSR.scala 602:52]
  wire [1:0] _GEN_112 = _T_1693 ? {{1'd0}, _T_2959[8]} : _GEN_78; // @[CSR.scala 606:41 CSR.scala 610:25]
  wire  _T_3357 = wdata[63:60] == 4'h0; // @[CSR.scala 622:30]
  wire  _T_3360 = wdata[63:60] == 4'h8; // @[CSR.scala 623:30]
  wire [63:0] _T_3369 = reg_mie & _T_988; // @[CSR.scala 629:64]
  wire [63:0] _T_3370 = wdata & reg_mideleg; // @[CSR.scala 629:89]
  wire [63:0] _T_3371 = _T_3369 | _T_3370; // @[CSR.scala 629:80]
  wire [63:0] _GEN_123 = _T_1707 ? _T_3071 : {{24'd0}, _GEN_32}; // @[CSR.scala 631:42 CSR.scala 631:53]
  wire [63:0] _GEN_124 = _T_1709 ? _T_3073 : {{25'd0}, reg_stvec}; // @[CSR.scala 632:42 CSR.scala 632:54 CSR.scala 262:22]
  wire [63:0] _T_3385 = wdata & 64'h222; // @[CSR.scala 635:65]
  wire [63:0] _T_3386 = wdata & 64'h1ab; // @[CSR.scala 636:65]
  wire [63:0] _T_3388 = wdata & 64'h7; // @[CSR.scala 637:70]
  wire [63:0] _GEN_129 = _T_1711 ? _T_3388 : {{32'd0}, reg_scounteren}; // @[CSR.scala 637:44 CSR.scala 637:61 CSR.scala 255:27]
  wire [63:0] _GEN_130 = _T_1713 ? _T_3388 : {{32'd0}, reg_mcounteren}; // @[CSR.scala 640:44 CSR.scala 640:61 CSR.scala 254:27]
  wire  _T_3494 = wdata[59] & reg_debug; // @[CSR.scala 649:36]
  wire [63:0] _GEN_140 = _T_1471 ? wdata : {{25'd0}, reg_bp_0_address}; // @[CSR.scala 654:42 CSR.scala 654:55 CSR.scala 239:19]
  wire [63:0] _GEN_150 = ~reg_bp_0_control_dmode | reg_debug ? _GEN_140 : {{25'd0}, reg_bp_0_address}; // @[CSR.scala 646:45 CSR.scala 239:19]
  wire [1:0] _GEN_157 = _T_2870 ? _GEN_112 : _GEN_64; // @[CSR.scala 536:49]
  wire [63:0] _GEN_168 = _T_2870 ? _GEN_89 : {{24'd0}, _GEN_39}; // @[CSR.scala 536:49]
  wire [63:0] _GEN_170 = _T_2870 ? _GEN_91 : {{32'd0}, reg_mtvec}; // @[CSR.scala 536:49 CSR.scala 251:27]
  wire [63:0] _GEN_173 = _T_2870 ? _GEN_94 : {{57'd0}, _T_943}; // @[CSR.scala 536:49 Counters.scala 49:9]
  wire [63:0] _GEN_175 = _T_2870 ? _GEN_96 : {{57'd0}, _T_932}; // @[CSR.scala 536:49 Counters.scala 49:9]
  wire [63:0] _GEN_177 = _T_2870 ? _GEN_100 : {{59'd0}, _GEN_71}; // @[CSR.scala 536:49]
  wire [63:0] _GEN_178 = _T_2870 ? _GEN_101 : {{61'd0}, reg_frm}; // @[CSR.scala 536:49 CSR.scala 267:20]
  wire [63:0] _GEN_185 = _T_2870 ? _GEN_108 : {{24'd0}, _GEN_29}; // @[CSR.scala 536:49]
  wire [63:0] _GEN_190 = _T_2870 ? _GEN_123 : {{24'd0}, _GEN_32}; // @[CSR.scala 536:49]
  wire [63:0] _GEN_191 = _T_2870 ? _GEN_124 : {{25'd0}, reg_stvec}; // @[CSR.scala 536:49 CSR.scala 262:22]
  wire [63:0] _GEN_196 = _T_2870 ? _GEN_129 : {{32'd0}, reg_scounteren}; // @[CSR.scala 536:49 CSR.scala 255:27]
  wire [63:0] _GEN_197 = _T_2870 ? _GEN_130 : {{32'd0}, reg_mcounteren}; // @[CSR.scala 536:49 CSR.scala 254:27]
  wire [63:0] _GEN_207 = _T_2870 ? _GEN_150 : {{25'd0}, reg_bp_0_address}; // @[CSR.scala 536:49 CSR.scala 239:19]
  assign io_rw_rdata = _T_2858 | _T_2733; // @[Mux.scala 19:72]
  assign io_decode_fp_illegal = io_status_fs == 2'h0 | ~reg_misa[5]; // @[CSR.scala 421:46]
  assign io_decode_read_illegal = _T_2191 | _T_2202; // @[CSR.scala 427:93]
  assign io_decode_write_illegal = _T_2205 == 2'h0; // @[CSR.scala 429:51]
  assign io_decode_write_flush = ~(io_decode_csr >= 12'h340 & io_decode_csr <= 12'h343 | io_decode_csr >= 12'h140 &
    io_decode_csr <= 12'h143); // @[CSR.scala 430:28]
  assign io_decode_system_illegal = _T_2240 | _T_2244; // @[CSR.scala 433:58]
  assign io_csr_stall = reg_wfi; // @[CSR.scala 527:16]
  assign io_eret = _T_2344 | insn_ret; // @[CSR.scala 450:38]
  assign io_singleStep = reg_dcsr_step & _T_1198; // @[CSR.scala 451:34]
  assign io_status_debug = reg_debug; // @[CSR.scala 454:19]
  assign io_status_isa = reg_misa[31:0]; // @[CSR.scala 455:17]
  assign io_status_prv = reg_mstatus_prv; // @[CSR.scala 452:13]
  assign io_status_sd = _T_2335 == 2'h0 | _T_2338 == 2'h0; // @[CSR.scala 453:37]
  assign io_status_zero2 = 27'h0;
  assign io_status_sxl = 2'h2; // @[CSR.scala 457:17]
  assign io_status_uxl = 2'h2; // @[CSR.scala 456:17]
  assign io_status_sd_rv32 = 1'h0;
  assign io_status_zero1 = 8'h0;
  assign io_status_tsr = reg_mstatus_tsr; // @[CSR.scala 452:13]
  assign io_status_tw = reg_mstatus_tw; // @[CSR.scala 452:13]
  assign io_status_tvm = reg_mstatus_tvm; // @[CSR.scala 452:13]
  assign io_status_mxr = reg_mstatus_mxr; // @[CSR.scala 452:13]
  assign io_status_pum = reg_mstatus_pum; // @[CSR.scala 452:13]
  assign io_status_mprv = reg_mstatus_mprv; // @[CSR.scala 452:13]
  assign io_status_xs = 2'h0;
  assign io_status_fs = reg_mstatus_fs; // @[CSR.scala 452:13]
  assign io_status_mpp = reg_mstatus_mpp; // @[CSR.scala 452:13]
  assign io_status_hpp = 2'h0;
  assign io_status_spp = reg_mstatus_spp; // @[CSR.scala 452:13]
  assign io_status_mpie = reg_mstatus_mpie; // @[CSR.scala 452:13]
  assign io_status_hpie = 1'h0;
  assign io_status_spie = reg_mstatus_spie; // @[CSR.scala 452:13]
  assign io_status_upie = 1'h0;
  assign io_status_mie = reg_mstatus_mie; // @[CSR.scala 452:13]
  assign io_status_hie = 1'h0;
  assign io_status_sie = reg_mstatus_sie; // @[CSR.scala 452:13]
  assign io_status_uie = 1'h0;
  assign io_ptbr_mode = reg_sptbr_mode; // @[CSR.scala 449:11]
  assign io_ptbr_ppn = reg_sptbr_ppn; // @[CSR.scala 449:11]
  assign io_evec = insn_ret ? _GEN_61 : tvec; // @[CSR.scala 505:19 CSR.scala 448:11]
  assign io_fatc = system_insn & insn_rs2; // @[CSR.scala 416:37]
  assign io_time = {_T_945,_T_942}; // @[Cat.scala 30:58]
  assign io_fcsr_rm = reg_frm; // @[CSR.scala 531:14]
  assign io_interrupt = reg_dcsr_debugint & _T_1198 | (all_interrupts != 64'h0 & ~reg_debug & ~io_singleStep |
    reg_singleStepped); // @[CSR.scala 291:62 CSR.scala 292:18 CSR.scala 286:16]
  assign io_interrupt_cause = reg_dcsr_debugint & _T_1198 ? 64'h800000000000000d : interruptCause; // @[CSR.scala 291:62 CSR.scala 293:24 CSR.scala 287:22]
  assign io_bp_0_control_action = reg_bp_0_control_action; // @[CSR.scala 288:9]
  assign io_bp_0_control_tmatch = reg_bp_0_control_tmatch; // @[CSR.scala 288:9]
  assign io_bp_0_control_m = reg_bp_0_control_m; // @[CSR.scala 288:9]
  assign io_bp_0_control_s = reg_bp_0_control_s; // @[CSR.scala 288:9]
  assign io_bp_0_control_u = reg_bp_0_control_u; // @[CSR.scala 288:9]
  assign io_bp_0_control_x = reg_bp_0_control_x; // @[CSR.scala 288:9]
  assign io_bp_0_control_w = reg_bp_0_control_w; // @[CSR.scala 288:9]
  assign io_bp_0_control_r = reg_bp_0_control_r; // @[CSR.scala 288:9]
  assign io_bp_0_address = reg_bp_0_address; // @[CSR.scala 288:9]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_prv <= 2'h3; // @[CSR.scala 197:24]
    end else if (new_prv == 2'h2) begin // @[CSR.scala 697:21]
      reg_mstatus_prv <= 2'h0;
    end else if (insn_ret) begin // @[CSR.scala 505:19]
      if (_T_2468) begin // @[CSR.scala 516:17]
        reg_mstatus_prv <= reg_mstatus_mpp; // @[CSR.scala 521:15]
      end else begin
        reg_mstatus_prv <= _GEN_51;
      end
    end else if (exception) begin // @[CSR.scala 473:20]
      reg_mstatus_prv <= _GEN_27;
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_tsr <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_tsr <= _T_2959[22]; // @[CSR.scala 553:27]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_tw <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_tw <= _T_2959[21]; // @[CSR.scala 551:26]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_tvm <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_tvm <= _T_2959[20]; // @[CSR.scala 552:27]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_mxr <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_mxr <= _T_2959[19]; // @[CSR.scala 545:25]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_pum <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1693) begin // @[CSR.scala 606:41]
        reg_mstatus_pum <= _T_2959[18]; // @[CSR.scala 611:25]
      end else if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_pum <= _T_2959[18]; // @[CSR.scala 547:27]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_mprv <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_mprv <= _T_2959[17]; // @[CSR.scala 543:26]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_fs <= 2'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1693) begin // @[CSR.scala 606:41]
        reg_mstatus_fs <= _T_2993; // @[CSR.scala 612:24]
      end else if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_fs <= _T_2993; // @[CSR.scala 557:47]
      end
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_mpp <= 2'h3; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_mpp <= _T_2959[12:11]; // @[CSR.scala 544:25]
      end else begin
        reg_mstatus_mpp <= _GEN_70;
      end
    end else begin
      reg_mstatus_mpp <= _GEN_70;
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_spp <= 1'h0; // @[CSR.scala 197:24]
    end else begin
      reg_mstatus_spp <= _GEN_157[0];
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_mpie <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_mpie <= _T_2959[7]; // @[CSR.scala 540:24]
      end else begin
        reg_mstatus_mpie <= _GEN_69;
      end
    end else begin
      reg_mstatus_mpie <= _GEN_69;
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_spie <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1693) begin // @[CSR.scala 606:41]
        reg_mstatus_spie <= _T_2959[5]; // @[CSR.scala 609:26]
      end else if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_spie <= _T_2959[5]; // @[CSR.scala 549:28]
      end else begin
        reg_mstatus_spie <= _GEN_63;
      end
    end else begin
      reg_mstatus_spie <= _GEN_63;
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_mie <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_mie <= _T_2959[3]; // @[CSR.scala 539:23]
      end else begin
        reg_mstatus_mie <= _GEN_68;
      end
    end else begin
      reg_mstatus_mie <= _GEN_68;
    end
    if (reset) begin // @[CSR.scala 197:24]
      reg_mstatus_sie <= 1'h0; // @[CSR.scala 197:24]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1693) begin // @[CSR.scala 606:41]
        reg_mstatus_sie <= _T_2959[1]; // @[CSR.scala 608:25]
      end else if (_T_1485) begin // @[CSR.scala 537:39]
        reg_mstatus_sie <= _T_2959[1]; // @[CSR.scala 550:27]
      end else begin
        reg_mstatus_sie <= _GEN_62;
      end
    end else begin
      reg_mstatus_sie <= _GEN_62;
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_prv <= 2'h3; // @[CSR.scala 205:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1507) begin // @[CSR.scala 593:38]
        reg_dcsr_prv <= wdata[1:0]; // @[CSR.scala 600:37]
      end else begin
        reg_dcsr_prv <= _GEN_31;
      end
    end else begin
      reg_dcsr_prv <= _GEN_31;
    end
    if (_T_1201) begin // @[CSR.scala 469:25]
      reg_singleStepped <= 1'h0; // @[CSR.scala 469:45]
    end else begin
      reg_singleStepped <= _GEN_6;
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_ebreakm <= 1'h0; // @[CSR.scala 205:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1507) begin // @[CSR.scala 593:38]
        reg_dcsr_ebreakm <= wdata[15]; // @[CSR.scala 597:26]
      end
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_ebreaks <= 1'h0; // @[CSR.scala 205:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1507) begin // @[CSR.scala 593:38]
        reg_dcsr_ebreaks <= wdata[13]; // @[CSR.scala 598:39]
      end
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_ebreaku <= 1'h0; // @[CSR.scala 205:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1507) begin // @[CSR.scala 593:38]
        reg_dcsr_ebreaku <= wdata[12]; // @[CSR.scala 599:41]
      end
    end
    if (reset) begin // @[CSR.scala 232:22]
      reg_debug <= 1'h0; // @[CSR.scala 232:22]
    end else if (insn_ret) begin // @[CSR.scala 505:19]
      if (_T_2465 & io_rw_addr[10]) begin // @[CSR.scala 512:53]
        reg_debug <= 1'h0; // @[CSR.scala 514:17]
      end else begin
        reg_debug <= _GEN_28;
      end
    end else begin
      reg_debug <= _GEN_28;
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1493) begin // @[CSR.scala 635:42]
        reg_mideleg <= _T_3385; // @[CSR.scala 635:56]
      end
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1495) begin // @[CSR.scala 636:42]
        reg_medeleg <= _T_3386; // @[CSR.scala 636:56]
      end
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_cause <= 3'h0; // @[CSR.scala 205:21]
    end else if (exception) begin // @[CSR.scala 473:20]
      if (trapToDebug) begin // @[CSR.scala 481:24]
        if (reg_singleStepped) begin // @[CSR.scala 484:28]
          reg_dcsr_cause <= 3'h4;
        end else begin
          reg_dcsr_cause <= {{1'd0}, _T_2419};
        end
      end
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_debugint <= 1'h0; // @[CSR.scala 205:21]
    end else begin
      reg_dcsr_debugint <= io_interrupts_debug; // @[CSR.scala 660:21]
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_halt <= 1'h0; // @[CSR.scala 205:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1507) begin // @[CSR.scala 593:38]
        reg_dcsr_halt <= wdata[3]; // @[CSR.scala 595:23]
      end
    end
    if (reset) begin // @[CSR.scala 205:21]
      reg_dcsr_step <= 1'h0; // @[CSR.scala 205:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1507) begin // @[CSR.scala 593:38]
        reg_dcsr_step <= wdata[2]; // @[CSR.scala 596:23]
      end
    end
    reg_dpc <= _GEN_185[39:0];
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1511) begin // @[CSR.scala 603:42]
        reg_dscratch <= wdata; // @[CSR.scala 603:57]
      end
    end
    if (reset) begin // @[CSR.scala 685:18]
      reg_bp_0_control_dmode <= 1'h0; // @[CSR.scala 687:17]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_dmode <= _T_3494; // @[CSR.scala 651:28]
        end
      end
    end
    if (reset) begin // @[CSR.scala 685:18]
      reg_bp_0_control_action <= 1'h0; // @[CSR.scala 686:18]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_action <= _T_3494 & wdata[12]; // @[CSR.scala 652:29]
        end
      end
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_tmatch <= wdata[8:7]; // @[CSR.scala 650:22]
        end
      end
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_m <= wdata[6]; // @[CSR.scala 650:22]
        end
      end
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_s <= wdata[4]; // @[CSR.scala 650:22]
        end
      end
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_u <= wdata[3]; // @[CSR.scala 650:22]
        end
      end
    end
    if (reset) begin // @[CSR.scala 685:18]
      reg_bp_0_control_x <= 1'h0; // @[CSR.scala 690:13]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_x <= wdata[2]; // @[CSR.scala 650:22]
        end
      end
    end
    if (reset) begin // @[CSR.scala 685:18]
      reg_bp_0_control_w <= 1'h0; // @[CSR.scala 689:13]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_w <= wdata[1]; // @[CSR.scala 650:22]
        end
      end
    end
    if (reset) begin // @[CSR.scala 685:18]
      reg_bp_0_control_r <= 1'h0; // @[CSR.scala 688:13]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 646:45]
        if (_T_1469) begin // @[CSR.scala 647:42]
          reg_bp_0_control_r <= wdata[0]; // @[CSR.scala 650:22]
        end
      end
    end
    reg_bp_0_address <= _GEN_207[38:0];
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1697) begin // @[CSR.scala 629:42]
        reg_mie <= _T_3371; // @[CSR.scala 629:52]
      end else if (_T_1491) begin // @[CSR.scala 572:40]
        reg_mie <= _T_3063; // @[CSR.scala 572:50]
      end
    end
    reg_mip_meip <= io_interrupts_meip; // @[CSR.scala 659:11]
    reg_mip_seip <= io_interrupts_seip; // @[CSR.scala 659:11]
    reg_mip_mtip <= io_interrupts_mtip; // @[CSR.scala 659:11]
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1489) begin // @[CSR.scala 565:35]
        reg_mip_stip <= wdata[5]; // @[CSR.scala 569:22]
      end
    end
    reg_mip_msip <= io_interrupts_msip; // @[CSR.scala 659:11]
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1695) begin // @[CSR.scala 615:37]
        reg_mip_ssip <= wdata[1]; // @[CSR.scala 617:22]
      end else if (_T_1489) begin // @[CSR.scala 565:35]
        reg_mip_ssip <= wdata[1]; // @[CSR.scala 568:22]
      end
    end
    reg_mepc <= _GEN_168[39:0];
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1503) begin // @[CSR.scala 577:40]
        reg_mcause <= _T_3075; // @[CSR.scala 577:53]
      end else begin
        reg_mcause <= _GEN_40;
      end
    end else begin
      reg_mcause <= _GEN_40;
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1501) begin // @[CSR.scala 578:40]
        reg_mbadaddr <= wdata[39:0]; // @[CSR.scala 578:55]
      end else begin
        reg_mbadaddr <= _GEN_41;
      end
    end else begin
      reg_mbadaddr <= _GEN_41;
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1497) begin // @[CSR.scala 574:40]
        reg_mscratch <= wdata; // @[CSR.scala 574:55]
      end
    end
    if (reset) begin // @[CSR.scala 251:27]
      reg_mtvec <= 32'h0; // @[CSR.scala 251:27]
    end else begin
      reg_mtvec <= _GEN_170[31:0];
    end
    reg_mcounteren <= _GEN_197[31:0];
    reg_scounteren <= _GEN_196[31:0];
    reg_sepc <= _GEN_190[39:0];
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1701) begin // @[CSR.scala 633:42]
        reg_scause <= _T_3075; // @[CSR.scala 633:55]
      end else begin
        reg_scause <= _GEN_33;
      end
    end else begin
      reg_scause <= _GEN_33;
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1703) begin // @[CSR.scala 634:42]
        reg_sbadaddr <= wdata[39:0]; // @[CSR.scala 634:57]
      end else begin
        reg_sbadaddr <= _GEN_34;
      end
    end else begin
      reg_sbadaddr <= _GEN_34;
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1699) begin // @[CSR.scala 630:42]
        reg_sscratch <= wdata; // @[CSR.scala 630:57]
      end
    end
    reg_stvec <= _GEN_191[38:0];
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1705) begin // @[CSR.scala 619:39]
        if (wdata[63:60] == 4'h8) begin // @[CSR.scala 623:46]
          reg_sptbr_mode <= 4'h8; // @[CSR.scala 623:63]
        end else if (wdata[63:60] == 4'h0) begin // @[CSR.scala 622:37]
          reg_sptbr_mode <= 4'h0; // @[CSR.scala 622:54]
        end
      end
    end
    if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1705) begin // @[CSR.scala 619:39]
        if (_T_3357 | _T_3360) begin // @[CSR.scala 624:70]
          reg_sptbr_ppn <= {{24'd0}, wdata[19:0]}; // @[CSR.scala 625:25]
        end
      end
    end
    if (reset) begin // @[CSR.scala 264:20]
      reg_wfi <= 1'h0; // @[CSR.scala 264:20]
    end else if (pending_interrupts != 64'h0 | exception) begin // @[CSR.scala 465:46]
      reg_wfi <= 1'h0; // @[CSR.scala 465:56]
    end else begin
      reg_wfi <= _GEN_4;
    end
    reg_fflags <= _GEN_177[4:0];
    reg_frm <= _GEN_178[2:0];
    if (reset) begin // @[Counters.scala 47:37]
      _T_931 <= 6'h0; // @[Counters.scala 47:37]
    end else begin
      _T_931 <= _GEN_175[5:0];
    end
    if (reset) begin // @[Counters.scala 52:27]
      _T_934 <= 58'h0; // @[Counters.scala 52:27]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1481) begin // @[CSR.scala 711:31]
        _T_934 <= wdata[63:6]; // @[Counters.scala 68:23]
      end else begin
        _T_934 <= _GEN_0;
      end
    end else begin
      _T_934 <= _GEN_0;
    end
    if (reset) begin // @[Counters.scala 47:37]
      _T_942 <= 6'h0; // @[Counters.scala 47:37]
    end else begin
      _T_942 <= _GEN_173[5:0];
    end
    if (reset) begin // @[Counters.scala 52:27]
      _T_945 <= 58'h0; // @[Counters.scala 52:27]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1479) begin // @[CSR.scala 711:31]
        _T_945 <= wdata[63:6]; // @[Counters.scala 68:23]
      end else begin
        _T_945 <= _GEN_1;
      end
    end else begin
      _T_945 <= _GEN_1;
    end
    if (reset) begin // @[CSR.scala 307:21]
      reg_misa <= 64'h800000000014112d; // @[CSR.scala 307:21]
    end else if (_T_2870) begin // @[CSR.scala 536:49]
      if (_T_1483) begin // @[CSR.scala 560:36]
        reg_misa <= _T_3005; // @[CSR.scala 563:16]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_2347 <= 3'h1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: these conditions must be mutually exclusive\n    at CSR.scala:462 assert(PopCount(insn_ret :: insn_call :: insn_break :: io.exception :: Nil) <= 1, \"these conditions must be mutually exclusive\")\n"
            ); // @[CSR.scala 462:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_2347 <= 3'h1 | reset)) begin
          $fatal; // @[CSR.scala 462:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~reg_wfi | ~io_retire | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at CSR.scala:466 assert(!reg_wfi || io.retire === UInt(0))\n"); // @[CSR.scala 466:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~reg_wfi | ~io_retire | reset)) begin
          $fatal; // @[CSR.scala 466:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~reg_singleStepped | _T_2361 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at CSR.scala:471 assert(!reg_singleStepped || io.retire === UInt(0))\n"); // @[CSR.scala 471:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~reg_singleStepped | _T_2361 | reset)) begin
          $fatal; // @[CSR.scala 471:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_mstatus_prv = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  reg_mstatus_tsr = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_mstatus_tw = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_mstatus_tvm = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_mstatus_mxr = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_mstatus_pum = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  reg_mstatus_mprv = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  reg_mstatus_fs = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  reg_mstatus_mpp = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  reg_mstatus_spp = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  reg_mstatus_mpie = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reg_mstatus_spie = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reg_mstatus_mie = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  reg_mstatus_sie = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  reg_dcsr_prv = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  reg_singleStepped = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  reg_dcsr_ebreakm = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  reg_dcsr_ebreaks = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  reg_dcsr_ebreaku = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  reg_debug = _RAND_19[0:0];
  _RAND_20 = {2{`RANDOM}};
  reg_mideleg = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  reg_medeleg = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  reg_dcsr_cause = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  reg_dcsr_debugint = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  reg_dcsr_halt = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  reg_dcsr_step = _RAND_25[0:0];
  _RAND_26 = {2{`RANDOM}};
  reg_dpc = _RAND_26[39:0];
  _RAND_27 = {2{`RANDOM}};
  reg_dscratch = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  reg_bp_0_control_dmode = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  reg_bp_0_control_action = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  reg_bp_0_control_tmatch = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  reg_bp_0_control_m = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  reg_bp_0_control_s = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  reg_bp_0_control_u = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  reg_bp_0_control_x = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  reg_bp_0_control_w = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  reg_bp_0_control_r = _RAND_36[0:0];
  _RAND_37 = {2{`RANDOM}};
  reg_bp_0_address = _RAND_37[38:0];
  _RAND_38 = {2{`RANDOM}};
  reg_mie = _RAND_38[63:0];
  _RAND_39 = {1{`RANDOM}};
  reg_mip_meip = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  reg_mip_seip = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  reg_mip_mtip = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  reg_mip_stip = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  reg_mip_msip = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  reg_mip_ssip = _RAND_44[0:0];
  _RAND_45 = {2{`RANDOM}};
  reg_mepc = _RAND_45[39:0];
  _RAND_46 = {2{`RANDOM}};
  reg_mcause = _RAND_46[63:0];
  _RAND_47 = {2{`RANDOM}};
  reg_mbadaddr = _RAND_47[39:0];
  _RAND_48 = {2{`RANDOM}};
  reg_mscratch = _RAND_48[63:0];
  _RAND_49 = {1{`RANDOM}};
  reg_mtvec = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  reg_mcounteren = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  reg_scounteren = _RAND_51[31:0];
  _RAND_52 = {2{`RANDOM}};
  reg_sepc = _RAND_52[39:0];
  _RAND_53 = {2{`RANDOM}};
  reg_scause = _RAND_53[63:0];
  _RAND_54 = {2{`RANDOM}};
  reg_sbadaddr = _RAND_54[39:0];
  _RAND_55 = {2{`RANDOM}};
  reg_sscratch = _RAND_55[63:0];
  _RAND_56 = {2{`RANDOM}};
  reg_stvec = _RAND_56[38:0];
  _RAND_57 = {1{`RANDOM}};
  reg_sptbr_mode = _RAND_57[3:0];
  _RAND_58 = {2{`RANDOM}};
  reg_sptbr_ppn = _RAND_58[43:0];
  _RAND_59 = {1{`RANDOM}};
  reg_wfi = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  reg_fflags = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  reg_frm = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  _T_931 = _RAND_62[5:0];
  _RAND_63 = {2{`RANDOM}};
  _T_934 = _RAND_63[57:0];
  _RAND_64 = {1{`RANDOM}};
  _T_942 = _RAND_64[5:0];
  _RAND_65 = {2{`RANDOM}};
  _T_945 = _RAND_65[57:0];
  _RAND_66 = {2{`RANDOM}};
  reg_misa = _RAND_66[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BreakpointUnit(
  input         io_status_debug,
  input  [1:0]  io_status_prv,
  input         io_bp_0_control_action,
  input  [1:0]  io_bp_0_control_tmatch,
  input         io_bp_0_control_m,
  input         io_bp_0_control_s,
  input         io_bp_0_control_u,
  input         io_bp_0_control_x,
  input         io_bp_0_control_w,
  input         io_bp_0_control_r,
  input  [38:0] io_bp_0_address,
  input  [38:0] io_pc,
  input  [38:0] io_ea,
  output        io_xcpt_if,
  output        io_xcpt_ld,
  output        io_xcpt_st,
  output        io_debug_if,
  output        io_debug_ld,
  output        io_debug_st
);
  wire [3:0] _T_215 = {io_bp_0_control_m,1'h0,io_bp_0_control_s,io_bp_0_control_u}; // @[Cat.scala 30:58]
  wire [3:0] _T_216 = _T_215 >> io_status_prv; // @[Breakpoint.scala 30:68]
  wire  _T_218 = ~io_status_debug & _T_216[0]; // @[Breakpoint.scala 30:50]
  wire  _T_224 = io_ea >= io_bp_0_address ^ io_bp_0_control_tmatch[0]; // @[Breakpoint.scala 44:20]
  wire [38:0] _T_225 = ~io_ea; // @[Breakpoint.scala 41:6]
  wire  _T_228 = io_bp_0_control_tmatch[0] & io_bp_0_address[0]; // @[Breakpoint.scala 38:73]
  wire  _T_230 = io_bp_0_control_tmatch[0] & io_bp_0_address[0] & io_bp_0_address[1]; // @[Breakpoint.scala 38:73]
  wire  _T_232 = io_bp_0_control_tmatch[0] & io_bp_0_address[0] & io_bp_0_address[1] & io_bp_0_address[2]; // @[Breakpoint.scala 38:73]
  wire [3:0] _T_235 = {_T_232,_T_230,_T_228,io_bp_0_control_tmatch[0]}; // @[Cat.scala 30:58]
  wire [38:0] _GEN_6 = {{35'd0}, _T_235}; // @[Breakpoint.scala 41:9]
  wire [38:0] _T_236 = _T_225 | _GEN_6; // @[Breakpoint.scala 41:9]
  wire [38:0] _T_237 = ~io_bp_0_address; // @[Breakpoint.scala 41:24]
  wire [38:0] _T_248 = _T_237 | _GEN_6; // @[Breakpoint.scala 41:33]
  wire  _T_249 = _T_236 == _T_248; // @[Breakpoint.scala 41:19]
  wire  _T_250 = io_bp_0_control_tmatch[1] ? _T_224 : _T_249; // @[Breakpoint.scala 47:8]
  wire  _T_251 = _T_218 & io_bp_0_control_r & _T_250; // @[Breakpoint.scala 73:38]
  wire  _T_284 = _T_218 & io_bp_0_control_w & _T_250; // @[Breakpoint.scala 74:38]
  wire  _T_290 = io_pc >= io_bp_0_address ^ io_bp_0_control_tmatch[0]; // @[Breakpoint.scala 44:20]
  wire [38:0] _T_291 = ~io_pc; // @[Breakpoint.scala 41:6]
  wire [38:0] _T_302 = _T_291 | _GEN_6; // @[Breakpoint.scala 41:9]
  wire  _T_315 = _T_302 == _T_248; // @[Breakpoint.scala 41:19]
  wire  _T_316 = io_bp_0_control_tmatch[1] ? _T_290 : _T_315; // @[Breakpoint.scala 47:8]
  wire  _T_317 = _T_218 & io_bp_0_control_x & _T_316; // @[Breakpoint.scala 75:38]
  wire  _T_322 = ~io_bp_0_control_action; // @[Breakpoint.scala 78:37]
  assign io_xcpt_if = _T_317 & _T_322; // @[Breakpoint.scala 80:21 Breakpoint.scala 80:34 Breakpoint.scala 64:14]
  assign io_xcpt_ld = _T_251 & ~io_bp_0_control_action; // @[Breakpoint.scala 78:21 Breakpoint.scala 78:34 Breakpoint.scala 65:14]
  assign io_xcpt_st = _T_284 & _T_322; // @[Breakpoint.scala 79:21 Breakpoint.scala 79:34 Breakpoint.scala 66:14]
  assign io_debug_if = _T_317 & io_bp_0_control_action; // @[Breakpoint.scala 80:21 Breakpoint.scala 80:69 Breakpoint.scala 67:15]
  assign io_debug_ld = _T_251 & io_bp_0_control_action; // @[Breakpoint.scala 78:21 Breakpoint.scala 78:69 Breakpoint.scala 68:15]
  assign io_debug_st = _T_284 & io_bp_0_control_action; // @[Breakpoint.scala 79:21 Breakpoint.scala 79:69 Breakpoint.scala 69:15]
endmodule
module ALU(
  input         io_dw,
  input  [3:0]  io_fn,
  input  [63:0] io_in2,
  input  [63:0] io_in1,
  output [63:0] io_out,
  output [63:0] io_adder_out,
  output        io_cmp_out
);
  wire [63:0] _T_17 = ~io_in2; // @[ALU.scala 61:35]
  wire [63:0] in2_inv = io_fn[3] ? _T_17 : io_in2; // @[ALU.scala 61:20]
  wire [63:0] in1_xor_in2 = io_in1 ^ in2_inv; // @[ALU.scala 62:28]
  wire [63:0] _T_19 = io_in1 + in2_inv; // @[ALU.scala 63:26]
  wire [63:0] _GEN_1 = {{63'd0}, io_fn[3]}; // @[ALU.scala 63:36]
  wire  _T_26 = ~io_fn[3]; // @[ALU.scala 45:26]
  wire  _T_36 = io_fn[1] ? io_in2[63] : io_in1[63]; // @[ALU.scala 69:8]
  wire  _T_37 = io_in1[63] == io_in2[63] ? io_adder_out[63] : _T_36; // @[ALU.scala 68:8]
  wire  _T_38 = _T_26 ? in1_xor_in2 == 64'h0 : _T_37; // @[ALU.scala 67:8]
  wire  _T_42 = io_fn[3] & io_in1[31]; // @[ALU.scala 76:46]
  wire [31:0] _T_46 = _T_42 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  wire [31:0] _T_50 = io_dw ? io_in1[63:32] : _T_46; // @[ALU.scala 77:24]
  wire  _T_54 = io_in2[5] & io_dw; // @[ALU.scala 78:33]
  wire [5:0] shamt = {_T_54,io_in2[4:0]}; // @[Cat.scala 30:58]
  wire [63:0] shin_r = {_T_50,io_in1[31:0]}; // @[Cat.scala 30:58]
  wire  _T_61 = io_fn == 4'h5 | io_fn == 4'hb; // @[ALU.scala 81:35]
  wire [63:0] _T_67 = {{32'd0}, shin_r[63:32]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_69 = {shin_r[31:0], 32'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_71 = _T_69 & 64'hffffffff00000000; // @[Bitwise.scala 102:75]
  wire [63:0] _T_72 = _T_67 | _T_71; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_2 = {{16'd0}, _T_72[63:16]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_77 = _GEN_2 & 64'hffff0000ffff; // @[Bitwise.scala 102:31]
  wire [63:0] _T_79 = {_T_72[47:0], 16'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_81 = _T_79 & 64'hffff0000ffff0000; // @[Bitwise.scala 102:75]
  wire [63:0] _T_82 = _T_77 | _T_81; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_3 = {{8'd0}, _T_82[63:8]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_87 = _GEN_3 & 64'hff00ff00ff00ff; // @[Bitwise.scala 102:31]
  wire [63:0] _T_89 = {_T_82[55:0], 8'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_91 = _T_89 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 102:75]
  wire [63:0] _T_92 = _T_87 | _T_91; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_4 = {{4'd0}, _T_92[63:4]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_97 = _GEN_4 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 102:31]
  wire [63:0] _T_99 = {_T_92[59:0], 4'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_101 = _T_99 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 102:75]
  wire [63:0] _T_102 = _T_97 | _T_101; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_5 = {{2'd0}, _T_102[63:2]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_107 = _GEN_5 & 64'h3333333333333333; // @[Bitwise.scala 102:31]
  wire [63:0] _T_109 = {_T_102[61:0], 2'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_111 = _T_109 & 64'hcccccccccccccccc; // @[Bitwise.scala 102:75]
  wire [63:0] _T_112 = _T_107 | _T_111; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_6 = {{1'd0}, _T_112[63:1]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_117 = _GEN_6 & 64'h5555555555555555; // @[Bitwise.scala 102:31]
  wire [63:0] _T_119 = {_T_112[62:0], 1'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_121 = _T_119 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 102:75]
  wire [63:0] _T_122 = _T_117 | _T_121; // @[Bitwise.scala 102:39]
  wire [63:0] shin = io_fn == 4'h5 | io_fn == 4'hb ? shin_r : _T_122; // @[ALU.scala 81:17]
  wire  _T_125 = io_fn[3] & shin[63]; // @[ALU.scala 82:35]
  wire [64:0] _T_127 = {_T_125,shin}; // @[ALU.scala 82:57]
  wire [64:0] _T_128 = $signed(_T_127) >>> shamt; // @[ALU.scala 82:64]
  wire [63:0] shout_r = _T_128[63:0]; // @[ALU.scala 82:73]
  wire [63:0] _T_134 = {{32'd0}, shout_r[63:32]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_136 = {shout_r[31:0], 32'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_138 = _T_136 & 64'hffffffff00000000; // @[Bitwise.scala 102:75]
  wire [63:0] _T_139 = _T_134 | _T_138; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_7 = {{16'd0}, _T_139[63:16]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_144 = _GEN_7 & 64'hffff0000ffff; // @[Bitwise.scala 102:31]
  wire [63:0] _T_146 = {_T_139[47:0], 16'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_148 = _T_146 & 64'hffff0000ffff0000; // @[Bitwise.scala 102:75]
  wire [63:0] _T_149 = _T_144 | _T_148; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_8 = {{8'd0}, _T_149[63:8]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_154 = _GEN_8 & 64'hff00ff00ff00ff; // @[Bitwise.scala 102:31]
  wire [63:0] _T_156 = {_T_149[55:0], 8'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_158 = _T_156 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 102:75]
  wire [63:0] _T_159 = _T_154 | _T_158; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_9 = {{4'd0}, _T_159[63:4]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_164 = _GEN_9 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 102:31]
  wire [63:0] _T_166 = {_T_159[59:0], 4'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_168 = _T_166 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 102:75]
  wire [63:0] _T_169 = _T_164 | _T_168; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_10 = {{2'd0}, _T_169[63:2]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_174 = _GEN_10 & 64'h3333333333333333; // @[Bitwise.scala 102:31]
  wire [63:0] _T_176 = {_T_169[61:0], 2'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_178 = _T_176 & 64'hcccccccccccccccc; // @[Bitwise.scala 102:75]
  wire [63:0] _T_179 = _T_174 | _T_178; // @[Bitwise.scala 102:39]
  wire [63:0] _GEN_11 = {{1'd0}, _T_179[63:1]}; // @[Bitwise.scala 102:31]
  wire [63:0] _T_184 = _GEN_11 & 64'h5555555555555555; // @[Bitwise.scala 102:31]
  wire [63:0] _T_186 = {_T_179[62:0], 1'h0}; // @[Bitwise.scala 102:65]
  wire [63:0] _T_188 = _T_186 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 102:75]
  wire [63:0] shout_l = _T_184 | _T_188; // @[Bitwise.scala 102:39]
  wire [63:0] _T_195 = _T_61 ? shout_r : 64'h0; // @[ALU.scala 84:18]
  wire [63:0] _T_199 = io_fn == 4'h1 ? shout_l : 64'h0; // @[ALU.scala 85:18]
  wire [63:0] shout = _T_195 | _T_199; // @[ALU.scala 84:74]
  wire  _T_203 = io_fn == 4'h6; // @[ALU.scala 88:45]
  wire [63:0] _T_206 = io_fn == 4'h4 | io_fn == 4'h6 ? in1_xor_in2 : 64'h0; // @[ALU.scala 88:18]
  wire [63:0] _T_212 = io_in1 & io_in2; // @[ALU.scala 89:63]
  wire [63:0] _T_214 = _T_203 | io_fn == 4'h7 ? _T_212 : 64'h0; // @[ALU.scala 89:18]
  wire [63:0] logic_ = _T_206 | _T_214; // @[ALU.scala 88:78]
  wire  _T_222 = io_fn == 4'h2 | io_fn == 4'h3 | io_fn >= 4'hc; // @[ALU.scala 42:59]
  wire  _T_223 = _T_222 & io_cmp_out; // @[ALU.scala 90:35]
  wire [63:0] _GEN_12 = {{63'd0}, _T_223}; // @[ALU.scala 90:50]
  wire [63:0] _T_224 = _GEN_12 | logic_; // @[ALU.scala 90:50]
  wire [63:0] shift_logic = _T_224 | shout; // @[ALU.scala 90:58]
  wire [63:0] out = io_fn == 4'h0 | io_fn == 4'ha ? io_adder_out : shift_logic; // @[ALU.scala 91:16]
  wire [31:0] _T_236 = out[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_238 = {_T_236,out[31:0]}; // @[Cat.scala 30:58]
  assign io_out = ~io_dw ? _T_238 : out; // @[ALU.scala 96:28 ALU.scala 96:37 ALU.scala 93:10]
  assign io_adder_out = _T_19 + _GEN_1; // @[ALU.scala 63:36]
  assign io_cmp_out = io_fn[0] ^ _T_38; // @[ALU.scala 66:36]
endmodule
module MulDiv(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [3:0]  io_req_bits_fn,
  input         io_req_bits_dw,
  input  [63:0] io_req_bits_in1,
  input  [63:0] io_req_bits_in2,
  input  [4:0]  io_req_bits_tag,
  input         io_kill,
  input         io_resp_ready,
  output        io_resp_valid,
  output [63:0] io_resp_bits_data,
  output [4:0]  io_resp_bits_tag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [95:0] _RAND_7;
  reg [159:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Multiplier.scala 45:18]
  reg  req_dw; // @[Multiplier.scala 47:16]
  reg [4:0] req_tag; // @[Multiplier.scala 47:16]
  reg [6:0] count; // @[Multiplier.scala 48:18]
  reg  neg_out; // @[Multiplier.scala 49:20]
  reg  isMul; // @[Multiplier.scala 50:18]
  reg  isHi; // @[Multiplier.scala 51:17]
  reg [64:0] divisor; // @[Multiplier.scala 52:20]
  reg [129:0] remainder; // @[Multiplier.scala 53:22]
  wire [3:0] _T_79 = io_req_bits_fn & 4'h4; // @[Decode.scala 13:65]
  wire  _T_81 = _T_79 == 4'h0; // @[Decode.scala 13:121]
  wire [3:0] _T_83 = io_req_bits_fn & 4'h8; // @[Decode.scala 13:65]
  wire  _T_85 = _T_83 == 4'h8; // @[Decode.scala 13:121]
  wire  cmdMul = _T_81 | _T_85; // @[Decode.scala 14:30]
  wire [3:0] _T_90 = io_req_bits_fn & 4'h5; // @[Decode.scala 13:65]
  wire  _T_92 = _T_90 == 4'h1; // @[Decode.scala 13:121]
  wire [3:0] _T_94 = io_req_bits_fn & 4'h2; // @[Decode.scala 13:65]
  wire  _T_96 = _T_94 == 4'h2; // @[Decode.scala 13:121]
  wire  cmdHi = _T_92 | _T_96 | _T_85; // @[Decode.scala 14:30]
  wire [3:0] _T_102 = io_req_bits_fn & 4'h9; // @[Decode.scala 13:65]
  wire  _T_104 = _T_102 == 4'h0; // @[Decode.scala 13:121]
  wire [3:0] _T_106 = io_req_bits_fn & 4'h3; // @[Decode.scala 13:65]
  wire  _T_108 = _T_106 == 4'h0; // @[Decode.scala 13:121]
  wire  _T_111 = _T_104 | _T_81; // @[Decode.scala 14:30]
  wire  lhsSigned = _T_104 | _T_81 | _T_108; // @[Decode.scala 14:30]
  wire  _T_118 = ~io_req_bits_dw; // @[Multiplier.scala 67:62]
  wire  _T_122 = _T_118 ? io_req_bits_in1[31] : io_req_bits_in1[63]; // @[Multiplier.scala 70:29]
  wire  lhs_sign = lhsSigned & _T_122; // @[Multiplier.scala 70:23]
  wire [31:0] _T_126 = lhs_sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  wire [31:0] _T_128 = _T_118 ? _T_126 : io_req_bits_in1[63:32]; // @[Multiplier.scala 71:17]
  wire [63:0] lhs_in = {_T_128,io_req_bits_in1[31:0]}; // @[Cat.scala 30:58]
  wire  _T_136 = _T_118 ? io_req_bits_in2[31] : io_req_bits_in2[63]; // @[Multiplier.scala 70:29]
  wire  rhs_sign = _T_111 & _T_136; // @[Multiplier.scala 70:23]
  wire [31:0] _T_140 = rhs_sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  wire [31:0] _T_142 = _T_118 ? _T_140 : io_req_bits_in2[63:32]; // @[Multiplier.scala 71:17]
  wire [64:0] subtractor = remainder[128:64] - divisor; // @[Multiplier.scala 77:37]
  wire [63:0] negated_remainder = 64'h0 - remainder[63:0]; // @[Multiplier.scala 78:27]
  wire [129:0] _GEN_0 = remainder[63] | isMul ? {{66'd0}, negated_remainder} : remainder; // @[Multiplier.scala 81:36 Multiplier.scala 82:17 Multiplier.scala 53:22]
  wire [129:0] _GEN_2 = state == 3'h1 ? _GEN_0 : remainder; // @[Multiplier.scala 80:33 Multiplier.scala 53:22]
  wire [2:0] _GEN_4 = state == 3'h1 ? 3'h2 : state; // @[Multiplier.scala 80:33 Multiplier.scala 87:11 Multiplier.scala 45:18]
  wire [129:0] _GEN_5 = state == 3'h4 ? {{66'd0}, negated_remainder} : _GEN_2; // @[Multiplier.scala 90:33 Multiplier.scala 91:15]
  wire [2:0] _GEN_6 = state == 3'h4 ? 3'h5 : _GEN_4; // @[Multiplier.scala 90:33 Multiplier.scala 92:11]
  wire [2:0] _T_159 = neg_out ? 3'h4 : 3'h5; // @[Multiplier.scala 96:17]
  wire [2:0] _GEN_8 = state == 3'h3 ? _T_159 : _GEN_6; // @[Multiplier.scala 94:31 Multiplier.scala 96:11]
  wire  _T_160 = state == 3'h2; // @[Multiplier.scala 98:15]
  wire [128:0] _T_164 = {remainder[129:65],remainder[63:0]}; // @[Cat.scala 30:58]
  wire [64:0] _T_167 = _T_164[128:64]; // @[Multiplier.scala 101:37]
  wire [7:0] _M_170 = _T_164[7:0]; // @[Multiplier.scala 103:22]
  wire [72:0] _T_170 = $signed(divisor) * $signed(_M_170); // @[Multiplier.scala 103:43]
  wire [72:0] _GEN_34 = {{8{_T_167[64]}},_T_167}; // @[Multiplier.scala 103:52]
  wire [72:0] _T_175 = $signed(_T_170) + $signed(_GEN_34); // @[Cat.scala 30:58]
  wire [128:0] _T_176 = {_T_175,_T_164[63:8]}; // @[Cat.scala 30:58]
  wire [10:0] _T_179 = count * 4'h8; // @[Multiplier.scala 106:56]
  wire [64:0] _T_181 = 65'sh10000000000000000 >>> _T_179[5:0]; // @[Multiplier.scala 106:46]
  wire  _T_191 = ~isHi; // @[Multiplier.scala 108:7]
  wire  _T_192 = count != 7'h7 & count != 7'h0 & _T_191; // @[Multiplier.scala 107:87]
  wire [63:0] _T_193 = ~_T_181[63:0]; // @[Multiplier.scala 108:26]
  wire [63:0] _T_194 = _T_164[63:0] & _T_193; // @[Multiplier.scala 108:24]
  wire  _T_197 = _T_192 & _T_194 == 64'h0; // @[Multiplier.scala 108:13]
  wire [10:0] _T_203 = 11'h40 - _T_179; // @[Multiplier.scala 109:36]
  wire [128:0] _T_205 = _T_164 >> _T_203[5:0]; // @[Multiplier.scala 109:27]
  wire [128:0] _T_207 = _T_197 ? _T_205 : _T_176; // @[Multiplier.scala 110:55]
  wire [128:0] _T_209 = {_T_176[128:64],_T_207[63:0]}; // @[Cat.scala 30:58]
  wire [129:0] _T_214 = {_T_209[128:64],1'h0,_T_209[63:0]}; // @[Cat.scala 30:58]
  wire [6:0] _T_217 = count + 7'h1; // @[Multiplier.scala 113:20]
  wire [2:0] _T_221 = isHi ? 3'h3 : 3'h5; // @[Multiplier.scala 115:19]
  wire [2:0] _GEN_9 = _T_197 | count == 7'h7 ? _T_221 : _GEN_8; // @[Multiplier.scala 114:51 Multiplier.scala 115:13]
  wire [2:0] _GEN_12 = state == 3'h2 & isMul ? _GEN_9 : _GEN_8; // @[Multiplier.scala 98:36]
  wire [63:0] _T_229 = subtractor[64] ? remainder[127:64] : subtractor[63:0]; // @[Multiplier.scala 123:14]
  wire  _T_232 = ~subtractor[64]; // @[Multiplier.scala 123:67]
  wire [128:0] _T_234 = {_T_229,remainder[63:0],_T_232}; // @[Cat.scala 30:58]
  wire [2:0] _T_238 = isHi ? 3'h3 : _T_159; // @[Multiplier.scala 128:19]
  wire [2:0] _GEN_13 = count == 7'h40 ? _T_238 : _GEN_12; // @[Multiplier.scala 127:38 Multiplier.scala 128:13]
  wire  _T_243 = count == 7'h0; // @[Multiplier.scala 134:24]
  wire  _T_247 = count == 7'h0 & _T_232; // @[Multiplier.scala 134:30]
  wire  _T_252 = divisor[63:32] != 32'h0; // @[CircuitMath.scala 37:22]
  wire  _T_256 = divisor[63:48] != 16'h0; // @[CircuitMath.scala 37:22]
  wire  _T_260 = divisor[63:56] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_264 = divisor[63:60] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_270 = divisor[62] ? 2'h2 : {{1'd0}, divisor[61]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_271 = divisor[63] ? 2'h3 : _T_270; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_277 = divisor[58] ? 2'h2 : {{1'd0}, divisor[57]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_278 = divisor[59] ? 2'h3 : _T_277; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_279 = _T_264 ? _T_271 : _T_278; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_280 = {_T_264,_T_279}; // @[Cat.scala 30:58]
  wire  _T_284 = divisor[55:52] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_290 = divisor[54] ? 2'h2 : {{1'd0}, divisor[53]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_291 = divisor[55] ? 2'h3 : _T_290; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_297 = divisor[50] ? 2'h2 : {{1'd0}, divisor[49]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_298 = divisor[51] ? 2'h3 : _T_297; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_299 = _T_284 ? _T_291 : _T_298; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_300 = {_T_284,_T_299}; // @[Cat.scala 30:58]
  wire [2:0] _T_301 = _T_260 ? _T_280 : _T_300; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_302 = {_T_260,_T_301}; // @[Cat.scala 30:58]
  wire  _T_306 = divisor[47:40] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_310 = divisor[47:44] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_316 = divisor[46] ? 2'h2 : {{1'd0}, divisor[45]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_317 = divisor[47] ? 2'h3 : _T_316; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_323 = divisor[42] ? 2'h2 : {{1'd0}, divisor[41]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_324 = divisor[43] ? 2'h3 : _T_323; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_325 = _T_310 ? _T_317 : _T_324; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_326 = {_T_310,_T_325}; // @[Cat.scala 30:58]
  wire  _T_330 = divisor[39:36] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_336 = divisor[38] ? 2'h2 : {{1'd0}, divisor[37]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_337 = divisor[39] ? 2'h3 : _T_336; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_343 = divisor[34] ? 2'h2 : {{1'd0}, divisor[33]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_344 = divisor[35] ? 2'h3 : _T_343; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_345 = _T_330 ? _T_337 : _T_344; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_346 = {_T_330,_T_345}; // @[Cat.scala 30:58]
  wire [2:0] _T_347 = _T_306 ? _T_326 : _T_346; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_348 = {_T_306,_T_347}; // @[Cat.scala 30:58]
  wire [3:0] _T_349 = _T_256 ? _T_302 : _T_348; // @[CircuitMath.scala 38:21]
  wire [4:0] _T_350 = {_T_256,_T_349}; // @[Cat.scala 30:58]
  wire  _T_354 = divisor[31:16] != 16'h0; // @[CircuitMath.scala 37:22]
  wire  _T_358 = divisor[31:24] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_362 = divisor[31:28] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_368 = divisor[30] ? 2'h2 : {{1'd0}, divisor[29]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_369 = divisor[31] ? 2'h3 : _T_368; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_375 = divisor[26] ? 2'h2 : {{1'd0}, divisor[25]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_376 = divisor[27] ? 2'h3 : _T_375; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_377 = _T_362 ? _T_369 : _T_376; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_378 = {_T_362,_T_377}; // @[Cat.scala 30:58]
  wire  _T_382 = divisor[23:20] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_388 = divisor[22] ? 2'h2 : {{1'd0}, divisor[21]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_389 = divisor[23] ? 2'h3 : _T_388; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_395 = divisor[18] ? 2'h2 : {{1'd0}, divisor[17]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_396 = divisor[19] ? 2'h3 : _T_395; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_397 = _T_382 ? _T_389 : _T_396; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_398 = {_T_382,_T_397}; // @[Cat.scala 30:58]
  wire [2:0] _T_399 = _T_358 ? _T_378 : _T_398; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_400 = {_T_358,_T_399}; // @[Cat.scala 30:58]
  wire  _T_404 = divisor[15:8] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_408 = divisor[15:12] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_414 = divisor[14] ? 2'h2 : {{1'd0}, divisor[13]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_415 = divisor[15] ? 2'h3 : _T_414; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_421 = divisor[10] ? 2'h2 : {{1'd0}, divisor[9]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_422 = divisor[11] ? 2'h3 : _T_421; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_423 = _T_408 ? _T_415 : _T_422; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_424 = {_T_408,_T_423}; // @[Cat.scala 30:58]
  wire  _T_428 = divisor[7:4] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_434 = divisor[6] ? 2'h2 : {{1'd0}, divisor[5]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_435 = divisor[7] ? 2'h3 : _T_434; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_441 = divisor[2] ? 2'h2 : {{1'd0}, divisor[1]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_442 = divisor[3] ? 2'h3 : _T_441; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_443 = _T_428 ? _T_435 : _T_442; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_444 = {_T_428,_T_443}; // @[Cat.scala 30:58]
  wire [2:0] _T_445 = _T_404 ? _T_424 : _T_444; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_446 = {_T_404,_T_445}; // @[Cat.scala 30:58]
  wire [3:0] _T_447 = _T_354 ? _T_400 : _T_446; // @[CircuitMath.scala 38:21]
  wire [4:0] _T_448 = {_T_354,_T_447}; // @[Cat.scala 30:58]
  wire [4:0] _T_449 = _T_252 ? _T_350 : _T_448; // @[CircuitMath.scala 38:21]
  wire [5:0] _T_450 = {_T_252,_T_449}; // @[Cat.scala 30:58]
  wire  _T_455 = remainder[63:32] != 32'h0; // @[CircuitMath.scala 37:22]
  wire  _T_459 = remainder[63:48] != 16'h0; // @[CircuitMath.scala 37:22]
  wire  _T_463 = remainder[63:56] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_467 = remainder[63:60] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_473 = remainder[62] ? 2'h2 : {{1'd0}, remainder[61]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_474 = remainder[63] ? 2'h3 : _T_473; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_480 = remainder[58] ? 2'h2 : {{1'd0}, remainder[57]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_481 = remainder[59] ? 2'h3 : _T_480; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_482 = _T_467 ? _T_474 : _T_481; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_483 = {_T_467,_T_482}; // @[Cat.scala 30:58]
  wire  _T_487 = remainder[55:52] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_493 = remainder[54] ? 2'h2 : {{1'd0}, remainder[53]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_494 = remainder[55] ? 2'h3 : _T_493; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_500 = remainder[50] ? 2'h2 : {{1'd0}, remainder[49]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_501 = remainder[51] ? 2'h3 : _T_500; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_502 = _T_487 ? _T_494 : _T_501; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_503 = {_T_487,_T_502}; // @[Cat.scala 30:58]
  wire [2:0] _T_504 = _T_463 ? _T_483 : _T_503; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_505 = {_T_463,_T_504}; // @[Cat.scala 30:58]
  wire  _T_509 = remainder[47:40] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_513 = remainder[47:44] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_519 = remainder[46] ? 2'h2 : {{1'd0}, remainder[45]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_520 = remainder[47] ? 2'h3 : _T_519; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_526 = remainder[42] ? 2'h2 : {{1'd0}, remainder[41]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_527 = remainder[43] ? 2'h3 : _T_526; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_528 = _T_513 ? _T_520 : _T_527; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_529 = {_T_513,_T_528}; // @[Cat.scala 30:58]
  wire  _T_533 = remainder[39:36] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_539 = remainder[38] ? 2'h2 : {{1'd0}, remainder[37]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_540 = remainder[39] ? 2'h3 : _T_539; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_546 = remainder[34] ? 2'h2 : {{1'd0}, remainder[33]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_547 = remainder[35] ? 2'h3 : _T_546; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_548 = _T_533 ? _T_540 : _T_547; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_549 = {_T_533,_T_548}; // @[Cat.scala 30:58]
  wire [2:0] _T_550 = _T_509 ? _T_529 : _T_549; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_551 = {_T_509,_T_550}; // @[Cat.scala 30:58]
  wire [3:0] _T_552 = _T_459 ? _T_505 : _T_551; // @[CircuitMath.scala 38:21]
  wire [4:0] _T_553 = {_T_459,_T_552}; // @[Cat.scala 30:58]
  wire  _T_557 = remainder[31:16] != 16'h0; // @[CircuitMath.scala 37:22]
  wire  _T_561 = remainder[31:24] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_565 = remainder[31:28] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_571 = remainder[30] ? 2'h2 : {{1'd0}, remainder[29]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_572 = remainder[31] ? 2'h3 : _T_571; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_578 = remainder[26] ? 2'h2 : {{1'd0}, remainder[25]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_579 = remainder[27] ? 2'h3 : _T_578; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_580 = _T_565 ? _T_572 : _T_579; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_581 = {_T_565,_T_580}; // @[Cat.scala 30:58]
  wire  _T_585 = remainder[23:20] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_591 = remainder[22] ? 2'h2 : {{1'd0}, remainder[21]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_592 = remainder[23] ? 2'h3 : _T_591; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_598 = remainder[18] ? 2'h2 : {{1'd0}, remainder[17]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_599 = remainder[19] ? 2'h3 : _T_598; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_600 = _T_585 ? _T_592 : _T_599; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_601 = {_T_585,_T_600}; // @[Cat.scala 30:58]
  wire [2:0] _T_602 = _T_561 ? _T_581 : _T_601; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_603 = {_T_561,_T_602}; // @[Cat.scala 30:58]
  wire  _T_607 = remainder[15:8] != 8'h0; // @[CircuitMath.scala 37:22]
  wire  _T_611 = remainder[15:12] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_617 = remainder[14] ? 2'h2 : {{1'd0}, remainder[13]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_618 = remainder[15] ? 2'h3 : _T_617; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_624 = remainder[10] ? 2'h2 : {{1'd0}, remainder[9]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_625 = remainder[11] ? 2'h3 : _T_624; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_626 = _T_611 ? _T_618 : _T_625; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_627 = {_T_611,_T_626}; // @[Cat.scala 30:58]
  wire  _T_631 = remainder[7:4] != 4'h0; // @[CircuitMath.scala 37:22]
  wire [1:0] _T_637 = remainder[6] ? 2'h2 : {{1'd0}, remainder[5]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_638 = remainder[7] ? 2'h3 : _T_637; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_644 = remainder[2] ? 2'h2 : {{1'd0}, remainder[1]}; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_645 = remainder[3] ? 2'h3 : _T_644; // @[CircuitMath.scala 32:10]
  wire [1:0] _T_646 = _T_631 ? _T_638 : _T_645; // @[CircuitMath.scala 38:21]
  wire [2:0] _T_647 = {_T_631,_T_646}; // @[Cat.scala 30:58]
  wire [2:0] _T_648 = _T_607 ? _T_627 : _T_647; // @[CircuitMath.scala 38:21]
  wire [3:0] _T_649 = {_T_607,_T_648}; // @[Cat.scala 30:58]
  wire [3:0] _T_650 = _T_557 ? _T_603 : _T_649; // @[CircuitMath.scala 38:21]
  wire [4:0] _T_651 = {_T_557,_T_650}; // @[Cat.scala 30:58]
  wire [4:0] _T_652 = _T_455 ? _T_553 : _T_651; // @[CircuitMath.scala 38:21]
  wire [5:0] _T_653 = {_T_455,_T_652}; // @[Cat.scala 30:58]
  wire [5:0] _T_656 = 6'h3f + _T_450; // @[Multiplier.scala 138:31]
  wire [5:0] _T_659 = _T_656 - _T_653; // @[Multiplier.scala 138:44]
  wire  _T_660 = _T_450 > _T_653; // @[Multiplier.scala 139:33]
  wire  _T_669 = _T_243 & ~_T_247 & (_T_659 >= 6'h1 | _T_660); // @[Multiplier.scala 140:41]
  wire [5:0] _T_671 = _T_660 ? 6'h3f : _T_659; // @[Multiplier.scala 142:22]
  wire [126:0] _GEN_35 = {{63'd0}, remainder[63:0]}; // @[Multiplier.scala 144:39]
  wire [126:0] _T_675 = _GEN_35 << _T_671; // @[Multiplier.scala 144:39]
  wire [128:0] _GEN_14 = _T_669 ? {{2'd0}, _T_675} : _T_234; // @[Multiplier.scala 141:19 Multiplier.scala 144:19 Multiplier.scala 126:15]
  wire  _T_680 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 30:37]
  wire  _T_682 = io_req_ready & io_req_valid; // @[Decoupled.scala 30:37]
  wire  _T_684 = ~cmdMul; // @[Multiplier.scala 154:42]
  wire  _T_692 = cmdHi ? lhs_sign : lhs_sign != rhs_sign; // @[Multiplier.scala 158:30]
  wire [64:0] _T_694 = {rhs_sign,_T_142,io_req_bits_in2[31:0]}; // @[Cat.scala 30:58]
  wire  _T_697 = ~req_dw; // @[Multiplier.scala 67:62]
  wire [31:0] _T_703 = remainder[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  wire [63:0] _T_705 = {_T_703,remainder[31:0]}; // @[Cat.scala 30:58]
  assign io_req_ready = state == 3'h0; // @[Multiplier.scala 167:25]
  assign io_resp_valid = state == 3'h5; // @[Multiplier.scala 166:26]
  assign io_resp_bits_data = _T_697 ? _T_705 : remainder[63:0]; // @[Multiplier.scala 165:27]
  assign io_resp_bits_tag = req_tag; // @[Multiplier.scala 164:16]
  always @(posedge clock) begin
    if (reset) begin // @[Multiplier.scala 45:18]
      state <= 3'h0; // @[Multiplier.scala 45:18]
    end else if (_T_682) begin // @[Multiplier.scala 153:24]
      if (lhs_sign | rhs_sign & ~cmdMul) begin // @[Multiplier.scala 154:17]
        state <= 3'h1;
      end else begin
        state <= 3'h2;
      end
    end else if (_T_680 | io_kill) begin // @[Multiplier.scala 150:36]
      state <= 3'h0; // @[Multiplier.scala 151:11]
    end else if (_T_160 & ~isMul) begin // @[Multiplier.scala 118:37]
      state <= _GEN_13;
    end else begin
      state <= _GEN_12;
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      req_dw <= io_req_bits_dw; // @[Multiplier.scala 161:9]
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      req_tag <= io_req_bits_tag; // @[Multiplier.scala 161:9]
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      count <= 7'h0; // @[Multiplier.scala 157:11]
    end else if (_T_160 & ~isMul) begin // @[Multiplier.scala 118:37]
      if (_T_669) begin // @[Multiplier.scala 141:19]
        count <= {{1'd0}, _T_671}; // @[Multiplier.scala 145:15]
      end else begin
        count <= _T_217; // @[Multiplier.scala 132:11]
      end
    end else if (state == 3'h2 & isMul) begin // @[Multiplier.scala 98:36]
      count <= _T_217; // @[Multiplier.scala 113:11]
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      neg_out <= _T_684 & _T_692; // @[Multiplier.scala 158:13]
    end else if (_T_160 & ~isMul) begin // @[Multiplier.scala 118:37]
      if (_T_247 & _T_191) begin // @[Multiplier.scala 148:28]
        neg_out <= 1'h0; // @[Multiplier.scala 148:38]
      end
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      isMul <= cmdMul; // @[Multiplier.scala 155:11]
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      isHi <= cmdHi; // @[Multiplier.scala 156:10]
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      divisor <= _T_694; // @[Multiplier.scala 159:13]
    end else if (state == 3'h1) begin // @[Multiplier.scala 80:33]
      if (divisor[63] | isMul) begin // @[Multiplier.scala 84:34]
        divisor <= subtractor; // @[Multiplier.scala 85:15]
      end
    end
    if (_T_682) begin // @[Multiplier.scala 153:24]
      remainder <= {{66'd0}, lhs_in}; // @[Multiplier.scala 160:15]
    end else if (_T_160 & ~isMul) begin // @[Multiplier.scala 118:37]
      remainder <= {{1'd0}, _GEN_14};
    end else if (state == 3'h2 & isMul) begin // @[Multiplier.scala 98:36]
      remainder <= _T_214; // @[Multiplier.scala 111:15]
    end else if (state == 3'h3) begin // @[Multiplier.scala 94:31]
      remainder <= {{66'd0}, remainder[128:65]}; // @[Multiplier.scala 95:15]
    end else begin
      remainder <= _GEN_5;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  req_dw = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  req_tag = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  count = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  neg_out = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  isMul = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  isHi = _RAND_6[0:0];
  _RAND_7 = {3{`RANDOM}};
  divisor = _RAND_7[64:0];
  _RAND_8 = {5{`RANDOM}};
  remainder = _RAND_8[129:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RVCExpander(
  input  [31:0] io_in,
  output [31:0] io_out_bits,
  output [4:0]  io_out_rd,
  output [4:0]  io_out_rs1,
  output [4:0]  io_out_rs2,
  output [4:0]  io_out_rs3,
  output        io_rvc
);
  wire [6:0] _T_20 = io_in[12:5] != 8'h0 ? 7'h13 : 7'h1f; // @[RVC.scala 53:20]
  wire [4:0] _T_34 = {2'h1,io_in[4:2]}; // @[Cat.scala 30:58]
  wire [29:0] _T_38 = {io_in[10:7],io_in[12:11],io_in[5],io_in[6],2'h0,5'h2,3'h0,2'h1,io_in[4:2],_T_20}; // @[Cat.scala 30:58]
  wire [7:0] _T_63 = {io_in[6:5],io_in[12:10],3'h0}; // @[Cat.scala 30:58]
  wire [4:0] _T_66 = {2'h1,io_in[9:7]}; // @[Cat.scala 30:58]
  wire [27:0] _T_75 = {io_in[6:5],io_in[12:10],3'h0,2'h1,io_in[9:7],3'h3,2'h1,io_in[4:2],7'h7}; // @[Cat.scala 30:58]
  wire [6:0] _T_104 = {io_in[5],io_in[12:10],io_in[6],2'h0}; // @[Cat.scala 30:58]
  wire [26:0] _T_116 = {io_in[5],io_in[12:10],io_in[6],2'h0,2'h1,io_in[9:7],3'h2,2'h1,io_in[4:2],7'h3}; // @[Cat.scala 30:58]
  wire [27:0] _T_155 = {io_in[6:5],io_in[12:10],3'h0,2'h1,io_in[9:7],3'h3,2'h1,io_in[4:2],7'h3}; // @[Cat.scala 30:58]
  wire [26:0] _T_206 = {_T_104[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_104[4:0],7'h2f}; // @[Cat.scala 30:58]
  wire [27:0] _T_253 = {_T_63[7:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h3,_T_63[4:0],7'h27}; // @[Cat.scala 30:58]
  wire [26:0] _T_304 = {_T_104[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_104[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [27:0] _T_351 = {_T_63[7:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h3,_T_63[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [6:0] _T_378 = io_in[12] ? 7'h7f : 7'h0; // @[Bitwise.scala 71:12]
  wire [11:0] _T_380 = {_T_378,io_in[6:2]}; // @[Cat.scala 30:58]
  wire [31:0] _T_388 = {_T_378,io_in[6:2],io_in[11:7],3'h0,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire  _T_409 = io_in[11:7] != 5'h0; // @[RVC.scala 77:24]
  wire [6:0] _T_412 = io_in[11:7] != 5'h0 ? 7'h1b : 7'h1f; // @[RVC.scala 77:20]
  wire [31:0] _T_426 = {_T_378,io_in[6:2],io_in[11:7],3'h0,io_in[11:7],_T_412}; // @[Cat.scala 30:58]
  wire [31:0] _T_459 = {_T_378,io_in[6:2],5'h0,3'h0,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire  _T_486 = _T_380 != 12'h0; // @[RVC.scala 90:29]
  wire [6:0] _T_489 = _T_380 != 12'h0 ? 7'h37 : 7'h3f; // @[RVC.scala 90:20]
  wire [14:0] _T_494 = io_in[12] ? 15'h7fff : 15'h0; // @[Bitwise.scala 71:12]
  wire [31:0] _T_498 = {_T_494,io_in[6:2],12'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_502 = {_T_498[31:12],io_in[11:7],_T_489}; // @[Cat.scala 30:58]
  wire [6:0] _T_539 = _T_486 ? 7'h13 : 7'h1f; // @[RVC.scala 86:20]
  wire [2:0] _T_544 = io_in[12] ? 3'h7 : 3'h0; // @[Bitwise.scala 71:12]
  wire [31:0] _T_561 = {_T_544,io_in[4:3],io_in[5],io_in[2],io_in[6],4'h0,io_in[11:7],3'h0,io_in[11:7],_T_539}; // @[Cat.scala 30:58]
  wire [31:0] _T_580_bits = io_in[11:7] == 5'h0 | io_in[11:7] == 5'h2 ? _T_561 : _T_502; // @[RVC.scala 92:10]
  wire [4:0] _T_580_rd = io_in[11:7] == 5'h0 | io_in[11:7] == 5'h2 ? io_in[11:7] : io_in[11:7]; // @[RVC.scala 92:10]
  wire [4:0] _T_580_rs2 = io_in[11:7] == 5'h0 | io_in[11:7] == 5'h2 ? _T_34 : _T_34; // @[RVC.scala 92:10]
  wire [4:0] _T_580_rs3 = io_in[11:7] == 5'h0 | io_in[11:7] == 5'h2 ? io_in[31:27] : io_in[31:27]; // @[RVC.scala 92:10]
  wire [25:0] _T_600 = {io_in[12],io_in[6:2],2'h1,io_in[9:7],3'h5,2'h1,io_in[9:7],7'h13}; // @[Cat.scala 30:58]
  wire [30:0] _GEN_0 = {{5'd0}, _T_600}; // @[RVC.scala 99:23]
  wire [30:0] _T_617 = _GEN_0 | 31'h40000000; // @[RVC.scala 99:23]
  wire [31:0] _T_636 = {_T_378,io_in[6:2],2'h1,io_in[9:7],3'h7,2'h1,io_in[9:7],7'h13}; // @[Cat.scala 30:58]
  wire [2:0] _T_647 = {io_in[12],io_in[6:5]}; // @[Cat.scala 30:58]
  wire [2:0] _T_649 = _T_647 & 3'h3; // @[Package.scala 18:26]
  wire [2:0] _T_653 = _T_649 & 3'h1; // @[Package.scala 18:26]
  wire [1:0] _T_660 = _T_653 >= 3'h1 ? 2'h3 : 2'h2; // @[Package.scala 19:12]
  wire [1:0] _T_666 = _T_649 >= 3'h2 ? _T_660 : 2'h0; // @[Package.scala 19:12]
  wire [2:0] _T_675 = _T_653 >= 3'h1 ? 3'h7 : 3'h6; // @[Package.scala 19:12]
  wire [2:0] _T_680 = _T_653 >= 3'h1 ? 3'h4 : 3'h0; // @[Package.scala 19:12]
  wire [2:0] _T_681 = _T_649 >= 3'h2 ? _T_675 : _T_680; // @[Package.scala 19:12]
  wire [2:0] _T_682 = _T_647 >= 3'h4 ? {{1'd0}, _T_666} : _T_681; // @[Package.scala 19:12]
  wire [30:0] _T_688 = io_in[6:5] == 2'h0 ? 31'h40000000 : 31'h0; // @[RVC.scala 103:22]
  wire [6:0] _T_692 = io_in[12] ? 7'h3b : 7'h33; // @[RVC.scala 104:22]
  wire [24:0] _T_705 = {2'h1,io_in[4:2],2'h1,io_in[9:7],_T_682,2'h1,io_in[9:7],_T_692}; // @[Cat.scala 30:58]
  wire [30:0] _GEN_1 = {{6'd0}, _T_705}; // @[RVC.scala 105:43]
  wire [30:0] _T_706 = _GEN_1 | _T_688; // @[RVC.scala 105:43]
  wire [1:0] _T_709 = io_in[11:10] & 2'h1; // @[Package.scala 18:26]
  wire [31:0] _T_716 = _T_709 >= 2'h1 ? {{1'd0}, _T_706} : _T_636; // @[Package.scala 19:12]
  wire [30:0] _T_721 = _T_709 >= 2'h1 ? _T_617 : {{5'd0}, _T_600}; // @[Package.scala 19:12]
  wire [31:0] _T_722 = io_in[11:10] >= 2'h2 ? _T_716 : {{1'd0}, _T_721}; // @[Package.scala 19:12]
  wire [9:0] _T_749 = io_in[12] ? 10'h3ff : 10'h0; // @[Bitwise.scala 71:12]
  wire [20:0] _T_765 = {_T_749,io_in[8],io_in[10:9],io_in[6],io_in[7],io_in[2],io_in[11],io_in[5:3],1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_839 = {_T_765[20],_T_765[10:1],_T_765[11],_T_765[19:12],5'h0,7'h6f}; // @[Cat.scala 30:58]
  wire [4:0] _T_864 = io_in[12] ? 5'h1f : 5'h0; // @[Bitwise.scala 71:12]
  wire [12:0] _T_874 = {_T_864,io_in[6:5],io_in[2],io_in[11:10],io_in[4:3],1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_936 = {_T_874[12],_T_874[10:5],5'h0,2'h1,io_in[9:7],3'h0,_T_874[4:1],_T_874[11],7'h63}; // @[Cat.scala 30:58]
  wire [31:0] _T_1033 = {_T_874[12],_T_874[10:5],5'h0,2'h1,io_in[9:7],3'h1,_T_874[4:1],_T_874[11],7'h63}; // @[Cat.scala 30:58]
  wire [25:0] _T_1062 = {io_in[12],io_in[6:2],io_in[11:7],3'h1,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire [28:0] _T_1093 = {io_in[4:2],io_in[12],io_in[6:5],3'h0,5'h2,3'h3,io_in[11:7],7'h7}; // @[Cat.scala 30:58]
  wire [27:0] _T_1124 = {io_in[3:2],io_in[12],io_in[6:4],2'h0,5'h2,3'h2,io_in[11:7],7'h3}; // @[Cat.scala 30:58]
  wire [28:0] _T_1155 = {io_in[4:2],io_in[12],io_in[6:5],3'h0,5'h2,3'h3,io_in[11:7],7'h3}; // @[Cat.scala 30:58]
  wire [24:0] _T_1180 = {io_in[6:2],5'h0,3'h0,io_in[11:7],7'h33}; // @[Cat.scala 30:58]
  wire [24:0] _T_1205 = {io_in[6:2],io_in[11:7],3'h0,io_in[11:7],7'h33}; // @[Cat.scala 30:58]
  wire [24:0] _T_1230 = {io_in[6:2],io_in[11:7],3'h0,12'h67}; // @[Cat.scala 30:58]
  wire [24:0] _T_1233 = {_T_1230[24:7],7'h1f}; // @[Cat.scala 30:58]
  wire [24:0] _T_1237 = _T_409 ? _T_1230 : _T_1233; // @[RVC.scala 133:33]
  wire  _T_1256 = io_in[6:2] != 5'h0; // @[RVC.scala 134:27]
  wire [31:0] _T_1191_bits = {{7'd0}, _T_1180}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1248_bits = {{7'd0}, _T_1237}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1257_bits = io_in[6:2] != 5'h0 ? _T_1191_bits : _T_1248_bits; // @[RVC.scala 134:22]
  wire [4:0] _T_1257_rd = io_in[6:2] != 5'h0 ? io_in[11:7] : 5'h0; // @[RVC.scala 134:22]
  wire [4:0] _T_1257_rs1 = io_in[6:2] != 5'h0 ? 5'h0 : io_in[11:7]; // @[RVC.scala 134:22]
  wire [4:0] _T_1257_rs2 = io_in[6:2] != 5'h0 ? io_in[6:2] : io_in[6:2]; // @[RVC.scala 134:22]
  wire [4:0] _T_1257_rs3 = io_in[6:2] != 5'h0 ? io_in[31:27] : io_in[31:27]; // @[RVC.scala 134:22]
  wire [24:0] _T_1271 = {io_in[6:2],io_in[11:7],3'h0,12'he7}; // @[Cat.scala 30:58]
  wire [24:0] _T_1274 = {_T_1230[24:7],7'h73}; // @[Cat.scala 30:58]
  wire [24:0] _T_1276 = _T_1274 | 25'h100000; // @[RVC.scala 136:47]
  wire [24:0] _T_1280 = _T_409 ? _T_1271 : _T_1276; // @[RVC.scala 137:33]
  wire [31:0] _T_1216_bits = {{7'd0}, _T_1205}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1291_bits = {{7'd0}, _T_1280}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1300_bits = _T_1256 ? _T_1216_bits : _T_1291_bits; // @[RVC.scala 138:25]
  wire [4:0] _T_1300_rd = _T_1256 ? io_in[11:7] : 5'h1; // @[RVC.scala 138:25]
  wire [4:0] _T_1300_rs1 = _T_1256 ? io_in[11:7] : io_in[11:7]; // @[RVC.scala 138:25]
  wire [31:0] _T_1307_bits = io_in[12] ? _T_1300_bits : _T_1257_bits; // @[RVC.scala 139:10]
  wire [4:0] _T_1307_rd = io_in[12] ? _T_1300_rd : _T_1257_rd; // @[RVC.scala 139:10]
  wire [4:0] _T_1307_rs1 = io_in[12] ? _T_1300_rs1 : _T_1257_rs1; // @[RVC.scala 139:10]
  wire [4:0] _T_1307_rs2 = io_in[12] ? _T_1257_rs2 : _T_1257_rs2; // @[RVC.scala 139:10]
  wire [4:0] _T_1307_rs3 = io_in[12] ? _T_1257_rs3 : _T_1257_rs3; // @[RVC.scala 139:10]
  wire [8:0] _T_1317 = {io_in[9:7],io_in[12:10],3'h0}; // @[Cat.scala 30:58]
  wire [28:0] _T_1333 = {_T_1317[8:5],io_in[6:2],5'h2,3'h3,_T_1317[4:0],7'h27}; // @[Cat.scala 30:58]
  wire [7:0] _T_1354 = {io_in[8:7],io_in[12:9],2'h0}; // @[Cat.scala 30:58]
  wire [27:0] _T_1370 = {_T_1354[7:5],io_in[6:2],5'h2,3'h2,_T_1354[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [28:0] _T_1407 = {_T_1317[8:5],io_in[6:2],5'h2,3'h3,_T_1317[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [4:0] _T_1554 = {io_in[1:0],io_in[15:13]}; // @[Cat.scala 30:58]
  wire [4:0] _T_1556 = _T_1554 & 5'hf; // @[Package.scala 18:26]
  wire [4:0] _T_1560 = _T_1556 & 5'h7; // @[Package.scala 18:26]
  wire [4:0] _T_1564 = _T_1560 & 5'h3; // @[Package.scala 18:26]
  wire [4:0] _T_1568 = _T_1564 & 5'h1; // @[Package.scala 18:26]
  wire [4:0] _T_1575_rd = _T_1568 >= 5'h1 ? io_in[11:7] : io_in[11:7]; // @[Package.scala 19:12]
  wire [4:0] _T_1575_rs1 = _T_1568 >= 5'h1 ? io_in[19:15] : io_in[19:15]; // @[Package.scala 19:12]
  wire [4:0] _T_1575_rs2 = _T_1568 >= 5'h1 ? io_in[24:20] : io_in[24:20]; // @[Package.scala 19:12]
  wire [4:0] _T_1575_rs3 = _T_1568 >= 5'h1 ? io_in[31:27] : io_in[31:27]; // @[Package.scala 19:12]
  wire [4:0] _T_1591_rd = _T_1564 >= 5'h2 ? _T_1575_rd : _T_1575_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1591_rs1 = _T_1564 >= 5'h2 ? _T_1575_rs1 : _T_1575_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1591_rs2 = _T_1564 >= 5'h2 ? _T_1575_rs2 : _T_1575_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1591_rs3 = _T_1564 >= 5'h2 ? _T_1575_rs3 : _T_1575_rs3; // @[Package.scala 19:12]
  wire [4:0] _T_1627_rd = _T_1560 >= 5'h4 ? _T_1591_rd : _T_1591_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1627_rs1 = _T_1560 >= 5'h4 ? _T_1591_rs1 : _T_1591_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1627_rs2 = _T_1560 >= 5'h4 ? _T_1591_rs2 : _T_1591_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1627_rs3 = _T_1560 >= 5'h4 ? _T_1591_rs3 : _T_1591_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_1418_bits = {{3'd0}, _T_1407}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1381_bits = {{4'd0}, _T_1370}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1645_bits = _T_1568 >= 5'h1 ? _T_1418_bits : _T_1381_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1645_rs2 = _T_1568 >= 5'h1 ? io_in[6:2] : io_in[6:2]; // @[Package.scala 19:12]
  wire [31:0] _T_1344_bits = {{3'd0}, _T_1333}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1655_bits = _T_1568 >= 5'h1 ? _T_1344_bits : _T_1307_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1655_rd = _T_1568 >= 5'h1 ? io_in[11:7] : _T_1307_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1655_rs1 = _T_1568 >= 5'h1 ? 5'h2 : _T_1307_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1655_rs2 = _T_1568 >= 5'h1 ? io_in[6:2] : _T_1307_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1655_rs3 = _T_1568 >= 5'h1 ? io_in[31:27] : _T_1307_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_1661_bits = _T_1564 >= 5'h2 ? _T_1645_bits : _T_1655_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1661_rd = _T_1564 >= 5'h2 ? _T_1575_rd : _T_1655_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1661_rs1 = _T_1564 >= 5'h2 ? 5'h2 : _T_1655_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1661_rs2 = _T_1564 >= 5'h2 ? _T_1645_rs2 : _T_1655_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1661_rs3 = _T_1564 >= 5'h2 ? _T_1575_rs3 : _T_1655_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_1166_bits = {{3'd0}, _T_1155}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1135_bits = {{4'd0}, _T_1124}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1675_bits = _T_1568 >= 5'h1 ? _T_1166_bits : _T_1135_bits; // @[Package.scala 19:12]
  wire [31:0] _T_1104_bits = {{3'd0}, _T_1093}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1073_bits = {{6'd0}, _T_1062}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1685_bits = _T_1568 >= 5'h1 ? _T_1104_bits : _T_1073_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1685_rs1 = _T_1568 >= 5'h1 ? 5'h2 : io_in[11:7]; // @[Package.scala 19:12]
  wire [31:0] _T_1691_bits = _T_1564 >= 5'h2 ? _T_1675_bits : _T_1685_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1691_rs1 = _T_1564 >= 5'h2 ? 5'h2 : _T_1685_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1691_rs2 = _T_1564 >= 5'h2 ? _T_1645_rs2 : _T_1645_rs2; // @[Package.scala 19:12]
  wire [31:0] _T_1697_bits = _T_1560 >= 5'h4 ? _T_1661_bits : _T_1691_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1697_rd = _T_1560 >= 5'h4 ? _T_1661_rd : _T_1591_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1697_rs1 = _T_1560 >= 5'h4 ? _T_1661_rs1 : _T_1691_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1697_rs2 = _T_1560 >= 5'h4 ? _T_1661_rs2 : _T_1691_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1697_rs3 = _T_1560 >= 5'h4 ? _T_1661_rs3 : _T_1591_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_1703_bits = _T_1556 >= 5'h8 ? io_in : _T_1697_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1703_rd = _T_1556 >= 5'h8 ? _T_1627_rd : _T_1697_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1703_rs1 = _T_1556 >= 5'h8 ? _T_1627_rs1 : _T_1697_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1703_rs2 = _T_1556 >= 5'h8 ? _T_1627_rs2 : _T_1697_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1703_rs3 = _T_1556 >= 5'h8 ? _T_1627_rs3 : _T_1697_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_1725_bits = _T_1568 >= 5'h1 ? _T_1033 : _T_936; // @[Package.scala 19:12]
  wire [4:0] _T_1725_rd = _T_1568 >= 5'h1 ? 5'h0 : _T_66; // @[Package.scala 19:12]
  wire [4:0] _T_1725_rs1 = _T_1568 >= 5'h1 ? _T_66 : _T_66; // @[Package.scala 19:12]
  wire [31:0] _T_1735_bits = _T_1568 >= 5'h1 ? _T_839 : _T_722; // @[Package.scala 19:12]
  wire [4:0] _T_1735_rs2 = _T_1568 >= 5'h1 ? _T_34 : _T_34; // @[Package.scala 19:12]
  wire [31:0] _T_1741_bits = _T_1564 >= 5'h2 ? _T_1725_bits : _T_1735_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1741_rd = _T_1564 >= 5'h2 ? _T_1725_rd : _T_1725_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1741_rs1 = _T_1564 >= 5'h2 ? _T_1725_rs1 : _T_1725_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1741_rs2 = _T_1564 >= 5'h2 ? 5'h0 : _T_1735_rs2; // @[Package.scala 19:12]
  wire [31:0] _T_1755_bits = _T_1568 >= 5'h1 ? _T_580_bits : _T_459; // @[Package.scala 19:12]
  wire [4:0] _T_1755_rd = _T_1568 >= 5'h1 ? _T_580_rd : io_in[11:7]; // @[Package.scala 19:12]
  wire [4:0] _T_1755_rs1 = _T_1568 >= 5'h1 ? _T_580_rd : 5'h0; // @[Package.scala 19:12]
  wire [4:0] _T_1755_rs2 = _T_1568 >= 5'h1 ? _T_580_rs2 : _T_34; // @[Package.scala 19:12]
  wire [4:0] _T_1755_rs3 = _T_1568 >= 5'h1 ? _T_580_rs3 : io_in[31:27]; // @[Package.scala 19:12]
  wire [31:0] _T_1765_bits = _T_1568 >= 5'h1 ? _T_426 : _T_388; // @[Package.scala 19:12]
  wire [31:0] _T_1771_bits = _T_1564 >= 5'h2 ? _T_1755_bits : _T_1765_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1771_rd = _T_1564 >= 5'h2 ? _T_1755_rd : _T_1575_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1771_rs1 = _T_1564 >= 5'h2 ? _T_1755_rs1 : _T_1575_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1771_rs2 = _T_1564 >= 5'h2 ? _T_1755_rs2 : _T_1735_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1771_rs3 = _T_1564 >= 5'h2 ? _T_1755_rs3 : _T_1575_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_1777_bits = _T_1560 >= 5'h4 ? _T_1741_bits : _T_1771_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1777_rd = _T_1560 >= 5'h4 ? _T_1741_rd : _T_1771_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1777_rs1 = _T_1560 >= 5'h4 ? _T_1741_rs1 : _T_1771_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1777_rs2 = _T_1560 >= 5'h4 ? _T_1741_rs2 : _T_1771_rs2; // @[Package.scala 19:12]
  wire [4:0] _T_1777_rs3 = _T_1560 >= 5'h4 ? _T_1591_rs3 : _T_1771_rs3; // @[Package.scala 19:12]
  wire [31:0] _T_368_bits = {{4'd0}, _T_351}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_321_bits = {{5'd0}, _T_304}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1795_bits = _T_1568 >= 5'h1 ? _T_368_bits : _T_321_bits; // @[Package.scala 19:12]
  wire [31:0] _T_270_bits = {{4'd0}, _T_253}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_223_bits = {{5'd0}, _T_206}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1805_bits = _T_1568 >= 5'h1 ? _T_270_bits : _T_223_bits; // @[Package.scala 19:12]
  wire [31:0] _T_1811_bits = _T_1564 >= 5'h2 ? _T_1795_bits : _T_1805_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1811_rd = _T_1564 >= 5'h2 ? _T_1735_rs2 : _T_1735_rs2; // @[Package.scala 19:12]
  wire [31:0] _T_172_bits = {{4'd0}, _T_155}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_133_bits = {{5'd0}, _T_116}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1825_bits = _T_1568 >= 5'h1 ? _T_172_bits : _T_133_bits; // @[Package.scala 19:12]
  wire [31:0] _T_92_bits = {{4'd0}, _T_75}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_53_bits = {{2'd0}, _T_38}; // @[RVC.scala 21:19 RVC.scala 22:14]
  wire [31:0] _T_1835_bits = _T_1568 >= 5'h1 ? _T_92_bits : _T_53_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1835_rs1 = _T_1568 >= 5'h1 ? _T_66 : 5'h2; // @[Package.scala 19:12]
  wire [31:0] _T_1841_bits = _T_1564 >= 5'h2 ? _T_1825_bits : _T_1835_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1841_rs1 = _T_1564 >= 5'h2 ? _T_1725_rs1 : _T_1835_rs1; // @[Package.scala 19:12]
  wire [31:0] _T_1847_bits = _T_1560 >= 5'h4 ? _T_1811_bits : _T_1841_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1847_rd = _T_1560 >= 5'h4 ? _T_1811_rd : _T_1811_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1847_rs1 = _T_1560 >= 5'h4 ? _T_1741_rs1 : _T_1841_rs1; // @[Package.scala 19:12]
  wire [31:0] _T_1853_bits = _T_1556 >= 5'h8 ? _T_1777_bits : _T_1847_bits; // @[Package.scala 19:12]
  wire [4:0] _T_1853_rd = _T_1556 >= 5'h8 ? _T_1777_rd : _T_1847_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1853_rs1 = _T_1556 >= 5'h8 ? _T_1777_rs1 : _T_1847_rs1; // @[Package.scala 19:12]
  wire [4:0] _T_1853_rs2 = _T_1556 >= 5'h8 ? _T_1777_rs2 : _T_1847_rd; // @[Package.scala 19:12]
  wire [4:0] _T_1853_rs3 = _T_1556 >= 5'h8 ? _T_1777_rs3 : _T_1627_rs3; // @[Package.scala 19:12]
  assign io_out_bits = _T_1554 >= 5'h10 ? _T_1703_bits : _T_1853_bits; // @[Package.scala 19:12]
  assign io_out_rd = _T_1554 >= 5'h10 ? _T_1703_rd : _T_1853_rd; // @[Package.scala 19:12]
  assign io_out_rs1 = _T_1554 >= 5'h10 ? _T_1703_rs1 : _T_1853_rs1; // @[Package.scala 19:12]
  assign io_out_rs2 = _T_1554 >= 5'h10 ? _T_1703_rs2 : _T_1853_rs2; // @[Package.scala 19:12]
  assign io_out_rs3 = _T_1554 >= 5'h10 ? _T_1703_rs3 : _T_1853_rs3; // @[Package.scala 19:12]
  assign io_rvc = io_in[1:0] != 2'h3; // @[RVC.scala 162:26]
endmodule
