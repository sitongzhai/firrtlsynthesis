module FloatOpsWithTrig(
    input clock,
    input reset,
    input [63:0] io_in1_node,
    input [63:0] io_in2_node,
    input [63:0] io_opsel,
    output [63:0] io_out_node,
    output io_boolOut
);
    wire _T_11;
    wire [63:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_1 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_2 (
        .y(_T_11),
        .a(_WTEMP_0),
        .b(io_opsel)
    );
    wire [63:0] _BBFAdd__out;
    wire [63:0] _BBFAdd__in2;
    wire [63:0] _BBFAdd__in1;
    BBFAdd BBFAdd (
        .out(_BBFAdd__out),
        .in2(_BBFAdd__in2),
        .in1(_BBFAdd__in1)
    );
    wire [63:0] _T_14_node;
    wire [63:0] _GEN_0;
    assign _GEN_0 = _T_14_node;
    wire _T_17;
    wire [63:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_4 (
        .y(_T_17),
        .a(_WTEMP_1),
        .b(io_opsel)
    );
    wire [63:0] _BBFSubtract__out;
    wire [63:0] _BBFSubtract__in2;
    wire [63:0] _BBFSubtract__in1;
    BBFSubtract BBFSubtract (
        .out(_BBFSubtract__out),
        .in2(_BBFSubtract__in2),
        .in1(_BBFSubtract__in1)
    );
    wire [63:0] _T_20_node;
    wire [63:0] _GEN_1;
    MUX_UNSIGNED #(.width(64)) u_mux_5 (
        .y(_GEN_1),
        .sel(_T_17),
        .a(_T_20_node),
        .b(_GEN_0)
    );
    wire _T_23;
    wire [63:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(2), .n(64)) u_pad_6 (
        .y(_WTEMP_2),
        .in(2'h2)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_7 (
        .y(_T_23),
        .a(_WTEMP_2),
        .b(io_opsel)
    );
    wire [63:0] _BBFMultiply__out;
    wire [63:0] _BBFMultiply__in2;
    wire [63:0] _BBFMultiply__in1;
    BBFMultiply BBFMultiply (
        .out(_BBFMultiply__out),
        .in2(_BBFMultiply__in2),
        .in1(_BBFMultiply__in1)
    );
    wire [63:0] _T_26_node;
    wire [63:0] _GEN_2;
    MUX_UNSIGNED #(.width(64)) u_mux_8 (
        .y(_GEN_2),
        .sel(_T_23),
        .a(_T_26_node),
        .b(_GEN_1)
    );
    wire _T_29;
    wire [63:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(2), .n(64)) u_pad_9 (
        .y(_WTEMP_3),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_10 (
        .y(_T_29),
        .a(_WTEMP_3),
        .b(io_opsel)
    );
    wire [63:0] _BBFDivide__out;
    wire [63:0] _BBFDivide__in2;
    wire [63:0] _BBFDivide__in1;
    BBFDivide BBFDivide (
        .out(_BBFDivide__out),
        .in2(_BBFDivide__in2),
        .in1(_BBFDivide__in1)
    );
    wire [63:0] _T_32_node;
    wire [63:0] _GEN_3;
    MUX_UNSIGNED #(.width(64)) u_mux_11 (
        .y(_GEN_3),
        .sel(_T_29),
        .a(_T_32_node),
        .b(_GEN_2)
    );
    wire _T_35;
    wire [63:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_12 (
        .y(_WTEMP_4),
        .in(3'h4)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_13 (
        .y(_T_35),
        .a(_WTEMP_4),
        .b(io_opsel)
    );
    wire [63:0] _BBFLn__out;
    wire [63:0] _BBFLn__in;
    BBFLn BBFLn (
        .out(_BBFLn__out),
        .in(_BBFLn__in)
    );
    wire [63:0] _T_38_node;
    wire [63:0] _GEN_4;
    MUX_UNSIGNED #(.width(64)) u_mux_14 (
        .y(_GEN_4),
        .sel(_T_35),
        .a(_T_38_node),
        .b(_GEN_3)
    );
    wire _T_41;
    wire [63:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_15 (
        .y(_WTEMP_5),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_16 (
        .y(_T_41),
        .a(_WTEMP_5),
        .b(io_opsel)
    );
    wire [63:0] _BBFLog10__out;
    wire [63:0] _BBFLog10__in;
    BBFLog10 BBFLog10 (
        .out(_BBFLog10__out),
        .in(_BBFLog10__in)
    );
    wire [63:0] _T_44_node;
    wire [63:0] _GEN_5;
    MUX_UNSIGNED #(.width(64)) u_mux_17 (
        .y(_GEN_5),
        .sel(_T_41),
        .a(_T_44_node),
        .b(_GEN_4)
    );
    wire _T_47;
    wire [63:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_18 (
        .y(_WTEMP_6),
        .in(3'h6)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_19 (
        .y(_T_47),
        .a(_WTEMP_6),
        .b(io_opsel)
    );
    wire [63:0] _BBFExp__out;
    wire [63:0] _BBFExp__in;
    BBFExp BBFExp (
        .out(_BBFExp__out),
        .in(_BBFExp__in)
    );
    wire [63:0] _T_50_node;
    wire [63:0] _GEN_6;
    MUX_UNSIGNED #(.width(64)) u_mux_20 (
        .y(_GEN_6),
        .sel(_T_47),
        .a(_T_50_node),
        .b(_GEN_5)
    );
    wire _T_53;
    wire [63:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_21 (
        .y(_WTEMP_7),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_22 (
        .y(_T_53),
        .a(_WTEMP_7),
        .b(io_opsel)
    );
    wire [63:0] _BBFSqrt__out;
    wire [63:0] _BBFSqrt__in;
    BBFSqrt BBFSqrt (
        .out(_BBFSqrt__out),
        .in(_BBFSqrt__in)
    );
    wire [63:0] _T_56_node;
    wire [63:0] _GEN_7;
    MUX_UNSIGNED #(.width(64)) u_mux_23 (
        .y(_GEN_7),
        .sel(_T_53),
        .a(_T_56_node),
        .b(_GEN_6)
    );
    wire _T_59;
    wire [63:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_24 (
        .y(_WTEMP_8),
        .in(4'h8)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_25 (
        .y(_T_59),
        .a(_WTEMP_8),
        .b(io_opsel)
    );
    wire [63:0] _BBFPow__out;
    wire [63:0] _BBFPow__in2;
    wire [63:0] _BBFPow__in1;
    BBFPow BBFPow (
        .out(_BBFPow__out),
        .in2(_BBFPow__in2),
        .in1(_BBFPow__in1)
    );
    wire [63:0] _T_62_node;
    wire [63:0] _GEN_8;
    MUX_UNSIGNED #(.width(64)) u_mux_26 (
        .y(_GEN_8),
        .sel(_T_59),
        .a(_T_62_node),
        .b(_GEN_7)
    );
    wire _T_65;
    wire [63:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_27 (
        .y(_WTEMP_9),
        .in(4'h9)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_28 (
        .y(_T_65),
        .a(_WTEMP_9),
        .b(io_opsel)
    );
    wire [63:0] _BBFFloor__out;
    wire [63:0] _BBFFloor__in;
    BBFFloor BBFFloor (
        .out(_BBFFloor__out),
        .in(_BBFFloor__in)
    );
    wire [63:0] _T_68_node;
    wire [63:0] _GEN_9;
    MUX_UNSIGNED #(.width(64)) u_mux_29 (
        .y(_GEN_9),
        .sel(_T_65),
        .a(_T_68_node),
        .b(_GEN_8)
    );
    wire _T_71;
    wire [63:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_30 (
        .y(_WTEMP_10),
        .in(4'hA)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_31 (
        .y(_T_71),
        .a(_WTEMP_10),
        .b(io_opsel)
    );
    wire [63:0] _BBFCeil__out;
    wire [63:0] _BBFCeil__in;
    BBFCeil BBFCeil (
        .out(_BBFCeil__out),
        .in(_BBFCeil__in)
    );
    wire [63:0] _T_74_node;
    wire [63:0] _GEN_10;
    MUX_UNSIGNED #(.width(64)) u_mux_32 (
        .y(_GEN_10),
        .sel(_T_71),
        .a(_T_74_node),
        .b(_GEN_9)
    );
    wire _T_77;
    wire [63:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_33 (
        .y(_WTEMP_11),
        .in(5'h19)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_34 (
        .y(_T_77),
        .a(_WTEMP_11),
        .b(io_opsel)
    );
    wire _BBFGreaterThan__out;
    wire [63:0] _BBFGreaterThan__in2;
    wire [63:0] _BBFGreaterThan__in1;
    BBFGreaterThan BBFGreaterThan (
        .out(_BBFGreaterThan__out),
        .in2(_BBFGreaterThan__in2),
        .in1(_BBFGreaterThan__in1)
    );
    wire _T_80;
    wire _GEN_11;
    assign _GEN_11 = _T_80;
    wire _T_82;
    wire [63:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_35 (
        .y(_WTEMP_12),
        .in(5'h1A)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_36 (
        .y(_T_82),
        .a(_WTEMP_12),
        .b(io_opsel)
    );
    wire _BBFGreaterThanEquals__out;
    wire [63:0] _BBFGreaterThanEquals__in2;
    wire [63:0] _BBFGreaterThanEquals__in1;
    BBFGreaterThanEquals BBFGreaterThanEquals (
        .out(_BBFGreaterThanEquals__out),
        .in2(_BBFGreaterThanEquals__in2),
        .in1(_BBFGreaterThanEquals__in1)
    );
    wire _T_85;
    wire _GEN_12;
    MUX_UNSIGNED #(.width(1)) u_mux_37 (
        .y(_GEN_12),
        .sel(_T_82),
        .a(_T_85),
        .b(_GEN_11)
    );
    wire _T_87;
    wire [63:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_38 (
        .y(_WTEMP_13),
        .in(4'hB)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_39 (
        .y(_T_87),
        .a(_WTEMP_13),
        .b(io_opsel)
    );
    wire [63:0] _BBFSin__out;
    wire [63:0] _BBFSin__in;
    BBFSin BBFSin (
        .out(_BBFSin__out),
        .in(_BBFSin__in)
    );
    wire [63:0] _T_90_node;
    wire [63:0] _GEN_13;
    MUX_UNSIGNED #(.width(64)) u_mux_40 (
        .y(_GEN_13),
        .sel(_T_87),
        .a(_T_90_node),
        .b(_GEN_10)
    );
    wire _T_93;
    wire [63:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_41 (
        .y(_WTEMP_14),
        .in(4'hC)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_42 (
        .y(_T_93),
        .a(_WTEMP_14),
        .b(io_opsel)
    );
    wire [63:0] _BBFCos__out;
    wire [63:0] _BBFCos__in;
    BBFCos BBFCos (
        .out(_BBFCos__out),
        .in(_BBFCos__in)
    );
    wire [63:0] _T_96_node;
    wire [63:0] _GEN_14;
    MUX_UNSIGNED #(.width(64)) u_mux_43 (
        .y(_GEN_14),
        .sel(_T_93),
        .a(_T_96_node),
        .b(_GEN_13)
    );
    wire _T_99;
    wire [63:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_44 (
        .y(_WTEMP_15),
        .in(4'hD)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_45 (
        .y(_T_99),
        .a(_WTEMP_15),
        .b(io_opsel)
    );
    wire [63:0] _BBFTan__out;
    wire [63:0] _BBFTan__in;
    BBFTan BBFTan (
        .out(_BBFTan__out),
        .in(_BBFTan__in)
    );
    wire [63:0] _T_102_node;
    wire [63:0] _GEN_15;
    MUX_UNSIGNED #(.width(64)) u_mux_46 (
        .y(_GEN_15),
        .sel(_T_99),
        .a(_T_102_node),
        .b(_GEN_14)
    );
    wire _T_105;
    wire [63:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_47 (
        .y(_WTEMP_16),
        .in(4'hE)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_48 (
        .y(_T_105),
        .a(_WTEMP_16),
        .b(io_opsel)
    );
    wire [63:0] _BBFASin__out;
    wire [63:0] _BBFASin__in;
    BBFASin BBFASin (
        .out(_BBFASin__out),
        .in(_BBFASin__in)
    );
    wire [63:0] _T_108_node;
    wire [63:0] _GEN_16;
    MUX_UNSIGNED #(.width(64)) u_mux_49 (
        .y(_GEN_16),
        .sel(_T_105),
        .a(_T_108_node),
        .b(_GEN_15)
    );
    wire _T_111;
    wire [63:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_50 (
        .y(_WTEMP_17),
        .in(4'hF)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_51 (
        .y(_T_111),
        .a(_WTEMP_17),
        .b(io_opsel)
    );
    wire [63:0] _BBFACos__out;
    wire [63:0] _BBFACos__in;
    BBFACos BBFACos (
        .out(_BBFACos__out),
        .in(_BBFACos__in)
    );
    wire [63:0] _T_114_node;
    wire [63:0] _GEN_17;
    MUX_UNSIGNED #(.width(64)) u_mux_52 (
        .y(_GEN_17),
        .sel(_T_111),
        .a(_T_114_node),
        .b(_GEN_16)
    );
    wire _T_117;
    wire [63:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_53 (
        .y(_WTEMP_18),
        .in(5'h10)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_54 (
        .y(_T_117),
        .a(_WTEMP_18),
        .b(io_opsel)
    );
    wire [63:0] _BBFATan__out;
    wire [63:0] _BBFATan__in;
    BBFATan BBFATan (
        .out(_BBFATan__out),
        .in(_BBFATan__in)
    );
    wire [63:0] _T_120_node;
    wire [63:0] _GEN_18;
    MUX_UNSIGNED #(.width(64)) u_mux_55 (
        .y(_GEN_18),
        .sel(_T_117),
        .a(_T_120_node),
        .b(_GEN_17)
    );
    wire _T_123;
    wire [63:0] _WTEMP_19;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_56 (
        .y(_WTEMP_19),
        .in(5'h11)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_57 (
        .y(_T_123),
        .a(_WTEMP_19),
        .b(io_opsel)
    );
    wire [63:0] _BBFATan2__out;
    wire [63:0] _BBFATan2__in2;
    wire [63:0] _BBFATan2__in1;
    BBFATan2 BBFATan2 (
        .out(_BBFATan2__out),
        .in2(_BBFATan2__in2),
        .in1(_BBFATan2__in1)
    );
    wire [63:0] _T_126_node;
    wire [63:0] _GEN_19;
    MUX_UNSIGNED #(.width(64)) u_mux_58 (
        .y(_GEN_19),
        .sel(_T_123),
        .a(_T_126_node),
        .b(_GEN_18)
    );
    wire _T_129;
    wire [63:0] _WTEMP_20;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_59 (
        .y(_WTEMP_20),
        .in(5'h12)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_60 (
        .y(_T_129),
        .a(_WTEMP_20),
        .b(io_opsel)
    );
    wire [63:0] _BBFHypot__out;
    wire [63:0] _BBFHypot__in2;
    wire [63:0] _BBFHypot__in1;
    BBFHypot BBFHypot (
        .out(_BBFHypot__out),
        .in2(_BBFHypot__in2),
        .in1(_BBFHypot__in1)
    );
    wire [63:0] _T_132_node;
    wire [63:0] _GEN_20;
    MUX_UNSIGNED #(.width(64)) u_mux_61 (
        .y(_GEN_20),
        .sel(_T_129),
        .a(_T_132_node),
        .b(_GEN_19)
    );
    wire _T_135;
    wire [63:0] _WTEMP_21;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_62 (
        .y(_WTEMP_21),
        .in(5'h13)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_63 (
        .y(_T_135),
        .a(_WTEMP_21),
        .b(io_opsel)
    );
    wire [63:0] _BBFSinh__out;
    wire [63:0] _BBFSinh__in;
    BBFSinh BBFSinh (
        .out(_BBFSinh__out),
        .in(_BBFSinh__in)
    );
    wire [63:0] _T_138_node;
    wire [63:0] _GEN_21;
    MUX_UNSIGNED #(.width(64)) u_mux_64 (
        .y(_GEN_21),
        .sel(_T_135),
        .a(_T_138_node),
        .b(_GEN_20)
    );
    wire _T_141;
    wire [63:0] _WTEMP_22;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_65 (
        .y(_WTEMP_22),
        .in(5'h14)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_66 (
        .y(_T_141),
        .a(_WTEMP_22),
        .b(io_opsel)
    );
    wire [63:0] _BBFCosh__out;
    wire [63:0] _BBFCosh__in;
    BBFCosh BBFCosh (
        .out(_BBFCosh__out),
        .in(_BBFCosh__in)
    );
    wire [63:0] _T_144_node;
    wire [63:0] _GEN_22;
    MUX_UNSIGNED #(.width(64)) u_mux_67 (
        .y(_GEN_22),
        .sel(_T_141),
        .a(_T_144_node),
        .b(_GEN_21)
    );
    wire _T_147;
    wire [63:0] _WTEMP_23;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_68 (
        .y(_WTEMP_23),
        .in(5'h15)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_69 (
        .y(_T_147),
        .a(_WTEMP_23),
        .b(io_opsel)
    );
    wire [63:0] _BBFTanh__out;
    wire [63:0] _BBFTanh__in;
    BBFTanh BBFTanh (
        .out(_BBFTanh__out),
        .in(_BBFTanh__in)
    );
    wire [63:0] _T_150_node;
    wire [63:0] _GEN_23;
    MUX_UNSIGNED #(.width(64)) u_mux_70 (
        .y(_GEN_23),
        .sel(_T_147),
        .a(_T_150_node),
        .b(_GEN_22)
    );
    wire _T_153;
    wire [63:0] _WTEMP_24;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_71 (
        .y(_WTEMP_24),
        .in(5'h16)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_72 (
        .y(_T_153),
        .a(_WTEMP_24),
        .b(io_opsel)
    );
    wire [63:0] _BBFASinh__out;
    wire [63:0] _BBFASinh__in;
    BBFASinh BBFASinh (
        .out(_BBFASinh__out),
        .in(_BBFASinh__in)
    );
    wire [63:0] _T_156_node;
    wire [63:0] _GEN_24;
    MUX_UNSIGNED #(.width(64)) u_mux_73 (
        .y(_GEN_24),
        .sel(_T_153),
        .a(_T_156_node),
        .b(_GEN_23)
    );
    wire _T_159;
    wire [63:0] _WTEMP_25;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_74 (
        .y(_WTEMP_25),
        .in(5'h17)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_75 (
        .y(_T_159),
        .a(_WTEMP_25),
        .b(io_opsel)
    );
    wire [63:0] _BBFACosh__out;
    wire [63:0] _BBFACosh__in;
    BBFACosh BBFACosh (
        .out(_BBFACosh__out),
        .in(_BBFACosh__in)
    );
    wire [63:0] _T_162_node;
    wire [63:0] _GEN_25;
    MUX_UNSIGNED #(.width(64)) u_mux_76 (
        .y(_GEN_25),
        .sel(_T_159),
        .a(_T_162_node),
        .b(_GEN_24)
    );
    wire _T_165;
    wire [63:0] _WTEMP_26;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_77 (
        .y(_WTEMP_26),
        .in(5'h18)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_78 (
        .y(_T_165),
        .a(_WTEMP_26),
        .b(io_opsel)
    );
    wire [63:0] _BBFATanh__out;
    wire [63:0] _BBFATanh__in;
    BBFATanh BBFATanh (
        .out(_BBFATanh__out),
        .in(_BBFATanh__in)
    );
    wire [63:0] _T_168_node;
    wire [63:0] _GEN_26;
    MUX_UNSIGNED #(.width(64)) u_mux_79 (
        .y(_GEN_26),
        .sel(_T_165),
        .a(_T_168_node),
        .b(_GEN_25)
    );
    assign _BBFACos__in = io_in1_node;
    assign _BBFACosh__in = io_in1_node;
    assign _BBFASin__in = io_in1_node;
    assign _BBFASinh__in = io_in1_node;
    assign _BBFATan__in = io_in1_node;
    assign _BBFATan2__in1 = io_in1_node;
    assign _BBFATan2__in2 = io_in2_node;
    assign _BBFATanh__in = io_in1_node;
    assign _BBFAdd__in1 = io_in1_node;
    assign _BBFAdd__in2 = io_in2_node;
    assign _BBFCeil__in = io_in1_node;
    assign _BBFCos__in = io_in1_node;
    assign _BBFCosh__in = io_in1_node;
    assign _BBFDivide__in1 = io_in1_node;
    assign _BBFDivide__in2 = io_in2_node;
    assign _BBFExp__in = io_in1_node;
    assign _BBFFloor__in = io_in1_node;
    assign _BBFGreaterThan__in1 = io_in1_node;
    assign _BBFGreaterThan__in2 = io_in2_node;
    assign _BBFGreaterThanEquals__in1 = io_in1_node;
    assign _BBFGreaterThanEquals__in2 = io_in2_node;
    assign _BBFHypot__in1 = io_in1_node;
    assign _BBFHypot__in2 = io_in2_node;
    assign _BBFLn__in = io_in1_node;
    assign _BBFLog10__in = io_in1_node;
    assign _BBFMultiply__in1 = io_in1_node;
    assign _BBFMultiply__in2 = io_in2_node;
    assign _BBFPow__in1 = io_in1_node;
    assign _BBFPow__in2 = io_in2_node;
    assign _BBFSin__in = io_in1_node;
    assign _BBFSinh__in = io_in1_node;
    assign _BBFSqrt__in = io_in1_node;
    assign _BBFSubtract__in1 = io_in1_node;
    assign _BBFSubtract__in2 = io_in2_node;
    assign _BBFTan__in = io_in1_node;
    assign _BBFTanh__in = io_in1_node;
    assign _T_102_node = _BBFTan__out;
    assign _T_108_node = _BBFASin__out;
    assign _T_114_node = _BBFACos__out;
    assign _T_120_node = _BBFATan__out;
    assign _T_126_node = _BBFATan2__out;
    assign _T_132_node = _BBFHypot__out;
    assign _T_138_node = _BBFSinh__out;
    assign _T_144_node = _BBFCosh__out;
    assign _T_14_node = _BBFAdd__out;
    assign _T_150_node = _BBFTanh__out;
    assign _T_156_node = _BBFASinh__out;
    assign _T_162_node = _BBFACosh__out;
    assign _T_168_node = _BBFATanh__out;
    assign _T_20_node = _BBFSubtract__out;
    assign _T_26_node = _BBFMultiply__out;
    assign _T_32_node = _BBFDivide__out;
    assign _T_38_node = _BBFLn__out;
    assign _T_44_node = _BBFLog10__out;
    assign _T_50_node = _BBFExp__out;
    assign _T_56_node = _BBFSqrt__out;
    assign _T_62_node = _BBFPow__out;
    assign _T_68_node = _BBFFloor__out;
    assign _T_74_node = _BBFCeil__out;
    assign _T_80 = _BBFGreaterThan__out;
    assign _T_85 = _BBFGreaterThanEquals__out;
    assign _T_90_node = _BBFSin__out;
    assign _T_96_node = _BBFCos__out;
    assign io_boolOut = _GEN_12;
    assign io_out_node = _GEN_26;
endmodule //FloatOpsWithTrig
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
