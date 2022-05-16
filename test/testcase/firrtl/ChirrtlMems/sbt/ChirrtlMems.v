module ChirrtlMems(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:15];
  wire  ram_r_en;
  wire [3:0] ram_r_addr;
  wire [31:0] ram_r_data;
  wire [31:0] ram_w_data;
  wire [3:0] ram_w_addr;
  wire  ram_w_mask;
  wire  ram_w_en;
  reg [3:0] raddr;
  reg [3:0] waddr;
  wire [4:0] _GEN_0 = waddr == 4'h0 ? 5'h0 : raddr + 4'h1; // @[]
  wire  wen = ~reset;
  wire [4:0] _GEN_1 = wen ? waddr + 4'h1 : {{1'd0}, waddr}; // @[]
  wire [4:0] _GEN_6 = wen ? _GEN_0 : raddr + 4'h1; // @[]
  wire [31:0] _GEN_9 = {{28'd0}, raddr};
  assign ram_r_en = 1'h1;
  assign ram_r_addr = raddr;
  assign ram_r_data = ram[ram_r_addr];
  assign ram_w_data = {{28'd0}, waddr};
  assign ram_w_addr = waddr;
  assign ram_w_mask = 1'h1;
  assign ram_w_en = ~reset;
  always @(posedge clock) begin
    if (ram_w_en & ram_w_mask) begin
      ram[ram_w_addr] <= ram_w_data;
    end
    if (reset) begin
      raddr <= 4'h0;
    end else begin
      raddr <= _GEN_6[3:0];
    end
    if (reset) begin
      waddr <= 4'h0;
    end else begin
      waddr <= _GEN_1[3:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen & waddr > 4'h1 & ram_r_data != _GEN_9) begin
          $fwrite(32'h80000002,"Assertion failed! r =/= raddr\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (wen & waddr > 4'h1 & ram_r_data != _GEN_9) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (wen & raddr == 4'hf) begin
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  raddr = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  waddr = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
