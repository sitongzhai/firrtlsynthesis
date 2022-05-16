module OpShift(
  input         clock,
  input         reset,
  input  [7:0]  io_u0,
  input  [2:0]  io_u1,
  input  [7:0]  io_s0,
  output [9:0]  io_uout_shl,
  output [5:0]  io_uout_shr,
  output [9:0]  io_sout_shl,
  output [5:0]  io_sout_shr,
  output [14:0] io_uout_dshl,
  output [7:0]  io_uout_dshr,
  output [14:0] io_sout_dshl,
  output [7:0]  io_sout_dshr
);
  wire  _T_30 = io_s0[7]; // @[OpShift.scala 24:24]
  wire [14:0] _GEN_1 = {{7'd0}, io_u0}; // @[OpShift.scala 26:25]
  wire [14:0] _GEN_2 = {{7{io_s0[7]}},io_s0}; // @[OpShift.scala 28:25]
  assign io_uout_shl = {io_u0, 2'h0}; // @[OpShift.scala 21:24]
  assign io_uout_shr = 6'h0; // @[OpShift.scala 22:24]
  assign io_sout_shl = {$signed(io_s0), 2'h0}; // @[OpShift.scala 23:24]
  assign io_sout_shr = {6{_T_30}}; // @[OpShift.scala 24:24]
  assign io_uout_dshl = _GEN_1 << io_u1; // @[OpShift.scala 26:25]
  assign io_uout_dshr = io_u0 >> io_u1; // @[OpShift.scala 27:25]
  assign io_sout_dshl = $signed(_GEN_2) << io_u1; // @[OpShift.scala 28:25]
  assign io_sout_dshr = $signed(io_s0) >>> io_u1; // @[OpShift.scala 29:25]
endmodule
