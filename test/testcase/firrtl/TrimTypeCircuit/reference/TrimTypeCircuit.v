module TrimTypeCircuit(
    input clock,
    input reset,
    input [3:0] io_a,
    input [3:0] io_b,
    output [9:0] io_multiplyRoundHalfUp,
    output [19:0] io_multiplyNoTrim
);
    wire [7:0] _T_2;
    MUL2_SIGNED #(.width_a(4), .width_b(4)) s_mul2_1 (
        .y(_T_2),
        .a(io_a),
        .b(io_b)
    );
    wire [7:0] _regMultiplyRoundHalfUp__q;
    wire [7:0] _regMultiplyRoundHalfUp__d;
    DFF_POSCLK #(.width(8)) regMultiplyRoundHalfUp (
        .q(_regMultiplyRoundHalfUp__q),
        .d(_regMultiplyRoundHalfUp__d),
        .clk(clock)
    );
    wire [7:0] _T_4;
    MUL2_SIGNED #(.width_a(4), .width_b(4)) s_mul2_2 (
        .y(_T_4),
        .a(io_a),
        .b(io_b)
    );
    wire [7:0] _regMultiplyNoTrim__q;
    wire [7:0] _regMultiplyNoTrim__d;
    DFF_POSCLK #(.width(8)) regMultiplyNoTrim (
        .q(_regMultiplyNoTrim__q),
        .d(_regMultiplyNoTrim__d),
        .clk(clock)
    );
    wire [8:0] _node_0;
    SHL_SIGNED #(.width(8), .n(1)) s_shl_3 (
        .y(_node_0),
        .in(_regMultiplyRoundHalfUp__q)
    );
    wire [10:0] _node_1;
    SHL_SIGNED #(.width(8), .n(3)) s_shl_4 (
        .y(_node_1),
        .in(_regMultiplyNoTrim__q)
    );
    PAD_SIGNED #(.width(11), .n(20)) s_pad_5 (
        .y(io_multiplyNoTrim),
        .in(_node_1)
    );
    PAD_SIGNED #(.width(9), .n(10)) s_pad_6 (
        .y(io_multiplyRoundHalfUp),
        .in(_node_0)
    );
    assign _regMultiplyNoTrim__d = _T_4;
    assign _regMultiplyRoundHalfUp__d = _T_2;
endmodule //TrimTypeCircuit
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
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
