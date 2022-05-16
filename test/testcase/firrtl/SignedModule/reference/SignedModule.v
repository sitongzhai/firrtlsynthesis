module SignedModule(
    input clock,
    input reset,
    input [9:0] io_in,
    output [9:0] io_out
);
    wire _T_5;
    wire [9:0] _WTEMP_0;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_1 (
        .y(_WTEMP_0),
        .in(1'sh0)
    );
    EQ_SIGNED #(.width(10)) s_eq_2 (
        .y(_T_5),
        .a(io_in),
        .b(_WTEMP_0)
    );
    wire _T_7;
    wire [9:0] _WTEMP_1;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_3 (
        .y(_WTEMP_1),
        .in(1'sh0)
    );
    LT_SIGNED #(.width(10)) s_lt_4 (
        .y(_T_7),
        .a(io_in),
        .b(_WTEMP_1)
    );
    wire _T_10_eq;
    wire _T_10_lt;
    wire _T_12_zero;
    wire _T_12_neg;
    wire _T_13;
    BITS #(.width(10), .high(9), .low(9)) bits_5 (
        .y(_T_13),
        .in(io_in)
    );
    wire [10:0] _T_15;
    wire [9:0] _WTEMP_2;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_6 (
        .y(_WTEMP_2),
        .in(1'sh0)
    );
    SUB_SIGNED #(.width(10)) s_sub_7 (
        .y(_T_15),
        .a(_WTEMP_2),
        .b(io_in)
    );
    wire [9:0] _T_16;
    TAIL #(.width(11), .n(1)) tail_8 (
        .y(_T_16),
        .in(_T_15)
    );
    wire [9:0] _T_17;
    ASSINT #(.width(10)) assint_9 (
        .y(_T_17),
        .in(_T_16)
    );
    wire [9:0] _T_18;
    MUX_SIGNED #(.width(10)) s_mux_10 (
        .y(_T_18),
        .sel(_T_13),
        .a(_T_17),
        .b(io_in)
    );
    wire _T_20;
    wire [9:0] _WTEMP_3;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_11 (
        .y(_WTEMP_3),
        .in(1'sh0)
    );
    EQ_SIGNED #(.width(10)) s_eq_12 (
        .y(_T_20),
        .a(io_in),
        .b(_WTEMP_3)
    );
    wire _T_22;
    wire [9:0] _WTEMP_4;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_13 (
        .y(_WTEMP_4),
        .in(1'sh0)
    );
    LT_SIGNED #(.width(10)) s_lt_14 (
        .y(_T_22),
        .a(io_in),
        .b(_WTEMP_4)
    );
    wire _T_25_eq;
    wire _T_25_lt;
    wire _T_27_zero;
    wire _T_27_neg;
    wire [9:0] _T_28;
    assign _T_28 = io_in;
    wire [9:0] _T_29;
    MUX_SIGNED #(.width(10)) s_mux_15 (
        .y(_T_29),
        .sel(_T_12_neg),
        .a(_T_18),
        .b(_T_28)
    );
    assign _T_10_eq = _T_5;
    assign _T_10_lt = _T_7;
    assign _T_12_neg = _T_10_lt;
    assign _T_12_zero = _T_10_eq;
    assign _T_25_eq = _T_20;
    assign _T_25_lt = _T_22;
    assign _T_27_neg = _T_25_lt;
    assign _T_27_zero = _T_25_eq;
    assign io_out = _T_29;
endmodule //SignedModule
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
module LT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) < $signed(b);
endmodule // LT_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
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
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
