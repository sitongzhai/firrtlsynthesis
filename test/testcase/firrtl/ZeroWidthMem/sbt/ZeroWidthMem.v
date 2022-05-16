module ZeroWidthMem(
  input        clock,
  input        reset,
  input  [3:0] waddr,
  input  [9:0] in_0,
  input  [3:0] raddr,
  output [9:0] out_0
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [9:0] ram_0 [0:15];
  wire  ram_0_ramout_en;
  wire [3:0] ram_0_ramout_addr;
  wire [9:0] ram_0_ramout_data;
  wire [9:0] ram_0_ramin_data;
  wire [3:0] ram_0_ramin_addr;
  wire  ram_0_ramin_mask;
  wire  ram_0_ramin_en;
  assign ram_0_ramout_en = 1'h1;
  assign ram_0_ramout_addr = raddr;
  assign ram_0_ramout_data = ram_0[ram_0_ramout_addr];
  assign ram_0_ramin_data = in_0;
  assign ram_0_ramin_addr = waddr;
  assign ram_0_ramin_mask = 1'h1;
  assign ram_0_ramin_en = 1'h1;
  assign out_0 = ram_0_ramout_data;
  always @(posedge clock) begin
    if (ram_0_ramin_en & ram_0_ramin_mask) begin
      ram_0[ram_0_ramin_addr] <= ram_0_ramin_data;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset) begin
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
    ram_0[initvar] = _RAND_0[9:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
