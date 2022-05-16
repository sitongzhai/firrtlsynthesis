module StreamingAutocorrelator(
    input clock,
    input reset,
    input [9:0] io_input,
    output [19:0] io_output
);
    wire [9:0] _delays_1__q;
    wire [9:0] _delays_1__d;
    DFF_POSCLK #(.width(10)) delays_1 (
        .q(_delays_1__q),
        .d(_delays_1__d),
        .clk(clock)
    );
    wire [9:0] _delays_2__q;
    wire [9:0] _delays_2__d;
    DFF_POSCLK #(.width(10)) delays_2 (
        .q(_delays_2__q),
        .d(_delays_2__d),
        .clk(clock)
    );
    wire [9:0] _delays_3__q;
    wire [9:0] _delays_3__d;
    DFF_POSCLK #(.width(10)) delays_3 (
        .q(_delays_3__q),
        .d(_delays_3__d),
        .clk(clock)
    );
    wire [9:0] _delays_4__q;
    wire [9:0] _delays_4__d;
    DFF_POSCLK #(.width(10)) delays_4 (
        .q(_delays_4__q),
        .d(_delays_4__d),
        .clk(clock)
    );
    wire [9:0] _delays_5__q;
    wire [9:0] _delays_5__d;
    DFF_POSCLK #(.width(10)) delays_5 (
        .q(_delays_5__q),
        .d(_delays_5__d),
        .clk(clock)
    );
    wire _firFilter__clock;
    wire _firFilter__reset;
    wire [9:0] _firFilter__io_input;
    wire [19:0] _firFilter__io_output;
    wire [9:0] _firFilter__io_taps_0;
    wire [9:0] _firFilter__io_taps_1;
    wire [9:0] _firFilter__io_taps_2;
    TransposedStreamingFIR firFilter (
        .clock(_firFilter__clock),
        .reset(_firFilter__reset),
        .io_input(_firFilter__io_input),
        .io_output(_firFilter__io_output),
        .io_taps_0(_firFilter__io_taps_0),
        .io_taps_1(_firFilter__io_taps_1),
        .io_taps_2(_firFilter__io_taps_2)
    );
    assign _delays_1__d = io_input;
    assign _delays_2__d = _delays_1__q;
    assign _delays_3__d = _delays_2__q;
    assign _delays_4__d = _delays_3__q;
    assign _delays_5__d = _delays_4__q;
    assign _firFilter__clock = clock;
    assign _firFilter__io_input = io_input;
    assign _firFilter__io_taps_0 = _delays_5__q;
    assign _firFilter__io_taps_1 = _delays_4__q;
    assign _firFilter__io_taps_2 = _delays_3__q;
    assign _firFilter__reset = reset;
    assign io_output = _firFilter__io_output;
endmodule //StreamingAutocorrelator
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module TransposedStreamingFIR(
    input clock,
    input reset,
    input [9:0] io_input,
    output [19:0] io_output,
    input [9:0] io_taps_0,
    input [9:0] io_taps_1,
    input [9:0] io_taps_2
);
    wire [19:0] products_0;
    MUL2_SIGNED #(.width_a(10), .width_b(10)) s_mul2_1 (
        .y(products_0),
        .a(io_input),
        .b(io_taps_2)
    );
    wire [19:0] products_1;
    MUL2_SIGNED #(.width_a(10), .width_b(10)) s_mul2_2 (
        .y(products_1),
        .a(io_input),
        .b(io_taps_1)
    );
    wire [19:0] products_2;
    MUL2_SIGNED #(.width_a(10), .width_b(10)) s_mul2_3 (
        .y(products_2),
        .a(io_input),
        .b(io_taps_0)
    );
    wire [19:0] _last__q;
    wire [19:0] _last__d;
    DFF_POSCLK #(.width(20)) last (
        .q(_last__q),
        .d(_last__d),
        .clk(clock)
    );
    wire [19:0] __T_14__q;
    wire [19:0] __T_14__d;
    DFF_POSCLK #(.width(20)) _T_14 (
        .q(__T_14__q),
        .d(__T_14__d),
        .clk(clock)
    );
    wire [20:0] _T_15;
    ADD_SIGNED #(.width(20)) s_add_4 (
        .y(_T_15),
        .a(__T_14__q),
        .b(products_1)
    );
    wire [19:0] _T_16;
    TAIL #(.width(21), .n(1)) tail_5 (
        .y(_T_16),
        .in(_T_15)
    );
    wire [19:0] _T_17;
    ASSINT #(.width(20)) assint_6 (
        .y(_T_17),
        .in(_T_16)
    );
    wire [19:0] __T_19__q;
    wire [19:0] __T_19__d;
    DFF_POSCLK #(.width(20)) _T_19 (
        .q(__T_19__q),
        .d(__T_19__d),
        .clk(clock)
    );
    wire [20:0] _T_20;
    ADD_SIGNED #(.width(20)) s_add_7 (
        .y(_T_20),
        .a(__T_19__q),
        .b(products_2)
    );
    wire [19:0] _T_21;
    TAIL #(.width(21), .n(1)) tail_8 (
        .y(_T_21),
        .in(_T_20)
    );
    wire [19:0] _T_22;
    ASSINT #(.width(20)) assint_9 (
        .y(_T_22),
        .in(_T_21)
    );
    assign __T_14__d = products_0;
    assign __T_19__d = _T_17;
    assign io_output = _last__q;
    assign _last__d = _T_22;
endmodule //TransposedStreamingFIR
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
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
