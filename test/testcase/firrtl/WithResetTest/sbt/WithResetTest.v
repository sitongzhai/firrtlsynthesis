module WithResetTest(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] value; // @[Counter.scala 17:33]
  wire  _T_21 = value < 4'h7; // @[MultiClockSpec.scala 62:15]
  wire  _T_28 = value == 4'h7; // @[MultiClockSpec.scala 64:22]
  wire  reset2 = value < 4'h7 ? 1'h0 : _T_28; // @[MultiClockSpec.scala 62:22]
  reg [7:0] reg_; // @[MultiClockSpec.scala 58:56]
  wire [7:0] _T_10 = reg_ + 8'h1; // @[MultiClockSpec.scala 59:14]
  wire  done = value == 4'h9; // @[Counter.scala 25:24]
  wire [3:0] _T_18 = value + 4'h1; // @[Counter.scala 26:22]
  wire [7:0] _GEN_4 = {{4'd0}, value}; // @[MultiClockSpec.scala 63:16]
  wire  _T_31 = value == 4'h8; // @[MultiClockSpec.scala 66:22]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (done) begin // @[Counter.scala 28:21]
      value <= 4'h0; // @[Counter.scala 28:29]
    end else begin
      value <= _T_18; // @[Counter.scala 26:13]
    end
    if (reset2 | reset) begin // @[MultiClockSpec.scala 58:56]
      reg_ <= 8'h0; // @[MultiClockSpec.scala 58:56]
    end else begin
      reg_ <= _T_10; // @[MultiClockSpec.scala 59:7]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_21 & ~(reg_ == _GEN_4 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at MultiClockSpec.scala:63 assert(reg_ === cycle)\n"); // @[MultiClockSpec.scala 63:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_21 & ~(reg_ == _GEN_4 | reset)) begin
          $fatal; // @[MultiClockSpec.scala 63:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T_21 & ~_T_28 & _T_31 & ~(reg_ == 8'h0 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at MultiClockSpec.scala:67 assert(reg_ === 0.U)\n"); // @[MultiClockSpec.scala 67:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_21 & ~_T_28 & _T_31 & ~(reg_ == 8'h0 | reset)) begin
          $fatal; // @[MultiClockSpec.scala 67:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (done & ~reset) begin
          $finish; // @[MultiClockSpec.scala 69:21]
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
  reg_ = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
