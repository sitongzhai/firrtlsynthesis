module Mux2(
  input   io_sel,
  input   io_i0,
  input   io_i1,
  output  io_out
);
  assign io_out = io_sel & io_i1 | ~io_sel & io_i0; // @[Mux2.scala 15:30]
endmodule
module Mux4(
  input   clock,
  input   reset,
  input   io_s0,
  input   io_s1,
  input   io_i0,
  input   io_i1,
  input   io_i2,
  input   io_i3,
  output  io_out
);
  wire  m0_io_sel; // @[Mux4.scala 27:18]
  wire  m0_io_i0; // @[Mux4.scala 27:18]
  wire  m0_io_i1; // @[Mux4.scala 27:18]
  wire  m0_io_out; // @[Mux4.scala 27:18]
  wire  m1_io_sel; // @[Mux4.scala 32:18]
  wire  m1_io_i0; // @[Mux4.scala 32:18]
  wire  m1_io_i1; // @[Mux4.scala 32:18]
  wire  m1_io_out; // @[Mux4.scala 32:18]
  wire  m2_io_sel; // @[Mux4.scala 37:18]
  wire  m2_io_i0; // @[Mux4.scala 37:18]
  wire  m2_io_i1; // @[Mux4.scala 37:18]
  wire  m2_io_out; // @[Mux4.scala 37:18]
  Mux2 m0 ( // @[Mux4.scala 27:18]
    .io_sel(m0_io_sel),
    .io_i0(m0_io_i0),
    .io_i1(m0_io_i1),
    .io_out(m0_io_out)
  );
  Mux2 m1 ( // @[Mux4.scala 32:18]
    .io_sel(m1_io_sel),
    .io_i0(m1_io_i0),
    .io_i1(m1_io_i1),
    .io_out(m1_io_out)
  );
  Mux2 m2 ( // @[Mux4.scala 37:18]
    .io_sel(m2_io_sel),
    .io_i0(m2_io_i0),
    .io_i1(m2_io_i1),
    .io_out(m2_io_out)
  );
  assign io_out = m2_io_out; // @[Mux4.scala 42:10]
  assign m0_io_sel = io_s0; // @[Mux4.scala 28:13]
  assign m0_io_i0 = io_i0; // @[Mux4.scala 29:13]
  assign m0_io_i1 = io_i1; // @[Mux4.scala 30:13]
  assign m1_io_sel = io_s0; // @[Mux4.scala 33:13]
  assign m1_io_i0 = io_i2; // @[Mux4.scala 34:13]
  assign m1_io_i1 = io_i3; // @[Mux4.scala 35:13]
  assign m2_io_sel = io_s1; // @[Mux4.scala 38:13]
  assign m2_io_i0 = m0_io_out; // @[Mux4.scala 39:13]
  assign m2_io_i1 = m1_io_out; // @[Mux4.scala 40:13]
endmodule
