module UsesBBAddOne(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [15:0] io_out1,
  output [15:0] io_out2,
  output [15:0] io_out3
);
  wire [15:0] bbAddOne_out; // @[BlackBoxVerilogDeliverySpec.scala 50:24]
  wire [15:0] bbAddOne_in; // @[BlackBoxVerilogDeliverySpec.scala 50:24]
  wire [15:0] bbAddTwo_out; // @[BlackBoxVerilogDeliverySpec.scala 54:24]
  wire [15:0] bbAddTwo_in; // @[BlackBoxVerilogDeliverySpec.scala 54:24]
  wire [15:0] bbAddThree_out; // @[BlackBoxVerilogDeliverySpec.scala 58:26]
  wire [15:0] bbAddThree_in; // @[BlackBoxVerilogDeliverySpec.scala 58:26]
  BBAddOne bbAddOne ( // @[BlackBoxVerilogDeliverySpec.scala 50:24]
    .out(bbAddOne_out),
    .in(bbAddOne_in)
  );
  BBAddTwo bbAddTwo ( // @[BlackBoxVerilogDeliverySpec.scala 54:24]
    .out(bbAddTwo_out),
    .in(bbAddTwo_in)
  );
  BBAddThree bbAddThree ( // @[BlackBoxVerilogDeliverySpec.scala 58:26]
    .out(bbAddThree_out),
    .in(bbAddThree_in)
  );
  assign io_out1 = bbAddOne_out; // @[BlackBoxVerilogDeliverySpec.scala 52:11]
  assign io_out2 = bbAddTwo_out; // @[BlackBoxVerilogDeliverySpec.scala 56:11]
  assign io_out3 = bbAddThree_out; // @[BlackBoxVerilogDeliverySpec.scala 60:11]
  assign bbAddOne_in = io_in; // @[BlackBoxVerilogDeliverySpec.scala 51:18]
  assign bbAddTwo_in = io_in; // @[BlackBoxVerilogDeliverySpec.scala 55:18]
  assign bbAddThree_in = io_in; // @[BlackBoxVerilogDeliverySpec.scala 59:20]
endmodule
