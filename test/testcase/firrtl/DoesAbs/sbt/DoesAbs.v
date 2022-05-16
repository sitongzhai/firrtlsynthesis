module DoesAbs(
  input        clock,
  input        reset,
  input  [3:0] io_uIn,
  input  [3:0] io_sIn,
  input  [4:0] io_fIn,
  output [3:0] io_uAbsGrow,
  output [3:0] io_uAbsWrap,
  output [4:0] io_sAbsGrow,
  output [3:0] io_sAbsWrap,
  output [5:0] io_fAbsGrow,
  output [4:0] io_fAbsWrap
);
  wire  _T_8 = $signed(io_sIn) >= 4'sh0; // @[SIntTypeClass.scala 144:45]
  wire [4:0] _T_11 = 4'sh0 - $signed(io_sIn); // @[SIntTypeClass.scala 31:22]
  wire [3:0] _T_21 = 4'sh0 - $signed(io_sIn); // @[SIntTypeClass.scala 32:22]
  wire [5:0] _T_27 = 5'sh0 - $signed(io_fIn); // @[FixedPointTypeClass.scala 34:22]
  wire [4:0] _T_37 = 5'sh0 - $signed(io_fIn); // @[FixedPointTypeClass.scala 35:22]
  assign io_uAbsGrow = io_uIn; // @[AbsSpec.scala 79:15]
  assign io_uAbsWrap = io_uIn; // @[AbsSpec.scala 80:15]
  assign io_sAbsGrow = _T_8 ? $signed({{1{io_sIn[3]}},io_sIn}) : $signed(_T_11); // @[SIntTypeClass.scala 143:8]
  assign io_sAbsWrap = _T_8 ? $signed(io_sIn) : $signed(_T_21); // @[SIntTypeClass.scala 143:8]
  assign io_fAbsGrow = io_fIn[4] ? $signed(_T_27) : $signed({{1{io_fIn[4]}},io_fIn}); // @[FixedPointTypeClass.scala 207:8]
  assign io_fAbsWrap = io_fIn[4] ? $signed(_T_37) : $signed(io_fIn); // @[FixedPointTypeClass.scala 207:8]
endmodule
