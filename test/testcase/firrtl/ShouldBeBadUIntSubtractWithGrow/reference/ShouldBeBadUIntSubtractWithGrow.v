module ShouldBeBadUIntSubtractWithGrow(
    input clock,
    input reset,
    input [3:0] io_a,
    input [3:0] io_b,
    output [3:0] io_o
);
    wire [4:0] _T_5;
    SUB_UNSIGNED #(.width(4)) u_sub_1 (
        .y(_T_5),
        .a(io_a),
        .b(io_b)
    );
    wire [4:0] _T_6;
    ASUINT #(.width(5)) asuint_2 (
        .y(_T_6),
        .in(_T_5)
    );
    wire [3:0] _T_7;
    TAIL #(.width(5), .n(1)) tail_3 (
        .y(_T_7),
        .in(_T_6)
    );
    wire [3:0] _r__q;
    wire [3:0] _r__d;
    DFF_POSCLK #(.width(4)) r (
        .q(_r__q),
        .d(_r__d),
        .clk(clock)
    );
    assign io_o = _r__q;
    assign _r__d = _T_7;
endmodule //ShouldBeBadUIntSubtractWithGrow
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
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
