module FixedPointShifter( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [7:0]  io_inValue, // @[:@6.4]
  input  [2:0]  io_dynamicShiftValue, // @[:@6.4]
  output [16:0] io_shiftLeftResult, // @[:@6.4]
  output [7:0]  io_dynamicShiftRightResult, // @[:@6.4]
  output [14:0] io_dynamicShiftLeftResult // @[:@6.4]
);
  wire [14:0] _GEN_0 = {{7{io_inValue[7]}},io_inValue}; // @[FixedPointSpec.scala 70:43:@13.4]
  assign io_shiftLeftResult = {$signed(io_inValue), 9'h0}; // @[FixedPointSpec.scala 66:36:@11.4]
  assign io_dynamicShiftRightResult = $signed(io_inValue) >>> io_dynamicShiftValue; // @[FixedPointSpec.scala 71:44:@15.4]
  assign io_dynamicShiftLeftResult = $signed(_GEN_0) << io_dynamicShiftValue; // @[FixedPointSpec.scala 70:43:@13.4]
endmodule
