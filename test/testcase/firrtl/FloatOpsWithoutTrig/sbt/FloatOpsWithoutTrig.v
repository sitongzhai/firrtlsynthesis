module FloatOpsWithoutTrig(
  input         clock,
  input         reset,
  input  [63:0] io_in1_node,
  input  [63:0] io_in2_node,
  input  [63:0] io_opsel,
  output [63:0] io_out_node,
  output        io_boolOut
);
  wire [63:0] BBFAdd_out; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_in2; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_in1; // @[DspReal.scala 43:36]
  wire [63:0] BBFSubtract_out; // @[DspReal.scala 47:36]
  wire [63:0] BBFSubtract_in2; // @[DspReal.scala 47:36]
  wire [63:0] BBFSubtract_in1; // @[DspReal.scala 47:36]
  wire [63:0] BBFMultiply_out; // @[DspReal.scala 51:36]
  wire [63:0] BBFMultiply_in2; // @[DspReal.scala 51:36]
  wire [63:0] BBFMultiply_in1; // @[DspReal.scala 51:36]
  wire [63:0] BBFDivide_out; // @[DspReal.scala 55:36]
  wire [63:0] BBFDivide_in2; // @[DspReal.scala 55:36]
  wire [63:0] BBFDivide_in1; // @[DspReal.scala 55:36]
  wire [63:0] BBFLn_out; // @[DspReal.scala 83:30]
  wire [63:0] BBFLn_in; // @[DspReal.scala 83:30]
  wire [63:0] BBFLog10_out; // @[DspReal.scala 87:30]
  wire [63:0] BBFLog10_in; // @[DspReal.scala 87:30]
  wire [63:0] BBFExp_out; // @[DspReal.scala 91:30]
  wire [63:0] BBFExp_in; // @[DspReal.scala 91:30]
  wire [63:0] BBFSqrt_out; // @[DspReal.scala 95:30]
  wire [63:0] BBFSqrt_in; // @[DspReal.scala 95:30]
  wire [63:0] BBFPow_out; // @[DspReal.scala 99:36]
  wire [63:0] BBFPow_in2; // @[DspReal.scala 99:36]
  wire [63:0] BBFPow_in1; // @[DspReal.scala 99:36]
  wire [63:0] BBFFloor_out; // @[DspReal.scala 103:30]
  wire [63:0] BBFFloor_in; // @[DspReal.scala 103:30]
  wire [63:0] BBFCeil_out; // @[DspReal.scala 107:30]
  wire [63:0] BBFCeil_in; // @[DspReal.scala 107:30]
  wire  BBFGreaterThan_out; // @[DspReal.scala 59:32]
  wire [63:0] BBFGreaterThan_in2; // @[DspReal.scala 59:32]
  wire [63:0] BBFGreaterThan_in1; // @[DspReal.scala 59:32]
  wire  BBFGreaterThanEquals_out; // @[DspReal.scala 63:32]
  wire [63:0] BBFGreaterThanEquals_in2; // @[DspReal.scala 63:32]
  wire [63:0] BBFGreaterThanEquals_in1; // @[DspReal.scala 63:32]
  wire [63:0] _T_14_node = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _T_20_node = BBFSubtract_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_1 = 64'h1 == io_opsel ? _T_20_node : _T_14_node; // @[Conditional.scala 29:59 BlackBoxFloat.scala 151:29]
  wire [63:0] _T_26_node = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_2 = 64'h2 == io_opsel ? _T_26_node : _GEN_1; // @[Conditional.scala 29:59 BlackBoxFloat.scala 152:29]
  wire [63:0] _T_32_node = BBFDivide_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_3 = 64'h3 == io_opsel ? _T_32_node : _GEN_2; // @[Conditional.scala 29:59 BlackBoxFloat.scala 153:27]
  wire [63:0] _T_38_node = BBFLn_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_4 = 64'h4 == io_opsel ? _T_38_node : _GEN_3; // @[Conditional.scala 29:59 BlackBoxFloat.scala 154:23]
  wire [63:0] _T_44_node = BBFLog10_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_5 = 64'h5 == io_opsel ? _T_44_node : _GEN_4; // @[Conditional.scala 29:59 BlackBoxFloat.scala 155:26]
  wire [63:0] _T_50_node = BBFExp_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_6 = 64'h6 == io_opsel ? _T_50_node : _GEN_5; // @[Conditional.scala 29:59 BlackBoxFloat.scala 156:24]
  wire [63:0] _T_56_node = BBFSqrt_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_7 = 64'h7 == io_opsel ? _T_56_node : _GEN_6; // @[Conditional.scala 29:59 BlackBoxFloat.scala 157:25]
  wire [63:0] _T_62_node = BBFPow_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_8 = 64'h8 == io_opsel ? _T_62_node : _GEN_7; // @[Conditional.scala 29:59 BlackBoxFloat.scala 158:24]
  wire [63:0] _T_68_node = BBFFloor_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_9 = 64'h9 == io_opsel ? _T_68_node : _GEN_8; // @[Conditional.scala 29:59 BlackBoxFloat.scala 159:26]
  wire [63:0] _T_74_node = BBFCeil_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire  _T_80 = BBFGreaterThan_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_85 = BBFGreaterThanEquals_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  BBFAdd BBFAdd ( // @[DspReal.scala 43:36]
    .out(BBFAdd_out),
    .in2(BBFAdd_in2),
    .in1(BBFAdd_in1)
  );
  BBFSubtract BBFSubtract ( // @[DspReal.scala 47:36]
    .out(BBFSubtract_out),
    .in2(BBFSubtract_in2),
    .in1(BBFSubtract_in1)
  );
  BBFMultiply BBFMultiply ( // @[DspReal.scala 51:36]
    .out(BBFMultiply_out),
    .in2(BBFMultiply_in2),
    .in1(BBFMultiply_in1)
  );
  BBFDivide BBFDivide ( // @[DspReal.scala 55:36]
    .out(BBFDivide_out),
    .in2(BBFDivide_in2),
    .in1(BBFDivide_in1)
  );
  BBFLn BBFLn ( // @[DspReal.scala 83:30]
    .out(BBFLn_out),
    .in(BBFLn_in)
  );
  BBFLog10 BBFLog10 ( // @[DspReal.scala 87:30]
    .out(BBFLog10_out),
    .in(BBFLog10_in)
  );
  BBFExp BBFExp ( // @[DspReal.scala 91:30]
    .out(BBFExp_out),
    .in(BBFExp_in)
  );
  BBFSqrt BBFSqrt ( // @[DspReal.scala 95:30]
    .out(BBFSqrt_out),
    .in(BBFSqrt_in)
  );
  BBFPow BBFPow ( // @[DspReal.scala 99:36]
    .out(BBFPow_out),
    .in2(BBFPow_in2),
    .in1(BBFPow_in1)
  );
  BBFFloor BBFFloor ( // @[DspReal.scala 103:30]
    .out(BBFFloor_out),
    .in(BBFFloor_in)
  );
  BBFCeil BBFCeil ( // @[DspReal.scala 107:30]
    .out(BBFCeil_out),
    .in(BBFCeil_in)
  );
  BBFGreaterThan BBFGreaterThan ( // @[DspReal.scala 59:32]
    .out(BBFGreaterThan_out),
    .in2(BBFGreaterThan_in2),
    .in1(BBFGreaterThan_in1)
  );
  BBFGreaterThanEquals BBFGreaterThanEquals ( // @[DspReal.scala 63:32]
    .out(BBFGreaterThanEquals_out),
    .in2(BBFGreaterThanEquals_in2),
    .in1(BBFGreaterThanEquals_in1)
  );
  assign io_out_node = 64'ha == io_opsel ? _T_74_node : _GEN_9; // @[Conditional.scala 29:59 BlackBoxFloat.scala 160:25]
  assign io_boolOut = 64'h1a == io_opsel ? _T_85 : _T_80; // @[Conditional.scala 29:59 BlackBoxFloat.scala 162:43]
  assign BBFAdd_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFAdd_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFSubtract_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFSubtract_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFMultiply_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFMultiply_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFDivide_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFDivide_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFLn_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFLog10_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFExp_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFSqrt_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFPow_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFPow_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFFloor_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFCeil_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFGreaterThan_in2 = io_in2_node; // @[DspReal.scala 36:21]
  assign BBFGreaterThan_in1 = io_in1_node; // @[DspReal.scala 35:21]
  assign BBFGreaterThanEquals_in2 = io_in2_node; // @[DspReal.scala 36:21]
  assign BBFGreaterThanEquals_in1 = io_in1_node; // @[DspReal.scala 35:21]
endmodule
