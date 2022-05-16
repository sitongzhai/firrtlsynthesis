module VizModC(
  input  [15:0] io_in,
  output [15:0] io_out
);
  assign io_out = io_in; // @[VisualizerSpec.scala 25:10]
endmodule
module VizModA(
  input  [31:0] io_in,
  output [15:0] io_out
);
  wire [15:0] modC_io_in; // @[VisualizerSpec.scala 40:20]
  wire [15:0] modC_io_out; // @[VisualizerSpec.scala 40:20]
  VizModC modC ( // @[VisualizerSpec.scala 40:20]
    .io_in(modC_io_in),
    .io_out(modC_io_out)
  );
  assign io_out = modC_io_out; // @[VisualizerSpec.scala 42:10]
  assign modC_io_in = io_in[15:0]; // @[VisualizerSpec.scala 41:14]
endmodule
module TopOfVisualizer(
  input         clock,
  input         reset,
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input         io_select,
  output [31:0] io_out,
  output [31:0] io_memOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] myMem [0:15]; // @[VisualizerSpec.scala 68:18]
  wire  myMem__T_16_en; // @[VisualizerSpec.scala 68:18]
  wire [3:0] myMem__T_16_addr; // @[VisualizerSpec.scala 68:18]
  wire [31:0] myMem__T_16_data; // @[VisualizerSpec.scala 68:18]
  wire [31:0] myMem__T_12_data; // @[VisualizerSpec.scala 68:18]
  wire [3:0] myMem__T_12_addr; // @[VisualizerSpec.scala 68:18]
  wire  myMem__T_12_mask; // @[VisualizerSpec.scala 68:18]
  wire  myMem__T_12_en; // @[VisualizerSpec.scala 68:18]
  wire [31:0] modA_io_in; // @[VisualizerSpec.scala 70:20]
  wire [15:0] modA_io_out; // @[VisualizerSpec.scala 70:20]
  reg [31:0] x; // @[VisualizerSpec.scala 65:14]
  reg [31:0] y; // @[VisualizerSpec.scala 66:14]
  wire  _T_14 = ~io_select; // @[VisualizerSpec.scala 75:19]
  wire [31:0] _GEN_11 = {{16'd0}, modA_io_out}; // @[VisualizerSpec.scala 86:20]
  VizModA modA ( // @[VisualizerSpec.scala 70:20]
    .io_in(modA_io_in),
    .io_out(modA_io_out)
  );
  assign myMem__T_16_en = ~io_select;
  assign myMem__T_16_addr = io_in1[3:0];
  assign myMem__T_16_data = myMem[myMem__T_16_addr]; // @[VisualizerSpec.scala 68:18]
  assign myMem__T_12_data = io_in2;
  assign myMem__T_12_addr = io_in1[3:0];
  assign myMem__T_12_mask = 1'h1;
  assign myMem__T_12_en = io_select;
  assign io_out = y; // @[VisualizerSpec.scala 87:10]
  assign io_memOut = myMem__T_16_data; // @[VisualizerSpec.scala 79:14 VisualizerSpec.scala 81:15]
  assign modA_io_in = x; // @[VisualizerSpec.scala 84:14]
  always @(posedge clock) begin
    if (myMem__T_12_en & myMem__T_12_mask) begin
      myMem[myMem__T_12_addr] <= myMem__T_12_data; // @[VisualizerSpec.scala 68:18]
    end
    if (_T_14) begin // @[VisualizerSpec.scala 79:14]
      x <= io_in2; // @[VisualizerSpec.scala 80:7]
    end else if (io_select) begin // @[VisualizerSpec.scala 75:19]
      x <= io_in1; // @[VisualizerSpec.scala 76:7]
    end
    y <= _GEN_11 + io_in2; // @[VisualizerSpec.scala 86:20]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    myMem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  x = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  y = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
