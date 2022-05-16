module HardwareHashMaker(
    input clock,
    input reset,
    input [63:0] io_x_0,
    input [63:0] io_x_1,
    input [63:0] io_x_2,
    input [63:0] io_x_3,
    output [63:0] io_out
);
    wire [63:0] _node_0;
    ASSINT #(.width(64)) assint_1 (
        .y(_node_0),
        .in(64'hCD72CE8F)
    );
    wire [127:0] _T_31;
    wire [32:0] _WTEMP_0;
    BITS #(.width(64), .high(32), .low(0)) bits_2 (
        .y(_WTEMP_0),
        .in(_node_0)
    );
    wire [32:0] _WTEMP_1;
    ASSINT #(.width(33)) assint_3 (
        .y(_WTEMP_1),
        .in(_WTEMP_0)
    );
    wire [96:0] _WTEMP_2;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_4 (
        .y(_T_31),
        .in(_WTEMP_2)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_5 (
        .y(_WTEMP_2),
        .a(io_x_0),
        .b(_WTEMP_1)
    );
    wire _node_1;
    ASSINT #(.width(1)) assint_6 (
        .y(_node_1),
        .in(1'h0)
    );
    wire [32:0] _node_2;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_7 (
        .y(_node_2),
        .in(_node_1)
    );
    wire [128:0] _T_32;
    wire [127:0] _WTEMP_3;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_8 (
        .y(_WTEMP_3),
        .in(_node_2)
    );
    ADD_SIGNED #(.width(128)) s_add_9 (
        .y(_T_32),
        .a(_WTEMP_3),
        .b(_T_31)
    );
    wire [127:0] _T_33;
    TAIL #(.width(129), .n(1)) tail_10 (
        .y(_T_33),
        .in(_T_32)
    );
    wire [127:0] _T_34;
    ASSINT #(.width(128)) assint_11 (
        .y(_T_34),
        .in(_T_33)
    );
    wire [63:0] _node_3;
    ASSINT #(.width(64)) assint_12 (
        .y(_node_3),
        .in(64'hFFFFFFFF1934468A)
    );
    wire [127:0] _T_35;
    wire [32:0] _WTEMP_4;
    BITS #(.width(64), .high(32), .low(0)) bits_13 (
        .y(_WTEMP_4),
        .in(_node_3)
    );
    wire [32:0] _WTEMP_5;
    ASSINT #(.width(33)) assint_14 (
        .y(_WTEMP_5),
        .in(_WTEMP_4)
    );
    wire [96:0] _WTEMP_6;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_15 (
        .y(_T_35),
        .in(_WTEMP_6)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_16 (
        .y(_WTEMP_6),
        .a(io_x_1),
        .b(_WTEMP_5)
    );
    wire [128:0] _T_36;
    ADD_SIGNED #(.width(128)) s_add_17 (
        .y(_T_36),
        .a(_T_34),
        .b(_T_35)
    );
    wire [127:0] _T_37;
    TAIL #(.width(129), .n(1)) tail_18 (
        .y(_T_37),
        .in(_T_36)
    );
    wire [127:0] _T_38;
    ASSINT #(.width(128)) assint_19 (
        .y(_T_38),
        .in(_T_37)
    );
    wire [63:0] _node_4;
    ASSINT #(.width(64)) assint_20 (
        .y(_node_4),
        .in(64'h214B73994)
    );
    wire [127:0] _T_39;
    wire [34:0] _WTEMP_7;
    BITS #(.width(64), .high(34), .low(0)) bits_21 (
        .y(_WTEMP_7),
        .in(_node_4)
    );
    wire [34:0] _WTEMP_8;
    ASSINT #(.width(35)) assint_22 (
        .y(_WTEMP_8),
        .in(_WTEMP_7)
    );
    wire [98:0] _WTEMP_9;
    PAD_SIGNED #(.width(99), .n(128)) s_pad_23 (
        .y(_T_39),
        .in(_WTEMP_9)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(35)) s_mul2_24 (
        .y(_WTEMP_9),
        .a(io_x_2),
        .b(_WTEMP_8)
    );
    wire [128:0] _T_40;
    ADD_SIGNED #(.width(128)) s_add_25 (
        .y(_T_40),
        .a(_T_38),
        .b(_T_39)
    );
    wire [127:0] _T_41;
    TAIL #(.width(129), .n(1)) tail_26 (
        .y(_T_41),
        .in(_T_40)
    );
    wire [127:0] _T_42;
    ASSINT #(.width(128)) assint_27 (
        .y(_T_42),
        .in(_T_41)
    );
    wire [63:0] _node_5;
    ASSINT #(.width(64)) assint_28 (
        .y(_node_5),
        .in(64'hC3867B28)
    );
    wire [127:0] _T_43;
    wire [32:0] _WTEMP_10;
    BITS #(.width(64), .high(32), .low(0)) bits_29 (
        .y(_WTEMP_10),
        .in(_node_5)
    );
    wire [32:0] _WTEMP_11;
    ASSINT #(.width(33)) assint_30 (
        .y(_WTEMP_11),
        .in(_WTEMP_10)
    );
    wire [96:0] _WTEMP_12;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_31 (
        .y(_T_43),
        .in(_WTEMP_12)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_32 (
        .y(_WTEMP_12),
        .a(io_x_3),
        .b(_WTEMP_11)
    );
    wire [128:0] _T_44;
    ADD_SIGNED #(.width(128)) s_add_33 (
        .y(_T_44),
        .a(_T_42),
        .b(_T_43)
    );
    wire [127:0] _T_45;
    TAIL #(.width(129), .n(1)) tail_34 (
        .y(_T_45),
        .in(_T_44)
    );
    wire [127:0] _T_46;
    ASSINT #(.width(128)) assint_35 (
        .y(_T_46),
        .in(_T_45)
    );
    wire _node_6;
    ASSINT #(.width(1)) assint_36 (
        .y(_node_6),
        .in(1'h0)
    );
    wire [32:0] _node_7;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_37 (
        .y(_node_7),
        .in(_node_6)
    );
    wire [128:0] _T_47;
    wire [127:0] _WTEMP_13;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_38 (
        .y(_WTEMP_13),
        .in(_node_7)
    );
    ADD_SIGNED #(.width(128)) s_add_39 (
        .y(_T_47),
        .a(_T_46),
        .b(_WTEMP_13)
    );
    wire [127:0] _T_48;
    TAIL #(.width(129), .n(1)) tail_40 (
        .y(_T_48),
        .in(_T_47)
    );
    wire [127:0] _T_49;
    ASSINT #(.width(128)) assint_41 (
        .y(_T_49),
        .in(_T_48)
    );
    wire [101:0] _T_50;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_42 (
        .y(_T_50),
        .in(_T_49)
    );
    wire [63:0] _node_8;
    ASSINT #(.width(64)) assint_43 (
        .y(_node_8),
        .in(64'hFC0D139B)
    );
    wire [127:0] _T_52;
    wire [32:0] _WTEMP_14;
    BITS #(.width(64), .high(32), .low(0)) bits_44 (
        .y(_WTEMP_14),
        .in(_node_8)
    );
    wire [32:0] _WTEMP_15;
    ASSINT #(.width(33)) assint_45 (
        .y(_WTEMP_15),
        .in(_WTEMP_14)
    );
    wire [96:0] _WTEMP_16;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_46 (
        .y(_T_52),
        .in(_WTEMP_16)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_47 (
        .y(_WTEMP_16),
        .a(io_x_0),
        .b(_WTEMP_15)
    );
    wire _node_9;
    ASSINT #(.width(1)) assint_48 (
        .y(_node_9),
        .in(1'h0)
    );
    wire [32:0] _node_10;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_49 (
        .y(_node_10),
        .in(_node_9)
    );
    wire [128:0] _T_53;
    wire [127:0] _WTEMP_17;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_50 (
        .y(_WTEMP_17),
        .in(_node_10)
    );
    ADD_SIGNED #(.width(128)) s_add_51 (
        .y(_T_53),
        .a(_WTEMP_17),
        .b(_T_52)
    );
    wire [127:0] _T_54;
    TAIL #(.width(129), .n(1)) tail_52 (
        .y(_T_54),
        .in(_T_53)
    );
    wire [127:0] _T_55;
    ASSINT #(.width(128)) assint_53 (
        .y(_T_55),
        .in(_T_54)
    );
    wire [63:0] _node_11;
    ASSINT #(.width(64)) assint_54 (
        .y(_node_11),
        .in(64'hFFFFFFFE510BE4EB)
    );
    wire [127:0] _T_56;
    wire [33:0] _WTEMP_18;
    BITS #(.width(64), .high(33), .low(0)) bits_55 (
        .y(_WTEMP_18),
        .in(_node_11)
    );
    wire [33:0] _WTEMP_19;
    ASSINT #(.width(34)) assint_56 (
        .y(_WTEMP_19),
        .in(_WTEMP_18)
    );
    wire [97:0] _WTEMP_20;
    PAD_SIGNED #(.width(98), .n(128)) s_pad_57 (
        .y(_T_56),
        .in(_WTEMP_20)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(34)) s_mul2_58 (
        .y(_WTEMP_20),
        .a(io_x_1),
        .b(_WTEMP_19)
    );
    wire [128:0] _T_57;
    ADD_SIGNED #(.width(128)) s_add_59 (
        .y(_T_57),
        .a(_T_55),
        .b(_T_56)
    );
    wire [127:0] _T_58;
    TAIL #(.width(129), .n(1)) tail_60 (
        .y(_T_58),
        .in(_T_57)
    );
    wire [127:0] _T_59;
    ASSINT #(.width(128)) assint_61 (
        .y(_T_59),
        .in(_T_58)
    );
    wire [63:0] _node_12;
    ASSINT #(.width(64)) assint_62 (
        .y(_node_12),
        .in(64'hFFFFFFFFF903815D)
    );
    wire [127:0] _T_60;
    wire [27:0] _WTEMP_21;
    BITS #(.width(64), .high(27), .low(0)) bits_63 (
        .y(_WTEMP_21),
        .in(_node_12)
    );
    wire [27:0] _WTEMP_22;
    ASSINT #(.width(28)) assint_64 (
        .y(_WTEMP_22),
        .in(_WTEMP_21)
    );
    wire [91:0] _WTEMP_23;
    PAD_SIGNED #(.width(92), .n(128)) s_pad_65 (
        .y(_T_60),
        .in(_WTEMP_23)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(28)) s_mul2_66 (
        .y(_WTEMP_23),
        .a(io_x_2),
        .b(_WTEMP_22)
    );
    wire [128:0] _T_61;
    ADD_SIGNED #(.width(128)) s_add_67 (
        .y(_T_61),
        .a(_T_59),
        .b(_T_60)
    );
    wire [127:0] _T_62;
    TAIL #(.width(129), .n(1)) tail_68 (
        .y(_T_62),
        .in(_T_61)
    );
    wire [127:0] _T_63;
    ASSINT #(.width(128)) assint_69 (
        .y(_T_63),
        .in(_T_62)
    );
    wire [63:0] _node_13;
    ASSINT #(.width(64)) assint_70 (
        .y(_node_13),
        .in(64'h1D80BE0D)
    );
    wire [127:0] _T_64;
    wire [29:0] _WTEMP_24;
    BITS #(.width(64), .high(29), .low(0)) bits_71 (
        .y(_WTEMP_24),
        .in(_node_13)
    );
    wire [29:0] _WTEMP_25;
    ASSINT #(.width(30)) assint_72 (
        .y(_WTEMP_25),
        .in(_WTEMP_24)
    );
    wire [93:0] _WTEMP_26;
    PAD_SIGNED #(.width(94), .n(128)) s_pad_73 (
        .y(_T_64),
        .in(_WTEMP_26)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(30)) s_mul2_74 (
        .y(_WTEMP_26),
        .a(io_x_3),
        .b(_WTEMP_25)
    );
    wire [128:0] _T_65;
    ADD_SIGNED #(.width(128)) s_add_75 (
        .y(_T_65),
        .a(_T_63),
        .b(_T_64)
    );
    wire [127:0] _T_66;
    TAIL #(.width(129), .n(1)) tail_76 (
        .y(_T_66),
        .in(_T_65)
    );
    wire [127:0] _T_67;
    ASSINT #(.width(128)) assint_77 (
        .y(_T_67),
        .in(_T_66)
    );
    wire _node_14;
    ASSINT #(.width(1)) assint_78 (
        .y(_node_14),
        .in(1'h0)
    );
    wire [32:0] _node_15;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_79 (
        .y(_node_15),
        .in(_node_14)
    );
    wire [128:0] _T_68;
    wire [127:0] _WTEMP_27;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_80 (
        .y(_WTEMP_27),
        .in(_node_15)
    );
    ADD_SIGNED #(.width(128)) s_add_81 (
        .y(_T_68),
        .a(_T_67),
        .b(_WTEMP_27)
    );
    wire [127:0] _T_69;
    TAIL #(.width(129), .n(1)) tail_82 (
        .y(_T_69),
        .in(_T_68)
    );
    wire [127:0] _T_70;
    ASSINT #(.width(128)) assint_83 (
        .y(_T_70),
        .in(_T_69)
    );
    wire [101:0] _T_71;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_84 (
        .y(_T_71),
        .in(_T_70)
    );
    wire [63:0] _node_16;
    ASSINT #(.width(64)) assint_85 (
        .y(_node_16),
        .in(64'hFFFFFFFF9C1E0345)
    );
    wire [127:0] _T_73;
    wire [31:0] _WTEMP_28;
    BITS #(.width(64), .high(31), .low(0)) bits_86 (
        .y(_WTEMP_28),
        .in(_node_16)
    );
    wire [31:0] _WTEMP_29;
    ASSINT #(.width(32)) assint_87 (
        .y(_WTEMP_29),
        .in(_WTEMP_28)
    );
    wire [95:0] _WTEMP_30;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_88 (
        .y(_T_73),
        .in(_WTEMP_30)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_89 (
        .y(_WTEMP_30),
        .a(io_x_0),
        .b(_WTEMP_29)
    );
    wire _node_17;
    ASSINT #(.width(1)) assint_90 (
        .y(_node_17),
        .in(1'h0)
    );
    wire [32:0] _node_18;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_91 (
        .y(_node_18),
        .in(_node_17)
    );
    wire [128:0] _T_74;
    wire [127:0] _WTEMP_31;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_92 (
        .y(_WTEMP_31),
        .in(_node_18)
    );
    ADD_SIGNED #(.width(128)) s_add_93 (
        .y(_T_74),
        .a(_WTEMP_31),
        .b(_T_73)
    );
    wire [127:0] _T_75;
    TAIL #(.width(129), .n(1)) tail_94 (
        .y(_T_75),
        .in(_T_74)
    );
    wire [127:0] _T_76;
    ASSINT #(.width(128)) assint_95 (
        .y(_T_76),
        .in(_T_75)
    );
    wire [63:0] _node_19;
    ASSINT #(.width(64)) assint_96 (
        .y(_node_19),
        .in(64'hFFFFFFFF5B4ADEE9)
    );
    wire [127:0] _T_77;
    wire [32:0] _WTEMP_32;
    BITS #(.width(64), .high(32), .low(0)) bits_97 (
        .y(_WTEMP_32),
        .in(_node_19)
    );
    wire [32:0] _WTEMP_33;
    ASSINT #(.width(33)) assint_98 (
        .y(_WTEMP_33),
        .in(_WTEMP_32)
    );
    wire [96:0] _WTEMP_34;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_99 (
        .y(_T_77),
        .in(_WTEMP_34)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_100 (
        .y(_WTEMP_34),
        .a(io_x_1),
        .b(_WTEMP_33)
    );
    wire [128:0] _T_78;
    ADD_SIGNED #(.width(128)) s_add_101 (
        .y(_T_78),
        .a(_T_76),
        .b(_T_77)
    );
    wire [127:0] _T_79;
    TAIL #(.width(129), .n(1)) tail_102 (
        .y(_T_79),
        .in(_T_78)
    );
    wire [127:0] _T_80;
    ASSINT #(.width(128)) assint_103 (
        .y(_T_80),
        .in(_T_79)
    );
    wire [63:0] _node_20;
    ASSINT #(.width(64)) assint_104 (
        .y(_node_20),
        .in(64'hD6E13F9)
    );
    wire [127:0] _T_81;
    wire [28:0] _WTEMP_35;
    BITS #(.width(64), .high(28), .low(0)) bits_105 (
        .y(_WTEMP_35),
        .in(_node_20)
    );
    wire [28:0] _WTEMP_36;
    ASSINT #(.width(29)) assint_106 (
        .y(_WTEMP_36),
        .in(_WTEMP_35)
    );
    wire [92:0] _WTEMP_37;
    PAD_SIGNED #(.width(93), .n(128)) s_pad_107 (
        .y(_T_81),
        .in(_WTEMP_37)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(29)) s_mul2_108 (
        .y(_WTEMP_37),
        .a(io_x_2),
        .b(_WTEMP_36)
    );
    wire [128:0] _T_82;
    ADD_SIGNED #(.width(128)) s_add_109 (
        .y(_T_82),
        .a(_T_80),
        .b(_T_81)
    );
    wire [127:0] _T_83;
    TAIL #(.width(129), .n(1)) tail_110 (
        .y(_T_83),
        .in(_T_82)
    );
    wire [127:0] _T_84;
    ASSINT #(.width(128)) assint_111 (
        .y(_T_84),
        .in(_T_83)
    );
    wire [63:0] _node_21;
    ASSINT #(.width(64)) assint_112 (
        .y(_node_21),
        .in(64'h8576ACA2)
    );
    wire [127:0] _T_85;
    wire [32:0] _WTEMP_38;
    BITS #(.width(64), .high(32), .low(0)) bits_113 (
        .y(_WTEMP_38),
        .in(_node_21)
    );
    wire [32:0] _WTEMP_39;
    ASSINT #(.width(33)) assint_114 (
        .y(_WTEMP_39),
        .in(_WTEMP_38)
    );
    wire [96:0] _WTEMP_40;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_115 (
        .y(_T_85),
        .in(_WTEMP_40)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_116 (
        .y(_WTEMP_40),
        .a(io_x_3),
        .b(_WTEMP_39)
    );
    wire [128:0] _T_86;
    ADD_SIGNED #(.width(128)) s_add_117 (
        .y(_T_86),
        .a(_T_84),
        .b(_T_85)
    );
    wire [127:0] _T_87;
    TAIL #(.width(129), .n(1)) tail_118 (
        .y(_T_87),
        .in(_T_86)
    );
    wire [127:0] _T_88;
    ASSINT #(.width(128)) assint_119 (
        .y(_T_88),
        .in(_T_87)
    );
    wire _node_22;
    ASSINT #(.width(1)) assint_120 (
        .y(_node_22),
        .in(1'h0)
    );
    wire [32:0] _node_23;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_121 (
        .y(_node_23),
        .in(_node_22)
    );
    wire [128:0] _T_89;
    wire [127:0] _WTEMP_41;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_122 (
        .y(_WTEMP_41),
        .in(_node_23)
    );
    ADD_SIGNED #(.width(128)) s_add_123 (
        .y(_T_89),
        .a(_T_88),
        .b(_WTEMP_41)
    );
    wire [127:0] _T_90;
    TAIL #(.width(129), .n(1)) tail_124 (
        .y(_T_90),
        .in(_T_89)
    );
    wire [127:0] _T_91;
    ASSINT #(.width(128)) assint_125 (
        .y(_T_91),
        .in(_T_90)
    );
    wire [101:0] _T_92;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_126 (
        .y(_T_92),
        .in(_T_91)
    );
    wire [63:0] _node_24;
    ASSINT #(.width(64)) assint_127 (
        .y(_node_24),
        .in(64'hFFFFFFFF2D107F9E)
    );
    wire [127:0] _T_94;
    wire [32:0] _WTEMP_42;
    BITS #(.width(64), .high(32), .low(0)) bits_128 (
        .y(_WTEMP_42),
        .in(_node_24)
    );
    wire [32:0] _WTEMP_43;
    ASSINT #(.width(33)) assint_129 (
        .y(_WTEMP_43),
        .in(_WTEMP_42)
    );
    wire [96:0] _WTEMP_44;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_130 (
        .y(_T_94),
        .in(_WTEMP_44)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_131 (
        .y(_WTEMP_44),
        .a(io_x_0),
        .b(_WTEMP_43)
    );
    wire _node_25;
    ASSINT #(.width(1)) assint_132 (
        .y(_node_25),
        .in(1'h0)
    );
    wire [32:0] _node_26;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_133 (
        .y(_node_26),
        .in(_node_25)
    );
    wire [128:0] _T_95;
    wire [127:0] _WTEMP_45;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_134 (
        .y(_WTEMP_45),
        .in(_node_26)
    );
    ADD_SIGNED #(.width(128)) s_add_135 (
        .y(_T_95),
        .a(_WTEMP_45),
        .b(_T_94)
    );
    wire [127:0] _T_96;
    TAIL #(.width(129), .n(1)) tail_136 (
        .y(_T_96),
        .in(_T_95)
    );
    wire [127:0] _T_97;
    ASSINT #(.width(128)) assint_137 (
        .y(_T_97),
        .in(_T_96)
    );
    wire [63:0] _node_27;
    ASSINT #(.width(64)) assint_138 (
        .y(_node_27),
        .in(64'h42BE6D75)
    );
    wire [127:0] _T_98;
    wire [31:0] _WTEMP_46;
    BITS #(.width(64), .high(31), .low(0)) bits_139 (
        .y(_WTEMP_46),
        .in(_node_27)
    );
    wire [31:0] _WTEMP_47;
    ASSINT #(.width(32)) assint_140 (
        .y(_WTEMP_47),
        .in(_WTEMP_46)
    );
    wire [95:0] _WTEMP_48;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_141 (
        .y(_T_98),
        .in(_WTEMP_48)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_142 (
        .y(_WTEMP_48),
        .a(io_x_1),
        .b(_WTEMP_47)
    );
    wire [128:0] _T_99;
    ADD_SIGNED #(.width(128)) s_add_143 (
        .y(_T_99),
        .a(_T_97),
        .b(_T_98)
    );
    wire [127:0] _T_100;
    TAIL #(.width(129), .n(1)) tail_144 (
        .y(_T_100),
        .in(_T_99)
    );
    wire [127:0] _T_101;
    ASSINT #(.width(128)) assint_145 (
        .y(_T_101),
        .in(_T_100)
    );
    wire [63:0] _node_28;
    ASSINT #(.width(64)) assint_146 (
        .y(_node_28),
        .in(64'hFFFFFFFF8C08FE93)
    );
    wire [127:0] _T_102;
    wire [31:0] _WTEMP_49;
    BITS #(.width(64), .high(31), .low(0)) bits_147 (
        .y(_WTEMP_49),
        .in(_node_28)
    );
    wire [31:0] _WTEMP_50;
    ASSINT #(.width(32)) assint_148 (
        .y(_WTEMP_50),
        .in(_WTEMP_49)
    );
    wire [95:0] _WTEMP_51;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_149 (
        .y(_T_102),
        .in(_WTEMP_51)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_150 (
        .y(_WTEMP_51),
        .a(io_x_2),
        .b(_WTEMP_50)
    );
    wire [128:0] _T_103;
    ADD_SIGNED #(.width(128)) s_add_151 (
        .y(_T_103),
        .a(_T_101),
        .b(_T_102)
    );
    wire [127:0] _T_104;
    TAIL #(.width(129), .n(1)) tail_152 (
        .y(_T_104),
        .in(_T_103)
    );
    wire [127:0] _T_105;
    ASSINT #(.width(128)) assint_153 (
        .y(_T_105),
        .in(_T_104)
    );
    wire [63:0] _node_29;
    ASSINT #(.width(64)) assint_154 (
        .y(_node_29),
        .in(64'h16734AAB4)
    );
    wire [127:0] _T_106;
    wire [33:0] _WTEMP_52;
    BITS #(.width(64), .high(33), .low(0)) bits_155 (
        .y(_WTEMP_52),
        .in(_node_29)
    );
    wire [33:0] _WTEMP_53;
    ASSINT #(.width(34)) assint_156 (
        .y(_WTEMP_53),
        .in(_WTEMP_52)
    );
    wire [97:0] _WTEMP_54;
    PAD_SIGNED #(.width(98), .n(128)) s_pad_157 (
        .y(_T_106),
        .in(_WTEMP_54)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(34)) s_mul2_158 (
        .y(_WTEMP_54),
        .a(io_x_3),
        .b(_WTEMP_53)
    );
    wire [128:0] _T_107;
    ADD_SIGNED #(.width(128)) s_add_159 (
        .y(_T_107),
        .a(_T_105),
        .b(_T_106)
    );
    wire [127:0] _T_108;
    TAIL #(.width(129), .n(1)) tail_160 (
        .y(_T_108),
        .in(_T_107)
    );
    wire [127:0] _T_109;
    ASSINT #(.width(128)) assint_161 (
        .y(_T_109),
        .in(_T_108)
    );
    wire _node_30;
    ASSINT #(.width(1)) assint_162 (
        .y(_node_30),
        .in(1'h0)
    );
    wire [32:0] _node_31;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_163 (
        .y(_node_31),
        .in(_node_30)
    );
    wire [128:0] _T_110;
    wire [127:0] _WTEMP_55;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_164 (
        .y(_WTEMP_55),
        .in(_node_31)
    );
    ADD_SIGNED #(.width(128)) s_add_165 (
        .y(_T_110),
        .a(_T_109),
        .b(_WTEMP_55)
    );
    wire [127:0] _T_111;
    TAIL #(.width(129), .n(1)) tail_166 (
        .y(_T_111),
        .in(_T_110)
    );
    wire [127:0] _T_112;
    ASSINT #(.width(128)) assint_167 (
        .y(_T_112),
        .in(_T_111)
    );
    wire [101:0] _T_113;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_168 (
        .y(_T_113),
        .in(_T_112)
    );
    wire [63:0] _node_32;
    ASSINT #(.width(64)) assint_169 (
        .y(_node_32),
        .in(64'h4568D0ED)
    );
    wire [127:0] _T_115;
    wire [31:0] _WTEMP_56;
    BITS #(.width(64), .high(31), .low(0)) bits_170 (
        .y(_WTEMP_56),
        .in(_node_32)
    );
    wire [31:0] _WTEMP_57;
    ASSINT #(.width(32)) assint_171 (
        .y(_WTEMP_57),
        .in(_WTEMP_56)
    );
    wire [95:0] _WTEMP_58;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_172 (
        .y(_T_115),
        .in(_WTEMP_58)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_173 (
        .y(_WTEMP_58),
        .a(io_x_0),
        .b(_WTEMP_57)
    );
    wire _node_33;
    ASSINT #(.width(1)) assint_174 (
        .y(_node_33),
        .in(1'h0)
    );
    wire [32:0] _node_34;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_175 (
        .y(_node_34),
        .in(_node_33)
    );
    wire [128:0] _T_116;
    wire [127:0] _WTEMP_59;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_176 (
        .y(_WTEMP_59),
        .in(_node_34)
    );
    ADD_SIGNED #(.width(128)) s_add_177 (
        .y(_T_116),
        .a(_WTEMP_59),
        .b(_T_115)
    );
    wire [127:0] _T_117;
    TAIL #(.width(129), .n(1)) tail_178 (
        .y(_T_117),
        .in(_T_116)
    );
    wire [127:0] _T_118;
    ASSINT #(.width(128)) assint_179 (
        .y(_T_118),
        .in(_T_117)
    );
    wire [63:0] _node_35;
    ASSINT #(.width(64)) assint_180 (
        .y(_node_35),
        .in(64'hFFFFFFFFFE31B543)
    );
    wire [127:0] _T_119;
    wire [25:0] _WTEMP_60;
    BITS #(.width(64), .high(25), .low(0)) bits_181 (
        .y(_WTEMP_60),
        .in(_node_35)
    );
    wire [25:0] _WTEMP_61;
    ASSINT #(.width(26)) assint_182 (
        .y(_WTEMP_61),
        .in(_WTEMP_60)
    );
    wire [89:0] _WTEMP_62;
    PAD_SIGNED #(.width(90), .n(128)) s_pad_183 (
        .y(_T_119),
        .in(_WTEMP_62)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(26)) s_mul2_184 (
        .y(_WTEMP_62),
        .a(io_x_1),
        .b(_WTEMP_61)
    );
    wire [128:0] _T_120;
    ADD_SIGNED #(.width(128)) s_add_185 (
        .y(_T_120),
        .a(_T_118),
        .b(_T_119)
    );
    wire [127:0] _T_121;
    TAIL #(.width(129), .n(1)) tail_186 (
        .y(_T_121),
        .in(_T_120)
    );
    wire [127:0] _T_122;
    ASSINT #(.width(128)) assint_187 (
        .y(_T_122),
        .in(_T_121)
    );
    wire [63:0] _node_36;
    ASSINT #(.width(64)) assint_188 (
        .y(_node_36),
        .in(64'hE7AB5F92)
    );
    wire [127:0] _T_123;
    wire [32:0] _WTEMP_63;
    BITS #(.width(64), .high(32), .low(0)) bits_189 (
        .y(_WTEMP_63),
        .in(_node_36)
    );
    wire [32:0] _WTEMP_64;
    ASSINT #(.width(33)) assint_190 (
        .y(_WTEMP_64),
        .in(_WTEMP_63)
    );
    wire [96:0] _WTEMP_65;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_191 (
        .y(_T_123),
        .in(_WTEMP_65)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_192 (
        .y(_WTEMP_65),
        .a(io_x_2),
        .b(_WTEMP_64)
    );
    wire [128:0] _T_124;
    ADD_SIGNED #(.width(128)) s_add_193 (
        .y(_T_124),
        .a(_T_122),
        .b(_T_123)
    );
    wire [127:0] _T_125;
    TAIL #(.width(129), .n(1)) tail_194 (
        .y(_T_125),
        .in(_T_124)
    );
    wire [127:0] _T_126;
    ASSINT #(.width(128)) assint_195 (
        .y(_T_126),
        .in(_T_125)
    );
    wire [63:0] _node_37;
    ASSINT #(.width(64)) assint_196 (
        .y(_node_37),
        .in(64'hDB5ACCCD)
    );
    wire [127:0] _T_127;
    wire [32:0] _WTEMP_66;
    BITS #(.width(64), .high(32), .low(0)) bits_197 (
        .y(_WTEMP_66),
        .in(_node_37)
    );
    wire [32:0] _WTEMP_67;
    ASSINT #(.width(33)) assint_198 (
        .y(_WTEMP_67),
        .in(_WTEMP_66)
    );
    wire [96:0] _WTEMP_68;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_199 (
        .y(_T_127),
        .in(_WTEMP_68)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_200 (
        .y(_WTEMP_68),
        .a(io_x_3),
        .b(_WTEMP_67)
    );
    wire [128:0] _T_128;
    ADD_SIGNED #(.width(128)) s_add_201 (
        .y(_T_128),
        .a(_T_126),
        .b(_T_127)
    );
    wire [127:0] _T_129;
    TAIL #(.width(129), .n(1)) tail_202 (
        .y(_T_129),
        .in(_T_128)
    );
    wire [127:0] _T_130;
    ASSINT #(.width(128)) assint_203 (
        .y(_T_130),
        .in(_T_129)
    );
    wire _node_38;
    ASSINT #(.width(1)) assint_204 (
        .y(_node_38),
        .in(1'h0)
    );
    wire [32:0] _node_39;
    SHL_SIGNED #(.width(1), .n(32)) s_shl_205 (
        .y(_node_39),
        .in(_node_38)
    );
    wire [128:0] _T_131;
    wire [127:0] _WTEMP_69;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_206 (
        .y(_WTEMP_69),
        .in(_node_39)
    );
    ADD_SIGNED #(.width(128)) s_add_207 (
        .y(_T_131),
        .a(_T_130),
        .b(_WTEMP_69)
    );
    wire [127:0] _T_132;
    TAIL #(.width(129), .n(1)) tail_208 (
        .y(_T_132),
        .in(_T_131)
    );
    wire [127:0] _T_133;
    ASSINT #(.width(128)) assint_209 (
        .y(_T_133),
        .in(_T_132)
    );
    wire [101:0] _T_134;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_210 (
        .y(_T_134),
        .in(_T_133)
    );
    wire [102:0] _T_135;
    ADD_SIGNED #(.width(102)) s_add_211 (
        .y(_T_135),
        .a(_T_50),
        .b(_T_71)
    );
    wire [101:0] _T_136;
    TAIL #(.width(103), .n(1)) tail_212 (
        .y(_T_136),
        .in(_T_135)
    );
    wire [101:0] _T_137;
    ASSINT #(.width(102)) assint_213 (
        .y(_T_137),
        .in(_T_136)
    );
    wire [102:0] _T_138;
    ADD_SIGNED #(.width(102)) s_add_214 (
        .y(_T_138),
        .a(_T_137),
        .b(_T_92)
    );
    wire [101:0] _T_139;
    TAIL #(.width(103), .n(1)) tail_215 (
        .y(_T_139),
        .in(_T_138)
    );
    wire [101:0] _T_140;
    ASSINT #(.width(102)) assint_216 (
        .y(_T_140),
        .in(_T_139)
    );
    wire [102:0] _T_141;
    ADD_SIGNED #(.width(102)) s_add_217 (
        .y(_T_141),
        .a(_T_140),
        .b(_T_113)
    );
    wire [101:0] _T_142;
    TAIL #(.width(103), .n(1)) tail_218 (
        .y(_T_142),
        .in(_T_141)
    );
    wire [101:0] _T_143;
    ASSINT #(.width(102)) assint_219 (
        .y(_T_143),
        .in(_T_142)
    );
    wire [102:0] _T_144;
    ADD_SIGNED #(.width(102)) s_add_220 (
        .y(_T_144),
        .a(_T_143),
        .b(_T_134)
    );
    wire [101:0] _T_145;
    TAIL #(.width(103), .n(1)) tail_221 (
        .y(_T_145),
        .in(_T_144)
    );
    wire [101:0] _T_146;
    ASSINT #(.width(102)) assint_222 (
        .y(_T_146),
        .in(_T_145)
    );
    wire [95:0] _node_40;
    SHR_SIGNED #(.width(102), .n(6)) s_shr_223 (
        .y(_node_40),
        .in(_T_146)
    );
    wire [63:0] _WTEMP_70;
    BITS #(.width(96), .high(63), .low(0)) bits_224 (
        .y(_WTEMP_70),
        .in(_node_40)
    );
    ASSINT #(.width(64)) assint_225 (
        .y(io_out),
        .in(_WTEMP_70)
    );
endmodule //HardwareHashMaker
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
