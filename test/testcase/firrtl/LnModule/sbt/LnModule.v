module LnModule(
  input         clock,
  input         reset,
  input  [63:0] io_num_node,
  output [63:0] io_ln_node
);
  wire [63:0] BBFLn_out; // @[DspReal.scala 83:30]
  wire [63:0] BBFLn_in; // @[DspReal.scala 83:30]
  BBFLn BBFLn ( // @[DspReal.scala 83:30]
    .out(BBFLn_out),
    .in(BBFLn_in)
  );
  assign io_ln_node = BBFLn_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  assign BBFLn_in = io_num_node; // @[DspReal.scala 18:20]
endmodule
