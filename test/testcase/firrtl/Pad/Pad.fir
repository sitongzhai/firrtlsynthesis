;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Pad :
  module Pad :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip u0 : UInt<4>, flip u1 : UInt<5>, flip s0 : SInt<4>, flip s1 : SInt<5>, uout_cat_u : UInt<9>, uout_cat_s : UInt<9>, uout_pad : UInt<8>, sout_pad : SInt<8>, uout_bits_u : UInt<3>, uout_bits_s : UInt<3>, uout_head_u : UInt<3>, uout_head_s : UInt<3>, uout_tail_u : UInt<3>, uout_tail_s : UInt<3>}

    node _T_33 = cat(io.u1, io.u0) @[Cat.scala 30:58]
    io.uout_cat_u <= _T_33 @[Pad.scala 25:17]
    node _T_34 = asUInt(io.s0) @[Cat.scala 30:58]
    node _T_35 = asUInt(io.s1) @[Cat.scala 30:58]
    node _T_36 = cat(_T_35, _T_34) @[Cat.scala 30:58]
    io.uout_cat_s <= _T_36 @[Pad.scala 26:17]
    node _T_37 = pad(io.u0, 8) @[Pad.scala 27:27]
    io.uout_pad <= _T_37 @[Pad.scala 27:15]
    node _T_38 = pad(io.s0, 8) @[Pad.scala 28:27]
    io.sout_pad <= _T_38 @[Pad.scala 28:15]
    node _T_39 = bits(io.u1, 3, 1) @[Pad.scala 30:26]
    io.uout_bits_u <= _T_39 @[Pad.scala 30:18]
    node _T_40 = bits(io.s1, 3, 1) @[Pad.scala 31:26]
    io.uout_bits_s <= _T_40 @[Pad.scala 31:18]
    node _T_41 = head(io.u0, 3) @[Pad.scala 33:31]
    io.uout_head_u <= _T_41 @[Pad.scala 33:18]
    node _T_42 = head(io.s0, 3) @[Pad.scala 34:31]
    io.uout_head_s <= _T_42 @[Pad.scala 34:18]
    node _T_43 = tail(io.u0, 1) @[Pad.scala 35:31]
    io.uout_tail_u <= _T_43 @[Pad.scala 35:18]
    node _T_44 = tail(io.s0, 1) @[Pad.scala 36:31]
    io.uout_tail_s <= _T_44 @[Pad.scala 36:18]

