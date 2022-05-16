module AccumBlackBoxWrapper( // @[:@10.2]
  input         clock, // @[:@11.4]
  input         reset, // @[:@12.4]
  output [15:0] io_data, // @[:@13.4]
  input         io_clock // @[:@13.4]
);
  wire  m_clock; // @[AccumBlackBoxSpec.scala 93:17:@18.4]
  wire [15:0] m_data; // @[AccumBlackBoxSpec.scala 93:17:@18.4]
  wire  _T_6 = ~reset; // @[AccumBlackBoxSpec.scala 96:9:@24.4]
  AccumBlackBox m ( // @[AccumBlackBoxSpec.scala 93:17:@18.4]
    .clock(m_clock),
    .data(m_data)
  );
  assign io_data = m_data;
  assign m_clock = clock;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6) begin
          $fwrite(32'h80000002,"m.io.data %d io.data %d\n",m_data,io_data); // @[AccumBlackBoxSpec.scala 96:9:@26.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
