module NegCircuit(
  input         clock,
  input         reset,
  input  [63:0] io_in1_node,
  input  [63:0] io_in2_node,
  output        io_out
);
  wire  BBFGreaterThan_out; // @[DspReal.scala 59:32]
  wire [63:0] BBFGreaterThan_in2; // @[DspReal.scala 59:32]
  wire [63:0] BBFGreaterThan_in1; // @[DspReal.scala 59:32]
  BBFGreaterThan BBFGreaterThan ( // @[DspReal.scala 59:32]
    .out(BBFGreaterThan_out),
    .in2(BBFGreaterThan_in2),
    .in1(BBFGreaterThan_in1)
  );
  assign io_out = BBFGreaterThan_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  assign BBFGreaterThan_in2 = io_in2_node; // @[DspReal.scala 36:21]
  assign BBFGreaterThan_in1 = io_in1_node; // @[DspReal.scala 35:21]
endmodule
