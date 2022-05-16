module GcdEngine( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_decoupledInput_ready, // @[:@6.4]
  input         io_decoupledInput_valid, // @[:@6.4]
  input  [15:0] io_decoupledInput_bits_a, // @[:@6.4]
  input  [15:0] io_decoupledInput_bits_b, // @[:@6.4]
  output        io_validOutput_valid, // @[:@6.4]
  output [15:0] io_validOutput_bits_a, // @[:@6.4]
  output [15:0] io_validOutput_bits_b, // @[:@6.4]
  output [15:0] io_validOutput_bits_gcd // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[ConcurrentDecoupledTestingSpec.scala 38:14:@11.4]
  reg [15:0] y; // @[ConcurrentDecoupledTestingSpec.scala 39:14:@12.4]
  reg [15:0] xOriginal; // @[ConcurrentDecoupledTestingSpec.scala 40:22:@13.4]
  reg [15:0] yOriginal; // @[ConcurrentDecoupledTestingSpec.scala 41:22:@14.4]
  reg  busy; // @[ConcurrentDecoupledTestingSpec.scala 42:21:@15.4]
  wire  _T_20 = ~busy; // @[ConcurrentDecoupledTestingSpec.scala 44:30:@16.4]
  wire  _T_23 = io_decoupledInput_valid & _T_20; // @[ConcurrentDecoupledTestingSpec.scala 46:32:@19.4]
  wire [15:0] _GEN_0 = _T_23 ? io_decoupledInput_bits_a : x; // @[ConcurrentDecoupledTestingSpec.scala 46:42:@20.4]
  wire  _GEN_4 = _T_23 | busy; // @[ConcurrentDecoupledTestingSpec.scala 46:42:@20.4]
  wire  _T_25 = x > y; // @[ConcurrentDecoupledTestingSpec.scala 55:12:@28.6]
  wire [15:0] _T_28 = y - x; // @[ConcurrentDecoupledTestingSpec.scala 60:16:@36.8]
  wire  _T_30 = y == 16'h0; // @[ConcurrentDecoupledTestingSpec.scala 67:32:@43.4]
  assign io_decoupledInput_ready = ~busy; // @[ConcurrentDecoupledTestingSpec.scala 44:30:@16.4]
  assign io_validOutput_valid = _T_30 & busy; // @[ConcurrentDecoupledTestingSpec.scala 67:40:@44.4]
  assign io_validOutput_bits_a = xOriginal;
  assign io_validOutput_bits_b = yOriginal;
  assign io_validOutput_bits_gcd = x;
  always @(posedge clock) begin
    if (busy) begin // @[ConcurrentDecoupledTestingSpec.scala 54:14:@27.4]
      if (_T_25) begin // @[ConcurrentDecoupledTestingSpec.scala 55:17:@29.6]
        x <= y;
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (busy) begin // @[ConcurrentDecoupledTestingSpec.scala 54:14:@27.4]
      if (_T_25) begin // @[ConcurrentDecoupledTestingSpec.scala 55:17:@29.6]
        y <= x;
      end else begin
        y <= _T_28;
      end
    end else if (_T_23) begin // @[ConcurrentDecoupledTestingSpec.scala 46:42:@20.4]
      y <= io_decoupledInput_bits_b;
    end
    if (_T_23) begin // @[ConcurrentDecoupledTestingSpec.scala 46:42:@20.4]
      xOriginal <= io_decoupledInput_bits_a;
    end
    if (_T_23) begin // @[ConcurrentDecoupledTestingSpec.scala 46:42:@20.4]
      yOriginal <= io_decoupledInput_bits_b;
    end
    if (reset) begin
      busy <= 1'h0;
    end else if (io_validOutput_valid) begin // @[ConcurrentDecoupledTestingSpec.scala 68:30:@46.4]
      busy <= 1'h0;
    end else begin
      busy <= _GEN_4;
    end
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
  x = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  xOriginal = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  yOriginal = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  busy = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultiGcdCalculator( // @[:@191.2]
  input         clock, // @[:@192.4]
  input         reset, // @[:@193.4]
  output        io_input_0_ready, // @[:@194.4]
  input         io_input_0_valid, // @[:@194.4]
  input  [15:0] io_input_0_bits_a, // @[:@194.4]
  input  [15:0] io_input_0_bits_b, // @[:@194.4]
  output        io_input_1_ready, // @[:@194.4]
  input         io_input_1_valid, // @[:@194.4]
  input  [15:0] io_input_1_bits_a, // @[:@194.4]
  input  [15:0] io_input_1_bits_b, // @[:@194.4]
  output        io_input_2_ready, // @[:@194.4]
  input         io_input_2_valid, // @[:@194.4]
  input  [15:0] io_input_2_bits_a, // @[:@194.4]
  input  [15:0] io_input_2_bits_b, // @[:@194.4]
  output        io_input_3_ready, // @[:@194.4]
  input         io_input_3_valid, // @[:@194.4]
  input  [15:0] io_input_3_bits_a, // @[:@194.4]
  input  [15:0] io_input_3_bits_b, // @[:@194.4]
  output        io_output_0_valid, // @[:@194.4]
  output [15:0] io_output_0_bits_a, // @[:@194.4]
  output [15:0] io_output_0_bits_b, // @[:@194.4]
  output [15:0] io_output_0_bits_gcd, // @[:@194.4]
  output        io_output_1_valid, // @[:@194.4]
  output [15:0] io_output_1_bits_a, // @[:@194.4]
  output [15:0] io_output_1_bits_b, // @[:@194.4]
  output [15:0] io_output_1_bits_gcd, // @[:@194.4]
  output        io_output_2_valid, // @[:@194.4]
  output [15:0] io_output_2_bits_a, // @[:@194.4]
  output [15:0] io_output_2_bits_b, // @[:@194.4]
  output [15:0] io_output_2_bits_gcd, // @[:@194.4]
  output        io_output_3_valid, // @[:@194.4]
  output [15:0] io_output_3_bits_a, // @[:@194.4]
  output [15:0] io_output_3_bits_b, // @[:@194.4]
  output [15:0] io_output_3_bits_gcd // @[:@194.4]
);
  wire  GcdEngine_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire  GcdEngine_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire  GcdEngine_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire  GcdEngine_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire [15:0] GcdEngine_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire [15:0] GcdEngine_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire  GcdEngine_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire [15:0] GcdEngine_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire [15:0] GcdEngine_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire [15:0] GcdEngine_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
  wire  GcdEngine_1_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire  GcdEngine_1_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire  GcdEngine_1_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire  GcdEngine_1_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire [15:0] GcdEngine_1_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire [15:0] GcdEngine_1_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire  GcdEngine_1_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire [15:0] GcdEngine_1_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire [15:0] GcdEngine_1_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire [15:0] GcdEngine_1_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
  wire  GcdEngine_2_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire  GcdEngine_2_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire  GcdEngine_2_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire  GcdEngine_2_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire [15:0] GcdEngine_2_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire [15:0] GcdEngine_2_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire  GcdEngine_2_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire [15:0] GcdEngine_2_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire [15:0] GcdEngine_2_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire [15:0] GcdEngine_2_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
  wire  GcdEngine_3_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire  GcdEngine_3_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire  GcdEngine_3_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire  GcdEngine_3_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire [15:0] GcdEngine_3_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire [15:0] GcdEngine_3_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire  GcdEngine_3_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire [15:0] GcdEngine_3_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire [15:0] GcdEngine_3_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  wire [15:0] GcdEngine_3_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
  GcdEngine GcdEngine ( // @[ConcurrentDecoupledTestingSpec.scala 84:24:@199.4]
    .clock(GcdEngine_clock),
    .reset(GcdEngine_reset),
    .io_decoupledInput_ready(GcdEngine_io_decoupledInput_ready),
    .io_decoupledInput_valid(GcdEngine_io_decoupledInput_valid),
    .io_decoupledInput_bits_a(GcdEngine_io_decoupledInput_bits_a),
    .io_decoupledInput_bits_b(GcdEngine_io_decoupledInput_bits_b),
    .io_validOutput_valid(GcdEngine_io_validOutput_valid),
    .io_validOutput_bits_a(GcdEngine_io_validOutput_bits_a),
    .io_validOutput_bits_b(GcdEngine_io_validOutput_bits_b),
    .io_validOutput_bits_gcd(GcdEngine_io_validOutput_bits_gcd)
  );
  GcdEngine GcdEngine_1 ( // @[ConcurrentDecoupledTestingSpec.scala 84:24:@211.4]
    .clock(GcdEngine_1_clock),
    .reset(GcdEngine_1_reset),
    .io_decoupledInput_ready(GcdEngine_1_io_decoupledInput_ready),
    .io_decoupledInput_valid(GcdEngine_1_io_decoupledInput_valid),
    .io_decoupledInput_bits_a(GcdEngine_1_io_decoupledInput_bits_a),
    .io_decoupledInput_bits_b(GcdEngine_1_io_decoupledInput_bits_b),
    .io_validOutput_valid(GcdEngine_1_io_validOutput_valid),
    .io_validOutput_bits_a(GcdEngine_1_io_validOutput_bits_a),
    .io_validOutput_bits_b(GcdEngine_1_io_validOutput_bits_b),
    .io_validOutput_bits_gcd(GcdEngine_1_io_validOutput_bits_gcd)
  );
  GcdEngine GcdEngine_2 ( // @[ConcurrentDecoupledTestingSpec.scala 84:24:@223.4]
    .clock(GcdEngine_2_clock),
    .reset(GcdEngine_2_reset),
    .io_decoupledInput_ready(GcdEngine_2_io_decoupledInput_ready),
    .io_decoupledInput_valid(GcdEngine_2_io_decoupledInput_valid),
    .io_decoupledInput_bits_a(GcdEngine_2_io_decoupledInput_bits_a),
    .io_decoupledInput_bits_b(GcdEngine_2_io_decoupledInput_bits_b),
    .io_validOutput_valid(GcdEngine_2_io_validOutput_valid),
    .io_validOutput_bits_a(GcdEngine_2_io_validOutput_bits_a),
    .io_validOutput_bits_b(GcdEngine_2_io_validOutput_bits_b),
    .io_validOutput_bits_gcd(GcdEngine_2_io_validOutput_bits_gcd)
  );
  GcdEngine GcdEngine_3 ( // @[ConcurrentDecoupledTestingSpec.scala 84:24:@235.4]
    .clock(GcdEngine_3_clock),
    .reset(GcdEngine_3_reset),
    .io_decoupledInput_ready(GcdEngine_3_io_decoupledInput_ready),
    .io_decoupledInput_valid(GcdEngine_3_io_decoupledInput_valid),
    .io_decoupledInput_bits_a(GcdEngine_3_io_decoupledInput_bits_a),
    .io_decoupledInput_bits_b(GcdEngine_3_io_decoupledInput_bits_b),
    .io_validOutput_valid(GcdEngine_3_io_validOutput_valid),
    .io_validOutput_bits_a(GcdEngine_3_io_validOutput_bits_a),
    .io_validOutput_bits_b(GcdEngine_3_io_validOutput_bits_b),
    .io_validOutput_bits_gcd(GcdEngine_3_io_validOutput_bits_gcd)
  );
  assign io_input_0_ready = GcdEngine_io_decoupledInput_ready;
  assign io_input_1_ready = GcdEngine_1_io_decoupledInput_ready;
  assign io_input_2_ready = GcdEngine_2_io_decoupledInput_ready;
  assign io_input_3_ready = GcdEngine_3_io_decoupledInput_ready;
  assign io_output_0_valid = GcdEngine_io_validOutput_valid;
  assign io_output_0_bits_a = GcdEngine_io_validOutput_bits_a;
  assign io_output_0_bits_b = GcdEngine_io_validOutput_bits_b;
  assign io_output_0_bits_gcd = GcdEngine_io_validOutput_bits_gcd;
  assign io_output_1_valid = GcdEngine_1_io_validOutput_valid;
  assign io_output_1_bits_a = GcdEngine_1_io_validOutput_bits_a;
  assign io_output_1_bits_b = GcdEngine_1_io_validOutput_bits_b;
  assign io_output_1_bits_gcd = GcdEngine_1_io_validOutput_bits_gcd;
  assign io_output_2_valid = GcdEngine_2_io_validOutput_valid;
  assign io_output_2_bits_a = GcdEngine_2_io_validOutput_bits_a;
  assign io_output_2_bits_b = GcdEngine_2_io_validOutput_bits_b;
  assign io_output_2_bits_gcd = GcdEngine_2_io_validOutput_bits_gcd;
  assign io_output_3_valid = GcdEngine_3_io_validOutput_valid;
  assign io_output_3_bits_a = GcdEngine_3_io_validOutput_bits_a;
  assign io_output_3_bits_b = GcdEngine_3_io_validOutput_bits_b;
  assign io_output_3_bits_gcd = GcdEngine_3_io_validOutput_bits_gcd;
  assign GcdEngine_clock = clock;
  assign GcdEngine_reset = reset;
  assign GcdEngine_io_decoupledInput_valid = io_input_0_valid;
  assign GcdEngine_io_decoupledInput_bits_a = io_input_0_bits_a;
  assign GcdEngine_io_decoupledInput_bits_b = io_input_0_bits_b;
  assign GcdEngine_1_clock = clock;
  assign GcdEngine_1_reset = reset;
  assign GcdEngine_1_io_decoupledInput_valid = io_input_1_valid;
  assign GcdEngine_1_io_decoupledInput_bits_a = io_input_1_bits_a;
  assign GcdEngine_1_io_decoupledInput_bits_b = io_input_1_bits_b;
  assign GcdEngine_2_clock = clock;
  assign GcdEngine_2_reset = reset;
  assign GcdEngine_2_io_decoupledInput_valid = io_input_2_valid;
  assign GcdEngine_2_io_decoupledInput_bits_a = io_input_2_bits_a;
  assign GcdEngine_2_io_decoupledInput_bits_b = io_input_2_bits_b;
  assign GcdEngine_3_clock = clock;
  assign GcdEngine_3_reset = reset;
  assign GcdEngine_3_io_decoupledInput_valid = io_input_3_valid;
  assign GcdEngine_3_io_decoupledInput_bits_a = io_input_3_bits_a;
  assign GcdEngine_3_io_decoupledInput_bits_b = io_input_3_bits_b;
endmodule
