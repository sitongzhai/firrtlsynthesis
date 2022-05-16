module DspComplexExamples(
  output [4:0] io_inByJ_real,
  output [4:0] io_inByJ_imag,
  output [4:0] io_inByJShortcut_real
);
  wire [4:0] _T_58 = -5'sh4 - 5'sh7; // @[SIntTypeClass.scala 28:50]
  wire [6:0] _T_59 = 5'sh7 * 2'sh1; // @[SIntTypeClass.scala 44:41]
  wire [6:0] _T_60 = 5'sh3 * 2'sh1; // @[SIntTypeClass.scala 44:41]
  wire [5:0] _T_61 = $signed(_T_58) * 1'sh0; // @[SIntTypeClass.scala 44:41]
  wire [6:0] _T_64 = $signed(_T_59) - $signed(_T_60); // @[SIntTypeClass.scala 28:50]
  wire [6:0] _GEN_0 = {{1{_T_61[5]}},_T_61}; // @[SIntTypeClass.scala 18:40]
  wire [6:0] _T_67 = $signed(_T_59) + $signed(_GEN_0); // @[SIntTypeClass.scala 18:40]
  assign io_inByJ_real = _T_64[4:0]; // @[DspComplexSpec.scala 20:12]
  assign io_inByJ_imag = _T_67[4:0]; // @[DspComplexSpec.scala 20:12]
  assign io_inByJShortcut_real = 5'sh0 - -5'sh4; // @[SIntTypeClass.scala 38:5]
endmodule
module DspComplexExamplesTester(
  input   clock,
  input   reset
);
  wire [4:0] dut_io_inByJ_real; // @[DspComplexSpec.scala 25:19]
  wire [4:0] dut_io_inByJ_imag; // @[DspComplexSpec.scala 25:19]
  wire [4:0] dut_io_inByJShortcut_real; // @[DspComplexSpec.scala 25:19]
  wire  _T_6 = ~reset; // @[DspComplexSpec.scala 30:9]
  DspComplexExamples dut ( // @[DspComplexSpec.scala 25:19]
    .io_inByJ_real(dut_io_inByJ_real),
    .io_inByJ_imag(dut_io_inByJ_imag),
    .io_inByJShortcut_real(dut_io_inByJShortcut_real)
  );
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"inByJ.real: %d\n",dut_io_inByJ_real); // @[DspComplexSpec.scala 30:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6) begin
          $fwrite(32'h80000002,"inByJ.imag: %d\n",dut_io_inByJ_imag); // @[DspComplexSpec.scala 31:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6) begin
          $fwrite(32'h80000002,"inByJShortcut.real: %d\n",dut_io_inByJShortcut_real); // @[DspComplexSpec.scala 33:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6) begin
          $fwrite(32'h80000002,"inByJShortcut.imag: %d\n",5'sh7); // @[DspComplexSpec.scala 34:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~($signed(dut_io_inByJ_real) == 5'sh4 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DspComplexSpec.scala:39 assert(dut.io.inByJ.real === 4.S)\n"); // @[DspComplexSpec.scala 39:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~($signed(dut_io_inByJ_real) == 5'sh4 | reset)) begin
          $fatal; // @[DspComplexSpec.scala 39:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~($signed(dut_io_inByJ_imag) == 5'sh7 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DspComplexSpec.scala:40 assert(dut.io.inByJ.imag === 7.S)\n"); // @[DspComplexSpec.scala 40:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~($signed(dut_io_inByJ_imag) == 5'sh7 | reset)) begin
          $fatal; // @[DspComplexSpec.scala 40:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~($signed(dut_io_inByJShortcut_real) == 5'sh4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DspComplexSpec.scala:42 assert(dut.io.inByJShortcut.real === 4.S)\n"); // @[DspComplexSpec.scala 42:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~($signed(dut_io_inByJShortcut_real) == 5'sh4 | reset)) begin
          $fatal; // @[DspComplexSpec.scala 42:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_6) begin
          $finish; // @[DspComplexSpec.scala 45:7]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
