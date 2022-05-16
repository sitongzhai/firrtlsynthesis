module Router(
  input         clock,
  input         reset,
  output        io_read_routing_table_request_ready,
  input         io_read_routing_table_request_valid,
  input  [31:0] io_read_routing_table_request_bits_addr,
  input         io_read_routing_table_response_ready,
  output        io_read_routing_table_response_valid,
  output [31:0] io_read_routing_table_response_bits,
  output        io_load_routing_table_request_ready,
  input         io_load_routing_table_request_valid,
  input  [31:0] io_load_routing_table_request_bits_addr,
  input  [31:0] io_load_routing_table_request_bits_data,
  output        io_in_ready,
  input         io_in_valid,
  input  [7:0]  io_in_bits_header,
  input  [63:0] io_in_bits_body,
  input         io_outs_0_ready,
  output        io_outs_0_valid,
  output [63:0] io_outs_0_bits_body,
  input         io_outs_1_ready,
  output        io_outs_1_valid,
  output [63:0] io_outs_1_bits_body,
  input         io_outs_2_ready,
  output        io_outs_2_valid,
  output [63:0] io_outs_2_bits_body,
  input         io_outs_3_ready,
  output        io_outs_3_valid,
  output [63:0] io_outs_3_bits_body
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [2:0] tbl [0:14]; // @[Router.scala 54:18]
  wire  tbl__T_74_en; // @[Router.scala 54:18]
  wire [3:0] tbl__T_74_addr; // @[Router.scala 54:18]
  wire [2:0] tbl__T_74_data; // @[Router.scala 54:18]
  wire  tbl__T_92_en; // @[Router.scala 54:18]
  wire [3:0] tbl__T_92_addr; // @[Router.scala 54:18]
  wire [2:0] tbl__T_92_data; // @[Router.scala 54:18]
  wire  tbl__T_104_en; // @[Router.scala 54:18]
  wire [3:0] tbl__T_104_addr; // @[Router.scala 54:18]
  wire [2:0] tbl__T_104_data; // @[Router.scala 54:18]
  wire [2:0] tbl__T_81_data; // @[Router.scala 54:18]
  wire [3:0] tbl__T_81_addr; // @[Router.scala 54:18]
  wire  tbl__T_81_mask; // @[Router.scala 54:18]
  wire  tbl__T_81_en; // @[Router.scala 54:18]
  wire  _T_77 = ~(io_read_routing_table_request_valid & io_read_routing_table_response_ready); // @[Router.scala 64:85]
  wire  _T_78 = _T_77 & io_load_routing_table_request_valid; // @[Router.scala 69:50]
  wire  _T_83 = ~reset; // @[Router.scala 72:11]
  wire  _T_88 = _T_77 & ~io_load_routing_table_request_valid; // @[Router.scala 69:50]
  wire  _T_89 = _T_88 & io_in_valid; // @[Router.scala 74:26]
  wire  _GEN_22 = 2'h1 == tbl__T_92_data[1:0] ? io_outs_1_ready : io_outs_0_ready; // @[Router.scala 77:30 Router.scala 77:30]
  wire  _GEN_23 = 2'h2 == tbl__T_92_data[1:0] ? io_outs_2_ready : _GEN_22; // @[Router.scala 77:30 Router.scala 77:30]
  wire  _GEN_24 = 2'h3 == tbl__T_92_data[1:0] ? io_outs_3_ready : _GEN_23; // @[Router.scala 77:30 Router.scala 77:30]
  wire  _GEN_25 = 2'h0 == tbl__T_92_data[1:0]; // @[Decoupled.scala 36:20 Decoupled.scala 36:20]
  wire  _GEN_26 = 2'h1 == tbl__T_92_data[1:0]; // @[Decoupled.scala 36:20 Decoupled.scala 36:20]
  wire  _GEN_27 = 2'h2 == tbl__T_92_data[1:0]; // @[Decoupled.scala 36:20 Decoupled.scala 36:20]
  wire  _GEN_28 = 2'h3 == tbl__T_92_data[1:0]; // @[Decoupled.scala 36:20 Decoupled.scala 36:20]
  wire [63:0] _GEN_29 = 2'h0 == tbl__T_92_data[1:0] ? io_in_bits_body : 64'h0; // @[Decoupled.scala 37:19 Decoupled.scala 37:19]
  wire [63:0] _GEN_30 = 2'h1 == tbl__T_92_data[1:0] ? io_in_bits_body : 64'h0; // @[Decoupled.scala 37:19 Decoupled.scala 37:19]
  wire [63:0] _GEN_31 = 2'h2 == tbl__T_92_data[1:0] ? io_in_bits_body : 64'h0; // @[Decoupled.scala 37:19 Decoupled.scala 37:19]
  wire [63:0] _GEN_32 = 2'h3 == tbl__T_92_data[1:0] ? io_in_bits_body : 64'h0; // @[Decoupled.scala 37:19 Decoupled.scala 37:19]
  wire  _GEN_38 = _GEN_24 & _GEN_25; // @[Router.scala 77:30]
  wire  _GEN_39 = _GEN_24 & _GEN_26; // @[Router.scala 77:30]
  wire  _GEN_40 = _GEN_24 & _GEN_27; // @[Router.scala 77:30]
  wire  _GEN_41 = _GEN_24 & _GEN_28; // @[Router.scala 77:30]
  wire [63:0] _GEN_42 = _GEN_24 ? _GEN_29 : 64'h0; // @[Router.scala 77:30]
  wire [63:0] _GEN_43 = _GEN_24 ? _GEN_30 : 64'h0; // @[Router.scala 77:30]
  wire [63:0] _GEN_44 = _GEN_24 ? _GEN_31 : 64'h0; // @[Router.scala 77:30]
  wire [63:0] _GEN_45 = _GEN_24 ? _GEN_32 : 64'h0; // @[Router.scala 77:30]
  wire  _GEN_56 = _T_88 & io_in_valid & _GEN_24; // @[Router.scala 74:26]
  assign tbl__T_74_en = io_read_routing_table_request_valid & io_read_routing_table_response_ready;
  assign tbl__T_74_addr = io_read_routing_table_request_bits_addr[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign tbl__T_74_data = tbl[tbl__T_74_addr]; // @[Router.scala 54:18]
  `else
  assign tbl__T_74_data = tbl__T_74_addr >= 4'hf ? _RAND_1[2:0] : tbl[tbl__T_74_addr]; // @[Router.scala 54:18]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign tbl__T_92_en = _T_88 & io_in_valid;
  assign tbl__T_92_addr = io_in_bits_header[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign tbl__T_92_data = tbl[tbl__T_92_addr]; // @[Router.scala 54:18]
  `else
  assign tbl__T_92_data = tbl__T_92_addr >= 4'hf ? _RAND_2[2:0] : tbl[tbl__T_92_addr]; // @[Router.scala 54:18]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign tbl__T_104_en = _T_89 & _GEN_24;
  assign tbl__T_104_addr = io_in_bits_header[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign tbl__T_104_data = tbl[tbl__T_104_addr]; // @[Router.scala 54:18]
  `else
  assign tbl__T_104_data = tbl__T_104_addr >= 4'hf ? _RAND_3[2:0] : tbl[tbl__T_104_addr]; // @[Router.scala 54:18]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign tbl__T_81_data = io_load_routing_table_request_bits_data[2:0];
  assign tbl__T_81_addr = io_load_routing_table_request_bits_addr[3:0];
  assign tbl__T_81_mask = 1'h1;
  assign tbl__T_81_en = _T_77 & io_load_routing_table_request_valid;
  assign io_read_routing_table_request_ready = io_read_routing_table_request_valid &
    io_read_routing_table_response_ready; // @[Router.scala 64:44]
  assign io_read_routing_table_response_valid = io_read_routing_table_request_valid &
    io_read_routing_table_response_ready; // @[Router.scala 64:44]
  assign io_read_routing_table_response_bits = io_read_routing_table_request_valid &
    io_read_routing_table_response_ready ? {{29'd0}, tbl__T_74_data} : 32'h0; // @[Router.scala 64:85 Decoupled.scala 37:19]
  assign io_load_routing_table_request_ready = _T_77 & io_load_routing_table_request_valid; // @[Router.scala 69:50]
  assign io_in_ready = _T_88 & io_in_valid & _GEN_24; // @[Router.scala 74:26]
  assign io_outs_0_valid = _T_88 & io_in_valid & _GEN_38; // @[Router.scala 74:26]
  assign io_outs_0_bits_body = _T_88 & io_in_valid ? _GEN_42 : 64'h0; // @[Router.scala 74:26]
  assign io_outs_1_valid = _T_88 & io_in_valid & _GEN_39; // @[Router.scala 74:26]
  assign io_outs_1_bits_body = _T_88 & io_in_valid ? _GEN_43 : 64'h0; // @[Router.scala 74:26]
  assign io_outs_2_valid = _T_88 & io_in_valid & _GEN_40; // @[Router.scala 74:26]
  assign io_outs_2_bits_body = _T_88 & io_in_valid ? _GEN_44 : 64'h0; // @[Router.scala 74:26]
  assign io_outs_3_valid = _T_88 & io_in_valid & _GEN_41; // @[Router.scala 74:26]
  assign io_outs_3_bits_body = _T_88 & io_in_valid ? _GEN_45 : 64'h0; // @[Router.scala 74:26]
  always @(posedge clock) begin
    if (tbl__T_81_en & tbl__T_81_mask) begin
      tbl[tbl__T_81_addr] <= tbl__T_81_data; // @[Router.scala 54:18]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_78 & ~reset) begin
          $fwrite(32'h80000002,"setting tbl(%d) to %d\n",io_load_routing_table_request_bits_addr,
            io_load_routing_table_request_bits_data); // @[Router.scala 72:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_56 & _T_83) begin
          $fwrite(32'h80000002,"got packet to route header %d, data %d, being routed to out(%d)\n",io_in_bits_header,
            io_in_bits_body,tbl__T_104_data); // @[Router.scala 80:13]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 15; initvar = initvar+1)
    tbl[initvar] = _RAND_0[2:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RouterUnitTester(
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
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire  c_clock; // @[Router.scala 86:33]
  wire  c_reset; // @[Router.scala 86:33]
  wire  c_io_read_routing_table_request_ready; // @[Router.scala 86:33]
  wire  c_io_read_routing_table_request_valid; // @[Router.scala 86:33]
  wire [31:0] c_io_read_routing_table_request_bits_addr; // @[Router.scala 86:33]
  wire  c_io_read_routing_table_response_ready; // @[Router.scala 86:33]
  wire  c_io_read_routing_table_response_valid; // @[Router.scala 86:33]
  wire [31:0] c_io_read_routing_table_response_bits; // @[Router.scala 86:33]
  wire  c_io_load_routing_table_request_ready; // @[Router.scala 86:33]
  wire  c_io_load_routing_table_request_valid; // @[Router.scala 86:33]
  wire [31:0] c_io_load_routing_table_request_bits_addr; // @[Router.scala 86:33]
  wire [31:0] c_io_load_routing_table_request_bits_data; // @[Router.scala 86:33]
  wire  c_io_in_ready; // @[Router.scala 86:33]
  wire  c_io_in_valid; // @[Router.scala 86:33]
  wire [7:0] c_io_in_bits_header; // @[Router.scala 86:33]
  wire [63:0] c_io_in_bits_body; // @[Router.scala 86:33]
  wire  c_io_outs_0_ready; // @[Router.scala 86:33]
  wire  c_io_outs_0_valid; // @[Router.scala 86:33]
  wire [63:0] c_io_outs_0_bits_body; // @[Router.scala 86:33]
  wire  c_io_outs_1_ready; // @[Router.scala 86:33]
  wire  c_io_outs_1_valid; // @[Router.scala 86:33]
  wire [63:0] c_io_outs_1_bits_body; // @[Router.scala 86:33]
  wire  c_io_outs_2_ready; // @[Router.scala 86:33]
  wire  c_io_outs_2_valid; // @[Router.scala 86:33]
  wire [63:0] c_io_outs_2_bits_body; // @[Router.scala 86:33]
  wire  c_io_outs_3_ready; // @[Router.scala 86:33]
  wire  c_io_outs_3_valid; // @[Router.scala 86:33]
  wire [63:0] c_io_outs_3_bits_body; // @[Router.scala 86:33]
  reg [7:0] _T_4; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_7; // @[OrderedDecoupledHWIOTester.scala 375:30]
  reg [7:0] _T_10; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_13; // @[OrderedDecoupledHWIOTester.scala 375:30]
  wire  _T_14 = _T_7 & _T_13; // @[OrderedDecoupledHWIOTester.scala 402:42]
  wire  _T_16 = ~reset; // @[OrderedDecoupledHWIOTester.scala 403:13]
  reg [13:0] _T_21; // @[OrderedDecoupledHWIOTester.scala 407:21]
  wire [13:0] _T_24 = _T_21 + 14'h1; // @[OrderedDecoupledHWIOTester.scala 408:14]
  wire  _T_26 = _T_21 > 14'h2710; // @[OrderedDecoupledHWIOTester.scala 409:13]
  reg [3:0] value; // @[Counter.scala 17:33]
  wire [1:0] _GEN_2 = 4'h2 == value ? 2'h1 : 2'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_3 = 4'h3 == value ? 2'h2 : _GEN_2; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_4 = 4'h4 == value ? 2'h3 : _GEN_3; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_5 = 4'h5 == value ? 2'h3 : _GEN_4; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_6 = 4'h6 == value ? 2'h2 : _GEN_5; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_7 = 4'h7 == value ? 2'h1 : _GEN_6; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_8 = 4'h8 == value ? 2'h0 : _GEN_7; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_9 = 4'h9 == value ? 2'h0 : _GEN_8; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _GEN_11 = 6'h1 == _T_4[5:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_13 = 6'h3 == _T_4[5:0] ? 1'h0 : 6'h2 == _T_4[5:0] | _GEN_11; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_15 = 6'h5 == _T_4[5:0] ? 1'h0 : 6'h4 == _T_4[5:0] | _GEN_13; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_17 = 6'h7 == _T_4[5:0] ? 1'h0 : 6'h6 == _T_4[5:0] | _GEN_15; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_23 = 6'hd == _T_4[5:0] ? 1'h0 : 6'hc == _T_4[5:0] | (6'hb == _T_4[5:0] | (6'ha == _T_4[5:0] | (6'h9 == _T_4
    [5:0] | (6'h8 == _T_4[5:0] | _GEN_17)))); // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_24 = 6'he == _T_4[5:0] ? 1'h0 : _GEN_23; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_25 = 6'hf == _T_4[5:0] ? 1'h0 : _GEN_24; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_26 = 6'h10 == _T_4[5:0] ? 1'h0 : _GEN_25; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_27 = 6'h11 == _T_4[5:0] ? 1'h0 : _GEN_26; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_28 = 6'h12 == _T_4[5:0] ? 1'h0 : _GEN_27; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_29 = 6'h13 == _T_4[5:0] ? 1'h0 : _GEN_28; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_30 = 6'h14 == _T_4[5:0] ? 1'h0 : _GEN_29; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_31 = 6'h15 == _T_4[5:0] ? 1'h0 : _GEN_30; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_32 = 6'h16 == _T_4[5:0] ? 1'h0 : _GEN_31; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_33 = 6'h17 == _T_4[5:0] ? 1'h0 : _GEN_32; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_34 = 6'h18 == _T_4[5:0] ? 1'h0 : _GEN_33; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_35 = 6'h19 == _T_4[5:0] ? 1'h0 : _GEN_34; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_36 = 6'h1a == _T_4[5:0] ? 1'h0 : _GEN_35; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_37 = 6'h1b == _T_4[5:0] ? 1'h0 : _GEN_36; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_38 = 6'h1c == _T_4[5:0] ? 1'h0 : _GEN_37; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_39 = 6'h1d == _T_4[5:0] ? 1'h0 : _GEN_38; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_40 = 6'h1e == _T_4[5:0] ? 1'h0 : _GEN_39; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_41 = 6'h1f == _T_4[5:0] ? 1'h0 : _GEN_40; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_42 = 6'h20 == _T_4[5:0] ? 1'h0 : _GEN_41; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_43 = 6'h21 == _T_4[5:0] ? 1'h0 : _GEN_42; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_44 = 6'h22 == _T_4[5:0] ? 1'h0 : _GEN_43; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_45 = 6'h23 == _T_4[5:0] ? 1'h0 : _GEN_44; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_46 = 6'h24 == _T_4[5:0] ? 1'h0 : _GEN_45; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_47 = 6'h25 == _T_4[5:0] ? 1'h0 : _GEN_46; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_48 = 6'h26 == _T_4[5:0] ? 1'h0 : _GEN_47; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_49 = 6'h27 == _T_4[5:0] ? 1'h0 : _GEN_48; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_50 = 6'h28 == _T_4[5:0] ? 1'h0 : _GEN_49; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_51 = 6'h29 == _T_4[5:0] ? 1'h0 : _GEN_50; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_52 = 6'h2a == _T_4[5:0] ? 1'h0 : _GEN_51; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_53 = 6'h2b == _T_4[5:0] ? 1'h0 : _GEN_52; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_54 = 6'h2c == _T_4[5:0] ? 1'h0 : _GEN_53; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_55 = 6'h2d == _T_4[5:0] ? 1'h0 : _GEN_54; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_56 = 6'h2e == _T_4[5:0] ? 1'h0 : _GEN_55; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_57 = 6'h2f == _T_4[5:0] ? 1'h0 : _GEN_56; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_58 = 6'h30 == _T_4[5:0] ? 1'h0 : _GEN_57; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_59 = 6'h31 == _T_4[5:0] ? 1'h0 : _GEN_58; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_60 = 6'h32 == _T_4[5:0] ? 1'h0 : _GEN_59; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_61 = 6'h33 == _T_4[5:0] ? 1'h0 : _GEN_60; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _T_175 = value == 4'h8; // @[Counter.scala 25:24]
  wire [3:0] _T_178 = value + 4'h1; // @[Counter.scala 26:22]
  wire  _GEN_64 = _T_4 == 8'h33 | _T_7; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [7:0] _T_187 = _T_4 + 8'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  wire  _GEN_65 = ~_T_7 ? _GEN_64 : _T_7; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 375:30]
  wire [7:0] _GEN_66 = ~_T_7 ? _T_187 : _T_4; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 384:17 OrderedDecoupledHWIOTester.scala 374:30]
  wire  _GEN_68 = c_io_read_routing_table_request_valid & c_io_read_routing_table_request_ready ? _GEN_65 : _T_7; // @[OrderedDecoupledHWIOTester.scala 287:62 OrderedDecoupledHWIOTester.scala 375:30]
  wire [7:0] _GEN_69 = c_io_read_routing_table_request_valid & c_io_read_routing_table_request_ready ? _GEN_66 : _T_4; // @[OrderedDecoupledHWIOTester.scala 287:62 OrderedDecoupledHWIOTester.scala 374:30]
  reg [4:0] value_1; // @[Counter.scala 17:33]
  wire [3:0] _GEN_71 = 5'h1 == value_1 ? 4'h1 : 4'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_72 = 5'h2 == value_1 ? 4'h2 : _GEN_71; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_73 = 5'h3 == value_1 ? 4'h3 : _GEN_72; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_74 = 5'h4 == value_1 ? 4'h0 : _GEN_73; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_75 = 5'h5 == value_1 ? 4'h1 : _GEN_74; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_76 = 5'h6 == value_1 ? 4'h2 : _GEN_75; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_77 = 5'h7 == value_1 ? 4'h3 : _GEN_76; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_78 = 5'h8 == value_1 ? 4'h4 : _GEN_77; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_79 = 5'h9 == value_1 ? 4'h5 : _GEN_78; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_80 = 5'ha == value_1 ? 4'h6 : _GEN_79; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_81 = 5'hb == value_1 ? 4'h7 : _GEN_80; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_82 = 5'hc == value_1 ? 4'h8 : _GEN_81; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_83 = 5'hd == value_1 ? 4'h9 : _GEN_82; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_84 = 5'he == value_1 ? 4'ha : _GEN_83; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_85 = 5'hf == value_1 ? 4'hb : _GEN_84; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_86 = 5'h10 == value_1 ? 4'hc : _GEN_85; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_87 = 5'h11 == value_1 ? 4'hd : _GEN_86; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_88 = 5'h12 == value_1 ? 4'he : _GEN_87; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_89 = 5'h13 == value_1 ? 4'h0 : _GEN_88; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_90 = 5'h14 == value_1 ? 4'h1 : _GEN_89; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_91 = 5'h15 == value_1 ? 4'h2 : _GEN_90; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_92 = 5'h16 == value_1 ? 4'h3 : _GEN_91; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_93 = 5'h17 == value_1 ? 4'h4 : _GEN_92; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_94 = 5'h18 == value_1 ? 4'h0 : _GEN_93; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_96 = 5'h1 == value_1 ? 31'h3 : 31'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_97 = 5'h2 == value_1 ? 31'h6 : _GEN_96; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_98 = 5'h3 == value_1 ? 31'h9 : _GEN_97; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_99 = 5'h4 == value_1 ? 31'h7dcd07ac : _GEN_98; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_100 = 5'h5 == value_1 ? 31'h70890d84 : _GEN_99; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_101 = 5'h6 == value_1 ? 31'h2f45883 : _GEN_100; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_102 = 5'h7 == value_1 ? 31'h787ada79 : _GEN_101; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_103 = 5'h8 == value_1 ? 31'h16866878 : _GEN_102; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_104 = 5'h9 == value_1 ? 31'h2331b107 : _GEN_103; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_105 = 5'ha == value_1 ? 31'h280e4938 : _GEN_104; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_106 = 5'hb == value_1 ? 31'h107fb3ac : _GEN_105; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_107 = 5'hc == value_1 ? 31'h2f19d47b : _GEN_106; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_108 = 5'hd == value_1 ? 31'h12c3d7cc : _GEN_107; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_109 = 5'he == value_1 ? 31'h5a432a9c : _GEN_108; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_110 = 5'hf == value_1 ? 31'h2f9778f : _GEN_109; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_111 = 5'h10 == value_1 ? 31'h2d705a : _GEN_110; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_112 = 5'h11 == value_1 ? 31'h45fb9184 : _GEN_111; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_113 = 5'h12 == value_1 ? 31'h12e47af : _GEN_112; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_114 = 5'h13 == value_1 ? 31'h7b744e21 : _GEN_113; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_115 = 5'h14 == value_1 ? 31'h480ebc3d : _GEN_114; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_116 = 5'h15 == value_1 ? 31'hd5ff365 : _GEN_115; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_117 = 5'h16 == value_1 ? 31'h205e7973 : _GEN_116; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_118 = 5'h17 == value_1 ? 31'h5004cbd2 : _GEN_117; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [30:0] _GEN_119 = 5'h18 == value_1 ? 31'h0 : _GEN_118; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _GEN_137 = 6'h11 == _T_4[5:0] ? 1'h0 : 6'h10 == _T_4[5:0] | (6'hf == _T_4[5:0] | (6'he == _T_4[5:0] | 6'hd ==
    _T_4[5:0])); // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_138 = 6'h12 == _T_4[5:0] ? 1'h0 : _GEN_137; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_139 = 6'h13 == _T_4[5:0] ? 1'h0 : _GEN_138; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_140 = 6'h14 == _T_4[5:0] ? 1'h0 : _GEN_139; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_141 = 6'h15 == _T_4[5:0] ? 1'h0 : _GEN_140; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_142 = 6'h16 == _T_4[5:0] ? 1'h0 : _GEN_141; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_143 = 6'h17 == _T_4[5:0] ? 1'h0 : _GEN_142; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_144 = 6'h18 == _T_4[5:0] ? 1'h0 : _GEN_143; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_145 = 6'h19 == _T_4[5:0] ? 1'h0 : _GEN_144; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_146 = 6'h1a == _T_4[5:0] ? 1'h0 : _GEN_145; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_147 = 6'h1b == _T_4[5:0] ? 1'h0 : _GEN_146; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_148 = 6'h1c == _T_4[5:0] ? 1'h0 : _GEN_147; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_149 = 6'h1d == _T_4[5:0] ? 1'h0 : _GEN_148; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_150 = 6'h1e == _T_4[5:0] ? 1'h0 : _GEN_149; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_151 = 6'h1f == _T_4[5:0] ? 1'h0 : _GEN_150; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_166 = 6'h2e == _T_4[5:0] | (6'h2d == _T_4[5:0] | (6'h2c == _T_4[5:0] | (6'h2b == _T_4[5:0] | (6'h2a == _T_4
    [5:0] | (6'h29 == _T_4[5:0] | (6'h28 == _T_4[5:0] | (6'h27 == _T_4[5:0] | (6'h26 == _T_4[5:0] | (6'h25 == _T_4[5:0]
     | (6'h24 == _T_4[5:0] | (6'h23 == _T_4[5:0] | (6'h22 == _T_4[5:0] | (6'h21 == _T_4[5:0] | (6'h20 == _T_4[5:0] |
    _GEN_151)))))))))))))); // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _T_417 = value_1 == 5'h17; // @[Counter.scala 25:24]
  wire [4:0] _T_420 = value_1 + 5'h1; // @[Counter.scala 26:22]
  wire  _GEN_174 = _T_4 == 8'h33 | _GEN_68; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23]
  wire  _GEN_175 = ~_T_7 ? _GEN_174 : _GEN_68; // @[OrderedDecoupledHWIOTester.scala 380:28]
  wire [7:0] _GEN_176 = ~_T_7 ? _T_187 : _GEN_69; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 384:17]
  wire  _GEN_178 = c_io_in_valid & c_io_in_ready ? _GEN_175 : _GEN_68; // @[OrderedDecoupledHWIOTester.scala 287:62]
  wire [7:0] _GEN_179 = c_io_in_valid & c_io_in_ready ? _GEN_176 : _GEN_69; // @[OrderedDecoupledHWIOTester.scala 287:62]
  reg [4:0] value_2; // @[Counter.scala 17:33]
  wire [3:0] _GEN_181 = 5'h1 == value_2 ? 4'h1 : 4'h0; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_182 = 5'h2 == value_2 ? 4'h2 : _GEN_181; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_183 = 5'h3 == value_2 ? 4'h3 : _GEN_182; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_184 = 5'h4 == value_2 ? 4'h0 : _GEN_183; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_185 = 5'h5 == value_2 ? 4'h1 : _GEN_184; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_186 = 5'h6 == value_2 ? 4'h2 : _GEN_185; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_187 = 5'h7 == value_2 ? 4'h3 : _GEN_186; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_188 = 5'h8 == value_2 ? 4'h4 : _GEN_187; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_189 = 5'h9 == value_2 ? 4'h5 : _GEN_188; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_190 = 5'ha == value_2 ? 4'h6 : _GEN_189; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_191 = 5'hb == value_2 ? 4'h7 : _GEN_190; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_192 = 5'hc == value_2 ? 4'h8 : _GEN_191; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_193 = 5'hd == value_2 ? 4'h9 : _GEN_192; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_194 = 5'he == value_2 ? 4'ha : _GEN_193; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_195 = 5'hf == value_2 ? 4'hb : _GEN_194; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_196 = 5'h10 == value_2 ? 4'hc : _GEN_195; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_197 = 5'h11 == value_2 ? 4'hd : _GEN_196; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_198 = 5'h12 == value_2 ? 4'he : _GEN_197; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_199 = 5'h13 == value_2 ? 4'h0 : _GEN_198; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_201 = 5'h1 == value_2 ? 2'h2 : 2'h1; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_202 = 5'h2 == value_2 ? 2'h3 : _GEN_201; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_203 = 5'h3 == value_2 ? 2'h0 : _GEN_202; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_204 = 5'h4 == value_2 ? 2'h2 : _GEN_203; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_205 = 5'h5 == value_2 ? 2'h3 : _GEN_204; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_206 = 5'h6 == value_2 ? 2'h0 : _GEN_205; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_207 = 5'h7 == value_2 ? 2'h2 : _GEN_206; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_208 = 5'h8 == value_2 ? 2'h2 : _GEN_207; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_209 = 5'h9 == value_2 ? 2'h1 : _GEN_208; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_210 = 5'ha == value_2 ? 2'h2 : _GEN_209; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_211 = 5'hb == value_2 ? 2'h0 : _GEN_210; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_212 = 5'hc == value_2 ? 2'h2 : _GEN_211; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_213 = 5'hd == value_2 ? 2'h3 : _GEN_212; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_214 = 5'he == value_2 ? 2'h1 : _GEN_213; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_215 = 5'hf == value_2 ? 2'h1 : _GEN_214; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_216 = 5'h10 == value_2 ? 2'h1 : _GEN_215; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_217 = 5'h11 == value_2 ? 2'h2 : _GEN_216; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_218 = 5'h12 == value_2 ? 2'h3 : _GEN_217; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [1:0] _GEN_219 = 5'h13 == value_2 ? 2'h0 : _GEN_218; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _GEN_222 = 6'h2 == _T_4[5:0] ? 1'h0 : 6'h1 == _T_4[5:0]; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_224 = 6'h4 == _T_4[5:0] ? 1'h0 : 6'h3 == _T_4[5:0] | _GEN_222; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_226 = 6'h6 == _T_4[5:0] ? 1'h0 : 6'h5 == _T_4[5:0] | _GEN_224; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_228 = 6'h8 == _T_4[5:0] ? 1'h0 : 6'h7 == _T_4[5:0] | _GEN_226; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_229 = 6'h9 == _T_4[5:0] ? 1'h0 : _GEN_228; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_230 = 6'ha == _T_4[5:0] ? 1'h0 : _GEN_229; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_231 = 6'hb == _T_4[5:0] ? 1'h0 : _GEN_230; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_232 = 6'hc == _T_4[5:0] ? 1'h0 : _GEN_231; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_233 = 6'hd == _T_4[5:0] ? 1'h0 : _GEN_232; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_234 = 6'he == _T_4[5:0] ? 1'h0 : _GEN_233; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_235 = 6'hf == _T_4[5:0] ? 1'h0 : _GEN_234; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_236 = 6'h10 == _T_4[5:0] ? 1'h0 : _GEN_235; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_251 = 6'h1f == _T_4[5:0] | (6'h1e == _T_4[5:0] | (6'h1d == _T_4[5:0] | (6'h1c == _T_4[5:0] | (6'h1b == _T_4
    [5:0] | (6'h1a == _T_4[5:0] | (6'h19 == _T_4[5:0] | (6'h18 == _T_4[5:0] | (6'h17 == _T_4[5:0] | (6'h16 == _T_4[5:0]
     | (6'h15 == _T_4[5:0] | (6'h14 == _T_4[5:0] | (6'h13 == _T_4[5:0] | (6'h12 == _T_4[5:0] | (6'h11 == _T_4[5:0] |
    _GEN_236)))))))))))))); // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_252 = 6'h20 == _T_4[5:0] ? 1'h0 : _GEN_251; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_253 = 6'h21 == _T_4[5:0] ? 1'h0 : _GEN_252; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_254 = 6'h22 == _T_4[5:0] ? 1'h0 : _GEN_253; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_255 = 6'h23 == _T_4[5:0] ? 1'h0 : _GEN_254; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_256 = 6'h24 == _T_4[5:0] ? 1'h0 : _GEN_255; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_257 = 6'h25 == _T_4[5:0] ? 1'h0 : _GEN_256; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_258 = 6'h26 == _T_4[5:0] ? 1'h0 : _GEN_257; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_259 = 6'h27 == _T_4[5:0] ? 1'h0 : _GEN_258; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_260 = 6'h28 == _T_4[5:0] ? 1'h0 : _GEN_259; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_261 = 6'h29 == _T_4[5:0] ? 1'h0 : _GEN_260; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_262 = 6'h2a == _T_4[5:0] ? 1'h0 : _GEN_261; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_263 = 6'h2b == _T_4[5:0] ? 1'h0 : _GEN_262; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_264 = 6'h2c == _T_4[5:0] ? 1'h0 : _GEN_263; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_265 = 6'h2d == _T_4[5:0] ? 1'h0 : _GEN_264; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_266 = 6'h2e == _T_4[5:0] ? 1'h0 : _GEN_265; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_267 = 6'h2f == _T_4[5:0] ? 1'h0 : _GEN_266; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_268 = 6'h30 == _T_4[5:0] ? 1'h0 : _GEN_267; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_269 = 6'h31 == _T_4[5:0] ? 1'h0 : _GEN_268; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_270 = 6'h32 == _T_4[5:0] ? 1'h0 : _GEN_269; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _GEN_271 = 6'h33 == _T_4[5:0] ? 1'h0 : _GEN_270; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  wire  _T_639 = value_2 == 5'h12; // @[Counter.scala 25:24]
  wire [4:0] _T_642 = value_2 + 5'h1; // @[Counter.scala 26:22]
  wire  _GEN_274 = _T_4 == 8'h33 | _GEN_178; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23]
  reg [5:0] value_3; // @[Counter.scala 17:33]
  wire  _GEN_290 = 6'ha == _T_10[5:0] ? 1'h0 : 6'h9 == _T_10[5:0]; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_291 = 6'hb == _T_10[5:0] ? 1'h0 : _GEN_290; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_292 = 6'hc == _T_10[5:0] ? 1'h0 : _GEN_291; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_293 = 6'hd == _T_10[5:0] ? 1'h0 : _GEN_292; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_294 = 6'he == _T_10[5:0] ? 1'h0 : _GEN_293; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_295 = 6'hf == _T_10[5:0] ? 1'h0 : _GEN_294; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_296 = 6'h10 == _T_10[5:0] ? 1'h0 : _GEN_295; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_297 = 6'h11 == _T_10[5:0] ? 1'h0 : _GEN_296; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_299 = 6'h13 == _T_10[5:0] ? 1'h0 : 6'h12 == _T_10[5:0] | _GEN_297; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_300 = 6'h14 == _T_10[5:0] ? 1'h0 : _GEN_299; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_301 = 6'h15 == _T_10[5:0] ? 1'h0 : _GEN_300; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_302 = 6'h16 == _T_10[5:0] ? 1'h0 : _GEN_301; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_306 = 6'h1a == _T_10[5:0] ? 1'h0 : 6'h19 == _T_10[5:0] | (6'h18 == _T_10[5:0] | (6'h17 == _T_10[5:0] |
    _GEN_302)); // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_307 = 6'h1b == _T_10[5:0] ? 1'h0 : _GEN_306; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_308 = 6'h1c == _T_10[5:0] ? 1'h0 : _GEN_307; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_309 = 6'h1d == _T_10[5:0] ? 1'h0 : _GEN_308; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_310 = 6'h1e == _T_10[5:0] ? 1'h0 : _GEN_309; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_311 = 6'h1f == _T_10[5:0] ? 1'h0 : _GEN_310; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_312 = 6'h20 == _T_10[5:0] ? 1'h0 : _GEN_311; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_313 = 6'h21 == _T_10[5:0] ? 1'h0 : _GEN_312; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_314 = 6'h22 == _T_10[5:0] ? 1'h0 : _GEN_313; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_315 = 6'h23 == _T_10[5:0] ? 1'h0 : _GEN_314; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_316 = 6'h24 == _T_10[5:0] ? 1'h0 : _GEN_315; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_317 = 6'h25 == _T_10[5:0] ? 1'h0 : _GEN_316; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_318 = 6'h26 == _T_10[5:0] ? 1'h0 : _GEN_317; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_319 = 6'h27 == _T_10[5:0] ? 1'h0 : _GEN_318; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_320 = 6'h28 == _T_10[5:0] ? 1'h0 : _GEN_319; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_321 = 6'h29 == _T_10[5:0] ? 1'h0 : _GEN_320; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_322 = 6'h2a == _T_10[5:0] ? 1'h0 : _GEN_321; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_323 = 6'h2b == _T_10[5:0] ? 1'h0 : _GEN_322; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_324 = 6'h2c == _T_10[5:0] ? 1'h0 : _GEN_323; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_325 = 6'h2d == _T_10[5:0] ? 1'h0 : _GEN_324; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_326 = 6'h2e == _T_10[5:0] ? 1'h0 : _GEN_325; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_327 = 6'h2f == _T_10[5:0] ? 1'h0 : _GEN_326; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_328 = 6'h30 == _T_10[5:0] ? 1'h0 : _GEN_327; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_329 = 6'h31 == _T_10[5:0] ? 1'h0 : _GEN_328; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_330 = 6'h32 == _T_10[5:0] ? 1'h0 : _GEN_329; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_331 = 6'h33 == _T_10[5:0] ? 1'h0 : _GEN_330; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_784 = c_io_outs_1_ready & c_io_outs_1_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [30:0] _GEN_334 = 3'h1 == value_3[2:0] ? 31'h2331b107 : 31'h0; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_335 = 3'h2 == value_3[2:0] ? 31'h5a432a9c : _GEN_334; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_336 = 3'h3 == value_3[2:0] ? 31'h2f9778f : _GEN_335; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_337 = 3'h4 == value_3[2:0] ? 31'h2d705a : _GEN_336; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_338 = 3'h5 == value_3[2:0] ? 31'h0 : _GEN_337; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [63:0] _GEN_747 = {{33'd0}, _GEN_338}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_791 = c_io_outs_1_bits_body != _GEN_747; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_803 = value_3 == 6'h20; // @[Counter.scala 25:24]
  wire [5:0] _T_806 = value_3 + 6'h1; // @[Counter.scala 26:22]
  wire  _GEN_352 = _T_10 == 8'h20 | _T_13; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [7:0] _T_815 = _T_10 + 8'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  wire  _GEN_353 = ~_T_13 ? _GEN_352 : _T_13; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 375:30]
  wire [7:0] _GEN_354 = ~_T_13 ? _T_815 : _T_10; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 384:17 OrderedDecoupledHWIOTester.scala 374:30]
  wire  _GEN_356 = c_io_outs_1_ready & c_io_outs_1_valid ? _GEN_353 : _T_13; // @[OrderedDecoupledHWIOTester.scala 316:62 OrderedDecoupledHWIOTester.scala 375:30]
  wire [7:0] _GEN_357 = c_io_outs_1_ready & c_io_outs_1_valid ? _GEN_354 : _T_10; // @[OrderedDecoupledHWIOTester.scala 316:62 OrderedDecoupledHWIOTester.scala 374:30]
  reg [5:0] value_4; // @[Counter.scala 17:33]
  wire  _GEN_369 = 6'hb == _T_10[5:0] ? 1'h0 : 6'ha == _T_10[5:0]; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_370 = 6'hc == _T_10[5:0] ? 1'h0 : _GEN_369; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_372 = 6'he == _T_10[5:0] ? 1'h0 : 6'hd == _T_10[5:0] | _GEN_370; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_373 = 6'hf == _T_10[5:0] ? 1'h0 : _GEN_372; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_376 = 6'h12 == _T_10[5:0] ? 1'h0 : 6'h11 == _T_10[5:0] | (6'h10 == _T_10[5:0] | _GEN_373); // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_378 = 6'h14 == _T_10[5:0] ? 1'h0 : 6'h13 == _T_10[5:0] | _GEN_376; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_380 = 6'h16 == _T_10[5:0] ? 1'h0 : 6'h15 == _T_10[5:0] | _GEN_378; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_381 = 6'h17 == _T_10[5:0] ? 1'h0 : _GEN_380; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_382 = 6'h18 == _T_10[5:0] ? 1'h0 : _GEN_381; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_383 = 6'h19 == _T_10[5:0] ? 1'h0 : _GEN_382; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_385 = 6'h1b == _T_10[5:0] ? 1'h0 : 6'h1a == _T_10[5:0] | _GEN_383; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_387 = 6'h1d == _T_10[5:0] ? 1'h0 : 6'h1c == _T_10[5:0] | _GEN_385; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_388 = 6'h1e == _T_10[5:0] ? 1'h0 : _GEN_387; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_391 = 6'h21 == _T_10[5:0] ? 1'h0 : 6'h20 == _T_10[5:0] | (6'h1f == _T_10[5:0] | _GEN_388); // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_392 = 6'h22 == _T_10[5:0] ? 1'h0 : _GEN_391; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_393 = 6'h23 == _T_10[5:0] ? 1'h0 : _GEN_392; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_394 = 6'h24 == _T_10[5:0] ? 1'h0 : _GEN_393; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_395 = 6'h25 == _T_10[5:0] ? 1'h0 : _GEN_394; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_396 = 6'h26 == _T_10[5:0] ? 1'h0 : _GEN_395; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_397 = 6'h27 == _T_10[5:0] ? 1'h0 : _GEN_396; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_398 = 6'h28 == _T_10[5:0] ? 1'h0 : _GEN_397; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_399 = 6'h29 == _T_10[5:0] ? 1'h0 : _GEN_398; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_400 = 6'h2a == _T_10[5:0] ? 1'h0 : _GEN_399; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_401 = 6'h2b == _T_10[5:0] ? 1'h0 : _GEN_400; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_402 = 6'h2c == _T_10[5:0] ? 1'h0 : _GEN_401; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_403 = 6'h2d == _T_10[5:0] ? 1'h0 : _GEN_402; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_404 = 6'h2e == _T_10[5:0] ? 1'h0 : _GEN_403; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_405 = 6'h2f == _T_10[5:0] ? 1'h0 : _GEN_404; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_406 = 6'h30 == _T_10[5:0] ? 1'h0 : _GEN_405; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_407 = 6'h31 == _T_10[5:0] ? 1'h0 : _GEN_406; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_408 = 6'h32 == _T_10[5:0] ? 1'h0 : _GEN_407; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_409 = 6'h33 == _T_10[5:0] ? 1'h0 : _GEN_408; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_958 = c_io_outs_2_ready & c_io_outs_2_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [30:0] _GEN_412 = 4'h1 == value_4[3:0] ? 31'h7dcd07ac : 31'h3; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_413 = 4'h2 == value_4[3:0] ? 31'h787ada79 : _GEN_412; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_414 = 4'h3 == value_4[3:0] ? 31'h16866878 : _GEN_413; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_415 = 4'h4 == value_4[3:0] ? 31'h280e4938 : _GEN_414; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_416 = 4'h5 == value_4[3:0] ? 31'h2f19d47b : _GEN_415; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_417 = 4'h6 == value_4[3:0] ? 31'h45fb9184 : _GEN_416; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_418 = 4'h7 == value_4[3:0] ? 31'h7b744e21 : _GEN_417; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_419 = 4'h8 == value_4[3:0] ? 31'h205e7973 : _GEN_418; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_420 = 4'h9 == value_4[3:0] ? 31'h5004cbd2 : _GEN_419; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_421 = 4'ha == value_4[3:0] ? 31'h0 : _GEN_420; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [63:0] _GEN_757 = {{33'd0}, _GEN_421}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_965 = c_io_outs_2_bits_body != _GEN_757; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_977 = value_4 == 6'h20; // @[Counter.scala 25:24]
  wire [5:0] _T_980 = value_4 + 6'h1; // @[Counter.scala 26:22]
  wire  _GEN_445 = _T_10 == 8'h20 | _GEN_356; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23]
  wire  _GEN_446 = ~_T_13 ? _GEN_445 : _GEN_356; // @[OrderedDecoupledHWIOTester.scala 380:28]
  wire [7:0] _GEN_447 = ~_T_13 ? _T_815 : _GEN_357; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 384:17]
  wire  _GEN_449 = c_io_outs_2_ready & c_io_outs_2_valid ? _GEN_446 : _GEN_356; // @[OrderedDecoupledHWIOTester.scala 316:62]
  wire [7:0] _GEN_450 = c_io_outs_2_ready & c_io_outs_2_valid ? _GEN_447 : _GEN_357; // @[OrderedDecoupledHWIOTester.scala 316:62]
  reg [5:0] value_5; // @[Counter.scala 17:33]
  wire  _GEN_463 = 6'hc == _T_10[5:0] ? 1'h0 : 6'hb == _T_10[5:0]; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_464 = 6'hd == _T_10[5:0] ? 1'h0 : _GEN_463; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_466 = 6'hf == _T_10[5:0] ? 1'h0 : 6'he == _T_10[5:0] | _GEN_464; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_467 = 6'h10 == _T_10[5:0] ? 1'h0 : _GEN_466; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_468 = 6'h11 == _T_10[5:0] ? 1'h0 : _GEN_467; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_469 = 6'h12 == _T_10[5:0] ? 1'h0 : _GEN_468; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_470 = 6'h13 == _T_10[5:0] ? 1'h0 : _GEN_469; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_471 = 6'h14 == _T_10[5:0] ? 1'h0 : _GEN_470; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_472 = 6'h15 == _T_10[5:0] ? 1'h0 : _GEN_471; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_474 = 6'h17 == _T_10[5:0] ? 1'h0 : 6'h16 == _T_10[5:0] | _GEN_472; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_475 = 6'h18 == _T_10[5:0] ? 1'h0 : _GEN_474; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_476 = 6'h19 == _T_10[5:0] ? 1'h0 : _GEN_475; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_477 = 6'h1a == _T_10[5:0] ? 1'h0 : _GEN_476; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_479 = 6'h1c == _T_10[5:0] ? 1'h0 : 6'h1b == _T_10[5:0] | _GEN_477; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_481 = 6'h1e == _T_10[5:0] ? 1'h0 : 6'h1d == _T_10[5:0] | _GEN_479; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_482 = 6'h1f == _T_10[5:0] ? 1'h0 : _GEN_481; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_483 = 6'h20 == _T_10[5:0] ? 1'h0 : _GEN_482; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_484 = 6'h21 == _T_10[5:0] ? 1'h0 : _GEN_483; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_485 = 6'h22 == _T_10[5:0] ? 1'h0 : _GEN_484; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_486 = 6'h23 == _T_10[5:0] ? 1'h0 : _GEN_485; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_487 = 6'h24 == _T_10[5:0] ? 1'h0 : _GEN_486; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_488 = 6'h25 == _T_10[5:0] ? 1'h0 : _GEN_487; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_489 = 6'h26 == _T_10[5:0] ? 1'h0 : _GEN_488; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_490 = 6'h27 == _T_10[5:0] ? 1'h0 : _GEN_489; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_491 = 6'h28 == _T_10[5:0] ? 1'h0 : _GEN_490; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_492 = 6'h29 == _T_10[5:0] ? 1'h0 : _GEN_491; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_493 = 6'h2a == _T_10[5:0] ? 1'h0 : _GEN_492; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_494 = 6'h2b == _T_10[5:0] ? 1'h0 : _GEN_493; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_495 = 6'h2c == _T_10[5:0] ? 1'h0 : _GEN_494; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_496 = 6'h2d == _T_10[5:0] ? 1'h0 : _GEN_495; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_497 = 6'h2e == _T_10[5:0] ? 1'h0 : _GEN_496; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_498 = 6'h2f == _T_10[5:0] ? 1'h0 : _GEN_497; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_499 = 6'h30 == _T_10[5:0] ? 1'h0 : _GEN_498; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_500 = 6'h31 == _T_10[5:0] ? 1'h0 : _GEN_499; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_501 = 6'h32 == _T_10[5:0] ? 1'h0 : _GEN_500; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_502 = 6'h33 == _T_10[5:0] ? 1'h0 : _GEN_501; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_1122 = c_io_outs_3_ready & c_io_outs_3_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [30:0] _GEN_505 = 3'h1 == value_5[2:0] ? 31'h70890d84 : 31'h6; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_506 = 3'h2 == value_5[2:0] ? 31'h12c3d7cc : _GEN_505; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_507 = 3'h3 == value_5[2:0] ? 31'h12e47af : _GEN_506; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_508 = 3'h4 == value_5[2:0] ? 31'h480ebc3d : _GEN_507; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [30:0] _GEN_509 = 3'h5 == value_5[2:0] ? 31'h0 : _GEN_508; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [63:0] _GEN_762 = {{33'd0}, _GEN_509}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_1129 = c_io_outs_3_bits_body != _GEN_762; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_1141 = value_5 == 6'h20; // @[Counter.scala 25:24]
  wire [5:0] _T_1144 = value_5 + 6'h1; // @[Counter.scala 26:22]
  wire  _GEN_523 = _T_10 == 8'h20 | _GEN_449; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23]
  wire  _GEN_524 = ~_T_13 ? _GEN_523 : _GEN_449; // @[OrderedDecoupledHWIOTester.scala 380:28]
  wire [7:0] _GEN_525 = ~_T_13 ? _T_815 : _GEN_450; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 384:17]
  wire  _GEN_527 = c_io_outs_3_ready & c_io_outs_3_valid ? _GEN_524 : _GEN_449; // @[OrderedDecoupledHWIOTester.scala 316:62]
  wire [7:0] _GEN_528 = c_io_outs_3_ready & c_io_outs_3_valid ? _GEN_525 : _GEN_450; // @[OrderedDecoupledHWIOTester.scala 316:62]
  reg [5:0] value_6; // @[Counter.scala 17:33]
  wire  _GEN_542 = 6'hd == _T_10[5:0] ? 1'h0 : 6'hc == _T_10[5:0]; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_543 = 6'he == _T_10[5:0] ? 1'h0 : _GEN_542; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_545 = 6'h10 == _T_10[5:0] ? 1'h0 : 6'hf == _T_10[5:0] | _GEN_543; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_546 = 6'h11 == _T_10[5:0] ? 1'h0 : _GEN_545; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_547 = 6'h12 == _T_10[5:0] ? 1'h0 : _GEN_546; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_548 = 6'h13 == _T_10[5:0] ? 1'h0 : _GEN_547; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_550 = 6'h15 == _T_10[5:0] ? 1'h0 : 6'h14 == _T_10[5:0] | _GEN_548; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_551 = 6'h16 == _T_10[5:0] ? 1'h0 : _GEN_550; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_552 = 6'h17 == _T_10[5:0] ? 1'h0 : _GEN_551; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_553 = 6'h18 == _T_10[5:0] ? 1'h0 : _GEN_552; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_554 = 6'h19 == _T_10[5:0] ? 1'h0 : _GEN_553; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_555 = 6'h1a == _T_10[5:0] ? 1'h0 : _GEN_554; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_556 = 6'h1b == _T_10[5:0] ? 1'h0 : _GEN_555; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_557 = 6'h1c == _T_10[5:0] ? 1'h0 : _GEN_556; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_558 = 6'h1d == _T_10[5:0] ? 1'h0 : _GEN_557; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_560 = 6'h1f == _T_10[5:0] ? 1'h0 : 6'h1e == _T_10[5:0] | _GEN_558; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_561 = 6'h20 == _T_10[5:0] ? 1'h0 : _GEN_560; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_562 = 6'h21 == _T_10[5:0] ? 1'h0 : _GEN_561; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_563 = 6'h22 == _T_10[5:0] ? 1'h0 : _GEN_562; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_564 = 6'h23 == _T_10[5:0] ? 1'h0 : _GEN_563; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_565 = 6'h24 == _T_10[5:0] ? 1'h0 : _GEN_564; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_566 = 6'h25 == _T_10[5:0] ? 1'h0 : _GEN_565; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_567 = 6'h26 == _T_10[5:0] ? 1'h0 : _GEN_566; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_568 = 6'h27 == _T_10[5:0] ? 1'h0 : _GEN_567; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_569 = 6'h28 == _T_10[5:0] ? 1'h0 : _GEN_568; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_570 = 6'h29 == _T_10[5:0] ? 1'h0 : _GEN_569; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_571 = 6'h2a == _T_10[5:0] ? 1'h0 : _GEN_570; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_572 = 6'h2b == _T_10[5:0] ? 1'h0 : _GEN_571; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_573 = 6'h2c == _T_10[5:0] ? 1'h0 : _GEN_572; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_574 = 6'h2d == _T_10[5:0] ? 1'h0 : _GEN_573; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_575 = 6'h2e == _T_10[5:0] ? 1'h0 : _GEN_574; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_576 = 6'h2f == _T_10[5:0] ? 1'h0 : _GEN_575; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_577 = 6'h30 == _T_10[5:0] ? 1'h0 : _GEN_576; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_578 = 6'h31 == _T_10[5:0] ? 1'h0 : _GEN_577; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_579 = 6'h32 == _T_10[5:0] ? 1'h0 : _GEN_578; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_580 = 6'h33 == _T_10[5:0] ? 1'h0 : _GEN_579; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_1284 = c_io_outs_0_ready & c_io_outs_0_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [28:0] _GEN_583 = 3'h1 == value_6[2:0] ? 29'h2f45883 : 29'h9; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [28:0] _GEN_584 = 3'h2 == value_6[2:0] ? 29'h107fb3ac : _GEN_583; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [28:0] _GEN_585 = 3'h3 == value_6[2:0] ? 29'hd5ff365 : _GEN_584; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [28:0] _GEN_586 = 3'h4 == value_6[2:0] ? 29'h0 : _GEN_585; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [63:0] _GEN_766 = {{35'd0}, _GEN_586}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_1291 = c_io_outs_0_bits_body != _GEN_766; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_1303 = value_6 == 6'h20; // @[Counter.scala 25:24]
  wire [5:0] _T_1306 = value_6 + 6'h1; // @[Counter.scala 26:22]
  wire  _GEN_598 = _T_10 == 8'h20 | _GEN_527; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23]
  wire  _GEN_599 = ~_T_13 ? _GEN_598 : _GEN_527; // @[OrderedDecoupledHWIOTester.scala 380:28]
  wire [7:0] _GEN_600 = ~_T_13 ? _T_815 : _GEN_528; // @[OrderedDecoupledHWIOTester.scala 380:28 OrderedDecoupledHWIOTester.scala 384:17]
  wire  _GEN_602 = c_io_outs_0_ready & c_io_outs_0_valid ? _GEN_599 : _GEN_527; // @[OrderedDecoupledHWIOTester.scala 316:62]
  wire [7:0] _GEN_603 = c_io_outs_0_ready & c_io_outs_0_valid ? _GEN_600 : _GEN_528; // @[OrderedDecoupledHWIOTester.scala 316:62]
  reg [5:0] value_7; // @[Counter.scala 17:33]
  wire  _GEN_613 = 6'h9 == _T_10[5:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_614 = 6'ha == _T_10[5:0] ? 1'h0 : _GEN_613; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_615 = 6'hb == _T_10[5:0] ? 1'h0 : _GEN_614; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_616 = 6'hc == _T_10[5:0] ? 1'h0 : _GEN_615; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_617 = 6'hd == _T_10[5:0] ? 1'h0 : _GEN_616; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_618 = 6'he == _T_10[5:0] ? 1'h0 : _GEN_617; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_619 = 6'hf == _T_10[5:0] ? 1'h0 : _GEN_618; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_620 = 6'h10 == _T_10[5:0] ? 1'h0 : _GEN_619; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_621 = 6'h11 == _T_10[5:0] ? 1'h0 : _GEN_620; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_622 = 6'h12 == _T_10[5:0] ? 1'h0 : _GEN_621; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_623 = 6'h13 == _T_10[5:0] ? 1'h0 : _GEN_622; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_624 = 6'h14 == _T_10[5:0] ? 1'h0 : _GEN_623; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_625 = 6'h15 == _T_10[5:0] ? 1'h0 : _GEN_624; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_626 = 6'h16 == _T_10[5:0] ? 1'h0 : _GEN_625; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_627 = 6'h17 == _T_10[5:0] ? 1'h0 : _GEN_626; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_628 = 6'h18 == _T_10[5:0] ? 1'h0 : _GEN_627; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_629 = 6'h19 == _T_10[5:0] ? 1'h0 : _GEN_628; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_630 = 6'h1a == _T_10[5:0] ? 1'h0 : _GEN_629; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_631 = 6'h1b == _T_10[5:0] ? 1'h0 : _GEN_630; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_632 = 6'h1c == _T_10[5:0] ? 1'h0 : _GEN_631; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_633 = 6'h1d == _T_10[5:0] ? 1'h0 : _GEN_632; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_634 = 6'h1e == _T_10[5:0] ? 1'h0 : _GEN_633; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_635 = 6'h1f == _T_10[5:0] ? 1'h0 : _GEN_634; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_636 = 6'h20 == _T_10[5:0] ? 1'h0 : _GEN_635; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_637 = 6'h21 == _T_10[5:0] ? 1'h0 : _GEN_636; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_638 = 6'h22 == _T_10[5:0] ? 1'h0 : _GEN_637; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_639 = 6'h23 == _T_10[5:0] ? 1'h0 : _GEN_638; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_640 = 6'h24 == _T_10[5:0] ? 1'h0 : _GEN_639; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_641 = 6'h25 == _T_10[5:0] ? 1'h0 : _GEN_640; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_642 = 6'h26 == _T_10[5:0] ? 1'h0 : _GEN_641; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_643 = 6'h27 == _T_10[5:0] ? 1'h0 : _GEN_642; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_644 = 6'h28 == _T_10[5:0] ? 1'h0 : _GEN_643; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_645 = 6'h29 == _T_10[5:0] ? 1'h0 : _GEN_644; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_646 = 6'h2a == _T_10[5:0] ? 1'h0 : _GEN_645; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_647 = 6'h2b == _T_10[5:0] ? 1'h0 : _GEN_646; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_648 = 6'h2c == _T_10[5:0] ? 1'h0 : _GEN_647; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_649 = 6'h2d == _T_10[5:0] ? 1'h0 : _GEN_648; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_650 = 6'h2e == _T_10[5:0] ? 1'h0 : _GEN_649; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_651 = 6'h2f == _T_10[5:0] ? 1'h0 : _GEN_650; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_652 = 6'h30 == _T_10[5:0] ? 1'h0 : _GEN_651; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_653 = 6'h31 == _T_10[5:0] ? 1'h0 : _GEN_652; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_654 = 6'h32 == _T_10[5:0] ? 1'h0 : _GEN_653; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _GEN_655 = 6'h33 == _T_10[5:0] ? 1'h0 : _GEN_654; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  wire  _T_1456 = c_io_read_routing_table_response_ready & c_io_read_routing_table_response_valid; // @[OrderedDecoupledHWIOTester.scala 316:35]
  wire [1:0] _GEN_658 = 4'h1 == value_7[3:0] ? 2'h1 : 2'h0; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_659 = 4'h2 == value_7[3:0] ? 2'h2 : _GEN_658; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_660 = 4'h3 == value_7[3:0] ? 2'h3 : _GEN_659; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_661 = 4'h4 == value_7[3:0] ? 2'h0 : _GEN_660; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_662 = 4'h5 == value_7[3:0] ? 2'h0 : _GEN_661; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_663 = 4'h6 == value_7[3:0] ? 2'h3 : _GEN_662; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_664 = 4'h7 == value_7[3:0] ? 2'h2 : _GEN_663; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_665 = 4'h8 == value_7[3:0] ? 2'h1 : _GEN_664; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [1:0] _GEN_666 = 4'h9 == value_7[3:0] ? 2'h0 : _GEN_665; // @[OrderedDecoupledHWIOTester.scala 318:17 OrderedDecoupledHWIOTester.scala 318:17]
  wire [31:0] _GEN_767 = {{30'd0}, _GEN_666}; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_1463 = c_io_read_routing_table_response_bits != _GEN_767; // @[OrderedDecoupledHWIOTester.scala 321:40]
  wire  _T_1475 = value_7 == 6'h20; // @[Counter.scala 25:24]
  wire [5:0] _T_1478 = value_7 + 6'h1; // @[Counter.scala 26:22]
  wire  _GEN_688 = _T_10 == 8'h20 | _GEN_602; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23]
  wire  _GEN_773 = _T_784 & _T_791; // @[OrderedDecoupledHWIOTester.scala 322:19]
  wire  _GEN_777 = _T_958 & _T_965; // @[OrderedDecoupledHWIOTester.scala 322:19]
  wire  _GEN_781 = _T_1122 & _T_1129; // @[OrderedDecoupledHWIOTester.scala 322:19]
  wire  _GEN_785 = _T_1284 & _T_1291; // @[OrderedDecoupledHWIOTester.scala 322:19]
  wire  _GEN_789 = _T_1456 & _T_1463; // @[OrderedDecoupledHWIOTester.scala 322:19]
  Router c ( // @[Router.scala 86:33]
    .clock(c_clock),
    .reset(c_reset),
    .io_read_routing_table_request_ready(c_io_read_routing_table_request_ready),
    .io_read_routing_table_request_valid(c_io_read_routing_table_request_valid),
    .io_read_routing_table_request_bits_addr(c_io_read_routing_table_request_bits_addr),
    .io_read_routing_table_response_ready(c_io_read_routing_table_response_ready),
    .io_read_routing_table_response_valid(c_io_read_routing_table_response_valid),
    .io_read_routing_table_response_bits(c_io_read_routing_table_response_bits),
    .io_load_routing_table_request_ready(c_io_load_routing_table_request_ready),
    .io_load_routing_table_request_valid(c_io_load_routing_table_request_valid),
    .io_load_routing_table_request_bits_addr(c_io_load_routing_table_request_bits_addr),
    .io_load_routing_table_request_bits_data(c_io_load_routing_table_request_bits_data),
    .io_in_ready(c_io_in_ready),
    .io_in_valid(c_io_in_valid),
    .io_in_bits_header(c_io_in_bits_header),
    .io_in_bits_body(c_io_in_bits_body),
    .io_outs_0_ready(c_io_outs_0_ready),
    .io_outs_0_valid(c_io_outs_0_valid),
    .io_outs_0_bits_body(c_io_outs_0_bits_body),
    .io_outs_1_ready(c_io_outs_1_ready),
    .io_outs_1_valid(c_io_outs_1_valid),
    .io_outs_1_bits_body(c_io_outs_1_bits_body),
    .io_outs_2_ready(c_io_outs_2_ready),
    .io_outs_2_valid(c_io_outs_2_valid),
    .io_outs_2_bits_body(c_io_outs_2_bits_body),
    .io_outs_3_ready(c_io_outs_3_ready),
    .io_outs_3_valid(c_io_outs_3_valid),
    .io_outs_3_bits_body(c_io_outs_3_bits_body)
  );
  assign c_clock = clock;
  assign c_reset = reset;
  assign c_io_read_routing_table_request_valid = 6'h34 == _T_4[5:0] ? 1'h0 : _GEN_61; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign c_io_read_routing_table_request_bits_addr = {{30'd0}, _GEN_9}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign c_io_read_routing_table_response_ready = 6'h34 == _T_10[5:0] ? 1'h0 : _GEN_655; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  assign c_io_load_routing_table_request_valid = 6'h34 == _T_4[5:0] ? 1'h0 : _GEN_271; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign c_io_load_routing_table_request_bits_addr = {{28'd0}, _GEN_199}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign c_io_load_routing_table_request_bits_data = {{30'd0}, _GEN_219}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign c_io_in_valid = 6'h34 == _T_4[5:0] ? 1'h0 : 6'h33 == _T_4[5:0] | (6'h32 == _T_4[5:0] | (6'h31 == _T_4[5:0] | (6'h30
     == _T_4[5:0] | (6'h2f == _T_4[5:0] | _GEN_166)))); // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign c_io_in_bits_header = {{4'd0}, _GEN_94}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign c_io_in_bits_body = {{33'd0}, _GEN_119}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign c_io_outs_0_ready = 6'h34 == _T_10[5:0] ? 1'h0 : _GEN_580; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  assign c_io_outs_1_ready = 6'h34 == _T_10[5:0] ? 1'h0 : _GEN_331; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  assign c_io_outs_2_ready = 6'h34 == _T_10[5:0] ? 1'h0 : _GEN_409; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  assign c_io_outs_3_ready = 6'h34 == _T_10[5:0] ? 1'h0 : _GEN_502; // @[OrderedDecoupledHWIOTester.scala 314:30 OrderedDecoupledHWIOTester.scala 314:30]
  always @(posedge clock) begin
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_4 <= 8'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (c_io_load_routing_table_request_valid & c_io_load_routing_table_request_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_4 <= _T_187; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end else begin
        _T_4 <= _GEN_179;
      end
    end else begin
      _T_4 <= _GEN_179;
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_7 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (c_io_load_routing_table_request_valid & c_io_load_routing_table_request_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_7 <= _GEN_274;
      end else begin
        _T_7 <= _GEN_178;
      end
    end else begin
      _T_7 <= _GEN_178;
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_10 <= 8'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (c_io_read_routing_table_response_ready & c_io_read_routing_table_response_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_10 <= _T_815; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end else begin
        _T_10 <= _GEN_603;
      end
    end else begin
      _T_10 <= _GEN_603;
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_13 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (c_io_read_routing_table_response_ready & c_io_read_routing_table_response_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_13 <= _GEN_688;
      end else begin
        _T_13 <= _GEN_602;
      end
    end else begin
      _T_13 <= _GEN_602;
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 407:21]
      _T_21 <= 14'h0; // @[OrderedDecoupledHWIOTester.scala 407:21]
    end else begin
      _T_21 <= _T_24; // @[OrderedDecoupledHWIOTester.scala 408:8]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (c_io_read_routing_table_request_valid & c_io_read_routing_table_request_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_175) begin // @[Counter.scala 28:21]
        value <= 4'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_178; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_1 <= 5'h0; // @[Counter.scala 17:33]
    end else if (c_io_in_valid & c_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_417) begin // @[Counter.scala 28:21]
        value_1 <= 5'h0; // @[Counter.scala 28:29]
      end else begin
        value_1 <= _T_420; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_2 <= 5'h0; // @[Counter.scala 17:33]
    end else if (c_io_load_routing_table_request_valid & c_io_load_routing_table_request_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_639) begin // @[Counter.scala 28:21]
        value_2 <= 5'h0; // @[Counter.scala 28:29]
      end else begin
        value_2 <= _T_642; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_3 <= 6'h0; // @[Counter.scala 17:33]
    end else if (c_io_outs_1_ready & c_io_outs_1_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_803) begin // @[Counter.scala 28:21]
        value_3 <= 6'h0; // @[Counter.scala 28:29]
      end else begin
        value_3 <= _T_806; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_4 <= 6'h0; // @[Counter.scala 17:33]
    end else if (c_io_outs_2_ready & c_io_outs_2_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_977) begin // @[Counter.scala 28:21]
        value_4 <= 6'h0; // @[Counter.scala 28:29]
      end else begin
        value_4 <= _T_980; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_5 <= 6'h0; // @[Counter.scala 17:33]
    end else if (c_io_outs_3_ready & c_io_outs_3_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_1141) begin // @[Counter.scala 28:21]
        value_5 <= 6'h0; // @[Counter.scala 28:29]
      end else begin
        value_5 <= _T_1144; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_6 <= 6'h0; // @[Counter.scala 17:33]
    end else if (c_io_outs_0_ready & c_io_outs_0_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_1303) begin // @[Counter.scala 28:21]
        value_6 <= 6'h0; // @[Counter.scala 28:29]
      end else begin
        value_6 <= _T_1306; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_7 <= 6'h0; // @[Counter.scala 17:33]
    end else if (c_io_read_routing_table_response_ready & c_io_read_routing_table_response_valid) begin // @[OrderedDecoupledHWIOTester.scala 316:62]
      if (_T_1475) begin // @[Counter.scala 28:21]
        value_7 <= 6'h0; // @[Counter.scala 28:29]
      end else begin
        value_7 <= _T_1478; // @[Counter.scala 26:13]
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
        if (_T_784 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing outs(1).bits.body = %d, should be %d\n",_T_10,
            c_io_outs_1_bits_body,3'h5 == value_3[2:0] ? 31'h0 : _GEN_337); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_784 & _T_791 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d outs(1).bits.body was %d should be %d\n",_T_10,c_io_outs_1_bits_body,
            _GEN_338); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_773 & _T_16) begin
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
        if (_GEN_773 & _T_16) begin
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
        if (_GEN_773 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 325:17]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_958 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing outs(2).bits.body = %d, should be %d\n",_T_10,
            c_io_outs_2_bits_body,4'ha == value_4[3:0] ? 31'h0 : _GEN_420); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_958 & _T_965 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d outs(2).bits.body was %d should be %d\n",_T_10,c_io_outs_2_bits_body,
            _GEN_421); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_777 & _T_16) begin
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
        if (_GEN_777 & _T_16) begin
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
        if (_GEN_777 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 325:17]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1122 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing outs(3).bits.body = %d, should be %d\n",_T_10,
            c_io_outs_3_bits_body,3'h5 == value_5[2:0] ? 31'h0 : _GEN_508); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1122 & _T_1129 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d outs(3).bits.body was %d should be %d\n",_T_10,c_io_outs_3_bits_body,
            _GEN_509); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_781 & _T_16) begin
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
        if (_GEN_781 & _T_16) begin
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
        if (_GEN_781 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 325:17]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1284 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing outs(0).bits.body = %d, should be %d\n",_T_10,
            c_io_outs_0_bits_body,3'h4 == value_6[2:0] ? 29'h0 : _GEN_585); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1284 & _T_1291 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d outs(0).bits.body was %d should be %d\n",_T_10,c_io_outs_0_bits_body,
            _GEN_586); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_785 & _T_16) begin
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
        if (_GEN_785 & _T_16) begin
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
        if (_GEN_785 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 325:17]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1456 & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing read_routing_table_response.bits = %d, should be %d\n",
            _T_10,c_io_read_routing_table_response_bits,4'h9 == value_7[3:0] ? 2'h0 : _GEN_665); // @[OrderedDecoupledHWIOTester.scala 318:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1456 & _T_1463 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d read_routing_table_response.bits was %d should be %d\n",_T_10,
            c_io_read_routing_table_response_bits,_GEN_666); // @[OrderedDecoupledHWIOTester.scala 322:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_789 & _T_16) begin
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
        if (_GEN_789 & _T_16) begin
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
        if (_GEN_789 & _T_16) begin
          $finish; // @[OrderedDecoupledHWIOTester.scala 325:17]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_16) begin
          $fwrite(32'h80000002,"in_event_counter %d, out_event_counter %d\n",_T_4,_T_10); // @[HWIOTester.scala 30:55]
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
  _T_4 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  _T_7 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_10 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  _T_13 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_21 = _RAND_4[13:0];
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  value_2 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  value_3 = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  value_4 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  value_5 = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  value_6 = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  value_7 = _RAND_12[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
