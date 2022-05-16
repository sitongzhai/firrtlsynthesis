module SqDist(
  input         clock,
  input         reset,
  input  [31:0] io_in1_0,
  input  [31:0] io_in1_1,
  input  [31:0] io_in1_2,
  input  [31:0] io_in1_3,
  input  [31:0] io_in1_4,
  input  [31:0] io_in1_5,
  input  [31:0] io_in1_6,
  input  [31:0] io_in1_7,
  input  [31:0] io_in1_8,
  input  [31:0] io_in1_9,
  input  [31:0] io_in2_0,
  input  [31:0] io_in2_1,
  input  [31:0] io_in2_2,
  input  [31:0] io_in2_3,
  input  [31:0] io_in2_4,
  input  [31:0] io_in2_5,
  input  [31:0] io_in2_6,
  input  [31:0] io_in2_7,
  input  [31:0] io_in2_8,
  input  [31:0] io_in2_9,
  output [31:0] io_out
);
  wire [31:0] _T_32 = $signed(io_in2_0) - $signed(io_in1_0); // @[SqDist.scala 19:51]
  wire [63:0] _T_36 = $signed(_T_32) * $signed(_T_32); // @[SqDist.scala 19:56]
  wire [31:0] _T_39 = $signed(io_in2_1) - $signed(io_in1_1); // @[SqDist.scala 19:51]
  wire [63:0] _T_43 = $signed(_T_39) * $signed(_T_39); // @[SqDist.scala 19:56]
  wire [31:0] _T_46 = $signed(io_in2_2) - $signed(io_in1_2); // @[SqDist.scala 19:51]
  wire [63:0] _T_50 = $signed(_T_46) * $signed(_T_46); // @[SqDist.scala 19:56]
  wire [31:0] _T_53 = $signed(io_in2_3) - $signed(io_in1_3); // @[SqDist.scala 19:51]
  wire [63:0] _T_57 = $signed(_T_53) * $signed(_T_53); // @[SqDist.scala 19:56]
  wire [31:0] _T_60 = $signed(io_in2_4) - $signed(io_in1_4); // @[SqDist.scala 19:51]
  wire [63:0] _T_64 = $signed(_T_60) * $signed(_T_60); // @[SqDist.scala 19:56]
  wire [31:0] _T_67 = $signed(io_in2_5) - $signed(io_in1_5); // @[SqDist.scala 19:51]
  wire [63:0] _T_71 = $signed(_T_67) * $signed(_T_67); // @[SqDist.scala 19:56]
  wire [31:0] _T_74 = $signed(io_in2_6) - $signed(io_in1_6); // @[SqDist.scala 19:51]
  wire [63:0] _T_78 = $signed(_T_74) * $signed(_T_74); // @[SqDist.scala 19:56]
  wire [31:0] _T_81 = $signed(io_in2_7) - $signed(io_in1_7); // @[SqDist.scala 19:51]
  wire [63:0] _T_85 = $signed(_T_81) * $signed(_T_81); // @[SqDist.scala 19:56]
  wire [31:0] _T_88 = $signed(io_in2_8) - $signed(io_in1_8); // @[SqDist.scala 19:51]
  wire [63:0] _T_92 = $signed(_T_88) * $signed(_T_88); // @[SqDist.scala 19:56]
  wire [31:0] _T_95 = $signed(io_in2_9) - $signed(io_in1_9); // @[SqDist.scala 19:51]
  wire [63:0] _T_99 = $signed(_T_95) * $signed(_T_95); // @[SqDist.scala 19:56]
  wire [63:0] _T_102 = $signed(_T_36) + $signed(_T_43); // @[SqDist.scala 20:22]
  wire [63:0] _T_105 = $signed(_T_102) + $signed(_T_50); // @[SqDist.scala 20:22]
  wire [63:0] _T_108 = $signed(_T_105) + $signed(_T_57); // @[SqDist.scala 20:22]
  wire [63:0] _T_111 = $signed(_T_108) + $signed(_T_64); // @[SqDist.scala 20:22]
  wire [63:0] _T_114 = $signed(_T_111) + $signed(_T_71); // @[SqDist.scala 20:22]
  wire [63:0] _T_117 = $signed(_T_114) + $signed(_T_78); // @[SqDist.scala 20:22]
  wire [63:0] _T_120 = $signed(_T_117) + $signed(_T_85); // @[SqDist.scala 20:22]
  wire [63:0] _T_123 = $signed(_T_120) + $signed(_T_92); // @[SqDist.scala 20:22]
  wire [63:0] _T_126 = $signed(_T_123) + $signed(_T_99); // @[SqDist.scala 20:22]
  wire [47:0] _GEN_0 = _T_126[63:16]; // @[SqDist.scala 32:10]
  assign io_out = _GEN_0[31:0]; // @[SqDist.scala 32:10]
endmodule
