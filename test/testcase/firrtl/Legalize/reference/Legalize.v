module Legalize(
    input clock,
    input reset
);
    wire [2:0] done;
    assign done = 3'd6;
    wire [15:0] _count__q;
    wire [15:0] _count__d;
    DFF_POSCLK #(.width(16)) count (
        .q(_count__q),
        .d(_count__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(16)) u_mux_1 (
        .y(_count__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_0)
    );
    wire _node_0;
    wire [15:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_2 (
        .y(_WTEMP_1),
        .in(done)
    );
    NEQ_UNSIGNED #(.width(16)) u_neq_3 (
        .y(_node_0),
        .a(_count__q),
        .b(_WTEMP_1)
    );
    wire [16:0] _node_1;
    wire [15:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_4 (
        .y(_WTEMP_2),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_5 (
        .y(_node_1),
        .a(_count__q),
        .b(_WTEMP_2)
    );
    wire [31:0] x;
    assign x = 32'hDEADBEEF;
    wire [15:0] y;
    wire [2:0] b;
    assign b = 3'h6;
    wire b2;
    assign b2 = 1'h1;
    wire [15:0] bar;
    assign bar = -16'sh1;
    wire bar_15;
    assign bar_15 = 1'h1;
    wire [16:0] _WTEMP_3;
    wire [16:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(16), .n(17)) u_pad_6 (
        .y(_WTEMP_4),
        .in(_count__q)
    );
    MUX_UNSIGNED #(.width(17)) u_mux_7 (
        .y(_WTEMP_3),
        .sel(_node_0),
        .a(_node_1),
        .b(_WTEMP_4)
    );
    BITS #(.width(17), .high(15), .low(0)) bits_8 (
        .y(_WTEMP_0),
        .in(_WTEMP_3)
    );
    BITS #(.width(32), .high(15), .low(0)) bits_9 (
        .y(y),
        .in(32'hDEADBEEF)
    );
endmodule //Legalize
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
module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
