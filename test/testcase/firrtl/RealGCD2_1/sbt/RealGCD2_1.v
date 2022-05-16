module RealGCD2(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_a,
  input  [15:0] io_in_bits_b,
  output        io_out_valid,
  output [15:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[GCDSpec.scala 38:14]
  reg [15:0] y; // @[GCDSpec.scala 39:14]
  reg  p; // @[GCDSpec.scala 40:18]
  wire  _T_23 = ~p; // @[GCDSpec.scala 45:18]
  wire [15:0] _GEN_0 = io_in_valid & _T_23 ? io_in_bits_a : x; // @[GCDSpec.scala 47:28 GCDSpec.scala 48:7 GCDSpec.scala 38:14]
  wire  _GEN_2 = io_in_valid & _T_23 | p; // @[GCDSpec.scala 47:28 GCDSpec.scala 50:7 GCDSpec.scala 40:18]
  wire [15:0] _T_31 = y - x; // @[GCDSpec.scala 55:30]
  assign io_in_ready = ~p; // @[GCDSpec.scala 45:18]
  assign io_out_valid = y == 16'h0 & p; // @[GCDSpec.scala 59:29]
  assign io_out_bits = x; // @[GCDSpec.scala 58:16]
  always @(posedge clock) begin
    if (p) begin // @[GCDSpec.scala 53:12]
      if (x > y) begin // @[GCDSpec.scala 54:19]
        x <= y; // @[GCDSpec.scala 54:23]
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (p) begin // @[GCDSpec.scala 53:12]
      if (x > y) begin // @[GCDSpec.scala 54:19]
        y <= x; // @[GCDSpec.scala 54:31]
      end else begin
        y <= _T_31; // @[GCDSpec.scala 55:25]
      end
    end else if (io_in_valid & _T_23) begin // @[GCDSpec.scala 47:28]
      y <= io_in_bits_b; // @[GCDSpec.scala 49:7]
    end
    if (reset) begin // @[GCDSpec.scala 40:18]
      p <= 1'h0; // @[GCDSpec.scala 40:18]
    end else if (io_out_valid) begin // @[GCDSpec.scala 60:23]
      p <= 1'h0; // @[GCDSpec.scala 61:7]
    end else begin
      p <= _GEN_2;
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
  _RAND_2 = {1{`RANDOM}};
  p = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
