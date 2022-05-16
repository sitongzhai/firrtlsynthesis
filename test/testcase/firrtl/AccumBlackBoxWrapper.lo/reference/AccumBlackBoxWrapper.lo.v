module AccumBlackBoxWrapper(
    input clock,
    input reset,
    output [15:0] io_data,
    input io_clock
);
    wire _m__clock;
    wire [15:0] _m__data;
    AccumBlackBox m (
        .clock(_m__clock),
        .data(_m__data)
    );
    wire _T_4;
    BITS #(.width(1), .high(0), .low(0)) bits_1 (
        .y(_T_4),
        .in(reset)
    );
    wire _T_6;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_6),
        .a(_T_4),
        .b(1'h0)
    );
    assign io_data = _m__data;
    assign _m__clock = clock;
endmodule //AccumBlackBoxWrapper
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
