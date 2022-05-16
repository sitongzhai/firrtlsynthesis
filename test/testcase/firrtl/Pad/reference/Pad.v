module Pad(
    input clock,
    input reset,
    input [3:0] io_u0,
    input [4:0] io_u1,
    input [3:0] io_s0,
    input [4:0] io_s1,
    output [8:0] io_uout_cat_u,
    output [8:0] io_uout_cat_s,
    output [7:0] io_uout_pad,
    output [7:0] io_sout_pad,
    output [2:0] io_uout_bits_u,
    output [2:0] io_uout_bits_s,
    output [2:0] io_uout_head_u,
    output [2:0] io_uout_head_s,
    output [2:0] io_uout_tail_u,
    output [2:0] io_uout_tail_s
);
    wire [8:0] _T_33;
    CAT #(.width_a(5), .width_b(4)) cat_1 (
        .y(_T_33),
        .a(io_u1),
        .b(io_u0)
    );
    wire [3:0] _T_34;
    ASUINT #(.width(4)) asuint_2 (
        .y(_T_34),
        .in(io_s0)
    );
    wire [4:0] _T_35;
    ASUINT #(.width(5)) asuint_3 (
        .y(_T_35),
        .in(io_s1)
    );
    wire [8:0] _T_36;
    CAT #(.width_a(5), .width_b(4)) cat_4 (
        .y(_T_36),
        .a(_T_35),
        .b(_T_34)
    );
    wire [7:0] _T_37;
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_5 (
        .y(_T_37),
        .in(io_u0)
    );
    wire [7:0] _T_38;
    PAD_SIGNED #(.width(4), .n(8)) s_pad_6 (
        .y(_T_38),
        .in(io_s0)
    );
    wire [2:0] _T_39;
    BITS #(.width(5), .high(3), .low(1)) bits_7 (
        .y(_T_39),
        .in(io_u1)
    );
    wire [2:0] _T_40;
    BITS #(.width(5), .high(3), .low(1)) bits_8 (
        .y(_T_40),
        .in(io_s1)
    );
    wire [2:0] _T_41;
    HEAD #(.width(4), .n(3)) head_9 (
        .y(_T_41),
        .in(io_u0)
    );
    wire [2:0] _T_42;
    HEAD #(.width(4), .n(3)) head_10 (
        .y(_T_42),
        .in(io_s0)
    );
    wire [2:0] _T_43;
    TAIL #(.width(4), .n(1)) tail_11 (
        .y(_T_43),
        .in(io_u0)
    );
    wire [2:0] _T_44;
    TAIL #(.width(4), .n(1)) tail_12 (
        .y(_T_44),
        .in(io_s0)
    );
    assign io_sout_pad = _T_38;
    assign io_uout_bits_s = _T_40;
    assign io_uout_bits_u = _T_39;
    assign io_uout_cat_s = _T_36;
    assign io_uout_cat_u = _T_33;
    assign io_uout_head_s = _T_42;
    assign io_uout_head_u = _T_41;
    assign io_uout_pad = _T_37;
    assign io_uout_tail_s = _T_44;
    assign io_uout_tail_u = _T_43;
endmodule //Pad
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module HEAD(y, in);
    parameter width = 4;
    parameter n = 2;
    output [n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-1:width-n];
endmodule // HEAD
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
