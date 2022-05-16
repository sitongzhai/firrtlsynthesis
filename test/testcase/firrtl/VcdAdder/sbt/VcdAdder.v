module DoAdd(
  input        clock,
  input  [7:0] a,
  input  [7:0] b,
  output [9:0] c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [8:0] accum;
  assign c = {{1{accum[8]}},accum};
  always @(posedge clock) begin
    accum <= $signed(a) + $signed(b);
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
  accum = _RAND_0[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VcdAdder(
  input        clock,
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [9:0] io_c
);
  wire  do_add_clock;
  wire [7:0] do_add_a;
  wire [7:0] do_add_b;
  wire [9:0] do_add_c;
  DoAdd do_add (
    .clock(do_add_clock),
    .a(do_add_a),
    .b(do_add_b),
    .c(do_add_c)
  );
  assign io_c = do_add_c;
  assign do_add_clock = clock;
  assign do_add_a = io_a;
  assign do_add_b = io_b;
endmodule
