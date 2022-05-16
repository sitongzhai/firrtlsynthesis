module SimpleIOModule(
  input         clock,
  input         reset,
  input         io_i_b,
  input  [15:0] io_i_cGenL_real,
  input  [15:0] io_i_cGenL_imag,
  input  [7:0]  io_i_cFS_real,
  input  [7:0]  io_i_cFS_imag,
  input  [7:0]  io_i_short_gen,
  input  [7:0]  io_i_short_s,
  input  [7:0]  io_i_short_f,
  input  [7:0]  io_i_short_u,
  input  [15:0] io_i_long_gen,
  input  [15:0] io_i_long_s,
  input  [15:0] io_i_long_f,
  input  [15:0] io_i_long_u,
  input  [7:0]  io_i_vU_0,
  input  [7:0]  io_i_vU_1,
  input  [7:0]  io_i_vU_2,
  input  [7:0]  io_i_vU_3,
  input  [7:0]  io_i_vU_4,
  input  [7:0]  io_i_vU_5,
  input  [7:0]  io_i_vU_6,
  input  [7:0]  io_i_vU_7,
  input  [7:0]  io_i_vU_8,
  input  [7:0]  io_i_vU_9,
  input  [7:0]  io_i_vS_0,
  input  [7:0]  io_i_vS_1,
  input  [7:0]  io_i_vS_2,
  input  [7:0]  io_i_vS_3,
  input  [7:0]  io_i_vS_4,
  input  [7:0]  io_i_vS_5,
  input  [7:0]  io_i_vS_6,
  input  [7:0]  io_i_vS_7,
  input  [7:0]  io_i_vS_8,
  input  [7:0]  io_i_vS_9,
  input  [7:0]  io_i_vF_0,
  input  [7:0]  io_i_vF_1,
  input  [7:0]  io_i_vF_2,
  input  [7:0]  io_i_vF_3,
  input  [7:0]  io_i_vF_4,
  input  [7:0]  io_i_vF_5,
  input  [7:0]  io_i_vF_6,
  input  [7:0]  io_i_vF_7,
  input  [7:0]  io_i_vF_8,
  input  [7:0]  io_i_vF_9,
  output        io_o_b,
  output [15:0] io_o_cGenL_real,
  output [15:0] io_o_cGenL_imag,
  output [7:0]  io_o_cFS_real,
  output [7:0]  io_o_cFS_imag,
  output [7:0]  io_o_short_gen,
  output [7:0]  io_o_short_s,
  output [7:0]  io_o_short_f,
  output [7:0]  io_o_short_u,
  output [15:0] io_o_long_gen,
  output [15:0] io_o_long_s,
  output [15:0] io_o_long_f,
  output [15:0] io_o_long_u,
  output [7:0]  io_o_vU_0,
  output [7:0]  io_o_vU_1,
  output [7:0]  io_o_vU_2,
  output [7:0]  io_o_vU_3,
  output [7:0]  io_o_vU_4,
  output [7:0]  io_o_vU_5,
  output [7:0]  io_o_vU_6,
  output [7:0]  io_o_vU_7,
  output [7:0]  io_o_vU_8,
  output [7:0]  io_o_vU_9,
  output [7:0]  io_o_vS_0,
  output [7:0]  io_o_vS_1,
  output [7:0]  io_o_vS_2,
  output [7:0]  io_o_vS_3,
  output [7:0]  io_o_vS_4,
  output [7:0]  io_o_vS_5,
  output [7:0]  io_o_vS_6,
  output [7:0]  io_o_vS_7,
  output [7:0]  io_o_vS_8,
  output [7:0]  io_o_vS_9,
  output [7:0]  io_o_vF_0,
  output [7:0]  io_o_vF_1,
  output [7:0]  io_o_vF_2,
  output [7:0]  io_o_vF_3,
  output [7:0]  io_o_vF_4,
  output [7:0]  io_o_vF_5,
  output [7:0]  io_o_vF_6,
  output [7:0]  io_o_vF_7,
  output [7:0]  io_o_vF_8,
  output [7:0]  io_o_vF_9
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] _T_49_gen; // @[SimpleTBwGenTypeOption.scala 121:23]
  reg [7:0] _T_49_s; // @[SimpleTBwGenTypeOption.scala 121:23]
  reg [7:0] _T_49_f; // @[SimpleTBwGenTypeOption.scala 121:23]
  reg [7:0] _T_49_u; // @[SimpleTBwGenTypeOption.scala 121:23]
  reg [15:0] _T_51_gen; // @[SimpleTBwGenTypeOption.scala 122:24]
  reg [15:0] _T_51_s; // @[SimpleTBwGenTypeOption.scala 122:24]
  reg [15:0] _T_51_f; // @[SimpleTBwGenTypeOption.scala 122:24]
  reg [15:0] _T_51_u; // @[SimpleTBwGenTypeOption.scala 122:24]
  reg  _T_53; // @[SimpleTBwGenTypeOption.scala 125:20]
  reg [15:0] _T_59_real; // @[SimpleTBwGenTypeOption.scala 126:24]
  reg [15:0] _T_59_imag; // @[SimpleTBwGenTypeOption.scala 126:24]
  reg [7:0] _T_65_real; // @[SimpleTBwGenTypeOption.scala 127:22]
  reg [7:0] _T_65_imag; // @[SimpleTBwGenTypeOption.scala 127:22]
  reg [7:0] _T_79_0; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_1; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_2; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_3; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_4; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_5; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_6; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_7; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_8; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_79_9; // @[SimpleTBwGenTypeOption.scala 130:21]
  reg [7:0] _T_116_0; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_1; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_2; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_3; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_4; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_5; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_6; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_7; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_8; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_116_9; // @[SimpleTBwGenTypeOption.scala 131:21]
  reg [7:0] _T_153_0; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_1; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_2; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_3; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_4; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_5; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_6; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_7; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_8; // @[SimpleTBwGenTypeOption.scala 132:21]
  reg [7:0] _T_153_9; // @[SimpleTBwGenTypeOption.scala 132:21]
  wire [11:0] _GEN_0 = _T_51_gen[15:4]; // @[SimpleTBwGenTypeOption.scala 122:14]
  wire [11:0] _GEN_3 = _T_51_f[15:4]; // @[SimpleTBwGenTypeOption.scala 122:14]
  wire [11:0] _GEN_5 = {$signed(_T_49_gen), 4'h0}; // @[SimpleTBwGenTypeOption.scala 121:13]
  wire [11:0] _GEN_6 = {$signed(_T_49_f), 4'h0}; // @[SimpleTBwGenTypeOption.scala 121:13]
  assign io_o_b = _T_53; // @[SimpleTBwGenTypeOption.scala 125:10]
  assign io_o_cGenL_real = _T_59_real; // @[SimpleTBwGenTypeOption.scala 126:14]
  assign io_o_cGenL_imag = _T_59_imag; // @[SimpleTBwGenTypeOption.scala 126:14]
  assign io_o_cFS_real = _T_65_real; // @[SimpleTBwGenTypeOption.scala 127:12]
  assign io_o_cFS_imag = _T_65_imag; // @[SimpleTBwGenTypeOption.scala 127:12]
  assign io_o_short_gen = _GEN_0[7:0]; // @[SimpleTBwGenTypeOption.scala 122:14]
  assign io_o_short_s = _T_51_s[7:0]; // @[SimpleTBwGenTypeOption.scala 122:14]
  assign io_o_short_f = _GEN_3[7:0]; // @[SimpleTBwGenTypeOption.scala 122:14]
  assign io_o_short_u = _T_51_u[7:0]; // @[SimpleTBwGenTypeOption.scala 122:14]
  assign io_o_long_gen = {{4{_GEN_5[11]}},_GEN_5}; // @[SimpleTBwGenTypeOption.scala 121:13]
  assign io_o_long_s = {{8{_T_49_s[7]}},_T_49_s}; // @[SimpleTBwGenTypeOption.scala 121:13]
  assign io_o_long_f = {{4{_GEN_6[11]}},_GEN_6}; // @[SimpleTBwGenTypeOption.scala 121:13]
  assign io_o_long_u = {{8'd0}, _T_49_u}; // @[SimpleTBwGenTypeOption.scala 121:13]
  assign io_o_vU_0 = _T_79_0; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_1 = _T_79_1; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_2 = _T_79_2; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_3 = _T_79_3; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_4 = _T_79_4; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_5 = _T_79_5; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_6 = _T_79_6; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_7 = _T_79_7; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_8 = _T_79_8; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vU_9 = _T_79_9; // @[SimpleTBwGenTypeOption.scala 130:11]
  assign io_o_vS_0 = _T_116_0; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_1 = _T_116_1; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_2 = _T_116_2; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_3 = _T_116_3; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_4 = _T_116_4; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_5 = _T_116_5; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_6 = _T_116_6; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_7 = _T_116_7; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_8 = _T_116_8; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vS_9 = _T_116_9; // @[SimpleTBwGenTypeOption.scala 131:11]
  assign io_o_vF_0 = _T_153_0; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_1 = _T_153_1; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_2 = _T_153_2; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_3 = _T_153_3; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_4 = _T_153_4; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_5 = _T_153_5; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_6 = _T_153_6; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_7 = _T_153_7; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_8 = _T_153_8; // @[SimpleTBwGenTypeOption.scala 132:11]
  assign io_o_vF_9 = _T_153_9; // @[SimpleTBwGenTypeOption.scala 132:11]
  always @(posedge clock) begin
    _T_49_gen <= io_i_short_gen; // @[SimpleTBwGenTypeOption.scala 121:23]
    _T_49_s <= io_i_short_s; // @[SimpleTBwGenTypeOption.scala 121:23]
    _T_49_f <= io_i_short_f; // @[SimpleTBwGenTypeOption.scala 121:23]
    _T_49_u <= io_i_short_u; // @[SimpleTBwGenTypeOption.scala 121:23]
    _T_51_gen <= io_i_long_gen; // @[SimpleTBwGenTypeOption.scala 122:24]
    _T_51_s <= io_i_long_s; // @[SimpleTBwGenTypeOption.scala 122:24]
    _T_51_f <= io_i_long_f; // @[SimpleTBwGenTypeOption.scala 122:24]
    _T_51_u <= io_i_long_u; // @[SimpleTBwGenTypeOption.scala 122:24]
    _T_53 <= io_i_b; // @[SimpleTBwGenTypeOption.scala 125:20]
    _T_59_real <= io_i_cGenL_real; // @[SimpleTBwGenTypeOption.scala 126:24]
    _T_59_imag <= io_i_cGenL_imag; // @[SimpleTBwGenTypeOption.scala 126:24]
    _T_65_real <= io_i_cFS_real; // @[SimpleTBwGenTypeOption.scala 127:22]
    _T_65_imag <= io_i_cFS_imag; // @[SimpleTBwGenTypeOption.scala 127:22]
    _T_79_0 <= io_i_vU_0; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_1 <= io_i_vU_1; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_2 <= io_i_vU_2; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_3 <= io_i_vU_3; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_4 <= io_i_vU_4; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_5 <= io_i_vU_5; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_6 <= io_i_vU_6; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_7 <= io_i_vU_7; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_8 <= io_i_vU_8; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_79_9 <= io_i_vU_9; // @[SimpleTBwGenTypeOption.scala 130:21]
    _T_116_0 <= io_i_vS_0; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_1 <= io_i_vS_1; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_2 <= io_i_vS_2; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_3 <= io_i_vS_3; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_4 <= io_i_vS_4; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_5 <= io_i_vS_5; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_6 <= io_i_vS_6; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_7 <= io_i_vS_7; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_8 <= io_i_vS_8; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_116_9 <= io_i_vS_9; // @[SimpleTBwGenTypeOption.scala 131:21]
    _T_153_0 <= io_i_vF_0; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_1 <= io_i_vF_1; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_2 <= io_i_vF_2; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_3 <= io_i_vF_3; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_4 <= io_i_vF_4; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_5 <= io_i_vF_5; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_6 <= io_i_vF_6; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_7 <= io_i_vF_7; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_8 <= io_i_vF_8; // @[SimpleTBwGenTypeOption.scala 132:21]
    _T_153_9 <= io_i_vF_9; // @[SimpleTBwGenTypeOption.scala 132:21]
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
  _T_49_gen = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  _T_49_s = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  _T_49_f = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  _T_49_u = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  _T_51_gen = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  _T_51_s = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  _T_51_f = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  _T_51_u = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  _T_53 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_59_real = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  _T_59_imag = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  _T_65_real = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  _T_65_imag = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  _T_79_0 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  _T_79_1 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  _T_79_2 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  _T_79_3 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  _T_79_4 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  _T_79_5 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  _T_79_6 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  _T_79_7 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  _T_79_8 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  _T_79_9 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  _T_116_0 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  _T_116_1 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  _T_116_2 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  _T_116_3 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  _T_116_4 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  _T_116_5 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  _T_116_6 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  _T_116_7 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  _T_116_8 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  _T_116_9 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  _T_153_0 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  _T_153_1 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  _T_153_2 = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  _T_153_3 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  _T_153_4 = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  _T_153_5 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  _T_153_6 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  _T_153_7 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  _T_153_8 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  _T_153_9 = _RAND_42[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
