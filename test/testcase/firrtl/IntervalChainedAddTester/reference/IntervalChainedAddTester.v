module IntervalChainedAddTester(
    input clock,
    input reset
);
    wire [4:0] intervalResult;
    wire [6:0] uintResult;
    wire [1:0] _node_0;
    ASSINT #(.width(2)) assint_1 (
        .y(_node_0),
        .in(2'h1)
    );
    wire [1:0] _node_1;
    ASSINT #(.width(2)) assint_2 (
        .y(_node_1),
        .in(2'h1)
    );
    wire [2:0] _intervalResult_T;
    ADD_SIGNED #(.width(2)) s_add_3 (
        .y(_intervalResult_T),
        .a(_node_0),
        .b(_node_1)
    );
    wire [1:0] _node_2;
    ASSINT #(.width(2)) assint_4 (
        .y(_node_2),
        .in(2'h1)
    );
    wire [3:0] _intervalResult_T_1;
    wire [2:0] _WTEMP_0;
    PAD_SIGNED #(.width(2), .n(3)) s_pad_5 (
        .y(_WTEMP_0),
        .in(_node_2)
    );
    ADD_SIGNED #(.width(3)) s_add_6 (
        .y(_intervalResult_T_1),
        .a(_intervalResult_T),
        .b(_WTEMP_0)
    );
    wire [1:0] _node_3;
    ASSINT #(.width(2)) assint_7 (
        .y(_node_3),
        .in(2'h1)
    );
    wire [4:0] _intervalResult_T_2;
    wire [3:0] _WTEMP_1;
    PAD_SIGNED #(.width(2), .n(4)) s_pad_8 (
        .y(_WTEMP_1),
        .in(_node_3)
    );
    ADD_SIGNED #(.width(4)) s_add_9 (
        .y(_intervalResult_T_2),
        .a(_intervalResult_T_1),
        .b(_WTEMP_1)
    );
    wire [1:0] _node_4;
    ASSINT #(.width(2)) assint_10 (
        .y(_node_4),
        .in(2'h1)
    );
    wire [5:0] _intervalResult_T_3;
    wire [4:0] _WTEMP_2;
    PAD_SIGNED #(.width(2), .n(5)) s_pad_11 (
        .y(_WTEMP_2),
        .in(_node_4)
    );
    ADD_SIGNED #(.width(5)) s_add_12 (
        .y(_intervalResult_T_3),
        .a(_intervalResult_T_2),
        .b(_WTEMP_2)
    );
    wire [1:0] _node_5;
    ASSINT #(.width(2)) assint_13 (
        .y(_node_5),
        .in(2'h1)
    );
    wire [6:0] _intervalResult_T_4;
    wire [5:0] _WTEMP_3;
    PAD_SIGNED #(.width(2), .n(6)) s_pad_14 (
        .y(_WTEMP_3),
        .in(_node_5)
    );
    ADD_SIGNED #(.width(6)) s_add_15 (
        .y(_intervalResult_T_4),
        .a(_intervalResult_T_3),
        .b(_WTEMP_3)
    );
    wire [1:0] _node_6;
    ASSINT #(.width(2)) assint_16 (
        .y(_node_6),
        .in(2'h1)
    );
    wire [7:0] _intervalResult_T_5;
    wire [6:0] _WTEMP_4;
    PAD_SIGNED #(.width(2), .n(7)) s_pad_17 (
        .y(_WTEMP_4),
        .in(_node_6)
    );
    ADD_SIGNED #(.width(7)) s_add_18 (
        .y(_intervalResult_T_5),
        .a(_intervalResult_T_4),
        .b(_WTEMP_4)
    );
    wire [1:0] _uintResult_T;
    assign _uintResult_T = 2'h2;
    wire [2:0] _uintResult_T_1;
    assign _uintResult_T_1 = 3'h3;
    wire [3:0] _uintResult_T_2;
    assign _uintResult_T_2 = 4'h4;
    wire [4:0] _uintResult_T_3;
    assign _uintResult_T_3 = 5'h5;
    wire [5:0] _uintResult_T_4;
    assign _uintResult_T_4 = 6'h6;
    wire [6:0] _uintResult_T_5;
    assign _uintResult_T_5 = 7'h7;
    wire [3:0] _node_7;
    ASSINT #(.width(4)) assint_19 (
        .y(_node_7),
        .in(4'h7)
    );
    wire _T;
    wire [4:0] _WTEMP_5;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_20 (
        .y(_WTEMP_5),
        .in(_node_7)
    );
    EQ_SIGNED #(.width(5)) s_eq_21 (
        .y(_T),
        .a(intervalResult),
        .b(_WTEMP_5)
    );
    wire _T_1;
    BITS #(.width(1), .high(0), .low(0)) bits_22 (
        .y(_T_1),
        .in(reset)
    );
    wire _T_2;
    BITWISEOR #(.width(1)) bitwiseor_23 (
        .y(_T_2),
        .a(_T),
        .b(_T_1)
    );
    wire _T_3;
    EQ_UNSIGNED #(.width(1)) u_eq_24 (
        .y(_T_3),
        .a(_T_2),
        .b(1'h0)
    );
    wire _T_4;
    wire [6:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(3), .n(7)) u_pad_25 (
        .y(_WTEMP_6),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(7)) u_eq_26 (
        .y(_T_4),
        .a(uintResult),
        .b(_WTEMP_6)
    );
    wire _T_5;
    BITS #(.width(1), .high(0), .low(0)) bits_27 (
        .y(_T_5),
        .in(reset)
    );
    wire _T_6;
    BITWISEOR #(.width(1)) bitwiseor_28 (
        .y(_T_6),
        .a(_T_4),
        .b(_T_5)
    );
    wire _T_7;
    EQ_UNSIGNED #(.width(1)) u_eq_29 (
        .y(_T_7),
        .a(_T_6),
        .b(1'h0)
    );
    wire _T_8;
    BITS #(.width(1), .high(0), .low(0)) bits_30 (
        .y(_T_8),
        .in(reset)
    );
    wire _T_9;
    EQ_UNSIGNED #(.width(1)) u_eq_31 (
        .y(_T_9),
        .a(_T_8),
        .b(1'h0)
    );
    wire [4:0] _WTEMP_7;
    BITS #(.width(8), .high(4), .low(0)) bits_32 (
        .y(_WTEMP_7),
        .in(_intervalResult_T_5)
    );
    ASSINT #(.width(5)) assint_33 (
        .y(intervalResult),
        .in(_WTEMP_7)
    );
    assign uintResult = 7'h7;
endmodule //IntervalChainedAddTester
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
