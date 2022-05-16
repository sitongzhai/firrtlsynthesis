module RingModule(
    input clock,
    input reset,
    input [9:0] io_in,
    output [9:0] io_out
);
    wire [10:0] _T_6;
    wire [9:0] _WTEMP_0;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_1 (
        .y(_WTEMP_0),
        .in(1'sh0)
    );
    ADD_SIGNED #(.width(10)) s_add_2 (
        .y(_T_6),
        .a(io_in),
        .b(_WTEMP_0)
    );
    wire [9:0] _T_7;
    TAIL #(.width(11), .n(1)) tail_3 (
        .y(_T_7),
        .in(_T_6)
    );
    wire [9:0] _T_8;
    ASSINT #(.width(10)) assint_4 (
        .y(_T_8),
        .in(_T_7)
    );
    wire [11:0] _T_9;
    MUL2_SIGNED #(.width_a(2), .width_b(10)) s_mul2_5 (
        .y(_T_9),
        .a(2'sh1),
        .b(_T_8)
    );
    wire [9:0] _node_0;
    BITS #(.width(12), .high(9), .low(0)) bits_6 (
        .y(_node_0),
        .in(_T_9)
    );
    ASSINT #(.width(10)) assint_7 (
        .y(io_out),
        .in(_node_0)
    );
endmodule //RingModule
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
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
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
