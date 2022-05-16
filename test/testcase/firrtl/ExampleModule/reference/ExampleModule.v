module ExampleModule(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [15:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [15:0] io_out_bits
);
    wire _busy__q;
    wire _busy__d;
    DFF_POSCLK #(.width(1)) busy (
        .q(_busy__q),
        .d(_busy__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire [15:0] _in_reg__q;
    wire [15:0] _in_reg__d;
    DFF_POSCLK #(.width(16)) in_reg (
        .q(_in_reg__q),
        .d(_in_reg__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(16)) u_mux_2 (
        .y(_in_reg__d),
        .sel(reset),
        .a(16'h0),
        .b(_WTEMP_1)
    );
    wire _T_19;
    EQ_UNSIGNED #(.width(1)) u_eq_3 (
        .y(_T_19),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_21;
    EQ_UNSIGNED #(.width(1)) u_eq_4 (
        .y(_T_21),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    BITWISEAND #(.width(1)) bitwiseand_5 (
        .y(_T_22),
        .a(io_in_valid),
        .b(_T_21)
    );
    wire [15:0] _wait_counter__q;
    wire [15:0] _wait_counter__d;
    DFF_POSCLK #(.width(16)) wait_counter (
        .q(_wait_counter__q),
        .d(_wait_counter__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(16)) u_mux_6 (
        .y(_wait_counter__d),
        .sel(reset),
        .a(16'h0),
        .b(_WTEMP_2)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_7 (
        .y(_T_27),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_28;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(_T_28),
        .a(io_in_valid),
        .b(_T_27)
    );
    wire _T_30;
    wire [15:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_9 (
        .y(_WTEMP_3),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_10 (
        .y(_T_30),
        .a(_wait_counter__q),
        .b(_WTEMP_3)
    );
    wire _T_32;
    EQ_UNSIGNED #(.width(1)) u_eq_11 (
        .y(_T_32),
        .a(_T_30),
        .b(1'h0)
    );
    wire [16:0] _T_35;
    wire [15:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_12 (
        .y(_WTEMP_4),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_13 (
        .y(_T_35),
        .a(_wait_counter__q),
        .b(_WTEMP_4)
    );
    wire [15:0] _T_36;
    TAIL #(.width(17), .n(1)) tail_14 (
        .y(_T_36),
        .in(_T_35)
    );
    wire [15:0] _node_0;
    assign _node_0 = _in_reg__q;
    wire [15:0] _node_1;
    wire [15:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_15 (
        .y(_WTEMP_5),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_16 (
        .y(_node_1),
        .sel(_T_28),
        .a(_WTEMP_5),
        .b(_wait_counter__q)
    );
    wire [15:0] _node_2;
    wire [15:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_17 (
        .y(_WTEMP_6),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_18 (
        .y(_node_2),
        .sel(_T_32),
        .a(_WTEMP_6),
        .b(_node_0)
    );
    wire [15:0] _node_3;
    MUX_UNSIGNED #(.width(16)) u_mux_19 (
        .y(_node_3),
        .sel(_T_32),
        .a(_T_36),
        .b(_node_1)
    );
    wire [15:0] _node_4;
    wire [15:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_20 (
        .y(_WTEMP_7),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_21 (
        .y(_node_4),
        .sel(_T_28),
        .a(_WTEMP_7),
        .b(_wait_counter__q)
    );
    wire _T_37;
    EQ_UNSIGNED #(.width(16)) u_eq_22 (
        .y(_T_37),
        .a(io_out_bits),
        .b(_in_reg__q)
    );
    wire _T_38;
    wire [15:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_23 (
        .y(_WTEMP_8),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_24 (
        .y(_T_38),
        .a(_wait_counter__q),
        .b(_WTEMP_8)
    );
    wire _T_39;
    BITWISEAND #(.width(1)) bitwiseand_25 (
        .y(_T_39),
        .a(_T_37),
        .b(_T_38)
    );
    wire _T_40;
    BITWISEAND #(.width(1)) bitwiseand_26 (
        .y(_T_40),
        .a(_T_39),
        .b(_busy__q)
    );
    wire _T_42;
    EQ_UNSIGNED #(.width(1)) u_eq_27 (
        .y(_T_42),
        .a(reset),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_28 (
        .y(_WTEMP_0),
        .sel(_T_22),
        .a(1'h1),
        .b(_busy__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_29 (
        .y(_WTEMP_1),
        .sel(_T_22),
        .a(io_in_bits),
        .b(_in_reg__q)
    );
    assign io_in_ready = _T_19;
    assign io_out_bits = _node_2;
    assign io_out_valid = _T_40;
    MUX_UNSIGNED #(.width(16)) u_mux_30 (
        .y(_WTEMP_2),
        .sel(_busy__q),
        .a(_node_3),
        .b(_node_4)
    );
endmodule //ExampleModule
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
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
