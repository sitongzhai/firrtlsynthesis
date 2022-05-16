module SmallOdds5Filter(
  input         clock,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  valid; // @[DecoupledAdvTester.scala 21:20]
  reg [31:0] result; // @[DecoupledAdvTester.scala 23:21]
  wire  _T_17 = io_in_bits < 32'ha; // @[DecoupledAdvTester.scala 38:36]
  wire  _GEN_1 = io_in_valid & _T_17 | valid; // @[DecoupledAdvTester.scala 25:44 DecoupledAdvTester.scala 27:13 DecoupledAdvTester.scala 21:20]
  wire  _T_21 = ~(io_in_valid & _T_17); // @[DecoupledAdvTester.scala 25:44]
  assign io_in_ready = io_out_ready; // @[DecoupledAdvTester.scala 19:17]
  assign io_out_valid = io_out_ready & valid; // @[DecoupledAdvTester.scala 33:34]
  assign io_out_bits = result; // @[DecoupledAdvTester.scala 32:17]
  always @(posedge clock) begin
    if (_T_21) begin // @[DecoupledAdvTester.scala 28:7]
      valid <= 1'h0; // @[DecoupledAdvTester.scala 29:13]
    end else begin
      valid <= _GEN_1;
    end
    if (io_in_valid & _T_17) begin // @[DecoupledAdvTester.scala 25:44]
      result <= io_in_bits; // @[DecoupledAdvTester.scala 26:14]
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
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:1]; // @[Decoupled.scala 200:24]
  wire  ram__T_51_en; // @[Decoupled.scala 200:24]
  wire  ram__T_51_addr; // @[Decoupled.scala 200:24]
  wire [31:0] ram__T_51_data; // @[Decoupled.scala 200:24]
  wire [31:0] ram__T_37_data; // @[Decoupled.scala 200:24]
  wire  ram__T_37_addr; // @[Decoupled.scala 200:24]
  wire  ram__T_37_mask; // @[Decoupled.scala 200:24]
  wire  ram__T_37_en; // @[Decoupled.scala 200:24]
  reg  value; // @[Counter.scala 17:33]
  reg  value_1; // @[Counter.scala 17:33]
  reg  maybe_full; // @[Decoupled.scala 203:35]
  wire  _T_28 = value == value_1; // @[Decoupled.scala 205:41]
  wire  _T_31 = _T_28 & ~maybe_full; // @[Decoupled.scala 206:33]
  wire  _T_32 = _T_28 & maybe_full; // @[Decoupled.scala 207:32]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 29:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 29:37]
  assign ram__T_51_en = 1'h1;
  assign ram__T_51_addr = value_1;
  assign ram__T_51_data = ram[ram__T_51_addr]; // @[Decoupled.scala 200:24]
  assign ram__T_37_data = io_enq_bits;
  assign ram__T_37_addr = value;
  assign ram__T_37_mask = 1'h1;
  assign ram__T_37_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~_T_32; // @[Decoupled.scala 223:19]
  assign io_deq_valid = ~_T_31; // @[Decoupled.scala 222:19]
  assign io_deq_bits = ram__T_51_data; // @[Decoupled.scala 224:15]
  always @(posedge clock) begin
    if (ram__T_37_en & ram__T_37_mask) begin
      ram[ram__T_37_addr] <= ram__T_37_data; // @[Decoupled.scala 200:24]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value <= 1'h0; // @[Counter.scala 17:33]
    end else if (do_enq) begin // @[Decoupled.scala 211:17]
      value <= value + 1'h1; // @[Counter.scala 26:13]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_1 <= 1'h0; // @[Counter.scala 17:33]
    end else if (do_deq) begin // @[Decoupled.scala 215:17]
      value_1 <= value_1 + 1'h1; // @[Counter.scala 26:13]
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
module SmallOdds5Filter_1(
  input         clock,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  valid; // @[DecoupledAdvTester.scala 21:20]
  reg [31:0] result; // @[DecoupledAdvTester.scala 23:21]
  wire [31:0] _T_17 = io_in_bits & 32'h1; // @[DecoupledAdvTester.scala 44:50]
  wire  _T_19 = _T_17 == 32'h1; // @[DecoupledAdvTester.scala 44:57]
  wire  _GEN_1 = io_in_valid & _T_19 | valid; // @[DecoupledAdvTester.scala 25:44 DecoupledAdvTester.scala 27:13 DecoupledAdvTester.scala 21:20]
  wire  _T_23 = ~(io_in_valid & _T_19); // @[DecoupledAdvTester.scala 25:44]
  assign io_in_ready = io_out_ready; // @[DecoupledAdvTester.scala 19:17]
  assign io_out_valid = io_out_ready & valid; // @[DecoupledAdvTester.scala 33:34]
  assign io_out_bits = result; // @[DecoupledAdvTester.scala 32:17]
  always @(posedge clock) begin
    if (_T_23) begin // @[DecoupledAdvTester.scala 28:7]
      valid <= 1'h0; // @[DecoupledAdvTester.scala 29:13]
    end else begin
      valid <= _GEN_1;
    end
    if (io_in_valid & _T_19) begin // @[DecoupledAdvTester.scala 25:44]
      result <= io_in_bits; // @[DecoupledAdvTester.scala 26:14]
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
module SmallOdds5(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits
);
  wire  smalls_clock; // @[DecoupledAdvTester.scala 38:22]
  wire  smalls_io_in_ready; // @[DecoupledAdvTester.scala 38:22]
  wire  smalls_io_in_valid; // @[DecoupledAdvTester.scala 38:22]
  wire [31:0] smalls_io_in_bits; // @[DecoupledAdvTester.scala 38:22]
  wire  smalls_io_out_ready; // @[DecoupledAdvTester.scala 38:22]
  wire  smalls_io_out_valid; // @[DecoupledAdvTester.scala 38:22]
  wire [31:0] smalls_io_out_bits; // @[DecoupledAdvTester.scala 38:22]
  wire  q_clock; // @[DecoupledAdvTester.scala 43:22]
  wire  q_reset; // @[DecoupledAdvTester.scala 43:22]
  wire  q_io_enq_ready; // @[DecoupledAdvTester.scala 43:22]
  wire  q_io_enq_valid; // @[DecoupledAdvTester.scala 43:22]
  wire [31:0] q_io_enq_bits; // @[DecoupledAdvTester.scala 43:22]
  wire  q_io_deq_ready; // @[DecoupledAdvTester.scala 43:22]
  wire  q_io_deq_valid; // @[DecoupledAdvTester.scala 43:22]
  wire [31:0] q_io_deq_bits; // @[DecoupledAdvTester.scala 43:22]
  wire  odds_clock; // @[DecoupledAdvTester.scala 44:22]
  wire  odds_io_in_ready; // @[DecoupledAdvTester.scala 44:22]
  wire  odds_io_in_valid; // @[DecoupledAdvTester.scala 44:22]
  wire [31:0] odds_io_in_bits; // @[DecoupledAdvTester.scala 44:22]
  wire  odds_io_out_ready; // @[DecoupledAdvTester.scala 44:22]
  wire  odds_io_out_valid; // @[DecoupledAdvTester.scala 44:22]
  wire [31:0] odds_io_out_bits; // @[DecoupledAdvTester.scala 44:22]
  SmallOdds5Filter smalls ( // @[DecoupledAdvTester.scala 38:22]
    .clock(smalls_clock),
    .io_in_ready(smalls_io_in_ready),
    .io_in_valid(smalls_io_in_valid),
    .io_in_bits(smalls_io_in_bits),
    .io_out_ready(smalls_io_out_ready),
    .io_out_valid(smalls_io_out_valid),
    .io_out_bits(smalls_io_out_bits)
  );
  Queue q ( // @[DecoupledAdvTester.scala 43:22]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits(q_io_enq_bits),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits(q_io_deq_bits)
  );
  SmallOdds5Filter_1 odds ( // @[DecoupledAdvTester.scala 44:22]
    .clock(odds_clock),
    .io_in_ready(odds_io_in_ready),
    .io_in_valid(odds_io_in_valid),
    .io_in_bits(odds_io_in_bits),
    .io_out_ready(odds_io_out_ready),
    .io_out_valid(odds_io_out_valid),
    .io_out_bits(odds_io_out_bits)
  );
  assign io_in_ready = smalls_io_in_ready; // @[DecoupledAdvTester.scala 46:16]
  assign io_out_valid = odds_io_out_valid; // @[DecoupledAdvTester.scala 49:16]
  assign io_out_bits = odds_io_out_bits; // @[DecoupledAdvTester.scala 49:16]
  assign smalls_clock = clock;
  assign smalls_io_in_valid = io_in_valid; // @[DecoupledAdvTester.scala 46:16]
  assign smalls_io_in_bits = io_in_bits; // @[DecoupledAdvTester.scala 46:16]
  assign smalls_io_out_ready = q_io_enq_ready; // @[DecoupledAdvTester.scala 47:16]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = smalls_io_out_valid; // @[DecoupledAdvTester.scala 47:16]
  assign q_io_enq_bits = smalls_io_out_bits; // @[DecoupledAdvTester.scala 47:16]
  assign q_io_deq_ready = odds_io_in_ready; // @[DecoupledAdvTester.scala 48:16]
  assign odds_clock = clock;
  assign odds_io_in_valid = q_io_deq_valid; // @[DecoupledAdvTester.scala 48:16]
  assign odds_io_in_bits = q_io_deq_bits; // @[DecoupledAdvTester.scala 48:16]
  assign odds_io_out_ready = io_out_ready; // @[DecoupledAdvTester.scala 49:16]
endmodule
