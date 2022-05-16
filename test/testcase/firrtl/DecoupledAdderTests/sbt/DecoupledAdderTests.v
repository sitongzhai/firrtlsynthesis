module SlowDecoupledAdder(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_a,
  input  [15:0] io_in_bits_b,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[DecoupledAdder.scala 29:24]
  reg [15:0] a_reg; // @[DecoupledAdder.scala 30:24]
  reg [15:0] b_reg; // @[DecoupledAdder.scala 31:24]
  wire  _T_26 = ~busy; // @[DecoupledAdder.scala 34:18]
  wire  _GEN_2 = io_in_valid & _T_26 | busy; // @[DecoupledAdder.scala 40:30 DecoupledAdder.scala 43:18 DecoupledAdder.scala 29:24]
  wire [15:0] _T_37 = a_reg + b_reg; // @[DecoupledAdder.scala 48:30]
  assign io_in_ready = ~busy; // @[DecoupledAdder.scala 34:18]
  assign io_out_valid = io_out_bits_c == _T_37 & busy; // @[DecoupledAdder.scala 54:54]
  assign io_out_bits_c = a_reg + b_reg; // @[DecoupledAdder.scala 48:30]
  always @(posedge clock) begin
    if (reset) begin // @[DecoupledAdder.scala 29:24]
      busy <= 1'h0; // @[DecoupledAdder.scala 29:24]
    end else if (io_out_valid) begin // @[DecoupledAdder.scala 56:22]
      busy <= 1'h0; // @[DecoupledAdder.scala 57:19]
    end else begin
      busy <= _GEN_2;
    end
    if (reset) begin // @[DecoupledAdder.scala 30:24]
      a_reg <= 16'h0; // @[DecoupledAdder.scala 30:24]
    end else if (io_in_valid & _T_26) begin // @[DecoupledAdder.scala 40:30]
      a_reg <= io_in_bits_a; // @[DecoupledAdder.scala 41:18]
    end
    if (reset) begin // @[DecoupledAdder.scala 31:24]
      b_reg <= 16'h0; // @[DecoupledAdder.scala 31:24]
    end else if (io_in_valid & _T_26) begin // @[DecoupledAdder.scala 40:30]
      b_reg <= io_in_bits_b; // @[DecoupledAdder.scala 42:18]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"in: ready %d   valid %d   a %d b %d   -- out:  ready %d  valid %d  c %d",io_in_ready,
            io_in_valid,io_in_bits_a,io_in_bits_b,io_out_ready,io_out_valid,io_out_bits_c); // @[DecoupledAdder.scala 36:9]
        end
    `ifdef PRINTF_COND
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
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  a_reg = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  b_reg = _RAND_2[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DecoupledAdderTests(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  device_under_test_clock; // @[DecoupledAdder.scala 62:33]
  wire  device_under_test_reset; // @[DecoupledAdder.scala 62:33]
  wire  device_under_test_io_in_ready; // @[DecoupledAdder.scala 62:33]
  wire  device_under_test_io_in_valid; // @[DecoupledAdder.scala 62:33]
  wire [15:0] device_under_test_io_in_bits_a; // @[DecoupledAdder.scala 62:33]
  wire [15:0] device_under_test_io_in_bits_b; // @[DecoupledAdder.scala 62:33]
  wire  device_under_test_io_out_ready; // @[DecoupledAdder.scala 62:33]
  wire  device_under_test_io_out_valid; // @[DecoupledAdder.scala 62:33]
  wire [15:0] device_under_test_io_out_bits_c; // @[DecoupledAdder.scala 62:33]
  reg [6:0] _T_4; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_7; // @[OrderedDecoupledHWIOTester.scala 375:30]
  reg [6:0] _T_10; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_13; // @[OrderedDecoupledHWIOTester.scala 375:30]
  wire  _T_14 = _T_7 & _T_13; // @[OrderedDecoupledHWIOTester.scala 402:42]
  wire  _T_16 = ~reset; // @[OrderedDecoupledHWIOTester.scala 403:13]
  reg [13:0] _T_21; // @[OrderedDecoupledHWIOTester.scala 407:21]
  wire [13:0] _T_24 = _T_21 + 14'h1; // @[OrderedDecoupledHWIOTester.scala 408:14]
  wire  _T_26 = _T_21 > 14'h2710; // @[OrderedDecoupledHWIOTester.scala 409:13]
  reg [4:0] value; // @[Counter.scala 17:33]
  wire [2:0] _GEN_4 = 5'h4 == value ? 3'h1 : 3'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_5 = 5'h5 == value ? 3'h1 : _GEN_4; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_6 = 5'h6 == value ? 3'h1 : _GEN_5; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_7 = 5'h7 == value ? 3'h1 : _GEN_6; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_8 = 5'h8 == value ? 3'h2 : _GEN_7; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_9 = 5'h9 == value ? 3'h2 : _GEN_8; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_10 = 5'ha == value ? 3'h2 : _GEN_9; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_11 = 5'hb == value ? 3'h2 : _GEN_10; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_12 = 5'hc == value ? 3'h3 : _GEN_11; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_13 = 5'hd == value ? 3'h3 : _GEN_12; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_14 = 5'he == value ? 3'h3 : _GEN_13; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_15 = 5'hf == value ? 3'h3 : _GEN_14; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_16 = 5'h10 == value ? 3'h4 : _GEN_15; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_17 = 5'h11 == value ? 3'h4 : _GEN_16; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_18 = 5'h12 == value ? 3'h4 : _GEN_17; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_19 = 5'h13 == value ? 3'h4 : _GEN_18; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_20 = 5'h14 == value ? 3'h0 : _GEN_19; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_22 = 5'h1 == value ? 3'h2 : 3'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_23 = 5'h2 == value ? 3'h4 : _GEN_22; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_24 = 5'h3 == value ? 3'h6 : _GEN_23; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_25 = 5'h4 == value ? 3'h0 : _GEN_24; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_26 = 5'h5 == value ? 3'h2 : _GEN_25; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_27 = 5'h6 == value ? 3'h4 : _GEN_26; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_28 = 5'h7 == value ? 3'h6 : _GEN_27; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_29 = 5'h8 == value ? 3'h0 : _GEN_28; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_30 = 5'h9 == value ? 3'h2 : _GEN_29; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_31 = 5'ha == value ? 3'h4 : _GEN_30; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_32 = 5'hb == value ? 3'h6 : _GEN_31; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_33 = 5'hc == value ? 3'h0 : _GEN_32; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_34 = 5'hd == value ? 3'h2 : _GEN_33; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_35 = 5'he == value ? 3'h4 : _GEN_34; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_36 = 5'hf == value ? 3'h6 : _GEN_35; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_37 = 5'h10 == value ? 3'h0 : _GEN_36; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_38 = 5'h11 == value ? 3'h2 : _GEN_37; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_39 = 5'h12 == value ? 3'h4 : _GEN_38; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_40 = 5'h13 == value ? 3'h6 : _GEN_39; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [2:0] _GEN_41 = 5'h14 == value ? 3'h0 : _GEN_40; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _T_181 = value == 5'h13; // @[Counter.scala 25:24]
  wire [4:0] _T_184 = value + 5'h1; // @[Counter.scala 26:22]
  wire  _GEN_64 = _T_4 == 7'h13 | _T_7; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [6:0] _T_193 = _T_4 + 7'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  reg [4:0] value_1; // @[Counter.scala 17:33]
  wire  _T_292 = device_under_test_io_out_ready & device_under_test_io_out_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [3:0] _GEN_92 = 5'h1 == value_1 ? 4'h2 : 4'h0; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_93 = 5'h2 == value_1 ? 4'h4 : _GEN_92; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_94 = 5'h3 == value_1 ? 4'h6 : _GEN_93; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_95 = 5'h4 == value_1 ? 4'h1 : _GEN_94; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_96 = 5'h5 == value_1 ? 4'h3 : _GEN_95; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_97 = 5'h6 == value_1 ? 4'h5 : _GEN_96; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_98 = 5'h7 == value_1 ? 4'h7 : _GEN_97; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_99 = 5'h8 == value_1 ? 4'h2 : _GEN_98; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_100 = 5'h9 == value_1 ? 4'h4 : _GEN_99; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_101 = 5'ha == value_1 ? 4'h6 : _GEN_100; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_102 = 5'hb == value_1 ? 4'h8 : _GEN_101; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_103 = 5'hc == value_1 ? 4'h3 : _GEN_102; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_104 = 5'hd == value_1 ? 4'h5 : _GEN_103; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_105 = 5'he == value_1 ? 4'h7 : _GEN_104; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_106 = 5'hf == value_1 ? 4'h9 : _GEN_105; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_107 = 5'h10 == value_1 ? 4'h4 : _GEN_106; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_108 = 5'h11 == value_1 ? 4'h6 : _GEN_107; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_109 = 5'h12 == value_1 ? 4'h8 : _GEN_108; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_110 = 5'h13 == value_1 ? 4'ha : _GEN_109; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_111 = 5'h14 == value_1 ? 4'h0 : _GEN_110; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [15:0] _GEN_119 = {{12'd0}, _GEN_111}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_297 = device_under_test_io_out_bits_c != _GEN_119; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_308 = value_1 == 5'h13; // @[Counter.scala 25:24]
  wire [4:0] _T_311 = value_1 + 5'h1; // @[Counter.scala 26:22]
  wire  _GEN_113 = _T_10 == 7'h13 | _T_13; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [6:0] _T_320 = _T_10 + 7'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  wire  _GEN_122 = _T_292 & _T_297; // @[OrderedDecoupledHWIOTester.scala 322:19]
  SlowDecoupledAdder device_under_test ( // @[DecoupledAdder.scala 62:33]
    .clock(device_under_test_clock),
    .reset(device_under_test_reset),
    .io_in_ready(device_under_test_io_in_ready),
    .io_in_valid(device_under_test_io_in_valid),
    .io_in_bits_a(device_under_test_io_in_bits_a),
    .io_in_bits_b(device_under_test_io_in_bits_b),
    .io_out_ready(device_under_test_io_out_ready),
    .io_out_valid(device_under_test_io_out_valid),
    .io_out_bits_c(device_under_test_io_out_bits_c)
  );
  assign device_under_test_clock = clock;
  assign device_under_test_reset = reset;
  assign device_under_test_io_in_valid = 5'h14 == _T_4[4:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign device_under_test_io_in_bits_a = {{13'd0}, _GEN_20}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign device_under_test_io_in_bits_b = {{13'd0}, _GEN_41}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign device_under_test_io_out_ready = 5'h14 == _T_10[4:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  always @(posedge clock) begin
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_4 <= 7'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_4 <= _T_193; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_7 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_7 <= _GEN_64;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_10 <= 7'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_10 <= _T_320; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_13 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_13 <= _GEN_113;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 407:21]
      _T_21 <= 14'h0; // @[OrderedDecoupledHWIOTester.scala 407:21]
    end else begin
      _T_21 <= _T_24; // @[OrderedDecoupledHWIOTester.scala 408:8]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value <= 5'h0; // @[Counter.scala 17:33]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_181) begin // @[Counter.scala 28:21]
        value <= 5'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_184; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_1 <= 5'h0; // @[Counter.scala 17:33]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_308) begin // @[Counter.scala 28:21]
        value_1 <= 5'h0; // @[Counter.scala 28:29]
      end else begin
        value_1 <= _T_311; // @[Counter.scala 26:13]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_14 & ~reset) begin
          $fwrite(32'h80000002,"All input and output events completed\n"); // @[OrderedDecoupledHWIOTester.scala 403:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_14 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 404:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_26 & _T_16) begin
          $fwrite(32'h80000002,
            "Exceeded maximum allowed %d ticks in OrderedDecoupledHWIOTester, If you think code is correct use:\nDecoupleTester.max_tick_count = <some-higher-value>\nin the OrderedDecoupledHWIOTester subclass\n"
            ,14'h2710); // @[OrderedDecoupledHWIOTester.scala 410:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_26 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 416:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_292 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing out.bits.c = %d, should be %d\n",_T_10,
            device_under_test_io_out_bits_c,5'h14 == value_1 ? 4'h0 : _GEN_110); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_292 & _T_297 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d out.bits.c was %d should be %d\n",_T_10,device_under_test_io_out_bits_c,
            _GEN_111); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_122 & _T_16) begin
          $fwrite(32'h80000002,"Assertion failed\n    at OrderedDecoupledHWIOTester.scala:324 assert(false.B)\n"); // @[OrderedDecoupledHWIOTester.scala 324:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_16) begin
          $fatal; // @[OrderedDecoupledHWIOTester.scala 324:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 325:17]
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
  _T_4 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  _T_7 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_10 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  _T_13 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_21 = _RAND_4[13:0];
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
