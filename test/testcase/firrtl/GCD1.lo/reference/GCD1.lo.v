module GCD(
    input clock,
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
        .clk(clock)
    );
    wire [15:0] _y__q;
    wire [15:0] _y__d;
    DFF_POSCLK #(.width(16)) y (
        .q(_y__q),
        .d(_y__d),
        .clk(clock)
    );
    wire _T_9;
    GT_UNSIGNED #(.width(16)) u_gt_1 (
        .y(_T_9),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] _T_10;
    SUB_UNSIGNED #(.width(16)) u_sub_2 (
        .y(_T_10),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] _T_11;
    ASUINT #(.width(17)) asuint_3 (
        .y(_T_11),
        .in(_T_10)
    );
    wire [15:0] _T_12;
    TAIL #(.width(17), .n(1)) tail_4 (
        .y(_T_12),
        .in(_T_11)
    );
    wire [15:0] _GEN_0;
    MUX_UNSIGNED #(.width(16)) u_mux_5 (
        .y(_GEN_0),
        .sel(_T_9),
        .a(_T_12),
        .b(_x__q)
    );
    wire _T_14;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_14),
        .a(_T_9),
        .b(1'h0)
    );
    wire [16:0] _T_15;
    SUB_UNSIGNED #(.width(16)) u_sub_7 (
        .y(_T_15),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_16;
    ASUINT #(.width(17)) asuint_8 (
        .y(_T_16),
        .in(_T_15)
    );
    wire [15:0] _T_17;
    TAIL #(.width(17), .n(1)) tail_9 (
        .y(_T_17),
        .in(_T_16)
    );
    wire [15:0] _GEN_1;
    MUX_UNSIGNED #(.width(16)) u_mux_10 (
        .y(_GEN_1),
        .sel(_T_14),
        .a(_T_17),
        .b(_y__q)
    );
    wire [15:0] _GEN_2;
    MUX_UNSIGNED #(.width(16)) u_mux_11 (
        .y(_GEN_2),
        .sel(io_e),
        .a(io_a),
        .b(_GEN_0)
    );
    wire [15:0] _GEN_3;
    MUX_UNSIGNED #(.width(16)) u_mux_12 (
        .y(_GEN_3),
        .sel(io_e),
        .a(io_b),
        .b(_GEN_1)
    );
    wire _T_19;
    wire [15:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_13 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_14 (
        .y(_T_19),
        .a(_y__q),
        .b(_WTEMP_0)
    );
    assign io_v = _T_19;
    assign io_z = _x__q;
    assign _x__d = _GEN_2;
    assign _y__d = _GEN_3;
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
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
