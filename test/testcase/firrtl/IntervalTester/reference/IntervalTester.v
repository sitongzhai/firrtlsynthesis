module IntervalTester(
    input clock,
    input reset
);
    wire [3:0] _cycle__q;
    wire [3:0] _cycle__d;
    DFF_POSCLK #(.width(4)) cycle (
        .q(_cycle__q),
        .d(_cycle__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(4)) u_mux_1 (
        .y(_cycle__d),
        .sel(reset),
        .a(4'h0),
        .b(_WTEMP_0)
    );
    wire done;
    wire wrap_wrap;
    EQ_UNSIGNED #(.width(4)) u_eq_2 (
        .y(wrap_wrap),
        .a(_cycle__q),
        .b(4'hA)
    );
    wire [4:0] _wrap_value_T;
    wire [3:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_3 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_4 (
        .y(_wrap_value_T),
        .a(_cycle__q),
        .b(_WTEMP_1)
    );
    wire [3:0] _wrap_value_T_1;
    TAIL #(.width(5), .n(1)) tail_5 (
        .y(_wrap_value_T_1),
        .in(_wrap_value_T)
    );
    wire [3:0] _node_0;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_6 (
        .y(_WTEMP_2),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_7 (
        .y(_node_0),
        .sel(wrap_wrap),
        .a(_WTEMP_2),
        .b(_wrap_value_T_1)
    );
    wire _T;
    BITS #(.width(1), .high(0), .low(0)) bits_8 (
        .y(_T),
        .in(reset)
    );
    wire _T_1;
    EQ_UNSIGNED #(.width(1)) u_eq_9 (
        .y(_T_1),
        .a(_T),
        .b(1'h0)
    );
    wire _dut__clock;
    wire _dut__reset;
    wire [4:0] _dut__io_in1;
    wire [7:0] _dut__io_in2;
    wire [8:0] _dut__io_out;
    IntervalTest1 dut (
        .clock(_dut__clock),
        .reset(_dut__reset),
        .io_in1(_dut__io_in1),
        .io_in2(_dut__io_in2),
        .io_out(_dut__io_out)
    );
    wire [3:0] _node_2;
    ASSINT #(.width(4)) assint_12 (
        .y(_node_2),
        .in(4'h4)
    );
    wire [6:0] _node_3;
    SHL_SIGNED #(.width(4), .n(3)) s_shl_13 (
        .y(_node_3),
        .in(_node_2)
    );
    wire [4:0] _node_4;
    ASSINT #(.width(5)) assint_14 (
        .y(_node_4),
        .in(5'h8)
    );
    wire [7:0] _node_5;
    SHL_SIGNED #(.width(5), .n(3)) s_shl_15 (
        .y(_node_5),
        .in(_node_4)
    );
    wire _T_2;
    wire [8:0] _WTEMP_3;
    PAD_SIGNED #(.width(8), .n(9)) s_pad_16 (
        .y(_WTEMP_3),
        .in(_node_5)
    );
    EQ_SIGNED #(.width(9)) s_eq_17 (
        .y(_T_2),
        .a(_dut__io_out),
        .b(_WTEMP_3)
    );
    wire _T_3;
    BITS #(.width(1), .high(0), .low(0)) bits_18 (
        .y(_T_3),
        .in(reset)
    );
    wire _T_4;
    BITWISEOR #(.width(1)) bitwiseor_19 (
        .y(_T_4),
        .a(_T_2),
        .b(_T_3)
    );
    wire _T_5;
    EQ_UNSIGNED #(.width(1)) u_eq_20 (
        .y(_T_5),
        .a(_T_4),
        .b(1'h0)
    );
    wire _T_6;
    BITS #(.width(1), .high(0), .low(0)) bits_21 (
        .y(_T_6),
        .in(reset)
    );
    wire _T_7;
    EQ_UNSIGNED #(.width(1)) u_eq_22 (
        .y(_T_7),
        .a(_T_6),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(4)) u_mux_23 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_node_0),
        .b(_cycle__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_24 (
        .y(done),
        .sel(1'h1),
        .a(wrap_wrap),
        .b(1'h0)
    );
    assign _dut__clock = clock;
    wire [3:0] _WTEMP_4;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_25 (
        .y(_dut__io_in1),
        .in(_WTEMP_4)
    );
    ASSINT #(.width(4)) assint_26 (
        .y(_WTEMP_4),
        .in(4'h4)
    );
    PAD_SIGNED #(.width(7), .n(8)) s_pad_27 (
        .y(_dut__io_in2),
        .in(_node_3)
    );
    assign _dut__reset = reset;
endmodule //IntervalTester
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module IntervalTest1(
    input clock,
    input reset,
    input [4:0] io_in1,
    input [7:0] io_in2,
    output [8:0] io_out
);
    wire [7:0] _node_1;
    SHL_SIGNED #(.width(5), .n(3)) s_shl_10 (
        .y(_node_1),
        .in(io_in1)
    );
    wire [8:0] _io_out_T;
    ADD_SIGNED #(.width(8)) s_add_11 (
        .y(_io_out_T),
        .a(_node_1),
        .b(io_in2)
    );
    assign io_out = _io_out_T;
endmodule //IntervalTest1
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
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
