;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit AddSub :
  module AddSub :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip u0 : UInt<8>, flip u1 : UInt<8>, flip s0 : SInt<8>, flip s1 : SInt<8>, uout_add : UInt<9>, sout_add : SInt<9>, uout_add_no_co : UInt<8>, sout_add_no_co : SInt<8>, uout_sub : UInt<9>, sout_sub : SInt<9>, flip u2 : UInt<4>, flip u3 : UInt<6>, flip s2 : SInt<4>, flip s3 : SInt<6>, uout_mul : UInt<10>, sout_mul : SInt<10>, uout_div : UInt<4>, sout_div : SInt<4>, uout_rem : UInt<6>, sout_rem : SInt<6>}

    node _T_45 = add(io.u0, io.u1) @[AddSub.scala 31:24]
    io.uout_add <= _T_45 @[AddSub.scala 31:15]
    node _T_46 = add(io.s0, io.s1) @[AddSub.scala 32:24]
    io.sout_add <= _T_46 @[AddSub.scala 32:15]
    node _T_47 = add(io.u0, io.u1) @[AddSub.scala 33:30]
    node _T_48 = tail(_T_47, 1) @[AddSub.scala 33:30]
    io.uout_add_no_co <= _T_48 @[AddSub.scala 33:21]
    node _T_49 = add(io.s0, io.s1) @[AddSub.scala 34:30]
    node _T_50 = tail(_T_49, 1) @[AddSub.scala 34:30]
    node _T_51 = asSInt(_T_50) @[AddSub.scala 34:30]
    io.sout_add_no_co <= _T_51 @[AddSub.scala 34:21]
    node _T_52 = sub(io.u0, io.u1) @[AddSub.scala 35:24]
    node _T_53 = asUInt(_T_52) @[AddSub.scala 35:24]
    io.uout_sub <= _T_53 @[AddSub.scala 35:15]
    node _T_54 = sub(io.s0, io.s1) @[AddSub.scala 36:24]
    io.sout_sub <= _T_54 @[AddSub.scala 36:15]
    node _T_55 = mul(io.u2, io.u3) @[AddSub.scala 38:24]
    io.uout_mul <= _T_55 @[AddSub.scala 38:15]
    node _T_56 = mul(io.s2, io.s3) @[AddSub.scala 39:24]
    io.sout_mul <= _T_56 @[AddSub.scala 39:15]
    node _T_57 = div(io.u2, io.u3) @[AddSub.scala 40:24]
    io.uout_div <= _T_57 @[AddSub.scala 40:15]
    node _T_58 = div(io.s2, io.s3) @[AddSub.scala 41:24]
    io.sout_div <= _T_58 @[AddSub.scala 41:15]
    node _T_59 = rem(io.u2, io.u3) @[AddSub.scala 42:24]
    io.uout_rem <= _T_59 @[AddSub.scala 42:15]
    node _T_60 = rem(io.s2, io.s3) @[AddSub.scala 43:24]
    io.sout_rem <= _T_60 @[AddSub.scala 43:15]

    