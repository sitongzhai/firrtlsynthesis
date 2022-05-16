module ParameterizedAdder( // @[:@11.2]
  input         clock, // @[:@12.4]
  input         reset, // @[:@13.4]
  input  [63:0] io_a1_node, // @[:@14.4]
  input  [63:0] io_a2_node, // @[:@14.4]
  output [63:0] io_c_node // @[:@14.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] BBFAdd_out; // @[DspReal.scala 43:36:@20.4]
  wire [63:0] BBFAdd_in2; // @[DspReal.scala 43:36:@20.4]
  wire [63:0] BBFAdd_in1; // @[DspReal.scala 43:36:@20.4]
  reg [63:0] register1_node; // @[ParameterizedAdderSpec.scala 20:22:@19.4]
  BBFAdd BBFAdd ( // @[DspReal.scala 43:36:@20.4]
    .out(BBFAdd_out),
    .in2(BBFAdd_in2),
    .in1(BBFAdd_in1)
  );
  assign io_c_node = register1_node;
  assign BBFAdd_in2 = io_a2_node;
  assign BBFAdd_in1 = io_a1_node;
  always @(posedge clock) begin
    register1_node <= BBFAdd_out; // @[DspReal.scala 28:19:@26.4]
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
  register1_node = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
