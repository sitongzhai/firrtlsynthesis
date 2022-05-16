module MultiClockSpecanonfun22anonfunapplymcVsp13anon6(
    input clock,
    input reset
);
    wire _T_3;
    assign _T_3 = 1'h0;
    wire _T_6;
    assign _T_6 = 1'h0;
    wire _T_7;
    BITS #(.width(1), .high(0), .low(0)) bits_1 (
        .y(_T_7),
        .in(reset)
    );
    wire _T_8;
    BITWISEOR #(.width(1)) bitwiseor_2 (
        .y(_T_8),
        .a(_T_6),
        .b(_T_7)
    );
    wire _T_10;
    EQ_UNSIGNED #(.width(1)) u_eq_3 (
        .y(_T_10),
        .a(_T_8),
        .b(1'h0)
    );
    wire _value__q;
    wire _value__d;
    DFF_POSCLK #(.width(1)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_4 (
        .y(_value__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire _T_15;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(_T_15),
        .a(_value__q),
        .b(1'h1)
    );
    wire [1:0] _T_17;
    ADD_UNSIGNED #(.width(1)) u_add_6 (
        .y(_T_17),
        .a(_value__q),
        .b(1'h1)
    );
    wire _T_18;
    TAIL #(.width(2), .n(1)) tail_7 (
        .y(_T_18),
        .in(_T_17)
    );
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(done),
        .a(1'h1),
        .b(_T_15)
    );
    wire _T_19;
    BITS #(.width(1), .high(0), .low(0)) bits_9 (
        .y(_T_19),
        .in(reset)
    );
    wire _T_21;
    EQ_UNSIGNED #(.width(1)) u_eq_10 (
        .y(_T_21),
        .a(_T_19),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_11 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_T_18),
        .b(_value__q)
    );
endmodule //MultiClockSpecanonfun22anonfunapplymcVsp13anon6
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
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
