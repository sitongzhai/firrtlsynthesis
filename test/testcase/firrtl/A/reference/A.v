module A(
    input clock,
    input reset,
    input io_enable,
    output [2:0] io_calc
);
    wire _sub__clock;
    wire _sub__reset;
    wire _sub__io_enable;
    wire [2:0] _sub__io_calc;
    B sub (
        .clock(_sub__clock),
        .reset(_sub__reset),
        .io_enable(_sub__io_enable),
        .io_calc(_sub__io_calc)
    );
    assign io_calc = _sub__io_calc;
    assign _sub__clock = clock;
    assign _sub__io_enable = io_enable;
    assign _sub__reset = reset;
endmodule //A
module B(
    input clock,
    input reset,
    input io_enable,
    output [2:0] io_calc
);
    wire [2:0] _counter__q;
    wire [2:0] _counter__d;
    DFF_POSCLK #(.width(3)) counter (
        .q(_counter__q),
        .d(_counter__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(3)) u_mux_1 (
        .y(_counter__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_0)
    );
    wire [3:0] _T_7;
    wire [2:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_2 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_3 (
        .y(_T_7),
        .a(_counter__q),
        .b(_WTEMP_1)
    );
    wire [2:0] _T_8;
    TAIL #(.width(4), .n(1)) tail_4 (
        .y(_T_8),
        .in(_T_7)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_5 (
        .y(_WTEMP_0),
        .sel(io_enable),
        .a(_T_8),
        .b(_counter__q)
    );
    assign io_calc = _counter__q;
endmodule //B
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
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
