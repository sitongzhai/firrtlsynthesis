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
    wire [15:0] _in_reg__q;
    wire [15:0] _in_reg__d;
    DFF_POSCLK #(.width(16)) in_reg (
        .q(_in_reg__q),
        .d(_in_reg__d),
        .clk(clock)
    );
    wire _T_19;
    EQ_UNSIGNED #(.width(1)) u_eq_1 (
        .y(_T_19),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_21;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_21),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    BITWISEAND #(.width(1)) bitwiseand_3 (
        .y(_T_22),
        .a(io_in_valid),
        .b(_T_21)
    );
    wire [15:0] _GEN_0;
    MUX_UNSIGNED #(.width(16)) u_mux_4 (
        .y(_GEN_0),
        .sel(_T_22),
        .a(io_in_bits),
        .b(_in_reg__q)
    );
    wire _GEN_1;
    MUX_UNSIGNED #(.width(1)) u_mux_5 (
        .y(_GEN_1),
        .sel(_T_22),
        .a(1'h1),
        .b(_busy__q)
    );
    wire [15:0] _wait_counter__q;
    wire [15:0] _wait_counter__d;
    DFF_POSCLK #(.width(16)) wait_counter (
        .q(_wait_counter__q),
        .d(_wait_counter__d),
        .clk(clock)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_27),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_28;
    BITWISEAND #(.width(1)) bitwiseand_7 (
        .y(_T_28),
        .a(io_in_valid),
        .b(_T_27)
    );
    wire [15:0] _GEN_2;
    wire [15:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_8 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_9 (
        .y(_GEN_2),
        .sel(_T_28),
        .a(_WTEMP_0),
        .b(_wait_counter__q)
    );
    wire _T_30;
    wire [15:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_10 (
        .y(_WTEMP_1),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_11 (
        .y(_T_30),
        .a(_wait_counter__q),
        .b(_WTEMP_1)
    );
    wire [16:0] _T_33;
    wire [15:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_12 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(16)) u_add_13 (
        .y(_T_33),
        .a(_wait_counter__q),
        .b(_WTEMP_2)
    );
    wire [15:0] _T_34;
    TAIL #(.width(17), .n(1)) tail_14 (
        .y(_T_34),
        .in(_T_33)
    );
    wire [15:0] _GEN_3;
    wire [15:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_15 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_16 (
        .y(_GEN_3),
        .sel(_T_30),
        .a(_in_reg__q),
        .b(_WTEMP_3)
    );
    wire [15:0] _GEN_4;
    MUX_UNSIGNED #(.width(16)) u_mux_17 (
        .y(_GEN_4),
        .sel(_T_30),
        .a(_GEN_2),
        .b(_T_34)
    );
    wire [15:0] _GEN_5;
    assign _GEN_5 = _GEN_3;
    wire [15:0] _GEN_6;
    MUX_UNSIGNED #(.width(16)) u_mux_18 (
        .y(_GEN_6),
        .sel(_busy__q),
        .a(_GEN_4),
        .b(_GEN_2)
    );
    wire _T_35;
    EQ_UNSIGNED #(.width(16)) u_eq_19 (
        .y(_T_35),
        .a(io_out_bits),
        .b(_in_reg__q)
    );
    wire _T_36;
    wire [15:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(3), .n(16)) u_pad_20 (
        .y(_WTEMP_4),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_21 (
        .y(_T_36),
        .a(_wait_counter__q),
        .b(_WTEMP_4)
    );
    wire _T_37;
    BITWISEAND #(.width(1)) bitwiseand_22 (
        .y(_T_37),
        .a(_T_35),
        .b(_T_36)
    );
    wire _T_38;
    BITWISEAND #(.width(1)) bitwiseand_23 (
        .y(_T_38),
        .a(_T_37),
        .b(_busy__q)
    );
    wire _T_39;
    BITS #(.width(1), .high(0), .low(0)) bits_24 (
        .y(_T_39),
        .in(reset)
    );
    wire _T_41;
    EQ_UNSIGNED #(.width(1)) u_eq_25 (
        .y(_T_41),
        .a(_T_39),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_26 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_1)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_27 (
        .y(_in_reg__d),
        .sel(reset),
        .a(16'h0),
        .b(_GEN_0)
    );
    assign io_in_ready = _T_19;
    assign io_out_bits = _GEN_5;
    assign io_out_valid = _T_38;
    MUX_UNSIGNED #(.width(16)) u_mux_28 (
        .y(_wait_counter__d),
        .sel(reset),
        .a(16'h0),
        .b(_GEN_6)
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
