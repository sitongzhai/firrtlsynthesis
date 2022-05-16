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
  reg [15:0] x; // @[GCDSpec.scala 37:14]
  reg [15:0] y; // @[GCDSpec.scala 38:14]
  reg  p; // @[GCDSpec.scala 39:14]
  wire  _T_41 = ~p; // @[GCDSpec.scala 44:18]
  wire [15:0] _GEN_0 = io_in_valid & _T_41 ? io_in_bits_a : x; // @[GCDSpec.scala 46:28 GCDSpec.scala 47:7 GCDSpec.scala 37:14]
  wire [15:0] _GEN_1 = io_in_valid & _T_41 ? io_in_bits_b : y; // @[GCDSpec.scala 46:28 GCDSpec.scala 48:7 GCDSpec.scala 38:14]
  wire  _GEN_2 = io_in_valid & _T_41 | p; // @[GCDSpec.scala 46:28 GCDSpec.scala 49:7 GCDSpec.scala 39:14]
  wire  _T_48 = ~(x > y); // @[GCDSpec.scala 53:19]
  wire [15:0] _T_50 = y - x; // @[GCDSpec.scala 54:30]
  assign io_in_ready = ~p; // @[GCDSpec.scala 44:18]
  assign io_out_valid = y == 16'h0 & p; // @[GCDSpec.scala 58:33]
  assign io_out_bits = x; // @[GCDSpec.scala 57:16]
  always @(posedge clock) begin
    if (p) begin // @[GCDSpec.scala 52:12]
      if (x > y) begin // @[GCDSpec.scala 53:19]
        x <= y; // @[GCDSpec.scala 53:23]
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (p) begin // @[GCDSpec.scala 52:12]
      if (_T_48) begin // @[GCDSpec.scala 54:21]
        y <= _T_50; // @[GCDSpec.scala 54:25]
      end else if (x > y) begin // @[GCDSpec.scala 53:19]
        y <= x; // @[GCDSpec.scala 53:31]
      end else begin
        y <= _GEN_1;
      end
    end else begin
      y <= _GEN_1;
    end
    if (reset) begin // @[GCDSpec.scala 39:14]
      p <= 1'h0; // @[GCDSpec.scala 39:14]
    end else if (io_out_valid) begin // @[GCDSpec.scala 59:23]
      p <= 1'h0; // @[GCDSpec.scala 60:7]
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
