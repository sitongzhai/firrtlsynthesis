module Level1(
  input         clk,
  input  [15:0] in1,
  output [15:0] out1,
  output [15:0] out2,
  output [15:0] out3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  level2_clk;
  wire [15:0] level2_in1;
  wire [15:0] level2_out2;
  wire [15:0] level2_out3;
  reg [15:0] reg1;
  Level2 level2 (
    .clk(level2_clk),
    .in1(level2_in1),
    .out2(level2_out2),
    .out3(level2_out3)
  );
  assign out1 = reg1;
  assign out2 = level2_out2;
  assign out3 = level2_out3;
  assign level2_clk = clk;
  assign level2_in1 = in1;
  always @(posedge clk) begin
    reg1 <= in1;
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
  reg1 = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Level2(
  input         clk,
  input  [15:0] in1,
  output [15:0] out2,
  output [15:0] out3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] level3_in1;
  wire [15:0] level3_out3;
  reg [15:0] reg2;
  Level3 level3 (
    .in1(level3_in1),
    .out3(level3_out3)
  );
  assign out2 = reg2;
  assign out3 = level3_out3;
  assign level3_in1 = in1;
  always @(posedge clk) begin
    reg2 <= in1;
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
  reg2 = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Level3(
  input  [15:0] in1,
  output [15:0] out3
);
  assign out3 = in1;
endmodule
module Top(
  input         clk,
  input         reset,
  input  [15:0] in1,
  output [15:0] out1,
  output [15:0] out2,
  output [15:0] out3
);
  wire  level1_clk;
  wire [15:0] level1_in1;
  wire [15:0] level1_out1;
  wire [15:0] level1_out2;
  wire [15:0] level1_out3;
  Level1 level1 (
    .clk(level1_clk),
    .in1(level1_in1),
    .out1(level1_out1),
    .out2(level1_out2),
    .out3(level1_out3)
  );
  assign out1 = level1_out1;
  assign out2 = level1_out2;
  assign out3 = level1_out3;
  assign level1_clk = clk;
  assign level1_in1 = in1;
endmodule
