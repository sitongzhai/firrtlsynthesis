module AddNot(
    input [7:0] a,
    input [7:0] b,
    output [8:0] o
);
    wire [7:0] _node_0;
    BITWISENOT #(.width(8)) bitwisenot_1 (
        .y(_node_0),
        .in(b)
    );
    ADD_UNSIGNED #(.width(8)) u_add_2 (
        .y(o),
        .a(a),
        .b(_node_0)
    );
endmodule //AddNot
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
