module SimpleLitModule(
  input         clock,
  input         reset,
  input  [63:0] io_i_r_node,
  input         io_i_b,
  input  [15:0] io_i_cGenL_real,
  input  [15:0] io_i_cGenL_imag,
  input  [7:0]  io_i_cFS_real,
  input  [7:0]  io_i_cFS_imag,
  input  [63:0] io_i_cR_real_node,
  input  [63:0] io_i_cR_imag_node,
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
  output [63:0] io_o_r_node,
  output        io_o_b,
  output [15:0] io_o_cGenL_real,
  output [15:0] io_o_cGenL_imag,
  output [7:0]  io_o_cFS_real,
  output [7:0]  io_o_cFS_imag,
  output [63:0] io_o_cR_real_node,
  output [63:0] io_o_cR_imag_node,
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
  wire [7:0] _GEN_1 = 4'h1 == io_i_short_u[3:0] ? $signed(-8'sh23) : $signed(-8'sh35); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_2 = 4'h2 == io_i_short_u[3:0] ? $signed(-8'sh12) : $signed(_GEN_1); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_3 = 4'h3 == io_i_short_u[3:0] ? $signed(-8'sh9) : $signed(_GEN_2); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_4 = 4'h4 == io_i_short_u[3:0] ? $signed(-8'sh6) : $signed(_GEN_3); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_5 = 4'h5 == io_i_short_u[3:0] ? $signed(8'sh6) : $signed(_GEN_4); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_6 = 4'h6 == io_i_short_u[3:0] ? $signed(8'sh9) : $signed(_GEN_5); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_7 = 4'h7 == io_i_short_u[3:0] ? $signed(8'sh12) : $signed(_GEN_6); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_8 = 4'h8 == io_i_short_u[3:0] ? $signed(8'sh23) : $signed(_GEN_7); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  wire [7:0] _GEN_11 = 4'h1 == io_i_short_u[3:0] ? $signed(-8'sh2) : $signed(-8'sh3); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_12 = 4'h2 == io_i_short_u[3:0] ? $signed(-8'sh1) : $signed(_GEN_11); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_13 = 4'h3 == io_i_short_u[3:0] ? $signed(-8'sh1) : $signed(_GEN_12); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_14 = 4'h4 == io_i_short_u[3:0] ? $signed(8'sh0) : $signed(_GEN_13); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_15 = 4'h5 == io_i_short_u[3:0] ? $signed(8'sh0) : $signed(_GEN_14); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_16 = 4'h6 == io_i_short_u[3:0] ? $signed(8'sh1) : $signed(_GEN_15); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_17 = 4'h7 == io_i_short_u[3:0] ? $signed(8'sh1) : $signed(_GEN_16); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  wire [7:0] _GEN_18 = 4'h8 == io_i_short_u[3:0] ? $signed(8'sh2) : $signed(_GEN_17); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  assign io_o_r_node = 64'h0;
  assign io_o_b = 1'h0;
  assign io_o_cGenL_real = 16'sh0;
  assign io_o_cGenL_imag = 16'sh0;
  assign io_o_cFS_real = 8'sh0;
  assign io_o_cFS_imag = 8'sh0;
  assign io_o_cR_real_node = 64'h0;
  assign io_o_cR_imag_node = 64'h0;
  assign io_o_short_gen = 4'h9 == io_i_short_u[3:0] ? $signed(8'sh35) : $signed(_GEN_8); // @[SimpleTBwGenTypeOption.scala 173:18 SimpleTBwGenTypeOption.scala 173:18]
  assign io_o_short_s = 4'h9 == io_i_short_u[3:0] ? $signed(8'sh3) : $signed(_GEN_18); // @[SimpleTBwGenTypeOption.scala 174:16 SimpleTBwGenTypeOption.scala 174:16]
  assign io_o_short_f = 8'sh0;
  assign io_o_short_u = 8'h0;
  assign io_o_long_gen = 16'sh0;
  assign io_o_long_s = 16'sh0;
  assign io_o_long_f = 16'sh0;
  assign io_o_long_u = 16'h0;
  assign io_o_vU_0 = 8'h0;
  assign io_o_vU_1 = 8'h0;
  assign io_o_vU_2 = 8'h0;
  assign io_o_vU_3 = 8'h0;
  assign io_o_vU_4 = 8'h0;
  assign io_o_vU_5 = 8'h0;
  assign io_o_vU_6 = 8'h0;
  assign io_o_vU_7 = 8'h0;
  assign io_o_vU_8 = 8'h0;
  assign io_o_vU_9 = 8'h0;
  assign io_o_vS_0 = 8'sh0;
  assign io_o_vS_1 = 8'sh0;
  assign io_o_vS_2 = 8'sh0;
  assign io_o_vS_3 = 8'sh0;
  assign io_o_vS_4 = 8'sh0;
  assign io_o_vS_5 = 8'sh0;
  assign io_o_vS_6 = 8'sh0;
  assign io_o_vS_7 = 8'sh0;
  assign io_o_vS_8 = 8'sh0;
  assign io_o_vS_9 = 8'sh0;
  assign io_o_vF_0 = 8'sh0;
  assign io_o_vF_1 = 8'sh0;
  assign io_o_vF_2 = 8'sh0;
  assign io_o_vF_3 = 8'sh0;
  assign io_o_vF_4 = 8'sh0;
  assign io_o_vF_5 = 8'sh0;
  assign io_o_vF_6 = 8'sh0;
  assign io_o_vF_7 = 8'sh0;
  assign io_o_vF_8 = 8'sh0;
  assign io_o_vF_9 = 8'sh0;
endmodule
