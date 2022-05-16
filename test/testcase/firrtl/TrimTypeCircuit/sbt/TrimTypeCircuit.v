module TrimTypeCircuit(
  input         clock,
  input         reset,
  input  [3:0]  io_a,
  input  [3:0]  io_b,
  output [9:0]  io_multiplyRoundHalfUp,
  output [19:0] io_multiplyNoTrim
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] regMultiplyRoundHalfUp; // @[NumbersSpec.scala 154:39]
  reg [7:0] regMultiplyNoTrim; // @[NumbersSpec.scala 157:34]
  wire [8:0] _GEN_0 = {$signed(regMultiplyRoundHalfUp), 1'h0}; // @[NumbersSpec.scala 161:26]
  wire [10:0] _GEN_1 = {$signed(regMultiplyNoTrim), 3'h0}; // @[NumbersSpec.scala 162:21]
  assign io_multiplyRoundHalfUp = {{1{_GEN_0[8]}},_GEN_0}; // @[NumbersSpec.scala 161:26]
  assign io_multiplyNoTrim = {{9{_GEN_1[10]}},_GEN_1}; // @[NumbersSpec.scala 162:21]
  always @(posedge clock) begin
    regMultiplyRoundHalfUp <= $signed(io_a) * $signed(io_b); // @[FixedPointTypeClass.scala 43:59]
    regMultiplyNoTrim <= $signed(io_a) * $signed(io_b); // @[FixedPointTypeClass.scala 43:59]
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
  regMultiplyRoundHalfUp = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  regMultiplyNoTrim = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
