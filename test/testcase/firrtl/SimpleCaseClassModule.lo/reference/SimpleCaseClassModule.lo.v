module SimpleCaseClassModule(
    input clock,
    input reset,
    input [4:0] io_in_underlying,
    output [4:0] io_out_underlying
);
    wire [4:0] _register1_underlying__q;
    wire [4:0] _register1_underlying__d;
    DFF_POSCLK #(.width(5)) register1_underlying (
        .q(_register1_underlying__q),
        .d(_register1_underlying__d),
        .clk(clock)
    );
    assign io_out_underlying = _register1_underlying__q;
    assign _register1_underlying__d = io_in_underlying;
endmodule //SimpleCaseClassModule
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
