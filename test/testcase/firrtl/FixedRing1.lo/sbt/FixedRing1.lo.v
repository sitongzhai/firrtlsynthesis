module FixedRing1( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [15:0] io_in, // @[:@6.4]
  output [15:0] io_floor, // @[:@6.4]
  output [15:0] io_ceil, // @[:@6.4]
  output        io_isWhole, // @[:@6.4]
  output [15:0] io_round, // @[:@6.4]
  output [63:0] io_real_node // @[:@6.4]
);
  wire [11:0] _T_9 = io_in[15:4]; // @[FixedPointTypeClass.scala 69:58:@11.4]
  wire [15:0] _GEN_0 = {$signed(_T_9), 4'h0}; // @[FixedPointTypeClass.scala 70:40:@14.4]
  wire  _T_12 = $signed(io_in) == $signed(_GEN_0); // @[FixedPointTypeClass.scala 70:40:@14.4]
  wire [12:0] _T_17 = $signed(_T_9) + 12'sh1; // @[FixedPointTypeClass.scala 25:22:@17.4]
  wire [12:0] _T_20 = _T_12 ? $signed({{1{_T_9[11]}},_T_9}) : $signed(_T_17); // @[FixedPointTypeClass.scala 187:8:@18.4]
  wire [16:0] _T_24 = $signed(io_in) + 16'sh8; // @[FixedPointTypeClass.scala 25:22:@23.4]
  wire [12:0] _T_26 = _T_24[16:4]; // @[FixedPointTypeClass.scala 69:58:@24.4]
  wire [16:0] _GEN_2 = {$signed(_T_20), 4'h0};
  wire [16:0] _GEN_5 = {$signed(_T_26), 4'h0};
  assign io_floor = {$signed(_T_9), 4'h0};
  assign io_ceil = _GEN_2[15:0];
  assign io_isWhole = $signed(io_in) == $signed(_GEN_0); // @[FixedPointTypeClass.scala 70:40:@21.4]
  assign io_round = _GEN_5[15:0];
  assign io_real_node = 64'h0;
endmodule
