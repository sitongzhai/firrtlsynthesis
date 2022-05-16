module FixedPointDivide( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  output [9:0] io_out // @[:@6.4]
);
  wire [9:0] _T_2 = io_in; // @[FixedPointSpec.scala 39:20:@11.4]
  wire [7:0] _T_4 = _T_2[9:2]; // @[FixedPointSpec.scala 39:55:@13.4]
  assign io_out = {{2{_T_4[7]}},_T_4}; // @[FixedPointSpec.scala 39:55:@13.4]
endmodule
