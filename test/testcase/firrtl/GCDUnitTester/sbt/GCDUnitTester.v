module GCD(
  input         clock,
  input         io_e,
  output [15:0] io_z,
  output        io_v
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[GCDUnitTest.scala 18:15]
  reg [15:0] y; // @[GCDUnitTest.scala 19:15]
  wire  _T_9 = x > y; // @[GCDUnitTest.scala 20:13]
  wire [15:0] _T_12 = x - y; // @[GCDUnitTest.scala 20:27]
  wire [15:0] _T_18 = y - x; // @[GCDUnitTest.scala 21:27]
  assign io_z = x; // @[GCDUnitTest.scala 23:8]
  assign io_v = y == 16'h0; // @[GCDUnitTest.scala 24:13]
  always @(posedge clock) begin
    if (io_e) begin // @[GCDUnitTest.scala 22:15]
      x <= 16'h40; // @[GCDUnitTest.scala 22:19]
    end else if (x > y) begin // @[GCDUnitTest.scala 20:18]
      x <= _T_12; // @[GCDUnitTest.scala 20:22]
    end
    if (io_e) begin // @[GCDUnitTest.scala 22:15]
      y <= 16'h30; // @[GCDUnitTest.scala 22:30]
    end else if (~_T_9) begin // @[Conditional.scala 19:15]
      y <= _T_18; // @[GCDUnitTest.scala 21:22]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GCDUnitTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  device_under_test_clock; // @[GCDUnitTest.scala 45:33]
  wire  device_under_test_io_e; // @[GCDUnitTest.scala 45:33]
  wire [15:0] device_under_test_io_z; // @[GCDUnitTest.scala 45:33]
  wire  device_under_test_io_v; // @[GCDUnitTest.scala 45:33]
  reg [2:0] value; // @[Counter.scala 17:33]
  reg  _T_6; // @[SteppedHWIOTester.scala 177:33]
  wire  _T_8 = ~_T_6; // @[SteppedHWIOTester.scala 179:10]
  wire  _GEN_13 = 3'h1 == value ? 1'h0 : 1'h1; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire  _GEN_14 = 3'h2 == value ? 1'h0 : _GEN_13; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire  _GEN_15 = 3'h3 == value ? 1'h0 : _GEN_14; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire  _GEN_16 = 3'h4 == value ? 1'h0 : _GEN_15; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  wire  _GEN_23 = 3'h5 == value; // @[SteppedHWIOTester.scala 144:51 SteppedHWIOTester.scala 144:51]
  wire [15:0] _GEN_29 = 3'h5 == value ? 16'h10 : 16'h0; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire  _T_119 = ~(device_under_test_io_z == _GEN_29); // @[SteppedHWIOTester.scala 145:72]
  wire  _T_122 = ~reset; // @[SteppedHWIOTester.scala 151:15]
  wire  _T_185 = ~(device_under_test_io_v == _GEN_23); // @[SteppedHWIOTester.scala 145:72]
  wire  _T_196 = value == 3'h5; // @[Counter.scala 25:24]
  wire [2:0] _T_199 = value + 3'h1; // @[Counter.scala 26:22]
  wire  _GEN_43 = _T_196 | _T_6; // @[SteppedHWIOTester.scala 183:22 SteppedHWIOTester.scala 185:14 SteppedHWIOTester.scala 177:33]
  wire  _GEN_50 = _T_8 & _GEN_23 & _T_119; // @[SteppedHWIOTester.scala 151:15]
  wire  _GEN_58 = _T_8 & _GEN_23 & _T_185; // @[SteppedHWIOTester.scala 151:15]
  wire  _GEN_65 = _T_8 & _T_196; // @[SteppedHWIOTester.scala 184:15]
  GCD device_under_test ( // @[GCDUnitTest.scala 45:33]
    .clock(device_under_test_clock),
    .io_e(device_under_test_io_e),
    .io_z(device_under_test_io_z),
    .io_v(device_under_test_io_v)
  );
  assign device_under_test_clock = clock;
  assign device_under_test_io_e = 3'h5 == value ? 1'h0 : _GEN_16; // @[SteppedHWIOTester.scala 129:16 SteppedHWIOTester.scala 129:16]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 3'h0; // @[Counter.scala 17:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      if (_T_196) begin // @[Counter.scala 28:21]
        value <= 3'h0; // @[Counter.scala 28:29]
      end else begin
        value <= _T_199; // @[Counter.scala 26:13]
      end
    end
    if (reset) begin // @[SteppedHWIOTester.scala 177:33]
      _T_6 <= 1'h0; // @[SteppedHWIOTester.scala 177:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      _T_6 <= _GEN_43;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & _GEN_23 & _T_119 & ~reset) begin
          $fwrite(32'h80000002,"    failed on step %d -- port z:  %d expected %d\n",value,device_under_test_io_z,_GEN_29
            ); // @[SteppedHWIOTester.scala 151:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_50 & _T_122) begin
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
        if (_GEN_50 & _T_122) begin
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
        if (_GEN_50 & _T_122) begin
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
        if (_T_8 & _GEN_23 & _T_185 & ~reset) begin
          $fwrite(32'h80000002,"    failed on step %d -- port v:  %d expected %d\n",value,device_under_test_io_v,_GEN_23
            ); // @[SteppedHWIOTester.scala 151:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_58 & _T_122) begin
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
        if (_GEN_58 & _T_122) begin
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
        if (_GEN_58 & _T_122) begin
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
        if (_T_8 & _T_196 & _T_122) begin
          $fwrite(32'h80000002,"Stopping, end of tests, 6 steps\n"); // @[SteppedHWIOTester.scala 184:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_122) begin
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
  value = _RAND_0[2:0];
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
