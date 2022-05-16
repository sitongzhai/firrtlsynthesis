module FixedPointAdder( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [15:0] io_in0, // @[:@6.4]
  input  [15:0] io_in1, // @[:@6.4]
  output [15:0] io_out // @[:@6.4]
);
  assign io_out = $signed(io_in0) + $signed(io_in1); // @[Adder.scala 127:20:@13.4]
endmodule
