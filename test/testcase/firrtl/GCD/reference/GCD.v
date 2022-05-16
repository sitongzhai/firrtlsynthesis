module GCD(
    input clk,
    input reset,
    input [15:0] io_a,
    input [15:0] io_b,
    input io_e,
    output [15:0] io_z,
    output io_v
);
    wire [15:0] _x__q;
    wire [15:0] _x__d;
    DFF_POSCLK #(.width(16)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(clk)
    );
    wire [15:0] _y__q;
    wire [15:0] _y__d;
    DFF_POSCLK #(.width(16)) y (
        .q(_y__q),
        .d(_y__d),
        .clk(clk)
    );
    wire T_7;
    GT_UNSIGNED #(.width(16)) u_gt_1 (
        .y(T_7),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] T_8;
    SUB_UNSIGNED #(.width(16)) u_sub_2 (
        .y(T_8),
        .a(_x__q),
        .b(_y__q)
    );
    wire [15:0] T_9;
    TAIL #(.width(17), .n(1)) tail_3 (
        .y(T_9),
        .in(T_8)
    );
    wire T_10;
    GT_UNSIGNED #(.width(16)) u_gt_4 (
        .y(T_10),
        .a(_x__q),
        .b(_y__q)
    );
    wire T_12;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(T_12),
        .a(T_10),
        .b(1'h0)
    );
    wire [16:0] T_13;
    SUB_UNSIGNED #(.width(16)) u_sub_6 (
        .y(T_13),
        .a(_y__q),
        .b(_x__q)
    );
    wire [15:0] T_14;
    TAIL #(.width(17), .n(1)) tail_7 (
        .y(T_14),
        .in(T_13)
    );
    wire [15:0] _node_0;
    MUX_UNSIGNED #(.width(16)) u_mux_8 (
        .y(_node_0),
        .sel(T_7),
        .a(T_9),
        .b(_x__q)
    );
    wire [15:0] _node_1;
    MUX_UNSIGNED #(.width(16)) u_mux_9 (
        .y(_node_1),
        .sel(T_12),
        .a(T_14),
        .b(_y__q)
    );
    wire T_16;
    wire [15:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_10 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_11 (
        .y(T_16),
        .a(_y__q),
        .b(_WTEMP_0)
    );
    assign io_v = T_16;
    assign io_z = _x__q;
    MUX_UNSIGNED #(.width(16)) u_mux_12 (
        .y(_x__d),
        .sel(io_e),
        .a(io_a),
        .b(_node_0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_13 (
        .y(_y__d),
        .sel(io_e),
        .a(io_b),
        .b(_node_1)
    );
endmodule //GCD
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
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
