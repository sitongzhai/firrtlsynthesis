module ReadWrite(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] m [0:31];
  wire  m_rw_r_en;
  wire [4:0] m_rw_r_addr;
  wire [31:0] m_rw_r_data;
  wire [31:0] m_rw_w_data;
  wire [4:0] m_rw_w_addr;
  wire  m_rw_w_mask;
  wire  m_rw_w_en;
  reg [31:0] n;
  reg  wmode;
  reg [4:0] addr;
  wire [32:0] _GEN_0 = ~wmode ? n + 32'h1 : {{1'd0}, n}; // @[]
  wire [5:0] _GEN_1 = ~wmode ? addr + 5'h1 : {{1'd0}, addr}; // @[]
  assign m_rw_r_en = ~wmode;
  assign m_rw_r_addr = addr;
  assign m_rw_r_data = m[m_rw_r_addr];
  assign m_rw_w_data = n;
  assign m_rw_w_addr = addr;
  assign m_rw_w_mask = 1'h1;
  assign m_rw_w_en = wmode;
  always @(posedge clock) begin
    if (m_rw_w_en & m_rw_w_mask) begin
      m[m_rw_w_addr] <= m_rw_w_data;
    end
    if (reset) begin
      n <= 32'h0;
    end else begin
      n <= _GEN_0[31:0];
    end
    wmode <= reset | ~wmode;
    if (reset) begin
      addr <= 5'h0;
    end else begin
      addr <= _GEN_1[4:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~wmode & m_rw_r_data != n) begin
          $fwrite(32'h80000002,"Assertion failed! m.rw.rdata has the wrong value!\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~wmode & m_rw_r_data != n) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  n = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  wmode = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  addr = _RAND_3[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MemTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  rwMod_clock;
  wire  rwMod_reset;
  reg [31:0] count;
  ReadWrite rwMod (
    .clock(rwMod_clock),
    .reset(rwMod_reset)
  );
  assign rwMod_clock = clock;
  assign rwMod_reset = reset;
  always @(posedge clock) begin
    if (reset) begin
      count <= 32'h64;
    end else begin
      count <= count - 32'h1;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (count == 32'h0) begin
          $finish;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
