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
    wire [15:0] _ti__q;
    wire [15:0] _ti__d;
    DFF_POSCLK #(.width(16)) ti (
        .q(_ti__q),
        .d(_ti__d),
        .clk(clock)
    );
    wire [16:0] _T_20;
    wire [15:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_1 (
        .y(_WTEMP_0),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_2 (
        .y(_T_20),
        .a(_ti__q),
        .b(_WTEMP_0)
    );
    wire [15:0] _T_21;
    TAIL #(.width(17), .n(1)) tail_3 (
        .y(_T_21),
        .in(_T_20)
    );
    wire _T_23;
    EQ_UNSIGNED #(.width(1)) u_eq_4 (
        .y(_T_23),
        .a(_p__q),
        .b(1'h0)
    );
    wire _T_25;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(_T_25),
        .a(_p__q),
        .b(1'h0)
    );
    wire _T_26;
    BITWISEAND #(.width(1)) bitwiseand_6 (
        .y(_T_26),
        .a(io_in_valid),
        .b(_T_25)
    );
    wire [15:0] _GEN_0;
    MUX_UNSIGNED #(.width(16)) u_mux_7 (
        .y(_GEN_0),
        .sel(_T_26),
        .a(io_in_bits_a),
        .b(_x__q)
    );
    wire [15:0] _GEN_1;
    MUX_UNSIGNED #(.width(16)) u_mux_8 (
        .y(_GEN_1),
        .sel(_T_26),
        .a(io_in_bits_b),
        .b(_y__q)
    );
    wire _GEN_2;
    MUX_UNSIGNED #(.width(1)) u_mux_9 (
        .y(_GEN_2),
        .sel(_T_26),
        .a(1'h1),
        .b(_p__q)
    );
    wire _T_28;
    GT_UNSIGNED #(.width(16)) u_gt_10 (
        .y(_T_28),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] _T_29;
    SUB_UNSIGNED #(.width(16)) u_sub_11 (
        .y(_T_29),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_30;
    ASUINT #(.width(17)) asuint_12 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [15:0] _T_31;
    TAIL #(.width(17), .n(1)) tail_13 (
        .y(_T_31),
        .in(_T_30)
    );
    wire [15:0] _GEN_3;
    MUX_UNSIGNED #(.width(16)) u_mux_14 (
        .y(_GEN_3),
        .sel(_T_28),
        .a(_y__q),
        .b(_GEN_0)
    );
    wire [15:0] _GEN_4;
    MUX_UNSIGNED #(.width(16)) u_mux_15 (
        .y(_GEN_4),
        .sel(_T_28),
        .a(_x__q),
        .b(_T_31)
    );
    wire _T_32;
    BITS #(.width(1), .high(0), .low(0)) bits_16 (
        .y(_T_32),
        .in(reset)
    );
    wire _T_34;
    EQ_UNSIGNED #(.width(1)) u_eq_17 (
        .y(_T_34),
        .a(_T_32),
        .b(1'h0)
    );
    wire _T_35;
    BITS #(.width(1), .high(0), .low(0)) bits_18 (
        .y(_T_35),
        .in(reset)
    );
    wire _T_37;
    EQ_UNSIGNED #(.width(1)) u_eq_19 (
        .y(_T_37),
        .a(_T_35),
        .b(1'h0)
    );
    wire [15:0] _GEN_5;
    MUX_UNSIGNED #(.width(16)) u_mux_20 (
        .y(_GEN_5),
        .sel(_p__q),
        .a(_GEN_3),
        .b(_GEN_0)
    );
    wire [15:0] _GEN_6;
    MUX_UNSIGNED #(.width(16)) u_mux_21 (
        .y(_GEN_6),
        .sel(_p__q),
        .a(_GEN_4),
        .b(_GEN_1)
    );
    wire _T_39;
    wire [15:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_22 (
        .y(_WTEMP_1),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_23 (
        .y(_T_39),
        .a(_y__q),
        .b(_WTEMP_1)
    );
    wire _T_40;
    BITWISEAND #(.width(1)) bitwiseand_24 (
        .y(_T_40),
        .a(_T_39),
        .b(_p__q)
    );
    wire _GEN_7;
    MUX_UNSIGNED #(.width(1)) u_mux_25 (
        .y(_GEN_7),
        .sel(io_out_valid),
        .a(1'h0),
        .b(_GEN_2)
    );
    assign io_in_ready = _T_23;
    assign io_out_bits = _x__q;
    assign io_out_valid = _T_40;
    MUX_UNSIGNED #(.width(1)) u_mux_26 (
        .y(_p__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_7)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_27 (
        .y(_ti__d),
        .sel(reset),
        .a(16'h0),
        .b(_T_21)
    );
    assign _x__d = _GEN_5;
    assign _y__d = _GEN_6;
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
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
