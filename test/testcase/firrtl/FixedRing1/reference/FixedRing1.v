module FixedRing1(
    input clock,
    input reset,
    input [15:0] io_in,
    output [15:0] io_floor,
    output [15:0] io_ceil,
    output io_isWhole,
    output [15:0] io_round,
    output [63:0] io_real_node
);
    wire [11:0] _T_9;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_1 (
        .y(_T_9),
        .in(io_in)
    );
    wire [15:0] _node_0;
    SHL_SIGNED #(.width(12), .n(4)) s_shl_2 (
        .y(_node_0),
        .in(_T_9)
    );
    wire [11:0] _T_11;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_3 (
        .y(_T_11),
        .in(io_in)
    );
    wire [15:0] _node_1;
    SHL_SIGNED #(.width(12), .n(4)) s_shl_4 (
        .y(_node_1),
        .in(_T_11)
    );
    wire _T_12;
    EQ_SIGNED #(.width(16)) s_eq_5 (
        .y(_T_12),
        .a(io_in),
        .b(_node_1)
    );
    wire [11:0] _T_14;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_6 (
        .y(_T_14),
        .in(io_in)
    );
    wire [11:0] _T_15;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_7 (
        .y(_T_15),
        .in(io_in)
    );
    wire [1:0] _node_2;
    ASSINT #(.width(2)) assint_8 (
        .y(_node_2),
        .in(2'h1)
    );
    wire [12:0] _T_17;
    wire [11:0] _WTEMP_0;
    PAD_SIGNED #(.width(2), .n(12)) s_pad_9 (
        .y(_WTEMP_0),
        .in(_node_2)
    );
    ADD_SIGNED #(.width(12)) s_add_10 (
        .y(_T_17),
        .a(_T_15),
        .b(_WTEMP_0)
    );
    wire [12:0] _T_20;
    wire [12:0] _WTEMP_1;
    PAD_SIGNED #(.width(12), .n(13)) s_pad_11 (
        .y(_WTEMP_1),
        .in(_T_14)
    );
    MUX_SIGNED #(.width(13)) s_mux_12 (
        .y(_T_20),
        .sel(_T_12),
        .a(_WTEMP_1),
        .b(_T_17)
    );
    wire [16:0] _node_3;
    SHL_SIGNED #(.width(13), .n(4)) s_shl_13 (
        .y(_node_3),
        .in(_T_20)
    );
    wire [11:0] _T_21;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_14 (
        .y(_T_21),
        .in(io_in)
    );
    wire [15:0] _node_4;
    SHL_SIGNED #(.width(12), .n(4)) s_shl_15 (
        .y(_node_4),
        .in(_T_21)
    );
    wire _T_22;
    EQ_SIGNED #(.width(16)) s_eq_16 (
        .y(_T_22),
        .a(io_in),
        .b(_node_4)
    );
    wire [1:0] _node_5;
    ASSINT #(.width(2)) assint_17 (
        .y(_node_5),
        .in(2'h1)
    );
    wire [4:0] _node_6;
    SHL_SIGNED #(.width(2), .n(3)) s_shl_18 (
        .y(_node_6),
        .in(_node_5)
    );
    wire [16:0] _T_24;
    wire [15:0] _WTEMP_2;
    PAD_SIGNED #(.width(5), .n(16)) s_pad_19 (
        .y(_WTEMP_2),
        .in(_node_6)
    );
    ADD_SIGNED #(.width(16)) s_add_20 (
        .y(_T_24),
        .a(io_in),
        .b(_WTEMP_2)
    );
    wire [12:0] _T_26;
    SHR_SIGNED #(.width(17), .n(4)) s_shr_21 (
        .y(_T_26),
        .in(_T_24)
    );
    wire [16:0] _node_7;
    SHL_SIGNED #(.width(13), .n(4)) s_shl_22 (
        .y(_node_7),
        .in(_T_26)
    );
    wire [15:0] _WTEMP_3;
    BITS #(.width(17), .high(15), .low(0)) bits_23 (
        .y(_WTEMP_3),
        .in(_node_3)
    );
    ASSINT #(.width(16)) assint_24 (
        .y(io_ceil),
        .in(_WTEMP_3)
    );
    assign io_floor = _node_0;
    assign io_isWhole = _T_22;
    assign io_real_node = 64'h0;
    wire [15:0] _WTEMP_4;
    BITS #(.width(17), .high(15), .low(0)) bits_25 (
        .y(_WTEMP_4),
        .in(_node_7)
    );
    ASSINT #(.width(16)) assint_26 (
        .y(io_round),
        .in(_WTEMP_4)
    );
endmodule //FixedRing1
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
