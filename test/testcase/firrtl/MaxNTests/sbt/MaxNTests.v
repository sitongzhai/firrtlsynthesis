module MaxN(
  input  [15:0] io_ins_0,
  input  [15:0] io_ins_1,
  input  [15:0] io_ins_2,
  input  [15:0] io_ins_3,
  input  [15:0] io_ins_4,
  input  [15:0] io_ins_5,
  input  [15:0] io_ins_6,
  input  [15:0] io_ins_7,
  input  [15:0] io_ins_8,
  input  [15:0] io_ins_9,
  output [15:0] io_out
);
  wire [15:0] _T_7 = io_ins_0 > io_ins_1 ? io_ins_0 : io_ins_1; // @[MaxN.scala 10:43]
  wire [15:0] _T_9 = _T_7 > io_ins_2 ? _T_7 : io_ins_2; // @[MaxN.scala 10:43]
  wire [15:0] _T_11 = _T_9 > io_ins_3 ? _T_9 : io_ins_3; // @[MaxN.scala 10:43]
  wire [15:0] _T_13 = _T_11 > io_ins_4 ? _T_11 : io_ins_4; // @[MaxN.scala 10:43]
  wire [15:0] _T_15 = _T_13 > io_ins_5 ? _T_13 : io_ins_5; // @[MaxN.scala 10:43]
  wire [15:0] _T_17 = _T_15 > io_ins_6 ? _T_15 : io_ins_6; // @[MaxN.scala 10:43]
  wire [15:0] _T_19 = _T_17 > io_ins_7 ? _T_17 : io_ins_7; // @[MaxN.scala 10:43]
  wire [15:0] _T_21 = _T_19 > io_ins_8 ? _T_19 : io_ins_8; // @[MaxN.scala 10:43]
  assign io_out = _T_21 > io_ins_9 ? _T_21 : io_ins_9; // @[MaxN.scala 10:43]
endmodule
module MaxNTests(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] c_io_ins_0; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_1; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_2; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_3; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_4; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_5; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_6; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_7; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_8; // @[MaxN.scala 20:33]
  wire [15:0] c_io_ins_9; // @[MaxN.scala 20:33]
  wire [15:0] c_io_out; // @[MaxN.scala 20:33]
  reg [3:0] value; // @[Counter.scala 17:33]
  reg  _T_6; // @[SteppedHWIOTester.scala 177:33]
  wire  _T_8 = ~_T_6; // @[SteppedHWIOTester.scala 179:10]
  wire [15:0] _GEN_1 = 4'h1 == value ? 16'h4e8f : 16'h6987; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_2 = 4'h2 == value ? 16'haab6 : _GEN_1; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_3 = 4'h3 == value ? 16'hbe94 : _GEN_2; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_4 = 4'h4 == value ? 16'h1531 : _GEN_3; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_5 = 4'h5 == value ? 16'hc54 : _GEN_4; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_6 = 4'h6 == value ? 16'h64c : _GEN_5; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_7 = 4'h7 == value ? 16'h30cc : _GEN_6; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_8 = 4'h8 == value ? 16'h189c : _GEN_7; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_9 = 4'h9 == value ? 16'h601d : _GEN_8; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_12 = 4'h1 == value ? 16'h1074 : 16'hfc13; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_13 = 4'h2 == value ? 16'hd0e1 : _GEN_12; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_14 = 4'h3 == value ? 16'hb81 : _GEN_13; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_15 = 4'h4 == value ? 16'h4073 : _GEN_14; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_16 = 4'h5 == value ? 16'hc49d : _GEN_15; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_17 = 4'h6 == value ? 16'h50f8 : _GEN_16; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_18 = 4'h7 == value ? 16'h4982 : _GEN_17; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_19 = 4'h8 == value ? 16'hb681 : _GEN_18; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_20 = 4'h9 == value ? 16'hcd : _GEN_19; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_23 = 4'h1 == value ? 16'hb8ec : 16'h86d5; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_24 = 4'h2 == value ? 16'h124d : _GEN_23; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_25 = 4'h3 == value ? 16'hdda1 : _GEN_24; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_26 = 4'h4 == value ? 16'h279 : _GEN_25; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_27 = 4'h5 == value ? 16'hc878 : _GEN_26; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_28 = 4'h6 == value ? 16'hc93a : _GEN_27; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_29 = 4'h7 == value ? 16'hb96b : _GEN_28; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_30 = 4'h8 == value ? 16'hda52 : _GEN_29; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_31 = 4'h9 == value ? 16'hc19 : _GEN_30; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_34 = 4'h1 == value ? 16'h24aa : 16'h2249; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_35 = 4'h2 == value ? 16'h56b9 : _GEN_34; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_36 = 4'h3 == value ? 16'h2dd2 : _GEN_35; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_37 = 4'h4 == value ? 16'hc574 : _GEN_36; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_38 = 4'h5 == value ? 16'h3a4 : _GEN_37; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_39 = 4'h6 == value ? 16'he213 : _GEN_38; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_40 = 4'h7 == value ? 16'hcdec : _GEN_39; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_41 = 4'h8 == value ? 16'hfdef : _GEN_40; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_42 = 4'h9 == value ? 16'h773 : _GEN_41; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_45 = 4'h1 == value ? 16'habcb : 16'hb9cc; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_46 = 4'h2 == value ? 16'hb083 : _GEN_45; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_47 = 4'h3 == value ? 16'h88aa : _GEN_46; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_48 = 4'h4 == value ? 16'h6a2e : _GEN_47; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_49 = 4'h5 == value ? 16'h652c : _GEN_48; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_50 = 4'h6 == value ? 16'hee10 : _GEN_49; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_51 = 4'h7 == value ? 16'he781 : _GEN_50; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_52 = 4'h8 == value ? 16'h78b3 : _GEN_51; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_53 = 4'h9 == value ? 16'hc9a8 : _GEN_52; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_56 = 4'h1 == value ? 16'h125 : 16'hfa83; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_57 = 4'h2 == value ? 16'hf8b7 : _GEN_56; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_58 = 4'h3 == value ? 16'hdabf : _GEN_57; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_59 = 4'h4 == value ? 16'h3613 : _GEN_58; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_60 = 4'h5 == value ? 16'hda92 : _GEN_59; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_61 = 4'h6 == value ? 16'hf64a : _GEN_60; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_62 = 4'h7 == value ? 16'h764b : _GEN_61; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_63 = 4'h8 == value ? 16'h5a65 : _GEN_62; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_64 = 4'h9 == value ? 16'hf8d1 : _GEN_63; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_67 = 4'h1 == value ? 16'h5bf2 : 16'h8bcf; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_68 = 4'h2 == value ? 16'h9b40 : _GEN_67; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_69 = 4'h3 == value ? 16'h4fb6 : _GEN_68; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_70 = 4'h4 == value ? 16'hf2bc : _GEN_69; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_71 = 4'h5 == value ? 16'h9e56 : _GEN_70; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_72 = 4'h6 == value ? 16'h7a93 : _GEN_71; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_73 = 4'h7 == value ? 16'ha820 : _GEN_72; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_74 = 4'h8 == value ? 16'h916f : _GEN_73; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_75 = 4'h9 == value ? 16'h1cd4 : _GEN_74; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_78 = 4'h1 == value ? 16'hb70c : 16'he63a; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_79 = 4'h2 == value ? 16'h5932 : _GEN_78; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_80 = 4'h3 == value ? 16'h9cd2 : _GEN_79; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_81 = 4'h4 == value ? 16'hb13a : _GEN_80; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_82 = 4'h5 == value ? 16'hf201 : _GEN_81; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_83 = 4'h6 == value ? 16'hfe54 : _GEN_82; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_84 = 4'h7 == value ? 16'had67 : _GEN_83; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_85 = 4'h8 == value ? 16'h8078 : _GEN_84; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_86 = 4'h9 == value ? 16'h1255 : _GEN_85; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_89 = 4'h1 == value ? 16'h7684 : 16'h1543; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_90 = 4'h2 == value ? 16'hdbfe : _GEN_89; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_91 = 4'h3 == value ? 16'h37b2 : _GEN_90; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_92 = 4'h4 == value ? 16'hb672 : _GEN_91; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_93 = 4'h5 == value ? 16'h64ea : _GEN_92; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_94 = 4'h6 == value ? 16'h2b98 : _GEN_93; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_95 = 4'h7 == value ? 16'h7101 : _GEN_94; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_96 = 4'h8 == value ? 16'hf822 : _GEN_95; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_97 = 4'h9 == value ? 16'h7bd1 : _GEN_96; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_100 = 4'h1 == value ? 16'h4635 : 16'h2f9d; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_101 = 4'h2 == value ? 16'heeaf : _GEN_100; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_102 = 4'h3 == value ? 16'h3412 : _GEN_101; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_103 = 4'h4 == value ? 16'hb09f : _GEN_102; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_104 = 4'h5 == value ? 16'h9c95 : _GEN_103; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_105 = 4'h6 == value ? 16'h24cc : _GEN_104; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_106 = 4'h7 == value ? 16'h5210 : _GEN_105; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_107 = 4'h8 == value ? 16'h90c3 : _GEN_106; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [15:0] _GEN_108 = 4'h9 == value ? 16'h234 : _GEN_107; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire  _GEN_120 = 4'ha == value ? 1'h0 : 1'h1; // @[SteppedHWIOTester.scala 144:51 SteppedHWIOTester.scala 144:51]
  wire [15:0] _GEN_122 = 4'h1 == value ? 16'hb8ec : 16'hfc13; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_123 = 4'h2 == value ? 16'hf8b7 : _GEN_122; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_124 = 4'h3 == value ? 16'hdda1 : _GEN_123; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_125 = 4'h4 == value ? 16'hf2bc : _GEN_124; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_126 = 4'h5 == value ? 16'hf201 : _GEN_125; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_127 = 4'h6 == value ? 16'hfe54 : _GEN_126; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_128 = 4'h7 == value ? 16'he781 : _GEN_127; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_129 = 4'h8 == value ? 16'hfdef : _GEN_128; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_130 = 4'h9 == value ? 16'hf8d1 : _GEN_129; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [15:0] _GEN_131 = 4'ha == value ? 16'h0 : _GEN_130; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire  _T_380 = ~(c_io_out == _GEN_131); // @[SteppedHWIOTester.scala 145:72]
  wire  _T_383 = ~reset; // @[SteppedHWIOTester.scala 151:15]
  wire  _T_391 = value == 4'ha; // @[Counter.scala 25:24]
  wire [3:0] _T_394 = value + 4'h1; // @[Counter.scala 26:22]
  wire  _GEN_133 = _T_391 | _T_6; // @[SteppedHWIOTester.scala 183:22 SteppedHWIOTester.scala 185:14 SteppedHWIOTester.scala 177:33]
  wire  _GEN_147 = _T_8 & _GEN_120 & _T_380; // @[SteppedHWIOTester.scala 151:15]
  wire  _GEN_154 = _T_8 & _T_391; // @[SteppedHWIOTester.scala 184:15]
  MaxN c ( // @[MaxN.scala 20:33]
    .io_ins_0(c_io_ins_0),
    .io_ins_1(c_io_ins_1),
    .io_ins_2(c_io_ins_2),
    .io_ins_3(c_io_ins_3),
    .io_ins_4(c_io_ins_4),
    .io_ins_5(c_io_ins_5),
    .io_ins_6(c_io_ins_6),
    .io_ins_7(c_io_ins_7),
    .io_ins_8(c_io_ins_8),
    .io_ins_9(c_io_ins_9),
    .io_out(c_io_out)
  );
  assign c_io_ins_0 = 4'ha == value ? 16'h601d : _GEN_9; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_1 = 4'ha == value ? 16'hc19 : _GEN_31; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_2 = 4'ha == value ? 16'hc9a8 : _GEN_53; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_3 = 4'ha == value ? 16'h1255 : _GEN_86; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_4 = 4'ha == value ? 16'hcd : _GEN_20; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_5 = 4'ha == value ? 16'h773 : _GEN_42; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_6 = 4'ha == value ? 16'h1cd4 : _GEN_75; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_7 = 4'ha == value ? 16'h7bd1 : _GEN_97; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_8 = 4'ha == value ? 16'h234 : _GEN_108; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_ins_9 = 4'ha == value ? 16'hf8d1 : _GEN_64; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      if (_T_391) begin // @[Counter.scala 28:21]
        value <= 4'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_394; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[SteppedHWIOTester.scala 177:33]
      _T_6 <= 1'h0; // @[SteppedHWIOTester.scala 177:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      _T_6 <= _GEN_133;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & _GEN_120 & _T_380 & ~reset) begin
          $fwrite(32'h80000002,"    failed on step %d -- port out:  %d expected %d\n",value,c_io_out,_GEN_131); // @[SteppedHWIOTester.scala 151:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_147 & _T_383) begin
          $fwrite(32'h80000002,"Assertion failed\n    at SteppedHWIOTester.scala:158 assert(false.B)\n"); // @[SteppedHWIOTester.scala 158:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_147 & _T_383) begin
          $fatal; // @[SteppedHWIOTester.scala 158:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_147 & _T_383) begin
          $finish; // @[SteppedHWIOTester.scala 159:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & _T_391 & _T_383) begin
          $fwrite(32'h80000002,"Stopping, end of tests, 11 steps\n"); // @[SteppedHWIOTester.scala 184:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_383) begin
          $finish; // @[SteppedHWIOTester.scala 186:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  value = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  _T_6 = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
