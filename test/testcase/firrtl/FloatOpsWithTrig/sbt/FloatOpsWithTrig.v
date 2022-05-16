module FloatOpsWithTrig(
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
  wire [63:0] BBFSin_out; // @[DspReal.scala 185:32]
  wire [63:0] BBFSin_in; // @[DspReal.scala 185:32]
  wire [63:0] BBFCos_out; // @[DspReal.scala 191:35]
  wire [63:0] BBFCos_in; // @[DspReal.scala 191:35]
  wire [63:0] BBFTan_out; // @[DspReal.scala 211:35]
  wire [63:0] BBFTan_in; // @[DspReal.scala 211:35]
  wire [63:0] BBFASin_out; // @[DspReal.scala 249:35]
  wire [63:0] BBFASin_in; // @[DspReal.scala 249:35]
  wire [63:0] BBFACos_out; // @[DspReal.scala 257:35]
  wire [63:0] BBFACos_in; // @[DspReal.scala 257:35]
  wire [63:0] BBFATan_out; // @[DspReal.scala 237:35]
  wire [63:0] BBFATan_in; // @[DspReal.scala 237:35]
  wire [63:0] BBFATan2_out; // @[DspReal.scala 278:41]
  wire [63:0] BBFATan2_in2; // @[DspReal.scala 278:41]
  wire [63:0] BBFATan2_in1; // @[DspReal.scala 278:41]
  wire [63:0] BBFHypot_out; // @[DspReal.scala 283:41]
  wire [63:0] BBFHypot_in2; // @[DspReal.scala 283:41]
  wire [63:0] BBFHypot_in1; // @[DspReal.scala 283:41]
  wire [63:0] BBFSinh_out; // @[DspReal.scala 290:35]
  wire [63:0] BBFSinh_in; // @[DspReal.scala 290:35]
  wire [63:0] BBFCosh_out; // @[DspReal.scala 295:35]
  wire [63:0] BBFCosh_in; // @[DspReal.scala 295:35]
  wire [63:0] BBFTanh_out; // @[DspReal.scala 300:35]
  wire [63:0] BBFTanh_in; // @[DspReal.scala 300:35]
  wire [63:0] BBFASinh_out; // @[DspReal.scala 307:35]
  wire [63:0] BBFASinh_in; // @[DspReal.scala 307:35]
  wire [63:0] BBFACosh_out; // @[DspReal.scala 313:35]
  wire [63:0] BBFACosh_in; // @[DspReal.scala 313:35]
  wire [63:0] BBFATanh_out; // @[DspReal.scala 319:35]
  wire [63:0] BBFATanh_in; // @[DspReal.scala 319:35]
  wire [63:0] _T_14_node = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _T_20_node = BBFSubtract_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_1 = 64'h1 == io_opsel ? _T_20_node : _T_14_node; // @[Conditional.scala 29:59 BlackBoxFloat.scala 115:29]
  wire [63:0] _T_26_node = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_2 = 64'h2 == io_opsel ? _T_26_node : _GEN_1; // @[Conditional.scala 29:59 BlackBoxFloat.scala 116:29]
  wire [63:0] _T_32_node = BBFDivide_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_3 = 64'h3 == io_opsel ? _T_32_node : _GEN_2; // @[Conditional.scala 29:59 BlackBoxFloat.scala 117:27]
  wire [63:0] _T_38_node = BBFLn_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_4 = 64'h4 == io_opsel ? _T_38_node : _GEN_3; // @[Conditional.scala 29:59 BlackBoxFloat.scala 118:23]
  wire [63:0] _T_44_node = BBFLog10_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_5 = 64'h5 == io_opsel ? _T_44_node : _GEN_4; // @[Conditional.scala 29:59 BlackBoxFloat.scala 119:26]
  wire [63:0] _T_50_node = BBFExp_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_6 = 64'h6 == io_opsel ? _T_50_node : _GEN_5; // @[Conditional.scala 29:59 BlackBoxFloat.scala 120:24]
  wire [63:0] _T_56_node = BBFSqrt_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_7 = 64'h7 == io_opsel ? _T_56_node : _GEN_6; // @[Conditional.scala 29:59 BlackBoxFloat.scala 121:25]
  wire [63:0] _T_62_node = BBFPow_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_8 = 64'h8 == io_opsel ? _T_62_node : _GEN_7; // @[Conditional.scala 29:59 BlackBoxFloat.scala 122:24]
  wire [63:0] _T_68_node = BBFFloor_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_9 = 64'h9 == io_opsel ? _T_68_node : _GEN_8; // @[Conditional.scala 29:59 BlackBoxFloat.scala 123:26]
  wire [63:0] _T_74_node = BBFCeil_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_10 = 64'ha == io_opsel ? _T_74_node : _GEN_9; // @[Conditional.scala 29:59 BlackBoxFloat.scala 124:25]
  wire  _T_80 = BBFGreaterThan_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_85 = BBFGreaterThanEquals_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire [63:0] _T_90_node = BBFSin_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_13 = 64'hb == io_opsel ? _T_90_node : _GEN_10; // @[Conditional.scala 29:59 BlackBoxFloat.scala 129:24]
  wire [63:0] _T_96_node = BBFCos_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_14 = 64'hc == io_opsel ? _T_96_node : _GEN_13; // @[Conditional.scala 29:59 BlackBoxFloat.scala 130:24]
  wire [63:0] _T_102_node = BBFTan_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_15 = 64'hd == io_opsel ? _T_102_node : _GEN_14; // @[Conditional.scala 29:59 BlackBoxFloat.scala 131:24]
  wire [63:0] _T_108_node = BBFASin_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_16 = 64'he == io_opsel ? _T_108_node : _GEN_15; // @[Conditional.scala 29:59 BlackBoxFloat.scala 132:25]
  wire [63:0] _T_114_node = BBFACos_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_17 = 64'hf == io_opsel ? _T_114_node : _GEN_16; // @[Conditional.scala 29:59 BlackBoxFloat.scala 133:25]
  wire [63:0] _T_120_node = BBFATan_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_18 = 64'h10 == io_opsel ? _T_120_node : _GEN_17; // @[Conditional.scala 29:59 BlackBoxFloat.scala 134:25]
  wire [63:0] _T_126_node = BBFATan2_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_19 = 64'h11 == io_opsel ? _T_126_node : _GEN_18; // @[Conditional.scala 29:59 BlackBoxFloat.scala 135:26]
  wire [63:0] _T_132_node = BBFHypot_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] _GEN_20 = 64'h12 == io_opsel ? _T_132_node : _GEN_19; // @[Conditional.scala 29:59 BlackBoxFloat.scala 136:26]
  wire [63:0] _T_138_node = BBFSinh_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_21 = 64'h13 == io_opsel ? _T_138_node : _GEN_20; // @[Conditional.scala 29:59 BlackBoxFloat.scala 137:25]
  wire [63:0] _T_144_node = BBFCosh_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_22 = 64'h14 == io_opsel ? _T_144_node : _GEN_21; // @[Conditional.scala 29:59 BlackBoxFloat.scala 138:25]
  wire [63:0] _T_150_node = BBFTanh_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_23 = 64'h15 == io_opsel ? _T_150_node : _GEN_22; // @[Conditional.scala 29:59 BlackBoxFloat.scala 139:25]
  wire [63:0] _T_156_node = BBFASinh_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_24 = 64'h16 == io_opsel ? _T_156_node : _GEN_23; // @[Conditional.scala 29:59 BlackBoxFloat.scala 140:26]
  wire [63:0] _T_162_node = BBFACosh_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
  wire [63:0] _GEN_25 = 64'h17 == io_opsel ? _T_162_node : _GEN_24; // @[Conditional.scala 29:59 BlackBoxFloat.scala 141:26]
  wire [63:0] _T_168_node = BBFATanh_out; // @[DspReal.scala 19:19 DspReal.scala 20:14]
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
  BBFSin BBFSin ( // @[DspReal.scala 185:32]
    .out(BBFSin_out),
    .in(BBFSin_in)
  );
  BBFCos BBFCos ( // @[DspReal.scala 191:35]
    .out(BBFCos_out),
    .in(BBFCos_in)
  );
  BBFTan BBFTan ( // @[DspReal.scala 211:35]
    .out(BBFTan_out),
    .in(BBFTan_in)
  );
  BBFASin BBFASin ( // @[DspReal.scala 249:35]
    .out(BBFASin_out),
    .in(BBFASin_in)
  );
  BBFACos BBFACos ( // @[DspReal.scala 257:35]
    .out(BBFACos_out),
    .in(BBFACos_in)
  );
  BBFATan BBFATan ( // @[DspReal.scala 237:35]
    .out(BBFATan_out),
    .in(BBFATan_in)
  );
  BBFATan2 BBFATan2 ( // @[DspReal.scala 278:41]
    .out(BBFATan2_out),
    .in2(BBFATan2_in2),
    .in1(BBFATan2_in1)
  );
  BBFHypot BBFHypot ( // @[DspReal.scala 283:41]
    .out(BBFHypot_out),
    .in2(BBFHypot_in2),
    .in1(BBFHypot_in1)
  );
  BBFSinh BBFSinh ( // @[DspReal.scala 290:35]
    .out(BBFSinh_out),
    .in(BBFSinh_in)
  );
  BBFCosh BBFCosh ( // @[DspReal.scala 295:35]
    .out(BBFCosh_out),
    .in(BBFCosh_in)
  );
  BBFTanh BBFTanh ( // @[DspReal.scala 300:35]
    .out(BBFTanh_out),
    .in(BBFTanh_in)
  );
  BBFASinh BBFASinh ( // @[DspReal.scala 307:35]
    .out(BBFASinh_out),
    .in(BBFASinh_in)
  );
  BBFACosh BBFACosh ( // @[DspReal.scala 313:35]
    .out(BBFACosh_out),
    .in(BBFACosh_in)
  );
  BBFATanh BBFATanh ( // @[DspReal.scala 319:35]
    .out(BBFATanh_out),
    .in(BBFATanh_in)
  );
  assign io_out_node = 64'h18 == io_opsel ? _T_168_node : _GEN_25; // @[Conditional.scala 29:59 BlackBoxFloat.scala 142:26]
  assign io_boolOut = 64'h1a == io_opsel ? _T_85 : _T_80; // @[Conditional.scala 29:59 BlackBoxFloat.scala 127:43]
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
  assign BBFSin_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFCos_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFTan_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFASin_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFACos_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFATan_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFATan2_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFATan2_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFHypot_in2 = io_in2_node; // @[DspReal.scala 27:21]
  assign BBFHypot_in1 = io_in1_node; // @[DspReal.scala 26:21]
  assign BBFSinh_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFCosh_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFTanh_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFASinh_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFACosh_in = io_in1_node; // @[DspReal.scala 18:20]
  assign BBFATanh_in = io_in1_node; // @[DspReal.scala 18:20]
endmodule
