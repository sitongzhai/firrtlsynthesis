module MultiClockSubModuleTest(
    input clock,
    input reset
);
    wire [3:0] _value__q;
    wire [3:0] _value__d;
    DFF_POSCLK #(.width(4)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(4)) u_mux_1 (
        .y(_value__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_0)
    );
    wire _T_6;
    EQ_UNSIGNED #(.width(4)) u_eq_2 (
        .y(_T_6),
        .a(_value__q),
        .b(4'h9)
    );
    wire [4:0] _T_8;
    wire [3:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_4 (
        .y(_T_8),
        .a(_value__q),
        .b(_WTEMP_1)
    );
    wire [3:0] _T_9;
    TAIL #(.width(5), .n(1)) tail_5 (
        .y(_T_9),
        .in(_T_8)
    );
    wire [3:0] _node_0;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_6 (
        .y(_WTEMP_2),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_7 (
        .y(_node_0),
        .sel(_T_6),
        .a(_WTEMP_2),
        .b(_T_9)
    );
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(done),
        .a(1'h1),
        .b(_T_6)
    );
    wire _cDiv__q;
    wire _cDiv__d;
    DFF_POSCLK #(.width(1)) cDiv (
        .q(_cDiv__q),
        .d(_cDiv__d),
        .clk(clock)
    );
    wire _WTEMP_3;
    MUX_UNSIGNED #(.width(1)) u_mux_9 (
        .y(_cDiv__d),
        .sel(reset),
        .a(1'h1),
        .b(_WTEMP_3)
    );
    wire _T_14;
    EQ_UNSIGNED #(.width(1)) u_eq_10 (
        .y(_T_14),
        .a(_cDiv__q),
        .b(1'h0)
    );
    wire otherClock;
    assign otherClock = _cDiv__q;
    wire otherReset;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_11 (
        .y(_WTEMP_4),
        .in(2'h3)
    );
    LT_UNSIGNED #(.width(4)) u_lt_12 (
        .y(otherReset),
        .a(_value__q),
        .b(_WTEMP_4)
    );
    wire _inst__clock;
    wire _inst__reset;
    wire [3:0] _inst__io_out;
    MultiClockSubModuleTestSubModule inst (
        .clock(_inst__clock),
        .reset(_inst__reset),
        .io_out(_inst__io_out)
    );
    wire _T_17;
    wire [3:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_22 (
        .y(_WTEMP_8),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_23 (
        .y(_T_17),
        .a(_inst__io_out),
        .b(_WTEMP_8)
    );
    wire _T_18;
    BITS #(.width(1), .high(0), .low(0)) bits_24 (
        .y(_T_18),
        .in(reset)
    );
    wire _T_19;
    BITWISEOR #(.width(1)) bitwiseor_25 (
        .y(_T_19),
        .a(_T_17),
        .b(_T_18)
    );
    wire _T_21;
    EQ_UNSIGNED #(.width(1)) u_eq_26 (
        .y(_T_21),
        .a(_T_19),
        .b(1'h0)
    );
    wire _T_22;
    BITS #(.width(1), .high(0), .low(0)) bits_27 (
        .y(_T_22),
        .in(reset)
    );
    wire _T_24;
    EQ_UNSIGNED #(.width(1)) u_eq_28 (
        .y(_T_24),
        .a(_T_22),
        .b(1'h0)
    );
    assign _WTEMP_3 = _T_14;
    assign _inst__clock = otherClock;
    assign _inst__reset = otherReset;
    MUX_UNSIGNED #(.width(4)) u_mux_29 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_node_0),
        .b(_value__q)
    );
endmodule //MultiClockSubModuleTest
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module MultiClockSubModuleTestSubModule(
    input clock,
    input reset,
    output [3:0] io_out
);
    wire [3:0] _value__q;
    wire [3:0] _value__d;
    DFF_POSCLK #(.width(4)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_5;
    MUX_UNSIGNED #(.width(4)) u_mux_13 (
        .y(_value__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_5)
    );
    wire _T_7;
    EQ_UNSIGNED #(.width(4)) u_eq_14 (
        .y(_T_7),
        .a(_value__q),
        .b(4'h9)
    );
    wire [4:0] _T_9;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_15 (
        .y(_WTEMP_6),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_16 (
        .y(_T_9),
        .a(_value__q),
        .b(_WTEMP_6)
    );
    wire [3:0] _T_10;
    TAIL #(.width(5), .n(1)) tail_17 (
        .y(_T_10),
        .in(_T_9)
    );
    wire [3:0] _node_1;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_18 (
        .y(_WTEMP_7),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_19 (
        .y(_node_1),
        .sel(_T_7),
        .a(_WTEMP_7),
        .b(_T_10)
    );
    wire _T_12;
    BITWISEAND #(.width(1)) bitwiseand_20 (
        .y(_T_12),
        .a(1'h1),
        .b(_T_7)
    );
    assign io_out = _value__q;
    MUX_UNSIGNED #(.width(4)) u_mux_21 (
        .y(_WTEMP_5),
        .sel(1'h1),
        .a(_node_1),
        .b(_value__q)
    );
endmodule //MultiClockSubModuleTestSubModule
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
