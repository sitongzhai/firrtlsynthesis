module DoesAbs(
    input clock,
    input reset,
    input [3:0] io_uIn,
    input [3:0] io_sIn,
    input [4:0] io_fIn,
    output [3:0] io_uAbsGrow,
    output [3:0] io_uAbsWrap,
    output [4:0] io_sAbsGrow,
    output [3:0] io_sAbsWrap,
    output [5:0] io_fAbsGrow,
    output [4:0] io_fAbsWrap
);
    wire _T_8;
    wire [3:0] _WTEMP_0;
    PAD_SIGNED #(.width(1), .n(4)) s_pad_1 (
        .y(_WTEMP_0),
        .in(1'sh0)
    );
    GEQ_SIGNED #(.width(4)) s_geq_2 (
        .y(_T_8),
        .a(io_sIn),
        .b(_WTEMP_0)
    );
    wire [4:0] _T_11;
    wire [3:0] _WTEMP_1;
    PAD_SIGNED #(.width(1), .n(4)) s_pad_3 (
        .y(_WTEMP_1),
        .in(1'sh0)
    );
    SUB_SIGNED #(.width(4)) s_sub_4 (
        .y(_T_11),
        .a(_WTEMP_1),
        .b(io_sIn)
    );
    wire [4:0] _T_13;
    wire [4:0] _WTEMP_2;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_5 (
        .y(_WTEMP_2),
        .in(io_sIn)
    );
    MUX_SIGNED #(.width(5)) s_mux_6 (
        .y(_T_13),
        .sel(_T_8),
        .a(_WTEMP_2),
        .b(_T_11)
    );
    wire _T_16;
    wire [3:0] _WTEMP_3;
    PAD_SIGNED #(.width(1), .n(4)) s_pad_7 (
        .y(_WTEMP_3),
        .in(1'sh0)
    );
    GEQ_SIGNED #(.width(4)) s_geq_8 (
        .y(_T_16),
        .a(io_sIn),
        .b(_WTEMP_3)
    );
    wire [4:0] _T_19;
    wire [3:0] _WTEMP_4;
    PAD_SIGNED #(.width(1), .n(4)) s_pad_9 (
        .y(_WTEMP_4),
        .in(1'sh0)
    );
    SUB_SIGNED #(.width(4)) s_sub_10 (
        .y(_T_19),
        .a(_WTEMP_4),
        .b(io_sIn)
    );
    wire [3:0] _T_20;
    TAIL #(.width(5), .n(1)) tail_11 (
        .y(_T_20),
        .in(_T_19)
    );
    wire [3:0] _T_21;
    ASSINT #(.width(4)) assint_12 (
        .y(_T_21),
        .in(_T_20)
    );
    wire [3:0] _T_23;
    MUX_SIGNED #(.width(4)) s_mux_13 (
        .y(_T_23),
        .sel(_T_16),
        .a(io_sIn),
        .b(_T_21)
    );
    wire _T_25;
    BITS #(.width(5), .high(4), .low(4)) bits_14 (
        .y(_T_25),
        .in(io_fIn)
    );
    wire [5:0] _T_27;
    wire [4:0] _WTEMP_5;
    PAD_SIGNED #(.width(3), .n(5)) s_pad_15 (
        .y(_WTEMP_5),
        .in(3'sh0)
    );
    SUB_SIGNED #(.width(5)) s_sub_16 (
        .y(_T_27),
        .a(_WTEMP_5),
        .b(io_fIn)
    );
    wire [5:0] _T_31;
    wire [5:0] _WTEMP_6;
    PAD_SIGNED #(.width(5), .n(6)) s_pad_17 (
        .y(_WTEMP_6),
        .in(io_fIn)
    );
    MUX_SIGNED #(.width(6)) s_mux_18 (
        .y(_T_31),
        .sel(_T_25),
        .a(_T_27),
        .b(_WTEMP_6)
    );
    wire _T_33;
    BITS #(.width(5), .high(4), .low(4)) bits_19 (
        .y(_T_33),
        .in(io_fIn)
    );
    wire [5:0] _T_35;
    wire [4:0] _WTEMP_7;
    PAD_SIGNED #(.width(3), .n(5)) s_pad_20 (
        .y(_WTEMP_7),
        .in(3'sh0)
    );
    SUB_SIGNED #(.width(5)) s_sub_21 (
        .y(_T_35),
        .a(_WTEMP_7),
        .b(io_fIn)
    );
    wire [4:0] _T_36;
    TAIL #(.width(6), .n(1)) tail_22 (
        .y(_T_36),
        .in(_T_35)
    );
    wire [4:0] _T_37;
    ASSINT #(.width(5)) assint_23 (
        .y(_T_37),
        .in(_T_36)
    );
    wire [4:0] _T_41;
    MUX_SIGNED #(.width(5)) s_mux_24 (
        .y(_T_41),
        .sel(_T_33),
        .a(_T_37),
        .b(io_fIn)
    );
    assign io_fAbsGrow = _T_31;
    assign io_fAbsWrap = _T_41;
    assign io_sAbsGrow = _T_13;
    assign io_sAbsWrap = _T_23;
    assign io_uAbsGrow = io_uIn;
    assign io_uAbsWrap = io_uIn;
endmodule //DoesAbs
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module GEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) >= $signed(b);
endmodule // GEQ_SIGNED
module SUB_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) - $signed(b);
endmodule // SUB_SIGNED
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
