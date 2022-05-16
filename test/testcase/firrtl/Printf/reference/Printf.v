module Printf(
    input clock,
    input reset
);
    wire [9:0] _count__q;
    wire [9:0] _count__d;
    DFF_POSCLK #(.width(10)) count (
        .q(_count__q),
        .d(_count__d),
        .clk(clock)
    );
    wire [9:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(10)) u_mux_1 (
        .y(_count__d),
        .sel(reset),
        .a(6'd0),
        .b(_WTEMP_0)
    );
    wire [31:0] _const___q;
    wire [31:0] _const___d;
    DFF_POSCLK #(.width(32)) const_ (
        .q(_const___q),
        .d(_const___d),
        .clk(clock)
    );
    wire [31:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(32)) u_mux_2 (
        .y(_const___d),
        .sel(reset),
        .a(17'd123456),
        .b(_WTEMP_1)
    );
    wire notReset;
    BITWISENOT #(.width(1)) bitwisenot_3 (
        .y(notReset),
        .in(reset)
    );
    wire [10:0] _WTEMP_2;
    wire [9:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(10)) u_pad_4 (
        .y(_WTEMP_3),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(10)) u_add_5 (
        .y(_WTEMP_2),
        .a(_count__q),
        .b(_WTEMP_3)
    );
    BITS #(.width(11), .high(9), .low(0)) bits_6 (
        .y(_WTEMP_0),
        .in(_WTEMP_2)
    );
endmodule //Printf
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
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
