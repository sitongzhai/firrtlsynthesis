module FloatOpsWithoutTrig(
    input clock,
    input reset,
    input [63:0] io_in1_node,
    input [63:0] io_in2_node,
    input [63:0] io_opsel,
    output [63:0] io_out_node,
    output io_boolOut
);
    wire _T_11;
    wire [63:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_1 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_2 (
        .y(_T_11),
        .a(_WTEMP_0),
        .b(io_opsel)
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
    wire _T_17;
    wire [63:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_4 (
        .y(_T_17),
        .a(_WTEMP_1),
        .b(io_opsel)
    );
    wire [63:0] _BBFSubtract__out;
    wire [63:0] _BBFSubtract__in2;
    wire [63:0] _BBFSubtract__in1;
    BBFSubtract BBFSubtract (
        .out(_BBFSubtract__out),
        .in2(_BBFSubtract__in2),
        .in1(_BBFSubtract__in1)
    );
    wire [63:0] _T_20_node;
    wire [63:0] _node_0;
    assign _node_0 = _T_14_node;
    wire _T_23;
    wire [63:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(2), .n(64)) u_pad_5 (
        .y(_WTEMP_2),
        .in(2'h2)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_6 (
        .y(_T_23),
        .a(_WTEMP_2),
        .b(io_opsel)
    );
    wire [63:0] _BBFMultiply__out;
    wire [63:0] _BBFMultiply__in2;
    wire [63:0] _BBFMultiply__in1;
    BBFMultiply BBFMultiply (
        .out(_BBFMultiply__out),
        .in2(_BBFMultiply__in2),
        .in1(_BBFMultiply__in1)
    );
    wire [63:0] _T_26_node;
    wire [63:0] _node_1;
    MUX_UNSIGNED #(.width(64)) u_mux_7 (
        .y(_node_1),
        .sel(_T_17),
        .a(_T_20_node),
        .b(_node_0)
    );
    wire _T_29;
    wire [63:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(2), .n(64)) u_pad_8 (
        .y(_WTEMP_3),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_9 (
        .y(_T_29),
        .a(_WTEMP_3),
        .b(io_opsel)
    );
    wire [63:0] _BBFDivide__out;
    wire [63:0] _BBFDivide__in2;
    wire [63:0] _BBFDivide__in1;
    BBFDivide BBFDivide (
        .out(_BBFDivide__out),
        .in2(_BBFDivide__in2),
        .in1(_BBFDivide__in1)
    );
    wire [63:0] _T_32_node;
    wire [63:0] _node_2;
    MUX_UNSIGNED #(.width(64)) u_mux_10 (
        .y(_node_2),
        .sel(_T_23),
        .a(_T_26_node),
        .b(_node_1)
    );
    wire _T_35;
    wire [63:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_11 (
        .y(_WTEMP_4),
        .in(3'h4)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_12 (
        .y(_T_35),
        .a(_WTEMP_4),
        .b(io_opsel)
    );
    wire [63:0] _BBFLn__out;
    wire [63:0] _BBFLn__in;
    BBFLn BBFLn (
        .out(_BBFLn__out),
        .in(_BBFLn__in)
    );
    wire [63:0] _T_38_node;
    wire [63:0] _node_3;
    MUX_UNSIGNED #(.width(64)) u_mux_13 (
        .y(_node_3),
        .sel(_T_29),
        .a(_T_32_node),
        .b(_node_2)
    );
    wire _T_41;
    wire [63:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_14 (
        .y(_WTEMP_5),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_15 (
        .y(_T_41),
        .a(_WTEMP_5),
        .b(io_opsel)
    );
    wire [63:0] _BBFLog10__out;
    wire [63:0] _BBFLog10__in;
    BBFLog10 BBFLog10 (
        .out(_BBFLog10__out),
        .in(_BBFLog10__in)
    );
    wire [63:0] _T_44_node;
    wire [63:0] _node_4;
    MUX_UNSIGNED #(.width(64)) u_mux_16 (
        .y(_node_4),
        .sel(_T_35),
        .a(_T_38_node),
        .b(_node_3)
    );
    wire _T_47;
    wire [63:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_17 (
        .y(_WTEMP_6),
        .in(3'h6)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_18 (
        .y(_T_47),
        .a(_WTEMP_6),
        .b(io_opsel)
    );
    wire [63:0] _BBFExp__out;
    wire [63:0] _BBFExp__in;
    BBFExp BBFExp (
        .out(_BBFExp__out),
        .in(_BBFExp__in)
    );
    wire [63:0] _T_50_node;
    wire [63:0] _node_5;
    MUX_UNSIGNED #(.width(64)) u_mux_19 (
        .y(_node_5),
        .sel(_T_41),
        .a(_T_44_node),
        .b(_node_4)
    );
    wire _T_53;
    wire [63:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(3), .n(64)) u_pad_20 (
        .y(_WTEMP_7),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_21 (
        .y(_T_53),
        .a(_WTEMP_7),
        .b(io_opsel)
    );
    wire [63:0] _BBFSqrt__out;
    wire [63:0] _BBFSqrt__in;
    BBFSqrt BBFSqrt (
        .out(_BBFSqrt__out),
        .in(_BBFSqrt__in)
    );
    wire [63:0] _T_56_node;
    wire [63:0] _node_6;
    MUX_UNSIGNED #(.width(64)) u_mux_22 (
        .y(_node_6),
        .sel(_T_47),
        .a(_T_50_node),
        .b(_node_5)
    );
    wire _T_59;
    wire [63:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_23 (
        .y(_WTEMP_8),
        .in(4'h8)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_24 (
        .y(_T_59),
        .a(_WTEMP_8),
        .b(io_opsel)
    );
    wire [63:0] _BBFPow__out;
    wire [63:0] _BBFPow__in2;
    wire [63:0] _BBFPow__in1;
    BBFPow BBFPow (
        .out(_BBFPow__out),
        .in2(_BBFPow__in2),
        .in1(_BBFPow__in1)
    );
    wire [63:0] _T_62_node;
    wire [63:0] _node_7;
    MUX_UNSIGNED #(.width(64)) u_mux_25 (
        .y(_node_7),
        .sel(_T_53),
        .a(_T_56_node),
        .b(_node_6)
    );
    wire _T_65;
    wire [63:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_26 (
        .y(_WTEMP_9),
        .in(4'h9)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_27 (
        .y(_T_65),
        .a(_WTEMP_9),
        .b(io_opsel)
    );
    wire [63:0] _BBFFloor__out;
    wire [63:0] _BBFFloor__in;
    BBFFloor BBFFloor (
        .out(_BBFFloor__out),
        .in(_BBFFloor__in)
    );
    wire [63:0] _T_68_node;
    wire [63:0] _node_8;
    MUX_UNSIGNED #(.width(64)) u_mux_28 (
        .y(_node_8),
        .sel(_T_59),
        .a(_T_62_node),
        .b(_node_7)
    );
    wire _T_71;
    wire [63:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(4), .n(64)) u_pad_29 (
        .y(_WTEMP_10),
        .in(4'hA)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_30 (
        .y(_T_71),
        .a(_WTEMP_10),
        .b(io_opsel)
    );
    wire [63:0] _BBFCeil__out;
    wire [63:0] _BBFCeil__in;
    BBFCeil BBFCeil (
        .out(_BBFCeil__out),
        .in(_BBFCeil__in)
    );
    wire [63:0] _T_74_node;
    wire [63:0] _node_9;
    MUX_UNSIGNED #(.width(64)) u_mux_31 (
        .y(_node_9),
        .sel(_T_65),
        .a(_T_68_node),
        .b(_node_8)
    );
    wire _T_77;
    wire [63:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_32 (
        .y(_WTEMP_11),
        .in(5'h19)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_33 (
        .y(_T_77),
        .a(_WTEMP_11),
        .b(io_opsel)
    );
    wire _BBFGreaterThan__out;
    wire [63:0] _BBFGreaterThan__in2;
    wire [63:0] _BBFGreaterThan__in1;
    BBFGreaterThan BBFGreaterThan (
        .out(_BBFGreaterThan__out),
        .in2(_BBFGreaterThan__in2),
        .in1(_BBFGreaterThan__in1)
    );
    wire _T_80;
    wire _T_82;
    wire [63:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(5), .n(64)) u_pad_34 (
        .y(_WTEMP_12),
        .in(5'h1A)
    );
    EQ_UNSIGNED #(.width(64)) u_eq_35 (
        .y(_T_82),
        .a(_WTEMP_12),
        .b(io_opsel)
    );
    wire _BBFGreaterThanEquals__out;
    wire [63:0] _BBFGreaterThanEquals__in2;
    wire [63:0] _BBFGreaterThanEquals__in1;
    BBFGreaterThanEquals BBFGreaterThanEquals (
        .out(_BBFGreaterThanEquals__out),
        .in2(_BBFGreaterThanEquals__in2),
        .in1(_BBFGreaterThanEquals__in1)
    );
    wire _T_85;
    wire _node_10;
    assign _node_10 = _T_80;
    assign _BBFAdd__in1 = io_in1_node;
    assign _BBFAdd__in2 = io_in2_node;
    assign _BBFCeil__in = io_in1_node;
    assign _BBFDivide__in1 = io_in1_node;
    assign _BBFDivide__in2 = io_in2_node;
    assign _BBFExp__in = io_in1_node;
    assign _BBFFloor__in = io_in1_node;
    assign _BBFGreaterThan__in1 = io_in1_node;
    assign _BBFGreaterThan__in2 = io_in2_node;
    assign _BBFGreaterThanEquals__in1 = io_in1_node;
    assign _BBFGreaterThanEquals__in2 = io_in2_node;
    assign _BBFLn__in = io_in1_node;
    assign _BBFLog10__in = io_in1_node;
    assign _BBFMultiply__in1 = io_in1_node;
    assign _BBFMultiply__in2 = io_in2_node;
    assign _BBFPow__in1 = io_in1_node;
    assign _BBFPow__in2 = io_in2_node;
    assign _BBFSqrt__in = io_in1_node;
    assign _BBFSubtract__in1 = io_in1_node;
    assign _BBFSubtract__in2 = io_in2_node;
    assign _T_14_node = _BBFAdd__out;
    assign _T_20_node = _BBFSubtract__out;
    assign _T_26_node = _BBFMultiply__out;
    assign _T_32_node = _BBFDivide__out;
    assign _T_38_node = _BBFLn__out;
    assign _T_44_node = _BBFLog10__out;
    assign _T_50_node = _BBFExp__out;
    assign _T_56_node = _BBFSqrt__out;
    assign _T_62_node = _BBFPow__out;
    assign _T_68_node = _BBFFloor__out;
    assign _T_74_node = _BBFCeil__out;
    assign _T_80 = _BBFGreaterThan__out;
    assign _T_85 = _BBFGreaterThanEquals__out;
    MUX_UNSIGNED #(.width(1)) u_mux_36 (
        .y(io_boolOut),
        .sel(_T_82),
        .a(_T_85),
        .b(_node_10)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_37 (
        .y(io_out_node),
        .sel(_T_71),
        .a(_T_74_node),
        .b(_node_9)
    );
endmodule //FloatOpsWithoutTrig
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
