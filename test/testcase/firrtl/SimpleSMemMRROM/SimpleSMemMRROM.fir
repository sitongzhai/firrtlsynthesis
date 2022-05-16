;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit SimpleSMemMRROM : 
  module SimpleSMemMRROM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip rdAddr2 : UInt<4>, rdData2 : UInt<8>}
    
    smem mem : UInt<8>[64] @[SimpleSMemMRROM.scala 18:24]
    read mport _T_15 = mem[io.rdAddr], clock @[SimpleSMemMRROM.scala 46:24]
    io.rdData <= _T_15 @[SimpleSMemMRROM.scala 46:13]
    read mport _T_16 = mem[io.rdAddr2], clock @[SimpleSMemMRROM.scala 47:25]
    io.rdData2 <= _T_16 @[SimpleSMemMRROM.scala 47:14]
    