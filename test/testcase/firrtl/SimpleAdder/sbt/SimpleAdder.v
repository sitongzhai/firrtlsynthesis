module SimpleAdder(
  input         clock,
  input         reset,
  input  [5:0]  io_a1,
  input  [7:0]  io_a2,
  output [11:0] io_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] register1; // @[SimpleAdderSpec.scala 19:22]
  wire [10:0] _GEN_0 = {{5{io_a1[5]}},io_a1}; // @[SimpleAdderSpec.scala 21:22]
  wire [10:0] _GEN_1 = {$signed(io_a2), 3'h0}; // @[SimpleAdderSpec.scala 21:22]
  assign io_c = {$signed(register1), 1'h0}; // @[SimpleAdderSpec.scala 23:8]
  always @(posedge clock) begin
    register1 <= $signed(_GEN_0) + $signed(_GEN_1); // @[SimpleAdderSpec.scala 21:22]
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
  register1 = _RAND_0[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
