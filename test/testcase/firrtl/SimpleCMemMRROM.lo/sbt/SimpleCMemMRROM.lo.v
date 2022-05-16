module SimpleCMemMRROM( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [3:0] io_rdAddr, // @[:@6.4]
  output [7:0] io_rdData, // @[:@6.4]
  input  [3:0] io_rdAddr2, // @[:@6.4]
  output [7:0] io_rdData2 // @[:@6.4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:63]; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  wire  mem__T_15_en; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  wire [5:0] mem__T_15_addr; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  wire [7:0] mem__T_15_data; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  wire  mem__T_16_en; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  wire [5:0] mem__T_16_addr; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  wire [7:0] mem__T_16_data; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  assign mem__T_15_en = 1'h1;
  assign mem__T_15_addr = {{2'd0}, io_rdAddr};
  assign mem__T_15_data = mem[mem__T_15_addr]; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  assign mem__T_16_en = 1'h1;
  assign mem__T_16_addr = {{2'd0}, io_rdAddr2};
  assign mem__T_16_data = mem[mem__T_16_addr]; // @[SimpleCMemMRROM.scala 18:24:@8.4]
  assign io_rdData = mem__T_15_data; // @[SimpleCMemMRROM.scala 46:13:@10.4]
  assign io_rdData2 = mem__T_16_data; // @[SimpleCMemMRROM.scala 47:14:@12.4]
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
