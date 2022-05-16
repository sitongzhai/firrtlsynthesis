module Complex3R3WCMem(
  input        clock,
  input        reset,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input  [3:0] io_rdAddr2,
  output [7:0] io_rdData2,
  input  [3:0] io_rdAddr3,
  output [7:0] io_rdData3,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [3:0] io_wrAddr,
  input        io_wrEna2,
  input  [7:0] io_wrData2,
  input  [3:0] io_wrAddr2,
  input        io_wrEna3,
  input  [7:0] io_wrData3,
  input  [3:0] io_wrAddr3
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:15]; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_37_en; // @[Complex3R3WCMem.scala 26:24]
  wire [3:0] mem__T_37_addr; // @[Complex3R3WCMem.scala 26:24]
  wire [7:0] mem__T_37_data; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_38_en; // @[Complex3R3WCMem.scala 26:24]
  wire [3:0] mem__T_38_addr; // @[Complex3R3WCMem.scala 26:24]
  wire [7:0] mem__T_38_data; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_39_en; // @[Complex3R3WCMem.scala 26:24]
  wire [3:0] mem__T_39_addr; // @[Complex3R3WCMem.scala 26:24]
  wire [7:0] mem__T_39_data; // @[Complex3R3WCMem.scala 26:24]
  wire [7:0] mem__T_40_data; // @[Complex3R3WCMem.scala 26:24]
  wire [3:0] mem__T_40_addr; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_40_mask; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_40_en; // @[Complex3R3WCMem.scala 26:24]
  wire [7:0] mem__T_41_data; // @[Complex3R3WCMem.scala 26:24]
  wire [3:0] mem__T_41_addr; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_41_mask; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_41_en; // @[Complex3R3WCMem.scala 26:24]
  wire [7:0] mem__T_42_data; // @[Complex3R3WCMem.scala 26:24]
  wire [3:0] mem__T_42_addr; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_42_mask; // @[Complex3R3WCMem.scala 26:24]
  wire  mem__T_42_en; // @[Complex3R3WCMem.scala 26:24]
  assign mem__T_37_en = 1'h1;
  assign mem__T_37_addr = io_rdAddr;
  assign mem__T_37_data = mem[mem__T_37_addr]; // @[Complex3R3WCMem.scala 26:24]
  assign mem__T_38_en = 1'h1;
  assign mem__T_38_addr = io_rdAddr2;
  assign mem__T_38_data = mem[mem__T_38_addr]; // @[Complex3R3WCMem.scala 26:24]
  assign mem__T_39_en = 1'h1;
  assign mem__T_39_addr = io_rdAddr3;
  assign mem__T_39_data = mem[mem__T_39_addr]; // @[Complex3R3WCMem.scala 26:24]
  assign mem__T_40_data = io_wrData;
  assign mem__T_40_addr = io_wrAddr;
  assign mem__T_40_mask = 1'h1;
  assign mem__T_40_en = io_wrEna;
  assign mem__T_41_data = io_wrData2;
  assign mem__T_41_addr = io_wrAddr2;
  assign mem__T_41_mask = 1'h1;
  assign mem__T_41_en = io_wrEna2;
  assign mem__T_42_data = io_wrData3;
  assign mem__T_42_addr = io_wrAddr3;
  assign mem__T_42_mask = 1'h1;
  assign mem__T_42_en = io_wrEna3;
  assign io_rdData = mem__T_37_data; // @[Complex3R3WCMem.scala 54:13]
  assign io_rdData2 = mem__T_38_data; // @[Complex3R3WCMem.scala 55:14]
  assign io_rdData3 = mem__T_39_data; // @[Complex3R3WCMem.scala 56:14]
  always @(posedge clock) begin
    if (mem__T_40_en & mem__T_40_mask) begin
      mem[mem__T_40_addr] <= mem__T_40_data; // @[Complex3R3WCMem.scala 26:24]
    end
    if (mem__T_41_en & mem__T_41_mask) begin
      mem[mem__T_41_addr] <= mem__T_41_data; // @[Complex3R3WCMem.scala 26:24]
    end
    if (mem__T_42_en & mem__T_42_mask) begin
      mem[mem__T_42_addr] <= mem__T_42_data; // @[Complex3R3WCMem.scala 26:24]
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
