module Complex2R2WSMem(
  input        clock,
  input        reset,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input  [3:0] io_rdAddr2,
  output [7:0] io_rdData2,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [3:0] io_wrAddr,
  input        io_wrEna2,
  input  [7:0] io_wrData2,
  input  [3:0] io_wrAddr2
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:15]; // @[Complex2R2WSMem.scala 21:24]
  wire  mem__T_27_en; // @[Complex2R2WSMem.scala 21:24]
  wire [3:0] mem__T_27_addr; // @[Complex2R2WSMem.scala 21:24]
  wire [7:0] mem__T_27_data; // @[Complex2R2WSMem.scala 21:24]
  wire  mem__T_28_en; // @[Complex2R2WSMem.scala 21:24]
  wire [3:0] mem__T_28_addr; // @[Complex2R2WSMem.scala 21:24]
  wire [7:0] mem__T_28_data; // @[Complex2R2WSMem.scala 21:24]
  wire [7:0] mem__T_29_data; // @[Complex2R2WSMem.scala 21:24]
  wire [3:0] mem__T_29_addr; // @[Complex2R2WSMem.scala 21:24]
  wire  mem__T_29_mask; // @[Complex2R2WSMem.scala 21:24]
  wire  mem__T_29_en; // @[Complex2R2WSMem.scala 21:24]
  wire [7:0] mem__T_30_data; // @[Complex2R2WSMem.scala 21:24]
  wire [3:0] mem__T_30_addr; // @[Complex2R2WSMem.scala 21:24]
  wire  mem__T_30_mask; // @[Complex2R2WSMem.scala 21:24]
  wire  mem__T_30_en; // @[Complex2R2WSMem.scala 21:24]
  reg [3:0] mem__T_27_addr_pipe_0;
  reg [3:0] mem__T_28_addr_pipe_0;
  assign mem__T_27_en = 1'h1;
  assign mem__T_27_addr = mem__T_27_addr_pipe_0;
  assign mem__T_27_data = mem[mem__T_27_addr]; // @[Complex2R2WSMem.scala 21:24]
  assign mem__T_28_en = 1'h1;
  assign mem__T_28_addr = mem__T_28_addr_pipe_0;
  assign mem__T_28_data = mem[mem__T_28_addr]; // @[Complex2R2WSMem.scala 21:24]
  assign mem__T_29_data = io_wrData;
  assign mem__T_29_addr = io_wrAddr;
  assign mem__T_29_mask = 1'h1;
  assign mem__T_29_en = io_wrEna;
  assign mem__T_30_data = io_wrData2;
  assign mem__T_30_addr = io_wrAddr2;
  assign mem__T_30_mask = 1'h1;
  assign mem__T_30_en = io_wrEna2;
  assign io_rdData = mem__T_27_data; // @[Complex2R2WSMem.scala 49:13]
  assign io_rdData2 = mem__T_28_data; // @[Complex2R2WSMem.scala 50:14]
  always @(posedge clock) begin
    if (mem__T_29_en & mem__T_29_mask) begin
      mem[mem__T_29_addr] <= mem__T_29_data; // @[Complex2R2WSMem.scala 21:24]
    end
    if (mem__T_30_en & mem__T_30_mask) begin
      mem[mem__T_30_addr] <= mem__T_30_data; // @[Complex2R2WSMem.scala 21:24]
    end
    mem__T_27_addr_pipe_0 <= io_rdAddr;
    mem__T_28_addr_pipe_0 <= io_rdAddr2;
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
  mem__T_27_addr_pipe_0 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  mem__T_28_addr_pipe_0 = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
