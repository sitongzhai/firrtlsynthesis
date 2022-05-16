module NegCircuit(
    input clock,
    input reset,
    input [63:0] io_in1_node,
    input [63:0] io_in2_node,
    output io_out
);
    wire _BBFGreaterThan__out;
    wire [63:0] _BBFGreaterThan__in2;
    wire [63:0] _BBFGreaterThan__in1;
    BBFGreaterThan BBFGreaterThan (
        .out(_BBFGreaterThan__out),
        .in2(_BBFGreaterThan__in2),
        .in1(_BBFGreaterThan__in1)
    );
    wire _T_11;
    assign _BBFGreaterThan__in1 = io_in1_node;
    assign _BBFGreaterThan__in2 = io_in2_node;
    assign _T_11 = _BBFGreaterThan__out;
    assign io_out = _T_11;
endmodule //NegCircuit
