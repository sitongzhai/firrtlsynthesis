module LogicOp(
  input        clock,
  input        reset,
  input  [8:0] io_u0,
  input  [7:0] io_u1,
  input  [5:0] io_s0,
  input  [7:0] io_s1,
  input  [6:0] io_s22,
  output [6:0] io_uout_bitwiseAnd_u,
  output [5:0] io_sout_bitwiseAnd_s,
  output [4:0] io_uout_bitwiseOr_u,
  output [6:0] io_sout_bitwiseOr_s,
  output [8:0] io_uout_bitwiseXor_u,
  output [3:0] io_sout_bitwiseXor_s,
  output [2:0] io_uout_bitwiseNot_u,
  output [9:0] io_sout_bitwiseNot_s,
  input  [5:0] io_u2,
  input  [7:0] io_u3,
  input  [7:0] io_s2,
  input  [5:0] io_s3,
  output       io_uout_andr_u,
  output       io_uout_orr_u,
  output       io_uout_xorr_u,
  output       io_uout_and_and
);
  wire [8:0] _GEN_0 = {{1'd0}, io_u1}; // @[LogicOp.scala 34:33]
  wire [8:0] _T_47 = io_u0 & _GEN_0; // @[LogicOp.scala 34:33]
  wire [7:0] _GEN_1 = {{2{io_s0[5]}},io_s0}; // @[LogicOp.scala 35:33]
  wire [7:0] _T_49 = $signed(_GEN_1) & $signed(io_s1); // @[LogicOp.scala 35:33]
  wire [8:0] _T_50 = io_u0 | _GEN_0; // @[LogicOp.scala 36:32]
  wire [7:0] _T_52 = $signed(_GEN_1) | $signed(io_s1); // @[LogicOp.scala 37:32]
  wire [7:0] _T_55 = $signed(_GEN_1) ^ $signed(io_s1); // @[LogicOp.scala 39:33]
  wire [8:0] _T_56 = ~io_u0; // @[LogicOp.scala 40:27]
  wire [5:0] _T_58 = ~io_s0; // @[LogicOp.scala 41:27]
  wire [5:0] _T_59 = ~io_u2; // @[LogicOp.scala 43:31]
  wire [6:0] _GEN_6 = {{1{io_sout_bitwiseAnd_s[5]}},io_sout_bitwiseAnd_s}; // @[LogicOp.scala 50:43]
  wire [6:0] _T_66 = $signed(_GEN_6) & $signed(io_s22); // @[LogicOp.scala 50:43]
  assign io_uout_bitwiseAnd_u = _T_47[6:0]; // @[LogicOp.scala 34:24]
  assign io_sout_bitwiseAnd_s = _T_49[5:0]; // @[LogicOp.scala 35:24]
  assign io_uout_bitwiseOr_u = _T_50[4:0]; // @[LogicOp.scala 36:23]
  assign io_sout_bitwiseOr_s = _T_52[6:0]; // @[LogicOp.scala 37:23]
  assign io_uout_bitwiseXor_u = io_u0 ^ _GEN_0; // @[LogicOp.scala 38:33]
  assign io_sout_bitwiseXor_s = _T_55[3:0]; // @[LogicOp.scala 39:24]
  assign io_uout_bitwiseNot_u = _T_56[2:0]; // @[LogicOp.scala 40:24]
  assign io_sout_bitwiseNot_s = {{4{_T_58[5]}},_T_58}; // @[LogicOp.scala 41:27]
  assign io_uout_andr_u = _T_59 == 6'h0; // @[LogicOp.scala 43:31]
  assign io_uout_orr_u = io_u2 != 6'h0; // @[LogicOp.scala 45:29]
  assign io_uout_xorr_u = ^io_u2; // @[LogicOp.scala 47:31]
  assign io_uout_and_and = _T_66[0]; // @[LogicOp.scala 50:19]
endmodule
