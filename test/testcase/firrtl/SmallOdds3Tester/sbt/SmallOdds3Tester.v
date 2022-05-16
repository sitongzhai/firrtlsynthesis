module SmallOdds3Filter(
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire  _T_16 = io_in_bits < 32'ha; // @[SmallOdds3.scala 28:38]
  assign io_in_ready = io_out_ready; // @[SmallOdds3.scala 19:18]
  assign io_out_valid = io_out_ready & io_in_valid & _T_16; // @[SmallOdds3.scala 22:49]
  assign io_out_bits = io_in_bits; // @[SmallOdds3.scala 20:18]
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
module SmallOdds3Filter_1(
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire [31:0] _T_16 = io_in_bits & 32'h1; // @[SmallOdds3.scala 30:52]
  wire  _T_18 = _T_16 == 32'h1; // @[SmallOdds3.scala 30:59]
  assign io_in_ready = io_out_ready; // @[SmallOdds3.scala 19:18]
  assign io_out_valid = io_out_ready & io_in_valid & _T_18; // @[SmallOdds3.scala 22:49]
  assign io_out_bits = io_in_bits; // @[SmallOdds3.scala 20:18]
endmodule
module SmallOdds3(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire  SmallOdds3Filter_io_in_ready; // @[SmallOdds3.scala 28:24]
  wire  SmallOdds3Filter_io_in_valid; // @[SmallOdds3.scala 28:24]
  wire [31:0] SmallOdds3Filter_io_in_bits; // @[SmallOdds3.scala 28:24]
  wire  SmallOdds3Filter_io_out_ready; // @[SmallOdds3.scala 28:24]
  wire  SmallOdds3Filter_io_out_valid; // @[SmallOdds3.scala 28:24]
  wire [31:0] SmallOdds3Filter_io_out_bits; // @[SmallOdds3.scala 28:24]
  wire  Queue_clock; // @[SmallOdds3.scala 29:24]
  wire  Queue_reset; // @[SmallOdds3.scala 29:24]
  wire  Queue_io_enq_ready; // @[SmallOdds3.scala 29:24]
  wire  Queue_io_enq_valid; // @[SmallOdds3.scala 29:24]
  wire [31:0] Queue_io_enq_bits; // @[SmallOdds3.scala 29:24]
  wire  Queue_io_deq_ready; // @[SmallOdds3.scala 29:24]
  wire  Queue_io_deq_valid; // @[SmallOdds3.scala 29:24]
  wire [31:0] Queue_io_deq_bits; // @[SmallOdds3.scala 29:24]
  wire  SmallOdds3Filter_1_io_in_ready; // @[SmallOdds3.scala 30:24]
  wire  SmallOdds3Filter_1_io_in_valid; // @[SmallOdds3.scala 30:24]
  wire [31:0] SmallOdds3Filter_1_io_in_bits; // @[SmallOdds3.scala 30:24]
  wire  SmallOdds3Filter_1_io_out_ready; // @[SmallOdds3.scala 30:24]
  wire  SmallOdds3Filter_1_io_out_valid; // @[SmallOdds3.scala 30:24]
  wire [31:0] SmallOdds3Filter_1_io_out_bits; // @[SmallOdds3.scala 30:24]
  SmallOdds3Filter SmallOdds3Filter ( // @[SmallOdds3.scala 28:24]
    .io_in_ready(SmallOdds3Filter_io_in_ready),
    .io_in_valid(SmallOdds3Filter_io_in_valid),
    .io_in_bits(SmallOdds3Filter_io_in_bits),
    .io_out_ready(SmallOdds3Filter_io_out_ready),
    .io_out_valid(SmallOdds3Filter_io_out_valid),
    .io_out_bits(SmallOdds3Filter_io_out_bits)
  );
  Queue Queue ( // @[SmallOdds3.scala 29:24]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits(Queue_io_enq_bits),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits(Queue_io_deq_bits)
  );
  SmallOdds3Filter_1 SmallOdds3Filter_1 ( // @[SmallOdds3.scala 30:24]
    .io_in_ready(SmallOdds3Filter_1_io_in_ready),
    .io_in_valid(SmallOdds3Filter_1_io_in_valid),
    .io_in_bits(SmallOdds3Filter_1_io_in_bits),
    .io_out_ready(SmallOdds3Filter_1_io_out_ready),
    .io_out_valid(SmallOdds3Filter_1_io_out_valid),
    .io_out_bits(SmallOdds3Filter_1_io_out_bits)
  );
  assign io_in_ready = SmallOdds3Filter_io_in_ready; // @[SmallOdds3.scala 32:25]
  assign io_out_valid = SmallOdds3Filter_1_io_out_valid; // @[SmallOdds3.scala 47:25]
  assign io_out_bits = SmallOdds3Filter_1_io_out_bits; // @[SmallOdds3.scala 46:25]
  assign SmallOdds3Filter_io_in_valid = io_in_valid; // @[SmallOdds3.scala 34:25]
  assign SmallOdds3Filter_io_in_bits = io_in_bits; // @[SmallOdds3.scala 35:25]
  assign SmallOdds3Filter_io_out_ready = Queue_io_enq_ready; // @[SmallOdds3.scala 36:25]
  assign Queue_clock = clock;
  assign Queue_reset = reset;
  assign Queue_io_enq_valid = SmallOdds3Filter_io_out_valid; // @[SmallOdds3.scala 38:25]
  assign Queue_io_enq_bits = SmallOdds3Filter_io_out_bits; // @[SmallOdds3.scala 39:25]
  assign Queue_io_deq_ready = SmallOdds3Filter_1_io_in_ready; // @[SmallOdds3.scala 40:25]
  assign SmallOdds3Filter_1_io_in_valid = Queue_io_deq_valid; // @[SmallOdds3.scala 42:25]
  assign SmallOdds3Filter_1_io_in_bits = Queue_io_deq_bits; // @[SmallOdds3.scala 43:25]
  assign SmallOdds3Filter_1_io_out_ready = io_out_ready; // @[SmallOdds3.scala 44:25]
endmodule
module SmallOdds3Tester(
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
  wire  device_under_test_clock; // @[SmallOdds3.scala 54:33]
  wire  device_under_test_reset; // @[SmallOdds3.scala 54:33]
  wire  device_under_test_io_in_ready; // @[SmallOdds3.scala 54:33]
  wire  device_under_test_io_in_valid; // @[SmallOdds3.scala 54:33]
  wire [31:0] device_under_test_io_in_bits; // @[SmallOdds3.scala 54:33]
  wire  device_under_test_io_out_ready; // @[SmallOdds3.scala 54:33]
  wire  device_under_test_io_out_valid; // @[SmallOdds3.scala 54:33]
  wire [31:0] device_under_test_io_out_bits; // @[SmallOdds3.scala 54:33]
  reg [8:0] _T_4; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_7; // @[OrderedDecoupledHWIOTester.scala 375:30]
  reg [6:0] _T_10; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_13; // @[OrderedDecoupledHWIOTester.scala 375:30]
  wire  _T_14 = _T_7 & _T_13; // @[OrderedDecoupledHWIOTester.scala 402:42]
  wire  _T_16 = ~reset; // @[OrderedDecoupledHWIOTester.scala 403:13]
  reg [13:0] _T_21; // @[OrderedDecoupledHWIOTester.scala 407:21]
  wire [13:0] _T_24 = _T_21 + 14'h1; // @[OrderedDecoupledHWIOTester.scala 408:14]
  wire  _T_26 = _T_21 > 14'h2710; // @[OrderedDecoupledHWIOTester.scala 409:13]
  reg [6:0] value; // @[Counter.scala 17:33]
  wire [4:0] _GEN_1 = 7'h1 == value ? 5'h8 : 5'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_2 = 7'h2 == value ? 5'h9 : _GEN_1; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_3 = 7'h3 == value ? 5'h7 : _GEN_2; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_4 = 7'h4 == value ? 5'hf : _GEN_3; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_5 = 7'h5 == value ? 5'hd : _GEN_4; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_6 = 7'h6 == value ? 5'hb : _GEN_5; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_7 = 7'h7 == value ? 5'h1 : _GEN_6; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_8 = 7'h8 == value ? 5'h13 : _GEN_7; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_9 = 7'h9 == value ? 5'he : _GEN_8; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_10 = 7'ha == value ? 5'h11 : _GEN_9; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_11 = 7'hb == value ? 5'h11 : _GEN_10; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_12 = 7'hc == value ? 5'hd : _GEN_11; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_13 = 7'hd == value ? 5'h2 : _GEN_12; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_14 = 7'he == value ? 5'hf : _GEN_13; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_15 = 7'hf == value ? 5'h4 : _GEN_14; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_16 = 7'h10 == value ? 5'h4 : _GEN_15; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_17 = 7'h11 == value ? 5'hf : _GEN_16; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_18 = 7'h12 == value ? 5'h1 : _GEN_17; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_19 = 7'h13 == value ? 5'h0 : _GEN_18; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_20 = 7'h14 == value ? 5'h3 : _GEN_19; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_21 = 7'h15 == value ? 5'h8 : _GEN_20; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_22 = 7'h16 == value ? 5'h4 : _GEN_21; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_23 = 7'h17 == value ? 5'h7 : _GEN_22; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_24 = 7'h18 == value ? 5'hc : _GEN_23; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_25 = 7'h19 == value ? 5'h0 : _GEN_24; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_26 = 7'h1a == value ? 5'h3 : _GEN_25; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_27 = 7'h1b == value ? 5'h2 : _GEN_26; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_28 = 7'h1c == value ? 5'hc : _GEN_27; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_29 = 7'h1d == value ? 5'h3 : _GEN_28; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_30 = 7'h1e == value ? 5'h5 : _GEN_29; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_31 = 7'h1f == value ? 5'h5 : _GEN_30; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_32 = 7'h20 == value ? 5'h11 : _GEN_31; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_33 = 7'h21 == value ? 5'h7 : _GEN_32; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_34 = 7'h22 == value ? 5'h2 : _GEN_33; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_35 = 7'h23 == value ? 5'h2 : _GEN_34; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_36 = 7'h24 == value ? 5'h5 : _GEN_35; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_37 = 7'h25 == value ? 5'hd : _GEN_36; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_38 = 7'h26 == value ? 5'h12 : _GEN_37; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_39 = 7'h27 == value ? 5'hf : _GEN_38; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_40 = 7'h28 == value ? 5'h0 : _GEN_39; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_41 = 7'h29 == value ? 5'hf : _GEN_40; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_42 = 7'h2a == value ? 5'hf : _GEN_41; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_43 = 7'h2b == value ? 5'ha : _GEN_42; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_44 = 7'h2c == value ? 5'h12 : _GEN_43; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_45 = 7'h2d == value ? 5'hb : _GEN_44; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_46 = 7'h2e == value ? 5'he : _GEN_45; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_47 = 7'h2f == value ? 5'h10 : _GEN_46; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_48 = 7'h30 == value ? 5'hc : _GEN_47; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_49 = 7'h31 == value ? 5'h2 : _GEN_48; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_50 = 7'h32 == value ? 5'h13 : _GEN_49; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_51 = 7'h33 == value ? 5'h11 : _GEN_50; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_52 = 7'h34 == value ? 5'h10 : _GEN_51; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_53 = 7'h35 == value ? 5'h6 : _GEN_52; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_54 = 7'h36 == value ? 5'h7 : _GEN_53; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_55 = 7'h37 == value ? 5'h10 : _GEN_54; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_56 = 7'h38 == value ? 5'h8 : _GEN_55; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_57 = 7'h39 == value ? 5'h11 : _GEN_56; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_58 = 7'h3a == value ? 5'h3 : _GEN_57; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_59 = 7'h3b == value ? 5'h7 : _GEN_58; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_60 = 7'h3c == value ? 5'h7 : _GEN_59; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_61 = 7'h3d == value ? 5'h8 : _GEN_60; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_62 = 7'h3e == value ? 5'h5 : _GEN_61; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_63 = 7'h3f == value ? 5'h12 : _GEN_62; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_64 = 7'h40 == value ? 5'h8 : _GEN_63; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_65 = 7'h41 == value ? 5'h11 : _GEN_64; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_66 = 7'h42 == value ? 5'hb : _GEN_65; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_67 = 7'h43 == value ? 5'h12 : _GEN_66; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_68 = 7'h44 == value ? 5'h12 : _GEN_67; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_69 = 7'h45 == value ? 5'h12 : _GEN_68; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_70 = 7'h46 == value ? 5'h12 : _GEN_69; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_71 = 7'h47 == value ? 5'hc : _GEN_70; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_72 = 7'h48 == value ? 5'h11 : _GEN_71; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_73 = 7'h49 == value ? 5'hb : _GEN_72; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_74 = 7'h4a == value ? 5'h6 : _GEN_73; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_75 = 7'h4b == value ? 5'h0 : _GEN_74; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_76 = 7'h4c == value ? 5'h11 : _GEN_75; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_77 = 7'h4d == value ? 5'h2 : _GEN_76; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_78 = 7'h4e == value ? 5'hf : _GEN_77; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_79 = 7'h4f == value ? 5'h0 : _GEN_78; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_80 = 7'h50 == value ? 5'h7 : _GEN_79; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_81 = 7'h51 == value ? 5'hd : _GEN_80; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_82 = 7'h52 == value ? 5'h11 : _GEN_81; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_83 = 7'h53 == value ? 5'h9 : _GEN_82; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_84 = 7'h54 == value ? 5'h5 : _GEN_83; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_85 = 7'h55 == value ? 5'hc : _GEN_84; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_86 = 7'h56 == value ? 5'h9 : _GEN_85; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_87 = 7'h57 == value ? 5'h3 : _GEN_86; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_88 = 7'h58 == value ? 5'h1 : _GEN_87; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_89 = 7'h59 == value ? 5'h1 : _GEN_88; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_90 = 7'h5a == value ? 5'h3 : _GEN_89; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_91 = 7'h5b == value ? 5'h0 : _GEN_90; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_92 = 7'h5c == value ? 5'h8 : _GEN_91; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_93 = 7'h5d == value ? 5'he : _GEN_92; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_94 = 7'h5e == value ? 5'h10 : _GEN_93; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_95 = 7'h5f == value ? 5'h3 : _GEN_94; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_96 = 7'h60 == value ? 5'h11 : _GEN_95; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_97 = 7'h61 == value ? 5'h2 : _GEN_96; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_98 = 7'h62 == value ? 5'h5 : _GEN_97; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_99 = 7'h63 == value ? 5'hb : _GEN_98; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_100 = 7'h64 == value ? 5'h10 : _GEN_99; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [4:0] _GEN_101 = 7'h65 == value ? 5'h0 : _GEN_100; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _T_457 = value == 7'h64; // @[Counter.scala 25:24]
  wire [6:0] _T_460 = value + 7'h1; // @[Counter.scala 26:22]
  wire  _GEN_205 = _T_4 == 9'h64 | _T_7; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [8:0] _T_469 = _T_4 + 9'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  reg [4:0] value_1; // @[Counter.scala 17:33]
  wire  _GEN_238 = 7'h1b == _T_10 ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_239 = 7'h1c == _T_10 ? 1'h0 : _GEN_238; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_240 = 7'h1d == _T_10 ? 1'h0 : _GEN_239; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_241 = 7'h1e == _T_10 ? 1'h0 : _GEN_240; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_242 = 7'h1f == _T_10 ? 1'h0 : _GEN_241; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_243 = 7'h20 == _T_10 ? 1'h0 : _GEN_242; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_244 = 7'h21 == _T_10 ? 1'h0 : _GEN_243; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_245 = 7'h22 == _T_10 ? 1'h0 : _GEN_244; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_246 = 7'h23 == _T_10 ? 1'h0 : _GEN_245; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_247 = 7'h24 == _T_10 ? 1'h0 : _GEN_246; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_248 = 7'h25 == _T_10 ? 1'h0 : _GEN_247; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_249 = 7'h26 == _T_10 ? 1'h0 : _GEN_248; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_250 = 7'h27 == _T_10 ? 1'h0 : _GEN_249; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_251 = 7'h28 == _T_10 ? 1'h0 : _GEN_250; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_252 = 7'h29 == _T_10 ? 1'h0 : _GEN_251; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_253 = 7'h2a == _T_10 ? 1'h0 : _GEN_252; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_254 = 7'h2b == _T_10 ? 1'h0 : _GEN_253; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_255 = 7'h2c == _T_10 ? 1'h0 : _GEN_254; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_256 = 7'h2d == _T_10 ? 1'h0 : _GEN_255; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_257 = 7'h2e == _T_10 ? 1'h0 : _GEN_256; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_258 = 7'h2f == _T_10 ? 1'h0 : _GEN_257; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_259 = 7'h30 == _T_10 ? 1'h0 : _GEN_258; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_260 = 7'h31 == _T_10 ? 1'h0 : _GEN_259; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_261 = 7'h32 == _T_10 ? 1'h0 : _GEN_260; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_262 = 7'h33 == _T_10 ? 1'h0 : _GEN_261; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_263 = 7'h34 == _T_10 ? 1'h0 : _GEN_262; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_264 = 7'h35 == _T_10 ? 1'h0 : _GEN_263; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_265 = 7'h36 == _T_10 ? 1'h0 : _GEN_264; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_266 = 7'h37 == _T_10 ? 1'h0 : _GEN_265; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_267 = 7'h38 == _T_10 ? 1'h0 : _GEN_266; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_268 = 7'h39 == _T_10 ? 1'h0 : _GEN_267; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_269 = 7'h3a == _T_10 ? 1'h0 : _GEN_268; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_270 = 7'h3b == _T_10 ? 1'h0 : _GEN_269; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_271 = 7'h3c == _T_10 ? 1'h0 : _GEN_270; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_272 = 7'h3d == _T_10 ? 1'h0 : _GEN_271; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_273 = 7'h3e == _T_10 ? 1'h0 : _GEN_272; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_274 = 7'h3f == _T_10 ? 1'h0 : _GEN_273; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_275 = 7'h40 == _T_10 ? 1'h0 : _GEN_274; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_276 = 7'h41 == _T_10 ? 1'h0 : _GEN_275; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_277 = 7'h42 == _T_10 ? 1'h0 : _GEN_276; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_278 = 7'h43 == _T_10 ? 1'h0 : _GEN_277; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_279 = 7'h44 == _T_10 ? 1'h0 : _GEN_278; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_280 = 7'h45 == _T_10 ? 1'h0 : _GEN_279; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_281 = 7'h46 == _T_10 ? 1'h0 : _GEN_280; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_282 = 7'h47 == _T_10 ? 1'h0 : _GEN_281; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_283 = 7'h48 == _T_10 ? 1'h0 : _GEN_282; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_284 = 7'h49 == _T_10 ? 1'h0 : _GEN_283; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_285 = 7'h4a == _T_10 ? 1'h0 : _GEN_284; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_286 = 7'h4b == _T_10 ? 1'h0 : _GEN_285; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_287 = 7'h4c == _T_10 ? 1'h0 : _GEN_286; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_288 = 7'h4d == _T_10 ? 1'h0 : _GEN_287; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_289 = 7'h4e == _T_10 ? 1'h0 : _GEN_288; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_290 = 7'h4f == _T_10 ? 1'h0 : _GEN_289; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_291 = 7'h50 == _T_10 ? 1'h0 : _GEN_290; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_292 = 7'h51 == _T_10 ? 1'h0 : _GEN_291; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_293 = 7'h52 == _T_10 ? 1'h0 : _GEN_292; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_294 = 7'h53 == _T_10 ? 1'h0 : _GEN_293; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_295 = 7'h54 == _T_10 ? 1'h0 : _GEN_294; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_296 = 7'h55 == _T_10 ? 1'h0 : _GEN_295; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_297 = 7'h56 == _T_10 ? 1'h0 : _GEN_296; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_298 = 7'h57 == _T_10 ? 1'h0 : _GEN_297; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_299 = 7'h58 == _T_10 ? 1'h0 : _GEN_298; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_300 = 7'h59 == _T_10 ? 1'h0 : _GEN_299; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_301 = 7'h5a == _T_10 ? 1'h0 : _GEN_300; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_302 = 7'h5b == _T_10 ? 1'h0 : _GEN_301; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_303 = 7'h5c == _T_10 ? 1'h0 : _GEN_302; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_304 = 7'h5d == _T_10 ? 1'h0 : _GEN_303; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_305 = 7'h5e == _T_10 ? 1'h0 : _GEN_304; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_306 = 7'h5f == _T_10 ? 1'h0 : _GEN_305; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_307 = 7'h60 == _T_10 ? 1'h0 : _GEN_306; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_308 = 7'h61 == _T_10 ? 1'h0 : _GEN_307; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_309 = 7'h62 == _T_10 ? 1'h0 : _GEN_308; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_310 = 7'h63 == _T_10 ? 1'h0 : _GEN_309; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_311 = 7'h64 == _T_10 ? 1'h0 : _GEN_310; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_743 = device_under_test_io_out_ready & device_under_test_io_out_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [3:0] _GEN_314 = 5'h1 == value_1 ? 4'h7 : 4'h9; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_315 = 5'h2 == value_1 ? 4'h1 : _GEN_314; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_316 = 5'h3 == value_1 ? 4'h1 : _GEN_315; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_317 = 5'h4 == value_1 ? 4'h3 : _GEN_316; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_318 = 5'h5 == value_1 ? 4'h7 : _GEN_317; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_319 = 5'h6 == value_1 ? 4'h3 : _GEN_318; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_320 = 5'h7 == value_1 ? 4'h3 : _GEN_319; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_321 = 5'h8 == value_1 ? 4'h5 : _GEN_320; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_322 = 5'h9 == value_1 ? 4'h5 : _GEN_321; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_323 = 5'ha == value_1 ? 4'h7 : _GEN_322; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_324 = 5'hb == value_1 ? 4'h5 : _GEN_323; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_325 = 5'hc == value_1 ? 4'h7 : _GEN_324; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_326 = 5'hd == value_1 ? 4'h3 : _GEN_325; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_327 = 5'he == value_1 ? 4'h7 : _GEN_326; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_328 = 5'hf == value_1 ? 4'h7 : _GEN_327; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_329 = 5'h10 == value_1 ? 4'h5 : _GEN_328; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_330 = 5'h11 == value_1 ? 4'h7 : _GEN_329; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_331 = 5'h12 == value_1 ? 4'h9 : _GEN_330; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_332 = 5'h13 == value_1 ? 4'h5 : _GEN_331; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_333 = 5'h14 == value_1 ? 4'h9 : _GEN_332; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_334 = 5'h15 == value_1 ? 4'h3 : _GEN_333; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_335 = 5'h16 == value_1 ? 4'h1 : _GEN_334; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_336 = 5'h17 == value_1 ? 4'h1 : _GEN_335; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_337 = 5'h18 == value_1 ? 4'h3 : _GEN_336; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_338 = 5'h19 == value_1 ? 4'h3 : _GEN_337; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_339 = 5'h1a == value_1 ? 4'h5 : _GEN_338; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [3:0] _GEN_340 = 5'h1b == value_1 ? 4'h0 : _GEN_339; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [31:0] _GEN_348 = {{28'd0}, _GEN_340}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_748 = device_under_test_io_out_bits != _GEN_348; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_759 = value_1 == 5'h1a; // @[Counter.scala 25:24]
  wire [4:0] _T_762 = value_1 + 5'h1; // @[Counter.scala 26:22]
  wire  _GEN_342 = _T_10 == 7'h1a | _T_13; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [6:0] _T_771 = _T_10 + 7'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  wire  _GEN_350 = _T_743 & _T_748; // @[OrderedDecoupledHWIOTester.scala 322:19]
  SmallOdds3 device_under_test ( // @[SmallOdds3.scala 54:33]
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
  assign device_under_test_io_in_valid = 7'h65 == _T_4[6:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign device_under_test_io_in_bits = {{27'd0}, _GEN_101}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign device_under_test_io_out_ready = 7'h65 == _T_10 ? 1'h0 : _GEN_311; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  always @(posedge clock) begin
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_4 <= 9'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_4 <= _T_469; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_7 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_7 <= _GEN_205;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_10 <= 7'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_10 <= _T_771; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_13 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_13 <= _GEN_342;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 407:21]
      _T_21 <= 14'h0; // @[OrderedDecoupledHWIOTester.scala 407:21]
    end else begin
      _T_21 <= _T_24; // @[OrderedDecoupledHWIOTester.scala 408:8]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value <= 7'h0; // @[Counter.scala 17:33]
    end else if (device_under_test_io_in_valid & device_under_test_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_457) begin // @[Counter.scala 28:21]
        value <= 7'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_460; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_1 <= 5'h0; // @[Counter.scala 17:33]
    end else if (device_under_test_io_out_ready & device_under_test_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_759) begin // @[Counter.scala 28:21]
        value_1 <= 5'h0; // @[Counter.scala 28:29]
      end else begin
        value_1 <= _T_762; // @[Counter.scala 26:13]
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
        if (_T_743 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing out.bits = %d, should be %d\n",_T_10,
            device_under_test_io_out_bits,5'h1b == value_1 ? 4'h0 : _GEN_339); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_743 & _T_748 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d out.bits was %d should be %d\n",_T_10,device_under_test_io_out_bits,
            _GEN_340); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_350 & _T_16) begin
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
        if (_GEN_350 & _T_16) begin
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
        if (_GEN_350 & _T_16) begin
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
  _T_4 = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  _T_7 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_10 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  _T_13 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_21 = _RAND_4[13:0];
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[6:0];
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
