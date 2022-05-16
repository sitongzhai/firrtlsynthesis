;buildInfoPackage: chisel3, version: 3.4-SNAPSHOT, scalaVersion: 2.12.12, sbtVersion: 1.3.9
circuit IntervalTester2 : 
  module IntervalTest2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip p : UInt<1>, flip in1 : Interval[0, 4].0, flip in2 : Interval[0, 6].0, out : Interval[?, ?].0}
    
    node _io_out_T = mux(io.p, io.in1, io.in2) @[IntervalSpec.scala 82:16]
    io.out <= _io_out_T @[IntervalSpec.scala 82:10]
    
  module IntervalTester2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {}
    
    reg cycle : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 60:40]
    wire done : UInt<1>
    done <= UInt<1>("h00")
    when UInt<1>("h01") : @[Counter.scala 118:17]
      node wrap_wrap = eq(cycle, UInt<4>("h0a")) @[Counter.scala 72:24]
      node _wrap_value_T = add(cycle, UInt<1>("h01")) @[Counter.scala 76:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[Counter.scala 76:24]
      cycle <= _wrap_value_T_1 @[Counter.scala 76:15]
      when wrap_wrap : @[Counter.scala 86:20]
        cycle <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      done <= wrap_wrap @[Counter.scala 118:24]
      skip @[Counter.scala 118:17]
    when done : @[CookbookSpec.scala 19:15]
      node _T = bits(reset, 0, 0) @[CookbookSpec.scala 19:21]
      node _T_1 = eq(_T, UInt<1>("h00")) @[CookbookSpec.scala 19:21]
      when _T_1 : @[CookbookSpec.scala 19:21]
        stop(clock, UInt<1>(1), 0) @[CookbookSpec.scala 19:21]
        skip @[CookbookSpec.scala 19:21]
      skip @[CookbookSpec.scala 19:15]
    inst dut of IntervalTest2 @[IntervalSpec.scala 87:19]
    dut.clock <= clock
    dut.reset <= reset
    dut.io.p <= UInt<1>("h01") @[IntervalSpec.scala 89:12]
    dut.io.in1 <= asInterval(UInt<4>("h04"), 4, 4, 0) @[IntervalSpec.scala 90:14]
    dut.io.in2 <= asInterval(UInt<4>("h05"), 5, 5, 0) @[IntervalSpec.scala 91:14]
    node _T_2 = eq(dut.io.out, asInterval(UInt<4>("h04"), 4, 4, 0)) @[IntervalSpec.scala 92:21]
    node _T_3 = bits(reset, 0, 0) @[IntervalSpec.scala 92:9]
    node _T_4 = or(_T_2, _T_3) @[IntervalSpec.scala 92:9]
    node _T_5 = eq(_T_4, UInt<1>("h00")) @[IntervalSpec.scala 92:9]
    when _T_5 : @[IntervalSpec.scala 92:9]
      printf(clock, UInt<1>(1), "Assertion failed\n    at IntervalSpec.scala:92 assert(dut.io.out === 4.I)\n") @[IntervalSpec.scala 92:9]
      stop(clock, UInt<1>(1), 1) @[IntervalSpec.scala 92:9]
      skip @[IntervalSpec.scala 92:9]
    node _T_6 = bits(reset, 0, 0) @[IntervalSpec.scala 94:7]
    node _T_7 = eq(_T_6, UInt<1>("h00")) @[IntervalSpec.scala 94:7]
    when _T_7 : @[IntervalSpec.scala 94:7]
      stop(clock, UInt<1>(1), 0) @[IntervalSpec.scala 94:7]
      skip @[IntervalSpec.scala 94:7]
    
