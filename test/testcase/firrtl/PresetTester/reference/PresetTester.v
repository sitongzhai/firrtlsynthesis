module PresetTester(
    input clock,
    input reset
);
    wire [1:0] _div__q;
    wire [1:0] _div__d;
    DFF_POSCLK #(.width(2)) div (
        .q(_div__q),
        .d(_div__d),
        .clk(clock)
    );
    wire [1:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(2)) u_mux_1 (
        .y(_div__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_0)
    );
    wire [2:0] _node_0;
    wire [1:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_2 (
        .y(_WTEMP_1),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(2)) u_add_3 (
        .y(_node_0),
        .a(_div__q),
        .b(_WTEMP_1)
    );
    wire _slowClkReg__q;
    wire _slowClkReg__d;
    DFF_POSCLK #(.width(1)) slowClkReg (
        .q(_slowClkReg__q),
        .d(_slowClkReg__d),
        .clk(clock)
    );
    wire _WTEMP_2;
    MUX_UNSIGNED #(.width(1)) u_mux_4 (
        .y(_slowClkReg__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_2)
    );
    wire slowClk;
    assign slowClk = _slowClkReg__q;
    wire [3:0] _counter__q;
    wire [3:0] _counter__d;
    DFF_POSCLK #(.width(4)) counter (
        .q(_counter__q),
        .d(_counter__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_3;
    MUX_UNSIGNED #(.width(4)) u_mux_5 (
        .y(_counter__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_3)
    );
    wire [4:0] _node_1;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_6 (
        .y(_WTEMP_4),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_7 (
        .y(_node_1),
        .a(_counter__q),
        .b(_WTEMP_4)
    );
    wire [4:0] _x__q;
    wire [4:0] _x__d;
    DFF_POSCLK #(.width(5)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(slowClk)
    );
    wire [4:0] _WTEMP_5;
    MUX_UNSIGNED #(.width(5)) u_mux_8 (
        .y(_x__d),
        .sel(reset),
        .a(4'd9),
        .b(_WTEMP_5)
    );
    wire [4:0] z;
    wire preset;
    wire _i__clock;
    wire _i__reset;
    wire [3:0] _i__x;
    wire [3:0] _i__z;
    Test i (
        .clock(_i__clock),
        .reset(_i__reset),
        .x(_i__x),
        .z(_i__z)
    );
    TAIL #(.width(5), .n(1)) tail_9 (
        .y(_WTEMP_3),
        .in(_node_1)
    );
    TAIL #(.width(3), .n(1)) tail_10 (
        .y(_WTEMP_0),
        .in(_node_0)
    );
    assign _i__clock = slowClk;
    assign _i__reset = preset;
    BITS #(.width(5), .high(3), .low(0)) bits_11 (
        .y(_i__x),
        .in(_x__q)
    );
    assign preset = 1'd0;
    wire [1:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_12 (
        .y(_WTEMP_6),
        .in(1'd0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_13 (
        .y(_WTEMP_2),
        .a(_div__q),
        .b(_WTEMP_6)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_14 (
        .y(z),
        .in(_i__z)
    );
endmodule //PresetTester
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
module Test(
    input clock,
    input reset,
    input [3:0] x,
    output [3:0] z
);
    wire [3:0] _r__q;
    wire [3:0] _r__d;
    DFF_POSCLK_POSASYNCRST #(.width(4)) r (
        .q(_r__q),
        .d(_r__d),
        .rst(reset),
        .rstval(4'd12),
        .clk(clock)
    );
    assign _r__d = x;
    assign z = _r__q;
endmodule //Test
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
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
