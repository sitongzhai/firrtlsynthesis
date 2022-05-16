module BlackBoxFloatAdder( // @[:@27.2]
  input         clock, // @[:@28.4]
  input         reset, // @[:@29.4]
  input  [63:0] io_a_node, // @[:@30.4]
  input  [63:0] io_b_node, // @[:@30.4]
  output [63:0] io_c_node, // @[:@30.4]
  output [63:0] io_d_node, // @[:@30.4]
  output [63:0] io_e_node // @[:@30.4]
);
  wire [63:0] BBFAdd_out; // @[DspReal.scala 43:36:@35.4]
  wire [63:0] BBFAdd_in2; // @[DspReal.scala 43:36:@35.4]
  wire [63:0] BBFAdd_in1; // @[DspReal.scala 43:36:@35.4]
  wire [63:0] BBFAdd_1_out; // @[DspReal.scala 43:36:@45.4]
  wire [63:0] BBFAdd_1_in2; // @[DspReal.scala 43:36:@45.4]
  wire [63:0] BBFAdd_1_in1; // @[DspReal.scala 43:36:@45.4]
  wire [63:0] BBFAdd_2_out; // @[DspReal.scala 43:36:@55.4]
  wire [63:0] BBFAdd_2_in2; // @[DspReal.scala 43:36:@55.4]
  wire [63:0] BBFAdd_2_in1; // @[DspReal.scala 43:36:@55.4]
  BBFAdd BBFAdd ( // @[DspReal.scala 43:36:@35.4]
    .out(BBFAdd_out),
    .in2(BBFAdd_in2),
    .in1(BBFAdd_in1)
  );
  BBFAdd BBFAdd_1 ( // @[DspReal.scala 43:36:@45.4]
    .out(BBFAdd_1_out),
    .in2(BBFAdd_1_in2),
    .in1(BBFAdd_1_in1)
  );
  BBFAdd BBFAdd_2 ( // @[DspReal.scala 43:36:@55.4]
    .out(BBFAdd_2_out),
    .in2(BBFAdd_2_in2),
    .in1(BBFAdd_2_in1)
  );
  assign io_c_node = BBFAdd_out; // @[DspReal.scala 28:19:@41.4]
  assign io_d_node = BBFAdd_1_out; // @[DspReal.scala 28:19:@51.4]
  assign io_e_node = BBFAdd_2_out; // @[DspReal.scala 28:19:@61.4]
  assign BBFAdd_in2 = io_b_node;
  assign BBFAdd_in1 = io_a_node;
  assign BBFAdd_1_in2 = io_a_node;
  assign BBFAdd_1_in1 = io_a_node;
  assign BBFAdd_2_in2 = io_b_node;
  assign BBFAdd_2_in1 = io_b_node;
endmodule
