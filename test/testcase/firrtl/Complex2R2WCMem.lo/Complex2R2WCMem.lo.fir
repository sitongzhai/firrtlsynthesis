circuit Complex2R2WCMem : @[:@2.0]
  module Complex2R2WCMem : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_rdAddr : UInt<4> @[:@6.4]
    output io_rdData : UInt<8> @[:@6.4]
    input io_rdAddr2 : UInt<4> @[:@6.4]
    output io_rdData2 : UInt<8> @[:@6.4]
    input io_wrEna : UInt<1> @[:@6.4]
    input io_wrData : UInt<8> @[:@6.4]
    input io_wrAddr : UInt<4> @[:@6.4]
    input io_wrEna2 : UInt<1> @[:@6.4]
    input io_wrData2 : UInt<8> @[:@6.4]
    input io_wrAddr2 : UInt<4> @[:@6.4]
  
    mem mem : @[Complex2R2WCMem.scala 21:24:@8.4]
      data-type => UInt<8>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => _T_27
      reader => _T_28
      writer => _T_29
      writer => _T_30
      read-under-write => undefined
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Complex2R2WCMem.scala 51:18:@13.4]
    node _GEN_1 = validif(io_wrEna, clock) @[Complex2R2WCMem.scala 51:18:@13.4]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Complex2R2WCMem.scala 51:18:@13.4]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Complex2R2WCMem.scala 51:18:@13.4]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Complex2R2WCMem.scala 51:18:@13.4]
    node _GEN_5 = validif(io_wrEna2, io_wrAddr2) @[Complex2R2WCMem.scala 54:19:@17.4]
    node _GEN_6 = validif(io_wrEna2, clock) @[Complex2R2WCMem.scala 54:19:@17.4]
    node _GEN_7 = mux(io_wrEna2, UInt<1>("h1"), UInt<1>("h0")) @[Complex2R2WCMem.scala 54:19:@17.4]
    node _GEN_8 = validif(io_wrEna2, UInt<1>("h1")) @[Complex2R2WCMem.scala 54:19:@17.4]
    node _GEN_9 = validif(io_wrEna2, io_wrData2) @[Complex2R2WCMem.scala 54:19:@17.4]
    io_rdData <= mem._T_27.data @[Complex2R2WCMem.scala 49:13:@10.4]
    io_rdData2 <= mem._T_28.data @[Complex2R2WCMem.scala 50:14:@12.4]
    mem._T_27.addr <= io_rdAddr @[Complex2R2WCMem.scala 49:24:@9.4]
    mem._T_27.en <= UInt<1>("h1") @[Complex2R2WCMem.scala 21:24:@8.4 Complex2R2WCMem.scala 49:24:@9.4]
    mem._T_27.clk <= clock @[Complex2R2WCMem.scala 49:24:@9.4]
    mem._T_28.addr <= io_rdAddr2 @[Complex2R2WCMem.scala 50:25:@11.4]
    mem._T_28.en <= UInt<1>("h1") @[Complex2R2WCMem.scala 21:24:@8.4 Complex2R2WCMem.scala 50:25:@11.4]
    mem._T_28.clk <= clock @[Complex2R2WCMem.scala 50:25:@11.4]
    mem._T_29.addr <= _GEN_0 @[:@14.6]
    mem._T_29.en <= _GEN_2 @[Complex2R2WCMem.scala 21:24:@8.4 :@14.6]
    mem._T_29.clk <= _GEN_1 @[:@14.6]
    mem._T_29.data <= _GEN_4 @[:@15.6]
    mem._T_29.mask <= _GEN_3 @[:@14.6 :@15.6]
    mem._T_30.addr <= _GEN_5 @[:@18.6]
    mem._T_30.en <= _GEN_7 @[Complex2R2WCMem.scala 21:24:@8.4 :@18.6]
    mem._T_30.clk <= _GEN_6 @[:@18.6]
    mem._T_30.data <= _GEN_9 @[:@19.6]
    mem._T_30.mask <= _GEN_8 @[:@18.6 :@19.6]
