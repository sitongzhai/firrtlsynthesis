module VF(
    input clock,
    input reset,
    input [7:0] io_addr,
    output [7:0] io_value
);
    wire [7:0] vec_0;
    wire [7:0] vec_1;
    wire [7:0] vec_2;
    wire [7:0] vec_3;
    wire [7:0] vec_4;
    wire [7:0] vec_5;
    wire [7:0] vec_6;
    wire [7:0] vec_7;
    wire [7:0] vec_8;
    wire [7:0] vec_9;
    wire [7:0] vec_10;
    wire [3:0] _T_33_0;
    wire [3:0] _T_33_1;
    wire [3:0] _T_33_2;
    wire [3:0] _T_33_3;
    wire [3:0] _T_33_4;
    wire [3:0] _T_33_5;
    wire [3:0] _T_33_6;
    wire [3:0] _T_33_7;
    wire [3:0] _T_33_8;
    wire [3:0] _T_33_9;
    wire [3:0] _T_33_10;
    wire [3:0] _T_48;
    BITS #(.width(8), .high(3), .low(0)) bits_1 (
        .y(_T_48),
        .in(io_addr)
    );
    wire [7:0] _GEN_0;
    wire _node_0;
    wire [3:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_2 (
        .y(_WTEMP_0),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_3 (
        .y(_node_0),
        .a(_WTEMP_0),
        .b(_T_48)
    );
    wire _node_1;
    BITWISEAND #(.width(1)) bitwiseand_4 (
        .y(_node_1),
        .a(1'h1),
        .b(_node_0)
    );
    wire [7:0] _GEN_1;
    MUX_UNSIGNED #(.width(8)) u_mux_5 (
        .y(_GEN_1),
        .sel(_node_1),
        .a(vec_1),
        .b(vec_0)
    );
    wire _node_2;
    wire [3:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_6 (
        .y(_WTEMP_1),
        .in(2'h2)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_7 (
        .y(_node_2),
        .a(_WTEMP_1),
        .b(_T_48)
    );
    wire _node_3;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(_node_3),
        .a(1'h1),
        .b(_node_2)
    );
    wire [7:0] _GEN_2;
    MUX_UNSIGNED #(.width(8)) u_mux_9 (
        .y(_GEN_2),
        .sel(_node_3),
        .a(vec_2),
        .b(_GEN_1)
    );
    wire _node_4;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_10 (
        .y(_WTEMP_2),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_11 (
        .y(_node_4),
        .a(_WTEMP_2),
        .b(_T_48)
    );
    wire _node_5;
    BITWISEAND #(.width(1)) bitwiseand_12 (
        .y(_node_5),
        .a(1'h1),
        .b(_node_4)
    );
    wire [7:0] _GEN_3;
    MUX_UNSIGNED #(.width(8)) u_mux_13 (
        .y(_GEN_3),
        .sel(_node_5),
        .a(vec_3),
        .b(_GEN_2)
    );
    wire _node_6;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_14 (
        .y(_WTEMP_3),
        .in(3'h4)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_15 (
        .y(_node_6),
        .a(_WTEMP_3),
        .b(_T_48)
    );
    wire _node_7;
    BITWISEAND #(.width(1)) bitwiseand_16 (
        .y(_node_7),
        .a(1'h1),
        .b(_node_6)
    );
    wire [7:0] _GEN_4;
    MUX_UNSIGNED #(.width(8)) u_mux_17 (
        .y(_GEN_4),
        .sel(_node_7),
        .a(vec_4),
        .b(_GEN_3)
    );
    wire _node_8;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_18 (
        .y(_WTEMP_4),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_19 (
        .y(_node_8),
        .a(_WTEMP_4),
        .b(_T_48)
    );
    wire _node_9;
    BITWISEAND #(.width(1)) bitwiseand_20 (
        .y(_node_9),
        .a(1'h1),
        .b(_node_8)
    );
    wire [7:0] _GEN_5;
    MUX_UNSIGNED #(.width(8)) u_mux_21 (
        .y(_GEN_5),
        .sel(_node_9),
        .a(vec_5),
        .b(_GEN_4)
    );
    wire _node_10;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_22 (
        .y(_WTEMP_5),
        .in(3'h6)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_23 (
        .y(_node_10),
        .a(_WTEMP_5),
        .b(_T_48)
    );
    wire _node_11;
    BITWISEAND #(.width(1)) bitwiseand_24 (
        .y(_node_11),
        .a(1'h1),
        .b(_node_10)
    );
    wire [7:0] _GEN_6;
    MUX_UNSIGNED #(.width(8)) u_mux_25 (
        .y(_GEN_6),
        .sel(_node_11),
        .a(vec_6),
        .b(_GEN_5)
    );
    wire _node_12;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_26 (
        .y(_WTEMP_6),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_27 (
        .y(_node_12),
        .a(_WTEMP_6),
        .b(_T_48)
    );
    wire _node_13;
    BITWISEAND #(.width(1)) bitwiseand_28 (
        .y(_node_13),
        .a(1'h1),
        .b(_node_12)
    );
    wire [7:0] _GEN_7;
    MUX_UNSIGNED #(.width(8)) u_mux_29 (
        .y(_GEN_7),
        .sel(_node_13),
        .a(vec_7),
        .b(_GEN_6)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(4)) u_eq_30 (
        .y(_node_14),
        .a(4'h8),
        .b(_T_48)
    );
    wire _node_15;
    BITWISEAND #(.width(1)) bitwiseand_31 (
        .y(_node_15),
        .a(1'h1),
        .b(_node_14)
    );
    wire [7:0] _GEN_8;
    MUX_UNSIGNED #(.width(8)) u_mux_32 (
        .y(_GEN_8),
        .sel(_node_15),
        .a(vec_8),
        .b(_GEN_7)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(4)) u_eq_33 (
        .y(_node_16),
        .a(4'h9),
        .b(_T_48)
    );
    wire _node_17;
    BITWISEAND #(.width(1)) bitwiseand_34 (
        .y(_node_17),
        .a(1'h1),
        .b(_node_16)
    );
    wire [7:0] _GEN_9;
    MUX_UNSIGNED #(.width(8)) u_mux_35 (
        .y(_GEN_9),
        .sel(_node_17),
        .a(vec_9),
        .b(_GEN_8)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(4)) u_eq_36 (
        .y(_node_18),
        .a(4'hA),
        .b(_T_48)
    );
    wire _node_19;
    BITWISEAND #(.width(1)) bitwiseand_37 (
        .y(_node_19),
        .a(1'h1),
        .b(_node_18)
    );
    wire [7:0] _GEN_10;
    MUX_UNSIGNED #(.width(8)) u_mux_38 (
        .y(_GEN_10),
        .sel(_node_19),
        .a(vec_10),
        .b(_GEN_9)
    );
    assign _GEN_0 = _GEN_10;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_39 (
        .y(_T_33_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_40 (
        .y(_T_33_1),
        .in(1'h1)
    );
    assign _T_33_10 = 4'hA;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_41 (
        .y(_T_33_2),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_42 (
        .y(_T_33_3),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_43 (
        .y(_T_33_4),
        .in(3'h4)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_44 (
        .y(_T_33_5),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_45 (
        .y(_T_33_6),
        .in(3'h6)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_46 (
        .y(_T_33_7),
        .in(3'h7)
    );
    assign _T_33_8 = 4'h8;
    assign _T_33_9 = 4'h9;
    assign io_value = _GEN_0;
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_47 (
        .y(vec_0),
        .in(_T_33_0)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_48 (
        .y(vec_1),
        .in(_T_33_1)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_49 (
        .y(vec_10),
        .in(_T_33_10)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_50 (
        .y(vec_2),
        .in(_T_33_2)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_51 (
        .y(vec_3),
        .in(_T_33_3)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_52 (
        .y(vec_4),
        .in(_T_33_4)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_53 (
        .y(vec_5),
        .in(_T_33_5)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_54 (
        .y(vec_6),
        .in(_T_33_6)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_55 (
        .y(vec_7),
        .in(_T_33_7)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_56 (
        .y(vec_8),
        .in(_T_33_8)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_57 (
        .y(vec_9),
        .in(_T_33_9)
    );
endmodule //VF
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
