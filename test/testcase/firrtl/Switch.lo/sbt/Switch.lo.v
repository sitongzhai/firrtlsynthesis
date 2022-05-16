module Switch( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [1:0] io_i0, // @[:@6.4]
  input        io_i1, // @[:@6.4]
  output       io_out // @[:@6.4]
);
  assign io_out = io_i1; // @[Switch.scala 30:10:@40.4]
endmodule
