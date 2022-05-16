module HasDeadCode(
    input i,
    output o
);
    wire a;
    BITWISENOT #(.width(1)) bitwisenot_1 (
        .y(a),
        .in(i)
    );
    assign o = i;
endmodule //HasDeadCode
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
