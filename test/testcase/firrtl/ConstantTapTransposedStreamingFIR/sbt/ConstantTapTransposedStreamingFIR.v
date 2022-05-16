module ConstantTapTransposedStreamingFIR(
  input         clock,
  input         reset,
  input         io_input_valid,
  input  [9:0]  io_input_bits,
  output        io_output_valid,
  output [15:0] io_output_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [12:0] products_0 = $signed(io_input_bits) * 3'sh2; // @[SIntTypeClass.scala 44:41]
  wire [11:0] products_1 = $signed(io_input_bits) * 2'sh1; // @[SIntTypeClass.scala 44:41]
  wire [10:0] products_2 = $signed(io_input_bits) * 1'sh0; // @[SIntTypeClass.scala 44:41]
  reg [15:0] last; // @[TransposedStreamingFIR.scala 33:20]
  reg [12:0] _T_16; // @[TransposedStreamingFIR.scala 35:18]
  wire [12:0] _GEN_3 = {{1{products_1[11]}},products_1}; // @[SIntTypeClass.scala 18:40]
  wire [12:0] _T_19 = $signed(_T_16) + $signed(_GEN_3); // @[SIntTypeClass.scala 18:40]
  reg [12:0] _T_21; // @[TransposedStreamingFIR.scala 35:18]
  wire [12:0] _GEN_4 = {{2{products_2[10]}},products_2}; // @[SIntTypeClass.scala 18:40]
  wire [12:0] nextLast = $signed(_T_21) + $signed(_GEN_4); // @[SIntTypeClass.scala 18:40]
  reg  _T_25; // @[TransposedStreamingFIR.scala 46:29]
  assign io_output_valid = _T_25; // @[TransposedStreamingFIR.scala 46:19]
  assign io_output_bits = last; // @[TransposedStreamingFIR.scala 45:18]
  always @(posedge clock) begin
    if (io_input_valid) begin // @[TransposedStreamingFIR.scala 41:24]
      last <= {{3{nextLast[12]}},nextLast}; // @[TransposedStreamingFIR.scala 42:10]
    end
    if (io_input_valid) begin // @[TransposedStreamingFIR.scala 36:27]
      _T_16 <= products_0; // @[TransposedStreamingFIR.scala 37:11]
    end
    if (io_input_valid) begin // @[TransposedStreamingFIR.scala 36:27]
      _T_21 <= _T_19; // @[TransposedStreamingFIR.scala 37:11]
    end
    _T_25 <= io_input_valid; // @[TransposedStreamingFIR.scala 46:29]
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
  last = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  _T_16 = _RAND_1[12:0];
  _RAND_2 = {1{`RANDOM}};
  _T_21 = _RAND_2[12:0];
  _RAND_3 = {1{`RANDOM}};
  _T_25 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
