module SimpleCMemRAM(
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
  reg [7:0] mem [0:15]; // @[SimpleCMemRAM.scala 17:17]
  wire  mem__T_17_en; // @[SimpleCMemRAM.scala 17:17]
  wire [3:0] mem__T_17_addr; // @[SimpleCMemRAM.scala 17:17]
  wire [7:0] mem__T_17_data; // @[SimpleCMemRAM.scala 17:17]
  wire [7:0] mem__T_18_data; // @[SimpleCMemRAM.scala 17:17]
  wire [3:0] mem__T_18_addr; // @[SimpleCMemRAM.scala 17:17]
  wire  mem__T_18_mask; // @[SimpleCMemRAM.scala 17:17]
  wire  mem__T_18_en; // @[SimpleCMemRAM.scala 17:17]
  assign mem__T_17_en = 1'h1;
  assign mem__T_17_addr = io_rdAddr;
  assign mem__T_17_data = mem[mem__T_17_addr]; // @[SimpleCMemRAM.scala 17:17]
  assign mem__T_18_data = io_wrData;
  assign mem__T_18_addr = io_wrAddr;
  assign mem__T_18_mask = 1'h1;
  assign mem__T_18_en = io_wrEna;
  assign io_rdData = mem__T_17_data; // @[SimpleCMemRAM.scala 44:13]
  always @(posedge clock) begin
    if (mem__T_18_en & mem__T_18_mask) begin
      mem[mem__T_18_addr] <= mem__T_18_data; // @[SimpleCMemRAM.scala 17:17]
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
