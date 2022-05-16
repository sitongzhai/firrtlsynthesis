module SEClkDivider(
  input   io_reset,
  input   io_inClk,
  output  io_outClks_3,
  output  io_outClks_1,
  output  io_outClks_0
);
  wire  AsyncRegInit_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_clk; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_clk; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_clk; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_clk; // @[ClkDivider.scala 59:30]
  AsyncRegInit AsyncRegInit ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_out),
    .in(AsyncRegInit_in),
    .init(AsyncRegInit_init),
    .reset(AsyncRegInit_reset),
    .clk(AsyncRegInit_clk)
  );
  AsyncRegInit AsyncRegInit_1 ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_1_out),
    .in(AsyncRegInit_1_in),
    .init(AsyncRegInit_1_init),
    .reset(AsyncRegInit_1_reset),
    .clk(AsyncRegInit_1_clk)
  );
  AsyncRegInit AsyncRegInit_2 ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_2_out),
    .in(AsyncRegInit_2_in),
    .init(AsyncRegInit_2_init),
    .reset(AsyncRegInit_2_reset),
    .clk(AsyncRegInit_2_clk)
  );
  AsyncRegInit AsyncRegInit_3 ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_3_out),
    .in(AsyncRegInit_3_in),
    .init(AsyncRegInit_3_init),
    .reset(AsyncRegInit_3_reset),
    .clk(AsyncRegInit_3_clk)
  );
  assign io_outClks_3 = AsyncRegInit_3_out; // @[ClkDivider.scala 120:48]
  assign io_outClks_1 = AsyncRegInit_1_out; // @[ClkDivider.scala 120:48]
  assign io_outClks_0 = AsyncRegInit_out; // @[ClkDivider.scala 120:48]
  assign AsyncRegInit_in = AsyncRegInit_3_out; // @[ClkDivider.scala 116:23]
  assign AsyncRegInit_init = 1'h1; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_clk = io_inClk; // @[ClkDivider.scala 60:25]
  assign AsyncRegInit_1_in = AsyncRegInit_out; // @[ClkDivider.scala 117:71]
  assign AsyncRegInit_1_init = 1'h0; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_1_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_1_clk = io_inClk; // @[ClkDivider.scala 60:25]
  assign AsyncRegInit_2_in = AsyncRegInit_1_out; // @[ClkDivider.scala 117:71]
  assign AsyncRegInit_2_init = 1'h0; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_2_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_2_clk = io_inClk; // @[ClkDivider.scala 60:25]
  assign AsyncRegInit_3_in = AsyncRegInit_2_out; // @[ClkDivider.scala 117:71]
  assign AsyncRegInit_3_init = 1'h0; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_3_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_3_clk = io_inClk; // @[ClkDivider.scala 60:25]
endmodule
module ModWithNestedClk(
  input   reset,
  input   io_inClk,
  output  io_bbOutClk_0,
  output  io_bbOutClk_1,
  output  io_bbOutClk_2,
  output  io_clkDivOut_0,
  output  io_clkDivOut_1,
  output  io_clkDivOut_2
);
  wire  bb_outClk_0; // @[ClkGenSpec.scala 63:18]
  wire  bb_outClk_1; // @[ClkGenSpec.scala 63:18]
  wire  bb_outClk_2; // @[ClkGenSpec.scala 63:18]
  wire  bb_inClk; // @[ClkGenSpec.scala 63:18]
  wire  clkDiv_io_reset; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_inClk; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_outClks_3; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_outClks_1; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_outClks_0; // @[ClkGenSpec.scala 66:22]
  FakeBBClk bb ( // @[ClkGenSpec.scala 63:18]
    .outClk_0(bb_outClk_0),
    .outClk_1(bb_outClk_1),
    .outClk_2(bb_outClk_2),
    .inClk(bb_inClk)
  );
  SEClkDivider clkDiv ( // @[ClkGenSpec.scala 66:22]
    .io_reset(clkDiv_io_reset),
    .io_inClk(clkDiv_io_inClk),
    .io_outClks_3(clkDiv_io_outClks_3),
    .io_outClks_1(clkDiv_io_outClks_1),
    .io_outClks_0(clkDiv_io_outClks_0)
  );
  assign io_bbOutClk_0 = bb_outClk_0; // @[ClkGenSpec.scala 65:15]
  assign io_bbOutClk_1 = bb_outClk_1; // @[ClkGenSpec.scala 65:15]
  assign io_bbOutClk_2 = bb_outClk_2; // @[ClkGenSpec.scala 65:15]
  assign io_clkDivOut_0 = clkDiv_io_outClks_0; // @[ClkGenSpec.scala 69:72]
  assign io_clkDivOut_1 = clkDiv_io_outClks_1; // @[ClkGenSpec.scala 69:72]
  assign io_clkDivOut_2 = clkDiv_io_outClks_3; // @[ClkGenSpec.scala 69:72]
  assign bb_inClk = io_inClk; // @[ClkGenSpec.scala 64:15]
  assign clkDiv_io_reset = reset; // @[ClkGenSpec.scala 67:19]
  assign clkDiv_io_inClk = io_inClk; // @[ClkGenSpec.scala 68:19]
endmodule
module SEClkDivider_1(
  input   io_reset,
  input   io_inClk,
  output  io_outClks_3,
  output  io_outClks_1,
  output  io_outClks_0
);
  wire  AsyncRegInit_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_clk; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_1_clk; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_2_clk; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_out; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_in; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_init; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_reset; // @[ClkDivider.scala 59:30]
  wire  AsyncRegInit_3_clk; // @[ClkDivider.scala 59:30]
  AsyncRegInit AsyncRegInit ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_out),
    .in(AsyncRegInit_in),
    .init(AsyncRegInit_init),
    .reset(AsyncRegInit_reset),
    .clk(AsyncRegInit_clk)
  );
  AsyncRegInit AsyncRegInit_1 ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_1_out),
    .in(AsyncRegInit_1_in),
    .init(AsyncRegInit_1_init),
    .reset(AsyncRegInit_1_reset),
    .clk(AsyncRegInit_1_clk)
  );
  AsyncRegInit AsyncRegInit_2 ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_2_out),
    .in(AsyncRegInit_2_in),
    .init(AsyncRegInit_2_init),
    .reset(AsyncRegInit_2_reset),
    .clk(AsyncRegInit_2_clk)
  );
  AsyncRegInit AsyncRegInit_3 ( // @[ClkDivider.scala 59:30]
    .out(AsyncRegInit_3_out),
    .in(AsyncRegInit_3_in),
    .init(AsyncRegInit_3_init),
    .reset(AsyncRegInit_3_reset),
    .clk(AsyncRegInit_3_clk)
  );
  assign io_outClks_3 = AsyncRegInit_out; // @[ClkDivider.scala 120:48]
  assign io_outClks_1 = AsyncRegInit_2_out; // @[ClkDivider.scala 120:48]
  assign io_outClks_0 = AsyncRegInit_1_out; // @[ClkDivider.scala 120:48]
  assign AsyncRegInit_in = AsyncRegInit_3_out; // @[ClkDivider.scala 116:23]
  assign AsyncRegInit_init = 1'h1; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_clk = io_inClk; // @[ClkDivider.scala 60:25]
  assign AsyncRegInit_1_in = AsyncRegInit_out; // @[ClkDivider.scala 117:71]
  assign AsyncRegInit_1_init = 1'h0; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_1_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_1_clk = io_inClk; // @[ClkDivider.scala 60:25]
  assign AsyncRegInit_2_in = AsyncRegInit_1_out; // @[ClkDivider.scala 117:71]
  assign AsyncRegInit_2_init = 1'h0; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_2_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_2_clk = io_inClk; // @[ClkDivider.scala 60:25]
  assign AsyncRegInit_3_in = AsyncRegInit_2_out; // @[ClkDivider.scala 117:71]
  assign AsyncRegInit_3_init = 1'h0; // @[ClkDivider.scala 62:26]
  assign AsyncRegInit_3_reset = io_reset; // @[ClkDivider.scala 61:27]
  assign AsyncRegInit_3_clk = io_inClk; // @[ClkDivider.scala 60:25]
endmodule
module ModWithNestedClk_1(
  input   reset,
  input   io_inClk,
  output  io_bbOutClk_0,
  output  io_bbOutClk_1,
  output  io_bbOutClk_2,
  output  io_clkDivOut_0,
  output  io_clkDivOut_1,
  output  io_clkDivOut_2
);
  wire  bb_outClk_0; // @[ClkGenSpec.scala 63:18]
  wire  bb_outClk_1; // @[ClkGenSpec.scala 63:18]
  wire  bb_outClk_2; // @[ClkGenSpec.scala 63:18]
  wire  bb_inClk; // @[ClkGenSpec.scala 63:18]
  wire  clkDiv_io_reset; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_inClk; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_outClks_3; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_outClks_1; // @[ClkGenSpec.scala 66:22]
  wire  clkDiv_io_outClks_0; // @[ClkGenSpec.scala 66:22]
  FakeBBClk bb ( // @[ClkGenSpec.scala 63:18]
    .outClk_0(bb_outClk_0),
    .outClk_1(bb_outClk_1),
    .outClk_2(bb_outClk_2),
    .inClk(bb_inClk)
  );
  SEClkDivider_1 clkDiv ( // @[ClkGenSpec.scala 66:22]
    .io_reset(clkDiv_io_reset),
    .io_inClk(clkDiv_io_inClk),
    .io_outClks_3(clkDiv_io_outClks_3),
    .io_outClks_1(clkDiv_io_outClks_1),
    .io_outClks_0(clkDiv_io_outClks_0)
  );
  assign io_bbOutClk_0 = bb_outClk_0; // @[ClkGenSpec.scala 65:15]
  assign io_bbOutClk_1 = bb_outClk_1; // @[ClkGenSpec.scala 65:15]
  assign io_bbOutClk_2 = bb_outClk_2; // @[ClkGenSpec.scala 65:15]
  assign io_clkDivOut_0 = clkDiv_io_outClks_0; // @[ClkGenSpec.scala 69:72]
  assign io_clkDivOut_1 = clkDiv_io_outClks_1; // @[ClkGenSpec.scala 69:72]
  assign io_clkDivOut_2 = clkDiv_io_outClks_3; // @[ClkGenSpec.scala 69:72]
  assign bb_inClk = io_inClk; // @[ClkGenSpec.scala 64:15]
  assign clkDiv_io_reset = reset; // @[ClkGenSpec.scala 67:19]
  assign clkDiv_io_inClk = io_inClk; // @[ClkGenSpec.scala 68:19]
endmodule
module TopModuleWithClks(
  input   clock,
  input   reset,
  output  io_gen1_bbOutClk_0,
  output  io_gen1_bbOutClk_1,
  output  io_gen1_bbOutClk_2,
  output  io_gen1_clkDivOut_0,
  output  io_gen1_clkDivOut_1,
  output  io_gen1_clkDivOut_2,
  output  io_gen2_bbOutClk_0,
  output  io_gen2_bbOutClk_1,
  output  io_gen2_bbOutClk_2,
  output  io_gen2_clkDivOut_0,
  output  io_gen2_clkDivOut_1,
  output  io_gen2_clkDivOut_2,
  output  io_gen3_bbOutClk_0,
  output  io_gen3_bbOutClk_1,
  output  io_gen3_bbOutClk_2,
  output  io_gen3_clkDivOut_0,
  output  io_gen3_clkDivOut_1,
  output  io_gen3_clkDivOut_2,
  input   io_fakeClk1,
  input   io_fakeClk2
);
  wire  gen1_reset; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_inClk; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_bbOutClk_0; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_bbOutClk_1; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_bbOutClk_2; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_clkDivOut_0; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_clkDivOut_1; // @[ClkGenSpec.scala 91:20]
  wire  gen1_io_clkDivOut_2; // @[ClkGenSpec.scala 91:20]
  wire  gen2_reset; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_inClk; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_bbOutClk_0; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_bbOutClk_1; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_bbOutClk_2; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_clkDivOut_0; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_clkDivOut_1; // @[ClkGenSpec.scala 96:20]
  wire  gen2_io_clkDivOut_2; // @[ClkGenSpec.scala 96:20]
  wire  gen3_reset; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_inClk; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_bbOutClk_0; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_bbOutClk_1; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_bbOutClk_2; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_clkDivOut_0; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_clkDivOut_1; // @[ClkGenSpec.scala 100:20]
  wire  gen3_io_clkDivOut_2; // @[ClkGenSpec.scala 100:20]
  ModWithNestedClk gen1 ( // @[ClkGenSpec.scala 91:20]
    .reset(gen1_reset),
    .io_inClk(gen1_io_inClk),
    .io_bbOutClk_0(gen1_io_bbOutClk_0),
    .io_bbOutClk_1(gen1_io_bbOutClk_1),
    .io_bbOutClk_2(gen1_io_bbOutClk_2),
    .io_clkDivOut_0(gen1_io_clkDivOut_0),
    .io_clkDivOut_1(gen1_io_clkDivOut_1),
    .io_clkDivOut_2(gen1_io_clkDivOut_2)
  );
  ModWithNestedClk_1 gen2 ( // @[ClkGenSpec.scala 96:20]
    .reset(gen2_reset),
    .io_inClk(gen2_io_inClk),
    .io_bbOutClk_0(gen2_io_bbOutClk_0),
    .io_bbOutClk_1(gen2_io_bbOutClk_1),
    .io_bbOutClk_2(gen2_io_bbOutClk_2),
    .io_clkDivOut_0(gen2_io_clkDivOut_0),
    .io_clkDivOut_1(gen2_io_clkDivOut_1),
    .io_clkDivOut_2(gen2_io_clkDivOut_2)
  );
  ModWithNestedClk_1 gen3 ( // @[ClkGenSpec.scala 100:20]
    .reset(gen3_reset),
    .io_inClk(gen3_io_inClk),
    .io_bbOutClk_0(gen3_io_bbOutClk_0),
    .io_bbOutClk_1(gen3_io_bbOutClk_1),
    .io_bbOutClk_2(gen3_io_bbOutClk_2),
    .io_clkDivOut_0(gen3_io_clkDivOut_0),
    .io_clkDivOut_1(gen3_io_clkDivOut_1),
    .io_clkDivOut_2(gen3_io_clkDivOut_2)
  );
  assign io_gen1_bbOutClk_0 = gen1_io_bbOutClk_0; // @[ClkGenSpec.scala 92:55]
  assign io_gen1_bbOutClk_1 = gen1_io_bbOutClk_1; // @[ClkGenSpec.scala 92:55]
  assign io_gen1_bbOutClk_2 = gen1_io_bbOutClk_2; // @[ClkGenSpec.scala 92:55]
  assign io_gen1_clkDivOut_0 = gen1_io_clkDivOut_0; // @[ClkGenSpec.scala 93:57]
  assign io_gen1_clkDivOut_1 = gen1_io_clkDivOut_1; // @[ClkGenSpec.scala 93:57]
  assign io_gen1_clkDivOut_2 = gen1_io_clkDivOut_2; // @[ClkGenSpec.scala 93:57]
  assign io_gen2_bbOutClk_0 = gen2_io_bbOutClk_0; // @[ClkGenSpec.scala 97:55]
  assign io_gen2_bbOutClk_1 = gen2_io_bbOutClk_1; // @[ClkGenSpec.scala 97:55]
  assign io_gen2_bbOutClk_2 = gen2_io_bbOutClk_2; // @[ClkGenSpec.scala 97:55]
  assign io_gen2_clkDivOut_0 = gen2_io_clkDivOut_0; // @[ClkGenSpec.scala 98:57]
  assign io_gen2_clkDivOut_1 = gen2_io_clkDivOut_1; // @[ClkGenSpec.scala 98:57]
  assign io_gen2_clkDivOut_2 = gen2_io_clkDivOut_2; // @[ClkGenSpec.scala 98:57]
  assign io_gen3_bbOutClk_0 = gen3_io_bbOutClk_0; // @[ClkGenSpec.scala 101:55]
  assign io_gen3_bbOutClk_1 = gen3_io_bbOutClk_1; // @[ClkGenSpec.scala 101:55]
  assign io_gen3_bbOutClk_2 = gen3_io_bbOutClk_2; // @[ClkGenSpec.scala 101:55]
  assign io_gen3_clkDivOut_0 = gen3_io_clkDivOut_0; // @[ClkGenSpec.scala 102:57]
  assign io_gen3_clkDivOut_1 = gen3_io_clkDivOut_1; // @[ClkGenSpec.scala 102:57]
  assign io_gen3_clkDivOut_2 = gen3_io_clkDivOut_2; // @[ClkGenSpec.scala 102:57]
  assign gen1_reset = reset;
  assign gen1_io_inClk = clock; // @[ClkGenSpec.scala 94:17]
  assign gen2_reset = reset;
  assign gen2_io_inClk = gen1_io_clkDivOut_2; // @[ClkGenSpec.scala 99:17]
  assign gen3_reset = reset;
  assign gen3_io_inClk = gen1_io_clkDivOut_2; // @[ClkGenSpec.scala 103:17]
endmodule
