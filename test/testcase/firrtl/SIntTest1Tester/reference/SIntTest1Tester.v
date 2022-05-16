module SIntTest1Tester(
    input clock,
    input reset
);
    wire [3:0] _value__q;
    wire [3:0] _value__d;
    DFF_POSCLK #(.width(4)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(4)) u_mux_1 (
        .y(_value__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_0)
    );
    wire _T_6;
    EQ_UNSIGNED #(.width(4)) u_eq_2 (
        .y(_T_6),
        .a(_value__q),
        .b(4'hA)
    );
    wire [4:0] _T_8;
    wire [3:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_4 (
        .y(_T_8),
        .a(_value__q),
        .b(_WTEMP_1)
    );
    wire [3:0] _T_9;
    TAIL #(.width(5), .n(1)) tail_5 (
        .y(_T_9),
        .in(_T_8)
    );
    wire [3:0] _node_0;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_6 (
        .y(_WTEMP_2),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_7 (
        .y(_node_0),
        .sel(_T_6),
        .a(_WTEMP_2),
        .b(_T_9)
    );
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(done),
        .a(1'h1),
        .b(_T_6)
    );
    wire _T_12;
    EQ_UNSIGNED #(.width(1)) u_eq_9 (
        .y(_T_12),
        .a(reset),
        .b(1'h0)
    );
    wire _dut__clock;
    wire _dut__reset;
    wire [5:0] _dut__io_in1;
    wire [5:0] _dut__io_in2;
    wire [7:0] _dut__io_out;
    SIntTest1 dut (
        .clock(_dut__clock),
        .reset(_dut__reset),
        .io_in1(_dut__io_in1),
        .io_in2(_dut__io_in2),
        .io_out(_dut__io_out)
    );
    wire _T_16;
    wire [7:0] _WTEMP_3;
    PAD_SIGNED #(.width(5), .n(8)) s_pad_14 (
        .y(_WTEMP_3),
        .in(5'sh8)
    );
    EQ_SIGNED #(.width(8)) s_eq_15 (
        .y(_T_16),
        .a(_dut__io_out),
        .b(_WTEMP_3)
    );
    wire _T_17;
    BITWISEOR #(.width(1)) bitwiseor_16 (
        .y(_T_17),
        .a(_T_16),
        .b(reset)
    );
    wire _T_19;
    EQ_UNSIGNED #(.width(1)) u_eq_17 (
        .y(_T_19),
        .a(_T_17),
        .b(1'h0)
    );
    wire _T_21;
    EQ_UNSIGNED #(.width(1)) u_eq_18 (
        .y(_T_21),
        .a(reset),
        .b(1'h0)
    );
    assign _dut__clock = clock;
    PAD_SIGNED #(.width(4), .n(6)) s_pad_19 (
        .y(_dut__io_in1),
        .in(4'sh4)
    );
    PAD_SIGNED #(.width(4), .n(6)) s_pad_20 (
        .y(_dut__io_in2),
        .in(4'sh4)
    );
    assign _dut__reset = reset;
    MUX_UNSIGNED #(.width(4)) u_mux_21 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_node_0),
        .b(_value__q)
    );
endmodule //SIntTest1Tester
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module SIntTest1(
    input clock,
    input reset,
    input [5:0] io_in1,
    input [5:0] io_in2,
    output [7:0] io_out
);
    wire [6:0] _T_5;
    ADD_SIGNED #(.width(6)) s_add_10 (
        .y(_T_5),
        .a(io_in1),
        .b(io_in2)
    );
    wire [5:0] _T_6;
    TAIL #(.width(7), .n(1)) tail_11 (
        .y(_T_6),
        .in(_T_5)
    );
    wire [5:0] _T_7;
    ASSINT #(.width(6)) assint_12 (
        .y(_T_7),
        .in(_T_6)
    );
    PAD_SIGNED #(.width(6), .n(8)) s_pad_13 (
        .y(io_out),
        .in(_T_7)
    );
endmodule //SIntTest1
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
