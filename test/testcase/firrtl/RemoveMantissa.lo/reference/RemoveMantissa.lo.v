module RemoveMantissa(
    input clock,
    input reset,
    input [11:0] io_in,
    output [7:0] io_out
);
    wire [11:0] _reg___q;
    wire [11:0] _reg___d;
    DFF_POSCLK #(.width(12)) reg_ (
        .q(_reg___q),
        .d(_reg___d),
        .clk(clock)
    );
    SHR_SIGNED #(.width(12), .n(4)) s_shr_1 (
        .y(io_out),
        .in(_reg___q)
    );
    assign _reg___d = io_in;
endmodule //RemoveMantissa
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
