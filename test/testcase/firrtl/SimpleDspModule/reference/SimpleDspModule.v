module SimpleDspModule(
    input clock,
    input reset,
    input [15:0] io_x,
    input [15:0] io_y,
    output [15:0] io_z
);
    wire [16:0] _T_5;
    ADD_SIGNED #(.width(16)) s_add_1 (
        .y(_T_5),
        .a(io_x),
        .b(io_y)
    );
    wire [16:0] __T_8__q;
    wire [16:0] __T_8__d;
    DFF_POSCLK #(.width(17)) _T_8 (
        .q(__T_8__q),
        .d(__T_8__d),
        .clk(clock)
    );
    wire [16:0] __T_10__q;
    wire [16:0] __T_10__d;
    DFF_POSCLK #(.width(17)) _T_10 (
        .q(__T_10__q),
        .d(__T_10__d),
        .clk(clock)
    );
    wire [16:0] __T_12__q;
    wire [16:0] __T_12__d;
    DFF_POSCLK #(.width(17)) _T_12 (
        .q(__T_12__q),
        .d(__T_12__d),
        .clk(clock)
    );
    MUX_SIGNED #(.width(17)) s_mux_2 (
        .y(__T_10__d),
        .sel(1'h1),
        .a(__T_8__q),
        .b(__T_10__q)
    );
    MUX_SIGNED #(.width(17)) s_mux_3 (
        .y(__T_12__d),
        .sel(1'h1),
        .a(__T_10__q),
        .b(__T_12__q)
    );
    MUX_SIGNED #(.width(17)) s_mux_4 (
        .y(__T_8__d),
        .sel(1'h1),
        .a(_T_5),
        .b(__T_8__q)
    );
    wire [15:0] _WTEMP_0;
    BITS #(.width(17), .high(15), .low(0)) bits_5 (
        .y(_WTEMP_0),
        .in(__T_12__q)
    );
    ASSINT #(.width(16)) assint_6 (
        .y(io_z),
        .in(_WTEMP_0)
    );
endmodule //SimpleDspModule
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
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
