module DecoupledGCD(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_a,
  input  [31:0] io_in_bits_b,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  busy;
  reg  done;
  reg [31:0] x;
  reg [31:0] y;
  wire  T_42 = y == 32'h0;
  wire  T_43 = busy & T_42;
  wire  T_45 = done & io_out_ready;
  wire  _GEN_1 = T_45 ? 1'h0 : busy; // @[]
  wire  start = io_in_valid & io_in_ready;
  wire  T_50 = x > y;
  wire [31:0] T_52 = x - y;
  wire  T_54 = ~T_50;
  wire [31:0] T_56 = y - x;
  assign io_in_ready = ~busy;
  assign io_out_valid = done;
  assign io_out_bits = x;
  always @(posedge clock) begin
    if (reset) begin
      busy <= 1'h0;
    end else begin
      busy <= start | _GEN_1;
    end
    if (reset) begin
      done <= 1'h0;
    end else if (start) begin
      done <= 1'h0;
    end else begin
      done <= T_43 | done;
    end
    if (start) begin
      x <= io_in_bits_a;
    end else if (T_50) begin
      x <= T_52;
    end
    if (start) begin
      y <= io_in_bits_b;
    end else if (T_54) begin
      y <= T_56;
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
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  done = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  x = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  y = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GCDTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  dut_clock;
  wire  dut_reset;
  wire  dut_io_in_ready;
  wire  dut_io_in_valid;
  wire [31:0] dut_io_in_bits_a;
  wire [31:0] dut_io_in_bits_b;
  wire  dut_io_out_ready;
  wire  dut_io_out_valid;
  wire [31:0] dut_io_out_bits;
  reg [3:0] count;
  reg  en;
  wire [6:0] _GEN_1 = 4'h1 == count ? 7'h5f : 7'h2e; // @[]
  wire [6:0] _GEN_2 = 4'h2 == count ? 7'h1a : _GEN_1; // @[]
  wire [6:0] _GEN_3 = 4'h3 == count ? 7'h3d : _GEN_2; // @[]
  wire [6:0] _GEN_4 = 4'h4 == count ? 7'h12 : _GEN_3; // @[]
  wire [6:0] _GEN_5 = 4'h5 == count ? 7'h33 : _GEN_4; // @[]
  wire [6:0] _GEN_6 = 4'h6 == count ? 7'h2d : _GEN_5; // @[]
  wire [6:0] _GEN_7 = 4'h7 == count ? 7'h42 : _GEN_6; // @[]
  wire [6:0] _GEN_8 = 4'h8 == count ? 7'h47 : _GEN_7; // @[]
  wire [6:0] _GEN_9 = 4'h9 == count ? 7'h47 : _GEN_8; // @[]
  wire [6:0] _GEN_11 = 4'h1 == count ? 7'h2c : 7'h27; // @[]
  wire [6:0] _GEN_12 = 4'h2 == count ? 7'h25 : _GEN_11; // @[]
  wire [6:0] _GEN_13 = 4'h3 == count ? 7'h60 : _GEN_12; // @[]
  wire [6:0] _GEN_14 = 4'h4 == count ? 7'h30 : _GEN_13; // @[]
  wire [6:0] _GEN_15 = 4'h5 == count ? 7'h27 : _GEN_14; // @[]
  wire [6:0] _GEN_16 = 4'h6 == count ? 7'h55 : _GEN_15; // @[]
  wire [6:0] _GEN_17 = 4'h7 == count ? 7'h54 : _GEN_16; // @[]
  wire [6:0] _GEN_18 = 4'h8 == count ? 7'h8 : _GEN_17; // @[]
  wire [6:0] _GEN_19 = 4'h9 == count ? 7'h50 : _GEN_18; // @[]
  wire  T_80 = en & dut_io_in_ready;
  wire  _GEN_20 = T_80 ? 1'h0 : en; // @[]
  wire  T_83 = ~en;
  wire  T_84 = dut_io_out_valid & T_83;
  wire [2:0] _GEN_25 = 4'h4 == count ? 3'h6 : 3'h1; // @[]
  wire [2:0] _GEN_26 = 4'h5 == count ? 3'h3 : _GEN_25; // @[]
  wire [2:0] _GEN_27 = 4'h6 == count ? 3'h5 : _GEN_26; // @[]
  wire [2:0] _GEN_28 = 4'h7 == count ? 3'h6 : _GEN_27; // @[]
  wire [2:0] _GEN_29 = 4'h8 == count ? 3'h1 : _GEN_28; // @[]
  wire [2:0] _GEN_30 = 4'h9 == count ? 3'h1 : _GEN_29; // @[]
  wire [31:0] _GEN_36 = {{29'd0}, _GEN_30};
  wire  T_87 = dut_io_out_bits == _GEN_36;
  wire  T_89 = ~reset;
  wire  T_91 = ~T_87;
  wire  T_95 = count == 4'h0;
  wire  T_99 = ~T_95;
  wire [3:0] T_103 = count - 4'h1;
  wire  _GEN_34 = T_84 ? T_99 | _GEN_20 : _GEN_20; // @[]
  DecoupledGCD dut (
    .clock(dut_clock),
    .reset(dut_reset),
    .io_in_ready(dut_io_in_ready),
    .io_in_valid(dut_io_in_valid),
    .io_in_bits_a(dut_io_in_bits_a),
    .io_in_bits_b(dut_io_in_bits_b),
    .io_out_ready(dut_io_out_ready),
    .io_out_valid(dut_io_out_valid),
    .io_out_bits(dut_io_out_bits)
  );
  assign dut_clock = clock;
  assign dut_reset = reset;
  assign dut_io_in_valid = en;
  assign dut_io_in_bits_a = {{25'd0}, _GEN_9}; // @[]
  assign dut_io_in_bits_b = {{25'd0}, _GEN_19}; // @[]
  assign dut_io_out_ready = dut_io_out_valid & T_83; // @[]
  always @(posedge clock) begin
    if (reset) begin
      count <= 4'h9;
    end else if (T_84) begin
      if (T_99) begin
        count <= T_103;
      end
    end
    en <= reset | _GEN_34;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_84 & T_89 & T_91 & T_89) begin
          $fwrite(32'h80000002,"Assertion failed\n    at GCDTester.scala:38 assert( dut.io.out.bits === z(count) )\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_84 & T_89 & T_91) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_84 & T_95 & T_89) begin
          $finish;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  count = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  en = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
