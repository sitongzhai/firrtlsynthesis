module ConstantTapTransposedStreamingFIR(
    input clock,
    input reset,
    input io_input_valid,
    input [9:0] io_input_bits,
    output io_output_valid,
    output [15:0] io_output_bits
);
    wire [12:0] products_0;
    MUL2_SIGNED #(.width_a(10), .width_b(3)) s_mul2_1 (
        .y(products_0),
        .a(io_input_bits),
        .b(3'sh2)
    );
    wire [11:0] products_1;
    MUL2_SIGNED #(.width_a(10), .width_b(2)) s_mul2_2 (
        .y(products_1),
        .a(io_input_bits),
        .b(2'sh1)
    );
    wire [10:0] products_2;
    assign products_2 = 11'sh0;
    wire [15:0] _last__q;
    wire [15:0] _last__d;
    DFF_POSCLK #(.width(16)) last (
        .q(_last__q),
        .d(_last__d),
        .clk(clock)
    );
    wire [12:0] __T_16__q;
    wire [12:0] __T_16__d;
    DFF_POSCLK #(.width(13)) _T_16 (
        .q(__T_16__q),
        .d(__T_16__d),
        .clk(clock)
    );
    wire [12:0] _GEN_0;
    MUX_SIGNED #(.width(13)) s_mux_3 (
        .y(_GEN_0),
        .sel(io_input_valid),
        .a(products_0),
        .b(__T_16__q)
    );
    wire [13:0] _T_17;
    wire [12:0] _WTEMP_0;
    PAD_SIGNED #(.width(12), .n(13)) s_pad_4 (
        .y(_WTEMP_0),
        .in(products_1)
    );
    ADD_SIGNED #(.width(13)) s_add_5 (
        .y(_T_17),
        .a(__T_16__q),
        .b(_WTEMP_0)
    );
    wire [12:0] _T_18;
    TAIL #(.width(14), .n(1)) tail_6 (
        .y(_T_18),
        .in(_T_17)
    );
    wire [12:0] _T_19;
    ASSINT #(.width(13)) assint_7 (
        .y(_T_19),
        .in(_T_18)
    );
    wire [12:0] __T_21__q;
    wire [12:0] __T_21__d;
    DFF_POSCLK #(.width(13)) _T_21 (
        .q(__T_21__q),
        .d(__T_21__d),
        .clk(clock)
    );
    wire [12:0] _GEN_1;
    MUX_SIGNED #(.width(13)) s_mux_8 (
        .y(_GEN_1),
        .sel(io_input_valid),
        .a(_T_19),
        .b(__T_21__q)
    );
    wire [13:0] _T_22;
    wire [12:0] _WTEMP_1;
    PAD_SIGNED #(.width(11), .n(13)) s_pad_9 (
        .y(_WTEMP_1),
        .in(products_2)
    );
    ADD_SIGNED #(.width(13)) s_add_10 (
        .y(_T_22),
        .a(__T_21__q),
        .b(_WTEMP_1)
    );
    wire [12:0] _T_23;
    TAIL #(.width(14), .n(1)) tail_11 (
        .y(_T_23),
        .in(_T_22)
    );
    wire [12:0] nextLast;
    ASSINT #(.width(13)) assint_12 (
        .y(nextLast),
        .in(_T_23)
    );
    wire [15:0] _GEN_2;
    wire [15:0] _WTEMP_2;
    PAD_SIGNED #(.width(13), .n(16)) s_pad_13 (
        .y(_WTEMP_2),
        .in(nextLast)
    );
    MUX_SIGNED #(.width(16)) s_mux_14 (
        .y(_GEN_2),
        .sel(io_input_valid),
        .a(_WTEMP_2),
        .b(_last__q)
    );
    wire __T_25__q;
    wire __T_25__d;
    DFF_POSCLK #(.width(1)) _T_25 (
        .q(__T_25__q),
        .d(__T_25__d),
        .clk(clock)
    );
    assign __T_16__d = _GEN_0;
    assign __T_21__d = _GEN_1;
    assign __T_25__d = io_input_valid;
    assign io_output_bits = _last__q;
    assign io_output_valid = __T_25__q;
    assign _last__d = _GEN_2;
endmodule //ConstantTapTransposedStreamingFIR
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
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
