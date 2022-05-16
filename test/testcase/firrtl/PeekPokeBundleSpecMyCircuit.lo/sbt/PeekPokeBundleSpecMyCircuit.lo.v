module PeekPokeBundleSpecMyCircuit( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [3:0] io_in_aUInt4, // @[:@6.4]
  input  [4:0] io_in_aSInt5, // @[:@6.4]
  input        io_in_aBundle_aBool, // @[:@6.4]
  input        io_in_aBottomBool, // @[:@6.4]
  output [3:0] io_out_aUInt4, // @[:@6.4]
  output [4:0] io_out_aSInt5, // @[:@6.4]
  output       io_out_aBundle_aBool, // @[:@6.4]
  output       io_out_aBottomBool // @[:@6.4]
);
  assign io_out_aUInt4 = io_in_aUInt4;
  assign io_out_aSInt5 = io_in_aSInt5;
  assign io_out_aBundle_aBool = io_in_aBundle_aBool;
  assign io_out_aBottomBool = io_in_aBottomBool;
endmodule
