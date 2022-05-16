module SimpleComplexAdder(
    input clock,
    input reset,
    input [5:0] io_a1_real,
    input [5:0] io_a1_imag,
    input [7:0] io_a2_real,
    input [7:0] io_a2_imag,
    output [13:0] io_c_real,
    output [13:0] io_c_imag
);
    wire [13:0] _register1_real__q;
    wire [13:0] _register1_real__d;
    DFF_POSCLK #(.width(14)) register1_real (
        .q(_register1_real__q),
        .d(_register1_real__d),
        .clk(clock)
    );
    wire [13:0] _register1_imag__q;
    wire [13:0] _register1_imag__d;
    DFF_POSCLK #(.width(14)) register1_imag (
        .q(_register1_imag__q),
        .d(_register1_imag__d),
        .clk(clock)
    );
    wire [8:0] _T_28;
    ADD_SIGNED #(.width(8)) s_add_1 (
        .y(_T_28),
        .a(io_a2_real),
        .b(io_a2_imag)
    );
    wire [7:0] _T_29;
    TAIL #(.width(9), .n(1)) tail_2 (
        .y(_T_29),
        .in(_T_28)
    );
    wire [7:0] _T_30;
    ASSINT #(.width(8)) assint_3 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [6:0] _T_31;
    ADD_SIGNED #(.width(6)) s_add_4 (
        .y(_T_31),
        .a(io_a1_real),
        .b(io_a1_imag)
    );
    wire [5:0] _T_32;
    TAIL #(.width(7), .n(1)) tail_5 (
        .y(_T_32),
        .in(_T_31)
    );
    wire [5:0] _T_33;
    ASSINT #(.width(6)) assint_6 (
        .y(_T_33),
        .in(_T_32)
    );
    wire [6:0] _T_34;
    SUB_SIGNED #(.width(6)) s_sub_7 (
        .y(_T_34),
        .a(io_a1_imag),
        .b(io_a1_real)
    );
    wire [5:0] _T_35;
    TAIL #(.width(7), .n(1)) tail_8 (
        .y(_T_35),
        .in(_T_34)
    );
    wire [5:0] _T_36;
    ASSINT #(.width(6)) assint_9 (
        .y(_T_36),
        .in(_T_35)
    );
    wire [13:0] _T_37;
    MUL2_SIGNED #(.width_a(6), .width_b(8)) s_mul2_10 (
        .y(_T_37),
        .a(io_a1_real),
        .b(_T_30)
    );
    wire [13:0] _T_38;
    MUL2_SIGNED #(.width_a(6), .width_b(8)) s_mul2_11 (
        .y(_T_38),
        .a(_T_33),
        .b(io_a2_imag)
    );
    wire [13:0] _T_39;
    MUL2_SIGNED #(.width_a(6), .width_b(8)) s_mul2_12 (
        .y(_T_39),
        .a(_T_36),
        .b(io_a2_real)
    );
    wire [14:0] _T_40;
    SUB_SIGNED #(.width(14)) s_sub_13 (
        .y(_T_40),
        .a(_T_37),
        .b(_T_38)
    );
    wire [13:0] _T_41;
    TAIL #(.width(15), .n(1)) tail_14 (
        .y(_T_41),
        .in(_T_40)
    );
    wire [13:0] _T_42;
    ASSINT #(.width(14)) assint_15 (
        .y(_T_42),
        .in(_T_41)
    );
    wire [14:0] _T_43;
    ADD_SIGNED #(.width(14)) s_add_16 (
        .y(_T_43),
        .a(_T_37),
        .b(_T_39)
    );
    wire [13:0] _T_44;
    TAIL #(.width(15), .n(1)) tail_17 (
        .y(_T_44),
        .in(_T_43)
    );
    wire [13:0] _T_45;
    ASSINT #(.width(14)) assint_18 (
        .y(_T_45),
        .in(_T_44)
    );
    wire [13:0] _T_53_real;
    wire [13:0] _T_53_imag;
    assign _T_53_imag = _T_45;
    assign _T_53_real = _T_42;
    assign io_c_imag = _register1_imag__q;
    assign io_c_real = _register1_real__q;
    assign _register1_imag__d = _T_53_imag;
    assign _register1_real__d = _T_53_real;
endmodule //SimpleComplexAdder
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
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
module SUB_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) - $signed(b);
endmodule // SUB_SIGNED
module MUL2_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL2_SIGNED
