module OverflowTypeCircuit(
    input clock,
    input reset,
    input [3:0] io_a,
    input [3:0] io_b,
    output [4:0] io_addWrap,
    output [4:0] io_addGrow,
    output [4:0] io_subWrap,
    output [4:0] io_subGrow
);
    wire [4:0] _T_2;
    ADD_SIGNED #(.width(4)) s_add_1 (
        .y(_T_2),
        .a(io_a),
        .b(io_b)
    );
    wire [3:0] _T_3;
    TAIL #(.width(5), .n(1)) tail_2 (
        .y(_T_3),
        .in(_T_2)
    );
    wire [3:0] _T_4;
    ASSINT #(.width(4)) assint_3 (
        .y(_T_4),
        .in(_T_3)
    );
    wire [3:0] _regAddWrap__q;
    wire [3:0] _regAddWrap__d;
    DFF_POSCLK #(.width(4)) regAddWrap (
        .q(_regAddWrap__q),
        .d(_regAddWrap__d),
        .clk(clock)
    );
    wire [4:0] _T_7;
    ADD_SIGNED #(.width(4)) s_add_4 (
        .y(_T_7),
        .a(io_a),
        .b(io_b)
    );
    wire [4:0] _regAddGrow__q;
    wire [4:0] _regAddGrow__d;
    DFF_POSCLK #(.width(5)) regAddGrow (
        .q(_regAddGrow__q),
        .d(_regAddGrow__d),
        .clk(clock)
    );
    wire [4:0] _T_10;
    SUB_SIGNED #(.width(4)) s_sub_5 (
        .y(_T_10),
        .a(io_a),
        .b(io_b)
    );
    wire [3:0] _T_11;
    TAIL #(.width(5), .n(1)) tail_6 (
        .y(_T_11),
        .in(_T_10)
    );
    wire [3:0] _T_12;
    ASSINT #(.width(4)) assint_7 (
        .y(_T_12),
        .in(_T_11)
    );
    wire [3:0] _regSubWrap__q;
    wire [3:0] _regSubWrap__d;
    DFF_POSCLK #(.width(4)) regSubWrap (
        .q(_regSubWrap__q),
        .d(_regSubWrap__d),
        .clk(clock)
    );
    wire [4:0] _T_15;
    SUB_SIGNED #(.width(4)) s_sub_8 (
        .y(_T_15),
        .a(io_a),
        .b(io_b)
    );
    wire [4:0] _regSubGrow__q;
    wire [4:0] _regSubGrow__d;
    DFF_POSCLK #(.width(5)) regSubGrow (
        .q(_regSubGrow__q),
        .d(_regSubGrow__d),
        .clk(clock)
    );
    assign io_addGrow = _regAddGrow__q;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_9 (
        .y(io_addWrap),
        .in(_regAddWrap__q)
    );
    assign io_subGrow = _regSubGrow__q;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_10 (
        .y(io_subWrap),
        .in(_regSubWrap__q)
    );
    assign _regAddGrow__d = _T_7;
    assign _regAddWrap__d = _T_4;
    assign _regSubGrow__d = _T_15;
    assign _regSubWrap__d = _T_12;
endmodule //OverflowTypeCircuit
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module SUB_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) - $signed(b);
endmodule // SUB_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
