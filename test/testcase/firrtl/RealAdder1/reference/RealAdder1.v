module RealAdder(
    input clock,
    input reset,
    input [63:0] io_a1_node,
    input [63:0] io_a2_node,
    output [63:0] io_c_node
);
    wire [63:0] _register1_node__q;
    wire [63:0] _register1_node__d;
    DFF_POSCLK #(.width(64)) register1_node (
        .q(_register1_node__q),
        .d(_register1_node__d),
        .clk(clock)
    );
    wire [63:0] _BBFAdd__out;
    wire [63:0] _BBFAdd__in2;
    wire [63:0] _BBFAdd__in1;
    BBFAdd BBFAdd (
        .out(_BBFAdd__out),
        .in2(_BBFAdd__in2),
        .in1(_BBFAdd__in1)
    );
    wire [63:0] _T_16_node;
    assign _BBFAdd__in1 = io_a1_node;
    assign _BBFAdd__in2 = io_a2_node;
    assign _T_16_node = _BBFAdd__out;
    assign io_c_node = _register1_node__q;
    assign _register1_node__d = _T_16_node;
endmodule //RealAdder
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
