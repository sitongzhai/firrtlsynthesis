module LnModule(
    input clock,
    input reset,
    input [63:0] io_num_node,
    output [63:0] io_ln_node
);
    wire [63:0] _BBFLn__out;
    wire [63:0] _BBFLn__in;
    BBFLn BBFLn (
        .out(_BBFLn__out),
        .in(_BBFLn__in)
    );
    wire [63:0] _T_8_node;
    assign _BBFLn__in = io_num_node;
    assign _T_8_node = _BBFLn__out;
    assign io_ln_node = _T_8_node;
endmodule //LnModule
