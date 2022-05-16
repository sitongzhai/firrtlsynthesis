module SimpleSMemMRROM(
  input        clock,
  input        reset,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input  [3:0] io_rdAddr2,
  output [7:0] io_rdData2
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:63]; // @[SimpleSMemMRROM.scala 18:24]
  wire  mem__T_15_en; // @[SimpleSMemMRROM.scala 18:24]
  wire [5:0] mem__T_15_addr; // @[SimpleSMemMRROM.scala 18:24]
  wire [7:0] mem__T_15_data; // @[SimpleSMemMRROM.scala 18:24]
  wire  mem__T_16_en; // @[SimpleSMemMRROM.scala 18:24]
  wire [5:0] mem__T_16_addr; // @[SimpleSMemMRROM.scala 18:24]
  wire [7:0] mem__T_16_data; // @[SimpleSMemMRROM.scala 18:24]
  reg [5:0] mem__T_15_addr_pipe_0;
  reg [5:0] mem__T_16_addr_pipe_0;
  assign mem__T_15_en = 1'h1;
  assign mem__T_15_addr = mem__T_15_addr_pipe_0;
  assign mem__T_15_data = mem[mem__T_15_addr]; // @[SimpleSMemMRROM.scala 18:24]
  assign mem__T_16_en = 1'h1;
  assign mem__T_16_addr = mem__T_16_addr_pipe_0;
  assign mem__T_16_data = mem[mem__T_16_addr]; // @[SimpleSMemMRROM.scala 18:24]
  assign io_rdData = mem__T_15_data; // @[SimpleSMemMRROM.scala 46:13]
  assign io_rdData2 = mem__T_16_data; // @[SimpleSMemMRROM.scala 47:14]
  always @(posedge clock) begin
    mem__T_15_addr_pipe_0 <= {{2'd0}, io_rdAddr};
    mem__T_16_addr_pipe_0 <= {{2'd0}, io_rdAddr2};
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
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_15_addr_pipe_0 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  mem__T_16_addr_pipe_0 = _RAND_2[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
