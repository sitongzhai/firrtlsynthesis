;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit SimpleSMemRAM : 
  module SimpleSMemRAM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16] @[SimpleSMemRAM.scala 16:24]
    read mport _T_17 = mem[io.rdAddr], clock @[SimpleSMemRAM.scala 44:24]
    io.rdData <= _T_17 @[SimpleSMemRAM.scala 44:13]
    when io.wrEna : @[SimpleSMemRAM.scala 46:18]
      write mport _T_18 = mem[io.wrAddr], clock
      _T_18 <= io.wrData
      skip @[SimpleSMemRAM.scala 46:18]
    