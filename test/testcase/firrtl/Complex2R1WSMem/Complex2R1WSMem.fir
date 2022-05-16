;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Complex2R1WSMem : 
  module Complex2R1WSMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip rdAddr2 : UInt<4>, rdData2 : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16] @[Complex2R1WSMem.scala 21:24]
    read mport _T_21 = mem[io.rdAddr], clock @[Complex2R1WSMem.scala 49:24]
    io.rdData <= _T_21 @[Complex2R1WSMem.scala 49:13]
    read mport _T_22 = mem[io.rdAddr2], clock @[Complex2R1WSMem.scala 50:25]
    io.rdData2 <= _T_22 @[Complex2R1WSMem.scala 50:14]
    when io.wrEna : @[Complex2R1WSMem.scala 51:18]
      write mport _T_23 = mem[io.wrAddr], clock
      _T_23 <= io.wrData
      skip @[Complex2R1WSMem.scala 51:18]
    