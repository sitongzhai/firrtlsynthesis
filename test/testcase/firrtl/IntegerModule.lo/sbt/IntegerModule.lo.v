module IntegerModule( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  output [9:0] io_out // @[:@6.4]
);
  wire [10:0] _T_5 = {{1{io_in[9]}},io_in}; // @[SIntTypeClass.scala 18:40:@12.4]
  assign io_out = _T_5[9:0]; // @[SIntTypeClass.scala 18:40:@14.4]
endmodule
