module ExampleTopModuleWithBB(
  input         clock,
  input         reset,
  input  [14:0] io_a,
  input  [14:0] io_b,
  input  [13:0] io_c,
  output [15:0] io_x,
  output [15:0] io_y,
  output [15:0] io_z,
  inout  [2:0]  io_analog1,
  inout  [2:0]  io_analog2,
  output [4:0]  io_v_0,
  output [4:0]  io_v_1,
  output [4:0]  io_v_2
);
  wire [15:0] bb_z; // @[AddIOPadsSpec.scala 68:18]
  wire [13:0] bb_c; // @[AddIOPadsSpec.scala 68:18]
  wire [14:0] _T_25 = io_a + 15'h1; // @[AddIOPadsSpec.scala 74:16]
  wire [14:0] _T_29 = io_b - 15'h1; // @[AddIOPadsSpec.scala 75:16]
  BB bb ( // @[AddIOPadsSpec.scala 68:18]
    .analog2(io_analog2),
    .analog1(io_analog1),
    .z(bb_z),
    .c(bb_c)
  );
  assign io_x = {{1'd0}, _T_25}; // @[AddIOPadsSpec.scala 74:16]
  assign io_y = {{1'd0}, _T_29}; // @[AddIOPadsSpec.scala 75:16]
  assign io_z = bb_z; // @[AddIOPadsSpec.scala 70:8]
  assign io_v_0 = io_a[4:0]; // @[AddIOPadsSpec.scala 77:29]
  assign io_v_1 = io_a[4:0]; // @[AddIOPadsSpec.scala 77:29]
  assign io_v_2 = io_a[4:0]; // @[AddIOPadsSpec.scala 77:29]
  assign bb_c = io_c; // @[AddIOPadsSpec.scala 69:11]
endmodule
