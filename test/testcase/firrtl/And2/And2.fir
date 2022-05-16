;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit And2 : 
  module And2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip i0 : UInt<1>, flip i1 : UInt<1>, out : UInt<1>}
    
    node _T_11 = and(io.i0, io.i1) @[And2.scala 14:19]
    io.out <= _T_11 @[And2.scala 14:10]
    