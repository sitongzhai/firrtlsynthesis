module DirectFFT(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [63:0] io_in_bits_0_real_node,
  input  [63:0] io_in_bits_0_imaginary_node,
  input  [63:0] io_in_bits_1_real_node,
  input  [63:0] io_in_bits_1_imaginary_node,
  input  [63:0] io_in_bits_2_real_node,
  input  [63:0] io_in_bits_2_imaginary_node,
  input  [63:0] io_in_bits_3_real_node,
  input  [63:0] io_in_bits_3_imaginary_node,
  input  [63:0] io_in_bits_4_real_node,
  input  [63:0] io_in_bits_4_imaginary_node,
  input  [63:0] io_in_bits_5_real_node,
  input  [63:0] io_in_bits_5_imaginary_node,
  input  [63:0] io_in_bits_6_real_node,
  input  [63:0] io_in_bits_6_imaginary_node,
  input  [63:0] io_in_bits_7_real_node,
  input  [63:0] io_in_bits_7_imaginary_node,
  input         io_in_sync,
  output        io_out_valid,
  output [63:0] io_out_bits_0_real_node,
  output [63:0] io_out_bits_0_imaginary_node,
  output [63:0] io_out_bits_1_real_node,
  output [63:0] io_out_bits_1_imaginary_node,
  output [63:0] io_out_bits_2_real_node,
  output [63:0] io_out_bits_2_imaginary_node,
  output [63:0] io_out_bits_3_real_node,
  output [63:0] io_out_bits_3_imaginary_node,
  output [63:0] io_out_bits_4_real_node,
  output [63:0] io_out_bits_4_imaginary_node,
  output [63:0] io_out_bits_5_real_node,
  output [63:0] io_out_bits_5_imaginary_node,
  output [63:0] io_out_bits_6_real_node,
  output [63:0] io_out_bits_6_imaginary_node,
  output [63:0] io_out_bits_7_real_node,
  output [63:0] io_out_bits_7_imaginary_node,
  output        io_out_sync
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
`endif // RANDOMIZE_REG_INIT
  reg  _T_635 [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_645_en; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_645_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_645_data; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_644_data; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_644_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_644_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_644_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFSubtract_43_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_43_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_43_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_1_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_1_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_1_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_2_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_2_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_2_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_3_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_3_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_3_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_4_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_4_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_4_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_5_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_5_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_5_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_6_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_6_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_6_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFMultiply_48_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_48_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_48_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_1_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_1_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_1_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_7_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_7_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_7_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_72_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_72_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_72_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_2_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_2_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_2_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_3_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_3_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_3_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_1_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_1_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_1_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_2_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_2_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_2_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_3_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_3_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_3_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_8_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_8_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_8_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_9_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_9_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_9_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_4_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_4_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_4_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_5_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_5_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_5_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_2757_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_real_node__T_2776_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_real_node__T_2776_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2757_real_node__T_2776_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2757_real_node__T_2768_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_real_node__T_2768_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_real_node__T_2768_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_real_node__T_2768_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2757_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_imaginary_node__T_2776_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_imaginary_node__T_2776_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2757_imaginary_node__T_2776_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2757_imaginary_node__T_2768_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_imaginary_node__T_2768_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_imaginary_node__T_2768_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2757_imaginary_node__T_2768_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2791_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_real_node__T_2810_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_real_node__T_2810_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2791_real_node__T_2810_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2791_real_node__T_2802_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_real_node__T_2802_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_real_node__T_2802_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_real_node__T_2802_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2791_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_imaginary_node__T_2810_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_imaginary_node__T_2810_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2791_imaginary_node__T_2810_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2791_imaginary_node__T_2802_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_imaginary_node__T_2802_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_imaginary_node__T_2802_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2791_imaginary_node__T_2802_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_4_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_4_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_4_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_5_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_5_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_5_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_10_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_10_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_10_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_6_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_6_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_6_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_6_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_6_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_6_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_7_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_7_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_7_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_7_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_7_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_7_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_8_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_8_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_8_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_9_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_9_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_9_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_11_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_11_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_11_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_12_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_12_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_12_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_10_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_10_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_10_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_11_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_11_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_11_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_2980_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_real_node__T_2999_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_real_node__T_2999_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2980_real_node__T_2999_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2980_real_node__T_2991_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_real_node__T_2991_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_real_node__T_2991_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_real_node__T_2991_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2980_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_imaginary_node__T_2999_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_imaginary_node__T_2999_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2980_imaginary_node__T_2999_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2980_imaginary_node__T_2991_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_imaginary_node__T_2991_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_imaginary_node__T_2991_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2980_imaginary_node__T_2991_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3014_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_real_node__T_3033_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_real_node__T_3033_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3014_real_node__T_3033_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3014_real_node__T_3025_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_real_node__T_3025_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_real_node__T_3025_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_real_node__T_3025_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3014_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_imaginary_node__T_3033_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_imaginary_node__T_3033_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3014_imaginary_node__T_3033_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3014_imaginary_node__T_3025_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_imaginary_node__T_3025_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_imaginary_node__T_3025_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3014_imaginary_node__T_3025_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_8_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_8_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_8_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_9_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_9_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_9_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_13_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_13_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_13_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_12_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_12_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_12_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_10_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_10_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_10_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_11_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_11_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_11_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_13_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_13_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_13_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_14_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_14_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_14_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_15_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_15_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_15_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_14_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_14_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_14_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_15_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_15_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_15_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_16_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_16_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_16_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_17_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_17_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_17_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_3203_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_real_node__T_3222_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_real_node__T_3222_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3203_real_node__T_3222_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3203_real_node__T_3214_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_real_node__T_3214_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_real_node__T_3214_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_real_node__T_3214_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3203_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_imaginary_node__T_3222_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_imaginary_node__T_3222_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3203_imaginary_node__T_3222_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3203_imaginary_node__T_3214_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_imaginary_node__T_3214_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_imaginary_node__T_3214_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3203_imaginary_node__T_3214_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3237_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_real_node__T_3256_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_real_node__T_3256_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3237_real_node__T_3256_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3237_real_node__T_3248_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_real_node__T_3248_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_real_node__T_3248_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_real_node__T_3248_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3237_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_imaginary_node__T_3256_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_imaginary_node__T_3256_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3237_imaginary_node__T_3256_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3237_imaginary_node__T_3248_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_imaginary_node__T_3248_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_imaginary_node__T_3248_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3237_imaginary_node__T_3248_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_12_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_12_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_12_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_13_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_13_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_13_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_16_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_16_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_16_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_18_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_18_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_18_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_14_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_14_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_14_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_15_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_15_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_15_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_19_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_19_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_19_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_20_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_20_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_20_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_21_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_21_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_21_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_17_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_17_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_17_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_18_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_18_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_18_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_22_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_22_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_22_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_23_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_23_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_23_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_3426_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_real_node__T_3445_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_real_node__T_3445_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3426_real_node__T_3445_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3426_real_node__T_3437_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_real_node__T_3437_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_real_node__T_3437_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_real_node__T_3437_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3426_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_imaginary_node__T_3445_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_imaginary_node__T_3445_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3426_imaginary_node__T_3445_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3426_imaginary_node__T_3437_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_imaginary_node__T_3437_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_imaginary_node__T_3437_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3426_imaginary_node__T_3437_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3460_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_real_node__T_3479_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_real_node__T_3479_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3460_real_node__T_3479_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3460_real_node__T_3471_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_real_node__T_3471_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_real_node__T_3471_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_real_node__T_3471_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3460_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_imaginary_node__T_3479_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_imaginary_node__T_3479_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3460_imaginary_node__T_3479_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3460_imaginary_node__T_3471_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_imaginary_node__T_3471_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_imaginary_node__T_3471_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3460_imaginary_node__T_3471_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3494_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_real_node__T_3513_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_real_node__T_3513_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3494_real_node__T_3513_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3494_real_node__T_3505_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_real_node__T_3505_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_real_node__T_3505_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_real_node__T_3505_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3494_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_imaginary_node__T_3513_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_imaginary_node__T_3513_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3494_imaginary_node__T_3513_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3494_imaginary_node__T_3505_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_imaginary_node__T_3505_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_imaginary_node__T_3505_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3494_imaginary_node__T_3505_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_16_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_16_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_16_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_17_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_17_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_17_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_19_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_19_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_19_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_24_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_24_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_24_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_18_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_18_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_18_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_19_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_19_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_19_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_25_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_25_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_25_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_26_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_26_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_26_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_27_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_27_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_27_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_20_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_20_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_20_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_21_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_21_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_21_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_28_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_28_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_28_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_29_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_29_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_29_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_3683_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_real_node__T_3702_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_real_node__T_3702_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3683_real_node__T_3702_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3683_real_node__T_3694_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_real_node__T_3694_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_real_node__T_3694_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_real_node__T_3694_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3683_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_imaginary_node__T_3702_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_imaginary_node__T_3702_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3683_imaginary_node__T_3702_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3683_imaginary_node__T_3694_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_imaginary_node__T_3694_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_imaginary_node__T_3694_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3683_imaginary_node__T_3694_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3717_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_real_node__T_3736_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_real_node__T_3736_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3717_real_node__T_3736_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3717_real_node__T_3728_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_real_node__T_3728_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_real_node__T_3728_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_real_node__T_3728_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3717_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_imaginary_node__T_3736_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_imaginary_node__T_3736_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3717_imaginary_node__T_3736_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3717_imaginary_node__T_3728_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_imaginary_node__T_3728_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_imaginary_node__T_3728_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3717_imaginary_node__T_3728_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3751_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_real_node__T_3770_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_real_node__T_3770_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3751_real_node__T_3770_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3751_real_node__T_3762_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_real_node__T_3762_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_real_node__T_3762_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_real_node__T_3762_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3751_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_imaginary_node__T_3770_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_imaginary_node__T_3770_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3751_imaginary_node__T_3770_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3751_imaginary_node__T_3762_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_imaginary_node__T_3762_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_imaginary_node__T_3762_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3751_imaginary_node__T_3762_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_20_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_20_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_20_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_21_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_21_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_21_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_22_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_22_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_22_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_30_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_30_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_30_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_22_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_22_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_22_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_23_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_23_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_23_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_31_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_31_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_31_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_32_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_32_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_32_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_33_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_33_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_33_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_23_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_23_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_23_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_24_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_24_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_24_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_34_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_34_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_34_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_35_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_35_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_35_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_3940_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_real_node__T_3959_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_real_node__T_3959_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3940_real_node__T_3959_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3940_real_node__T_3951_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_real_node__T_3951_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_real_node__T_3951_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_real_node__T_3951_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3940_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_imaginary_node__T_3959_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_imaginary_node__T_3959_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3940_imaginary_node__T_3959_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3940_imaginary_node__T_3951_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_imaginary_node__T_3951_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_imaginary_node__T_3951_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3940_imaginary_node__T_3951_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3974_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_real_node__T_3993_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_real_node__T_3993_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3974_real_node__T_3993_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3974_real_node__T_3985_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_real_node__T_3985_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_real_node__T_3985_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_real_node__T_3985_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3974_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_imaginary_node__T_3993_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_imaginary_node__T_3993_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3974_imaginary_node__T_3993_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3974_imaginary_node__T_3985_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_imaginary_node__T_3985_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_imaginary_node__T_3985_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3974_imaginary_node__T_3985_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4008_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_real_node__T_4027_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_real_node__T_4027_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4008_real_node__T_4027_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4008_real_node__T_4019_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_real_node__T_4019_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_real_node__T_4019_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_real_node__T_4019_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4008_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_imaginary_node__T_4027_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_imaginary_node__T_4027_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4008_imaginary_node__T_4027_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4008_imaginary_node__T_4019_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_imaginary_node__T_4019_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_imaginary_node__T_4019_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4008_imaginary_node__T_4019_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_24_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_24_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_24_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_25_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_25_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_25_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_25_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_25_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_25_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_36_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_36_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_36_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_26_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_26_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_26_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_27_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_27_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_27_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_37_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_37_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_37_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_38_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_38_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_38_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_39_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_39_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_39_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_26_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_26_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_26_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_27_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_27_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_27_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_40_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_40_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_40_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_41_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_41_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_41_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_4197_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_real_node__T_4216_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_real_node__T_4216_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4197_real_node__T_4216_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4197_real_node__T_4208_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_real_node__T_4208_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_real_node__T_4208_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_real_node__T_4208_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4197_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_imaginary_node__T_4216_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_imaginary_node__T_4216_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4197_imaginary_node__T_4216_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4197_imaginary_node__T_4208_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_imaginary_node__T_4208_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_imaginary_node__T_4208_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4197_imaginary_node__T_4208_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4231_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_real_node__T_4250_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_real_node__T_4250_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4231_real_node__T_4250_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4231_real_node__T_4242_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_real_node__T_4242_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_real_node__T_4242_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_real_node__T_4242_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4231_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_imaginary_node__T_4250_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_imaginary_node__T_4250_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4231_imaginary_node__T_4250_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4231_imaginary_node__T_4242_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_imaginary_node__T_4242_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_imaginary_node__T_4242_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4231_imaginary_node__T_4242_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4265_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_real_node__T_4284_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_real_node__T_4284_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4265_real_node__T_4284_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4265_real_node__T_4276_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_real_node__T_4276_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_real_node__T_4276_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_real_node__T_4276_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4265_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_imaginary_node__T_4284_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_imaginary_node__T_4284_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4265_imaginary_node__T_4284_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4265_imaginary_node__T_4276_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_imaginary_node__T_4276_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_imaginary_node__T_4276_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4265_imaginary_node__T_4276_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_28_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_28_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_28_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_29_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_29_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_29_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_28_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_28_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_28_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_42_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_42_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_42_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_30_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_30_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_30_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_31_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_31_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_31_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_43_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_43_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_43_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_44_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_44_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_44_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_45_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_45_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_45_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_29_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_29_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_29_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_30_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_30_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_30_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_46_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_46_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_46_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_47_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_47_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_47_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_4454_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_real_node__T_4473_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_real_node__T_4473_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4454_real_node__T_4473_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4454_real_node__T_4465_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_real_node__T_4465_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_real_node__T_4465_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_real_node__T_4465_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4454_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_imaginary_node__T_4473_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_imaginary_node__T_4473_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4454_imaginary_node__T_4473_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4454_imaginary_node__T_4465_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_imaginary_node__T_4465_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_imaginary_node__T_4465_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4454_imaginary_node__T_4465_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4488_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_real_node__T_4507_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_real_node__T_4507_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4488_real_node__T_4507_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4488_real_node__T_4499_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_real_node__T_4499_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_real_node__T_4499_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_real_node__T_4499_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4488_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_imaginary_node__T_4507_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_imaginary_node__T_4507_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4488_imaginary_node__T_4507_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4488_imaginary_node__T_4499_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_imaginary_node__T_4499_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_imaginary_node__T_4499_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4488_imaginary_node__T_4499_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4522_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_real_node__T_4544_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_real_node__T_4544_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4522_real_node__T_4544_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4522_real_node__T_4537_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_real_node__T_4537_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_real_node__T_4537_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_real_node__T_4537_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4522_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_imaginary_node__T_4544_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_imaginary_node__T_4544_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4522_imaginary_node__T_4544_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4522_imaginary_node__T_4537_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_imaginary_node__T_4537_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_imaginary_node__T_4537_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4522_imaginary_node__T_4537_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_32_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_32_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_32_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_33_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_33_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_33_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_31_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_31_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_31_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_48_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_48_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_48_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_34_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_34_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_34_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_35_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_35_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_35_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_49_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_49_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_49_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_50_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_50_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_50_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_51_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_51_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_51_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_32_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_32_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_32_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_33_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_33_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_33_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_52_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_52_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_52_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_53_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_53_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_53_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_4714_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4736_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4736_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_real_node__T_4736_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_real_node__T_4729_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4729_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4729_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4729_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4714_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4736_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4736_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_imaginary_node__T_4736_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_imaginary_node__T_4729_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4729_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4729_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4729_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_36_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_36_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_36_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_37_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_37_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_37_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_34_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_34_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_34_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_54_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_54_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_54_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_38_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_38_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_38_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_39_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_39_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_39_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_55_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_55_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_55_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_56_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_56_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_56_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_57_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_57_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_57_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_35_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_35_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_35_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_36_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_36_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_36_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_58_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_58_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_58_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_59_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_59_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_59_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_4906_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_real_node__T_4928_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_real_node__T_4928_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4906_real_node__T_4928_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4906_real_node__T_4921_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_real_node__T_4921_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_real_node__T_4921_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_real_node__T_4921_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4906_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_imaginary_node__T_4928_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_imaginary_node__T_4928_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4906_imaginary_node__T_4928_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4906_imaginary_node__T_4921_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_imaginary_node__T_4921_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_imaginary_node__T_4921_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4906_imaginary_node__T_4921_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_40_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_40_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_40_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_41_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_41_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_41_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_37_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_37_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_37_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_60_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_60_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_60_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_42_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_42_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_42_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_43_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_43_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_43_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_61_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_61_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_61_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_62_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_62_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_62_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_63_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_63_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_63_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_38_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_38_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_38_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_39_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_39_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_39_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_64_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_64_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_64_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_65_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_65_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_65_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_5098_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_real_node__T_5120_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_real_node__T_5120_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5098_real_node__T_5120_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5098_real_node__T_5113_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_real_node__T_5113_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_real_node__T_5113_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_real_node__T_5113_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5098_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_imaginary_node__T_5120_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_imaginary_node__T_5120_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5098_imaginary_node__T_5120_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5098_imaginary_node__T_5113_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_imaginary_node__T_5113_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_imaginary_node__T_5113_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5098_imaginary_node__T_5113_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_44_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_44_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_44_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_45_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_45_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_45_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_40_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_40_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_40_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_66_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_66_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_66_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_46_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_46_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_46_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_47_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_47_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_47_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_67_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_67_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_67_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_68_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_68_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_68_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_69_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_69_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_69_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_41_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_41_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_41_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_42_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_42_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_42_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_70_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_70_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_70_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_71_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_71_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_71_1_in1; // @[DspReal.scala 98:36]
  wire  _T_624 = io_in_sync & io_in_valid; // @[FFT.scala 32:66]
  reg  sync; // @[Counter.scala 15:29]
  reg  _T_637; // @[Counter.scala 15:29]
  wire [3:0] start = sync * 3'h7; // @[FFT.scala 43:19]
  wire [4:0] _T_1298 = {{1'd0}, start}; // @[FFT.scala 49:67]
  wire [2:0] _GEN_11 = 4'h3 == _T_1298[3:0] ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_12 = 4'h4 == _T_1298[3:0] ? 3'h4 : _GEN_11; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_13 = 4'h5 == _T_1298[3:0] ? 3'h2 : _GEN_12; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_14 = 4'h6 == _T_1298[3:0] ? 3'h6 : _GEN_13; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_15 = 4'h7 == _T_1298[3:0] ? 3'h4 : _GEN_14; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_16 = 4'h8 == _T_1298[3:0] ? 3'h2 : _GEN_15; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_17 = 4'h9 == _T_1298[3:0] ? 3'h1 : _GEN_16; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_18 = 4'ha == _T_1298[3:0] ? 3'h5 : _GEN_17; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_19 = 4'hb == _T_1298[3:0] ? 3'h6 : _GEN_18; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_20 = 4'hc == _T_1298[3:0] ? 3'h3 : _GEN_19; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_21 = 4'hd == _T_1298[3:0] ? 3'h7 : _GEN_20; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_37 = 2'h1 == _GEN_21[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_38 = 2'h2 == _GEN_21[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_37; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_39 = 2'h3 == _GEN_21[1:0] ? 64'h3fd87de2a6aea964 : _GEN_38; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_41 = 2'h1 == _GEN_21[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_42 = 2'h2 == _GEN_21[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_41; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_43 = 2'h3 == _GEN_21[1:0] ? 64'hbfed906bcf328d46 : _GEN_42; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1323_node = BBFSubtract_43_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1360 = start + 4'h1; // @[FFT.scala 49:67]
  wire [2:0] _GEN_69 = 4'h3 == _T_1360 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_70 = 4'h4 == _T_1360 ? 3'h4 : _GEN_69; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_71 = 4'h5 == _T_1360 ? 3'h2 : _GEN_70; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_72 = 4'h6 == _T_1360 ? 3'h6 : _GEN_71; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_73 = 4'h7 == _T_1360 ? 3'h4 : _GEN_72; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_74 = 4'h8 == _T_1360 ? 3'h2 : _GEN_73; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_75 = 4'h9 == _T_1360 ? 3'h1 : _GEN_74; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_76 = 4'ha == _T_1360 ? 3'h5 : _GEN_75; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_77 = 4'hb == _T_1360 ? 3'h6 : _GEN_76; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_78 = 4'hc == _T_1360 ? 3'h3 : _GEN_77; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_79 = 4'hd == _T_1360 ? 3'h7 : _GEN_78; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_95 = 2'h1 == _GEN_79[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_96 = 2'h2 == _GEN_79[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_95; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_97 = 2'h3 == _GEN_79[1:0] ? 64'h3fd87de2a6aea964 : _GEN_96; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_99 = 2'h1 == _GEN_79[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_100 = 2'h2 == _GEN_79[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_99; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_101 = 2'h3 == _GEN_79[1:0] ? 64'hbfed906bcf328d46 : _GEN_100; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1384_node = BBFSubtract_1_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1421 = start + 4'h2; // @[FFT.scala 49:67]
  wire [2:0] _GEN_127 = 4'h3 == _T_1421 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_128 = 4'h4 == _T_1421 ? 3'h4 : _GEN_127; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_129 = 4'h5 == _T_1421 ? 3'h2 : _GEN_128; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_130 = 4'h6 == _T_1421 ? 3'h6 : _GEN_129; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_131 = 4'h7 == _T_1421 ? 3'h4 : _GEN_130; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_132 = 4'h8 == _T_1421 ? 3'h2 : _GEN_131; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_133 = 4'h9 == _T_1421 ? 3'h1 : _GEN_132; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_134 = 4'ha == _T_1421 ? 3'h5 : _GEN_133; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_135 = 4'hb == _T_1421 ? 3'h6 : _GEN_134; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_136 = 4'hc == _T_1421 ? 3'h3 : _GEN_135; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_137 = 4'hd == _T_1421 ? 3'h7 : _GEN_136; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_153 = 2'h1 == _GEN_137[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_154 = 2'h2 == _GEN_137[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_153; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_155 = 2'h3 == _GEN_137[1:0] ? 64'h3fd87de2a6aea964 : _GEN_154; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_157 = 2'h1 == _GEN_137[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_158 = 2'h2 == _GEN_137[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_157; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_159 = 2'h3 == _GEN_137[1:0] ? 64'hbfed906bcf328d46 : _GEN_158; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1445_node = BBFSubtract_2_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1482 = start + 4'h3; // @[FFT.scala 49:67]
  wire [2:0] _GEN_185 = 4'h3 == _T_1482 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_186 = 4'h4 == _T_1482 ? 3'h4 : _GEN_185; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_187 = 4'h5 == _T_1482 ? 3'h2 : _GEN_186; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_188 = 4'h6 == _T_1482 ? 3'h6 : _GEN_187; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_189 = 4'h7 == _T_1482 ? 3'h4 : _GEN_188; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_190 = 4'h8 == _T_1482 ? 3'h2 : _GEN_189; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_191 = 4'h9 == _T_1482 ? 3'h1 : _GEN_190; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_192 = 4'ha == _T_1482 ? 3'h5 : _GEN_191; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_193 = 4'hb == _T_1482 ? 3'h6 : _GEN_192; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_194 = 4'hc == _T_1482 ? 3'h3 : _GEN_193; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_195 = 4'hd == _T_1482 ? 3'h7 : _GEN_194; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_211 = 2'h1 == _GEN_195[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_212 = 2'h2 == _GEN_195[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_211; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_213 = 2'h3 == _GEN_195[1:0] ? 64'h3fd87de2a6aea964 : _GEN_212; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_215 = 2'h1 == _GEN_195[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_216 = 2'h2 == _GEN_195[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_215; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_217 = 2'h3 == _GEN_195[1:0] ? 64'hbfed906bcf328d46 : _GEN_216; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1506_node = BBFSubtract_3_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1543 = start + 4'h4; // @[FFT.scala 49:67]
  wire [2:0] _GEN_243 = 4'h3 == _T_1543 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_244 = 4'h4 == _T_1543 ? 3'h4 : _GEN_243; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_245 = 4'h5 == _T_1543 ? 3'h2 : _GEN_244; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_246 = 4'h6 == _T_1543 ? 3'h6 : _GEN_245; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_247 = 4'h7 == _T_1543 ? 3'h4 : _GEN_246; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_248 = 4'h8 == _T_1543 ? 3'h2 : _GEN_247; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_249 = 4'h9 == _T_1543 ? 3'h1 : _GEN_248; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_250 = 4'ha == _T_1543 ? 3'h5 : _GEN_249; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_251 = 4'hb == _T_1543 ? 3'h6 : _GEN_250; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_252 = 4'hc == _T_1543 ? 3'h3 : _GEN_251; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_253 = 4'hd == _T_1543 ? 3'h7 : _GEN_252; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_269 = 2'h1 == _GEN_253[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_270 = 2'h2 == _GEN_253[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_269; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_271 = 2'h3 == _GEN_253[1:0] ? 64'h3fd87de2a6aea964 : _GEN_270; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_273 = 2'h1 == _GEN_253[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_274 = 2'h2 == _GEN_253[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_273; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_275 = 2'h3 == _GEN_253[1:0] ? 64'hbfed906bcf328d46 : _GEN_274; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1567_node = BBFSubtract_4_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1604 = start + 4'h5; // @[FFT.scala 49:67]
  wire [2:0] _GEN_301 = 4'h3 == _T_1604 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_302 = 4'h4 == _T_1604 ? 3'h4 : _GEN_301; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_303 = 4'h5 == _T_1604 ? 3'h2 : _GEN_302; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_304 = 4'h6 == _T_1604 ? 3'h6 : _GEN_303; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_305 = 4'h7 == _T_1604 ? 3'h4 : _GEN_304; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_306 = 4'h8 == _T_1604 ? 3'h2 : _GEN_305; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_307 = 4'h9 == _T_1604 ? 3'h1 : _GEN_306; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_308 = 4'ha == _T_1604 ? 3'h5 : _GEN_307; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_309 = 4'hb == _T_1604 ? 3'h6 : _GEN_308; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_310 = 4'hc == _T_1604 ? 3'h3 : _GEN_309; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_311 = 4'hd == _T_1604 ? 3'h7 : _GEN_310; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_327 = 2'h1 == _GEN_311[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_328 = 2'h2 == _GEN_311[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_327; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_329 = 2'h3 == _GEN_311[1:0] ? 64'h3fd87de2a6aea964 : _GEN_328; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_331 = 2'h1 == _GEN_311[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_332 = 2'h2 == _GEN_311[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_331; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_333 = 2'h3 == _GEN_311[1:0] ? 64'hbfed906bcf328d46 : _GEN_332; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1628_node = BBFSubtract_5_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1665 = start + 4'h6; // @[FFT.scala 49:67]
  wire [2:0] _GEN_359 = 4'h3 == _T_1665 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_360 = 4'h4 == _T_1665 ? 3'h4 : _GEN_359; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_361 = 4'h5 == _T_1665 ? 3'h2 : _GEN_360; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_362 = 4'h6 == _T_1665 ? 3'h6 : _GEN_361; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_363 = 4'h7 == _T_1665 ? 3'h4 : _GEN_362; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_364 = 4'h8 == _T_1665 ? 3'h2 : _GEN_363; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_365 = 4'h9 == _T_1665 ? 3'h1 : _GEN_364; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_366 = 4'ha == _T_1665 ? 3'h5 : _GEN_365; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_367 = 4'hb == _T_1665 ? 3'h6 : _GEN_366; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_368 = 4'hc == _T_1665 ? 3'h3 : _GEN_367; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_369 = 4'hd == _T_1665 ? 3'h7 : _GEN_368; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_385 = 2'h1 == _GEN_369[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_386 = 2'h2 == _GEN_369[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_385; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_387 = 2'h3 == _GEN_369[1:0] ? 64'h3fd87de2a6aea964 : _GEN_386; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_389 = 2'h1 == _GEN_369[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_390 = 2'h2 == _GEN_369[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_389; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_391 = 2'h3 == _GEN_369[1:0] ? 64'hbfed906bcf328d46 : _GEN_390; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1689_node = BBFSubtract_6_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  reg  _T_4524; // @[Counter.scala 15:29]
  reg  _T_4716; // @[Counter.scala 15:29]
  reg  _T_4908; // @[Counter.scala 15:29]
  reg  _T_5100; // @[Counter.scala 15:29]
  BBFSubtract BBFSubtract_43 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_43_out),
    .in2(BBFSubtract_43_in2),
    .in1(BBFSubtract_43_in1)
  );
  BBFSubtract BBFSubtract_1_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_1_1_out),
    .in2(BBFSubtract_1_1_in2),
    .in1(BBFSubtract_1_1_in1)
  );
  BBFSubtract BBFSubtract_2_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_2_1_out),
    .in2(BBFSubtract_2_1_in2),
    .in1(BBFSubtract_2_1_in1)
  );
  BBFSubtract BBFSubtract_3_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_3_1_out),
    .in2(BBFSubtract_3_1_in2),
    .in1(BBFSubtract_3_1_in1)
  );
  BBFSubtract BBFSubtract_4_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_4_1_out),
    .in2(BBFSubtract_4_1_in2),
    .in1(BBFSubtract_4_1_in1)
  );
  BBFSubtract BBFSubtract_5_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_5_1_out),
    .in2(BBFSubtract_5_1_in2),
    .in1(BBFSubtract_5_1_in1)
  );
  BBFSubtract BBFSubtract_6_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_6_1_out),
    .in2(BBFSubtract_6_1_in2),
    .in1(BBFSubtract_6_1_in1)
  );
  BBFMultiply BBFMultiply_48 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_48_out),
    .in2(BBFMultiply_48_in2),
    .in1(BBFMultiply_48_in1)
  );
  BBFMultiply BBFMultiply_1_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_1_1_out),
    .in2(BBFMultiply_1_1_in2),
    .in1(BBFMultiply_1_1_in1)
  );
  BBFSubtract BBFSubtract_7_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_7_1_out),
    .in2(BBFSubtract_7_1_in2),
    .in1(BBFSubtract_7_1_in1)
  );
  BBFAdd BBFAdd_72 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_72_out),
    .in2(BBFAdd_72_in2),
    .in1(BBFAdd_72_in1)
  );
  BBFMultiply BBFMultiply_2_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_2_1_out),
    .in2(BBFMultiply_2_1_in2),
    .in1(BBFMultiply_2_1_in1)
  );
  BBFMultiply BBFMultiply_3_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_3_1_out),
    .in2(BBFMultiply_3_1_in2),
    .in1(BBFMultiply_3_1_in1)
  );
  BBFAdd BBFAdd_1_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_1_1_out),
    .in2(BBFAdd_1_1_in2),
    .in1(BBFAdd_1_1_in1)
  );
  BBFAdd BBFAdd_2_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_2_1_out),
    .in2(BBFAdd_2_1_in2),
    .in1(BBFAdd_2_1_in1)
  );
  BBFAdd BBFAdd_3_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_3_1_out),
    .in2(BBFAdd_3_1_in2),
    .in1(BBFAdd_3_1_in1)
  );
  BBFSubtract BBFSubtract_8_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_8_1_out),
    .in2(BBFSubtract_8_1_in2),
    .in1(BBFSubtract_8_1_in1)
  );
  BBFSubtract BBFSubtract_9_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_9_1_out),
    .in2(BBFSubtract_9_1_in2),
    .in1(BBFSubtract_9_1_in1)
  );
  BBFAdd BBFAdd_4_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_4_1_out),
    .in2(BBFAdd_4_1_in2),
    .in1(BBFAdd_4_1_in1)
  );
  BBFAdd BBFAdd_5_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_5_1_out),
    .in2(BBFAdd_5_1_in2),
    .in1(BBFAdd_5_1_in1)
  );
  BBFMultiply BBFMultiply_4_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_4_1_out),
    .in2(BBFMultiply_4_1_in2),
    .in1(BBFMultiply_4_1_in1)
  );
  BBFMultiply BBFMultiply_5_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_5_1_out),
    .in2(BBFMultiply_5_1_in2),
    .in1(BBFMultiply_5_1_in1)
  );
  BBFSubtract BBFSubtract_10_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_10_1_out),
    .in2(BBFSubtract_10_1_in2),
    .in1(BBFSubtract_10_1_in1)
  );
  BBFAdd BBFAdd_6_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_6_1_out),
    .in2(BBFAdd_6_1_in2),
    .in1(BBFAdd_6_1_in1)
  );
  BBFMultiply BBFMultiply_6_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_6_1_out),
    .in2(BBFMultiply_6_1_in2),
    .in1(BBFMultiply_6_1_in1)
  );
  BBFMultiply BBFMultiply_7_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_7_1_out),
    .in2(BBFMultiply_7_1_in2),
    .in1(BBFMultiply_7_1_in1)
  );
  BBFAdd BBFAdd_7_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_7_1_out),
    .in2(BBFAdd_7_1_in2),
    .in1(BBFAdd_7_1_in1)
  );
  BBFAdd BBFAdd_8_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_8_1_out),
    .in2(BBFAdd_8_1_in2),
    .in1(BBFAdd_8_1_in1)
  );
  BBFAdd BBFAdd_9_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_9_1_out),
    .in2(BBFAdd_9_1_in2),
    .in1(BBFAdd_9_1_in1)
  );
  BBFSubtract BBFSubtract_11_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_11_1_out),
    .in2(BBFSubtract_11_1_in2),
    .in1(BBFSubtract_11_1_in1)
  );
  BBFSubtract BBFSubtract_12_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_12_1_out),
    .in2(BBFSubtract_12_1_in2),
    .in1(BBFSubtract_12_1_in1)
  );
  BBFAdd BBFAdd_10_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_10_1_out),
    .in2(BBFAdd_10_1_in2),
    .in1(BBFAdd_10_1_in1)
  );
  BBFAdd BBFAdd_11_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_11_1_out),
    .in2(BBFAdd_11_1_in2),
    .in1(BBFAdd_11_1_in1)
  );
  BBFMultiply BBFMultiply_8_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_8_1_out),
    .in2(BBFMultiply_8_1_in2),
    .in1(BBFMultiply_8_1_in1)
  );
  BBFMultiply BBFMultiply_9_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_9_1_out),
    .in2(BBFMultiply_9_1_in2),
    .in1(BBFMultiply_9_1_in1)
  );
  BBFSubtract BBFSubtract_13_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_13_1_out),
    .in2(BBFSubtract_13_1_in2),
    .in1(BBFSubtract_13_1_in1)
  );
  BBFAdd BBFAdd_12_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_12_1_out),
    .in2(BBFAdd_12_1_in2),
    .in1(BBFAdd_12_1_in1)
  );
  BBFMultiply BBFMultiply_10_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_10_1_out),
    .in2(BBFMultiply_10_1_in2),
    .in1(BBFMultiply_10_1_in1)
  );
  BBFMultiply BBFMultiply_11_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_11_1_out),
    .in2(BBFMultiply_11_1_in2),
    .in1(BBFMultiply_11_1_in1)
  );
  BBFAdd BBFAdd_13_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_13_1_out),
    .in2(BBFAdd_13_1_in2),
    .in1(BBFAdd_13_1_in1)
  );
  BBFAdd BBFAdd_14_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_14_1_out),
    .in2(BBFAdd_14_1_in2),
    .in1(BBFAdd_14_1_in1)
  );
  BBFAdd BBFAdd_15_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_15_1_out),
    .in2(BBFAdd_15_1_in2),
    .in1(BBFAdd_15_1_in1)
  );
  BBFSubtract BBFSubtract_14_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_14_1_out),
    .in2(BBFSubtract_14_1_in2),
    .in1(BBFSubtract_14_1_in1)
  );
  BBFSubtract BBFSubtract_15_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_15_1_out),
    .in2(BBFSubtract_15_1_in2),
    .in1(BBFSubtract_15_1_in1)
  );
  BBFAdd BBFAdd_16_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_16_1_out),
    .in2(BBFAdd_16_1_in2),
    .in1(BBFAdd_16_1_in1)
  );
  BBFAdd BBFAdd_17_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_17_1_out),
    .in2(BBFAdd_17_1_in2),
    .in1(BBFAdd_17_1_in1)
  );
  BBFMultiply BBFMultiply_12_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_12_1_out),
    .in2(BBFMultiply_12_1_in2),
    .in1(BBFMultiply_12_1_in1)
  );
  BBFMultiply BBFMultiply_13_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_13_1_out),
    .in2(BBFMultiply_13_1_in2),
    .in1(BBFMultiply_13_1_in1)
  );
  BBFSubtract BBFSubtract_16_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_16_1_out),
    .in2(BBFSubtract_16_1_in2),
    .in1(BBFSubtract_16_1_in1)
  );
  BBFAdd BBFAdd_18_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_18_1_out),
    .in2(BBFAdd_18_1_in2),
    .in1(BBFAdd_18_1_in1)
  );
  BBFMultiply BBFMultiply_14_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_14_1_out),
    .in2(BBFMultiply_14_1_in2),
    .in1(BBFMultiply_14_1_in1)
  );
  BBFMultiply BBFMultiply_15_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_15_1_out),
    .in2(BBFMultiply_15_1_in2),
    .in1(BBFMultiply_15_1_in1)
  );
  BBFAdd BBFAdd_19_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_19_1_out),
    .in2(BBFAdd_19_1_in2),
    .in1(BBFAdd_19_1_in1)
  );
  BBFAdd BBFAdd_20_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_20_1_out),
    .in2(BBFAdd_20_1_in2),
    .in1(BBFAdd_20_1_in1)
  );
  BBFAdd BBFAdd_21_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_21_1_out),
    .in2(BBFAdd_21_1_in2),
    .in1(BBFAdd_21_1_in1)
  );
  BBFSubtract BBFSubtract_17_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_17_1_out),
    .in2(BBFSubtract_17_1_in2),
    .in1(BBFSubtract_17_1_in1)
  );
  BBFSubtract BBFSubtract_18_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_18_1_out),
    .in2(BBFSubtract_18_1_in2),
    .in1(BBFSubtract_18_1_in1)
  );
  BBFAdd BBFAdd_22_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_22_1_out),
    .in2(BBFAdd_22_1_in2),
    .in1(BBFAdd_22_1_in1)
  );
  BBFAdd BBFAdd_23_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_23_1_out),
    .in2(BBFAdd_23_1_in2),
    .in1(BBFAdd_23_1_in1)
  );
  BBFMultiply BBFMultiply_16_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_16_1_out),
    .in2(BBFMultiply_16_1_in2),
    .in1(BBFMultiply_16_1_in1)
  );
  BBFMultiply BBFMultiply_17_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_17_1_out),
    .in2(BBFMultiply_17_1_in2),
    .in1(BBFMultiply_17_1_in1)
  );
  BBFSubtract BBFSubtract_19_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_19_1_out),
    .in2(BBFSubtract_19_1_in2),
    .in1(BBFSubtract_19_1_in1)
  );
  BBFAdd BBFAdd_24_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_24_1_out),
    .in2(BBFAdd_24_1_in2),
    .in1(BBFAdd_24_1_in1)
  );
  BBFMultiply BBFMultiply_18_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_18_1_out),
    .in2(BBFMultiply_18_1_in2),
    .in1(BBFMultiply_18_1_in1)
  );
  BBFMultiply BBFMultiply_19_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_19_1_out),
    .in2(BBFMultiply_19_1_in2),
    .in1(BBFMultiply_19_1_in1)
  );
  BBFAdd BBFAdd_25_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_25_1_out),
    .in2(BBFAdd_25_1_in2),
    .in1(BBFAdd_25_1_in1)
  );
  BBFAdd BBFAdd_26_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_26_1_out),
    .in2(BBFAdd_26_1_in2),
    .in1(BBFAdd_26_1_in1)
  );
  BBFAdd BBFAdd_27_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_27_1_out),
    .in2(BBFAdd_27_1_in2),
    .in1(BBFAdd_27_1_in1)
  );
  BBFSubtract BBFSubtract_20_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_20_1_out),
    .in2(BBFSubtract_20_1_in2),
    .in1(BBFSubtract_20_1_in1)
  );
  BBFSubtract BBFSubtract_21_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_21_1_out),
    .in2(BBFSubtract_21_1_in2),
    .in1(BBFSubtract_21_1_in1)
  );
  BBFAdd BBFAdd_28_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_28_1_out),
    .in2(BBFAdd_28_1_in2),
    .in1(BBFAdd_28_1_in1)
  );
  BBFAdd BBFAdd_29_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_29_1_out),
    .in2(BBFAdd_29_1_in2),
    .in1(BBFAdd_29_1_in1)
  );
  BBFMultiply BBFMultiply_20_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_20_1_out),
    .in2(BBFMultiply_20_1_in2),
    .in1(BBFMultiply_20_1_in1)
  );
  BBFMultiply BBFMultiply_21_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_21_1_out),
    .in2(BBFMultiply_21_1_in2),
    .in1(BBFMultiply_21_1_in1)
  );
  BBFSubtract BBFSubtract_22_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_22_1_out),
    .in2(BBFSubtract_22_1_in2),
    .in1(BBFSubtract_22_1_in1)
  );
  BBFAdd BBFAdd_30_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_30_1_out),
    .in2(BBFAdd_30_1_in2),
    .in1(BBFAdd_30_1_in1)
  );
  BBFMultiply BBFMultiply_22_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_22_1_out),
    .in2(BBFMultiply_22_1_in2),
    .in1(BBFMultiply_22_1_in1)
  );
  BBFMultiply BBFMultiply_23_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_23_1_out),
    .in2(BBFMultiply_23_1_in2),
    .in1(BBFMultiply_23_1_in1)
  );
  BBFAdd BBFAdd_31_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_31_1_out),
    .in2(BBFAdd_31_1_in2),
    .in1(BBFAdd_31_1_in1)
  );
  BBFAdd BBFAdd_32_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_32_1_out),
    .in2(BBFAdd_32_1_in2),
    .in1(BBFAdd_32_1_in1)
  );
  BBFAdd BBFAdd_33_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_33_1_out),
    .in2(BBFAdd_33_1_in2),
    .in1(BBFAdd_33_1_in1)
  );
  BBFSubtract BBFSubtract_23_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_23_1_out),
    .in2(BBFSubtract_23_1_in2),
    .in1(BBFSubtract_23_1_in1)
  );
  BBFSubtract BBFSubtract_24_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_24_1_out),
    .in2(BBFSubtract_24_1_in2),
    .in1(BBFSubtract_24_1_in1)
  );
  BBFAdd BBFAdd_34_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_34_1_out),
    .in2(BBFAdd_34_1_in2),
    .in1(BBFAdd_34_1_in1)
  );
  BBFAdd BBFAdd_35_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_35_1_out),
    .in2(BBFAdd_35_1_in2),
    .in1(BBFAdd_35_1_in1)
  );
  BBFMultiply BBFMultiply_24_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_24_1_out),
    .in2(BBFMultiply_24_1_in2),
    .in1(BBFMultiply_24_1_in1)
  );
  BBFMultiply BBFMultiply_25_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_25_1_out),
    .in2(BBFMultiply_25_1_in2),
    .in1(BBFMultiply_25_1_in1)
  );
  BBFSubtract BBFSubtract_25_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_25_1_out),
    .in2(BBFSubtract_25_1_in2),
    .in1(BBFSubtract_25_1_in1)
  );
  BBFAdd BBFAdd_36_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_36_1_out),
    .in2(BBFAdd_36_1_in2),
    .in1(BBFAdd_36_1_in1)
  );
  BBFMultiply BBFMultiply_26_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_26_1_out),
    .in2(BBFMultiply_26_1_in2),
    .in1(BBFMultiply_26_1_in1)
  );
  BBFMultiply BBFMultiply_27_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_27_1_out),
    .in2(BBFMultiply_27_1_in2),
    .in1(BBFMultiply_27_1_in1)
  );
  BBFAdd BBFAdd_37_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_37_1_out),
    .in2(BBFAdd_37_1_in2),
    .in1(BBFAdd_37_1_in1)
  );
  BBFAdd BBFAdd_38_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_38_1_out),
    .in2(BBFAdd_38_1_in2),
    .in1(BBFAdd_38_1_in1)
  );
  BBFAdd BBFAdd_39_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_39_1_out),
    .in2(BBFAdd_39_1_in2),
    .in1(BBFAdd_39_1_in1)
  );
  BBFSubtract BBFSubtract_26_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_26_1_out),
    .in2(BBFSubtract_26_1_in2),
    .in1(BBFSubtract_26_1_in1)
  );
  BBFSubtract BBFSubtract_27_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_27_1_out),
    .in2(BBFSubtract_27_1_in2),
    .in1(BBFSubtract_27_1_in1)
  );
  BBFAdd BBFAdd_40_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_40_1_out),
    .in2(BBFAdd_40_1_in2),
    .in1(BBFAdd_40_1_in1)
  );
  BBFAdd BBFAdd_41_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_41_1_out),
    .in2(BBFAdd_41_1_in2),
    .in1(BBFAdd_41_1_in1)
  );
  BBFMultiply BBFMultiply_28_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_28_1_out),
    .in2(BBFMultiply_28_1_in2),
    .in1(BBFMultiply_28_1_in1)
  );
  BBFMultiply BBFMultiply_29_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_29_1_out),
    .in2(BBFMultiply_29_1_in2),
    .in1(BBFMultiply_29_1_in1)
  );
  BBFSubtract BBFSubtract_28_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_28_1_out),
    .in2(BBFSubtract_28_1_in2),
    .in1(BBFSubtract_28_1_in1)
  );
  BBFAdd BBFAdd_42_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_42_1_out),
    .in2(BBFAdd_42_1_in2),
    .in1(BBFAdd_42_1_in1)
  );
  BBFMultiply BBFMultiply_30_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_30_1_out),
    .in2(BBFMultiply_30_1_in2),
    .in1(BBFMultiply_30_1_in1)
  );
  BBFMultiply BBFMultiply_31_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_31_1_out),
    .in2(BBFMultiply_31_1_in2),
    .in1(BBFMultiply_31_1_in1)
  );
  BBFAdd BBFAdd_43_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_43_1_out),
    .in2(BBFAdd_43_1_in2),
    .in1(BBFAdd_43_1_in1)
  );
  BBFAdd BBFAdd_44_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_44_1_out),
    .in2(BBFAdd_44_1_in2),
    .in1(BBFAdd_44_1_in1)
  );
  BBFAdd BBFAdd_45_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_45_1_out),
    .in2(BBFAdd_45_1_in2),
    .in1(BBFAdd_45_1_in1)
  );
  BBFSubtract BBFSubtract_29_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_29_1_out),
    .in2(BBFSubtract_29_1_in2),
    .in1(BBFSubtract_29_1_in1)
  );
  BBFSubtract BBFSubtract_30_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_30_1_out),
    .in2(BBFSubtract_30_1_in2),
    .in1(BBFSubtract_30_1_in1)
  );
  BBFAdd BBFAdd_46_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_46_1_out),
    .in2(BBFAdd_46_1_in2),
    .in1(BBFAdd_46_1_in1)
  );
  BBFAdd BBFAdd_47_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_47_1_out),
    .in2(BBFAdd_47_1_in2),
    .in1(BBFAdd_47_1_in1)
  );
  BBFMultiply BBFMultiply_32_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_32_1_out),
    .in2(BBFMultiply_32_1_in2),
    .in1(BBFMultiply_32_1_in1)
  );
  BBFMultiply BBFMultiply_33_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_33_1_out),
    .in2(BBFMultiply_33_1_in2),
    .in1(BBFMultiply_33_1_in1)
  );
  BBFSubtract BBFSubtract_31_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_31_1_out),
    .in2(BBFSubtract_31_1_in2),
    .in1(BBFSubtract_31_1_in1)
  );
  BBFAdd BBFAdd_48_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_48_1_out),
    .in2(BBFAdd_48_1_in2),
    .in1(BBFAdd_48_1_in1)
  );
  BBFMultiply BBFMultiply_34_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_34_1_out),
    .in2(BBFMultiply_34_1_in2),
    .in1(BBFMultiply_34_1_in1)
  );
  BBFMultiply BBFMultiply_35_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_35_1_out),
    .in2(BBFMultiply_35_1_in2),
    .in1(BBFMultiply_35_1_in1)
  );
  BBFAdd BBFAdd_49_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_49_1_out),
    .in2(BBFAdd_49_1_in2),
    .in1(BBFAdd_49_1_in1)
  );
  BBFAdd BBFAdd_50_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_50_1_out),
    .in2(BBFAdd_50_1_in2),
    .in1(BBFAdd_50_1_in1)
  );
  BBFAdd BBFAdd_51_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_51_1_out),
    .in2(BBFAdd_51_1_in2),
    .in1(BBFAdd_51_1_in1)
  );
  BBFSubtract BBFSubtract_32_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_32_1_out),
    .in2(BBFSubtract_32_1_in2),
    .in1(BBFSubtract_32_1_in1)
  );
  BBFSubtract BBFSubtract_33_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_33_1_out),
    .in2(BBFSubtract_33_1_in2),
    .in1(BBFSubtract_33_1_in1)
  );
  BBFAdd BBFAdd_52_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_52_1_out),
    .in2(BBFAdd_52_1_in2),
    .in1(BBFAdd_52_1_in1)
  );
  BBFAdd BBFAdd_53_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_53_1_out),
    .in2(BBFAdd_53_1_in2),
    .in1(BBFAdd_53_1_in1)
  );
  BBFMultiply BBFMultiply_36_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_36_1_out),
    .in2(BBFMultiply_36_1_in2),
    .in1(BBFMultiply_36_1_in1)
  );
  BBFMultiply BBFMultiply_37_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_37_1_out),
    .in2(BBFMultiply_37_1_in2),
    .in1(BBFMultiply_37_1_in1)
  );
  BBFSubtract BBFSubtract_34_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_34_1_out),
    .in2(BBFSubtract_34_1_in2),
    .in1(BBFSubtract_34_1_in1)
  );
  BBFAdd BBFAdd_54_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_54_1_out),
    .in2(BBFAdd_54_1_in2),
    .in1(BBFAdd_54_1_in1)
  );
  BBFMultiply BBFMultiply_38_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_38_1_out),
    .in2(BBFMultiply_38_1_in2),
    .in1(BBFMultiply_38_1_in1)
  );
  BBFMultiply BBFMultiply_39_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_39_1_out),
    .in2(BBFMultiply_39_1_in2),
    .in1(BBFMultiply_39_1_in1)
  );
  BBFAdd BBFAdd_55_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_55_1_out),
    .in2(BBFAdd_55_1_in2),
    .in1(BBFAdd_55_1_in1)
  );
  BBFAdd BBFAdd_56_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_56_1_out),
    .in2(BBFAdd_56_1_in2),
    .in1(BBFAdd_56_1_in1)
  );
  BBFAdd BBFAdd_57_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_57_1_out),
    .in2(BBFAdd_57_1_in2),
    .in1(BBFAdd_57_1_in1)
  );
  BBFSubtract BBFSubtract_35_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_35_1_out),
    .in2(BBFSubtract_35_1_in2),
    .in1(BBFSubtract_35_1_in1)
  );
  BBFSubtract BBFSubtract_36_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_36_1_out),
    .in2(BBFSubtract_36_1_in2),
    .in1(BBFSubtract_36_1_in1)
  );
  BBFAdd BBFAdd_58_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_58_1_out),
    .in2(BBFAdd_58_1_in2),
    .in1(BBFAdd_58_1_in1)
  );
  BBFAdd BBFAdd_59_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_59_1_out),
    .in2(BBFAdd_59_1_in2),
    .in1(BBFAdd_59_1_in1)
  );
  BBFMultiply BBFMultiply_40_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_40_1_out),
    .in2(BBFMultiply_40_1_in2),
    .in1(BBFMultiply_40_1_in1)
  );
  BBFMultiply BBFMultiply_41_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_41_1_out),
    .in2(BBFMultiply_41_1_in2),
    .in1(BBFMultiply_41_1_in1)
  );
  BBFSubtract BBFSubtract_37_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_37_1_out),
    .in2(BBFSubtract_37_1_in2),
    .in1(BBFSubtract_37_1_in1)
  );
  BBFAdd BBFAdd_60_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_60_1_out),
    .in2(BBFAdd_60_1_in2),
    .in1(BBFAdd_60_1_in1)
  );
  BBFMultiply BBFMultiply_42_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_42_1_out),
    .in2(BBFMultiply_42_1_in2),
    .in1(BBFMultiply_42_1_in1)
  );
  BBFMultiply BBFMultiply_43_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_43_1_out),
    .in2(BBFMultiply_43_1_in2),
    .in1(BBFMultiply_43_1_in1)
  );
  BBFAdd BBFAdd_61_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_61_1_out),
    .in2(BBFAdd_61_1_in2),
    .in1(BBFAdd_61_1_in1)
  );
  BBFAdd BBFAdd_62_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_62_1_out),
    .in2(BBFAdd_62_1_in2),
    .in1(BBFAdd_62_1_in1)
  );
  BBFAdd BBFAdd_63_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_63_1_out),
    .in2(BBFAdd_63_1_in2),
    .in1(BBFAdd_63_1_in1)
  );
  BBFSubtract BBFSubtract_38_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_38_1_out),
    .in2(BBFSubtract_38_1_in2),
    .in1(BBFSubtract_38_1_in1)
  );
  BBFSubtract BBFSubtract_39_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_39_1_out),
    .in2(BBFSubtract_39_1_in2),
    .in1(BBFSubtract_39_1_in1)
  );
  BBFAdd BBFAdd_64_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_64_1_out),
    .in2(BBFAdd_64_1_in2),
    .in1(BBFAdd_64_1_in1)
  );
  BBFAdd BBFAdd_65_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_65_1_out),
    .in2(BBFAdd_65_1_in2),
    .in1(BBFAdd_65_1_in1)
  );
  BBFMultiply BBFMultiply_44_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_44_1_out),
    .in2(BBFMultiply_44_1_in2),
    .in1(BBFMultiply_44_1_in1)
  );
  BBFMultiply BBFMultiply_45_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_45_1_out),
    .in2(BBFMultiply_45_1_in2),
    .in1(BBFMultiply_45_1_in1)
  );
  BBFSubtract BBFSubtract_40_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_40_1_out),
    .in2(BBFSubtract_40_1_in2),
    .in1(BBFSubtract_40_1_in1)
  );
  BBFAdd BBFAdd_66_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_66_1_out),
    .in2(BBFAdd_66_1_in2),
    .in1(BBFAdd_66_1_in1)
  );
  BBFMultiply BBFMultiply_46_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_46_1_out),
    .in2(BBFMultiply_46_1_in2),
    .in1(BBFMultiply_46_1_in1)
  );
  BBFMultiply BBFMultiply_47_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_47_1_out),
    .in2(BBFMultiply_47_1_in2),
    .in1(BBFMultiply_47_1_in1)
  );
  BBFAdd BBFAdd_67_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_67_1_out),
    .in2(BBFAdd_67_1_in2),
    .in1(BBFAdd_67_1_in1)
  );
  BBFAdd BBFAdd_68_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_68_1_out),
    .in2(BBFAdd_68_1_in2),
    .in1(BBFAdd_68_1_in1)
  );
  BBFAdd BBFAdd_69_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_69_1_out),
    .in2(BBFAdd_69_1_in2),
    .in1(BBFAdd_69_1_in1)
  );
  BBFSubtract BBFSubtract_41_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_41_1_out),
    .in2(BBFSubtract_41_1_in2),
    .in1(BBFSubtract_41_1_in1)
  );
  BBFSubtract BBFSubtract_42_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_42_1_out),
    .in2(BBFSubtract_42_1_in2),
    .in1(BBFSubtract_42_1_in1)
  );
  BBFAdd BBFAdd_70_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_70_1_out),
    .in2(BBFAdd_70_1_in2),
    .in1(BBFAdd_70_1_in1)
  );
  BBFAdd BBFAdd_71_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_71_1_out),
    .in2(BBFAdd_71_1_in2),
    .in1(BBFAdd_71_1_in1)
  );
  assign _T_635__T_645_en = 1'h1;
  assign _T_635__T_645_addr = _T_637;
  assign _T_635__T_645_data = _T_635[_T_635__T_645_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_635__T_644_data = io_in_sync;
  assign _T_635__T_644_addr = _T_637;
  assign _T_635__T_644_mask = 1'h1;
  assign _T_635__T_644_en = io_in_valid;
  assign _T_2757_real_node__T_2776_en = 1'h1;
  assign _T_2757_real_node__T_2776_addr = 1'h0;
  assign _T_2757_real_node__T_2776_data = _T_2757_real_node[_T_2757_real_node__T_2776_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2757_real_node__T_2768_data = BBFAdd_2_1_out;
  assign _T_2757_real_node__T_2768_addr = 1'h0;
  assign _T_2757_real_node__T_2768_mask = 1'h1;
  assign _T_2757_real_node__T_2768_en = io_in_valid;
  assign _T_2757_imaginary_node__T_2776_en = 1'h1;
  assign _T_2757_imaginary_node__T_2776_addr = 1'h0;
  assign _T_2757_imaginary_node__T_2776_data = _T_2757_imaginary_node[_T_2757_imaginary_node__T_2776_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2757_imaginary_node__T_2768_data = BBFAdd_3_1_out;
  assign _T_2757_imaginary_node__T_2768_addr = 1'h0;
  assign _T_2757_imaginary_node__T_2768_mask = 1'h1;
  assign _T_2757_imaginary_node__T_2768_en = io_in_valid;
  assign _T_2791_real_node__T_2810_en = 1'h1;
  assign _T_2791_real_node__T_2810_addr = 1'h0;
  assign _T_2791_real_node__T_2810_data = _T_2791_real_node[_T_2791_real_node__T_2810_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2791_real_node__T_2802_data = BBFAdd_4_1_out;
  assign _T_2791_real_node__T_2802_addr = 1'h0;
  assign _T_2791_real_node__T_2802_mask = 1'h1;
  assign _T_2791_real_node__T_2802_en = io_in_valid;
  assign _T_2791_imaginary_node__T_2810_en = 1'h1;
  assign _T_2791_imaginary_node__T_2810_addr = 1'h0;
  assign _T_2791_imaginary_node__T_2810_data = _T_2791_imaginary_node[_T_2791_imaginary_node__T_2810_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2791_imaginary_node__T_2802_data = BBFAdd_5_1_out;
  assign _T_2791_imaginary_node__T_2802_addr = 1'h0;
  assign _T_2791_imaginary_node__T_2802_mask = 1'h1;
  assign _T_2791_imaginary_node__T_2802_en = io_in_valid;
  assign _T_2980_real_node__T_2999_en = 1'h1;
  assign _T_2980_real_node__T_2999_addr = 1'h0;
  assign _T_2980_real_node__T_2999_data = _T_2980_real_node[_T_2980_real_node__T_2999_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2980_real_node__T_2991_data = BBFAdd_8_1_out;
  assign _T_2980_real_node__T_2991_addr = 1'h0;
  assign _T_2980_real_node__T_2991_mask = 1'h1;
  assign _T_2980_real_node__T_2991_en = io_in_valid;
  assign _T_2980_imaginary_node__T_2999_en = 1'h1;
  assign _T_2980_imaginary_node__T_2999_addr = 1'h0;
  assign _T_2980_imaginary_node__T_2999_data = _T_2980_imaginary_node[_T_2980_imaginary_node__T_2999_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2980_imaginary_node__T_2991_data = BBFAdd_9_1_out;
  assign _T_2980_imaginary_node__T_2991_addr = 1'h0;
  assign _T_2980_imaginary_node__T_2991_mask = 1'h1;
  assign _T_2980_imaginary_node__T_2991_en = io_in_valid;
  assign _T_3014_real_node__T_3033_en = 1'h1;
  assign _T_3014_real_node__T_3033_addr = 1'h0;
  assign _T_3014_real_node__T_3033_data = _T_3014_real_node[_T_3014_real_node__T_3033_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3014_real_node__T_3025_data = BBFAdd_10_1_out;
  assign _T_3014_real_node__T_3025_addr = 1'h0;
  assign _T_3014_real_node__T_3025_mask = 1'h1;
  assign _T_3014_real_node__T_3025_en = io_in_valid;
  assign _T_3014_imaginary_node__T_3033_en = 1'h1;
  assign _T_3014_imaginary_node__T_3033_addr = 1'h0;
  assign _T_3014_imaginary_node__T_3033_data = _T_3014_imaginary_node[_T_3014_imaginary_node__T_3033_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3014_imaginary_node__T_3025_data = BBFAdd_11_1_out;
  assign _T_3014_imaginary_node__T_3025_addr = 1'h0;
  assign _T_3014_imaginary_node__T_3025_mask = 1'h1;
  assign _T_3014_imaginary_node__T_3025_en = io_in_valid;
  assign _T_3203_real_node__T_3222_en = 1'h1;
  assign _T_3203_real_node__T_3222_addr = 1'h0;
  assign _T_3203_real_node__T_3222_data = _T_3203_real_node[_T_3203_real_node__T_3222_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3203_real_node__T_3214_data = BBFAdd_14_1_out;
  assign _T_3203_real_node__T_3214_addr = 1'h0;
  assign _T_3203_real_node__T_3214_mask = 1'h1;
  assign _T_3203_real_node__T_3214_en = io_in_valid;
  assign _T_3203_imaginary_node__T_3222_en = 1'h1;
  assign _T_3203_imaginary_node__T_3222_addr = 1'h0;
  assign _T_3203_imaginary_node__T_3222_data = _T_3203_imaginary_node[_T_3203_imaginary_node__T_3222_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3203_imaginary_node__T_3214_data = BBFAdd_15_1_out;
  assign _T_3203_imaginary_node__T_3214_addr = 1'h0;
  assign _T_3203_imaginary_node__T_3214_mask = 1'h1;
  assign _T_3203_imaginary_node__T_3214_en = io_in_valid;
  assign _T_3237_real_node__T_3256_en = 1'h1;
  assign _T_3237_real_node__T_3256_addr = 1'h0;
  assign _T_3237_real_node__T_3256_data = _T_3237_real_node[_T_3237_real_node__T_3256_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3237_real_node__T_3248_data = BBFAdd_16_1_out;
  assign _T_3237_real_node__T_3248_addr = 1'h0;
  assign _T_3237_real_node__T_3248_mask = 1'h1;
  assign _T_3237_real_node__T_3248_en = io_in_valid;
  assign _T_3237_imaginary_node__T_3256_en = 1'h1;
  assign _T_3237_imaginary_node__T_3256_addr = 1'h0;
  assign _T_3237_imaginary_node__T_3256_data = _T_3237_imaginary_node[_T_3237_imaginary_node__T_3256_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3237_imaginary_node__T_3248_data = BBFAdd_17_1_out;
  assign _T_3237_imaginary_node__T_3248_addr = 1'h0;
  assign _T_3237_imaginary_node__T_3248_mask = 1'h1;
  assign _T_3237_imaginary_node__T_3248_en = io_in_valid;
  assign _T_3426_real_node__T_3445_en = 1'h1;
  assign _T_3426_real_node__T_3445_addr = 1'h0;
  assign _T_3426_real_node__T_3445_data = _T_3426_real_node[_T_3426_real_node__T_3445_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3426_real_node__T_3437_data = BBFAdd_20_1_out;
  assign _T_3426_real_node__T_3437_addr = 1'h0;
  assign _T_3426_real_node__T_3437_mask = 1'h1;
  assign _T_3426_real_node__T_3437_en = io_in_valid;
  assign _T_3426_imaginary_node__T_3445_en = 1'h1;
  assign _T_3426_imaginary_node__T_3445_addr = 1'h0;
  assign _T_3426_imaginary_node__T_3445_data = _T_3426_imaginary_node[_T_3426_imaginary_node__T_3445_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3426_imaginary_node__T_3437_data = BBFAdd_21_1_out;
  assign _T_3426_imaginary_node__T_3437_addr = 1'h0;
  assign _T_3426_imaginary_node__T_3437_mask = 1'h1;
  assign _T_3426_imaginary_node__T_3437_en = io_in_valid;
  assign _T_3460_real_node__T_3479_en = 1'h1;
  assign _T_3460_real_node__T_3479_addr = 1'h0;
  assign _T_3460_real_node__T_3479_data = _T_3460_real_node[_T_3460_real_node__T_3479_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3460_real_node__T_3471_data = BBFAdd_22_1_out;
  assign _T_3460_real_node__T_3471_addr = 1'h0;
  assign _T_3460_real_node__T_3471_mask = 1'h1;
  assign _T_3460_real_node__T_3471_en = io_in_valid;
  assign _T_3460_imaginary_node__T_3479_en = 1'h1;
  assign _T_3460_imaginary_node__T_3479_addr = 1'h0;
  assign _T_3460_imaginary_node__T_3479_data = _T_3460_imaginary_node[_T_3460_imaginary_node__T_3479_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3460_imaginary_node__T_3471_data = BBFAdd_23_1_out;
  assign _T_3460_imaginary_node__T_3471_addr = 1'h0;
  assign _T_3460_imaginary_node__T_3471_mask = 1'h1;
  assign _T_3460_imaginary_node__T_3471_en = io_in_valid;
  assign _T_3494_real_node__T_3513_en = 1'h1;
  assign _T_3494_real_node__T_3513_addr = 1'h0;
  assign _T_3494_real_node__T_3513_data = _T_3494_real_node[_T_3494_real_node__T_3513_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3494_real_node__T_3505_data = _GEN_79[2] ? _GEN_101 : _GEN_97;
  assign _T_3494_real_node__T_3505_addr = 1'h0;
  assign _T_3494_real_node__T_3505_mask = 1'h1;
  assign _T_3494_real_node__T_3505_en = io_in_valid;
  assign _T_3494_imaginary_node__T_3513_en = 1'h1;
  assign _T_3494_imaginary_node__T_3513_addr = 1'h0;
  assign _T_3494_imaginary_node__T_3513_data = _T_3494_imaginary_node[_T_3494_imaginary_node__T_3513_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3494_imaginary_node__T_3505_data = _GEN_79[2] ? _T_1384_node : _GEN_101;
  assign _T_3494_imaginary_node__T_3505_addr = 1'h0;
  assign _T_3494_imaginary_node__T_3505_mask = 1'h1;
  assign _T_3494_imaginary_node__T_3505_en = io_in_valid;
  assign _T_3683_real_node__T_3702_en = 1'h1;
  assign _T_3683_real_node__T_3702_addr = 1'h0;
  assign _T_3683_real_node__T_3702_data = _T_3683_real_node[_T_3683_real_node__T_3702_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3683_real_node__T_3694_data = BBFAdd_26_1_out;
  assign _T_3683_real_node__T_3694_addr = 1'h0;
  assign _T_3683_real_node__T_3694_mask = 1'h1;
  assign _T_3683_real_node__T_3694_en = io_in_valid;
  assign _T_3683_imaginary_node__T_3702_en = 1'h1;
  assign _T_3683_imaginary_node__T_3702_addr = 1'h0;
  assign _T_3683_imaginary_node__T_3702_data = _T_3683_imaginary_node[_T_3683_imaginary_node__T_3702_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3683_imaginary_node__T_3694_data = BBFAdd_27_1_out;
  assign _T_3683_imaginary_node__T_3694_addr = 1'h0;
  assign _T_3683_imaginary_node__T_3694_mask = 1'h1;
  assign _T_3683_imaginary_node__T_3694_en = io_in_valid;
  assign _T_3717_real_node__T_3736_en = 1'h1;
  assign _T_3717_real_node__T_3736_addr = 1'h0;
  assign _T_3717_real_node__T_3736_data = _T_3717_real_node[_T_3717_real_node__T_3736_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3717_real_node__T_3728_data = BBFAdd_28_1_out;
  assign _T_3717_real_node__T_3728_addr = 1'h0;
  assign _T_3717_real_node__T_3728_mask = 1'h1;
  assign _T_3717_real_node__T_3728_en = io_in_valid;
  assign _T_3717_imaginary_node__T_3736_en = 1'h1;
  assign _T_3717_imaginary_node__T_3736_addr = 1'h0;
  assign _T_3717_imaginary_node__T_3736_data = _T_3717_imaginary_node[_T_3717_imaginary_node__T_3736_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3717_imaginary_node__T_3728_data = BBFAdd_29_1_out;
  assign _T_3717_imaginary_node__T_3728_addr = 1'h0;
  assign _T_3717_imaginary_node__T_3728_mask = 1'h1;
  assign _T_3717_imaginary_node__T_3728_en = io_in_valid;
  assign _T_3751_real_node__T_3770_en = 1'h1;
  assign _T_3751_real_node__T_3770_addr = 1'h0;
  assign _T_3751_real_node__T_3770_data = _T_3751_real_node[_T_3751_real_node__T_3770_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3751_real_node__T_3762_data = _GEN_79[2] ? _GEN_101 : _GEN_97;
  assign _T_3751_real_node__T_3762_addr = 1'h0;
  assign _T_3751_real_node__T_3762_mask = 1'h1;
  assign _T_3751_real_node__T_3762_en = io_in_valid;
  assign _T_3751_imaginary_node__T_3770_en = 1'h1;
  assign _T_3751_imaginary_node__T_3770_addr = 1'h0;
  assign _T_3751_imaginary_node__T_3770_data = _T_3751_imaginary_node[_T_3751_imaginary_node__T_3770_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3751_imaginary_node__T_3762_data = _GEN_79[2] ? _T_1384_node : _GEN_101;
  assign _T_3751_imaginary_node__T_3762_addr = 1'h0;
  assign _T_3751_imaginary_node__T_3762_mask = 1'h1;
  assign _T_3751_imaginary_node__T_3762_en = io_in_valid;
  assign _T_3940_real_node__T_3959_en = 1'h1;
  assign _T_3940_real_node__T_3959_addr = 1'h0;
  assign _T_3940_real_node__T_3959_data = _T_3940_real_node[_T_3940_real_node__T_3959_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3940_real_node__T_3951_data = BBFAdd_32_1_out;
  assign _T_3940_real_node__T_3951_addr = 1'h0;
  assign _T_3940_real_node__T_3951_mask = 1'h1;
  assign _T_3940_real_node__T_3951_en = io_in_valid;
  assign _T_3940_imaginary_node__T_3959_en = 1'h1;
  assign _T_3940_imaginary_node__T_3959_addr = 1'h0;
  assign _T_3940_imaginary_node__T_3959_data = _T_3940_imaginary_node[_T_3940_imaginary_node__T_3959_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3940_imaginary_node__T_3951_data = BBFAdd_33_1_out;
  assign _T_3940_imaginary_node__T_3951_addr = 1'h0;
  assign _T_3940_imaginary_node__T_3951_mask = 1'h1;
  assign _T_3940_imaginary_node__T_3951_en = io_in_valid;
  assign _T_3974_real_node__T_3993_en = 1'h1;
  assign _T_3974_real_node__T_3993_addr = 1'h0;
  assign _T_3974_real_node__T_3993_data = _T_3974_real_node[_T_3974_real_node__T_3993_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3974_real_node__T_3985_data = BBFAdd_34_1_out;
  assign _T_3974_real_node__T_3985_addr = 1'h0;
  assign _T_3974_real_node__T_3985_mask = 1'h1;
  assign _T_3974_real_node__T_3985_en = io_in_valid;
  assign _T_3974_imaginary_node__T_3993_en = 1'h1;
  assign _T_3974_imaginary_node__T_3993_addr = 1'h0;
  assign _T_3974_imaginary_node__T_3993_data = _T_3974_imaginary_node[_T_3974_imaginary_node__T_3993_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3974_imaginary_node__T_3985_data = BBFAdd_35_1_out;
  assign _T_3974_imaginary_node__T_3985_addr = 1'h0;
  assign _T_3974_imaginary_node__T_3985_mask = 1'h1;
  assign _T_3974_imaginary_node__T_3985_en = io_in_valid;
  assign _T_4008_real_node__T_4027_en = 1'h1;
  assign _T_4008_real_node__T_4027_addr = 1'h0;
  assign _T_4008_real_node__T_4027_data = _T_4008_real_node[_T_4008_real_node__T_4027_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4008_real_node__T_4019_data = _GEN_253[2] ? _GEN_275 : _GEN_271;
  assign _T_4008_real_node__T_4019_addr = 1'h0;
  assign _T_4008_real_node__T_4019_mask = 1'h1;
  assign _T_4008_real_node__T_4019_en = io_in_valid;
  assign _T_4008_imaginary_node__T_4027_en = 1'h1;
  assign _T_4008_imaginary_node__T_4027_addr = 1'h0;
  assign _T_4008_imaginary_node__T_4027_data = _T_4008_imaginary_node[_T_4008_imaginary_node__T_4027_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4008_imaginary_node__T_4019_data = _GEN_253[2] ? _T_1567_node : _GEN_275;
  assign _T_4008_imaginary_node__T_4019_addr = 1'h0;
  assign _T_4008_imaginary_node__T_4019_mask = 1'h1;
  assign _T_4008_imaginary_node__T_4019_en = io_in_valid;
  assign _T_4197_real_node__T_4216_en = 1'h1;
  assign _T_4197_real_node__T_4216_addr = 1'h0;
  assign _T_4197_real_node__T_4216_data = _T_4197_real_node[_T_4197_real_node__T_4216_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4197_real_node__T_4208_data = BBFAdd_38_1_out;
  assign _T_4197_real_node__T_4208_addr = 1'h0;
  assign _T_4197_real_node__T_4208_mask = 1'h1;
  assign _T_4197_real_node__T_4208_en = io_in_valid;
  assign _T_4197_imaginary_node__T_4216_en = 1'h1;
  assign _T_4197_imaginary_node__T_4216_addr = 1'h0;
  assign _T_4197_imaginary_node__T_4216_data = _T_4197_imaginary_node[_T_4197_imaginary_node__T_4216_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4197_imaginary_node__T_4208_data = BBFAdd_39_1_out;
  assign _T_4197_imaginary_node__T_4208_addr = 1'h0;
  assign _T_4197_imaginary_node__T_4208_mask = 1'h1;
  assign _T_4197_imaginary_node__T_4208_en = io_in_valid;
  assign _T_4231_real_node__T_4250_en = 1'h1;
  assign _T_4231_real_node__T_4250_addr = 1'h0;
  assign _T_4231_real_node__T_4250_data = _T_4231_real_node[_T_4231_real_node__T_4250_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4231_real_node__T_4242_data = BBFAdd_40_1_out;
  assign _T_4231_real_node__T_4242_addr = 1'h0;
  assign _T_4231_real_node__T_4242_mask = 1'h1;
  assign _T_4231_real_node__T_4242_en = io_in_valid;
  assign _T_4231_imaginary_node__T_4250_en = 1'h1;
  assign _T_4231_imaginary_node__T_4250_addr = 1'h0;
  assign _T_4231_imaginary_node__T_4250_data = _T_4231_imaginary_node[_T_4231_imaginary_node__T_4250_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4231_imaginary_node__T_4242_data = BBFAdd_41_1_out;
  assign _T_4231_imaginary_node__T_4242_addr = 1'h0;
  assign _T_4231_imaginary_node__T_4242_mask = 1'h1;
  assign _T_4231_imaginary_node__T_4242_en = io_in_valid;
  assign _T_4265_real_node__T_4284_en = 1'h1;
  assign _T_4265_real_node__T_4284_addr = 1'h0;
  assign _T_4265_real_node__T_4284_data = _T_4265_real_node[_T_4265_real_node__T_4284_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4265_real_node__T_4276_data = _GEN_253[2] ? _GEN_275 : _GEN_271;
  assign _T_4265_real_node__T_4276_addr = 1'h0;
  assign _T_4265_real_node__T_4276_mask = 1'h1;
  assign _T_4265_real_node__T_4276_en = io_in_valid;
  assign _T_4265_imaginary_node__T_4284_en = 1'h1;
  assign _T_4265_imaginary_node__T_4284_addr = 1'h0;
  assign _T_4265_imaginary_node__T_4284_data = _T_4265_imaginary_node[_T_4265_imaginary_node__T_4284_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4265_imaginary_node__T_4276_data = _GEN_253[2] ? _T_1567_node : _GEN_275;
  assign _T_4265_imaginary_node__T_4276_addr = 1'h0;
  assign _T_4265_imaginary_node__T_4276_mask = 1'h1;
  assign _T_4265_imaginary_node__T_4276_en = io_in_valid;
  assign _T_4454_real_node__T_4473_en = 1'h1;
  assign _T_4454_real_node__T_4473_addr = 1'h0;
  assign _T_4454_real_node__T_4473_data = _T_4454_real_node[_T_4454_real_node__T_4473_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4454_real_node__T_4465_data = BBFAdd_44_1_out;
  assign _T_4454_real_node__T_4465_addr = 1'h0;
  assign _T_4454_real_node__T_4465_mask = 1'h1;
  assign _T_4454_real_node__T_4465_en = io_in_valid;
  assign _T_4454_imaginary_node__T_4473_en = 1'h1;
  assign _T_4454_imaginary_node__T_4473_addr = 1'h0;
  assign _T_4454_imaginary_node__T_4473_data = _T_4454_imaginary_node[_T_4454_imaginary_node__T_4473_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4454_imaginary_node__T_4465_data = BBFAdd_45_1_out;
  assign _T_4454_imaginary_node__T_4465_addr = 1'h0;
  assign _T_4454_imaginary_node__T_4465_mask = 1'h1;
  assign _T_4454_imaginary_node__T_4465_en = io_in_valid;
  assign _T_4488_real_node__T_4507_en = 1'h1;
  assign _T_4488_real_node__T_4507_addr = 1'h0;
  assign _T_4488_real_node__T_4507_data = _T_4488_real_node[_T_4488_real_node__T_4507_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4488_real_node__T_4499_data = BBFAdd_46_1_out;
  assign _T_4488_real_node__T_4499_addr = 1'h0;
  assign _T_4488_real_node__T_4499_mask = 1'h1;
  assign _T_4488_real_node__T_4499_en = io_in_valid;
  assign _T_4488_imaginary_node__T_4507_en = 1'h1;
  assign _T_4488_imaginary_node__T_4507_addr = 1'h0;
  assign _T_4488_imaginary_node__T_4507_data = _T_4488_imaginary_node[_T_4488_imaginary_node__T_4507_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4488_imaginary_node__T_4499_data = BBFAdd_47_1_out;
  assign _T_4488_imaginary_node__T_4499_addr = 1'h0;
  assign _T_4488_imaginary_node__T_4499_mask = 1'h1;
  assign _T_4488_imaginary_node__T_4499_en = io_in_valid;
  assign _T_4522_real_node__T_4544_en = 1'h1;
  assign _T_4522_real_node__T_4544_addr = _T_4524;
  assign _T_4522_real_node__T_4544_data = _T_4522_real_node[_T_4522_real_node__T_4544_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4522_real_node__T_4537_data = _GEN_137[2] ? _GEN_159 : _GEN_155;
  assign _T_4522_real_node__T_4537_addr = _T_4524;
  assign _T_4522_real_node__T_4537_mask = 1'h1;
  assign _T_4522_real_node__T_4537_en = io_in_valid;
  assign _T_4522_imaginary_node__T_4544_en = 1'h1;
  assign _T_4522_imaginary_node__T_4544_addr = _T_4524;
  assign _T_4522_imaginary_node__T_4544_data = _T_4522_imaginary_node[_T_4522_imaginary_node__T_4544_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4522_imaginary_node__T_4537_data = _GEN_137[2] ? _T_1445_node : _GEN_159;
  assign _T_4522_imaginary_node__T_4537_addr = _T_4524;
  assign _T_4522_imaginary_node__T_4537_mask = 1'h1;
  assign _T_4522_imaginary_node__T_4537_en = io_in_valid;
  assign _T_4714_real_node__T_4736_en = 1'h1;
  assign _T_4714_real_node__T_4736_addr = _T_4716;
  assign _T_4714_real_node__T_4736_data = _T_4714_real_node[_T_4714_real_node__T_4736_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4714_real_node__T_4729_data = _GEN_195[2] ? _GEN_217 : _GEN_213;
  assign _T_4714_real_node__T_4729_addr = _T_4716;
  assign _T_4714_real_node__T_4729_mask = 1'h1;
  assign _T_4714_real_node__T_4729_en = io_in_valid;
  assign _T_4714_imaginary_node__T_4736_en = 1'h1;
  assign _T_4714_imaginary_node__T_4736_addr = _T_4716;
  assign _T_4714_imaginary_node__T_4736_data = _T_4714_imaginary_node[_T_4714_imaginary_node__T_4736_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4714_imaginary_node__T_4729_data = _GEN_195[2] ? _T_1506_node : _GEN_217;
  assign _T_4714_imaginary_node__T_4729_addr = _T_4716;
  assign _T_4714_imaginary_node__T_4729_mask = 1'h1;
  assign _T_4714_imaginary_node__T_4729_en = io_in_valid;
  assign _T_4906_real_node__T_4928_en = 1'h1;
  assign _T_4906_real_node__T_4928_addr = _T_4908;
  assign _T_4906_real_node__T_4928_data = _T_4906_real_node[_T_4906_real_node__T_4928_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4906_real_node__T_4921_data = _GEN_311[2] ? _GEN_333 : _GEN_329;
  assign _T_4906_real_node__T_4921_addr = _T_4908;
  assign _T_4906_real_node__T_4921_mask = 1'h1;
  assign _T_4906_real_node__T_4921_en = io_in_valid;
  assign _T_4906_imaginary_node__T_4928_en = 1'h1;
  assign _T_4906_imaginary_node__T_4928_addr = _T_4908;
  assign _T_4906_imaginary_node__T_4928_data = _T_4906_imaginary_node[_T_4906_imaginary_node__T_4928_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4906_imaginary_node__T_4921_data = _GEN_311[2] ? _T_1628_node : _GEN_333;
  assign _T_4906_imaginary_node__T_4921_addr = _T_4908;
  assign _T_4906_imaginary_node__T_4921_mask = 1'h1;
  assign _T_4906_imaginary_node__T_4921_en = io_in_valid;
  assign _T_5098_real_node__T_5120_en = 1'h1;
  assign _T_5098_real_node__T_5120_addr = _T_5100;
  assign _T_5098_real_node__T_5120_data = _T_5098_real_node[_T_5098_real_node__T_5120_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5098_real_node__T_5113_data = _GEN_369[2] ? _GEN_391 : _GEN_387;
  assign _T_5098_real_node__T_5113_addr = _T_5100;
  assign _T_5098_real_node__T_5113_mask = 1'h1;
  assign _T_5098_real_node__T_5113_en = io_in_valid;
  assign _T_5098_imaginary_node__T_5120_en = 1'h1;
  assign _T_5098_imaginary_node__T_5120_addr = _T_5100;
  assign _T_5098_imaginary_node__T_5120_data = _T_5098_imaginary_node[_T_5098_imaginary_node__T_5120_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5098_imaginary_node__T_5113_data = _GEN_369[2] ? _T_1689_node : _GEN_391;
  assign _T_5098_imaginary_node__T_5113_addr = _T_5100;
  assign _T_5098_imaginary_node__T_5113_mask = 1'h1;
  assign _T_5098_imaginary_node__T_5113_en = io_in_valid;
  assign io_out_valid = io_in_valid; // @[FFT.scala 34:16]
  assign io_out_bits_0_real_node = BBFAdd_50_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_0_imaginary_node = BBFAdd_51_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_1_real_node = BBFAdd_52_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_1_imaginary_node = BBFAdd_53_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_2_real_node = BBFAdd_56_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_2_imaginary_node = BBFAdd_57_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_3_real_node = BBFAdd_58_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_3_imaginary_node = BBFAdd_59_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_4_real_node = BBFAdd_62_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_4_imaginary_node = BBFAdd_63_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_5_real_node = BBFAdd_64_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_5_imaginary_node = BBFAdd_65_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_6_real_node = BBFAdd_68_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_6_imaginary_node = BBFAdd_69_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_7_real_node = BBFAdd_70_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_bits_7_imaginary_node = BBFAdd_71_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign io_out_sync = _T_635__T_645_data; // @[FFT.scala 33:15]
  assign BBFSubtract_43_in2 = 2'h3 == _GEN_21[1:0] ? 64'h3fd87de2a6aea964 : _GEN_38; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_43_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_1_1_in2 = 2'h3 == _GEN_79[1:0] ? 64'h3fd87de2a6aea964 : _GEN_96; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_1_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_2_1_in2 = 2'h3 == _GEN_137[1:0] ? 64'h3fd87de2a6aea964 : _GEN_154; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_2_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_3_1_in2 = 2'h3 == _GEN_195[1:0] ? 64'h3fd87de2a6aea964 : _GEN_212; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_3_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_4_1_in2 = 2'h3 == _GEN_253[1:0] ? 64'h3fd87de2a6aea964 : _GEN_270; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_4_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_5_1_in2 = 2'h3 == _GEN_311[1:0] ? 64'h3fd87de2a6aea964 : _GEN_328; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_5_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_6_1_in2 = 2'h3 == _GEN_369[1:0] ? 64'h3fd87de2a6aea964 : _GEN_386; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_6_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFMultiply_48_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_48_in1 = io_in_bits_4_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_1_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_1_1_in1 = io_in_bits_4_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_7_1_in2 = BBFMultiply_1_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_7_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_72_in2 = BBFSubtract_7_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_72_in1 = BBFMultiply_48_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_2_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_2_1_in1 = io_in_bits_4_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_3_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_3_1_in1 = io_in_bits_4_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_1_1_in2 = BBFMultiply_3_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_1_1_in1 = BBFMultiply_2_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_2_1_in2 = BBFAdd_72_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_2_1_in1 = io_in_bits_0_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_3_1_in2 = BBFAdd_1_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_3_1_in1 = io_in_bits_0_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_8_1_in2 = BBFAdd_72_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_8_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_9_1_in2 = BBFAdd_1_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_9_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_4_1_in2 = BBFSubtract_8_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_4_1_in1 = io_in_bits_0_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_5_1_in2 = BBFSubtract_9_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_5_1_in1 = io_in_bits_0_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_4_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_4_1_in1 = io_in_bits_5_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_5_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_5_1_in1 = io_in_bits_5_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_10_1_in2 = BBFMultiply_5_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_10_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_6_1_in2 = BBFSubtract_10_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_6_1_in1 = BBFMultiply_4_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_6_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_6_1_in1 = io_in_bits_5_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_7_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_7_1_in1 = io_in_bits_5_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_7_1_in2 = BBFMultiply_7_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_7_1_in1 = BBFMultiply_6_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_8_1_in2 = BBFAdd_6_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_8_1_in1 = io_in_bits_1_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_9_1_in2 = BBFAdd_7_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_9_1_in1 = io_in_bits_1_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_11_1_in2 = BBFAdd_6_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_11_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_12_1_in2 = BBFAdd_7_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_12_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_10_1_in2 = BBFSubtract_11_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_10_1_in1 = io_in_bits_1_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_11_1_in2 = BBFSubtract_12_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_11_1_in1 = io_in_bits_1_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_8_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_8_1_in1 = io_in_bits_6_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_9_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_9_1_in1 = io_in_bits_6_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_13_1_in2 = BBFMultiply_9_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_13_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_12_1_in2 = BBFSubtract_13_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_12_1_in1 = BBFMultiply_8_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_10_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_10_1_in1 = io_in_bits_6_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_11_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_11_1_in1 = io_in_bits_6_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_13_1_in2 = BBFMultiply_11_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_13_1_in1 = BBFMultiply_10_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_14_1_in2 = BBFAdd_12_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_14_1_in1 = io_in_bits_2_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_15_1_in2 = BBFAdd_13_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_15_1_in1 = io_in_bits_2_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_14_1_in2 = BBFAdd_12_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_14_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_15_1_in2 = BBFAdd_13_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_15_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_16_1_in2 = BBFSubtract_14_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_16_1_in1 = io_in_bits_2_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_17_1_in2 = BBFSubtract_15_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_17_1_in1 = io_in_bits_2_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_12_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_12_1_in1 = io_in_bits_7_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_13_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_13_1_in1 = io_in_bits_7_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_16_1_in2 = BBFMultiply_13_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_16_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_18_1_in2 = BBFSubtract_16_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_18_1_in1 = BBFMultiply_12_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_14_1_in2 = _GEN_21[2] ? _T_1323_node : _GEN_43; // @[FFT.scala 49:49]
  assign BBFMultiply_14_1_in1 = io_in_bits_7_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_15_1_in2 = _GEN_21[2] ? _GEN_43 : _GEN_39; // @[FFT.scala 49:49]
  assign BBFMultiply_15_1_in1 = io_in_bits_7_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_19_1_in2 = BBFMultiply_15_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_19_1_in1 = BBFMultiply_14_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_20_1_in2 = BBFAdd_18_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_20_1_in1 = io_in_bits_3_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_21_1_in2 = BBFAdd_19_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_21_1_in1 = io_in_bits_3_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_17_1_in2 = BBFAdd_18_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_17_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_18_1_in2 = BBFAdd_19_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_18_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_22_1_in2 = BBFSubtract_17_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_22_1_in1 = io_in_bits_3_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFAdd_23_1_in2 = BBFSubtract_18_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_23_1_in1 = io_in_bits_3_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_16_1_in2 = _T_3494_real_node__T_3513_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_16_1_in1 = _T_3203_real_node__T_3222_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_17_1_in2 = _T_3494_imaginary_node__T_3513_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_17_1_in1 = _T_3203_imaginary_node__T_3222_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_19_1_in2 = BBFMultiply_17_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_19_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_24_1_in2 = BBFSubtract_19_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_24_1_in1 = BBFMultiply_16_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_18_1_in2 = _T_3494_imaginary_node__T_3513_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_18_1_in1 = _T_3203_real_node__T_3222_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_19_1_in2 = _T_3494_real_node__T_3513_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_19_1_in1 = _T_3203_imaginary_node__T_3222_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_25_1_in2 = BBFMultiply_19_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_25_1_in1 = BBFMultiply_18_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_26_1_in2 = BBFAdd_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_26_1_in1 = _T_2757_real_node__T_2776_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_27_1_in2 = BBFAdd_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_27_1_in1 = _T_2757_imaginary_node__T_2776_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_20_1_in2 = BBFAdd_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_20_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_21_1_in2 = BBFAdd_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_21_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_28_1_in2 = BBFSubtract_20_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_28_1_in1 = _T_2757_real_node__T_2776_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_29_1_in2 = BBFSubtract_21_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_29_1_in1 = _T_2757_imaginary_node__T_2776_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_20_1_in2 = _T_3751_real_node__T_3770_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_20_1_in1 = _T_3426_real_node__T_3445_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_21_1_in2 = _T_3751_imaginary_node__T_3770_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_21_1_in1 = _T_3426_imaginary_node__T_3445_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_22_1_in2 = BBFMultiply_21_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_22_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_30_1_in2 = BBFSubtract_22_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_30_1_in1 = BBFMultiply_20_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_22_1_in2 = _T_3751_imaginary_node__T_3770_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_22_1_in1 = _T_3426_real_node__T_3445_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_23_1_in2 = _T_3751_real_node__T_3770_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_23_1_in1 = _T_3426_imaginary_node__T_3445_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_31_1_in2 = BBFMultiply_23_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_31_1_in1 = BBFMultiply_22_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_32_1_in2 = BBFAdd_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_32_1_in1 = _T_2980_real_node__T_2999_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_33_1_in2 = BBFAdd_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_33_1_in1 = _T_2980_imaginary_node__T_2999_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_23_1_in2 = BBFAdd_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_23_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_24_1_in2 = BBFAdd_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_24_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_34_1_in2 = BBFSubtract_23_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_34_1_in1 = _T_2980_real_node__T_2999_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_35_1_in2 = BBFSubtract_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_35_1_in1 = _T_2980_imaginary_node__T_2999_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_24_1_in2 = _T_4008_real_node__T_4027_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_24_1_in1 = _T_3237_real_node__T_3256_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_25_1_in2 = _T_4008_imaginary_node__T_4027_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_25_1_in1 = _T_3237_imaginary_node__T_3256_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_25_1_in2 = BBFMultiply_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_25_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_36_1_in2 = BBFSubtract_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_36_1_in1 = BBFMultiply_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_26_1_in2 = _T_4008_imaginary_node__T_4027_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_26_1_in1 = _T_3237_real_node__T_3256_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_27_1_in2 = _T_4008_real_node__T_4027_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_27_1_in1 = _T_3237_imaginary_node__T_3256_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_37_1_in2 = BBFMultiply_27_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_37_1_in1 = BBFMultiply_26_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_38_1_in2 = BBFAdd_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_38_1_in1 = _T_2791_real_node__T_2810_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_39_1_in2 = BBFAdd_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_39_1_in1 = _T_2791_imaginary_node__T_2810_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_26_1_in2 = BBFAdd_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_26_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_27_1_in2 = BBFAdd_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_27_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_40_1_in2 = BBFSubtract_26_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_40_1_in1 = _T_2791_real_node__T_2810_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_41_1_in2 = BBFSubtract_27_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_41_1_in1 = _T_2791_imaginary_node__T_2810_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_28_1_in2 = _T_4265_real_node__T_4284_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_28_1_in1 = _T_3460_real_node__T_3479_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_29_1_in2 = _T_4265_imaginary_node__T_4284_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_29_1_in1 = _T_3460_imaginary_node__T_3479_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_28_1_in2 = BBFMultiply_29_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_28_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_42_1_in2 = BBFSubtract_28_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_42_1_in1 = BBFMultiply_28_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_30_1_in2 = _T_4265_imaginary_node__T_4284_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_30_1_in1 = _T_3460_real_node__T_3479_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_31_1_in2 = _T_4265_real_node__T_4284_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_31_1_in1 = _T_3460_imaginary_node__T_3479_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_43_1_in2 = BBFMultiply_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_43_1_in1 = BBFMultiply_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_44_1_in2 = BBFAdd_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_44_1_in1 = _T_3014_real_node__T_3033_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_45_1_in2 = BBFAdd_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_45_1_in1 = _T_3014_imaginary_node__T_3033_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_29_1_in2 = BBFAdd_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_29_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_30_1_in2 = BBFAdd_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_30_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_46_1_in2 = BBFSubtract_29_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_46_1_in1 = _T_3014_real_node__T_3033_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_47_1_in2 = BBFSubtract_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_47_1_in1 = _T_3014_imaginary_node__T_3033_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_32_1_in2 = _T_4522_real_node__T_4544_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_32_1_in1 = _T_3940_real_node__T_3959_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_33_1_in2 = _T_4522_imaginary_node__T_4544_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_33_1_in1 = _T_3940_imaginary_node__T_3959_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_31_1_in2 = BBFMultiply_33_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_31_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_48_1_in2 = BBFSubtract_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_48_1_in1 = BBFMultiply_32_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_34_1_in2 = _T_4522_imaginary_node__T_4544_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_34_1_in1 = _T_3940_real_node__T_3959_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_35_1_in2 = _T_4522_real_node__T_4544_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_35_1_in1 = _T_3940_imaginary_node__T_3959_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_49_1_in2 = BBFMultiply_35_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_49_1_in1 = BBFMultiply_34_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_50_1_in2 = BBFAdd_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_50_1_in1 = _T_3683_real_node__T_3702_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_51_1_in2 = BBFAdd_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_51_1_in1 = _T_3683_imaginary_node__T_3702_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_32_1_in2 = BBFAdd_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_32_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_33_1_in2 = BBFAdd_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_33_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_52_1_in2 = BBFSubtract_32_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_52_1_in1 = _T_3683_real_node__T_3702_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_53_1_in2 = BBFSubtract_33_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_53_1_in1 = _T_3683_imaginary_node__T_3702_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_36_1_in2 = _T_4714_real_node__T_4736_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_36_1_in1 = _T_3974_real_node__T_3993_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_37_1_in2 = _T_4714_imaginary_node__T_4736_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_37_1_in1 = _T_3974_imaginary_node__T_3993_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_34_1_in2 = BBFMultiply_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_34_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_54_1_in2 = BBFSubtract_34_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_54_1_in1 = BBFMultiply_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_38_1_in2 = _T_4714_imaginary_node__T_4736_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_38_1_in1 = _T_3974_real_node__T_3993_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_39_1_in2 = _T_4714_real_node__T_4736_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_39_1_in1 = _T_3974_imaginary_node__T_3993_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_55_1_in2 = BBFMultiply_39_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_55_1_in1 = BBFMultiply_38_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_56_1_in2 = BBFAdd_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_56_1_in1 = _T_3717_real_node__T_3736_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_57_1_in2 = BBFAdd_55_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_57_1_in1 = _T_3717_imaginary_node__T_3736_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_35_1_in2 = BBFAdd_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_35_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_36_1_in2 = BBFAdd_55_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_36_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_58_1_in2 = BBFSubtract_35_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_58_1_in1 = _T_3717_real_node__T_3736_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_59_1_in2 = BBFSubtract_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_59_1_in1 = _T_3717_imaginary_node__T_3736_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_40_1_in2 = _T_4906_real_node__T_4928_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_40_1_in1 = _T_4454_real_node__T_4473_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_41_1_in2 = _T_4906_imaginary_node__T_4928_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_41_1_in1 = _T_4454_imaginary_node__T_4473_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_37_1_in2 = BBFMultiply_41_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_37_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_60_1_in2 = BBFSubtract_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_60_1_in1 = BBFMultiply_40_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_42_1_in2 = _T_4906_imaginary_node__T_4928_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_42_1_in1 = _T_4454_real_node__T_4473_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_43_1_in2 = _T_4906_real_node__T_4928_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_43_1_in1 = _T_4454_imaginary_node__T_4473_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_61_1_in2 = BBFMultiply_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_61_1_in1 = BBFMultiply_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_62_1_in2 = BBFAdd_60_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_62_1_in1 = _T_4197_real_node__T_4216_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_63_1_in2 = BBFAdd_61_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_63_1_in1 = _T_4197_imaginary_node__T_4216_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_38_1_in2 = BBFAdd_60_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_38_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_39_1_in2 = BBFAdd_61_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_39_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_64_1_in2 = BBFSubtract_38_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_64_1_in1 = _T_4197_real_node__T_4216_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_65_1_in2 = BBFSubtract_39_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_65_1_in1 = _T_4197_imaginary_node__T_4216_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_44_1_in2 = _T_5098_real_node__T_5120_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_44_1_in1 = _T_4488_real_node__T_4507_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_45_1_in2 = _T_5098_imaginary_node__T_5120_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_45_1_in1 = _T_4488_imaginary_node__T_4507_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_40_1_in2 = BBFMultiply_45_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_40_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_66_1_in2 = BBFSubtract_40_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_66_1_in1 = BBFMultiply_44_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_46_1_in2 = _T_5098_imaginary_node__T_5120_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_46_1_in1 = _T_4488_real_node__T_4507_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_47_1_in2 = _T_5098_real_node__T_5120_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_47_1_in1 = _T_4488_imaginary_node__T_4507_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_67_1_in2 = BBFMultiply_47_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_67_1_in1 = BBFMultiply_46_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_68_1_in2 = BBFAdd_66_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_68_1_in1 = _T_4231_real_node__T_4250_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_69_1_in2 = BBFAdd_67_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_69_1_in1 = _T_4231_imaginary_node__T_4250_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_41_1_in2 = BBFAdd_66_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_41_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_42_1_in2 = BBFAdd_67_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_42_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_70_1_in2 = BBFSubtract_41_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_70_1_in1 = _T_4231_real_node__T_4250_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_71_1_in2 = BBFSubtract_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_71_1_in1 = _T_4231_imaginary_node__T_4250_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  always @(posedge clock) begin
    if (_T_635__T_644_en & _T_635__T_644_mask) begin
      _T_635[_T_635__T_644_addr] <= _T_635__T_644_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2757_real_node__T_2768_en & _T_2757_real_node__T_2768_mask) begin
      _T_2757_real_node[_T_2757_real_node__T_2768_addr] <= _T_2757_real_node__T_2768_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2757_imaginary_node__T_2768_en & _T_2757_imaginary_node__T_2768_mask) begin
      _T_2757_imaginary_node[_T_2757_imaginary_node__T_2768_addr] <= _T_2757_imaginary_node__T_2768_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2791_real_node__T_2802_en & _T_2791_real_node__T_2802_mask) begin
      _T_2791_real_node[_T_2791_real_node__T_2802_addr] <= _T_2791_real_node__T_2802_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2791_imaginary_node__T_2802_en & _T_2791_imaginary_node__T_2802_mask) begin
      _T_2791_imaginary_node[_T_2791_imaginary_node__T_2802_addr] <= _T_2791_imaginary_node__T_2802_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2980_real_node__T_2991_en & _T_2980_real_node__T_2991_mask) begin
      _T_2980_real_node[_T_2980_real_node__T_2991_addr] <= _T_2980_real_node__T_2991_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2980_imaginary_node__T_2991_en & _T_2980_imaginary_node__T_2991_mask) begin
      _T_2980_imaginary_node[_T_2980_imaginary_node__T_2991_addr] <= _T_2980_imaginary_node__T_2991_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3014_real_node__T_3025_en & _T_3014_real_node__T_3025_mask) begin
      _T_3014_real_node[_T_3014_real_node__T_3025_addr] <= _T_3014_real_node__T_3025_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3014_imaginary_node__T_3025_en & _T_3014_imaginary_node__T_3025_mask) begin
      _T_3014_imaginary_node[_T_3014_imaginary_node__T_3025_addr] <= _T_3014_imaginary_node__T_3025_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3203_real_node__T_3214_en & _T_3203_real_node__T_3214_mask) begin
      _T_3203_real_node[_T_3203_real_node__T_3214_addr] <= _T_3203_real_node__T_3214_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3203_imaginary_node__T_3214_en & _T_3203_imaginary_node__T_3214_mask) begin
      _T_3203_imaginary_node[_T_3203_imaginary_node__T_3214_addr] <= _T_3203_imaginary_node__T_3214_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3237_real_node__T_3248_en & _T_3237_real_node__T_3248_mask) begin
      _T_3237_real_node[_T_3237_real_node__T_3248_addr] <= _T_3237_real_node__T_3248_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3237_imaginary_node__T_3248_en & _T_3237_imaginary_node__T_3248_mask) begin
      _T_3237_imaginary_node[_T_3237_imaginary_node__T_3248_addr] <= _T_3237_imaginary_node__T_3248_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3426_real_node__T_3437_en & _T_3426_real_node__T_3437_mask) begin
      _T_3426_real_node[_T_3426_real_node__T_3437_addr] <= _T_3426_real_node__T_3437_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3426_imaginary_node__T_3437_en & _T_3426_imaginary_node__T_3437_mask) begin
      _T_3426_imaginary_node[_T_3426_imaginary_node__T_3437_addr] <= _T_3426_imaginary_node__T_3437_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3460_real_node__T_3471_en & _T_3460_real_node__T_3471_mask) begin
      _T_3460_real_node[_T_3460_real_node__T_3471_addr] <= _T_3460_real_node__T_3471_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3460_imaginary_node__T_3471_en & _T_3460_imaginary_node__T_3471_mask) begin
      _T_3460_imaginary_node[_T_3460_imaginary_node__T_3471_addr] <= _T_3460_imaginary_node__T_3471_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3494_real_node__T_3505_en & _T_3494_real_node__T_3505_mask) begin
      _T_3494_real_node[_T_3494_real_node__T_3505_addr] <= _T_3494_real_node__T_3505_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3494_imaginary_node__T_3505_en & _T_3494_imaginary_node__T_3505_mask) begin
      _T_3494_imaginary_node[_T_3494_imaginary_node__T_3505_addr] <= _T_3494_imaginary_node__T_3505_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3683_real_node__T_3694_en & _T_3683_real_node__T_3694_mask) begin
      _T_3683_real_node[_T_3683_real_node__T_3694_addr] <= _T_3683_real_node__T_3694_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3683_imaginary_node__T_3694_en & _T_3683_imaginary_node__T_3694_mask) begin
      _T_3683_imaginary_node[_T_3683_imaginary_node__T_3694_addr] <= _T_3683_imaginary_node__T_3694_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3717_real_node__T_3728_en & _T_3717_real_node__T_3728_mask) begin
      _T_3717_real_node[_T_3717_real_node__T_3728_addr] <= _T_3717_real_node__T_3728_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3717_imaginary_node__T_3728_en & _T_3717_imaginary_node__T_3728_mask) begin
      _T_3717_imaginary_node[_T_3717_imaginary_node__T_3728_addr] <= _T_3717_imaginary_node__T_3728_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3751_real_node__T_3762_en & _T_3751_real_node__T_3762_mask) begin
      _T_3751_real_node[_T_3751_real_node__T_3762_addr] <= _T_3751_real_node__T_3762_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3751_imaginary_node__T_3762_en & _T_3751_imaginary_node__T_3762_mask) begin
      _T_3751_imaginary_node[_T_3751_imaginary_node__T_3762_addr] <= _T_3751_imaginary_node__T_3762_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3940_real_node__T_3951_en & _T_3940_real_node__T_3951_mask) begin
      _T_3940_real_node[_T_3940_real_node__T_3951_addr] <= _T_3940_real_node__T_3951_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3940_imaginary_node__T_3951_en & _T_3940_imaginary_node__T_3951_mask) begin
      _T_3940_imaginary_node[_T_3940_imaginary_node__T_3951_addr] <= _T_3940_imaginary_node__T_3951_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3974_real_node__T_3985_en & _T_3974_real_node__T_3985_mask) begin
      _T_3974_real_node[_T_3974_real_node__T_3985_addr] <= _T_3974_real_node__T_3985_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3974_imaginary_node__T_3985_en & _T_3974_imaginary_node__T_3985_mask) begin
      _T_3974_imaginary_node[_T_3974_imaginary_node__T_3985_addr] <= _T_3974_imaginary_node__T_3985_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4008_real_node__T_4019_en & _T_4008_real_node__T_4019_mask) begin
      _T_4008_real_node[_T_4008_real_node__T_4019_addr] <= _T_4008_real_node__T_4019_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4008_imaginary_node__T_4019_en & _T_4008_imaginary_node__T_4019_mask) begin
      _T_4008_imaginary_node[_T_4008_imaginary_node__T_4019_addr] <= _T_4008_imaginary_node__T_4019_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4197_real_node__T_4208_en & _T_4197_real_node__T_4208_mask) begin
      _T_4197_real_node[_T_4197_real_node__T_4208_addr] <= _T_4197_real_node__T_4208_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4197_imaginary_node__T_4208_en & _T_4197_imaginary_node__T_4208_mask) begin
      _T_4197_imaginary_node[_T_4197_imaginary_node__T_4208_addr] <= _T_4197_imaginary_node__T_4208_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4231_real_node__T_4242_en & _T_4231_real_node__T_4242_mask) begin
      _T_4231_real_node[_T_4231_real_node__T_4242_addr] <= _T_4231_real_node__T_4242_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4231_imaginary_node__T_4242_en & _T_4231_imaginary_node__T_4242_mask) begin
      _T_4231_imaginary_node[_T_4231_imaginary_node__T_4242_addr] <= _T_4231_imaginary_node__T_4242_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4265_real_node__T_4276_en & _T_4265_real_node__T_4276_mask) begin
      _T_4265_real_node[_T_4265_real_node__T_4276_addr] <= _T_4265_real_node__T_4276_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4265_imaginary_node__T_4276_en & _T_4265_imaginary_node__T_4276_mask) begin
      _T_4265_imaginary_node[_T_4265_imaginary_node__T_4276_addr] <= _T_4265_imaginary_node__T_4276_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4454_real_node__T_4465_en & _T_4454_real_node__T_4465_mask) begin
      _T_4454_real_node[_T_4454_real_node__T_4465_addr] <= _T_4454_real_node__T_4465_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4454_imaginary_node__T_4465_en & _T_4454_imaginary_node__T_4465_mask) begin
      _T_4454_imaginary_node[_T_4454_imaginary_node__T_4465_addr] <= _T_4454_imaginary_node__T_4465_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4488_real_node__T_4499_en & _T_4488_real_node__T_4499_mask) begin
      _T_4488_real_node[_T_4488_real_node__T_4499_addr] <= _T_4488_real_node__T_4499_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4488_imaginary_node__T_4499_en & _T_4488_imaginary_node__T_4499_mask) begin
      _T_4488_imaginary_node[_T_4488_imaginary_node__T_4499_addr] <= _T_4488_imaginary_node__T_4499_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4522_real_node__T_4537_en & _T_4522_real_node__T_4537_mask) begin
      _T_4522_real_node[_T_4522_real_node__T_4537_addr] <= _T_4522_real_node__T_4537_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4522_imaginary_node__T_4537_en & _T_4522_imaginary_node__T_4537_mask) begin
      _T_4522_imaginary_node[_T_4522_imaginary_node__T_4537_addr] <= _T_4522_imaginary_node__T_4537_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4714_real_node__T_4729_en & _T_4714_real_node__T_4729_mask) begin
      _T_4714_real_node[_T_4714_real_node__T_4729_addr] <= _T_4714_real_node__T_4729_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4714_imaginary_node__T_4729_en & _T_4714_imaginary_node__T_4729_mask) begin
      _T_4714_imaginary_node[_T_4714_imaginary_node__T_4729_addr] <= _T_4714_imaginary_node__T_4729_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4906_real_node__T_4921_en & _T_4906_real_node__T_4921_mask) begin
      _T_4906_real_node[_T_4906_real_node__T_4921_addr] <= _T_4906_real_node__T_4921_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4906_imaginary_node__T_4921_en & _T_4906_imaginary_node__T_4921_mask) begin
      _T_4906_imaginary_node[_T_4906_imaginary_node__T_4921_addr] <= _T_4906_imaginary_node__T_4921_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5098_real_node__T_5113_en & _T_5098_real_node__T_5113_mask) begin
      _T_5098_real_node[_T_5098_real_node__T_5113_addr] <= _T_5098_real_node__T_5113_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5098_imaginary_node__T_5113_en & _T_5098_imaginary_node__T_5113_mask) begin
      _T_5098_imaginary_node[_T_5098_imaginary_node__T_5113_addr] <= _T_5098_imaginary_node__T_5113_data; // @[FFTUtilities.scala 169:21]
    end
    if (reset) begin // @[Counter.scala 15:29]
      sync <= 1'h0; // @[Counter.scala 15:29]
    end else if (_T_624) begin // @[CounterWithReset.scala 11:31]
      sync <= 1'h0; // @[CounterWithReset.scala 11:38]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      sync <= sync + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_637 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_637 <= _T_637 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_4524 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_4524 <= _T_4524 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_4716 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_4716 <= _T_4716 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_4908 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_4908 <= _T_4908 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_5100 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_5100 <= _T_5100 + 1'h1; // @[Counter.scala 24:13]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_635[initvar] = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2757_real_node[initvar] = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2757_imaginary_node[initvar] = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2791_real_node[initvar] = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2791_imaginary_node[initvar] = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2980_real_node[initvar] = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2980_imaginary_node[initvar] = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3014_real_node[initvar] = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3014_imaginary_node[initvar] = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3203_real_node[initvar] = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3203_imaginary_node[initvar] = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3237_real_node[initvar] = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3237_imaginary_node[initvar] = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3426_real_node[initvar] = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3426_imaginary_node[initvar] = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3460_real_node[initvar] = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3460_imaginary_node[initvar] = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3494_real_node[initvar] = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3494_imaginary_node[initvar] = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3683_real_node[initvar] = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3683_imaginary_node[initvar] = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3717_real_node[initvar] = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3717_imaginary_node[initvar] = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3751_real_node[initvar] = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3751_imaginary_node[initvar] = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3940_real_node[initvar] = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3940_imaginary_node[initvar] = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3974_real_node[initvar] = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3974_imaginary_node[initvar] = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4008_real_node[initvar] = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4008_imaginary_node[initvar] = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4197_real_node[initvar] = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4197_imaginary_node[initvar] = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4231_real_node[initvar] = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4231_imaginary_node[initvar] = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4265_real_node[initvar] = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4265_imaginary_node[initvar] = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4454_real_node[initvar] = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4454_imaginary_node[initvar] = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4488_real_node[initvar] = _RAND_39[63:0];
  _RAND_40 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4488_imaginary_node[initvar] = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4522_real_node[initvar] = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4522_imaginary_node[initvar] = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4714_real_node[initvar] = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4714_imaginary_node[initvar] = _RAND_44[63:0];
  _RAND_45 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4906_real_node[initvar] = _RAND_45[63:0];
  _RAND_46 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4906_imaginary_node[initvar] = _RAND_46[63:0];
  _RAND_47 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_5098_real_node[initvar] = _RAND_47[63:0];
  _RAND_48 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_5098_imaginary_node[initvar] = _RAND_48[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  sync = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_637 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4524 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4716 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4908 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  _T_5100 = _RAND_54[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BiplexFFT(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [63:0] io_in_bits_0_real_node,
  input  [63:0] io_in_bits_0_imaginary_node,
  input  [63:0] io_in_bits_1_real_node,
  input  [63:0] io_in_bits_1_imaginary_node,
  input  [63:0] io_in_bits_2_real_node,
  input  [63:0] io_in_bits_2_imaginary_node,
  input  [63:0] io_in_bits_3_real_node,
  input  [63:0] io_in_bits_3_imaginary_node,
  input  [63:0] io_in_bits_4_real_node,
  input  [63:0] io_in_bits_4_imaginary_node,
  input  [63:0] io_in_bits_5_real_node,
  input  [63:0] io_in_bits_5_imaginary_node,
  input  [63:0] io_in_bits_6_real_node,
  input  [63:0] io_in_bits_6_imaginary_node,
  input  [63:0] io_in_bits_7_real_node,
  input  [63:0] io_in_bits_7_imaginary_node,
  input         io_in_sync,
  output        io_out_valid,
  output [63:0] io_out_bits_0_real_node,
  output [63:0] io_out_bits_0_imaginary_node,
  output [63:0] io_out_bits_1_real_node,
  output [63:0] io_out_bits_1_imaginary_node,
  output [63:0] io_out_bits_2_real_node,
  output [63:0] io_out_bits_2_imaginary_node,
  output [63:0] io_out_bits_3_real_node,
  output [63:0] io_out_bits_3_imaginary_node,
  output [63:0] io_out_bits_4_real_node,
  output [63:0] io_out_bits_4_imaginary_node,
  output [63:0] io_out_bits_5_real_node,
  output [63:0] io_out_bits_5_imaginary_node,
  output [63:0] io_out_bits_6_real_node,
  output [63:0] io_out_bits_6_imaginary_node,
  output [63:0] io_out_bits_7_real_node,
  output [63:0] io_out_bits_7_imaginary_node,
  output        io_out_sync
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_33;
`endif // RANDOMIZE_REG_INIT
  reg  _T_638 [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_645_en; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_645_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_645_data; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_643_data; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_643_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_643_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_638__T_643_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_1664_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_real_node__T_1683_en; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_real_node__T_1683_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1664_real_node__T_1683_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1664_real_node__T_1675_data; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_real_node__T_1675_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_real_node__T_1675_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_real_node__T_1675_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_1664_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_imaginary_node__T_1683_en; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_imaginary_node__T_1683_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1664_imaginary_node__T_1683_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1664_imaginary_node__T_1675_data; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_imaginary_node__T_1675_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_imaginary_node__T_1675_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_1664_imaginary_node__T_1675_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_1899_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_real_node__T_1918_en; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_real_node__T_1918_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1899_real_node__T_1918_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1899_real_node__T_1910_data; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_real_node__T_1910_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_real_node__T_1910_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_real_node__T_1910_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_1899_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_imaginary_node__T_1918_en; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_imaginary_node__T_1918_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1899_imaginary_node__T_1918_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_1899_imaginary_node__T_1910_data; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_imaginary_node__T_1910_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_imaginary_node__T_1910_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_1899_imaginary_node__T_1910_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_48_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_48_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_48_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_49_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_49_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_49_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_43_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_43_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_43_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_72_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_72_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_72_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_50_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_50_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_50_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_51_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_51_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_51_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_73_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_73_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_73_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_74_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_74_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_74_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_75_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_75_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_75_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_44_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_44_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_44_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_45_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_45_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_45_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_76_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_76_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_76_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_77_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_77_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_77_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_2088_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_real_node__T_2107_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_real_node__T_2107_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2088_real_node__T_2107_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2088_real_node__T_2099_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_real_node__T_2099_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_real_node__T_2099_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_real_node__T_2099_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2088_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_imaginary_node__T_2107_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_imaginary_node__T_2107_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2088_imaginary_node__T_2107_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2088_imaginary_node__T_2099_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_imaginary_node__T_2099_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_imaginary_node__T_2099_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2088_imaginary_node__T_2099_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2323_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_real_node__T_2342_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_real_node__T_2342_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2323_real_node__T_2342_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2323_real_node__T_2334_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_real_node__T_2334_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_real_node__T_2334_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_real_node__T_2334_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2323_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_imaginary_node__T_2342_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_imaginary_node__T_2342_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2323_imaginary_node__T_2342_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2323_imaginary_node__T_2334_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_imaginary_node__T_2334_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_imaginary_node__T_2334_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2323_imaginary_node__T_2334_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_52_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_52_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_52_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_53_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_53_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_53_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_46_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_46_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_46_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_78_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_78_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_78_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_54_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_54_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_54_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_55_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_55_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_55_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_79_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_79_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_79_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_80_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_80_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_80_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_81_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_81_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_81_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_47_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_47_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_47_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_48_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_48_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_48_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_82_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_82_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_82_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_83_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_83_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_83_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_2512_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_real_node__T_2531_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_real_node__T_2531_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2512_real_node__T_2531_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2512_real_node__T_2523_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_real_node__T_2523_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_real_node__T_2523_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_real_node__T_2523_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2512_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_imaginary_node__T_2531_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_imaginary_node__T_2531_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2512_imaginary_node__T_2531_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2512_imaginary_node__T_2523_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_imaginary_node__T_2523_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_imaginary_node__T_2523_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2512_imaginary_node__T_2523_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2747_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_real_node__T_2766_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_real_node__T_2766_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2747_real_node__T_2766_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2747_real_node__T_2758_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_real_node__T_2758_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_real_node__T_2758_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_real_node__T_2758_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2747_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_imaginary_node__T_2766_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_imaginary_node__T_2766_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2747_imaginary_node__T_2766_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2747_imaginary_node__T_2758_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_imaginary_node__T_2758_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_imaginary_node__T_2758_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2747_imaginary_node__T_2758_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_56_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_56_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_56_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_57_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_57_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_57_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_49_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_49_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_49_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_84_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_84_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_84_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_58_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_58_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_58_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_59_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_59_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_59_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_85_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_85_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_85_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_86_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_86_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_86_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_87_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_87_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_87_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_50_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_50_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_50_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_51_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_51_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_51_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_88_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_88_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_88_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_89_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_89_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_89_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_2936_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_real_node__T_2955_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_real_node__T_2955_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2936_real_node__T_2955_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2936_real_node__T_2947_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_real_node__T_2947_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_real_node__T_2947_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_real_node__T_2947_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2936_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_imaginary_node__T_2955_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_imaginary_node__T_2955_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2936_imaginary_node__T_2955_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2936_imaginary_node__T_2947_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_imaginary_node__T_2947_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_imaginary_node__T_2947_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2936_imaginary_node__T_2947_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3171_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_real_node__T_3190_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_real_node__T_3190_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3171_real_node__T_3190_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3171_real_node__T_3182_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_real_node__T_3182_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_real_node__T_3182_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_real_node__T_3182_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3171_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_imaginary_node__T_3190_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_imaginary_node__T_3190_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3171_imaginary_node__T_3190_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3171_imaginary_node__T_3182_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_imaginary_node__T_3182_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_imaginary_node__T_3182_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3171_imaginary_node__T_3182_en; // @[FFTUtilities.scala 169:21]
  wire [63:0] BBFMultiply_60_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_60_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_60_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_61_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_61_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_61_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFSubtract_52_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_52_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_52_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_90_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_90_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_90_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFMultiply_62_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_62_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_62_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_63_1_out; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_63_1_in2; // @[DspReal.scala 106:36]
  wire [63:0] BBFMultiply_63_1_in1; // @[DspReal.scala 106:36]
  wire [63:0] BBFAdd_91_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_91_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_91_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_92_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_92_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_92_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_93_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_93_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_93_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFSubtract_53_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_53_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_53_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_54_1_out; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_54_1_in2; // @[DspReal.scala 102:36]
  wire [63:0] BBFSubtract_54_1_in1; // @[DspReal.scala 102:36]
  wire [63:0] BBFAdd_94_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_94_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_94_1_in1; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_95_1_out; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_95_1_in2; // @[DspReal.scala 98:36]
  wire [63:0] BBFAdd_95_1_in1; // @[DspReal.scala 98:36]
  reg [63:0] _T_3360_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_real_node__T_3379_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_real_node__T_3379_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3360_real_node__T_3379_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3360_real_node__T_3371_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_real_node__T_3371_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_real_node__T_3371_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_real_node__T_3371_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3360_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_imaginary_node__T_3379_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_imaginary_node__T_3379_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3360_imaginary_node__T_3379_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3360_imaginary_node__T_3371_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_imaginary_node__T_3371_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_imaginary_node__T_3371_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3360_imaginary_node__T_3371_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3595_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_real_node__T_3614_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_real_node__T_3614_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3595_real_node__T_3614_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3595_real_node__T_3606_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_real_node__T_3606_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_real_node__T_3606_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_real_node__T_3606_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3595_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_imaginary_node__T_3614_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_imaginary_node__T_3614_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3595_imaginary_node__T_3614_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3595_imaginary_node__T_3606_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_imaginary_node__T_3606_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_imaginary_node__T_3606_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3595_imaginary_node__T_3606_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3629_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_real_node__T_3648_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_real_node__T_3648_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3629_real_node__T_3648_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3629_real_node__T_3640_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_real_node__T_3640_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_real_node__T_3640_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_real_node__T_3640_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3629_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_imaginary_node__T_3648_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_imaginary_node__T_3648_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3629_imaginary_node__T_3648_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3629_imaginary_node__T_3640_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_imaginary_node__T_3640_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_imaginary_node__T_3640_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3629_imaginary_node__T_3640_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3864_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_real_node__T_3883_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_real_node__T_3883_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3864_real_node__T_3883_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3864_real_node__T_3875_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_real_node__T_3875_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_real_node__T_3875_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_real_node__T_3875_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3864_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_imaginary_node__T_3883_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_imaginary_node__T_3883_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3864_imaginary_node__T_3883_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3864_imaginary_node__T_3875_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_imaginary_node__T_3875_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_imaginary_node__T_3875_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3864_imaginary_node__T_3875_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3898_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_real_node__T_3917_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_real_node__T_3917_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3898_real_node__T_3917_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3898_real_node__T_3909_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_real_node__T_3909_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_real_node__T_3909_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_real_node__T_3909_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3898_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_imaginary_node__T_3917_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_imaginary_node__T_3917_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3898_imaginary_node__T_3917_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3898_imaginary_node__T_3909_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_imaginary_node__T_3909_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_imaginary_node__T_3909_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3898_imaginary_node__T_3909_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4133_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_real_node__T_4152_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_real_node__T_4152_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4133_real_node__T_4152_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4133_real_node__T_4144_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_real_node__T_4144_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_real_node__T_4144_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_real_node__T_4144_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4133_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_imaginary_node__T_4152_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_imaginary_node__T_4152_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4133_imaginary_node__T_4152_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4133_imaginary_node__T_4144_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_imaginary_node__T_4144_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_imaginary_node__T_4144_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4133_imaginary_node__T_4144_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4167_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_real_node__T_4186_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_real_node__T_4186_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4167_real_node__T_4186_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4167_real_node__T_4178_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_real_node__T_4178_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_real_node__T_4178_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_real_node__T_4178_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4167_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_imaginary_node__T_4186_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_imaginary_node__T_4186_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4167_imaginary_node__T_4186_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4167_imaginary_node__T_4178_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_imaginary_node__T_4178_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_imaginary_node__T_4178_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4167_imaginary_node__T_4178_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4402_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_real_node__T_4421_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_real_node__T_4421_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4402_real_node__T_4421_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4402_real_node__T_4413_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_real_node__T_4413_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_real_node__T_4413_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_real_node__T_4413_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4402_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_imaginary_node__T_4421_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_imaginary_node__T_4421_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4402_imaginary_node__T_4421_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4402_imaginary_node__T_4413_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_imaginary_node__T_4413_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_imaginary_node__T_4413_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4402_imaginary_node__T_4413_en; // @[FFTUtilities.scala 169:21]
  wire  _T_626 = io_in_sync & io_in_valid; // @[FFT.scala 96:66]
  reg  sync_0; // @[Counter.scala 15:29]
  wire  _T_633 = sync_0 + 1'h1; // @[Counter.scala 24:22]
  wire  sync_1 = _T_638__T_645_data; // @[FFT.scala 95:49 FFT.scala 97:89]
  wire [1:0] _T_1770 = {{1'd0}, sync_0}; // @[FFTUtilities.scala 89:20]
  wire [63:0] _T_1725_1_imaginary_node = _T_1664_imaginary_node__T_1683_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_1725_1_real_node = _T_1664_real_node__T_1683_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2149_1_imaginary_node = _T_2088_imaginary_node__T_2107_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2149_1_real_node = _T_2088_real_node__T_2107_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2573_1_imaginary_node = _T_2512_imaginary_node__T_2531_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2573_1_real_node = _T_2512_real_node__T_2531_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2997_1_imaginary_node = _T_2936_imaginary_node__T_2955_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2997_1_real_node = _T_2936_real_node__T_2955_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [1:0] _T_3466 = {{1'd0}, sync_1}; // @[FFTUtilities.scala 89:20]
  wire  _T_3485 = sync_1 + 1'h1; // @[FFTUtilities.scala 89:20]
  wire [63:0] stage_outputs_1_0_imaginary_node = BBFAdd_75_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_3421_1_imaginary_node = _T_3360_imaginary_node__T_3379_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_0_real_node = BBFAdd_74_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_3421_1_real_node = _T_3360_real_node__T_3379_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_2_imaginary_node = BBFAdd_81_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_3690_1_imaginary_node = _T_3629_imaginary_node__T_3648_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_2_real_node = BBFAdd_80_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_3690_1_real_node = _T_3629_real_node__T_3648_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_4_imaginary_node = BBFAdd_87_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_3959_1_imaginary_node = _T_3898_imaginary_node__T_3917_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_4_real_node = BBFAdd_86_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_3959_1_real_node = _T_3898_real_node__T_3917_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_6_imaginary_node = BBFAdd_93_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_4228_1_imaginary_node = _T_4167_imaginary_node__T_4186_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_6_real_node = BBFAdd_92_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [63:0] _T_4228_1_real_node = _T_4167_real_node__T_4186_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  BBFMultiply BBFMultiply_48_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_48_1_out),
    .in2(BBFMultiply_48_1_in2),
    .in1(BBFMultiply_48_1_in1)
  );
  BBFMultiply BBFMultiply_49_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_49_1_out),
    .in2(BBFMultiply_49_1_in2),
    .in1(BBFMultiply_49_1_in1)
  );
  BBFSubtract BBFSubtract_43_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_43_1_out),
    .in2(BBFSubtract_43_1_in2),
    .in1(BBFSubtract_43_1_in1)
  );
  BBFAdd BBFAdd_72_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_72_1_out),
    .in2(BBFAdd_72_1_in2),
    .in1(BBFAdd_72_1_in1)
  );
  BBFMultiply BBFMultiply_50_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_50_1_out),
    .in2(BBFMultiply_50_1_in2),
    .in1(BBFMultiply_50_1_in1)
  );
  BBFMultiply BBFMultiply_51_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_51_1_out),
    .in2(BBFMultiply_51_1_in2),
    .in1(BBFMultiply_51_1_in1)
  );
  BBFAdd BBFAdd_73_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_73_1_out),
    .in2(BBFAdd_73_1_in2),
    .in1(BBFAdd_73_1_in1)
  );
  BBFAdd BBFAdd_74_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_74_1_out),
    .in2(BBFAdd_74_1_in2),
    .in1(BBFAdd_74_1_in1)
  );
  BBFAdd BBFAdd_75_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_75_1_out),
    .in2(BBFAdd_75_1_in2),
    .in1(BBFAdd_75_1_in1)
  );
  BBFSubtract BBFSubtract_44_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_44_1_out),
    .in2(BBFSubtract_44_1_in2),
    .in1(BBFSubtract_44_1_in1)
  );
  BBFSubtract BBFSubtract_45_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_45_1_out),
    .in2(BBFSubtract_45_1_in2),
    .in1(BBFSubtract_45_1_in1)
  );
  BBFAdd BBFAdd_76_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_76_1_out),
    .in2(BBFAdd_76_1_in2),
    .in1(BBFAdd_76_1_in1)
  );
  BBFAdd BBFAdd_77_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_77_1_out),
    .in2(BBFAdd_77_1_in2),
    .in1(BBFAdd_77_1_in1)
  );
  BBFMultiply BBFMultiply_52_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_52_1_out),
    .in2(BBFMultiply_52_1_in2),
    .in1(BBFMultiply_52_1_in1)
  );
  BBFMultiply BBFMultiply_53_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_53_1_out),
    .in2(BBFMultiply_53_1_in2),
    .in1(BBFMultiply_53_1_in1)
  );
  BBFSubtract BBFSubtract_46_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_46_1_out),
    .in2(BBFSubtract_46_1_in2),
    .in1(BBFSubtract_46_1_in1)
  );
  BBFAdd BBFAdd_78_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_78_1_out),
    .in2(BBFAdd_78_1_in2),
    .in1(BBFAdd_78_1_in1)
  );
  BBFMultiply BBFMultiply_54_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_54_1_out),
    .in2(BBFMultiply_54_1_in2),
    .in1(BBFMultiply_54_1_in1)
  );
  BBFMultiply BBFMultiply_55_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_55_1_out),
    .in2(BBFMultiply_55_1_in2),
    .in1(BBFMultiply_55_1_in1)
  );
  BBFAdd BBFAdd_79_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_79_1_out),
    .in2(BBFAdd_79_1_in2),
    .in1(BBFAdd_79_1_in1)
  );
  BBFAdd BBFAdd_80_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_80_1_out),
    .in2(BBFAdd_80_1_in2),
    .in1(BBFAdd_80_1_in1)
  );
  BBFAdd BBFAdd_81_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_81_1_out),
    .in2(BBFAdd_81_1_in2),
    .in1(BBFAdd_81_1_in1)
  );
  BBFSubtract BBFSubtract_47_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_47_1_out),
    .in2(BBFSubtract_47_1_in2),
    .in1(BBFSubtract_47_1_in1)
  );
  BBFSubtract BBFSubtract_48_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_48_1_out),
    .in2(BBFSubtract_48_1_in2),
    .in1(BBFSubtract_48_1_in1)
  );
  BBFAdd BBFAdd_82_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_82_1_out),
    .in2(BBFAdd_82_1_in2),
    .in1(BBFAdd_82_1_in1)
  );
  BBFAdd BBFAdd_83_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_83_1_out),
    .in2(BBFAdd_83_1_in2),
    .in1(BBFAdd_83_1_in1)
  );
  BBFMultiply BBFMultiply_56_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_56_1_out),
    .in2(BBFMultiply_56_1_in2),
    .in1(BBFMultiply_56_1_in1)
  );
  BBFMultiply BBFMultiply_57_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_57_1_out),
    .in2(BBFMultiply_57_1_in2),
    .in1(BBFMultiply_57_1_in1)
  );
  BBFSubtract BBFSubtract_49_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_49_1_out),
    .in2(BBFSubtract_49_1_in2),
    .in1(BBFSubtract_49_1_in1)
  );
  BBFAdd BBFAdd_84_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_84_1_out),
    .in2(BBFAdd_84_1_in2),
    .in1(BBFAdd_84_1_in1)
  );
  BBFMultiply BBFMultiply_58_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_58_1_out),
    .in2(BBFMultiply_58_1_in2),
    .in1(BBFMultiply_58_1_in1)
  );
  BBFMultiply BBFMultiply_59_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_59_1_out),
    .in2(BBFMultiply_59_1_in2),
    .in1(BBFMultiply_59_1_in1)
  );
  BBFAdd BBFAdd_85_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_85_1_out),
    .in2(BBFAdd_85_1_in2),
    .in1(BBFAdd_85_1_in1)
  );
  BBFAdd BBFAdd_86_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_86_1_out),
    .in2(BBFAdd_86_1_in2),
    .in1(BBFAdd_86_1_in1)
  );
  BBFAdd BBFAdd_87_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_87_1_out),
    .in2(BBFAdd_87_1_in2),
    .in1(BBFAdd_87_1_in1)
  );
  BBFSubtract BBFSubtract_50_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_50_1_out),
    .in2(BBFSubtract_50_1_in2),
    .in1(BBFSubtract_50_1_in1)
  );
  BBFSubtract BBFSubtract_51_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_51_1_out),
    .in2(BBFSubtract_51_1_in2),
    .in1(BBFSubtract_51_1_in1)
  );
  BBFAdd BBFAdd_88_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_88_1_out),
    .in2(BBFAdd_88_1_in2),
    .in1(BBFAdd_88_1_in1)
  );
  BBFAdd BBFAdd_89_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_89_1_out),
    .in2(BBFAdd_89_1_in2),
    .in1(BBFAdd_89_1_in1)
  );
  BBFMultiply BBFMultiply_60_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_60_1_out),
    .in2(BBFMultiply_60_1_in2),
    .in1(BBFMultiply_60_1_in1)
  );
  BBFMultiply BBFMultiply_61_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_61_1_out),
    .in2(BBFMultiply_61_1_in2),
    .in1(BBFMultiply_61_1_in1)
  );
  BBFSubtract BBFSubtract_52_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_52_1_out),
    .in2(BBFSubtract_52_1_in2),
    .in1(BBFSubtract_52_1_in1)
  );
  BBFAdd BBFAdd_90_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_90_1_out),
    .in2(BBFAdd_90_1_in2),
    .in1(BBFAdd_90_1_in1)
  );
  BBFMultiply BBFMultiply_62_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_62_1_out),
    .in2(BBFMultiply_62_1_in2),
    .in1(BBFMultiply_62_1_in1)
  );
  BBFMultiply BBFMultiply_63_1 ( // @[DspReal.scala 106:36]
    .out(BBFMultiply_63_1_out),
    .in2(BBFMultiply_63_1_in2),
    .in1(BBFMultiply_63_1_in1)
  );
  BBFAdd BBFAdd_91_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_91_1_out),
    .in2(BBFAdd_91_1_in2),
    .in1(BBFAdd_91_1_in1)
  );
  BBFAdd BBFAdd_92_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_92_1_out),
    .in2(BBFAdd_92_1_in2),
    .in1(BBFAdd_92_1_in1)
  );
  BBFAdd BBFAdd_93_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_93_1_out),
    .in2(BBFAdd_93_1_in2),
    .in1(BBFAdd_93_1_in1)
  );
  BBFSubtract BBFSubtract_53_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_53_1_out),
    .in2(BBFSubtract_53_1_in2),
    .in1(BBFSubtract_53_1_in1)
  );
  BBFSubtract BBFSubtract_54_1 ( // @[DspReal.scala 102:36]
    .out(BBFSubtract_54_1_out),
    .in2(BBFSubtract_54_1_in2),
    .in1(BBFSubtract_54_1_in1)
  );
  BBFAdd BBFAdd_94_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_94_1_out),
    .in2(BBFAdd_94_1_in2),
    .in1(BBFAdd_94_1_in1)
  );
  BBFAdd BBFAdd_95_1 ( // @[DspReal.scala 98:36]
    .out(BBFAdd_95_1_out),
    .in2(BBFAdd_95_1_in2),
    .in1(BBFAdd_95_1_in1)
  );
  assign _T_638__T_645_en = 1'h1;
  assign _T_638__T_645_addr = 1'h0;
  assign _T_638__T_645_data = _T_638[_T_638__T_645_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_638__T_643_data = sync_0;
  assign _T_638__T_643_addr = 1'h0;
  assign _T_638__T_643_mask = 1'h1;
  assign _T_638__T_643_en = io_in_valid;
  assign _T_1664_real_node__T_1683_en = 1'h1;
  assign _T_1664_real_node__T_1683_addr = 1'h0;
  assign _T_1664_real_node__T_1683_data = _T_1664_real_node[_T_1664_real_node__T_1683_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_1664_real_node__T_1675_data = io_in_bits_1_real_node;
  assign _T_1664_real_node__T_1675_addr = 1'h0;
  assign _T_1664_real_node__T_1675_mask = 1'h1;
  assign _T_1664_real_node__T_1675_en = io_in_valid;
  assign _T_1664_imaginary_node__T_1683_en = 1'h1;
  assign _T_1664_imaginary_node__T_1683_addr = 1'h0;
  assign _T_1664_imaginary_node__T_1683_data = _T_1664_imaginary_node[_T_1664_imaginary_node__T_1683_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_1664_imaginary_node__T_1675_data = io_in_bits_1_imaginary_node;
  assign _T_1664_imaginary_node__T_1675_addr = 1'h0;
  assign _T_1664_imaginary_node__T_1675_mask = 1'h1;
  assign _T_1664_imaginary_node__T_1675_en = io_in_valid;
  assign _T_1899_real_node__T_1918_en = 1'h1;
  assign _T_1899_real_node__T_1918_addr = 1'h0;
  assign _T_1899_real_node__T_1918_data = _T_1899_real_node[_T_1899_real_node__T_1918_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_1899_real_node__T_1910_data = _T_1770[0] ? _T_1725_1_real_node : io_in_bits_0_real_node;
  assign _T_1899_real_node__T_1910_addr = 1'h0;
  assign _T_1899_real_node__T_1910_mask = 1'h1;
  assign _T_1899_real_node__T_1910_en = io_in_valid;
  assign _T_1899_imaginary_node__T_1918_en = 1'h1;
  assign _T_1899_imaginary_node__T_1918_addr = 1'h0;
  assign _T_1899_imaginary_node__T_1918_data = _T_1899_imaginary_node[_T_1899_imaginary_node__T_1918_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_1899_imaginary_node__T_1910_data = _T_1770[0] ? _T_1725_1_imaginary_node : io_in_bits_0_imaginary_node;
  assign _T_1899_imaginary_node__T_1910_addr = 1'h0;
  assign _T_1899_imaginary_node__T_1910_mask = 1'h1;
  assign _T_1899_imaginary_node__T_1910_en = io_in_valid;
  assign _T_2088_real_node__T_2107_en = 1'h1;
  assign _T_2088_real_node__T_2107_addr = 1'h0;
  assign _T_2088_real_node__T_2107_data = _T_2088_real_node[_T_2088_real_node__T_2107_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2088_real_node__T_2099_data = io_in_bits_3_real_node;
  assign _T_2088_real_node__T_2099_addr = 1'h0;
  assign _T_2088_real_node__T_2099_mask = 1'h1;
  assign _T_2088_real_node__T_2099_en = io_in_valid;
  assign _T_2088_imaginary_node__T_2107_en = 1'h1;
  assign _T_2088_imaginary_node__T_2107_addr = 1'h0;
  assign _T_2088_imaginary_node__T_2107_data = _T_2088_imaginary_node[_T_2088_imaginary_node__T_2107_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2088_imaginary_node__T_2099_data = io_in_bits_3_imaginary_node;
  assign _T_2088_imaginary_node__T_2099_addr = 1'h0;
  assign _T_2088_imaginary_node__T_2099_mask = 1'h1;
  assign _T_2088_imaginary_node__T_2099_en = io_in_valid;
  assign _T_2323_real_node__T_2342_en = 1'h1;
  assign _T_2323_real_node__T_2342_addr = 1'h0;
  assign _T_2323_real_node__T_2342_data = _T_2323_real_node[_T_2323_real_node__T_2342_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2323_real_node__T_2334_data = _T_1770[0] ? _T_2149_1_real_node : io_in_bits_2_real_node;
  assign _T_2323_real_node__T_2334_addr = 1'h0;
  assign _T_2323_real_node__T_2334_mask = 1'h1;
  assign _T_2323_real_node__T_2334_en = io_in_valid;
  assign _T_2323_imaginary_node__T_2342_en = 1'h1;
  assign _T_2323_imaginary_node__T_2342_addr = 1'h0;
  assign _T_2323_imaginary_node__T_2342_data = _T_2323_imaginary_node[_T_2323_imaginary_node__T_2342_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2323_imaginary_node__T_2334_data = _T_1770[0] ? _T_2149_1_imaginary_node : io_in_bits_2_imaginary_node;
  assign _T_2323_imaginary_node__T_2334_addr = 1'h0;
  assign _T_2323_imaginary_node__T_2334_mask = 1'h1;
  assign _T_2323_imaginary_node__T_2334_en = io_in_valid;
  assign _T_2512_real_node__T_2531_en = 1'h1;
  assign _T_2512_real_node__T_2531_addr = 1'h0;
  assign _T_2512_real_node__T_2531_data = _T_2512_real_node[_T_2512_real_node__T_2531_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2512_real_node__T_2523_data = io_in_bits_5_real_node;
  assign _T_2512_real_node__T_2523_addr = 1'h0;
  assign _T_2512_real_node__T_2523_mask = 1'h1;
  assign _T_2512_real_node__T_2523_en = io_in_valid;
  assign _T_2512_imaginary_node__T_2531_en = 1'h1;
  assign _T_2512_imaginary_node__T_2531_addr = 1'h0;
  assign _T_2512_imaginary_node__T_2531_data = _T_2512_imaginary_node[_T_2512_imaginary_node__T_2531_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2512_imaginary_node__T_2523_data = io_in_bits_5_imaginary_node;
  assign _T_2512_imaginary_node__T_2523_addr = 1'h0;
  assign _T_2512_imaginary_node__T_2523_mask = 1'h1;
  assign _T_2512_imaginary_node__T_2523_en = io_in_valid;
  assign _T_2747_real_node__T_2766_en = 1'h1;
  assign _T_2747_real_node__T_2766_addr = 1'h0;
  assign _T_2747_real_node__T_2766_data = _T_2747_real_node[_T_2747_real_node__T_2766_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2747_real_node__T_2758_data = _T_1770[0] ? _T_2573_1_real_node : io_in_bits_4_real_node;
  assign _T_2747_real_node__T_2758_addr = 1'h0;
  assign _T_2747_real_node__T_2758_mask = 1'h1;
  assign _T_2747_real_node__T_2758_en = io_in_valid;
  assign _T_2747_imaginary_node__T_2766_en = 1'h1;
  assign _T_2747_imaginary_node__T_2766_addr = 1'h0;
  assign _T_2747_imaginary_node__T_2766_data = _T_2747_imaginary_node[_T_2747_imaginary_node__T_2766_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2747_imaginary_node__T_2758_data = _T_1770[0] ? _T_2573_1_imaginary_node : io_in_bits_4_imaginary_node;
  assign _T_2747_imaginary_node__T_2758_addr = 1'h0;
  assign _T_2747_imaginary_node__T_2758_mask = 1'h1;
  assign _T_2747_imaginary_node__T_2758_en = io_in_valid;
  assign _T_2936_real_node__T_2955_en = 1'h1;
  assign _T_2936_real_node__T_2955_addr = 1'h0;
  assign _T_2936_real_node__T_2955_data = _T_2936_real_node[_T_2936_real_node__T_2955_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2936_real_node__T_2947_data = io_in_bits_7_real_node;
  assign _T_2936_real_node__T_2947_addr = 1'h0;
  assign _T_2936_real_node__T_2947_mask = 1'h1;
  assign _T_2936_real_node__T_2947_en = io_in_valid;
  assign _T_2936_imaginary_node__T_2955_en = 1'h1;
  assign _T_2936_imaginary_node__T_2955_addr = 1'h0;
  assign _T_2936_imaginary_node__T_2955_data = _T_2936_imaginary_node[_T_2936_imaginary_node__T_2955_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2936_imaginary_node__T_2947_data = io_in_bits_7_imaginary_node;
  assign _T_2936_imaginary_node__T_2947_addr = 1'h0;
  assign _T_2936_imaginary_node__T_2947_mask = 1'h1;
  assign _T_2936_imaginary_node__T_2947_en = io_in_valid;
  assign _T_3171_real_node__T_3190_en = 1'h1;
  assign _T_3171_real_node__T_3190_addr = 1'h0;
  assign _T_3171_real_node__T_3190_data = _T_3171_real_node[_T_3171_real_node__T_3190_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3171_real_node__T_3182_data = _T_1770[0] ? _T_2997_1_real_node : io_in_bits_6_real_node;
  assign _T_3171_real_node__T_3182_addr = 1'h0;
  assign _T_3171_real_node__T_3182_mask = 1'h1;
  assign _T_3171_real_node__T_3182_en = io_in_valid;
  assign _T_3171_imaginary_node__T_3190_en = 1'h1;
  assign _T_3171_imaginary_node__T_3190_addr = 1'h0;
  assign _T_3171_imaginary_node__T_3190_data = _T_3171_imaginary_node[_T_3171_imaginary_node__T_3190_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3171_imaginary_node__T_3182_data = _T_1770[0] ? _T_2997_1_imaginary_node : io_in_bits_6_imaginary_node;
  assign _T_3171_imaginary_node__T_3182_addr = 1'h0;
  assign _T_3171_imaginary_node__T_3182_mask = 1'h1;
  assign _T_3171_imaginary_node__T_3182_en = io_in_valid;
  assign _T_3360_real_node__T_3379_en = 1'h1;
  assign _T_3360_real_node__T_3379_addr = 1'h0;
  assign _T_3360_real_node__T_3379_data = _T_3360_real_node[_T_3360_real_node__T_3379_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3360_real_node__T_3371_data = BBFAdd_76_1_out;
  assign _T_3360_real_node__T_3371_addr = 1'h0;
  assign _T_3360_real_node__T_3371_mask = 1'h1;
  assign _T_3360_real_node__T_3371_en = io_in_valid;
  assign _T_3360_imaginary_node__T_3379_en = 1'h1;
  assign _T_3360_imaginary_node__T_3379_addr = 1'h0;
  assign _T_3360_imaginary_node__T_3379_data = _T_3360_imaginary_node[_T_3360_imaginary_node__T_3379_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3360_imaginary_node__T_3371_data = BBFAdd_77_1_out;
  assign _T_3360_imaginary_node__T_3371_addr = 1'h0;
  assign _T_3360_imaginary_node__T_3371_mask = 1'h1;
  assign _T_3360_imaginary_node__T_3371_en = io_in_valid;
  assign _T_3595_real_node__T_3614_en = 1'h1;
  assign _T_3595_real_node__T_3614_addr = 1'h0;
  assign _T_3595_real_node__T_3614_data = _T_3595_real_node[_T_3595_real_node__T_3614_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3595_real_node__T_3606_data = _T_3466[0] ? _T_3421_1_real_node : stage_outputs_1_0_real_node;
  assign _T_3595_real_node__T_3606_addr = 1'h0;
  assign _T_3595_real_node__T_3606_mask = 1'h1;
  assign _T_3595_real_node__T_3606_en = io_in_valid;
  assign _T_3595_imaginary_node__T_3614_en = 1'h1;
  assign _T_3595_imaginary_node__T_3614_addr = 1'h0;
  assign _T_3595_imaginary_node__T_3614_data = _T_3595_imaginary_node[_T_3595_imaginary_node__T_3614_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3595_imaginary_node__T_3606_data = _T_3466[0] ? _T_3421_1_imaginary_node : stage_outputs_1_0_imaginary_node;
  assign _T_3595_imaginary_node__T_3606_addr = 1'h0;
  assign _T_3595_imaginary_node__T_3606_mask = 1'h1;
  assign _T_3595_imaginary_node__T_3606_en = io_in_valid;
  assign _T_3629_real_node__T_3648_en = 1'h1;
  assign _T_3629_real_node__T_3648_addr = 1'h0;
  assign _T_3629_real_node__T_3648_data = _T_3629_real_node[_T_3629_real_node__T_3648_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3629_real_node__T_3640_data = BBFAdd_82_1_out;
  assign _T_3629_real_node__T_3640_addr = 1'h0;
  assign _T_3629_real_node__T_3640_mask = 1'h1;
  assign _T_3629_real_node__T_3640_en = io_in_valid;
  assign _T_3629_imaginary_node__T_3648_en = 1'h1;
  assign _T_3629_imaginary_node__T_3648_addr = 1'h0;
  assign _T_3629_imaginary_node__T_3648_data = _T_3629_imaginary_node[_T_3629_imaginary_node__T_3648_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3629_imaginary_node__T_3640_data = BBFAdd_83_1_out;
  assign _T_3629_imaginary_node__T_3640_addr = 1'h0;
  assign _T_3629_imaginary_node__T_3640_mask = 1'h1;
  assign _T_3629_imaginary_node__T_3640_en = io_in_valid;
  assign _T_3864_real_node__T_3883_en = 1'h1;
  assign _T_3864_real_node__T_3883_addr = 1'h0;
  assign _T_3864_real_node__T_3883_data = _T_3864_real_node[_T_3864_real_node__T_3883_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3864_real_node__T_3875_data = _T_3466[0] ? _T_3690_1_real_node : stage_outputs_1_2_real_node;
  assign _T_3864_real_node__T_3875_addr = 1'h0;
  assign _T_3864_real_node__T_3875_mask = 1'h1;
  assign _T_3864_real_node__T_3875_en = io_in_valid;
  assign _T_3864_imaginary_node__T_3883_en = 1'h1;
  assign _T_3864_imaginary_node__T_3883_addr = 1'h0;
  assign _T_3864_imaginary_node__T_3883_data = _T_3864_imaginary_node[_T_3864_imaginary_node__T_3883_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3864_imaginary_node__T_3875_data = _T_3466[0] ? _T_3690_1_imaginary_node : stage_outputs_1_2_imaginary_node;
  assign _T_3864_imaginary_node__T_3875_addr = 1'h0;
  assign _T_3864_imaginary_node__T_3875_mask = 1'h1;
  assign _T_3864_imaginary_node__T_3875_en = io_in_valid;
  assign _T_3898_real_node__T_3917_en = 1'h1;
  assign _T_3898_real_node__T_3917_addr = 1'h0;
  assign _T_3898_real_node__T_3917_data = _T_3898_real_node[_T_3898_real_node__T_3917_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3898_real_node__T_3909_data = BBFAdd_88_1_out;
  assign _T_3898_real_node__T_3909_addr = 1'h0;
  assign _T_3898_real_node__T_3909_mask = 1'h1;
  assign _T_3898_real_node__T_3909_en = io_in_valid;
  assign _T_3898_imaginary_node__T_3917_en = 1'h1;
  assign _T_3898_imaginary_node__T_3917_addr = 1'h0;
  assign _T_3898_imaginary_node__T_3917_data = _T_3898_imaginary_node[_T_3898_imaginary_node__T_3917_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3898_imaginary_node__T_3909_data = BBFAdd_89_1_out;
  assign _T_3898_imaginary_node__T_3909_addr = 1'h0;
  assign _T_3898_imaginary_node__T_3909_mask = 1'h1;
  assign _T_3898_imaginary_node__T_3909_en = io_in_valid;
  assign _T_4133_real_node__T_4152_en = 1'h1;
  assign _T_4133_real_node__T_4152_addr = 1'h0;
  assign _T_4133_real_node__T_4152_data = _T_4133_real_node[_T_4133_real_node__T_4152_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4133_real_node__T_4144_data = _T_3466[0] ? _T_3959_1_real_node : stage_outputs_1_4_real_node;
  assign _T_4133_real_node__T_4144_addr = 1'h0;
  assign _T_4133_real_node__T_4144_mask = 1'h1;
  assign _T_4133_real_node__T_4144_en = io_in_valid;
  assign _T_4133_imaginary_node__T_4152_en = 1'h1;
  assign _T_4133_imaginary_node__T_4152_addr = 1'h0;
  assign _T_4133_imaginary_node__T_4152_data = _T_4133_imaginary_node[_T_4133_imaginary_node__T_4152_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4133_imaginary_node__T_4144_data = _T_3466[0] ? _T_3959_1_imaginary_node : stage_outputs_1_4_imaginary_node;
  assign _T_4133_imaginary_node__T_4144_addr = 1'h0;
  assign _T_4133_imaginary_node__T_4144_mask = 1'h1;
  assign _T_4133_imaginary_node__T_4144_en = io_in_valid;
  assign _T_4167_real_node__T_4186_en = 1'h1;
  assign _T_4167_real_node__T_4186_addr = 1'h0;
  assign _T_4167_real_node__T_4186_data = _T_4167_real_node[_T_4167_real_node__T_4186_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4167_real_node__T_4178_data = BBFAdd_94_1_out;
  assign _T_4167_real_node__T_4178_addr = 1'h0;
  assign _T_4167_real_node__T_4178_mask = 1'h1;
  assign _T_4167_real_node__T_4178_en = io_in_valid;
  assign _T_4167_imaginary_node__T_4186_en = 1'h1;
  assign _T_4167_imaginary_node__T_4186_addr = 1'h0;
  assign _T_4167_imaginary_node__T_4186_data = _T_4167_imaginary_node[_T_4167_imaginary_node__T_4186_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4167_imaginary_node__T_4178_data = BBFAdd_95_1_out;
  assign _T_4167_imaginary_node__T_4178_addr = 1'h0;
  assign _T_4167_imaginary_node__T_4178_mask = 1'h1;
  assign _T_4167_imaginary_node__T_4178_en = io_in_valid;
  assign _T_4402_real_node__T_4421_en = 1'h1;
  assign _T_4402_real_node__T_4421_addr = 1'h0;
  assign _T_4402_real_node__T_4421_data = _T_4402_real_node[_T_4402_real_node__T_4421_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4402_real_node__T_4413_data = _T_3466[0] ? _T_4228_1_real_node : stage_outputs_1_6_real_node;
  assign _T_4402_real_node__T_4413_addr = 1'h0;
  assign _T_4402_real_node__T_4413_mask = 1'h1;
  assign _T_4402_real_node__T_4413_en = io_in_valid;
  assign _T_4402_imaginary_node__T_4421_en = 1'h1;
  assign _T_4402_imaginary_node__T_4421_addr = 1'h0;
  assign _T_4402_imaginary_node__T_4421_data = _T_4402_imaginary_node[_T_4402_imaginary_node__T_4421_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4402_imaginary_node__T_4413_data = _T_3466[0] ? _T_4228_1_imaginary_node : stage_outputs_1_6_imaginary_node;
  assign _T_4402_imaginary_node__T_4413_addr = 1'h0;
  assign _T_4402_imaginary_node__T_4413_mask = 1'h1;
  assign _T_4402_imaginary_node__T_4413_en = io_in_valid;
  assign io_out_valid = io_in_valid; // @[FFT.scala 99:16]
  assign io_out_bits_0_real_node = _T_3595_real_node__T_3614_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_0_imaginary_node = _T_3595_imaginary_node__T_3614_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_1_real_node = _T_3485 ? _T_3421_1_real_node : stage_outputs_1_0_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_1_imaginary_node = _T_3485 ? _T_3421_1_imaginary_node : stage_outputs_1_0_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_2_real_node = _T_3864_real_node__T_3883_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_2_imaginary_node = _T_3864_imaginary_node__T_3883_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_3_real_node = _T_3485 ? _T_3690_1_real_node : stage_outputs_1_2_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_3_imaginary_node = _T_3485 ? _T_3690_1_imaginary_node : stage_outputs_1_2_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_4_real_node = _T_4133_real_node__T_4152_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_4_imaginary_node = _T_4133_imaginary_node__T_4152_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_5_real_node = _T_3485 ? _T_3959_1_real_node : stage_outputs_1_4_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_5_imaginary_node = _T_3485 ? _T_3959_1_imaginary_node : stage_outputs_1_4_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_6_real_node = _T_4402_real_node__T_4421_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_6_imaginary_node = _T_4402_imaginary_node__T_4421_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_7_real_node = _T_3485 ? _T_4228_1_real_node : stage_outputs_1_6_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_7_imaginary_node = _T_3485 ? _T_4228_1_imaginary_node : stage_outputs_1_6_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_sync = ~sync_1; // @[FFT.scala 98:42]
  assign BBFMultiply_48_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_48_1_in1 = _T_633 ? _T_1725_1_real_node : io_in_bits_0_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_49_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_49_1_in1 = _T_633 ? _T_1725_1_imaginary_node : io_in_bits_0_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_43_1_in2 = BBFMultiply_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_43_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_72_1_in2 = BBFSubtract_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_72_1_in1 = BBFMultiply_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_50_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_50_1_in1 = _T_633 ? _T_1725_1_real_node : io_in_bits_0_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_51_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_51_1_in1 = _T_633 ? _T_1725_1_imaginary_node : io_in_bits_0_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_73_1_in2 = BBFMultiply_51_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_73_1_in1 = BBFMultiply_50_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_74_1_in2 = BBFAdd_72_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_74_1_in1 = _T_1899_real_node__T_1918_data; // @[DspReal.scala 81:21]
  assign BBFAdd_75_1_in2 = BBFAdd_73_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_75_1_in1 = _T_1899_imaginary_node__T_1918_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_44_1_in2 = BBFAdd_72_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_44_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_45_1_in2 = BBFAdd_73_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_45_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_76_1_in2 = BBFSubtract_44_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_76_1_in1 = _T_1899_real_node__T_1918_data; // @[DspReal.scala 81:21]
  assign BBFAdd_77_1_in2 = BBFSubtract_45_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_77_1_in1 = _T_1899_imaginary_node__T_1918_data; // @[DspReal.scala 81:21]
  assign BBFMultiply_52_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_52_1_in1 = _T_633 ? _T_2149_1_real_node : io_in_bits_2_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_53_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_53_1_in1 = _T_633 ? _T_2149_1_imaginary_node : io_in_bits_2_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_46_1_in2 = BBFMultiply_53_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_46_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_78_1_in2 = BBFSubtract_46_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_78_1_in1 = BBFMultiply_52_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_54_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_54_1_in1 = _T_633 ? _T_2149_1_real_node : io_in_bits_2_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_55_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_55_1_in1 = _T_633 ? _T_2149_1_imaginary_node : io_in_bits_2_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_79_1_in2 = BBFMultiply_55_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_79_1_in1 = BBFMultiply_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_80_1_in2 = BBFAdd_78_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_80_1_in1 = _T_2323_real_node__T_2342_data; // @[DspReal.scala 81:21]
  assign BBFAdd_81_1_in2 = BBFAdd_79_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_81_1_in1 = _T_2323_imaginary_node__T_2342_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_47_1_in2 = BBFAdd_78_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_47_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_48_1_in2 = BBFAdd_79_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_48_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_82_1_in2 = BBFSubtract_47_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_82_1_in1 = _T_2323_real_node__T_2342_data; // @[DspReal.scala 81:21]
  assign BBFAdd_83_1_in2 = BBFSubtract_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_83_1_in1 = _T_2323_imaginary_node__T_2342_data; // @[DspReal.scala 81:21]
  assign BBFMultiply_56_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_56_1_in1 = _T_633 ? _T_2573_1_real_node : io_in_bits_4_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_57_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_57_1_in1 = _T_633 ? _T_2573_1_imaginary_node : io_in_bits_4_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_49_1_in2 = BBFMultiply_57_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_49_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_84_1_in2 = BBFSubtract_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_84_1_in1 = BBFMultiply_56_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_58_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_58_1_in1 = _T_633 ? _T_2573_1_real_node : io_in_bits_4_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_59_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_59_1_in1 = _T_633 ? _T_2573_1_imaginary_node : io_in_bits_4_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_85_1_in2 = BBFMultiply_59_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_85_1_in1 = BBFMultiply_58_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_86_1_in2 = BBFAdd_84_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_86_1_in1 = _T_2747_real_node__T_2766_data; // @[DspReal.scala 81:21]
  assign BBFAdd_87_1_in2 = BBFAdd_85_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_87_1_in1 = _T_2747_imaginary_node__T_2766_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_50_1_in2 = BBFAdd_84_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_50_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_51_1_in2 = BBFAdd_85_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_51_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_88_1_in2 = BBFSubtract_50_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_88_1_in1 = _T_2747_real_node__T_2766_data; // @[DspReal.scala 81:21]
  assign BBFAdd_89_1_in2 = BBFSubtract_51_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_89_1_in1 = _T_2747_imaginary_node__T_2766_data; // @[DspReal.scala 81:21]
  assign BBFMultiply_60_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_60_1_in1 = _T_633 ? _T_2997_1_real_node : io_in_bits_6_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_61_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_61_1_in1 = _T_633 ? _T_2997_1_imaginary_node : io_in_bits_6_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_52_1_in2 = BBFMultiply_61_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_52_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_90_1_in2 = BBFSubtract_52_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_90_1_in1 = BBFMultiply_60_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_62_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_62_1_in1 = _T_633 ? _T_2997_1_real_node : io_in_bits_6_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_63_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_63_1_in1 = _T_633 ? _T_2997_1_imaginary_node : io_in_bits_6_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_91_1_in2 = BBFMultiply_63_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_91_1_in1 = BBFMultiply_62_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_92_1_in2 = BBFAdd_90_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_92_1_in1 = _T_3171_real_node__T_3190_data; // @[DspReal.scala 81:21]
  assign BBFAdd_93_1_in2 = BBFAdd_91_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_93_1_in1 = _T_3171_imaginary_node__T_3190_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_53_1_in2 = BBFAdd_90_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_53_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_54_1_in2 = BBFAdd_91_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_54_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_94_1_in2 = BBFSubtract_53_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_94_1_in1 = _T_3171_real_node__T_3190_data; // @[DspReal.scala 81:21]
  assign BBFAdd_95_1_in2 = BBFSubtract_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_95_1_in1 = _T_3171_imaginary_node__T_3190_data; // @[DspReal.scala 81:21]
  always @(posedge clock) begin
    if (_T_638__T_643_en & _T_638__T_643_mask) begin
      _T_638[_T_638__T_643_addr] <= _T_638__T_643_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_1664_real_node__T_1675_en & _T_1664_real_node__T_1675_mask) begin
      _T_1664_real_node[_T_1664_real_node__T_1675_addr] <= _T_1664_real_node__T_1675_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_1664_imaginary_node__T_1675_en & _T_1664_imaginary_node__T_1675_mask) begin
      _T_1664_imaginary_node[_T_1664_imaginary_node__T_1675_addr] <= _T_1664_imaginary_node__T_1675_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_1899_real_node__T_1910_en & _T_1899_real_node__T_1910_mask) begin
      _T_1899_real_node[_T_1899_real_node__T_1910_addr] <= _T_1899_real_node__T_1910_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_1899_imaginary_node__T_1910_en & _T_1899_imaginary_node__T_1910_mask) begin
      _T_1899_imaginary_node[_T_1899_imaginary_node__T_1910_addr] <= _T_1899_imaginary_node__T_1910_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2088_real_node__T_2099_en & _T_2088_real_node__T_2099_mask) begin
      _T_2088_real_node[_T_2088_real_node__T_2099_addr] <= _T_2088_real_node__T_2099_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2088_imaginary_node__T_2099_en & _T_2088_imaginary_node__T_2099_mask) begin
      _T_2088_imaginary_node[_T_2088_imaginary_node__T_2099_addr] <= _T_2088_imaginary_node__T_2099_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2323_real_node__T_2334_en & _T_2323_real_node__T_2334_mask) begin
      _T_2323_real_node[_T_2323_real_node__T_2334_addr] <= _T_2323_real_node__T_2334_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2323_imaginary_node__T_2334_en & _T_2323_imaginary_node__T_2334_mask) begin
      _T_2323_imaginary_node[_T_2323_imaginary_node__T_2334_addr] <= _T_2323_imaginary_node__T_2334_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2512_real_node__T_2523_en & _T_2512_real_node__T_2523_mask) begin
      _T_2512_real_node[_T_2512_real_node__T_2523_addr] <= _T_2512_real_node__T_2523_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2512_imaginary_node__T_2523_en & _T_2512_imaginary_node__T_2523_mask) begin
      _T_2512_imaginary_node[_T_2512_imaginary_node__T_2523_addr] <= _T_2512_imaginary_node__T_2523_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2747_real_node__T_2758_en & _T_2747_real_node__T_2758_mask) begin
      _T_2747_real_node[_T_2747_real_node__T_2758_addr] <= _T_2747_real_node__T_2758_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2747_imaginary_node__T_2758_en & _T_2747_imaginary_node__T_2758_mask) begin
      _T_2747_imaginary_node[_T_2747_imaginary_node__T_2758_addr] <= _T_2747_imaginary_node__T_2758_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2936_real_node__T_2947_en & _T_2936_real_node__T_2947_mask) begin
      _T_2936_real_node[_T_2936_real_node__T_2947_addr] <= _T_2936_real_node__T_2947_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2936_imaginary_node__T_2947_en & _T_2936_imaginary_node__T_2947_mask) begin
      _T_2936_imaginary_node[_T_2936_imaginary_node__T_2947_addr] <= _T_2936_imaginary_node__T_2947_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3171_real_node__T_3182_en & _T_3171_real_node__T_3182_mask) begin
      _T_3171_real_node[_T_3171_real_node__T_3182_addr] <= _T_3171_real_node__T_3182_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3171_imaginary_node__T_3182_en & _T_3171_imaginary_node__T_3182_mask) begin
      _T_3171_imaginary_node[_T_3171_imaginary_node__T_3182_addr] <= _T_3171_imaginary_node__T_3182_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3360_real_node__T_3371_en & _T_3360_real_node__T_3371_mask) begin
      _T_3360_real_node[_T_3360_real_node__T_3371_addr] <= _T_3360_real_node__T_3371_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3360_imaginary_node__T_3371_en & _T_3360_imaginary_node__T_3371_mask) begin
      _T_3360_imaginary_node[_T_3360_imaginary_node__T_3371_addr] <= _T_3360_imaginary_node__T_3371_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3595_real_node__T_3606_en & _T_3595_real_node__T_3606_mask) begin
      _T_3595_real_node[_T_3595_real_node__T_3606_addr] <= _T_3595_real_node__T_3606_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3595_imaginary_node__T_3606_en & _T_3595_imaginary_node__T_3606_mask) begin
      _T_3595_imaginary_node[_T_3595_imaginary_node__T_3606_addr] <= _T_3595_imaginary_node__T_3606_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3629_real_node__T_3640_en & _T_3629_real_node__T_3640_mask) begin
      _T_3629_real_node[_T_3629_real_node__T_3640_addr] <= _T_3629_real_node__T_3640_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3629_imaginary_node__T_3640_en & _T_3629_imaginary_node__T_3640_mask) begin
      _T_3629_imaginary_node[_T_3629_imaginary_node__T_3640_addr] <= _T_3629_imaginary_node__T_3640_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3864_real_node__T_3875_en & _T_3864_real_node__T_3875_mask) begin
      _T_3864_real_node[_T_3864_real_node__T_3875_addr] <= _T_3864_real_node__T_3875_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3864_imaginary_node__T_3875_en & _T_3864_imaginary_node__T_3875_mask) begin
      _T_3864_imaginary_node[_T_3864_imaginary_node__T_3875_addr] <= _T_3864_imaginary_node__T_3875_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3898_real_node__T_3909_en & _T_3898_real_node__T_3909_mask) begin
      _T_3898_real_node[_T_3898_real_node__T_3909_addr] <= _T_3898_real_node__T_3909_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3898_imaginary_node__T_3909_en & _T_3898_imaginary_node__T_3909_mask) begin
      _T_3898_imaginary_node[_T_3898_imaginary_node__T_3909_addr] <= _T_3898_imaginary_node__T_3909_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4133_real_node__T_4144_en & _T_4133_real_node__T_4144_mask) begin
      _T_4133_real_node[_T_4133_real_node__T_4144_addr] <= _T_4133_real_node__T_4144_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4133_imaginary_node__T_4144_en & _T_4133_imaginary_node__T_4144_mask) begin
      _T_4133_imaginary_node[_T_4133_imaginary_node__T_4144_addr] <= _T_4133_imaginary_node__T_4144_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4167_real_node__T_4178_en & _T_4167_real_node__T_4178_mask) begin
      _T_4167_real_node[_T_4167_real_node__T_4178_addr] <= _T_4167_real_node__T_4178_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4167_imaginary_node__T_4178_en & _T_4167_imaginary_node__T_4178_mask) begin
      _T_4167_imaginary_node[_T_4167_imaginary_node__T_4178_addr] <= _T_4167_imaginary_node__T_4178_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4402_real_node__T_4413_en & _T_4402_real_node__T_4413_mask) begin
      _T_4402_real_node[_T_4402_real_node__T_4413_addr] <= _T_4402_real_node__T_4413_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4402_imaginary_node__T_4413_en & _T_4402_imaginary_node__T_4413_mask) begin
      _T_4402_imaginary_node[_T_4402_imaginary_node__T_4413_addr] <= _T_4402_imaginary_node__T_4413_data; // @[FFTUtilities.scala 169:21]
    end
    if (reset) begin // @[Counter.scala 15:29]
      sync_0 <= 1'h0; // @[Counter.scala 15:29]
    end else if (_T_626) begin // @[CounterWithReset.scala 11:31]
      sync_0 <= 1'h0; // @[CounterWithReset.scala 11:38]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      sync_0 <= sync_0 + 1'h1; // @[Counter.scala 24:13]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_638[initvar] = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_1664_real_node[initvar] = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_1664_imaginary_node[initvar] = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_1899_real_node[initvar] = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_1899_imaginary_node[initvar] = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2088_real_node[initvar] = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2088_imaginary_node[initvar] = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2323_real_node[initvar] = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2323_imaginary_node[initvar] = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2512_real_node[initvar] = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2512_imaginary_node[initvar] = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2747_real_node[initvar] = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2747_imaginary_node[initvar] = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2936_real_node[initvar] = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2936_imaginary_node[initvar] = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3171_real_node[initvar] = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3171_imaginary_node[initvar] = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3360_real_node[initvar] = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3360_imaginary_node[initvar] = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3595_real_node[initvar] = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3595_imaginary_node[initvar] = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3629_real_node[initvar] = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3629_imaginary_node[initvar] = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3864_real_node[initvar] = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3864_imaginary_node[initvar] = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3898_real_node[initvar] = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3898_imaginary_node[initvar] = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4133_real_node[initvar] = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4133_imaginary_node[initvar] = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4167_real_node[initvar] = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4167_imaginary_node[initvar] = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4402_real_node[initvar] = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4402_imaginary_node[initvar] = _RAND_32[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  sync_0 = _RAND_33[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFTUnpacked(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [63:0] io_in_bits_0_real_node,
  input  [63:0] io_in_bits_0_imaginary_node,
  input  [63:0] io_in_bits_1_real_node,
  input  [63:0] io_in_bits_1_imaginary_node,
  input  [63:0] io_in_bits_2_real_node,
  input  [63:0] io_in_bits_2_imaginary_node,
  input  [63:0] io_in_bits_3_real_node,
  input  [63:0] io_in_bits_3_imaginary_node,
  input  [63:0] io_in_bits_4_real_node,
  input  [63:0] io_in_bits_4_imaginary_node,
  input  [63:0] io_in_bits_5_real_node,
  input  [63:0] io_in_bits_5_imaginary_node,
  input  [63:0] io_in_bits_6_real_node,
  input  [63:0] io_in_bits_6_imaginary_node,
  input  [63:0] io_in_bits_7_real_node,
  input  [63:0] io_in_bits_7_imaginary_node,
  input         io_in_sync,
  output        io_out_valid,
  output [63:0] io_out_bits_0_real_node,
  output [63:0] io_out_bits_0_imaginary_node,
  output [63:0] io_out_bits_1_real_node,
  output [63:0] io_out_bits_1_imaginary_node,
  output [63:0] io_out_bits_2_real_node,
  output [63:0] io_out_bits_2_imaginary_node,
  output [63:0] io_out_bits_3_real_node,
  output [63:0] io_out_bits_3_imaginary_node,
  output [63:0] io_out_bits_4_real_node,
  output [63:0] io_out_bits_4_imaginary_node,
  output [63:0] io_out_bits_5_real_node,
  output [63:0] io_out_bits_5_imaginary_node,
  output [63:0] io_out_bits_6_real_node,
  output [63:0] io_out_bits_6_imaginary_node,
  output [63:0] io_out_bits_7_real_node,
  output [63:0] io_out_bits_7_imaginary_node,
  output        io_out_sync
);
  wire  direct_clock; // @[FFT.scala 155:22]
  wire  direct_reset; // @[FFT.scala 155:22]
  wire  direct_io_in_valid; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_0_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_0_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_1_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_1_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_2_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_2_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_3_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_3_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_4_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_4_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_5_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_5_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_6_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_6_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_7_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_in_bits_7_imaginary_node; // @[FFT.scala 155:22]
  wire  direct_io_in_sync; // @[FFT.scala 155:22]
  wire  direct_io_out_valid; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_0_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_0_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_1_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_1_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_2_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_2_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_3_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_3_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_4_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_4_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_5_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_5_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_6_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_6_imaginary_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_7_real_node; // @[FFT.scala 155:22]
  wire [63:0] direct_io_out_bits_7_imaginary_node; // @[FFT.scala 155:22]
  wire  direct_io_out_sync; // @[FFT.scala 155:22]
  wire  BiplexFFT_1_clock; // @[FFT.scala 159:24]
  wire  BiplexFFT_1_reset; // @[FFT.scala 159:24]
  wire  BiplexFFT_1_io_in_valid; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_0_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_0_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_1_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_1_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_2_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_2_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_3_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_3_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_4_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_4_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_5_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_5_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_6_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_6_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_7_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_in_bits_7_imaginary_node; // @[FFT.scala 159:24]
  wire  BiplexFFT_1_io_in_sync; // @[FFT.scala 159:24]
  wire  BiplexFFT_1_io_out_valid; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_0_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_0_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_1_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_1_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_2_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_2_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_3_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_3_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_4_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_4_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_5_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_5_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_6_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_6_imaginary_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_7_real_node; // @[FFT.scala 159:24]
  wire [63:0] BiplexFFT_1_io_out_bits_7_imaginary_node; // @[FFT.scala 159:24]
  wire  BiplexFFT_1_io_out_sync; // @[FFT.scala 159:24]
  DirectFFT direct ( // @[FFT.scala 155:22]
    .clock(direct_clock),
    .reset(direct_reset),
    .io_in_valid(direct_io_in_valid),
    .io_in_bits_0_real_node(direct_io_in_bits_0_real_node),
    .io_in_bits_0_imaginary_node(direct_io_in_bits_0_imaginary_node),
    .io_in_bits_1_real_node(direct_io_in_bits_1_real_node),
    .io_in_bits_1_imaginary_node(direct_io_in_bits_1_imaginary_node),
    .io_in_bits_2_real_node(direct_io_in_bits_2_real_node),
    .io_in_bits_2_imaginary_node(direct_io_in_bits_2_imaginary_node),
    .io_in_bits_3_real_node(direct_io_in_bits_3_real_node),
    .io_in_bits_3_imaginary_node(direct_io_in_bits_3_imaginary_node),
    .io_in_bits_4_real_node(direct_io_in_bits_4_real_node),
    .io_in_bits_4_imaginary_node(direct_io_in_bits_4_imaginary_node),
    .io_in_bits_5_real_node(direct_io_in_bits_5_real_node),
    .io_in_bits_5_imaginary_node(direct_io_in_bits_5_imaginary_node),
    .io_in_bits_6_real_node(direct_io_in_bits_6_real_node),
    .io_in_bits_6_imaginary_node(direct_io_in_bits_6_imaginary_node),
    .io_in_bits_7_real_node(direct_io_in_bits_7_real_node),
    .io_in_bits_7_imaginary_node(direct_io_in_bits_7_imaginary_node),
    .io_in_sync(direct_io_in_sync),
    .io_out_valid(direct_io_out_valid),
    .io_out_bits_0_real_node(direct_io_out_bits_0_real_node),
    .io_out_bits_0_imaginary_node(direct_io_out_bits_0_imaginary_node),
    .io_out_bits_1_real_node(direct_io_out_bits_1_real_node),
    .io_out_bits_1_imaginary_node(direct_io_out_bits_1_imaginary_node),
    .io_out_bits_2_real_node(direct_io_out_bits_2_real_node),
    .io_out_bits_2_imaginary_node(direct_io_out_bits_2_imaginary_node),
    .io_out_bits_3_real_node(direct_io_out_bits_3_real_node),
    .io_out_bits_3_imaginary_node(direct_io_out_bits_3_imaginary_node),
    .io_out_bits_4_real_node(direct_io_out_bits_4_real_node),
    .io_out_bits_4_imaginary_node(direct_io_out_bits_4_imaginary_node),
    .io_out_bits_5_real_node(direct_io_out_bits_5_real_node),
    .io_out_bits_5_imaginary_node(direct_io_out_bits_5_imaginary_node),
    .io_out_bits_6_real_node(direct_io_out_bits_6_real_node),
    .io_out_bits_6_imaginary_node(direct_io_out_bits_6_imaginary_node),
    .io_out_bits_7_real_node(direct_io_out_bits_7_real_node),
    .io_out_bits_7_imaginary_node(direct_io_out_bits_7_imaginary_node),
    .io_out_sync(direct_io_out_sync)
  );
  BiplexFFT BiplexFFT_1 ( // @[FFT.scala 159:24]
    .clock(BiplexFFT_1_clock),
    .reset(BiplexFFT_1_reset),
    .io_in_valid(BiplexFFT_1_io_in_valid),
    .io_in_bits_0_real_node(BiplexFFT_1_io_in_bits_0_real_node),
    .io_in_bits_0_imaginary_node(BiplexFFT_1_io_in_bits_0_imaginary_node),
    .io_in_bits_1_real_node(BiplexFFT_1_io_in_bits_1_real_node),
    .io_in_bits_1_imaginary_node(BiplexFFT_1_io_in_bits_1_imaginary_node),
    .io_in_bits_2_real_node(BiplexFFT_1_io_in_bits_2_real_node),
    .io_in_bits_2_imaginary_node(BiplexFFT_1_io_in_bits_2_imaginary_node),
    .io_in_bits_3_real_node(BiplexFFT_1_io_in_bits_3_real_node),
    .io_in_bits_3_imaginary_node(BiplexFFT_1_io_in_bits_3_imaginary_node),
    .io_in_bits_4_real_node(BiplexFFT_1_io_in_bits_4_real_node),
    .io_in_bits_4_imaginary_node(BiplexFFT_1_io_in_bits_4_imaginary_node),
    .io_in_bits_5_real_node(BiplexFFT_1_io_in_bits_5_real_node),
    .io_in_bits_5_imaginary_node(BiplexFFT_1_io_in_bits_5_imaginary_node),
    .io_in_bits_6_real_node(BiplexFFT_1_io_in_bits_6_real_node),
    .io_in_bits_6_imaginary_node(BiplexFFT_1_io_in_bits_6_imaginary_node),
    .io_in_bits_7_real_node(BiplexFFT_1_io_in_bits_7_real_node),
    .io_in_bits_7_imaginary_node(BiplexFFT_1_io_in_bits_7_imaginary_node),
    .io_in_sync(BiplexFFT_1_io_in_sync),
    .io_out_valid(BiplexFFT_1_io_out_valid),
    .io_out_bits_0_real_node(BiplexFFT_1_io_out_bits_0_real_node),
    .io_out_bits_0_imaginary_node(BiplexFFT_1_io_out_bits_0_imaginary_node),
    .io_out_bits_1_real_node(BiplexFFT_1_io_out_bits_1_real_node),
    .io_out_bits_1_imaginary_node(BiplexFFT_1_io_out_bits_1_imaginary_node),
    .io_out_bits_2_real_node(BiplexFFT_1_io_out_bits_2_real_node),
    .io_out_bits_2_imaginary_node(BiplexFFT_1_io_out_bits_2_imaginary_node),
    .io_out_bits_3_real_node(BiplexFFT_1_io_out_bits_3_real_node),
    .io_out_bits_3_imaginary_node(BiplexFFT_1_io_out_bits_3_imaginary_node),
    .io_out_bits_4_real_node(BiplexFFT_1_io_out_bits_4_real_node),
    .io_out_bits_4_imaginary_node(BiplexFFT_1_io_out_bits_4_imaginary_node),
    .io_out_bits_5_real_node(BiplexFFT_1_io_out_bits_5_real_node),
    .io_out_bits_5_imaginary_node(BiplexFFT_1_io_out_bits_5_imaginary_node),
    .io_out_bits_6_real_node(BiplexFFT_1_io_out_bits_6_real_node),
    .io_out_bits_6_imaginary_node(BiplexFFT_1_io_out_bits_6_imaginary_node),
    .io_out_bits_7_real_node(BiplexFFT_1_io_out_bits_7_real_node),
    .io_out_bits_7_imaginary_node(BiplexFFT_1_io_out_bits_7_imaginary_node),
    .io_out_sync(BiplexFFT_1_io_out_sync)
  );
  assign io_out_valid = direct_io_out_valid; // @[FFT.scala 156:10]
  assign io_out_bits_0_real_node = direct_io_out_bits_0_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_0_imaginary_node = direct_io_out_bits_0_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_1_real_node = direct_io_out_bits_1_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_1_imaginary_node = direct_io_out_bits_1_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_2_real_node = direct_io_out_bits_2_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_2_imaginary_node = direct_io_out_bits_2_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_3_real_node = direct_io_out_bits_3_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_3_imaginary_node = direct_io_out_bits_3_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_4_real_node = direct_io_out_bits_4_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_4_imaginary_node = direct_io_out_bits_4_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_5_real_node = direct_io_out_bits_5_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_5_imaginary_node = direct_io_out_bits_5_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_6_real_node = direct_io_out_bits_6_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_6_imaginary_node = direct_io_out_bits_6_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_bits_7_real_node = direct_io_out_bits_7_real_node; // @[FFT.scala 156:10]
  assign io_out_bits_7_imaginary_node = direct_io_out_bits_7_imaginary_node; // @[FFT.scala 156:10]
  assign io_out_sync = direct_io_out_sync; // @[FFT.scala 156:10]
  assign direct_clock = clock;
  assign direct_reset = reset;
  assign direct_io_in_valid = BiplexFFT_1_io_out_valid; // @[FFT.scala 160:18]
  assign direct_io_in_bits_0_real_node = BiplexFFT_1_io_out_bits_0_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_0_imaginary_node = BiplexFFT_1_io_out_bits_0_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_1_real_node = BiplexFFT_1_io_out_bits_1_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_1_imaginary_node = BiplexFFT_1_io_out_bits_1_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_2_real_node = BiplexFFT_1_io_out_bits_2_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_2_imaginary_node = BiplexFFT_1_io_out_bits_2_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_3_real_node = BiplexFFT_1_io_out_bits_3_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_3_imaginary_node = BiplexFFT_1_io_out_bits_3_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_4_real_node = BiplexFFT_1_io_out_bits_4_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_4_imaginary_node = BiplexFFT_1_io_out_bits_4_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_5_real_node = BiplexFFT_1_io_out_bits_5_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_5_imaginary_node = BiplexFFT_1_io_out_bits_5_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_6_real_node = BiplexFFT_1_io_out_bits_6_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_6_imaginary_node = BiplexFFT_1_io_out_bits_6_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_7_real_node = BiplexFFT_1_io_out_bits_7_real_node; // @[FFT.scala 160:18]
  assign direct_io_in_bits_7_imaginary_node = BiplexFFT_1_io_out_bits_7_imaginary_node; // @[FFT.scala 160:18]
  assign direct_io_in_sync = BiplexFFT_1_io_out_sync; // @[FFT.scala 160:18]
  assign BiplexFFT_1_clock = clock;
  assign BiplexFFT_1_reset = reset;
  assign BiplexFFT_1_io_in_valid = io_in_valid; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_0_real_node = io_in_bits_0_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_0_imaginary_node = io_in_bits_0_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_1_real_node = io_in_bits_1_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_1_imaginary_node = io_in_bits_1_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_2_real_node = io_in_bits_2_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_2_imaginary_node = io_in_bits_2_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_3_real_node = io_in_bits_3_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_3_imaginary_node = io_in_bits_3_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_4_real_node = io_in_bits_4_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_4_imaginary_node = io_in_bits_4_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_5_real_node = io_in_bits_5_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_5_imaginary_node = io_in_bits_5_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_6_real_node = io_in_bits_6_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_6_imaginary_node = io_in_bits_6_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_7_real_node = io_in_bits_7_real_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_bits_7_imaginary_node = io_in_bits_7_imaginary_node; // @[FFT.scala 161:18]
  assign BiplexFFT_1_io_in_sync = io_in_sync; // @[FFT.scala 161:18]
endmodule
