module OverflowTypeCircuit(
  input        clock,
  input        reset,
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [4:0] io_addWrap,
  output [4:0] io_addGrow,
  output [4:0] io_subWrap,
  output [4:0] io_subGrow
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] regAddWrap; // @[NumbersSpec.scala 194:27]
  reg [4:0] regAddGrow; // @[NumbersSpec.scala 195:27]
  reg [3:0] regSubWrap; // @[NumbersSpec.scala 197:27]
  reg [4:0] regSubGrow; // @[NumbersSpec.scala 198:27]
  assign io_addWrap = {{1{regAddWrap[3]}},regAddWrap}; // @[NumbersSpec.scala 201:14]
  assign io_addGrow = regAddGrow; // @[NumbersSpec.scala 202:14]
  assign io_subWrap = {{1{regSubWrap[3]}},regSubWrap}; // @[NumbersSpec.scala 203:14]
  assign io_subGrow = regSubGrow; // @[NumbersSpec.scala 204:14]
  always @(posedge clock) begin
    regAddWrap <= $signed(io_a) + $signed(io_b); // @[SIntTypeClass.scala 23:22]
    regAddGrow <= $signed(io_a) + $signed(io_b); // @[SIntTypeClass.scala 22:22]
    regSubWrap <= $signed(io_a) - $signed(io_b); // @[SIntTypeClass.scala 32:22]
    regSubGrow <= $signed(io_a) - $signed(io_b); // @[SIntTypeClass.scala 31:22]
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
