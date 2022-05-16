module CustomTransform(
    input clock,
    input reset
);
    wire [31:0] _cycle__q;
    wire [31:0] _cycle__d;
    DFF_POSCLK #(.width(32)) cycle (
        .q(_cycle__q),
        .d(_cycle__d),
        .clk(clock)
    );
    wire [31:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(32)) u_mux_1 (
        .y(_cycle__d),
        .sel(reset),
        .a(32'd0),
        .b(_WTEMP_0)
    );
    wire [32:0] _node_0;
    ADD_UNSIGNED #(.width(32)) u_add_2 (
        .y(_node_0),
        .a(_cycle__q),
        .b(32'd1)
    );
    wire _delay__clock;
    wire _delay__reset;
    wire [31:0] _delay__a;
    wire _delay__en;
    wire [31:0] _delay__b;
    Delay1 delay (
        .clock(_delay__clock),
        .reset(_delay__reset),
        .a(_delay__a),
        .en(_delay__en),
        .b(_delay__b)
    );
    wire _node_1;
    wire [31:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'd0)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_4 (
        .y(_node_1),
        .a(_cycle__q),
        .b(_WTEMP_1)
    );
    TAIL #(.width(33), .n(1)) tail_5 (
        .y(_WTEMP_0),
        .in(_node_0)
    );
    wire [31:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_6 (
        .y(_WTEMP_2),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(32)) u_mux_7 (
        .y(_delay__a),
        .sel(_node_1),
        .a(32'hDEADBEEF),
        .b(_WTEMP_2)
    );
    assign _delay__clock = clock;
    MUX_UNSIGNED #(.width(1)) u_mux_8 (
        .y(_delay__en),
        .sel(_node_1),
        .a(1'h1),
        .b(1'h0)
    );
    assign _delay__reset = reset;
endmodule //CustomTransform
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
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
