module GCDUnitTester(
    input clock,
    input reset
);
    wire _device_under_test__clock;
    wire _device_under_test__reset;
    wire [15:0] _device_under_test__io_a;
    wire [15:0] _device_under_test__io_b;
    wire _device_under_test__io_e;
    wire [15:0] _device_under_test__io_z;
    wire _device_under_test__io_v;
    GCD device_under_test (
        .clock(_device_under_test__clock),
        .reset(_device_under_test__reset),
        .io_a(_device_under_test__io_a),
        .io_b(_device_under_test__io_b),
        .io_e(_device_under_test__io_e),
        .io_z(_device_under_test__io_z),
        .io_v(_device_under_test__io_v)
    );
    wire [2:0] _value__q;
    wire [2:0] _value__d;
    DFF_POSCLK #(.width(3)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(3)) u_mux_16 (
        .y(_value__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_1)
    );
    wire __T_6__q;
    wire __T_6__d;
    DFF_POSCLK #(.width(1)) _T_6 (
        .q(__T_6__q),
        .d(__T_6__d),
        .clk(clock)
    );
    wire _WTEMP_2;
    MUX_UNSIGNED #(.width(1)) u_mux_17 (
        .y(__T_6__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_2)
    );
    wire _T_8;
    EQ_UNSIGNED #(.width(1)) u_eq_18 (
        .y(_T_8),
        .a(__T_6__q),
        .b(1'h0)
    );
    wire [15:0] _T_17_0;
    wire [15:0] _T_17_1;
    wire [15:0] _T_17_2;
    wire [15:0] _T_17_3;
    wire [15:0] _T_17_4;
    wire [15:0] _T_17_5;
    wire _node_2;
    EQ_UNSIGNED #(.width(3)) u_eq_19 (
        .y(_node_2),
        .a(3'd0),
        .b(_value__q)
    );
    wire [15:0] _node_3;
    assign _node_3 = _T_17_0;
    wire _node_4;
    EQ_UNSIGNED #(.width(3)) u_eq_20 (
        .y(_node_4),
        .a(3'd1),
        .b(_value__q)
    );
    wire [15:0] _node_5;
    MUX_UNSIGNED #(.width(16)) u_mux_21 (
        .y(_node_5),
        .sel(_node_4),
        .a(_T_17_1),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(3)) u_eq_22 (
        .y(_node_6),
        .a(3'd2),
        .b(_value__q)
    );
    wire [15:0] _node_7;
    MUX_UNSIGNED #(.width(16)) u_mux_23 (
        .y(_node_7),
        .sel(_node_6),
        .a(_T_17_2),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(3)) u_eq_24 (
        .y(_node_8),
        .a(3'd3),
        .b(_value__q)
    );
    wire [15:0] _node_9;
    MUX_UNSIGNED #(.width(16)) u_mux_25 (
        .y(_node_9),
        .sel(_node_8),
        .a(_T_17_3),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(3)) u_eq_26 (
        .y(_node_10),
        .a(3'd4),
        .b(_value__q)
    );
    wire [15:0] _node_11;
    MUX_UNSIGNED #(.width(16)) u_mux_27 (
        .y(_node_11),
        .sel(_node_10),
        .a(_T_17_4),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(3)) u_eq_28 (
        .y(_node_12),
        .a(3'd5),
        .b(_value__q)
    );
    wire [15:0] _node_13;
    MUX_UNSIGNED #(.width(16)) u_mux_29 (
        .y(_node_13),
        .sel(_node_12),
        .a(_T_17_5),
        .b(_node_11)
    );
    wire [15:0] _T_35_0;
    wire [15:0] _T_35_1;
    wire [15:0] _T_35_2;
    wire [15:0] _T_35_3;
    wire [15:0] _T_35_4;
    wire [15:0] _T_35_5;
    wire _node_14;
    EQ_UNSIGNED #(.width(3)) u_eq_30 (
        .y(_node_14),
        .a(3'd0),
        .b(_value__q)
    );
    wire [15:0] _node_15;
    assign _node_15 = _T_35_0;
    wire _node_16;
    EQ_UNSIGNED #(.width(3)) u_eq_31 (
        .y(_node_16),
        .a(3'd1),
        .b(_value__q)
    );
    wire [15:0] _node_17;
    MUX_UNSIGNED #(.width(16)) u_mux_32 (
        .y(_node_17),
        .sel(_node_16),
        .a(_T_35_1),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(3)) u_eq_33 (
        .y(_node_18),
        .a(3'd2),
        .b(_value__q)
    );
    wire [15:0] _node_19;
    MUX_UNSIGNED #(.width(16)) u_mux_34 (
        .y(_node_19),
        .sel(_node_18),
        .a(_T_35_2),
        .b(_node_17)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(3)) u_eq_35 (
        .y(_node_20),
        .a(3'd3),
        .b(_value__q)
    );
    wire [15:0] _node_21;
    MUX_UNSIGNED #(.width(16)) u_mux_36 (
        .y(_node_21),
        .sel(_node_20),
        .a(_T_35_3),
        .b(_node_19)
    );
    wire _node_22;
    EQ_UNSIGNED #(.width(3)) u_eq_37 (
        .y(_node_22),
        .a(3'd4),
        .b(_value__q)
    );
    wire [15:0] _node_23;
    MUX_UNSIGNED #(.width(16)) u_mux_38 (
        .y(_node_23),
        .sel(_node_22),
        .a(_T_35_4),
        .b(_node_21)
    );
    wire _node_24;
    EQ_UNSIGNED #(.width(3)) u_eq_39 (
        .y(_node_24),
        .a(3'd5),
        .b(_value__q)
    );
    wire [15:0] _node_25;
    MUX_UNSIGNED #(.width(16)) u_mux_40 (
        .y(_node_25),
        .sel(_node_24),
        .a(_T_35_5),
        .b(_node_23)
    );
    wire _T_53_0;
    wire _T_53_1;
    wire _T_53_2;
    wire _T_53_3;
    wire _T_53_4;
    wire _T_53_5;
    wire _node_26;
    EQ_UNSIGNED #(.width(3)) u_eq_41 (
        .y(_node_26),
        .a(3'd0),
        .b(_value__q)
    );
    wire _node_27;
    assign _node_27 = _T_53_0;
    wire _node_28;
    EQ_UNSIGNED #(.width(3)) u_eq_42 (
        .y(_node_28),
        .a(3'd1),
        .b(_value__q)
    );
    wire _node_29;
    MUX_UNSIGNED #(.width(1)) u_mux_43 (
        .y(_node_29),
        .sel(_node_28),
        .a(_T_53_1),
        .b(_node_27)
    );
    wire _node_30;
    EQ_UNSIGNED #(.width(3)) u_eq_44 (
        .y(_node_30),
        .a(3'd2),
        .b(_value__q)
    );
    wire _node_31;
    MUX_UNSIGNED #(.width(1)) u_mux_45 (
        .y(_node_31),
        .sel(_node_30),
        .a(_T_53_2),
        .b(_node_29)
    );
    wire _node_32;
    EQ_UNSIGNED #(.width(3)) u_eq_46 (
        .y(_node_32),
        .a(3'd3),
        .b(_value__q)
    );
    wire _node_33;
    MUX_UNSIGNED #(.width(1)) u_mux_47 (
        .y(_node_33),
        .sel(_node_32),
        .a(_T_53_3),
        .b(_node_31)
    );
    wire _node_34;
    EQ_UNSIGNED #(.width(3)) u_eq_48 (
        .y(_node_34),
        .a(3'd4),
        .b(_value__q)
    );
    wire _node_35;
    MUX_UNSIGNED #(.width(1)) u_mux_49 (
        .y(_node_35),
        .sel(_node_34),
        .a(_T_53_4),
        .b(_node_33)
    );
    wire _node_36;
    EQ_UNSIGNED #(.width(3)) u_eq_50 (
        .y(_node_36),
        .a(3'd5),
        .b(_value__q)
    );
    wire _node_37;
    MUX_UNSIGNED #(.width(1)) u_mux_51 (
        .y(_node_37),
        .sel(_node_36),
        .a(_T_53_5),
        .b(_node_35)
    );
    wire [15:0] _T_66;
    wire [15:0] _T_70;
    wire [15:0] _T_74;
    wire [15:0] _T_78;
    wire [15:0] _T_82;
    wire [15:0] _T_86;
    wire [15:0] _T_89_0;
    wire [15:0] _T_89_1;
    wire [15:0] _T_89_2;
    wire [15:0] _T_89_3;
    wire [15:0] _T_89_4;
    wire [15:0] _T_89_5;
    wire _T_106_0;
    wire _T_106_1;
    wire _T_106_2;
    wire _T_106_3;
    wire _T_106_4;
    wire _T_106_5;
    wire _node_38;
    EQ_UNSIGNED #(.width(3)) u_eq_52 (
        .y(_node_38),
        .a(3'd0),
        .b(_value__q)
    );
    wire [15:0] _node_39;
    assign _node_39 = _T_89_0;
    wire _node_40;
    EQ_UNSIGNED #(.width(3)) u_eq_53 (
        .y(_node_40),
        .a(3'd1),
        .b(_value__q)
    );
    wire [15:0] _node_41;
    MUX_UNSIGNED #(.width(16)) u_mux_54 (
        .y(_node_41),
        .sel(_node_40),
        .a(_T_89_1),
        .b(_node_39)
    );
    wire _node_42;
    EQ_UNSIGNED #(.width(3)) u_eq_55 (
        .y(_node_42),
        .a(3'd2),
        .b(_value__q)
    );
    wire [15:0] _node_43;
    MUX_UNSIGNED #(.width(16)) u_mux_56 (
        .y(_node_43),
        .sel(_node_42),
        .a(_T_89_2),
        .b(_node_41)
    );
    wire _node_44;
    EQ_UNSIGNED #(.width(3)) u_eq_57 (
        .y(_node_44),
        .a(3'd3),
        .b(_value__q)
    );
    wire [15:0] _node_45;
    MUX_UNSIGNED #(.width(16)) u_mux_58 (
        .y(_node_45),
        .sel(_node_44),
        .a(_T_89_3),
        .b(_node_43)
    );
    wire _node_46;
    EQ_UNSIGNED #(.width(3)) u_eq_59 (
        .y(_node_46),
        .a(3'd4),
        .b(_value__q)
    );
    wire [15:0] _node_47;
    MUX_UNSIGNED #(.width(16)) u_mux_60 (
        .y(_node_47),
        .sel(_node_46),
        .a(_T_89_4),
        .b(_node_45)
    );
    wire _node_48;
    EQ_UNSIGNED #(.width(3)) u_eq_61 (
        .y(_node_48),
        .a(3'd5),
        .b(_value__q)
    );
    wire [15:0] _node_49;
    MUX_UNSIGNED #(.width(16)) u_mux_62 (
        .y(_node_49),
        .sel(_node_48),
        .a(_T_89_5),
        .b(_node_47)
    );
    wire _T_117;
    EQ_UNSIGNED #(.width(16)) u_eq_63 (
        .y(_T_117),
        .a(_device_under_test__io_z),
        .b(_node_49)
    );
    wire _T_119;
    EQ_UNSIGNED #(.width(1)) u_eq_64 (
        .y(_T_119),
        .a(_T_117),
        .b(1'h0)
    );
    wire _T_122;
    EQ_UNSIGNED #(.width(1)) u_eq_65 (
        .y(_T_122),
        .a(reset),
        .b(1'h0)
    );
    wire _T_124;
    BITWISEOR #(.width(1)) bitwiseor_66 (
        .y(_T_124),
        .a(1'h0),
        .b(reset)
    );
    wire _T_126;
    EQ_UNSIGNED #(.width(1)) u_eq_67 (
        .y(_T_126),
        .a(_T_124),
        .b(1'h0)
    );
    wire _T_128;
    EQ_UNSIGNED #(.width(1)) u_eq_68 (
        .y(_T_128),
        .a(reset),
        .b(1'h0)
    );
    wire _T_132;
    wire _T_136;
    wire _T_140;
    wire _T_144;
    wire _T_148;
    wire _T_152;
    wire _T_155_0;
    wire _T_155_1;
    wire _T_155_2;
    wire _T_155_3;
    wire _T_155_4;
    wire _T_155_5;
    wire _T_172_0;
    wire _T_172_1;
    wire _T_172_2;
    wire _T_172_3;
    wire _T_172_4;
    wire _T_172_5;
    wire _node_50;
    EQ_UNSIGNED #(.width(3)) u_eq_69 (
        .y(_node_50),
        .a(3'd0),
        .b(_value__q)
    );
    wire _node_51;
    assign _node_51 = _T_155_0;
    wire _node_52;
    EQ_UNSIGNED #(.width(3)) u_eq_70 (
        .y(_node_52),
        .a(3'd1),
        .b(_value__q)
    );
    wire _node_53;
    MUX_UNSIGNED #(.width(1)) u_mux_71 (
        .y(_node_53),
        .sel(_node_52),
        .a(_T_155_1),
        .b(_node_51)
    );
    wire _node_54;
    EQ_UNSIGNED #(.width(3)) u_eq_72 (
        .y(_node_54),
        .a(3'd2),
        .b(_value__q)
    );
    wire _node_55;
    MUX_UNSIGNED #(.width(1)) u_mux_73 (
        .y(_node_55),
        .sel(_node_54),
        .a(_T_155_2),
        .b(_node_53)
    );
    wire _node_56;
    EQ_UNSIGNED #(.width(3)) u_eq_74 (
        .y(_node_56),
        .a(3'd3),
        .b(_value__q)
    );
    wire _node_57;
    MUX_UNSIGNED #(.width(1)) u_mux_75 (
        .y(_node_57),
        .sel(_node_56),
        .a(_T_155_3),
        .b(_node_55)
    );
    wire _node_58;
    EQ_UNSIGNED #(.width(3)) u_eq_76 (
        .y(_node_58),
        .a(3'd4),
        .b(_value__q)
    );
    wire _node_59;
    MUX_UNSIGNED #(.width(1)) u_mux_77 (
        .y(_node_59),
        .sel(_node_58),
        .a(_T_155_4),
        .b(_node_57)
    );
    wire _node_60;
    EQ_UNSIGNED #(.width(3)) u_eq_78 (
        .y(_node_60),
        .a(3'd5),
        .b(_value__q)
    );
    wire _node_61;
    MUX_UNSIGNED #(.width(1)) u_mux_79 (
        .y(_node_61),
        .sel(_node_60),
        .a(_T_155_5),
        .b(_node_59)
    );
    wire _T_183;
    EQ_UNSIGNED #(.width(1)) u_eq_80 (
        .y(_T_183),
        .a(_device_under_test__io_v),
        .b(_node_61)
    );
    wire _T_185;
    EQ_UNSIGNED #(.width(1)) u_eq_81 (
        .y(_T_185),
        .a(_T_183),
        .b(1'h0)
    );
    wire _T_188;
    EQ_UNSIGNED #(.width(1)) u_eq_82 (
        .y(_T_188),
        .a(reset),
        .b(1'h0)
    );
    wire _T_190;
    BITWISEOR #(.width(1)) bitwiseor_83 (
        .y(_T_190),
        .a(1'h0),
        .b(reset)
    );
    wire _T_192;
    EQ_UNSIGNED #(.width(1)) u_eq_84 (
        .y(_T_192),
        .a(_T_190),
        .b(1'h0)
    );
    wire _T_194;
    EQ_UNSIGNED #(.width(1)) u_eq_85 (
        .y(_T_194),
        .a(reset),
        .b(1'h0)
    );
    wire _T_196;
    EQ_UNSIGNED #(.width(3)) u_eq_86 (
        .y(_T_196),
        .a(_value__q),
        .b(3'h5)
    );
    wire [3:0] _T_198;
    wire [2:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_87 (
        .y(_WTEMP_3),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_88 (
        .y(_T_198),
        .a(_value__q),
        .b(_WTEMP_3)
    );
    wire [2:0] _T_199;
    TAIL #(.width(4), .n(1)) tail_89 (
        .y(_T_199),
        .in(_T_198)
    );
    wire _T_202;
    EQ_UNSIGNED #(.width(1)) u_eq_90 (
        .y(_T_202),
        .a(reset),
        .b(1'h0)
    );
    wire _T_205;
    EQ_UNSIGNED #(.width(1)) u_eq_91 (
        .y(_T_205),
        .a(reset),
        .b(1'h0)
    );
    wire _node_62;
    MUX_UNSIGNED #(.width(1)) u_mux_92 (
        .y(_node_62),
        .sel(_T_196),
        .a(1'h1),
        .b(__T_6__q)
    );
    wire [2:0] _node_63;
    wire [2:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_93 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_94 (
        .y(_node_63),
        .sel(_T_196),
        .a(_WTEMP_4),
        .b(_T_199)
    );
    assign _T_106_0 = 1'h0;
    assign _T_106_1 = 1'h0;
    assign _T_106_2 = 1'h0;
    assign _T_106_3 = 1'h0;
    assign _T_106_4 = 1'h0;
    assign _T_106_5 = 1'h1;
    assign _T_132 = 1'h0;
    assign _T_136 = 1'h0;
    assign _T_140 = 1'h0;
    assign _T_144 = 1'h0;
    assign _T_148 = 1'h0;
    assign _T_152 = 1'h1;
    assign _T_155_0 = _T_132;
    assign _T_155_1 = _T_136;
    assign _T_155_2 = _T_140;
    assign _T_155_3 = _T_144;
    assign _T_155_4 = _T_148;
    assign _T_155_5 = _T_152;
    assign _T_17_0 = 16'h30;
    assign _T_17_1 = 16'h30;
    assign _T_17_2 = 16'h30;
    assign _T_17_3 = 16'h30;
    assign _T_17_4 = 16'h30;
    assign _T_17_5 = 16'h30;
    assign _T_172_0 = 1'h0;
    assign _T_172_1 = 1'h0;
    assign _T_172_2 = 1'h0;
    assign _T_172_3 = 1'h0;
    assign _T_172_4 = 1'h0;
    assign _T_172_5 = 1'h1;
    assign _T_35_0 = 16'h40;
    assign _T_35_1 = 16'h40;
    assign _T_35_2 = 16'h40;
    assign _T_35_3 = 16'h40;
    assign _T_35_4 = 16'h40;
    assign _T_35_5 = 16'h40;
    assign _T_53_0 = 1'h1;
    assign _T_53_1 = 1'h0;
    assign _T_53_2 = 1'h0;
    assign _T_53_3 = 1'h0;
    assign _T_53_4 = 1'h0;
    assign _T_53_5 = 1'h0;
    MUX_UNSIGNED #(.width(1)) u_mux_95 (
        .y(_WTEMP_2),
        .sel(_T_8),
        .a(_node_62),
        .b(__T_6__q)
    );
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_96 (
        .y(_T_66),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_97 (
        .y(_T_70),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_98 (
        .y(_T_74),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_99 (
        .y(_T_78),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_100 (
        .y(_T_82),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(5), .n(16)) u_pad_101 (
        .y(_T_86),
        .in(5'h10)
    );
    assign _T_89_0 = _T_66;
    assign _T_89_1 = _T_70;
    assign _T_89_2 = _T_74;
    assign _T_89_3 = _T_78;
    assign _T_89_4 = _T_82;
    assign _T_89_5 = _T_86;
    assign _device_under_test__clock = clock;
    assign _device_under_test__io_a = _node_25;
    assign _device_under_test__io_b = _node_13;
    assign _device_under_test__io_e = _node_37;
    assign _device_under_test__reset = reset;
    MUX_UNSIGNED #(.width(3)) u_mux_102 (
        .y(_WTEMP_1),
        .sel(_T_8),
        .a(_node_63),
        .b(_value__q)
    );
endmodule //GCDUnitTester
module GCD(
    input clock,
    input reset,
    input [15:0] io_a,
    input [15:0] io_b,
    input io_e,
    output [15:0] io_z,
    output io_v
);
    wire [15:0] _x__q;
    wire [15:0] _x__d;
    DFF_POSCLK #(.width(16)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(clock)
    );
    wire [15:0] _y__q;
    wire [15:0] _y__d;
    DFF_POSCLK #(.width(16)) y (
        .q(_y__q),
        .d(_y__d),
        .clk(clock)
    );
    wire _T_9;
    GT_UNSIGNED #(.width(16)) u_gt_1 (
        .y(_T_9),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] _T_10;
    SUB_UNSIGNED #(.width(16)) u_sub_2 (
        .y(_T_10),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] _T_11;
    ASUINT #(.width(17)) asuint_3 (
        .y(_T_11),
        .in(_T_10)
    );
    wire [15:0] _T_12;
    TAIL #(.width(17), .n(1)) tail_4 (
        .y(_T_12),
        .in(_T_11)
    );
    wire _T_13;
    GT_UNSIGNED #(.width(16)) u_gt_5 (
        .y(_T_13),
        .a(_x__q),
        .b(_y__q)
    );
    wire _T_15;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_15),
        .a(_T_13),
        .b(1'h0)
    );
    wire [16:0] _T_16;
    SUB_UNSIGNED #(.width(16)) u_sub_7 (
        .y(_T_16),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_17;
    ASUINT #(.width(17)) asuint_8 (
        .y(_T_17),
        .in(_T_16)
    );
    wire [15:0] _T_18;
    TAIL #(.width(17), .n(1)) tail_9 (
        .y(_T_18),
        .in(_T_17)
    );
    wire [15:0] _node_0;
    MUX_UNSIGNED #(.width(16)) u_mux_10 (
        .y(_node_0),
        .sel(_T_9),
        .a(_T_12),
        .b(_x__q)
    );
    wire [15:0] _node_1;
    MUX_UNSIGNED #(.width(16)) u_mux_11 (
        .y(_node_1),
        .sel(_T_15),
        .a(_T_18),
        .b(_y__q)
    );
    wire _T_20;
    wire [15:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_12 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_13 (
        .y(_T_20),
        .a(_y__q),
        .b(_WTEMP_0)
    );
    assign io_v = _T_20;
    assign io_z = _x__q;
    MUX_UNSIGNED #(.width(16)) u_mux_14 (
        .y(_x__d),
        .sel(io_e),
        .a(io_a),
        .b(_node_0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_15 (
        .y(_y__d),
        .sel(io_e),
        .a(io_b),
        .b(_node_1)
    );
endmodule //GCD
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
