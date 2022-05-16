module BundlePassThrough(
    input clock,
    input reset,
    input [2:0] io_inBundle_u1,
    input [8:0] io_inBundle_u2,
    input [26:0] io_inBundle_u3,
    output [2:0] io_outBundle_u1,
    output [8:0] io_outBundle_u2,
    output [26:0] io_outBundle_u3,
    output [8:0] io_outBundleAsUInt
);
    wire [2:0] _regBundle_u1__q;
    wire [2:0] _regBundle_u1__d;
    DFF_POSCLK #(.width(3)) regBundle_u1 (
        .q(_regBundle_u1__q),
        .d(_regBundle_u1__d),
        .clk(clock)
    );
    wire [8:0] _regBundle_u2__q;
    wire [8:0] _regBundle_u2__d;
    DFF_POSCLK #(.width(9)) regBundle_u2 (
        .q(_regBundle_u2__q),
        .d(_regBundle_u2__d),
        .clk(clock)
    );
    wire [26:0] _regBundle_u3__q;
    wire [26:0] _regBundle_u3__d;
    DFF_POSCLK #(.width(27)) regBundle_u3 (
        .q(_regBundle_u3__q),
        .d(_regBundle_u3__d),
        .clk(clock)
    );
    wire [11:0] _T_6;
    CAT #(.width_a(3), .width_b(9)) cat_1 (
        .y(_T_6),
        .a(io_inBundle_u1),
        .b(io_inBundle_u2)
    );
    wire [38:0] _T_7;
    CAT #(.width_a(12), .width_b(27)) cat_2 (
        .y(_T_7),
        .a(_T_6),
        .b(io_inBundle_u3)
    );
    assign io_outBundle_u1 = _regBundle_u1__q;
    assign io_outBundle_u2 = _regBundle_u2__q;
    assign io_outBundle_u3 = _regBundle_u3__q;
    BITS #(.width(39), .high(8), .low(0)) bits_3 (
        .y(io_outBundleAsUInt),
        .in(_T_7)
    );
    assign _regBundle_u1__d = io_inBundle_u1;
    assign _regBundle_u2__d = io_inBundle_u2;
    assign _regBundle_u3__d = io_inBundle_u3;
endmodule //BundlePassThrough
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
