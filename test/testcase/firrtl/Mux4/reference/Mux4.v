module Mux4(
    input clock,
    input reset,
    input io_s0,
    input io_s1,
    input io_i0,
    input io_i1,
    input io_i2,
    input io_i3,
    output io_out
);
    wire _m0__clock;
    wire _m0__reset;
    wire _m0__io_sel;
    wire _m0__io_i0;
    wire _m0__io_i1;
    wire _m0__io_out;
    Mux2 m0 (
        .clock(_m0__clock),
        .reset(_m0__reset),
        .io_sel(_m0__io_sel),
        .io_i0(_m0__io_i0),
        .io_i1(_m0__io_i1),
        .io_out(_m0__io_out)
    );
    wire _m1__clock;
    wire _m1__reset;
    wire _m1__io_sel;
    wire _m1__io_i0;
    wire _m1__io_i1;
    wire _m1__io_out;
    Mux2_1 m1 (
        .clock(_m1__clock),
        .reset(_m1__reset),
        .io_sel(_m1__io_sel),
        .io_i0(_m1__io_i0),
        .io_i1(_m1__io_i1),
        .io_out(_m1__io_out)
    );
    wire _m2__clock;
    wire _m2__reset;
    wire _m2__io_sel;
    wire _m2__io_i0;
    wire _m2__io_i1;
    wire _m2__io_out;
    Mux2_2 m2 (
        .clock(_m2__clock),
        .reset(_m2__reset),
        .io_sel(_m2__io_sel),
        .io_i0(_m2__io_i0),
        .io_i1(_m2__io_i1),
        .io_out(_m2__io_out)
    );
    assign io_out = _m2__io_out;
    assign _m0__clock = clock;
    assign _m0__io_i0 = io_i0;
    assign _m0__io_i1 = io_i1;
    assign _m0__io_sel = io_s0;
    assign _m0__reset = reset;
    assign _m1__clock = clock;
    assign _m1__io_i0 = io_i2;
    assign _m1__io_i1 = io_i3;
    assign _m1__io_sel = io_s0;
    assign _m1__reset = reset;
    assign _m2__clock = clock;
    assign _m2__io_i0 = _m0__io_out;
    assign _m2__io_i1 = _m1__io_out;
    assign _m2__io_sel = io_s1;
    assign _m2__reset = reset;
endmodule //Mux4
module Mux2(
    input clock,
    input reset,
    input io_sel,
    input io_i0,
    input io_i1,
    output io_out
);
    wire _T_13;
    BITWISEAND #(.width(1)) bitwiseand_1 (
        .y(_T_13),
        .a(io_sel),
        .b(io_i1)
    );
    wire _T_14;
    BITWISENOT #(.width(1)) bitwisenot_2 (
        .y(_T_14),
        .in(io_sel)
    );
    wire _T_15;
    BITWISEAND #(.width(1)) bitwiseand_3 (
        .y(_T_15),
        .a(_T_14),
        .b(io_i0)
    );
    wire _T_16;
    BITWISEOR #(.width(1)) bitwiseor_4 (
        .y(_T_16),
        .a(_T_13),
        .b(_T_15)
    );
    assign io_out = _T_16;
endmodule //Mux2
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module Mux2_1(
    input clock,
    input reset,
    input io_sel,
    input io_i0,
    input io_i1,
    output io_out
);
    wire _T_13;
    BITWISEAND #(.width(1)) bitwiseand_5 (
        .y(_T_13),
        .a(io_sel),
        .b(io_i1)
    );
    wire _T_14;
    BITWISENOT #(.width(1)) bitwisenot_6 (
        .y(_T_14),
        .in(io_sel)
    );
    wire _T_15;
    BITWISEAND #(.width(1)) bitwiseand_7 (
        .y(_T_15),
        .a(_T_14),
        .b(io_i0)
    );
    wire _T_16;
    BITWISEOR #(.width(1)) bitwiseor_8 (
        .y(_T_16),
        .a(_T_13),
        .b(_T_15)
    );
    assign io_out = _T_16;
endmodule //Mux2_1
module Mux2_2(
    input clock,
    input reset,
    input io_sel,
    input io_i0,
    input io_i1,
    output io_out
);
    wire _T_13;
    BITWISEAND #(.width(1)) bitwiseand_9 (
        .y(_T_13),
        .a(io_sel),
        .b(io_i1)
    );
    wire _T_14;
    BITWISENOT #(.width(1)) bitwisenot_10 (
        .y(_T_14),
        .in(io_sel)
    );
    wire _T_15;
    BITWISEAND #(.width(1)) bitwiseand_11 (
        .y(_T_15),
        .a(_T_14),
        .b(io_i0)
    );
    wire _T_16;
    BITWISEOR #(.width(1)) bitwiseor_12 (
        .y(_T_16),
        .a(_T_13),
        .b(_T_15)
    );
    assign io_out = _T_16;
endmodule //Mux2_2
