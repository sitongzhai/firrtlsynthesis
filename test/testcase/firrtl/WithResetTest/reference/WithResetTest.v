module WithResetTest(
    input clock,
    input reset
);
    wire reset2;
    wire _T_4;
    BITS #(.width(1), .high(0), .low(0)) bits_1 (
        .y(_T_4),
        .in(reset)
    );
    wire _T_5;
    BITWISEOR #(.width(1)) bitwiseor_2 (
        .y(_T_5),
        .a(reset2),
        .b(_T_4)
    );
    wire [7:0] _reg___q;
    wire [7:0] _reg___d;
    DFF_POSCLK #(.width(8)) reg_ (
        .q(_reg___q),
        .d(_reg___d),
        .clk(clock)
    );
    wire [7:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(8)) u_mux_3 (
        .y(_reg___d),
        .sel(_T_5),
        .a(8'h0),
        .b(_WTEMP_0)
    );
    wire [8:0] _T_9;
    wire [7:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(8)) u_pad_4 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(8)) u_add_5 (
        .y(_T_9),
        .a(_reg___q),
        .b(_WTEMP_1)
    );
    wire [7:0] _T_10;
    TAIL #(.width(9), .n(1)) tail_6 (
        .y(_T_10),
        .in(_T_9)
    );
    wire [3:0] _value__q;
    wire [3:0] _value__d;
    DFF_POSCLK #(.width(4)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(4)) u_mux_7 (
        .y(_value__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_2)
    );
    wire _T_15;
    EQ_UNSIGNED #(.width(4)) u_eq_8 (
        .y(_T_15),
        .a(_value__q),
        .b(4'h9)
    );
    wire [4:0] _T_17;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_9 (
        .y(_WTEMP_3),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_10 (
        .y(_T_17),
        .a(_value__q),
        .b(_WTEMP_3)
    );
    wire [3:0] _T_18;
    TAIL #(.width(5), .n(1)) tail_11 (
        .y(_T_18),
        .in(_T_17)
    );
    wire [3:0] _node_0;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_12 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_13 (
        .y(_node_0),
        .sel(_T_15),
        .a(_WTEMP_4),
        .b(_T_18)
    );
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_14 (
        .y(done),
        .a(1'h1),
        .b(_T_15)
    );
    wire _T_21;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_15 (
        .y(_WTEMP_5),
        .in(3'h7)
    );
    LT_UNSIGNED #(.width(4)) u_lt_16 (
        .y(_T_21),
        .a(_value__q),
        .b(_WTEMP_5)
    );
    wire _T_22;
    wire [7:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_17 (
        .y(_WTEMP_6),
        .in(_value__q)
    );
    EQ_UNSIGNED #(.width(8)) u_eq_18 (
        .y(_T_22),
        .a(_reg___q),
        .b(_WTEMP_6)
    );
    wire _T_23;
    BITS #(.width(1), .high(0), .low(0)) bits_19 (
        .y(_T_23),
        .in(reset)
    );
    wire _T_24;
    BITWISEOR #(.width(1)) bitwiseor_20 (
        .y(_T_24),
        .a(_T_22),
        .b(_T_23)
    );
    wire _T_26;
    EQ_UNSIGNED #(.width(1)) u_eq_21 (
        .y(_T_26),
        .a(_T_24),
        .b(1'h0)
    );
    wire _T_28;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_22 (
        .y(_WTEMP_7),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_23 (
        .y(_T_28),
        .a(_value__q),
        .b(_WTEMP_7)
    );
    wire _T_31;
    EQ_UNSIGNED #(.width(4)) u_eq_24 (
        .y(_T_31),
        .a(_value__q),
        .b(4'h8)
    );
    wire _T_33;
    wire [7:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(1), .n(8)) u_pad_25 (
        .y(_WTEMP_8),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(8)) u_eq_26 (
        .y(_T_33),
        .a(_reg___q),
        .b(_WTEMP_8)
    );
    wire _T_34;
    BITS #(.width(1), .high(0), .low(0)) bits_27 (
        .y(_T_34),
        .in(reset)
    );
    wire _T_35;
    BITWISEOR #(.width(1)) bitwiseor_28 (
        .y(_T_35),
        .a(_T_33),
        .b(_T_34)
    );
    wire _T_37;
    EQ_UNSIGNED #(.width(1)) u_eq_29 (
        .y(_T_37),
        .a(_T_35),
        .b(1'h0)
    );
    wire _node_1;
    MUX_UNSIGNED #(.width(1)) u_mux_30 (
        .y(_node_1),
        .sel(_T_28),
        .a(1'h1),
        .b(1'h0)
    );
    wire _T_38;
    BITS #(.width(1), .high(0), .low(0)) bits_31 (
        .y(_T_38),
        .in(reset)
    );
    wire _T_40;
    EQ_UNSIGNED #(.width(1)) u_eq_32 (
        .y(_T_40),
        .a(_T_38),
        .b(1'h0)
    );
    assign _WTEMP_0 = _T_10;
    MUX_UNSIGNED #(.width(1)) u_mux_33 (
        .y(reset2),
        .sel(_T_21),
        .a(1'h0),
        .b(_node_1)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_34 (
        .y(_WTEMP_2),
        .sel(1'h1),
        .a(_node_0),
        .b(_value__q)
    );
endmodule //WithResetTest
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
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
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
