module MultiClockSpecanonfun22anonfunapplymcVsp12anon5(
    input clock,
    input reset
);
    wire _T_5;
    assign _T_5 = 1'h0;
    wire _T_7;
    assign _T_7 = 1'h1;
    wire _T_9;
    assign _T_9 = 1'h0;
    wire _value__q;
    wire _value__d;
    DFF_POSCLK #(.width(1)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_value__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire _T_14;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_14),
        .a(_value__q),
        .b(1'h1)
    );
    wire [1:0] _T_16;
    ADD_UNSIGNED #(.width(1)) u_add_3 (
        .y(_T_16),
        .a(_value__q),
        .b(1'h1)
    );
    wire _T_17;
    TAIL #(.width(2), .n(1)) tail_4 (
        .y(_T_17),
        .in(_T_16)
    );
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_5 (
        .y(done),
        .a(1'h1),
        .b(_T_14)
    );
    wire _T_18;
    BITS #(.width(1), .high(0), .low(0)) bits_6 (
        .y(_T_18),
        .in(reset)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(1)) u_eq_7 (
        .y(_T_20),
        .a(_T_18),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_8 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_T_17),
        .b(_value__q)
    );
endmodule //MultiClockSpecanonfun22anonfunapplymcVsp12anon5
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
