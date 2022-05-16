module PipeTester(
    input clock,
    input reset
);
    wire _pipe__clock;
    wire _pipe__reset;
    wire [3:0] _pipe__in;
    wire [3:0] _pipe__out;
    Pipe pipe (
        .clock(_pipe__clock),
        .reset(_pipe__reset),
        .in(_pipe__in),
        .out(_pipe__out)
    );
    wire [3:0] _cycle__q;
    wire [3:0] _cycle__d;
    DFF_POSCLK #(.width(4)) cycle (
        .q(_cycle__q),
        .d(_cycle__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(4)) u_mux_4 (
        .y(_cycle__d),
        .sel(reset),
        .a(4'd0),
        .b(_WTEMP_2)
    );
    wire [4:0] _node_0;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_5 (
        .y(_WTEMP_3),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_6 (
        .y(_node_0),
        .a(_cycle__q),
        .b(_WTEMP_3)
    );
    wire fail;
    wire _node_1;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_7 (
        .y(_WTEMP_4),
        .in(1'd0)
    );
    NEQ_UNSIGNED #(.width(4)) u_neq_8 (
        .y(_node_1),
        .a(_pipe__out),
        .b(_WTEMP_4)
    );
    wire _node_2;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_9 (
        .y(_WTEMP_5),
        .in(2'd2)
    );
    LT_UNSIGNED #(.width(4)) u_lt_10 (
        .y(_node_2),
        .a(_cycle__q),
        .b(_WTEMP_5)
    );
    wire _node_3;
    MUX_UNSIGNED #(.width(1)) u_mux_11 (
        .y(_node_3),
        .sel(_node_1),
        .a(1'h1),
        .b(1'h0)
    );
    wire _node_4;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_12 (
        .y(_WTEMP_6),
        .in(2'd3)
    );
    NEQ_UNSIGNED #(.width(4)) u_neq_13 (
        .y(_node_4),
        .a(_pipe__out),
        .b(_WTEMP_6)
    );
    wire _node_5;
    MUX_UNSIGNED #(.width(1)) u_mux_14 (
        .y(_node_5),
        .sel(_node_2),
        .a(_node_3),
        .b(1'h0)
    );
    wire _node_6;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_15 (
        .y(_WTEMP_7),
        .in(2'd2)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_16 (
        .y(_node_6),
        .a(_cycle__q),
        .b(_WTEMP_7)
    );
    wire _node_7;
    MUX_UNSIGNED #(.width(1)) u_mux_17 (
        .y(_node_7),
        .sel(_node_4),
        .a(1'h1),
        .b(_node_5)
    );
    wire _node_8;
    MUX_UNSIGNED #(.width(1)) u_mux_18 (
        .y(_node_8),
        .sel(_node_2),
        .a(_node_3),
        .b(1'h0)
    );
    wire _node_9;
    BITWISENOT #(.width(1)) bitwisenot_19 (
        .y(_node_9),
        .in(reset)
    );
    wire _node_10;
    MUX_UNSIGNED #(.width(1)) u_mux_20 (
        .y(_node_10),
        .sel(_node_6),
        .a(_node_7),
        .b(_node_8)
    );
    TAIL #(.width(5), .n(1)) tail_21 (
        .y(_WTEMP_2),
        .in(_node_0)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_22 (
        .y(fail),
        .sel(_node_9),
        .a(_node_10),
        .b(1'h0)
    );
    assign _pipe__clock = clock;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_23 (
        .y(_pipe__in),
        .in(2'h3)
    );
    assign _pipe__reset = reset;
endmodule //PipeTester
module Pipe(
    input clock,
    input reset,
    input [3:0] in,
    output [3:0] out
);
    wire [3:0] _r__q;
    wire [3:0] _r__d;
    DFF_POSCLK #(.width(4)) r (
        .q(_r__q),
        .d(_r__d),
        .clk(clock)
    );
    wire [3:0] _s__q;
    wire [3:0] _s__d;
    DFF_POSCLK #(.width(4)) s (
        .q(_s__q),
        .d(_s__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(4)) u_mux_1 (
        .y(_s__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_0)
    );
    assign out = _s__q;
    wire [3:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_2 (
        .y(_WTEMP_1),
        .in(1'd0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_3 (
        .y(_r__d),
        .sel(reset),
        .a(_WTEMP_1),
        .b(in)
    );
    assign _WTEMP_0 = _r__q;
endmodule //Pipe
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
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
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
