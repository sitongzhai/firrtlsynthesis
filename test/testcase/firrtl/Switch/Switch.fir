;buildInfoPackage: chisel3, version: 3.1.8, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2019-07-08 17:44:42.884, builtAtMillis: 1562607882884
circuit Switch : 
  module Switch : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip i0 : UInt<2>, flip i1 : UInt<1>, out : UInt<1>}
    
    wire inst_valid_num_nxt : UInt<5> @[Switch.scala 15:37]
    wire inst_valid_num : UInt<5> @[Switch.scala 17:33]
    inst_valid_num_nxt <= UInt<5>("h00") @[Switch.scala 21:22]
    node _T_14 = eq(UInt<2>("h00"), io.i0) @[Conditional.scala 37:30]
    when _T_14 : @[Conditional.scala 40:58]
      
      inst_valid_num_nxt <= inst_valid_num @[Switch.scala 23:42]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_17 = eq(UInt<2>("h01"), io.i0) @[Conditional.scala 37:30]
      when _T_17 : @[Conditional.scala 39:67]
        node _T_19 = sub(inst_valid_num, UInt<5>("h01")) @[Switch.scala 24:60]
        node _T_20 = asUInt(_T_19) @[Switch.scala 24:60]
        node _T_21 = tail(_T_20, 1) @[Switch.scala 24:60]
        inst_valid_num_nxt <= _T_21 @[Switch.scala 24:42]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_23 = eq(UInt<2>("h02"), io.i0) @[Conditional.scala 37:30]
        when _T_23 : @[Conditional.scala 39:67]
          node _T_25 = add(inst_valid_num, UInt<5>("h01")) @[Switch.scala 25:60]
          node _T_26 = tail(_T_25, 1) @[Switch.scala 25:60]
          inst_valid_num_nxt <= _T_26 @[Switch.scala 25:42]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_28 = eq(UInt<2>("h03"), io.i0) @[Conditional.scala 37:30]
          when _T_28 : @[Conditional.scala 39:67]
            node _T_30 = add(inst_valid_num, UInt<5>("h02")) @[Switch.scala 26:60]
            node _T_31 = tail(_T_30, 1) @[Switch.scala 26:60]
            inst_valid_num_nxt <= _T_31 @[Switch.scala 26:42]
            skip @[Conditional.scala 39:67]
    wire inst_valid_num_d : UInt<5> @[Switch.scala 16:35]
    inst_valid_num_d <= UInt<5>("h01") @[Switch.scala 28:20]
    inst_valid_num <= UInt<5>("h02") @[Switch.scala 29:18]
    io.out <= io.i1 @[Switch.scala 30:10]
    
