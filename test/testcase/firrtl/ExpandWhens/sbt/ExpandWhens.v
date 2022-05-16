module ExpandWhens(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] x;
  wire [1:0] _GEN_0 = x >= 16'h1 ? 2'h2 : 2'h1; // @[]
  wire [2:0] _GEN_1 = x < 16'h3 ? 3'h3 : 3'h4; // @[]
  wire [2:0] _GEN_2 = x >= 16'h2 ? _GEN_1 : {{1'd0}, _GEN_0}; // @[]
  wire [2:0] _GEN_3 = x < 16'h5 ? 3'h5 : 3'h6; // @[]
  wire [2:0] _GEN_4 = x >= 16'h4 ? _GEN_3 : _GEN_2; // @[]
  wire [2:0] _GEN_5 = reset ? _GEN_2 : _GEN_4; // @[]
  reg [15:0] count;
  wire [16:0] _GEN_6 = count != 16'h6 ? count + 16'h1 : {{1'd0}, count}; // @[]
  wire [2:0] _GEN_7 = reset ? 3'h0 : _GEN_5;
  always @(posedge clock) begin
    x <= {{13'd0}, _GEN_7};
    if (reset) begin
      count <= 16'h0;
    end else begin
      count <= _GEN_6[15:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h1) begin
          $fwrite(32'h80000002,"count = %d, x = %d\n",count,x);
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & x != count) begin
          $fwrite(32'h80000002,"Assertion failed! x =/= count!\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & x != count) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & x == 16'h6) begin
          $finish;
        end
    `ifdef STOP_COND
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
  count = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
