module BlackBoxFloatAdder(
    input clock,
    input reset,
    input [63:0] io_a_node,
    input [63:0] io_b_node,
    output [63:0] io_c_node,
    output [63:0] io_d_node,
    output [63:0] io_e_node
);
    wire [63:0] _BBFAdd__out;
    wire [63:0] _BBFAdd__in2;
    wire [63:0] _BBFAdd__in1;
    BBFAdd BBFAdd (
        .out(_BBFAdd__out),
        .in2(_BBFAdd__in2),
        .in1(_BBFAdd__in1)
    );
    wire [63:0] _T_14_node;
    wire [63:0] _BBFAdd_1__out;
    wire [63:0] _BBFAdd_1__in2;
    wire [63:0] _BBFAdd_1__in1;
    BBFAdd BBFAdd_1 (
        .out(_BBFAdd_1__out),
        .in2(_BBFAdd_1__in2),
        .in1(_BBFAdd_1__in1)
    );
    wire [63:0] _T_18_node;
    wire [63:0] _BBFAdd_2__out;
    wire [63:0] _BBFAdd_2__in2;
    wire [63:0] _BBFAdd_2__in1;
    BBFAdd BBFAdd_2 (
        .out(_BBFAdd_2__out),
        .in2(_BBFAdd_2__in2),
        .in1(_BBFAdd_2__in1)
    );
    wire [63:0] _T_22_node;
    assign _BBFAdd__in1 = io_a_node;
    assign _BBFAdd__in2 = io_b_node;
    assign _BBFAdd_1__in1 = io_a_node;
    assign _BBFAdd_1__in2 = io_a_node;
    assign _BBFAdd_2__in1 = io_b_node;
    assign _BBFAdd_2__in2 = io_b_node;
    assign _T_14_node = _BBFAdd__out;
    assign _T_18_node = _BBFAdd_1__out;
    assign _T_22_node = _BBFAdd_2__out;
    assign io_c_node = _T_14_node;
    assign io_d_node = _T_18_node;
    assign io_e_node = _T_22_node;
endmodule //BlackBoxFloatAdder
