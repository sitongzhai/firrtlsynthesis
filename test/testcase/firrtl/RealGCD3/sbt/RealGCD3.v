module RealGCD3(
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
  reg [15:0] x; // @[AdvTesterSpec.scala 40:14]
  reg [15:0] y; // @[AdvTesterSpec.scala 41:14]
  reg  p; // @[AdvTesterSpec.scala 42:18]
  wire  _T_23 = ~p; // @[AdvTesterSpec.scala 47:18]
  wire [15:0] _GEN_0 = io_in_valid & _T_23 ? io_in_bits_a : x; // @[AdvTesterSpec.scala 49:28 AdvTesterSpec.scala 50:7 AdvTesterSpec.scala 40:14]
  wire [15:0] _GEN_1 = io_in_valid & _T_23 ? io_in_bits_b : y; // @[AdvTesterSpec.scala 49:28 AdvTesterSpec.scala 51:7 AdvTesterSpec.scala 41:14]
  wire  _GEN_2 = io_in_valid & _T_23 | p; // @[AdvTesterSpec.scala 49:28 AdvTesterSpec.scala 52:7 AdvTesterSpec.scala 42:18]
  wire  _T_30 = ~(x > y); // @[AdvTesterSpec.scala 56:19]
  wire [15:0] _T_33 = y - x; // @[AdvTesterSpec.scala 57:30]
  wire  _T_35 = ~reset; // @[AdvTesterSpec.scala 58:11]
  assign io_in_ready = ~p; // @[AdvTesterSpec.scala 47:18]
  assign io_out_valid = y == 16'h0 & p; // @[AdvTesterSpec.scala 62:29]
  assign io_out_bits = x; // @[AdvTesterSpec.scala 61:16]
  always @(posedge clock) begin
    if (p) begin // @[AdvTesterSpec.scala 55:12]
      if (x > y) begin // @[AdvTesterSpec.scala 56:19]
        x <= y; // @[AdvTesterSpec.scala 56:23]
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (p) begin // @[AdvTesterSpec.scala 55:12]
      if (_T_30) begin // @[AdvTesterSpec.scala 57:21]
        y <= _T_33; // @[AdvTesterSpec.scala 57:25]
      end else if (x > y) begin // @[AdvTesterSpec.scala 56:19]
        y <= x; // @[AdvTesterSpec.scala 56:31]
      end else begin
        y <= _GEN_1;
      end
    end else begin
      y <= _GEN_1;
    end
    if (reset) begin // @[AdvTesterSpec.scala 42:18]
      p <= 1'h0; // @[AdvTesterSpec.scala 42:18]
    end else if (io_out_valid) begin // @[AdvTesterSpec.scala 63:23]
      p <= 1'h0; // @[AdvTesterSpec.scala 64:7]
    end else begin
      p <= _GEN_2;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (p & ~reset) begin
          $fwrite(32'h80000002,"x: %d, y: %d\n",x,y); // @[AdvTesterSpec.scala 58:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_23 & _T_35) begin
          $fwrite(32'h80000002,"stalled\n"); // @[AdvTesterSpec.scala 59:23]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
