module ClockDividerTest(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  cDiv; // @[MultiClockSpec.scala 12:21]
  reg [7:0] reg1; // @[MultiClockSpec.scala 16:21]
  wire [7:0] _T_10 = reg1 + 8'h1; // @[MultiClockSpec.scala 17:16]
  reg [7:0] reg2; // @[MultiClockSpec.scala 18:41]
  wire [7:0] _T_15 = reg2 + 8'h1; // @[MultiClockSpec.scala 19:16]
  wire  _T_17 = reg1 < 8'ha; // @[MultiClockSpec.scala 21:14]
  wire [7:0] _T_19 = reg1 / 2'h2; // @[MultiClockSpec.scala 22:26]
  wire  _T_26 = reg1 == 8'ha; // @[MultiClockSpec.scala 25:14]
  always @(posedge clock) begin
    cDiv <= reset | ~cDiv; // @[MultiClockSpec.scala 12:21 MultiClockSpec.scala 12:21 MultiClockSpec.scala 13:8]
    if (reset) begin // @[MultiClockSpec.scala 16:21]
      reg1 <= 8'h0; // @[MultiClockSpec.scala 16:21]
    end else begin
      reg1 <= _T_10; // @[MultiClockSpec.scala 17:8]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_17 & ~(reg2 == _T_19 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at MultiClockSpec.scala:22 assert(reg2 === reg1 / 2.U) // 1:2 clock relationship\n"); // @[MultiClockSpec.scala 22:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_17 & ~(reg2 == _T_19 | reset)) begin
          $fatal; // @[MultiClockSpec.scala 22:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_26 & ~reset) begin
          $finish; // @[MultiClockSpec.scala 26:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge cDiv) begin
    if (reset) begin // @[MultiClockSpec.scala 18:41]
      reg2 <= 8'h0; // @[MultiClockSpec.scala 18:41]
    end else begin
      reg2 <= _T_15; // @[MultiClockSpec.scala 19:8]
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
  cDiv = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  reg2 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
