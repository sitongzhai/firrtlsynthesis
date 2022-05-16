module Pad(
  input        clock,
  input        reset,
  input  [3:0] io_u0,
  input  [4:0] io_u1,
  input  [3:0] io_s0,
  input  [4:0] io_s1,
  output [8:0] io_uout_cat_u,
  output [8:0] io_uout_cat_s,
  output [7:0] io_uout_pad,
  output [7:0] io_sout_pad,
  output [2:0] io_uout_bits_u,
  output [2:0] io_uout_bits_s,
  output [2:0] io_uout_head_u,
  output [2:0] io_uout_head_s,
  output [2:0] io_uout_tail_u,
  output [2:0] io_uout_tail_s
);
  assign io_uout_cat_u = {io_u1,io_u0}; // @[Cat.scala 30:58]
  assign io_uout_cat_s = {io_s1,io_s0}; // @[Cat.scala 30:58]
  assign io_uout_pad = {{4'd0}, io_u0}; // @[Pad.scala 27:27]
  assign io_sout_pad = {{4{io_s0[3]}},io_s0}; // @[Pad.scala 28:27]
  assign io_uout_bits_u = io_u1[3:1]; // @[Pad.scala 30:26]
  assign io_uout_bits_s = io_s1[3:1]; // @[Pad.scala 31:26]
  assign io_uout_head_u = io_u0[3:1]; // @[Pad.scala 33:31]
  assign io_uout_head_s = io_s0[3:1]; // @[Pad.scala 34:31]
  assign io_uout_tail_u = io_u0[2:0]; // @[Pad.scala 35:31]
  assign io_uout_tail_s = io_s0[2:0]; // @[Pad.scala 36:31]
endmodule
