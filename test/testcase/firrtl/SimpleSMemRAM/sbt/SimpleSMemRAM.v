module SimpleSMemRAM(
  input        clock,
  input        reset,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [3:0] io_wrAddr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:15]; // @[SimpleSMemRAM.scala 16:24]
  wire  mem__T_17_en; // @[SimpleSMemRAM.scala 16:24]
  wire [3:0] mem__T_17_addr; // @[SimpleSMemRAM.scala 16:24]
  wire [7:0] mem__T_17_data; // @[SimpleSMemRAM.scala 16:24]
  wire [7:0] mem__T_18_data; // @[SimpleSMemRAM.scala 16:24]
  wire [3:0] mem__T_18_addr; // @[SimpleSMemRAM.scala 16:24]
  wire  mem__T_18_mask; // @[SimpleSMemRAM.scala 16:24]
  wire  mem__T_18_en; // @[SimpleSMemRAM.scala 16:24]
  reg [3:0] mem__T_17_addr_pipe_0;
  assign mem__T_17_en = 1'h1;
  assign mem__T_17_addr = mem__T_17_addr_pipe_0;
  assign mem__T_17_data = mem[mem__T_17_addr]; // @[SimpleSMemRAM.scala 16:24]
  assign mem__T_18_data = io_wrData;
  assign mem__T_18_addr = io_wrAddr;
  assign mem__T_18_mask = 1'h1;
  assign mem__T_18_en = io_wrEna;
  assign io_rdData = mem__T_17_data; // @[SimpleSMemRAM.scala 44:13]
  always @(posedge clock) begin
    if (mem__T_18_en & mem__T_18_mask) begin
      mem[mem__T_18_addr] <= mem__T_18_data; // @[SimpleSMemRAM.scala 16:24]
    end
    mem__T_17_addr_pipe_0 <= io_rdAddr;
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
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_17_addr_pipe_0 = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
