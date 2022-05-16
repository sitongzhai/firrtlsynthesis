module ContextNestingBottom( // @[:@3.2]
  input  [3:0] io_in1, // @[:@6.4]
  input  [3:0] io_in2, // @[:@6.4]
  output [4:0] io_outDefault, // @[:@6.4]
  output [4:0] io_outWrap, // @[:@6.4]
  output [4:0] io_outGrow // @[:@6.4]
);
  wire [3:0] _T_3 = io_in1 + io_in2; // @[UIntTypeClass.scala 23:22:@12.4]
  assign io_outDefault = {{1'd0}, _T_3}; // @[UIntTypeClass.scala 23:22:@17.4]
  assign io_outWrap = {{1'd0}, _T_3}; // @[UIntTypeClass.scala 23:22:@12.4]
  assign io_outGrow = io_in1 + io_in2; // @[UIntTypeClass.scala 22:22:@14.4]
endmodule
module ContextNestingBottom_1( // @[:@20.2]
  input  [3:0] io_in1, // @[:@23.4]
  input  [3:0] io_in2, // @[:@23.4]
  output [4:0] io_outDefault, // @[:@23.4]
  output [4:0] io_outWrap, // @[:@23.4]
  output [4:0] io_outGrow // @[:@23.4]
);
  wire [3:0] _T_3 = io_in1 + io_in2; // @[UIntTypeClass.scala 23:22:@29.4]
  assign io_outDefault = io_in1 + io_in2; // @[UIntTypeClass.scala 22:22:@33.4]
  assign io_outWrap = {{1'd0}, _T_3}; // @[UIntTypeClass.scala 23:22:@29.4]
  assign io_outGrow = io_in1 + io_in2; // @[UIntTypeClass.scala 22:22:@31.4]
endmodule
module ContextNestingTop( // @[:@36.2]
  input        clock, // @[:@37.4]
  input        reset, // @[:@38.4]
  input  [3:0] io_in1, // @[:@39.4]
  input  [3:0] io_in2, // @[:@39.4]
  output [4:0] io_mod1Default, // @[:@39.4]
  output [4:0] io_mod1Wrap, // @[:@39.4]
  output [4:0] io_mod1Grow, // @[:@39.4]
  output [4:0] io_mod2Default, // @[:@39.4]
  output [4:0] io_mod2Wrap, // @[:@39.4]
  output [4:0] io_mod2Grow // @[:@39.4]
);
  wire [3:0] ContextNestingBottom_io_in1; // @[DspContextSpec.scala 107:64:@44.4]
  wire [3:0] ContextNestingBottom_io_in2; // @[DspContextSpec.scala 107:64:@44.4]
  wire [4:0] ContextNestingBottom_io_outDefault; // @[DspContextSpec.scala 107:64:@44.4]
  wire [4:0] ContextNestingBottom_io_outWrap; // @[DspContextSpec.scala 107:64:@44.4]
  wire [4:0] ContextNestingBottom_io_outGrow; // @[DspContextSpec.scala 107:64:@44.4]
  wire [3:0] ContextNestingBottom_1_io_in1; // @[DspContextSpec.scala 108:64:@48.4]
  wire [3:0] ContextNestingBottom_1_io_in2; // @[DspContextSpec.scala 108:64:@48.4]
  wire [4:0] ContextNestingBottom_1_io_outDefault; // @[DspContextSpec.scala 108:64:@48.4]
  wire [4:0] ContextNestingBottom_1_io_outWrap; // @[DspContextSpec.scala 108:64:@48.4]
  wire [4:0] ContextNestingBottom_1_io_outGrow; // @[DspContextSpec.scala 108:64:@48.4]
  ContextNestingBottom ContextNestingBottom ( // @[DspContextSpec.scala 107:64:@44.4]
    .io_in1(ContextNestingBottom_io_in1),
    .io_in2(ContextNestingBottom_io_in2),
    .io_outDefault(ContextNestingBottom_io_outDefault),
    .io_outWrap(ContextNestingBottom_io_outWrap),
    .io_outGrow(ContextNestingBottom_io_outGrow)
  );
  ContextNestingBottom_1 ContextNestingBottom_1 ( // @[DspContextSpec.scala 108:64:@48.4]
    .io_in1(ContextNestingBottom_1_io_in1),
    .io_in2(ContextNestingBottom_1_io_in2),
    .io_outDefault(ContextNestingBottom_1_io_outDefault),
    .io_outWrap(ContextNestingBottom_1_io_outWrap),
    .io_outGrow(ContextNestingBottom_1_io_outGrow)
  );
  assign io_mod1Default = ContextNestingBottom_io_outDefault;
  assign io_mod1Wrap = ContextNestingBottom_io_outWrap;
  assign io_mod1Grow = ContextNestingBottom_io_outGrow;
  assign io_mod2Default = ContextNestingBottom_1_io_outDefault;
  assign io_mod2Wrap = ContextNestingBottom_1_io_outWrap;
  assign io_mod2Grow = ContextNestingBottom_1_io_outGrow;
  assign ContextNestingBottom_io_in1 = io_in1;
  assign ContextNestingBottom_io_in2 = io_in2;
  assign ContextNestingBottom_1_io_in1 = io_in1;
  assign ContextNestingBottom_1_io_in2 = io_in2;
endmodule
