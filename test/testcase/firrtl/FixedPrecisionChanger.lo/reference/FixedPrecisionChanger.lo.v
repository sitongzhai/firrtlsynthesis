module FixedPrecisionChanger(
    input clock,
    input reset,
    input [63:0] io_in,
    output [63:0] io_out
);
    wire [63:0] _reg___q;
    wire [63:0] _reg___d;
    DFF_POSCLK #(.width(64)) reg_ (
        .q(_reg___q),
        .d(_reg___d),
        .clk(clock)
    );
    wire [21:0] _WTEMP_0;
    PAD_SIGNED #(.width(22), .n(64)) s_pad_1 (
        .y(io_out),
        .in(_WTEMP_0)
    );
    SHR_SIGNED #(.width(64), .n(42)) s_shr_2 (
        .y(_WTEMP_0),
        .in(_reg___q)
    );
    assign _reg___d = io_in;
endmodule //FixedPrecisionChanger
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
