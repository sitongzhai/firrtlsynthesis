module RightShiftTester(
    input clock,
    input reset
);
    wire _dut__clock;
    wire _dut__reset;
    wire _dut__io_i;
    wire _dut__io_j;
    wire _dut__io_i_shifted;
    wire _dut__io_j_shifted;
    wire _dut__io_k_shifted;
    wire _dut__io_l_shifted;
    wire _dut__io_m_shifted;
    wire _dut__io_n_shifted;
    wire [15:0] _dut__io_o_shifted;
    RightShift dut (
        .clock(_dut__clock),
        .reset(_dut__reset),
        .io_i(_dut__io_i),
        .io_j(_dut__io_j),
        .io_i_shifted(_dut__io_i_shifted),
        .io_j_shifted(_dut__io_j_shifted),
        .io_k_shifted(_dut__io_k_shifted),
        .io_l_shifted(_dut__io_l_shifted),
        .io_m_shifted(_dut__io_m_shifted),
        .io_n_shifted(_dut__io_n_shifted),
        .io_o_shifted(_dut__io_o_shifted)
    );
    wire [1:0] _T_6__q;
    wire [1:0] _T_6__d;
    DFF_POSCLK #(.width(2)) T_6 (
        .q(_T_6__q),
        .d(_T_6__d),
        .clk(clock)
    );
    wire [1:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(2)) u_mux_7 (
        .y(_T_6__d),
        .sel(reset),
        .a(2'h0),
        .b(_WTEMP_0)
    );
    wire T_8;
    EQ_UNSIGNED #(.width(2)) u_eq_8 (
        .y(T_8),
        .a(_T_6__q),
        .b(2'h3)
    );
    wire T_10;
    assign T_10 = 1'h0;
    wire [2:0] T_13;
    wire [1:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_9 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(2)) u_add_10 (
        .y(T_13),
        .a(_T_6__q),
        .b(_WTEMP_1)
    );
    wire [1:0] T_14;
    TAIL #(.width(3), .n(1)) tail_11 (
        .y(T_14),
        .in(T_13)
    );
    wire [1:0] T_15;
    assign T_15 = T_14;
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_12 (
        .y(done),
        .a(1'h1),
        .b(T_8)
    );
    wire T_18;
    EQ_UNSIGNED #(.width(1)) u_eq_13 (
        .y(T_18),
        .a(reset),
        .b(1'h0)
    );
    wire T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_14 (
        .y(T_22),
        .a(_dut__io_i_shifted),
        .b(1'h0)
    );
    wire T_24;
    EQ_UNSIGNED #(.width(1)) u_eq_15 (
        .y(T_24),
        .a(reset),
        .b(1'h0)
    );
    wire T_26;
    EQ_UNSIGNED #(.width(1)) u_eq_16 (
        .y(T_26),
        .a(T_22),
        .b(1'h0)
    );
    wire T_28;
    EQ_UNSIGNED #(.width(1)) u_eq_17 (
        .y(T_28),
        .a(reset),
        .b(1'h0)
    );
    wire T_30;
    EQ_SIGNED #(.width(1)) s_eq_18 (
        .y(T_30),
        .a(_dut__io_j_shifted),
        .b(-1'sh1)
    );
    wire T_32;
    EQ_UNSIGNED #(.width(1)) u_eq_19 (
        .y(T_32),
        .a(reset),
        .b(1'h0)
    );
    wire T_34;
    EQ_UNSIGNED #(.width(1)) u_eq_20 (
        .y(T_34),
        .a(T_30),
        .b(1'h0)
    );
    wire T_36;
    EQ_UNSIGNED #(.width(1)) u_eq_21 (
        .y(T_36),
        .a(reset),
        .b(1'h0)
    );
    wire T_38;
    EQ_UNSIGNED #(.width(1)) u_eq_22 (
        .y(T_38),
        .a(_dut__io_k_shifted),
        .b(1'h0)
    );
    wire T_40;
    EQ_UNSIGNED #(.width(1)) u_eq_23 (
        .y(T_40),
        .a(reset),
        .b(1'h0)
    );
    wire T_42;
    EQ_UNSIGNED #(.width(1)) u_eq_24 (
        .y(T_42),
        .a(T_38),
        .b(1'h0)
    );
    wire T_44;
    EQ_UNSIGNED #(.width(1)) u_eq_25 (
        .y(T_44),
        .a(reset),
        .b(1'h0)
    );
    wire T_46;
    EQ_UNSIGNED #(.width(1)) u_eq_26 (
        .y(T_46),
        .a(_dut__io_l_shifted),
        .b(1'h0)
    );
    wire T_48;
    EQ_UNSIGNED #(.width(1)) u_eq_27 (
        .y(T_48),
        .a(reset),
        .b(1'h0)
    );
    wire T_50;
    EQ_UNSIGNED #(.width(1)) u_eq_28 (
        .y(T_50),
        .a(T_46),
        .b(1'h0)
    );
    wire T_52;
    EQ_UNSIGNED #(.width(1)) u_eq_29 (
        .y(T_52),
        .a(reset),
        .b(1'h0)
    );
    wire T_54;
    EQ_SIGNED #(.width(1)) s_eq_30 (
        .y(T_54),
        .a(_dut__io_m_shifted),
        .b(-1'sh1)
    );
    wire T_56;
    EQ_UNSIGNED #(.width(1)) u_eq_31 (
        .y(T_56),
        .a(reset),
        .b(1'h0)
    );
    wire T_58;
    EQ_UNSIGNED #(.width(1)) u_eq_32 (
        .y(T_58),
        .a(T_54),
        .b(1'h0)
    );
    wire T_60;
    EQ_UNSIGNED #(.width(1)) u_eq_33 (
        .y(T_60),
        .a(reset),
        .b(1'h0)
    );
    wire T_62;
    EQ_SIGNED #(.width(1)) s_eq_34 (
        .y(T_62),
        .a(_dut__io_n_shifted),
        .b(1'sh0)
    );
    wire T_64;
    EQ_UNSIGNED #(.width(1)) u_eq_35 (
        .y(T_64),
        .a(reset),
        .b(1'h0)
    );
    wire T_66;
    EQ_UNSIGNED #(.width(1)) u_eq_36 (
        .y(T_66),
        .a(T_62),
        .b(1'h0)
    );
    wire T_68;
    EQ_UNSIGNED #(.width(1)) u_eq_37 (
        .y(T_68),
        .a(reset),
        .b(1'h0)
    );
    wire T_70;
    wire [15:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(5), .n(16)) u_pad_38 (
        .y(_WTEMP_2),
        .in(5'h12)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_39 (
        .y(T_70),
        .a(_dut__io_o_shifted),
        .b(_WTEMP_2)
    );
    wire T_72;
    EQ_UNSIGNED #(.width(1)) u_eq_40 (
        .y(T_72),
        .a(reset),
        .b(1'h0)
    );
    wire T_74;
    EQ_UNSIGNED #(.width(1)) u_eq_41 (
        .y(T_74),
        .a(T_70),
        .b(1'h0)
    );
    wire T_76;
    EQ_UNSIGNED #(.width(1)) u_eq_42 (
        .y(T_76),
        .a(reset),
        .b(1'h0)
    );
    MUX_UNSIGNED #(.width(2)) u_mux_43 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(T_15),
        .b(_T_6__q)
    );
    assign _dut__clock = clock;
    assign _dut__io_i = 1'h1;
    assign _dut__io_j = -1'sh1;
    assign _dut__reset = reset;
endmodule //RightShiftTester
module RightShift(
    input clock,
    input reset,
    input io_i,
    input io_j,
    output io_i_shifted,
    output io_j_shifted,
    output io_k_shifted,
    output io_l_shifted,
    output io_m_shifted,
    output io_n_shifted,
    output [15:0] io_o_shifted
);
    wire [15:0] k;
    wire [31:0] o;
    wire T_19;
    SHR_UNSIGNED #(.width(1), .n(1)) u_shr_1 (
        .y(T_19),
        .in(io_i)
    );
    wire T_20;
    SHR_SIGNED #(.width(1), .n(1)) s_shr_2 (
        .y(T_20),
        .in(io_j)
    );
    wire T_21;
    SHR_UNSIGNED #(.width(16), .n(18)) u_shr_3 (
        .y(T_21),
        .in(k)
    );
    wire T_23;
    assign T_23 = 1'h0;
    wire T_25;
    assign T_25 = -1'sh1;
    wire T_27;
    assign T_27 = 1'sh0;
    wire [15:0] T_28;
    SHR_UNSIGNED #(.width(32), .n(16)) u_shr_4 (
        .y(T_28),
        .in(o)
    );
    assign io_i_shifted = T_19;
    assign io_j_shifted = T_20;
    assign io_k_shifted = T_21;
    assign io_l_shifted = 1'h0;
    assign io_m_shifted = -1'sh1;
    assign io_n_shifted = 1'sh0;
    assign io_o_shifted = T_28;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_5 (
        .y(k),
        .in(1'h1)
    );
    PAD_UNSIGNED #(.width(21), .n(32)) u_pad_6 (
        .y(o),
        .in(21'h12D687)
    );
endmodule //RightShift
module SHR_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : 1'b0;
endmodule // SHR_UNSIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
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
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
