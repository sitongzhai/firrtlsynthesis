module Compare(
    input clock,
    input reset,
    input [7:0] io_u0,
    input [5:0] io_u1,
    input [3:0] io_s0,
    input [7:0] io_s1,
    output io_uout_lt,
    output io_sout_lt,
    output io_uout_leq,
    output io_sout_leq,
    input [4:0] io_u2,
    input [5:0] io_u3,
    input [5:0] io_s2,
    input [6:0] io_s3,
    output io_uout_gt,
    output io_sout_gt,
    output io_uout_geq,
    output io_sout_geq,
    output io_uout_eq,
    output io_sout_eq,
    output io_uout_neq,
    output io_sout_neq
);
    wire _T_45;
    wire [7:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(6), .n(8)) u_pad_1 (
        .y(_WTEMP_0),
        .in(io_u1)
    );
    LT_UNSIGNED #(.width(8)) u_lt_2 (
        .y(_T_45),
        .a(io_u0),
        .b(_WTEMP_0)
    );
    wire _T_46;
    wire [7:0] _WTEMP_1;
    PAD_SIGNED #(.width(4), .n(8)) s_pad_3 (
        .y(_WTEMP_1),
        .in(io_s0)
    );
    LT_SIGNED #(.width(8)) s_lt_4 (
        .y(_T_46),
        .a(_WTEMP_1),
        .b(io_s1)
    );
    wire _T_47;
    wire [7:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(6), .n(8)) u_pad_5 (
        .y(_WTEMP_2),
        .in(io_u1)
    );
    LEQ_UNSIGNED #(.width(8)) u_leq_6 (
        .y(_T_47),
        .a(io_u0),
        .b(_WTEMP_2)
    );
    wire _T_48;
    wire [7:0] _WTEMP_3;
    PAD_SIGNED #(.width(4), .n(8)) s_pad_7 (
        .y(_WTEMP_3),
        .in(io_s0)
    );
    LEQ_SIGNED #(.width(8)) s_leq_8 (
        .y(_T_48),
        .a(_WTEMP_3),
        .b(io_s1)
    );
    wire _T_49;
    wire [5:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(5), .n(6)) u_pad_9 (
        .y(_WTEMP_4),
        .in(io_u2)
    );
    GT_UNSIGNED #(.width(6)) u_gt_10 (
        .y(_T_49),
        .a(_WTEMP_4),
        .b(io_u3)
    );
    wire _T_50;
    wire [6:0] _WTEMP_5;
    PAD_SIGNED #(.width(6), .n(7)) s_pad_11 (
        .y(_WTEMP_5),
        .in(io_s2)
    );
    GT_SIGNED #(.width(7)) s_gt_12 (
        .y(_T_50),
        .a(_WTEMP_5),
        .b(io_s3)
    );
    wire _T_51;
    wire [5:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(5), .n(6)) u_pad_13 (
        .y(_WTEMP_6),
        .in(io_u2)
    );
    GEQ_UNSIGNED #(.width(6)) u_geq_14 (
        .y(_T_51),
        .a(_WTEMP_6),
        .b(io_u3)
    );
    wire _T_52;
    wire [6:0] _WTEMP_7;
    PAD_SIGNED #(.width(6), .n(7)) s_pad_15 (
        .y(_WTEMP_7),
        .in(io_s2)
    );
    GEQ_SIGNED #(.width(7)) s_geq_16 (
        .y(_T_52),
        .a(_WTEMP_7),
        .b(io_s3)
    );
    wire _T_53;
    wire [5:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(5), .n(6)) u_pad_17 (
        .y(_WTEMP_8),
        .in(io_u2)
    );
    EQ_UNSIGNED #(.width(6)) u_eq_18 (
        .y(_T_53),
        .a(_WTEMP_8),
        .b(io_u3)
    );
    wire _T_54;
    wire [6:0] _WTEMP_9;
    PAD_SIGNED #(.width(6), .n(7)) s_pad_19 (
        .y(_WTEMP_9),
        .in(io_s2)
    );
    EQ_SIGNED #(.width(7)) s_eq_20 (
        .y(_T_54),
        .a(_WTEMP_9),
        .b(io_s3)
    );
    wire _T_55;
    wire [5:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(5), .n(6)) u_pad_21 (
        .y(_WTEMP_10),
        .in(io_u2)
    );
    NEQ_UNSIGNED #(.width(6)) u_neq_22 (
        .y(_T_55),
        .a(_WTEMP_10),
        .b(io_u3)
    );
    wire _T_56;
    wire [6:0] _WTEMP_11;
    PAD_SIGNED #(.width(6), .n(7)) s_pad_23 (
        .y(_WTEMP_11),
        .in(io_s2)
    );
    NEQ_SIGNED #(.width(7)) s_neq_24 (
        .y(_T_56),
        .a(_WTEMP_11),
        .b(io_s3)
    );
    assign io_sout_eq = _T_54;
    assign io_sout_geq = _T_52;
    assign io_sout_gt = _T_50;
    assign io_sout_leq = _T_48;
    assign io_sout_lt = _T_46;
    assign io_sout_neq = _T_56;
    assign io_uout_eq = _T_53;
    assign io_uout_geq = _T_51;
    assign io_uout_gt = _T_49;
    assign io_uout_leq = _T_47;
    assign io_uout_lt = _T_45;
    assign io_uout_neq = _T_55;
endmodule //Compare
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module LT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) < $signed(b);
endmodule // LT_SIGNED
module LEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a <= b;
endmodule // LEQ_UNSIGNED
module LEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) <= $signed(b);
endmodule // LEQ_SIGNED
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module GT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) > $signed(b);
endmodule // GT_SIGNED
module GEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a >= b;
endmodule // GEQ_UNSIGNED
module GEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) >= $signed(b);
endmodule // GEQ_SIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED
module NEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) != $signed(b);
endmodule // NEQ_SIGNED
