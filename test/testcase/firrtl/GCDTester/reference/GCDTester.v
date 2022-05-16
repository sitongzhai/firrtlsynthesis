module GCDTester(
    input clock,
    input reset
);
    wire _dut__clock;
    wire _dut__reset;
    wire _dut__io_in_ready;
    wire _dut__io_in_valid;
    wire [31:0] _dut__io_in_bits_a;
    wire [31:0] _dut__io_in_bits_b;
    wire _dut__io_out_ready;
    wire _dut__io_out_valid;
    wire [31:0] _dut__io_out_bits;
    DecoupledGCD dut (
        .clock(_dut__clock),
        .reset(_dut__reset),
        .io_in_ready(_dut__io_in_ready),
        .io_in_valid(_dut__io_in_valid),
        .io_in_bits_a(_dut__io_in_bits_a),
        .io_in_bits_b(_dut__io_in_bits_b),
        .io_out_ready(_dut__io_out_ready),
        .io_out_valid(_dut__io_out_valid),
        .io_out_bits(_dut__io_out_bits)
    );
    wire [3:0] _count__q;
    wire [3:0] _count__d;
    DFF_POSCLK #(.width(4)) count (
        .q(_count__q),
        .d(_count__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_3;
    MUX_UNSIGNED #(.width(4)) u_mux_23 (
        .y(_count__d),
        .sel(reset),
        .a(4'h9),
        .b(_WTEMP_3)
    );
    wire [6:0] a_0;
    wire [6:0] a_1;
    wire [6:0] a_2;
    wire [6:0] a_3;
    wire [6:0] a_4;
    wire [6:0] a_5;
    wire [6:0] a_6;
    wire [6:0] a_7;
    wire [6:0] a_8;
    wire [6:0] a_9;
    wire [6:0] b_0;
    wire [6:0] b_1;
    wire [6:0] b_2;
    wire [6:0] b_3;
    wire [6:0] b_4;
    wire [6:0] b_5;
    wire [6:0] b_6;
    wire [6:0] b_7;
    wire [6:0] b_8;
    wire [6:0] b_9;
    wire [2:0] z_0;
    wire [2:0] z_1;
    wire [2:0] z_2;
    wire [2:0] z_3;
    wire [2:0] z_4;
    wire [2:0] z_5;
    wire [2:0] z_6;
    wire [2:0] z_7;
    wire [2:0] z_8;
    wire [2:0] z_9;
    wire _en__q;
    wire _en__d;
    DFF_POSCLK #(.width(1)) en (
        .q(_en__q),
        .d(_en__d),
        .clk(clock)
    );
    wire _WTEMP_4;
    MUX_UNSIGNED #(.width(1)) u_mux_24 (
        .y(_en__d),
        .sel(reset),
        .a(1'h1),
        .b(_WTEMP_4)
    );
    wire _node_4;
    EQ_UNSIGNED #(.width(4)) u_eq_25 (
        .y(_node_4),
        .a(4'd0),
        .b(_count__q)
    );
    wire [6:0] _node_5;
    assign _node_5 = a_0;
    wire _node_6;
    EQ_UNSIGNED #(.width(4)) u_eq_26 (
        .y(_node_6),
        .a(4'd1),
        .b(_count__q)
    );
    wire [6:0] _node_7;
    MUX_UNSIGNED #(.width(7)) u_mux_27 (
        .y(_node_7),
        .sel(_node_6),
        .a(a_1),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(4)) u_eq_28 (
        .y(_node_8),
        .a(4'd2),
        .b(_count__q)
    );
    wire [6:0] _node_9;
    MUX_UNSIGNED #(.width(7)) u_mux_29 (
        .y(_node_9),
        .sel(_node_8),
        .a(a_2),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(4)) u_eq_30 (
        .y(_node_10),
        .a(4'd3),
        .b(_count__q)
    );
    wire [6:0] _node_11;
    MUX_UNSIGNED #(.width(7)) u_mux_31 (
        .y(_node_11),
        .sel(_node_10),
        .a(a_3),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(4)) u_eq_32 (
        .y(_node_12),
        .a(4'd4),
        .b(_count__q)
    );
    wire [6:0] _node_13;
    MUX_UNSIGNED #(.width(7)) u_mux_33 (
        .y(_node_13),
        .sel(_node_12),
        .a(a_4),
        .b(_node_11)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(4)) u_eq_34 (
        .y(_node_14),
        .a(4'd5),
        .b(_count__q)
    );
    wire [6:0] _node_15;
    MUX_UNSIGNED #(.width(7)) u_mux_35 (
        .y(_node_15),
        .sel(_node_14),
        .a(a_5),
        .b(_node_13)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(4)) u_eq_36 (
        .y(_node_16),
        .a(4'd6),
        .b(_count__q)
    );
    wire [6:0] _node_17;
    MUX_UNSIGNED #(.width(7)) u_mux_37 (
        .y(_node_17),
        .sel(_node_16),
        .a(a_6),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(4)) u_eq_38 (
        .y(_node_18),
        .a(4'd7),
        .b(_count__q)
    );
    wire [6:0] _node_19;
    MUX_UNSIGNED #(.width(7)) u_mux_39 (
        .y(_node_19),
        .sel(_node_18),
        .a(a_7),
        .b(_node_17)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(4)) u_eq_40 (
        .y(_node_20),
        .a(4'd8),
        .b(_count__q)
    );
    wire [6:0] _node_21;
    MUX_UNSIGNED #(.width(7)) u_mux_41 (
        .y(_node_21),
        .sel(_node_20),
        .a(a_8),
        .b(_node_19)
    );
    wire _node_22;
    EQ_UNSIGNED #(.width(4)) u_eq_42 (
        .y(_node_22),
        .a(4'd9),
        .b(_count__q)
    );
    wire [6:0] _node_23;
    MUX_UNSIGNED #(.width(7)) u_mux_43 (
        .y(_node_23),
        .sel(_node_22),
        .a(a_9),
        .b(_node_21)
    );
    wire _node_24;
    EQ_UNSIGNED #(.width(4)) u_eq_44 (
        .y(_node_24),
        .a(4'd0),
        .b(_count__q)
    );
    wire [6:0] _node_25;
    assign _node_25 = b_0;
    wire _node_26;
    EQ_UNSIGNED #(.width(4)) u_eq_45 (
        .y(_node_26),
        .a(4'd1),
        .b(_count__q)
    );
    wire [6:0] _node_27;
    MUX_UNSIGNED #(.width(7)) u_mux_46 (
        .y(_node_27),
        .sel(_node_26),
        .a(b_1),
        .b(_node_25)
    );
    wire _node_28;
    EQ_UNSIGNED #(.width(4)) u_eq_47 (
        .y(_node_28),
        .a(4'd2),
        .b(_count__q)
    );
    wire [6:0] _node_29;
    MUX_UNSIGNED #(.width(7)) u_mux_48 (
        .y(_node_29),
        .sel(_node_28),
        .a(b_2),
        .b(_node_27)
    );
    wire _node_30;
    EQ_UNSIGNED #(.width(4)) u_eq_49 (
        .y(_node_30),
        .a(4'd3),
        .b(_count__q)
    );
    wire [6:0] _node_31;
    MUX_UNSIGNED #(.width(7)) u_mux_50 (
        .y(_node_31),
        .sel(_node_30),
        .a(b_3),
        .b(_node_29)
    );
    wire _node_32;
    EQ_UNSIGNED #(.width(4)) u_eq_51 (
        .y(_node_32),
        .a(4'd4),
        .b(_count__q)
    );
    wire [6:0] _node_33;
    MUX_UNSIGNED #(.width(7)) u_mux_52 (
        .y(_node_33),
        .sel(_node_32),
        .a(b_4),
        .b(_node_31)
    );
    wire _node_34;
    EQ_UNSIGNED #(.width(4)) u_eq_53 (
        .y(_node_34),
        .a(4'd5),
        .b(_count__q)
    );
    wire [6:0] _node_35;
    MUX_UNSIGNED #(.width(7)) u_mux_54 (
        .y(_node_35),
        .sel(_node_34),
        .a(b_5),
        .b(_node_33)
    );
    wire _node_36;
    EQ_UNSIGNED #(.width(4)) u_eq_55 (
        .y(_node_36),
        .a(4'd6),
        .b(_count__q)
    );
    wire [6:0] _node_37;
    MUX_UNSIGNED #(.width(7)) u_mux_56 (
        .y(_node_37),
        .sel(_node_36),
        .a(b_6),
        .b(_node_35)
    );
    wire _node_38;
    EQ_UNSIGNED #(.width(4)) u_eq_57 (
        .y(_node_38),
        .a(4'd7),
        .b(_count__q)
    );
    wire [6:0] _node_39;
    MUX_UNSIGNED #(.width(7)) u_mux_58 (
        .y(_node_39),
        .sel(_node_38),
        .a(b_7),
        .b(_node_37)
    );
    wire _node_40;
    EQ_UNSIGNED #(.width(4)) u_eq_59 (
        .y(_node_40),
        .a(4'd8),
        .b(_count__q)
    );
    wire [6:0] _node_41;
    MUX_UNSIGNED #(.width(7)) u_mux_60 (
        .y(_node_41),
        .sel(_node_40),
        .a(b_8),
        .b(_node_39)
    );
    wire _node_42;
    EQ_UNSIGNED #(.width(4)) u_eq_61 (
        .y(_node_42),
        .a(4'd9),
        .b(_count__q)
    );
    wire [6:0] _node_43;
    MUX_UNSIGNED #(.width(7)) u_mux_62 (
        .y(_node_43),
        .sel(_node_42),
        .a(b_9),
        .b(_node_41)
    );
    wire T_80;
    BITWISEAND #(.width(1)) bitwiseand_63 (
        .y(T_80),
        .a(_en__q),
        .b(_dut__io_in_ready)
    );
    wire T_83;
    EQ_UNSIGNED #(.width(1)) u_eq_64 (
        .y(T_83),
        .a(_en__q),
        .b(1'h0)
    );
    wire T_84;
    BITWISEAND #(.width(1)) bitwiseand_65 (
        .y(T_84),
        .a(_dut__io_out_valid),
        .b(T_83)
    );
    wire _node_44;
    EQ_UNSIGNED #(.width(4)) u_eq_66 (
        .y(_node_44),
        .a(4'd0),
        .b(_count__q)
    );
    wire [2:0] _node_45;
    assign _node_45 = z_0;
    wire _node_46;
    EQ_UNSIGNED #(.width(4)) u_eq_67 (
        .y(_node_46),
        .a(4'd1),
        .b(_count__q)
    );
    wire [2:0] _node_47;
    MUX_UNSIGNED #(.width(3)) u_mux_68 (
        .y(_node_47),
        .sel(_node_46),
        .a(z_1),
        .b(_node_45)
    );
    wire _node_48;
    EQ_UNSIGNED #(.width(4)) u_eq_69 (
        .y(_node_48),
        .a(4'd2),
        .b(_count__q)
    );
    wire [2:0] _node_49;
    MUX_UNSIGNED #(.width(3)) u_mux_70 (
        .y(_node_49),
        .sel(_node_48),
        .a(z_2),
        .b(_node_47)
    );
    wire _node_50;
    EQ_UNSIGNED #(.width(4)) u_eq_71 (
        .y(_node_50),
        .a(4'd3),
        .b(_count__q)
    );
    wire [2:0] _node_51;
    MUX_UNSIGNED #(.width(3)) u_mux_72 (
        .y(_node_51),
        .sel(_node_50),
        .a(z_3),
        .b(_node_49)
    );
    wire _node_52;
    EQ_UNSIGNED #(.width(4)) u_eq_73 (
        .y(_node_52),
        .a(4'd4),
        .b(_count__q)
    );
    wire [2:0] _node_53;
    MUX_UNSIGNED #(.width(3)) u_mux_74 (
        .y(_node_53),
        .sel(_node_52),
        .a(z_4),
        .b(_node_51)
    );
    wire _node_54;
    EQ_UNSIGNED #(.width(4)) u_eq_75 (
        .y(_node_54),
        .a(4'd5),
        .b(_count__q)
    );
    wire [2:0] _node_55;
    MUX_UNSIGNED #(.width(3)) u_mux_76 (
        .y(_node_55),
        .sel(_node_54),
        .a(z_5),
        .b(_node_53)
    );
    wire _node_56;
    EQ_UNSIGNED #(.width(4)) u_eq_77 (
        .y(_node_56),
        .a(4'd6),
        .b(_count__q)
    );
    wire [2:0] _node_57;
    MUX_UNSIGNED #(.width(3)) u_mux_78 (
        .y(_node_57),
        .sel(_node_56),
        .a(z_6),
        .b(_node_55)
    );
    wire _node_58;
    EQ_UNSIGNED #(.width(4)) u_eq_79 (
        .y(_node_58),
        .a(4'd7),
        .b(_count__q)
    );
    wire [2:0] _node_59;
    MUX_UNSIGNED #(.width(3)) u_mux_80 (
        .y(_node_59),
        .sel(_node_58),
        .a(z_7),
        .b(_node_57)
    );
    wire _node_60;
    EQ_UNSIGNED #(.width(4)) u_eq_81 (
        .y(_node_60),
        .a(4'd8),
        .b(_count__q)
    );
    wire [2:0] _node_61;
    MUX_UNSIGNED #(.width(3)) u_mux_82 (
        .y(_node_61),
        .sel(_node_60),
        .a(z_8),
        .b(_node_59)
    );
    wire _node_62;
    EQ_UNSIGNED #(.width(4)) u_eq_83 (
        .y(_node_62),
        .a(4'd9),
        .b(_count__q)
    );
    wire [2:0] _node_63;
    MUX_UNSIGNED #(.width(3)) u_mux_84 (
        .y(_node_63),
        .sel(_node_62),
        .a(z_9),
        .b(_node_61)
    );
    wire T_87;
    wire [31:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(32)) u_pad_85 (
        .y(_WTEMP_5),
        .in(_node_63)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_86 (
        .y(T_87),
        .a(_dut__io_out_bits),
        .b(_WTEMP_5)
    );
    wire T_89;
    EQ_UNSIGNED #(.width(1)) u_eq_87 (
        .y(T_89),
        .a(reset),
        .b(1'h0)
    );
    wire T_91;
    EQ_UNSIGNED #(.width(1)) u_eq_88 (
        .y(T_91),
        .a(T_87),
        .b(1'h0)
    );
    wire T_93;
    EQ_UNSIGNED #(.width(1)) u_eq_89 (
        .y(T_93),
        .a(reset),
        .b(1'h0)
    );
    wire T_95;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_90 (
        .y(_WTEMP_6),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_91 (
        .y(T_95),
        .a(_count__q),
        .b(_WTEMP_6)
    );
    wire T_97;
    EQ_UNSIGNED #(.width(1)) u_eq_92 (
        .y(T_97),
        .a(reset),
        .b(1'h0)
    );
    wire T_99;
    EQ_UNSIGNED #(.width(1)) u_eq_93 (
        .y(T_99),
        .a(T_95),
        .b(1'h0)
    );
    wire [4:0] T_102;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_94 (
        .y(_WTEMP_7),
        .in(1'h1)
    );
    SUB_UNSIGNED #(.width(4)) u_sub_95 (
        .y(T_102),
        .a(_count__q),
        .b(_WTEMP_7)
    );
    wire [3:0] T_103;
    TAIL #(.width(5), .n(1)) tail_96 (
        .y(T_103),
        .in(T_102)
    );
    wire _node_64;
    MUX_UNSIGNED #(.width(1)) u_mux_97 (
        .y(_node_64),
        .sel(T_80),
        .a(1'h0),
        .b(_en__q)
    );
    wire [3:0] _node_65;
    MUX_UNSIGNED #(.width(4)) u_mux_98 (
        .y(_node_65),
        .sel(T_99),
        .a(T_103),
        .b(_count__q)
    );
    wire _node_66;
    MUX_UNSIGNED #(.width(1)) u_mux_99 (
        .y(_node_66),
        .sel(T_99),
        .a(1'h1),
        .b(_node_64)
    );
    wire _node_67;
    MUX_UNSIGNED #(.width(1)) u_mux_100 (
        .y(_node_67),
        .sel(T_80),
        .a(1'h0),
        .b(_en__q)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_101 (
        .y(a_0),
        .in(6'h2E)
    );
    assign a_1 = 7'h5F;
    PAD_UNSIGNED #(.width(5), .n(7)) u_pad_102 (
        .y(a_2),
        .in(5'h1A)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_103 (
        .y(a_3),
        .in(6'h3D)
    );
    PAD_UNSIGNED #(.width(5), .n(7)) u_pad_104 (
        .y(a_4),
        .in(5'h12)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_105 (
        .y(a_5),
        .in(6'h33)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_106 (
        .y(a_6),
        .in(6'h2D)
    );
    assign a_7 = 7'h42;
    assign a_8 = 7'h47;
    assign a_9 = 7'h47;
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_107 (
        .y(b_0),
        .in(6'h27)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_108 (
        .y(b_1),
        .in(6'h2C)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_109 (
        .y(b_2),
        .in(6'h25)
    );
    assign b_3 = 7'h60;
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_110 (
        .y(b_4),
        .in(6'h30)
    );
    PAD_UNSIGNED #(.width(6), .n(7)) u_pad_111 (
        .y(b_5),
        .in(6'h27)
    );
    assign b_6 = 7'h55;
    assign b_7 = 7'h54;
    PAD_UNSIGNED #(.width(4), .n(7)) u_pad_112 (
        .y(b_8),
        .in(4'h8)
    );
    assign b_9 = 7'h50;
    MUX_UNSIGNED #(.width(4)) u_mux_113 (
        .y(_WTEMP_3),
        .sel(T_84),
        .a(_node_65),
        .b(_count__q)
    );
    assign _dut__clock = clock;
    PAD_UNSIGNED #(.width(7), .n(32)) u_pad_114 (
        .y(_dut__io_in_bits_a),
        .in(_node_23)
    );
    PAD_UNSIGNED #(.width(7), .n(32)) u_pad_115 (
        .y(_dut__io_in_bits_b),
        .in(_node_43)
    );
    assign _dut__io_in_valid = _en__q;
    MUX_UNSIGNED #(.width(1)) u_mux_116 (
        .y(_dut__io_out_ready),
        .sel(T_84),
        .a(1'h1),
        .b(1'h0)
    );
    assign _dut__reset = reset;
    MUX_UNSIGNED #(.width(1)) u_mux_117 (
        .y(_WTEMP_4),
        .sel(T_84),
        .a(_node_66),
        .b(_node_67)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_118 (
        .y(z_0),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_119 (
        .y(z_1),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_120 (
        .y(z_2),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_121 (
        .y(z_3),
        .in(1'h1)
    );
    assign z_4 = 3'h6;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_122 (
        .y(z_5),
        .in(2'h3)
    );
    assign z_6 = 3'h5;
    assign z_7 = 3'h6;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_123 (
        .y(z_8),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_124 (
        .y(z_9),
        .in(1'h1)
    );
endmodule //GCDTester
module DecoupledGCD(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits_a,
    input [31:0] io_in_bits_b,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _busy__q;
    wire _busy__d;
    DFF_POSCLK #(.width(1)) busy (
        .q(_busy__q),
        .d(_busy__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire _done__q;
    wire _done__d;
    DFF_POSCLK #(.width(1)) done (
        .q(_done__q),
        .d(_done__d),
        .clk(clock)
    );
    wire _WTEMP_1;
    MUX_UNSIGNED #(.width(1)) u_mux_2 (
        .y(_done__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_1)
    );
    wire [31:0] _x__q;
    wire [31:0] _x__d;
    DFF_POSCLK #(.width(32)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(clock)
    );
    wire [31:0] _y__q;
    wire [31:0] _y__d;
    DFF_POSCLK #(.width(32)) y (
        .q(_y__q),
        .d(_y__d),
        .clk(clock)
    );
    wire T_40;
    EQ_UNSIGNED #(.width(1)) u_eq_3 (
        .y(T_40),
        .a(_busy__q),
        .b(1'h0)
    );
    wire T_42;
    wire [31:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_4 (
        .y(_WTEMP_2),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_5 (
        .y(T_42),
        .a(_y__q),
        .b(_WTEMP_2)
    );
    wire T_43;
    BITWISEAND #(.width(1)) bitwiseand_6 (
        .y(T_43),
        .a(_busy__q),
        .b(T_42)
    );
    wire T_45;
    BITWISEAND #(.width(1)) bitwiseand_7 (
        .y(T_45),
        .a(_done__q),
        .b(io_out_ready)
    );
    wire start;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(start),
        .a(io_in_valid),
        .b(io_in_ready)
    );
    wire _node_0;
    MUX_UNSIGNED #(.width(1)) u_mux_9 (
        .y(_node_0),
        .sel(T_45),
        .a(1'h0),
        .b(_busy__q)
    );
    wire _node_1;
    MUX_UNSIGNED #(.width(1)) u_mux_10 (
        .y(_node_1),
        .sel(T_43),
        .a(1'h1),
        .b(_done__q)
    );
    wire T_50;
    GT_UNSIGNED #(.width(32)) u_gt_11 (
        .y(T_50),
        .a(_x__q),
        .b(_y__q)
    );
    wire [32:0] T_51;
    SUB_UNSIGNED #(.width(32)) u_sub_12 (
        .y(T_51),
        .a(_x__q),
        .b(_y__q)
    );
    wire [31:0] T_52;
    TAIL #(.width(33), .n(1)) tail_13 (
        .y(T_52),
        .in(T_51)
    );
    wire T_54;
    EQ_UNSIGNED #(.width(1)) u_eq_14 (
        .y(T_54),
        .a(T_50),
        .b(1'h0)
    );
    wire [32:0] T_55;
    SUB_UNSIGNED #(.width(32)) u_sub_15 (
        .y(T_55),
        .a(_y__q),
        .b(_x__q)
    );
    wire [31:0] T_56;
    TAIL #(.width(33), .n(1)) tail_16 (
        .y(T_56),
        .in(T_55)
    );
    wire [31:0] _node_2;
    MUX_UNSIGNED #(.width(32)) u_mux_17 (
        .y(_node_2),
        .sel(T_50),
        .a(T_52),
        .b(_x__q)
    );
    wire [31:0] _node_3;
    MUX_UNSIGNED #(.width(32)) u_mux_18 (
        .y(_node_3),
        .sel(T_54),
        .a(T_56),
        .b(_y__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_19 (
        .y(_WTEMP_0),
        .sel(start),
        .a(1'h1),
        .b(_node_0)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_20 (
        .y(_WTEMP_1),
        .sel(start),
        .a(1'h0),
        .b(_node_1)
    );
    assign io_in_ready = T_40;
    assign io_out_bits = _x__q;
    assign io_out_valid = _done__q;
    MUX_UNSIGNED #(.width(32)) u_mux_21 (
        .y(_x__d),
        .sel(start),
        .a(io_in_bits_a),
        .b(_node_2)
    );
    MUX_UNSIGNED #(.width(32)) u_mux_22 (
        .y(_y__d),
        .sel(start),
        .a(io_in_bits_b),
        .b(_node_3)
    );
endmodule //DecoupledGCD
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
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
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
