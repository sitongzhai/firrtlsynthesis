module FixedPointReduce(
    input clock,
    input reset,
    input [63:0] io_in_0,
    input [63:0] io_in_1,
    input [63:0] io_in_2,
    input [63:0] io_in_3,
    input [63:0] io_in_4,
    input [63:0] io_in_5,
    input [63:0] io_in_6,
    input [63:0] io_in_7,
    input [63:0] io_in_8,
    input [63:0] io_in_9,
    output [63:0] io_sum
);
    wire [64:0] _T_16;
    ADD_SIGNED #(.width(64)) s_add_1 (
        .y(_T_16),
        .a(io_in_0),
        .b(io_in_1)
    );
    wire [63:0] _T_17;
    TAIL #(.width(65), .n(1)) tail_2 (
        .y(_T_17),
        .in(_T_16)
    );
    wire [63:0] _T_18;
    ASSINT #(.width(64)) assint_3 (
        .y(_T_18),
        .in(_T_17)
    );
    wire [64:0] _T_19;
    ADD_SIGNED #(.width(64)) s_add_4 (
        .y(_T_19),
        .a(_T_18),
        .b(io_in_2)
    );
    wire [63:0] _T_20;
    TAIL #(.width(65), .n(1)) tail_5 (
        .y(_T_20),
        .in(_T_19)
    );
    wire [63:0] _T_21;
    ASSINT #(.width(64)) assint_6 (
        .y(_T_21),
        .in(_T_20)
    );
    wire [64:0] _T_22;
    ADD_SIGNED #(.width(64)) s_add_7 (
        .y(_T_22),
        .a(_T_21),
        .b(io_in_3)
    );
    wire [63:0] _T_23;
    TAIL #(.width(65), .n(1)) tail_8 (
        .y(_T_23),
        .in(_T_22)
    );
    wire [63:0] _T_24;
    ASSINT #(.width(64)) assint_9 (
        .y(_T_24),
        .in(_T_23)
    );
    wire [64:0] _T_25;
    ADD_SIGNED #(.width(64)) s_add_10 (
        .y(_T_25),
        .a(_T_24),
        .b(io_in_4)
    );
    wire [63:0] _T_26;
    TAIL #(.width(65), .n(1)) tail_11 (
        .y(_T_26),
        .in(_T_25)
    );
    wire [63:0] _T_27;
    ASSINT #(.width(64)) assint_12 (
        .y(_T_27),
        .in(_T_26)
    );
    wire [64:0] _T_28;
    ADD_SIGNED #(.width(64)) s_add_13 (
        .y(_T_28),
        .a(_T_27),
        .b(io_in_5)
    );
    wire [63:0] _T_29;
    TAIL #(.width(65), .n(1)) tail_14 (
        .y(_T_29),
        .in(_T_28)
    );
    wire [63:0] _T_30;
    ASSINT #(.width(64)) assint_15 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [64:0] _T_31;
    ADD_SIGNED #(.width(64)) s_add_16 (
        .y(_T_31),
        .a(_T_30),
        .b(io_in_6)
    );
    wire [63:0] _T_32;
    TAIL #(.width(65), .n(1)) tail_17 (
        .y(_T_32),
        .in(_T_31)
    );
    wire [63:0] _T_33;
    ASSINT #(.width(64)) assint_18 (
        .y(_T_33),
        .in(_T_32)
    );
    wire [64:0] _T_34;
    ADD_SIGNED #(.width(64)) s_add_19 (
        .y(_T_34),
        .a(_T_33),
        .b(io_in_7)
    );
    wire [63:0] _T_35;
    TAIL #(.width(65), .n(1)) tail_20 (
        .y(_T_35),
        .in(_T_34)
    );
    wire [63:0] _T_36;
    ASSINT #(.width(64)) assint_21 (
        .y(_T_36),
        .in(_T_35)
    );
    wire [64:0] _T_37;
    ADD_SIGNED #(.width(64)) s_add_22 (
        .y(_T_37),
        .a(_T_36),
        .b(io_in_8)
    );
    wire [63:0] _T_38;
    TAIL #(.width(65), .n(1)) tail_23 (
        .y(_T_38),
        .in(_T_37)
    );
    wire [63:0] _T_39;
    ASSINT #(.width(64)) assint_24 (
        .y(_T_39),
        .in(_T_38)
    );
    wire [64:0] _T_40;
    ADD_SIGNED #(.width(64)) s_add_25 (
        .y(_T_40),
        .a(_T_39),
        .b(io_in_9)
    );
    wire [63:0] _T_41;
    TAIL #(.width(65), .n(1)) tail_26 (
        .y(_T_41),
        .in(_T_40)
    );
    wire [63:0] _T_42;
    ASSINT #(.width(64)) assint_27 (
        .y(_T_42),
        .in(_T_41)
    );
    assign io_sum = _T_42;
endmodule //FixedPointReduce
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
