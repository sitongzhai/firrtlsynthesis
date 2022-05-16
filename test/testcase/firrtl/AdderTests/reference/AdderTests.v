module AdderTests(
    input clock,
    input reset
);
    wire _c__clock;
    wire _c__reset;
    wire [9:0] _c__io_in0;
    wire [9:0] _c__io_in1;
    wire [9:0] _c__io_out;
    Adder c (
        .clock(_c__clock),
        .reset(_c__reset),
        .io_in0(_c__io_in0),
        .io_in1(_c__io_in1),
        .io_out(_c__io_out)
    );
    wire [3:0] _value__q;
    wire [3:0] _value__d;
    DFF_POSCLK #(.width(4)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(4)) u_mux_3 (
        .y(_value__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_0)
    );
    wire __T_6__q;
    wire __T_6__d;
    DFF_POSCLK #(.width(1)) _T_6 (
        .q(__T_6__q),
        .d(__T_6__d),
        .clk(clock)
    );
    wire _WTEMP_1;
    MUX_UNSIGNED #(.width(1)) u_mux_4 (
        .y(__T_6__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_1)
    );
    wire _T_8;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(_T_8),
        .a(__T_6__q),
        .b(1'h0)
    );
    wire [9:0] _T_22_0;
    wire [9:0] _T_22_1;
    wire [9:0] _T_22_2;
    wire [9:0] _T_22_3;
    wire [9:0] _T_22_4;
    wire [9:0] _T_22_5;
    wire [9:0] _T_22_6;
    wire [9:0] _T_22_7;
    wire [9:0] _T_22_8;
    wire [9:0] _T_22_9;
    wire [9:0] _T_22_10;
    wire _node_0;
    EQ_UNSIGNED #(.width(4)) u_eq_6 (
        .y(_node_0),
        .a(4'd0),
        .b(_value__q)
    );
    wire [9:0] _node_1;
    assign _node_1 = _T_22_0;
    wire _node_2;
    EQ_UNSIGNED #(.width(4)) u_eq_7 (
        .y(_node_2),
        .a(4'd1),
        .b(_value__q)
    );
    wire [9:0] _node_3;
    MUX_UNSIGNED #(.width(10)) u_mux_8 (
        .y(_node_3),
        .sel(_node_2),
        .a(_T_22_1),
        .b(_node_1)
    );
    wire _node_4;
    EQ_UNSIGNED #(.width(4)) u_eq_9 (
        .y(_node_4),
        .a(4'd2),
        .b(_value__q)
    );
    wire [9:0] _node_5;
    MUX_UNSIGNED #(.width(10)) u_mux_10 (
        .y(_node_5),
        .sel(_node_4),
        .a(_T_22_2),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(4)) u_eq_11 (
        .y(_node_6),
        .a(4'd3),
        .b(_value__q)
    );
    wire [9:0] _node_7;
    MUX_UNSIGNED #(.width(10)) u_mux_12 (
        .y(_node_7),
        .sel(_node_6),
        .a(_T_22_3),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(4)) u_eq_13 (
        .y(_node_8),
        .a(4'd4),
        .b(_value__q)
    );
    wire [9:0] _node_9;
    MUX_UNSIGNED #(.width(10)) u_mux_14 (
        .y(_node_9),
        .sel(_node_8),
        .a(_T_22_4),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(4)) u_eq_15 (
        .y(_node_10),
        .a(4'd5),
        .b(_value__q)
    );
    wire [9:0] _node_11;
    MUX_UNSIGNED #(.width(10)) u_mux_16 (
        .y(_node_11),
        .sel(_node_10),
        .a(_T_22_5),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(4)) u_eq_17 (
        .y(_node_12),
        .a(4'd6),
        .b(_value__q)
    );
    wire [9:0] _node_13;
    MUX_UNSIGNED #(.width(10)) u_mux_18 (
        .y(_node_13),
        .sel(_node_12),
        .a(_T_22_6),
        .b(_node_11)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(4)) u_eq_19 (
        .y(_node_14),
        .a(4'd7),
        .b(_value__q)
    );
    wire [9:0] _node_15;
    MUX_UNSIGNED #(.width(10)) u_mux_20 (
        .y(_node_15),
        .sel(_node_14),
        .a(_T_22_7),
        .b(_node_13)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(4)) u_eq_21 (
        .y(_node_16),
        .a(4'd8),
        .b(_value__q)
    );
    wire [9:0] _node_17;
    MUX_UNSIGNED #(.width(10)) u_mux_22 (
        .y(_node_17),
        .sel(_node_16),
        .a(_T_22_8),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(4)) u_eq_23 (
        .y(_node_18),
        .a(4'd9),
        .b(_value__q)
    );
    wire [9:0] _node_19;
    MUX_UNSIGNED #(.width(10)) u_mux_24 (
        .y(_node_19),
        .sel(_node_18),
        .a(_T_22_9),
        .b(_node_17)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(4)) u_eq_25 (
        .y(_node_20),
        .a(4'd10),
        .b(_value__q)
    );
    wire [9:0] _node_21;
    MUX_UNSIGNED #(.width(10)) u_mux_26 (
        .y(_node_21),
        .sel(_node_20),
        .a(_T_22_10),
        .b(_node_19)
    );
    wire [9:0] _T_50_0;
    wire [9:0] _T_50_1;
    wire [9:0] _T_50_2;
    wire [9:0] _T_50_3;
    wire [9:0] _T_50_4;
    wire [9:0] _T_50_5;
    wire [9:0] _T_50_6;
    wire [9:0] _T_50_7;
    wire [9:0] _T_50_8;
    wire [9:0] _T_50_9;
    wire [9:0] _T_50_10;
    wire _node_22;
    EQ_UNSIGNED #(.width(4)) u_eq_27 (
        .y(_node_22),
        .a(4'd0),
        .b(_value__q)
    );
    wire [9:0] _node_23;
    assign _node_23 = _T_50_0;
    wire _node_24;
    EQ_UNSIGNED #(.width(4)) u_eq_28 (
        .y(_node_24),
        .a(4'd1),
        .b(_value__q)
    );
    wire [9:0] _node_25;
    MUX_UNSIGNED #(.width(10)) u_mux_29 (
        .y(_node_25),
        .sel(_node_24),
        .a(_T_50_1),
        .b(_node_23)
    );
    wire _node_26;
    EQ_UNSIGNED #(.width(4)) u_eq_30 (
        .y(_node_26),
        .a(4'd2),
        .b(_value__q)
    );
    wire [9:0] _node_27;
    MUX_UNSIGNED #(.width(10)) u_mux_31 (
        .y(_node_27),
        .sel(_node_26),
        .a(_T_50_2),
        .b(_node_25)
    );
    wire _node_28;
    EQ_UNSIGNED #(.width(4)) u_eq_32 (
        .y(_node_28),
        .a(4'd3),
        .b(_value__q)
    );
    wire [9:0] _node_29;
    MUX_UNSIGNED #(.width(10)) u_mux_33 (
        .y(_node_29),
        .sel(_node_28),
        .a(_T_50_3),
        .b(_node_27)
    );
    wire _node_30;
    EQ_UNSIGNED #(.width(4)) u_eq_34 (
        .y(_node_30),
        .a(4'd4),
        .b(_value__q)
    );
    wire [9:0] _node_31;
    MUX_UNSIGNED #(.width(10)) u_mux_35 (
        .y(_node_31),
        .sel(_node_30),
        .a(_T_50_4),
        .b(_node_29)
    );
    wire _node_32;
    EQ_UNSIGNED #(.width(4)) u_eq_36 (
        .y(_node_32),
        .a(4'd5),
        .b(_value__q)
    );
    wire [9:0] _node_33;
    MUX_UNSIGNED #(.width(10)) u_mux_37 (
        .y(_node_33),
        .sel(_node_32),
        .a(_T_50_5),
        .b(_node_31)
    );
    wire _node_34;
    EQ_UNSIGNED #(.width(4)) u_eq_38 (
        .y(_node_34),
        .a(4'd6),
        .b(_value__q)
    );
    wire [9:0] _node_35;
    MUX_UNSIGNED #(.width(10)) u_mux_39 (
        .y(_node_35),
        .sel(_node_34),
        .a(_T_50_6),
        .b(_node_33)
    );
    wire _node_36;
    EQ_UNSIGNED #(.width(4)) u_eq_40 (
        .y(_node_36),
        .a(4'd7),
        .b(_value__q)
    );
    wire [9:0] _node_37;
    MUX_UNSIGNED #(.width(10)) u_mux_41 (
        .y(_node_37),
        .sel(_node_36),
        .a(_T_50_7),
        .b(_node_35)
    );
    wire _node_38;
    EQ_UNSIGNED #(.width(4)) u_eq_42 (
        .y(_node_38),
        .a(4'd8),
        .b(_value__q)
    );
    wire [9:0] _node_39;
    MUX_UNSIGNED #(.width(10)) u_mux_43 (
        .y(_node_39),
        .sel(_node_38),
        .a(_T_50_8),
        .b(_node_37)
    );
    wire _node_40;
    EQ_UNSIGNED #(.width(4)) u_eq_44 (
        .y(_node_40),
        .a(4'd9),
        .b(_value__q)
    );
    wire [9:0] _node_41;
    MUX_UNSIGNED #(.width(10)) u_mux_45 (
        .y(_node_41),
        .sel(_node_40),
        .a(_T_50_9),
        .b(_node_39)
    );
    wire _node_42;
    EQ_UNSIGNED #(.width(4)) u_eq_46 (
        .y(_node_42),
        .a(4'd10),
        .b(_value__q)
    );
    wire [9:0] _node_43;
    MUX_UNSIGNED #(.width(10)) u_mux_47 (
        .y(_node_43),
        .sel(_node_42),
        .a(_T_50_10),
        .b(_node_41)
    );
    wire [9:0] _T_68;
    wire [9:0] _T_72;
    wire [9:0] _T_76;
    wire [9:0] _T_80;
    wire [9:0] _T_84;
    wire [9:0] _T_88;
    wire [9:0] _T_92;
    wire [9:0] _T_96;
    wire [9:0] _T_100;
    wire [9:0] _T_104;
    wire [9:0] _T_108;
    wire [9:0] _T_111_0;
    wire [9:0] _T_111_1;
    wire [9:0] _T_111_2;
    wire [9:0] _T_111_3;
    wire [9:0] _T_111_4;
    wire [9:0] _T_111_5;
    wire [9:0] _T_111_6;
    wire [9:0] _T_111_7;
    wire [9:0] _T_111_8;
    wire [9:0] _T_111_9;
    wire [9:0] _T_111_10;
    wire _T_138_0;
    wire _T_138_1;
    wire _T_138_2;
    wire _T_138_3;
    wire _T_138_4;
    wire _T_138_5;
    wire _T_138_6;
    wire _T_138_7;
    wire _T_138_8;
    wire _T_138_9;
    wire _T_138_10;
    wire _node_44;
    EQ_UNSIGNED #(.width(4)) u_eq_48 (
        .y(_node_44),
        .a(4'd0),
        .b(_value__q)
    );
    wire [9:0] _node_45;
    assign _node_45 = _T_111_0;
    wire _node_46;
    EQ_UNSIGNED #(.width(4)) u_eq_49 (
        .y(_node_46),
        .a(4'd1),
        .b(_value__q)
    );
    wire [9:0] _node_47;
    MUX_UNSIGNED #(.width(10)) u_mux_50 (
        .y(_node_47),
        .sel(_node_46),
        .a(_T_111_1),
        .b(_node_45)
    );
    wire _node_48;
    EQ_UNSIGNED #(.width(4)) u_eq_51 (
        .y(_node_48),
        .a(4'd2),
        .b(_value__q)
    );
    wire [9:0] _node_49;
    MUX_UNSIGNED #(.width(10)) u_mux_52 (
        .y(_node_49),
        .sel(_node_48),
        .a(_T_111_2),
        .b(_node_47)
    );
    wire _node_50;
    EQ_UNSIGNED #(.width(4)) u_eq_53 (
        .y(_node_50),
        .a(4'd3),
        .b(_value__q)
    );
    wire [9:0] _node_51;
    MUX_UNSIGNED #(.width(10)) u_mux_54 (
        .y(_node_51),
        .sel(_node_50),
        .a(_T_111_3),
        .b(_node_49)
    );
    wire _node_52;
    EQ_UNSIGNED #(.width(4)) u_eq_55 (
        .y(_node_52),
        .a(4'd4),
        .b(_value__q)
    );
    wire [9:0] _node_53;
    MUX_UNSIGNED #(.width(10)) u_mux_56 (
        .y(_node_53),
        .sel(_node_52),
        .a(_T_111_4),
        .b(_node_51)
    );
    wire _node_54;
    EQ_UNSIGNED #(.width(4)) u_eq_57 (
        .y(_node_54),
        .a(4'd5),
        .b(_value__q)
    );
    wire [9:0] _node_55;
    MUX_UNSIGNED #(.width(10)) u_mux_58 (
        .y(_node_55),
        .sel(_node_54),
        .a(_T_111_5),
        .b(_node_53)
    );
    wire _node_56;
    EQ_UNSIGNED #(.width(4)) u_eq_59 (
        .y(_node_56),
        .a(4'd6),
        .b(_value__q)
    );
    wire [9:0] _node_57;
    MUX_UNSIGNED #(.width(10)) u_mux_60 (
        .y(_node_57),
        .sel(_node_56),
        .a(_T_111_6),
        .b(_node_55)
    );
    wire _node_58;
    EQ_UNSIGNED #(.width(4)) u_eq_61 (
        .y(_node_58),
        .a(4'd7),
        .b(_value__q)
    );
    wire [9:0] _node_59;
    MUX_UNSIGNED #(.width(10)) u_mux_62 (
        .y(_node_59),
        .sel(_node_58),
        .a(_T_111_7),
        .b(_node_57)
    );
    wire _node_60;
    EQ_UNSIGNED #(.width(4)) u_eq_63 (
        .y(_node_60),
        .a(4'd8),
        .b(_value__q)
    );
    wire [9:0] _node_61;
    MUX_UNSIGNED #(.width(10)) u_mux_64 (
        .y(_node_61),
        .sel(_node_60),
        .a(_T_111_8),
        .b(_node_59)
    );
    wire _node_62;
    EQ_UNSIGNED #(.width(4)) u_eq_65 (
        .y(_node_62),
        .a(4'd9),
        .b(_value__q)
    );
    wire [9:0] _node_63;
    MUX_UNSIGNED #(.width(10)) u_mux_66 (
        .y(_node_63),
        .sel(_node_62),
        .a(_T_111_9),
        .b(_node_61)
    );
    wire _node_64;
    EQ_UNSIGNED #(.width(4)) u_eq_67 (
        .y(_node_64),
        .a(4'd10),
        .b(_value__q)
    );
    wire [9:0] _node_65;
    MUX_UNSIGNED #(.width(10)) u_mux_68 (
        .y(_node_65),
        .sel(_node_64),
        .a(_T_111_10),
        .b(_node_63)
    );
    wire _T_154;
    EQ_UNSIGNED #(.width(10)) u_eq_69 (
        .y(_T_154),
        .a(_c__io_out),
        .b(_node_65)
    );
    wire _T_156;
    EQ_UNSIGNED #(.width(1)) u_eq_70 (
        .y(_T_156),
        .a(reset),
        .b(1'h0)
    );
    wire _T_158;
    EQ_UNSIGNED #(.width(1)) u_eq_71 (
        .y(_T_158),
        .a(_T_154),
        .b(1'h0)
    );
    wire _T_161;
    EQ_UNSIGNED #(.width(1)) u_eq_72 (
        .y(_T_161),
        .a(reset),
        .b(1'h0)
    );
    wire _T_163;
    BITWISEOR #(.width(1)) bitwiseor_73 (
        .y(_T_163),
        .a(1'h0),
        .b(reset)
    );
    wire _T_165;
    EQ_UNSIGNED #(.width(1)) u_eq_74 (
        .y(_T_165),
        .a(_T_163),
        .b(1'h0)
    );
    wire _T_167;
    EQ_UNSIGNED #(.width(1)) u_eq_75 (
        .y(_T_167),
        .a(reset),
        .b(1'h0)
    );
    wire _T_169;
    EQ_UNSIGNED #(.width(4)) u_eq_76 (
        .y(_T_169),
        .a(_value__q),
        .b(4'hA)
    );
    wire [4:0] _T_171;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_77 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_78 (
        .y(_T_171),
        .a(_value__q),
        .b(_WTEMP_2)
    );
    wire [3:0] _T_172;
    TAIL #(.width(5), .n(1)) tail_79 (
        .y(_T_172),
        .in(_T_171)
    );
    wire _T_175;
    EQ_UNSIGNED #(.width(1)) u_eq_80 (
        .y(_T_175),
        .a(reset),
        .b(1'h0)
    );
    wire _T_178;
    EQ_UNSIGNED #(.width(1)) u_eq_81 (
        .y(_T_178),
        .a(reset),
        .b(1'h0)
    );
    wire _node_66;
    MUX_UNSIGNED #(.width(1)) u_mux_82 (
        .y(_node_66),
        .sel(_T_169),
        .a(1'h1),
        .b(__T_6__q)
    );
    wire [3:0] _node_67;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_83 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_84 (
        .y(_node_67),
        .sel(_T_169),
        .a(_WTEMP_3),
        .b(_T_172)
    );
    assign _T_100 = 10'h39B;
    PAD_UNSIGNED #(.width(7), .n(10)) u_pad_85 (
        .y(_T_104),
        .in(7'h77)
    );
    PAD_UNSIGNED #(.width(1), .n(10)) u_pad_86 (
        .y(_T_108),
        .in(1'h0)
    );
    assign _T_111_0 = _T_68;
    assign _T_111_1 = _T_72;
    assign _T_111_10 = _T_108;
    assign _T_111_2 = _T_76;
    assign _T_111_3 = _T_80;
    assign _T_111_4 = _T_84;
    assign _T_111_5 = _T_88;
    assign _T_111_6 = _T_92;
    assign _T_111_7 = _T_96;
    assign _T_111_8 = _T_100;
    assign _T_111_9 = _T_104;
    assign _T_138_0 = 1'h1;
    assign _T_138_1 = 1'h1;
    assign _T_138_10 = 1'h0;
    assign _T_138_2 = 1'h1;
    assign _T_138_3 = 1'h1;
    assign _T_138_4 = 1'h1;
    assign _T_138_5 = 1'h1;
    assign _T_138_6 = 1'h1;
    assign _T_138_7 = 1'h1;
    assign _T_138_8 = 1'h1;
    assign _T_138_9 = 1'h1;
    assign _T_22_0 = 10'h353;
    assign _T_22_1 = 10'h26C;
    assign _T_22_10 = 10'hB4;
    assign _T_22_2 = 10'h13C;
    assign _T_22_3 = 10'h77;
    assign _T_22_4 = 10'h320;
    assign _T_22_5 = 10'h102;
    assign _T_22_6 = 10'h273;
    assign _T_22_7 = 10'h3EE;
    assign _T_22_8 = 10'h17;
    assign _T_22_9 = 10'hB4;
    assign _T_50_0 = 10'h2EC;
    assign _T_50_1 = 10'hF6;
    assign _T_50_10 = 10'h3C3;
    assign _T_50_2 = 10'h28C;
    assign _T_50_3 = 10'h233;
    assign _T_50_4 = 10'h263;
    assign _T_50_5 = 10'h155;
    assign _T_50_6 = 10'h18A;
    assign _T_50_7 = 10'h3F0;
    assign _T_50_8 = 10'h384;
    assign _T_50_9 = 10'h3C3;
    MUX_UNSIGNED #(.width(1)) u_mux_87 (
        .y(_WTEMP_1),
        .sel(_T_8),
        .a(_node_66),
        .b(__T_6__q)
    );
    assign _T_68 = 10'h23F;
    assign _T_72 = 10'h362;
    assign _T_76 = 10'h3C8;
    assign _T_80 = 10'h2AA;
    PAD_UNSIGNED #(.width(9), .n(10)) u_pad_88 (
        .y(_T_84),
        .in(9'h183)
    );
    assign _T_88 = 10'h257;
    assign _T_92 = 10'h3FD;
    assign _T_96 = 10'h3DE;
    assign _c__clock = clock;
    assign _c__io_in0 = _node_43;
    assign _c__io_in1 = _node_21;
    assign _c__reset = reset;
    MUX_UNSIGNED #(.width(4)) u_mux_89 (
        .y(_WTEMP_0),
        .sel(_T_8),
        .a(_node_67),
        .b(_value__q)
    );
endmodule //AdderTests
module Adder(
    input clock,
    input reset,
    input [9:0] io_in0,
    input [9:0] io_in1,
    output [9:0] io_out
);
    wire [10:0] _T_5;
    ADD_UNSIGNED #(.width(10)) u_add_1 (
        .y(_T_5),
        .a(io_in0),
        .b(io_in1)
    );
    wire [9:0] _T_6;
    TAIL #(.width(11), .n(1)) tail_2 (
        .y(_T_6),
        .in(_T_5)
    );
    assign io_out = _T_6;
endmodule //Adder
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
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
