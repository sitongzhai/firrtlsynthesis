module NestedSubAccessTester(
    input clock,
    input reset
);
    wire _dut__foo_0;
    wire _dut__foo_1;
    wire _dut__foo_2;
    wire _dut__foo_3;
    wire [1:0] _dut__index;
    wire [3:0] _dut__out;
    NestedSubAccess dut (
        .foo_0(_dut__foo_0),
        .foo_1(_dut__foo_1),
        .foo_2(_dut__foo_2),
        .foo_3(_dut__foo_3),
        .index(_dut__index),
        .out(_dut__out)
    );
    assign _dut__foo_2 = 1'h1;
    assign _dut__index = 2'h2;
endmodule //NestedSubAccessTester
module NestedSubAccess(
    input foo_0,
    input foo_1,
    input foo_2,
    input foo_3,
    input [1:0] index,
    output [3:0] out
);
    wire [3:0] vec_0;
    wire [3:0] vec_1;
    wire _node_0;
    EQ_UNSIGNED #(.width(2)) u_eq_1 (
        .y(_node_0),
        .a(2'd0),
        .b(index)
    );
    wire _node_1;
    assign _node_1 = foo_0;
    wire _node_2;
    EQ_UNSIGNED #(.width(2)) u_eq_2 (
        .y(_node_2),
        .a(2'd1),
        .b(index)
    );
    wire _node_3;
    MUX_UNSIGNED #(.width(1)) u_mux_3 (
        .y(_node_3),
        .sel(_node_2),
        .a(foo_1),
        .b(_node_1)
    );
    wire _node_4;
    EQ_UNSIGNED #(.width(2)) u_eq_4 (
        .y(_node_4),
        .a(2'd2),
        .b(index)
    );
    wire _node_5;
    MUX_UNSIGNED #(.width(1)) u_mux_5 (
        .y(_node_5),
        .sel(_node_4),
        .a(foo_2),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(2)) u_eq_6 (
        .y(_node_6),
        .a(2'd3),
        .b(index)
    );
    wire _node_7;
    MUX_UNSIGNED #(.width(1)) u_mux_7 (
        .y(_node_7),
        .sel(_node_6),
        .a(foo_3),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(1)) u_eq_8 (
        .y(_node_8),
        .a(1'd0),
        .b(_node_7)
    );
    wire [3:0] _node_9;
    assign _node_9 = vec_0;
    wire _node_10;
    EQ_UNSIGNED #(.width(1)) u_eq_9 (
        .y(_node_10),
        .a(1'd1),
        .b(_node_7)
    );
    wire [3:0] _node_11;
    MUX_UNSIGNED #(.width(4)) u_mux_10 (
        .y(_node_11),
        .sel(_node_10),
        .a(vec_1),
        .b(_node_9)
    );
    assign out = _node_11;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_11 (
        .y(vec_0),
        .in(2'h3)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_12 (
        .y(vec_1),
        .in(3'h4)
    );
endmodule //NestedSubAccess
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
