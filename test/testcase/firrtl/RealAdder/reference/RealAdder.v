module RealAdder(
    input clk,
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
        .clk(clk)
    );
    wire [63:0] _BBFAdd_1__out;
    wire [63:0] _BBFAdd_1__in2;
    wire [63:0] _BBFAdd_1__in1;
    BBFAdd BBFAdd_1 (
        .out(_BBFAdd_1__out),
        .in2(_BBFAdd_1__in2),
        .in1(_BBFAdd_1__in1)
    );
    wire [63:0] T_15_node;
    assign _BBFAdd_1__in1 = io_a1_node;
    assign _BBFAdd_1__in2 = io_a2_node;
    assign T_15_node = _BBFAdd_1__out;
    assign io_c_node = _register1_node__q;
    assign _register1_node__d = T_15_node;
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
