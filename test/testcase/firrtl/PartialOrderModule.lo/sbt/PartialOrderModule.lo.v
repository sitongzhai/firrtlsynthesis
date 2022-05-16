module PartialOrderModule( // @[:@19.2]
  input         clock, // @[:@20.4]
  input         reset, // @[:@21.4]
  input  [63:0] io_in_node, // @[:@22.4]
  output [63:0] io_out_node // @[:@22.4]
);
  wire  BBFEquals_out; // @[DspReal.scala 75:32:@27.4]
  wire [63:0] BBFEquals_in2; // @[DspReal.scala 75:32:@27.4]
  wire [63:0] BBFEquals_in1; // @[DspReal.scala 75:32:@27.4]
  wire  BBFLessThan_out; // @[DspReal.scala 67:32:@36.4]
  wire [63:0] BBFLessThan_in2; // @[DspReal.scala 67:32:@36.4]
  wire [63:0] BBFLessThan_in1; // @[DspReal.scala 67:32:@36.4]
  BBFEquals BBFEquals ( // @[DspReal.scala 75:32:@27.4]
    .out(BBFEquals_out),
    .in2(BBFEquals_in2),
    .in1(BBFEquals_in1)
  );
  BBFLessThan BBFLessThan ( // @[DspReal.scala 67:32:@36.4]
    .out(BBFLessThan_out),
    .in2(BBFLessThan_in2),
    .in1(BBFLessThan_in1)
  );
  assign io_out_node = io_in_node; // @[TypeclassSpec.scala 56:8:@54.4]
  assign BBFEquals_in2 = io_in_node;
  assign BBFEquals_in1 = io_in_node;
  assign BBFLessThan_in2 = io_in_node;
  assign BBFLessThan_in1 = io_in_node;
endmodule
