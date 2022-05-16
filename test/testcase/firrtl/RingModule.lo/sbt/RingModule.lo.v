module RingModule( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  output [9:0] io_out // @[:@6.4]
);
  wire [10:0] _T_6 = {{1{io_in[9]}},io_in}; // @[SIntTypeClass.scala 18:40:@11.4]
  wire [9:0] _T_8 = _T_6[9:0]; // @[SIntTypeClass.scala 18:40:@13.4]
  wire [11:0] _T_9 = 2'sh1 * $signed(_T_8); // @[SIntTypeClass.scala 44:41:@14.4]
  assign io_out = _T_9[9:0];
endmodule
