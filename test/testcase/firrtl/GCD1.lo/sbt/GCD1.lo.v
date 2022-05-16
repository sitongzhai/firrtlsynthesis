module GCD( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [15:0] io_a, // @[:@6.4]
  input  [15:0] io_b, // @[:@6.4]
  input         io_e, // @[:@6.4]
  output [15:0] io_z, // @[:@6.4]
  output        io_v // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[GCD.scala 17:15:@11.4]
  reg [15:0] y; // @[GCD.scala 18:15:@12.4]
  wire  _T_9 = x > y; // @[GCD.scala 20:11:@13.4]
  wire [15:0] _T_12 = x - y; // @[GCD.scala 20:25:@17.6]
  wire  _T_14 = ~_T_9; // @[GCD.scala 20:16:@20.4]
  wire [15:0] _T_17 = y - x; // @[GCD.scala 21:25:@24.6]
  assign io_z = x;
  assign io_v = y == 16'h0; // @[GCD.scala 25:13:@32.4]
  always @(posedge clock) begin
    if (io_e) begin // @[GCD.scala 23:15:@27.4]
      x <= io_a;
    end else if (_T_9) begin // @[GCD.scala 20:16:@14.4]
      x <= _T_12;
    end
    if (io_e) begin // @[GCD.scala 23:15:@27.4]
      y <= io_b;
    end else if (_T_14) begin // @[GCD.scala 21:16:@21.4]
      y <= _T_17;
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
  x = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
