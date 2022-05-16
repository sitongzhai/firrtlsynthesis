module SmallOdds4Tester(
    input clock,
    input reset
);
    wire _device_under_test__clock;
    wire _device_under_test__reset;
    wire _device_under_test__io_in_ready;
    wire _device_under_test__io_in_valid;
    wire [31:0] _device_under_test__io_in_bits;
    wire _device_under_test__io_out_ready;
    wire _device_under_test__io_out_valid;
    wire [31:0] _device_under_test__io_out_bits;
    SmallOdds4 device_under_test (
        .clock(_device_under_test__clock),
        .reset(_device_under_test__reset),
        .io_in_ready(_device_under_test__io_in_ready),
        .io_in_valid(_device_under_test__io_in_valid),
        .io_in_bits(_device_under_test__io_in_bits),
        .io_out_ready(_device_under_test__io_out_ready),
        .io_out_valid(_device_under_test__io_out_valid),
        .io_out_bits(_device_under_test__io_out_bits)
    );
    wire [6:0] __T_4__q;
    wire [6:0] __T_4__d;
    DFF_POSCLK #(.width(7)) _T_4 (
        .q(__T_4__q),
        .d(__T_4__d),
        .clk(clock)
    );
    wire [6:0] _WTEMP_4;
    MUX_UNSIGNED #(.width(7)) u_mux_24 (
        .y(__T_4__d),
        .sel(reset),
        .a(7'h0),
        .b(_WTEMP_4)
    );
    wire __T_7__q;
    wire __T_7__d;
    DFF_POSCLK #(.width(1)) _T_7 (
        .q(__T_7__q),
        .d(__T_7__d),
        .clk(clock)
    );
    wire _WTEMP_5;
    MUX_UNSIGNED #(.width(1)) u_mux_25 (
        .y(__T_7__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_5)
    );
    wire [4:0] __T_10__q;
    wire [4:0] __T_10__d;
    DFF_POSCLK #(.width(5)) _T_10 (
        .q(__T_10__q),
        .d(__T_10__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_6;
    MUX_UNSIGNED #(.width(5)) u_mux_26 (
        .y(__T_10__d),
        .sel(reset),
        .a(5'h0),
        .b(_WTEMP_6)
    );
    wire __T_13__q;
    wire __T_13__d;
    DFF_POSCLK #(.width(1)) _T_13 (
        .q(__T_13__q),
        .d(__T_13__d),
        .clk(clock)
    );
    wire _WTEMP_7;
    MUX_UNSIGNED #(.width(1)) u_mux_27 (
        .y(__T_13__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_7)
    );
    wire _T_14;
    BITWISEAND #(.width(1)) bitwiseand_28 (
        .y(_T_14),
        .a(__T_7__q),
        .b(__T_13__q)
    );
    wire _T_16;
    EQ_UNSIGNED #(.width(1)) u_eq_29 (
        .y(_T_16),
        .a(reset),
        .b(1'h0)
    );
    wire _T_18;
    EQ_UNSIGNED #(.width(1)) u_eq_30 (
        .y(_T_18),
        .a(reset),
        .b(1'h0)
    );
    wire [11:0] __T_21__q;
    wire [11:0] __T_21__d;
    DFF_POSCLK #(.width(12)) _T_21 (
        .q(__T_21__q),
        .d(__T_21__d),
        .clk(clock)
    );
    wire [11:0] _WTEMP_8;
    MUX_UNSIGNED #(.width(12)) u_mux_31 (
        .y(__T_21__d),
        .sel(reset),
        .a(12'h0),
        .b(_WTEMP_8)
    );
    wire [12:0] _T_23;
    wire [11:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(1), .n(12)) u_pad_32 (
        .y(_WTEMP_9),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(12)) u_add_33 (
        .y(_T_23),
        .a(__T_21__q),
        .b(_WTEMP_9)
    );
    wire [11:0] _T_24;
    TAIL #(.width(13), .n(1)) tail_34 (
        .y(_T_24),
        .in(_T_23)
    );
    wire _T_26;
    GT_UNSIGNED #(.width(12)) u_gt_35 (
        .y(_T_26),
        .a(__T_21__q),
        .b(12'hFA0)
    );
    wire _T_29;
    EQ_UNSIGNED #(.width(1)) u_eq_36 (
        .y(_T_29),
        .a(reset),
        .b(1'h0)
    );
    wire _T_31;
    EQ_UNSIGNED #(.width(1)) u_eq_37 (
        .y(_T_31),
        .a(reset),
        .b(1'h0)
    );
    wire _T_66_0;
    wire _T_66_1;
    wire _T_66_2;
    wire _T_66_3;
    wire _T_66_4;
    wire _T_66_5;
    wire _T_66_6;
    wire _T_66_7;
    wire _T_66_8;
    wire _T_66_9;
    wire _T_66_10;
    wire _T_66_11;
    wire _T_66_12;
    wire _T_66_13;
    wire _T_66_14;
    wire _T_66_15;
    wire _T_66_16;
    wire _T_66_17;
    wire _T_66_18;
    wire _T_66_19;
    wire _T_66_20;
    wire _T_66_21;
    wire _T_66_22;
    wire _T_66_23;
    wire _T_66_24;
    wire _T_66_25;
    wire _T_66_26;
    wire _T_66_27;
    wire _T_66_28;
    wire _T_66_29;
    wire _T_66_30;
    wire _T_66_31;
    wire [4:0] _value__q;
    wire [4:0] _value__d;
    DFF_POSCLK #(.width(5)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_10;
    MUX_UNSIGNED #(.width(5)) u_mux_38 (
        .y(_value__d),
        .sel(reset),
        .a(5'h0),
        .b(_WTEMP_10)
    );
    wire [4:0] _T_137_0;
    wire [4:0] _T_137_1;
    wire [4:0] _T_137_2;
    wire [4:0] _T_137_3;
    wire [4:0] _T_137_4;
    wire [4:0] _T_137_5;
    wire [4:0] _T_137_6;
    wire [4:0] _T_137_7;
    wire [4:0] _T_137_8;
    wire [4:0] _T_137_9;
    wire [4:0] _T_137_10;
    wire [4:0] _T_137_11;
    wire [4:0] _T_137_12;
    wire [4:0] _T_137_13;
    wire [4:0] _T_137_14;
    wire [4:0] _T_137_15;
    wire [4:0] _T_137_16;
    wire [4:0] _T_137_17;
    wire [4:0] _T_137_18;
    wire [4:0] _T_137_19;
    wire [4:0] _T_137_20;
    wire [4:0] _T_137_21;
    wire [4:0] _T_137_22;
    wire [4:0] _T_137_23;
    wire [4:0] _T_137_24;
    wire [4:0] _T_137_25;
    wire [4:0] _T_137_26;
    wire [4:0] _T_137_27;
    wire [4:0] _T_137_28;
    wire [4:0] _T_137_29;
    wire [4:0] _T_137_30;
    wire [4:0] _T_137_31;
    wire _node_0;
    EQ_UNSIGNED #(.width(5)) u_eq_39 (
        .y(_node_0),
        .a(5'd0),
        .b(_value__q)
    );
    wire [4:0] _node_1;
    assign _node_1 = _T_137_0;
    wire _node_2;
    EQ_UNSIGNED #(.width(5)) u_eq_40 (
        .y(_node_2),
        .a(5'd1),
        .b(_value__q)
    );
    wire [4:0] _node_3;
    MUX_UNSIGNED #(.width(5)) u_mux_41 (
        .y(_node_3),
        .sel(_node_2),
        .a(_T_137_1),
        .b(_node_1)
    );
    wire _node_4;
    EQ_UNSIGNED #(.width(5)) u_eq_42 (
        .y(_node_4),
        .a(5'd2),
        .b(_value__q)
    );
    wire [4:0] _node_5;
    MUX_UNSIGNED #(.width(5)) u_mux_43 (
        .y(_node_5),
        .sel(_node_4),
        .a(_T_137_2),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(5)) u_eq_44 (
        .y(_node_6),
        .a(5'd3),
        .b(_value__q)
    );
    wire [4:0] _node_7;
    MUX_UNSIGNED #(.width(5)) u_mux_45 (
        .y(_node_7),
        .sel(_node_6),
        .a(_T_137_3),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(5)) u_eq_46 (
        .y(_node_8),
        .a(5'd4),
        .b(_value__q)
    );
    wire [4:0] _node_9;
    MUX_UNSIGNED #(.width(5)) u_mux_47 (
        .y(_node_9),
        .sel(_node_8),
        .a(_T_137_4),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(5)) u_eq_48 (
        .y(_node_10),
        .a(5'd5),
        .b(_value__q)
    );
    wire [4:0] _node_11;
    MUX_UNSIGNED #(.width(5)) u_mux_49 (
        .y(_node_11),
        .sel(_node_10),
        .a(_T_137_5),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(5)) u_eq_50 (
        .y(_node_12),
        .a(5'd6),
        .b(_value__q)
    );
    wire [4:0] _node_13;
    MUX_UNSIGNED #(.width(5)) u_mux_51 (
        .y(_node_13),
        .sel(_node_12),
        .a(_T_137_6),
        .b(_node_11)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(5)) u_eq_52 (
        .y(_node_14),
        .a(5'd7),
        .b(_value__q)
    );
    wire [4:0] _node_15;
    MUX_UNSIGNED #(.width(5)) u_mux_53 (
        .y(_node_15),
        .sel(_node_14),
        .a(_T_137_7),
        .b(_node_13)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(5)) u_eq_54 (
        .y(_node_16),
        .a(5'd8),
        .b(_value__q)
    );
    wire [4:0] _node_17;
    MUX_UNSIGNED #(.width(5)) u_mux_55 (
        .y(_node_17),
        .sel(_node_16),
        .a(_T_137_8),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(5)) u_eq_56 (
        .y(_node_18),
        .a(5'd9),
        .b(_value__q)
    );
    wire [4:0] _node_19;
    MUX_UNSIGNED #(.width(5)) u_mux_57 (
        .y(_node_19),
        .sel(_node_18),
        .a(_T_137_9),
        .b(_node_17)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(5)) u_eq_58 (
        .y(_node_20),
        .a(5'd10),
        .b(_value__q)
    );
    wire [4:0] _node_21;
    MUX_UNSIGNED #(.width(5)) u_mux_59 (
        .y(_node_21),
        .sel(_node_20),
        .a(_T_137_10),
        .b(_node_19)
    );
    wire _node_22;
    EQ_UNSIGNED #(.width(5)) u_eq_60 (
        .y(_node_22),
        .a(5'd11),
        .b(_value__q)
    );
    wire [4:0] _node_23;
    MUX_UNSIGNED #(.width(5)) u_mux_61 (
        .y(_node_23),
        .sel(_node_22),
        .a(_T_137_11),
        .b(_node_21)
    );
    wire _node_24;
    EQ_UNSIGNED #(.width(5)) u_eq_62 (
        .y(_node_24),
        .a(5'd12),
        .b(_value__q)
    );
    wire [4:0] _node_25;
    MUX_UNSIGNED #(.width(5)) u_mux_63 (
        .y(_node_25),
        .sel(_node_24),
        .a(_T_137_12),
        .b(_node_23)
    );
    wire _node_26;
    EQ_UNSIGNED #(.width(5)) u_eq_64 (
        .y(_node_26),
        .a(5'd13),
        .b(_value__q)
    );
    wire [4:0] _node_27;
    MUX_UNSIGNED #(.width(5)) u_mux_65 (
        .y(_node_27),
        .sel(_node_26),
        .a(_T_137_13),
        .b(_node_25)
    );
    wire _node_28;
    EQ_UNSIGNED #(.width(5)) u_eq_66 (
        .y(_node_28),
        .a(5'd14),
        .b(_value__q)
    );
    wire [4:0] _node_29;
    MUX_UNSIGNED #(.width(5)) u_mux_67 (
        .y(_node_29),
        .sel(_node_28),
        .a(_T_137_14),
        .b(_node_27)
    );
    wire _node_30;
    EQ_UNSIGNED #(.width(5)) u_eq_68 (
        .y(_node_30),
        .a(5'd15),
        .b(_value__q)
    );
    wire [4:0] _node_31;
    MUX_UNSIGNED #(.width(5)) u_mux_69 (
        .y(_node_31),
        .sel(_node_30),
        .a(_T_137_15),
        .b(_node_29)
    );
    wire _node_32;
    EQ_UNSIGNED #(.width(5)) u_eq_70 (
        .y(_node_32),
        .a(5'd16),
        .b(_value__q)
    );
    wire [4:0] _node_33;
    MUX_UNSIGNED #(.width(5)) u_mux_71 (
        .y(_node_33),
        .sel(_node_32),
        .a(_T_137_16),
        .b(_node_31)
    );
    wire _node_34;
    EQ_UNSIGNED #(.width(5)) u_eq_72 (
        .y(_node_34),
        .a(5'd17),
        .b(_value__q)
    );
    wire [4:0] _node_35;
    MUX_UNSIGNED #(.width(5)) u_mux_73 (
        .y(_node_35),
        .sel(_node_34),
        .a(_T_137_17),
        .b(_node_33)
    );
    wire _node_36;
    EQ_UNSIGNED #(.width(5)) u_eq_74 (
        .y(_node_36),
        .a(5'd18),
        .b(_value__q)
    );
    wire [4:0] _node_37;
    MUX_UNSIGNED #(.width(5)) u_mux_75 (
        .y(_node_37),
        .sel(_node_36),
        .a(_T_137_18),
        .b(_node_35)
    );
    wire _node_38;
    EQ_UNSIGNED #(.width(5)) u_eq_76 (
        .y(_node_38),
        .a(5'd19),
        .b(_value__q)
    );
    wire [4:0] _node_39;
    MUX_UNSIGNED #(.width(5)) u_mux_77 (
        .y(_node_39),
        .sel(_node_38),
        .a(_T_137_19),
        .b(_node_37)
    );
    wire _node_40;
    EQ_UNSIGNED #(.width(5)) u_eq_78 (
        .y(_node_40),
        .a(5'd20),
        .b(_value__q)
    );
    wire [4:0] _node_41;
    MUX_UNSIGNED #(.width(5)) u_mux_79 (
        .y(_node_41),
        .sel(_node_40),
        .a(_T_137_20),
        .b(_node_39)
    );
    wire _node_42;
    EQ_UNSIGNED #(.width(5)) u_eq_80 (
        .y(_node_42),
        .a(5'd21),
        .b(_value__q)
    );
    wire [4:0] _node_43;
    MUX_UNSIGNED #(.width(5)) u_mux_81 (
        .y(_node_43),
        .sel(_node_42),
        .a(_T_137_21),
        .b(_node_41)
    );
    wire _node_44;
    EQ_UNSIGNED #(.width(5)) u_eq_82 (
        .y(_node_44),
        .a(5'd22),
        .b(_value__q)
    );
    wire [4:0] _node_45;
    MUX_UNSIGNED #(.width(5)) u_mux_83 (
        .y(_node_45),
        .sel(_node_44),
        .a(_T_137_22),
        .b(_node_43)
    );
    wire _node_46;
    EQ_UNSIGNED #(.width(5)) u_eq_84 (
        .y(_node_46),
        .a(5'd23),
        .b(_value__q)
    );
    wire [4:0] _node_47;
    MUX_UNSIGNED #(.width(5)) u_mux_85 (
        .y(_node_47),
        .sel(_node_46),
        .a(_T_137_23),
        .b(_node_45)
    );
    wire _node_48;
    EQ_UNSIGNED #(.width(5)) u_eq_86 (
        .y(_node_48),
        .a(5'd24),
        .b(_value__q)
    );
    wire [4:0] _node_49;
    MUX_UNSIGNED #(.width(5)) u_mux_87 (
        .y(_node_49),
        .sel(_node_48),
        .a(_T_137_24),
        .b(_node_47)
    );
    wire _node_50;
    EQ_UNSIGNED #(.width(5)) u_eq_88 (
        .y(_node_50),
        .a(5'd25),
        .b(_value__q)
    );
    wire [4:0] _node_51;
    MUX_UNSIGNED #(.width(5)) u_mux_89 (
        .y(_node_51),
        .sel(_node_50),
        .a(_T_137_25),
        .b(_node_49)
    );
    wire _node_52;
    EQ_UNSIGNED #(.width(5)) u_eq_90 (
        .y(_node_52),
        .a(5'd26),
        .b(_value__q)
    );
    wire [4:0] _node_53;
    MUX_UNSIGNED #(.width(5)) u_mux_91 (
        .y(_node_53),
        .sel(_node_52),
        .a(_T_137_26),
        .b(_node_51)
    );
    wire _node_54;
    EQ_UNSIGNED #(.width(5)) u_eq_92 (
        .y(_node_54),
        .a(5'd27),
        .b(_value__q)
    );
    wire [4:0] _node_55;
    MUX_UNSIGNED #(.width(5)) u_mux_93 (
        .y(_node_55),
        .sel(_node_54),
        .a(_T_137_27),
        .b(_node_53)
    );
    wire _node_56;
    EQ_UNSIGNED #(.width(5)) u_eq_94 (
        .y(_node_56),
        .a(5'd28),
        .b(_value__q)
    );
    wire [4:0] _node_57;
    MUX_UNSIGNED #(.width(5)) u_mux_95 (
        .y(_node_57),
        .sel(_node_56),
        .a(_T_137_28),
        .b(_node_55)
    );
    wire _node_58;
    EQ_UNSIGNED #(.width(5)) u_eq_96 (
        .y(_node_58),
        .a(5'd29),
        .b(_value__q)
    );
    wire [4:0] _node_59;
    MUX_UNSIGNED #(.width(5)) u_mux_97 (
        .y(_node_59),
        .sel(_node_58),
        .a(_T_137_29),
        .b(_node_57)
    );
    wire _node_60;
    EQ_UNSIGNED #(.width(5)) u_eq_98 (
        .y(_node_60),
        .a(5'd30),
        .b(_value__q)
    );
    wire [4:0] _node_61;
    MUX_UNSIGNED #(.width(5)) u_mux_99 (
        .y(_node_61),
        .sel(_node_60),
        .a(_T_137_30),
        .b(_node_59)
    );
    wire _node_62;
    EQ_UNSIGNED #(.width(5)) u_eq_100 (
        .y(_node_62),
        .a(5'd31),
        .b(_value__q)
    );
    wire [4:0] _node_63;
    MUX_UNSIGNED #(.width(5)) u_mux_101 (
        .y(_node_63),
        .sel(_node_62),
        .a(_T_137_31),
        .b(_node_61)
    );
    wire [4:0] _T_174;
    BITS #(.width(7), .high(4), .low(0)) bits_102 (
        .y(_T_174),
        .in(__T_4__q)
    );
    wire _node_64;
    EQ_UNSIGNED #(.width(5)) u_eq_103 (
        .y(_node_64),
        .a(5'd0),
        .b(_T_174)
    );
    wire _node_65;
    assign _node_65 = _T_66_0;
    wire _node_66;
    EQ_UNSIGNED #(.width(5)) u_eq_104 (
        .y(_node_66),
        .a(5'd1),
        .b(_T_174)
    );
    wire _node_67;
    MUX_UNSIGNED #(.width(1)) u_mux_105 (
        .y(_node_67),
        .sel(_node_66),
        .a(_T_66_1),
        .b(_node_65)
    );
    wire _node_68;
    EQ_UNSIGNED #(.width(5)) u_eq_106 (
        .y(_node_68),
        .a(5'd2),
        .b(_T_174)
    );
    wire _node_69;
    MUX_UNSIGNED #(.width(1)) u_mux_107 (
        .y(_node_69),
        .sel(_node_68),
        .a(_T_66_2),
        .b(_node_67)
    );
    wire _node_70;
    EQ_UNSIGNED #(.width(5)) u_eq_108 (
        .y(_node_70),
        .a(5'd3),
        .b(_T_174)
    );
    wire _node_71;
    MUX_UNSIGNED #(.width(1)) u_mux_109 (
        .y(_node_71),
        .sel(_node_70),
        .a(_T_66_3),
        .b(_node_69)
    );
    wire _node_72;
    EQ_UNSIGNED #(.width(5)) u_eq_110 (
        .y(_node_72),
        .a(5'd4),
        .b(_T_174)
    );
    wire _node_73;
    MUX_UNSIGNED #(.width(1)) u_mux_111 (
        .y(_node_73),
        .sel(_node_72),
        .a(_T_66_4),
        .b(_node_71)
    );
    wire _node_74;
    EQ_UNSIGNED #(.width(5)) u_eq_112 (
        .y(_node_74),
        .a(5'd5),
        .b(_T_174)
    );
    wire _node_75;
    MUX_UNSIGNED #(.width(1)) u_mux_113 (
        .y(_node_75),
        .sel(_node_74),
        .a(_T_66_5),
        .b(_node_73)
    );
    wire _node_76;
    EQ_UNSIGNED #(.width(5)) u_eq_114 (
        .y(_node_76),
        .a(5'd6),
        .b(_T_174)
    );
    wire _node_77;
    MUX_UNSIGNED #(.width(1)) u_mux_115 (
        .y(_node_77),
        .sel(_node_76),
        .a(_T_66_6),
        .b(_node_75)
    );
    wire _node_78;
    EQ_UNSIGNED #(.width(5)) u_eq_116 (
        .y(_node_78),
        .a(5'd7),
        .b(_T_174)
    );
    wire _node_79;
    MUX_UNSIGNED #(.width(1)) u_mux_117 (
        .y(_node_79),
        .sel(_node_78),
        .a(_T_66_7),
        .b(_node_77)
    );
    wire _node_80;
    EQ_UNSIGNED #(.width(5)) u_eq_118 (
        .y(_node_80),
        .a(5'd8),
        .b(_T_174)
    );
    wire _node_81;
    MUX_UNSIGNED #(.width(1)) u_mux_119 (
        .y(_node_81),
        .sel(_node_80),
        .a(_T_66_8),
        .b(_node_79)
    );
    wire _node_82;
    EQ_UNSIGNED #(.width(5)) u_eq_120 (
        .y(_node_82),
        .a(5'd9),
        .b(_T_174)
    );
    wire _node_83;
    MUX_UNSIGNED #(.width(1)) u_mux_121 (
        .y(_node_83),
        .sel(_node_82),
        .a(_T_66_9),
        .b(_node_81)
    );
    wire _node_84;
    EQ_UNSIGNED #(.width(5)) u_eq_122 (
        .y(_node_84),
        .a(5'd10),
        .b(_T_174)
    );
    wire _node_85;
    MUX_UNSIGNED #(.width(1)) u_mux_123 (
        .y(_node_85),
        .sel(_node_84),
        .a(_T_66_10),
        .b(_node_83)
    );
    wire _node_86;
    EQ_UNSIGNED #(.width(5)) u_eq_124 (
        .y(_node_86),
        .a(5'd11),
        .b(_T_174)
    );
    wire _node_87;
    MUX_UNSIGNED #(.width(1)) u_mux_125 (
        .y(_node_87),
        .sel(_node_86),
        .a(_T_66_11),
        .b(_node_85)
    );
    wire _node_88;
    EQ_UNSIGNED #(.width(5)) u_eq_126 (
        .y(_node_88),
        .a(5'd12),
        .b(_T_174)
    );
    wire _node_89;
    MUX_UNSIGNED #(.width(1)) u_mux_127 (
        .y(_node_89),
        .sel(_node_88),
        .a(_T_66_12),
        .b(_node_87)
    );
    wire _node_90;
    EQ_UNSIGNED #(.width(5)) u_eq_128 (
        .y(_node_90),
        .a(5'd13),
        .b(_T_174)
    );
    wire _node_91;
    MUX_UNSIGNED #(.width(1)) u_mux_129 (
        .y(_node_91),
        .sel(_node_90),
        .a(_T_66_13),
        .b(_node_89)
    );
    wire _node_92;
    EQ_UNSIGNED #(.width(5)) u_eq_130 (
        .y(_node_92),
        .a(5'd14),
        .b(_T_174)
    );
    wire _node_93;
    MUX_UNSIGNED #(.width(1)) u_mux_131 (
        .y(_node_93),
        .sel(_node_92),
        .a(_T_66_14),
        .b(_node_91)
    );
    wire _node_94;
    EQ_UNSIGNED #(.width(5)) u_eq_132 (
        .y(_node_94),
        .a(5'd15),
        .b(_T_174)
    );
    wire _node_95;
    MUX_UNSIGNED #(.width(1)) u_mux_133 (
        .y(_node_95),
        .sel(_node_94),
        .a(_T_66_15),
        .b(_node_93)
    );
    wire _node_96;
    EQ_UNSIGNED #(.width(5)) u_eq_134 (
        .y(_node_96),
        .a(5'd16),
        .b(_T_174)
    );
    wire _node_97;
    MUX_UNSIGNED #(.width(1)) u_mux_135 (
        .y(_node_97),
        .sel(_node_96),
        .a(_T_66_16),
        .b(_node_95)
    );
    wire _node_98;
    EQ_UNSIGNED #(.width(5)) u_eq_136 (
        .y(_node_98),
        .a(5'd17),
        .b(_T_174)
    );
    wire _node_99;
    MUX_UNSIGNED #(.width(1)) u_mux_137 (
        .y(_node_99),
        .sel(_node_98),
        .a(_T_66_17),
        .b(_node_97)
    );
    wire _node_100;
    EQ_UNSIGNED #(.width(5)) u_eq_138 (
        .y(_node_100),
        .a(5'd18),
        .b(_T_174)
    );
    wire _node_101;
    MUX_UNSIGNED #(.width(1)) u_mux_139 (
        .y(_node_101),
        .sel(_node_100),
        .a(_T_66_18),
        .b(_node_99)
    );
    wire _node_102;
    EQ_UNSIGNED #(.width(5)) u_eq_140 (
        .y(_node_102),
        .a(5'd19),
        .b(_T_174)
    );
    wire _node_103;
    MUX_UNSIGNED #(.width(1)) u_mux_141 (
        .y(_node_103),
        .sel(_node_102),
        .a(_T_66_19),
        .b(_node_101)
    );
    wire _node_104;
    EQ_UNSIGNED #(.width(5)) u_eq_142 (
        .y(_node_104),
        .a(5'd20),
        .b(_T_174)
    );
    wire _node_105;
    MUX_UNSIGNED #(.width(1)) u_mux_143 (
        .y(_node_105),
        .sel(_node_104),
        .a(_T_66_20),
        .b(_node_103)
    );
    wire _node_106;
    EQ_UNSIGNED #(.width(5)) u_eq_144 (
        .y(_node_106),
        .a(5'd21),
        .b(_T_174)
    );
    wire _node_107;
    MUX_UNSIGNED #(.width(1)) u_mux_145 (
        .y(_node_107),
        .sel(_node_106),
        .a(_T_66_21),
        .b(_node_105)
    );
    wire _node_108;
    EQ_UNSIGNED #(.width(5)) u_eq_146 (
        .y(_node_108),
        .a(5'd22),
        .b(_T_174)
    );
    wire _node_109;
    MUX_UNSIGNED #(.width(1)) u_mux_147 (
        .y(_node_109),
        .sel(_node_108),
        .a(_T_66_22),
        .b(_node_107)
    );
    wire _node_110;
    EQ_UNSIGNED #(.width(5)) u_eq_148 (
        .y(_node_110),
        .a(5'd23),
        .b(_T_174)
    );
    wire _node_111;
    MUX_UNSIGNED #(.width(1)) u_mux_149 (
        .y(_node_111),
        .sel(_node_110),
        .a(_T_66_23),
        .b(_node_109)
    );
    wire _node_112;
    EQ_UNSIGNED #(.width(5)) u_eq_150 (
        .y(_node_112),
        .a(5'd24),
        .b(_T_174)
    );
    wire _node_113;
    MUX_UNSIGNED #(.width(1)) u_mux_151 (
        .y(_node_113),
        .sel(_node_112),
        .a(_T_66_24),
        .b(_node_111)
    );
    wire _node_114;
    EQ_UNSIGNED #(.width(5)) u_eq_152 (
        .y(_node_114),
        .a(5'd25),
        .b(_T_174)
    );
    wire _node_115;
    MUX_UNSIGNED #(.width(1)) u_mux_153 (
        .y(_node_115),
        .sel(_node_114),
        .a(_T_66_25),
        .b(_node_113)
    );
    wire _node_116;
    EQ_UNSIGNED #(.width(5)) u_eq_154 (
        .y(_node_116),
        .a(5'd26),
        .b(_T_174)
    );
    wire _node_117;
    MUX_UNSIGNED #(.width(1)) u_mux_155 (
        .y(_node_117),
        .sel(_node_116),
        .a(_T_66_26),
        .b(_node_115)
    );
    wire _node_118;
    EQ_UNSIGNED #(.width(5)) u_eq_156 (
        .y(_node_118),
        .a(5'd27),
        .b(_T_174)
    );
    wire _node_119;
    MUX_UNSIGNED #(.width(1)) u_mux_157 (
        .y(_node_119),
        .sel(_node_118),
        .a(_T_66_27),
        .b(_node_117)
    );
    wire _node_120;
    EQ_UNSIGNED #(.width(5)) u_eq_158 (
        .y(_node_120),
        .a(5'd28),
        .b(_T_174)
    );
    wire _node_121;
    MUX_UNSIGNED #(.width(1)) u_mux_159 (
        .y(_node_121),
        .sel(_node_120),
        .a(_T_66_28),
        .b(_node_119)
    );
    wire _node_122;
    EQ_UNSIGNED #(.width(5)) u_eq_160 (
        .y(_node_122),
        .a(5'd29),
        .b(_T_174)
    );
    wire _node_123;
    MUX_UNSIGNED #(.width(1)) u_mux_161 (
        .y(_node_123),
        .sel(_node_122),
        .a(_T_66_29),
        .b(_node_121)
    );
    wire _node_124;
    EQ_UNSIGNED #(.width(5)) u_eq_162 (
        .y(_node_124),
        .a(5'd30),
        .b(_T_174)
    );
    wire _node_125;
    MUX_UNSIGNED #(.width(1)) u_mux_163 (
        .y(_node_125),
        .sel(_node_124),
        .a(_T_66_30),
        .b(_node_123)
    );
    wire _node_126;
    EQ_UNSIGNED #(.width(5)) u_eq_164 (
        .y(_node_126),
        .a(5'd31),
        .b(_T_174)
    );
    wire _node_127;
    MUX_UNSIGNED #(.width(1)) u_mux_165 (
        .y(_node_127),
        .sel(_node_126),
        .a(_T_66_31),
        .b(_node_125)
    );
    wire _T_175;
    BITWISEAND #(.width(1)) bitwiseand_166 (
        .y(_T_175),
        .a(_device_under_test__io_in_valid),
        .b(_device_under_test__io_in_ready)
    );
    wire _T_177;
    EQ_UNSIGNED #(.width(5)) u_eq_167 (
        .y(_T_177),
        .a(_value__q),
        .b(5'h1E)
    );
    wire [5:0] _T_179;
    wire [4:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_168 (
        .y(_WTEMP_11),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(5)) u_add_169 (
        .y(_T_179),
        .a(_value__q),
        .b(_WTEMP_11)
    );
    wire [4:0] _T_180;
    TAIL #(.width(6), .n(1)) tail_170 (
        .y(_T_180),
        .in(_T_179)
    );
    wire _T_183;
    EQ_UNSIGNED #(.width(1)) u_eq_171 (
        .y(_T_183),
        .a(__T_7__q),
        .b(1'h0)
    );
    wire _T_185;
    wire [6:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(5), .n(7)) u_pad_172 (
        .y(_WTEMP_12),
        .in(5'h1E)
    );
    EQ_UNSIGNED #(.width(7)) u_eq_173 (
        .y(_T_185),
        .a(__T_4__q),
        .b(_WTEMP_12)
    );
    wire [7:0] _T_188;
    wire [6:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(1), .n(7)) u_pad_174 (
        .y(_WTEMP_13),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(7)) u_add_175 (
        .y(_T_188),
        .a(__T_4__q),
        .b(_WTEMP_13)
    );
    wire [6:0] _T_189;
    TAIL #(.width(8), .n(1)) tail_176 (
        .y(_T_189),
        .in(_T_188)
    );
    wire _node_128;
    MUX_UNSIGNED #(.width(1)) u_mux_177 (
        .y(_node_128),
        .sel(_T_185),
        .a(1'h1),
        .b(__T_7__q)
    );
    wire [6:0] _node_129;
    MUX_UNSIGNED #(.width(7)) u_mux_178 (
        .y(_node_129),
        .sel(_T_183),
        .a(_T_189),
        .b(__T_4__q)
    );
    wire _node_130;
    MUX_UNSIGNED #(.width(1)) u_mux_179 (
        .y(_node_130),
        .sel(_T_183),
        .a(_node_128),
        .b(__T_7__q)
    );
    wire [4:0] _node_131;
    wire [4:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_180 (
        .y(_WTEMP_14),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_181 (
        .y(_node_131),
        .sel(_T_177),
        .a(_WTEMP_14),
        .b(_T_180)
    );
    wire _T_224_0;
    wire _T_224_1;
    wire _T_224_2;
    wire _T_224_3;
    wire _T_224_4;
    wire _T_224_5;
    wire _T_224_6;
    wire _T_224_7;
    wire _T_224_8;
    wire _T_224_9;
    wire _T_224_10;
    wire _T_224_11;
    wire _T_224_12;
    wire _T_224_13;
    wire _T_224_14;
    wire _T_224_15;
    wire _T_224_16;
    wire _T_224_17;
    wire _T_224_18;
    wire _T_224_19;
    wire _T_224_20;
    wire _T_224_21;
    wire _T_224_22;
    wire _T_224_23;
    wire _T_224_24;
    wire _T_224_25;
    wire _T_224_26;
    wire _T_224_27;
    wire _T_224_28;
    wire _T_224_29;
    wire _T_224_30;
    wire _T_224_31;
    wire [2:0] _value_1__q;
    wire [2:0] _value_1__d;
    DFF_POSCLK #(.width(3)) value_1 (
        .q(_value_1__q),
        .d(_value_1__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_15;
    MUX_UNSIGNED #(.width(3)) u_mux_182 (
        .y(_value_1__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_15)
    );
    wire [2:0] _T_272_0;
    wire [2:0] _T_272_1;
    wire [2:0] _T_272_2;
    wire [2:0] _T_272_3;
    wire [2:0] _T_272_4;
    wire [2:0] _T_272_5;
    wire [2:0] _T_272_6;
    wire [2:0] _T_272_7;
    wire [2:0] _T_272_8;
    wire _node_132;
    EQ_UNSIGNED #(.width(5)) u_eq_183 (
        .y(_node_132),
        .a(5'd0),
        .b(__T_10__q)
    );
    wire _node_133;
    assign _node_133 = _T_224_0;
    wire _node_134;
    EQ_UNSIGNED #(.width(5)) u_eq_184 (
        .y(_node_134),
        .a(5'd1),
        .b(__T_10__q)
    );
    wire _node_135;
    MUX_UNSIGNED #(.width(1)) u_mux_185 (
        .y(_node_135),
        .sel(_node_134),
        .a(_T_224_1),
        .b(_node_133)
    );
    wire _node_136;
    EQ_UNSIGNED #(.width(5)) u_eq_186 (
        .y(_node_136),
        .a(5'd2),
        .b(__T_10__q)
    );
    wire _node_137;
    MUX_UNSIGNED #(.width(1)) u_mux_187 (
        .y(_node_137),
        .sel(_node_136),
        .a(_T_224_2),
        .b(_node_135)
    );
    wire _node_138;
    EQ_UNSIGNED #(.width(5)) u_eq_188 (
        .y(_node_138),
        .a(5'd3),
        .b(__T_10__q)
    );
    wire _node_139;
    MUX_UNSIGNED #(.width(1)) u_mux_189 (
        .y(_node_139),
        .sel(_node_138),
        .a(_T_224_3),
        .b(_node_137)
    );
    wire _node_140;
    EQ_UNSIGNED #(.width(5)) u_eq_190 (
        .y(_node_140),
        .a(5'd4),
        .b(__T_10__q)
    );
    wire _node_141;
    MUX_UNSIGNED #(.width(1)) u_mux_191 (
        .y(_node_141),
        .sel(_node_140),
        .a(_T_224_4),
        .b(_node_139)
    );
    wire _node_142;
    EQ_UNSIGNED #(.width(5)) u_eq_192 (
        .y(_node_142),
        .a(5'd5),
        .b(__T_10__q)
    );
    wire _node_143;
    MUX_UNSIGNED #(.width(1)) u_mux_193 (
        .y(_node_143),
        .sel(_node_142),
        .a(_T_224_5),
        .b(_node_141)
    );
    wire _node_144;
    EQ_UNSIGNED #(.width(5)) u_eq_194 (
        .y(_node_144),
        .a(5'd6),
        .b(__T_10__q)
    );
    wire _node_145;
    MUX_UNSIGNED #(.width(1)) u_mux_195 (
        .y(_node_145),
        .sel(_node_144),
        .a(_T_224_6),
        .b(_node_143)
    );
    wire _node_146;
    EQ_UNSIGNED #(.width(5)) u_eq_196 (
        .y(_node_146),
        .a(5'd7),
        .b(__T_10__q)
    );
    wire _node_147;
    MUX_UNSIGNED #(.width(1)) u_mux_197 (
        .y(_node_147),
        .sel(_node_146),
        .a(_T_224_7),
        .b(_node_145)
    );
    wire _node_148;
    EQ_UNSIGNED #(.width(5)) u_eq_198 (
        .y(_node_148),
        .a(5'd8),
        .b(__T_10__q)
    );
    wire _node_149;
    MUX_UNSIGNED #(.width(1)) u_mux_199 (
        .y(_node_149),
        .sel(_node_148),
        .a(_T_224_8),
        .b(_node_147)
    );
    wire _node_150;
    EQ_UNSIGNED #(.width(5)) u_eq_200 (
        .y(_node_150),
        .a(5'd9),
        .b(__T_10__q)
    );
    wire _node_151;
    MUX_UNSIGNED #(.width(1)) u_mux_201 (
        .y(_node_151),
        .sel(_node_150),
        .a(_T_224_9),
        .b(_node_149)
    );
    wire _node_152;
    EQ_UNSIGNED #(.width(5)) u_eq_202 (
        .y(_node_152),
        .a(5'd10),
        .b(__T_10__q)
    );
    wire _node_153;
    MUX_UNSIGNED #(.width(1)) u_mux_203 (
        .y(_node_153),
        .sel(_node_152),
        .a(_T_224_10),
        .b(_node_151)
    );
    wire _node_154;
    EQ_UNSIGNED #(.width(5)) u_eq_204 (
        .y(_node_154),
        .a(5'd11),
        .b(__T_10__q)
    );
    wire _node_155;
    MUX_UNSIGNED #(.width(1)) u_mux_205 (
        .y(_node_155),
        .sel(_node_154),
        .a(_T_224_11),
        .b(_node_153)
    );
    wire _node_156;
    EQ_UNSIGNED #(.width(5)) u_eq_206 (
        .y(_node_156),
        .a(5'd12),
        .b(__T_10__q)
    );
    wire _node_157;
    MUX_UNSIGNED #(.width(1)) u_mux_207 (
        .y(_node_157),
        .sel(_node_156),
        .a(_T_224_12),
        .b(_node_155)
    );
    wire _node_158;
    EQ_UNSIGNED #(.width(5)) u_eq_208 (
        .y(_node_158),
        .a(5'd13),
        .b(__T_10__q)
    );
    wire _node_159;
    MUX_UNSIGNED #(.width(1)) u_mux_209 (
        .y(_node_159),
        .sel(_node_158),
        .a(_T_224_13),
        .b(_node_157)
    );
    wire _node_160;
    EQ_UNSIGNED #(.width(5)) u_eq_210 (
        .y(_node_160),
        .a(5'd14),
        .b(__T_10__q)
    );
    wire _node_161;
    MUX_UNSIGNED #(.width(1)) u_mux_211 (
        .y(_node_161),
        .sel(_node_160),
        .a(_T_224_14),
        .b(_node_159)
    );
    wire _node_162;
    EQ_UNSIGNED #(.width(5)) u_eq_212 (
        .y(_node_162),
        .a(5'd15),
        .b(__T_10__q)
    );
    wire _node_163;
    MUX_UNSIGNED #(.width(1)) u_mux_213 (
        .y(_node_163),
        .sel(_node_162),
        .a(_T_224_15),
        .b(_node_161)
    );
    wire _node_164;
    EQ_UNSIGNED #(.width(5)) u_eq_214 (
        .y(_node_164),
        .a(5'd16),
        .b(__T_10__q)
    );
    wire _node_165;
    MUX_UNSIGNED #(.width(1)) u_mux_215 (
        .y(_node_165),
        .sel(_node_164),
        .a(_T_224_16),
        .b(_node_163)
    );
    wire _node_166;
    EQ_UNSIGNED #(.width(5)) u_eq_216 (
        .y(_node_166),
        .a(5'd17),
        .b(__T_10__q)
    );
    wire _node_167;
    MUX_UNSIGNED #(.width(1)) u_mux_217 (
        .y(_node_167),
        .sel(_node_166),
        .a(_T_224_17),
        .b(_node_165)
    );
    wire _node_168;
    EQ_UNSIGNED #(.width(5)) u_eq_218 (
        .y(_node_168),
        .a(5'd18),
        .b(__T_10__q)
    );
    wire _node_169;
    MUX_UNSIGNED #(.width(1)) u_mux_219 (
        .y(_node_169),
        .sel(_node_168),
        .a(_T_224_18),
        .b(_node_167)
    );
    wire _node_170;
    EQ_UNSIGNED #(.width(5)) u_eq_220 (
        .y(_node_170),
        .a(5'd19),
        .b(__T_10__q)
    );
    wire _node_171;
    MUX_UNSIGNED #(.width(1)) u_mux_221 (
        .y(_node_171),
        .sel(_node_170),
        .a(_T_224_19),
        .b(_node_169)
    );
    wire _node_172;
    EQ_UNSIGNED #(.width(5)) u_eq_222 (
        .y(_node_172),
        .a(5'd20),
        .b(__T_10__q)
    );
    wire _node_173;
    MUX_UNSIGNED #(.width(1)) u_mux_223 (
        .y(_node_173),
        .sel(_node_172),
        .a(_T_224_20),
        .b(_node_171)
    );
    wire _node_174;
    EQ_UNSIGNED #(.width(5)) u_eq_224 (
        .y(_node_174),
        .a(5'd21),
        .b(__T_10__q)
    );
    wire _node_175;
    MUX_UNSIGNED #(.width(1)) u_mux_225 (
        .y(_node_175),
        .sel(_node_174),
        .a(_T_224_21),
        .b(_node_173)
    );
    wire _node_176;
    EQ_UNSIGNED #(.width(5)) u_eq_226 (
        .y(_node_176),
        .a(5'd22),
        .b(__T_10__q)
    );
    wire _node_177;
    MUX_UNSIGNED #(.width(1)) u_mux_227 (
        .y(_node_177),
        .sel(_node_176),
        .a(_T_224_22),
        .b(_node_175)
    );
    wire _node_178;
    EQ_UNSIGNED #(.width(5)) u_eq_228 (
        .y(_node_178),
        .a(5'd23),
        .b(__T_10__q)
    );
    wire _node_179;
    MUX_UNSIGNED #(.width(1)) u_mux_229 (
        .y(_node_179),
        .sel(_node_178),
        .a(_T_224_23),
        .b(_node_177)
    );
    wire _node_180;
    EQ_UNSIGNED #(.width(5)) u_eq_230 (
        .y(_node_180),
        .a(5'd24),
        .b(__T_10__q)
    );
    wire _node_181;
    MUX_UNSIGNED #(.width(1)) u_mux_231 (
        .y(_node_181),
        .sel(_node_180),
        .a(_T_224_24),
        .b(_node_179)
    );
    wire _node_182;
    EQ_UNSIGNED #(.width(5)) u_eq_232 (
        .y(_node_182),
        .a(5'd25),
        .b(__T_10__q)
    );
    wire _node_183;
    MUX_UNSIGNED #(.width(1)) u_mux_233 (
        .y(_node_183),
        .sel(_node_182),
        .a(_T_224_25),
        .b(_node_181)
    );
    wire _node_184;
    EQ_UNSIGNED #(.width(5)) u_eq_234 (
        .y(_node_184),
        .a(5'd26),
        .b(__T_10__q)
    );
    wire _node_185;
    MUX_UNSIGNED #(.width(1)) u_mux_235 (
        .y(_node_185),
        .sel(_node_184),
        .a(_T_224_26),
        .b(_node_183)
    );
    wire _node_186;
    EQ_UNSIGNED #(.width(5)) u_eq_236 (
        .y(_node_186),
        .a(5'd27),
        .b(__T_10__q)
    );
    wire _node_187;
    MUX_UNSIGNED #(.width(1)) u_mux_237 (
        .y(_node_187),
        .sel(_node_186),
        .a(_T_224_27),
        .b(_node_185)
    );
    wire _node_188;
    EQ_UNSIGNED #(.width(5)) u_eq_238 (
        .y(_node_188),
        .a(5'd28),
        .b(__T_10__q)
    );
    wire _node_189;
    MUX_UNSIGNED #(.width(1)) u_mux_239 (
        .y(_node_189),
        .sel(_node_188),
        .a(_T_224_28),
        .b(_node_187)
    );
    wire _node_190;
    EQ_UNSIGNED #(.width(5)) u_eq_240 (
        .y(_node_190),
        .a(5'd29),
        .b(__T_10__q)
    );
    wire _node_191;
    MUX_UNSIGNED #(.width(1)) u_mux_241 (
        .y(_node_191),
        .sel(_node_190),
        .a(_T_224_29),
        .b(_node_189)
    );
    wire _node_192;
    EQ_UNSIGNED #(.width(5)) u_eq_242 (
        .y(_node_192),
        .a(5'd30),
        .b(__T_10__q)
    );
    wire _node_193;
    MUX_UNSIGNED #(.width(1)) u_mux_243 (
        .y(_node_193),
        .sel(_node_192),
        .a(_T_224_30),
        .b(_node_191)
    );
    wire _node_194;
    EQ_UNSIGNED #(.width(5)) u_eq_244 (
        .y(_node_194),
        .a(5'd31),
        .b(__T_10__q)
    );
    wire _node_195;
    MUX_UNSIGNED #(.width(1)) u_mux_245 (
        .y(_node_195),
        .sel(_node_194),
        .a(_T_224_31),
        .b(_node_193)
    );
    wire _T_285;
    BITWISEAND #(.width(1)) bitwiseand_246 (
        .y(_T_285),
        .a(_device_under_test__io_out_ready),
        .b(_device_under_test__io_out_valid)
    );
    wire _T_288;
    EQ_UNSIGNED #(.width(1)) u_eq_247 (
        .y(_T_288),
        .a(reset),
        .b(1'h0)
    );
    wire _node_196;
    wire [3:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_248 (
        .y(_WTEMP_16),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_249 (
        .y(_node_196),
        .a(4'd0),
        .b(_WTEMP_16)
    );
    wire [2:0] _node_197;
    assign _node_197 = _T_272_0;
    wire _node_198;
    wire [3:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_250 (
        .y(_WTEMP_17),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_251 (
        .y(_node_198),
        .a(4'd1),
        .b(_WTEMP_17)
    );
    wire [2:0] _node_199;
    MUX_UNSIGNED #(.width(3)) u_mux_252 (
        .y(_node_199),
        .sel(_node_198),
        .a(_T_272_1),
        .b(_node_197)
    );
    wire _node_200;
    wire [3:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_253 (
        .y(_WTEMP_18),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_254 (
        .y(_node_200),
        .a(4'd2),
        .b(_WTEMP_18)
    );
    wire [2:0] _node_201;
    MUX_UNSIGNED #(.width(3)) u_mux_255 (
        .y(_node_201),
        .sel(_node_200),
        .a(_T_272_2),
        .b(_node_199)
    );
    wire _node_202;
    wire [3:0] _WTEMP_19;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_256 (
        .y(_WTEMP_19),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_257 (
        .y(_node_202),
        .a(4'd3),
        .b(_WTEMP_19)
    );
    wire [2:0] _node_203;
    MUX_UNSIGNED #(.width(3)) u_mux_258 (
        .y(_node_203),
        .sel(_node_202),
        .a(_T_272_3),
        .b(_node_201)
    );
    wire _node_204;
    wire [3:0] _WTEMP_20;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_259 (
        .y(_WTEMP_20),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_260 (
        .y(_node_204),
        .a(4'd4),
        .b(_WTEMP_20)
    );
    wire [2:0] _node_205;
    MUX_UNSIGNED #(.width(3)) u_mux_261 (
        .y(_node_205),
        .sel(_node_204),
        .a(_T_272_4),
        .b(_node_203)
    );
    wire _node_206;
    wire [3:0] _WTEMP_21;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_262 (
        .y(_WTEMP_21),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_263 (
        .y(_node_206),
        .a(4'd5),
        .b(_WTEMP_21)
    );
    wire [2:0] _node_207;
    MUX_UNSIGNED #(.width(3)) u_mux_264 (
        .y(_node_207),
        .sel(_node_206),
        .a(_T_272_5),
        .b(_node_205)
    );
    wire _node_208;
    wire [3:0] _WTEMP_22;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_265 (
        .y(_WTEMP_22),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_266 (
        .y(_node_208),
        .a(4'd6),
        .b(_WTEMP_22)
    );
    wire [2:0] _node_209;
    MUX_UNSIGNED #(.width(3)) u_mux_267 (
        .y(_node_209),
        .sel(_node_208),
        .a(_T_272_6),
        .b(_node_207)
    );
    wire _node_210;
    wire [3:0] _WTEMP_23;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_268 (
        .y(_WTEMP_23),
        .in(_value_1__q)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_269 (
        .y(_node_210),
        .a(4'd7),
        .b(_WTEMP_23)
    );
    wire [2:0] _node_211;
    MUX_UNSIGNED #(.width(3)) u_mux_270 (
        .y(_node_211),
        .sel(_node_210),
        .a(_T_272_7),
        .b(_node_209)
    );
    wire _T_290;
    wire [31:0] _WTEMP_24;
    PAD_UNSIGNED #(.width(3), .n(32)) u_pad_271 (
        .y(_WTEMP_24),
        .in(_node_211)
    );
    NEQ_UNSIGNED #(.width(32)) u_neq_272 (
        .y(_T_290),
        .a(_device_under_test__io_out_bits),
        .b(_WTEMP_24)
    );
    wire _T_293;
    EQ_UNSIGNED #(.width(1)) u_eq_273 (
        .y(_T_293),
        .a(reset),
        .b(1'h0)
    );
    wire _T_295;
    BITWISEOR #(.width(1)) bitwiseor_274 (
        .y(_T_295),
        .a(1'h0),
        .b(reset)
    );
    wire _T_297;
    EQ_UNSIGNED #(.width(1)) u_eq_275 (
        .y(_T_297),
        .a(_T_295),
        .b(1'h0)
    );
    wire _T_299;
    EQ_UNSIGNED #(.width(1)) u_eq_276 (
        .y(_T_299),
        .a(reset),
        .b(1'h0)
    );
    wire _T_301;
    EQ_UNSIGNED #(.width(3)) u_eq_277 (
        .y(_T_301),
        .a(_value_1__q),
        .b(3'h7)
    );
    wire [3:0] _T_303;
    wire [2:0] _WTEMP_25;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_278 (
        .y(_WTEMP_25),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_279 (
        .y(_T_303),
        .a(_value_1__q),
        .b(_WTEMP_25)
    );
    wire [2:0] _T_304;
    TAIL #(.width(4), .n(1)) tail_280 (
        .y(_T_304),
        .in(_T_303)
    );
    wire _T_306;
    EQ_UNSIGNED #(.width(1)) u_eq_281 (
        .y(_T_306),
        .a(__T_13__q),
        .b(1'h0)
    );
    wire _T_308;
    wire [4:0] _WTEMP_26;
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_282 (
        .y(_WTEMP_26),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(5)) u_eq_283 (
        .y(_T_308),
        .a(__T_10__q),
        .b(_WTEMP_26)
    );
    wire [5:0] _T_311;
    wire [4:0] _WTEMP_27;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_284 (
        .y(_WTEMP_27),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(5)) u_add_285 (
        .y(_T_311),
        .a(__T_10__q),
        .b(_WTEMP_27)
    );
    wire [4:0] _T_312;
    TAIL #(.width(6), .n(1)) tail_286 (
        .y(_T_312),
        .in(_T_311)
    );
    wire _node_212;
    MUX_UNSIGNED #(.width(1)) u_mux_287 (
        .y(_node_212),
        .sel(_T_308),
        .a(1'h1),
        .b(__T_13__q)
    );
    wire [4:0] _node_213;
    MUX_UNSIGNED #(.width(5)) u_mux_288 (
        .y(_node_213),
        .sel(_T_306),
        .a(_T_312),
        .b(__T_10__q)
    );
    wire _node_214;
    MUX_UNSIGNED #(.width(1)) u_mux_289 (
        .y(_node_214),
        .sel(_T_306),
        .a(_node_212),
        .b(__T_13__q)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_290 (
        .y(_WTEMP_6),
        .sel(_T_285),
        .a(_node_213),
        .b(__T_10__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_291 (
        .y(_WTEMP_7),
        .sel(_T_285),
        .a(_node_214),
        .b(__T_13__q)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_292 (
        .y(_T_137_0),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_293 (
        .y(_T_137_1),
        .in(4'h8)
    );
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_294 (
        .y(_T_137_10),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_295 (
        .y(_T_137_11),
        .in(3'h5)
    );
    assign _T_137_12 = 5'h11;
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_296 (
        .y(_T_137_13),
        .in(3'h7)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_297 (
        .y(_T_137_14),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_298 (
        .y(_T_137_15),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_299 (
        .y(_T_137_16),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_300 (
        .y(_T_137_17),
        .in(4'hD)
    );
    assign _T_137_18 = 5'h12;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_301 (
        .y(_T_137_19),
        .in(4'hF)
    );
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_302 (
        .y(_T_137_2),
        .in(3'h4)
    );
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_303 (
        .y(_T_137_20),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_304 (
        .y(_T_137_21),
        .in(4'hF)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_305 (
        .y(_T_137_22),
        .in(4'hF)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_306 (
        .y(_T_137_23),
        .in(4'hA)
    );
    assign _T_137_24 = 5'h12;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_307 (
        .y(_T_137_25),
        .in(4'hB)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_308 (
        .y(_T_137_26),
        .in(4'hE)
    );
    assign _T_137_27 = 5'h10;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_309 (
        .y(_T_137_28),
        .in(4'hC)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_310 (
        .y(_T_137_29),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(3), .n(5)) u_pad_311 (
        .y(_T_137_3),
        .in(3'h7)
    );
    assign _T_137_30 = 5'h13;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_312 (
        .y(_T_137_31),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_313 (
        .y(_T_137_4),
        .in(4'hC)
    );
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_314 (
        .y(_T_137_5),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_315 (
        .y(_T_137_6),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_316 (
        .y(_T_137_7),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_317 (
        .y(_T_137_8),
        .in(4'hC)
    );
    PAD_UNSIGNED #(.width(2), .n(5)) u_pad_318 (
        .y(_T_137_9),
        .in(2'h3)
    );
    assign _WTEMP_8 = _T_24;
    assign _T_224_0 = 1'h1;
    assign _T_224_1 = 1'h1;
    assign _T_224_10 = 1'h0;
    assign _T_224_11 = 1'h0;
    assign _T_224_12 = 1'h0;
    assign _T_224_13 = 1'h0;
    assign _T_224_14 = 1'h0;
    assign _T_224_15 = 1'h0;
    assign _T_224_16 = 1'h0;
    assign _T_224_17 = 1'h0;
    assign _T_224_18 = 1'h0;
    assign _T_224_19 = 1'h0;
    assign _T_224_2 = 1'h1;
    assign _T_224_20 = 1'h0;
    assign _T_224_21 = 1'h0;
    assign _T_224_22 = 1'h0;
    assign _T_224_23 = 1'h0;
    assign _T_224_24 = 1'h0;
    assign _T_224_25 = 1'h0;
    assign _T_224_26 = 1'h0;
    assign _T_224_27 = 1'h0;
    assign _T_224_28 = 1'h0;
    assign _T_224_29 = 1'h0;
    assign _T_224_3 = 1'h1;
    assign _T_224_30 = 1'h0;
    assign _T_224_31 = 1'h0;
    assign _T_224_4 = 1'h1;
    assign _T_224_5 = 1'h1;
    assign _T_224_6 = 1'h1;
    assign _T_224_7 = 1'h1;
    assign _T_224_8 = 1'h0;
    assign _T_224_9 = 1'h0;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_319 (
        .y(_T_272_0),
        .in(2'h3)
    );
    assign _T_272_1 = 3'h7;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_320 (
        .y(_T_272_2),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_321 (
        .y(_T_272_3),
        .in(2'h3)
    );
    assign _T_272_4 = 3'h5;
    assign _T_272_5 = 3'h5;
    assign _T_272_6 = 3'h7;
    assign _T_272_7 = 3'h5;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_322 (
        .y(_T_272_8),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(7)) u_mux_323 (
        .y(_WTEMP_4),
        .sel(_T_175),
        .a(_node_129),
        .b(__T_4__q)
    );
    assign _T_66_0 = 1'h1;
    assign _T_66_1 = 1'h1;
    assign _T_66_10 = 1'h1;
    assign _T_66_11 = 1'h1;
    assign _T_66_12 = 1'h1;
    assign _T_66_13 = 1'h1;
    assign _T_66_14 = 1'h1;
    assign _T_66_15 = 1'h1;
    assign _T_66_16 = 1'h1;
    assign _T_66_17 = 1'h1;
    assign _T_66_18 = 1'h1;
    assign _T_66_19 = 1'h1;
    assign _T_66_2 = 1'h1;
    assign _T_66_20 = 1'h1;
    assign _T_66_21 = 1'h1;
    assign _T_66_22 = 1'h1;
    assign _T_66_23 = 1'h1;
    assign _T_66_24 = 1'h1;
    assign _T_66_25 = 1'h1;
    assign _T_66_26 = 1'h1;
    assign _T_66_27 = 1'h1;
    assign _T_66_28 = 1'h1;
    assign _T_66_29 = 1'h1;
    assign _T_66_3 = 1'h1;
    assign _T_66_30 = 1'h1;
    assign _T_66_31 = 1'h0;
    assign _T_66_4 = 1'h1;
    assign _T_66_5 = 1'h1;
    assign _T_66_6 = 1'h1;
    assign _T_66_7 = 1'h1;
    assign _T_66_8 = 1'h1;
    assign _T_66_9 = 1'h1;
    MUX_UNSIGNED #(.width(1)) u_mux_324 (
        .y(_WTEMP_5),
        .sel(_T_175),
        .a(_node_130),
        .b(__T_7__q)
    );
    assign _device_under_test__clock = clock;
    PAD_UNSIGNED #(.width(5), .n(32)) u_pad_325 (
        .y(_device_under_test__io_in_bits),
        .in(_node_63)
    );
    assign _device_under_test__io_in_valid = _node_127;
    assign _device_under_test__io_out_ready = _node_195;
    assign _device_under_test__reset = reset;
    MUX_UNSIGNED #(.width(5)) u_mux_326 (
        .y(_WTEMP_10),
        .sel(_T_175),
        .a(_node_131),
        .b(_value__q)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_327 (
        .y(_WTEMP_15),
        .sel(_T_285),
        .a(_T_304),
        .b(_value_1__q)
    );
endmodule //SmallOdds4Tester
module SmallOdds4(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _SmallOdds4Filter__clock;
    wire _SmallOdds4Filter__reset;
    wire _SmallOdds4Filter__io_in_ready;
    wire _SmallOdds4Filter__io_in_valid;
    wire [31:0] _SmallOdds4Filter__io_in_bits;
    wire _SmallOdds4Filter__io_out_ready;
    wire _SmallOdds4Filter__io_out_valid;
    wire [31:0] _SmallOdds4Filter__io_out_bits;
    SmallOdds4Filter SmallOdds4Filter (
        .clock(_SmallOdds4Filter__clock),
        .reset(_SmallOdds4Filter__reset),
        .io_in_ready(_SmallOdds4Filter__io_in_ready),
        .io_in_valid(_SmallOdds4Filter__io_in_valid),
        .io_in_bits(_SmallOdds4Filter__io_in_bits),
        .io_out_ready(_SmallOdds4Filter__io_out_ready),
        .io_out_valid(_SmallOdds4Filter__io_out_valid),
        .io_out_bits(_SmallOdds4Filter__io_out_bits)
    );
    wire _Queue__clock;
    wire _Queue__reset;
    wire _Queue__io_enq_ready;
    wire _Queue__io_enq_valid;
    wire [31:0] _Queue__io_enq_bits;
    wire _Queue__io_deq_ready;
    wire _Queue__io_deq_valid;
    wire [31:0] _Queue__io_deq_bits;
    wire _Queue__io_count;
    Queue Queue (
        .clock(_Queue__clock),
        .reset(_Queue__reset),
        .io_enq_ready(_Queue__io_enq_ready),
        .io_enq_valid(_Queue__io_enq_valid),
        .io_enq_bits(_Queue__io_enq_bits),
        .io_deq_ready(_Queue__io_deq_ready),
        .io_deq_valid(_Queue__io_deq_valid),
        .io_deq_bits(_Queue__io_deq_bits),
        .io_count(_Queue__io_count)
    );
    wire _SmallOdds4Filter_1__clock;
    wire _SmallOdds4Filter_1__reset;
    wire _SmallOdds4Filter_1__io_in_ready;
    wire _SmallOdds4Filter_1__io_in_valid;
    wire [31:0] _SmallOdds4Filter_1__io_in_bits;
    wire _SmallOdds4Filter_1__io_out_ready;
    wire _SmallOdds4Filter_1__io_out_valid;
    wire [31:0] _SmallOdds4Filter_1__io_out_bits;
    SmallOdds4Filter_1 SmallOdds4Filter_1 (
        .clock(_SmallOdds4Filter_1__clock),
        .reset(_SmallOdds4Filter_1__reset),
        .io_in_ready(_SmallOdds4Filter_1__io_in_ready),
        .io_in_valid(_SmallOdds4Filter_1__io_in_valid),
        .io_in_bits(_SmallOdds4Filter_1__io_in_bits),
        .io_out_ready(_SmallOdds4Filter_1__io_out_ready),
        .io_out_valid(_SmallOdds4Filter_1__io_out_valid),
        .io_out_bits(_SmallOdds4Filter_1__io_out_bits)
    );
    assign _Queue__clock = clock;
    assign _Queue__io_deq_ready = _SmallOdds4Filter_1__io_in_ready;
    assign _Queue__io_enq_bits = _SmallOdds4Filter__io_out_bits;
    assign _Queue__io_enq_valid = _SmallOdds4Filter__io_out_valid;
    assign _Queue__reset = reset;
    assign _SmallOdds4Filter__clock = clock;
    assign _SmallOdds4Filter__io_in_bits = io_in_bits;
    assign _SmallOdds4Filter__io_in_valid = io_in_valid;
    assign _SmallOdds4Filter__io_out_ready = _Queue__io_enq_ready;
    assign _SmallOdds4Filter__reset = reset;
    assign _SmallOdds4Filter_1__clock = clock;
    assign _SmallOdds4Filter_1__io_in_bits = _Queue__io_deq_bits;
    assign _SmallOdds4Filter_1__io_in_valid = _Queue__io_deq_valid;
    assign _SmallOdds4Filter_1__io_out_ready = io_out_ready;
    assign _SmallOdds4Filter_1__reset = reset;
    assign io_in_ready = _SmallOdds4Filter__io_in_ready;
    assign io_out_bits = _SmallOdds4Filter_1__io_out_bits;
    assign io_out_valid = _SmallOdds4Filter_1__io_out_valid;
endmodule //SmallOdds4
module SmallOdds4Filter(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _T_14;
    BITWISEAND #(.width(1)) bitwiseand_1 (
        .y(_T_14),
        .a(io_out_ready),
        .b(io_in_valid)
    );
    wire _T_16;
    wire [31:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(4), .n(32)) u_pad_2 (
        .y(_WTEMP_0),
        .in(4'hA)
    );
    LT_UNSIGNED #(.width(32)) u_lt_3 (
        .y(_T_16),
        .a(io_in_bits),
        .b(_WTEMP_0)
    );
    wire _T_17;
    BITWISEAND #(.width(1)) bitwiseand_4 (
        .y(_T_17),
        .a(_T_14),
        .b(_T_16)
    );
    assign io_in_ready = io_out_ready;
    assign io_out_bits = io_in_bits;
    assign io_out_valid = _T_17;
endmodule //SmallOdds4Filter
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module Queue(
    input clock,
    input reset,
    output io_enq_ready,
    input io_enq_valid,
    input [31:0] io_enq_bits,
    input io_deq_ready,
    output io_deq_valid,
    output [31:0] io_deq_bits,
    output io_count
);
    wire ram__T_34_clk;
    wire ram__T_34_en;
    wire ram__T_34_mask;
    wire ram__T_34_addr;
    wire [31:0] ram__T_34_data;
    wire [31:0] ram__T_43_data;
    wire ram__T_43_clk;
    wire ram__T_43_en;
    wire ram__T_43_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(32), .isSyncRead(0)) ram (
        .read_data(ram__T_43_data),
        .read_clk(ram__T_43_clk),
        .read_en(ram__T_43_en),
        .read_addr(ram__T_43_addr),
        .write_clk(ram__T_34_clk),
        .write_en(ram__T_34_en),
        .write_mask(ram__T_34_mask),
        .write_addr(ram__T_34_addr),
        .write_data(ram__T_34_data)
    );
    wire _maybe_full__q;
    wire _maybe_full__d;
    DFF_POSCLK #(.width(1)) maybe_full (
        .q(_maybe_full__q),
        .d(_maybe_full__d),
        .clk(clock)
    );
    wire _WTEMP_1;
    MUX_UNSIGNED #(.width(1)) u_mux_5 (
        .y(_maybe_full__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_1)
    );
    wire _T_24;
    assign _T_24 = 1'h1;
    wire _T_26;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_26),
        .a(_maybe_full__q),
        .b(1'h0)
    );
    wire _T_27;
    BITWISEAND #(.width(1)) bitwiseand_7 (
        .y(_T_27),
        .a(_T_24),
        .b(_T_26)
    );
    wire _T_28;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(_T_28),
        .a(_T_24),
        .b(_maybe_full__q)
    );
    wire _T_29;
    BITWISEAND #(.width(1)) bitwiseand_9 (
        .y(_T_29),
        .a(io_enq_ready),
        .b(io_enq_valid)
    );
    wire do_enq;
    wire _T_31;
    BITWISEAND #(.width(1)) bitwiseand_10 (
        .y(_T_31),
        .a(io_deq_ready),
        .b(io_deq_valid)
    );
    wire do_deq;
    assign ram__T_34_addr = 1'h0;
    assign ram__T_34_en = do_enq;
    assign ram__T_34_clk = clock;
    assign ram__T_34_mask = 1'h1;
    wire _T_37;
    NEQ_UNSIGNED #(.width(1)) u_neq_11 (
        .y(_T_37),
        .a(do_enq),
        .b(do_deq)
    );
    wire _T_39;
    EQ_UNSIGNED #(.width(1)) u_eq_12 (
        .y(_T_39),
        .a(_T_27),
        .b(1'h0)
    );
    wire _T_41;
    EQ_UNSIGNED #(.width(1)) u_eq_13 (
        .y(_T_41),
        .a(_T_28),
        .b(1'h0)
    );
    assign ram__T_43_addr = 1'h0;
    assign ram__T_43_en = 1'h1;
    assign ram__T_43_clk = clock;
    wire [1:0] _T_44;
    assign _T_44 = 2'h0;
    wire [1:0] _T_45;
    assign _T_45 = 2'h0;
    wire _T_46;
    assign _T_46 = 1'h0;
    wire _T_47;
    BITWISEAND #(.width(1)) bitwiseand_14 (
        .y(_T_47),
        .a(_maybe_full__q),
        .b(_T_24)
    );
    wire [1:0] _T_48;
    CAT #(.width_a(1), .width_b(1)) cat_15 (
        .y(_T_48),
        .a(_T_47),
        .b(_T_46)
    );
    assign do_deq = _T_31;
    assign do_enq = _T_29;
    BITS #(.width(2), .high(0), .low(0)) bits_16 (
        .y(io_count),
        .in(_T_48)
    );
    assign io_deq_bits = ram__T_43_data;
    assign io_deq_valid = _T_39;
    assign io_enq_ready = _T_41;
    MUX_UNSIGNED #(.width(1)) u_mux_17 (
        .y(_WTEMP_1),
        .sel(_T_37),
        .a(do_enq),
        .b(_maybe_full__q)
    );
    assign ram__T_34_data = io_enq_bits;
endmodule //Queue
module RAMMEM(read_data, read_clk, read_en, read_addr, write_clk, write_en, write_mask, write_addr, write_data);
    parameter depth = 16;
    parameter addrbits = 4;
    parameter width = 32;
    parameter isSyncRead = 0;
    output [width-1:0] read_data;
    input read_clk;
    input read_en;
    input [addrbits-1:0] read_addr;
    input write_clk;
    input write_en;
    input write_mask;
    input [addrbits-1:0] write_addr;
    input [width-1:0] write_data;
    reg [width-1:0] memcore [0:depth-1];
    wire [addrbits-1:0] final_read_addr;
    generate
        if (isSyncRead) begin: raddr_processor
            reg [addrbits-1:0] read_addr_pipe_0;
            always @(posedge read_clk) begin
                if (read_en) begin
                    read_addr_pipe_0 <= read_addr;
                end
            end
            assign final_read_addr = read_addr_pipe_0;
        end else begin: raddr_processor
            assign final_read_addr = read_addr;
        end
    endgenerate
    assign read_data = memcore[final_read_addr];
    always @(posedge write_clk) begin
        if (write_en & write_mask) begin
            memcore[write_addr] <= write_data;
        end
    end
endmodule // RAMMEM
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
module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module SmallOdds4Filter_1(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _T_14;
    BITWISEAND #(.width(1)) bitwiseand_18 (
        .y(_T_14),
        .a(io_out_ready),
        .b(io_in_valid)
    );
    wire [31:0] _T_16;
    wire [31:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_19 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    BITWISEAND #(.width(32)) bitwiseand_20 (
        .y(_T_16),
        .a(io_in_bits),
        .b(_WTEMP_2)
    );
    wire _T_18;
    wire [31:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_21 (
        .y(_WTEMP_3),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_22 (
        .y(_T_18),
        .a(_T_16),
        .b(_WTEMP_3)
    );
    wire _T_19;
    BITWISEAND #(.width(1)) bitwiseand_23 (
        .y(_T_19),
        .a(_T_14),
        .b(_T_18)
    );
    assign io_in_ready = io_out_ready;
    assign io_out_bits = io_in_bits;
    assign io_out_valid = _T_19;
endmodule //SmallOdds4Filter_1
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
