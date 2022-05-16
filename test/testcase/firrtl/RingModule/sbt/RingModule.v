module RingModule(
  input        clock,
  input        reset,
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire [10:0] _T_6 = {{1{io_in[9]}},io_in}; // @[SIntTypeClass.scala 18:40]
  wire [9:0] _T_8 = _T_6[9:0]; // @[SIntTypeClass.scala 18:40]
  wire [11:0] _T_9 = 2'sh1 * $signed(_T_8); // @[SIntTypeClass.scala 44:41]
  assign io_out = _T_9[9:0]; // @[TypeclassSpec.scala 25:10]
endmodule
