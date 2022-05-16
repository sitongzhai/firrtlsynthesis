module SIntTester(
    input clock,
    input reset
);
    wire [4:0] xcopy;
    wire _T_3;
    EQ_SIGNED #(.width(5)) s_eq_1 (
        .y(_T_3),
        .a(5'shA),
        .b(xcopy)
    );
    wire _T_4;
    BITS #(.width(1), .high(0), .low(0)) bits_2 (
        .y(_T_4),
        .in(reset)
    );
    wire _T_5;
    BITWISEOR #(.width(1)) bitwiseor_3 (
        .y(_T_5),
        .a(_T_3),
        .b(_T_4)
    );
    wire _T_7;
    EQ_UNSIGNED #(.width(1)) u_eq_4 (
        .y(_T_7),
        .a(_T_5),
        .b(1'h0)
    );
    wire [2:0] y_real;
    wire y_imag;
    wire _T_18;
    EQ_SIGNED #(.width(3)) s_eq_5 (
        .y(_T_18),
        .a(y_real),
        .b(-3'sh4)
    );
    wire _T_19;
    BITS #(.width(1), .high(0), .low(0)) bits_6 (
        .y(_T_19),
        .in(reset)
    );
    wire _T_20;
    BITWISEOR #(.width(1)) bitwiseor_7 (
        .y(_T_20),
        .a(_T_18),
        .b(_T_19)
    );
    wire _T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_8 (
        .y(_T_22),
        .a(_T_20),
        .b(1'h0)
    );
    wire _T_24;
    EQ_SIGNED #(.width(1)) s_eq_9 (
        .y(_T_24),
        .a(y_imag),
        .b(-1'sh1)
    );
    wire _T_25;
    BITS #(.width(1), .high(0), .low(0)) bits_10 (
        .y(_T_25),
        .in(reset)
    );
    wire _T_26;
    BITWISEOR #(.width(1)) bitwiseor_11 (
        .y(_T_26),
        .a(_T_24),
        .b(_T_25)
    );
    wire _T_28;
    EQ_UNSIGNED #(.width(1)) u_eq_12 (
        .y(_T_28),
        .a(_T_26),
        .b(1'h0)
    );
    wire _T_29;
    BITS #(.width(1), .high(0), .low(0)) bits_13 (
        .y(_T_29),
        .in(reset)
    );
    wire _T_31;
    EQ_UNSIGNED #(.width(1)) u_eq_14 (
        .y(_T_31),
        .a(_T_29),
        .b(1'h0)
    );
    assign xcopy = 5'shA;
    assign y_imag = -1'sh1;
    assign y_real = -3'sh4;
endmodule //SIntTester
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
