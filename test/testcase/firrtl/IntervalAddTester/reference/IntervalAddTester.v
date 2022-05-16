module IntervalAddTester(
    input clock,
    input reset
);
    wire [4:0] in1;
    wire [4:0] in2;
    wire [5:0] result;
    ADD_SIGNED #(.width(5)) s_add_1 (
        .y(result),
        .a(in1),
        .b(in2)
    );
    wire [3:0] _node_0;
    ASSINT #(.width(4)) assint_2 (
        .y(_node_0),
        .in(4'h4)
    );
    wire _T;
    wire [5:0] _WTEMP_0;
    PAD_SIGNED #(.width(4), .n(6)) s_pad_3 (
        .y(_WTEMP_0),
        .in(_node_0)
    );
    EQ_SIGNED #(.width(6)) s_eq_4 (
        .y(_T),
        .a(result),
        .b(_WTEMP_0)
    );
    wire _T_1;
    BITS #(.width(1), .high(0), .low(0)) bits_5 (
        .y(_T_1),
        .in(reset)
    );
    wire _T_2;
    BITWISEOR #(.width(1)) bitwiseor_6 (
        .y(_T_2),
        .a(_T),
        .b(_T_1)
    );
    wire _T_3;
    EQ_UNSIGNED #(.width(1)) u_eq_7 (
        .y(_T_3),
        .a(_T_2),
        .b(1'h0)
    );
    wire _T_4;
    BITS #(.width(1), .high(0), .low(0)) bits_8 (
        .y(_T_4),
        .in(reset)
    );
    wire _T_5;
    EQ_UNSIGNED #(.width(1)) u_eq_9 (
        .y(_T_5),
        .a(_T_4),
        .b(1'h0)
    );
    wire [2:0] _WTEMP_1;
    PAD_SIGNED #(.width(3), .n(5)) s_pad_10 (
        .y(in1),
        .in(_WTEMP_1)
    );
    ASSINT #(.width(3)) assint_11 (
        .y(_WTEMP_1),
        .in(3'h2)
    );
    wire [2:0] _WTEMP_2;
    PAD_SIGNED #(.width(3), .n(5)) s_pad_12 (
        .y(in2),
        .in(_WTEMP_2)
    );
    ASSINT #(.width(3)) assint_13 (
        .y(_WTEMP_2),
        .in(3'h2)
    );
endmodule //IntervalAddTester
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
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
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
