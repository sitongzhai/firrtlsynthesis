circuit ReadwriterTester1 :
  module ReadwriterTester1 :
    input clock : Clock
    input waddr : UInt<5>
    input wdata : UInt<32>
    input rw_wen : UInt<1>
    output rw_rdata : UInt<32>
    mem m :
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      read-under-write => old
      readwriter => rw

    m.rw.clk <= clock
    m.rw.en <= UInt<1>(1)
    m.rw.wmode <= rw_wen
    m.rw.wmask <= UInt<1>(1)
    m.rw.addr <= waddr
    m.rw.wdata <= wdata
    rw_rdata <= m.rw.rdata
