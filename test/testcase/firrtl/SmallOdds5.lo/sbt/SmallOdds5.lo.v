module SmallOdds5Filter( // @[:@3.2]
  input         clock, // @[:@4.4]
  output        io_in_ready, // @[:@6.4]
  input         io_in_valid, // @[:@6.4]
  input  [31:0] io_in_bits, // @[:@6.4]
  input         io_out_ready, // @[:@6.4]
  output        io_out_valid, // @[:@6.4]
  output [31:0] io_out_bits // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  valid; // @[DecoupledAdvTester.scala 21:20:@12.4]
  reg [31:0] result; // @[DecoupledAdvTester.scala 23:21:@13.4]
  wire  _T_17 = io_in_bits < 32'ha; // @[DecoupledAdvTester.scala 38:36:@14.4]
  wire  _T_18 = io_in_valid & _T_17; // @[DecoupledAdvTester.scala 25:23:@15.4]
  assign io_in_ready = io_out_ready;
  assign io_out_valid = io_out_ready & valid; // @[DecoupledAdvTester.scala 33:34:@24.4]
  assign io_out_bits = result;
  always @(posedge clock) begin
    valid <= io_in_valid & _T_17; // @[DecoupledAdvTester.scala 25:23:@15.4]
    if (_T_18) begin // @[DecoupledAdvTester.scala 25:44:@16.4]
      result <= io_in_bits;
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
  valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  result = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue( // @[:@27.2]
  input         clock, // @[:@28.4]
  input         reset, // @[:@29.4]
  output        io_enq_ready, // @[:@30.4]
  input         io_enq_valid, // @[:@30.4]
  input  [31:0] io_enq_bits, // @[:@30.4]
  input         io_deq_ready, // @[:@30.4]
  output        io_deq_valid, // @[:@30.4]
  output [31:0] io_deq_bits // @[:@30.4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:1]; // @[Decoupled.scala 214:24:@35.4]
  wire  ram__T_50_en; // @[Decoupled.scala 214:24:@35.4]
  wire  ram__T_50_addr; // @[Decoupled.scala 214:24:@35.4]
  wire [31:0] ram__T_50_data; // @[Decoupled.scala 214:24:@35.4]
  wire [31:0] ram__T_36_data; // @[Decoupled.scala 214:24:@35.4]
  wire  ram__T_36_addr; // @[Decoupled.scala 214:24:@35.4]
  wire  ram__T_36_mask; // @[Decoupled.scala 214:24:@35.4]
  wire  ram__T_36_en; // @[Decoupled.scala 214:24:@35.4]
  reg  value; // @[Counter.scala 17:33:@36.4]
  reg  value_1; // @[Counter.scala 17:33:@37.4]
  reg  maybe_full; // @[Decoupled.scala 217:35:@38.4]
  wire  _T_28 = value == value_1; // @[Decoupled.scala 219:41:@39.4]
  wire  _T_30 = ~maybe_full; // @[Decoupled.scala 220:36:@40.4]
  wire  empty = _T_28 & _T_30; // @[Decoupled.scala 220:33:@41.4]
  wire  _T_31 = _T_28 & maybe_full; // @[Decoupled.scala 221:32:@42.4]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 30:37:@43.4]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 30:37:@47.4]
  wire  _T_40 = value + 1'h1; // @[Counter.scala 26:22:@56.6]
  wire  _T_44 = value_1 + 1'h1; // @[Counter.scala 26:22:@62.6]
  wire  _T_45 = do_enq != do_deq; // @[Decoupled.scala 232:16:@65.4]
  assign ram__T_50_en = 1'h1;
  assign ram__T_50_addr = value_1;
  assign ram__T_50_data = ram[ram__T_50_addr]; // @[Decoupled.scala 214:24:@35.4]
  assign ram__T_36_data = io_enq_bits;
  assign ram__T_36_addr = value;
  assign ram__T_36_mask = io_enq_ready & io_enq_valid;
  assign ram__T_36_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~_T_31; // @[Decoupled.scala 237:19:@71.4]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 236:19:@69.4]
  assign io_deq_bits = ram__T_50_data;
  always @(posedge clock) begin
    if (ram__T_36_en & ram__T_36_mask) begin
      ram[ram__T_36_addr] <= ram__T_36_data; // @[Decoupled.scala 214:24:@35.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else if (do_enq) begin // @[Decoupled.scala 225:17:@51.4]
      value <= _T_40;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (do_deq) begin // @[Decoupled.scala 229:17:@59.4]
      value_1 <= _T_44;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (_T_45) begin // @[Decoupled.scala 232:27:@66.4]
      maybe_full <= do_enq;
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
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SmallOdds5Filter_1( // @[:@82.2]
  input         clock, // @[:@83.4]
  output        io_in_ready, // @[:@85.4]
  input         io_in_valid, // @[:@85.4]
  input  [31:0] io_in_bits, // @[:@85.4]
  input         io_out_ready, // @[:@85.4]
  output        io_out_valid, // @[:@85.4]
  output [31:0] io_out_bits // @[:@85.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  valid; // @[DecoupledAdvTester.scala 21:20:@91.4]
  reg [31:0] result; // @[DecoupledAdvTester.scala 23:21:@92.4]
  wire [31:0] _T_17 = io_in_bits & 32'h1; // @[DecoupledAdvTester.scala 44:50:@93.4]
  wire  _T_19 = _T_17 == 32'h1; // @[DecoupledAdvTester.scala 44:57:@94.4]
  wire  _T_20 = io_in_valid & _T_19; // @[DecoupledAdvTester.scala 25:23:@95.4]
  assign io_in_ready = io_out_ready;
  assign io_out_valid = io_out_ready & valid; // @[DecoupledAdvTester.scala 33:34:@104.4]
  assign io_out_bits = result;
  always @(posedge clock) begin
    valid <= io_in_valid & _T_19; // @[DecoupledAdvTester.scala 25:23:@95.4]
    if (_T_20) begin // @[DecoupledAdvTester.scala 25:44:@96.4]
      result <= io_in_bits;
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
  valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  result = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SmallOdds5( // @[:@107.2]
  input         clock, // @[:@108.4]
  input         reset, // @[:@109.4]
  output        io_in_ready, // @[:@110.4]
  input         io_in_valid, // @[:@110.4]
  input  [31:0] io_in_bits, // @[:@110.4]
  input         io_out_ready, // @[:@110.4]
  output        io_out_valid, // @[:@110.4]
  output [31:0] io_out_bits // @[:@110.4]
);
  wire  smalls_clock; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire  smalls_io_in_ready; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire  smalls_io_in_valid; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire [31:0] smalls_io_in_bits; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire  smalls_io_out_ready; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire  smalls_io_out_valid; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire [31:0] smalls_io_out_bits; // @[DecoupledAdvTester.scala 38:22:@115.4]
  wire  q_clock; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire  q_reset; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire  q_io_enq_ready; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire  q_io_enq_valid; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire [31:0] q_io_enq_bits; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire  q_io_deq_ready; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire  q_io_deq_valid; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire [31:0] q_io_deq_bits; // @[DecoupledAdvTester.scala 43:22:@119.4]
  wire  odds_clock; // @[DecoupledAdvTester.scala 44:22:@123.4]
  wire  odds_io_in_ready; // @[DecoupledAdvTester.scala 44:22:@123.4]
  wire  odds_io_in_valid; // @[DecoupledAdvTester.scala 44:22:@123.4]
  wire [31:0] odds_io_in_bits; // @[DecoupledAdvTester.scala 44:22:@123.4]
  wire  odds_io_out_ready; // @[DecoupledAdvTester.scala 44:22:@123.4]
  wire  odds_io_out_valid; // @[DecoupledAdvTester.scala 44:22:@123.4]
  wire [31:0] odds_io_out_bits; // @[DecoupledAdvTester.scala 44:22:@123.4]
  SmallOdds5Filter smalls ( // @[DecoupledAdvTester.scala 38:22:@115.4]
    .clock(smalls_clock),
    .io_in_ready(smalls_io_in_ready),
    .io_in_valid(smalls_io_in_valid),
    .io_in_bits(smalls_io_in_bits),
    .io_out_ready(smalls_io_out_ready),
    .io_out_valid(smalls_io_out_valid),
    .io_out_bits(smalls_io_out_bits)
  );
  Queue q ( // @[DecoupledAdvTester.scala 43:22:@119.4]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits(q_io_enq_bits),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits(q_io_deq_bits)
  );
  SmallOdds5Filter_1 odds ( // @[DecoupledAdvTester.scala 44:22:@123.4]
    .clock(odds_clock),
    .io_in_ready(odds_io_in_ready),
    .io_in_valid(odds_io_in_valid),
    .io_in_bits(odds_io_in_bits),
    .io_out_ready(odds_io_out_ready),
    .io_out_valid(odds_io_out_valid),
    .io_out_bits(odds_io_out_bits)
  );
  assign io_in_ready = smalls_io_in_ready;
  assign io_out_valid = odds_io_out_valid;
  assign io_out_bits = odds_io_out_bits;
  assign smalls_clock = clock;
  assign smalls_io_in_valid = io_in_valid;
  assign smalls_io_in_bits = io_in_bits;
  assign smalls_io_out_ready = q_io_enq_ready;
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = smalls_io_out_valid;
  assign q_io_enq_bits = smalls_io_out_bits;
  assign q_io_deq_ready = odds_io_in_ready;
  assign odds_clock = clock;
  assign odds_io_in_valid = q_io_deq_valid;
  assign odds_io_in_bits = q_io_deq_bits;
  assign odds_io_out_ready = io_out_ready;
endmodule
