module Cvt(
    input clock,
    input reset,
    input [7:0] io_u0,
    input [7:0] io_s0,
    output [9:0] io_uout_asUInt_u,
    output [9:0] io_uout_asUInt_s,
    output [9:0] io_sout_asSInt_u,
    output [9:0] io_sout_asSInt_s,
    output [9:0] io_sout_neg_u,
    output [9:0] io_sout_neg_s
);
    wire [7:0] _T_21;
    ASUINT #(.width(8)) asuint_1 (
        .y(_T_21),
        .in(io_s0)
    );
    wire [7:0] _T_22;
    ASSINT #(.width(8)) assint_2 (
        .y(_T_22),
        .in(io_u0)
    );
    wire [7:0] _T_23;
    ASSINT #(.width(8)) assint_3 (
        .y(_T_23),
        .in(io_u0)
    );
    wire [8:0] _T_25;
    wire [7:0] _WTEMP_0;
    PAD_SIGNED #(.width(1), .n(8)) s_pad_4 (
        .y(_WTEMP_0),
        .in(1'sh0)
    );
    SUB_SIGNED #(.width(8)) s_sub_5 (
        .y(_T_25),
        .a(_WTEMP_0),
        .b(_T_23)
    );
    wire [7:0] _T_26;
    TAIL #(.width(9), .n(1)) tail_6 (
        .y(_T_26),
        .in(_T_25)
    );
    wire [7:0] _T_27;
    ASSINT #(.width(8)) assint_7 (
        .y(_T_27),
        .in(_T_26)
    );
    wire [8:0] _T_29;
    wire [7:0] _WTEMP_1;
    PAD_SIGNED #(.width(1), .n(8)) s_pad_8 (
        .y(_WTEMP_1),
        .in(1'sh0)
    );
    SUB_SIGNED #(.width(8)) s_sub_9 (
        .y(_T_29),
        .a(_WTEMP_1),
        .b(io_s0)
    );
    wire [7:0] _T_30;
    TAIL #(.width(9), .n(1)) tail_10 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [7:0] _T_31;
    ASSINT #(.width(8)) assint_11 (
        .y(_T_31),
        .in(_T_30)
    );
    PAD_SIGNED #(.width(8), .n(10)) s_pad_12 (
        .y(io_sout_asSInt_s),
        .in(io_s0)
    );
    PAD_SIGNED #(.width(8), .n(10)) s_pad_13 (
        .y(io_sout_asSInt_u),
        .in(_T_22)
    );
    PAD_SIGNED #(.width(8), .n(10)) s_pad_14 (
        .y(io_sout_neg_s),
        .in(_T_31)
    );
    PAD_SIGNED #(.width(8), .n(10)) s_pad_15 (
        .y(io_sout_neg_u),
        .in(_T_27)
    );
    PAD_UNSIGNED #(.width(8), .n(10)) u_pad_16 (
        .y(io_uout_asUInt_s),
        .in(_T_21)
    );
    PAD_UNSIGNED #(.width(8), .n(10)) u_pad_17 (
        .y(io_uout_asUInt_u),
        .in(io_u0)
    );
endmodule //Cvt
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
