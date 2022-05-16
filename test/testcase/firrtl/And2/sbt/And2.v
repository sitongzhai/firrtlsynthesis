module And2(
  input   clock,
  input   reset,
  input   io_i0,
  input   io_i1,
  output  io_out
);
  assign io_out = io_i0 & io_i1; // @[And2.scala 14:19]
endmodule
