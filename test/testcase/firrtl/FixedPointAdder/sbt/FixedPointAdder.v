module FixedPointAdder(
  input         clock,
  input         reset,
  input  [15:0] io_in0,
  input  [15:0] io_in1,
  output [15:0] io_out
);
  assign io_out = $signed(io_in0) + $signed(io_in1); // @[Adder.scala 127:20]
endmodule
