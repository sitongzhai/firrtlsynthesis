module DriverTest( // @[:@3.2]
  input   clock, // @[:@4.4]
  input   reset, // @[:@5.4]
  input   io_in, // @[:@6.4]
  output  io_out // @[:@6.4]
);
  assign io_out = io_in;
endmodule
