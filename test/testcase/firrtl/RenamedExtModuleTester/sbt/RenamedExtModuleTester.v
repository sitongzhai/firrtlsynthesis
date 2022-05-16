module RenamedExtModuleTester(
  input   clock,
  input   reset
);
  wire [15:0] dut_foo;
  wire [15:0] dut_bar;
  SimpleExtModule dut (
    .foo(dut_foo),
    .bar(dut_bar)
  );
  assign dut_foo = 16'h4d2;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & dut_bar != 16'h4d2 & ~reset) begin
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
        if (~reset & dut_bar != 16'h4d2 & ~reset) begin
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
        if (~reset & ~(dut_bar != 16'h4d2) & ~reset) begin
          $finish;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
