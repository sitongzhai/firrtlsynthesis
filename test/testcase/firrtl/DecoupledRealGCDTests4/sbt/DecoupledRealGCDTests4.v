module RealGCD(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_a,
  input  [15:0] io_in_bits_b,
  output        io_out_valid,
  output [15:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[RealGCD.scala 37:14]
  reg [15:0] y; // @[RealGCD.scala 38:14]
  reg  p; // @[RealGCD.scala 39:18]
  reg [15:0] ti; // @[RealGCD.scala 41:19]
  wire [15:0] _T_21 = ti + 16'h1; // @[RealGCD.scala 42:12]
  wire  _T_23 = ~p; // @[RealGCD.scala 44:18]
  wire [15:0] _GEN_0 = io_in_valid & _T_23 ? io_in_bits_a : x; // @[RealGCD.scala 46:28 RealGCD.scala 47:7 RealGCD.scala 37:14]
  wire [15:0] _GEN_1 = io_in_valid & _T_23 ? io_in_bits_b : y; // @[RealGCD.scala 46:28 RealGCD.scala 48:7 RealGCD.scala 38:14]
  wire  _GEN_2 = io_in_valid & _T_23 | p; // @[RealGCD.scala 46:28 RealGCD.scala 49:7 RealGCD.scala 39:18]
  wire  _T_30 = ~(x > y); // @[RealGCD.scala 53:19]
  wire [15:0] _T_33 = y - x; // @[RealGCD.scala 54:30]
  assign io_in_ready = ~p; // @[RealGCD.scala 44:18]
  assign io_out_valid = y == 16'h0 & p; // @[RealGCD.scala 62:29]
  assign io_out_bits = x; // @[RealGCD.scala 61:16]
  always @(posedge clock) begin
    if (p) begin // @[RealGCD.scala 52:12]
      if (x > y) begin // @[RealGCD.scala 53:19]
        x <= y; // @[RealGCD.scala 53:23]
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (p) begin // @[RealGCD.scala 52:12]
      if (_T_30) begin // @[RealGCD.scala 54:21]
        y <= _T_33; // @[RealGCD.scala 54:25]
      end else if (x > y) begin // @[RealGCD.scala 53:19]
        y <= x; // @[RealGCD.scala 53:31]
      end else begin
        y <= _GEN_1;
      end
    end else begin
      y <= _GEN_1;
    end
    if (reset) begin // @[RealGCD.scala 39:18]
      p <= 1'h0; // @[RealGCD.scala 39:18]
    end else if (io_out_valid) begin // @[RealGCD.scala 63:23]
      p <= 1'h0; // @[RealGCD.scala 64:7]
    end else begin
      p <= _GEN_2;
    end
    if (reset) begin // @[RealGCD.scala 41:19]
      ti <= 16'h0; // @[RealGCD.scala 41:19]
    end else begin
      ti <= _T_21; // @[RealGCD.scala 42:6]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,
            "ti %d  x %d y %d  in_ready %d  in_valid %d  out %d  out_ready %d  out_valid %d==============\n",ti,x,y,
            io_in_ready,io_in_valid,io_out_bits,1'h0,io_out_valid); // @[RealGCD.scala 57:9]
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
  x = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  p = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ti = _RAND_3[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DecoupledRealGCDTests4(
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
  wire  c_clock; // @[RealGCD.scala 140:33]
  wire  c_reset; // @[RealGCD.scala 140:33]
  wire  c_io_in_ready; // @[RealGCD.scala 140:33]
  wire  c_io_in_valid; // @[RealGCD.scala 140:33]
  wire [15:0] c_io_in_bits_a; // @[RealGCD.scala 140:33]
  wire [15:0] c_io_in_bits_b; // @[RealGCD.scala 140:33]
  wire  c_io_out_valid; // @[RealGCD.scala 140:33]
  wire [15:0] c_io_out_bits; // @[RealGCD.scala 140:33]
  reg [8:0] _T_4; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_7; // @[OrderedDecoupledHWIOTester.scala 375:30]
  reg [8:0] _T_10; // @[OrderedDecoupledHWIOTester.scala 374:30]
  reg  _T_13; // @[OrderedDecoupledHWIOTester.scala 375:30]
  wire  _T_14 = _T_7 & _T_13; // @[OrderedDecoupledHWIOTester.scala 402:42]
  wire  _T_16 = ~reset; // @[OrderedDecoupledHWIOTester.scala 403:13]
  reg [11:0] _T_21; // @[OrderedDecoupledHWIOTester.scala 407:21]
  wire [11:0] _T_24 = _T_21 + 12'h1; // @[OrderedDecoupledHWIOTester.scala 408:14]
  wire  _T_26 = _T_21 > 12'hfa0; // @[OrderedDecoupledHWIOTester.scala 409:13]
  reg [6:0] value; // @[Counter.scala 17:33]
  wire [3:0] _GEN_10 = 7'ha == value ? 4'h2 : 4'h1; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_11 = 7'hb == value ? 4'h2 : _GEN_10; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_12 = 7'hc == value ? 4'h2 : _GEN_11; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_13 = 7'hd == value ? 4'h2 : _GEN_12; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_14 = 7'he == value ? 4'h2 : _GEN_13; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_15 = 7'hf == value ? 4'h2 : _GEN_14; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_16 = 7'h10 == value ? 4'h2 : _GEN_15; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_17 = 7'h11 == value ? 4'h2 : _GEN_16; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_18 = 7'h12 == value ? 4'h2 : _GEN_17; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_19 = 7'h13 == value ? 4'h2 : _GEN_18; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_20 = 7'h14 == value ? 4'h3 : _GEN_19; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_21 = 7'h15 == value ? 4'h3 : _GEN_20; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_22 = 7'h16 == value ? 4'h3 : _GEN_21; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_23 = 7'h17 == value ? 4'h3 : _GEN_22; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_24 = 7'h18 == value ? 4'h3 : _GEN_23; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_25 = 7'h19 == value ? 4'h3 : _GEN_24; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_26 = 7'h1a == value ? 4'h3 : _GEN_25; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_27 = 7'h1b == value ? 4'h3 : _GEN_26; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_28 = 7'h1c == value ? 4'h3 : _GEN_27; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_29 = 7'h1d == value ? 4'h3 : _GEN_28; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_30 = 7'h1e == value ? 4'h4 : _GEN_29; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_31 = 7'h1f == value ? 4'h4 : _GEN_30; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_32 = 7'h20 == value ? 4'h4 : _GEN_31; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_33 = 7'h21 == value ? 4'h4 : _GEN_32; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_34 = 7'h22 == value ? 4'h4 : _GEN_33; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_35 = 7'h23 == value ? 4'h4 : _GEN_34; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_36 = 7'h24 == value ? 4'h4 : _GEN_35; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_37 = 7'h25 == value ? 4'h4 : _GEN_36; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_38 = 7'h26 == value ? 4'h4 : _GEN_37; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_39 = 7'h27 == value ? 4'h4 : _GEN_38; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_40 = 7'h28 == value ? 4'h5 : _GEN_39; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_41 = 7'h29 == value ? 4'h5 : _GEN_40; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_42 = 7'h2a == value ? 4'h5 : _GEN_41; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_43 = 7'h2b == value ? 4'h5 : _GEN_42; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_44 = 7'h2c == value ? 4'h5 : _GEN_43; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_45 = 7'h2d == value ? 4'h5 : _GEN_44; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_46 = 7'h2e == value ? 4'h5 : _GEN_45; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_47 = 7'h2f == value ? 4'h5 : _GEN_46; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_48 = 7'h30 == value ? 4'h5 : _GEN_47; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_49 = 7'h31 == value ? 4'h5 : _GEN_48; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_50 = 7'h32 == value ? 4'h6 : _GEN_49; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_51 = 7'h33 == value ? 4'h6 : _GEN_50; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_52 = 7'h34 == value ? 4'h6 : _GEN_51; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_53 = 7'h35 == value ? 4'h6 : _GEN_52; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_54 = 7'h36 == value ? 4'h6 : _GEN_53; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_55 = 7'h37 == value ? 4'h6 : _GEN_54; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_56 = 7'h38 == value ? 4'h6 : _GEN_55; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_57 = 7'h39 == value ? 4'h6 : _GEN_56; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_58 = 7'h3a == value ? 4'h6 : _GEN_57; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_59 = 7'h3b == value ? 4'h6 : _GEN_58; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_60 = 7'h3c == value ? 4'h7 : _GEN_59; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_61 = 7'h3d == value ? 4'h7 : _GEN_60; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_62 = 7'h3e == value ? 4'h7 : _GEN_61; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_63 = 7'h3f == value ? 4'h7 : _GEN_62; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_64 = 7'h40 == value ? 4'h7 : _GEN_63; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_65 = 7'h41 == value ? 4'h7 : _GEN_64; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_66 = 7'h42 == value ? 4'h7 : _GEN_65; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_67 = 7'h43 == value ? 4'h7 : _GEN_66; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_68 = 7'h44 == value ? 4'h7 : _GEN_67; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_69 = 7'h45 == value ? 4'h7 : _GEN_68; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_70 = 7'h46 == value ? 4'h8 : _GEN_69; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_71 = 7'h47 == value ? 4'h8 : _GEN_70; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_72 = 7'h48 == value ? 4'h8 : _GEN_71; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_73 = 7'h49 == value ? 4'h8 : _GEN_72; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_74 = 7'h4a == value ? 4'h8 : _GEN_73; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_75 = 7'h4b == value ? 4'h8 : _GEN_74; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_76 = 7'h4c == value ? 4'h8 : _GEN_75; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_77 = 7'h4d == value ? 4'h8 : _GEN_76; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_78 = 7'h4e == value ? 4'h8 : _GEN_77; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_79 = 7'h4f == value ? 4'h8 : _GEN_78; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_80 = 7'h50 == value ? 4'h9 : _GEN_79; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_81 = 7'h51 == value ? 4'h9 : _GEN_80; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_82 = 7'h52 == value ? 4'h9 : _GEN_81; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_83 = 7'h53 == value ? 4'h9 : _GEN_82; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_84 = 7'h54 == value ? 4'h9 : _GEN_83; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_85 = 7'h55 == value ? 4'h9 : _GEN_84; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_86 = 7'h56 == value ? 4'h9 : _GEN_85; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_87 = 7'h57 == value ? 4'h9 : _GEN_86; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_88 = 7'h58 == value ? 4'h9 : _GEN_87; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_89 = 7'h59 == value ? 4'h9 : _GEN_88; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_90 = 7'h5a == value ? 4'ha : _GEN_89; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_91 = 7'h5b == value ? 4'ha : _GEN_90; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_92 = 7'h5c == value ? 4'ha : _GEN_91; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_93 = 7'h5d == value ? 4'ha : _GEN_92; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_94 = 7'h5e == value ? 4'ha : _GEN_93; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_95 = 7'h5f == value ? 4'ha : _GEN_94; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_96 = 7'h60 == value ? 4'ha : _GEN_95; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_97 = 7'h61 == value ? 4'ha : _GEN_96; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_98 = 7'h62 == value ? 4'ha : _GEN_97; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_99 = 7'h63 == value ? 4'ha : _GEN_98; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_100 = 7'h64 == value ? 4'h0 : _GEN_99; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_102 = 7'h1 == value ? 4'h2 : 4'h1; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_103 = 7'h2 == value ? 4'h3 : _GEN_102; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_104 = 7'h3 == value ? 4'h4 : _GEN_103; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_105 = 7'h4 == value ? 4'h5 : _GEN_104; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_106 = 7'h5 == value ? 4'h6 : _GEN_105; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_107 = 7'h6 == value ? 4'h7 : _GEN_106; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_108 = 7'h7 == value ? 4'h8 : _GEN_107; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_109 = 7'h8 == value ? 4'h9 : _GEN_108; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_110 = 7'h9 == value ? 4'ha : _GEN_109; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_111 = 7'ha == value ? 4'h1 : _GEN_110; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_112 = 7'hb == value ? 4'h2 : _GEN_111; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_113 = 7'hc == value ? 4'h3 : _GEN_112; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_114 = 7'hd == value ? 4'h4 : _GEN_113; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_115 = 7'he == value ? 4'h5 : _GEN_114; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_116 = 7'hf == value ? 4'h6 : _GEN_115; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_117 = 7'h10 == value ? 4'h7 : _GEN_116; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_118 = 7'h11 == value ? 4'h8 : _GEN_117; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_119 = 7'h12 == value ? 4'h9 : _GEN_118; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_120 = 7'h13 == value ? 4'ha : _GEN_119; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_121 = 7'h14 == value ? 4'h1 : _GEN_120; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_122 = 7'h15 == value ? 4'h2 : _GEN_121; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_123 = 7'h16 == value ? 4'h3 : _GEN_122; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_124 = 7'h17 == value ? 4'h4 : _GEN_123; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_125 = 7'h18 == value ? 4'h5 : _GEN_124; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_126 = 7'h19 == value ? 4'h6 : _GEN_125; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_127 = 7'h1a == value ? 4'h7 : _GEN_126; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_128 = 7'h1b == value ? 4'h8 : _GEN_127; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_129 = 7'h1c == value ? 4'h9 : _GEN_128; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_130 = 7'h1d == value ? 4'ha : _GEN_129; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_131 = 7'h1e == value ? 4'h1 : _GEN_130; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_132 = 7'h1f == value ? 4'h2 : _GEN_131; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_133 = 7'h20 == value ? 4'h3 : _GEN_132; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_134 = 7'h21 == value ? 4'h4 : _GEN_133; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_135 = 7'h22 == value ? 4'h5 : _GEN_134; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_136 = 7'h23 == value ? 4'h6 : _GEN_135; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_137 = 7'h24 == value ? 4'h7 : _GEN_136; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_138 = 7'h25 == value ? 4'h8 : _GEN_137; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_139 = 7'h26 == value ? 4'h9 : _GEN_138; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_140 = 7'h27 == value ? 4'ha : _GEN_139; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_141 = 7'h28 == value ? 4'h1 : _GEN_140; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_142 = 7'h29 == value ? 4'h2 : _GEN_141; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_143 = 7'h2a == value ? 4'h3 : _GEN_142; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_144 = 7'h2b == value ? 4'h4 : _GEN_143; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_145 = 7'h2c == value ? 4'h5 : _GEN_144; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_146 = 7'h2d == value ? 4'h6 : _GEN_145; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_147 = 7'h2e == value ? 4'h7 : _GEN_146; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_148 = 7'h2f == value ? 4'h8 : _GEN_147; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_149 = 7'h30 == value ? 4'h9 : _GEN_148; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_150 = 7'h31 == value ? 4'ha : _GEN_149; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_151 = 7'h32 == value ? 4'h1 : _GEN_150; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_152 = 7'h33 == value ? 4'h2 : _GEN_151; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_153 = 7'h34 == value ? 4'h3 : _GEN_152; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_154 = 7'h35 == value ? 4'h4 : _GEN_153; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_155 = 7'h36 == value ? 4'h5 : _GEN_154; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_156 = 7'h37 == value ? 4'h6 : _GEN_155; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_157 = 7'h38 == value ? 4'h7 : _GEN_156; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_158 = 7'h39 == value ? 4'h8 : _GEN_157; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_159 = 7'h3a == value ? 4'h9 : _GEN_158; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_160 = 7'h3b == value ? 4'ha : _GEN_159; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_161 = 7'h3c == value ? 4'h1 : _GEN_160; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_162 = 7'h3d == value ? 4'h2 : _GEN_161; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_163 = 7'h3e == value ? 4'h3 : _GEN_162; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_164 = 7'h3f == value ? 4'h4 : _GEN_163; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_165 = 7'h40 == value ? 4'h5 : _GEN_164; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_166 = 7'h41 == value ? 4'h6 : _GEN_165; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_167 = 7'h42 == value ? 4'h7 : _GEN_166; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_168 = 7'h43 == value ? 4'h8 : _GEN_167; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_169 = 7'h44 == value ? 4'h9 : _GEN_168; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_170 = 7'h45 == value ? 4'ha : _GEN_169; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_171 = 7'h46 == value ? 4'h1 : _GEN_170; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_172 = 7'h47 == value ? 4'h2 : _GEN_171; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_173 = 7'h48 == value ? 4'h3 : _GEN_172; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_174 = 7'h49 == value ? 4'h4 : _GEN_173; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_175 = 7'h4a == value ? 4'h5 : _GEN_174; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_176 = 7'h4b == value ? 4'h6 : _GEN_175; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_177 = 7'h4c == value ? 4'h7 : _GEN_176; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_178 = 7'h4d == value ? 4'h8 : _GEN_177; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_179 = 7'h4e == value ? 4'h9 : _GEN_178; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_180 = 7'h4f == value ? 4'ha : _GEN_179; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_181 = 7'h50 == value ? 4'h1 : _GEN_180; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_182 = 7'h51 == value ? 4'h2 : _GEN_181; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_183 = 7'h52 == value ? 4'h3 : _GEN_182; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_184 = 7'h53 == value ? 4'h4 : _GEN_183; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_185 = 7'h54 == value ? 4'h5 : _GEN_184; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_186 = 7'h55 == value ? 4'h6 : _GEN_185; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_187 = 7'h56 == value ? 4'h7 : _GEN_186; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_188 = 7'h57 == value ? 4'h8 : _GEN_187; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_189 = 7'h58 == value ? 4'h9 : _GEN_188; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_190 = 7'h59 == value ? 4'ha : _GEN_189; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_191 = 7'h5a == value ? 4'h1 : _GEN_190; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_192 = 7'h5b == value ? 4'h2 : _GEN_191; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_193 = 7'h5c == value ? 4'h3 : _GEN_192; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_194 = 7'h5d == value ? 4'h4 : _GEN_193; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_195 = 7'h5e == value ? 4'h5 : _GEN_194; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_196 = 7'h5f == value ? 4'h6 : _GEN_195; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_197 = 7'h60 == value ? 4'h7 : _GEN_196; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_198 = 7'h61 == value ? 4'h8 : _GEN_197; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_199 = 7'h62 == value ? 4'h9 : _GEN_198; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_200 = 7'h63 == value ? 4'ha : _GEN_199; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire [3:0] _GEN_201 = 7'h64 == value ? 4'h0 : _GEN_200; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  wire  _T_661 = value == 7'h63; // @[Counter.scala 25:24]
  wire [6:0] _T_664 = value + 7'h1; // @[Counter.scala 26:22]
  wire  _GEN_304 = _T_4 == 9'h63 | _T_7; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [8:0] _T_673 = _T_4 + 9'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  reg [6:0] value_1; // @[Counter.scala 17:33]
  wire  _GEN_410 = 7'h64 == _T_10[6:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 354:50 OrderedDecoupledHWIOTester.scala 354:50]
  wire [3:0] _GEN_422 = 7'hb == value_1 ? 4'h2 : 4'h1; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_423 = 7'hc == value_1 ? 4'h1 : _GEN_422; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_424 = 7'hd == value_1 ? 4'h2 : _GEN_423; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_425 = 7'he == value_1 ? 4'h1 : _GEN_424; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_426 = 7'hf == value_1 ? 4'h2 : _GEN_425; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_427 = 7'h10 == value_1 ? 4'h1 : _GEN_426; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_428 = 7'h11 == value_1 ? 4'h2 : _GEN_427; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_429 = 7'h12 == value_1 ? 4'h1 : _GEN_428; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_430 = 7'h13 == value_1 ? 4'h2 : _GEN_429; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_431 = 7'h14 == value_1 ? 4'h1 : _GEN_430; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_432 = 7'h15 == value_1 ? 4'h1 : _GEN_431; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_433 = 7'h16 == value_1 ? 4'h3 : _GEN_432; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_434 = 7'h17 == value_1 ? 4'h1 : _GEN_433; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_435 = 7'h18 == value_1 ? 4'h1 : _GEN_434; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_436 = 7'h19 == value_1 ? 4'h3 : _GEN_435; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_437 = 7'h1a == value_1 ? 4'h1 : _GEN_436; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_438 = 7'h1b == value_1 ? 4'h1 : _GEN_437; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_439 = 7'h1c == value_1 ? 4'h3 : _GEN_438; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_440 = 7'h1d == value_1 ? 4'h1 : _GEN_439; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_441 = 7'h1e == value_1 ? 4'h1 : _GEN_440; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_442 = 7'h1f == value_1 ? 4'h2 : _GEN_441; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_443 = 7'h20 == value_1 ? 4'h1 : _GEN_442; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_444 = 7'h21 == value_1 ? 4'h4 : _GEN_443; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_445 = 7'h22 == value_1 ? 4'h1 : _GEN_444; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_446 = 7'h23 == value_1 ? 4'h2 : _GEN_445; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_447 = 7'h24 == value_1 ? 4'h1 : _GEN_446; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_448 = 7'h25 == value_1 ? 4'h4 : _GEN_447; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_449 = 7'h26 == value_1 ? 4'h1 : _GEN_448; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_450 = 7'h27 == value_1 ? 4'h2 : _GEN_449; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_451 = 7'h28 == value_1 ? 4'h1 : _GEN_450; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_452 = 7'h29 == value_1 ? 4'h1 : _GEN_451; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_453 = 7'h2a == value_1 ? 4'h1 : _GEN_452; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_454 = 7'h2b == value_1 ? 4'h1 : _GEN_453; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_455 = 7'h2c == value_1 ? 4'h5 : _GEN_454; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_456 = 7'h2d == value_1 ? 4'h1 : _GEN_455; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_457 = 7'h2e == value_1 ? 4'h1 : _GEN_456; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_458 = 7'h2f == value_1 ? 4'h1 : _GEN_457; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_459 = 7'h30 == value_1 ? 4'h1 : _GEN_458; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_460 = 7'h31 == value_1 ? 4'h5 : _GEN_459; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_461 = 7'h32 == value_1 ? 4'h1 : _GEN_460; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_462 = 7'h33 == value_1 ? 4'h2 : _GEN_461; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_463 = 7'h34 == value_1 ? 4'h3 : _GEN_462; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_464 = 7'h35 == value_1 ? 4'h2 : _GEN_463; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_465 = 7'h36 == value_1 ? 4'h1 : _GEN_464; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_466 = 7'h37 == value_1 ? 4'h6 : _GEN_465; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_467 = 7'h38 == value_1 ? 4'h1 : _GEN_466; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_468 = 7'h39 == value_1 ? 4'h2 : _GEN_467; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_469 = 7'h3a == value_1 ? 4'h3 : _GEN_468; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_470 = 7'h3b == value_1 ? 4'h2 : _GEN_469; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_471 = 7'h3c == value_1 ? 4'h1 : _GEN_470; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_472 = 7'h3d == value_1 ? 4'h1 : _GEN_471; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_473 = 7'h3e == value_1 ? 4'h1 : _GEN_472; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_474 = 7'h3f == value_1 ? 4'h1 : _GEN_473; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_475 = 7'h40 == value_1 ? 4'h1 : _GEN_474; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_476 = 7'h41 == value_1 ? 4'h1 : _GEN_475; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_477 = 7'h42 == value_1 ? 4'h7 : _GEN_476; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_478 = 7'h43 == value_1 ? 4'h1 : _GEN_477; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_479 = 7'h44 == value_1 ? 4'h1 : _GEN_478; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_480 = 7'h45 == value_1 ? 4'h1 : _GEN_479; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_481 = 7'h46 == value_1 ? 4'h1 : _GEN_480; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_482 = 7'h47 == value_1 ? 4'h2 : _GEN_481; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_483 = 7'h48 == value_1 ? 4'h1 : _GEN_482; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_484 = 7'h49 == value_1 ? 4'h4 : _GEN_483; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_485 = 7'h4a == value_1 ? 4'h1 : _GEN_484; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_486 = 7'h4b == value_1 ? 4'h2 : _GEN_485; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_487 = 7'h4c == value_1 ? 4'h1 : _GEN_486; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_488 = 7'h4d == value_1 ? 4'h8 : _GEN_487; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_489 = 7'h4e == value_1 ? 4'h1 : _GEN_488; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_490 = 7'h4f == value_1 ? 4'h2 : _GEN_489; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_491 = 7'h50 == value_1 ? 4'h1 : _GEN_490; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_492 = 7'h51 == value_1 ? 4'h1 : _GEN_491; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_493 = 7'h52 == value_1 ? 4'h3 : _GEN_492; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_494 = 7'h53 == value_1 ? 4'h1 : _GEN_493; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_495 = 7'h54 == value_1 ? 4'h1 : _GEN_494; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_496 = 7'h55 == value_1 ? 4'h3 : _GEN_495; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_497 = 7'h56 == value_1 ? 4'h1 : _GEN_496; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_498 = 7'h57 == value_1 ? 4'h1 : _GEN_497; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_499 = 7'h58 == value_1 ? 4'h9 : _GEN_498; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_500 = 7'h59 == value_1 ? 4'h1 : _GEN_499; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_501 = 7'h5a == value_1 ? 4'h1 : _GEN_500; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_502 = 7'h5b == value_1 ? 4'h2 : _GEN_501; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_503 = 7'h5c == value_1 ? 4'h1 : _GEN_502; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_504 = 7'h5d == value_1 ? 4'h2 : _GEN_503; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_505 = 7'h5e == value_1 ? 4'h5 : _GEN_504; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_506 = 7'h5f == value_1 ? 4'h2 : _GEN_505; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_507 = 7'h60 == value_1 ? 4'h1 : _GEN_506; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_508 = 7'h61 == value_1 ? 4'h2 : _GEN_507; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_509 = 7'h62 == value_1 ? 4'h1 : _GEN_508; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_510 = 7'h63 == value_1 ? 4'ha : _GEN_509; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [3:0] _GEN_511 = 7'h64 == value_1 ? 4'h0 : _GEN_510; // @[OrderedDecoupledHWIOTester.scala 357:19 OrderedDecoupledHWIOTester.scala 357:19]
  wire [15:0] _GEN_522 = {{12'd0}, _GEN_511}; // @[OrderedDecoupledHWIOTester.scala 360:42]
  wire  _T_1096 = c_io_out_bits != _GEN_522; // @[OrderedDecoupledHWIOTester.scala 360:42]
  wire  _T_1105 = value_1 == 7'h63; // @[Counter.scala 25:24]
  wire [6:0] _T_1108 = value_1 + 7'h1; // @[Counter.scala 26:22]
  wire  _GEN_513 = _T_10 == 9'h63 | _T_13; // @[OrderedDecoupledHWIOTester.scala 381:48 OrderedDecoupledHWIOTester.scala 382:23 OrderedDecoupledHWIOTester.scala 375:30]
  wire [8:0] _T_1117 = _T_10 + 9'h1; // @[OrderedDecoupledHWIOTester.scala 384:28]
  wire  _GEN_525 = _GEN_410 & c_io_out_valid; // @[OrderedDecoupledHWIOTester.scala 357:19]
  wire  _GEN_527 = _GEN_525 & _T_1096; // @[OrderedDecoupledHWIOTester.scala 361:21]
  RealGCD c ( // @[RealGCD.scala 140:33]
    .clock(c_clock),
    .reset(c_reset),
    .io_in_ready(c_io_in_ready),
    .io_in_valid(c_io_in_valid),
    .io_in_bits_a(c_io_in_bits_a),
    .io_in_bits_b(c_io_in_bits_b),
    .io_out_valid(c_io_out_valid),
    .io_out_bits(c_io_out_bits)
  );
  assign c_clock = clock;
  assign c_reset = reset;
  assign c_io_in_valid = 7'h64 == _T_4[6:0] ? 1'h0 : 1'h1; // @[OrderedDecoupledHWIOTester.scala 285:30 OrderedDecoupledHWIOTester.scala 285:30]
  assign c_io_in_bits_a = {{12'd0}, _GEN_100}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  assign c_io_in_bits_b = {{12'd0}, _GEN_201}; // @[OrderedDecoupledHWIOTester.scala 283:14 OrderedDecoupledHWIOTester.scala 283:14]
  always @(posedge clock) begin
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_4 <= 9'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (c_io_in_valid & c_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_4 <= _T_673; // @[OrderedDecoupledHWIOTester.scala 384:17]
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_7 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (c_io_in_valid & c_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (~_T_7) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
        _T_7 <= _GEN_304;
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 374:30]
      _T_10 <= 9'h0; // @[OrderedDecoupledHWIOTester.scala 374:30]
    end else if (_GEN_410) begin // @[OrderedDecoupledHWIOTester.scala 354:50]
      if (c_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 355:38]
        if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
          _T_10 <= _T_1117; // @[OrderedDecoupledHWIOTester.scala 384:17]
        end
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 375:30]
      _T_13 <= 1'h0; // @[OrderedDecoupledHWIOTester.scala 375:30]
    end else if (_GEN_410) begin // @[OrderedDecoupledHWIOTester.scala 354:50]
      if (c_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 355:38]
        if (~_T_13) begin // @[OrderedDecoupledHWIOTester.scala 380:28]
          _T_13 <= _GEN_513;
        end
      end
    end
    if (reset) begin // @[OrderedDecoupledHWIOTester.scala 407:21]
      _T_21 <= 12'h0; // @[OrderedDecoupledHWIOTester.scala 407:21]
    end else begin
      _T_21 <= _T_24; // @[OrderedDecoupledHWIOTester.scala 408:8]
    end
    if (reset) begin // @[Counter.scala 17:33]
      value <= 7'h0; // @[Counter.scala 17:33]
    end else if (c_io_in_valid & c_io_in_ready) begin // @[OrderedDecoupledHWIOTester.scala 287:62]
      if (_T_661) begin // @[Counter.scala 28:21]
        value <= 7'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_664; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[Counter.scala 17:33]
      value_1 <= 7'h0; // @[Counter.scala 17:33]
    end else if (_GEN_410) begin // @[OrderedDecoupledHWIOTester.scala 354:50]
      if (c_io_out_valid) begin // @[OrderedDecoupledHWIOTester.scala 355:38]
        if (_T_1105) begin // @[Counter.scala 28:21]
          value_1 <= 7'h0; // @[Counter.scala 28:29]
        end else begin
          value_1 <= _T_1108; // @[Counter.scala 26:13]
        end
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
        if (_GEN_410 & c_io_out_valid & _T_16) begin
          $fwrite(32'h80000002,"output test event %d testing out.bits = %d, should be %d",_T_10,c_io_out_bits,7'h64 ==
            value_1 ? 4'h0 : _GEN_510); // @[OrderedDecoupledHWIOTester.scala 357:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_525 & _T_1096 & _T_16) begin
          $fwrite(32'h80000002,"Error: event %d out.bits was %x should be %x",_T_10,c_io_out_bits,_GEN_511); // @[OrderedDecoupledHWIOTester.scala 361:21]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_527 & _T_16) begin
          $fwrite(32'h80000002,"Assertion failed\n    at OrderedDecoupledHWIOTester.scala:363 assert(false.B)\n"); // @[OrderedDecoupledHWIOTester.scala 363:21]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_527 & _T_16) begin
          $fatal; // @[OrderedDecoupledHWIOTester.scala 363:21]
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
  _T_10 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  _T_13 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_21 = _RAND_4[11:0];
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
