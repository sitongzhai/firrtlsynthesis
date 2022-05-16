module HasCycle(
    input clock,
    input reset,
    input io_a,
    output io_o
);
    wire b;
    wire _T_5;
    BITWISEAND #(.width(1)) bitwiseand_1 (
        .y(_T_5),
        .a(b),
        .b(io_a)
    );
    assign b = _T_5;
    assign io_o = b;
endmodule //HasCycle
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
