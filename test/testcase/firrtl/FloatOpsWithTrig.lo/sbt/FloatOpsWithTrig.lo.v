module FloatOpsWithTrig( // @[:@201.2]
  input         clock, // @[:@202.4]
  input         reset, // @[:@203.4]
  input  [63:0] io_in1_node, // @[:@204.4]
  input  [63:0] io_in2_node, // @[:@204.4]
  input  [63:0] io_opsel, // @[:@204.4]
  output [63:0] io_out_node, // @[:@204.4]
  output        io_boolOut // @[:@204.4]
);
  wire [63:0] BBFAdd_out; // @[DspReal.scala 43:36:@211.6]
  wire [63:0] BBFAdd_in2; // @[DspReal.scala 43:36:@211.6]
  wire [63:0] BBFAdd_in1; // @[DspReal.scala 43:36:@211.6]
  wire [63:0] BBFSubtract_out; // @[DspReal.scala 47:36:@224.6]
  wire [63:0] BBFSubtract_in2; // @[DspReal.scala 47:36:@224.6]
  wire [63:0] BBFSubtract_in1; // @[DspReal.scala 47:36:@224.6]
  wire [63:0] BBFMultiply_out; // @[DspReal.scala 51:36:@237.6]
  wire [63:0] BBFMultiply_in2; // @[DspReal.scala 51:36:@237.6]
  wire [63:0] BBFMultiply_in1; // @[DspReal.scala 51:36:@237.6]
  wire [63:0] BBFDivide_out; // @[DspReal.scala 55:36:@250.6]
  wire [63:0] BBFDivide_in2; // @[DspReal.scala 55:36:@250.6]
  wire [63:0] BBFDivide_in1; // @[DspReal.scala 55:36:@250.6]
  wire [63:0] BBFLn_out; // @[DspReal.scala 83:30:@263.6]
  wire [63:0] BBFLn_in; // @[DspReal.scala 83:30:@263.6]
  wire [63:0] BBFLog10_out; // @[DspReal.scala 87:30:@274.6]
  wire [63:0] BBFLog10_in; // @[DspReal.scala 87:30:@274.6]
  wire [63:0] BBFExp_out; // @[DspReal.scala 91:30:@285.6]
  wire [63:0] BBFExp_in; // @[DspReal.scala 91:30:@285.6]
  wire [63:0] BBFSqrt_out; // @[DspReal.scala 95:30:@296.6]
  wire [63:0] BBFSqrt_in; // @[DspReal.scala 95:30:@296.6]
  wire [63:0] BBFPow_out; // @[DspReal.scala 99:36:@307.6]
  wire [63:0] BBFPow_in2; // @[DspReal.scala 99:36:@307.6]
  wire [63:0] BBFPow_in1; // @[DspReal.scala 99:36:@307.6]
  wire [63:0] BBFFloor_out; // @[DspReal.scala 103:30:@320.6]
  wire [63:0] BBFFloor_in; // @[DspReal.scala 103:30:@320.6]
  wire [63:0] BBFCeil_out; // @[DspReal.scala 107:30:@331.6]
  wire [63:0] BBFCeil_in; // @[DspReal.scala 107:30:@331.6]
  wire  BBFGreaterThan_out; // @[DspReal.scala 59:32:@342.6]
  wire [63:0] BBFGreaterThan_in2; // @[DspReal.scala 59:32:@342.6]
  wire [63:0] BBFGreaterThan_in1; // @[DspReal.scala 59:32:@342.6]
  wire  BBFGreaterThanEquals_out; // @[DspReal.scala 63:32:@355.6]
  wire [63:0] BBFGreaterThanEquals_in2; // @[DspReal.scala 63:32:@355.6]
  wire [63:0] BBFGreaterThanEquals_in1; // @[DspReal.scala 63:32:@355.6]
  wire [63:0] BBFSin_out; // @[DspReal.scala 185:32:@368.6]
  wire [63:0] BBFSin_in; // @[DspReal.scala 185:32:@368.6]
  wire [63:0] BBFCos_out; // @[DspReal.scala 191:35:@379.6]
  wire [63:0] BBFCos_in; // @[DspReal.scala 191:35:@379.6]
  wire [63:0] BBFTan_out; // @[DspReal.scala 211:35:@390.6]
  wire [63:0] BBFTan_in; // @[DspReal.scala 211:35:@390.6]
  wire [63:0] BBFASin_out; // @[DspReal.scala 249:35:@401.6]
  wire [63:0] BBFASin_in; // @[DspReal.scala 249:35:@401.6]
  wire [63:0] BBFACos_out; // @[DspReal.scala 257:35:@412.6]
  wire [63:0] BBFACos_in; // @[DspReal.scala 257:35:@412.6]
  wire [63:0] BBFATan_out; // @[DspReal.scala 237:35:@423.6]
  wire [63:0] BBFATan_in; // @[DspReal.scala 237:35:@423.6]
  wire [63:0] BBFATan2_out; // @[DspReal.scala 278:41:@434.6]
  wire [63:0] BBFATan2_in2; // @[DspReal.scala 278:41:@434.6]
  wire [63:0] BBFATan2_in1; // @[DspReal.scala 278:41:@434.6]
  wire [63:0] BBFHypot_out; // @[DspReal.scala 283:41:@447.6]
  wire [63:0] BBFHypot_in2; // @[DspReal.scala 283:41:@447.6]
  wire [63:0] BBFHypot_in1; // @[DspReal.scala 283:41:@447.6]
  wire [63:0] BBFSinh_out; // @[DspReal.scala 290:35:@460.6]
  wire [63:0] BBFSinh_in; // @[DspReal.scala 290:35:@460.6]
  wire [63:0] BBFCosh_out; // @[DspReal.scala 295:35:@471.6]
  wire [63:0] BBFCosh_in; // @[DspReal.scala 295:35:@471.6]
  wire [63:0] BBFTanh_out; // @[DspReal.scala 300:35:@482.6]
  wire [63:0] BBFTanh_in; // @[DspReal.scala 300:35:@482.6]
  wire [63:0] BBFASinh_out; // @[DspReal.scala 307:35:@493.6]
  wire [63:0] BBFASinh_in; // @[DspReal.scala 307:35:@493.6]
  wire [63:0] BBFACosh_out; // @[DspReal.scala 313:35:@504.6]
  wire [63:0] BBFACosh_in; // @[DspReal.scala 313:35:@504.6]
  wire [63:0] BBFATanh_out; // @[DspReal.scala 319:35:@515.6]
  wire [63:0] BBFATanh_in; // @[DspReal.scala 319:35:@515.6]
  wire [63:0] _T_14_node = BBFAdd_out; // @[DspReal.scala 28:19:@217.6]
  wire  _T_17 = 64'h1 == io_opsel; // @[Conditional.scala 29:28:@222.4]
  wire [63:0] _T_20_node = BBFSubtract_out; // @[DspReal.scala 28:19:@230.6]
  wire [63:0] _GEN_1 = _T_17 ? _T_20_node : _T_14_node; // @[Conditional.scala 29:59:@223.4]
  wire  _T_23 = 64'h2 == io_opsel; // @[Conditional.scala 29:28:@235.4]
  wire [63:0] _T_26_node = BBFMultiply_out; // @[DspReal.scala 28:19:@243.6]
  wire [63:0] _GEN_2 = _T_23 ? _T_26_node : _GEN_1; // @[Conditional.scala 29:59:@236.4]
  wire  _T_29 = 64'h3 == io_opsel; // @[Conditional.scala 29:28:@248.4]
  wire [63:0] _T_32_node = BBFDivide_out; // @[DspReal.scala 28:19:@256.6]
  wire [63:0] _GEN_3 = _T_29 ? _T_32_node : _GEN_2; // @[Conditional.scala 29:59:@249.4]
  wire  _T_35 = 64'h4 == io_opsel; // @[Conditional.scala 29:28:@261.4]
  wire [63:0] _T_38_node = BBFLn_out; // @[DspReal.scala 19:19:@267.6]
  wire [63:0] _GEN_4 = _T_35 ? _T_38_node : _GEN_3; // @[Conditional.scala 29:59:@262.4]
  wire  _T_41 = 64'h5 == io_opsel; // @[Conditional.scala 29:28:@272.4]
  wire [63:0] _T_44_node = BBFLog10_out; // @[DspReal.scala 19:19:@278.6]
  wire [63:0] _GEN_5 = _T_41 ? _T_44_node : _GEN_4; // @[Conditional.scala 29:59:@273.4]
  wire  _T_47 = 64'h6 == io_opsel; // @[Conditional.scala 29:28:@283.4]
  wire [63:0] _T_50_node = BBFExp_out; // @[DspReal.scala 19:19:@289.6]
  wire [63:0] _GEN_6 = _T_47 ? _T_50_node : _GEN_5; // @[Conditional.scala 29:59:@284.4]
  wire  _T_53 = 64'h7 == io_opsel; // @[Conditional.scala 29:28:@294.4]
  wire [63:0] _T_56_node = BBFSqrt_out; // @[DspReal.scala 19:19:@300.6]
  wire [63:0] _GEN_7 = _T_53 ? _T_56_node : _GEN_6; // @[Conditional.scala 29:59:@295.4]
  wire  _T_59 = 64'h8 == io_opsel; // @[Conditional.scala 29:28:@305.4]
  wire [63:0] _T_62_node = BBFPow_out; // @[DspReal.scala 28:19:@313.6]
  wire [63:0] _GEN_8 = _T_59 ? _T_62_node : _GEN_7; // @[Conditional.scala 29:59:@306.4]
  wire  _T_65 = 64'h9 == io_opsel; // @[Conditional.scala 29:28:@318.4]
  wire [63:0] _T_68_node = BBFFloor_out; // @[DspReal.scala 19:19:@324.6]
  wire [63:0] _GEN_9 = _T_65 ? _T_68_node : _GEN_8; // @[Conditional.scala 29:59:@319.4]
  wire  _T_71 = 64'ha == io_opsel; // @[Conditional.scala 29:28:@329.4]
  wire [63:0] _T_74_node = BBFCeil_out; // @[DspReal.scala 19:19:@335.6]
  wire [63:0] _GEN_10 = _T_71 ? _T_74_node : _GEN_9; // @[Conditional.scala 29:59:@330.4]
  wire  _T_80 = BBFGreaterThan_out; // @[DspReal.scala 37:19:@348.6]
  wire  _T_82 = 64'h1a == io_opsel; // @[Conditional.scala 29:28:@353.4]
  wire  _T_85 = BBFGreaterThanEquals_out; // @[DspReal.scala 37:19:@361.6]
  wire  _T_87 = 64'hb == io_opsel; // @[Conditional.scala 29:28:@366.4]
  wire [63:0] _T_90_node = BBFSin_out; // @[DspReal.scala 19:19:@372.6]
  wire [63:0] _GEN_13 = _T_87 ? _T_90_node : _GEN_10; // @[Conditional.scala 29:59:@367.4]
  wire  _T_93 = 64'hc == io_opsel; // @[Conditional.scala 29:28:@377.4]
  wire [63:0] _T_96_node = BBFCos_out; // @[DspReal.scala 19:19:@383.6]
  wire [63:0] _GEN_14 = _T_93 ? _T_96_node : _GEN_13; // @[Conditional.scala 29:59:@378.4]
  wire  _T_99 = 64'hd == io_opsel; // @[Conditional.scala 29:28:@388.4]
  wire [63:0] _T_102_node = BBFTan_out; // @[DspReal.scala 19:19:@394.6]
  wire [63:0] _GEN_15 = _T_99 ? _T_102_node : _GEN_14; // @[Conditional.scala 29:59:@389.4]
  wire  _T_105 = 64'he == io_opsel; // @[Conditional.scala 29:28:@399.4]
  wire [63:0] _T_108_node = BBFASin_out; // @[DspReal.scala 19:19:@405.6]
  wire [63:0] _GEN_16 = _T_105 ? _T_108_node : _GEN_15; // @[Conditional.scala 29:59:@400.4]
  wire  _T_111 = 64'hf == io_opsel; // @[Conditional.scala 29:28:@410.4]
  wire [63:0] _T_114_node = BBFACos_out; // @[DspReal.scala 19:19:@416.6]
  wire [63:0] _GEN_17 = _T_111 ? _T_114_node : _GEN_16; // @[Conditional.scala 29:59:@411.4]
  wire  _T_117 = 64'h10 == io_opsel; // @[Conditional.scala 29:28:@421.4]
  wire [63:0] _T_120_node = BBFATan_out; // @[DspReal.scala 19:19:@427.6]
  wire [63:0] _GEN_18 = _T_117 ? _T_120_node : _GEN_17; // @[Conditional.scala 29:59:@422.4]
  wire  _T_123 = 64'h11 == io_opsel; // @[Conditional.scala 29:28:@432.4]
  wire [63:0] _T_126_node = BBFATan2_out; // @[DspReal.scala 28:19:@440.6]
  wire [63:0] _GEN_19 = _T_123 ? _T_126_node : _GEN_18; // @[Conditional.scala 29:59:@433.4]
  wire  _T_129 = 64'h12 == io_opsel; // @[Conditional.scala 29:28:@445.4]
  wire [63:0] _T_132_node = BBFHypot_out; // @[DspReal.scala 28:19:@453.6]
  wire [63:0] _GEN_20 = _T_129 ? _T_132_node : _GEN_19; // @[Conditional.scala 29:59:@446.4]
  wire  _T_135 = 64'h13 == io_opsel; // @[Conditional.scala 29:28:@458.4]
  wire [63:0] _T_138_node = BBFSinh_out; // @[DspReal.scala 19:19:@464.6]
  wire [63:0] _GEN_21 = _T_135 ? _T_138_node : _GEN_20; // @[Conditional.scala 29:59:@459.4]
  wire  _T_141 = 64'h14 == io_opsel; // @[Conditional.scala 29:28:@469.4]
  wire [63:0] _T_144_node = BBFCosh_out; // @[DspReal.scala 19:19:@475.6]
  wire [63:0] _GEN_22 = _T_141 ? _T_144_node : _GEN_21; // @[Conditional.scala 29:59:@470.4]
  wire  _T_147 = 64'h15 == io_opsel; // @[Conditional.scala 29:28:@480.4]
  wire [63:0] _T_150_node = BBFTanh_out; // @[DspReal.scala 19:19:@486.6]
  wire [63:0] _GEN_23 = _T_147 ? _T_150_node : _GEN_22; // @[Conditional.scala 29:59:@481.4]
  wire  _T_153 = 64'h16 == io_opsel; // @[Conditional.scala 29:28:@491.4]
  wire [63:0] _T_156_node = BBFASinh_out; // @[DspReal.scala 19:19:@497.6]
  wire [63:0] _GEN_24 = _T_153 ? _T_156_node : _GEN_23; // @[Conditional.scala 29:59:@492.4]
  wire  _T_159 = 64'h17 == io_opsel; // @[Conditional.scala 29:28:@502.4]
  wire [63:0] _T_162_node = BBFACosh_out; // @[DspReal.scala 19:19:@508.6]
  wire [63:0] _GEN_25 = _T_159 ? _T_162_node : _GEN_24; // @[Conditional.scala 29:59:@503.4]
  wire  _T_165 = 64'h18 == io_opsel; // @[Conditional.scala 29:28:@513.4]
  wire [63:0] _T_168_node = BBFATanh_out; // @[DspReal.scala 19:19:@519.6]
  BBFAdd BBFAdd ( // @[DspReal.scala 43:36:@211.6]
    .out(BBFAdd_out),
    .in2(BBFAdd_in2),
    .in1(BBFAdd_in1)
  );
  BBFSubtract BBFSubtract ( // @[DspReal.scala 47:36:@224.6]
    .out(BBFSubtract_out),
    .in2(BBFSubtract_in2),
    .in1(BBFSubtract_in1)
  );
  BBFMultiply BBFMultiply ( // @[DspReal.scala 51:36:@237.6]
    .out(BBFMultiply_out),
    .in2(BBFMultiply_in2),
    .in1(BBFMultiply_in1)
  );
  BBFDivide BBFDivide ( // @[DspReal.scala 55:36:@250.6]
    .out(BBFDivide_out),
    .in2(BBFDivide_in2),
    .in1(BBFDivide_in1)
  );
  BBFLn BBFLn ( // @[DspReal.scala 83:30:@263.6]
    .out(BBFLn_out),
    .in(BBFLn_in)
  );
  BBFLog10 BBFLog10 ( // @[DspReal.scala 87:30:@274.6]
    .out(BBFLog10_out),
    .in(BBFLog10_in)
  );
  BBFExp BBFExp ( // @[DspReal.scala 91:30:@285.6]
    .out(BBFExp_out),
    .in(BBFExp_in)
  );
  BBFSqrt BBFSqrt ( // @[DspReal.scala 95:30:@296.6]
    .out(BBFSqrt_out),
    .in(BBFSqrt_in)
  );
  BBFPow BBFPow ( // @[DspReal.scala 99:36:@307.6]
    .out(BBFPow_out),
    .in2(BBFPow_in2),
    .in1(BBFPow_in1)
  );
  BBFFloor BBFFloor ( // @[DspReal.scala 103:30:@320.6]
    .out(BBFFloor_out),
    .in(BBFFloor_in)
  );
  BBFCeil BBFCeil ( // @[DspReal.scala 107:30:@331.6]
    .out(BBFCeil_out),
    .in(BBFCeil_in)
  );
  BBFGreaterThan BBFGreaterThan ( // @[DspReal.scala 59:32:@342.6]
    .out(BBFGreaterThan_out),
    .in2(BBFGreaterThan_in2),
    .in1(BBFGreaterThan_in1)
  );
  BBFGreaterThanEquals BBFGreaterThanEquals ( // @[DspReal.scala 63:32:@355.6]
    .out(BBFGreaterThanEquals_out),
    .in2(BBFGreaterThanEquals_in2),
    .in1(BBFGreaterThanEquals_in1)
  );
  BBFSin BBFSin ( // @[DspReal.scala 185:32:@368.6]
    .out(BBFSin_out),
    .in(BBFSin_in)
  );
  BBFCos BBFCos ( // @[DspReal.scala 191:35:@379.6]
    .out(BBFCos_out),
    .in(BBFCos_in)
  );
  BBFTan BBFTan ( // @[DspReal.scala 211:35:@390.6]
    .out(BBFTan_out),
    .in(BBFTan_in)
  );
  BBFASin BBFASin ( // @[DspReal.scala 249:35:@401.6]
    .out(BBFASin_out),
    .in(BBFASin_in)
  );
  BBFACos BBFACos ( // @[DspReal.scala 257:35:@412.6]
    .out(BBFACos_out),
    .in(BBFACos_in)
  );
  BBFATan BBFATan ( // @[DspReal.scala 237:35:@423.6]
    .out(BBFATan_out),
    .in(BBFATan_in)
  );
  BBFATan2 BBFATan2 ( // @[DspReal.scala 278:41:@434.6]
    .out(BBFATan2_out),
    .in2(BBFATan2_in2),
    .in1(BBFATan2_in1)
  );
  BBFHypot BBFHypot ( // @[DspReal.scala 283:41:@447.6]
    .out(BBFHypot_out),
    .in2(BBFHypot_in2),
    .in1(BBFHypot_in1)
  );
  BBFSinh BBFSinh ( // @[DspReal.scala 290:35:@460.6]
    .out(BBFSinh_out),
    .in(BBFSinh_in)
  );
  BBFCosh BBFCosh ( // @[DspReal.scala 295:35:@471.6]
    .out(BBFCosh_out),
    .in(BBFCosh_in)
  );
  BBFTanh BBFTanh ( // @[DspReal.scala 300:35:@482.6]
    .out(BBFTanh_out),
    .in(BBFTanh_in)
  );
  BBFASinh BBFASinh ( // @[DspReal.scala 307:35:@493.6]
    .out(BBFASinh_out),
    .in(BBFASinh_in)
  );
  BBFACosh BBFACosh ( // @[DspReal.scala 313:35:@504.6]
    .out(BBFACosh_out),
    .in(BBFACosh_in)
  );
  BBFATanh BBFATanh ( // @[DspReal.scala 319:35:@515.6]
    .out(BBFATanh_out),
    .in(BBFATanh_in)
  );
  assign io_out_node = _T_165 ? _T_168_node : _GEN_25; // @[Conditional.scala 29:59:@514.4]
  assign io_boolOut = _T_82 ? _T_85 : _T_80; // @[Conditional.scala 29:59:@354.4]
  assign BBFAdd_in2 = io_in2_node;
  assign BBFAdd_in1 = io_in1_node;
  assign BBFSubtract_in2 = io_in2_node;
  assign BBFSubtract_in1 = io_in1_node;
  assign BBFMultiply_in2 = io_in2_node;
  assign BBFMultiply_in1 = io_in1_node;
  assign BBFDivide_in2 = io_in2_node;
  assign BBFDivide_in1 = io_in1_node;
  assign BBFLn_in = io_in1_node;
  assign BBFLog10_in = io_in1_node;
  assign BBFExp_in = io_in1_node;
  assign BBFSqrt_in = io_in1_node;
  assign BBFPow_in2 = io_in2_node;
  assign BBFPow_in1 = io_in1_node;
  assign BBFFloor_in = io_in1_node;
  assign BBFCeil_in = io_in1_node;
  assign BBFGreaterThan_in2 = io_in2_node;
  assign BBFGreaterThan_in1 = io_in1_node;
  assign BBFGreaterThanEquals_in2 = io_in2_node;
  assign BBFGreaterThanEquals_in1 = io_in1_node;
  assign BBFSin_in = io_in1_node;
  assign BBFCos_in = io_in1_node;
  assign BBFTan_in = io_in1_node;
  assign BBFASin_in = io_in1_node;
  assign BBFACos_in = io_in1_node;
  assign BBFATan_in = io_in1_node;
  assign BBFATan2_in2 = io_in2_node;
  assign BBFATan2_in1 = io_in1_node;
  assign BBFHypot_in2 = io_in2_node;
  assign BBFHypot_in1 = io_in1_node;
  assign BBFSinh_in = io_in1_node;
  assign BBFCosh_in = io_in1_node;
  assign BBFTanh_in = io_in1_node;
  assign BBFASinh_in = io_in1_node;
  assign BBFACosh_in = io_in1_node;
  assign BBFATanh_in = io_in1_node;
endmodule
