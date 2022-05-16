circuit SimpleCMemRAM : 
  module SimpleCMemRAM : 
    input clock : Clock 
    input reset : UInt<1> 
    input io_rdAddr : UInt<4> 
    output io_rdData : UInt<8> 
    input io_wrEna : UInt<1> 
    input io_wrData : UInt<8> 
    input io_wrAddr : UInt<4> 
  
    mem mem : 
      data-type => UInt<8>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => _T_17
      writer => _T_18
      read-under-write => undefined
    node _GEN_0 = validif(io_wrEna, io_wrAddr) 
    node _GEN_1 = validif(io_wrEna, clock) 
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) 
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) 
    node _GEN_4 = validif(io_wrEna, io_wrData) 
    io_rdData <= mem._T_17.data 
    mem._T_17.addr <= io_rdAddr 
    mem._T_17.en <= UInt<1>("h1") 
    mem._T_17.clk <= clock 
    mem._T_18.addr <= _GEN_0 
    mem._T_18.en <= _GEN_2 
    mem._T_18.clk <= _GEN_1 
    mem._T_18.data <= _GEN_4 
    mem._T_18.mask <= _GEN_3 