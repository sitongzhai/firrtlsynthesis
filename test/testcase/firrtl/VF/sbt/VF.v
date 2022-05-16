module VF(
  input        clock,
  input        reset,
  input  [7:0] io_addr,
  output [7:0] io_value
);
  wire [7:0] _GEN_1 = 4'h1 == io_addr[3:0] ? 8'h1 : 8'h0; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_2 = 4'h2 == io_addr[3:0] ? 8'h2 : _GEN_1; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_3 = 4'h3 == io_addr[3:0] ? 8'h3 : _GEN_2; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_4 = 4'h4 == io_addr[3:0] ? 8'h4 : _GEN_3; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_5 = 4'h5 == io_addr[3:0] ? 8'h5 : _GEN_4; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_6 = 4'h6 == io_addr[3:0] ? 8'h6 : _GEN_5; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_7 = 4'h7 == io_addr[3:0] ? 8'h7 : _GEN_6; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_8 = 4'h8 == io_addr[3:0] ? 8'h8 : _GEN_7; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  wire [7:0] _GEN_9 = 4'h9 == io_addr[3:0] ? 8'h9 : _GEN_8; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
  assign io_value = 4'ha == io_addr[3:0] ? 8'ha : _GEN_9; // @[VecFillSpec.scala 18:12 VecFillSpec.scala 18:12]
endmodule
