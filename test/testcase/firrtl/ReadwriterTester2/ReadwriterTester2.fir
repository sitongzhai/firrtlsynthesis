circuit ReadwriterTester2 :
  module ReadwriterTester2 :
    input clock : Clock
    input waddr : UInt<5>
    input wdata : UInt<32>
    input raddr : UInt<5>
    input rw_wen : UInt<1>
    output rdata : UInt<32>
    output rw_rdata : UInt<32>
    mem m :
      data-type => UInt<32>
      depth => 32
      read-latency => 1
      write-latency => 1
      read-under-write => old
      reader => read
      writer => write
      readwriter => rw
    m.read.clk <= clock
    m.read.en <= UInt<1>(1)
    m.read.addr <= raddr
    rdata <= m.read.data

    m.write.clk <= clock
    m.write.en <= UInt<1>(1)
    m.write.mask <= UInt<1>(1)
    m.write.addr <= waddr
    m.write.data <= wdata

    m.rw.clk <= clock
    m.rw.en <= UInt<1>(1)
    m.rw.wmode <= rw_wen
    m.rw.wmask <= UInt<1>(1)
    m.rw.addr <= waddr
    m.rw.wdata <= wdata
    rw_rdata <= m.rw.rdata
