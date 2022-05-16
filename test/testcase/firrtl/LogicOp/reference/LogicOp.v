module LogicOp(
    input clock,
    input reset,
    input [8:0] io_u0,
    input [7:0] io_u1,
    input [5:0] io_s0,
    input [7:0] io_s1,
    input [6:0] io_s22,
    output [6:0] io_uout_bitwiseAnd_u,
    output [5:0] io_sout_bitwiseAnd_s,
    output [4:0] io_uout_bitwiseOr_u,
    output [6:0] io_sout_bitwiseOr_s,
    output [8:0] io_uout_bitwiseXor_u,
    output [3:0] io_sout_bitwiseXor_s,
    output [2:0] io_uout_bitwiseNot_u,
    output [9:0] io_sout_bitwiseNot_s,
    input [5:0] io_u2,
    input [7:0] io_u3,
    input [7:0] io_s2,
    input [5:0] io_s3,
    output io_uout_andr_u,
    output io_uout_orr_u,
    output io_uout_xorr_u,
    output io_uout_and_and
);
    wire [8:0] _T_47;
    wire [8:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(8), .n(9)) u_pad_1 (
        .y(_WTEMP_0),
        .in(io_u1)
    );
    BITWISEAND #(.width(9)) bitwiseand_2 (
        .y(_T_47),
        .a(io_u0),
        .b(_WTEMP_0)
    );
    wire [7:0] _T_48;
    wire [7:0] _WTEMP_1;
    PAD_SIGNED #(.width(6), .n(8)) s_pad_3 (
        .y(_WTEMP_1),
        .in(io_s0)
    );
    BITWISEAND #(.width(8)) bitwiseand_4 (
        .y(_T_48),
        .a(_WTEMP_1),
        .b(io_s1)
    );
    wire [7:0] _T_49;
    ASSINT #(.width(8)) assint_5 (
        .y(_T_49),
        .in(_T_48)
    );
    wire [8:0] _T_50;
    wire [8:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(8), .n(9)) u_pad_6 (
        .y(_WTEMP_2),
        .in(io_u1)
    );
    BITWISEOR #(.width(9)) bitwiseor_7 (
        .y(_T_50),
        .a(io_u0),
        .b(_WTEMP_2)
    );
    wire [7:0] _T_51;
    wire [7:0] _WTEMP_3;
    PAD_SIGNED #(.width(6), .n(8)) s_pad_8 (
        .y(_WTEMP_3),
        .in(io_s0)
    );
    BITWISEOR #(.width(8)) bitwiseor_9 (
        .y(_T_51),
        .a(_WTEMP_3),
        .b(io_s1)
    );
    wire [7:0] _T_52;
    ASSINT #(.width(8)) assint_10 (
        .y(_T_52),
        .in(_T_51)
    );
    wire [8:0] _T_53;
    wire [8:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(8), .n(9)) u_pad_11 (
        .y(_WTEMP_4),
        .in(io_u1)
    );
    BITWISEXOR #(.width(9)) bitwisexor_12 (
        .y(_T_53),
        .a(io_u0),
        .b(_WTEMP_4)
    );
    wire [7:0] _T_54;
    wire [7:0] _WTEMP_5;
    PAD_SIGNED #(.width(6), .n(8)) s_pad_13 (
        .y(_WTEMP_5),
        .in(io_s0)
    );
    BITWISEXOR #(.width(8)) bitwisexor_14 (
        .y(_T_54),
        .a(_WTEMP_5),
        .b(io_s1)
    );
    wire [7:0] _T_55;
    ASSINT #(.width(8)) assint_15 (
        .y(_T_55),
        .in(_T_54)
    );
    wire [8:0] _T_56;
    BITWISENOT #(.width(9)) bitwisenot_16 (
        .y(_T_56),
        .in(io_u0)
    );
    wire [5:0] _T_57;
    BITWISENOT #(.width(6)) bitwisenot_17 (
        .y(_T_57),
        .in(io_s0)
    );
    wire [5:0] _T_58;
    ASSINT #(.width(6)) assint_18 (
        .y(_T_58),
        .in(_T_57)
    );
    wire [5:0] _T_59;
    BITWISENOT #(.width(6)) bitwisenot_19 (
        .y(_T_59),
        .in(io_u2)
    );
    wire _T_61;
    wire [5:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(6)) u_pad_20 (
        .y(_WTEMP_6),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(6)) u_eq_21 (
        .y(_T_61),
        .a(_T_59),
        .b(_WTEMP_6)
    );
    wire _T_63;
    wire [5:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(6)) u_pad_22 (
        .y(_WTEMP_7),
        .in(1'h0)
    );
    NEQ_UNSIGNED #(.width(6)) u_neq_23 (
        .y(_T_63),
        .a(io_u2),
        .b(_WTEMP_7)
    );
    wire _T_64;
    XORR #(.width(6)) xorr_24 (
        .y(_T_64),
        .in(io_u2)
    );
    wire [6:0] _T_65;
    wire [6:0] _WTEMP_8;
    PAD_SIGNED #(.width(6), .n(7)) s_pad_25 (
        .y(_WTEMP_8),
        .in(io_sout_bitwiseAnd_s)
    );
    BITWISEAND #(.width(7)) bitwiseand_26 (
        .y(_T_65),
        .a(_WTEMP_8),
        .b(io_s22)
    );
    wire [6:0] _T_66;
    ASSINT #(.width(7)) assint_27 (
        .y(_T_66),
        .in(_T_65)
    );
    wire [5:0] _WTEMP_9;
    BITS #(.width(8), .high(5), .low(0)) bits_28 (
        .y(_WTEMP_9),
        .in(_T_49)
    );
    ASSINT #(.width(6)) assint_29 (
        .y(io_sout_bitwiseAnd_s),
        .in(_WTEMP_9)
    );
    PAD_SIGNED #(.width(6), .n(10)) s_pad_30 (
        .y(io_sout_bitwiseNot_s),
        .in(_T_58)
    );
    wire [6:0] _WTEMP_10;
    BITS #(.width(8), .high(6), .low(0)) bits_31 (
        .y(_WTEMP_10),
        .in(_T_52)
    );
    ASSINT #(.width(7)) assint_32 (
        .y(io_sout_bitwiseOr_s),
        .in(_WTEMP_10)
    );
    wire [3:0] _WTEMP_11;
    BITS #(.width(8), .high(3), .low(0)) bits_33 (
        .y(_WTEMP_11),
        .in(_T_55)
    );
    ASSINT #(.width(4)) assint_34 (
        .y(io_sout_bitwiseXor_s),
        .in(_WTEMP_11)
    );
    wire _WTEMP_12;
    BITS #(.width(7), .high(0), .low(0)) bits_35 (
        .y(_WTEMP_12),
        .in(_T_66)
    );
    ASSINT #(.width(1)) assint_36 (
        .y(io_uout_and_and),
        .in(_WTEMP_12)
    );
    assign io_uout_andr_u = _T_61;
    BITS #(.width(9), .high(6), .low(0)) bits_37 (
        .y(io_uout_bitwiseAnd_u),
        .in(_T_47)
    );
    BITS #(.width(9), .high(2), .low(0)) bits_38 (
        .y(io_uout_bitwiseNot_u),
        .in(_T_56)
    );
    BITS #(.width(9), .high(4), .low(0)) bits_39 (
        .y(io_uout_bitwiseOr_u),
        .in(_T_50)
    );
    assign io_uout_bitwiseXor_u = _T_53;
    assign io_uout_orr_u = _T_63;
    assign io_uout_xorr_u = _T_64;
endmodule //LogicOp
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module BITWISEXOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a ^ b;
endmodule // BITWISEXOR
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
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
module XORR(y, in);
    parameter width = 4;
    output y;
    input [width-1:0] in;
    assign y = ^in;
endmodule // XORR
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
