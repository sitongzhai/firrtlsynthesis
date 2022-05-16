module HelloTester(
    input clock,
    input reset
);
    wire _device_under_test__clock;
    wire _device_under_test__reset;
    wire [7:0] _device_under_test__io_out;
    Hello device_under_test (
        .clock(_device_under_test__clock),
        .reset(_device_under_test__reset),
        .io_out(_device_under_test__io_out)
    );
    wire _value__q;
    wire _value__d;
    DFF_POSCLK #(.width(1)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_2 (
        .y(_value__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire __T_6__q;
    wire __T_6__d;
    DFF_POSCLK #(.width(1)) _T_6 (
        .q(__T_6__q),
        .d(__T_6__d),
        .clk(clock)
    );
    wire _WTEMP_1;
    MUX_UNSIGNED #(.width(1)) u_mux_3 (
        .y(__T_6__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_1)
    );
    wire _T_8;
    EQ_UNSIGNED #(.width(1)) u_eq_4 (
        .y(_T_8),
        .a(__T_6__q),
        .b(1'h0)
    );
    wire [7:0] _T_12;
    wire [7:0] _T_16;
    wire [7:0] _T_19_0;
    wire [7:0] _T_19_1;
    wire _T_28_0;
    wire _T_28_1;
    wire _node_0;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(_node_0),
        .a(1'd0),
        .b(_value__q)
    );
    wire [7:0] _node_1;
    assign _node_1 = _T_19_0;
    wire _node_2;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_node_2),
        .a(1'd1),
        .b(_value__q)
    );
    wire [7:0] _node_3;
    MUX_UNSIGNED #(.width(8)) u_mux_7 (
        .y(_node_3),
        .sel(_node_2),
        .a(_T_19_1),
        .b(_node_1)
    );
    wire _T_35;
    EQ_UNSIGNED #(.width(8)) u_eq_8 (
        .y(_T_35),
        .a(_device_under_test__io_out),
        .b(_node_3)
    );
    wire _T_37;
    EQ_UNSIGNED #(.width(1)) u_eq_9 (
        .y(_T_37),
        .a(_T_35),
        .b(1'h0)
    );
    wire _T_40;
    EQ_UNSIGNED #(.width(1)) u_eq_10 (
        .y(_T_40),
        .a(reset),
        .b(1'h0)
    );
    wire _T_42;
    BITWISEOR #(.width(1)) bitwiseor_11 (
        .y(_T_42),
        .a(1'h0),
        .b(reset)
    );
    wire _T_44;
    EQ_UNSIGNED #(.width(1)) u_eq_12 (
        .y(_T_44),
        .a(_T_42),
        .b(1'h0)
    );
    wire _T_46;
    EQ_UNSIGNED #(.width(1)) u_eq_13 (
        .y(_T_46),
        .a(reset),
        .b(1'h0)
    );
    wire _T_48;
    EQ_UNSIGNED #(.width(1)) u_eq_14 (
        .y(_T_48),
        .a(_value__q),
        .b(1'h1)
    );
    wire [1:0] _T_50;
    ADD_UNSIGNED #(.width(1)) u_add_15 (
        .y(_T_50),
        .a(_value__q),
        .b(1'h1)
    );
    wire _T_51;
    TAIL #(.width(2), .n(1)) tail_16 (
        .y(_T_51),
        .in(_T_50)
    );
    wire _T_53;
    EQ_UNSIGNED #(.width(1)) u_eq_17 (
        .y(_T_53),
        .a(reset),
        .b(1'h0)
    );
    wire _T_56;
    EQ_UNSIGNED #(.width(1)) u_eq_18 (
        .y(_T_56),
        .a(reset),
        .b(1'h0)
    );
    wire _node_4;
    MUX_UNSIGNED #(.width(1)) u_mux_19 (
        .y(_node_4),
        .sel(_T_48),
        .a(1'h1),
        .b(__T_6__q)
    );
    PAD_UNSIGNED #(.width(1), .n(8)) u_pad_20 (
        .y(_T_12),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(6), .n(8)) u_pad_21 (
        .y(_T_16),
        .in(6'h2A)
    );
    assign _T_19_0 = _T_12;
    assign _T_19_1 = _T_16;
    assign _T_28_0 = 1'h0;
    assign _T_28_1 = 1'h1;
    MUX_UNSIGNED #(.width(1)) u_mux_22 (
        .y(_WTEMP_1),
        .sel(_T_8),
        .a(_node_4),
        .b(__T_6__q)
    );
    assign _device_under_test__clock = clock;
    assign _device_under_test__reset = reset;
    MUX_UNSIGNED #(.width(1)) u_mux_23 (
        .y(_WTEMP_0),
        .sel(_T_8),
        .a(_T_51),
        .b(_value__q)
    );
endmodule //HelloTester
module Hello(
    input clock,
    input reset,
    output [7:0] io_out
);
    PAD_UNSIGNED #(.width(6), .n(8)) u_pad_1 (
        .y(io_out),
        .in(6'h2A)
    );
endmodule //Hello
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
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
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
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
