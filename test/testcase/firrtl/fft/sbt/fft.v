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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
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
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [63:0] _RAND_65;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
`endif // RANDOMIZE_REG_INIT
  reg  _T_635 [0:2]; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_646_en; // @[FFTUtilities.scala 169:21]
  wire [1:0] _T_635__T_646_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_646_data; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_645_data; // @[FFTUtilities.scala 169:21]
  wire [1:0] _T_635__T_645_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_645_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_635__T_645_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_2758_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_real_node__T_2777_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_real_node__T_2777_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2758_real_node__T_2777_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2758_real_node__T_2769_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_real_node__T_2769_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_real_node__T_2769_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_real_node__T_2769_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2758_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_imaginary_node__T_2777_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_imaginary_node__T_2777_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2758_imaginary_node__T_2777_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2758_imaginary_node__T_2769_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_imaginary_node__T_2769_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_imaginary_node__T_2769_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2758_imaginary_node__T_2769_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2792_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_real_node__T_2811_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_real_node__T_2811_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2792_real_node__T_2811_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2792_real_node__T_2803_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_real_node__T_2803_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_real_node__T_2803_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_real_node__T_2803_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2792_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_imaginary_node__T_2811_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_imaginary_node__T_2811_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2792_imaginary_node__T_2811_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2792_imaginary_node__T_2803_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_imaginary_node__T_2803_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_imaginary_node__T_2803_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2792_imaginary_node__T_2803_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_2981_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_real_node__T_3000_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_real_node__T_3000_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2981_real_node__T_3000_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2981_real_node__T_2992_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_real_node__T_2992_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_real_node__T_2992_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_real_node__T_2992_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2981_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_imaginary_node__T_3000_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_imaginary_node__T_3000_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2981_imaginary_node__T_3000_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2981_imaginary_node__T_2992_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_imaginary_node__T_2992_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_imaginary_node__T_2992_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2981_imaginary_node__T_2992_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3015_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_real_node__T_3034_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_real_node__T_3034_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3015_real_node__T_3034_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3015_real_node__T_3026_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_real_node__T_3026_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_real_node__T_3026_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_real_node__T_3026_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3015_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_imaginary_node__T_3034_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_imaginary_node__T_3034_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3015_imaginary_node__T_3034_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3015_imaginary_node__T_3026_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_imaginary_node__T_3026_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_imaginary_node__T_3026_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3015_imaginary_node__T_3026_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_3204_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_real_node__T_3223_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_real_node__T_3223_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3204_real_node__T_3223_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3204_real_node__T_3215_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_real_node__T_3215_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_real_node__T_3215_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_real_node__T_3215_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3204_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_imaginary_node__T_3223_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_imaginary_node__T_3223_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3204_imaginary_node__T_3223_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3204_imaginary_node__T_3215_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_imaginary_node__T_3215_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_imaginary_node__T_3215_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3204_imaginary_node__T_3215_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3238_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_real_node__T_3257_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_real_node__T_3257_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3238_real_node__T_3257_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3238_real_node__T_3249_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_real_node__T_3249_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_real_node__T_3249_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_real_node__T_3249_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3238_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_imaginary_node__T_3257_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_imaginary_node__T_3257_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3238_imaginary_node__T_3257_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3238_imaginary_node__T_3249_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_imaginary_node__T_3249_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_imaginary_node__T_3249_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3238_imaginary_node__T_3249_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_3427_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_real_node__T_3446_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_real_node__T_3446_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3427_real_node__T_3446_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3427_real_node__T_3438_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_real_node__T_3438_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_real_node__T_3438_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_real_node__T_3438_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3427_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_imaginary_node__T_3446_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_imaginary_node__T_3446_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3427_imaginary_node__T_3446_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3427_imaginary_node__T_3438_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_imaginary_node__T_3438_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_imaginary_node__T_3438_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3427_imaginary_node__T_3438_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3461_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_real_node__T_3480_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_real_node__T_3480_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3461_real_node__T_3480_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3461_real_node__T_3472_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_real_node__T_3472_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_real_node__T_3472_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_real_node__T_3472_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3461_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_imaginary_node__T_3480_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_imaginary_node__T_3480_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3461_imaginary_node__T_3480_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3461_imaginary_node__T_3472_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_imaginary_node__T_3472_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_imaginary_node__T_3472_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3461_imaginary_node__T_3472_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3495_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_real_node__T_3514_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_real_node__T_3514_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3495_real_node__T_3514_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3495_real_node__T_3506_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_real_node__T_3506_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_real_node__T_3506_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_real_node__T_3506_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3495_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_imaginary_node__T_3514_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_imaginary_node__T_3514_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3495_imaginary_node__T_3514_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3495_imaginary_node__T_3506_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_imaginary_node__T_3506_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_imaginary_node__T_3506_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3495_imaginary_node__T_3506_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_3684_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_real_node__T_3703_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_real_node__T_3703_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3684_real_node__T_3703_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3684_real_node__T_3695_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_real_node__T_3695_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_real_node__T_3695_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_real_node__T_3695_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3684_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_imaginary_node__T_3703_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_imaginary_node__T_3703_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3684_imaginary_node__T_3703_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3684_imaginary_node__T_3695_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_imaginary_node__T_3695_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_imaginary_node__T_3695_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3684_imaginary_node__T_3695_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3718_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_real_node__T_3737_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_real_node__T_3737_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3718_real_node__T_3737_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3718_real_node__T_3729_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_real_node__T_3729_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_real_node__T_3729_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_real_node__T_3729_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3718_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_imaginary_node__T_3737_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_imaginary_node__T_3737_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3718_imaginary_node__T_3737_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3718_imaginary_node__T_3729_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_imaginary_node__T_3729_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_imaginary_node__T_3729_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3718_imaginary_node__T_3729_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3752_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_real_node__T_3771_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_real_node__T_3771_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3752_real_node__T_3771_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3752_real_node__T_3763_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_real_node__T_3763_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_real_node__T_3763_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_real_node__T_3763_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3752_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_imaginary_node__T_3771_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_imaginary_node__T_3771_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3752_imaginary_node__T_3771_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3752_imaginary_node__T_3763_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_imaginary_node__T_3763_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_imaginary_node__T_3763_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3752_imaginary_node__T_3763_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_3941_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_real_node__T_3960_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_real_node__T_3960_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3941_real_node__T_3960_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3941_real_node__T_3952_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_real_node__T_3952_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_real_node__T_3952_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_real_node__T_3952_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3941_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_imaginary_node__T_3960_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_imaginary_node__T_3960_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3941_imaginary_node__T_3960_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3941_imaginary_node__T_3952_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_imaginary_node__T_3952_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_imaginary_node__T_3952_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3941_imaginary_node__T_3952_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3975_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_real_node__T_3994_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_real_node__T_3994_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3975_real_node__T_3994_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3975_real_node__T_3986_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_real_node__T_3986_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_real_node__T_3986_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_real_node__T_3986_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3975_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_imaginary_node__T_3994_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_imaginary_node__T_3994_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3975_imaginary_node__T_3994_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3975_imaginary_node__T_3986_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_imaginary_node__T_3986_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_imaginary_node__T_3986_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3975_imaginary_node__T_3986_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4009_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_real_node__T_4028_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_real_node__T_4028_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4009_real_node__T_4028_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4009_real_node__T_4020_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_real_node__T_4020_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_real_node__T_4020_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_real_node__T_4020_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4009_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_imaginary_node__T_4028_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_imaginary_node__T_4028_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4009_imaginary_node__T_4028_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4009_imaginary_node__T_4020_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_imaginary_node__T_4020_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_imaginary_node__T_4020_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4009_imaginary_node__T_4020_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_4198_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_real_node__T_4217_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_real_node__T_4217_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4198_real_node__T_4217_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4198_real_node__T_4209_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_real_node__T_4209_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_real_node__T_4209_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_real_node__T_4209_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4198_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_imaginary_node__T_4217_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_imaginary_node__T_4217_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4198_imaginary_node__T_4217_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4198_imaginary_node__T_4209_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_imaginary_node__T_4209_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_imaginary_node__T_4209_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4198_imaginary_node__T_4209_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4232_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_real_node__T_4251_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_real_node__T_4251_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4232_real_node__T_4251_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4232_real_node__T_4243_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_real_node__T_4243_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_real_node__T_4243_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_real_node__T_4243_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4232_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_imaginary_node__T_4251_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_imaginary_node__T_4251_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4232_imaginary_node__T_4251_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4232_imaginary_node__T_4243_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_imaginary_node__T_4243_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_imaginary_node__T_4243_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4232_imaginary_node__T_4243_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4266_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_real_node__T_4285_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_real_node__T_4285_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4266_real_node__T_4285_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4266_real_node__T_4277_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_real_node__T_4277_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_real_node__T_4277_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_real_node__T_4277_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4266_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_imaginary_node__T_4285_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_imaginary_node__T_4285_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4266_imaginary_node__T_4285_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4266_imaginary_node__T_4277_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_imaginary_node__T_4277_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_imaginary_node__T_4277_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4266_imaginary_node__T_4277_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_4455_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_real_node__T_4474_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_real_node__T_4474_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4455_real_node__T_4474_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4455_real_node__T_4466_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_real_node__T_4466_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_real_node__T_4466_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_real_node__T_4466_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4455_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_imaginary_node__T_4474_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_imaginary_node__T_4474_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4455_imaginary_node__T_4474_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4455_imaginary_node__T_4466_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_imaginary_node__T_4466_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_imaginary_node__T_4466_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4455_imaginary_node__T_4466_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4489_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_real_node__T_4508_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_real_node__T_4508_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4489_real_node__T_4508_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4489_real_node__T_4500_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_real_node__T_4500_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_real_node__T_4500_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_real_node__T_4500_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4489_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_imaginary_node__T_4508_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_imaginary_node__T_4508_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4489_imaginary_node__T_4508_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4489_imaginary_node__T_4500_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_imaginary_node__T_4500_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_imaginary_node__T_4500_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4489_imaginary_node__T_4500_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4523_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_real_node__T_4545_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_real_node__T_4545_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4523_real_node__T_4545_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4523_real_node__T_4538_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_real_node__T_4538_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_real_node__T_4538_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_real_node__T_4538_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4523_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_imaginary_node__T_4545_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_imaginary_node__T_4545_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4523_imaginary_node__T_4545_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4523_imaginary_node__T_4538_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_imaginary_node__T_4538_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_imaginary_node__T_4538_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4523_imaginary_node__T_4538_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_4715_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_real_node__T_4734_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_real_node__T_4734_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4715_real_node__T_4734_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4715_real_node__T_4726_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_real_node__T_4726_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_real_node__T_4726_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_real_node__T_4726_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4715_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_imaginary_node__T_4734_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_imaginary_node__T_4734_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4715_imaginary_node__T_4734_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4715_imaginary_node__T_4726_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_imaginary_node__T_4726_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_imaginary_node__T_4726_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4715_imaginary_node__T_4726_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4749_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_real_node__T_4768_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_real_node__T_4768_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4749_real_node__T_4768_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4749_real_node__T_4760_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_real_node__T_4760_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_real_node__T_4760_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_real_node__T_4760_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4749_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_imaginary_node__T_4768_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_imaginary_node__T_4768_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4749_imaginary_node__T_4768_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4749_imaginary_node__T_4760_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_imaginary_node__T_4760_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_imaginary_node__T_4760_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4749_imaginary_node__T_4760_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4783_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_real_node__T_4805_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_real_node__T_4805_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4783_real_node__T_4805_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4783_real_node__T_4798_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_real_node__T_4798_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_real_node__T_4798_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_real_node__T_4798_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4783_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_imaginary_node__T_4805_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_imaginary_node__T_4805_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4783_imaginary_node__T_4805_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4783_imaginary_node__T_4798_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_imaginary_node__T_4798_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_imaginary_node__T_4798_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4783_imaginary_node__T_4798_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_4975_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_real_node__T_4994_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_real_node__T_4994_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4975_real_node__T_4994_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4975_real_node__T_4986_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_real_node__T_4986_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_real_node__T_4986_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_real_node__T_4986_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4975_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_imaginary_node__T_4994_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_imaginary_node__T_4994_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4975_imaginary_node__T_4994_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4975_imaginary_node__T_4986_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_imaginary_node__T_4986_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_imaginary_node__T_4986_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4975_imaginary_node__T_4986_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5009_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_real_node__T_5028_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_real_node__T_5028_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5009_real_node__T_5028_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5009_real_node__T_5020_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_real_node__T_5020_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_real_node__T_5020_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_real_node__T_5020_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5009_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_imaginary_node__T_5028_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_imaginary_node__T_5028_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5009_imaginary_node__T_5028_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5009_imaginary_node__T_5020_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_imaginary_node__T_5020_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_imaginary_node__T_5020_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5009_imaginary_node__T_5020_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5043_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_real_node__T_5065_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_real_node__T_5065_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5043_real_node__T_5065_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5043_real_node__T_5058_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_real_node__T_5058_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_real_node__T_5058_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_real_node__T_5058_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5043_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_imaginary_node__T_5065_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_imaginary_node__T_5065_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5043_imaginary_node__T_5065_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5043_imaginary_node__T_5058_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_imaginary_node__T_5058_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_imaginary_node__T_5058_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5043_imaginary_node__T_5058_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_5235_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_real_node__T_5254_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_real_node__T_5254_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5235_real_node__T_5254_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5235_real_node__T_5246_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_real_node__T_5246_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_real_node__T_5246_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_real_node__T_5246_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5235_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_imaginary_node__T_5254_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_imaginary_node__T_5254_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5235_imaginary_node__T_5254_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5235_imaginary_node__T_5246_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_imaginary_node__T_5246_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_imaginary_node__T_5246_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5235_imaginary_node__T_5246_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5269_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_real_node__T_5288_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_real_node__T_5288_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5269_real_node__T_5288_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5269_real_node__T_5280_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_real_node__T_5280_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_real_node__T_5280_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_real_node__T_5280_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5269_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_imaginary_node__T_5288_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_imaginary_node__T_5288_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5269_imaginary_node__T_5288_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5269_imaginary_node__T_5280_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_imaginary_node__T_5280_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_imaginary_node__T_5280_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5269_imaginary_node__T_5280_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5303_real_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_real_node__T_5325_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_real_node__T_5325_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5303_real_node__T_5325_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5303_real_node__T_5318_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_real_node__T_5318_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_real_node__T_5318_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_real_node__T_5318_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5303_imaginary_node [0:1]; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_imaginary_node__T_5325_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_imaginary_node__T_5325_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5303_imaginary_node__T_5325_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5303_imaginary_node__T_5318_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_imaginary_node__T_5318_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_imaginary_node__T_5318_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5303_imaginary_node__T_5318_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_5495_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_real_node__T_5514_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_real_node__T_5514_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5495_real_node__T_5514_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5495_real_node__T_5506_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_real_node__T_5506_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_real_node__T_5506_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_real_node__T_5506_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5495_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_imaginary_node__T_5514_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_imaginary_node__T_5514_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5495_imaginary_node__T_5514_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5495_imaginary_node__T_5506_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_imaginary_node__T_5506_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_imaginary_node__T_5506_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5495_imaginary_node__T_5506_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5529_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_real_node__T_5548_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_real_node__T_5548_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5529_real_node__T_5548_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5529_real_node__T_5540_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_real_node__T_5540_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_real_node__T_5540_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_real_node__T_5540_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_5529_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_imaginary_node__T_5548_en; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_imaginary_node__T_5548_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5529_imaginary_node__T_5548_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_5529_imaginary_node__T_5540_data; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_imaginary_node__T_5540_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_imaginary_node__T_5540_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_5529_imaginary_node__T_5540_en; // @[FFTUtilities.scala 169:21]
  wire  _T_624 = io_in_sync & io_in_valid; // @[FFT.scala 32:66]
  reg  sync; // @[Counter.scala 15:29]
  reg [1:0] _T_637; // @[Counter.scala 15:29]
  wire  _T_639 = _T_637 == 2'h2; // @[Counter.scala 23:24]
  wire [1:0] _T_642 = _T_637 + 2'h1; // @[Counter.scala 24:22]
  wire [3:0] start = sync * 3'h7; // @[FFT.scala 43:19]
  wire [4:0] _T_1299 = {{1'd0}, start}; // @[FFT.scala 49:67]
  wire [2:0] _GEN_12 = 4'h3 == _T_1299[3:0] ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_13 = 4'h4 == _T_1299[3:0] ? 3'h4 : _GEN_12; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_14 = 4'h5 == _T_1299[3:0] ? 3'h2 : _GEN_13; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_15 = 4'h6 == _T_1299[3:0] ? 3'h6 : _GEN_14; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_16 = 4'h7 == _T_1299[3:0] ? 3'h4 : _GEN_15; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_17 = 4'h8 == _T_1299[3:0] ? 3'h2 : _GEN_16; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_18 = 4'h9 == _T_1299[3:0] ? 3'h1 : _GEN_17; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_19 = 4'ha == _T_1299[3:0] ? 3'h5 : _GEN_18; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_20 = 4'hb == _T_1299[3:0] ? 3'h6 : _GEN_19; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_21 = 4'hc == _T_1299[3:0] ? 3'h3 : _GEN_20; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_22 = 4'hd == _T_1299[3:0] ? 3'h7 : _GEN_21; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_38 = 2'h1 == _GEN_22[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_39 = 2'h2 == _GEN_22[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_38; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_40 = 2'h3 == _GEN_22[1:0] ? 64'h3fd87de2a6aea964 : _GEN_39; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_42 = 2'h1 == _GEN_22[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_43 = 2'h2 == _GEN_22[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_42; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_44 = 2'h3 == _GEN_22[1:0] ? 64'hbfed906bcf328d46 : _GEN_43; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1324_node = BBFSubtract_43_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1361 = start + 4'h1; // @[FFT.scala 49:67]
  wire [2:0] _GEN_70 = 4'h3 == _T_1361 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_71 = 4'h4 == _T_1361 ? 3'h4 : _GEN_70; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_72 = 4'h5 == _T_1361 ? 3'h2 : _GEN_71; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_73 = 4'h6 == _T_1361 ? 3'h6 : _GEN_72; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_74 = 4'h7 == _T_1361 ? 3'h4 : _GEN_73; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_75 = 4'h8 == _T_1361 ? 3'h2 : _GEN_74; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_76 = 4'h9 == _T_1361 ? 3'h1 : _GEN_75; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_77 = 4'ha == _T_1361 ? 3'h5 : _GEN_76; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_78 = 4'hb == _T_1361 ? 3'h6 : _GEN_77; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_79 = 4'hc == _T_1361 ? 3'h3 : _GEN_78; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_80 = 4'hd == _T_1361 ? 3'h7 : _GEN_79; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_96 = 2'h1 == _GEN_80[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_97 = 2'h2 == _GEN_80[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_96; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_98 = 2'h3 == _GEN_80[1:0] ? 64'h3fd87de2a6aea964 : _GEN_97; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_100 = 2'h1 == _GEN_80[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_101 = 2'h2 == _GEN_80[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_100; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_102 = 2'h3 == _GEN_80[1:0] ? 64'hbfed906bcf328d46 : _GEN_101; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1385_node = BBFSubtract_1_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1422 = start + 4'h2; // @[FFT.scala 49:67]
  wire [2:0] _GEN_128 = 4'h3 == _T_1422 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_129 = 4'h4 == _T_1422 ? 3'h4 : _GEN_128; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_130 = 4'h5 == _T_1422 ? 3'h2 : _GEN_129; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_131 = 4'h6 == _T_1422 ? 3'h6 : _GEN_130; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_132 = 4'h7 == _T_1422 ? 3'h4 : _GEN_131; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_133 = 4'h8 == _T_1422 ? 3'h2 : _GEN_132; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_134 = 4'h9 == _T_1422 ? 3'h1 : _GEN_133; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_135 = 4'ha == _T_1422 ? 3'h5 : _GEN_134; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_136 = 4'hb == _T_1422 ? 3'h6 : _GEN_135; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_137 = 4'hc == _T_1422 ? 3'h3 : _GEN_136; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_138 = 4'hd == _T_1422 ? 3'h7 : _GEN_137; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_154 = 2'h1 == _GEN_138[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_155 = 2'h2 == _GEN_138[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_154; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_156 = 2'h3 == _GEN_138[1:0] ? 64'h3fd87de2a6aea964 : _GEN_155; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_158 = 2'h1 == _GEN_138[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_159 = 2'h2 == _GEN_138[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_158; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_160 = 2'h3 == _GEN_138[1:0] ? 64'hbfed906bcf328d46 : _GEN_159; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1446_node = BBFSubtract_2_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1483 = start + 4'h3; // @[FFT.scala 49:67]
  wire [2:0] _GEN_186 = 4'h3 == _T_1483 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_187 = 4'h4 == _T_1483 ? 3'h4 : _GEN_186; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_188 = 4'h5 == _T_1483 ? 3'h2 : _GEN_187; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_189 = 4'h6 == _T_1483 ? 3'h6 : _GEN_188; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_190 = 4'h7 == _T_1483 ? 3'h4 : _GEN_189; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_191 = 4'h8 == _T_1483 ? 3'h2 : _GEN_190; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_192 = 4'h9 == _T_1483 ? 3'h1 : _GEN_191; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_193 = 4'ha == _T_1483 ? 3'h5 : _GEN_192; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_194 = 4'hb == _T_1483 ? 3'h6 : _GEN_193; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_195 = 4'hc == _T_1483 ? 3'h3 : _GEN_194; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_196 = 4'hd == _T_1483 ? 3'h7 : _GEN_195; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_212 = 2'h1 == _GEN_196[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_213 = 2'h2 == _GEN_196[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_212; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_214 = 2'h3 == _GEN_196[1:0] ? 64'h3fd87de2a6aea964 : _GEN_213; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_216 = 2'h1 == _GEN_196[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_217 = 2'h2 == _GEN_196[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_216; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_218 = 2'h3 == _GEN_196[1:0] ? 64'hbfed906bcf328d46 : _GEN_217; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1507_node = BBFSubtract_3_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1544 = start + 4'h4; // @[FFT.scala 49:67]
  wire [2:0] _GEN_244 = 4'h3 == _T_1544 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_245 = 4'h4 == _T_1544 ? 3'h4 : _GEN_244; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_246 = 4'h5 == _T_1544 ? 3'h2 : _GEN_245; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_247 = 4'h6 == _T_1544 ? 3'h6 : _GEN_246; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_248 = 4'h7 == _T_1544 ? 3'h4 : _GEN_247; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_249 = 4'h8 == _T_1544 ? 3'h2 : _GEN_248; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_250 = 4'h9 == _T_1544 ? 3'h1 : _GEN_249; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_251 = 4'ha == _T_1544 ? 3'h5 : _GEN_250; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_252 = 4'hb == _T_1544 ? 3'h6 : _GEN_251; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_253 = 4'hc == _T_1544 ? 3'h3 : _GEN_252; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_254 = 4'hd == _T_1544 ? 3'h7 : _GEN_253; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_270 = 2'h1 == _GEN_254[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_271 = 2'h2 == _GEN_254[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_270; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_272 = 2'h3 == _GEN_254[1:0] ? 64'h3fd87de2a6aea964 : _GEN_271; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_274 = 2'h1 == _GEN_254[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_275 = 2'h2 == _GEN_254[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_274; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_276 = 2'h3 == _GEN_254[1:0] ? 64'hbfed906bcf328d46 : _GEN_275; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1568_node = BBFSubtract_4_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1605 = start + 4'h5; // @[FFT.scala 49:67]
  wire [2:0] _GEN_302 = 4'h3 == _T_1605 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_303 = 4'h4 == _T_1605 ? 3'h4 : _GEN_302; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_304 = 4'h5 == _T_1605 ? 3'h2 : _GEN_303; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_305 = 4'h6 == _T_1605 ? 3'h6 : _GEN_304; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_306 = 4'h7 == _T_1605 ? 3'h4 : _GEN_305; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_307 = 4'h8 == _T_1605 ? 3'h2 : _GEN_306; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_308 = 4'h9 == _T_1605 ? 3'h1 : _GEN_307; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_309 = 4'ha == _T_1605 ? 3'h5 : _GEN_308; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_310 = 4'hb == _T_1605 ? 3'h6 : _GEN_309; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_311 = 4'hc == _T_1605 ? 3'h3 : _GEN_310; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_312 = 4'hd == _T_1605 ? 3'h7 : _GEN_311; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_328 = 2'h1 == _GEN_312[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_329 = 2'h2 == _GEN_312[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_328; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_330 = 2'h3 == _GEN_312[1:0] ? 64'h3fd87de2a6aea964 : _GEN_329; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_332 = 2'h1 == _GEN_312[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_333 = 2'h2 == _GEN_312[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_332; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_334 = 2'h3 == _GEN_312[1:0] ? 64'hbfed906bcf328d46 : _GEN_333; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1629_node = BBFSubtract_5_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  wire [3:0] _T_1666 = start + 4'h6; // @[FFT.scala 49:67]
  wire [2:0] _GEN_360 = 4'h3 == _T_1666 ? 3'h4 : 3'h0; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_361 = 4'h4 == _T_1666 ? 3'h4 : _GEN_360; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_362 = 4'h5 == _T_1666 ? 3'h2 : _GEN_361; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_363 = 4'h6 == _T_1666 ? 3'h6 : _GEN_362; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_364 = 4'h7 == _T_1666 ? 3'h4 : _GEN_363; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_365 = 4'h8 == _T_1666 ? 3'h2 : _GEN_364; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_366 = 4'h9 == _T_1666 ? 3'h1 : _GEN_365; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_367 = 4'ha == _T_1666 ? 3'h5 : _GEN_366; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_368 = 4'hb == _T_1666 ? 3'h6 : _GEN_367; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_369 = 4'hc == _T_1666 ? 3'h3 : _GEN_368; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [2:0] _GEN_370 = 4'hd == _T_1666 ? 3'h7 : _GEN_369; // @[FFT.scala 49:76 FFT.scala 49:76]
  wire [63:0] _GEN_386 = 2'h1 == _GEN_370[1:0] ? 64'h3fed906bcf328d46 : 64'h3ff0000000000000; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_387 = 2'h2 == _GEN_370[1:0] ? 64'h3fe6a09e667f3bcd : _GEN_386; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_388 = 2'h3 == _GEN_370[1:0] ? 64'h3fd87de2a6aea964 : _GEN_387; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  wire [63:0] _GEN_390 = 2'h1 == _GEN_370[1:0] ? 64'hbfd87de2a6aea963 : 64'h8000000000000000; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_391 = 2'h2 == _GEN_370[1:0] ? 64'hbfe6a09e667f3bcc : _GEN_390; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _GEN_392 = 2'h3 == _GEN_370[1:0] ? 64'hbfed906bcf328d46 : _GEN_391; // @[DspComplex.scala 15:17 DspComplex.scala 15:17]
  wire [63:0] _T_1690_node = BBFSubtract_6_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  reg  _T_4525; // @[Counter.scala 15:29]
  reg  _T_4785; // @[Counter.scala 15:29]
  reg  _T_5045; // @[Counter.scala 15:29]
  reg  _T_5305; // @[Counter.scala 15:29]
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
  assign _T_635__T_646_en = 1'h1;
  assign _T_635__T_646_addr = _T_637;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_635__T_646_data = _T_635[_T_635__T_646_addr]; // @[FFTUtilities.scala 169:21]
  `else
  assign _T_635__T_646_data = _T_635__T_646_addr >= 2'h3 ? _RAND_1[0:0] : _T_635[_T_635__T_646_addr]; // @[FFTUtilities.scala 169:21]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_635__T_645_data = io_in_sync;
  assign _T_635__T_645_addr = _T_637;
  assign _T_635__T_645_mask = 1'h1;
  assign _T_635__T_645_en = io_in_valid;
  assign _T_2758_real_node__T_2777_en = 1'h1;
  assign _T_2758_real_node__T_2777_addr = 1'h0;
  assign _T_2758_real_node__T_2777_data = _T_2758_real_node[_T_2758_real_node__T_2777_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2758_real_node__T_2769_data = BBFAdd_2_1_out;
  assign _T_2758_real_node__T_2769_addr = 1'h0;
  assign _T_2758_real_node__T_2769_mask = 1'h1;
  assign _T_2758_real_node__T_2769_en = io_in_valid;
  assign _T_2758_imaginary_node__T_2777_en = 1'h1;
  assign _T_2758_imaginary_node__T_2777_addr = 1'h0;
  assign _T_2758_imaginary_node__T_2777_data = _T_2758_imaginary_node[_T_2758_imaginary_node__T_2777_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2758_imaginary_node__T_2769_data = BBFAdd_3_1_out;
  assign _T_2758_imaginary_node__T_2769_addr = 1'h0;
  assign _T_2758_imaginary_node__T_2769_mask = 1'h1;
  assign _T_2758_imaginary_node__T_2769_en = io_in_valid;
  assign _T_2792_real_node__T_2811_en = 1'h1;
  assign _T_2792_real_node__T_2811_addr = 1'h0;
  assign _T_2792_real_node__T_2811_data = _T_2792_real_node[_T_2792_real_node__T_2811_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2792_real_node__T_2803_data = BBFAdd_4_1_out;
  assign _T_2792_real_node__T_2803_addr = 1'h0;
  assign _T_2792_real_node__T_2803_mask = 1'h1;
  assign _T_2792_real_node__T_2803_en = io_in_valid;
  assign _T_2792_imaginary_node__T_2811_en = 1'h1;
  assign _T_2792_imaginary_node__T_2811_addr = 1'h0;
  assign _T_2792_imaginary_node__T_2811_data = _T_2792_imaginary_node[_T_2792_imaginary_node__T_2811_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2792_imaginary_node__T_2803_data = BBFAdd_5_1_out;
  assign _T_2792_imaginary_node__T_2803_addr = 1'h0;
  assign _T_2792_imaginary_node__T_2803_mask = 1'h1;
  assign _T_2792_imaginary_node__T_2803_en = io_in_valid;
  assign _T_2981_real_node__T_3000_en = 1'h1;
  assign _T_2981_real_node__T_3000_addr = 1'h0;
  assign _T_2981_real_node__T_3000_data = _T_2981_real_node[_T_2981_real_node__T_3000_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2981_real_node__T_2992_data = BBFAdd_8_1_out;
  assign _T_2981_real_node__T_2992_addr = 1'h0;
  assign _T_2981_real_node__T_2992_mask = 1'h1;
  assign _T_2981_real_node__T_2992_en = io_in_valid;
  assign _T_2981_imaginary_node__T_3000_en = 1'h1;
  assign _T_2981_imaginary_node__T_3000_addr = 1'h0;
  assign _T_2981_imaginary_node__T_3000_data = _T_2981_imaginary_node[_T_2981_imaginary_node__T_3000_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2981_imaginary_node__T_2992_data = BBFAdd_9_1_out;
  assign _T_2981_imaginary_node__T_2992_addr = 1'h0;
  assign _T_2981_imaginary_node__T_2992_mask = 1'h1;
  assign _T_2981_imaginary_node__T_2992_en = io_in_valid;
  assign _T_3015_real_node__T_3034_en = 1'h1;
  assign _T_3015_real_node__T_3034_addr = 1'h0;
  assign _T_3015_real_node__T_3034_data = _T_3015_real_node[_T_3015_real_node__T_3034_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3015_real_node__T_3026_data = BBFAdd_10_1_out;
  assign _T_3015_real_node__T_3026_addr = 1'h0;
  assign _T_3015_real_node__T_3026_mask = 1'h1;
  assign _T_3015_real_node__T_3026_en = io_in_valid;
  assign _T_3015_imaginary_node__T_3034_en = 1'h1;
  assign _T_3015_imaginary_node__T_3034_addr = 1'h0;
  assign _T_3015_imaginary_node__T_3034_data = _T_3015_imaginary_node[_T_3015_imaginary_node__T_3034_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3015_imaginary_node__T_3026_data = BBFAdd_11_1_out;
  assign _T_3015_imaginary_node__T_3026_addr = 1'h0;
  assign _T_3015_imaginary_node__T_3026_mask = 1'h1;
  assign _T_3015_imaginary_node__T_3026_en = io_in_valid;
  assign _T_3204_real_node__T_3223_en = 1'h1;
  assign _T_3204_real_node__T_3223_addr = 1'h0;
  assign _T_3204_real_node__T_3223_data = _T_3204_real_node[_T_3204_real_node__T_3223_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3204_real_node__T_3215_data = BBFAdd_14_1_out;
  assign _T_3204_real_node__T_3215_addr = 1'h0;
  assign _T_3204_real_node__T_3215_mask = 1'h1;
  assign _T_3204_real_node__T_3215_en = io_in_valid;
  assign _T_3204_imaginary_node__T_3223_en = 1'h1;
  assign _T_3204_imaginary_node__T_3223_addr = 1'h0;
  assign _T_3204_imaginary_node__T_3223_data = _T_3204_imaginary_node[_T_3204_imaginary_node__T_3223_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3204_imaginary_node__T_3215_data = BBFAdd_15_1_out;
  assign _T_3204_imaginary_node__T_3215_addr = 1'h0;
  assign _T_3204_imaginary_node__T_3215_mask = 1'h1;
  assign _T_3204_imaginary_node__T_3215_en = io_in_valid;
  assign _T_3238_real_node__T_3257_en = 1'h1;
  assign _T_3238_real_node__T_3257_addr = 1'h0;
  assign _T_3238_real_node__T_3257_data = _T_3238_real_node[_T_3238_real_node__T_3257_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3238_real_node__T_3249_data = BBFAdd_16_1_out;
  assign _T_3238_real_node__T_3249_addr = 1'h0;
  assign _T_3238_real_node__T_3249_mask = 1'h1;
  assign _T_3238_real_node__T_3249_en = io_in_valid;
  assign _T_3238_imaginary_node__T_3257_en = 1'h1;
  assign _T_3238_imaginary_node__T_3257_addr = 1'h0;
  assign _T_3238_imaginary_node__T_3257_data = _T_3238_imaginary_node[_T_3238_imaginary_node__T_3257_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3238_imaginary_node__T_3249_data = BBFAdd_17_1_out;
  assign _T_3238_imaginary_node__T_3249_addr = 1'h0;
  assign _T_3238_imaginary_node__T_3249_mask = 1'h1;
  assign _T_3238_imaginary_node__T_3249_en = io_in_valid;
  assign _T_3427_real_node__T_3446_en = 1'h1;
  assign _T_3427_real_node__T_3446_addr = 1'h0;
  assign _T_3427_real_node__T_3446_data = _T_3427_real_node[_T_3427_real_node__T_3446_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3427_real_node__T_3438_data = BBFAdd_20_1_out;
  assign _T_3427_real_node__T_3438_addr = 1'h0;
  assign _T_3427_real_node__T_3438_mask = 1'h1;
  assign _T_3427_real_node__T_3438_en = io_in_valid;
  assign _T_3427_imaginary_node__T_3446_en = 1'h1;
  assign _T_3427_imaginary_node__T_3446_addr = 1'h0;
  assign _T_3427_imaginary_node__T_3446_data = _T_3427_imaginary_node[_T_3427_imaginary_node__T_3446_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3427_imaginary_node__T_3438_data = BBFAdd_21_1_out;
  assign _T_3427_imaginary_node__T_3438_addr = 1'h0;
  assign _T_3427_imaginary_node__T_3438_mask = 1'h1;
  assign _T_3427_imaginary_node__T_3438_en = io_in_valid;
  assign _T_3461_real_node__T_3480_en = 1'h1;
  assign _T_3461_real_node__T_3480_addr = 1'h0;
  assign _T_3461_real_node__T_3480_data = _T_3461_real_node[_T_3461_real_node__T_3480_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3461_real_node__T_3472_data = BBFAdd_22_1_out;
  assign _T_3461_real_node__T_3472_addr = 1'h0;
  assign _T_3461_real_node__T_3472_mask = 1'h1;
  assign _T_3461_real_node__T_3472_en = io_in_valid;
  assign _T_3461_imaginary_node__T_3480_en = 1'h1;
  assign _T_3461_imaginary_node__T_3480_addr = 1'h0;
  assign _T_3461_imaginary_node__T_3480_data = _T_3461_imaginary_node[_T_3461_imaginary_node__T_3480_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3461_imaginary_node__T_3472_data = BBFAdd_23_1_out;
  assign _T_3461_imaginary_node__T_3472_addr = 1'h0;
  assign _T_3461_imaginary_node__T_3472_mask = 1'h1;
  assign _T_3461_imaginary_node__T_3472_en = io_in_valid;
  assign _T_3495_real_node__T_3514_en = 1'h1;
  assign _T_3495_real_node__T_3514_addr = 1'h0;
  assign _T_3495_real_node__T_3514_data = _T_3495_real_node[_T_3495_real_node__T_3514_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3495_real_node__T_3506_data = _GEN_80[2] ? _GEN_102 : _GEN_98;
  assign _T_3495_real_node__T_3506_addr = 1'h0;
  assign _T_3495_real_node__T_3506_mask = 1'h1;
  assign _T_3495_real_node__T_3506_en = io_in_valid;
  assign _T_3495_imaginary_node__T_3514_en = 1'h1;
  assign _T_3495_imaginary_node__T_3514_addr = 1'h0;
  assign _T_3495_imaginary_node__T_3514_data = _T_3495_imaginary_node[_T_3495_imaginary_node__T_3514_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3495_imaginary_node__T_3506_data = _GEN_80[2] ? _T_1385_node : _GEN_102;
  assign _T_3495_imaginary_node__T_3506_addr = 1'h0;
  assign _T_3495_imaginary_node__T_3506_mask = 1'h1;
  assign _T_3495_imaginary_node__T_3506_en = io_in_valid;
  assign _T_3684_real_node__T_3703_en = 1'h1;
  assign _T_3684_real_node__T_3703_addr = 1'h0;
  assign _T_3684_real_node__T_3703_data = _T_3684_real_node[_T_3684_real_node__T_3703_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3684_real_node__T_3695_data = BBFAdd_26_1_out;
  assign _T_3684_real_node__T_3695_addr = 1'h0;
  assign _T_3684_real_node__T_3695_mask = 1'h1;
  assign _T_3684_real_node__T_3695_en = io_in_valid;
  assign _T_3684_imaginary_node__T_3703_en = 1'h1;
  assign _T_3684_imaginary_node__T_3703_addr = 1'h0;
  assign _T_3684_imaginary_node__T_3703_data = _T_3684_imaginary_node[_T_3684_imaginary_node__T_3703_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3684_imaginary_node__T_3695_data = BBFAdd_27_1_out;
  assign _T_3684_imaginary_node__T_3695_addr = 1'h0;
  assign _T_3684_imaginary_node__T_3695_mask = 1'h1;
  assign _T_3684_imaginary_node__T_3695_en = io_in_valid;
  assign _T_3718_real_node__T_3737_en = 1'h1;
  assign _T_3718_real_node__T_3737_addr = 1'h0;
  assign _T_3718_real_node__T_3737_data = _T_3718_real_node[_T_3718_real_node__T_3737_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3718_real_node__T_3729_data = BBFAdd_28_1_out;
  assign _T_3718_real_node__T_3729_addr = 1'h0;
  assign _T_3718_real_node__T_3729_mask = 1'h1;
  assign _T_3718_real_node__T_3729_en = io_in_valid;
  assign _T_3718_imaginary_node__T_3737_en = 1'h1;
  assign _T_3718_imaginary_node__T_3737_addr = 1'h0;
  assign _T_3718_imaginary_node__T_3737_data = _T_3718_imaginary_node[_T_3718_imaginary_node__T_3737_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3718_imaginary_node__T_3729_data = BBFAdd_29_1_out;
  assign _T_3718_imaginary_node__T_3729_addr = 1'h0;
  assign _T_3718_imaginary_node__T_3729_mask = 1'h1;
  assign _T_3718_imaginary_node__T_3729_en = io_in_valid;
  assign _T_3752_real_node__T_3771_en = 1'h1;
  assign _T_3752_real_node__T_3771_addr = 1'h0;
  assign _T_3752_real_node__T_3771_data = _T_3752_real_node[_T_3752_real_node__T_3771_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3752_real_node__T_3763_data = _GEN_80[2] ? _GEN_102 : _GEN_98;
  assign _T_3752_real_node__T_3763_addr = 1'h0;
  assign _T_3752_real_node__T_3763_mask = 1'h1;
  assign _T_3752_real_node__T_3763_en = io_in_valid;
  assign _T_3752_imaginary_node__T_3771_en = 1'h1;
  assign _T_3752_imaginary_node__T_3771_addr = 1'h0;
  assign _T_3752_imaginary_node__T_3771_data = _T_3752_imaginary_node[_T_3752_imaginary_node__T_3771_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3752_imaginary_node__T_3763_data = _GEN_80[2] ? _T_1385_node : _GEN_102;
  assign _T_3752_imaginary_node__T_3763_addr = 1'h0;
  assign _T_3752_imaginary_node__T_3763_mask = 1'h1;
  assign _T_3752_imaginary_node__T_3763_en = io_in_valid;
  assign _T_3941_real_node__T_3960_en = 1'h1;
  assign _T_3941_real_node__T_3960_addr = 1'h0;
  assign _T_3941_real_node__T_3960_data = _T_3941_real_node[_T_3941_real_node__T_3960_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3941_real_node__T_3952_data = BBFAdd_32_1_out;
  assign _T_3941_real_node__T_3952_addr = 1'h0;
  assign _T_3941_real_node__T_3952_mask = 1'h1;
  assign _T_3941_real_node__T_3952_en = io_in_valid;
  assign _T_3941_imaginary_node__T_3960_en = 1'h1;
  assign _T_3941_imaginary_node__T_3960_addr = 1'h0;
  assign _T_3941_imaginary_node__T_3960_data = _T_3941_imaginary_node[_T_3941_imaginary_node__T_3960_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3941_imaginary_node__T_3952_data = BBFAdd_33_1_out;
  assign _T_3941_imaginary_node__T_3952_addr = 1'h0;
  assign _T_3941_imaginary_node__T_3952_mask = 1'h1;
  assign _T_3941_imaginary_node__T_3952_en = io_in_valid;
  assign _T_3975_real_node__T_3994_en = 1'h1;
  assign _T_3975_real_node__T_3994_addr = 1'h0;
  assign _T_3975_real_node__T_3994_data = _T_3975_real_node[_T_3975_real_node__T_3994_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3975_real_node__T_3986_data = BBFAdd_34_1_out;
  assign _T_3975_real_node__T_3986_addr = 1'h0;
  assign _T_3975_real_node__T_3986_mask = 1'h1;
  assign _T_3975_real_node__T_3986_en = io_in_valid;
  assign _T_3975_imaginary_node__T_3994_en = 1'h1;
  assign _T_3975_imaginary_node__T_3994_addr = 1'h0;
  assign _T_3975_imaginary_node__T_3994_data = _T_3975_imaginary_node[_T_3975_imaginary_node__T_3994_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3975_imaginary_node__T_3986_data = BBFAdd_35_1_out;
  assign _T_3975_imaginary_node__T_3986_addr = 1'h0;
  assign _T_3975_imaginary_node__T_3986_mask = 1'h1;
  assign _T_3975_imaginary_node__T_3986_en = io_in_valid;
  assign _T_4009_real_node__T_4028_en = 1'h1;
  assign _T_4009_real_node__T_4028_addr = 1'h0;
  assign _T_4009_real_node__T_4028_data = _T_4009_real_node[_T_4009_real_node__T_4028_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4009_real_node__T_4020_data = _GEN_254[2] ? _GEN_276 : _GEN_272;
  assign _T_4009_real_node__T_4020_addr = 1'h0;
  assign _T_4009_real_node__T_4020_mask = 1'h1;
  assign _T_4009_real_node__T_4020_en = io_in_valid;
  assign _T_4009_imaginary_node__T_4028_en = 1'h1;
  assign _T_4009_imaginary_node__T_4028_addr = 1'h0;
  assign _T_4009_imaginary_node__T_4028_data = _T_4009_imaginary_node[_T_4009_imaginary_node__T_4028_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4009_imaginary_node__T_4020_data = _GEN_254[2] ? _T_1568_node : _GEN_276;
  assign _T_4009_imaginary_node__T_4020_addr = 1'h0;
  assign _T_4009_imaginary_node__T_4020_mask = 1'h1;
  assign _T_4009_imaginary_node__T_4020_en = io_in_valid;
  assign _T_4198_real_node__T_4217_en = 1'h1;
  assign _T_4198_real_node__T_4217_addr = 1'h0;
  assign _T_4198_real_node__T_4217_data = _T_4198_real_node[_T_4198_real_node__T_4217_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4198_real_node__T_4209_data = BBFAdd_38_1_out;
  assign _T_4198_real_node__T_4209_addr = 1'h0;
  assign _T_4198_real_node__T_4209_mask = 1'h1;
  assign _T_4198_real_node__T_4209_en = io_in_valid;
  assign _T_4198_imaginary_node__T_4217_en = 1'h1;
  assign _T_4198_imaginary_node__T_4217_addr = 1'h0;
  assign _T_4198_imaginary_node__T_4217_data = _T_4198_imaginary_node[_T_4198_imaginary_node__T_4217_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4198_imaginary_node__T_4209_data = BBFAdd_39_1_out;
  assign _T_4198_imaginary_node__T_4209_addr = 1'h0;
  assign _T_4198_imaginary_node__T_4209_mask = 1'h1;
  assign _T_4198_imaginary_node__T_4209_en = io_in_valid;
  assign _T_4232_real_node__T_4251_en = 1'h1;
  assign _T_4232_real_node__T_4251_addr = 1'h0;
  assign _T_4232_real_node__T_4251_data = _T_4232_real_node[_T_4232_real_node__T_4251_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4232_real_node__T_4243_data = BBFAdd_40_1_out;
  assign _T_4232_real_node__T_4243_addr = 1'h0;
  assign _T_4232_real_node__T_4243_mask = 1'h1;
  assign _T_4232_real_node__T_4243_en = io_in_valid;
  assign _T_4232_imaginary_node__T_4251_en = 1'h1;
  assign _T_4232_imaginary_node__T_4251_addr = 1'h0;
  assign _T_4232_imaginary_node__T_4251_data = _T_4232_imaginary_node[_T_4232_imaginary_node__T_4251_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4232_imaginary_node__T_4243_data = BBFAdd_41_1_out;
  assign _T_4232_imaginary_node__T_4243_addr = 1'h0;
  assign _T_4232_imaginary_node__T_4243_mask = 1'h1;
  assign _T_4232_imaginary_node__T_4243_en = io_in_valid;
  assign _T_4266_real_node__T_4285_en = 1'h1;
  assign _T_4266_real_node__T_4285_addr = 1'h0;
  assign _T_4266_real_node__T_4285_data = _T_4266_real_node[_T_4266_real_node__T_4285_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4266_real_node__T_4277_data = _GEN_254[2] ? _GEN_276 : _GEN_272;
  assign _T_4266_real_node__T_4277_addr = 1'h0;
  assign _T_4266_real_node__T_4277_mask = 1'h1;
  assign _T_4266_real_node__T_4277_en = io_in_valid;
  assign _T_4266_imaginary_node__T_4285_en = 1'h1;
  assign _T_4266_imaginary_node__T_4285_addr = 1'h0;
  assign _T_4266_imaginary_node__T_4285_data = _T_4266_imaginary_node[_T_4266_imaginary_node__T_4285_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4266_imaginary_node__T_4277_data = _GEN_254[2] ? _T_1568_node : _GEN_276;
  assign _T_4266_imaginary_node__T_4277_addr = 1'h0;
  assign _T_4266_imaginary_node__T_4277_mask = 1'h1;
  assign _T_4266_imaginary_node__T_4277_en = io_in_valid;
  assign _T_4455_real_node__T_4474_en = 1'h1;
  assign _T_4455_real_node__T_4474_addr = 1'h0;
  assign _T_4455_real_node__T_4474_data = _T_4455_real_node[_T_4455_real_node__T_4474_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4455_real_node__T_4466_data = BBFAdd_44_1_out;
  assign _T_4455_real_node__T_4466_addr = 1'h0;
  assign _T_4455_real_node__T_4466_mask = 1'h1;
  assign _T_4455_real_node__T_4466_en = io_in_valid;
  assign _T_4455_imaginary_node__T_4474_en = 1'h1;
  assign _T_4455_imaginary_node__T_4474_addr = 1'h0;
  assign _T_4455_imaginary_node__T_4474_data = _T_4455_imaginary_node[_T_4455_imaginary_node__T_4474_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4455_imaginary_node__T_4466_data = BBFAdd_45_1_out;
  assign _T_4455_imaginary_node__T_4466_addr = 1'h0;
  assign _T_4455_imaginary_node__T_4466_mask = 1'h1;
  assign _T_4455_imaginary_node__T_4466_en = io_in_valid;
  assign _T_4489_real_node__T_4508_en = 1'h1;
  assign _T_4489_real_node__T_4508_addr = 1'h0;
  assign _T_4489_real_node__T_4508_data = _T_4489_real_node[_T_4489_real_node__T_4508_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4489_real_node__T_4500_data = BBFAdd_46_1_out;
  assign _T_4489_real_node__T_4500_addr = 1'h0;
  assign _T_4489_real_node__T_4500_mask = 1'h1;
  assign _T_4489_real_node__T_4500_en = io_in_valid;
  assign _T_4489_imaginary_node__T_4508_en = 1'h1;
  assign _T_4489_imaginary_node__T_4508_addr = 1'h0;
  assign _T_4489_imaginary_node__T_4508_data = _T_4489_imaginary_node[_T_4489_imaginary_node__T_4508_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4489_imaginary_node__T_4500_data = BBFAdd_47_1_out;
  assign _T_4489_imaginary_node__T_4500_addr = 1'h0;
  assign _T_4489_imaginary_node__T_4500_mask = 1'h1;
  assign _T_4489_imaginary_node__T_4500_en = io_in_valid;
  assign _T_4523_real_node__T_4545_en = 1'h1;
  assign _T_4523_real_node__T_4545_addr = _T_4525;
  assign _T_4523_real_node__T_4545_data = _T_4523_real_node[_T_4523_real_node__T_4545_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4523_real_node__T_4538_data = _GEN_138[2] ? _GEN_160 : _GEN_156;
  assign _T_4523_real_node__T_4538_addr = _T_4525;
  assign _T_4523_real_node__T_4538_mask = 1'h1;
  assign _T_4523_real_node__T_4538_en = io_in_valid;
  assign _T_4523_imaginary_node__T_4545_en = 1'h1;
  assign _T_4523_imaginary_node__T_4545_addr = _T_4525;
  assign _T_4523_imaginary_node__T_4545_data = _T_4523_imaginary_node[_T_4523_imaginary_node__T_4545_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4523_imaginary_node__T_4538_data = _GEN_138[2] ? _T_1446_node : _GEN_160;
  assign _T_4523_imaginary_node__T_4538_addr = _T_4525;
  assign _T_4523_imaginary_node__T_4538_mask = 1'h1;
  assign _T_4523_imaginary_node__T_4538_en = io_in_valid;
  assign _T_4715_real_node__T_4734_en = 1'h1;
  assign _T_4715_real_node__T_4734_addr = 1'h0;
  assign _T_4715_real_node__T_4734_data = _T_4715_real_node[_T_4715_real_node__T_4734_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4715_real_node__T_4726_data = BBFAdd_50_1_out;
  assign _T_4715_real_node__T_4726_addr = 1'h0;
  assign _T_4715_real_node__T_4726_mask = 1'h1;
  assign _T_4715_real_node__T_4726_en = io_in_valid;
  assign _T_4715_imaginary_node__T_4734_en = 1'h1;
  assign _T_4715_imaginary_node__T_4734_addr = 1'h0;
  assign _T_4715_imaginary_node__T_4734_data = _T_4715_imaginary_node[_T_4715_imaginary_node__T_4734_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4715_imaginary_node__T_4726_data = BBFAdd_51_1_out;
  assign _T_4715_imaginary_node__T_4726_addr = 1'h0;
  assign _T_4715_imaginary_node__T_4726_mask = 1'h1;
  assign _T_4715_imaginary_node__T_4726_en = io_in_valid;
  assign _T_4749_real_node__T_4768_en = 1'h1;
  assign _T_4749_real_node__T_4768_addr = 1'h0;
  assign _T_4749_real_node__T_4768_data = _T_4749_real_node[_T_4749_real_node__T_4768_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4749_real_node__T_4760_data = BBFAdd_52_1_out;
  assign _T_4749_real_node__T_4760_addr = 1'h0;
  assign _T_4749_real_node__T_4760_mask = 1'h1;
  assign _T_4749_real_node__T_4760_en = io_in_valid;
  assign _T_4749_imaginary_node__T_4768_en = 1'h1;
  assign _T_4749_imaginary_node__T_4768_addr = 1'h0;
  assign _T_4749_imaginary_node__T_4768_data = _T_4749_imaginary_node[_T_4749_imaginary_node__T_4768_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4749_imaginary_node__T_4760_data = BBFAdd_53_1_out;
  assign _T_4749_imaginary_node__T_4760_addr = 1'h0;
  assign _T_4749_imaginary_node__T_4760_mask = 1'h1;
  assign _T_4749_imaginary_node__T_4760_en = io_in_valid;
  assign _T_4783_real_node__T_4805_en = 1'h1;
  assign _T_4783_real_node__T_4805_addr = _T_4785;
  assign _T_4783_real_node__T_4805_data = _T_4783_real_node[_T_4783_real_node__T_4805_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4783_real_node__T_4798_data = _GEN_196[2] ? _GEN_218 : _GEN_214;
  assign _T_4783_real_node__T_4798_addr = _T_4785;
  assign _T_4783_real_node__T_4798_mask = 1'h1;
  assign _T_4783_real_node__T_4798_en = io_in_valid;
  assign _T_4783_imaginary_node__T_4805_en = 1'h1;
  assign _T_4783_imaginary_node__T_4805_addr = _T_4785;
  assign _T_4783_imaginary_node__T_4805_data = _T_4783_imaginary_node[_T_4783_imaginary_node__T_4805_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4783_imaginary_node__T_4798_data = _GEN_196[2] ? _T_1507_node : _GEN_218;
  assign _T_4783_imaginary_node__T_4798_addr = _T_4785;
  assign _T_4783_imaginary_node__T_4798_mask = 1'h1;
  assign _T_4783_imaginary_node__T_4798_en = io_in_valid;
  assign _T_4975_real_node__T_4994_en = 1'h1;
  assign _T_4975_real_node__T_4994_addr = 1'h0;
  assign _T_4975_real_node__T_4994_data = _T_4975_real_node[_T_4975_real_node__T_4994_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4975_real_node__T_4986_data = BBFAdd_56_1_out;
  assign _T_4975_real_node__T_4986_addr = 1'h0;
  assign _T_4975_real_node__T_4986_mask = 1'h1;
  assign _T_4975_real_node__T_4986_en = io_in_valid;
  assign _T_4975_imaginary_node__T_4994_en = 1'h1;
  assign _T_4975_imaginary_node__T_4994_addr = 1'h0;
  assign _T_4975_imaginary_node__T_4994_data = _T_4975_imaginary_node[_T_4975_imaginary_node__T_4994_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4975_imaginary_node__T_4986_data = BBFAdd_57_1_out;
  assign _T_4975_imaginary_node__T_4986_addr = 1'h0;
  assign _T_4975_imaginary_node__T_4986_mask = 1'h1;
  assign _T_4975_imaginary_node__T_4986_en = io_in_valid;
  assign _T_5009_real_node__T_5028_en = 1'h1;
  assign _T_5009_real_node__T_5028_addr = 1'h0;
  assign _T_5009_real_node__T_5028_data = _T_5009_real_node[_T_5009_real_node__T_5028_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5009_real_node__T_5020_data = BBFAdd_58_1_out;
  assign _T_5009_real_node__T_5020_addr = 1'h0;
  assign _T_5009_real_node__T_5020_mask = 1'h1;
  assign _T_5009_real_node__T_5020_en = io_in_valid;
  assign _T_5009_imaginary_node__T_5028_en = 1'h1;
  assign _T_5009_imaginary_node__T_5028_addr = 1'h0;
  assign _T_5009_imaginary_node__T_5028_data = _T_5009_imaginary_node[_T_5009_imaginary_node__T_5028_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5009_imaginary_node__T_5020_data = BBFAdd_59_1_out;
  assign _T_5009_imaginary_node__T_5020_addr = 1'h0;
  assign _T_5009_imaginary_node__T_5020_mask = 1'h1;
  assign _T_5009_imaginary_node__T_5020_en = io_in_valid;
  assign _T_5043_real_node__T_5065_en = 1'h1;
  assign _T_5043_real_node__T_5065_addr = _T_5045;
  assign _T_5043_real_node__T_5065_data = _T_5043_real_node[_T_5043_real_node__T_5065_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5043_real_node__T_5058_data = _GEN_312[2] ? _GEN_334 : _GEN_330;
  assign _T_5043_real_node__T_5058_addr = _T_5045;
  assign _T_5043_real_node__T_5058_mask = 1'h1;
  assign _T_5043_real_node__T_5058_en = io_in_valid;
  assign _T_5043_imaginary_node__T_5065_en = 1'h1;
  assign _T_5043_imaginary_node__T_5065_addr = _T_5045;
  assign _T_5043_imaginary_node__T_5065_data = _T_5043_imaginary_node[_T_5043_imaginary_node__T_5065_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5043_imaginary_node__T_5058_data = _GEN_312[2] ? _T_1629_node : _GEN_334;
  assign _T_5043_imaginary_node__T_5058_addr = _T_5045;
  assign _T_5043_imaginary_node__T_5058_mask = 1'h1;
  assign _T_5043_imaginary_node__T_5058_en = io_in_valid;
  assign _T_5235_real_node__T_5254_en = 1'h1;
  assign _T_5235_real_node__T_5254_addr = 1'h0;
  assign _T_5235_real_node__T_5254_data = _T_5235_real_node[_T_5235_real_node__T_5254_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5235_real_node__T_5246_data = BBFAdd_62_1_out;
  assign _T_5235_real_node__T_5246_addr = 1'h0;
  assign _T_5235_real_node__T_5246_mask = 1'h1;
  assign _T_5235_real_node__T_5246_en = io_in_valid;
  assign _T_5235_imaginary_node__T_5254_en = 1'h1;
  assign _T_5235_imaginary_node__T_5254_addr = 1'h0;
  assign _T_5235_imaginary_node__T_5254_data = _T_5235_imaginary_node[_T_5235_imaginary_node__T_5254_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5235_imaginary_node__T_5246_data = BBFAdd_63_1_out;
  assign _T_5235_imaginary_node__T_5246_addr = 1'h0;
  assign _T_5235_imaginary_node__T_5246_mask = 1'h1;
  assign _T_5235_imaginary_node__T_5246_en = io_in_valid;
  assign _T_5269_real_node__T_5288_en = 1'h1;
  assign _T_5269_real_node__T_5288_addr = 1'h0;
  assign _T_5269_real_node__T_5288_data = _T_5269_real_node[_T_5269_real_node__T_5288_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5269_real_node__T_5280_data = BBFAdd_64_1_out;
  assign _T_5269_real_node__T_5280_addr = 1'h0;
  assign _T_5269_real_node__T_5280_mask = 1'h1;
  assign _T_5269_real_node__T_5280_en = io_in_valid;
  assign _T_5269_imaginary_node__T_5288_en = 1'h1;
  assign _T_5269_imaginary_node__T_5288_addr = 1'h0;
  assign _T_5269_imaginary_node__T_5288_data = _T_5269_imaginary_node[_T_5269_imaginary_node__T_5288_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5269_imaginary_node__T_5280_data = BBFAdd_65_1_out;
  assign _T_5269_imaginary_node__T_5280_addr = 1'h0;
  assign _T_5269_imaginary_node__T_5280_mask = 1'h1;
  assign _T_5269_imaginary_node__T_5280_en = io_in_valid;
  assign _T_5303_real_node__T_5325_en = 1'h1;
  assign _T_5303_real_node__T_5325_addr = _T_5305;
  assign _T_5303_real_node__T_5325_data = _T_5303_real_node[_T_5303_real_node__T_5325_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5303_real_node__T_5318_data = _GEN_370[2] ? _GEN_392 : _GEN_388;
  assign _T_5303_real_node__T_5318_addr = _T_5305;
  assign _T_5303_real_node__T_5318_mask = 1'h1;
  assign _T_5303_real_node__T_5318_en = io_in_valid;
  assign _T_5303_imaginary_node__T_5325_en = 1'h1;
  assign _T_5303_imaginary_node__T_5325_addr = _T_5305;
  assign _T_5303_imaginary_node__T_5325_data = _T_5303_imaginary_node[_T_5303_imaginary_node__T_5325_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5303_imaginary_node__T_5318_data = _GEN_370[2] ? _T_1690_node : _GEN_392;
  assign _T_5303_imaginary_node__T_5318_addr = _T_5305;
  assign _T_5303_imaginary_node__T_5318_mask = 1'h1;
  assign _T_5303_imaginary_node__T_5318_en = io_in_valid;
  assign _T_5495_real_node__T_5514_en = 1'h1;
  assign _T_5495_real_node__T_5514_addr = 1'h0;
  assign _T_5495_real_node__T_5514_data = _T_5495_real_node[_T_5495_real_node__T_5514_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5495_real_node__T_5506_data = BBFAdd_68_1_out;
  assign _T_5495_real_node__T_5506_addr = 1'h0;
  assign _T_5495_real_node__T_5506_mask = 1'h1;
  assign _T_5495_real_node__T_5506_en = io_in_valid;
  assign _T_5495_imaginary_node__T_5514_en = 1'h1;
  assign _T_5495_imaginary_node__T_5514_addr = 1'h0;
  assign _T_5495_imaginary_node__T_5514_data = _T_5495_imaginary_node[_T_5495_imaginary_node__T_5514_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5495_imaginary_node__T_5506_data = BBFAdd_69_1_out;
  assign _T_5495_imaginary_node__T_5506_addr = 1'h0;
  assign _T_5495_imaginary_node__T_5506_mask = 1'h1;
  assign _T_5495_imaginary_node__T_5506_en = io_in_valid;
  assign _T_5529_real_node__T_5548_en = 1'h1;
  assign _T_5529_real_node__T_5548_addr = 1'h0;
  assign _T_5529_real_node__T_5548_data = _T_5529_real_node[_T_5529_real_node__T_5548_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5529_real_node__T_5540_data = BBFAdd_70_1_out;
  assign _T_5529_real_node__T_5540_addr = 1'h0;
  assign _T_5529_real_node__T_5540_mask = 1'h1;
  assign _T_5529_real_node__T_5540_en = io_in_valid;
  assign _T_5529_imaginary_node__T_5548_en = 1'h1;
  assign _T_5529_imaginary_node__T_5548_addr = 1'h0;
  assign _T_5529_imaginary_node__T_5548_data = _T_5529_imaginary_node[_T_5529_imaginary_node__T_5548_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_5529_imaginary_node__T_5540_data = BBFAdd_71_1_out;
  assign _T_5529_imaginary_node__T_5540_addr = 1'h0;
  assign _T_5529_imaginary_node__T_5540_mask = 1'h1;
  assign _T_5529_imaginary_node__T_5540_en = io_in_valid;
  assign io_out_valid = io_in_valid; // @[FFT.scala 34:16]
  assign io_out_bits_0_real_node = _T_4715_real_node__T_4734_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_0_imaginary_node = _T_4715_imaginary_node__T_4734_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_1_real_node = _T_4749_real_node__T_4768_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_1_imaginary_node = _T_4749_imaginary_node__T_4768_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_2_real_node = _T_4975_real_node__T_4994_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_2_imaginary_node = _T_4975_imaginary_node__T_4994_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_3_real_node = _T_5009_real_node__T_5028_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_3_imaginary_node = _T_5009_imaginary_node__T_5028_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_4_real_node = _T_5235_real_node__T_5254_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_4_imaginary_node = _T_5235_imaginary_node__T_5254_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_5_real_node = _T_5269_real_node__T_5288_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_5_imaginary_node = _T_5269_imaginary_node__T_5288_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_6_real_node = _T_5495_real_node__T_5514_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_6_imaginary_node = _T_5495_imaginary_node__T_5514_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_7_real_node = _T_5529_real_node__T_5548_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_bits_7_imaginary_node = _T_5529_imaginary_node__T_5548_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign io_out_sync = _T_635__T_646_data; // @[FFT.scala 33:15]
  assign BBFSubtract_43_in2 = 2'h3 == _GEN_22[1:0] ? 64'h3fd87de2a6aea964 : _GEN_39; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_43_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_1_1_in2 = 2'h3 == _GEN_80[1:0] ? 64'h3fd87de2a6aea964 : _GEN_97; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_1_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_2_1_in2 = 2'h3 == _GEN_138[1:0] ? 64'h3fd87de2a6aea964 : _GEN_155; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_2_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_3_1_in2 = 2'h3 == _GEN_196[1:0] ? 64'h3fd87de2a6aea964 : _GEN_213; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_3_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_4_1_in2 = 2'h3 == _GEN_254[1:0] ? 64'h3fd87de2a6aea964 : _GEN_271; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_4_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_5_1_in2 = 2'h3 == _GEN_312[1:0] ? 64'h3fd87de2a6aea964 : _GEN_329; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_5_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_6_1_in2 = 2'h3 == _GEN_370[1:0] ? 64'h3fd87de2a6aea964 : _GEN_387; // @[DspReal.scala 82:21 DspReal.scala 82:21]
  assign BBFSubtract_6_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFMultiply_48_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
  assign BBFMultiply_48_in1 = io_in_bits_4_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_1_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_1_1_in1 = io_in_bits_4_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_7_1_in2 = BBFMultiply_1_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_7_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_72_in2 = BBFSubtract_7_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_72_in1 = BBFMultiply_48_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_2_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_2_1_in1 = io_in_bits_4_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_3_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
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
  assign BBFMultiply_4_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
  assign BBFMultiply_4_1_in1 = io_in_bits_5_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_5_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_5_1_in1 = io_in_bits_5_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_10_1_in2 = BBFMultiply_5_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_10_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_6_1_in2 = BBFSubtract_10_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_6_1_in1 = BBFMultiply_4_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_6_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_6_1_in1 = io_in_bits_5_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_7_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
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
  assign BBFMultiply_8_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
  assign BBFMultiply_8_1_in1 = io_in_bits_6_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_9_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_9_1_in1 = io_in_bits_6_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_13_1_in2 = BBFMultiply_9_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_13_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_12_1_in2 = BBFSubtract_13_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_12_1_in1 = BBFMultiply_8_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_10_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_10_1_in1 = io_in_bits_6_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_11_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
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
  assign BBFMultiply_12_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
  assign BBFMultiply_12_1_in1 = io_in_bits_7_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_13_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_13_1_in1 = io_in_bits_7_imaginary_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFSubtract_16_1_in2 = BBFMultiply_13_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_16_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_18_1_in2 = BBFSubtract_16_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_18_1_in1 = BBFMultiply_12_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_14_1_in2 = _GEN_22[2] ? _T_1324_node : _GEN_44; // @[FFT.scala 49:49]
  assign BBFMultiply_14_1_in1 = io_in_bits_7_real_node; // @[FFT.scala 54:77 FFT.scala 55:67]
  assign BBFMultiply_15_1_in2 = _GEN_22[2] ? _GEN_44 : _GEN_40; // @[FFT.scala 49:49]
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
  assign BBFMultiply_16_1_in2 = _T_3495_real_node__T_3514_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_16_1_in1 = _T_3204_real_node__T_3223_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_17_1_in2 = _T_3495_imaginary_node__T_3514_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_17_1_in1 = _T_3204_imaginary_node__T_3223_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_19_1_in2 = BBFMultiply_17_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_19_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_24_1_in2 = BBFSubtract_19_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_24_1_in1 = BBFMultiply_16_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_18_1_in2 = _T_3495_imaginary_node__T_3514_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_18_1_in1 = _T_3204_real_node__T_3223_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_19_1_in2 = _T_3495_real_node__T_3514_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_19_1_in1 = _T_3204_imaginary_node__T_3223_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_25_1_in2 = BBFMultiply_19_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_25_1_in1 = BBFMultiply_18_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_26_1_in2 = BBFAdd_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_26_1_in1 = _T_2758_real_node__T_2777_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_27_1_in2 = BBFAdd_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_27_1_in1 = _T_2758_imaginary_node__T_2777_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_20_1_in2 = BBFAdd_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_20_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_21_1_in2 = BBFAdd_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_21_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_28_1_in2 = BBFSubtract_20_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_28_1_in1 = _T_2758_real_node__T_2777_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_29_1_in2 = BBFSubtract_21_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_29_1_in1 = _T_2758_imaginary_node__T_2777_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_20_1_in2 = _T_3752_real_node__T_3771_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_20_1_in1 = _T_3427_real_node__T_3446_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_21_1_in2 = _T_3752_imaginary_node__T_3771_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_21_1_in1 = _T_3427_imaginary_node__T_3446_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_22_1_in2 = BBFMultiply_21_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_22_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_30_1_in2 = BBFSubtract_22_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_30_1_in1 = BBFMultiply_20_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_22_1_in2 = _T_3752_imaginary_node__T_3771_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_22_1_in1 = _T_3427_real_node__T_3446_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_23_1_in2 = _T_3752_real_node__T_3771_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_23_1_in1 = _T_3427_imaginary_node__T_3446_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_31_1_in2 = BBFMultiply_23_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_31_1_in1 = BBFMultiply_22_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_32_1_in2 = BBFAdd_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_32_1_in1 = _T_2981_real_node__T_3000_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_33_1_in2 = BBFAdd_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_33_1_in1 = _T_2981_imaginary_node__T_3000_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_23_1_in2 = BBFAdd_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_23_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_24_1_in2 = BBFAdd_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_24_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_34_1_in2 = BBFSubtract_23_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_34_1_in1 = _T_2981_real_node__T_3000_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_35_1_in2 = BBFSubtract_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_35_1_in1 = _T_2981_imaginary_node__T_3000_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_24_1_in2 = _T_4009_real_node__T_4028_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_24_1_in1 = _T_3238_real_node__T_3257_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_25_1_in2 = _T_4009_imaginary_node__T_4028_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_25_1_in1 = _T_3238_imaginary_node__T_3257_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_25_1_in2 = BBFMultiply_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_25_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_36_1_in2 = BBFSubtract_25_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_36_1_in1 = BBFMultiply_24_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_26_1_in2 = _T_4009_imaginary_node__T_4028_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_26_1_in1 = _T_3238_real_node__T_3257_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_27_1_in2 = _T_4009_real_node__T_4028_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_27_1_in1 = _T_3238_imaginary_node__T_3257_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_37_1_in2 = BBFMultiply_27_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_37_1_in1 = BBFMultiply_26_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_38_1_in2 = BBFAdd_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_38_1_in1 = _T_2792_real_node__T_2811_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_39_1_in2 = BBFAdd_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_39_1_in1 = _T_2792_imaginary_node__T_2811_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_26_1_in2 = BBFAdd_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_26_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_27_1_in2 = BBFAdd_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_27_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_40_1_in2 = BBFSubtract_26_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_40_1_in1 = _T_2792_real_node__T_2811_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_41_1_in2 = BBFSubtract_27_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_41_1_in1 = _T_2792_imaginary_node__T_2811_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_28_1_in2 = _T_4266_real_node__T_4285_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_28_1_in1 = _T_3461_real_node__T_3480_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_29_1_in2 = _T_4266_imaginary_node__T_4285_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_29_1_in1 = _T_3461_imaginary_node__T_3480_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_28_1_in2 = BBFMultiply_29_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_28_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_42_1_in2 = BBFSubtract_28_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_42_1_in1 = BBFMultiply_28_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_30_1_in2 = _T_4266_imaginary_node__T_4285_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_30_1_in1 = _T_3461_real_node__T_3480_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_31_1_in2 = _T_4266_real_node__T_4285_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_31_1_in1 = _T_3461_imaginary_node__T_3480_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_43_1_in2 = BBFMultiply_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_43_1_in1 = BBFMultiply_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_44_1_in2 = BBFAdd_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_44_1_in1 = _T_3015_real_node__T_3034_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_45_1_in2 = BBFAdd_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_45_1_in1 = _T_3015_imaginary_node__T_3034_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_29_1_in2 = BBFAdd_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_29_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_30_1_in2 = BBFAdd_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_30_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_46_1_in2 = BBFSubtract_29_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_46_1_in1 = _T_3015_real_node__T_3034_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_47_1_in2 = BBFSubtract_30_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_47_1_in1 = _T_3015_imaginary_node__T_3034_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_32_1_in2 = _T_4523_real_node__T_4545_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_32_1_in1 = _T_3941_real_node__T_3960_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_33_1_in2 = _T_4523_imaginary_node__T_4545_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_33_1_in1 = _T_3941_imaginary_node__T_3960_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_31_1_in2 = BBFMultiply_33_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_31_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_48_1_in2 = BBFSubtract_31_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_48_1_in1 = BBFMultiply_32_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_34_1_in2 = _T_4523_imaginary_node__T_4545_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_34_1_in1 = _T_3941_real_node__T_3960_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_35_1_in2 = _T_4523_real_node__T_4545_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_35_1_in1 = _T_3941_imaginary_node__T_3960_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_49_1_in2 = BBFMultiply_35_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_49_1_in1 = BBFMultiply_34_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_50_1_in2 = BBFAdd_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_50_1_in1 = _T_3684_real_node__T_3703_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_51_1_in2 = BBFAdd_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_51_1_in1 = _T_3684_imaginary_node__T_3703_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_32_1_in2 = BBFAdd_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_32_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_33_1_in2 = BBFAdd_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_33_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_52_1_in2 = BBFSubtract_32_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_52_1_in1 = _T_3684_real_node__T_3703_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_53_1_in2 = BBFSubtract_33_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_53_1_in1 = _T_3684_imaginary_node__T_3703_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_36_1_in2 = _T_4783_real_node__T_4805_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_36_1_in1 = _T_3975_real_node__T_3994_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_37_1_in2 = _T_4783_imaginary_node__T_4805_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_37_1_in1 = _T_3975_imaginary_node__T_3994_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_34_1_in2 = BBFMultiply_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_34_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_54_1_in2 = BBFSubtract_34_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_54_1_in1 = BBFMultiply_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_38_1_in2 = _T_4783_imaginary_node__T_4805_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_38_1_in1 = _T_3975_real_node__T_3994_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_39_1_in2 = _T_4783_real_node__T_4805_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_39_1_in1 = _T_3975_imaginary_node__T_3994_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_55_1_in2 = BBFMultiply_39_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_55_1_in1 = BBFMultiply_38_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_56_1_in2 = BBFAdd_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_56_1_in1 = _T_3718_real_node__T_3737_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_57_1_in2 = BBFAdd_55_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_57_1_in1 = _T_3718_imaginary_node__T_3737_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_35_1_in2 = BBFAdd_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_35_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_36_1_in2 = BBFAdd_55_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_36_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_58_1_in2 = BBFSubtract_35_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_58_1_in1 = _T_3718_real_node__T_3737_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_59_1_in2 = BBFSubtract_36_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_59_1_in1 = _T_3718_imaginary_node__T_3737_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_40_1_in2 = _T_5043_real_node__T_5065_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_40_1_in1 = _T_4455_real_node__T_4474_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_41_1_in2 = _T_5043_imaginary_node__T_5065_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_41_1_in1 = _T_4455_imaginary_node__T_4474_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_37_1_in2 = BBFMultiply_41_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_37_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_60_1_in2 = BBFSubtract_37_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_60_1_in1 = BBFMultiply_40_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_42_1_in2 = _T_5043_imaginary_node__T_5065_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_42_1_in1 = _T_4455_real_node__T_4474_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_43_1_in2 = _T_5043_real_node__T_5065_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_43_1_in1 = _T_4455_imaginary_node__T_4474_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_61_1_in2 = BBFMultiply_43_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_61_1_in1 = BBFMultiply_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_62_1_in2 = BBFAdd_60_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_62_1_in1 = _T_4198_real_node__T_4217_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_63_1_in2 = BBFAdd_61_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_63_1_in1 = _T_4198_imaginary_node__T_4217_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_38_1_in2 = BBFAdd_60_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_38_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_39_1_in2 = BBFAdd_61_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_39_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_64_1_in2 = BBFSubtract_38_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_64_1_in1 = _T_4198_real_node__T_4217_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_65_1_in2 = BBFSubtract_39_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_65_1_in1 = _T_4198_imaginary_node__T_4217_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_44_1_in2 = _T_5303_real_node__T_5325_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_44_1_in1 = _T_4489_real_node__T_4508_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_45_1_in2 = _T_5303_imaginary_node__T_5325_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_45_1_in1 = _T_4489_imaginary_node__T_4508_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_40_1_in2 = BBFMultiply_45_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_40_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_66_1_in2 = BBFSubtract_40_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_66_1_in1 = BBFMultiply_44_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_46_1_in2 = _T_5303_imaginary_node__T_5325_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_46_1_in1 = _T_4489_real_node__T_4508_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFMultiply_47_1_in2 = _T_5303_real_node__T_5325_data; // @[DspReal.scala 82:21]
  assign BBFMultiply_47_1_in1 = _T_4489_imaginary_node__T_4508_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_67_1_in2 = BBFMultiply_47_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_67_1_in1 = BBFMultiply_46_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_68_1_in2 = BBFAdd_66_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_68_1_in1 = _T_4232_real_node__T_4251_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_69_1_in2 = BBFAdd_67_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_69_1_in1 = _T_4232_imaginary_node__T_4251_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFSubtract_41_1_in2 = BBFAdd_66_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_41_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_42_1_in2 = BBFAdd_67_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_42_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_70_1_in2 = BBFSubtract_41_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_70_1_in1 = _T_4232_real_node__T_4251_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  assign BBFAdd_71_1_in2 = BBFSubtract_42_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_71_1_in1 = _T_4232_imaginary_node__T_4251_data; // @[FFT.scala 54:77 FFT.scala 75:14]
  always @(posedge clock) begin
    if (_T_635__T_645_en & _T_635__T_645_mask) begin
      _T_635[_T_635__T_645_addr] <= _T_635__T_645_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2758_real_node__T_2769_en & _T_2758_real_node__T_2769_mask) begin
      _T_2758_real_node[_T_2758_real_node__T_2769_addr] <= _T_2758_real_node__T_2769_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2758_imaginary_node__T_2769_en & _T_2758_imaginary_node__T_2769_mask) begin
      _T_2758_imaginary_node[_T_2758_imaginary_node__T_2769_addr] <= _T_2758_imaginary_node__T_2769_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2792_real_node__T_2803_en & _T_2792_real_node__T_2803_mask) begin
      _T_2792_real_node[_T_2792_real_node__T_2803_addr] <= _T_2792_real_node__T_2803_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2792_imaginary_node__T_2803_en & _T_2792_imaginary_node__T_2803_mask) begin
      _T_2792_imaginary_node[_T_2792_imaginary_node__T_2803_addr] <= _T_2792_imaginary_node__T_2803_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2981_real_node__T_2992_en & _T_2981_real_node__T_2992_mask) begin
      _T_2981_real_node[_T_2981_real_node__T_2992_addr] <= _T_2981_real_node__T_2992_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2981_imaginary_node__T_2992_en & _T_2981_imaginary_node__T_2992_mask) begin
      _T_2981_imaginary_node[_T_2981_imaginary_node__T_2992_addr] <= _T_2981_imaginary_node__T_2992_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3015_real_node__T_3026_en & _T_3015_real_node__T_3026_mask) begin
      _T_3015_real_node[_T_3015_real_node__T_3026_addr] <= _T_3015_real_node__T_3026_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3015_imaginary_node__T_3026_en & _T_3015_imaginary_node__T_3026_mask) begin
      _T_3015_imaginary_node[_T_3015_imaginary_node__T_3026_addr] <= _T_3015_imaginary_node__T_3026_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3204_real_node__T_3215_en & _T_3204_real_node__T_3215_mask) begin
      _T_3204_real_node[_T_3204_real_node__T_3215_addr] <= _T_3204_real_node__T_3215_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3204_imaginary_node__T_3215_en & _T_3204_imaginary_node__T_3215_mask) begin
      _T_3204_imaginary_node[_T_3204_imaginary_node__T_3215_addr] <= _T_3204_imaginary_node__T_3215_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3238_real_node__T_3249_en & _T_3238_real_node__T_3249_mask) begin
      _T_3238_real_node[_T_3238_real_node__T_3249_addr] <= _T_3238_real_node__T_3249_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3238_imaginary_node__T_3249_en & _T_3238_imaginary_node__T_3249_mask) begin
      _T_3238_imaginary_node[_T_3238_imaginary_node__T_3249_addr] <= _T_3238_imaginary_node__T_3249_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3427_real_node__T_3438_en & _T_3427_real_node__T_3438_mask) begin
      _T_3427_real_node[_T_3427_real_node__T_3438_addr] <= _T_3427_real_node__T_3438_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3427_imaginary_node__T_3438_en & _T_3427_imaginary_node__T_3438_mask) begin
      _T_3427_imaginary_node[_T_3427_imaginary_node__T_3438_addr] <= _T_3427_imaginary_node__T_3438_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3461_real_node__T_3472_en & _T_3461_real_node__T_3472_mask) begin
      _T_3461_real_node[_T_3461_real_node__T_3472_addr] <= _T_3461_real_node__T_3472_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3461_imaginary_node__T_3472_en & _T_3461_imaginary_node__T_3472_mask) begin
      _T_3461_imaginary_node[_T_3461_imaginary_node__T_3472_addr] <= _T_3461_imaginary_node__T_3472_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3495_real_node__T_3506_en & _T_3495_real_node__T_3506_mask) begin
      _T_3495_real_node[_T_3495_real_node__T_3506_addr] <= _T_3495_real_node__T_3506_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3495_imaginary_node__T_3506_en & _T_3495_imaginary_node__T_3506_mask) begin
      _T_3495_imaginary_node[_T_3495_imaginary_node__T_3506_addr] <= _T_3495_imaginary_node__T_3506_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3684_real_node__T_3695_en & _T_3684_real_node__T_3695_mask) begin
      _T_3684_real_node[_T_3684_real_node__T_3695_addr] <= _T_3684_real_node__T_3695_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3684_imaginary_node__T_3695_en & _T_3684_imaginary_node__T_3695_mask) begin
      _T_3684_imaginary_node[_T_3684_imaginary_node__T_3695_addr] <= _T_3684_imaginary_node__T_3695_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3718_real_node__T_3729_en & _T_3718_real_node__T_3729_mask) begin
      _T_3718_real_node[_T_3718_real_node__T_3729_addr] <= _T_3718_real_node__T_3729_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3718_imaginary_node__T_3729_en & _T_3718_imaginary_node__T_3729_mask) begin
      _T_3718_imaginary_node[_T_3718_imaginary_node__T_3729_addr] <= _T_3718_imaginary_node__T_3729_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3752_real_node__T_3763_en & _T_3752_real_node__T_3763_mask) begin
      _T_3752_real_node[_T_3752_real_node__T_3763_addr] <= _T_3752_real_node__T_3763_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3752_imaginary_node__T_3763_en & _T_3752_imaginary_node__T_3763_mask) begin
      _T_3752_imaginary_node[_T_3752_imaginary_node__T_3763_addr] <= _T_3752_imaginary_node__T_3763_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3941_real_node__T_3952_en & _T_3941_real_node__T_3952_mask) begin
      _T_3941_real_node[_T_3941_real_node__T_3952_addr] <= _T_3941_real_node__T_3952_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3941_imaginary_node__T_3952_en & _T_3941_imaginary_node__T_3952_mask) begin
      _T_3941_imaginary_node[_T_3941_imaginary_node__T_3952_addr] <= _T_3941_imaginary_node__T_3952_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3975_real_node__T_3986_en & _T_3975_real_node__T_3986_mask) begin
      _T_3975_real_node[_T_3975_real_node__T_3986_addr] <= _T_3975_real_node__T_3986_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3975_imaginary_node__T_3986_en & _T_3975_imaginary_node__T_3986_mask) begin
      _T_3975_imaginary_node[_T_3975_imaginary_node__T_3986_addr] <= _T_3975_imaginary_node__T_3986_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4009_real_node__T_4020_en & _T_4009_real_node__T_4020_mask) begin
      _T_4009_real_node[_T_4009_real_node__T_4020_addr] <= _T_4009_real_node__T_4020_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4009_imaginary_node__T_4020_en & _T_4009_imaginary_node__T_4020_mask) begin
      _T_4009_imaginary_node[_T_4009_imaginary_node__T_4020_addr] <= _T_4009_imaginary_node__T_4020_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4198_real_node__T_4209_en & _T_4198_real_node__T_4209_mask) begin
      _T_4198_real_node[_T_4198_real_node__T_4209_addr] <= _T_4198_real_node__T_4209_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4198_imaginary_node__T_4209_en & _T_4198_imaginary_node__T_4209_mask) begin
      _T_4198_imaginary_node[_T_4198_imaginary_node__T_4209_addr] <= _T_4198_imaginary_node__T_4209_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4232_real_node__T_4243_en & _T_4232_real_node__T_4243_mask) begin
      _T_4232_real_node[_T_4232_real_node__T_4243_addr] <= _T_4232_real_node__T_4243_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4232_imaginary_node__T_4243_en & _T_4232_imaginary_node__T_4243_mask) begin
      _T_4232_imaginary_node[_T_4232_imaginary_node__T_4243_addr] <= _T_4232_imaginary_node__T_4243_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4266_real_node__T_4277_en & _T_4266_real_node__T_4277_mask) begin
      _T_4266_real_node[_T_4266_real_node__T_4277_addr] <= _T_4266_real_node__T_4277_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4266_imaginary_node__T_4277_en & _T_4266_imaginary_node__T_4277_mask) begin
      _T_4266_imaginary_node[_T_4266_imaginary_node__T_4277_addr] <= _T_4266_imaginary_node__T_4277_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4455_real_node__T_4466_en & _T_4455_real_node__T_4466_mask) begin
      _T_4455_real_node[_T_4455_real_node__T_4466_addr] <= _T_4455_real_node__T_4466_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4455_imaginary_node__T_4466_en & _T_4455_imaginary_node__T_4466_mask) begin
      _T_4455_imaginary_node[_T_4455_imaginary_node__T_4466_addr] <= _T_4455_imaginary_node__T_4466_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4489_real_node__T_4500_en & _T_4489_real_node__T_4500_mask) begin
      _T_4489_real_node[_T_4489_real_node__T_4500_addr] <= _T_4489_real_node__T_4500_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4489_imaginary_node__T_4500_en & _T_4489_imaginary_node__T_4500_mask) begin
      _T_4489_imaginary_node[_T_4489_imaginary_node__T_4500_addr] <= _T_4489_imaginary_node__T_4500_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4523_real_node__T_4538_en & _T_4523_real_node__T_4538_mask) begin
      _T_4523_real_node[_T_4523_real_node__T_4538_addr] <= _T_4523_real_node__T_4538_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4523_imaginary_node__T_4538_en & _T_4523_imaginary_node__T_4538_mask) begin
      _T_4523_imaginary_node[_T_4523_imaginary_node__T_4538_addr] <= _T_4523_imaginary_node__T_4538_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4715_real_node__T_4726_en & _T_4715_real_node__T_4726_mask) begin
      _T_4715_real_node[_T_4715_real_node__T_4726_addr] <= _T_4715_real_node__T_4726_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4715_imaginary_node__T_4726_en & _T_4715_imaginary_node__T_4726_mask) begin
      _T_4715_imaginary_node[_T_4715_imaginary_node__T_4726_addr] <= _T_4715_imaginary_node__T_4726_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4749_real_node__T_4760_en & _T_4749_real_node__T_4760_mask) begin
      _T_4749_real_node[_T_4749_real_node__T_4760_addr] <= _T_4749_real_node__T_4760_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4749_imaginary_node__T_4760_en & _T_4749_imaginary_node__T_4760_mask) begin
      _T_4749_imaginary_node[_T_4749_imaginary_node__T_4760_addr] <= _T_4749_imaginary_node__T_4760_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4783_real_node__T_4798_en & _T_4783_real_node__T_4798_mask) begin
      _T_4783_real_node[_T_4783_real_node__T_4798_addr] <= _T_4783_real_node__T_4798_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4783_imaginary_node__T_4798_en & _T_4783_imaginary_node__T_4798_mask) begin
      _T_4783_imaginary_node[_T_4783_imaginary_node__T_4798_addr] <= _T_4783_imaginary_node__T_4798_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4975_real_node__T_4986_en & _T_4975_real_node__T_4986_mask) begin
      _T_4975_real_node[_T_4975_real_node__T_4986_addr] <= _T_4975_real_node__T_4986_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4975_imaginary_node__T_4986_en & _T_4975_imaginary_node__T_4986_mask) begin
      _T_4975_imaginary_node[_T_4975_imaginary_node__T_4986_addr] <= _T_4975_imaginary_node__T_4986_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5009_real_node__T_5020_en & _T_5009_real_node__T_5020_mask) begin
      _T_5009_real_node[_T_5009_real_node__T_5020_addr] <= _T_5009_real_node__T_5020_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5009_imaginary_node__T_5020_en & _T_5009_imaginary_node__T_5020_mask) begin
      _T_5009_imaginary_node[_T_5009_imaginary_node__T_5020_addr] <= _T_5009_imaginary_node__T_5020_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5043_real_node__T_5058_en & _T_5043_real_node__T_5058_mask) begin
      _T_5043_real_node[_T_5043_real_node__T_5058_addr] <= _T_5043_real_node__T_5058_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5043_imaginary_node__T_5058_en & _T_5043_imaginary_node__T_5058_mask) begin
      _T_5043_imaginary_node[_T_5043_imaginary_node__T_5058_addr] <= _T_5043_imaginary_node__T_5058_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5235_real_node__T_5246_en & _T_5235_real_node__T_5246_mask) begin
      _T_5235_real_node[_T_5235_real_node__T_5246_addr] <= _T_5235_real_node__T_5246_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5235_imaginary_node__T_5246_en & _T_5235_imaginary_node__T_5246_mask) begin
      _T_5235_imaginary_node[_T_5235_imaginary_node__T_5246_addr] <= _T_5235_imaginary_node__T_5246_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5269_real_node__T_5280_en & _T_5269_real_node__T_5280_mask) begin
      _T_5269_real_node[_T_5269_real_node__T_5280_addr] <= _T_5269_real_node__T_5280_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5269_imaginary_node__T_5280_en & _T_5269_imaginary_node__T_5280_mask) begin
      _T_5269_imaginary_node[_T_5269_imaginary_node__T_5280_addr] <= _T_5269_imaginary_node__T_5280_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5303_real_node__T_5318_en & _T_5303_real_node__T_5318_mask) begin
      _T_5303_real_node[_T_5303_real_node__T_5318_addr] <= _T_5303_real_node__T_5318_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5303_imaginary_node__T_5318_en & _T_5303_imaginary_node__T_5318_mask) begin
      _T_5303_imaginary_node[_T_5303_imaginary_node__T_5318_addr] <= _T_5303_imaginary_node__T_5318_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5495_real_node__T_5506_en & _T_5495_real_node__T_5506_mask) begin
      _T_5495_real_node[_T_5495_real_node__T_5506_addr] <= _T_5495_real_node__T_5506_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5495_imaginary_node__T_5506_en & _T_5495_imaginary_node__T_5506_mask) begin
      _T_5495_imaginary_node[_T_5495_imaginary_node__T_5506_addr] <= _T_5495_imaginary_node__T_5506_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5529_real_node__T_5540_en & _T_5529_real_node__T_5540_mask) begin
      _T_5529_real_node[_T_5529_real_node__T_5540_addr] <= _T_5529_real_node__T_5540_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_5529_imaginary_node__T_5540_en & _T_5529_imaginary_node__T_5540_mask) begin
      _T_5529_imaginary_node[_T_5529_imaginary_node__T_5540_addr] <= _T_5529_imaginary_node__T_5540_data; // @[FFTUtilities.scala 169:21]
    end
    if (reset) begin // @[Counter.scala 15:29]
      sync <= 1'h0; // @[Counter.scala 15:29]
    end else if (_T_624) begin // @[CounterWithReset.scala 11:31]
      sync <= 1'h0; // @[CounterWithReset.scala 11:38]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      sync <= sync + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_637 <= 2'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      if (_T_639) begin // @[Counter.scala 26:21]
        _T_637 <= 2'h0; // @[Counter.scala 26:29]
      end else begin
        _T_637 <= _T_642; // @[Counter.scala 24:13]
      end
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_4525 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_4525 <= _T_4525 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_4785 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_4785 <= _T_4785 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_5045 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_5045 <= _T_5045 + 1'h1; // @[Counter.scala 24:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      _T_5305 <= 1'h0; // @[Counter.scala 15:29]
    end else if (io_in_valid) begin // @[Counter.scala 59:17]
      _T_5305 <= _T_5305 + 1'h1; // @[Counter.scala 24:13]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    _T_635[initvar] = _RAND_0[0:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2758_real_node[initvar] = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2758_imaginary_node[initvar] = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2792_real_node[initvar] = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2792_imaginary_node[initvar] = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2981_real_node[initvar] = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2981_imaginary_node[initvar] = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3015_real_node[initvar] = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3015_imaginary_node[initvar] = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3204_real_node[initvar] = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3204_imaginary_node[initvar] = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3238_real_node[initvar] = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3238_imaginary_node[initvar] = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3427_real_node[initvar] = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3427_imaginary_node[initvar] = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3461_real_node[initvar] = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3461_imaginary_node[initvar] = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3495_real_node[initvar] = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3495_imaginary_node[initvar] = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3684_real_node[initvar] = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3684_imaginary_node[initvar] = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3718_real_node[initvar] = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3718_imaginary_node[initvar] = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3752_real_node[initvar] = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3752_imaginary_node[initvar] = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3941_real_node[initvar] = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3941_imaginary_node[initvar] = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3975_real_node[initvar] = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3975_imaginary_node[initvar] = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4009_real_node[initvar] = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4009_imaginary_node[initvar] = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4198_real_node[initvar] = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4198_imaginary_node[initvar] = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4232_real_node[initvar] = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4232_imaginary_node[initvar] = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4266_real_node[initvar] = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4266_imaginary_node[initvar] = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4455_real_node[initvar] = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4455_imaginary_node[initvar] = _RAND_39[63:0];
  _RAND_40 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4489_real_node[initvar] = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4489_imaginary_node[initvar] = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4523_real_node[initvar] = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4523_imaginary_node[initvar] = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4715_real_node[initvar] = _RAND_44[63:0];
  _RAND_45 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4715_imaginary_node[initvar] = _RAND_45[63:0];
  _RAND_46 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4749_real_node[initvar] = _RAND_46[63:0];
  _RAND_47 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4749_imaginary_node[initvar] = _RAND_47[63:0];
  _RAND_48 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4783_real_node[initvar] = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_4783_imaginary_node[initvar] = _RAND_49[63:0];
  _RAND_50 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4975_real_node[initvar] = _RAND_50[63:0];
  _RAND_51 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4975_imaginary_node[initvar] = _RAND_51[63:0];
  _RAND_52 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5009_real_node[initvar] = _RAND_52[63:0];
  _RAND_53 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5009_imaginary_node[initvar] = _RAND_53[63:0];
  _RAND_54 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_5043_real_node[initvar] = _RAND_54[63:0];
  _RAND_55 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_5043_imaginary_node[initvar] = _RAND_55[63:0];
  _RAND_56 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5235_real_node[initvar] = _RAND_56[63:0];
  _RAND_57 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5235_imaginary_node[initvar] = _RAND_57[63:0];
  _RAND_58 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5269_real_node[initvar] = _RAND_58[63:0];
  _RAND_59 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5269_imaginary_node[initvar] = _RAND_59[63:0];
  _RAND_60 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_5303_real_node[initvar] = _RAND_60[63:0];
  _RAND_61 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_5303_imaginary_node[initvar] = _RAND_61[63:0];
  _RAND_62 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5495_real_node[initvar] = _RAND_62[63:0];
  _RAND_63 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5495_imaginary_node[initvar] = _RAND_63[63:0];
  _RAND_64 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5529_real_node[initvar] = _RAND_64[63:0];
  _RAND_65 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_5529_imaginary_node[initvar] = _RAND_65[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  sync = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  _T_637 = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  _T_4525 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  _T_4785 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  _T_5045 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  _T_5305 = _RAND_71[0:0];
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
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_53;
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
  reg [63:0] _T_2122_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_real_node__T_2141_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_real_node__T_2141_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2122_real_node__T_2141_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2122_real_node__T_2133_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_real_node__T_2133_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_real_node__T_2133_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_real_node__T_2133_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2122_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_imaginary_node__T_2141_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_imaginary_node__T_2141_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2122_imaginary_node__T_2141_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2122_imaginary_node__T_2133_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_imaginary_node__T_2133_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_imaginary_node__T_2133_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2122_imaginary_node__T_2133_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2156_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_real_node__T_2175_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_real_node__T_2175_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2156_real_node__T_2175_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2156_real_node__T_2167_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_real_node__T_2167_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_real_node__T_2167_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_real_node__T_2167_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2156_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_imaginary_node__T_2175_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_imaginary_node__T_2175_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2156_imaginary_node__T_2175_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2156_imaginary_node__T_2167_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_imaginary_node__T_2167_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_imaginary_node__T_2167_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2156_imaginary_node__T_2167_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2391_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_real_node__T_2410_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_real_node__T_2410_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2391_real_node__T_2410_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2391_real_node__T_2402_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_real_node__T_2402_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_real_node__T_2402_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_real_node__T_2402_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2391_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_imaginary_node__T_2410_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_imaginary_node__T_2410_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2391_imaginary_node__T_2410_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2391_imaginary_node__T_2402_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_imaginary_node__T_2402_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_imaginary_node__T_2402_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2391_imaginary_node__T_2402_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_2580_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_real_node__T_2599_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_real_node__T_2599_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2580_real_node__T_2599_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2580_real_node__T_2591_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_real_node__T_2591_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_real_node__T_2591_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_real_node__T_2591_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2580_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_imaginary_node__T_2599_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_imaginary_node__T_2599_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2580_imaginary_node__T_2599_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2580_imaginary_node__T_2591_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_imaginary_node__T_2591_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_imaginary_node__T_2591_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2580_imaginary_node__T_2591_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2614_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_real_node__T_2633_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_real_node__T_2633_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2614_real_node__T_2633_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2614_real_node__T_2625_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_real_node__T_2625_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_real_node__T_2625_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_real_node__T_2625_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2614_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_imaginary_node__T_2633_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_imaginary_node__T_2633_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2614_imaginary_node__T_2633_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2614_imaginary_node__T_2625_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_imaginary_node__T_2625_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_imaginary_node__T_2625_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2614_imaginary_node__T_2625_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2648_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_real_node__T_2667_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_real_node__T_2667_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2648_real_node__T_2667_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2648_real_node__T_2659_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_real_node__T_2659_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_real_node__T_2659_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_real_node__T_2659_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2648_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_imaginary_node__T_2667_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_imaginary_node__T_2667_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2648_imaginary_node__T_2667_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2648_imaginary_node__T_2659_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_imaginary_node__T_2659_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_imaginary_node__T_2659_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2648_imaginary_node__T_2659_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2883_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_real_node__T_2902_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_real_node__T_2902_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2883_real_node__T_2902_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2883_real_node__T_2894_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_real_node__T_2894_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_real_node__T_2894_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_real_node__T_2894_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_2883_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_imaginary_node__T_2902_en; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_imaginary_node__T_2902_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2883_imaginary_node__T_2902_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_2883_imaginary_node__T_2894_data; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_imaginary_node__T_2894_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_imaginary_node__T_2894_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_2883_imaginary_node__T_2894_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_3072_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_real_node__T_3091_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_real_node__T_3091_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3072_real_node__T_3091_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3072_real_node__T_3083_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_real_node__T_3083_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_real_node__T_3083_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_real_node__T_3083_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3072_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_imaginary_node__T_3091_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_imaginary_node__T_3091_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3072_imaginary_node__T_3091_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3072_imaginary_node__T_3083_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_imaginary_node__T_3083_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_imaginary_node__T_3083_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3072_imaginary_node__T_3083_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3106_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_real_node__T_3125_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_real_node__T_3125_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3106_real_node__T_3125_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3106_real_node__T_3117_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_real_node__T_3117_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_real_node__T_3117_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_real_node__T_3117_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3106_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_imaginary_node__T_3125_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_imaginary_node__T_3125_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3106_imaginary_node__T_3125_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3106_imaginary_node__T_3117_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_imaginary_node__T_3117_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_imaginary_node__T_3117_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3106_imaginary_node__T_3117_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3140_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_real_node__T_3159_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_real_node__T_3159_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3140_real_node__T_3159_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3140_real_node__T_3151_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_real_node__T_3151_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_real_node__T_3151_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_real_node__T_3151_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3140_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_imaginary_node__T_3159_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_imaginary_node__T_3159_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3140_imaginary_node__T_3159_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3140_imaginary_node__T_3151_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_imaginary_node__T_3151_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_imaginary_node__T_3151_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3140_imaginary_node__T_3151_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3375_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_real_node__T_3394_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_real_node__T_3394_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3375_real_node__T_3394_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3375_real_node__T_3386_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_real_node__T_3386_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_real_node__T_3386_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_real_node__T_3386_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3375_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_imaginary_node__T_3394_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_imaginary_node__T_3394_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3375_imaginary_node__T_3394_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3375_imaginary_node__T_3386_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_imaginary_node__T_3386_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_imaginary_node__T_3386_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3375_imaginary_node__T_3386_en; // @[FFTUtilities.scala 169:21]
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
  reg [63:0] _T_3564_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_real_node__T_3583_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_real_node__T_3583_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3564_real_node__T_3583_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3564_real_node__T_3575_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_real_node__T_3575_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_real_node__T_3575_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_real_node__T_3575_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3564_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_imaginary_node__T_3583_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_imaginary_node__T_3583_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3564_imaginary_node__T_3583_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3564_imaginary_node__T_3575_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_imaginary_node__T_3575_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_imaginary_node__T_3575_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3564_imaginary_node__T_3575_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3598_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_real_node__T_3617_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_real_node__T_3617_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3598_real_node__T_3617_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3598_real_node__T_3609_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_real_node__T_3609_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_real_node__T_3609_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_real_node__T_3609_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3598_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_imaginary_node__T_3617_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_imaginary_node__T_3617_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3598_imaginary_node__T_3617_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3598_imaginary_node__T_3609_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_imaginary_node__T_3609_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_imaginary_node__T_3609_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3598_imaginary_node__T_3609_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3632_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_real_node__T_3651_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_real_node__T_3651_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3632_real_node__T_3651_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3632_real_node__T_3643_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_real_node__T_3643_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_real_node__T_3643_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_real_node__T_3643_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3632_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_imaginary_node__T_3651_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_imaginary_node__T_3651_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3632_imaginary_node__T_3651_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3632_imaginary_node__T_3643_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_imaginary_node__T_3643_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_imaginary_node__T_3643_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3632_imaginary_node__T_3643_en; // @[FFTUtilities.scala 169:21]
  reg  _T_3737 [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3744_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3744_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3744_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3742_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3742_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3742_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3737__T_3742_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3877_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_real_node__T_3896_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_real_node__T_3896_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3877_real_node__T_3896_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3877_real_node__T_3888_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_real_node__T_3888_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_real_node__T_3888_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_real_node__T_3888_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3877_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_imaginary_node__T_3896_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_imaginary_node__T_3896_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3877_imaginary_node__T_3896_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3877_imaginary_node__T_3888_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_imaginary_node__T_3888_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_imaginary_node__T_3888_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3877_imaginary_node__T_3888_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3911_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_real_node__T_3930_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_real_node__T_3930_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3911_real_node__T_3930_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3911_real_node__T_3922_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_real_node__T_3922_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_real_node__T_3922_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_real_node__T_3922_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_3911_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_imaginary_node__T_3930_en; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_imaginary_node__T_3930_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3911_imaginary_node__T_3930_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_3911_imaginary_node__T_3922_data; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_imaginary_node__T_3922_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_imaginary_node__T_3922_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_3911_imaginary_node__T_3922_en; // @[FFTUtilities.scala 169:21]
  reg  _T_4016 [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4023_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4023_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4023_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4021_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4021_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4021_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4016__T_4021_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4156_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_real_node__T_4175_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_real_node__T_4175_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4156_real_node__T_4175_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4156_real_node__T_4167_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_real_node__T_4167_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_real_node__T_4167_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_real_node__T_4167_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4156_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_imaginary_node__T_4175_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_imaginary_node__T_4175_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4156_imaginary_node__T_4175_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4156_imaginary_node__T_4167_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_imaginary_node__T_4167_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_imaginary_node__T_4167_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4156_imaginary_node__T_4167_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4190_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_real_node__T_4209_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_real_node__T_4209_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4190_real_node__T_4209_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4190_real_node__T_4201_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_real_node__T_4201_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_real_node__T_4201_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_real_node__T_4201_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4190_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_imaginary_node__T_4209_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_imaginary_node__T_4209_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4190_imaginary_node__T_4209_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4190_imaginary_node__T_4201_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_imaginary_node__T_4201_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_imaginary_node__T_4201_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4190_imaginary_node__T_4201_en; // @[FFTUtilities.scala 169:21]
  reg  _T_4295 [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4302_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4302_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4302_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4300_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4300_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4300_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4295__T_4300_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4435_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_real_node__T_4454_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_real_node__T_4454_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4435_real_node__T_4454_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4435_real_node__T_4446_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_real_node__T_4446_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_real_node__T_4446_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_real_node__T_4446_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4435_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_imaginary_node__T_4454_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_imaginary_node__T_4454_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4435_imaginary_node__T_4454_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4435_imaginary_node__T_4446_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_imaginary_node__T_4446_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_imaginary_node__T_4446_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4435_imaginary_node__T_4446_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4469_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_real_node__T_4488_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_real_node__T_4488_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4469_real_node__T_4488_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4469_real_node__T_4480_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_real_node__T_4480_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_real_node__T_4480_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_real_node__T_4480_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4469_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_imaginary_node__T_4488_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_imaginary_node__T_4488_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4469_imaginary_node__T_4488_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4469_imaginary_node__T_4480_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_imaginary_node__T_4480_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_imaginary_node__T_4480_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4469_imaginary_node__T_4480_en; // @[FFTUtilities.scala 169:21]
  reg  _T_4574 [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4581_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4581_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4581_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4579_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4579_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4579_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4574__T_4579_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4714_real_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4733_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4733_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_real_node__T_4733_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_real_node__T_4725_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4725_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4725_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_real_node__T_4725_en; // @[FFTUtilities.scala 169:21]
  reg [63:0] _T_4714_imaginary_node [0:0]; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4733_en; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4733_addr; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_imaginary_node__T_4733_data; // @[FFTUtilities.scala 169:21]
  wire [63:0] _T_4714_imaginary_node__T_4725_data; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4725_addr; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4725_mask; // @[FFTUtilities.scala 169:21]
  wire  _T_4714_imaginary_node__T_4725_en; // @[FFTUtilities.scala 169:21]
  wire  _T_626 = io_in_sync & io_in_valid; // @[FFT.scala 96:66]
  reg  sync_0; // @[Counter.scala 15:29]
  wire  _T_633 = sync_0 + 1'h1; // @[Counter.scala 24:22]
  wire [1:0] _T_1770 = {{1'd0}, sync_0}; // @[FFTUtilities.scala 89:20]
  wire [63:0] _T_1725_1_imaginary_node = _T_1664_imaginary_node__T_1683_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_1725_1_real_node = _T_1664_real_node__T_1683_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2217_1_imaginary_node = _T_2156_imaginary_node__T_2175_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2217_1_real_node = _T_2156_real_node__T_2175_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2709_1_imaginary_node = _T_2648_imaginary_node__T_2667_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_2709_1_real_node = _T_2648_real_node__T_2667_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_3201_1_imaginary_node = _T_3140_imaginary_node__T_3159_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] _T_3201_1_real_node = _T_3140_real_node__T_3159_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [1:0] _T_3748 = {{1'd0}, _T_3737__T_3744_data}; // @[FFTUtilities.scala 89:20]
  wire  _T_3767 = _T_3737__T_3744_data + 1'h1; // @[FFTUtilities.scala 89:20]
  wire [63:0] stage_outputs_1_0_imaginary_node = _T_2088_imaginary_node__T_2107_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_3693_1_imaginary_node = _T_3632_imaginary_node__T_3651_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_0_real_node = _T_2088_real_node__T_2107_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_3693_1_real_node = _T_3632_real_node__T_3651_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [1:0] _T_4027 = {{1'd0}, _T_4016__T_4023_data}; // @[FFTUtilities.scala 89:20]
  wire  _T_4046 = _T_4016__T_4023_data + 1'h1; // @[FFTUtilities.scala 89:20]
  wire [63:0] stage_outputs_1_2_imaginary_node = _T_2580_imaginary_node__T_2599_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_3972_1_imaginary_node = _T_3911_imaginary_node__T_3930_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_2_real_node = _T_2580_real_node__T_2599_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_3972_1_real_node = _T_3911_real_node__T_3930_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [1:0] _T_4306 = {{1'd0}, _T_4295__T_4302_data}; // @[FFTUtilities.scala 89:20]
  wire  _T_4325 = _T_4295__T_4302_data + 1'h1; // @[FFTUtilities.scala 89:20]
  wire [63:0] stage_outputs_1_4_imaginary_node = _T_3072_imaginary_node__T_3091_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_4251_1_imaginary_node = _T_4190_imaginary_node__T_4209_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_4_real_node = _T_3072_real_node__T_3091_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_4251_1_real_node = _T_4190_real_node__T_4209_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [1:0] _T_4585 = {{1'd0}, _T_4574__T_4581_data}; // @[FFTUtilities.scala 89:20]
  wire  _T_4604 = _T_4574__T_4581_data + 1'h1; // @[FFTUtilities.scala 89:20]
  wire [63:0] stage_outputs_1_6_imaginary_node = _T_3564_imaginary_node__T_3583_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_4530_1_imaginary_node = _T_4469_imaginary_node__T_4488_data; // @[FFT.scala 132:38 FFT.scala 132:38]
  wire [63:0] stage_outputs_1_6_real_node = _T_3564_real_node__T_3583_data; // @[FFT.scala 120:78 FFT.scala 136:198]
  wire [63:0] _T_4530_1_real_node = _T_4469_real_node__T_4488_data; // @[FFT.scala 132:38 FFT.scala 132:38]
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
  assign _T_2088_real_node__T_2099_data = BBFAdd_74_1_out;
  assign _T_2088_real_node__T_2099_addr = 1'h0;
  assign _T_2088_real_node__T_2099_mask = 1'h1;
  assign _T_2088_real_node__T_2099_en = io_in_valid;
  assign _T_2088_imaginary_node__T_2107_en = 1'h1;
  assign _T_2088_imaginary_node__T_2107_addr = 1'h0;
  assign _T_2088_imaginary_node__T_2107_data = _T_2088_imaginary_node[_T_2088_imaginary_node__T_2107_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2088_imaginary_node__T_2099_data = BBFAdd_75_1_out;
  assign _T_2088_imaginary_node__T_2099_addr = 1'h0;
  assign _T_2088_imaginary_node__T_2099_mask = 1'h1;
  assign _T_2088_imaginary_node__T_2099_en = io_in_valid;
  assign _T_2122_real_node__T_2141_en = 1'h1;
  assign _T_2122_real_node__T_2141_addr = 1'h0;
  assign _T_2122_real_node__T_2141_data = _T_2122_real_node[_T_2122_real_node__T_2141_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2122_real_node__T_2133_data = BBFAdd_76_1_out;
  assign _T_2122_real_node__T_2133_addr = 1'h0;
  assign _T_2122_real_node__T_2133_mask = 1'h1;
  assign _T_2122_real_node__T_2133_en = io_in_valid;
  assign _T_2122_imaginary_node__T_2141_en = 1'h1;
  assign _T_2122_imaginary_node__T_2141_addr = 1'h0;
  assign _T_2122_imaginary_node__T_2141_data = _T_2122_imaginary_node[_T_2122_imaginary_node__T_2141_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2122_imaginary_node__T_2133_data = BBFAdd_77_1_out;
  assign _T_2122_imaginary_node__T_2133_addr = 1'h0;
  assign _T_2122_imaginary_node__T_2133_mask = 1'h1;
  assign _T_2122_imaginary_node__T_2133_en = io_in_valid;
  assign _T_2156_real_node__T_2175_en = 1'h1;
  assign _T_2156_real_node__T_2175_addr = 1'h0;
  assign _T_2156_real_node__T_2175_data = _T_2156_real_node[_T_2156_real_node__T_2175_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2156_real_node__T_2167_data = io_in_bits_3_real_node;
  assign _T_2156_real_node__T_2167_addr = 1'h0;
  assign _T_2156_real_node__T_2167_mask = 1'h1;
  assign _T_2156_real_node__T_2167_en = io_in_valid;
  assign _T_2156_imaginary_node__T_2175_en = 1'h1;
  assign _T_2156_imaginary_node__T_2175_addr = 1'h0;
  assign _T_2156_imaginary_node__T_2175_data = _T_2156_imaginary_node[_T_2156_imaginary_node__T_2175_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2156_imaginary_node__T_2167_data = io_in_bits_3_imaginary_node;
  assign _T_2156_imaginary_node__T_2167_addr = 1'h0;
  assign _T_2156_imaginary_node__T_2167_mask = 1'h1;
  assign _T_2156_imaginary_node__T_2167_en = io_in_valid;
  assign _T_2391_real_node__T_2410_en = 1'h1;
  assign _T_2391_real_node__T_2410_addr = 1'h0;
  assign _T_2391_real_node__T_2410_data = _T_2391_real_node[_T_2391_real_node__T_2410_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2391_real_node__T_2402_data = _T_1770[0] ? _T_2217_1_real_node : io_in_bits_2_real_node;
  assign _T_2391_real_node__T_2402_addr = 1'h0;
  assign _T_2391_real_node__T_2402_mask = 1'h1;
  assign _T_2391_real_node__T_2402_en = io_in_valid;
  assign _T_2391_imaginary_node__T_2410_en = 1'h1;
  assign _T_2391_imaginary_node__T_2410_addr = 1'h0;
  assign _T_2391_imaginary_node__T_2410_data = _T_2391_imaginary_node[_T_2391_imaginary_node__T_2410_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2391_imaginary_node__T_2402_data = _T_1770[0] ? _T_2217_1_imaginary_node : io_in_bits_2_imaginary_node;
  assign _T_2391_imaginary_node__T_2402_addr = 1'h0;
  assign _T_2391_imaginary_node__T_2402_mask = 1'h1;
  assign _T_2391_imaginary_node__T_2402_en = io_in_valid;
  assign _T_2580_real_node__T_2599_en = 1'h1;
  assign _T_2580_real_node__T_2599_addr = 1'h0;
  assign _T_2580_real_node__T_2599_data = _T_2580_real_node[_T_2580_real_node__T_2599_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2580_real_node__T_2591_data = BBFAdd_80_1_out;
  assign _T_2580_real_node__T_2591_addr = 1'h0;
  assign _T_2580_real_node__T_2591_mask = 1'h1;
  assign _T_2580_real_node__T_2591_en = io_in_valid;
  assign _T_2580_imaginary_node__T_2599_en = 1'h1;
  assign _T_2580_imaginary_node__T_2599_addr = 1'h0;
  assign _T_2580_imaginary_node__T_2599_data = _T_2580_imaginary_node[_T_2580_imaginary_node__T_2599_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2580_imaginary_node__T_2591_data = BBFAdd_81_1_out;
  assign _T_2580_imaginary_node__T_2591_addr = 1'h0;
  assign _T_2580_imaginary_node__T_2591_mask = 1'h1;
  assign _T_2580_imaginary_node__T_2591_en = io_in_valid;
  assign _T_2614_real_node__T_2633_en = 1'h1;
  assign _T_2614_real_node__T_2633_addr = 1'h0;
  assign _T_2614_real_node__T_2633_data = _T_2614_real_node[_T_2614_real_node__T_2633_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2614_real_node__T_2625_data = BBFAdd_82_1_out;
  assign _T_2614_real_node__T_2625_addr = 1'h0;
  assign _T_2614_real_node__T_2625_mask = 1'h1;
  assign _T_2614_real_node__T_2625_en = io_in_valid;
  assign _T_2614_imaginary_node__T_2633_en = 1'h1;
  assign _T_2614_imaginary_node__T_2633_addr = 1'h0;
  assign _T_2614_imaginary_node__T_2633_data = _T_2614_imaginary_node[_T_2614_imaginary_node__T_2633_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2614_imaginary_node__T_2625_data = BBFAdd_83_1_out;
  assign _T_2614_imaginary_node__T_2625_addr = 1'h0;
  assign _T_2614_imaginary_node__T_2625_mask = 1'h1;
  assign _T_2614_imaginary_node__T_2625_en = io_in_valid;
  assign _T_2648_real_node__T_2667_en = 1'h1;
  assign _T_2648_real_node__T_2667_addr = 1'h0;
  assign _T_2648_real_node__T_2667_data = _T_2648_real_node[_T_2648_real_node__T_2667_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2648_real_node__T_2659_data = io_in_bits_5_real_node;
  assign _T_2648_real_node__T_2659_addr = 1'h0;
  assign _T_2648_real_node__T_2659_mask = 1'h1;
  assign _T_2648_real_node__T_2659_en = io_in_valid;
  assign _T_2648_imaginary_node__T_2667_en = 1'h1;
  assign _T_2648_imaginary_node__T_2667_addr = 1'h0;
  assign _T_2648_imaginary_node__T_2667_data = _T_2648_imaginary_node[_T_2648_imaginary_node__T_2667_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2648_imaginary_node__T_2659_data = io_in_bits_5_imaginary_node;
  assign _T_2648_imaginary_node__T_2659_addr = 1'h0;
  assign _T_2648_imaginary_node__T_2659_mask = 1'h1;
  assign _T_2648_imaginary_node__T_2659_en = io_in_valid;
  assign _T_2883_real_node__T_2902_en = 1'h1;
  assign _T_2883_real_node__T_2902_addr = 1'h0;
  assign _T_2883_real_node__T_2902_data = _T_2883_real_node[_T_2883_real_node__T_2902_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2883_real_node__T_2894_data = _T_1770[0] ? _T_2709_1_real_node : io_in_bits_4_real_node;
  assign _T_2883_real_node__T_2894_addr = 1'h0;
  assign _T_2883_real_node__T_2894_mask = 1'h1;
  assign _T_2883_real_node__T_2894_en = io_in_valid;
  assign _T_2883_imaginary_node__T_2902_en = 1'h1;
  assign _T_2883_imaginary_node__T_2902_addr = 1'h0;
  assign _T_2883_imaginary_node__T_2902_data = _T_2883_imaginary_node[_T_2883_imaginary_node__T_2902_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_2883_imaginary_node__T_2894_data = _T_1770[0] ? _T_2709_1_imaginary_node : io_in_bits_4_imaginary_node;
  assign _T_2883_imaginary_node__T_2894_addr = 1'h0;
  assign _T_2883_imaginary_node__T_2894_mask = 1'h1;
  assign _T_2883_imaginary_node__T_2894_en = io_in_valid;
  assign _T_3072_real_node__T_3091_en = 1'h1;
  assign _T_3072_real_node__T_3091_addr = 1'h0;
  assign _T_3072_real_node__T_3091_data = _T_3072_real_node[_T_3072_real_node__T_3091_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3072_real_node__T_3083_data = BBFAdd_86_1_out;
  assign _T_3072_real_node__T_3083_addr = 1'h0;
  assign _T_3072_real_node__T_3083_mask = 1'h1;
  assign _T_3072_real_node__T_3083_en = io_in_valid;
  assign _T_3072_imaginary_node__T_3091_en = 1'h1;
  assign _T_3072_imaginary_node__T_3091_addr = 1'h0;
  assign _T_3072_imaginary_node__T_3091_data = _T_3072_imaginary_node[_T_3072_imaginary_node__T_3091_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3072_imaginary_node__T_3083_data = BBFAdd_87_1_out;
  assign _T_3072_imaginary_node__T_3083_addr = 1'h0;
  assign _T_3072_imaginary_node__T_3083_mask = 1'h1;
  assign _T_3072_imaginary_node__T_3083_en = io_in_valid;
  assign _T_3106_real_node__T_3125_en = 1'h1;
  assign _T_3106_real_node__T_3125_addr = 1'h0;
  assign _T_3106_real_node__T_3125_data = _T_3106_real_node[_T_3106_real_node__T_3125_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3106_real_node__T_3117_data = BBFAdd_88_1_out;
  assign _T_3106_real_node__T_3117_addr = 1'h0;
  assign _T_3106_real_node__T_3117_mask = 1'h1;
  assign _T_3106_real_node__T_3117_en = io_in_valid;
  assign _T_3106_imaginary_node__T_3125_en = 1'h1;
  assign _T_3106_imaginary_node__T_3125_addr = 1'h0;
  assign _T_3106_imaginary_node__T_3125_data = _T_3106_imaginary_node[_T_3106_imaginary_node__T_3125_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3106_imaginary_node__T_3117_data = BBFAdd_89_1_out;
  assign _T_3106_imaginary_node__T_3117_addr = 1'h0;
  assign _T_3106_imaginary_node__T_3117_mask = 1'h1;
  assign _T_3106_imaginary_node__T_3117_en = io_in_valid;
  assign _T_3140_real_node__T_3159_en = 1'h1;
  assign _T_3140_real_node__T_3159_addr = 1'h0;
  assign _T_3140_real_node__T_3159_data = _T_3140_real_node[_T_3140_real_node__T_3159_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3140_real_node__T_3151_data = io_in_bits_7_real_node;
  assign _T_3140_real_node__T_3151_addr = 1'h0;
  assign _T_3140_real_node__T_3151_mask = 1'h1;
  assign _T_3140_real_node__T_3151_en = io_in_valid;
  assign _T_3140_imaginary_node__T_3159_en = 1'h1;
  assign _T_3140_imaginary_node__T_3159_addr = 1'h0;
  assign _T_3140_imaginary_node__T_3159_data = _T_3140_imaginary_node[_T_3140_imaginary_node__T_3159_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3140_imaginary_node__T_3151_data = io_in_bits_7_imaginary_node;
  assign _T_3140_imaginary_node__T_3151_addr = 1'h0;
  assign _T_3140_imaginary_node__T_3151_mask = 1'h1;
  assign _T_3140_imaginary_node__T_3151_en = io_in_valid;
  assign _T_3375_real_node__T_3394_en = 1'h1;
  assign _T_3375_real_node__T_3394_addr = 1'h0;
  assign _T_3375_real_node__T_3394_data = _T_3375_real_node[_T_3375_real_node__T_3394_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3375_real_node__T_3386_data = _T_1770[0] ? _T_3201_1_real_node : io_in_bits_6_real_node;
  assign _T_3375_real_node__T_3386_addr = 1'h0;
  assign _T_3375_real_node__T_3386_mask = 1'h1;
  assign _T_3375_real_node__T_3386_en = io_in_valid;
  assign _T_3375_imaginary_node__T_3394_en = 1'h1;
  assign _T_3375_imaginary_node__T_3394_addr = 1'h0;
  assign _T_3375_imaginary_node__T_3394_data = _T_3375_imaginary_node[_T_3375_imaginary_node__T_3394_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3375_imaginary_node__T_3386_data = _T_1770[0] ? _T_3201_1_imaginary_node : io_in_bits_6_imaginary_node;
  assign _T_3375_imaginary_node__T_3386_addr = 1'h0;
  assign _T_3375_imaginary_node__T_3386_mask = 1'h1;
  assign _T_3375_imaginary_node__T_3386_en = io_in_valid;
  assign _T_3564_real_node__T_3583_en = 1'h1;
  assign _T_3564_real_node__T_3583_addr = 1'h0;
  assign _T_3564_real_node__T_3583_data = _T_3564_real_node[_T_3564_real_node__T_3583_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3564_real_node__T_3575_data = BBFAdd_92_1_out;
  assign _T_3564_real_node__T_3575_addr = 1'h0;
  assign _T_3564_real_node__T_3575_mask = 1'h1;
  assign _T_3564_real_node__T_3575_en = io_in_valid;
  assign _T_3564_imaginary_node__T_3583_en = 1'h1;
  assign _T_3564_imaginary_node__T_3583_addr = 1'h0;
  assign _T_3564_imaginary_node__T_3583_data = _T_3564_imaginary_node[_T_3564_imaginary_node__T_3583_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3564_imaginary_node__T_3575_data = BBFAdd_93_1_out;
  assign _T_3564_imaginary_node__T_3575_addr = 1'h0;
  assign _T_3564_imaginary_node__T_3575_mask = 1'h1;
  assign _T_3564_imaginary_node__T_3575_en = io_in_valid;
  assign _T_3598_real_node__T_3617_en = 1'h1;
  assign _T_3598_real_node__T_3617_addr = 1'h0;
  assign _T_3598_real_node__T_3617_data = _T_3598_real_node[_T_3598_real_node__T_3617_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3598_real_node__T_3609_data = BBFAdd_94_1_out;
  assign _T_3598_real_node__T_3609_addr = 1'h0;
  assign _T_3598_real_node__T_3609_mask = 1'h1;
  assign _T_3598_real_node__T_3609_en = io_in_valid;
  assign _T_3598_imaginary_node__T_3617_en = 1'h1;
  assign _T_3598_imaginary_node__T_3617_addr = 1'h0;
  assign _T_3598_imaginary_node__T_3617_data = _T_3598_imaginary_node[_T_3598_imaginary_node__T_3617_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3598_imaginary_node__T_3609_data = BBFAdd_95_1_out;
  assign _T_3598_imaginary_node__T_3609_addr = 1'h0;
  assign _T_3598_imaginary_node__T_3609_mask = 1'h1;
  assign _T_3598_imaginary_node__T_3609_en = io_in_valid;
  assign _T_3632_real_node__T_3651_en = 1'h1;
  assign _T_3632_real_node__T_3651_addr = 1'h0;
  assign _T_3632_real_node__T_3651_data = _T_3632_real_node[_T_3632_real_node__T_3651_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3632_real_node__T_3643_data = _T_2122_real_node__T_2141_data;
  assign _T_3632_real_node__T_3643_addr = 1'h0;
  assign _T_3632_real_node__T_3643_mask = 1'h1;
  assign _T_3632_real_node__T_3643_en = io_in_valid;
  assign _T_3632_imaginary_node__T_3651_en = 1'h1;
  assign _T_3632_imaginary_node__T_3651_addr = 1'h0;
  assign _T_3632_imaginary_node__T_3651_data = _T_3632_imaginary_node[_T_3632_imaginary_node__T_3651_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3632_imaginary_node__T_3643_data = _T_2122_imaginary_node__T_2141_data;
  assign _T_3632_imaginary_node__T_3643_addr = 1'h0;
  assign _T_3632_imaginary_node__T_3643_mask = 1'h1;
  assign _T_3632_imaginary_node__T_3643_en = io_in_valid;
  assign _T_3737__T_3744_en = 1'h1;
  assign _T_3737__T_3744_addr = 1'h0;
  assign _T_3737__T_3744_data = _T_3737[_T_3737__T_3744_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3737__T_3742_data = _T_638__T_645_data;
  assign _T_3737__T_3742_addr = 1'h0;
  assign _T_3737__T_3742_mask = 1'h1;
  assign _T_3737__T_3742_en = io_in_valid;
  assign _T_3877_real_node__T_3896_en = 1'h1;
  assign _T_3877_real_node__T_3896_addr = 1'h0;
  assign _T_3877_real_node__T_3896_data = _T_3877_real_node[_T_3877_real_node__T_3896_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3877_real_node__T_3888_data = _T_3748[0] ? _T_3693_1_real_node : stage_outputs_1_0_real_node;
  assign _T_3877_real_node__T_3888_addr = 1'h0;
  assign _T_3877_real_node__T_3888_mask = 1'h1;
  assign _T_3877_real_node__T_3888_en = io_in_valid;
  assign _T_3877_imaginary_node__T_3896_en = 1'h1;
  assign _T_3877_imaginary_node__T_3896_addr = 1'h0;
  assign _T_3877_imaginary_node__T_3896_data = _T_3877_imaginary_node[_T_3877_imaginary_node__T_3896_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3877_imaginary_node__T_3888_data = _T_3748[0] ? _T_3693_1_imaginary_node : stage_outputs_1_0_imaginary_node;
  assign _T_3877_imaginary_node__T_3888_addr = 1'h0;
  assign _T_3877_imaginary_node__T_3888_mask = 1'h1;
  assign _T_3877_imaginary_node__T_3888_en = io_in_valid;
  assign _T_3911_real_node__T_3930_en = 1'h1;
  assign _T_3911_real_node__T_3930_addr = 1'h0;
  assign _T_3911_real_node__T_3930_data = _T_3911_real_node[_T_3911_real_node__T_3930_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3911_real_node__T_3922_data = _T_2614_real_node__T_2633_data;
  assign _T_3911_real_node__T_3922_addr = 1'h0;
  assign _T_3911_real_node__T_3922_mask = 1'h1;
  assign _T_3911_real_node__T_3922_en = io_in_valid;
  assign _T_3911_imaginary_node__T_3930_en = 1'h1;
  assign _T_3911_imaginary_node__T_3930_addr = 1'h0;
  assign _T_3911_imaginary_node__T_3930_data = _T_3911_imaginary_node[_T_3911_imaginary_node__T_3930_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_3911_imaginary_node__T_3922_data = _T_2614_imaginary_node__T_2633_data;
  assign _T_3911_imaginary_node__T_3922_addr = 1'h0;
  assign _T_3911_imaginary_node__T_3922_mask = 1'h1;
  assign _T_3911_imaginary_node__T_3922_en = io_in_valid;
  assign _T_4016__T_4023_en = 1'h1;
  assign _T_4016__T_4023_addr = 1'h0;
  assign _T_4016__T_4023_data = _T_4016[_T_4016__T_4023_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4016__T_4021_data = _T_638__T_645_data;
  assign _T_4016__T_4021_addr = 1'h0;
  assign _T_4016__T_4021_mask = 1'h1;
  assign _T_4016__T_4021_en = io_in_valid;
  assign _T_4156_real_node__T_4175_en = 1'h1;
  assign _T_4156_real_node__T_4175_addr = 1'h0;
  assign _T_4156_real_node__T_4175_data = _T_4156_real_node[_T_4156_real_node__T_4175_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4156_real_node__T_4167_data = _T_4027[0] ? _T_3972_1_real_node : stage_outputs_1_2_real_node;
  assign _T_4156_real_node__T_4167_addr = 1'h0;
  assign _T_4156_real_node__T_4167_mask = 1'h1;
  assign _T_4156_real_node__T_4167_en = io_in_valid;
  assign _T_4156_imaginary_node__T_4175_en = 1'h1;
  assign _T_4156_imaginary_node__T_4175_addr = 1'h0;
  assign _T_4156_imaginary_node__T_4175_data = _T_4156_imaginary_node[_T_4156_imaginary_node__T_4175_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4156_imaginary_node__T_4167_data = _T_4027[0] ? _T_3972_1_imaginary_node : stage_outputs_1_2_imaginary_node;
  assign _T_4156_imaginary_node__T_4167_addr = 1'h0;
  assign _T_4156_imaginary_node__T_4167_mask = 1'h1;
  assign _T_4156_imaginary_node__T_4167_en = io_in_valid;
  assign _T_4190_real_node__T_4209_en = 1'h1;
  assign _T_4190_real_node__T_4209_addr = 1'h0;
  assign _T_4190_real_node__T_4209_data = _T_4190_real_node[_T_4190_real_node__T_4209_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4190_real_node__T_4201_data = _T_3106_real_node__T_3125_data;
  assign _T_4190_real_node__T_4201_addr = 1'h0;
  assign _T_4190_real_node__T_4201_mask = 1'h1;
  assign _T_4190_real_node__T_4201_en = io_in_valid;
  assign _T_4190_imaginary_node__T_4209_en = 1'h1;
  assign _T_4190_imaginary_node__T_4209_addr = 1'h0;
  assign _T_4190_imaginary_node__T_4209_data = _T_4190_imaginary_node[_T_4190_imaginary_node__T_4209_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4190_imaginary_node__T_4201_data = _T_3106_imaginary_node__T_3125_data;
  assign _T_4190_imaginary_node__T_4201_addr = 1'h0;
  assign _T_4190_imaginary_node__T_4201_mask = 1'h1;
  assign _T_4190_imaginary_node__T_4201_en = io_in_valid;
  assign _T_4295__T_4302_en = 1'h1;
  assign _T_4295__T_4302_addr = 1'h0;
  assign _T_4295__T_4302_data = _T_4295[_T_4295__T_4302_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4295__T_4300_data = _T_638__T_645_data;
  assign _T_4295__T_4300_addr = 1'h0;
  assign _T_4295__T_4300_mask = 1'h1;
  assign _T_4295__T_4300_en = io_in_valid;
  assign _T_4435_real_node__T_4454_en = 1'h1;
  assign _T_4435_real_node__T_4454_addr = 1'h0;
  assign _T_4435_real_node__T_4454_data = _T_4435_real_node[_T_4435_real_node__T_4454_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4435_real_node__T_4446_data = _T_4306[0] ? _T_4251_1_real_node : stage_outputs_1_4_real_node;
  assign _T_4435_real_node__T_4446_addr = 1'h0;
  assign _T_4435_real_node__T_4446_mask = 1'h1;
  assign _T_4435_real_node__T_4446_en = io_in_valid;
  assign _T_4435_imaginary_node__T_4454_en = 1'h1;
  assign _T_4435_imaginary_node__T_4454_addr = 1'h0;
  assign _T_4435_imaginary_node__T_4454_data = _T_4435_imaginary_node[_T_4435_imaginary_node__T_4454_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4435_imaginary_node__T_4446_data = _T_4306[0] ? _T_4251_1_imaginary_node : stage_outputs_1_4_imaginary_node;
  assign _T_4435_imaginary_node__T_4446_addr = 1'h0;
  assign _T_4435_imaginary_node__T_4446_mask = 1'h1;
  assign _T_4435_imaginary_node__T_4446_en = io_in_valid;
  assign _T_4469_real_node__T_4488_en = 1'h1;
  assign _T_4469_real_node__T_4488_addr = 1'h0;
  assign _T_4469_real_node__T_4488_data = _T_4469_real_node[_T_4469_real_node__T_4488_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4469_real_node__T_4480_data = _T_3598_real_node__T_3617_data;
  assign _T_4469_real_node__T_4480_addr = 1'h0;
  assign _T_4469_real_node__T_4480_mask = 1'h1;
  assign _T_4469_real_node__T_4480_en = io_in_valid;
  assign _T_4469_imaginary_node__T_4488_en = 1'h1;
  assign _T_4469_imaginary_node__T_4488_addr = 1'h0;
  assign _T_4469_imaginary_node__T_4488_data = _T_4469_imaginary_node[_T_4469_imaginary_node__T_4488_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4469_imaginary_node__T_4480_data = _T_3598_imaginary_node__T_3617_data;
  assign _T_4469_imaginary_node__T_4480_addr = 1'h0;
  assign _T_4469_imaginary_node__T_4480_mask = 1'h1;
  assign _T_4469_imaginary_node__T_4480_en = io_in_valid;
  assign _T_4574__T_4581_en = 1'h1;
  assign _T_4574__T_4581_addr = 1'h0;
  assign _T_4574__T_4581_data = _T_4574[_T_4574__T_4581_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4574__T_4579_data = _T_638__T_645_data;
  assign _T_4574__T_4579_addr = 1'h0;
  assign _T_4574__T_4579_mask = 1'h1;
  assign _T_4574__T_4579_en = io_in_valid;
  assign _T_4714_real_node__T_4733_en = 1'h1;
  assign _T_4714_real_node__T_4733_addr = 1'h0;
  assign _T_4714_real_node__T_4733_data = _T_4714_real_node[_T_4714_real_node__T_4733_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4714_real_node__T_4725_data = _T_4585[0] ? _T_4530_1_real_node : stage_outputs_1_6_real_node;
  assign _T_4714_real_node__T_4725_addr = 1'h0;
  assign _T_4714_real_node__T_4725_mask = 1'h1;
  assign _T_4714_real_node__T_4725_en = io_in_valid;
  assign _T_4714_imaginary_node__T_4733_en = 1'h1;
  assign _T_4714_imaginary_node__T_4733_addr = 1'h0;
  assign _T_4714_imaginary_node__T_4733_data = _T_4714_imaginary_node[_T_4714_imaginary_node__T_4733_addr]; // @[FFTUtilities.scala 169:21]
  assign _T_4714_imaginary_node__T_4725_data = _T_4585[0] ? _T_4530_1_imaginary_node : stage_outputs_1_6_imaginary_node;
  assign _T_4714_imaginary_node__T_4725_addr = 1'h0;
  assign _T_4714_imaginary_node__T_4725_mask = 1'h1;
  assign _T_4714_imaginary_node__T_4725_en = io_in_valid;
  assign io_out_valid = io_in_valid; // @[FFT.scala 99:16]
  assign io_out_bits_0_real_node = _T_3877_real_node__T_3896_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_0_imaginary_node = _T_3877_imaginary_node__T_3896_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_1_real_node = _T_3767 ? _T_3693_1_real_node : stage_outputs_1_0_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_1_imaginary_node = _T_3767 ? _T_3693_1_imaginary_node : stage_outputs_1_0_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_2_real_node = _T_4156_real_node__T_4175_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_2_imaginary_node = _T_4156_imaginary_node__T_4175_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_3_real_node = _T_4046 ? _T_3972_1_real_node : stage_outputs_1_2_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_3_imaginary_node = _T_4046 ? _T_3972_1_imaginary_node : stage_outputs_1_2_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_4_real_node = _T_4435_real_node__T_4454_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_4_imaginary_node = _T_4435_imaginary_node__T_4454_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_5_real_node = _T_4325 ? _T_4251_1_real_node : stage_outputs_1_4_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_5_imaginary_node = _T_4325 ? _T_4251_1_imaginary_node : stage_outputs_1_4_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_6_real_node = _T_4714_real_node__T_4733_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_6_imaginary_node = _T_4714_imaginary_node__T_4733_data; // @[FFT.scala 120:78 FFT.scala 134:175]
  assign io_out_bits_7_real_node = _T_4604 ? _T_4530_1_real_node : stage_outputs_1_6_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_bits_7_imaginary_node = _T_4604 ? _T_4530_1_imaginary_node : stage_outputs_1_6_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign io_out_sync = _T_638__T_645_data; // @[FFT.scala 95:49 FFT.scala 97:89]
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
  assign BBFMultiply_52_1_in1 = _T_633 ? _T_2217_1_real_node : io_in_bits_2_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_53_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_53_1_in1 = _T_633 ? _T_2217_1_imaginary_node : io_in_bits_2_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_46_1_in2 = BBFMultiply_53_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_46_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_78_1_in2 = BBFSubtract_46_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_78_1_in1 = BBFMultiply_52_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_54_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_54_1_in1 = _T_633 ? _T_2217_1_real_node : io_in_bits_2_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_55_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_55_1_in1 = _T_633 ? _T_2217_1_imaginary_node : io_in_bits_2_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_79_1_in2 = BBFMultiply_55_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_79_1_in1 = BBFMultiply_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_80_1_in2 = BBFAdd_78_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_80_1_in1 = _T_2391_real_node__T_2410_data; // @[DspReal.scala 81:21]
  assign BBFAdd_81_1_in2 = BBFAdd_79_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_81_1_in1 = _T_2391_imaginary_node__T_2410_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_47_1_in2 = BBFAdd_78_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_47_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_48_1_in2 = BBFAdd_79_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_48_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_82_1_in2 = BBFSubtract_47_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_82_1_in1 = _T_2391_real_node__T_2410_data; // @[DspReal.scala 81:21]
  assign BBFAdd_83_1_in2 = BBFSubtract_48_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_83_1_in1 = _T_2391_imaginary_node__T_2410_data; // @[DspReal.scala 81:21]
  assign BBFMultiply_56_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_56_1_in1 = _T_633 ? _T_2709_1_real_node : io_in_bits_4_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_57_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_57_1_in1 = _T_633 ? _T_2709_1_imaginary_node : io_in_bits_4_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_49_1_in2 = BBFMultiply_57_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_49_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_84_1_in2 = BBFSubtract_49_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_84_1_in1 = BBFMultiply_56_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_58_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_58_1_in1 = _T_633 ? _T_2709_1_real_node : io_in_bits_4_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_59_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_59_1_in1 = _T_633 ? _T_2709_1_imaginary_node : io_in_bits_4_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_85_1_in2 = BBFMultiply_59_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_85_1_in1 = BBFMultiply_58_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_86_1_in2 = BBFAdd_84_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_86_1_in1 = _T_2883_real_node__T_2902_data; // @[DspReal.scala 81:21]
  assign BBFAdd_87_1_in2 = BBFAdd_85_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_87_1_in1 = _T_2883_imaginary_node__T_2902_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_50_1_in2 = BBFAdd_84_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_50_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_51_1_in2 = BBFAdd_85_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_51_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_88_1_in2 = BBFSubtract_50_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_88_1_in1 = _T_2883_real_node__T_2902_data; // @[DspReal.scala 81:21]
  assign BBFAdd_89_1_in2 = BBFSubtract_51_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_89_1_in1 = _T_2883_imaginary_node__T_2902_data; // @[DspReal.scala 81:21]
  assign BBFMultiply_60_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_60_1_in1 = _T_633 ? _T_3201_1_real_node : io_in_bits_6_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_61_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_61_1_in1 = _T_633 ? _T_3201_1_imaginary_node : io_in_bits_6_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFSubtract_52_1_in2 = BBFMultiply_61_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_52_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_90_1_in2 = BBFSubtract_52_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_90_1_in1 = BBFMultiply_60_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFMultiply_62_1_in2 = 64'h8000000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_62_1_in1 = _T_633 ? _T_3201_1_real_node : io_in_bits_6_real_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFMultiply_63_1_in2 = 64'h3ff0000000000000; // @[FFT.scala 113:19 FFT.scala 113:19]
  assign BBFMultiply_63_1_in1 = _T_633 ? _T_3201_1_imaginary_node : io_in_bits_6_imaginary_node; // @[FFTUtilities.scala 87:8 FFTUtilities.scala 87:8]
  assign BBFAdd_91_1_in2 = BBFMultiply_63_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_91_1_in1 = BBFMultiply_62_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_92_1_in2 = BBFAdd_90_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_92_1_in1 = _T_3375_real_node__T_3394_data; // @[DspReal.scala 81:21]
  assign BBFAdd_93_1_in2 = BBFAdd_91_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_93_1_in1 = _T_3375_imaginary_node__T_3394_data; // @[DspReal.scala 81:21]
  assign BBFSubtract_53_1_in2 = BBFAdd_90_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_53_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFSubtract_54_1_in2 = BBFAdd_91_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFSubtract_54_1_in1 = 64'h0; // @[DspReal.scala 165:19 DspReal.scala 166:14]
  assign BBFAdd_94_1_in2 = BBFSubtract_53_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_94_1_in1 = _T_3375_real_node__T_3394_data; // @[DspReal.scala 81:21]
  assign BBFAdd_95_1_in2 = BBFSubtract_54_1_out; // @[DspReal.scala 83:19 DspReal.scala 84:14]
  assign BBFAdd_95_1_in1 = _T_3375_imaginary_node__T_3394_data; // @[DspReal.scala 81:21]
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
    if (_T_2122_real_node__T_2133_en & _T_2122_real_node__T_2133_mask) begin
      _T_2122_real_node[_T_2122_real_node__T_2133_addr] <= _T_2122_real_node__T_2133_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2122_imaginary_node__T_2133_en & _T_2122_imaginary_node__T_2133_mask) begin
      _T_2122_imaginary_node[_T_2122_imaginary_node__T_2133_addr] <= _T_2122_imaginary_node__T_2133_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2156_real_node__T_2167_en & _T_2156_real_node__T_2167_mask) begin
      _T_2156_real_node[_T_2156_real_node__T_2167_addr] <= _T_2156_real_node__T_2167_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2156_imaginary_node__T_2167_en & _T_2156_imaginary_node__T_2167_mask) begin
      _T_2156_imaginary_node[_T_2156_imaginary_node__T_2167_addr] <= _T_2156_imaginary_node__T_2167_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2391_real_node__T_2402_en & _T_2391_real_node__T_2402_mask) begin
      _T_2391_real_node[_T_2391_real_node__T_2402_addr] <= _T_2391_real_node__T_2402_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2391_imaginary_node__T_2402_en & _T_2391_imaginary_node__T_2402_mask) begin
      _T_2391_imaginary_node[_T_2391_imaginary_node__T_2402_addr] <= _T_2391_imaginary_node__T_2402_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2580_real_node__T_2591_en & _T_2580_real_node__T_2591_mask) begin
      _T_2580_real_node[_T_2580_real_node__T_2591_addr] <= _T_2580_real_node__T_2591_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2580_imaginary_node__T_2591_en & _T_2580_imaginary_node__T_2591_mask) begin
      _T_2580_imaginary_node[_T_2580_imaginary_node__T_2591_addr] <= _T_2580_imaginary_node__T_2591_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2614_real_node__T_2625_en & _T_2614_real_node__T_2625_mask) begin
      _T_2614_real_node[_T_2614_real_node__T_2625_addr] <= _T_2614_real_node__T_2625_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2614_imaginary_node__T_2625_en & _T_2614_imaginary_node__T_2625_mask) begin
      _T_2614_imaginary_node[_T_2614_imaginary_node__T_2625_addr] <= _T_2614_imaginary_node__T_2625_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2648_real_node__T_2659_en & _T_2648_real_node__T_2659_mask) begin
      _T_2648_real_node[_T_2648_real_node__T_2659_addr] <= _T_2648_real_node__T_2659_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2648_imaginary_node__T_2659_en & _T_2648_imaginary_node__T_2659_mask) begin
      _T_2648_imaginary_node[_T_2648_imaginary_node__T_2659_addr] <= _T_2648_imaginary_node__T_2659_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2883_real_node__T_2894_en & _T_2883_real_node__T_2894_mask) begin
      _T_2883_real_node[_T_2883_real_node__T_2894_addr] <= _T_2883_real_node__T_2894_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_2883_imaginary_node__T_2894_en & _T_2883_imaginary_node__T_2894_mask) begin
      _T_2883_imaginary_node[_T_2883_imaginary_node__T_2894_addr] <= _T_2883_imaginary_node__T_2894_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3072_real_node__T_3083_en & _T_3072_real_node__T_3083_mask) begin
      _T_3072_real_node[_T_3072_real_node__T_3083_addr] <= _T_3072_real_node__T_3083_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3072_imaginary_node__T_3083_en & _T_3072_imaginary_node__T_3083_mask) begin
      _T_3072_imaginary_node[_T_3072_imaginary_node__T_3083_addr] <= _T_3072_imaginary_node__T_3083_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3106_real_node__T_3117_en & _T_3106_real_node__T_3117_mask) begin
      _T_3106_real_node[_T_3106_real_node__T_3117_addr] <= _T_3106_real_node__T_3117_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3106_imaginary_node__T_3117_en & _T_3106_imaginary_node__T_3117_mask) begin
      _T_3106_imaginary_node[_T_3106_imaginary_node__T_3117_addr] <= _T_3106_imaginary_node__T_3117_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3140_real_node__T_3151_en & _T_3140_real_node__T_3151_mask) begin
      _T_3140_real_node[_T_3140_real_node__T_3151_addr] <= _T_3140_real_node__T_3151_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3140_imaginary_node__T_3151_en & _T_3140_imaginary_node__T_3151_mask) begin
      _T_3140_imaginary_node[_T_3140_imaginary_node__T_3151_addr] <= _T_3140_imaginary_node__T_3151_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3375_real_node__T_3386_en & _T_3375_real_node__T_3386_mask) begin
      _T_3375_real_node[_T_3375_real_node__T_3386_addr] <= _T_3375_real_node__T_3386_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3375_imaginary_node__T_3386_en & _T_3375_imaginary_node__T_3386_mask) begin
      _T_3375_imaginary_node[_T_3375_imaginary_node__T_3386_addr] <= _T_3375_imaginary_node__T_3386_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3564_real_node__T_3575_en & _T_3564_real_node__T_3575_mask) begin
      _T_3564_real_node[_T_3564_real_node__T_3575_addr] <= _T_3564_real_node__T_3575_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3564_imaginary_node__T_3575_en & _T_3564_imaginary_node__T_3575_mask) begin
      _T_3564_imaginary_node[_T_3564_imaginary_node__T_3575_addr] <= _T_3564_imaginary_node__T_3575_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3598_real_node__T_3609_en & _T_3598_real_node__T_3609_mask) begin
      _T_3598_real_node[_T_3598_real_node__T_3609_addr] <= _T_3598_real_node__T_3609_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3598_imaginary_node__T_3609_en & _T_3598_imaginary_node__T_3609_mask) begin
      _T_3598_imaginary_node[_T_3598_imaginary_node__T_3609_addr] <= _T_3598_imaginary_node__T_3609_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3632_real_node__T_3643_en & _T_3632_real_node__T_3643_mask) begin
      _T_3632_real_node[_T_3632_real_node__T_3643_addr] <= _T_3632_real_node__T_3643_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3632_imaginary_node__T_3643_en & _T_3632_imaginary_node__T_3643_mask) begin
      _T_3632_imaginary_node[_T_3632_imaginary_node__T_3643_addr] <= _T_3632_imaginary_node__T_3643_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3737__T_3742_en & _T_3737__T_3742_mask) begin
      _T_3737[_T_3737__T_3742_addr] <= _T_3737__T_3742_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3877_real_node__T_3888_en & _T_3877_real_node__T_3888_mask) begin
      _T_3877_real_node[_T_3877_real_node__T_3888_addr] <= _T_3877_real_node__T_3888_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3877_imaginary_node__T_3888_en & _T_3877_imaginary_node__T_3888_mask) begin
      _T_3877_imaginary_node[_T_3877_imaginary_node__T_3888_addr] <= _T_3877_imaginary_node__T_3888_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3911_real_node__T_3922_en & _T_3911_real_node__T_3922_mask) begin
      _T_3911_real_node[_T_3911_real_node__T_3922_addr] <= _T_3911_real_node__T_3922_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_3911_imaginary_node__T_3922_en & _T_3911_imaginary_node__T_3922_mask) begin
      _T_3911_imaginary_node[_T_3911_imaginary_node__T_3922_addr] <= _T_3911_imaginary_node__T_3922_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4016__T_4021_en & _T_4016__T_4021_mask) begin
      _T_4016[_T_4016__T_4021_addr] <= _T_4016__T_4021_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4156_real_node__T_4167_en & _T_4156_real_node__T_4167_mask) begin
      _T_4156_real_node[_T_4156_real_node__T_4167_addr] <= _T_4156_real_node__T_4167_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4156_imaginary_node__T_4167_en & _T_4156_imaginary_node__T_4167_mask) begin
      _T_4156_imaginary_node[_T_4156_imaginary_node__T_4167_addr] <= _T_4156_imaginary_node__T_4167_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4190_real_node__T_4201_en & _T_4190_real_node__T_4201_mask) begin
      _T_4190_real_node[_T_4190_real_node__T_4201_addr] <= _T_4190_real_node__T_4201_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4190_imaginary_node__T_4201_en & _T_4190_imaginary_node__T_4201_mask) begin
      _T_4190_imaginary_node[_T_4190_imaginary_node__T_4201_addr] <= _T_4190_imaginary_node__T_4201_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4295__T_4300_en & _T_4295__T_4300_mask) begin
      _T_4295[_T_4295__T_4300_addr] <= _T_4295__T_4300_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4435_real_node__T_4446_en & _T_4435_real_node__T_4446_mask) begin
      _T_4435_real_node[_T_4435_real_node__T_4446_addr] <= _T_4435_real_node__T_4446_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4435_imaginary_node__T_4446_en & _T_4435_imaginary_node__T_4446_mask) begin
      _T_4435_imaginary_node[_T_4435_imaginary_node__T_4446_addr] <= _T_4435_imaginary_node__T_4446_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4469_real_node__T_4480_en & _T_4469_real_node__T_4480_mask) begin
      _T_4469_real_node[_T_4469_real_node__T_4480_addr] <= _T_4469_real_node__T_4480_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4469_imaginary_node__T_4480_en & _T_4469_imaginary_node__T_4480_mask) begin
      _T_4469_imaginary_node[_T_4469_imaginary_node__T_4480_addr] <= _T_4469_imaginary_node__T_4480_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4574__T_4579_en & _T_4574__T_4579_mask) begin
      _T_4574[_T_4574__T_4579_addr] <= _T_4574__T_4579_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4714_real_node__T_4725_en & _T_4714_real_node__T_4725_mask) begin
      _T_4714_real_node[_T_4714_real_node__T_4725_addr] <= _T_4714_real_node__T_4725_data; // @[FFTUtilities.scala 169:21]
    end
    if (_T_4714_imaginary_node__T_4725_en & _T_4714_imaginary_node__T_4725_mask) begin
      _T_4714_imaginary_node[_T_4714_imaginary_node__T_4725_addr] <= _T_4714_imaginary_node__T_4725_data; // @[FFTUtilities.scala 169:21]
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
    _T_2122_real_node[initvar] = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2122_imaginary_node[initvar] = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2156_real_node[initvar] = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2156_imaginary_node[initvar] = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2391_real_node[initvar] = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2391_imaginary_node[initvar] = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2580_real_node[initvar] = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2580_imaginary_node[initvar] = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2614_real_node[initvar] = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2614_imaginary_node[initvar] = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2648_real_node[initvar] = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2648_imaginary_node[initvar] = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2883_real_node[initvar] = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_2883_imaginary_node[initvar] = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3072_real_node[initvar] = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3072_imaginary_node[initvar] = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3106_real_node[initvar] = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3106_imaginary_node[initvar] = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3140_real_node[initvar] = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3140_imaginary_node[initvar] = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3375_real_node[initvar] = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3375_imaginary_node[initvar] = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3564_real_node[initvar] = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3564_imaginary_node[initvar] = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3598_real_node[initvar] = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3598_imaginary_node[initvar] = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3632_real_node[initvar] = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3632_imaginary_node[initvar] = _RAND_34[63:0];
  _RAND_35 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3737[initvar] = _RAND_35[0:0];
  _RAND_36 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3877_real_node[initvar] = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3877_imaginary_node[initvar] = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3911_real_node[initvar] = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_3911_imaginary_node[initvar] = _RAND_39[63:0];
  _RAND_40 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4016[initvar] = _RAND_40[0:0];
  _RAND_41 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4156_real_node[initvar] = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4156_imaginary_node[initvar] = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4190_real_node[initvar] = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4190_imaginary_node[initvar] = _RAND_44[63:0];
  _RAND_45 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4295[initvar] = _RAND_45[0:0];
  _RAND_46 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4435_real_node[initvar] = _RAND_46[63:0];
  _RAND_47 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4435_imaginary_node[initvar] = _RAND_47[63:0];
  _RAND_48 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4469_real_node[initvar] = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4469_imaginary_node[initvar] = _RAND_49[63:0];
  _RAND_50 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4574[initvar] = _RAND_50[0:0];
  _RAND_51 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4714_real_node[initvar] = _RAND_51[63:0];
  _RAND_52 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_4714_imaginary_node[initvar] = _RAND_52[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  sync_0 = _RAND_53[0:0];
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
