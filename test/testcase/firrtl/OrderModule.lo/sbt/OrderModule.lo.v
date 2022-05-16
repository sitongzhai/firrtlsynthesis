module OrderModule( // @[:@11.2]
  input         clock, // @[:@12.4]
  input         reset, // @[:@13.4]
  input  [63:0] io_in_node, // @[:@14.4]
  output [63:0] io_out_node // @[:@14.4]
);
  wire  BBFLessThan_out; // @[DspReal.scala 67:32:@19.4]
  wire [63:0] BBFLessThan_in2; // @[DspReal.scala 67:32:@19.4]
  wire [63:0] BBFLessThan_in1; // @[DspReal.scala 67:32:@19.4]
  BBFLessThan BBFLessThan ( // @[DspReal.scala 67:32:@19.4]
    .out(BBFLessThan_out),
    .in2(BBFLessThan_in2),
    .in1(BBFLessThan_in1)
  );
  assign io_out_node = io_in_node; // @[Order.scala 55:31:@28.4]
  assign BBFLessThan_in2 = io_in_node;
  assign BBFLessThan_in1 = io_in_node;
endmodule
