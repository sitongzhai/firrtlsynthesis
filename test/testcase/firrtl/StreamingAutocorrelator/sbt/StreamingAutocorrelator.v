module TransposedStreamingFIR(
  input         clock,
  input  [9:0]  io_input,
  output [19:0] io_output,
  input  [9:0]  io_taps_0,
  input  [9:0]  io_taps_1,
  input  [9:0]  io_taps_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [19:0] products_1 = $signed(io_input) * $signed(io_taps_1); // @[SIntTypeClass.scala 44:41]
  wire [19:0] products_2 = $signed(io_input) * $signed(io_taps_0); // @[SIntTypeClass.scala 44:41]
  reg [19:0] last; // @[TransposedStreamingFIR.scala 62:17]
  reg [19:0] _T_14; // @[TransposedStreamingFIR.scala 64:18]
  reg [19:0] _T_19; // @[TransposedStreamingFIR.scala 64:18]
  assign io_output = last; // @[TransposedStreamingFIR.scala 69:13]
  always @(posedge clock) begin
    last <= $signed(_T_19) + $signed(products_2); // @[SIntTypeClass.scala 18:40]
    _T_14 <= $signed(io_input) * $signed(io_taps_2); // @[SIntTypeClass.scala 44:41]
    _T_19 <= $signed(_T_14) + $signed(products_1); // @[SIntTypeClass.scala 18:40]
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
  last = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  _T_14 = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  _T_19 = _RAND_2[19:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module StreamingAutocorrelator(
  input         clock,
  input         reset,
  input  [9:0]  io_input,
  output [19:0] io_output
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  firFilter_clock; // @[StreamingAutocorrelator.scala 28:11]
  wire [9:0] firFilter_io_input; // @[StreamingAutocorrelator.scala 28:11]
  wire [19:0] firFilter_io_output; // @[StreamingAutocorrelator.scala 28:11]
  wire [9:0] firFilter_io_taps_0; // @[StreamingAutocorrelator.scala 28:11]
  wire [9:0] firFilter_io_taps_1; // @[StreamingAutocorrelator.scala 28:11]
  wire [9:0] firFilter_io_taps_2; // @[StreamingAutocorrelator.scala 28:11]
  reg [9:0] delays_1; // @[StreamingAutocorrelator.scala 20:22]
  reg [9:0] delays_2; // @[StreamingAutocorrelator.scala 20:22]
  reg [9:0] delays_3; // @[StreamingAutocorrelator.scala 20:22]
  reg [9:0] delays_4; // @[StreamingAutocorrelator.scala 20:22]
  reg [9:0] delays_5; // @[StreamingAutocorrelator.scala 20:22]
  TransposedStreamingFIR firFilter ( // @[StreamingAutocorrelator.scala 28:11]
    .clock(firFilter_clock),
    .io_input(firFilter_io_input),
    .io_output(firFilter_io_output),
    .io_taps_0(firFilter_io_taps_0),
    .io_taps_1(firFilter_io_taps_1),
    .io_taps_2(firFilter_io_taps_2)
  );
  assign io_output = firFilter_io_output; // @[StreamingAutocorrelator.scala 33:13]
  assign firFilter_clock = clock;
  assign firFilter_io_input = io_input; // @[StreamingAutocorrelator.scala 32:22]
  assign firFilter_io_taps_0 = delays_5; // @[StreamingAutocorrelator.scala 31:21]
  assign firFilter_io_taps_1 = delays_4; // @[StreamingAutocorrelator.scala 31:21]
  assign firFilter_io_taps_2 = delays_3; // @[StreamingAutocorrelator.scala 31:21]
  always @(posedge clock) begin
    delays_1 <= io_input; // @[StreamingAutocorrelator.scala 21:13]
    delays_2 <= delays_1; // @[StreamingAutocorrelator.scala 21:13]
    delays_3 <= delays_2; // @[StreamingAutocorrelator.scala 21:13]
    delays_4 <= delays_3; // @[StreamingAutocorrelator.scala 21:13]
    delays_5 <= delays_4; // @[StreamingAutocorrelator.scala 21:13]
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
  delays_1 = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  delays_2 = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  delays_3 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  delays_4 = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  delays_5 = _RAND_4[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
