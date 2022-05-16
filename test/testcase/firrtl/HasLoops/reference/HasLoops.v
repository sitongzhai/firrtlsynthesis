module HasLoops(
    input i,
    output o
);
    wire a;
    wire b;
    BITWISEAND #(.width(1)) bitwiseand_1 (
        .y(a),
        .a(b),
        .b(i)
    );
    BITWISENOT #(.width(1)) bitwisenot_2 (
        .y(b),
        .in(a)
    );
    wire [1:0] _WTEMP_0;
    BITS #(.width(2), .high(0), .low(0)) bits_3 (
        .y(o),
        .in(_WTEMP_0)
    );
    ADD_UNSIGNED #(.width(1)) u_add_4 (
        .y(_WTEMP_0),
        .a(a),
        .b(1'd1)
    );
endmodule //HasLoops
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
