module MultiExtModuleTester(
  input   clock,
  input   reset
);
  wire [15:0] dut1_foo;
  wire [15:0] dut1_bar;
  wire [15:0] dut2_foo;
  wire [15:0] dut2_bar;
  wire [15:0] dut3_foo;
  wire [15:0] dut3_bar;
  SimpleExtModule dut1 (
    .foo(dut1_foo),
    .bar(dut1_bar)
  );
  SimpleExtModule dut2 (
    .foo(dut2_foo),
    .bar(dut2_bar)
  );
  AdderExtModule dut3 (
    .foo(dut3_foo),
    .bar(dut3_bar)
  );
  assign dut1_foo = 16'h4d2;
  assign dut2_foo = 16'h162e;
  assign dut3_foo = 16'h64;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & dut1_bar != 16'h4d2 & ~reset) begin
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
        if (~reset & dut1_bar != 16'h4d2 & ~reset) begin
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
        if (~reset & ~(dut1_bar != 16'h4d2) & dut2_bar != 16'h162e & ~reset) begin
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
        if (~reset & ~(dut1_bar != 16'h4d2) & dut2_bar != 16'h162e & ~reset) begin
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
        if (~reset & ~(dut1_bar != 16'h4d2) & ~(dut2_bar != 16'h162e) & dut3_bar != 16'h65 & ~reset) begin
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
        if (~reset & ~(dut1_bar != 16'h4d2) & ~(dut2_bar != 16'h162e) & dut3_bar != 16'h65 & ~reset) begin
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
        if (~reset & ~(dut1_bar != 16'h4d2) & ~(dut2_bar != 16'h162e) & ~(dut3_bar != 16'h65) & ~reset) begin
          $finish;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
