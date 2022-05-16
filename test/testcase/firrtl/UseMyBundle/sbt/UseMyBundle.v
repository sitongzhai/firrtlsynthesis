module UseMyBundle(
  input        clock,
  input        reset,
  input  [1:0] io_trigger,
  output [7:0] io_outB_x,
  output [7:0] io_outB_y,
  output [7:0] io_outC_x,
  output [7:0] io_outC_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] regB_x; // @[BundleInitSpec.scala 63:21]
  reg [7:0] regB_y; // @[BundleInitSpec.scala 63:21]
  reg [7:0] regC_x; // @[BundleInitSpec.scala 64:21]
  reg [7:0] regC_y; // @[BundleInitSpec.scala 64:21]
  wire  _T_26 = ~(io_trigger == 2'h1); // @[BundleInitSpec.scala 66:29]
  assign io_outB_x = regB_x; // @[BundleInitSpec.scala 74:11]
  assign io_outB_y = regB_y; // @[BundleInitSpec.scala 74:11]
  assign io_outC_x = regC_x; // @[BundleInitSpec.scala 75:11]
  assign io_outC_y = regC_y; // @[BundleInitSpec.scala 75:11]
  always @(posedge clock) begin
    if (reset) begin // @[BundleInitSpec.scala 63:21]
      regB_x <= 8'h8; // @[BundleInitSpec.scala 63:21]
    end else if (_T_26 & io_trigger == 2'h2) begin // @[BundleInitSpec.scala 69:34]
      regB_x <= 8'h6; // @[BundleInitSpec.scala 70:10]
    end else if (io_trigger == 2'h1) begin // @[BundleInitSpec.scala 66:29]
      regB_x <= 8'h0; // @[BundleInitSpec.scala 67:10]
    end
    if (reset) begin // @[BundleInitSpec.scala 63:21]
      regB_y <= 8'h9; // @[BundleInitSpec.scala 63:21]
    end else if (!(_T_26 & io_trigger == 2'h2)) begin // @[BundleInitSpec.scala 69:34]
      if (io_trigger == 2'h1) begin // @[BundleInitSpec.scala 66:29]
        regB_y <= 8'h5; // @[BundleInitSpec.scala 67:10]
      end
    end
    if (reset) begin // @[BundleInitSpec.scala 64:21]
      regC_x <= 8'h8; // @[BundleInitSpec.scala 64:21]
    end else if (_T_26 & io_trigger == 2'h2) begin // @[BundleInitSpec.scala 69:34]
      regC_x <= 8'h0; // @[BundleInitSpec.scala 71:10]
    end else if (io_trigger == 2'h1) begin // @[BundleInitSpec.scala 66:29]
      regC_x <= 8'h7; // @[BundleInitSpec.scala 68:10]
    end
    if (reset) begin // @[BundleInitSpec.scala 64:21]
      regC_y <= 8'h9; // @[BundleInitSpec.scala 64:21]
    end else if (_T_26 & io_trigger == 2'h2) begin // @[BundleInitSpec.scala 69:34]
      regC_y <= 8'h5; // @[BundleInitSpec.scala 71:10]
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
  regB_x = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  regB_y = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  regC_x = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  regC_y = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
