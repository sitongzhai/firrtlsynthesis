;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit OpShift :
  module OpShift :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip u0 : UInt<8>, flip u1 : UInt<3>, flip s0 : SInt<8>, uout_shl : UInt<10>, uout_shr : UInt<6>, sout_shl : SInt<10>, sout_shr : SInt<6>, uout_dshl : UInt<15>, uout_dshr : UInt<8>, sout_dshl : SInt<15>, sout_dshr : SInt<8>}

    node _T_27 = shl(io.u0, 2) @[OpShift.scala 21:24]
    io.uout_shl <= _T_27 @[OpShift.scala 21:15]
    node _T_28 = shr(io.u0, 8) @[OpShift.scala 22:24]
    io.uout_shr <= _T_28 @[OpShift.scala 22:15]
    node _T_29 = shl(io.s0, 2) @[OpShift.scala 23:24]
    io.sout_shl <= _T_29 @[OpShift.scala 23:15]
    node _T_30 = shr(io.s0, 8) @[OpShift.scala 24:24]
    io.sout_shr <= _T_30 @[OpShift.scala 24:15]
    node _T_31 = dshl(io.u0, io.u1) @[OpShift.scala 26:25]
    io.uout_dshl <= _T_31 @[OpShift.scala 26:16]
    node _T_32 = dshr(io.u0, io.u1) @[OpShift.scala 27:25]
    io.uout_dshr <= _T_32 @[OpShift.scala 27:16]
    node _T_33 = dshl(io.s0, io.u1) @[OpShift.scala 28:25]
    io.sout_dshl <= _T_33 @[OpShift.scala 28:16]
    node _T_34 = dshr(io.s0, io.u1) @[OpShift.scala 29:25]
    io.sout_dshr <= _T_34 @[OpShift.scala 29:16]
