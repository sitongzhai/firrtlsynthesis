module And2(
    input clock,
    input reset,
    input io_i0,
    input io_i1,
    output io_out
);
    wire _T_11;
    BITWISEAND #(.width(1)) bitwiseand_1 (
        .y(_T_11),
        .a(io_i0),
        .b(io_i1)
    );
    assign io_out = _T_11;
endmodule //And2
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
