module AddSub(
  input        clock,
  input        reset,
  input  [7:0] io_u0,
  input  [7:0] io_u1,
  input  [7:0] io_s0,
  input  [7:0] io_s1,
  output [8:0] io_uout_add,
  output [8:0] io_sout_add,
  output [7:0] io_uout_add_no_co,
  output [7:0] io_sout_add_no_co,
  output [8:0] io_uout_sub,
  output [8:0] io_sout_sub,
  input  [3:0] io_u2,
  input  [5:0] io_u3,
  input  [3:0] io_s2,
  input  [5:0] io_s3,
  output [9:0] io_uout_mul,
  output [9:0] io_sout_mul,
  output [3:0] io_uout_div,
  output [3:0] io_sout_div,
  output [5:0] io_uout_rem,
  output [5:0] io_sout_rem
);
  wire [4:0] _T_58 = $signed(io_s2) / $signed(io_s3); // @[AddSub.scala 41:24]
  wire [5:0] _GEN_0 = {{2'd0}, io_u2}; // @[AddSub.scala 42:24]
  wire [5:0] _GEN_2 = _GEN_0 % io_u3; // @[AddSub.scala 42:24]
  wire [3:0] _T_59 = _GEN_2[3:0]; // @[AddSub.scala 42:24]
  wire [5:0] _GEN_1 = {{2{io_s2[3]}},io_s2}; // @[AddSub.scala 43:24]
  wire [5:0] _GEN_3 = $signed(_GEN_1) % $signed(io_s3); // @[AddSub.scala 43:24]
  wire [3:0] _T_60 = _GEN_3[3:0]; // @[AddSub.scala 43:24]
  assign io_uout_add = io_u0 + io_u1; // @[AddSub.scala 31:24]
  assign io_sout_add = $signed(io_s0) + $signed(io_s1); // @[AddSub.scala 32:24]
  assign io_uout_add_no_co = io_u0 + io_u1; // @[AddSub.scala 33:30]
  assign io_sout_add_no_co = $signed(io_s0) + $signed(io_s1); // @[AddSub.scala 34:30]
  assign io_uout_sub = io_u0 - io_u1; // @[AddSub.scala 35:24]
  assign io_sout_sub = $signed(io_s0) - $signed(io_s1); // @[AddSub.scala 36:24]
  assign io_uout_mul = io_u2 * io_u3; // @[AddSub.scala 38:24]
  assign io_sout_mul = $signed(io_s2) * $signed(io_s3); // @[AddSub.scala 39:24]
  assign io_uout_div = io_u2 / io_u3; // @[AddSub.scala 40:24]
  assign io_sout_div = _T_58[3:0]; // @[AddSub.scala 41:15]
  assign io_uout_rem = {{2'd0}, _T_59}; // @[AddSub.scala 42:24]
  assign io_sout_rem = {{2'd0}, _T_60}; // @[AddSub.scala 43:24]
endmodule
