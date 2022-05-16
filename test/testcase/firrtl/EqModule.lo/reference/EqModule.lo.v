module EqModule(
    input clock,
    input reset,
    input [9:0] io_in,
    output [9:0] io_out
);
    wire _T_5;
    wire [9:0] _WTEMP_0;
    PAD_SIGNED #(.width(1), .n(10)) s_pad_1 (
        .y(_WTEMP_0),
        .in(1'sh0)
    );
    EQ_SIGNED #(.width(10)) s_eq_2 (
        .y(_T_5),
        .a(io_in),
        .b(_WTEMP_0)
    );
    wire [9:0] _T_7;
    wire [9:0] _WTEMP_1;
    PAD_SIGNED #(.width(2), .n(10)) s_pad_3 (
        .y(_WTEMP_1),
        .in(2'sh1)
    );
    MUX_SIGNED #(.width(10)) s_mux_4 (
        .y(_T_7),
        .sel(_T_5),
        .a(_WTEMP_1),
        .b(io_in)
    );
    assign io_out = _T_7;
endmodule //EqModule
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
