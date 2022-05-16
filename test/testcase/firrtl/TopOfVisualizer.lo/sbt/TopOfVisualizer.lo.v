module VizModC( // @[:@3.2]
  input  [15:0] io_in, // @[:@6.4]
  output [15:0] io_out // @[:@6.4]
);
  assign io_out = io_in;
endmodule
module VizModA( // @[:@13.2]
  input  [31:0] io_in, // @[:@16.4]
  output [15:0] io_out // @[:@16.4]
);
  wire [15:0] modC_io_in; // @[VisualizerSpec.scala 40:20:@21.4]
  wire [15:0] modC_io_out; // @[VisualizerSpec.scala 40:20:@21.4]
  VizModC modC ( // @[VisualizerSpec.scala 40:20:@21.4]
    .io_in(modC_io_in),
    .io_out(modC_io_out)
  );
  assign io_out = modC_io_out;
  assign modC_io_in = io_in[15:0];
endmodule
module TopOfVisualizer( // @[:@28.2]
  input         clock, // @[:@29.4]
  input         reset, // @[:@30.4]
  input  [31:0] io_in1, // @[:@31.4]
  input  [31:0] io_in2, // @[:@31.4]
  input         io_select, // @[:@31.4]
  output [31:0] io_out, // @[:@31.4]
  output [31:0] io_memOut // @[:@31.4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] myMem [0:15]; // @[VisualizerSpec.scala 68:18:@38.4]
  wire  myMem__T_16_en; // @[VisualizerSpec.scala 68:18:@38.4]
  wire [3:0] myMem__T_16_addr; // @[VisualizerSpec.scala 68:18:@38.4]
  wire [31:0] myMem__T_16_data; // @[VisualizerSpec.scala 68:18:@38.4]
  wire [31:0] myMem__T_12_data; // @[VisualizerSpec.scala 68:18:@38.4]
  wire [3:0] myMem__T_12_addr; // @[VisualizerSpec.scala 68:18:@38.4]
  wire  myMem__T_12_mask; // @[VisualizerSpec.scala 68:18:@38.4]
  wire  myMem__T_12_en; // @[VisualizerSpec.scala 68:18:@38.4]
  wire [31:0] modA_io_in; // @[VisualizerSpec.scala 70:20:@39.4]
  wire [15:0] modA_io_out; // @[VisualizerSpec.scala 70:20:@39.4]
  reg [31:0] x; // @[VisualizerSpec.scala 65:14:@36.4]
  reg [31:0] y; // @[VisualizerSpec.scala 66:14:@37.4]
  wire  _T_14 = ~io_select; // @[VisualizerSpec.scala 75:19:@49.4]
  wire [31:0] _GEN_10 = {{16'd0}, modA_io_out}; // @[VisualizerSpec.scala 86:20:@57.4]
  VizModA modA ( // @[VisualizerSpec.scala 70:20:@39.4]
    .io_in(modA_io_in),
    .io_out(modA_io_out)
  );
  assign myMem__T_16_en = ~io_select;
  assign myMem__T_16_addr = io_in1[3:0];
  assign myMem__T_16_data = myMem[myMem__T_16_addr]; // @[VisualizerSpec.scala 68:18:@38.4]
  assign myMem__T_12_data = io_in2;
  assign myMem__T_12_addr = io_in1[3:0];
  assign myMem__T_12_mask = io_select;
  assign myMem__T_12_en = io_select;
  assign io_out = y;
  assign io_memOut = myMem__T_16_data; // @[VisualizerSpec.scala 79:14:@50.4]
  assign modA_io_in = x;
  always @(posedge clock) begin
    if (myMem__T_12_en & myMem__T_12_mask) begin
      myMem[myMem__T_12_addr] <= myMem__T_12_data; // @[VisualizerSpec.scala 68:18:@38.4]
    end
    if (_T_14) begin // @[VisualizerSpec.scala 79:14:@50.4]
      x <= io_in2;
    end else if (io_select) begin // @[VisualizerSpec.scala 75:19:@43.4]
      x <= io_in1;
    end
    y <= _GEN_10 + io_in2; // @[VisualizerSpec.scala 86:20:@58.4]
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
