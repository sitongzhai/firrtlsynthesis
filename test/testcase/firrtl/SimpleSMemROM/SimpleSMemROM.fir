;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit SimpleSMemROM : 
  module SimpleSMemROM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>}
    
    smem mem : UInt<8>[16] @[SimpleSMemROM.scala 17:17]
    read mport _T_11 = mem[io.rdAddr], clock @[SimpleSMemROM.scala 44:24]
    io.rdData <= _T_11 @[SimpleSMemROM.scala 44:13]
    