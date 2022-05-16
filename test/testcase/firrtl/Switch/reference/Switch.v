module Switch(
    input clock,
    input reset,
    input [1:0] io_i0,
    input io_i1,
    output io_out
);
    wire [4:0] inst_valid_num_nxt;
    wire [4:0] inst_valid_num;
    wire _T_14;
    EQ_UNSIGNED #(.width(2)) u_eq_1 (
        .y(_T_14),
        .a(2'h0),
        .b(io_i0)
    );
    wire _T_17;
    EQ_UNSIGNED #(.width(2)) u_eq_2 (
        .y(_T_17),
        .a(2'h1),
        .b(io_i0)
    );
    wire [5:0] _T_19;
    SUB_UNSIGNED #(.width(5)) u_sub_3 (
        .y(_T_19),
        .a(inst_valid_num),
        .b(5'h1)
    );
    wire [5:0] _T_20;
    ASUINT #(.width(6)) asuint_4 (
        .y(_T_20),
        .in(_T_19)
    );
    wire [4:0] _T_21;
    TAIL #(.width(6), .n(1)) tail_5 (
        .y(_T_21),
        .in(_T_20)
    );
    wire _T_23;
    EQ_UNSIGNED #(.width(2)) u_eq_6 (
        .y(_T_23),
        .a(2'h2),
        .b(io_i0)
    );
    wire [5:0] _T_25;
    ADD_UNSIGNED #(.width(5)) u_add_7 (
        .y(_T_25),
        .a(inst_valid_num),
        .b(5'h1)
    );
    wire [4:0] _T_26;
    TAIL #(.width(6), .n(1)) tail_8 (
        .y(_T_26),
        .in(_T_25)
    );
    wire _T_28;
    EQ_UNSIGNED #(.width(2)) u_eq_9 (
        .y(_T_28),
        .a(2'h3),
        .b(io_i0)
    );
    wire [5:0] _T_30;
    ADD_UNSIGNED #(.width(5)) u_add_10 (
        .y(_T_30),
        .a(inst_valid_num),
        .b(5'h2)
    );
    wire [4:0] _T_31;
    TAIL #(.width(6), .n(1)) tail_11 (
        .y(_T_31),
        .in(_T_30)
    );
    wire [4:0] _node_0;
    MUX_UNSIGNED #(.width(5)) u_mux_12 (
        .y(_node_0),
        .sel(_T_28),
        .a(_T_31),
        .b(5'h0)
    );
    wire [4:0] _node_1;
    MUX_UNSIGNED #(.width(5)) u_mux_13 (
        .y(_node_1),
        .sel(_T_23),
        .a(_T_26),
        .b(_node_0)
    );
    wire [4:0] _node_2;
    MUX_UNSIGNED #(.width(5)) u_mux_14 (
        .y(_node_2),
        .sel(_T_17),
        .a(_T_21),
        .b(_node_1)
    );
    wire [4:0] inst_valid_num_d;
    assign inst_valid_num = 5'h2;
    assign inst_valid_num_d = 5'h1;
    MUX_UNSIGNED #(.width(5)) u_mux_15 (
        .y(inst_valid_num_nxt),
        .sel(_T_14),
        .a(inst_valid_num),
        .b(_node_2)
    );
    assign io_out = io_i1;
endmodule //Switch
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
