module SignedModule(
  input        clock,
  input        reset,
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire  _T_7 = $signed(io_in) < 10'sh0; // @[SIntTypeClass.scala 66:35]
  wire [9:0] _T_17 = 10'sh0 - $signed(io_in); // @[SIntTypeClass.scala 28:50]
  wire [9:0] _T_18 = io_in[9] ? $signed(_T_17) : $signed(io_in); // @[SIntTypeClass.scala 140:31]
  assign io_out = _T_7 ? $signed(_T_18) : $signed(io_in); // @[TypeclassSpec.scala 62:21]
endmodule
