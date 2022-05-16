module NegCircuit( // @[:@11.2]
  input         clock, // @[:@12.4]
  input         reset, // @[:@13.4]
  input  [63:0] io_in1_node, // @[:@14.4]
  input  [63:0] io_in2_node, // @[:@14.4]
  output        io_out // @[:@14.4]
);
  wire  BBFGreaterThan_out; // @[DspReal.scala 59:32:@19.4]
  wire [63:0] BBFGreaterThan_in2; // @[DspReal.scala 59:32:@19.4]
  wire [63:0] BBFGreaterThan_in1; // @[DspReal.scala 59:32:@19.4]
  BBFGreaterThan BBFGreaterThan ( // @[DspReal.scala 59:32:@19.4]
    .out(BBFGreaterThan_out),
    .in2(BBFGreaterThan_in2),
    .in1(BBFGreaterThan_in1)
  );
  assign io_out = BBFGreaterThan_out; // @[DspReal.scala 37:19:@25.4]
  assign BBFGreaterThan_in2 = io_in2_node;
  assign BBFGreaterThan_in1 = io_in1_node;
endmodule
