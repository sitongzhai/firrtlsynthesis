module RealGCD3( // @[:@3.2]
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
  reg [15:0] x; // @[AdvTesterSpec.scala 40:14:@11.4]
  reg [15:0] y; // @[AdvTesterSpec.scala 41:14:@12.4]
  reg  p; // @[AdvTesterSpec.scala 42:18:@13.4]
  wire  _T_23 = ~p; // @[AdvTesterSpec.scala 47:18:@18.4]
  wire  _T_26 = io_in_valid & _T_23; // @[AdvTesterSpec.scala 49:21:@21.4]
  wire [15:0] _GEN_0 = _T_26 ? io_in_bits_a : x; // @[AdvTesterSpec.scala 49:28:@22.4]
  wire  _GEN_2 = _T_26 | p; // @[AdvTesterSpec.scala 49:28:@22.4]
  wire  _T_28 = x > y; // @[AdvTesterSpec.scala 56:13:@28.6]
  wire [15:0] _T_31 = y - x; // @[AdvTesterSpec.scala 57:30:@36.8]
  wire  _T_34 = ~reset; // @[AdvTesterSpec.scala 58:11:@40.6]
  wire  _T_39 = y == 16'h0; // @[AdvTesterSpec.scala 62:21:@53.4]
  assign io_in_ready = ~p; // @[AdvTesterSpec.scala 47:18:@18.4]
  assign io_out_valid = _T_39 & p; // @[AdvTesterSpec.scala 62:29:@54.4]
  assign io_out_bits = x;
  always @(posedge clock) begin
    if (p) begin // @[AdvTesterSpec.scala 55:12:@27.4]
      if (_T_28) begin // @[AdvTesterSpec.scala 56:19:@29.6]
        x <= y;
      end else begin
        x <= _GEN_0;
      end
    end else begin
      x <= _GEN_0;
    end
    if (p) begin // @[AdvTesterSpec.scala 55:12:@27.4]
      if (_T_28) begin // @[AdvTesterSpec.scala 56:19:@29.6]
        y <= x;
      end else begin
        y <= _T_31;
      end
    end else if (_T_26) begin // @[AdvTesterSpec.scala 49:28:@22.4]
      y <= io_in_bits_b;
    end
    if (reset) begin
      p <= 1'h0;
    end else if (io_out_valid) begin // @[AdvTesterSpec.scala 63:23:@56.4]
      p <= 1'h0;
    end else begin
      p <= _GEN_2;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (p & _T_34) begin
          $fwrite(32'h80000002,"x: %d, y: %d\n",x,y); // @[AdvTesterSpec.scala 58:11:@42.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_23 & _T_34) begin
          $fwrite(32'h80000002,"stalled\n"); // @[AdvTesterSpec.scala 59:23:@49.8]
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
