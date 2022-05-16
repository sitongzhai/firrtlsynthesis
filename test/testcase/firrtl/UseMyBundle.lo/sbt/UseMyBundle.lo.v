module UseMyBundle( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [1:0] io_trigger, // @[:@6.4]
  output [7:0] io_outB_x, // @[:@6.4]
  output [7:0] io_outB_y, // @[:@6.4]
  output [7:0] io_outC_x, // @[:@6.4]
  output [7:0] io_outC_y // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] regB_x; // @[BundleInitSpec.scala 63:21:@15.4]
  reg [7:0] regB_y; // @[BundleInitSpec.scala 63:21:@15.4]
  reg [7:0] regC_x; // @[BundleInitSpec.scala 64:21:@20.4]
  reg [7:0] regC_y; // @[BundleInitSpec.scala 64:21:@20.4]
  wire  _T_16 = io_trigger == 2'h1; // @[BundleInitSpec.scala 66:20:@21.4]
  wire  _T_24 = io_trigger == 2'h2; // @[BundleInitSpec.scala 69:25:@37.6]
  assign io_outB_x = regB_x;
  assign io_outB_y = regB_y;
  assign io_outC_x = regC_x;
  assign io_outC_y = regC_y;
  always @(posedge clock) begin
    if (reset) begin
      regB_x <= 8'h8;
    end else if (_T_16) begin // @[BundleInitSpec.scala 66:29:@22.4]
      regB_x <= 8'h0;
    end else if (_T_24) begin // @[BundleInitSpec.scala 69:34:@38.6]
      regB_x <= 8'h6;
    end
    if (reset) begin
      regB_y <= 8'h9;
    end else if (_T_16) begin // @[BundleInitSpec.scala 66:29:@22.4]
      regB_y <= 8'h5;
    end
    if (reset) begin
      regC_x <= 8'h8;
    end else if (_T_16) begin // @[BundleInitSpec.scala 66:29:@22.4]
      regC_x <= 8'h7;
    end else if (_T_24) begin // @[BundleInitSpec.scala 69:34:@38.6]
      regC_x <= 8'h0;
    end
    if (reset) begin
      regC_y <= 8'h9;
    end else if (!(_T_16)) begin // @[BundleInitSpec.scala 66:29:@22.4]
      if (_T_24) begin // @[BundleInitSpec.scala 69:34:@38.6]
        regC_y <= 8'h5;
      end
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
