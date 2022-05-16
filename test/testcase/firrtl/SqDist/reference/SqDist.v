module SqDist(
    input clock,
    input reset,
    input [31:0] io_in1_0,
    input [31:0] io_in1_1,
    input [31:0] io_in1_2,
    input [31:0] io_in1_3,
    input [31:0] io_in1_4,
    input [31:0] io_in1_5,
    input [31:0] io_in1_6,
    input [31:0] io_in1_7,
    input [31:0] io_in1_8,
    input [31:0] io_in1_9,
    input [31:0] io_in2_0,
    input [31:0] io_in2_1,
    input [31:0] io_in2_2,
    input [31:0] io_in2_3,
    input [31:0] io_in2_4,
    input [31:0] io_in2_5,
    input [31:0] io_in2_6,
    input [31:0] io_in2_7,
    input [31:0] io_in2_8,
    input [31:0] io_in2_9,
    output [31:0] io_out
);
    wire [32:0] _T_30;
    SUB_SIGNED #(.width(32)) s_sub_1 (
        .y(_T_30),
        .a(io_in2_0),
        .b(io_in1_0)
    );
    wire [31:0] _T_31;
    TAIL #(.width(33), .n(1)) tail_2 (
        .y(_T_31),
        .in(_T_30)
    );
    wire [31:0] _T_32;
    ASSINT #(.width(32)) assint_3 (
        .y(_T_32),
        .in(_T_31)
    );
    wire [32:0] _T_33;
    SUB_SIGNED #(.width(32)) s_sub_4 (
        .y(_T_33),
        .a(io_in2_0),
        .b(io_in1_0)
    );
    wire [31:0] _T_34;
    TAIL #(.width(33), .n(1)) tail_5 (
        .y(_T_34),
        .in(_T_33)
    );
    wire [31:0] _T_35;
    ASSINT #(.width(32)) assint_6 (
        .y(_T_35),
        .in(_T_34)
    );
    wire [63:0] _T_36;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_7 (
        .y(_T_36),
        .a(_T_32),
        .b(_T_35)
    );
    wire [32:0] _T_37;
    SUB_SIGNED #(.width(32)) s_sub_8 (
        .y(_T_37),
        .a(io_in2_1),
        .b(io_in1_1)
    );
    wire [31:0] _T_38;
    TAIL #(.width(33), .n(1)) tail_9 (
        .y(_T_38),
        .in(_T_37)
    );
    wire [31:0] _T_39;
    ASSINT #(.width(32)) assint_10 (
        .y(_T_39),
        .in(_T_38)
    );
    wire [32:0] _T_40;
    SUB_SIGNED #(.width(32)) s_sub_11 (
        .y(_T_40),
        .a(io_in2_1),
        .b(io_in1_1)
    );
    wire [31:0] _T_41;
    TAIL #(.width(33), .n(1)) tail_12 (
        .y(_T_41),
        .in(_T_40)
    );
    wire [31:0] _T_42;
    ASSINT #(.width(32)) assint_13 (
        .y(_T_42),
        .in(_T_41)
    );
    wire [63:0] _T_43;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_14 (
        .y(_T_43),
        .a(_T_39),
        .b(_T_42)
    );
    wire [32:0] _T_44;
    SUB_SIGNED #(.width(32)) s_sub_15 (
        .y(_T_44),
        .a(io_in2_2),
        .b(io_in1_2)
    );
    wire [31:0] _T_45;
    TAIL #(.width(33), .n(1)) tail_16 (
        .y(_T_45),
        .in(_T_44)
    );
    wire [31:0] _T_46;
    ASSINT #(.width(32)) assint_17 (
        .y(_T_46),
        .in(_T_45)
    );
    wire [32:0] _T_47;
    SUB_SIGNED #(.width(32)) s_sub_18 (
        .y(_T_47),
        .a(io_in2_2),
        .b(io_in1_2)
    );
    wire [31:0] _T_48;
    TAIL #(.width(33), .n(1)) tail_19 (
        .y(_T_48),
        .in(_T_47)
    );
    wire [31:0] _T_49;
    ASSINT #(.width(32)) assint_20 (
        .y(_T_49),
        .in(_T_48)
    );
    wire [63:0] _T_50;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_21 (
        .y(_T_50),
        .a(_T_46),
        .b(_T_49)
    );
    wire [32:0] _T_51;
    SUB_SIGNED #(.width(32)) s_sub_22 (
        .y(_T_51),
        .a(io_in2_3),
        .b(io_in1_3)
    );
    wire [31:0] _T_52;
    TAIL #(.width(33), .n(1)) tail_23 (
        .y(_T_52),
        .in(_T_51)
    );
    wire [31:0] _T_53;
    ASSINT #(.width(32)) assint_24 (
        .y(_T_53),
        .in(_T_52)
    );
    wire [32:0] _T_54;
    SUB_SIGNED #(.width(32)) s_sub_25 (
        .y(_T_54),
        .a(io_in2_3),
        .b(io_in1_3)
    );
    wire [31:0] _T_55;
    TAIL #(.width(33), .n(1)) tail_26 (
        .y(_T_55),
        .in(_T_54)
    );
    wire [31:0] _T_56;
    ASSINT #(.width(32)) assint_27 (
        .y(_T_56),
        .in(_T_55)
    );
    wire [63:0] _T_57;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_28 (
        .y(_T_57),
        .a(_T_53),
        .b(_T_56)
    );
    wire [32:0] _T_58;
    SUB_SIGNED #(.width(32)) s_sub_29 (
        .y(_T_58),
        .a(io_in2_4),
        .b(io_in1_4)
    );
    wire [31:0] _T_59;
    TAIL #(.width(33), .n(1)) tail_30 (
        .y(_T_59),
        .in(_T_58)
    );
    wire [31:0] _T_60;
    ASSINT #(.width(32)) assint_31 (
        .y(_T_60),
        .in(_T_59)
    );
    wire [32:0] _T_61;
    SUB_SIGNED #(.width(32)) s_sub_32 (
        .y(_T_61),
        .a(io_in2_4),
        .b(io_in1_4)
    );
    wire [31:0] _T_62;
    TAIL #(.width(33), .n(1)) tail_33 (
        .y(_T_62),
        .in(_T_61)
    );
    wire [31:0] _T_63;
    ASSINT #(.width(32)) assint_34 (
        .y(_T_63),
        .in(_T_62)
    );
    wire [63:0] _T_64;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_35 (
        .y(_T_64),
        .a(_T_60),
        .b(_T_63)
    );
    wire [32:0] _T_65;
    SUB_SIGNED #(.width(32)) s_sub_36 (
        .y(_T_65),
        .a(io_in2_5),
        .b(io_in1_5)
    );
    wire [31:0] _T_66;
    TAIL #(.width(33), .n(1)) tail_37 (
        .y(_T_66),
        .in(_T_65)
    );
    wire [31:0] _T_67;
    ASSINT #(.width(32)) assint_38 (
        .y(_T_67),
        .in(_T_66)
    );
    wire [32:0] _T_68;
    SUB_SIGNED #(.width(32)) s_sub_39 (
        .y(_T_68),
        .a(io_in2_5),
        .b(io_in1_5)
    );
    wire [31:0] _T_69;
    TAIL #(.width(33), .n(1)) tail_40 (
        .y(_T_69),
        .in(_T_68)
    );
    wire [31:0] _T_70;
    ASSINT #(.width(32)) assint_41 (
        .y(_T_70),
        .in(_T_69)
    );
    wire [63:0] _T_71;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_42 (
        .y(_T_71),
        .a(_T_67),
        .b(_T_70)
    );
    wire [32:0] _T_72;
    SUB_SIGNED #(.width(32)) s_sub_43 (
        .y(_T_72),
        .a(io_in2_6),
        .b(io_in1_6)
    );
    wire [31:0] _T_73;
    TAIL #(.width(33), .n(1)) tail_44 (
        .y(_T_73),
        .in(_T_72)
    );
    wire [31:0] _T_74;
    ASSINT #(.width(32)) assint_45 (
        .y(_T_74),
        .in(_T_73)
    );
    wire [32:0] _T_75;
    SUB_SIGNED #(.width(32)) s_sub_46 (
        .y(_T_75),
        .a(io_in2_6),
        .b(io_in1_6)
    );
    wire [31:0] _T_76;
    TAIL #(.width(33), .n(1)) tail_47 (
        .y(_T_76),
        .in(_T_75)
    );
    wire [31:0] _T_77;
    ASSINT #(.width(32)) assint_48 (
        .y(_T_77),
        .in(_T_76)
    );
    wire [63:0] _T_78;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_49 (
        .y(_T_78),
        .a(_T_74),
        .b(_T_77)
    );
    wire [32:0] _T_79;
    SUB_SIGNED #(.width(32)) s_sub_50 (
        .y(_T_79),
        .a(io_in2_7),
        .b(io_in1_7)
    );
    wire [31:0] _T_80;
    TAIL #(.width(33), .n(1)) tail_51 (
        .y(_T_80),
        .in(_T_79)
    );
    wire [31:0] _T_81;
    ASSINT #(.width(32)) assint_52 (
        .y(_T_81),
        .in(_T_80)
    );
    wire [32:0] _T_82;
    SUB_SIGNED #(.width(32)) s_sub_53 (
        .y(_T_82),
        .a(io_in2_7),
        .b(io_in1_7)
    );
    wire [31:0] _T_83;
    TAIL #(.width(33), .n(1)) tail_54 (
        .y(_T_83),
        .in(_T_82)
    );
    wire [31:0] _T_84;
    ASSINT #(.width(32)) assint_55 (
        .y(_T_84),
        .in(_T_83)
    );
    wire [63:0] _T_85;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_56 (
        .y(_T_85),
        .a(_T_81),
        .b(_T_84)
    );
    wire [32:0] _T_86;
    SUB_SIGNED #(.width(32)) s_sub_57 (
        .y(_T_86),
        .a(io_in2_8),
        .b(io_in1_8)
    );
    wire [31:0] _T_87;
    TAIL #(.width(33), .n(1)) tail_58 (
        .y(_T_87),
        .in(_T_86)
    );
    wire [31:0] _T_88;
    ASSINT #(.width(32)) assint_59 (
        .y(_T_88),
        .in(_T_87)
    );
    wire [32:0] _T_89;
    SUB_SIGNED #(.width(32)) s_sub_60 (
        .y(_T_89),
        .a(io_in2_8),
        .b(io_in1_8)
    );
    wire [31:0] _T_90;
    TAIL #(.width(33), .n(1)) tail_61 (
        .y(_T_90),
        .in(_T_89)
    );
    wire [31:0] _T_91;
    ASSINT #(.width(32)) assint_62 (
        .y(_T_91),
        .in(_T_90)
    );
    wire [63:0] _T_92;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_63 (
        .y(_T_92),
        .a(_T_88),
        .b(_T_91)
    );
    wire [32:0] _T_93;
    SUB_SIGNED #(.width(32)) s_sub_64 (
        .y(_T_93),
        .a(io_in2_9),
        .b(io_in1_9)
    );
    wire [31:0] _T_94;
    TAIL #(.width(33), .n(1)) tail_65 (
        .y(_T_94),
        .in(_T_93)
    );
    wire [31:0] _T_95;
    ASSINT #(.width(32)) assint_66 (
        .y(_T_95),
        .in(_T_94)
    );
    wire [32:0] _T_96;
    SUB_SIGNED #(.width(32)) s_sub_67 (
        .y(_T_96),
        .a(io_in2_9),
        .b(io_in1_9)
    );
    wire [31:0] _T_97;
    TAIL #(.width(33), .n(1)) tail_68 (
        .y(_T_97),
        .in(_T_96)
    );
    wire [31:0] _T_98;
    ASSINT #(.width(32)) assint_69 (
        .y(_T_98),
        .in(_T_97)
    );
    wire [63:0] _T_99;
    MUL2_SIGNED #(.width_a(32), .width_b(32)) s_mul2_70 (
        .y(_T_99),
        .a(_T_95),
        .b(_T_98)
    );
    wire [64:0] _T_100;
    ADD_SIGNED #(.width(64)) s_add_71 (
        .y(_T_100),
        .a(_T_36),
        .b(_T_43)
    );
    wire [63:0] _T_101;
    TAIL #(.width(65), .n(1)) tail_72 (
        .y(_T_101),
        .in(_T_100)
    );
    wire [63:0] _T_102;
    ASSINT #(.width(64)) assint_73 (
        .y(_T_102),
        .in(_T_101)
    );
    wire [64:0] _T_103;
    ADD_SIGNED #(.width(64)) s_add_74 (
        .y(_T_103),
        .a(_T_102),
        .b(_T_50)
    );
    wire [63:0] _T_104;
    TAIL #(.width(65), .n(1)) tail_75 (
        .y(_T_104),
        .in(_T_103)
    );
    wire [63:0] _T_105;
    ASSINT #(.width(64)) assint_76 (
        .y(_T_105),
        .in(_T_104)
    );
    wire [64:0] _T_106;
    ADD_SIGNED #(.width(64)) s_add_77 (
        .y(_T_106),
        .a(_T_105),
        .b(_T_57)
    );
    wire [63:0] _T_107;
    TAIL #(.width(65), .n(1)) tail_78 (
        .y(_T_107),
        .in(_T_106)
    );
    wire [63:0] _T_108;
    ASSINT #(.width(64)) assint_79 (
        .y(_T_108),
        .in(_T_107)
    );
    wire [64:0] _T_109;
    ADD_SIGNED #(.width(64)) s_add_80 (
        .y(_T_109),
        .a(_T_108),
        .b(_T_64)
    );
    wire [63:0] _T_110;
    TAIL #(.width(65), .n(1)) tail_81 (
        .y(_T_110),
        .in(_T_109)
    );
    wire [63:0] _T_111;
    ASSINT #(.width(64)) assint_82 (
        .y(_T_111),
        .in(_T_110)
    );
    wire [64:0] _T_112;
    ADD_SIGNED #(.width(64)) s_add_83 (
        .y(_T_112),
        .a(_T_111),
        .b(_T_71)
    );
    wire [63:0] _T_113;
    TAIL #(.width(65), .n(1)) tail_84 (
        .y(_T_113),
        .in(_T_112)
    );
    wire [63:0] _T_114;
    ASSINT #(.width(64)) assint_85 (
        .y(_T_114),
        .in(_T_113)
    );
    wire [64:0] _T_115;
    ADD_SIGNED #(.width(64)) s_add_86 (
        .y(_T_115),
        .a(_T_114),
        .b(_T_78)
    );
    wire [63:0] _T_116;
    TAIL #(.width(65), .n(1)) tail_87 (
        .y(_T_116),
        .in(_T_115)
    );
    wire [63:0] _T_117;
    ASSINT #(.width(64)) assint_88 (
        .y(_T_117),
        .in(_T_116)
    );
    wire [64:0] _T_118;
    ADD_SIGNED #(.width(64)) s_add_89 (
        .y(_T_118),
        .a(_T_117),
        .b(_T_85)
    );
    wire [63:0] _T_119;
    TAIL #(.width(65), .n(1)) tail_90 (
        .y(_T_119),
        .in(_T_118)
    );
    wire [63:0] _T_120;
    ASSINT #(.width(64)) assint_91 (
        .y(_T_120),
        .in(_T_119)
    );
    wire [64:0] _T_121;
    ADD_SIGNED #(.width(64)) s_add_92 (
        .y(_T_121),
        .a(_T_120),
        .b(_T_92)
    );
    wire [63:0] _T_122;
    TAIL #(.width(65), .n(1)) tail_93 (
        .y(_T_122),
        .in(_T_121)
    );
    wire [63:0] _T_123;
    ASSINT #(.width(64)) assint_94 (
        .y(_T_123),
        .in(_T_122)
    );
    wire [64:0] _T_124;
    ADD_SIGNED #(.width(64)) s_add_95 (
        .y(_T_124),
        .a(_T_123),
        .b(_T_99)
    );
    wire [63:0] _T_125;
    TAIL #(.width(65), .n(1)) tail_96 (
        .y(_T_125),
        .in(_T_124)
    );
    wire [63:0] _T_126;
    ASSINT #(.width(64)) assint_97 (
        .y(_T_126),
        .in(_T_125)
    );
    wire [47:0] _node_0;
    SHR_SIGNED #(.width(64), .n(16)) s_shr_98 (
        .y(_node_0),
        .in(_T_126)
    );
    wire [31:0] _WTEMP_0;
    BITS #(.width(48), .high(31), .low(0)) bits_99 (
        .y(_WTEMP_0),
        .in(_node_0)
    );
    ASSINT #(.width(32)) assint_100 (
        .y(io_out),
        .in(_WTEMP_0)
    );
endmodule //SqDist
module SUB_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) - $signed(b);
endmodule // SUB_SIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
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
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
