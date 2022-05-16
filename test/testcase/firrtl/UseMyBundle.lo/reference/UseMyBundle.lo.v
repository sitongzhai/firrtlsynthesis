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
    wire [7:0] _regB_y__q;
    wire [7:0] _regB_y__d;
    DFF_POSCLK #(.width(8)) regB_y (
        .q(_regB_y__q),
        .d(_regB_y__d),
        .clk(clock)
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
    wire [7:0] _regC_y__q;
    wire [7:0] _regC_y__d;
    DFF_POSCLK #(.width(8)) regC_y (
        .q(_regC_y__q),
        .d(_regC_y__d),
        .clk(clock)
    );
    wire _T_16;
    wire [1:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_1 (
        .y(_WTEMP_0),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_2 (
        .y(_T_16),
        .a(io_trigger),
        .b(_WTEMP_0)
    );
    wire [7:0] _T_18_x;
    wire [7:0] _T_18_y;
    wire [7:0] _T_21_x;
    wire [7:0] _T_21_y;
    wire _T_24;
    EQ_UNSIGNED #(.width(2)) u_eq_3 (
        .y(_T_24),
        .a(io_trigger),
        .b(2'h2)
    );
    wire [7:0] _T_26_x;
    wire [7:0] _T_26_y;
    wire [7:0] _T_29_x;
    wire [7:0] _T_29_y;
    wire [7:0] _GEN_0;
    MUX_UNSIGNED #(.width(8)) u_mux_4 (
        .y(_GEN_0),
        .sel(_T_24),
        .a(_T_26_y),
        .b(_regB_y__q)
    );
    wire [7:0] _GEN_1;
    MUX_UNSIGNED #(.width(8)) u_mux_5 (
        .y(_GEN_1),
        .sel(_T_24),
        .a(_T_26_x),
        .b(_regB_x__q)
    );
    wire [7:0] _GEN_2;
    MUX_UNSIGNED #(.width(8)) u_mux_6 (
        .y(_GEN_2),
        .sel(_T_24),
        .a(_T_29_y),
        .b(_regC_y__q)
    );
    wire [7:0] _GEN_3;
    MUX_UNSIGNED #(.width(8)) u_mux_7 (
        .y(_GEN_3),
        .sel(_T_24),
        .a(_T_29_x),
        .b(_regC_x__q)
    );
    wire [7:0] _GEN_4;
    MUX_UNSIGNED #(.width(8)) u_mux_8 (
        .y(_GEN_4),
        .sel(_T_16),
        .a(_T_18_y),
        .b(_GEN_0)
    );
    wire [7:0] _GEN_5;
    MUX_UNSIGNED #(.width(8)) u_mux_9 (
        .y(_GEN_5),
        .sel(_T_16),
        .a(_T_18_x),
        .b(_GEN_1)
    );
    wire [7:0] _GEN_6;
    MUX_UNSIGNED #(.width(8)) u_mux_10 (
        .y(_GEN_6),
        .sel(_T_16),
        .a(_T_21_y),
        .b(_GEN_2)
    );
    wire [7:0] _GEN_7;
    MUX_UNSIGNED #(.width(8)) u_mux_11 (
        .y(_GEN_7),
        .sel(_T_16),
        .a(_T_21_x),
        .b(_GEN_3)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_12 (
        .y(_T_11_x),
        .in(4'h8)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_13 (
        .y(_T_11_y),
        .in(4'h9)
    );
    assign _T_18_x = 8'h0;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_14 (
        .y(_T_18_y),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_15 (
        .y(_T_21_x),
        .in(3'h7)
    );
    assign _T_21_y = _regC_y__q;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_16 (
        .y(_T_26_x),
        .in(3'h6)
    );
    assign _T_26_y = _regB_y__q;
    assign _T_29_x = 8'h0;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_17 (
        .y(_T_29_y),
        .in(3'h5)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_18 (
        .y(_T_6_x),
        .in(4'h8)
    );
    PAD_UNSIGNED #(.width(4), .n(8)) u_pad_19 (
        .y(_T_6_y),
        .in(4'h9)
    );
    assign io_outB_x = _regB_x__q;
    assign io_outB_y = _regB_y__q;
    assign io_outC_x = _regC_x__q;
    assign io_outC_y = _regC_y__q;
    MUX_UNSIGNED #(.width(8)) u_mux_20 (
        .y(_regB_x__d),
        .sel(reset),
        .a(_T_6_x),
        .b(_GEN_5)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_21 (
        .y(_regB_y__d),
        .sel(reset),
        .a(_T_6_y),
        .b(_GEN_4)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_22 (
        .y(_regC_x__d),
        .sel(reset),
        .a(_T_11_x),
        .b(_GEN_7)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_23 (
        .y(_regC_y__d),
        .sel(reset),
        .a(_T_11_y),
        .b(_GEN_6)
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
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
