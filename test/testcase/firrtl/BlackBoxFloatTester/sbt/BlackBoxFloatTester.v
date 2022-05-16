module BlackBoxFloatTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] BBFAdd_out; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_in2; // @[DspReal.scala 43:36]
  wire [63:0] BBFAdd_in1; // @[DspReal.scala 43:36]
  wire [63:0] BBFMultiply_out; // @[DspReal.scala 51:36]
  wire [63:0] BBFMultiply_in2; // @[DspReal.scala 51:36]
  wire [63:0] BBFMultiply_in1; // @[DspReal.scala 51:36]
  wire  BBFEquals_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_1_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_1_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_1_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_2_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_2_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_2_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_3_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_3_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_3_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_4_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_4_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_4_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_5_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_5_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_5_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_6_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_6_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_6_in1; // @[DspReal.scala 75:32]
  wire  BBFEquals_7_out; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_7_in2; // @[DspReal.scala 75:32]
  wire [63:0] BBFEquals_7_in1; // @[DspReal.scala 75:32]
  reg [3:0] value; // @[Counter.scala 17:33]
  wire  _T_6 = value == 4'h9; // @[Counter.scala 25:24]
  wire [3:0] _T_9 = value + 4'h1; // @[Counter.scala 26:22]
  reg [63:0] accum_node; // @[BlackBoxFloat.scala 15:22]
  wire  _T_28 = ~reset; // @[BlackBoxFloat.scala 22:9]
  wire  _T_30 = value == 4'h0; // @[BlackBoxFloat.scala 25:13]
  wire  _T_34 = BBFEquals_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_42 = BBFEquals_1_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_48 = value == 4'h1; // @[BlackBoxFloat.scala 28:20]
  wire  _T_52 = BBFEquals_2_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_60 = BBFEquals_3_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_66 = value == 4'h2; // @[BlackBoxFloat.scala 31:20]
  wire  _T_70 = BBFEquals_4_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_78 = BBFEquals_5_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_84 = value == 4'h3; // @[BlackBoxFloat.scala 34:20]
  wire  _T_88 = BBFEquals_6_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_96 = BBFEquals_7_out; // @[DspReal.scala 37:19 DspReal.scala 38:9]
  wire  _T_102 = value >= 4'h3; // @[BlackBoxFloat.scala 39:13]
  wire [63:0] addOut_node = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire [63:0] mulOut_node = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  wire  _GEN_2 = ~_T_30; // @[BlackBoxFloat.scala 29:11]
  wire  _GEN_3 = ~_T_30 & _T_48; // @[BlackBoxFloat.scala 29:11]
  wire  _GEN_12 = _GEN_2 & ~_T_48; // @[BlackBoxFloat.scala 32:11]
  wire  _GEN_13 = _GEN_2 & ~_T_48 & _T_66; // @[BlackBoxFloat.scala 32:11]
  wire  _GEN_31 = _GEN_12 & ~_T_66 & _T_84; // @[BlackBoxFloat.scala 35:11]
  BBFAdd BBFAdd ( // @[DspReal.scala 43:36]
    .out(BBFAdd_out),
    .in2(BBFAdd_in2),
    .in1(BBFAdd_in1)
  );
  BBFMultiply BBFMultiply ( // @[DspReal.scala 51:36]
    .out(BBFMultiply_out),
    .in2(BBFMultiply_in2),
    .in1(BBFMultiply_in1)
  );
  BBFEquals BBFEquals ( // @[DspReal.scala 75:32]
    .out(BBFEquals_out),
    .in2(BBFEquals_in2),
    .in1(BBFEquals_in1)
  );
  BBFEquals BBFEquals_1 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_1_out),
    .in2(BBFEquals_1_in2),
    .in1(BBFEquals_1_in1)
  );
  BBFEquals BBFEquals_2 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_2_out),
    .in2(BBFEquals_2_in2),
    .in1(BBFEquals_2_in1)
  );
  BBFEquals BBFEquals_3 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_3_out),
    .in2(BBFEquals_3_in2),
    .in1(BBFEquals_3_in1)
  );
  BBFEquals BBFEquals_4 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_4_out),
    .in2(BBFEquals_4_in2),
    .in1(BBFEquals_4_in1)
  );
  BBFEquals BBFEquals_5 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_5_out),
    .in2(BBFEquals_5_in2),
    .in1(BBFEquals_5_in1)
  );
  BBFEquals BBFEquals_6 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_6_out),
    .in2(BBFEquals_6_in2),
    .in1(BBFEquals_6_in1)
  );
  BBFEquals BBFEquals_7 ( // @[DspReal.scala 75:32]
    .out(BBFEquals_7_out),
    .in2(BBFEquals_7_in2),
    .in1(BBFEquals_7_in1)
  );
  assign BBFAdd_in2 = 64'h3ff0000000000000; // @[DspReal.scala 27:21]
  assign BBFAdd_in1 = accum_node; // @[DspReal.scala 26:21]
  assign BBFMultiply_in2 = 64'h4000000000000000; // @[DspReal.scala 27:21]
  assign BBFMultiply_in1 = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_in2 = 64'h3ff0000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_in1 = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_1_in2 = 64'h4000000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_1_in1 = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_2_in2 = 64'h4000000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_2_in1 = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_3_in2 = 64'h4010000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_3_in1 = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_4_in2 = 64'h4008000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_4_in1 = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_5_in2 = 64'h4018000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_5_in1 = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_6_in2 = 64'h4010000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_6_in1 = BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  assign BBFEquals_7_in2 = 64'h4020000000000000; // @[DspReal.scala 36:21]
  assign BBFEquals_7_in1 = BBFMultiply_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 17:33]
      value <= 4'h0; // @[Counter.scala 17:33]
    end else if (_T_6) begin // @[Counter.scala 28:21]
      value <= 4'h0; // @[Counter.scala 28:29]
    end else begin
      value <= _T_9; // @[Counter.scala 26:13]
    end
    accum_node <= BBFAdd_out; // @[DspReal.scala 28:19 DspReal.scala 29:14]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"cnt: %x     accum: %x    add: %x    mult: %x\n",value,accum_node,addOut_node,mulOut_node
            ); // @[BlackBoxFloat.scala 22:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_30 & ~(_T_34 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:26 assert(addOut === DspReal(1))\n"); // @[BlackBoxFloat.scala 26:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_30 & ~(_T_34 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 26:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_30 & ~(_T_42 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:27 assert(mulOut === DspReal(2))\n"); // @[BlackBoxFloat.scala 27:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_30 & ~(_T_42 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 27:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T_30 & _T_48 & ~(_T_52 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:29 assert(addOut === DspReal(2))\n"); // @[BlackBoxFloat.scala 29:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_30 & _T_48 & ~(_T_52 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 29:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_3 & ~(_T_60 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:30 assert(mulOut === DspReal(4))\n"); // @[BlackBoxFloat.scala 30:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_3 & ~(_T_60 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 30:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_2 & ~_T_48 & _T_66 & ~(_T_70 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:32 assert(addOut === DspReal(3))\n"); // @[BlackBoxFloat.scala 32:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_2 & ~_T_48 & _T_66 & ~(_T_70 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 32:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_13 & ~(_T_78 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:33 assert(mulOut === DspReal(6))\n"); // @[BlackBoxFloat.scala 33:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_13 & ~(_T_78 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 33:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_12 & ~_T_66 & _T_84 & ~(_T_88 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:35 assert(addOut === DspReal(4))\n"); // @[BlackBoxFloat.scala 35:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_12 & ~_T_66 & _T_84 & ~(_T_88 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 35:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_31 & ~(_T_96 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at BlackBoxFloat.scala:36 assert(mulOut === DspReal(8))\n"); // @[BlackBoxFloat.scala 36:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_31 & ~(_T_96 | reset)) begin
          $fatal; // @[BlackBoxFloat.scala 36:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_102 & _T_28) begin
          $finish; // @[BlackBoxFloat.scala 41:9]
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
  _RAND_1 = {2{`RANDOM}};
  accum_node = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
