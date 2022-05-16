module AbsCircuitWithDelays(
    input clock,
    input reset,
    input [15:0] io_in,
    output [15:0] io_outContextAbs
);
    wire [15:0] __T_4__q;
    wire [15:0] __T_4__d;
    DFF_POSCLK #(.width(16)) _T_4 (
        .q(__T_4__q),
        .d(__T_4__d),
        .clk(clock)
    );
    wire [15:0] __T_6__q;
    wire [15:0] __T_6__d;
    DFF_POSCLK #(.width(16)) _T_6 (
        .q(__T_6__q),
        .d(__T_6__d),
        .clk(clock)
    );
    wire [15:0] __T_8__q;
    wire [15:0] __T_8__d;
    DFF_POSCLK #(.width(16)) _T_8 (
        .q(__T_8__q),
        .d(__T_8__d),
        .clk(clock)
    );
    wire _T_9;
    BITS #(.width(16), .high(15), .low(15)) bits_1 (
        .y(_T_9),
        .in(__T_8__q)
    );
    wire _node_0;
    ASSINT #(.width(1)) assint_2 (
        .y(_node_0),
        .in(1'h0)
    );
    wire [8:0] _node_1;
    SHL_SIGNED #(.width(1), .n(8)) s_shl_3 (
        .y(_node_1),
        .in(_node_0)
    );
    wire [16:0] _T_11;
    wire [15:0] _WTEMP_0;
    PAD_SIGNED #(.width(9), .n(16)) s_pad_4 (
        .y(_WTEMP_0),
        .in(_node_1)
    );
    SUB_SIGNED #(.width(16)) s_sub_5 (
        .y(_T_11),
        .a(_WTEMP_0),
        .b(io_in)
    );
    wire [16:0] __T_14__q;
    wire [16:0] __T_14__d;
    DFF_POSCLK #(.width(17)) _T_14 (
        .q(__T_14__q),
        .d(__T_14__d),
        .clk(clock)
    );
    wire [16:0] __T_16__q;
    wire [16:0] __T_16__d;
    DFF_POSCLK #(.width(17)) _T_16 (
        .q(__T_16__q),
        .d(__T_16__d),
        .clk(clock)
    );
    wire [16:0] __T_18__q;
    wire [16:0] __T_18__d;
    DFF_POSCLK #(.width(17)) _T_18 (
        .q(__T_18__q),
        .d(__T_18__d),
        .clk(clock)
    );
    wire [15:0] __T_21__q;
    wire [15:0] __T_21__d;
    DFF_POSCLK #(.width(16)) _T_21 (
        .q(__T_21__q),
        .d(__T_21__d),
        .clk(clock)
    );
    wire [15:0] __T_23__q;
    wire [15:0] __T_23__d;
    DFF_POSCLK #(.width(16)) _T_23 (
        .q(__T_23__q),
        .d(__T_23__d),
        .clk(clock)
    );
    wire [15:0] __T_25__q;
    wire [15:0] __T_25__d;
    DFF_POSCLK #(.width(16)) _T_25 (
        .q(__T_25__q),
        .d(__T_25__d),
        .clk(clock)
    );
    wire [16:0] _T_27;
    wire [16:0] _WTEMP_1;
    PAD_SIGNED #(.width(16), .n(17)) s_pad_6 (
        .y(_WTEMP_1),
        .in(__T_25__q)
    );
    MUX_SIGNED #(.width(17)) s_mux_7 (
        .y(_T_27),
        .sel(_T_9),
        .a(__T_18__q),
        .b(_WTEMP_1)
    );
    wire [15:0] _T_28;
    ASUINT #(.width(16)) asuint_8 (
        .y(_T_28),
        .in(io_in)
    );
    wire [16:0] _T_29;
    ASUINT #(.width(17)) asuint_9 (
        .y(_T_29),
        .in(_T_27)
    );
    wire _T_30;
    BITS #(.width(1), .high(0), .low(0)) bits_10 (
        .y(_T_30),
        .in(reset)
    );
    wire _T_32;
    EQ_UNSIGNED #(.width(1)) u_eq_11 (
        .y(_T_32),
        .a(_T_30),
        .b(1'h0)
    );
    MUX_SIGNED #(.width(17)) s_mux_12 (
        .y(__T_14__d),
        .sel(1'h1),
        .a(_T_11),
        .b(__T_14__q)
    );
    MUX_SIGNED #(.width(17)) s_mux_13 (
        .y(__T_16__d),
        .sel(1'h1),
        .a(__T_14__q),
        .b(__T_16__q)
    );
    MUX_SIGNED #(.width(17)) s_mux_14 (
        .y(__T_18__d),
        .sel(1'h1),
        .a(__T_16__q),
        .b(__T_18__q)
    );
    MUX_SIGNED #(.width(16)) s_mux_15 (
        .y(__T_21__d),
        .sel(1'h1),
        .a(io_in),
        .b(__T_21__q)
    );
    MUX_SIGNED #(.width(16)) s_mux_16 (
        .y(__T_23__d),
        .sel(1'h1),
        .a(__T_21__q),
        .b(__T_23__q)
    );
    MUX_SIGNED #(.width(16)) s_mux_17 (
        .y(__T_25__d),
        .sel(1'h1),
        .a(__T_23__q),
        .b(__T_25__q)
    );
    MUX_SIGNED #(.width(16)) s_mux_18 (
        .y(__T_4__d),
        .sel(1'h1),
        .a(io_in),
        .b(__T_4__q)
    );
    MUX_SIGNED #(.width(16)) s_mux_19 (
        .y(__T_6__d),
        .sel(1'h1),
        .a(__T_4__q),
        .b(__T_6__q)
    );
    MUX_SIGNED #(.width(16)) s_mux_20 (
        .y(__T_8__d),
        .sel(1'h1),
        .a(__T_6__q),
        .b(__T_8__q)
    );
    wire [15:0] _WTEMP_2;
    BITS #(.width(17), .high(15), .low(0)) bits_21 (
        .y(_WTEMP_2),
        .in(_T_27)
    );
    ASSINT #(.width(16)) assint_22 (
        .y(io_outContextAbs),
        .in(_WTEMP_2)
    );
endmodule //AbsCircuitWithDelays
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
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
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
