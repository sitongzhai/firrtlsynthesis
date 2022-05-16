module Adder(
  input  [9:0] io_in0,
  input  [9:0] io_in1,
  output [9:0] io_out
);
  assign io_out = io_in0 + io_in1; // @[Adder.scala 17:20]
endmodule
module AdderTests(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [9:0] c_io_in0; // @[Adder.scala 21:33]
  wire [9:0] c_io_in1; // @[Adder.scala 21:33]
  wire [9:0] c_io_out; // @[Adder.scala 21:33]
  reg [3:0] value; // @[Counter.scala 17:33]
  reg  _T_6; // @[SteppedHWIOTester.scala 177:33]
  wire  _T_8 = ~_T_6; // @[SteppedHWIOTester.scala 179:10]
  wire [9:0] _GEN_1 = 4'h1 == value ? 10'h26c : 10'h353; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_2 = 4'h2 == value ? 10'h13c : _GEN_1; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_3 = 4'h3 == value ? 10'h77 : _GEN_2; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_4 = 4'h4 == value ? 10'h320 : _GEN_3; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_5 = 4'h5 == value ? 10'h102 : _GEN_4; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_6 = 4'h6 == value ? 10'h273 : _GEN_5; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_7 = 4'h7 == value ? 10'h3ee : _GEN_6; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_8 = 4'h8 == value ? 10'h17 : _GEN_7; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_9 = 4'h9 == value ? 10'hb4 : _GEN_8; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_12 = 4'h1 == value ? 10'hf6 : 10'h2ec; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_13 = 4'h2 == value ? 10'h28c : _GEN_12; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_14 = 4'h3 == value ? 10'h233 : _GEN_13; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_15 = 4'h4 == value ? 10'h263 : _GEN_14; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_16 = 4'h5 == value ? 10'h155 : _GEN_15; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_17 = 4'h6 == value ? 10'h18a : _GEN_16; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_18 = 4'h7 == value ? 10'h3f0 : _GEN_17; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_19 = 4'h8 == value ? 10'h384 : _GEN_18; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire [9:0] _GEN_20 = 4'h9 == value ? 10'h3c3 : _GEN_19; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire  _GEN_32 = 4'ha == value ? 1'h0 : 1'h1; // @[SteppedHWIOTester.scala 144:51 SteppedHWIOTester.scala 144:51]
  wire [9:0] _GEN_34 = 4'h1 == value ? 10'h362 : 10'h23f; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_35 = 4'h2 == value ? 10'h3c8 : _GEN_34; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_36 = 4'h3 == value ? 10'h2aa : _GEN_35; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_37 = 4'h4 == value ? 10'h183 : _GEN_36; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_38 = 4'h5 == value ? 10'h257 : _GEN_37; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_39 = 4'h6 == value ? 10'h3fd : _GEN_38; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_40 = 4'h7 == value ? 10'h3de : _GEN_39; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_41 = 4'h8 == value ? 10'h39b : _GEN_40; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_42 = 4'h9 == value ? 10'h77 : _GEN_41; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire [9:0] _GEN_43 = 4'ha == value ? 10'h0 : _GEN_42; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire  _T_154 = c_io_out == _GEN_43; // @[SteppedHWIOTester.scala 145:31]
  wire  _T_156 = ~reset; // @[HWIOTester.scala 30:55]
  wire  _T_158 = ~(c_io_out == _GEN_43); // @[SteppedHWIOTester.scala 145:72]
  wire  _T_169 = value == 4'ha; // @[Counter.scala 25:24]
  wire [3:0] _T_172 = value + 4'h1; // @[Counter.scala 26:22]
  wire  _GEN_45 = _T_169 | _T_6; // @[SteppedHWIOTester.scala 183:22 SteppedHWIOTester.scala 185:14 SteppedHWIOTester.scala 177:33]
  wire  _GEN_50 = _T_8 & _GEN_32; // @[HWIOTester.scala 30:55]
  wire  _GEN_53 = _GEN_50 & _T_158; // @[SteppedHWIOTester.scala 151:15]
  wire  _GEN_60 = _T_8 & _T_169; // @[SteppedHWIOTester.scala 184:15]
  Adder c ( // @[Adder.scala 21:33]
    .io_in0(c_io_in0),
    .io_in1(c_io_in1),
    .io_out(c_io_out)
  );
  assign c_io_in0 = 4'ha == value ? 10'h3c3 : _GEN_20; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  assign c_io_in1 = 4'ha == value ? 10'hb4 : _GEN_9; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      if (_T_169) begin // @[Counter.scala 28:21]
        value <= 4'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_172; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[SteppedHWIOTester.scala 177:33]
      _T_6 <= 1'h0; // @[SteppedHWIOTester.scala 177:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      _T_6 <= _GEN_45;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & _GEN_32 & _T_154 & ~reset) begin
          $fwrite(32'h80000002,"    passed step %d -- out:  %d\n",value,c_io_out); // @[HWIOTester.scala 30:55]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_50 & _T_158 & _T_156) begin
          $fwrite(32'h80000002,"    failed on step %d -- port out:  %d expected %d\n",value,c_io_out,_GEN_43); // @[SteppedHWIOTester.scala 151:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_156) begin
          $fwrite(32'h80000002,"Assertion failed\n    at SteppedHWIOTester.scala:158 assert(false.B)\n"); // @[SteppedHWIOTester.scala 158:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_156) begin
          $fatal; // @[SteppedHWIOTester.scala 158:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_156) begin
          $finish; // @[SteppedHWIOTester.scala 159:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & _T_169 & _T_156) begin
          $fwrite(32'h80000002,"Stopping, end of tests, 11 steps\n"); // @[SteppedHWIOTester.scala 184:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_60 & _T_156) begin
          $finish; // @[SteppedHWIOTester.scala 186:13]
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
  value = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  _T_6 = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
