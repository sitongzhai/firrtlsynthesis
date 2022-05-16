circuit ReadwriterTester3 :
  module ReadwriterTester3 :
    input clock : Clock
    input waddr : UInt<5>
    input waddr2 : UInt<5>
    input wdata : UInt<32>
    input wdata2 : UInt<32>
    input raddr : UInt<5>
    input raddr2 : UInt<5>
    input rw_wen : UInt<1>
    input rw_wen2 : UInt<1>
    output rdata : UInt<32>
    output rdata2 : UInt<32>
    output rw_rdata : UInt<32>
    output rw_rdata2 : UInt<32>
    mem m :
      data-type => UInt<32>
      depth => 32
      read-latency => 1
      write-latency => 1
      read-under-write => old
      reader => read
      reader => read2
      writer => write
      writer => write2
      readwriter => rw
      readwriter => rw2

    m.read.clk <= clock
    m.read.en <= UInt<1>(1)
    m.read.addr <= raddr
    rdata <= m.read.data

    m.read2.clk <= clock
    m.read2.en <= UInt<1>(1)
    m.read2.addr <= raddr2
    rdata2 <= m.read2.data

    m.write.clk <= clock
    m.write.en <= UInt<1>(1)
    m.write.mask <= UInt<1>(1)
    m.write.addr <= waddr
    m.write.data <= wdata

    m.write2.clk <= clock
    m.write2.en <= UInt<1>(1)
    m.write2.mask <= UInt<1>(1)
    m.write2.addr <= waddr2
    m.write2.data <= wdata2

    m.rw.clk <= clock
    m.rw.en <= UInt<1>(1)
    m.rw.wmode <= rw_wen
    m.rw.wmask <= UInt<1>(1)
    m.rw.addr <= waddr
    m.rw.wdata <= wdata
    rw_rdata <= m.rw.rdata

    m.rw2.clk <= clock
    m.rw2.en <= UInt<1>(1)
    m.rw2.wmode <= rw_wen2
    m.rw2.wmask <= UInt<1>(1)
    m.rw2.addr <= waddr2
    m.rw2.wdata <= wdata2
    rw_rdata2 <= m.rw2.rdata

