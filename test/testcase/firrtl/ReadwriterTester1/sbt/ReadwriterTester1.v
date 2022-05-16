module ReadwriterTester1(
  input         clock,
  input  [4:0]  waddr,
  input  [31:0] wdata,
  input         rw_wen,
  output [31:0] rw_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] m [0:31];
  wire  m_rw_r_en;
  wire [4:0] m_rw_r_addr;
  wire [31:0] m_rw_r_data;
  wire [31:0] m_rw_w_data;
  wire [4:0] m_rw_w_addr;
  wire  m_rw_w_mask;
  wire  m_rw_w_en;
  assign m_rw_r_en = ~rw_wen;
  assign m_rw_r_addr = waddr;
  assign m_rw_r_data = m[m_rw_r_addr];
  assign m_rw_w_data = wdata;
  assign m_rw_w_addr = waddr;
  assign m_rw_w_mask = 1'h1;
  assign m_rw_w_en = rw_wen;
  assign rw_rdata = m_rw_r_data;
  always @(posedge clock) begin
    if (m_rw_w_en & m_rw_w_mask) begin
      m[m_rw_w_addr] <= m_rw_w_data;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    m[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
