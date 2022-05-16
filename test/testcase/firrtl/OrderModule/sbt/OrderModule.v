module OrderModule(
  input         clock,
  input         reset,
  input  [63:0] io_in_node,
  output [63:0] io_out_node
);
  wire  BBFLessThan_out; // @[DspReal.scala 67:32]
  wire [63:0] BBFLessThan_in2; // @[DspReal.scala 67:32]
  wire [63:0] BBFLessThan_in1; // @[DspReal.scala 67:32]
  BBFLessThan BBFLessThan ( // @[DspReal.scala 67:32]
    .out(BBFLessThan_out),
    .in2(BBFLessThan_in2),
    .in1(BBFLessThan_in1)
  );
  assign io_out_node = io_in_node; // @[Order.scala 55:31]
  assign BBFLessThan_in2 = io_in_node; // @[DspReal.scala 36:21]
  assign BBFLessThan_in1 = io_in_node; // @[DspReal.scala 35:21]
endmodule
