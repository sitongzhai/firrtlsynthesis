;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Cvt :
  module Cvt :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip u0 : UInt<8>, flip s0 : SInt<8>, uout_asUInt_u : UInt<10>, uout_asUInt_s : UInt<10>, sout_asSInt_u : SInt<10>, sout_asSInt_s : SInt<10>, sout_neg_u : SInt<10>, sout_neg_s : SInt<10>}

    io.uout_asUInt_u <= io.u0 @[Cvt.scala 18:20]
    node _T_21 = asUInt(io.s0) @[Cvt.scala 19:35]
    io.uout_asUInt_s <= _T_21 @[Cvt.scala 19:20]
    node _T_22 = asSInt(io.u0) @[Cvt.scala 20:35]
    io.sout_asSInt_u <= _T_22 @[Cvt.scala 20:20]
    io.sout_asSInt_s <= io.s0 @[Cvt.scala 21:20]
    node _T_23 = asSInt(io.u0) @[Cvt.scala 23:34]
    node _T_25 = sub(asSInt(UInt<1>("h00")), _T_23) @[Cvt.scala 23:20]
    node _T_26 = tail(_T_25, 1) @[Cvt.scala 23:20]
    node _T_27 = asSInt(_T_26) @[Cvt.scala 23:20]
    io.sout_neg_u <= _T_27 @[Cvt.scala 23:17]
    node _T_29 = sub(asSInt(UInt<1>("h00")), io.s0) @[Cvt.scala 24:20]
    node _T_30 = tail(_T_29, 1) @[Cvt.scala 24:20]
    node _T_31 = asSInt(_T_30) @[Cvt.scala 24:20]
    io.sout_neg_s <= _T_31 @[Cvt.scala 24:17]
