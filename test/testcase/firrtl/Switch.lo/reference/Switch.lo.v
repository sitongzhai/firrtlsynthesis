module Switch(
    input clock,
    input reset,
    input [1:0] io_i0,
    input io_i1,
    output io_out
);
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
    wire [4:0] inst_valid_num;
    assign inst_valid_num = 5'h2;
    wire [5:0] _T_19;
    assign _T_19 = 6'h1;
    wire [5:0] _T_20;
    assign _T_20 = 6'h1;
    wire [4:0] _T_21;
    assign _T_21 = 5'h1;
    wire _T_23;
    EQ_UNSIGNED #(.width(2)) u_eq_3 (
        .y(_T_23),
        .a(2'h2),
        .b(io_i0)
    );
    wire [5:0] _T_25;
    assign _T_25 = 6'h3;
    wire [4:0] _T_26;
    assign _T_26 = 5'h3;
    wire _T_28;
    EQ_UNSIGNED #(.width(2)) u_eq_4 (
        .y(_T_28),
        .a(2'h3),
        .b(io_i0)
    );
    wire [5:0] _T_30;
    assign _T_30 = 6'h4;
    wire [4:0] _T_31;
    assign _T_31 = 5'h4;
    wire [4:0] _GEN_0;
    MUX_UNSIGNED #(.width(5)) u_mux_5 (
        .y(_GEN_0),
        .sel(_T_28),
        .a(_T_31),
        .b(5'h0)
    );
    wire [4:0] _GEN_1;
    MUX_UNSIGNED #(.width(5)) u_mux_6 (
        .y(_GEN_1),
        .sel(_T_23),
        .a(_T_26),
        .b(_GEN_0)
    );
    wire [4:0] _GEN_2;
    MUX_UNSIGNED #(.width(5)) u_mux_7 (
        .y(_GEN_2),
        .sel(_T_17),
        .a(_T_21),
        .b(_GEN_1)
    );
    wire [4:0] _GEN_3;
    MUX_UNSIGNED #(.width(5)) u_mux_8 (
        .y(_GEN_3),
        .sel(_T_14),
        .a(inst_valid_num),
        .b(_GEN_2)
    );
    wire [4:0] inst_valid_num_nxt;
    assign inst_valid_num_nxt = _GEN_3;
    wire [4:0] inst_valid_num_d;
    assign inst_valid_num_d = 5'h1;
    assign io_out = io_i1;
endmodule //Switch
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
