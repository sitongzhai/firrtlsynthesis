module HardwareHashMaker(
    input clock,
    input reset,
    input [63:0] io_x_0,
    input [63:0] io_x_1,
    input [63:0] io_x_2,
    input [63:0] io_x_3,
    output [63:0] io_out
);
    wire [127:0] _T_31;
    wire [32:0] _WTEMP_0;
    BITS #(.width(64), .high(32), .low(0)) bits_1 (
        .y(_WTEMP_0),
        .in(64'shCD72CE8F)
    );
    wire [32:0] _WTEMP_1;
    ASSINT #(.width(33)) assint_2 (
        .y(_WTEMP_1),
        .in(_WTEMP_0)
    );
    wire [96:0] _WTEMP_2;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_3 (
        .y(_T_31),
        .in(_WTEMP_2)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_4 (
        .y(_WTEMP_2),
        .a(io_x_0),
        .b(_WTEMP_1)
    );
    wire [128:0] _T_32;
    wire [127:0] _WTEMP_3;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_5 (
        .y(_WTEMP_3),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_6 (
        .y(_T_32),
        .a(_WTEMP_3),
        .b(_T_31)
    );
    wire [127:0] _T_33;
    TAIL #(.width(129), .n(1)) tail_7 (
        .y(_T_33),
        .in(_T_32)
    );
    wire [127:0] _T_34;
    ASSINT #(.width(128)) assint_8 (
        .y(_T_34),
        .in(_T_33)
    );
    wire [127:0] _T_35;
    wire [32:0] _WTEMP_4;
    BITS #(.width(64), .high(32), .low(0)) bits_9 (
        .y(_WTEMP_4),
        .in(-64'shE6CBB976)
    );
    wire [32:0] _WTEMP_5;
    ASSINT #(.width(33)) assint_10 (
        .y(_WTEMP_5),
        .in(_WTEMP_4)
    );
    wire [96:0] _WTEMP_6;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_11 (
        .y(_T_35),
        .in(_WTEMP_6)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_12 (
        .y(_WTEMP_6),
        .a(io_x_1),
        .b(_WTEMP_5)
    );
    wire [128:0] _T_36;
    ADD_SIGNED #(.width(128)) s_add_13 (
        .y(_T_36),
        .a(_T_34),
        .b(_T_35)
    );
    wire [127:0] _T_37;
    TAIL #(.width(129), .n(1)) tail_14 (
        .y(_T_37),
        .in(_T_36)
    );
    wire [127:0] _T_38;
    ASSINT #(.width(128)) assint_15 (
        .y(_T_38),
        .in(_T_37)
    );
    wire [127:0] _T_39;
    wire [34:0] _WTEMP_7;
    BITS #(.width(64), .high(34), .low(0)) bits_16 (
        .y(_WTEMP_7),
        .in(64'sh214B73994)
    );
    wire [34:0] _WTEMP_8;
    ASSINT #(.width(35)) assint_17 (
        .y(_WTEMP_8),
        .in(_WTEMP_7)
    );
    wire [98:0] _WTEMP_9;
    PAD_SIGNED #(.width(99), .n(128)) s_pad_18 (
        .y(_T_39),
        .in(_WTEMP_9)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(35)) s_mul2_19 (
        .y(_WTEMP_9),
        .a(io_x_2),
        .b(_WTEMP_8)
    );
    wire [128:0] _T_40;
    ADD_SIGNED #(.width(128)) s_add_20 (
        .y(_T_40),
        .a(_T_38),
        .b(_T_39)
    );
    wire [127:0] _T_41;
    TAIL #(.width(129), .n(1)) tail_21 (
        .y(_T_41),
        .in(_T_40)
    );
    wire [127:0] _T_42;
    ASSINT #(.width(128)) assint_22 (
        .y(_T_42),
        .in(_T_41)
    );
    wire [127:0] _T_43;
    wire [32:0] _WTEMP_10;
    BITS #(.width(64), .high(32), .low(0)) bits_23 (
        .y(_WTEMP_10),
        .in(64'shC3867B28)
    );
    wire [32:0] _WTEMP_11;
    ASSINT #(.width(33)) assint_24 (
        .y(_WTEMP_11),
        .in(_WTEMP_10)
    );
    wire [96:0] _WTEMP_12;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_25 (
        .y(_T_43),
        .in(_WTEMP_12)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_26 (
        .y(_WTEMP_12),
        .a(io_x_3),
        .b(_WTEMP_11)
    );
    wire [128:0] _T_44;
    ADD_SIGNED #(.width(128)) s_add_27 (
        .y(_T_44),
        .a(_T_42),
        .b(_T_43)
    );
    wire [127:0] _T_45;
    TAIL #(.width(129), .n(1)) tail_28 (
        .y(_T_45),
        .in(_T_44)
    );
    wire [127:0] _T_46;
    ASSINT #(.width(128)) assint_29 (
        .y(_T_46),
        .in(_T_45)
    );
    wire [128:0] _T_47;
    wire [127:0] _WTEMP_13;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_30 (
        .y(_WTEMP_13),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_31 (
        .y(_T_47),
        .a(_T_46),
        .b(_WTEMP_13)
    );
    wire [127:0] _T_48;
    TAIL #(.width(129), .n(1)) tail_32 (
        .y(_T_48),
        .in(_T_47)
    );
    wire [127:0] _T_49;
    ASSINT #(.width(128)) assint_33 (
        .y(_T_49),
        .in(_T_48)
    );
    wire [101:0] _T_50;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_34 (
        .y(_T_50),
        .in(_T_49)
    );
    wire [127:0] _T_52;
    wire [32:0] _WTEMP_14;
    BITS #(.width(64), .high(32), .low(0)) bits_35 (
        .y(_WTEMP_14),
        .in(64'shFC0D139B)
    );
    wire [32:0] _WTEMP_15;
    ASSINT #(.width(33)) assint_36 (
        .y(_WTEMP_15),
        .in(_WTEMP_14)
    );
    wire [96:0] _WTEMP_16;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_37 (
        .y(_T_52),
        .in(_WTEMP_16)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_38 (
        .y(_WTEMP_16),
        .a(io_x_0),
        .b(_WTEMP_15)
    );
    wire [128:0] _T_53;
    wire [127:0] _WTEMP_17;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_39 (
        .y(_WTEMP_17),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_40 (
        .y(_T_53),
        .a(_WTEMP_17),
        .b(_T_52)
    );
    wire [127:0] _T_54;
    TAIL #(.width(129), .n(1)) tail_41 (
        .y(_T_54),
        .in(_T_53)
    );
    wire [127:0] _T_55;
    ASSINT #(.width(128)) assint_42 (
        .y(_T_55),
        .in(_T_54)
    );
    wire [127:0] _T_56;
    wire [33:0] _WTEMP_18;
    BITS #(.width(64), .high(33), .low(0)) bits_43 (
        .y(_WTEMP_18),
        .in(-64'sh1AEF41B15)
    );
    wire [33:0] _WTEMP_19;
    ASSINT #(.width(34)) assint_44 (
        .y(_WTEMP_19),
        .in(_WTEMP_18)
    );
    wire [97:0] _WTEMP_20;
    PAD_SIGNED #(.width(98), .n(128)) s_pad_45 (
        .y(_T_56),
        .in(_WTEMP_20)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(34)) s_mul2_46 (
        .y(_WTEMP_20),
        .a(io_x_1),
        .b(_WTEMP_19)
    );
    wire [128:0] _T_57;
    ADD_SIGNED #(.width(128)) s_add_47 (
        .y(_T_57),
        .a(_T_55),
        .b(_T_56)
    );
    wire [127:0] _T_58;
    TAIL #(.width(129), .n(1)) tail_48 (
        .y(_T_58),
        .in(_T_57)
    );
    wire [127:0] _T_59;
    ASSINT #(.width(128)) assint_49 (
        .y(_T_59),
        .in(_T_58)
    );
    wire [127:0] _T_60;
    wire [27:0] _WTEMP_21;
    BITS #(.width(64), .high(27), .low(0)) bits_50 (
        .y(_WTEMP_21),
        .in(-64'sh6FC7EA3)
    );
    wire [27:0] _WTEMP_22;
    ASSINT #(.width(28)) assint_51 (
        .y(_WTEMP_22),
        .in(_WTEMP_21)
    );
    wire [91:0] _WTEMP_23;
    PAD_SIGNED #(.width(92), .n(128)) s_pad_52 (
        .y(_T_60),
        .in(_WTEMP_23)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(28)) s_mul2_53 (
        .y(_WTEMP_23),
        .a(io_x_2),
        .b(_WTEMP_22)
    );
    wire [128:0] _T_61;
    ADD_SIGNED #(.width(128)) s_add_54 (
        .y(_T_61),
        .a(_T_59),
        .b(_T_60)
    );
    wire [127:0] _T_62;
    TAIL #(.width(129), .n(1)) tail_55 (
        .y(_T_62),
        .in(_T_61)
    );
    wire [127:0] _T_63;
    ASSINT #(.width(128)) assint_56 (
        .y(_T_63),
        .in(_T_62)
    );
    wire [127:0] _T_64;
    wire [29:0] _WTEMP_24;
    BITS #(.width(64), .high(29), .low(0)) bits_57 (
        .y(_WTEMP_24),
        .in(64'sh1D80BE0D)
    );
    wire [29:0] _WTEMP_25;
    ASSINT #(.width(30)) assint_58 (
        .y(_WTEMP_25),
        .in(_WTEMP_24)
    );
    wire [93:0] _WTEMP_26;
    PAD_SIGNED #(.width(94), .n(128)) s_pad_59 (
        .y(_T_64),
        .in(_WTEMP_26)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(30)) s_mul2_60 (
        .y(_WTEMP_26),
        .a(io_x_3),
        .b(_WTEMP_25)
    );
    wire [128:0] _T_65;
    ADD_SIGNED #(.width(128)) s_add_61 (
        .y(_T_65),
        .a(_T_63),
        .b(_T_64)
    );
    wire [127:0] _T_66;
    TAIL #(.width(129), .n(1)) tail_62 (
        .y(_T_66),
        .in(_T_65)
    );
    wire [127:0] _T_67;
    ASSINT #(.width(128)) assint_63 (
        .y(_T_67),
        .in(_T_66)
    );
    wire [128:0] _T_68;
    wire [127:0] _WTEMP_27;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_64 (
        .y(_WTEMP_27),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_65 (
        .y(_T_68),
        .a(_T_67),
        .b(_WTEMP_27)
    );
    wire [127:0] _T_69;
    TAIL #(.width(129), .n(1)) tail_66 (
        .y(_T_69),
        .in(_T_68)
    );
    wire [127:0] _T_70;
    ASSINT #(.width(128)) assint_67 (
        .y(_T_70),
        .in(_T_69)
    );
    wire [101:0] _T_71;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_68 (
        .y(_T_71),
        .in(_T_70)
    );
    wire [127:0] _T_73;
    wire [31:0] _WTEMP_28;
    BITS #(.width(64), .high(31), .low(0)) bits_69 (
        .y(_WTEMP_28),
        .in(-64'sh63E1FCBB)
    );
    wire [31:0] _WTEMP_29;
    ASSINT #(.width(32)) assint_70 (
        .y(_WTEMP_29),
        .in(_WTEMP_28)
    );
    wire [95:0] _WTEMP_30;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_71 (
        .y(_T_73),
        .in(_WTEMP_30)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_72 (
        .y(_WTEMP_30),
        .a(io_x_0),
        .b(_WTEMP_29)
    );
    wire [128:0] _T_74;
    wire [127:0] _WTEMP_31;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_73 (
        .y(_WTEMP_31),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_74 (
        .y(_T_74),
        .a(_WTEMP_31),
        .b(_T_73)
    );
    wire [127:0] _T_75;
    TAIL #(.width(129), .n(1)) tail_75 (
        .y(_T_75),
        .in(_T_74)
    );
    wire [127:0] _T_76;
    ASSINT #(.width(128)) assint_76 (
        .y(_T_76),
        .in(_T_75)
    );
    wire [127:0] _T_77;
    wire [32:0] _WTEMP_32;
    BITS #(.width(64), .high(32), .low(0)) bits_77 (
        .y(_WTEMP_32),
        .in(-64'shA4B52117)
    );
    wire [32:0] _WTEMP_33;
    ASSINT #(.width(33)) assint_78 (
        .y(_WTEMP_33),
        .in(_WTEMP_32)
    );
    wire [96:0] _WTEMP_34;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_79 (
        .y(_T_77),
        .in(_WTEMP_34)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_80 (
        .y(_WTEMP_34),
        .a(io_x_1),
        .b(_WTEMP_33)
    );
    wire [128:0] _T_78;
    ADD_SIGNED #(.width(128)) s_add_81 (
        .y(_T_78),
        .a(_T_76),
        .b(_T_77)
    );
    wire [127:0] _T_79;
    TAIL #(.width(129), .n(1)) tail_82 (
        .y(_T_79),
        .in(_T_78)
    );
    wire [127:0] _T_80;
    ASSINT #(.width(128)) assint_83 (
        .y(_T_80),
        .in(_T_79)
    );
    wire [127:0] _T_81;
    wire [28:0] _WTEMP_35;
    BITS #(.width(64), .high(28), .low(0)) bits_84 (
        .y(_WTEMP_35),
        .in(64'shD6E13F9)
    );
    wire [28:0] _WTEMP_36;
    ASSINT #(.width(29)) assint_85 (
        .y(_WTEMP_36),
        .in(_WTEMP_35)
    );
    wire [92:0] _WTEMP_37;
    PAD_SIGNED #(.width(93), .n(128)) s_pad_86 (
        .y(_T_81),
        .in(_WTEMP_37)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(29)) s_mul2_87 (
        .y(_WTEMP_37),
        .a(io_x_2),
        .b(_WTEMP_36)
    );
    wire [128:0] _T_82;
    ADD_SIGNED #(.width(128)) s_add_88 (
        .y(_T_82),
        .a(_T_80),
        .b(_T_81)
    );
    wire [127:0] _T_83;
    TAIL #(.width(129), .n(1)) tail_89 (
        .y(_T_83),
        .in(_T_82)
    );
    wire [127:0] _T_84;
    ASSINT #(.width(128)) assint_90 (
        .y(_T_84),
        .in(_T_83)
    );
    wire [127:0] _T_85;
    wire [32:0] _WTEMP_38;
    BITS #(.width(64), .high(32), .low(0)) bits_91 (
        .y(_WTEMP_38),
        .in(64'sh8576ACA2)
    );
    wire [32:0] _WTEMP_39;
    ASSINT #(.width(33)) assint_92 (
        .y(_WTEMP_39),
        .in(_WTEMP_38)
    );
    wire [96:0] _WTEMP_40;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_93 (
        .y(_T_85),
        .in(_WTEMP_40)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_94 (
        .y(_WTEMP_40),
        .a(io_x_3),
        .b(_WTEMP_39)
    );
    wire [128:0] _T_86;
    ADD_SIGNED #(.width(128)) s_add_95 (
        .y(_T_86),
        .a(_T_84),
        .b(_T_85)
    );
    wire [127:0] _T_87;
    TAIL #(.width(129), .n(1)) tail_96 (
        .y(_T_87),
        .in(_T_86)
    );
    wire [127:0] _T_88;
    ASSINT #(.width(128)) assint_97 (
        .y(_T_88),
        .in(_T_87)
    );
    wire [128:0] _T_89;
    wire [127:0] _WTEMP_41;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_98 (
        .y(_WTEMP_41),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_99 (
        .y(_T_89),
        .a(_T_88),
        .b(_WTEMP_41)
    );
    wire [127:0] _T_90;
    TAIL #(.width(129), .n(1)) tail_100 (
        .y(_T_90),
        .in(_T_89)
    );
    wire [127:0] _T_91;
    ASSINT #(.width(128)) assint_101 (
        .y(_T_91),
        .in(_T_90)
    );
    wire [101:0] _T_92;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_102 (
        .y(_T_92),
        .in(_T_91)
    );
    wire [127:0] _T_94;
    wire [32:0] _WTEMP_42;
    BITS #(.width(64), .high(32), .low(0)) bits_103 (
        .y(_WTEMP_42),
        .in(-64'shD2EF8062)
    );
    wire [32:0] _WTEMP_43;
    ASSINT #(.width(33)) assint_104 (
        .y(_WTEMP_43),
        .in(_WTEMP_42)
    );
    wire [96:0] _WTEMP_44;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_105 (
        .y(_T_94),
        .in(_WTEMP_44)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_106 (
        .y(_WTEMP_44),
        .a(io_x_0),
        .b(_WTEMP_43)
    );
    wire [128:0] _T_95;
    wire [127:0] _WTEMP_45;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_107 (
        .y(_WTEMP_45),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_108 (
        .y(_T_95),
        .a(_WTEMP_45),
        .b(_T_94)
    );
    wire [127:0] _T_96;
    TAIL #(.width(129), .n(1)) tail_109 (
        .y(_T_96),
        .in(_T_95)
    );
    wire [127:0] _T_97;
    ASSINT #(.width(128)) assint_110 (
        .y(_T_97),
        .in(_T_96)
    );
    wire [127:0] _T_98;
    wire [31:0] _WTEMP_46;
    BITS #(.width(64), .high(31), .low(0)) bits_111 (
        .y(_WTEMP_46),
        .in(64'sh42BE6D75)
    );
    wire [31:0] _WTEMP_47;
    ASSINT #(.width(32)) assint_112 (
        .y(_WTEMP_47),
        .in(_WTEMP_46)
    );
    wire [95:0] _WTEMP_48;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_113 (
        .y(_T_98),
        .in(_WTEMP_48)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_114 (
        .y(_WTEMP_48),
        .a(io_x_1),
        .b(_WTEMP_47)
    );
    wire [128:0] _T_99;
    ADD_SIGNED #(.width(128)) s_add_115 (
        .y(_T_99),
        .a(_T_97),
        .b(_T_98)
    );
    wire [127:0] _T_100;
    TAIL #(.width(129), .n(1)) tail_116 (
        .y(_T_100),
        .in(_T_99)
    );
    wire [127:0] _T_101;
    ASSINT #(.width(128)) assint_117 (
        .y(_T_101),
        .in(_T_100)
    );
    wire [127:0] _T_102;
    wire [31:0] _WTEMP_49;
    BITS #(.width(64), .high(31), .low(0)) bits_118 (
        .y(_WTEMP_49),
        .in(-64'sh73F7016D)
    );
    wire [31:0] _WTEMP_50;
    ASSINT #(.width(32)) assint_119 (
        .y(_WTEMP_50),
        .in(_WTEMP_49)
    );
    wire [95:0] _WTEMP_51;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_120 (
        .y(_T_102),
        .in(_WTEMP_51)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_121 (
        .y(_WTEMP_51),
        .a(io_x_2),
        .b(_WTEMP_50)
    );
    wire [128:0] _T_103;
    ADD_SIGNED #(.width(128)) s_add_122 (
        .y(_T_103),
        .a(_T_101),
        .b(_T_102)
    );
    wire [127:0] _T_104;
    TAIL #(.width(129), .n(1)) tail_123 (
        .y(_T_104),
        .in(_T_103)
    );
    wire [127:0] _T_105;
    ASSINT #(.width(128)) assint_124 (
        .y(_T_105),
        .in(_T_104)
    );
    wire [127:0] _T_106;
    wire [33:0] _WTEMP_52;
    BITS #(.width(64), .high(33), .low(0)) bits_125 (
        .y(_WTEMP_52),
        .in(64'sh16734AAB4)
    );
    wire [33:0] _WTEMP_53;
    ASSINT #(.width(34)) assint_126 (
        .y(_WTEMP_53),
        .in(_WTEMP_52)
    );
    wire [97:0] _WTEMP_54;
    PAD_SIGNED #(.width(98), .n(128)) s_pad_127 (
        .y(_T_106),
        .in(_WTEMP_54)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(34)) s_mul2_128 (
        .y(_WTEMP_54),
        .a(io_x_3),
        .b(_WTEMP_53)
    );
    wire [128:0] _T_107;
    ADD_SIGNED #(.width(128)) s_add_129 (
        .y(_T_107),
        .a(_T_105),
        .b(_T_106)
    );
    wire [127:0] _T_108;
    TAIL #(.width(129), .n(1)) tail_130 (
        .y(_T_108),
        .in(_T_107)
    );
    wire [127:0] _T_109;
    ASSINT #(.width(128)) assint_131 (
        .y(_T_109),
        .in(_T_108)
    );
    wire [128:0] _T_110;
    wire [127:0] _WTEMP_55;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_132 (
        .y(_WTEMP_55),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_133 (
        .y(_T_110),
        .a(_T_109),
        .b(_WTEMP_55)
    );
    wire [127:0] _T_111;
    TAIL #(.width(129), .n(1)) tail_134 (
        .y(_T_111),
        .in(_T_110)
    );
    wire [127:0] _T_112;
    ASSINT #(.width(128)) assint_135 (
        .y(_T_112),
        .in(_T_111)
    );
    wire [101:0] _T_113;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_136 (
        .y(_T_113),
        .in(_T_112)
    );
    wire [127:0] _T_115;
    wire [31:0] _WTEMP_56;
    BITS #(.width(64), .high(31), .low(0)) bits_137 (
        .y(_WTEMP_56),
        .in(64'sh4568D0ED)
    );
    wire [31:0] _WTEMP_57;
    ASSINT #(.width(32)) assint_138 (
        .y(_WTEMP_57),
        .in(_WTEMP_56)
    );
    wire [95:0] _WTEMP_58;
    PAD_SIGNED #(.width(96), .n(128)) s_pad_139 (
        .y(_T_115),
        .in(_WTEMP_58)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(32)) s_mul2_140 (
        .y(_WTEMP_58),
        .a(io_x_0),
        .b(_WTEMP_57)
    );
    wire [128:0] _T_116;
    wire [127:0] _WTEMP_59;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_141 (
        .y(_WTEMP_59),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_142 (
        .y(_T_116),
        .a(_WTEMP_59),
        .b(_T_115)
    );
    wire [127:0] _T_117;
    TAIL #(.width(129), .n(1)) tail_143 (
        .y(_T_117),
        .in(_T_116)
    );
    wire [127:0] _T_118;
    ASSINT #(.width(128)) assint_144 (
        .y(_T_118),
        .in(_T_117)
    );
    wire [127:0] _T_119;
    wire [25:0] _WTEMP_60;
    BITS #(.width(64), .high(25), .low(0)) bits_145 (
        .y(_WTEMP_60),
        .in(-64'sh1CE4ABD)
    );
    wire [25:0] _WTEMP_61;
    ASSINT #(.width(26)) assint_146 (
        .y(_WTEMP_61),
        .in(_WTEMP_60)
    );
    wire [89:0] _WTEMP_62;
    PAD_SIGNED #(.width(90), .n(128)) s_pad_147 (
        .y(_T_119),
        .in(_WTEMP_62)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(26)) s_mul2_148 (
        .y(_WTEMP_62),
        .a(io_x_1),
        .b(_WTEMP_61)
    );
    wire [128:0] _T_120;
    ADD_SIGNED #(.width(128)) s_add_149 (
        .y(_T_120),
        .a(_T_118),
        .b(_T_119)
    );
    wire [127:0] _T_121;
    TAIL #(.width(129), .n(1)) tail_150 (
        .y(_T_121),
        .in(_T_120)
    );
    wire [127:0] _T_122;
    ASSINT #(.width(128)) assint_151 (
        .y(_T_122),
        .in(_T_121)
    );
    wire [127:0] _T_123;
    wire [32:0] _WTEMP_63;
    BITS #(.width(64), .high(32), .low(0)) bits_152 (
        .y(_WTEMP_63),
        .in(64'shE7AB5F92)
    );
    wire [32:0] _WTEMP_64;
    ASSINT #(.width(33)) assint_153 (
        .y(_WTEMP_64),
        .in(_WTEMP_63)
    );
    wire [96:0] _WTEMP_65;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_154 (
        .y(_T_123),
        .in(_WTEMP_65)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_155 (
        .y(_WTEMP_65),
        .a(io_x_2),
        .b(_WTEMP_64)
    );
    wire [128:0] _T_124;
    ADD_SIGNED #(.width(128)) s_add_156 (
        .y(_T_124),
        .a(_T_122),
        .b(_T_123)
    );
    wire [127:0] _T_125;
    TAIL #(.width(129), .n(1)) tail_157 (
        .y(_T_125),
        .in(_T_124)
    );
    wire [127:0] _T_126;
    ASSINT #(.width(128)) assint_158 (
        .y(_T_126),
        .in(_T_125)
    );
    wire [127:0] _T_127;
    wire [32:0] _WTEMP_66;
    BITS #(.width(64), .high(32), .low(0)) bits_159 (
        .y(_WTEMP_66),
        .in(64'shDB5ACCCD)
    );
    wire [32:0] _WTEMP_67;
    ASSINT #(.width(33)) assint_160 (
        .y(_WTEMP_67),
        .in(_WTEMP_66)
    );
    wire [96:0] _WTEMP_68;
    PAD_SIGNED #(.width(97), .n(128)) s_pad_161 (
        .y(_T_127),
        .in(_WTEMP_68)
    );
    MUL2_SIGNED #(.width_a(64), .width_b(33)) s_mul2_162 (
        .y(_WTEMP_68),
        .a(io_x_3),
        .b(_WTEMP_67)
    );
    wire [128:0] _T_128;
    ADD_SIGNED #(.width(128)) s_add_163 (
        .y(_T_128),
        .a(_T_126),
        .b(_T_127)
    );
    wire [127:0] _T_129;
    TAIL #(.width(129), .n(1)) tail_164 (
        .y(_T_129),
        .in(_T_128)
    );
    wire [127:0] _T_130;
    ASSINT #(.width(128)) assint_165 (
        .y(_T_130),
        .in(_T_129)
    );
    wire [128:0] _T_131;
    wire [127:0] _WTEMP_69;
    PAD_SIGNED #(.width(33), .n(128)) s_pad_166 (
        .y(_WTEMP_69),
        .in(33'sh0)
    );
    ADD_SIGNED #(.width(128)) s_add_167 (
        .y(_T_131),
        .a(_T_130),
        .b(_WTEMP_69)
    );
    wire [127:0] _T_132;
    TAIL #(.width(129), .n(1)) tail_168 (
        .y(_T_132),
        .in(_T_131)
    );
    wire [127:0] _T_133;
    ASSINT #(.width(128)) assint_169 (
        .y(_T_133),
        .in(_T_132)
    );
    wire [101:0] _T_134;
    SHR_SIGNED #(.width(128), .n(26)) s_shr_170 (
        .y(_T_134),
        .in(_T_133)
    );
    wire [102:0] _T_135;
    ADD_SIGNED #(.width(102)) s_add_171 (
        .y(_T_135),
        .a(_T_50),
        .b(_T_71)
    );
    wire [101:0] _T_136;
    TAIL #(.width(103), .n(1)) tail_172 (
        .y(_T_136),
        .in(_T_135)
    );
    wire [101:0] _T_137;
    ASSINT #(.width(102)) assint_173 (
        .y(_T_137),
        .in(_T_136)
    );
    wire [102:0] _T_138;
    ADD_SIGNED #(.width(102)) s_add_174 (
        .y(_T_138),
        .a(_T_137),
        .b(_T_92)
    );
    wire [101:0] _T_139;
    TAIL #(.width(103), .n(1)) tail_175 (
        .y(_T_139),
        .in(_T_138)
    );
    wire [101:0] _T_140;
    ASSINT #(.width(102)) assint_176 (
        .y(_T_140),
        .in(_T_139)
    );
    wire [102:0] _T_141;
    ADD_SIGNED #(.width(102)) s_add_177 (
        .y(_T_141),
        .a(_T_140),
        .b(_T_113)
    );
    wire [101:0] _T_142;
    TAIL #(.width(103), .n(1)) tail_178 (
        .y(_T_142),
        .in(_T_141)
    );
    wire [101:0] _T_143;
    ASSINT #(.width(102)) assint_179 (
        .y(_T_143),
        .in(_T_142)
    );
    wire [102:0] _T_144;
    ADD_SIGNED #(.width(102)) s_add_180 (
        .y(_T_144),
        .a(_T_143),
        .b(_T_134)
    );
    wire [101:0] _T_145;
    TAIL #(.width(103), .n(1)) tail_181 (
        .y(_T_145),
        .in(_T_144)
    );
    wire [101:0] _T_146;
    ASSINT #(.width(102)) assint_182 (
        .y(_T_146),
        .in(_T_145)
    );
    wire [95:0] _node_0;
    SHR_SIGNED #(.width(102), .n(6)) s_shr_183 (
        .y(_node_0),
        .in(_T_146)
    );
    wire [63:0] _node_1;
    BITS #(.width(96), .high(63), .low(0)) bits_184 (
        .y(_node_1),
        .in(_node_0)
    );
    ASSINT #(.width(64)) assint_185 (
        .y(io_out),
        .in(_node_1)
    );
endmodule //HardwareHashMaker
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
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
