module AddSub(
    input clock,
    input reset,
    input [7:0] io_u0,
    input [7:0] io_u1,
    input [7:0] io_s0,
    input [7:0] io_s1,
    output [8:0] io_uout_add,
    output [8:0] io_sout_add,
    output [7:0] io_uout_add_no_co,
    output [7:0] io_sout_add_no_co,
    output [8:0] io_uout_sub,
    output [8:0] io_sout_sub,
    input [3:0] io_u2,
    input [5:0] io_u3,
    input [3:0] io_s2,
    input [5:0] io_s3,
    output [9:0] io_uout_mul,
    output [9:0] io_sout_mul,
    output [3:0] io_uout_div,
    output [3:0] io_sout_div,
    output [5:0] io_uout_rem,
    output [5:0] io_sout_rem
);
    wire [8:0] _T_45;
    ADD_UNSIGNED #(.width(8)) u_add_1 (
        .y(_T_45),
        .a(io_u0),
        .b(io_u1)
    );
    wire [8:0] _T_46;
    ADD_SIGNED #(.width(8)) s_add_2 (
        .y(_T_46),
        .a(io_s0),
        .b(io_s1)
    );
    wire [8:0] _T_47;
    ADD_UNSIGNED #(.width(8)) u_add_3 (
        .y(_T_47),
        .a(io_u0),
        .b(io_u1)
    );
    wire [7:0] _T_48;
    TAIL #(.width(9), .n(1)) tail_4 (
        .y(_T_48),
        .in(_T_47)
    );
    wire [8:0] _T_49;
    ADD_SIGNED #(.width(8)) s_add_5 (
        .y(_T_49),
        .a(io_s0),
        .b(io_s1)
    );
    wire [7:0] _T_50;
    TAIL #(.width(9), .n(1)) tail_6 (
        .y(_T_50),
        .in(_T_49)
    );
    wire [7:0] _T_51;
    ASSINT #(.width(8)) assint_7 (
        .y(_T_51),
        .in(_T_50)
    );
    wire [8:0] _T_52;
    SUB_UNSIGNED #(.width(8)) u_sub_8 (
        .y(_T_52),
        .a(io_u0),
        .b(io_u1)
    );
    wire [8:0] _T_53;
    ASUINT #(.width(9)) asuint_9 (
        .y(_T_53),
        .in(_T_52)
    );
    wire [8:0] _T_54;
    SUB_SIGNED #(.width(8)) s_sub_10 (
        .y(_T_54),
        .a(io_s0),
        .b(io_s1)
    );
    wire [9:0] _T_55;
    MUL2_UNSIGNED #(.width_a(4), .width_b(6)) u_mul2_11 (
        .y(_T_55),
        .a(io_u2),
        .b(io_u3)
    );
    wire [9:0] _T_56;
    MUL2_SIGNED #(.width_a(4), .width_b(6)) s_mul2_12 (
        .y(_T_56),
        .a(io_s2),
        .b(io_s3)
    );
    wire [3:0] _T_57;
    DIV_UNSIGNED #(.width_num(4), .width_den(6)) u_div_13 (
        .y(_T_57),
        .num(io_u2),
        .den(io_u3)
    );
    wire [4:0] _T_58;
    DIV_SIGNED #(.width_num(4), .width_den(6)) s_div_14 (
        .y(_T_58),
        .num(io_s2),
        .den(io_s3)
    );
    wire [3:0] _T_59;
    REM_UNSIGNED #(.width_num(4), .width_den(6), .width(4)) u_rem_15 (
        .y(_T_59),
        .num(io_u2),
        .den(io_u3)
    );
    wire [3:0] _T_60;
    REM_SIGNED #(.width_num(4), .width_den(6), .width(4)) s_rem_16 (
        .y(_T_60),
        .num(io_s2),
        .den(io_s3)
    );
    assign io_sout_add = _T_46;
    assign io_sout_add_no_co = _T_51;
    wire [3:0] _WTEMP_0;
    BITS #(.width(5), .high(3), .low(0)) bits_17 (
        .y(_WTEMP_0),
        .in(_T_58)
    );
    ASSINT #(.width(4)) assint_18 (
        .y(io_sout_div),
        .in(_WTEMP_0)
    );
    assign io_sout_mul = _T_56;
    PAD_SIGNED #(.width(4), .n(6)) s_pad_19 (
        .y(io_sout_rem),
        .in(_T_60)
    );
    assign io_sout_sub = _T_54;
    assign io_uout_add = _T_45;
    assign io_uout_add_no_co = _T_48;
    assign io_uout_div = _T_57;
    assign io_uout_mul = _T_55;
    PAD_UNSIGNED #(.width(4), .n(6)) u_pad_20 (
        .y(io_uout_rem),
        .in(_T_59)
    );
    assign io_uout_sub = _T_53;
endmodule //AddSub
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
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
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module SUB_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) - $signed(b);
endmodule // SUB_SIGNED
module MUL2_UNSIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = a * b;
endmodule // MUL2_UNSIGNED
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
module DIV_UNSIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    output [width_num-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = num / den;
endmodule // DIV_UNSIGNED
module DIV_SIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    output [width_num:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = $signed(num) / $signed(den);
endmodule // DIV_SIGNED
module REM_UNSIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    parameter width = 4;
    output [width-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = num % den;
endmodule // REM_UNSIGNED
module REM_SIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    parameter width = 4;
    output [width-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = $signed(num) % $signed(den);
endmodule // REM_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
