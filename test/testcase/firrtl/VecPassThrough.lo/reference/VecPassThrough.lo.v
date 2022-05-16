module VecPassThrough(
    input clock,
    input reset,
    input [15:0] io_inVector_0,
    input [15:0] io_inVector_1,
    input [15:0] io_inVector_2,
    input [15:0] io_inVector_3,
    input [15:0] io_inVector_4,
    input [15:0] io_inVector_5,
    input [15:0] io_inVector_6,
    input [15:0] io_inVector_7,
    input [15:0] io_inVector_8,
    input [15:0] io_inVector_9,
    output [15:0] io_outVector_0,
    output [15:0] io_outVector_1,
    output [15:0] io_outVector_2,
    output [15:0] io_outVector_3,
    output [15:0] io_outVector_4,
    output [15:0] io_outVector_5,
    output [15:0] io_outVector_6,
    output [15:0] io_outVector_7,
    output [15:0] io_outVector_8,
    output [15:0] io_outVector_9,
    output [159:0] io_outVectorAsUInt
);
    wire [15:0] _regVector_0__q;
    wire [15:0] _regVector_0__d;
    DFF_POSCLK #(.width(16)) regVector_0 (
        .q(_regVector_0__q),
        .d(_regVector_0__d),
        .clk(clock)
    );
    wire [15:0] _regVector_1__q;
    wire [15:0] _regVector_1__d;
    DFF_POSCLK #(.width(16)) regVector_1 (
        .q(_regVector_1__q),
        .d(_regVector_1__d),
        .clk(clock)
    );
    wire [15:0] _regVector_2__q;
    wire [15:0] _regVector_2__d;
    DFF_POSCLK #(.width(16)) regVector_2 (
        .q(_regVector_2__q),
        .d(_regVector_2__d),
        .clk(clock)
    );
    wire [15:0] _regVector_3__q;
    wire [15:0] _regVector_3__d;
    DFF_POSCLK #(.width(16)) regVector_3 (
        .q(_regVector_3__q),
        .d(_regVector_3__d),
        .clk(clock)
    );
    wire [15:0] _regVector_4__q;
    wire [15:0] _regVector_4__d;
    DFF_POSCLK #(.width(16)) regVector_4 (
        .q(_regVector_4__q),
        .d(_regVector_4__d),
        .clk(clock)
    );
    wire [15:0] _regVector_5__q;
    wire [15:0] _regVector_5__d;
    DFF_POSCLK #(.width(16)) regVector_5 (
        .q(_regVector_5__q),
        .d(_regVector_5__d),
        .clk(clock)
    );
    wire [15:0] _regVector_6__q;
    wire [15:0] _regVector_6__d;
    DFF_POSCLK #(.width(16)) regVector_6 (
        .q(_regVector_6__q),
        .d(_regVector_6__d),
        .clk(clock)
    );
    wire [15:0] _regVector_7__q;
    wire [15:0] _regVector_7__d;
    DFF_POSCLK #(.width(16)) regVector_7 (
        .q(_regVector_7__q),
        .d(_regVector_7__d),
        .clk(clock)
    );
    wire [15:0] _regVector_8__q;
    wire [15:0] _regVector_8__d;
    DFF_POSCLK #(.width(16)) regVector_8 (
        .q(_regVector_8__q),
        .d(_regVector_8__d),
        .clk(clock)
    );
    wire [15:0] _regVector_9__q;
    wire [15:0] _regVector_9__d;
    DFF_POSCLK #(.width(16)) regVector_9 (
        .q(_regVector_9__q),
        .d(_regVector_9__d),
        .clk(clock)
    );
    wire [31:0] _T_48;
    CAT #(.width_a(16), .width_b(16)) cat_1 (
        .y(_T_48),
        .a(io_inVector_1),
        .b(io_inVector_0)
    );
    wire [31:0] _T_49;
    CAT #(.width_a(16), .width_b(16)) cat_2 (
        .y(_T_49),
        .a(io_inVector_4),
        .b(io_inVector_3)
    );
    wire [47:0] _T_50;
    CAT #(.width_a(32), .width_b(16)) cat_3 (
        .y(_T_50),
        .a(_T_49),
        .b(io_inVector_2)
    );
    wire [79:0] _T_51;
    CAT #(.width_a(48), .width_b(32)) cat_4 (
        .y(_T_51),
        .a(_T_50),
        .b(_T_48)
    );
    wire [31:0] _T_52;
    CAT #(.width_a(16), .width_b(16)) cat_5 (
        .y(_T_52),
        .a(io_inVector_6),
        .b(io_inVector_5)
    );
    wire [31:0] _T_53;
    CAT #(.width_a(16), .width_b(16)) cat_6 (
        .y(_T_53),
        .a(io_inVector_9),
        .b(io_inVector_8)
    );
    wire [47:0] _T_54;
    CAT #(.width_a(32), .width_b(16)) cat_7 (
        .y(_T_54),
        .a(_T_53),
        .b(io_inVector_7)
    );
    wire [79:0] _T_55;
    CAT #(.width_a(48), .width_b(32)) cat_8 (
        .y(_T_55),
        .a(_T_54),
        .b(_T_52)
    );
    wire [159:0] _T_56;
    CAT #(.width_a(80), .width_b(80)) cat_9 (
        .y(_T_56),
        .a(_T_55),
        .b(_T_51)
    );
    assign io_outVectorAsUInt = _T_56;
    assign io_outVector_0 = _regVector_0__q;
    assign io_outVector_1 = _regVector_1__q;
    assign io_outVector_2 = _regVector_2__q;
    assign io_outVector_3 = _regVector_3__q;
    assign io_outVector_4 = _regVector_4__q;
    assign io_outVector_5 = _regVector_5__q;
    assign io_outVector_6 = _regVector_6__q;
    assign io_outVector_7 = _regVector_7__q;
    assign io_outVector_8 = _regVector_8__q;
    assign io_outVector_9 = _regVector_9__q;
    assign _regVector_0__d = io_inVector_0;
    assign _regVector_1__d = io_inVector_1;
    assign _regVector_2__d = io_inVector_2;
    assign _regVector_3__d = io_inVector_3;
    assign _regVector_4__d = io_inVector_4;
    assign _regVector_5__d = io_inVector_5;
    assign _regVector_6__d = io_inVector_6;
    assign _regVector_7__d = io_inVector_7;
    assign _regVector_8__d = io_inVector_8;
    assign _regVector_9__d = io_inVector_9;
endmodule //VecPassThrough
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
