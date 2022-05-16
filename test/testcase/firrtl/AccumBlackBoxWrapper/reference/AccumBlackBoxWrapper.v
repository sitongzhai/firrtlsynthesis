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
    wire _T_5;
    EQ_UNSIGNED #(.width(1)) u_eq_1 (
        .y(_T_5),
        .a(reset),
        .b(1'h0)
    );
    assign io_data = _m__data;
    assign _m__clock = clock;
endmodule //AccumBlackBoxWrapper
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
