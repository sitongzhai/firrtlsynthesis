module BinaryRepr(
  input         clock,
  input         reset,
  input  [7:0]  io_uIn,
  input  [7:0]  io_sIn,
  input  [9:0]  io_fIn,
  output        io_uOut,
  output        io_sOut,
  output        io_fOut,
  output [7:0]  io_uDiv2,
  output [7:0]  io_sDiv2,
  output [9:0]  io_fDiv2,
  output [15:0] io_uMul2,
  output [15:0] io_sMul2,
  output [19:0] io_fMul2
);
  wire [9:0] _T_14 = {$signed(io_sIn), 2'h0}; // @[FixedPointTypeClass.scala 130:22 FixedPointTypeClass.scala 131:12]
  wire [7:0] _T_17 = _T_14[9:2]; // @[FixedPointTypeClass.scala 134:23]
  wire [5:0] _T_18 = _T_17[7:2]; // @[FixedPointTypeClass.scala 154:39]
  wire [11:0] _T_21 = {$signed(io_fIn), 2'h0}; // @[FixedPointTypeClass.scala 130:22 FixedPointTypeClass.scala 131:12]
  wire [9:0] _T_24 = _T_21[11:2]; // @[FixedPointTypeClass.scala 134:23]
  wire [8:0] _T_25 = _T_24[9:1]; // @[FixedPointTypeClass.scala 154:39]
  wire [9:0] _T_26 = {io_uIn, 2'h0}; // @[UIntTypeClass.scala 123:38]
  wire [7:0] _GEN_2 = _T_25[8:1]; // @[NumbersSpec.scala 303:12]
  assign io_uOut = 1'h0; // @[NumbersSpec.scala 297:11]
  assign io_sOut = io_sIn[7]; // @[SIntTypeClass.scala 70:24]
  assign io_fOut = io_fIn[9]; // @[FixedPointTypeClass.scala 181:24]
  assign io_uDiv2 = {{2'd0}, io_uIn[7:2]}; // @[UIntTypeClass.scala 125:38]
  assign io_sDiv2 = {{2{_T_18[5]}},_T_18}; // @[FixedPointTypeClass.scala 154:39]
  assign io_fDiv2 = {{2{_GEN_2[7]}},_GEN_2}; // @[NumbersSpec.scala 303:12]
  assign io_uMul2 = {{6'd0}, _T_26}; // @[UIntTypeClass.scala 123:38]
  assign io_sMul2 = {{6{_T_14[9]}},_T_14}; // @[SIntTypeClass.scala 121:38]
  assign io_fMul2 = {{8{_T_21[11]}},_T_21}; // @[FixedPointTypeClass.scala 114:50]
endmodule
