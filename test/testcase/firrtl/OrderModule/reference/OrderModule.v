module OrderModule(
    input clock,
    input reset,
    input [63:0] io_in_node,
    output [63:0] io_out_node
);
    wire _BBFLessThan__out;
    wire [63:0] _BBFLessThan__in2;
    wire [63:0] _BBFLessThan__in1;
    BBFLessThan BBFLessThan (
        .out(_BBFLessThan__out),
        .in2(_BBFLessThan__in2),
        .in1(_BBFLessThan__in1)
    );
    wire _T_10;
    wire [63:0] _T_11_node;
    assign _T_11_node = io_in_node;
    assign _BBFLessThan__in1 = io_in_node;
    assign _BBFLessThan__in2 = io_in_node;
    assign _T_10 = _BBFLessThan__out;
    assign io_out_node = _T_11_node;
endmodule //OrderModule
