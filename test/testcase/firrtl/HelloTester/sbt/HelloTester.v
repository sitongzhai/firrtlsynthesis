module HelloTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  value; // @[Counter.scala 17:33]
  reg  _T_6; // @[SteppedHWIOTester.scala 177:33]
  wire  _T_8 = ~_T_6; // @[SteppedHWIOTester.scala 179:10]
  wire [7:0] _GEN_3 = value ? 8'h2a : 8'h0; // @[SteppedHWIOTester.scala 145:31 SteppedHWIOTester.scala 145:31]
  wire  _T_37 = ~(8'h2a == _GEN_3); // @[SteppedHWIOTester.scala 145:72]
  wire  _T_40 = ~reset; // @[SteppedHWIOTester.scala 151:15]
  wire  _GEN_4 = value | _T_6; // @[SteppedHWIOTester.scala 183:22 SteppedHWIOTester.scala 185:14 SteppedHWIOTester.scala 177:33]
  wire  _GEN_7 = _T_8 & value; // @[SteppedHWIOTester.scala 151:15]
  wire  _GEN_8 = _T_8 & value & _T_37; // @[SteppedHWIOTester.scala 151:15]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 1'h0; // @[Counter.scala 17:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      value <= value + 1'h1; // @[Counter.scala 26:13]
    end
    if (reset) begin // @[SteppedHWIOTester.scala 177:33]
      _T_6 <= 1'h0; // @[SteppedHWIOTester.scala 177:33]
    end else if (~_T_6) begin // @[SteppedHWIOTester.scala 179:17]
      _T_6 <= _GEN_4;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & value & _T_37 & ~reset) begin
          $fwrite(32'h80000002,"    failed on step %d -- port out:  %d expected %d\n",value,8'h2a,_GEN_3); // @[SteppedHWIOTester.scala 151:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_8 & _T_40) begin
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
        if (_GEN_8 & _T_40) begin
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
        if (_GEN_8 & _T_40) begin
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
        if (_GEN_7 & _T_40) begin
          $fwrite(32'h80000002,"Stopping, end of tests, 2 steps\n"); // @[SteppedHWIOTester.scala 184:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_7 & _T_40) begin
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
  value = _RAND_0[0:0];
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
