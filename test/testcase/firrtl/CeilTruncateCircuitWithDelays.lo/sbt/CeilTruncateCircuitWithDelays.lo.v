module CeilTruncateCircuitWithDelays( // @[:@32.2]
  input         clock, // @[:@33.4]
  input         reset, // @[:@34.4]
  input  [11:0] io_inFixed, // @[:@35.4]
  input  [63:0] io_inReal_node, // @[:@35.4]
  output [11:0] io_outFixedCeil, // @[:@35.4]
  output [63:0] io_outRealCeil_node, // @[:@35.4]
  output [11:0] io_outFixedTruncate, // @[:@35.4]
  output [63:0] io_outRealTruncate_node // @[:@35.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] BBFCeil_out; // @[DspReal.scala 107:30:@79.4]
  wire [63:0] BBFCeil_in; // @[DspReal.scala 107:30:@79.4]
  wire  BBFLessThan_out; // @[DspReal.scala 67:32:@137.4]
  wire [63:0] BBFLessThan_in2; // @[DspReal.scala 67:32:@137.4]
  wire [63:0] BBFLessThan_in1; // @[DspReal.scala 67:32:@137.4]
  wire [63:0] BBFCeil_1_out; // @[DspReal.scala 107:30:@146.4]
  wire [63:0] BBFCeil_1_in; // @[DspReal.scala 107:30:@146.4]
  wire [63:0] BBFFloor_out; // @[DspReal.scala 103:30:@153.4]
  wire [63:0] BBFFloor_in; // @[DspReal.scala 103:30:@153.4]
  reg [11:0] _T_16; // @[Reg.scala 12:16:@40.4]
  reg [11:0] _T_18; // @[Reg.scala 12:16:@44.4]
  wire [7:0] _T_19 = _T_18[11:4]; // @[FixedPointTypeClass.scala 69:58:@48.4]
  wire [11:0] _GEN_18 = {$signed(_T_19), 4'h0}; // @[FixedPointTypeClass.scala 70:40:@49.4]
  wire  _T_20 = $signed(_T_18) == $signed(_GEN_18); // @[FixedPointTypeClass.scala 70:40:@49.4]
  reg [11:0] _T_23; // @[Reg.scala 12:16:@50.4]
  reg [11:0] _T_25; // @[Reg.scala 12:16:@54.4]
  wire [7:0] _T_26 = _T_25[11:4]; // @[FixedPointTypeClass.scala 69:58:@58.4]
  wire [7:0] _T_27 = io_inFixed[11:4]; // @[FixedPointTypeClass.scala 69:58:@59.4]
  reg [8:0] _T_32; // @[Reg.scala 12:16:@61.4]
  reg [8:0] _T_34; // @[Reg.scala 12:16:@65.4]
  wire [8:0] _T_36 = _T_20 ? $signed({{1{_T_26[7]}},_T_26}) : $signed(_T_34); // @[FixedPointTypeClass.scala 187:8:@69.4]
  reg [63:0] _T_40_node; // @[Reg.scala 12:16:@71.4]
  reg [63:0] _T_44_node; // @[Reg.scala 12:16:@75.4]
  reg [11:0] _T_52; // @[Reg.scala 12:16:@87.4]
  reg [11:0] _T_54; // @[Reg.scala 12:16:@91.4]
  reg [11:0] _T_58; // @[Reg.scala 12:16:@96.4]
  reg [11:0] _T_60; // @[Reg.scala 12:16:@100.4]
  wire [7:0] _T_61 = _T_60[11:4]; // @[FixedPointTypeClass.scala 69:58:@104.4]
  wire [11:0] _GEN_19 = {$signed(_T_61), 4'h0}; // @[FixedPointTypeClass.scala 70:40:@105.4]
  wire  _T_62 = $signed(_T_60) == $signed(_GEN_19); // @[FixedPointTypeClass.scala 70:40:@105.4]
  reg [11:0] _T_65; // @[Reg.scala 12:16:@106.4]
  reg [11:0] _T_67; // @[Reg.scala 12:16:@110.4]
  wire [7:0] _T_68 = _T_67[11:4]; // @[FixedPointTypeClass.scala 69:58:@114.4]
  reg [8:0] _T_74; // @[Reg.scala 12:16:@117.4]
  reg [8:0] _T_76; // @[Reg.scala 12:16:@121.4]
  wire [8:0] _T_78 = _T_62 ? $signed({{1{_T_68[7]}},_T_68}) : $signed(_T_76); // @[FixedPointTypeClass.scala 187:8:@125.4]
  reg [11:0] _T_81; // @[Reg.scala 12:16:@126.4]
  reg [11:0] _T_83; // @[Reg.scala 12:16:@130.4]
  wire [7:0] _T_84 = _T_83[11:4]; // @[FixedPointTypeClass.scala 69:58:@134.4]
  wire [8:0] _T_86 = _T_54[11] ? $signed(_T_78) : $signed({{1{_T_84[7]}},_T_84}); // @[FixedPointTypeClass.scala 73:8:@135.4]
  wire  _T_90 = BBFLessThan_out; // @[DspReal.scala 37:19:@143.4]
  wire [63:0] _T_93_node = BBFCeil_1_out; // @[DspReal.scala 19:19:@150.4]
  wire [63:0] _T_97_node = BBFFloor_out; // @[DspReal.scala 19:19:@157.4]
  wire [12:0] _GEN_20 = {$signed(_T_36), 4'h0};
  wire [12:0] _GEN_22 = {$signed(_T_86), 4'h0};
  BBFCeil BBFCeil ( // @[DspReal.scala 107:30:@79.4]
    .out(BBFCeil_out),
    .in(BBFCeil_in)
  );
  BBFLessThan BBFLessThan ( // @[DspReal.scala 67:32:@137.4]
    .out(BBFLessThan_out),
    .in2(BBFLessThan_in2),
    .in1(BBFLessThan_in1)
  );
  BBFCeil BBFCeil_1 ( // @[DspReal.scala 107:30:@146.4]
    .out(BBFCeil_1_out),
    .in(BBFCeil_1_in)
  );
  BBFFloor BBFFloor ( // @[DspReal.scala 103:30:@153.4]
    .out(BBFFloor_out),
    .in(BBFFloor_in)
  );
  assign io_outFixedCeil = _GEN_20[11:0];
  assign io_outRealCeil_node = BBFCeil_out; // @[DspReal.scala 19:19:@83.4]
  assign io_outFixedTruncate = _GEN_22[11:0];
  assign io_outRealTruncate_node = _T_90 ? _T_93_node : _T_97_node; // @[DspReal.scala 113:8:@160.4]
  assign BBFCeil_in = _T_44_node;
  assign BBFLessThan_in2 = 64'h0;
  assign BBFLessThan_in1 = io_inReal_node;
  assign BBFCeil_1_in = io_inReal_node;
  assign BBFFloor_in = io_inReal_node;
  always @(posedge clock) begin
    _T_16 <= io_inFixed; // @[Reg.scala 13:19:@41.4]
    _T_18 <= _T_16; // @[Reg.scala 13:19:@45.4]
    _T_23 <= io_inFixed; // @[Reg.scala 13:19:@51.4]
    _T_25 <= _T_23; // @[Reg.scala 13:19:@55.4]
    _T_32 <= $signed(_T_27) + 8'sh1; // @[FixedPointTypeClass.scala 25:22:@60.4]
    _T_34 <= _T_32; // @[Reg.scala 13:19:@66.4]
    _T_40_node <= io_inReal_node; // @[Reg.scala 13:19:@72.4]
    _T_44_node <= _T_40_node; // @[Reg.scala 13:19:@76.4]
    _T_52 <= io_inFixed; // @[Reg.scala 13:19:@88.4]
    _T_54 <= _T_52; // @[Reg.scala 13:19:@92.4]
    _T_58 <= io_inFixed; // @[Reg.scala 13:19:@97.4]
    _T_60 <= _T_58; // @[Reg.scala 13:19:@101.4]
    _T_65 <= io_inFixed; // @[Reg.scala 13:19:@107.4]
    _T_67 <= _T_65; // @[Reg.scala 13:19:@111.4]
    _T_74 <= $signed(_T_27) + 8'sh1; // @[FixedPointTypeClass.scala 25:22:@116.4]
    _T_76 <= _T_74; // @[Reg.scala 13:19:@122.4]
    _T_81 <= io_inFixed; // @[Reg.scala 13:19:@127.4]
    _T_83 <= _T_81; // @[Reg.scala 13:19:@131.4]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_16 = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  _T_18 = _RAND_1[11:0];
  _RAND_2 = {1{`RANDOM}};
  _T_23 = _RAND_2[11:0];
  _RAND_3 = {1{`RANDOM}};
  _T_25 = _RAND_3[11:0];
  _RAND_4 = {1{`RANDOM}};
  _T_32 = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  _T_34 = _RAND_5[8:0];
  _RAND_6 = {2{`RANDOM}};
  _T_40_node = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  _T_44_node = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  _T_52 = _RAND_8[11:0];
  _RAND_9 = {1{`RANDOM}};
  _T_54 = _RAND_9[11:0];
  _RAND_10 = {1{`RANDOM}};
  _T_58 = _RAND_10[11:0];
  _RAND_11 = {1{`RANDOM}};
  _T_60 = _RAND_11[11:0];
  _RAND_12 = {1{`RANDOM}};
  _T_65 = _RAND_12[11:0];
  _RAND_13 = {1{`RANDOM}};
  _T_67 = _RAND_13[11:0];
  _RAND_14 = {1{`RANDOM}};
  _T_74 = _RAND_14[8:0];
  _RAND_15 = {1{`RANDOM}};
  _T_76 = _RAND_15[8:0];
  _RAND_16 = {1{`RANDOM}};
  _T_81 = _RAND_16[11:0];
  _RAND_17 = {1{`RANDOM}};
  _T_83 = _RAND_17[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
