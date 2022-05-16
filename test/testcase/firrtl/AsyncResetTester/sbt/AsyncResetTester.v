module AsyncResetTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] cDiv_value; // @[Counter.scala 60:40]
  wire [1:0] _cDiv_wrap_value_T_1 = cDiv_value + 2'h1; // @[Counter.scala 76:24]
  wire  slowClk = cDiv_value == 2'h3; // @[AsyncResetSpec.scala 14:22]
  reg [3:0] count; // @[Counter.scala 60:40]
  wire  wrap_wrap = count == 4'hf; // @[Counter.scala 72:24]
  wire [3:0] _wrap_value_T_1 = count + 4'h1; // @[Counter.scala 76:24]
  reg  asyncResetNext; // @[AsyncResetSpec.scala 18:31]
  reg [7:0] reg_; // @[AsyncResetSpec.scala 23:12]
  wire  _T = count == 4'h3; // @[AsyncResetSpec.scala 27:15]
  wire  _T_4 = ~(reg_ == 8'h5 | reset); // @[AsyncResetSpec.scala 28:11]
  wire  _T_7 = count >= 4'h5 & count < 4'h7; // @[AsyncResetSpec.scala 30:22]
  wire  _T_12 = count >= 4'h7; // @[AsyncResetSpec.scala 32:22]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 60:40]
      cDiv_value <= 2'h0; // @[Counter.scala 60:40]
    end else begin
      cDiv_value <= _cDiv_wrap_value_T_1;
    end
    if (reset) begin // @[Counter.scala 60:40]
      count <= 4'h0; // @[Counter.scala 60:40]
    end else begin
      count <= _wrap_value_T_1;
    end
    if (reset) begin // @[AsyncResetSpec.scala 18:31]
      asyncResetNext <= 1'h0; // @[AsyncResetSpec.scala 18:31]
    end else begin
      asyncResetNext <= count == 4'h4; // @[AsyncResetSpec.scala 19:18]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~(reg_ == 8'h5 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at AsyncResetSpec.scala:28 assert(reg_ === 5.U)\n"); // @[AsyncResetSpec.scala 28:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T & ~(reg_ == 8'h5 | reset)) begin
          $fatal; // @[AsyncResetSpec.scala 28:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(reg_ == 8'h7b | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at AsyncResetSpec.scala:31 assert(reg_ === 123.U)\n"); // @[AsyncResetSpec.scala 31:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_7 & ~(reg_ == 8'h7b | reset)) begin
          $fatal; // @[AsyncResetSpec.scala 31:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T_7 & _T_12 & _T_4) begin
          $fwrite(32'h80000002,"Assertion failed\n    at AsyncResetSpec.scala:33 assert(reg_ === 5.U)\n"); // @[AsyncResetSpec.scala 33:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_7 & _T_12 & _T_4) begin
          $fatal; // @[AsyncResetSpec.scala 33:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (wrap_wrap & ~reset) begin
          $finish; // @[AsyncResetSpec.scala 37:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge slowClk or posedge asyncResetNext) begin
    if (asyncResetNext) begin
      reg_ <= 8'h7b;
    end else begin
      reg_ <= 8'h5;
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
  cDiv_value = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  count = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  asyncResetNext = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_ = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  if (asyncResetNext) begin
    reg_ = 8'h7b;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
