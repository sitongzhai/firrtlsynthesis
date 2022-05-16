circuit SimpleCMemROM : @[:@2.0]
  module SimpleCMemROM : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_rdAddr : UInt<4> @[:@6.4]
    output io_rdData : UInt<8> @[:@6.4]
  
    mem mem : @[SimpleCMemROM.scala 17:17:@8.4]
      data-type => UInt<8>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => _T_11
      read-under-write => undefined
    io_rdData <= mem._T_11.data @[SimpleCMemROM.scala 44:13:@10.4]
    mem._T_11.addr <= io_rdAddr @[SimpleCMemROM.scala 44:24:@9.4]
    mem._T_11.en <= UInt<1>("h1") @[SimpleCMemROM.scala 17:17:@8.4 SimpleCMemROM.scala 44:24:@9.4]
    mem._T_11.clk <= clock @[SimpleCMemROM.scala 44:24:@9.4]
