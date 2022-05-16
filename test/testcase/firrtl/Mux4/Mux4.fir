;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Mux4 : 
  module Mux2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip sel : UInt<1>, flip i0 : UInt<1>, flip i1 : UInt<1>, out : UInt<1>}
    
    node _T_13 = and(io.sel, io.i1) @[Mux2.scala 15:21]
    node _T_14 = not(io.sel) @[Mux2.scala 15:33]
    node _T_15 = and(_T_14, io.i0) @[Mux2.scala 15:41]
    node _T_16 = or(_T_13, _T_15) @[Mux2.scala 15:30]
    io.out <= _T_16 @[Mux2.scala 15:10]
    
  module Mux2_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip sel : UInt<1>, flip i0 : UInt<1>, flip i1 : UInt<1>, out : UInt<1>}
    
    node _T_13 = and(io.sel, io.i1) @[Mux2.scala 15:21]
    node _T_14 = not(io.sel) @[Mux2.scala 15:33]
    node _T_15 = and(_T_14, io.i0) @[Mux2.scala 15:41]
    node _T_16 = or(_T_13, _T_15) @[Mux2.scala 15:30]
    io.out <= _T_16 @[Mux2.scala 15:10]
    
  module Mux2_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip sel : UInt<1>, flip i0 : UInt<1>, flip i1 : UInt<1>, out : UInt<1>}
    
    node _T_13 = and(io.sel, io.i1) @[Mux2.scala 15:21]
    node _T_14 = not(io.sel) @[Mux2.scala 15:33]
    node _T_15 = and(_T_14, io.i0) @[Mux2.scala 15:41]
    node _T_16 = or(_T_13, _T_15) @[Mux2.scala 15:30]
    io.out <= _T_16 @[Mux2.scala 15:10]
    
  module Mux4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip s0 : UInt<1>, flip s1 : UInt<1>, flip i0 : UInt<1>, flip i1 : UInt<1>, flip i2 : UInt<1>, flip i3 : UInt<1>, out : UInt<1>}
    
    inst m0 of Mux2 @[Mux4.scala 27:18]
    m0.clock <= clock
    m0.reset <= reset
    m0.io.sel <= io.s0 @[Mux4.scala 28:13]
    m0.io.i0 <= io.i0 @[Mux4.scala 29:13]
    m0.io.i1 <= io.i1 @[Mux4.scala 30:13]
    inst m1 of Mux2_1 @[Mux4.scala 32:18]
    m1.clock <= clock
    m1.reset <= reset
    m1.io.sel <= io.s0 @[Mux4.scala 33:13]
    m1.io.i0 <= io.i2 @[Mux4.scala 34:13]
    m1.io.i1 <= io.i3 @[Mux4.scala 35:13]
    inst m2 of Mux2_2 @[Mux4.scala 37:18]
    m2.clock <= clock
    m2.reset <= reset
    m2.io.sel <= io.s1 @[Mux4.scala 38:13]
    m2.io.i0 <= m0.io.out @[Mux4.scala 39:13]
    m2.io.i1 <= m1.io.out @[Mux4.scala 40:13]
    io.out <= m2.io.out @[Mux4.scala 42:10]
    