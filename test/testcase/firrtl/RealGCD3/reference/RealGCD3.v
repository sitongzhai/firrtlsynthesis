module RealGCD3(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [15:0] io_in_bits_a,
    input [15:0] io_in_bits_b,
    output io_out_valid,
    output [15:0] io_out_bits
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
    wire _p__q;
    wire _p__d;
    DFF_POSCLK #(.width(1)) p (
        .q(_p__q),
        .d(_p__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_p__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire [15:0] _ti__q;
    wire [15:0] _ti__d;
    DFF_POSCLK #(.width(16)) ti (
        .q(_ti__q),
        .d(_ti__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(16)) u_mux_2 (
        .y(_ti__d),
        .sel(reset),
        .a(16'h0),
        .b(_WTEMP_1)
    );
    wire [16:0] _T_20;
    wire [15:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_3 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_4 (
        .y(_T_20),
        .a(_ti__q),
        .b(_WTEMP_2)
    );
    wire [15:0] _T_21;
    TAIL #(.width(17), .n(1)) tail_5 (
        .y(_T_21),
        .in(_T_20)
    );
    wire _T_23;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_23),
        .a(_p__q),
        .b(1'h0)
    );
    wire _T_25;
    EQ_UNSIGNED #(.width(1)) u_eq_7 (
        .y(_T_25),
        .a(_p__q),
        .b(1'h0)
    );
    wire _T_26;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(_T_26),
        .a(io_in_valid),
        .b(_T_25)
    );
    wire _T_28;
    GT_UNSIGNED #(.width(16)) u_gt_9 (
        .y(_T_28),
        .a(_x__q),
        .b(_y__q)
    );
    wire [15:0] _node_0;
    MUX_UNSIGNED #(.width(16)) u_mux_10 (
        .y(_node_0),
        .sel(_T_26),
        .a(io_in_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_1;
    MUX_UNSIGNED #(.width(16)) u_mux_11 (
        .y(_node_1),
        .sel(_T_26),
        .a(io_in_bits_b),
        .b(_y__q)
    );
    wire _T_30;
    EQ_UNSIGNED #(.width(1)) u_eq_12 (
        .y(_T_30),
        .a(_T_28),
        .b(1'h0)
    );
    wire [16:0] _T_31;
    SUB_UNSIGNED #(.width(16)) u_sub_13 (
        .y(_T_31),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_32;
    ASUINT #(.width(17)) asuint_14 (
        .y(_T_32),
        .in(_T_31)
    );
    wire [15:0] _T_33;
    TAIL #(.width(17), .n(1)) tail_15 (
        .y(_T_33),
        .in(_T_32)
    );
    wire [15:0] _node_2;
    MUX_UNSIGNED #(.width(16)) u_mux_16 (
        .y(_node_2),
        .sel(_T_28),
        .a(_x__q),
        .b(_node_1)
    );
    wire _T_35;
    EQ_UNSIGNED #(.width(1)) u_eq_17 (
        .y(_T_35),
        .a(reset),
        .b(1'h0)
    );
    wire [15:0] _node_3;
    MUX_UNSIGNED #(.width(16)) u_mux_18 (
        .y(_node_3),
        .sel(_T_28),
        .a(_y__q),
        .b(_node_0)
    );
    wire [15:0] _node_4;
    MUX_UNSIGNED #(.width(16)) u_mux_19 (
        .y(_node_4),
        .sel(_T_26),
        .a(io_in_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_5;
    MUX_UNSIGNED #(.width(16)) u_mux_20 (
        .y(_node_5),
        .sel(_T_30),
        .a(_T_33),
        .b(_node_2)
    );
    wire [15:0] _node_6;
    MUX_UNSIGNED #(.width(16)) u_mux_21 (
        .y(_node_6),
        .sel(_T_26),
        .a(io_in_bits_b),
        .b(_y__q)
    );
    wire _T_37;
    EQ_UNSIGNED #(.width(1)) u_eq_22 (
        .y(_T_37),
        .a(_p__q),
        .b(1'h0)
    );
    wire _T_39;
    EQ_UNSIGNED #(.width(1)) u_eq_23 (
        .y(_T_39),
        .a(reset),
        .b(1'h0)
    );
    wire _T_41;
    wire [15:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_24 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_25 (
        .y(_T_41),
        .a(_y__q),
        .b(_WTEMP_3)
    );
    wire _T_42;
    BITWISEAND #(.width(1)) bitwiseand_26 (
        .y(_T_42),
        .a(_T_41),
        .b(_p__q)
    );
    wire _node_7;
    MUX_UNSIGNED #(.width(1)) u_mux_27 (
        .y(_node_7),
        .sel(_T_26),
        .a(1'h1),
        .b(_p__q)
    );
    assign io_in_ready = _T_23;
    assign io_out_bits = _x__q;
    assign io_out_valid = _T_42;
    MUX_UNSIGNED #(.width(1)) u_mux_28 (
        .y(_WTEMP_0),
        .sel(io_out_valid),
        .a(1'h0),
        .b(_node_7)
    );
    assign _WTEMP_1 = _T_21;
    MUX_UNSIGNED #(.width(16)) u_mux_29 (
        .y(_x__d),
        .sel(_p__q),
        .a(_node_3),
        .b(_node_4)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_30 (
        .y(_y__d),
        .sel(_p__q),
        .a(_node_5),
        .b(_node_6)
    );
endmodule //RealGCD3
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
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
