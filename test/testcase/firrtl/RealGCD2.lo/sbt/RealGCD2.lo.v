module RealGCD2( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_in_ready, // @[:@6.4]
  input         io_in_valid, // @[:@6.4]
  input  [15:0] io_in_bits_a, // @[:@6.4]
  input  [15:0] io_in_bits_b, // @[:@6.4]
  output        io_out_valid, // @[:@6.4]
  output [15:0] io_out_bits // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x; // @[GCDSpec.scala 38:14:@11.4]
  reg [15:0] y; // @[GCDSpec.scala 39:14:@12.4]
  reg  p; // @[GCDSpec.scala 40:18:@13.4]
  wire  _T_23 = ~p; // @[GCDSpec.scala 45:18:@18.4]
  wire  _T_26 = io_in_valid & _T_23; // @[GCDSpec.scala 47:21:@21.4]
  wire [15:0] _GEN_0 = _T_26 ? io_in_bits_a : x; // @[GCDSpec.scala 47:28:@22.4]
  wire  _GEN_2 = _T_26 | p; // @[GCDSpec.scala 47:28:@22.4]
  wire  _T_28 = x > y; // @[GCDSpec.scala 54:13:@28.6]
  wire [15:0] _T_31 = y - x; // @[GCDSpec.scala 55:30:@36.8]
  wire  _T_33 = y == 16'h0; // @[GCDSpec.scala 59:21:@41.4]
  assign io_in_ready = ~p; // @[GCDSpec.scala 45:18:@18.4]
  assign io_out_valid = _T_33 & p; // @[GCDSpec.scala 59:29:@42.4]
  assign io_out_bits = x;
  always @(posedge clock) begin
    if (p) begin // @[GCDSpec.scala 53:12:@27.4]
      if (_T_28) begin // @[GCDSpec.scala 54:19:@29.6]
        x <= y;
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (p) begin // @[GCDSpec.scala 53:12:@27.4]
      if (_T_28) begin // @[GCDSpec.scala 54:19:@29.6]
        y <= x;
      end else begin
        y <= _T_31;
      end
    end else if (_T_26) begin // @[GCDSpec.scala 47:28:@22.4]
      y <= io_in_bits_b;
    end
    if (reset) begin
      p <= 1'h0;
    end else if (io_out_valid) begin // @[GCDSpec.scala 60:23:@44.4]
      p <= 1'h0;
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
