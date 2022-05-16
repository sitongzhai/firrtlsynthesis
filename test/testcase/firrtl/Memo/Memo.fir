;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Memo : 
  module Memo : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wen : UInt<1>, flip wrAddr : UInt<8>, flip wrData : UInt<8>, flip ren : UInt<1>, flip rdAddr : UInt<8>, rdData : UInt<8>}
    
    cmem mem : UInt<8>[256] @[Memo.scala 23:16]
    when io.wen : @[Memo.scala 26:17]
      infer mport _T_19 = mem[io.wrAddr], clock @[Memo.scala 27:8]
; comments
      _T_19 <= io.wrData @[Memo.scala 27:20]
      skip @[Memo.scala 26:17]
    io.rdData <= UInt<1>("h00") @[Memo.scala 29:13]
    when io.ren : @[Memo.scala 30:17]
      infer mport _T_21 = mem[io.rdAddr], clock @[Memo.scala 31:21]
      io.rdData <= _T_21 @[Memo.scala 31:15]
      skip @[Memo.scala 30:17]
    
