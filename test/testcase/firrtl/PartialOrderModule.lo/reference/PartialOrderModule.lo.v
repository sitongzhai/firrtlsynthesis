module PartialOrderModule(
    input clock,
    input reset,
    input [63:0] io_in_node,
    output [63:0] io_out_node
);
    wire _BBFEquals__out;
    wire [63:0] _BBFEquals__in2;
    wire [63:0] _BBFEquals__in1;
    BBFEquals BBFEquals (
        .out(_BBFEquals__out),
        .in2(_BBFEquals__in2),
        .in1(_BBFEquals__in1)
    );
    wire _T_10;
    wire _BBFLessThan__out;
    wire [63:0] _BBFLessThan__in2;
    wire [63:0] _BBFLessThan__in1;
    BBFLessThan BBFLessThan (
        .out(_BBFLessThan__out),
        .in2(_BBFLessThan__in2),
        .in1(_BBFLessThan__in1)
    );
    wire _T_13;
    wire _T_16_eq;
    wire _T_16_lt;
    wire _T_23_valid;
    wire _T_23_bits_eq;
    wire _T_23_bits_lt;
    wire [63:0] _T_26_node;
    assign _T_26_node = io_in_node;
    assign _BBFEquals__in1 = io_in_node;
    assign _BBFEquals__in2 = io_in_node;
    assign _BBFLessThan__in1 = io_in_node;
    assign _BBFLessThan__in2 = io_in_node;
    assign _T_10 = _BBFEquals__out;
    assign _T_13 = _BBFLessThan__out;
    assign _T_16_eq = _T_10;
    assign _T_16_lt = _T_13;
    assign _T_23_bits_eq = _T_16_eq;
    assign _T_23_bits_lt = _T_16_lt;
    assign _T_23_valid = 1'h1;
    assign io_out_node = _T_26_node;
endmodule //PartialOrderModule
