;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Complex3R3WCMem : 
  module Complex3R3WCMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip rdAddr2 : UInt<4>, rdData2 : UInt<8>, flip rdAddr3 : UInt<4>, rdData3 : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>, flip wrEna2 : UInt<1>, flip wrData2 : UInt<8>, flip wrAddr2 : UInt<4>, flip wrEna3 : UInt<1>, flip wrData3 : UInt<8>, flip wrAddr3 : UInt<4>}
    
    cmem mem : UInt<8>[16] @[Complex3R3WCMem.scala 26:24]
    read mport _T_37 = mem[io.rdAddr], clock @[Complex3R3WCMem.scala 54:24]
    io.rdData <= _T_37 @[Complex3R3WCMem.scala 54:13]
    read mport _T_38 = mem[io.rdAddr2], clock @[Complex3R3WCMem.scala 55:25]
    io.rdData2 <= _T_38 @[Complex3R3WCMem.scala 55:14]
    read mport _T_39 = mem[io.rdAddr3], clock @[Complex3R3WCMem.scala 56:25]
    io.rdData3 <= _T_39 @[Complex3R3WCMem.scala 56:14]
    when io.wrEna : @[Complex3R3WCMem.scala 57:18]
      write mport _T_40 = mem[io.wrAddr], clock
      _T_40 <= io.wrData
      skip @[Complex3R3WCMem.scala 57:18]
    when io.wrEna2 : @[Complex3R3WCMem.scala 60:19]
      write mport _T_41 = mem[io.wrAddr2], clock
      _T_41 <= io.wrData2
      skip @[Complex3R3WCMem.scala 60:19]
    when io.wrEna3 : @[Complex3R3WCMem.scala 63:19]
      write mport _T_42 = mem[io.wrAddr3], clock
      _T_42 <= io.wrData3
      skip @[Complex3R3WCMem.scala 63:19]
    