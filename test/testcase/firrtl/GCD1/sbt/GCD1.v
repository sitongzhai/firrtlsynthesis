module GCD(
  input         clock,
  input         reset,
  input  [15:0] io_a,
  input  [15:0] io_b,
  input         io_e,
  output [15:0] io_z,
  output        io_v
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[GCD.scala 17:15]
  reg [15:0] y; // @[GCD.scala 18:15]
  wire [15:0] _T_12 = x - y; // @[GCD.scala 20:25]
  wire  _T_14 = ~(x > y); // @[GCD.scala 20:16]
  wire [15:0] _T_17 = y - x; // @[GCD.scala 21:25]
  assign io_z = x; // @[GCD.scala 24:8]
  assign io_v = y == 16'h0; // @[GCD.scala 25:13]
  always @(posedge clock) begin
    if (io_e) begin // @[GCD.scala 23:15]
      x <= io_a; // @[GCD.scala 23:19]
    end else if (x > y) begin // @[GCD.scala 20:16]
      x <= _T_12; // @[GCD.scala 20:20]
    end
    if (io_e) begin // @[GCD.scala 23:15]
      y <= io_b; // @[GCD.scala 23:30]
    end else if (_T_14) begin // @[GCD.scala 21:16]
      y <= _T_17; // @[GCD.scala 21:20]
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
