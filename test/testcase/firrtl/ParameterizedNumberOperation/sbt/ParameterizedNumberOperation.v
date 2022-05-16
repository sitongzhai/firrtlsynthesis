module ParameterizedNumberOperation(
  input         clock,
  input         reset,
  input  [15:0] io_a1,
  input  [15:0] io_a2,
  output [47:0] io_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [47:0] register1; // @[ParameterizedOpSpec.scala 27:22]
  wire [31:0] _T_10 = $signed(io_a1) * $signed(io_a2); // @[FixedPointTypeClass.scala 43:59]
  wire [23:0] _GEN_0 = _T_10[31:8]; // @[ParameterizedOpSpec.scala 29:13]
  assign io_c = register1; // @[ParameterizedOpSpec.scala 39:8]
  always @(posedge clock) begin
    register1 <= {{24{_GEN_0[23]}},_GEN_0}; // @[ParameterizedOpSpec.scala 29:13]
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
  _RAND_0 = {2{`RANDOM}};
  register1 = _RAND_0[47:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
