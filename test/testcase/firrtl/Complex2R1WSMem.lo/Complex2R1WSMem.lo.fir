circuit Complex2R1WSMem : @[:@2.0]
  module Complex2R1WSMem : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_rdAddr : UInt<4> @[:@6.4]
    output io_rdData : UInt<8> @[:@6.4]
    input io_rdAddr2 : UInt<4> @[:@6.4]
    output io_rdData2 : UInt<8> @[:@6.4]
    input io_wrEna : UInt<1> @[:@6.4]
    input io_wrData : UInt<8> @[:@6.4]
    input io_wrAddr : UInt<4> @[:@6.4]
  
    mem mem : @[Complex2R1WSMem.scala 21:24:@8.4]
      data-type => UInt<8>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => _T_21
      reader => _T_22
      writer => _T_23
      read-under-write => undefined
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Complex2R1WSMem.scala 51:18:@13.4]
    node _GEN_1 = validif(io_wrEna, clock) @[Complex2R1WSMem.scala 51:18:@13.4]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Complex2R1WSMem.scala 51:18:@13.4]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Complex2R1WSMem.scala 51:18:@13.4]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Complex2R1WSMem.scala 51:18:@13.4]
    io_rdData <= mem._T_21.data @[Complex2R1WSMem.scala 49:13:@10.4]
    io_rdData2 <= mem._T_22.data @[Complex2R1WSMem.scala 50:14:@12.4]
    mem._T_21.addr <= io_rdAddr @[Complex2R1WSMem.scala 49:24:@9.4]
    mem._T_21.en <= UInt<1>("h1") @[Complex2R1WSMem.scala 21:24:@8.4 Complex2R1WSMem.scala 49:24:@9.4]
    mem._T_21.clk <= clock @[Complex2R1WSMem.scala 49:24:@9.4]
    mem._T_22.addr <= io_rdAddr2 @[Complex2R1WSMem.scala 50:25:@11.4]
    mem._T_22.en <= UInt<1>("h1") @[Complex2R1WSMem.scala 21:24:@8.4 Complex2R1WSMem.scala 50:25:@11.4]
    mem._T_22.clk <= clock @[Complex2R1WSMem.scala 50:25:@11.4]
    mem._T_23.addr <= _GEN_0 @[:@14.6]
    mem._T_23.en <= _GEN_2 @[Complex2R1WSMem.scala 21:24:@8.4 :@14.6]
    mem._T_23.clk <= _GEN_1 @[:@14.6]
    mem._T_23.data <= _GEN_4 @[:@15.6]
    mem._T_23.mask <= _GEN_3 @[:@14.6 :@15.6]
