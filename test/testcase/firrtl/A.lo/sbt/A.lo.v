module B( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input        io_enable, // @[:@6.4]
  output [2:0] io_calc // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] counter; // @[ATester.scala 27:24:@11.4]
  wire [2:0] _T_8 = counter + 3'h1; // @[ATester.scala 29:24:@14.6]
  assign io_calc = counter;
  always @(posedge clock) begin
    if (reset) begin // @[ATester.scala 27:24:@11.4]
      counter <= 3'h0; // @[ATester.scala 27:24:@11.4]
    end else if (io_enable) begin // @[ATester.scala 28:19:@12.4]
      counter <= _T_8;
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
  counter = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module A( // @[:@19.2]
  input        clock, // @[:@20.4]
  input        reset, // @[:@21.4]
  input        io_enable, // @[:@22.4]
  output [2:0] io_calc // @[:@22.4]
);
  wire  sub_clock; // @[ATester.scala 17:19:@27.4]
  wire  sub_reset; // @[ATester.scala 17:19:@27.4]
  wire  sub_io_enable; // @[ATester.scala 17:19:@27.4]
  wire [2:0] sub_io_calc; // @[ATester.scala 17:19:@27.4]
  B sub ( // @[ATester.scala 17:19:@27.4]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_enable(sub_io_enable),
    .io_calc(sub_io_calc)
  );
  assign io_calc = sub_io_calc;
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_enable = io_enable;
endmodule
