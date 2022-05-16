module ContextNestingTop(
    input clock,
    input reset,
    input [3:0] io_in1,
    input [3:0] io_in2,
    output [4:0] io_mod1Default,
    output [4:0] io_mod1Wrap,
    output [4:0] io_mod1Grow,
    output [4:0] io_mod2Default,
    output [4:0] io_mod2Wrap,
    output [4:0] io_mod2Grow
);
    wire _ContextNestingBottom__clock;
    wire _ContextNestingBottom__reset;
    wire [3:0] _ContextNestingBottom__io_in1;
    wire [3:0] _ContextNestingBottom__io_in2;
    wire [4:0] _ContextNestingBottom__io_outDefault;
    wire [4:0] _ContextNestingBottom__io_outWrap;
    wire [4:0] _ContextNestingBottom__io_outGrow;
    ContextNestingBottom ContextNestingBottom (
        .clock(_ContextNestingBottom__clock),
        .reset(_ContextNestingBottom__reset),
        .io_in1(_ContextNestingBottom__io_in1),
        .io_in2(_ContextNestingBottom__io_in2),
        .io_outDefault(_ContextNestingBottom__io_outDefault),
        .io_outWrap(_ContextNestingBottom__io_outWrap),
        .io_outGrow(_ContextNestingBottom__io_outGrow)
    );
    wire _ContextNestingBottom_1__clock;
    wire _ContextNestingBottom_1__reset;
    wire [3:0] _ContextNestingBottom_1__io_in1;
    wire [3:0] _ContextNestingBottom_1__io_in2;
    wire [4:0] _ContextNestingBottom_1__io_outDefault;
    wire [4:0] _ContextNestingBottom_1__io_outWrap;
    wire [4:0] _ContextNestingBottom_1__io_outGrow;
    ContextNestingBottom_1 ContextNestingBottom_1 (
        .clock(_ContextNestingBottom_1__clock),
        .reset(_ContextNestingBottom_1__reset),
        .io_in1(_ContextNestingBottom_1__io_in1),
        .io_in2(_ContextNestingBottom_1__io_in2),
        .io_outDefault(_ContextNestingBottom_1__io_outDefault),
        .io_outWrap(_ContextNestingBottom_1__io_outWrap),
        .io_outGrow(_ContextNestingBottom_1__io_outGrow)
    );
    assign _ContextNestingBottom__clock = clock;
    assign _ContextNestingBottom__io_in1 = io_in1;
    assign _ContextNestingBottom__io_in2 = io_in2;
    assign _ContextNestingBottom__reset = reset;
    assign _ContextNestingBottom_1__clock = clock;
    assign _ContextNestingBottom_1__io_in1 = io_in1;
    assign _ContextNestingBottom_1__io_in2 = io_in2;
    assign _ContextNestingBottom_1__reset = reset;
    assign io_mod1Default = _ContextNestingBottom__io_outDefault;
    assign io_mod1Grow = _ContextNestingBottom__io_outGrow;
    assign io_mod1Wrap = _ContextNestingBottom__io_outWrap;
    assign io_mod2Default = _ContextNestingBottom_1__io_outDefault;
    assign io_mod2Grow = _ContextNestingBottom_1__io_outGrow;
    assign io_mod2Wrap = _ContextNestingBottom_1__io_outWrap;
endmodule //ContextNestingTop
module ContextNestingBottom(
    input clock,
    input reset,
    input [3:0] io_in1,
    input [3:0] io_in2,
    output [4:0] io_outDefault,
    output [4:0] io_outWrap,
    output [4:0] io_outGrow
);
    wire [4:0] _T_2;
    ADD_UNSIGNED #(.width(4)) u_add_1 (
        .y(_T_2),
        .a(io_in1),
        .b(io_in2)
    );
    wire [3:0] _T_3;
    TAIL #(.width(5), .n(1)) tail_2 (
        .y(_T_3),
        .in(_T_2)
    );
    wire [4:0] _T_5;
    ADD_UNSIGNED #(.width(4)) u_add_3 (
        .y(_T_5),
        .a(io_in1),
        .b(io_in2)
    );
    wire [4:0] _T_7;
    ADD_UNSIGNED #(.width(4)) u_add_4 (
        .y(_T_7),
        .a(io_in1),
        .b(io_in2)
    );
    wire [3:0] _T_8;
    TAIL #(.width(5), .n(1)) tail_5 (
        .y(_T_8),
        .in(_T_7)
    );
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_6 (
        .y(io_outDefault),
        .in(_T_8)
    );
    assign io_outGrow = _T_5;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_7 (
        .y(io_outWrap),
        .in(_T_3)
    );
endmodule //ContextNestingBottom
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module ContextNestingBottom_1(
    input clock,
    input reset,
    input [3:0] io_in1,
    input [3:0] io_in2,
    output [4:0] io_outDefault,
    output [4:0] io_outWrap,
    output [4:0] io_outGrow
);
    wire [4:0] _T_2;
    ADD_UNSIGNED #(.width(4)) u_add_8 (
        .y(_T_2),
        .a(io_in1),
        .b(io_in2)
    );
    wire [3:0] _T_3;
    TAIL #(.width(5), .n(1)) tail_9 (
        .y(_T_3),
        .in(_T_2)
    );
    wire [4:0] _T_5;
    ADD_UNSIGNED #(.width(4)) u_add_10 (
        .y(_T_5),
        .a(io_in1),
        .b(io_in2)
    );
    wire [4:0] _T_7;
    ADD_UNSIGNED #(.width(4)) u_add_11 (
        .y(_T_7),
        .a(io_in1),
        .b(io_in2)
    );
    assign io_outDefault = _T_7;
    assign io_outGrow = _T_5;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_12 (
        .y(io_outWrap),
        .in(_T_3)
    );
endmodule //ContextNestingBottom_1
