module EqModule( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  output [9:0] io_out // @[:@6.4]
);
  wire  _T_5 = $signed(io_in) == 10'sh0; // @[SIntTypeClass.scala 55:48:@11.4]
  assign io_out = _T_5 ? $signed(10'sh1) : $signed(io_in); // @[TypeclassSpec.scala 38:51:@12.4]
endmodule
