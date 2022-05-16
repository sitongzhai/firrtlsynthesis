module ClockDividerTest(
    input clock,
    input reset
);
    wire _cDiv__q;
    wire _cDiv__d;
    DFF_POSCLK #(.width(1)) cDiv (
        .q(_cDiv__q),
        .d(_cDiv__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_cDiv__d),
        .sel(reset),
        .a(1'h1),
        .b(_WTEMP_0)
    );
    wire _T_5;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_5),
        .a(_cDiv__q),
        .b(1'h0)
    );
    wire clock2;
    assign clock2 = _cDiv__q;
    wire [7:0] _reg1__q;
    wire [7:0] _reg1__d;
    DFF_POSCLK #(.width(8)) reg1 (
        .q(_reg1__q),
        .d(_reg1__d),
        .clk(clock)
    );
    wire [7:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(8)) u_mux_3 (
        .y(_reg1__d),
        .sel(reset),
        .a(8'h0),
        .b(_WTEMP_1)
    );
    wire [8:0] _T_9;
    wire [7:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(8)) u_pad_4 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(8)) u_add_5 (
        .y(_T_9),
        .a(_reg1__q),
        .b(_WTEMP_2)
    );
    wire [7:0] _T_10;
    TAIL #(.width(9), .n(1)) tail_6 (
        .y(_T_10),
        .in(_T_9)
    );
    wire [7:0] _reg2__q;
    wire [7:0] _reg2__d;
    DFF_POSCLK #(.width(8)) reg2 (
        .q(_reg2__q),
        .d(_reg2__d),
        .clk(clock2)
    );
    wire [7:0] _WTEMP_3;
    MUX_UNSIGNED #(.width(8)) u_mux_7 (
        .y(_reg2__d),
        .sel(reset),
        .a(8'h0),
        .b(_WTEMP_3)
    );
    wire [8:0] _T_14;
    wire [7:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(8)) u_pad_8 (
        .y(_WTEMP_4),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(8)) u_add_9 (
        .y(_T_14),
        .a(_reg2__q),
        .b(_WTEMP_4)
    );
    wire [7:0] _T_15;
    TAIL #(.width(9), .n(1)) tail_10 (
        .y(_T_15),
        .in(_T_14)
    );
    wire _T_17;
    wire [7:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_11 (
        .y(_WTEMP_5),
        .in(4'hA)
    );
    LT_UNSIGNED #(.width(8)) u_lt_12 (
        .y(_T_17),
        .a(_reg1__q),
        .b(_WTEMP_5)
    );
    wire [7:0] _T_19;
    DIV_UNSIGNED #(.width_num(8), .width_den(2)) u_div_13 (
        .y(_T_19),
        .num(_reg1__q),
        .den(2'h2)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(8)) u_eq_14 (
        .y(_T_20),
        .a(_reg2__q),
        .b(_T_19)
    );
    wire _T_21;
    BITS #(.width(1), .high(0), .low(0)) bits_15 (
        .y(_T_21),
        .in(reset)
    );
    wire _T_22;
    BITWISEOR #(.width(1)) bitwiseor_16 (
        .y(_T_22),
        .a(_T_20),
        .b(_T_21)
    );
    wire _T_24;
    EQ_UNSIGNED #(.width(1)) u_eq_17 (
        .y(_T_24),
        .a(_T_22),
        .b(1'h0)
    );
    wire _T_26;
    wire [7:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_18 (
        .y(_WTEMP_6),
        .in(4'hA)
    );
    EQ_UNSIGNED #(.width(8)) u_eq_19 (
        .y(_T_26),
        .a(_reg1__q),
        .b(_WTEMP_6)
    );
    wire _T_27;
    BITS #(.width(1), .high(0), .low(0)) bits_20 (
        .y(_T_27),
        .in(reset)
    );
    wire _T_29;
    EQ_UNSIGNED #(.width(1)) u_eq_21 (
        .y(_T_29),
        .a(_T_27),
        .b(1'h0)
    );
    assign _WTEMP_0 = _T_5;
    assign _WTEMP_1 = _T_10;
    assign _WTEMP_3 = _T_15;
endmodule //ClockDividerTest
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
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module DIV_UNSIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    output [width_num-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = num / den;
endmodule // DIV_UNSIGNED
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
