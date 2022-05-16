module PeekPokeBundleSpecMyCircuit(
  input        clock,
  input        reset,
  input  [3:0] io_in_aUInt4,
  input  [4:0] io_in_aSInt5,
  input        io_in_aBundle_aBool,
  input        io_in_aBottomBool,
  output [3:0] io_out_aUInt4,
  output [4:0] io_out_aSInt5,
  output       io_out_aBundle_aBool,
  output       io_out_aBottomBool
);
  assign io_out_aUInt4 = io_in_aUInt4; // @[PeekPokeBundleSpec.scala 36:12]
  assign io_out_aSInt5 = io_in_aSInt5; // @[PeekPokeBundleSpec.scala 36:12]
  assign io_out_aBundle_aBool = io_in_aBundle_aBool; // @[PeekPokeBundleSpec.scala 36:12]
  assign io_out_aBottomBool = io_in_aBottomBool; // @[PeekPokeBundleSpec.scala 36:12]
endmodule
