module MultiClockSubModuleTestSubModule(
  input        clock,
  input        reset,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] value; // @[Counter.scala 17:33]
  wire  _T_7 = value == 4'h9; // @[Counter.scala 25:24]
  wire [3:0] _T_10 = value + 4'h1; // @[Counter.scala 26:22]
  assign io_out = value; // @[MultiClockSpec.scala 36:12]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (_T_7) begin // @[Counter.scala 28:21]
      value <= 4'h0; // @[Counter.scala 28:29]
    end else begin
      value <= _T_10; // @[Counter.scala 26:13]
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
  value = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultiClockSubModuleTest(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  inst_clock; // @[MultiClockSpec.scala 46:64]
  wire  inst_reset; // @[MultiClockSpec.scala 46:64]
  wire [3:0] inst_io_out; // @[MultiClockSpec.scala 46:64]
  reg [3:0] value; // @[Counter.scala 17:33]
  wire  done = value == 4'h9; // @[Counter.scala 25:24]
  wire [3:0] _T_9 = value + 4'h1; // @[Counter.scala 26:22]
  reg  cDiv; // @[MultiClockSpec.scala 40:21]
  MultiClockSubModuleTestSubModule inst ( // @[MultiClockSpec.scala 46:64]
    .clock(inst_clock),
    .reset(inst_reset),
    .io_out(inst_io_out)
  );
  assign inst_clock = cDiv; // @[MultiClockSpec.scala 43:25]
  assign inst_reset = value < 4'h3; // @[MultiClockSpec.scala 44:26]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (done) begin // @[Counter.scala 28:21]
      value <= 4'h0; // @[Counter.scala 28:29]
    end else begin
      value <= _T_9; // @[Counter.scala 26:13]
    end
    cDiv <= reset | ~cDiv; // @[MultiClockSpec.scala 40:21 MultiClockSpec.scala 40:21 MultiClockSpec.scala 41:8]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (done & ~(inst_io_out == 4'h3 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at MultiClockSpec.scala:50 assert(inst.io.out === 3.U)\n"); // @[MultiClockSpec.scala 50:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (done & ~(inst_io_out == 4'h3 | reset)) begin
          $fatal; // @[MultiClockSpec.scala 50:11]
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
          $finish; // @[MultiClockSpec.scala 51:9]
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
  cDiv = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
