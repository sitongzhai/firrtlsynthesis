module OverflowTypeCircuit( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [3:0] io_a, // @[:@6.4]
  input  [3:0] io_b, // @[:@6.4]
  output [4:0] io_addWrap, // @[:@6.4]
  output [4:0] io_addGrow, // @[:@6.4]
  output [4:0] io_subWrap, // @[:@6.4]
  output [4:0] io_subGrow // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] regAddWrap; // @[NumbersSpec.scala 194:27:@14.4]
  reg [4:0] regAddGrow; // @[NumbersSpec.scala 195:27:@17.4]
  reg [3:0] regSubWrap; // @[NumbersSpec.scala 197:27:@22.4]
  reg [4:0] regSubGrow; // @[NumbersSpec.scala 198:27:@25.4]
  assign io_addWrap = {{1{regAddWrap[3]}},regAddWrap};
  assign io_addGrow = regAddGrow;
  assign io_subWrap = {{1{regSubWrap[3]}},regSubWrap};
  assign io_subGrow = regSubGrow;
  always @(posedge clock) begin
    regAddWrap <= $signed(io_a) + $signed(io_b); // @[SIntTypeClass.scala 23:22:@13.4]
    regAddGrow <= $signed(io_a) + $signed(io_b); // @[SIntTypeClass.scala 22:22:@16.4]
    regSubWrap <= $signed(io_a) - $signed(io_b); // @[SIntTypeClass.scala 32:22:@21.4]
    regSubGrow <= $signed(io_a) - $signed(io_b); // @[SIntTypeClass.scala 31:22:@24.4]
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
  regAddWrap = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  regAddGrow = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  regSubWrap = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  regSubGrow = _RAND_3[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
