module SimpleAdder(
    input clock,
    input reset,
    input [5:0] io_a1,
    input [7:0] io_a2,
    output [11:0] io_c
);
    wire [10:0] _register1__q;
    wire [10:0] _register1__d;
    DFF_POSCLK #(.width(11)) register1 (
        .q(_register1__q),
        .d(_register1__d),
        .clk(clock)
    );
    wire [10:0] _node_0;
    SHL_SIGNED #(.width(8), .n(3)) s_shl_1 (
        .y(_node_0),
        .in(io_a2)
    );
    wire [11:0] _T_6;
    wire [10:0] _WTEMP_0;
    PAD_SIGNED #(.width(6), .n(11)) s_pad_2 (
        .y(_WTEMP_0),
        .in(io_a1)
    );
    ADD_SIGNED #(.width(11)) s_add_3 (
        .y(_T_6),
        .a(_WTEMP_0),
        .b(_node_0)
    );
    wire [10:0] _T_7;
    TAIL #(.width(12), .n(1)) tail_4 (
        .y(_T_7),
        .in(_T_6)
    );
    wire [10:0] _T_8;
    ASSINT #(.width(11)) assint_5 (
        .y(_T_8),
        .in(_T_7)
    );
    SHL_SIGNED #(.width(11), .n(1)) s_shl_6 (
        .y(io_c),
        .in(_register1__q)
    );
    assign _register1__d = _T_8;
endmodule //SimpleAdder
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
