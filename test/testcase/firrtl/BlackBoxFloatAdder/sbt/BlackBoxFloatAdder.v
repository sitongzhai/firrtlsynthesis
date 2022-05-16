module BlackBoxFloatAdder(
  input         clock,
  input         reset,
  input  [63:0] io_a_node,
  input  [63:0] io_b_node,
  output [63:0] io_c_node,
  output [63:0] io_d_node,
  output [63:0] io_e_node
);
  wire [63:0] BBFAdd_out; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_in2; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_in1; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_1_out; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_1_in2; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_1_in1; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_2_out; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_2_in2; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_2_in1; // @[DspReal.scala 43:36]
  BBFAdd BBFAdd ( // @[DspReal.scala 43:36]
    .out(BBFAdd_out),
    .in2(BBFAdd_in2),
    .in1(BBFAdd_in1)
  );
  BBFAdd BBFAdd_1 ( // @[DspReal.scala 43:36]
    .out(BBFAdd_1_out),
    .in2(BBFAdd_1_in2),
    .in1(BBFAdd_1_in1)
  );
  BBFAdd BBFAdd_2 ( // @[DspReal.scala 43:36]
    .out(BBFAdd_2_out),
    .in2(BBFAdd_2_in2),
    .in1(BBFAdd_2_in1)
  );
  assign io_c_node = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign io_d_node = BBFAdd_1_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign io_e_node = BBFAdd_2_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFAdd_in2 = io_b_node; // @[DspReal.scala 27:21]
  assign BBFAdd_in1 = io_a_node; // @[DspReal.scala 26:21]
  assign BBFAdd_1_in2 = io_a_node; // @[DspReal.scala 27:21]
  assign BBFAdd_1_in1 = io_a_node; // @[DspReal.scala 26:21]
  assign BBFAdd_2_in2 = io_b_node; // @[DspReal.scala 27:21]
  assign BBFAdd_2_in1 = io_b_node; // @[DspReal.scala 26:21]
endmodule
