module ParameterizedNumberOperation(
    input clock,
    input reset,
    input [15:0] io_a1,
    input [15:0] io_a2,
    output [47:0] io_c
);
    wire [47:0] _register1__q;
    wire [47:0] _register1__d;
    DFF_POSCLK #(.width(48)) register1 (
        .q(_register1__q),
        .d(_register1__d),
        .clk(clock)
    );
    wire [31:0] _T_10;
    MUL2_SIGNED #(.width_a(16), .width_b(16)) s_mul2_1 (
        .y(_T_10),
        .a(io_a1),
        .b(io_a2)
    );
    wire [23:0] _node_0;
    SHR_SIGNED #(.width(32), .n(8)) s_shr_2 (
        .y(_node_0),
        .in(_T_10)
    );
    assign io_c = _register1__q;
    PAD_SIGNED #(.width(24), .n(48)) s_pad_3 (
        .y(_register1__d),
        .in(_node_0)
    );
endmodule //ParameterizedNumberOperation
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
