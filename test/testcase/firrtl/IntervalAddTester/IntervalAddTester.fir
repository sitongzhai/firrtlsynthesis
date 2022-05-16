;buildInfoPackage: chisel3, version: 3.4-SNAPSHOT, scalaVersion: 2.12.12, sbtVersion: 1.3.9
circuit IntervalAddTester : 
  module IntervalAddTester : 
    input clock : Clock
    input reset : UInt<1>
    output io : {}
    
    wire in1 : Interval[0, 4].0 @[IntervalSpec.scala 99:17]
    wire in2 : Interval[0, 4].0 @[IntervalSpec.scala 100:17]
    in1 <= asInterval(UInt<3>("h02"), 2, 2, 0) @[IntervalSpec.scala 102:7]
    in2 <= asInterval(UInt<3>("h02"), 2, 2, 0) @[IntervalSpec.scala 103:7]
    node result = add(in1, in2) @[IntervalSpec.scala 107:20]
    node _T = eq(result, asInterval(UInt<4>("h04"), 4, 4, 0)) @[IntervalSpec.scala 109:17]
    node _T_1 = bits(reset, 0, 0) @[IntervalSpec.scala 109:9]
    node _T_2 = or(_T, _T_1) @[IntervalSpec.scala 109:9]
    node _T_3 = eq(_T_2, UInt<1>("h00")) @[IntervalSpec.scala 109:9]
    when _T_3 : @[IntervalSpec.scala 109:9]
      printf(clock, UInt<1>(1), "Assertion failed\n    at IntervalSpec.scala:109 assert(result === 4.I)\n") @[IntervalSpec.scala 109:9]
      stop(clock, UInt<1>(1), 1) @[IntervalSpec.scala 109:9]
      skip @[IntervalSpec.scala 109:9]
    node _T_4 = bits(reset, 0, 0) @[IntervalSpec.scala 111:7]
    node _T_5 = eq(_T_4, UInt<1>("h00")) @[IntervalSpec.scala 111:7]
    when _T_5 : @[IntervalSpec.scala 111:7]
      stop(clock, UInt<1>(1), 0) @[IntervalSpec.scala 111:7]
      skip @[IntervalSpec.scala 111:7]
    
