;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Compare :
  module Compare :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip u0 : UInt<8>, flip u1 : UInt<6>, flip s0 : SInt<4>, flip s1 : SInt<8>, uout_lt : UInt<1>, sout_lt : UInt<1>, uout_leq : UInt<1>, sout_leq : UInt<1>, flip u2 : UInt<5>, flip u3 : UInt<6>, flip s2 : SInt<6>, flip s3 : SInt<7>, uout_gt : UInt<1>, sout_gt : UInt<1>, uout_geq : UInt<1>, sout_geq : UInt<1>, uout_eq : UInt<1>, sout_eq : UInt<1>, uout_neq : UInt<1>, sout_neq : UInt<1>}

    node _T_45 = lt(io.u0, io.u1) @[Compare.scala 32:23]
    io.uout_lt <= _T_45 @[Compare.scala 32:14]
    node _T_46 = lt(io.s0, io.s1) @[Compare.scala 33:23]
    io.sout_lt <= _T_46 @[Compare.scala 33:14]
    node _T_47 = leq(io.u0, io.u1) @[Compare.scala 34:24]
    io.uout_leq <= _T_47 @[Compare.scala 34:15]
    node _T_48 = leq(io.s0, io.s1) @[Compare.scala 35:24]
    io.sout_leq <= _T_48 @[Compare.scala 35:15]
    node _T_49 = gt(io.u2, io.u3) @[Compare.scala 37:23]
    io.uout_gt <= _T_49 @[Compare.scala 37:14]
    node _T_50 = gt(io.s2, io.s3) @[Compare.scala 38:23]
    io.sout_gt <= _T_50 @[Compare.scala 38:14]
    node _T_51 = geq(io.u2, io.u3) @[Compare.scala 39:24]
    io.uout_geq <= _T_51 @[Compare.scala 39:15]
    node _T_52 = geq(io.s2, io.s3) @[Compare.scala 40:24]
    io.sout_geq <= _T_52 @[Compare.scala 40:15]
    node _T_53 = eq(io.u2, io.u3) @[Compare.scala 42:23]
    io.uout_eq <= _T_53 @[Compare.scala 42:14]
    node _T_54 = eq(io.s2, io.s3) @[Compare.scala 43:23]
    io.sout_eq <= _T_54 @[Compare.scala 43:14]
    node _T_55 = neq(io.u2, io.u3) @[Compare.scala 44:24]
    io.uout_neq <= _T_55 @[Compare.scala 44:15]
    node _T_56 = neq(io.s2, io.s3) @[Compare.scala 45:24]
    io.sout_neq <= _T_56 @[Compare.scala 45:15]
