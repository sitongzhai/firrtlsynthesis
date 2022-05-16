module DecoupledAdderTests(
    input clock,
    input reset
);
    wire _device_under_test__clock;
    wire _device_under_test__reset;
    wire _device_under_test__io_in_ready;
    wire _device_under_test__io_in_valid;
    wire [15:0] _device_under_test__io_in_bits_a;
    wire [15:0] _device_under_test__io_in_bits_b;
    wire _device_under_test__io_out_ready;
    wire _device_under_test__io_out_valid;
    wire [15:0] _device_under_test__io_out_bits_c;
    SlowDecoupledAdder device_under_test (
        .clock(_device_under_test__clock),
        .reset(_device_under_test__reset),
        .io_in_ready(_device_under_test__io_in_ready),
        .io_in_valid(_device_under_test__io_in_valid),
        .io_in_bits_a(_device_under_test__io_in_bits_a),
        .io_in_bits_b(_device_under_test__io_in_bits_b),
        .io_out_ready(_device_under_test__io_out_ready),
        .io_out_valid(_device_under_test__io_out_valid),
        .io_out_bits_c(_device_under_test__io_out_bits_c)
    );
    wire [6:0] __T_4__q;
    wire [6:0] __T_4__d;
    DFF_POSCLK #(.width(7)) _T_4 (
        .q(__T_4__q),
        .d(__T_4__d),
        .clk(clock)
    );
    wire [6:0] _WTEMP_8;
    MUX_UNSIGNED #(.width(7)) u_mux_31 (
        .y(__T_4__d),
        .sel(reset),
        .a(7'h0),
        .b(_WTEMP_8)
    );
    wire __T_7__q;
    wire __T_7__d;
    DFF_POSCLK #(.width(1)) _T_7 (
        .q(__T_7__q),
        .d(__T_7__d),
        .clk(clock)
    );
    wire _WTEMP_9;
    MUX_UNSIGNED #(.width(1)) u_mux_32 (
        .y(__T_7__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_9)
    );
    wire [6:0] __T_10__q;
    wire [6:0] __T_10__d;
    DFF_POSCLK #(.width(7)) _T_10 (
        .q(__T_10__q),
        .d(__T_10__d),
        .clk(clock)
    );
    wire [6:0] _WTEMP_10;
    MUX_UNSIGNED #(.width(7)) u_mux_33 (
        .y(__T_10__d),
        .sel(reset),
        .a(7'h0),
        .b(_WTEMP_10)
    );
    wire __T_13__q;
    wire __T_13__d;
    DFF_POSCLK #(.width(1)) _T_13 (
        .q(__T_13__q),
        .d(__T_13__d),
        .clk(clock)
    );
    wire _WTEMP_11;
    MUX_UNSIGNED #(.width(1)) u_mux_34 (
        .y(__T_13__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_11)
    );
    wire _T_14;
    BITWISEAND #(.width(1)) bitwiseand_35 (
        .y(_T_14),
        .a(__T_7__q),
        .b(__T_13__q)
    );
    wire _T_16;
    EQ_UNSIGNED #(.width(1)) u_eq_36 (
        .y(_T_16),
        .a(reset),
        .b(1'h0)
    );
    wire _T_18;
    EQ_UNSIGNED #(.width(1)) u_eq_37 (
        .y(_T_18),
        .a(reset),
        .b(1'h0)
    );
    wire [13:0] __T_21__q;
    wire [13:0] __T_21__d;
    DFF_POSCLK #(.width(14)) _T_21 (
        .q(__T_21__q),
        .d(__T_21__d),
        .clk(clock)
    );
    wire [13:0] _WTEMP_12;
    MUX_UNSIGNED #(.width(14)) u_mux_38 (
        .y(__T_21__d),
        .sel(reset),
        .a(14'h0),
        .b(_WTEMP_12)
    );
    wire [14:0] _T_23;
    wire [13:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(1), .n(14)) u_pad_39 (
        .y(_WTEMP_13),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(14)) u_add_40 (
        .y(_T_23),
        .a(__T_21__q),
        .b(_WTEMP_13)
    );
    wire [13:0] _T_24;
    TAIL #(.width(15), .n(1)) tail_41 (
        .y(_T_24),
        .in(_T_23)
    );
    wire _T_26;
    GT_UNSIGNED #(.width(14)) u_gt_42 (
        .y(_T_26),
        .a(__T_21__q),
        .b(14'h2710)
    );
    wire _T_29;
    EQ_UNSIGNED #(.width(1)) u_eq_43 (
        .y(_T_29),
        .a(reset),
        .b(1'h0)
    );
    wire _T_31;
    EQ_UNSIGNED #(.width(1)) u_eq_44 (
        .y(_T_31),
        .a(reset),
        .b(1'h0)
    );
    wire _T_55_0;
    wire _T_55_1;
    wire _T_55_2;
    wire _T_55_3;
    wire _T_55_4;
    wire _T_55_5;
    wire _T_55_6;
    wire _T_55_7;
    wire _T_55_8;
    wire _T_55_9;
    wire _T_55_10;
    wire _T_55_11;
    wire _T_55_12;
    wire _T_55_13;
    wire _T_55_14;
    wire _T_55_15;
    wire _T_55_16;
    wire _T_55_17;
    wire _T_55_18;
    wire _T_55_19;
    wire _T_55_20;
    wire [4:0] _value__q;
    wire [4:0] _value__d;
    DFF_POSCLK #(.width(5)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_14;
    MUX_UNSIGNED #(.width(5)) u_mux_45 (
        .y(_value__d),
        .sel(reset),
        .a(5'h0),
        .b(_WTEMP_14)
    );
    wire [2:0] _T_104_0;
    wire [2:0] _T_104_1;
    wire [2:0] _T_104_2;
    wire [2:0] _T_104_3;
    wire [2:0] _T_104_4;
    wire [2:0] _T_104_5;
    wire [2:0] _T_104_6;
    wire [2:0] _T_104_7;
    wire [2:0] _T_104_8;
    wire [2:0] _T_104_9;
    wire [2:0] _T_104_10;
    wire [2:0] _T_104_11;
    wire [2:0] _T_104_12;
    wire [2:0] _T_104_13;
    wire [2:0] _T_104_14;
    wire [2:0] _T_104_15;
    wire [2:0] _T_104_16;
    wire [2:0] _T_104_17;
    wire [2:0] _T_104_18;
    wire [2:0] _T_104_19;
    wire [2:0] _T_104_20;
    wire [2:0] _T_151_0;
    wire [2:0] _T_151_1;
    wire [2:0] _T_151_2;
    wire [2:0] _T_151_3;
    wire [2:0] _T_151_4;
    wire [2:0] _T_151_5;
    wire [2:0] _T_151_6;
    wire [2:0] _T_151_7;
    wire [2:0] _T_151_8;
    wire [2:0] _T_151_9;
    wire [2:0] _T_151_10;
    wire [2:0] _T_151_11;
    wire [2:0] _T_151_12;
    wire [2:0] _T_151_13;
    wire [2:0] _T_151_14;
    wire [2:0] _T_151_15;
    wire [2:0] _T_151_16;
    wire [2:0] _T_151_17;
    wire [2:0] _T_151_18;
    wire [2:0] _T_151_19;
    wire [2:0] _T_151_20;
    wire _node_5;
    EQ_UNSIGNED #(.width(5)) u_eq_46 (
        .y(_node_5),
        .a(5'd0),
        .b(_value__q)
    );
    wire [2:0] _node_6;
    assign _node_6 = _T_104_0;
    wire _node_7;
    EQ_UNSIGNED #(.width(5)) u_eq_47 (
        .y(_node_7),
        .a(5'd1),
        .b(_value__q)
    );
    wire [2:0] _node_8;
    MUX_UNSIGNED #(.width(3)) u_mux_48 (
        .y(_node_8),
        .sel(_node_7),
        .a(_T_104_1),
        .b(_node_6)
    );
    wire _node_9;
    EQ_UNSIGNED #(.width(5)) u_eq_49 (
        .y(_node_9),
        .a(5'd2),
        .b(_value__q)
    );
    wire [2:0] _node_10;
    MUX_UNSIGNED #(.width(3)) u_mux_50 (
        .y(_node_10),
        .sel(_node_9),
        .a(_T_104_2),
        .b(_node_8)
    );
    wire _node_11;
    EQ_UNSIGNED #(.width(5)) u_eq_51 (
        .y(_node_11),
        .a(5'd3),
        .b(_value__q)
    );
    wire [2:0] _node_12;
    MUX_UNSIGNED #(.width(3)) u_mux_52 (
        .y(_node_12),
        .sel(_node_11),
        .a(_T_104_3),
        .b(_node_10)
    );
    wire _node_13;
    EQ_UNSIGNED #(.width(5)) u_eq_53 (
        .y(_node_13),
        .a(5'd4),
        .b(_value__q)
    );
    wire [2:0] _node_14;
    MUX_UNSIGNED #(.width(3)) u_mux_54 (
        .y(_node_14),
        .sel(_node_13),
        .a(_T_104_4),
        .b(_node_12)
    );
    wire _node_15;
    EQ_UNSIGNED #(.width(5)) u_eq_55 (
        .y(_node_15),
        .a(5'd5),
        .b(_value__q)
    );
    wire [2:0] _node_16;
    MUX_UNSIGNED #(.width(3)) u_mux_56 (
        .y(_node_16),
        .sel(_node_15),
        .a(_T_104_5),
        .b(_node_14)
    );
    wire _node_17;
    EQ_UNSIGNED #(.width(5)) u_eq_57 (
        .y(_node_17),
        .a(5'd6),
        .b(_value__q)
    );
    wire [2:0] _node_18;
    MUX_UNSIGNED #(.width(3)) u_mux_58 (
        .y(_node_18),
        .sel(_node_17),
        .a(_T_104_6),
        .b(_node_16)
    );
    wire _node_19;
    EQ_UNSIGNED #(.width(5)) u_eq_59 (
        .y(_node_19),
        .a(5'd7),
        .b(_value__q)
    );
    wire [2:0] _node_20;
    MUX_UNSIGNED #(.width(3)) u_mux_60 (
        .y(_node_20),
        .sel(_node_19),
        .a(_T_104_7),
        .b(_node_18)
    );
    wire _node_21;
    EQ_UNSIGNED #(.width(5)) u_eq_61 (
        .y(_node_21),
        .a(5'd8),
        .b(_value__q)
    );
    wire [2:0] _node_22;
    MUX_UNSIGNED #(.width(3)) u_mux_62 (
        .y(_node_22),
        .sel(_node_21),
        .a(_T_104_8),
        .b(_node_20)
    );
    wire _node_23;
    EQ_UNSIGNED #(.width(5)) u_eq_63 (
        .y(_node_23),
        .a(5'd9),
        .b(_value__q)
    );
    wire [2:0] _node_24;
    MUX_UNSIGNED #(.width(3)) u_mux_64 (
        .y(_node_24),
        .sel(_node_23),
        .a(_T_104_9),
        .b(_node_22)
    );
    wire _node_25;
    EQ_UNSIGNED #(.width(5)) u_eq_65 (
        .y(_node_25),
        .a(5'd10),
        .b(_value__q)
    );
    wire [2:0] _node_26;
    MUX_UNSIGNED #(.width(3)) u_mux_66 (
        .y(_node_26),
        .sel(_node_25),
        .a(_T_104_10),
        .b(_node_24)
    );
    wire _node_27;
    EQ_UNSIGNED #(.width(5)) u_eq_67 (
        .y(_node_27),
        .a(5'd11),
        .b(_value__q)
    );
    wire [2:0] _node_28;
    MUX_UNSIGNED #(.width(3)) u_mux_68 (
        .y(_node_28),
        .sel(_node_27),
        .a(_T_104_11),
        .b(_node_26)
    );
    wire _node_29;
    EQ_UNSIGNED #(.width(5)) u_eq_69 (
        .y(_node_29),
        .a(5'd12),
        .b(_value__q)
    );
    wire [2:0] _node_30;
    MUX_UNSIGNED #(.width(3)) u_mux_70 (
        .y(_node_30),
        .sel(_node_29),
        .a(_T_104_12),
        .b(_node_28)
    );
    wire _node_31;
    EQ_UNSIGNED #(.width(5)) u_eq_71 (
        .y(_node_31),
        .a(5'd13),
        .b(_value__q)
    );
    wire [2:0] _node_32;
    MUX_UNSIGNED #(.width(3)) u_mux_72 (
        .y(_node_32),
        .sel(_node_31),
        .a(_T_104_13),
        .b(_node_30)
    );
    wire _node_33;
    EQ_UNSIGNED #(.width(5)) u_eq_73 (
        .y(_node_33),
        .a(5'd14),
        .b(_value__q)
    );
    wire [2:0] _node_34;
    MUX_UNSIGNED #(.width(3)) u_mux_74 (
        .y(_node_34),
        .sel(_node_33),
        .a(_T_104_14),
        .b(_node_32)
    );
    wire _node_35;
    EQ_UNSIGNED #(.width(5)) u_eq_75 (
        .y(_node_35),
        .a(5'd15),
        .b(_value__q)
    );
    wire [2:0] _node_36;
    MUX_UNSIGNED #(.width(3)) u_mux_76 (
        .y(_node_36),
        .sel(_node_35),
        .a(_T_104_15),
        .b(_node_34)
    );
    wire _node_37;
    EQ_UNSIGNED #(.width(5)) u_eq_77 (
        .y(_node_37),
        .a(5'd16),
        .b(_value__q)
    );
    wire [2:0] _node_38;
    MUX_UNSIGNED #(.width(3)) u_mux_78 (
        .y(_node_38),
        .sel(_node_37),
        .a(_T_104_16),
        .b(_node_36)
    );
    wire _node_39;
    EQ_UNSIGNED #(.width(5)) u_eq_79 (
        .y(_node_39),
        .a(5'd17),
        .b(_value__q)
    );
    wire [2:0] _node_40;
    MUX_UNSIGNED #(.width(3)) u_mux_80 (
        .y(_node_40),
        .sel(_node_39),
        .a(_T_104_17),
        .b(_node_38)
    );
    wire _node_41;
    EQ_UNSIGNED #(.width(5)) u_eq_81 (
        .y(_node_41),
        .a(5'd18),
        .b(_value__q)
    );
    wire [2:0] _node_42;
    MUX_UNSIGNED #(.width(3)) u_mux_82 (
        .y(_node_42),
        .sel(_node_41),
        .a(_T_104_18),
        .b(_node_40)
    );
    wire _node_43;
    EQ_UNSIGNED #(.width(5)) u_eq_83 (
        .y(_node_43),
        .a(5'd19),
        .b(_value__q)
    );
    wire [2:0] _node_44;
    MUX_UNSIGNED #(.width(3)) u_mux_84 (
        .y(_node_44),
        .sel(_node_43),
        .a(_T_104_19),
        .b(_node_42)
    );
    wire _node_45;
    EQ_UNSIGNED #(.width(5)) u_eq_85 (
        .y(_node_45),
        .a(5'd20),
        .b(_value__q)
    );
    wire [2:0] _node_46;
    MUX_UNSIGNED #(.width(3)) u_mux_86 (
        .y(_node_46),
        .sel(_node_45),
        .a(_T_104_20),
        .b(_node_44)
    );
    wire _node_47;
    EQ_UNSIGNED #(.width(5)) u_eq_87 (
        .y(_node_47),
        .a(5'd0),
        .b(_value__q)
    );
    wire [2:0] _node_48;
    assign _node_48 = _T_151_0;
    wire _node_49;
    EQ_UNSIGNED #(.width(5)) u_eq_88 (
        .y(_node_49),
        .a(5'd1),
        .b(_value__q)
    );
    wire [2:0] _node_50;
    MUX_UNSIGNED #(.width(3)) u_mux_89 (
        .y(_node_50),
        .sel(_node_49),
        .a(_T_151_1),
        .b(_node_48)
    );
    wire _node_51;
    EQ_UNSIGNED #(.width(5)) u_eq_90 (
        .y(_node_51),
        .a(5'd2),
        .b(_value__q)
    );
    wire [2:0] _node_52;
    MUX_UNSIGNED #(.width(3)) u_mux_91 (
        .y(_node_52),
        .sel(_node_51),
        .a(_T_151_2),
        .b(_node_50)
    );
    wire _node_53;
    EQ_UNSIGNED #(.width(5)) u_eq_92 (
        .y(_node_53),
        .a(5'd3),
        .b(_value__q)
    );
    wire [2:0] _node_54;
    MUX_UNSIGNED #(.width(3)) u_mux_93 (
        .y(_node_54),
        .sel(_node_53),
        .a(_T_151_3),
        .b(_node_52)
    );
    wire _node_55;
    EQ_UNSIGNED #(.width(5)) u_eq_94 (
        .y(_node_55),
        .a(5'd4),
        .b(_value__q)
    );
    wire [2:0] _node_56;
    MUX_UNSIGNED #(.width(3)) u_mux_95 (
        .y(_node_56),
        .sel(_node_55),
        .a(_T_151_4),
        .b(_node_54)
    );
    wire _node_57;
    EQ_UNSIGNED #(.width(5)) u_eq_96 (
        .y(_node_57),
        .a(5'd5),
        .b(_value__q)
    );
    wire [2:0] _node_58;
    MUX_UNSIGNED #(.width(3)) u_mux_97 (
        .y(_node_58),
        .sel(_node_57),
        .a(_T_151_5),
        .b(_node_56)
    );
    wire _node_59;
    EQ_UNSIGNED #(.width(5)) u_eq_98 (
        .y(_node_59),
        .a(5'd6),
        .b(_value__q)
    );
    wire [2:0] _node_60;
    MUX_UNSIGNED #(.width(3)) u_mux_99 (
        .y(_node_60),
        .sel(_node_59),
        .a(_T_151_6),
        .b(_node_58)
    );
    wire _node_61;
    EQ_UNSIGNED #(.width(5)) u_eq_100 (
        .y(_node_61),
        .a(5'd7),
        .b(_value__q)
    );
    wire [2:0] _node_62;
    MUX_UNSIGNED #(.width(3)) u_mux_101 (
        .y(_node_62),
        .sel(_node_61),
        .a(_T_151_7),
        .b(_node_60)
    );
    wire _node_63;
    EQ_UNSIGNED #(.width(5)) u_eq_102 (
        .y(_node_63),
        .a(5'd8),
        .b(_value__q)
    );
    wire [2:0] _node_64;
    MUX_UNSIGNED #(.width(3)) u_mux_103 (
        .y(_node_64),
        .sel(_node_63),
        .a(_T_151_8),
        .b(_node_62)
    );
    wire _node_65;
    EQ_UNSIGNED #(.width(5)) u_eq_104 (
        .y(_node_65),
        .a(5'd9),
        .b(_value__q)
    );
    wire [2:0] _node_66;
    MUX_UNSIGNED #(.width(3)) u_mux_105 (
        .y(_node_66),
        .sel(_node_65),
        .a(_T_151_9),
        .b(_node_64)
    );
    wire _node_67;
    EQ_UNSIGNED #(.width(5)) u_eq_106 (
        .y(_node_67),
        .a(5'd10),
        .b(_value__q)
    );
    wire [2:0] _node_68;
    MUX_UNSIGNED #(.width(3)) u_mux_107 (
        .y(_node_68),
        .sel(_node_67),
        .a(_T_151_10),
        .b(_node_66)
    );
    wire _node_69;
    EQ_UNSIGNED #(.width(5)) u_eq_108 (
        .y(_node_69),
        .a(5'd11),
        .b(_value__q)
    );
    wire [2:0] _node_70;
    MUX_UNSIGNED #(.width(3)) u_mux_109 (
        .y(_node_70),
        .sel(_node_69),
        .a(_T_151_11),
        .b(_node_68)
    );
    wire _node_71;
    EQ_UNSIGNED #(.width(5)) u_eq_110 (
        .y(_node_71),
        .a(5'd12),
        .b(_value__q)
    );
    wire [2:0] _node_72;
    MUX_UNSIGNED #(.width(3)) u_mux_111 (
        .y(_node_72),
        .sel(_node_71),
        .a(_T_151_12),
        .b(_node_70)
    );
    wire _node_73;
    EQ_UNSIGNED #(.width(5)) u_eq_112 (
        .y(_node_73),
        .a(5'd13),
        .b(_value__q)
    );
    wire [2:0] _node_74;
    MUX_UNSIGNED #(.width(3)) u_mux_113 (
        .y(_node_74),
        .sel(_node_73),
        .a(_T_151_13),
        .b(_node_72)
    );
    wire _node_75;
    EQ_UNSIGNED #(.width(5)) u_eq_114 (
        .y(_node_75),
        .a(5'd14),
        .b(_value__q)
    );
    wire [2:0] _node_76;
    MUX_UNSIGNED #(.width(3)) u_mux_115 (
        .y(_node_76),
        .sel(_node_75),
        .a(_T_151_14),
        .b(_node_74)
    );
    wire _node_77;
    EQ_UNSIGNED #(.width(5)) u_eq_116 (
        .y(_node_77),
        .a(5'd15),
        .b(_value__q)
    );
    wire [2:0] _node_78;
    MUX_UNSIGNED #(.width(3)) u_mux_117 (
        .y(_node_78),
        .sel(_node_77),
        .a(_T_151_15),
        .b(_node_76)
    );
    wire _node_79;
    EQ_UNSIGNED #(.width(5)) u_eq_118 (
        .y(_node_79),
        .a(5'd16),
        .b(_value__q)
    );
    wire [2:0] _node_80;
    MUX_UNSIGNED #(.width(3)) u_mux_119 (
        .y(_node_80),
        .sel(_node_79),
        .a(_T_151_16),
        .b(_node_78)
    );
    wire _node_81;
    EQ_UNSIGNED #(.width(5)) u_eq_120 (
        .y(_node_81),
        .a(5'd17),
        .b(_value__q)
    );
    wire [2:0] _node_82;
    MUX_UNSIGNED #(.width(3)) u_mux_121 (
        .y(_node_82),
        .sel(_node_81),
        .a(_T_151_17),
        .b(_node_80)
    );
    wire _node_83;
    EQ_UNSIGNED #(.width(5)) u_eq_122 (
        .y(_node_83),
        .a(5'd18),
        .b(_value__q)
    );
    wire [2:0] _node_84;
    MUX_UNSIGNED #(.width(3)) u_mux_123 (
        .y(_node_84),
        .sel(_node_83),
        .a(_T_151_18),
        .b(_node_82)
    );
    wire _node_85;
    EQ_UNSIGNED #(.width(5)) u_eq_124 (
        .y(_node_85),
        .a(5'd19),
        .b(_value__q)
    );
    wire [2:0] _node_86;
    MUX_UNSIGNED #(.width(3)) u_mux_125 (
        .y(_node_86),
        .sel(_node_85),
        .a(_T_151_19),
        .b(_node_84)
    );
    wire _node_87;
    EQ_UNSIGNED #(.width(5)) u_eq_126 (
        .y(_node_87),
        .a(5'd20),
        .b(_value__q)
    );
    wire [2:0] _node_88;
    MUX_UNSIGNED #(.width(3)) u_mux_127 (
        .y(_node_88),
        .sel(_node_87),
        .a(_T_151_20),
        .b(_node_86)
    );
    wire [4:0] _T_178;
    BITS #(.width(7), .high(4), .low(0)) bits_128 (
        .y(_T_178),
        .in(__T_4__q)
    );
    wire _node_89;
    EQ_UNSIGNED #(.width(5)) u_eq_129 (
        .y(_node_89),
        .a(5'd0),
        .b(_T_178)
    );
    wire _node_90;
    assign _node_90 = _T_55_0;
    wire _node_91;
    EQ_UNSIGNED #(.width(5)) u_eq_130 (
        .y(_node_91),
        .a(5'd1),
        .b(_T_178)
    );
    wire _node_92;
    MUX_UNSIGNED #(.width(1)) u_mux_131 (
        .y(_node_92),
        .sel(_node_91),
        .a(_T_55_1),
        .b(_node_90)
    );
    wire _node_93;
    EQ_UNSIGNED #(.width(5)) u_eq_132 (
        .y(_node_93),
        .a(5'd2),
        .b(_T_178)
    );
    wire _node_94;
    MUX_UNSIGNED #(.width(1)) u_mux_133 (
        .y(_node_94),
        .sel(_node_93),
        .a(_T_55_2),
        .b(_node_92)
    );
    wire _node_95;
    EQ_UNSIGNED #(.width(5)) u_eq_134 (
        .y(_node_95),
        .a(5'd3),
        .b(_T_178)
    );
    wire _node_96;
    MUX_UNSIGNED #(.width(1)) u_mux_135 (
        .y(_node_96),
        .sel(_node_95),
        .a(_T_55_3),
        .b(_node_94)
    );
    wire _node_97;
    EQ_UNSIGNED #(.width(5)) u_eq_136 (
        .y(_node_97),
        .a(5'd4),
        .b(_T_178)
    );
    wire _node_98;
    MUX_UNSIGNED #(.width(1)) u_mux_137 (
        .y(_node_98),
        .sel(_node_97),
        .a(_T_55_4),
        .b(_node_96)
    );
    wire _node_99;
    EQ_UNSIGNED #(.width(5)) u_eq_138 (
        .y(_node_99),
        .a(5'd5),
        .b(_T_178)
    );
    wire _node_100;
    MUX_UNSIGNED #(.width(1)) u_mux_139 (
        .y(_node_100),
        .sel(_node_99),
        .a(_T_55_5),
        .b(_node_98)
    );
    wire _node_101;
    EQ_UNSIGNED #(.width(5)) u_eq_140 (
        .y(_node_101),
        .a(5'd6),
        .b(_T_178)
    );
    wire _node_102;
    MUX_UNSIGNED #(.width(1)) u_mux_141 (
        .y(_node_102),
        .sel(_node_101),
        .a(_T_55_6),
        .b(_node_100)
    );
    wire _node_103;
    EQ_UNSIGNED #(.width(5)) u_eq_142 (
        .y(_node_103),
        .a(5'd7),
        .b(_T_178)
    );
    wire _node_104;
    MUX_UNSIGNED #(.width(1)) u_mux_143 (
        .y(_node_104),
        .sel(_node_103),
        .a(_T_55_7),
        .b(_node_102)
    );
    wire _node_105;
    EQ_UNSIGNED #(.width(5)) u_eq_144 (
        .y(_node_105),
        .a(5'd8),
        .b(_T_178)
    );
    wire _node_106;
    MUX_UNSIGNED #(.width(1)) u_mux_145 (
        .y(_node_106),
        .sel(_node_105),
        .a(_T_55_8),
        .b(_node_104)
    );
    wire _node_107;
    EQ_UNSIGNED #(.width(5)) u_eq_146 (
        .y(_node_107),
        .a(5'd9),
        .b(_T_178)
    );
    wire _node_108;
    MUX_UNSIGNED #(.width(1)) u_mux_147 (
        .y(_node_108),
        .sel(_node_107),
        .a(_T_55_9),
        .b(_node_106)
    );
    wire _node_109;
    EQ_UNSIGNED #(.width(5)) u_eq_148 (
        .y(_node_109),
        .a(5'd10),
        .b(_T_178)
    );
    wire _node_110;
    MUX_UNSIGNED #(.width(1)) u_mux_149 (
        .y(_node_110),
        .sel(_node_109),
        .a(_T_55_10),
        .b(_node_108)
    );
    wire _node_111;
    EQ_UNSIGNED #(.width(5)) u_eq_150 (
        .y(_node_111),
        .a(5'd11),
        .b(_T_178)
    );
    wire _node_112;
    MUX_UNSIGNED #(.width(1)) u_mux_151 (
        .y(_node_112),
        .sel(_node_111),
        .a(_T_55_11),
        .b(_node_110)
    );
    wire _node_113;
    EQ_UNSIGNED #(.width(5)) u_eq_152 (
        .y(_node_113),
        .a(5'd12),
        .b(_T_178)
    );
    wire _node_114;
    MUX_UNSIGNED #(.width(1)) u_mux_153 (
        .y(_node_114),
        .sel(_node_113),
        .a(_T_55_12),
        .b(_node_112)
    );
    wire _node_115;
    EQ_UNSIGNED #(.width(5)) u_eq_154 (
        .y(_node_115),
        .a(5'd13),
        .b(_T_178)
    );
    wire _node_116;
    MUX_UNSIGNED #(.width(1)) u_mux_155 (
        .y(_node_116),
        .sel(_node_115),
        .a(_T_55_13),
        .b(_node_114)
    );
    wire _node_117;
    EQ_UNSIGNED #(.width(5)) u_eq_156 (
        .y(_node_117),
        .a(5'd14),
        .b(_T_178)
    );
    wire _node_118;
    MUX_UNSIGNED #(.width(1)) u_mux_157 (
        .y(_node_118),
        .sel(_node_117),
        .a(_T_55_14),
        .b(_node_116)
    );
    wire _node_119;
    EQ_UNSIGNED #(.width(5)) u_eq_158 (
        .y(_node_119),
        .a(5'd15),
        .b(_T_178)
    );
    wire _node_120;
    MUX_UNSIGNED #(.width(1)) u_mux_159 (
        .y(_node_120),
        .sel(_node_119),
        .a(_T_55_15),
        .b(_node_118)
    );
    wire _node_121;
    EQ_UNSIGNED #(.width(5)) u_eq_160 (
        .y(_node_121),
        .a(5'd16),
        .b(_T_178)
    );
    wire _node_122;
    MUX_UNSIGNED #(.width(1)) u_mux_161 (
        .y(_node_122),
        .sel(_node_121),
        .a(_T_55_16),
        .b(_node_120)
    );
    wire _node_123;
    EQ_UNSIGNED #(.width(5)) u_eq_162 (
        .y(_node_123),
        .a(5'd17),
        .b(_T_178)
    );
    wire _node_124;
    MUX_UNSIGNED #(.width(1)) u_mux_163 (
        .y(_node_124),
        .sel(_node_123),
        .a(_T_55_17),
        .b(_node_122)
    );
    wire _node_125;
    EQ_UNSIGNED #(.width(5)) u_eq_164 (
        .y(_node_125),
        .a(5'd18),
        .b(_T_178)
    );
    wire _node_126;
    MUX_UNSIGNED #(.width(1)) u_mux_165 (
        .y(_node_126),
        .sel(_node_125),
        .a(_T_55_18),
        .b(_node_124)
    );
    wire _node_127;
    EQ_UNSIGNED #(.width(5)) u_eq_166 (
        .y(_node_127),
        .a(5'd19),
        .b(_T_178)
    );
    wire _node_128;
    MUX_UNSIGNED #(.width(1)) u_mux_167 (
        .y(_node_128),
        .sel(_node_127),
        .a(_T_55_19),
        .b(_node_126)
    );
    wire _node_129;
    EQ_UNSIGNED #(.width(5)) u_eq_168 (
        .y(_node_129),
        .a(5'd20),
        .b(_T_178)
    );
    wire _node_130;
    MUX_UNSIGNED #(.width(1)) u_mux_169 (
        .y(_node_130),
        .sel(_node_129),
        .a(_T_55_20),
        .b(_node_128)
    );
    wire _T_179;
    BITWISEAND #(.width(1)) bitwiseand_170 (
        .y(_T_179),
        .a(_device_under_test__io_in_valid),
        .b(_device_under_test__io_in_ready)
    );
    wire _T_181;
    EQ_UNSIGNED #(.width(5)) u_eq_171 (
        .y(_T_181),
        .a(_value__q),
        .b(5'h13)
    );
    wire [5:0] _T_183;
    wire [4:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_172 (
        .y(_WTEMP_15),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(5)) u_add_173 (
        .y(_T_183),
        .a(_value__q),
        .b(_WTEMP_15)
    );
    wire [4:0] _T_184;
    TAIL #(.width(6), .n(1)) tail_174 (
        .y(_T_184),
        .in(_T_183)
    );
    wire _T_187;
    EQ_UNSIGNED #(.width(1)) u_eq_175 (
        .y(_T_187),
        .a(__T_7__q),
        .b(1'h0)
    );
    wire _T_189;
    wire [6:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(5), .n(7)) u_pad_176 (
        .y(_WTEMP_16),
        .in(5'h13)
    );
    EQ_UNSIGNED #(.width(7)) u_eq_177 (
        .y(_T_189),
        .a(__T_4__q),
        .b(_WTEMP_16)
    );
    wire [7:0] _T_192;
    wire [6:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(1), .n(7)) u_pad_178 (
        .y(_WTEMP_17),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(7)) u_add_179 (
        .y(_T_192),
        .a(__T_4__q),
        .b(_WTEMP_17)
    );
    wire [6:0] _T_193;
    TAIL #(.width(8), .n(1)) tail_180 (
        .y(_T_193),
        .in(_T_192)
    );
    wire _node_131;
    MUX_UNSIGNED #(.width(1)) u_mux_181 (
        .y(_node_131),
        .sel(_T_189),
        .a(1'h1),
        .b(__T_7__q)
    );
    wire [6:0] _node_132;
    MUX_UNSIGNED #(.width(7)) u_mux_182 (
        .y(_node_132),
        .sel(_T_187),
        .a(_T_193),
        .b(__T_4__q)
    );
    wire _node_133;
    MUX_UNSIGNED #(.width(1)) u_mux_183 (
        .y(_node_133),
        .sel(_T_187),
        .a(_node_131),
        .b(__T_7__q)
    );
    wire [4:0] _node_134;
    wire [4:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_184 (
        .y(_WTEMP_18),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_185 (
        .y(_node_134),
        .sel(_T_181),
        .a(_WTEMP_18),
        .b(_T_184)
    );
    wire _T_217_0;
    wire _T_217_1;
    wire _T_217_2;
    wire _T_217_3;
    wire _T_217_4;
    wire _T_217_5;
    wire _T_217_6;
    wire _T_217_7;
    wire _T_217_8;
    wire _T_217_9;
    wire _T_217_10;
    wire _T_217_11;
    wire _T_217_12;
    wire _T_217_13;
    wire _T_217_14;
    wire _T_217_15;
    wire _T_217_16;
    wire _T_217_17;
    wire _T_217_18;
    wire _T_217_19;
    wire _T_217_20;
    wire [4:0] _value_1__q;
    wire [4:0] _value_1__d;
    DFF_POSCLK #(.width(5)) value_1 (
        .q(_value_1__q),
        .d(_value_1__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_19;
    MUX_UNSIGNED #(.width(5)) u_mux_186 (
        .y(_value_1__d),
        .sel(reset),
        .a(5'h0),
        .b(_WTEMP_19)
    );
    wire [3:0] _T_266_0;
    wire [3:0] _T_266_1;
    wire [3:0] _T_266_2;
    wire [3:0] _T_266_3;
    wire [3:0] _T_266_4;
    wire [3:0] _T_266_5;
    wire [3:0] _T_266_6;
    wire [3:0] _T_266_7;
    wire [3:0] _T_266_8;
    wire [3:0] _T_266_9;
    wire [3:0] _T_266_10;
    wire [3:0] _T_266_11;
    wire [3:0] _T_266_12;
    wire [3:0] _T_266_13;
    wire [3:0] _T_266_14;
    wire [3:0] _T_266_15;
    wire [3:0] _T_266_16;
    wire [3:0] _T_266_17;
    wire [3:0] _T_266_18;
    wire [3:0] _T_266_19;
    wire [3:0] _T_266_20;
    wire [4:0] _T_291;
    BITS #(.width(7), .high(4), .low(0)) bits_187 (
        .y(_T_291),
        .in(__T_10__q)
    );
    wire _node_135;
    EQ_UNSIGNED #(.width(5)) u_eq_188 (
        .y(_node_135),
        .a(5'd0),
        .b(_T_291)
    );
    wire _node_136;
    assign _node_136 = _T_217_0;
    wire _node_137;
    EQ_UNSIGNED #(.width(5)) u_eq_189 (
        .y(_node_137),
        .a(5'd1),
        .b(_T_291)
    );
    wire _node_138;
    MUX_UNSIGNED #(.width(1)) u_mux_190 (
        .y(_node_138),
        .sel(_node_137),
        .a(_T_217_1),
        .b(_node_136)
    );
    wire _node_139;
    EQ_UNSIGNED #(.width(5)) u_eq_191 (
        .y(_node_139),
        .a(5'd2),
        .b(_T_291)
    );
    wire _node_140;
    MUX_UNSIGNED #(.width(1)) u_mux_192 (
        .y(_node_140),
        .sel(_node_139),
        .a(_T_217_2),
        .b(_node_138)
    );
    wire _node_141;
    EQ_UNSIGNED #(.width(5)) u_eq_193 (
        .y(_node_141),
        .a(5'd3),
        .b(_T_291)
    );
    wire _node_142;
    MUX_UNSIGNED #(.width(1)) u_mux_194 (
        .y(_node_142),
        .sel(_node_141),
        .a(_T_217_3),
        .b(_node_140)
    );
    wire _node_143;
    EQ_UNSIGNED #(.width(5)) u_eq_195 (
        .y(_node_143),
        .a(5'd4),
        .b(_T_291)
    );
    wire _node_144;
    MUX_UNSIGNED #(.width(1)) u_mux_196 (
        .y(_node_144),
        .sel(_node_143),
        .a(_T_217_4),
        .b(_node_142)
    );
    wire _node_145;
    EQ_UNSIGNED #(.width(5)) u_eq_197 (
        .y(_node_145),
        .a(5'd5),
        .b(_T_291)
    );
    wire _node_146;
    MUX_UNSIGNED #(.width(1)) u_mux_198 (
        .y(_node_146),
        .sel(_node_145),
        .a(_T_217_5),
        .b(_node_144)
    );
    wire _node_147;
    EQ_UNSIGNED #(.width(5)) u_eq_199 (
        .y(_node_147),
        .a(5'd6),
        .b(_T_291)
    );
    wire _node_148;
    MUX_UNSIGNED #(.width(1)) u_mux_200 (
        .y(_node_148),
        .sel(_node_147),
        .a(_T_217_6),
        .b(_node_146)
    );
    wire _node_149;
    EQ_UNSIGNED #(.width(5)) u_eq_201 (
        .y(_node_149),
        .a(5'd7),
        .b(_T_291)
    );
    wire _node_150;
    MUX_UNSIGNED #(.width(1)) u_mux_202 (
        .y(_node_150),
        .sel(_node_149),
        .a(_T_217_7),
        .b(_node_148)
    );
    wire _node_151;
    EQ_UNSIGNED #(.width(5)) u_eq_203 (
        .y(_node_151),
        .a(5'd8),
        .b(_T_291)
    );
    wire _node_152;
    MUX_UNSIGNED #(.width(1)) u_mux_204 (
        .y(_node_152),
        .sel(_node_151),
        .a(_T_217_8),
        .b(_node_150)
    );
    wire _node_153;
    EQ_UNSIGNED #(.width(5)) u_eq_205 (
        .y(_node_153),
        .a(5'd9),
        .b(_T_291)
    );
    wire _node_154;
    MUX_UNSIGNED #(.width(1)) u_mux_206 (
        .y(_node_154),
        .sel(_node_153),
        .a(_T_217_9),
        .b(_node_152)
    );
    wire _node_155;
    EQ_UNSIGNED #(.width(5)) u_eq_207 (
        .y(_node_155),
        .a(5'd10),
        .b(_T_291)
    );
    wire _node_156;
    MUX_UNSIGNED #(.width(1)) u_mux_208 (
        .y(_node_156),
        .sel(_node_155),
        .a(_T_217_10),
        .b(_node_154)
    );
    wire _node_157;
    EQ_UNSIGNED #(.width(5)) u_eq_209 (
        .y(_node_157),
        .a(5'd11),
        .b(_T_291)
    );
    wire _node_158;
    MUX_UNSIGNED #(.width(1)) u_mux_210 (
        .y(_node_158),
        .sel(_node_157),
        .a(_T_217_11),
        .b(_node_156)
    );
    wire _node_159;
    EQ_UNSIGNED #(.width(5)) u_eq_211 (
        .y(_node_159),
        .a(5'd12),
        .b(_T_291)
    );
    wire _node_160;
    MUX_UNSIGNED #(.width(1)) u_mux_212 (
        .y(_node_160),
        .sel(_node_159),
        .a(_T_217_12),
        .b(_node_158)
    );
    wire _node_161;
    EQ_UNSIGNED #(.width(5)) u_eq_213 (
        .y(_node_161),
        .a(5'd13),
        .b(_T_291)
    );
    wire _node_162;
    MUX_UNSIGNED #(.width(1)) u_mux_214 (
        .y(_node_162),
        .sel(_node_161),
        .a(_T_217_13),
        .b(_node_160)
    );
    wire _node_163;
    EQ_UNSIGNED #(.width(5)) u_eq_215 (
        .y(_node_163),
        .a(5'd14),
        .b(_T_291)
    );
    wire _node_164;
    MUX_UNSIGNED #(.width(1)) u_mux_216 (
        .y(_node_164),
        .sel(_node_163),
        .a(_T_217_14),
        .b(_node_162)
    );
    wire _node_165;
    EQ_UNSIGNED #(.width(5)) u_eq_217 (
        .y(_node_165),
        .a(5'd15),
        .b(_T_291)
    );
    wire _node_166;
    MUX_UNSIGNED #(.width(1)) u_mux_218 (
        .y(_node_166),
        .sel(_node_165),
        .a(_T_217_15),
        .b(_node_164)
    );
    wire _node_167;
    EQ_UNSIGNED #(.width(5)) u_eq_219 (
        .y(_node_167),
        .a(5'd16),
        .b(_T_291)
    );
    wire _node_168;
    MUX_UNSIGNED #(.width(1)) u_mux_220 (
        .y(_node_168),
        .sel(_node_167),
        .a(_T_217_16),
        .b(_node_166)
    );
    wire _node_169;
    EQ_UNSIGNED #(.width(5)) u_eq_221 (
        .y(_node_169),
        .a(5'd17),
        .b(_T_291)
    );
    wire _node_170;
    MUX_UNSIGNED #(.width(1)) u_mux_222 (
        .y(_node_170),
        .sel(_node_169),
        .a(_T_217_17),
        .b(_node_168)
    );
    wire _node_171;
    EQ_UNSIGNED #(.width(5)) u_eq_223 (
        .y(_node_171),
        .a(5'd18),
        .b(_T_291)
    );
    wire _node_172;
    MUX_UNSIGNED #(.width(1)) u_mux_224 (
        .y(_node_172),
        .sel(_node_171),
        .a(_T_217_18),
        .b(_node_170)
    );
    wire _node_173;
    EQ_UNSIGNED #(.width(5)) u_eq_225 (
        .y(_node_173),
        .a(5'd19),
        .b(_T_291)
    );
    wire _node_174;
    MUX_UNSIGNED #(.width(1)) u_mux_226 (
        .y(_node_174),
        .sel(_node_173),
        .a(_T_217_19),
        .b(_node_172)
    );
    wire _node_175;
    EQ_UNSIGNED #(.width(5)) u_eq_227 (
        .y(_node_175),
        .a(5'd20),
        .b(_T_291)
    );
    wire _node_176;
    MUX_UNSIGNED #(.width(1)) u_mux_228 (
        .y(_node_176),
        .sel(_node_175),
        .a(_T_217_20),
        .b(_node_174)
    );
    wire _T_292;
    BITWISEAND #(.width(1)) bitwiseand_229 (
        .y(_T_292),
        .a(_device_under_test__io_out_ready),
        .b(_device_under_test__io_out_valid)
    );
    wire _T_295;
    EQ_UNSIGNED #(.width(1)) u_eq_230 (
        .y(_T_295),
        .a(reset),
        .b(1'h0)
    );
    wire _node_177;
    EQ_UNSIGNED #(.width(5)) u_eq_231 (
        .y(_node_177),
        .a(5'd0),
        .b(_value_1__q)
    );
    wire [3:0] _node_178;
    assign _node_178 = _T_266_0;
    wire _node_179;
    EQ_UNSIGNED #(.width(5)) u_eq_232 (
        .y(_node_179),
        .a(5'd1),
        .b(_value_1__q)
    );
    wire [3:0] _node_180;
    MUX_UNSIGNED #(.width(4)) u_mux_233 (
        .y(_node_180),
        .sel(_node_179),
        .a(_T_266_1),
        .b(_node_178)
    );
    wire _node_181;
    EQ_UNSIGNED #(.width(5)) u_eq_234 (
        .y(_node_181),
        .a(5'd2),
        .b(_value_1__q)
    );
    wire [3:0] _node_182;
    MUX_UNSIGNED #(.width(4)) u_mux_235 (
        .y(_node_182),
        .sel(_node_181),
        .a(_T_266_2),
        .b(_node_180)
    );
    wire _node_183;
    EQ_UNSIGNED #(.width(5)) u_eq_236 (
        .y(_node_183),
        .a(5'd3),
        .b(_value_1__q)
    );
    wire [3:0] _node_184;
    MUX_UNSIGNED #(.width(4)) u_mux_237 (
        .y(_node_184),
        .sel(_node_183),
        .a(_T_266_3),
        .b(_node_182)
    );
    wire _node_185;
    EQ_UNSIGNED #(.width(5)) u_eq_238 (
        .y(_node_185),
        .a(5'd4),
        .b(_value_1__q)
    );
    wire [3:0] _node_186;
    MUX_UNSIGNED #(.width(4)) u_mux_239 (
        .y(_node_186),
        .sel(_node_185),
        .a(_T_266_4),
        .b(_node_184)
    );
    wire _node_187;
    EQ_UNSIGNED #(.width(5)) u_eq_240 (
        .y(_node_187),
        .a(5'd5),
        .b(_value_1__q)
    );
    wire [3:0] _node_188;
    MUX_UNSIGNED #(.width(4)) u_mux_241 (
        .y(_node_188),
        .sel(_node_187),
        .a(_T_266_5),
        .b(_node_186)
    );
    wire _node_189;
    EQ_UNSIGNED #(.width(5)) u_eq_242 (
        .y(_node_189),
        .a(5'd6),
        .b(_value_1__q)
    );
    wire [3:0] _node_190;
    MUX_UNSIGNED #(.width(4)) u_mux_243 (
        .y(_node_190),
        .sel(_node_189),
        .a(_T_266_6),
        .b(_node_188)
    );
    wire _node_191;
    EQ_UNSIGNED #(.width(5)) u_eq_244 (
        .y(_node_191),
        .a(5'd7),
        .b(_value_1__q)
    );
    wire [3:0] _node_192;
    MUX_UNSIGNED #(.width(4)) u_mux_245 (
        .y(_node_192),
        .sel(_node_191),
        .a(_T_266_7),
        .b(_node_190)
    );
    wire _node_193;
    EQ_UNSIGNED #(.width(5)) u_eq_246 (
        .y(_node_193),
        .a(5'd8),
        .b(_value_1__q)
    );
    wire [3:0] _node_194;
    MUX_UNSIGNED #(.width(4)) u_mux_247 (
        .y(_node_194),
        .sel(_node_193),
        .a(_T_266_8),
        .b(_node_192)
    );
    wire _node_195;
    EQ_UNSIGNED #(.width(5)) u_eq_248 (
        .y(_node_195),
        .a(5'd9),
        .b(_value_1__q)
    );
    wire [3:0] _node_196;
    MUX_UNSIGNED #(.width(4)) u_mux_249 (
        .y(_node_196),
        .sel(_node_195),
        .a(_T_266_9),
        .b(_node_194)
    );
    wire _node_197;
    EQ_UNSIGNED #(.width(5)) u_eq_250 (
        .y(_node_197),
        .a(5'd10),
        .b(_value_1__q)
    );
    wire [3:0] _node_198;
    MUX_UNSIGNED #(.width(4)) u_mux_251 (
        .y(_node_198),
        .sel(_node_197),
        .a(_T_266_10),
        .b(_node_196)
    );
    wire _node_199;
    EQ_UNSIGNED #(.width(5)) u_eq_252 (
        .y(_node_199),
        .a(5'd11),
        .b(_value_1__q)
    );
    wire [3:0] _node_200;
    MUX_UNSIGNED #(.width(4)) u_mux_253 (
        .y(_node_200),
        .sel(_node_199),
        .a(_T_266_11),
        .b(_node_198)
    );
    wire _node_201;
    EQ_UNSIGNED #(.width(5)) u_eq_254 (
        .y(_node_201),
        .a(5'd12),
        .b(_value_1__q)
    );
    wire [3:0] _node_202;
    MUX_UNSIGNED #(.width(4)) u_mux_255 (
        .y(_node_202),
        .sel(_node_201),
        .a(_T_266_12),
        .b(_node_200)
    );
    wire _node_203;
    EQ_UNSIGNED #(.width(5)) u_eq_256 (
        .y(_node_203),
        .a(5'd13),
        .b(_value_1__q)
    );
    wire [3:0] _node_204;
    MUX_UNSIGNED #(.width(4)) u_mux_257 (
        .y(_node_204),
        .sel(_node_203),
        .a(_T_266_13),
        .b(_node_202)
    );
    wire _node_205;
    EQ_UNSIGNED #(.width(5)) u_eq_258 (
        .y(_node_205),
        .a(5'd14),
        .b(_value_1__q)
    );
    wire [3:0] _node_206;
    MUX_UNSIGNED #(.width(4)) u_mux_259 (
        .y(_node_206),
        .sel(_node_205),
        .a(_T_266_14),
        .b(_node_204)
    );
    wire _node_207;
    EQ_UNSIGNED #(.width(5)) u_eq_260 (
        .y(_node_207),
        .a(5'd15),
        .b(_value_1__q)
    );
    wire [3:0] _node_208;
    MUX_UNSIGNED #(.width(4)) u_mux_261 (
        .y(_node_208),
        .sel(_node_207),
        .a(_T_266_15),
        .b(_node_206)
    );
    wire _node_209;
    EQ_UNSIGNED #(.width(5)) u_eq_262 (
        .y(_node_209),
        .a(5'd16),
        .b(_value_1__q)
    );
    wire [3:0] _node_210;
    MUX_UNSIGNED #(.width(4)) u_mux_263 (
        .y(_node_210),
        .sel(_node_209),
        .a(_T_266_16),
        .b(_node_208)
    );
    wire _node_211;
    EQ_UNSIGNED #(.width(5)) u_eq_264 (
        .y(_node_211),
        .a(5'd17),
        .b(_value_1__q)
    );
    wire [3:0] _node_212;
    MUX_UNSIGNED #(.width(4)) u_mux_265 (
        .y(_node_212),
        .sel(_node_211),
        .a(_T_266_17),
        .b(_node_210)
    );
    wire _node_213;
    EQ_UNSIGNED #(.width(5)) u_eq_266 (
        .y(_node_213),
        .a(5'd18),
        .b(_value_1__q)
    );
    wire [3:0] _node_214;
    MUX_UNSIGNED #(.width(4)) u_mux_267 (
        .y(_node_214),
        .sel(_node_213),
        .a(_T_266_18),
        .b(_node_212)
    );
    wire _node_215;
    EQ_UNSIGNED #(.width(5)) u_eq_268 (
        .y(_node_215),
        .a(5'd19),
        .b(_value_1__q)
    );
    wire [3:0] _node_216;
    MUX_UNSIGNED #(.width(4)) u_mux_269 (
        .y(_node_216),
        .sel(_node_215),
        .a(_T_266_19),
        .b(_node_214)
    );
    wire _node_217;
    EQ_UNSIGNED #(.width(5)) u_eq_270 (
        .y(_node_217),
        .a(5'd20),
        .b(_value_1__q)
    );
    wire [3:0] _node_218;
    MUX_UNSIGNED #(.width(4)) u_mux_271 (
        .y(_node_218),
        .sel(_node_217),
        .a(_T_266_20),
        .b(_node_216)
    );
    wire _T_297;
    wire [15:0] _WTEMP_20;
    PAD_UNSIGNED #(.width(4), .n(16)) u_pad_272 (
        .y(_WTEMP_20),
        .in(_node_218)
    );
    NEQ_UNSIGNED #(.width(16)) u_neq_273 (
        .y(_T_297),
        .a(_device_under_test__io_out_bits_c),
        .b(_WTEMP_20)
    );
    wire _T_300;
    EQ_UNSIGNED #(.width(1)) u_eq_274 (
        .y(_T_300),
        .a(reset),
        .b(1'h0)
    );
    wire _T_302;
    BITWISEOR #(.width(1)) bitwiseor_275 (
        .y(_T_302),
        .a(1'h0),
        .b(reset)
    );
    wire _T_304;
    EQ_UNSIGNED #(.width(1)) u_eq_276 (
        .y(_T_304),
        .a(_T_302),
        .b(1'h0)
    );
    wire _T_306;
    EQ_UNSIGNED #(.width(1)) u_eq_277 (
        .y(_T_306),
        .a(reset),
        .b(1'h0)
    );
    wire _T_308;
    EQ_UNSIGNED #(.width(5)) u_eq_278 (
        .y(_T_308),
        .a(_value_1__q),
        .b(5'h13)
    );
    wire [5:0] _T_310;
    wire [4:0] _WTEMP_21;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_279 (
        .y(_WTEMP_21),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(5)) u_add_280 (
        .y(_T_310),
        .a(_value_1__q),
        .b(_WTEMP_21)
    );
    wire [4:0] _T_311;
    TAIL #(.width(6), .n(1)) tail_281 (
        .y(_T_311),
        .in(_T_310)
    );
    wire _T_314;
    EQ_UNSIGNED #(.width(1)) u_eq_282 (
        .y(_T_314),
        .a(__T_13__q),
        .b(1'h0)
    );
    wire _T_316;
    wire [6:0] _WTEMP_22;
    PAD_UNSIGNED #(.width(5), .n(7)) u_pad_283 (
        .y(_WTEMP_22),
        .in(5'h13)
    );
    EQ_UNSIGNED #(.width(7)) u_eq_284 (
        .y(_T_316),
        .a(__T_10__q),
        .b(_WTEMP_22)
    );
    wire [7:0] _T_319;
    wire [6:0] _WTEMP_23;
    PAD_UNSIGNED #(.width(1), .n(7)) u_pad_285 (
        .y(_WTEMP_23),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(7)) u_add_286 (
        .y(_T_319),
        .a(__T_10__q),
        .b(_WTEMP_23)
    );
    wire [6:0] _T_320;
    TAIL #(.width(8), .n(1)) tail_287 (
        .y(_T_320),
        .in(_T_319)
    );
    wire _node_219;
    MUX_UNSIGNED #(.width(1)) u_mux_288 (
        .y(_node_219),
        .sel(_T_316),
        .a(1'h1),
        .b(__T_13__q)
    );
    wire [6:0] _node_220;
    MUX_UNSIGNED #(.width(7)) u_mux_289 (
        .y(_node_220),
        .sel(_T_314),
        .a(_T_320),
        .b(__T_10__q)
    );
    wire _node_221;
    MUX_UNSIGNED #(.width(1)) u_mux_290 (
        .y(_node_221),
        .sel(_T_314),
        .a(_node_219),
        .b(__T_13__q)
    );
    wire [4:0] _node_222;
    wire [4:0] _WTEMP_24;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_291 (
        .y(_WTEMP_24),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_292 (
        .y(_node_222),
        .sel(_T_308),
        .a(_WTEMP_24),
        .b(_T_311)
    );
    MUX_UNSIGNED #(.width(7)) u_mux_293 (
        .y(_WTEMP_10),
        .sel(_T_292),
        .a(_node_220),
        .b(__T_10__q)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_294 (
        .y(_T_104_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_295 (
        .y(_T_104_1),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_296 (
        .y(_T_104_10),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_297 (
        .y(_T_104_11),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_298 (
        .y(_T_104_12),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_299 (
        .y(_T_104_13),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_300 (
        .y(_T_104_14),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_301 (
        .y(_T_104_15),
        .in(2'h3)
    );
    assign _T_104_16 = 3'h4;
    assign _T_104_17 = 3'h4;
    assign _T_104_18 = 3'h4;
    assign _T_104_19 = 3'h4;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_302 (
        .y(_T_104_2),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_303 (
        .y(_T_104_20),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_304 (
        .y(_T_104_3),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_305 (
        .y(_T_104_4),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_306 (
        .y(_T_104_5),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_307 (
        .y(_T_104_6),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_308 (
        .y(_T_104_7),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_309 (
        .y(_T_104_8),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_310 (
        .y(_T_104_9),
        .in(2'h2)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_311 (
        .y(_WTEMP_11),
        .sel(_T_292),
        .a(_node_221),
        .b(__T_13__q)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_312 (
        .y(_T_151_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_313 (
        .y(_T_151_1),
        .in(2'h2)
    );
    assign _T_151_10 = 3'h4;
    assign _T_151_11 = 3'h6;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_314 (
        .y(_T_151_12),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_315 (
        .y(_T_151_13),
        .in(2'h2)
    );
    assign _T_151_14 = 3'h4;
    assign _T_151_15 = 3'h6;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_316 (
        .y(_T_151_16),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_317 (
        .y(_T_151_17),
        .in(2'h2)
    );
    assign _T_151_18 = 3'h4;
    assign _T_151_19 = 3'h6;
    assign _T_151_2 = 3'h4;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_318 (
        .y(_T_151_20),
        .in(1'h0)
    );
    assign _T_151_3 = 3'h6;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_319 (
        .y(_T_151_4),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_320 (
        .y(_T_151_5),
        .in(2'h2)
    );
    assign _T_151_6 = 3'h4;
    assign _T_151_7 = 3'h6;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_321 (
        .y(_T_151_8),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_322 (
        .y(_T_151_9),
        .in(2'h2)
    );
    assign _WTEMP_12 = _T_24;
    assign _T_217_0 = 1'h1;
    assign _T_217_1 = 1'h1;
    assign _T_217_10 = 1'h1;
    assign _T_217_11 = 1'h1;
    assign _T_217_12 = 1'h1;
    assign _T_217_13 = 1'h1;
    assign _T_217_14 = 1'h1;
    assign _T_217_15 = 1'h1;
    assign _T_217_16 = 1'h1;
    assign _T_217_17 = 1'h1;
    assign _T_217_18 = 1'h1;
    assign _T_217_19 = 1'h1;
    assign _T_217_2 = 1'h1;
    assign _T_217_20 = 1'h0;
    assign _T_217_3 = 1'h1;
    assign _T_217_4 = 1'h1;
    assign _T_217_5 = 1'h1;
    assign _T_217_6 = 1'h1;
    assign _T_217_7 = 1'h1;
    assign _T_217_8 = 1'h1;
    assign _T_217_9 = 1'h1;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_323 (
        .y(_T_266_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_324 (
        .y(_T_266_1),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_325 (
        .y(_T_266_10),
        .in(3'h6)
    );
    assign _T_266_11 = 4'h8;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_326 (
        .y(_T_266_12),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_327 (
        .y(_T_266_13),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_328 (
        .y(_T_266_14),
        .in(3'h7)
    );
    assign _T_266_15 = 4'h9;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_329 (
        .y(_T_266_16),
        .in(3'h4)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_330 (
        .y(_T_266_17),
        .in(3'h6)
    );
    assign _T_266_18 = 4'h8;
    assign _T_266_19 = 4'hA;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_331 (
        .y(_T_266_2),
        .in(3'h4)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_332 (
        .y(_T_266_20),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_333 (
        .y(_T_266_3),
        .in(3'h6)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_334 (
        .y(_T_266_4),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_335 (
        .y(_T_266_5),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_336 (
        .y(_T_266_6),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_337 (
        .y(_T_266_7),
        .in(3'h7)
    );
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_338 (
        .y(_T_266_8),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_339 (
        .y(_T_266_9),
        .in(3'h4)
    );
    MUX_UNSIGNED #(.width(7)) u_mux_340 (
        .y(_WTEMP_8),
        .sel(_T_179),
        .a(_node_132),
        .b(__T_4__q)
    );
    assign _T_55_0 = 1'h1;
    assign _T_55_1 = 1'h1;
    assign _T_55_10 = 1'h1;
    assign _T_55_11 = 1'h1;
    assign _T_55_12 = 1'h1;
    assign _T_55_13 = 1'h1;
    assign _T_55_14 = 1'h1;
    assign _T_55_15 = 1'h1;
    assign _T_55_16 = 1'h1;
    assign _T_55_17 = 1'h1;
    assign _T_55_18 = 1'h1;
    assign _T_55_19 = 1'h1;
    assign _T_55_2 = 1'h1;
    assign _T_55_20 = 1'h0;
    assign _T_55_3 = 1'h1;
    assign _T_55_4 = 1'h1;
    assign _T_55_5 = 1'h1;
    assign _T_55_6 = 1'h1;
    assign _T_55_7 = 1'h1;
    assign _T_55_8 = 1'h1;
    assign _T_55_9 = 1'h1;
    MUX_UNSIGNED #(.width(1)) u_mux_341 (
        .y(_WTEMP_9),
        .sel(_T_179),
        .a(_node_133),
        .b(__T_7__q)
    );
    assign _device_under_test__clock = clock;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_342 (
        .y(_device_under_test__io_in_bits_a),
        .in(_node_46)
    );
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_343 (
        .y(_device_under_test__io_in_bits_b),
        .in(_node_88)
    );
    assign _device_under_test__io_in_valid = _node_130;
    assign _device_under_test__io_out_ready = _node_176;
    assign _device_under_test__reset = reset;
    MUX_UNSIGNED #(.width(5)) u_mux_344 (
        .y(_WTEMP_14),
        .sel(_T_179),
        .a(_node_134),
        .b(_value__q)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_345 (
        .y(_WTEMP_19),
        .sel(_T_292),
        .a(_node_222),
        .b(_value_1__q)
    );
endmodule //DecoupledAdderTests
module SlowDecoupledAdder(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [15:0] io_in_bits_a,
    input [15:0] io_in_bits_b,
    input io_out_ready,
    output io_out_valid,
    output [15:0] io_out_bits_c
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
    wire [15:0] _a_reg__q;
    wire [15:0] _a_reg__d;
    DFF_POSCLK #(.width(16)) a_reg (
        .q(_a_reg__q),
        .d(_a_reg__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(16)) u_mux_2 (
        .y(_a_reg__d),
        .sel(reset),
        .a(16'h0),
        .b(_WTEMP_1)
    );
    wire [15:0] _b_reg__q;
    wire [15:0] _b_reg__d;
    DFF_POSCLK #(.width(16)) b_reg (
        .q(_b_reg__q),
        .d(_b_reg__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(16)) u_mux_3 (
        .y(_b_reg__d),
        .sel(reset),
        .a(16'h0),
        .b(_WTEMP_2)
    );
    wire [15:0] _wait_counter__q;
    wire [15:0] _wait_counter__d;
    DFF_POSCLK #(.width(16)) wait_counter (
        .q(_wait_counter__q),
        .d(_wait_counter__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_3;
    MUX_UNSIGNED #(.width(16)) u_mux_4 (
        .y(_wait_counter__d),
        .sel(reset),
        .a(16'h0),
        .b(_WTEMP_3)
    );
    wire _T_26;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(_T_26),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_28;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_28),
        .a(reset),
        .b(1'h0)
    );
    wire _T_30;
    EQ_UNSIGNED #(.width(1)) u_eq_7 (
        .y(_T_30),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_31;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(_T_31),
        .a(io_in_valid),
        .b(_T_30)
    );
    wire _T_35;
    wire [15:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(4), .n(16)) u_pad_9 (
        .y(_WTEMP_4),
        .in(4'hA)
    );
    GT_UNSIGNED #(.width(16)) u_gt_10 (
        .y(_T_35),
        .a(_wait_counter__q),
        .b(_WTEMP_4)
    );
    wire [16:0] _T_36;
    ADD_UNSIGNED #(.width(16)) u_add_11 (
        .y(_T_36),
        .a(_a_reg__q),
        .b(_b_reg__q)
    );
    wire [15:0] _T_37;
    TAIL #(.width(17), .n(1)) tail_12 (
        .y(_T_37),
        .in(_T_36)
    );
    wire _T_39;
    EQ_UNSIGNED #(.width(1)) u_eq_13 (
        .y(_T_39),
        .a(_T_35),
        .b(1'h0)
    );
    wire [16:0] _T_41;
    wire [15:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_14 (
        .y(_WTEMP_5),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_15 (
        .y(_T_41),
        .a(_wait_counter__q),
        .b(_WTEMP_5)
    );
    wire [15:0] _T_42;
    TAIL #(.width(17), .n(1)) tail_16 (
        .y(_T_42),
        .in(_T_41)
    );
    wire [15:0] _node_0;
    wire [15:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_17 (
        .y(_WTEMP_6),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_18 (
        .y(_node_0),
        .sel(_T_31),
        .a(_WTEMP_6),
        .b(_wait_counter__q)
    );
    wire [15:0] _node_1;
    assign _node_1 = _T_37;
    wire [15:0] _node_2;
    MUX_UNSIGNED #(.width(16)) u_mux_19 (
        .y(_node_2),
        .sel(_T_39),
        .a(_T_42),
        .b(_node_0)
    );
    wire [15:0] _node_3;
    wire [15:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_20 (
        .y(_WTEMP_7),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_21 (
        .y(_node_3),
        .sel(_T_31),
        .a(_WTEMP_7),
        .b(_wait_counter__q)
    );
    wire [16:0] _T_43;
    ADD_UNSIGNED #(.width(16)) u_add_22 (
        .y(_T_43),
        .a(_a_reg__q),
        .b(_b_reg__q)
    );
    wire [15:0] _T_44;
    TAIL #(.width(17), .n(1)) tail_23 (
        .y(_T_44),
        .in(_T_43)
    );
    wire _T_45;
    EQ_UNSIGNED #(.width(16)) u_eq_24 (
        .y(_T_45),
        .a(io_out_bits_c),
        .b(_T_44)
    );
    wire _T_46;
    BITWISEAND #(.width(1)) bitwiseand_25 (
        .y(_T_46),
        .a(_T_45),
        .b(_busy__q)
    );
    wire _node_4;
    MUX_UNSIGNED #(.width(1)) u_mux_26 (
        .y(_node_4),
        .sel(_T_31),
        .a(1'h1),
        .b(_busy__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_27 (
        .y(_WTEMP_1),
        .sel(_T_31),
        .a(io_in_bits_a),
        .b(_a_reg__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_28 (
        .y(_WTEMP_2),
        .sel(_T_31),
        .a(io_in_bits_b),
        .b(_b_reg__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_29 (
        .y(_WTEMP_0),
        .sel(io_out_valid),
        .a(1'h0),
        .b(_node_4)
    );
    assign io_in_ready = _T_26;
    assign io_out_bits_c = _node_1;
    assign io_out_valid = _T_46;
    MUX_UNSIGNED #(.width(16)) u_mux_30 (
        .y(_WTEMP_3),
        .sel(_busy__q),
        .a(_node_2),
        .b(_node_3)
    );
endmodule //SlowDecoupledAdder
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
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
