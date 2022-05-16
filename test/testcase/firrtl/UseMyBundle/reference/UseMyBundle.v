module UseMyBundle(
    input clock,
    input reset,
    input [1:0] io_trigger,
    output [7:0] io_outB_x,
    output [7:0] io_outB_y,
    output [7:0] io_outC_x,
    output [7:0] io_outC_y
);
    wire [7:0] _T_6_x;
    wire [7:0] _T_6_y;
    wire [7:0] _regB_x__q;
    wire [7:0] _regB_x__d;
    DFF_POSCLK #(.width(8)) regB_x (
        .q(_regB_x__q),
        .d(_regB_x__d),
        .clk(clock)
    );
    wire [7:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(8)) u_mux_1 (
        .y(_regB_x__d),
        .sel(reset),
        .a(_T_6_x),
        .b(_WTEMP_0)
    );
    wire [7:0] _regB_y__q;
    wire [7:0] _regB_y__d;
    DFF_POSCLK #(.width(8)) regB_y (
        .q(_regB_y__q),
        .d(_regB_y__d),
        .clk(clock)
    );
    wire [7:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(8)) u_mux_2 (
        .y(_regB_y__d),
        .sel(reset),
        .a(_T_6_y),
        .b(_WTEMP_1)
    );
    wire [7:0] _T_11_x;
    wire [7:0] _T_11_y;
    wire [7:0] _regC_x__q;
    wire [7:0] _regC_x__d;
    DFF_POSCLK #(.width(8)) regC_x (
        .q(_regC_x__q),
        .d(_regC_x__d),
        .clk(clock)
    );
    wire [7:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(8)) u_mux_3 (
        .y(_regC_x__d),
        .sel(reset),
        .a(_T_11_x),
        .b(_WTEMP_2)
    );
    wire [7:0] _regC_y__q;
    wire [7:0] _regC_y__d;
    DFF_POSCLK #(.width(8)) regC_y (
        .q(_regC_y__q),
        .d(_regC_y__d),
        .clk(clock)
    );
    wire [7:0] _WTEMP_3;
    MUX_UNSIGNED #(.width(8)) u_mux_4 (
        .y(_regC_y__d),
        .sel(reset),
        .a(_T_11_y),
        .b(_WTEMP_3)
    );
    wire _T_16;
    wire [1:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_5 (
        .y(_WTEMP_4),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_6 (
        .y(_T_16),
        .a(io_trigger),
        .b(_WTEMP_4)
    );
    wire [7:0] _T_18_x;
    wire [7:0] _T_18_y;
    wire [7:0] _T_21_x;
    wire [7:0] _T_21_y;
    wire _T_24;
    EQ_UNSIGNED #(.width(2)) u_eq_7 (
        .y(_T_24),
        .a(io_trigger),
        .b(2'h2)
    );
    wire _T_26;
    EQ_UNSIGNED #(.width(1)) u_eq_8 (
        .y(_T_26),
        .a(_T_16),
        .b(1'h0)
    );
    wire _T_27;
    BITWISEAND #(.width(1)) bitwiseand_9 (
        .y(_T_27),
        .a(_T_26),
        .b(_T_24)
    );
    wire [7:0] _T_29_x;
    wire [7:0] _T_29_y;
    wire [7:0] _T_32_x;
    wire [7:0] _T_32_y;
    wire [7:0] _node_0;
    MUX_UNSIGNED #(.width(8)) u_mux_10 (
        .y(_node_0),
        .sel(_T_16),
        .a(_T_18_x),
        .b(_regB_x__q)
    );
    wire [7:0] _node_1;
    MUX_UNSIGNED #(.width(8)) u_mux_11 (
        .y(_node_1),
        .sel(_T_16),
        .a(_T_18_y),
        .b(_regB_y__q)
    );
    wire [7:0] _node_2;
    MUX_UNSIGNED #(.width(8)) u_mux_12 (
        .y(_node_2),
        .sel(_T_16),
        .a(_T_21_x),
        .b(_regC_x__q)
    );
    wire [7:0] _node_3;
    MUX_UNSIGNED #(.width(8)) u_mux_13 (
        .y(_node_3),
        .sel(_T_16),
        .a(_T_21_y),
        .b(_regC_y__q)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_14 (
        .y(_T_11_x),
        .in(4'h8)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_15 (
        .y(_T_11_y),
        .in(4'h9)
    );
    assign _T_18_x = 8'h0;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_16 (
        .y(_T_18_y),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_17 (
        .y(_T_21_x),
        .in(3'h7)
    );
    assign _T_21_y = _regC_y__q;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_18 (
        .y(_T_29_x),
        .in(3'h6)
    );
    assign _T_29_y = _regB_y__q;
    assign _T_32_x = 8'h0;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_19 (
        .y(_T_32_y),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_20 (
        .y(_T_6_x),
        .in(4'h8)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_21 (
        .y(_T_6_y),
        .in(4'h9)
    );
    assign io_outB_x = _regB_x__q;
    assign io_outB_y = _regB_y__q;
    assign io_outC_x = _regC_x__q;
    assign io_outC_y = _regC_y__q;
    MUX_UNSIGNED #(.width(8)) u_mux_22 (
        .y(_WTEMP_0),
        .sel(_T_27),
        .a(_T_29_x),
        .b(_node_0)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_23 (
        .y(_WTEMP_1),
        .sel(_T_27),
        .a(_T_29_y),
        .b(_node_1)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_24 (
        .y(_WTEMP_2),
        .sel(_T_27),
        .a(_T_32_x),
        .b(_node_2)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_25 (
        .y(_WTEMP_3),
        .sel(_T_27),
        .a(_T_32_y),
        .b(_node_3)
    );
endmodule //UseMyBundle
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
