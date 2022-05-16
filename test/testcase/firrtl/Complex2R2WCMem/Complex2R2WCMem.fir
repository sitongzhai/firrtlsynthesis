;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Complex2R2WCMem : 
  module Complex2R2WCMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip rdAddr2 : UInt<4>, rdData2 : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>, flip wrEna2 : UInt<1>, flip wrData2 : UInt<8>, flip wrAddr2 : UInt<4>}
    
    cmem mem : UInt<8>[16] @[Complex2R2WCMem.scala 21:24]
    read mport _T_27 = mem[io.rdAddr], clock @[Complex2R2WCMem.scala 49:24]
    io.rdData <= _T_27 @[Complex2R2WCMem.scala 49:13]
    read mport _T_28 = mem[io.rdAddr2], clock @[Complex2R2WCMem.scala 50:25]
    io.rdData2 <= _T_28 @[Complex2R2WCMem.scala 50:14]
    when io.wrEna : @[Complex2R2WCMem.scala 51:18]
      write mport _T_29 = mem[io.wrAddr], clock
      _T_29 <= io.wrData
      skip @[Complex2R2WCMem.scala 51:18]
    when io.wrEna2 : @[Complex2R2WCMem.scala 54:19]
      write mport _T_30 = mem[io.wrAddr2], clock
      _T_30 <= io.wrData2
      skip @[Complex2R2WCMem.scala 54:19]
    