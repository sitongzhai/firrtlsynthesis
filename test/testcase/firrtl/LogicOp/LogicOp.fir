;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit LogicOp :
  module LogicOp :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip u0 : UInt<9>, flip u1 : UInt<8>, flip s0 : SInt<6>, flip s1 : SInt<8>, flip s22 : SInt<7>, uout_bitwiseAnd_u : UInt<7>, sout_bitwiseAnd_s : SInt<6>, uout_bitwiseOr_u : UInt<5>, sout_bitwiseOr_s : SInt<7>, uout_bitwiseXor_u : UInt<9>, sout_bitwiseXor_s : SInt<4>, uout_bitwiseNot_u : UInt<3>, sout_bitwiseNot_s : SInt<10>, flip u2 : UInt<6>, flip u3 : UInt<8>, flip s2 : SInt<8>, flip s3 : SInt<6>, uout_andr_u : UInt<1>, uout_orr_u : UInt<1>, uout_xorr_u : UInt<1>, uout_and_and : SInt<1>}

    node _T_47 = and(io.u0, io.u1) @[LogicOp.scala 34:33]
    io.uout_bitwiseAnd_u <= _T_47 @[LogicOp.scala 34:24]
    node _T_48 = and(io.s0, io.s1) @[LogicOp.scala 35:33]
    node _T_49 = asSInt(_T_48) @[LogicOp.scala 35:33]
    io.sout_bitwiseAnd_s <= _T_49 @[LogicOp.scala 35:24]
    node _T_50 = or(io.u0, io.u1) @[LogicOp.scala 36:32]
    io.uout_bitwiseOr_u <= _T_50 @[LogicOp.scala 36:23]
    node _T_51 = or(io.s0, io.s1) @[LogicOp.scala 37:32]
    node _T_52 = asSInt(_T_51) @[LogicOp.scala 37:32]
    io.sout_bitwiseOr_s <= _T_52 @[LogicOp.scala 37:23]
    node _T_53 = xor(io.u0, io.u1) @[LogicOp.scala 38:33]
    io.uout_bitwiseXor_u <= _T_53 @[LogicOp.scala 38:24]
    node _T_54 = xor(io.s0, io.s1) @[LogicOp.scala 39:33]
    node _T_55 = asSInt(_T_54) @[LogicOp.scala 39:33]
    io.sout_bitwiseXor_s <= _T_55 @[LogicOp.scala 39:24]
    node _T_56 = not(io.u0) @[LogicOp.scala 40:27]
    io.uout_bitwiseNot_u <= _T_56 @[LogicOp.scala 40:24]
    node _T_57 = not(io.s0) @[LogicOp.scala 41:27]
    node _T_58 = asSInt(_T_57) @[LogicOp.scala 41:27]
    io.sout_bitwiseNot_s <= _T_58 @[LogicOp.scala 41:24]
    node _T_59 = not(io.u2) @[LogicOp.scala 43:31]
    node _T_61 = eq(_T_59, UInt<1>("h00")) @[LogicOp.scala 43:31]
    io.uout_andr_u <= _T_61 @[LogicOp.scala 43:18]
    node _T_63 = neq(io.u2, UInt<1>("h00")) @[LogicOp.scala 45:29]
    io.uout_orr_u <= _T_63 @[LogicOp.scala 45:17]
    node _T_64 = xorr(io.u2) @[LogicOp.scala 47:31]
    io.uout_xorr_u <= _T_64 @[LogicOp.scala 47:18]
    node _T_65 = and(io.sout_bitwiseAnd_s, io.s22) @[LogicOp.scala 50:43]
    node _T_66 = asSInt(_T_65) @[LogicOp.scala 50:43]
    io.uout_and_and <= _T_66 @[LogicOp.scala 50:19]

