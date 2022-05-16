module FixedPointReduce(
  input         clock,
  input         reset,
  input  [63:0] io_in_0,
  input  [63:0] io_in_1,
  input  [63:0] io_in_2,
  input  [63:0] io_in_3,
  input  [63:0] io_in_4,
  input  [63:0] io_in_5,
  input  [63:0] io_in_6,
  input  [63:0] io_in_7,
  input  [63:0] io_in_8,
  input  [63:0] io_in_9,
  output [63:0] io_sum
);
  wire [63:0] _T_18 = $signed(io_in_0) + $signed(io_in_1); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_21 = $signed(_T_18) + $signed(io_in_2); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_24 = $signed(_T_21) + $signed(io_in_3); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_27 = $signed(_T_24) + $signed(io_in_4); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_30 = $signed(_T_27) + $signed(io_in_5); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_33 = $signed(_T_30) + $signed(io_in_6); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_36 = $signed(_T_33) + $signed(io_in_7); // @[FixedPointSpec.scala 16:28]
  wire [63:0] _T_39 = $signed(_T_36) + $signed(io_in_8); // @[FixedPointSpec.scala 16:28]
  assign io_sum = $signed(_T_39) + $signed(io_in_9); // @[FixedPointSpec.scala 16:28]
endmodule
