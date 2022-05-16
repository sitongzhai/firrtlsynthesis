module ParameterizedExtModuleTester(
  input   clock,
  input   reset
);
  wire [15:0] dut1_foo;
  wire [15:0] dut1_bar;
  wire [15:0] dut2_foo;
  wire [15:0] dut2_bar;
  ParameterizedExtModule #(.VALUE(1), .STRING("one"), .REAL(-1.7), .TYP(bit)) dut1 (
    .foo(dut1_foo),
    .bar(dut1_bar)
  );
  ParameterizedExtModule #(.VALUE(2), .STRING("two"), .REAL(2.6E50), .TYP(bit [1:0])) dut2 (
    .foo(dut2_foo),
    .bar(dut2_bar)
  );
  assign dut1_foo = 16'h3e8;
  assign dut2_foo = 16'h3e8;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & dut1_bar != 16'h3eb & ~reset) begin
          $fwrite(32'h80000002,"Assertion failed\nTest Failed!\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & dut1_bar != 16'h3eb & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(dut1_bar != 16'h3eb) & dut2_bar != 16'h3f0 & ~reset) begin
          $fwrite(32'h80000002,"Assertion failed\nTest Failed!\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(dut1_bar != 16'h3eb) & dut2_bar != 16'h3f0 & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(dut1_bar != 16'h3eb) & ~(dut2_bar != 16'h3f0) & ~reset) begin
          $finish;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
