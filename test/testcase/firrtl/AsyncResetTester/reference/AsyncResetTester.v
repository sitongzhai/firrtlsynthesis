module AsyncResetTester(
    input clock,
    input reset
);
    wire [1:0] _cDiv_value__q;
    wire [1:0] _cDiv_value__d;
    DFF_POSCLK #(.width(2)) cDiv_value (
        .q(_cDiv_value__q),
        .d(_cDiv_value__d),
        .clk(clock)
    );
    wire [1:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(2)) u_mux_1 (
        .y(_cDiv_value__d),
        .sel(reset),
        .a(2'h0),
        .b(_WTEMP_0)
    );
    wire cDiv;
    wire cDiv_wrap_wrap;
    EQ_UNSIGNED #(.width(2)) u_eq_2 (
        .y(cDiv_wrap_wrap),
        .a(_cDiv_value__q),
        .b(2'h3)
    );
    wire [2:0] _cDiv_wrap_value_T;
    wire [1:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(2)) u_add_4 (
        .y(_cDiv_wrap_value_T),
        .a(_cDiv_value__q),
        .b(_WTEMP_1)
    );
    wire [1:0] _cDiv_wrap_value_T_1;
    TAIL #(.width(3), .n(1)) tail_5 (
        .y(_cDiv_wrap_value_T_1),
        .in(_cDiv_wrap_value_T)
    );
    wire slowClk;
    assign slowClk = cDiv;
    wire [3:0] _count__q;
    wire [3:0] _count__d;
    DFF_POSCLK #(.width(4)) count (
        .q(_count__q),
        .d(_count__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(4)) u_mux_6 (
        .y(_count__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_2)
    );
    wire done;
    wire wrap_wrap;
    EQ_UNSIGNED #(.width(4)) u_eq_7 (
        .y(wrap_wrap),
        .a(_count__q),
        .b(4'hF)
    );
    wire [4:0] _wrap_value_T;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_8 (
        .y(_WTEMP_3),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_9 (
        .y(_wrap_value_T),
        .a(_count__q),
        .b(_WTEMP_3)
    );
    wire [3:0] _wrap_value_T_1;
    TAIL #(.width(5), .n(1)) tail_10 (
        .y(_wrap_value_T_1),
        .in(_wrap_value_T)
    );
    wire _asyncResetNext__q;
    wire _asyncResetNext__d;
    DFF_POSCLK #(.width(1)) asyncResetNext (
        .q(_asyncResetNext__q),
        .d(_asyncResetNext__d),
        .clk(clock)
    );
    wire _WTEMP_4;
    MUX_UNSIGNED #(.width(1)) u_mux_11 (
        .y(_asyncResetNext__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_4)
    );
    wire _asyncResetNext_T;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_12 (
        .y(_WTEMP_5),
        .in(3'h4)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_13 (
        .y(_asyncResetNext_T),
        .a(_count__q),
        .b(_WTEMP_5)
    );
    wire asyncReset;
    assign asyncReset = _asyncResetNext__q;
    wire [7:0] _reg___q;
    wire [7:0] _reg___d;
    DFF_POSCLK_POSASYNCRST #(.width(8)) reg_ (
        .q(_reg___q),
        .d(_reg___d),
        .rst(asyncReset),
        .rstval(8'h7B),
        .clk(slowClk)
    );
    wire _T;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_14 (
        .y(_WTEMP_6),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_15 (
        .y(_T),
        .a(_count__q),
        .b(_WTEMP_6)
    );
    wire _T_1;
    wire [7:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_16 (
        .y(_WTEMP_7),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(8)) u_eq_17 (
        .y(_T_1),
        .a(_reg___q),
        .b(_WTEMP_7)
    );
    wire _T_2;
    BITS #(.width(1), .high(0), .low(0)) bits_18 (
        .y(_T_2),
        .in(reset)
    );
    wire _T_3;
    BITWISEOR #(.width(1)) bitwiseor_19 (
        .y(_T_3),
        .a(_T_1),
        .b(_T_2)
    );
    wire _T_4;
    EQ_UNSIGNED #(.width(1)) u_eq_20 (
        .y(_T_4),
        .a(_T_3),
        .b(1'h0)
    );
    wire _T_5;
    wire [3:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_21 (
        .y(_WTEMP_8),
        .in(3'h5)
    );
    GEQ_UNSIGNED #(.width(4)) u_geq_22 (
        .y(_T_5),
        .a(_count__q),
        .b(_WTEMP_8)
    );
    wire _T_6;
    wire [3:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_23 (
        .y(_WTEMP_9),
        .in(3'h7)
    );
    LT_UNSIGNED #(.width(4)) u_lt_24 (
        .y(_T_6),
        .a(_count__q),
        .b(_WTEMP_9)
    );
    wire _T_7;
    BITWISEAND #(.width(1)) bitwiseand_25 (
        .y(_T_7),
        .a(_T_5),
        .b(_T_6)
    );
    wire _T_8;
    wire [7:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(7), .n(8)) u_pad_26 (
        .y(_WTEMP_10),
        .in(7'h7B)
    );
    EQ_UNSIGNED #(.width(8)) u_eq_27 (
        .y(_T_8),
        .a(_reg___q),
        .b(_WTEMP_10)
    );
    wire _T_9;
    BITS #(.width(1), .high(0), .low(0)) bits_28 (
        .y(_T_9),
        .in(reset)
    );
    wire _T_10;
    BITWISEOR #(.width(1)) bitwiseor_29 (
        .y(_T_10),
        .a(_T_8),
        .b(_T_9)
    );
    wire _T_11;
    EQ_UNSIGNED #(.width(1)) u_eq_30 (
        .y(_T_11),
        .a(_T_10),
        .b(1'h0)
    );
    wire _T_12;
    wire [3:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_31 (
        .y(_WTEMP_11),
        .in(3'h7)
    );
    GEQ_UNSIGNED #(.width(4)) u_geq_32 (
        .y(_T_12),
        .a(_count__q),
        .b(_WTEMP_11)
    );
    wire _T_13;
    wire [7:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_33 (
        .y(_WTEMP_12),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(8)) u_eq_34 (
        .y(_T_13),
        .a(_reg___q),
        .b(_WTEMP_12)
    );
    wire _T_14;
    BITS #(.width(1), .high(0), .low(0)) bits_35 (
        .y(_T_14),
        .in(reset)
    );
    wire _T_15;
    BITWISEOR #(.width(1)) bitwiseor_36 (
        .y(_T_15),
        .a(_T_13),
        .b(_T_14)
    );
    wire _T_16;
    EQ_UNSIGNED #(.width(1)) u_eq_37 (
        .y(_T_16),
        .a(_T_15),
        .b(1'h0)
    );
    wire _T_17;
    BITS #(.width(1), .high(0), .low(0)) bits_38 (
        .y(_T_17),
        .in(reset)
    );
    wire _T_18;
    EQ_UNSIGNED #(.width(1)) u_eq_39 (
        .y(_T_18),
        .a(_T_17),
        .b(1'h0)
    );
    assign _WTEMP_4 = _asyncResetNext_T;
    MUX_UNSIGNED #(.width(1)) u_mux_40 (
        .y(cDiv),
        .sel(1'h1),
        .a(cDiv_wrap_wrap),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(2)) u_mux_41 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_cDiv_wrap_value_T_1),
        .b(_cDiv_value__q)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_42 (
        .y(_WTEMP_2),
        .sel(1'h1),
        .a(_wrap_value_T_1),
        .b(_count__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_43 (
        .y(done),
        .sel(1'h1),
        .a(wrap_wrap),
        .b(1'h0)
    );
    PAD_UNSIGNED #(.width(3), .n(8)) u_pad_44 (
        .y(_reg___d),
        .in(3'h5)
    );
endmodule //AsyncResetTester
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
module DFF_POSCLK_POSASYNCRST(q, d, rst, rstval, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input rst;
    input [width-1:0] rstval;
    input clk;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= rstval;
        end else begin
            q <= d;
        end
    end
endmodule // DFF_POSCLK_POSASYNCRST
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
