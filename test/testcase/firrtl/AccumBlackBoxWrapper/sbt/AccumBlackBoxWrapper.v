module AccumBlackBoxWrapper(
  input         clock,
  input         reset,
  output [15:0] io_data,
  input         io_clock
);
  wire  m_clock; // @[AccumBlackBoxSpec.scala 93:17]
  wire [15:0] m_data; // @[AccumBlackBoxSpec.scala 93:17]
  AccumBlackBox m ( // @[AccumBlackBoxSpec.scala 93:17]
    .clock(m_clock),
    .data(m_data)
  );
  assign io_data = m_data; // @[AccumBlackBoxSpec.scala 94:11]
  assign m_clock = clock; // @[AccumBlackBoxSpec.scala 95:14]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"m.io.data %d io.data %d\n",m_data,io_data); // @[AccumBlackBoxSpec.scala 96:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
