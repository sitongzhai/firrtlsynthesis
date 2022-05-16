module Switch(
  input        clock,
  input        reset,
  input  [1:0] io_i0,
  input        io_i1,
  output       io_out
);
  assign io_out = io_i1; // @[Switch.scala 30:10]
endmodule
