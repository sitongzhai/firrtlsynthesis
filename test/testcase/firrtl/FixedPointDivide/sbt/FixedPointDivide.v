module FixedPointDivide(
  input        clock,
  input        reset,
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire [9:0] _T_2 = io_in; // @[FixedPointSpec.scala 39:20]
  wire [7:0] _T_4 = _T_2[9:2]; // @[FixedPointSpec.scala 39:55]
  assign io_out = {{2{_T_4[7]}},_T_4}; // @[FixedPointSpec.scala 39:55]
endmodule
