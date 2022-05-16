module IntegerModule(
  input        clock,
  input        reset,
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire [10:0] _T_5 = {{1{io_in[9]}},io_in}; // @[SIntTypeClass.scala 18:40]
  assign io_out = _T_5[9:0]; // @[SIntTypeClass.scala 18:40]
endmodule
