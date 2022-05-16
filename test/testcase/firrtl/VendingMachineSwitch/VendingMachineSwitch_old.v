`include "macro_cells.v"
// NOTE_BEGIN top-module : VendingMachineSwitch NOTE_END
module VendingMachineSwitch(
    input clock,
    input reset,
    input io_nickel,
    input io_dime,
    output io_valid
);
    wire [2:0] _state__q;
    wire [2:0] _state__d;
    DFF #(3) state (
        .q(_state__q),
        .d(_state__d),
        .clk(clock)
    );
    wire _T_12;
    EQ_UNSIGNED #(3) u_eq_1 (
        .y(_T_12),
        .a(3'h0),
        .b(_state__q)
    );
    wire _T_13;
    EQ_UNSIGNED #(3) u_eq_2 (
        .y(_T_13),
        .a(3'h1),
        .b(_state__q)
    );
    wire _T_14;
    EQ_UNSIGNED #(3) u_eq_3 (
        .y(_T_14),
        .a(3'h2),
        .b(_state__q)
    );
    wire _T_15;
    EQ_UNSIGNED #(3) u_eq_4 (
        .y(_T_15),
        .a(3'h3),
        .b(_state__q)
    );
    wire _T_16;
    EQ_UNSIGNED #(3) u_eq_5 (
        .y(_T_16),
        .a(3'h4),
        .b(_state__q)
    );
    wire [2:0] _node_0;
    MUX #(3) mux_6 (
        .y(_node_0),
        .sel(io_nickel),
        .a(3'h1),
        .b(_state__q)
    );
    wire [2:0] _node_1;
    MUX #(3) mux_7 (
        .y(_node_1),
        .sel(io_dime),
        .a(3'h2),
        .b(_node_0)
    );
    wire [2:0] _node_2;
    MUX #(3) mux_8 (
        .y(_node_2),
        .sel(io_nickel),
        .a(3'h2),
        .b(_state__q)
    );
    wire [2:0] _node_3;
    MUX #(3) mux_9 (
        .y(_node_3),
        .sel(io_dime),
        .a(3'h3),
        .b(_node_2)
    );
    wire [2:0] _node_4;
    MUX #(3) mux_10 (
        .y(_node_4),
        .sel(io_nickel),
        .a(3'h3),
        .b(_state__q)
    );
    wire [2:0] _node_5;
    MUX #(3) mux_11 (
        .y(_node_5),
        .sel(io_dime),
        .a(3'h4),
        .b(_node_4)
    );
    wire [2:0] _node_6;
    MUX #(3) mux_12 (
        .y(_node_6),
        .sel(io_nickel),
        .a(3'h4),
        .b(_state__q)
    );
    wire [2:0] _node_7;
    MUX #(3) mux_13 (
        .y(_node_7),
        .sel(io_dime),
        .a(3'h4),
        .b(_node_6)
    );
    wire [2:0] _node_8;
    MUX #(3) mux_14 (
        .y(_node_8),
        .sel(_T_16),
        .a(3'h0),
        .b(_state__q)
    );
    wire [2:0] _node_9;
    MUX #(3) mux_15 (
        .y(_node_9),
        .sel(_T_15),
        .a(_node_7),
        .b(_node_8)
    );
    wire [2:0] _node_10;
    MUX #(3) mux_16 (
        .y(_node_10),
        .sel(_T_14),
        .a(_node_5),
        .b(_node_9)
    );
    wire [2:0] _node_11;
    MUX #(3) mux_17 (
        .y(_node_11),
        .sel(_T_13),
        .a(_node_3),
        .b(_node_10)
    );
    wire [2:0] _node_12;
    MUX #(3) mux_18 (
        .y(_node_12),
        .sel(_T_12),
        .a(_node_1),
        .b(_node_11)
    );
    wire _T_17;
    EQ_UNSIGNED #(3) u_eq_19 (
        .y(_T_17),
        .a(_state__q),
        .b(3'h4)
    );
    assign io_valid = _T_17;
    MUX #(3) mux_20 (
        .y(_state__d),
        .sel(reset),
        .a(3'h0),
        .b(_node_12)
    );
endmodule // VendingMachineSwitch

