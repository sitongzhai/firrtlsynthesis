module LnModule( // @[:@10.2]
  input         clock, // @[:@11.4]
  input         reset, // @[:@12.4]
  input  [63:0] io_num_node, // @[:@13.4]
  output [63:0] io_ln_node // @[:@13.4]
);
  wire [63:0] BBFLn_out; // @[DspReal.scala 83:30:@18.4]
  wire [63:0] BBFLn_in; // @[DspReal.scala 83:30:@18.4]
  BBFLn BBFLn ( // @[DspReal.scala 83:30:@18.4]
    .out(BBFLn_out),
    .in(BBFLn_in)
  );
  assign io_ln_node = BBFLn_out; // @[DspReal.scala 19:19:@22.4]
  assign BBFLn_in = io_num_node;
endmodule
