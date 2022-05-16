module ContextNestingBottom(
  input  [3:0] io_in1,
  input  [3:0] io_in2,
  output [4:0] io_outDefault,
  output [4:0] io_outWrap,
  output [4:0] io_outGrow
);
  wire [3:0] _T_3 = io_in1 + io_in2; // @[UIntTypeClass.scala 23:22]
  assign io_outDefault = {{1'd0}, _T_3}; // @[UIntTypeClass.scala 23:22]
  assign io_outWrap = {{1'd0}, _T_3}; // @[UIntTypeClass.scala 23:22]
  assign io_outGrow = io_in1 + io_in2; // @[UIntTypeClass.scala 22:22]
endmodule
module ContextNestingBottom_1(
  input  [3:0] io_in1,
  input  [3:0] io_in2,
  output [4:0] io_outDefault,
  output [4:0] io_outWrap,
  output [4:0] io_outGrow
);
  wire [3:0] _T_3 = io_in1 + io_in2; // @[UIntTypeClass.scala 23:22]
  assign io_outDefault = io_in1 + io_in2; // @[UIntTypeClass.scala 22:22]
  assign io_outWrap = {{1'd0}, _T_3}; // @[UIntTypeClass.scala 23:22]
  assign io_outGrow = io_in1 + io_in2; // @[UIntTypeClass.scala 22:22]
endmodule
module ContextNestingTop(
  input        clock,
  input        reset,
  input  [3:0] io_in1,
  input  [3:0] io_in2,
  output [4:0] io_mod1Default,
  output [4:0] io_mod1Wrap,
  output [4:0] io_mod1Grow,
  output [4:0] io_mod2Default,
  output [4:0] io_mod2Wrap,
  output [4:0] io_mod2Grow
);
  wire [3:0] ContextNestingBottom_io_in1; // @[DspContextSpec.scala 107:64]
  wire [3:0] ContextNestingBottom_io_in2; // @[DspContextSpec.scala 107:64]
  wire [4:0] ContextNestingBottom_io_outDefault; // @[DspContextSpec.scala 107:64]
  wire [4:0] ContextNestingBottom_io_outWrap; // @[DspContextSpec.scala 107:64]
  wire [4:0] ContextNestingBottom_io_outGrow; // @[DspContextSpec.scala 107:64]
  wire [3:0] ContextNestingBottom_1_io_in1; // @[DspContextSpec.scala 108:64]
  wire [3:0] ContextNestingBottom_1_io_in2; // @[DspContextSpec.scala 108:64]
  wire [4:0] ContextNestingBottom_1_io_outDefault; // @[DspContextSpec.scala 108:64]
  wire [4:0] ContextNestingBottom_1_io_outWrap; // @[DspContextSpec.scala 108:64]
  wire [4:0] ContextNestingBottom_1_io_outGrow; // @[DspContextSpec.scala 108:64]
  ContextNestingBottom ContextNestingBottom ( // @[DspContextSpec.scala 107:64]
    .io_in1(ContextNestingBottom_io_in1),
    .io_in2(ContextNestingBottom_io_in2),
    .io_outDefault(ContextNestingBottom_io_outDefault),
    .io_outWrap(ContextNestingBottom_io_outWrap),
    .io_outGrow(ContextNestingBottom_io_outGrow)
  );
  ContextNestingBottom_1 ContextNestingBottom_1 ( // @[DspContextSpec.scala 108:64]
    .io_in1(ContextNestingBottom_1_io_in1),
    .io_in2(ContextNestingBottom_1_io_in2),
    .io_outDefault(ContextNestingBottom_1_io_outDefault),
    .io_outWrap(ContextNestingBottom_1_io_outWrap),
    .io_outGrow(ContextNestingBottom_1_io_outGrow)
  );
  assign io_mod1Default = ContextNestingBottom_io_outDefault; // @[DspContextSpec.scala 115:18]
  assign io_mod1Wrap = ContextNestingBottom_io_outWrap; // @[DspContextSpec.scala 116:18]
  assign io_mod1Grow = ContextNestingBottom_io_outGrow; // @[DspContextSpec.scala 117:18]
  assign io_mod2Default = ContextNestingBottom_1_io_outDefault; // @[DspContextSpec.scala 118:18]
  assign io_mod2Wrap = ContextNestingBottom_1_io_outWrap; // @[DspContextSpec.scala 119:18]
  assign io_mod2Grow = ContextNestingBottom_1_io_outGrow; // @[DspContextSpec.scala 120:18]
  assign ContextNestingBottom_io_in1 = io_in1; // @[DspContextSpec.scala 110:15]
  assign ContextNestingBottom_io_in2 = io_in2; // @[DspContextSpec.scala 111:15]
  assign ContextNestingBottom_1_io_in1 = io_in1; // @[DspContextSpec.scala 112:15]
  assign ContextNestingBottom_1_io_in2 = io_in2; // @[DspContextSpec.scala 113:15]
endmodule
