module VendingMachineSwitch(
    input clock,
    input reset,
    input io_nickel,
    input io_dime,
    output io_valid
);
    wire [2:0] _state__q;
    wire [2:0] _state__d;
    DFF_POSCLK #(.width(3)) state (
        .q(_state__q),
        .d(_state__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(3)) u_mux_1 (
        .y(_state__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_0)
    );
    wire _T_12;
    EQ_UNSIGNED #(.width(3)) u_eq_2 (
        .y(_T_12),
        .a(3'h0),
        .b(_state__q)
    );
    wire [2:0] _node_0;
    MUX_UNSIGNED #(.width(3)) u_mux_3 (
        .y(_node_0),
        .sel(io_nickel),
        .a(3'h1),
        .b(_state__q)
    );
    wire _T_13;
    EQ_UNSIGNED #(.width(3)) u_eq_4 (
        .y(_T_13),
        .a(3'h1),
        .b(_state__q)
    );
    wire [2:0] _node_1;
    MUX_UNSIGNED #(.width(3)) u_mux_5 (
        .y(_node_1),
        .sel(io_nickel),
        .a(3'h2),
        .b(_state__q)
    );
    wire _T_14;
    EQ_UNSIGNED #(.width(3)) u_eq_6 (
        .y(_T_14),
        .a(3'h2),
        .b(_state__q)
    );
    wire [2:0] _node_2;
    MUX_UNSIGNED #(.width(3)) u_mux_7 (
        .y(_node_2),
        .sel(io_nickel),
        .a(3'h3),
        .b(_state__q)
    );
    wire _T_15;
    EQ_UNSIGNED #(.width(3)) u_eq_8 (
        .y(_T_15),
        .a(3'h3),
        .b(_state__q)
    );
    wire [2:0] _node_3;
    MUX_UNSIGNED #(.width(3)) u_mux_9 (
        .y(_node_3),
        .sel(io_nickel),
        .a(3'h4),
        .b(_state__q)
    );
    wire _T_16;
    EQ_UNSIGNED #(.width(3)) u_eq_10 (
        .y(_T_16),
        .a(3'h4),
        .b(_state__q)
    );
    wire [2:0] _node_4;
    MUX_UNSIGNED #(.width(3)) u_mux_11 (
        .y(_node_4),
        .sel(io_dime),
        .a(3'h4),
        .b(_node_3)
    );
    wire [2:0] _node_5;
    MUX_UNSIGNED #(.width(3)) u_mux_12 (
        .y(_node_5),
        .sel(_T_16),
        .a(3'h0),
        .b(_state__q)
    );
    wire [2:0] _node_6;
    MUX_UNSIGNED #(.width(3)) u_mux_13 (
        .y(_node_6),
        .sel(io_dime),
        .a(3'h4),
        .b(_node_2)
    );
    wire [2:0] _node_7;
    MUX_UNSIGNED #(.width(3)) u_mux_14 (
        .y(_node_7),
        .sel(_T_15),
        .a(_node_4),
        .b(_node_5)
    );
    wire [2:0] _node_8;
    MUX_UNSIGNED #(.width(3)) u_mux_15 (
        .y(_node_8),
        .sel(io_dime),
        .a(3'h3),
        .b(_node_1)
    );
    wire [2:0] _node_9;
    MUX_UNSIGNED #(.width(3)) u_mux_16 (
        .y(_node_9),
        .sel(_T_14),
        .a(_node_6),
        .b(_node_7)
    );
    wire [2:0] _node_10;
    MUX_UNSIGNED #(.width(3)) u_mux_17 (
        .y(_node_10),
        .sel(io_dime),
        .a(3'h2),
        .b(_node_0)
    );
    wire [2:0] _node_11;
    MUX_UNSIGNED #(.width(3)) u_mux_18 (
        .y(_node_11),
        .sel(_T_13),
        .a(_node_8),
        .b(_node_9)
    );
    wire _T_17;
    EQ_UNSIGNED #(.width(3)) u_eq_19 (
        .y(_T_17),
        .a(_state__q),
        .b(3'h4)
    );
    assign io_valid = _T_17;
    MUX_UNSIGNED #(.width(3)) u_mux_20 (
        .y(_WTEMP_0),
        .sel(_T_12),
        .a(_node_10),
        .b(_node_11)
    );
endmodule //VendingMachineSwitch
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
