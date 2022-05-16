module ExpandWhens(
    input clock,
    input reset
);
    wire [2:0] done;
    assign done = 3'd6;
    wire [15:0] _x__q;
    wire [15:0] _x__d;
    DFF_POSCLK #(.width(16)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(16)) u_mux_1 (
        .y(_x__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_0)
    );
    wire _node_0;
    wire [15:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_2 (
        .y(_WTEMP_1),
        .in(1'd1)
    );
    GEQ_UNSIGNED #(.width(16)) u_geq_3 (
        .y(_node_0),
        .a(_x__q),
        .b(_WTEMP_1)
    );
    wire _node_1;
    wire [15:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(2), .n(16)) u_pad_4 (
        .y(_WTEMP_2),
        .in(2'd3)
    );
    LT_UNSIGNED #(.width(16)) u_lt_5 (
        .y(_node_1),
        .a(_x__q),
        .b(_WTEMP_2)
    );
    wire _node_2;
    wire [15:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(2), .n(16)) u_pad_6 (
        .y(_WTEMP_3),
        .in(2'd2)
    );
    GEQ_UNSIGNED #(.width(16)) u_geq_7 (
        .y(_node_2),
        .a(_x__q),
        .b(_WTEMP_3)
    );
    wire [2:0] _node_3;
    wire [2:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_8 (
        .y(_WTEMP_4),
        .in(2'h3)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_9 (
        .y(_node_3),
        .sel(_node_1),
        .a(_WTEMP_4),
        .b(3'h4)
    );
    wire [1:0] _node_4;
    wire [1:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_10 (
        .y(_WTEMP_5),
        .in(1'h1)
    );
    MUX_UNSIGNED #(.width(2)) u_mux_11 (
        .y(_node_4),
        .sel(_node_0),
        .a(2'h2),
        .b(_WTEMP_5)
    );
    wire _node_5;
    wire [15:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_12 (
        .y(_WTEMP_6),
        .in(3'd5)
    );
    LT_UNSIGNED #(.width(16)) u_lt_13 (
        .y(_node_5),
        .a(_x__q),
        .b(_WTEMP_6)
    );
    wire _node_6;
    wire [15:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_14 (
        .y(_WTEMP_7),
        .in(3'd4)
    );
    GEQ_UNSIGNED #(.width(16)) u_geq_15 (
        .y(_node_6),
        .a(_x__q),
        .b(_WTEMP_7)
    );
    wire [2:0] _node_7;
    MUX_UNSIGNED #(.width(3)) u_mux_16 (
        .y(_node_7),
        .sel(_node_5),
        .a(3'h5),
        .b(3'h6)
    );
    wire [2:0] _node_8;
    wire [2:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_17 (
        .y(_WTEMP_8),
        .in(_node_4)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_18 (
        .y(_node_8),
        .sel(_node_2),
        .a(_node_3),
        .b(_WTEMP_8)
    );
    wire [2:0] _node_9;
    wire [2:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_19 (
        .y(_WTEMP_9),
        .in(_node_4)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_20 (
        .y(_node_9),
        .sel(_node_2),
        .a(_node_3),
        .b(_WTEMP_9)
    );
    wire [2:0] _node_10;
    MUX_UNSIGNED #(.width(3)) u_mux_21 (
        .y(_node_10),
        .sel(_node_6),
        .a(_node_7),
        .b(_node_8)
    );
    wire [15:0] _count__q;
    wire [15:0] _count__d;
    DFF_POSCLK #(.width(16)) count (
        .q(_count__q),
        .d(_count__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_10;
    MUX_UNSIGNED #(.width(16)) u_mux_22 (
        .y(_count__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_10)
    );
    wire _node_11;
    wire [15:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_23 (
        .y(_WTEMP_11),
        .in(done)
    );
    NEQ_UNSIGNED #(.width(16)) u_neq_24 (
        .y(_node_11),
        .a(_count__q),
        .b(_WTEMP_11)
    );
    wire [16:0] _node_12;
    wire [15:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_25 (
        .y(_WTEMP_12),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_26 (
        .y(_node_12),
        .a(_count__q),
        .b(_WTEMP_12)
    );
    wire [2:0] aa_db;
    wire [3:0] aa_fd;
    wire _node_13;
    NEQ_UNSIGNED #(.width(16)) u_neq_27 (
        .y(_node_13),
        .a(_x__q),
        .b(_count__q)
    );
    wire _node_14;
    BITWISENOT #(.width(1)) bitwisenot_28 (
        .y(_node_14),
        .in(reset)
    );
    wire [15:0] _node_15;
    assign _node_15 = _x__q;
    wire [15:0] _node_16;
    assign _node_16 = _x__q;
    BITS #(.width(16), .high(2), .low(0)) bits_29 (
        .y(aa_db),
        .in(_node_15)
    );
    BITS #(.width(16), .high(3), .low(0)) bits_30 (
        .y(aa_fd),
        .in(_node_16)
    );
    wire [16:0] _WTEMP_13;
    wire [16:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(16), .n(17)) u_pad_31 (
        .y(_WTEMP_14),
        .in(_count__q)
    );
    MUX_UNSIGNED #(.width(17)) u_mux_32 (
        .y(_WTEMP_13),
        .sel(_node_11),
        .a(_node_12),
        .b(_WTEMP_14)
    );
    BITS #(.width(17), .high(15), .low(0)) bits_33 (
        .y(_WTEMP_10),
        .in(_WTEMP_13)
    );
    wire [2:0] _WTEMP_15;
    MUX_UNSIGNED #(.width(3)) u_mux_34 (
        .y(_WTEMP_15),
        .sel(reset),
        .a(_node_9),
        .b(_node_10)
    );
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_35 (
        .y(_WTEMP_0),
        .in(_WTEMP_15)
    );
endmodule //ExpandWhens
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
module GEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a >= b;
endmodule // GEQ_UNSIGNED
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
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
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
