module Cvt(
  input        clock,
  input        reset,
  input  [7:0] io_u0,
  input  [7:0] io_s0,
  output [9:0] io_uout_asUInt_u,
  output [9:0] io_uout_asUInt_s,
  output [9:0] io_sout_asSInt_u,
  output [9:0] io_sout_asSInt_s,
  output [9:0] io_sout_neg_u,
  output [9:0] io_sout_neg_s
);
  wire [7:0] _T_21 = io_s0; // @[Cvt.scala 19:35]
  wire [7:0] _T_22 = io_u0; // @[Cvt.scala 20:35]
  wire [7:0] _T_27 = 8'sh0 - $signed(io_u0); // @[Cvt.scala 23:20]
  wire [7:0] _T_31 = 8'sh0 - $signed(io_s0); // @[Cvt.scala 24:20]
  assign io_uout_asUInt_u = {{2'd0}, io_u0}; // @[Cvt.scala 18:20]
  assign io_uout_asUInt_s = {{2'd0}, _T_21}; // @[Cvt.scala 19:35]
  assign io_sout_asSInt_u = {{2{_T_22[7]}},_T_22}; // @[Cvt.scala 20:35]
  assign io_sout_asSInt_s = {{2{io_s0[7]}},io_s0}; // @[Cvt.scala 21:20]
  assign io_sout_neg_u = {{2{_T_27[7]}},_T_27}; // @[Cvt.scala 23:20]
  assign io_sout_neg_s = {{2{_T_31[7]}},_T_31}; // @[Cvt.scala 24:20]
endmodule
