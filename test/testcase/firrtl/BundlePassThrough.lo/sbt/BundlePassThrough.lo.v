module BundlePassThrough( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [2:0]  io_inBundle_u1, // @[:@6.4]
  input  [8:0]  io_inBundle_u2, // @[:@6.4]
  input  [26:0] io_inBundle_u3, // @[:@6.4]
  output [2:0]  io_outBundle_u1, // @[:@6.4]
  output [8:0]  io_outBundle_u2, // @[:@6.4]
  output [26:0] io_outBundle_u3, // @[:@6.4]
  output [8:0]  io_outBundleAsUInt // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] regBundle_u1; // @[AggregateOrderingSpec.scala 40:22:@11.4]
  reg [8:0] regBundle_u2; // @[AggregateOrderingSpec.scala 40:22:@11.4]
  reg [26:0] regBundle_u3; // @[AggregateOrderingSpec.scala 40:22:@11.4]
  wire [38:0] _T_7 = {io_inBundle_u1,io_inBundle_u2,io_inBundle_u3}; // @[AggregateOrderingSpec.scala 45:43:@19.4]
  assign io_outBundle_u1 = regBundle_u1;
  assign io_outBundle_u2 = regBundle_u2;
  assign io_outBundle_u3 = regBundle_u3;
  assign io_outBundleAsUInt = _T_7[8:0];
  always @(posedge clock) begin
    regBundle_u1 <= io_inBundle_u1;
    regBundle_u2 <= io_inBundle_u2;
    regBundle_u3 <= io_inBundle_u3;
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
  regBundle_u1 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  regBundle_u2 = _RAND_1[8:0];
  _RAND_2 = {1{`RANDOM}};
  regBundle_u3 = _RAND_2[26:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
