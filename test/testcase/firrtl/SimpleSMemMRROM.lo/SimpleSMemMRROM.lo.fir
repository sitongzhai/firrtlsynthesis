circuit SimpleSMemMRROM : @[:@2.0]
  module SimpleSMemMRROM : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_rdAddr : UInt<4> @[:@6.4]
    output io_rdData : UInt<8> @[:@6.4]
    input io_rdAddr2 : UInt<4> @[:@6.4]
    output io_rdData2 : UInt<8> @[:@6.4]
  
    mem mem : @[SimpleSMemMRROM.scala 18:24:@8.4]
      data-type => UInt<8>
      depth => 64
      read-latency => 1
      write-latency => 1
      reader => _T_15
      reader => _T_16
      read-under-write => undefined
    io_rdData <= mem._T_15.data @[SimpleSMemMRROM.scala 46:13:@10.4]
    io_rdData2 <= mem._T_16.data @[SimpleSMemMRROM.scala 47:14:@12.4]
    mem._T_15.addr <= io_rdAddr @[SimpleSMemMRROM.scala 46:24:@9.4]
    mem._T_15.en <= UInt<1>("h1") @[SimpleSMemMRROM.scala 18:24:@8.4 SimpleSMemMRROM.scala 46:24:@9.4]
    mem._T_15.clk <= clock @[SimpleSMemMRROM.scala 46:24:@9.4]
    mem._T_16.addr <= io_rdAddr2 @[SimpleSMemMRROM.scala 47:25:@11.4]
    mem._T_16.en <= UInt<1>("h1") @[SimpleSMemMRROM.scala 18:24:@8.4 SimpleSMemMRROM.scala 47:25:@11.4]
    mem._T_16.clk <= clock @[SimpleSMemMRROM.scala 47:25:@11.4]
