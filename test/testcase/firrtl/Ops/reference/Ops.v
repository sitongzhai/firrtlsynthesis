module Ops(
    input [3:0] sel,
    input [7:0] is,
    input [7:0] iu,
    output [13:0] os,
    output [12:0] ou,
    output obool
);
    wire [7:0] _node_0;
    BITWISEAND #(.width(8)) bitwiseand_1 (
        .y(_node_0),
        .a(is),
        .b(is)
    );
    wire [7:0] _node_1;
    BITWISEAND #(.width(8)) bitwiseand_2 (
        .y(_node_1),
        .a(iu),
        .b(iu)
    );
    wire [7:0] _node_2;
    BITWISEOR #(.width(8)) bitwiseor_3 (
        .y(_node_2),
        .a(is),
        .b(is)
    );
    wire [7:0] _node_3;
    BITWISEOR #(.width(8)) bitwiseor_4 (
        .y(_node_3),
        .a(iu),
        .b(iu)
    );
    wire _node_4;
    wire [3:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_5 (
        .y(_WTEMP_0),
        .in(3'd5)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_6 (
        .y(_node_4),
        .a(sel),
        .b(_WTEMP_0)
    );
    wire _node_5;
    wire [3:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_7 (
        .y(_WTEMP_1),
        .in(3'd4)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_8 (
        .y(_node_5),
        .a(sel),
        .b(_WTEMP_1)
    );
    wire _node_6;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_9 (
        .y(_WTEMP_2),
        .in(3'd5)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_10 (
        .y(_node_6),
        .a(sel),
        .b(_WTEMP_2)
    );
    wire [1:0] _node_7;
    MUX_UNSIGNED #(.width(2)) u_mux_11 (
        .y(_node_7),
        .sel(_node_5),
        .a(2'h2),
        .b(2'h0)
    );
    wire _node_8;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_12 (
        .y(_WTEMP_3),
        .in(3'd4)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_13 (
        .y(_node_8),
        .a(sel),
        .b(_WTEMP_3)
    );
    wire [1:0] _node_9;
    MUX_UNSIGNED #(.width(2)) u_mux_14 (
        .y(_node_9),
        .sel(_node_6),
        .a(2'h2),
        .b(_node_7)
    );
    wire _node_10;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_15 (
        .y(_WTEMP_4),
        .in(3'd5)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_16 (
        .y(_node_10),
        .a(sel),
        .b(_WTEMP_4)
    );
    wire [1:0] _node_11;
    MUX_UNSIGNED #(.width(2)) u_mux_17 (
        .y(_node_11),
        .sel(_node_8),
        .a(2'h0),
        .b(_node_9)
    );
    wire _node_12;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_18 (
        .y(_WTEMP_5),
        .in(3'd4)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_19 (
        .y(_node_12),
        .a(sel),
        .b(_WTEMP_5)
    );
    wire [1:0] _node_13;
    MUX_UNSIGNED #(.width(2)) u_mux_20 (
        .y(_node_13),
        .sel(_node_10),
        .a(2'h2),
        .b(_node_11)
    );
    wire _node_14;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_21 (
        .y(_WTEMP_6),
        .in(3'd5)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_22 (
        .y(_node_14),
        .a(sel),
        .b(_WTEMP_6)
    );
    wire [8:0] _node_15;
    ADD_UNSIGNED #(.width(8)) u_add_23 (
        .y(_node_15),
        .a(_node_2),
        .b(_node_3)
    );
    wire [8:0] _node_16;
    wire [8:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(2), .n(9)) u_pad_24 (
        .y(_WTEMP_7),
        .in(_node_13)
    );
    MUX_UNSIGNED #(.width(9)) u_mux_25 (
        .y(_node_16),
        .sel(_node_12),
        .a(9'h0),
        .b(_WTEMP_7)
    );
    wire _node_17;
    wire [3:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_26 (
        .y(_WTEMP_8),
        .in(3'd4)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_27 (
        .y(_node_17),
        .a(sel),
        .b(_WTEMP_8)
    );
    wire [8:0] _node_18;
    ADD_UNSIGNED #(.width(8)) u_add_28 (
        .y(_node_18),
        .a(_node_0),
        .b(_node_1)
    );
    wire [8:0] _node_19;
    MUX_UNSIGNED #(.width(9)) u_mux_29 (
        .y(_node_19),
        .sel(_node_14),
        .a(_node_15),
        .b(_node_16)
    );
    wire _node_20;
    wire [3:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_30 (
        .y(_WTEMP_9),
        .in(2'd3)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_31 (
        .y(_node_20),
        .a(sel),
        .b(_WTEMP_9)
    );
    wire [8:0] _node_21;
    MUX_UNSIGNED #(.width(9)) u_mux_32 (
        .y(_node_21),
        .sel(_node_17),
        .a(_node_18),
        .b(_node_19)
    );
    wire _node_22;
    wire [3:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_33 (
        .y(_WTEMP_10),
        .in(2'd2)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_34 (
        .y(_node_22),
        .a(sel),
        .b(_WTEMP_10)
    );
    wire [8:0] _node_23;
    wire [8:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(8), .n(9)) u_pad_35 (
        .y(_WTEMP_11),
        .in(8'h0)
    );
    MUX_UNSIGNED #(.width(9)) u_mux_36 (
        .y(_node_23),
        .sel(_node_20),
        .a(_WTEMP_11),
        .b(_node_21)
    );
    wire _node_24;
    wire [3:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_37 (
        .y(_WTEMP_12),
        .in(1'd1)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_38 (
        .y(_node_24),
        .a(sel),
        .b(_WTEMP_12)
    );
    wire [9:0] _node_25;
    wire [9:0] _WTEMP_13;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_39 (
        .y(_WTEMP_13),
        .in(1'sh0)
    );
    MUX_SIGNED #(.width(10)) s_mux_40 (
        .y(_node_25),
        .sel(_node_22),
        .a(10'sh1),
        .b(_WTEMP_13)
    );
    wire [8:0] _node_26;
    wire [8:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(8), .n(9)) u_pad_41 (
        .y(_WTEMP_14),
        .in(8'h1)
    );
    MUX_UNSIGNED #(.width(9)) u_mux_42 (
        .y(_node_26),
        .sel(_node_22),
        .a(_WTEMP_14),
        .b(_node_23)
    );
    wire _node_27;
    wire [3:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_43 (
        .y(_WTEMP_15),
        .in(1'd0)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_44 (
        .y(_node_27),
        .a(sel),
        .b(_WTEMP_15)
    );
    wire [8:0] _node_28;
    ADD_SIGNED #(.width(8)) s_add_45 (
        .y(_node_28),
        .a(is),
        .b(is)
    );
    wire [9:0] _node_29;
    wire [9:0] _WTEMP_16;
    PAD_SIGNED #(.width(9), .n(10)) s_pad_46 (
        .y(_WTEMP_16),
        .in(9'sh0)
    );
    MUX_SIGNED #(.width(10)) s_mux_47 (
        .y(_node_29),
        .sel(_node_24),
        .a(_WTEMP_16),
        .b(_node_25)
    );
    wire [8:0] _node_30;
    ADD_UNSIGNED #(.width(8)) u_add_48 (
        .y(_node_30),
        .a(iu),
        .b(iu)
    );
    wire [8:0] _node_31;
    MUX_UNSIGNED #(.width(9)) u_mux_49 (
        .y(_node_31),
        .sel(_node_24),
        .a(9'h0),
        .b(_node_26)
    );
    assign obool = 1'h0;
    wire [9:0] _WTEMP_17;
    PAD_SIGNED #(.width(10), .n(14)) s_pad_50 (
        .y(os),
        .in(_WTEMP_17)
    );
    wire [9:0] _WTEMP_18;
    PAD_SIGNED #(.width(9), .n(10)) s_pad_51 (
        .y(_WTEMP_18),
        .in(_node_28)
    );
    MUX_SIGNED #(.width(10)) s_mux_52 (
        .y(_WTEMP_17),
        .sel(_node_27),
        .a(_WTEMP_18),
        .b(_node_29)
    );
    wire [8:0] _WTEMP_19;
    PAD_UNSIGNED #(.width(9), .n(13)) u_pad_53 (
        .y(ou),
        .in(_WTEMP_19)
    );
    MUX_UNSIGNED #(.width(9)) u_mux_54 (
        .y(_WTEMP_19),
        .sel(_node_27),
        .a(_node_30),
        .b(_node_31)
    );
endmodule //Ops
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
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
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
