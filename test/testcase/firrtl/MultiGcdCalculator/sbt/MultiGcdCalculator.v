module GcdEngine(
  input         clock,
  input         reset,
  output        io_decoupledInput_ready,
  input         io_decoupledInput_valid,
  input  [15:0] io_decoupledInput_bits_a,
  input  [15:0] io_decoupledInput_bits_b,
  output        io_validOutput_valid,
  output [15:0] io_validOutput_bits_a,
  output [15:0] io_validOutput_bits_b,
  output [15:0] io_validOutput_bits_gcd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[ConcurrentDecoupledTestingSpec.scala 38:14]
  reg [15:0] y; // @[ConcurrentDecoupledTestingSpec.scala 39:14]
  reg [15:0] xOriginal; // @[ConcurrentDecoupledTestingSpec.scala 40:22]
  reg [15:0] yOriginal; // @[ConcurrentDecoupledTestingSpec.scala 41:22]
  reg  busy; // @[ConcurrentDecoupledTestingSpec.scala 42:21]
  wire  _T_20 = ~busy; // @[ConcurrentDecoupledTestingSpec.scala 44:30]
  wire [15:0] _GEN_0 = io_decoupledInput_valid & _T_20 ? io_decoupledInput_bits_a : x; // @[ConcurrentDecoupledTestingSpec.scala 46:42 ConcurrentDecoupledTestingSpec.scala 47:7 ConcurrentDecoupledTestingSpec.scala 38:14]
  wire [15:0] _GEN_1 = io_decoupledInput_valid & _T_20 ? io_decoupledInput_bits_b : y; // @[ConcurrentDecoupledTestingSpec.scala 46:42 ConcurrentDecoupledTestingSpec.scala 48:7 ConcurrentDecoupledTestingSpec.scala 39:14]
  wire  _GEN_4 = io_decoupledInput_valid & _T_20 | busy; // @[ConcurrentDecoupledTestingSpec.scala 46:42 ConcurrentDecoupledTestingSpec.scala 51:10 ConcurrentDecoupledTestingSpec.scala 42:21]
  wire  _T_27 = ~(x > y); // @[ConcurrentDecoupledTestingSpec.scala 55:17]
  wire [15:0] _T_30 = y - x; // @[ConcurrentDecoupledTestingSpec.scala 60:16]
  assign io_decoupledInput_ready = ~busy; // @[ConcurrentDecoupledTestingSpec.scala 44:30]
  assign io_validOutput_valid = y == 16'h0 & busy; // @[ConcurrentDecoupledTestingSpec.scala 67:40]
  assign io_validOutput_bits_a = xOriginal; // @[ConcurrentDecoupledTestingSpec.scala 65:27]
  assign io_validOutput_bits_b = yOriginal; // @[ConcurrentDecoupledTestingSpec.scala 66:27]
  assign io_validOutput_bits_gcd = x; // @[ConcurrentDecoupledTestingSpec.scala 64:27]
  always @(posedge clock) begin
    if (busy) begin // @[ConcurrentDecoupledTestingSpec.scala 54:14]
      if (x > y) begin // @[ConcurrentDecoupledTestingSpec.scala 55:17]
        x <= y; // @[ConcurrentDecoupledTestingSpec.scala 56:9]
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (busy) begin // @[ConcurrentDecoupledTestingSpec.scala 54:14]
      if (_T_27) begin // @[ConcurrentDecoupledTestingSpec.scala 59:18]
        y <= _T_30; // @[ConcurrentDecoupledTestingSpec.scala 60:11]
      end else if (x > y) begin // @[ConcurrentDecoupledTestingSpec.scala 55:17]
        y <= x; // @[ConcurrentDecoupledTestingSpec.scala 57:9]
      end else begin
        y <= _GEN_1;
      end
    end else begin
      y <= _GEN_1;
    end
    if (io_decoupledInput_valid & _T_20) begin // @[ConcurrentDecoupledTestingSpec.scala 46:42]
      xOriginal <= io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 49:15]
    end
    if (io_decoupledInput_valid & _T_20) begin // @[ConcurrentDecoupledTestingSpec.scala 46:42]
      yOriginal <= io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 50:15]
    end
    if (reset) begin // @[ConcurrentDecoupledTestingSpec.scala 42:21]
      busy <= 1'h0; // @[ConcurrentDecoupledTestingSpec.scala 42:21]
    end else if (io_validOutput_valid) begin // @[ConcurrentDecoupledTestingSpec.scala 68:30]
      busy <= 1'h0; // @[ConcurrentDecoupledTestingSpec.scala 69:10]
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
module MultiGcdCalculator(
  input         clock,
  input         reset,
  output        io_input_0_ready,
  input         io_input_0_valid,
  input  [15:0] io_input_0_bits_a,
  input  [15:0] io_input_0_bits_b,
  output        io_input_1_ready,
  input         io_input_1_valid,
  input  [15:0] io_input_1_bits_a,
  input  [15:0] io_input_1_bits_b,
  output        io_input_2_ready,
  input         io_input_2_valid,
  input  [15:0] io_input_2_bits_a,
  input  [15:0] io_input_2_bits_b,
  output        io_input_3_ready,
  input         io_input_3_valid,
  input  [15:0] io_input_3_bits_a,
  input  [15:0] io_input_3_bits_b,
  output        io_output_0_valid,
  output [15:0] io_output_0_bits_a,
  output [15:0] io_output_0_bits_b,
  output [15:0] io_output_0_bits_gcd,
  output        io_output_1_valid,
  output [15:0] io_output_1_bits_a,
  output [15:0] io_output_1_bits_b,
  output [15:0] io_output_1_bits_gcd,
  output        io_output_2_valid,
  output [15:0] io_output_2_bits_a,
  output [15:0] io_output_2_bits_b,
  output [15:0] io_output_2_bits_gcd,
  output        io_output_3_valid,
  output [15:0] io_output_3_bits_a,
  output [15:0] io_output_3_bits_b,
  output [15:0] io_output_3_bits_gcd
);
  wire  GcdEngine_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_1_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_1_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_1_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_1_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_1_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_1_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_1_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_1_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_1_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_1_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_2_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_2_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_2_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_2_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_2_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_2_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_2_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_2_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_2_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_2_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_3_clock; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_3_reset; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_3_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_3_io_decoupledInput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_3_io_decoupledInput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_3_io_decoupledInput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire  GcdEngine_3_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_3_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_3_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  wire [15:0] GcdEngine_3_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 84:24]
  GcdEngine GcdEngine ( // @[ConcurrentDecoupledTestingSpec.scala 84:24]
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
  GcdEngine GcdEngine_1 ( // @[ConcurrentDecoupledTestingSpec.scala 84:24]
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
  GcdEngine GcdEngine_2 ( // @[ConcurrentDecoupledTestingSpec.scala 84:24]
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
  GcdEngine GcdEngine_3 ( // @[ConcurrentDecoupledTestingSpec.scala 84:24]
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
  assign io_input_0_ready = GcdEngine_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign io_input_1_ready = GcdEngine_1_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign io_input_2_ready = GcdEngine_2_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign io_input_3_ready = GcdEngine_3_io_decoupledInput_ready; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign io_output_0_valid = GcdEngine_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_0_bits_a = GcdEngine_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_0_bits_b = GcdEngine_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_0_bits_gcd = GcdEngine_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_1_valid = GcdEngine_1_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_1_bits_a = GcdEngine_1_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_1_bits_b = GcdEngine_1_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_1_bits_gcd = GcdEngine_1_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_2_valid = GcdEngine_2_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_2_bits_a = GcdEngine_2_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_2_bits_b = GcdEngine_2_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_2_bits_gcd = GcdEngine_2_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_3_valid = GcdEngine_3_io_validOutput_valid; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_3_bits_a = GcdEngine_3_io_validOutput_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_3_bits_b = GcdEngine_3_io_validOutput_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign io_output_3_bits_gcd = GcdEngine_3_io_validOutput_bits_gcd; // @[ConcurrentDecoupledTestingSpec.scala 86:27]
  assign GcdEngine_clock = clock;
  assign GcdEngine_reset = reset;
  assign GcdEngine_io_decoupledInput_valid = io_input_0_valid; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_io_decoupledInput_bits_a = io_input_0_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_io_decoupledInput_bits_b = io_input_0_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_1_clock = clock;
  assign GcdEngine_1_reset = reset;
  assign GcdEngine_1_io_decoupledInput_valid = io_input_1_valid; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_1_io_decoupledInput_bits_a = io_input_1_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_1_io_decoupledInput_bits_b = io_input_1_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_2_clock = clock;
  assign GcdEngine_2_reset = reset;
  assign GcdEngine_2_io_decoupledInput_valid = io_input_2_valid; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_2_io_decoupledInput_bits_a = io_input_2_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_2_io_decoupledInput_bits_b = io_input_2_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_3_clock = clock;
  assign GcdEngine_3_reset = reset;
  assign GcdEngine_3_io_decoupledInput_valid = io_input_3_valid; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_3_io_decoupledInput_bits_a = io_input_3_bits_a; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
  assign GcdEngine_3_io_decoupledInput_bits_b = io_input_3_bits_b; // @[ConcurrentDecoupledTestingSpec.scala 85:30]
endmodule
