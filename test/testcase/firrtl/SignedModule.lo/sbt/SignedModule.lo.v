module SignedModule( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  output [9:0] io_out // @[:@6.4]
);
  wire  _T_7 = $signed(io_in) < 10'sh0; // @[SIntTypeClass.scala 66:35:@12.4]
  wire [9:0] _T_17 = 10'sh0 - $signed(io_in); // @[SIntTypeClass.scala 28:50:@24.4]
  wire [9:0] _T_18 = io_in[9] ? $signed(_T_17) : $signed(io_in); // @[SIntTypeClass.scala 140:31:@25.4]
  assign io_out = _T_7 ? $signed(_T_18) : $signed(io_in); // @[TypeclassSpec.scala 62:21:@37.4]
endmodule
