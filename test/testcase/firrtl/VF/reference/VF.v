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
    wire _node_0;
    EQ_UNSIGNED #(.width(4)) u_eq_2 (
        .y(_node_0),
        .a(4'd0),
        .b(_T_48)
    );
    wire [7:0] _node_1;
    assign _node_1 = vec_0;
    wire _node_2;
    EQ_UNSIGNED #(.width(4)) u_eq_3 (
        .y(_node_2),
        .a(4'd1),
        .b(_T_48)
    );
    wire [7:0] _node_3;
    MUX_UNSIGNED #(.width(8)) u_mux_4 (
        .y(_node_3),
        .sel(_node_2),
        .a(vec_1),
        .b(_node_1)
    );
    wire _node_4;
    EQ_UNSIGNED #(.width(4)) u_eq_5 (
        .y(_node_4),
        .a(4'd2),
        .b(_T_48)
    );
    wire [7:0] _node_5;
    MUX_UNSIGNED #(.width(8)) u_mux_6 (
        .y(_node_5),
        .sel(_node_4),
        .a(vec_2),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(4)) u_eq_7 (
        .y(_node_6),
        .a(4'd3),
        .b(_T_48)
    );
    wire [7:0] _node_7;
    MUX_UNSIGNED #(.width(8)) u_mux_8 (
        .y(_node_7),
        .sel(_node_6),
        .a(vec_3),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(4)) u_eq_9 (
        .y(_node_8),
        .a(4'd4),
        .b(_T_48)
    );
    wire [7:0] _node_9;
    MUX_UNSIGNED #(.width(8)) u_mux_10 (
        .y(_node_9),
        .sel(_node_8),
        .a(vec_4),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(4)) u_eq_11 (
        .y(_node_10),
        .a(4'd5),
        .b(_T_48)
    );
    wire [7:0] _node_11;
    MUX_UNSIGNED #(.width(8)) u_mux_12 (
        .y(_node_11),
        .sel(_node_10),
        .a(vec_5),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(4)) u_eq_13 (
        .y(_node_12),
        .a(4'd6),
        .b(_T_48)
    );
    wire [7:0] _node_13;
    MUX_UNSIGNED #(.width(8)) u_mux_14 (
        .y(_node_13),
        .sel(_node_12),
        .a(vec_6),
        .b(_node_11)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(4)) u_eq_15 (
        .y(_node_14),
        .a(4'd7),
        .b(_T_48)
    );
    wire [7:0] _node_15;
    MUX_UNSIGNED #(.width(8)) u_mux_16 (
        .y(_node_15),
        .sel(_node_14),
        .a(vec_7),
        .b(_node_13)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(4)) u_eq_17 (
        .y(_node_16),
        .a(4'd8),
        .b(_T_48)
    );
    wire [7:0] _node_17;
    MUX_UNSIGNED #(.width(8)) u_mux_18 (
        .y(_node_17),
        .sel(_node_16),
        .a(vec_8),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(4)) u_eq_19 (
        .y(_node_18),
        .a(4'd9),
        .b(_T_48)
    );
    wire [7:0] _node_19;
    MUX_UNSIGNED #(.width(8)) u_mux_20 (
        .y(_node_19),
        .sel(_node_18),
        .a(vec_9),
        .b(_node_17)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(4)) u_eq_21 (
        .y(_node_20),
        .a(4'd10),
        .b(_T_48)
    );
    wire [7:0] _node_21;
    MUX_UNSIGNED #(.width(8)) u_mux_22 (
        .y(_node_21),
        .sel(_node_20),
        .a(vec_10),
        .b(_node_19)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_23 (
        .y(_T_33_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_24 (
        .y(_T_33_1),
        .in(1'h1)
    );
    assign _T_33_10 = 4'hA;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_25 (
        .y(_T_33_2),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_26 (
        .y(_T_33_3),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_27 (
        .y(_T_33_4),
        .in(3'h4)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_28 (
        .y(_T_33_5),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_29 (
        .y(_T_33_6),
        .in(3'h6)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_30 (
        .y(_T_33_7),
        .in(3'h7)
    );
    assign _T_33_8 = 4'h8;
    assign _T_33_9 = 4'h9;
    assign io_value = _node_21;
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_31 (
        .y(vec_0),
        .in(_T_33_0)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_32 (
        .y(vec_1),
        .in(_T_33_1)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_33 (
        .y(vec_10),
        .in(_T_33_10)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_34 (
        .y(vec_2),
        .in(_T_33_2)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_35 (
        .y(vec_3),
        .in(_T_33_3)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_36 (
        .y(vec_4),
        .in(_T_33_4)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_37 (
        .y(vec_5),
        .in(_T_33_5)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_38 (
        .y(vec_6),
        .in(_T_33_6)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_39 (
        .y(vec_7),
        .in(_T_33_7)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_40 (
        .y(vec_8),
        .in(_T_33_8)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_41 (
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
