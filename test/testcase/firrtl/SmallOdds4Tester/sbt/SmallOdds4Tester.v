module SmallOdds4Filter(
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire  _T_16 = io_in_bits < 32'ha; // @[SmallOdds4.scala 28:38]
  assign io_in_ready = io_out_ready; // @[SmallOdds4.scala 19:17]
  assign io_out_valid = io_out_ready & io_in_valid & _T_16; // @[SmallOdds4.scala 22:49]
  assign io_out_bits = io_in_bits; // @[SmallOdds4.scala 20:17]
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:0]; // @[Decoupled.scala 200:24]
  wire  ram__T_43_en; // @[Decoupled.scala 200:24]
  wire  ram__T_43_addr; // @[Decoupled.scala 200:24]
  wire [31:0] ram__T_43_data; // @[Decoupled.scala 200:24]
  wire [31:0] ram__T_34_data; // @[Decoupled.scala 200:24]
  wire  ram__T_34_addr; // @[Decoupled.scala 200:24]
  wire  ram__T_34_mask; // @[Decoupled.scala 200:24]
  wire  ram__T_34_en; // @[Decoupled.scala 200:24]
  reg  maybe_full; // @[Decoupled.scala 203:35]
  wire  _T_26 = ~maybe_full; // @[Decoupled.scala 206:36]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 29:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 29:37]
  assign ram__T_43_en = 1'h1;
  assign ram__T_43_addr = 1'h0;
  assign ram__T_43_data = ram[ram__T_43_addr]; // @[Decoupled.scala 200:24]
  assign ram__T_34_data = io_enq_bits;
  assign ram__T_34_addr = 1'h0;
  assign ram__T_34_mask = 1'h1;
  assign ram__T_34_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 223:19]
  assign io_deq_valid = ~_T_26; // @[Decoupled.scala 222:19]
  assign io_deq_bits = ram__T_43_data; // @[Decoupled.scala 224:15]
  always @(posedge clock) begin
    if (ram__T_34_en & ram__T_34_mask) begin
      ram[ram__T_34_addr] <= ram__T_34_data; // @[Decoupled.scala 200:24]
    end
    if (reset) begin // @[Decoupled.scala 203:35]
      maybe_full <= 1'h0; // @[Decoupled.scala 203:35]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 218:27]
      maybe_full <= do_enq; // @[Decoupled.scala 219:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SmallOdds4Filter_1(
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire [31:0] _T_16 = io_in_bits & 32'h1; // @[SmallOdds4.scala 30:52]
  wire  _T_18 = _T_16 == 32'h1; // @[SmallOdds4.scala 30:59]
  assign io_in_ready = io_out_ready; // @[SmallOdds4.scala 19:17]
  assign io_out_valid = io_out_ready & io_in_valid & _T_18; // @[SmallOdds4.scala 22:49]
  assign io_out_bits = io_in_bits; // @[SmallOdds4.scala 20:17]
endmodule
module SmallOdds4(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire  SmallOdds4Filter_io_in_ready; // @[SmallOdds4.scala 28:24]
  wire  SmallOdds4Filter_io_in_valid; // @[SmallOdds4.scala 28:24]
  wire [31:0] SmallOdds4Filter_io_in_bits; // @[SmallOdds4.scala 28:24]
  wire  SmallOdds4Filter_io_out_ready; // @[SmallOdds4.scala 28:24]
  wire  SmallOdds4Filter_io_out_valid; // @[SmallOdds4.scala 28:24]
  wire [31:0] SmallOdds4Filter_io_out_bits; // @[SmallOdds4.scala 28:24]
  wire  Queue_clock; // @[SmallOdds4.scala 29:24]
  wire  Queue_reset; // @[SmallOdds4.scala 29:24]
  wire  Queue_io_enq_ready; // @[SmallOdds4.scala 29:24]
  wire  Queue_io_enq_valid; // @[SmallOdds4.scala 29:24]
  wire [31:0] Queue_io_enq_bits; // @[SmallOdds4.scala 29:24]
  wire  Queue_io_deq_ready; // @[SmallOdds4.scala 29:24]
  wire  Queue_io_deq_valid; // @[SmallOdds4.scala 29:24]
  wire [31:0] Queue_io_deq_bits; // @[SmallOdds4.scala 29:24]
  wire  SmallOdds4Filter_1_io_in_ready; // @[SmallOdds4.scala 30:24]
  wire  SmallOdds4Filter_1_io_in_valid; // @[SmallOdds4.scala 30:24]
  wire [31:0] SmallOdds4Filter_1_io_in_bits; // @[SmallOdds4.scala 30:24]
  wire  SmallOdds4Filter_1_io_out_ready; // @[SmallOdds4.scala 30:24]
  wire  SmallOdds4Filter_1_io_out_valid; // @[SmallOdds4.scala 30:24]
  wire [31:0] SmallOdds4Filter_1_io_out_bits; // @[SmallOdds4.scala 30:24]
  SmallOdds4Filter SmallOdds4Filter ( // @[SmallOdds4.scala 28:24]
    .io_in_ready(SmallOdds4Filter_io_in_ready),
    .io_in_valid(SmallOdds4Filter_io_in_valid),
    .io_in_bits(SmallOdds4Filter_io_in_bits),
    .io_out_ready(SmallOdds4Filter_io_out_ready),
    .io_out_valid(SmallOdds4Filter_io_out_valid),
    .io_out_bits(SmallOdds4Filter_io_out_bits)
  );
  Queue Queue ( // @[SmallOdds4.scala 29:24]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits(Queue_io_enq_bits),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits(Queue_io_deq_bits)
  );
  SmallOdds4Filter_1 SmallOdds4Filter_1 ( // @[SmallOdds4.scala 30:24]
    .io_in_ready(SmallOdds4Filter_1_io_in_ready),
    .io_in_valid(SmallOdds4Filter_1_io_in_valid),
    .io_in_bits(SmallOdds4Filter_1_io_in_bits),
    .io_out_ready(SmallOdds4Filter_1_io_out_ready),
    .io_out_valid(SmallOdds4Filter_1_io_out_valid),
    .io_out_bits(SmallOdds4Filter_1_io_out_bits)
  );
  assign io_in_ready = SmallOdds4Filter_io_in_ready; // @[SmallOdds4.scala 33:18]
  assign io_out_valid = SmallOdds4Filter_1_io_out_valid; // @[SmallOdds4.scala 36:18]
  assign io_out_bits = SmallOdds4Filter_1_io_out_bits; // @[SmallOdds4.scala 36:18]
  assign SmallOdds4Filter_io_in_valid = io_in_valid; // @[SmallOdds4.scala 33:18]
  assign SmallOdds4Filter_io_in_bits = io_in_bits; // @[SmallOdds4.scala 33:18]
  assign SmallOdds4Filter_io_out_ready = Queue_io_enq_ready; // @[SmallOdds4.scala 34:18]
  assign Queue_clock = clock;
  assign Queue_reset = reset;
  assign Queue_io_enq_valid = SmallOdds4Filter_io_out_valid; // @[SmallOdds4.scala 34:18]
  assign Queue_io_enq_bits = SmallOdds4Filter_io_out_bits; // @[SmallOdds4.scala 34:18]
  assign Queue_io_deq_ready = SmallOdds4Filter_1_io_in_ready; // @[SmallOdds4.scala 35:18]
  assign SmallOdds4Filter_1_io_in_valid = Queue_io_deq_valid; // @[SmallOdds4.scala 35:18]
  assign SmallOdds4Filter_1_io_in_bits = Queue_io_deq_bits; // @[SmallOdds4.scala 35:18]
  assign SmallOdds4Filter_1_io_out_ready = io_out_ready; // @[SmallOdds4.scala 36:18]
endmodule
module SmallOdds4Tester(
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
  wire  device_under_test_clock; // @[SmallOdds4.scala 43:33]
  wire  device_under_test_reset; // @[SmallOdds4.scala 43:33]
  wire  device_under_test_io_in_ready; // @[SmallOdds4.scala 43:33]
  wire  device_under_test_io_in_valid; // @[SmallOdds4.scala 43:33]
  wire [31:0] device_under_test_io_in_bits; // @[SmallOdds4.scala 43:33]
  wire  device_under_test_io_out_ready; // @[SmallOdds4.scala 43:33]
  wire  device_under_test_io_out_valid; // @[SmallOdds4.scala 43:33]
  wire [31:0] device_under_test_io_out_bits; // @[SmallOdds4.scala 43:33]
  reg [6:0] _T_4; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_7; // @[OrderedDecoupledHWIOTester.scala 375:30]
  reg [4:0] _T_10; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_13; // @[OrderedDecoupledHWIOTester.scala 375:30]
  wire  _T_14 = _T_7 & _T_13; // @[OrderedDecoupledHWIOTester.scala 402:42]
  wire  _T_16 = ~reset; // @[OrderedDecoupledHWIOTester.scala 403:13]
  reg [11:0] _T_21; // @[OrderedDecoupledHWIOTester.scala 407:21]
  wire [11:0] _T_24 = _T_21 + 12'h1; // @[OrderedDecoupledHWIOTester.scala 408:14]
  wire  _T_26 = _T_21 > 12'hfa0; // @[OrderedDecoupledHWIOTester.scala 409:13]
  reg [4:0] value; // @[Counter.scala 17:33]
  wire [4:0] _GEN_1 = 5'h1 == value ? 5'h8 : 5'h3; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_2 = 5'h2 == value ? 5'h4 : _GEN_1; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_3 = 5'h3 == value ? 5'h7 : _GEN_2; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_4 = 5'h4 == value ? 5'hc : _GEN_3; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_5 = 5'h5 == value ? 5'h0 : _GEN_4; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_6 = 5'h6 == value ? 5'h3 : _GEN_5; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_7 = 5'h7 == value ? 5'h2 : _GEN_6; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_8 = 5'h8 == value ? 5'hc : _GEN_7; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_9 = 5'h9 == value ? 5'h3 : _GEN_8; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_10 = 5'ha == value ? 5'h5 : _GEN_9; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_11 = 5'hb == value ? 5'h5 : _GEN_10; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_12 = 5'hc == value ? 5'h11 : _GEN_11; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_13 = 5'hd == value ? 5'h7 : _GEN_12; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_14 = 5'he == value ? 5'h2 : _GEN_13; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_15 = 5'hf == value ? 5'h2 : _GEN_14; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_16 = 5'h10 == value ? 5'h5 : _GEN_15; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_17 = 5'h11 == value ? 5'hd : _GEN_16; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_18 = 5'h12 == value ? 5'h12 : _GEN_17; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_19 = 5'h13 == value ? 5'hf : _GEN_18; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_20 = 5'h14 == value ? 5'h0 : _GEN_19; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_21 = 5'h15 == value ? 5'hf : _GEN_20; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_22 = 5'h16 == value ? 5'hf : _GEN_21; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_23 = 5'h17 == value ? 5'ha : _GEN_22; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_24 = 5'h18 == value ? 5'h12 : _GEN_23; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_25 = 5'h19 == value ? 5'hb : _GEN_24; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_26 = 5'h1a == value ? 5'he : _GEN_25; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_27 = 5'h1b == value ? 5'h10 : _GEN_26; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_28 = 5'h1c == value ? 5'hc : _GEN_27; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_29 = 5'h1d == value ? 5'h2 : _GEN_28; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_30 = 5'h1e == value ? 5'h13 : _GEN_29; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_31 = 5'h1f == value ? 5'h0 : _GEN_30; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _T_177 = value == 5'h1e; // @[Counter.scala 25:24]
  wire [4:0] _T_180 = value + 5'h1; // @[Counter.scala 26:22]
  wire  _GEN_65 = _T_4 == 7'h1e | _T_7; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [6:0] _T_189 = _T_4 + 7'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  reg [2:0] value_1; // @[Counter.scala 17:33]
  wire  _GEN_79 = 5'h8 == _T_10 ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_80 = 5'h9 == _T_10 ? 1'h0 : _GEN_79; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_81 = 5'ha == _T_10 ? 1'h0 : _GEN_80; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_82 = 5'hb == _T_10 ? 1'h0 : _GEN_81; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_83 = 5'hc == _T_10 ? 1'h0 : _GEN_82; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_84 = 5'hd == _T_10 ? 1'h0 : _GEN_83; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_85 = 5'he == _T_10 ? 1'h0 : _GEN_84; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_86 = 5'hf == _T_10 ? 1'h0 : _GEN_85; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_87 = 5'h10 == _T_10 ? 1'h0 : _GEN_86; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_88 = 5'h11 == _T_10 ? 1'h0 : _GEN_87; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_89 = 5'h12 == _T_10 ? 1'h0 : _GEN_88; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_90 = 5'h13 == _T_10 ? 1'h0 : _GEN_89; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_91 = 5'h14 == _T_10 ? 1'h0 : _GEN_90; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_92 = 5'h15 == _T_10 ? 1'h0 : _GEN_91; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_93 = 5'h16 == _T_10 ? 1'h0 : _GEN_92; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_94 = 5'h17 == _T_10 ? 1'h0 : _GEN_93; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_95 = 5'h18 == _T_10 ? 1'h0 : _GEN_94; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_96 = 5'h19 == _T_10 ? 1'h0 : _GEN_95; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_97 = 5'h1a == _T_10 ? 1'h0 : _GEN_96; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_98 = 5'h1b == _T_10 ? 1'h0 : _GEN_97; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_99 = 5'h1c == _T_10 ? 1'h0 : _GEN_98; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_100 = 5'h1d == _T_10 ? 1'h0 : _GEN_99; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_101 = 5'h1e == _T_10 ? 1'h0 : _GEN_100; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_285 = device_under_test_io_out_ready & device_under_test_io_out_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [2:0] _GEN_104 = 3'h1 == value_1 ? 3'h7 : 3'h3; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_105 = 3'h2 == value_1 ? 3'h3 : _GEN_104; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_106 = 3'h3 == value_1 ? 3'h3 : _GEN_105; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_107 = 3'h4 == value_1 ? 3'h5 : _GEN_106; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_108 = 3'h5 == value_1 ? 3'h5 : _GEN_107; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_109 = 3'h6 == value_1 ? 3'h7 : _GEN_108; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_110 = 3'h7 == value_1 ? 3'h5 : _GEN_109; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_118 = {{1'd0}, value_1}; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [2:0] _GEN_111 = 4'h8 == _GEN_118 ? 3'h0 : _GEN_110; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [31:0] _GEN_119 = {{29'd0}, _GEN_111}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_290 = device_under_test_io_out_bits != _GEN_119; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire [2:0] _T_304 = value_1 + 3'h1; // @[Counter.scala 26:22]
  wire  _GEN_112 = _T_10 == 5'h7 | _T_13; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [4:0] _T_312 = _T_10 + 5'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  wire  _GEN_121 = _T_285 & _T_290; // @[OrderedDecoupledHWIOTester.scala 322:19]
  SmallOdds4 device_under_test ( // @[SmallOdds4.scala 43:33]
    .clock(device_under_test_clock),
    .reset(device_under_test_reset),
    .io_in_ready(device_under_test_io_in_ready),
    .io_in_valid(device_under_test_io_in_valid),
    .io_in_bits(device_under_test_io_in_bits),
    .io_out_ready(device_under_test_io_out_ready),
    .io_out_valid(device_under_test_io_out_valid),
    .io_out_bits(device_under_test_io_out_bits)
  );
  assign device_under_test_clock = clock;
  assign device_under_test_reset = reset;
  assign device_under_test_io_in_valid = 5'h1f == _T_4[4:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign device_under_test_io_in_bits = {{27'd0}, _GEN_31}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign device_under_test_io_out_ready = 5'h1f == _T_10 ? 1'h0 : _GEN_101; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  always @(posedge clock) begin
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_4 <= 7'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_4 <= _T_189; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_7 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_7 <= _GEN_65;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_10 <= 5'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_10 <= _T_312; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_13 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_13 <= _GEN_112;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 407:21]
      _T_21 <= 12'h0; // @[OrderedDecoupledHWIOTester.scala 407:21]
    end else begin
      _T_21 <= _T_24; // @[OrderedDecoupledHWIOTester.scala 408:8]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value <= 5'h0; // @[Counter.scala 17:33]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_177) begin // @[Counter.scala 28:21]
        value <= 5'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_180; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_1 <= 3'h0; // @[Counter.scala 17:33]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      value_1 <= _T_304; // @[Counter.scala 26:13]
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
            ,12'hfa0); // @[OrderedDecoupledHWIOTester.scala 410:13]
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
        if (_T_285 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing out.bits = %d, should be %d\n",_T_10,
            device_under_test_io_out_bits,4'h8 == _GEN_118 ? 3'h0 : _GEN_110); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_285 & _T_290 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d out.bits was %d should be %d\n",_T_10,device_under_test_io_out_bits,
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
        if (_GEN_121 & _T_16) begin
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
        if (_GEN_121 & _T_16) begin
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
        if (_GEN_121 & _T_16) begin
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
  _T_10 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  _T_13 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_21 = _RAND_4[11:0];
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
