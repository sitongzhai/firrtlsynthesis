module DriverTest(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
  assign io_out = io_in; // @[DriverSpec.scala 15:10]
endmodule
