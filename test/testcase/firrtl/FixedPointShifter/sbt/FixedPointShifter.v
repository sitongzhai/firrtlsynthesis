module FixedPointShifter(
  input         clock,
  input         reset,
  input  [7:0]  io_inValue,
  input  [2:0]  io_dynamicShiftValue,
  output [16:0] io_shiftLeftResult,
  output [7:0]  io_dynamicShiftRightResult,
  output [14:0] io_dynamicShiftLeftResult
);
  wire [14:0] _GEN_0 = {{7{io_inValue[7]}},io_inValue}; // @[FixedPointSpec.scala 70:43]
  assign io_shiftLeftResult = {$signed(io_inValue), 9'h0}; // @[FixedPointSpec.scala 66:36]
  assign io_dynamicShiftRightResult = $signed(io_inValue) >>> io_dynamicShiftValue; // @[FixedPointSpec.scala 71:44]
  assign io_dynamicShiftLeftResult = $signed(_GEN_0) << io_dynamicShiftValue; // @[FixedPointSpec.scala 70:43]
endmodule
