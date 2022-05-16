module EqModule(
  input        clock,
  input        reset,
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire  _T_5 = $signed(io_in) == 10'sh0; // @[SIntTypeClass.scala 55:48]
  assign io_out = _T_5 ? $signed(10'sh1) : $signed(io_in); // @[TypeclassSpec.scala 38:51]
endmodule
