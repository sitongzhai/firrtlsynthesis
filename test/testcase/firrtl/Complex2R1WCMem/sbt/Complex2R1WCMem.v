module Complex2R1WCMem(
  input        clock,
  input        reset,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input  [3:0] io_rdAddr2,
  output [7:0] io_rdData2,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [3:0] io_wrAddr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:15]; // @[Complex2R1WCMem.scala 21:24]
  wire  mem__T_21_en; // @[Complex2R1WCMem.scala 21:24]
  wire [3:0] mem__T_21_addr; // @[Complex2R1WCMem.scala 21:24]
  wire [7:0] mem__T_21_data; // @[Complex2R1WCMem.scala 21:24]
  wire  mem__T_22_en; // @[Complex2R1WCMem.scala 21:24]
  wire [3:0] mem__T_22_addr; // @[Complex2R1WCMem.scala 21:24]
  wire [7:0] mem__T_22_data; // @[Complex2R1WCMem.scala 21:24]
  wire [7:0] mem__T_23_data; // @[Complex2R1WCMem.scala 21:24]
  wire [3:0] mem__T_23_addr; // @[Complex2R1WCMem.scala 21:24]
  wire  mem__T_23_mask; // @[Complex2R1WCMem.scala 21:24]
  wire  mem__T_23_en; // @[Complex2R1WCMem.scala 21:24]
  assign mem__T_21_en = 1'h1;
  assign mem__T_21_addr = io_rdAddr;
  assign mem__T_21_data = mem[mem__T_21_addr]; // @[Complex2R1WCMem.scala 21:24]
  assign mem__T_22_en = 1'h1;
  assign mem__T_22_addr = io_rdAddr2;
  assign mem__T_22_data = mem[mem__T_22_addr]; // @[Complex2R1WCMem.scala 21:24]
  assign mem__T_23_data = io_wrData;
  assign mem__T_23_addr = io_wrAddr;
  assign mem__T_23_mask = 1'h1;
  assign mem__T_23_en = io_wrEna;
  assign io_rdData = mem__T_21_data; // @[Complex2R1WCMem.scala 49:13]
  assign io_rdData2 = mem__T_22_data; // @[Complex2R1WCMem.scala 50:14]
  always @(posedge clock) begin
    if (mem__T_23_en & mem__T_23_mask) begin
      mem[mem__T_23_addr] <= mem__T_23_data; // @[Complex2R1WCMem.scala 21:24]
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
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
