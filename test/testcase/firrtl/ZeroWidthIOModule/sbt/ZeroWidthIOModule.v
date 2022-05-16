module ZeroWidthIOModule(
  input        clock,
  input        reset,
  input  [2:0] io_otherIn,
  output [2:0] io_otherOut
);
  assign io_otherOut = io_otherIn; // @[ZeroWidth.scala 16:15]
endmodule
