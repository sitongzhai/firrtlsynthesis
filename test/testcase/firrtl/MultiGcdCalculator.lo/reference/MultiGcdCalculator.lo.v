module MultiGcdCalculator(
    input clock,
    input reset,
    output io_input_0_ready,
    input io_input_0_valid,
    input [15:0] io_input_0_bits_a,
    input [15:0] io_input_0_bits_b,
    output io_input_1_ready,
    input io_input_1_valid,
    input [15:0] io_input_1_bits_a,
    input [15:0] io_input_1_bits_b,
    output io_input_2_ready,
    input io_input_2_valid,
    input [15:0] io_input_2_bits_a,
    input [15:0] io_input_2_bits_b,
    output io_input_3_ready,
    input io_input_3_valid,
    input [15:0] io_input_3_bits_a,
    input [15:0] io_input_3_bits_b,
    output io_output_0_valid,
    output [15:0] io_output_0_bits_a,
    output [15:0] io_output_0_bits_b,
    output [15:0] io_output_0_bits_gcd,
    output io_output_1_valid,
    output [15:0] io_output_1_bits_a,
    output [15:0] io_output_1_bits_b,
    output [15:0] io_output_1_bits_gcd,
    output io_output_2_valid,
    output [15:0] io_output_2_bits_a,
    output [15:0] io_output_2_bits_b,
    output [15:0] io_output_2_bits_gcd,
    output io_output_3_valid,
    output [15:0] io_output_3_bits_a,
    output [15:0] io_output_3_bits_b,
    output [15:0] io_output_3_bits_gcd
);
    wire _GcdEngine__clock;
    wire _GcdEngine__reset;
    wire _GcdEngine__io_decoupledInput_ready;
    wire _GcdEngine__io_decoupledInput_valid;
    wire [15:0] _GcdEngine__io_decoupledInput_bits_a;
    wire [15:0] _GcdEngine__io_decoupledInput_bits_b;
    wire _GcdEngine__io_validOutput_valid;
    wire [15:0] _GcdEngine__io_validOutput_bits_a;
    wire [15:0] _GcdEngine__io_validOutput_bits_b;
    wire [15:0] _GcdEngine__io_validOutput_bits_gcd;
    GcdEngine GcdEngine (
        .clock(_GcdEngine__clock),
        .reset(_GcdEngine__reset),
        .io_decoupledInput_ready(_GcdEngine__io_decoupledInput_ready),
        .io_decoupledInput_valid(_GcdEngine__io_decoupledInput_valid),
        .io_decoupledInput_bits_a(_GcdEngine__io_decoupledInput_bits_a),
        .io_decoupledInput_bits_b(_GcdEngine__io_decoupledInput_bits_b),
        .io_validOutput_valid(_GcdEngine__io_validOutput_valid),
        .io_validOutput_bits_a(_GcdEngine__io_validOutput_bits_a),
        .io_validOutput_bits_b(_GcdEngine__io_validOutput_bits_b),
        .io_validOutput_bits_gcd(_GcdEngine__io_validOutput_bits_gcd)
    );
    wire _GcdEngine_1__clock;
    wire _GcdEngine_1__reset;
    wire _GcdEngine_1__io_decoupledInput_ready;
    wire _GcdEngine_1__io_decoupledInput_valid;
    wire [15:0] _GcdEngine_1__io_decoupledInput_bits_a;
    wire [15:0] _GcdEngine_1__io_decoupledInput_bits_b;
    wire _GcdEngine_1__io_validOutput_valid;
    wire [15:0] _GcdEngine_1__io_validOutput_bits_a;
    wire [15:0] _GcdEngine_1__io_validOutput_bits_b;
    wire [15:0] _GcdEngine_1__io_validOutput_bits_gcd;
    GcdEngine GcdEngine_1 (
        .clock(_GcdEngine_1__clock),
        .reset(_GcdEngine_1__reset),
        .io_decoupledInput_ready(_GcdEngine_1__io_decoupledInput_ready),
        .io_decoupledInput_valid(_GcdEngine_1__io_decoupledInput_valid),
        .io_decoupledInput_bits_a(_GcdEngine_1__io_decoupledInput_bits_a),
        .io_decoupledInput_bits_b(_GcdEngine_1__io_decoupledInput_bits_b),
        .io_validOutput_valid(_GcdEngine_1__io_validOutput_valid),
        .io_validOutput_bits_a(_GcdEngine_1__io_validOutput_bits_a),
        .io_validOutput_bits_b(_GcdEngine_1__io_validOutput_bits_b),
        .io_validOutput_bits_gcd(_GcdEngine_1__io_validOutput_bits_gcd)
    );
    wire _GcdEngine_2__clock;
    wire _GcdEngine_2__reset;
    wire _GcdEngine_2__io_decoupledInput_ready;
    wire _GcdEngine_2__io_decoupledInput_valid;
    wire [15:0] _GcdEngine_2__io_decoupledInput_bits_a;
    wire [15:0] _GcdEngine_2__io_decoupledInput_bits_b;
    wire _GcdEngine_2__io_validOutput_valid;
    wire [15:0] _GcdEngine_2__io_validOutput_bits_a;
    wire [15:0] _GcdEngine_2__io_validOutput_bits_b;
    wire [15:0] _GcdEngine_2__io_validOutput_bits_gcd;
    GcdEngine GcdEngine_2 (
        .clock(_GcdEngine_2__clock),
        .reset(_GcdEngine_2__reset),
        .io_decoupledInput_ready(_GcdEngine_2__io_decoupledInput_ready),
        .io_decoupledInput_valid(_GcdEngine_2__io_decoupledInput_valid),
        .io_decoupledInput_bits_a(_GcdEngine_2__io_decoupledInput_bits_a),
        .io_decoupledInput_bits_b(_GcdEngine_2__io_decoupledInput_bits_b),
        .io_validOutput_valid(_GcdEngine_2__io_validOutput_valid),
        .io_validOutput_bits_a(_GcdEngine_2__io_validOutput_bits_a),
        .io_validOutput_bits_b(_GcdEngine_2__io_validOutput_bits_b),
        .io_validOutput_bits_gcd(_GcdEngine_2__io_validOutput_bits_gcd)
    );
    wire _GcdEngine_3__clock;
    wire _GcdEngine_3__reset;
    wire _GcdEngine_3__io_decoupledInput_ready;
    wire _GcdEngine_3__io_decoupledInput_valid;
    wire [15:0] _GcdEngine_3__io_decoupledInput_bits_a;
    wire [15:0] _GcdEngine_3__io_decoupledInput_bits_b;
    wire _GcdEngine_3__io_validOutput_valid;
    wire [15:0] _GcdEngine_3__io_validOutput_bits_a;
    wire [15:0] _GcdEngine_3__io_validOutput_bits_b;
    wire [15:0] _GcdEngine_3__io_validOutput_bits_gcd;
    GcdEngine GcdEngine_3 (
        .clock(_GcdEngine_3__clock),
        .reset(_GcdEngine_3__reset),
        .io_decoupledInput_ready(_GcdEngine_3__io_decoupledInput_ready),
        .io_decoupledInput_valid(_GcdEngine_3__io_decoupledInput_valid),
        .io_decoupledInput_bits_a(_GcdEngine_3__io_decoupledInput_bits_a),
        .io_decoupledInput_bits_b(_GcdEngine_3__io_decoupledInput_bits_b),
        .io_validOutput_valid(_GcdEngine_3__io_validOutput_valid),
        .io_validOutput_bits_a(_GcdEngine_3__io_validOutput_bits_a),
        .io_validOutput_bits_b(_GcdEngine_3__io_validOutput_bits_b),
        .io_validOutput_bits_gcd(_GcdEngine_3__io_validOutput_bits_gcd)
    );
    assign _GcdEngine__clock = clock;
    assign _GcdEngine__io_decoupledInput_bits_a = io_input_0_bits_a;
    assign _GcdEngine__io_decoupledInput_bits_b = io_input_0_bits_b;
    assign _GcdEngine__io_decoupledInput_valid = io_input_0_valid;
    assign _GcdEngine__reset = reset;
    assign _GcdEngine_1__clock = clock;
    assign _GcdEngine_1__io_decoupledInput_bits_a = io_input_1_bits_a;
    assign _GcdEngine_1__io_decoupledInput_bits_b = io_input_1_bits_b;
    assign _GcdEngine_1__io_decoupledInput_valid = io_input_1_valid;
    assign _GcdEngine_1__reset = reset;
    assign _GcdEngine_2__clock = clock;
    assign _GcdEngine_2__io_decoupledInput_bits_a = io_input_2_bits_a;
    assign _GcdEngine_2__io_decoupledInput_bits_b = io_input_2_bits_b;
    assign _GcdEngine_2__io_decoupledInput_valid = io_input_2_valid;
    assign _GcdEngine_2__reset = reset;
    assign _GcdEngine_3__clock = clock;
    assign _GcdEngine_3__io_decoupledInput_bits_a = io_input_3_bits_a;
    assign _GcdEngine_3__io_decoupledInput_bits_b = io_input_3_bits_b;
    assign _GcdEngine_3__io_decoupledInput_valid = io_input_3_valid;
    assign _GcdEngine_3__reset = reset;
    assign io_input_0_ready = _GcdEngine__io_decoupledInput_ready;
    assign io_input_1_ready = _GcdEngine_1__io_decoupledInput_ready;
    assign io_input_2_ready = _GcdEngine_2__io_decoupledInput_ready;
    assign io_input_3_ready = _GcdEngine_3__io_decoupledInput_ready;
    assign io_output_0_bits_a = _GcdEngine__io_validOutput_bits_a;
    assign io_output_0_bits_b = _GcdEngine__io_validOutput_bits_b;
    assign io_output_0_bits_gcd = _GcdEngine__io_validOutput_bits_gcd;
    assign io_output_0_valid = _GcdEngine__io_validOutput_valid;
    assign io_output_1_bits_a = _GcdEngine_1__io_validOutput_bits_a;
    assign io_output_1_bits_b = _GcdEngine_1__io_validOutput_bits_b;
    assign io_output_1_bits_gcd = _GcdEngine_1__io_validOutput_bits_gcd;
    assign io_output_1_valid = _GcdEngine_1__io_validOutput_valid;
    assign io_output_2_bits_a = _GcdEngine_2__io_validOutput_bits_a;
    assign io_output_2_bits_b = _GcdEngine_2__io_validOutput_bits_b;
    assign io_output_2_bits_gcd = _GcdEngine_2__io_validOutput_bits_gcd;
    assign io_output_2_valid = _GcdEngine_2__io_validOutput_valid;
    assign io_output_3_bits_a = _GcdEngine_3__io_validOutput_bits_a;
    assign io_output_3_bits_b = _GcdEngine_3__io_validOutput_bits_b;
    assign io_output_3_bits_gcd = _GcdEngine_3__io_validOutput_bits_gcd;
    assign io_output_3_valid = _GcdEngine_3__io_validOutput_valid;
endmodule //MultiGcdCalculator
module GcdEngine(
    input clock,
    input reset,
    output io_decoupledInput_ready,
    input io_decoupledInput_valid,
    input [15:0] io_decoupledInput_bits_a,
    input [15:0] io_decoupledInput_bits_b,
    output io_validOutput_valid,
    output [15:0] io_validOutput_bits_a,
    output [15:0] io_validOutput_bits_b,
    output [15:0] io_validOutput_bits_gcd
);
    wire [15:0] _x__q;
    wire [15:0] _x__d;
    DFF_POSCLK #(.width(16)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(clock)
    );
    wire [15:0] _y__q;
    wire [15:0] _y__d;
    DFF_POSCLK #(.width(16)) y (
        .q(_y__q),
        .d(_y__d),
        .clk(clock)
    );
    wire [15:0] _xOriginal__q;
    wire [15:0] _xOriginal__d;
    DFF_POSCLK #(.width(16)) xOriginal (
        .q(_xOriginal__q),
        .d(_xOriginal__d),
        .clk(clock)
    );
    wire [15:0] _yOriginal__q;
    wire [15:0] _yOriginal__d;
    DFF_POSCLK #(.width(16)) yOriginal (
        .q(_yOriginal__q),
        .d(_yOriginal__d),
        .clk(clock)
    );
    wire _busy__q;
    wire _busy__d;
    DFF_POSCLK #(.width(1)) busy (
        .q(_busy__q),
        .d(_busy__d),
        .clk(clock)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(1)) u_eq_1 (
        .y(_T_20),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_22),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_23;
    BITWISEAND #(.width(1)) bitwiseand_3 (
        .y(_T_23),
        .a(io_decoupledInput_valid),
        .b(_T_22)
    );
    wire [15:0] _GEN_0;
    MUX_UNSIGNED #(.width(16)) u_mux_4 (
        .y(_GEN_0),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _GEN_1;
    MUX_UNSIGNED #(.width(16)) u_mux_5 (
        .y(_GEN_1),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire [15:0] _GEN_2;
    MUX_UNSIGNED #(.width(16)) u_mux_6 (
        .y(_GEN_2),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_xOriginal__q)
    );
    wire [15:0] _GEN_3;
    MUX_UNSIGNED #(.width(16)) u_mux_7 (
        .y(_GEN_3),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_yOriginal__q)
    );
    wire _GEN_4;
    MUX_UNSIGNED #(.width(1)) u_mux_8 (
        .y(_GEN_4),
        .sel(_T_23),
        .a(1'h1),
        .b(_busy__q)
    );
    wire _T_25;
    GT_UNSIGNED #(.width(16)) u_gt_9 (
        .y(_T_25),
        .a(_x__q),
        .b(_y__q)
    );
    wire [16:0] _T_26;
    SUB_UNSIGNED #(.width(16)) u_sub_10 (
        .y(_T_26),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_27;
    ASUINT #(.width(17)) asuint_11 (
        .y(_T_27),
        .in(_T_26)
    );
    wire [15:0] _T_28;
    TAIL #(.width(17), .n(1)) tail_12 (
        .y(_T_28),
        .in(_T_27)
    );
    wire [15:0] _GEN_5;
    MUX_UNSIGNED #(.width(16)) u_mux_13 (
        .y(_GEN_5),
        .sel(_T_25),
        .a(_y__q),
        .b(_GEN_0)
    );
    wire [15:0] _GEN_6;
    MUX_UNSIGNED #(.width(16)) u_mux_14 (
        .y(_GEN_6),
        .sel(_T_25),
        .a(_x__q),
        .b(_T_28)
    );
    wire [15:0] _GEN_7;
    MUX_UNSIGNED #(.width(16)) u_mux_15 (
        .y(_GEN_7),
        .sel(_busy__q),
        .a(_GEN_5),
        .b(_GEN_0)
    );
    wire [15:0] _GEN_8;
    MUX_UNSIGNED #(.width(16)) u_mux_16 (
        .y(_GEN_8),
        .sel(_busy__q),
        .a(_GEN_6),
        .b(_GEN_1)
    );
    wire _T_30;
    wire [15:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_17 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_18 (
        .y(_T_30),
        .a(_y__q),
        .b(_WTEMP_0)
    );
    wire _T_31;
    BITWISEAND #(.width(1)) bitwiseand_19 (
        .y(_T_31),
        .a(_T_30),
        .b(_busy__q)
    );
    wire _GEN_9;
    MUX_UNSIGNED #(.width(1)) u_mux_20 (
        .y(_GEN_9),
        .sel(io_validOutput_valid),
        .a(1'h0),
        .b(_GEN_4)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_21 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_9)
    );
    assign io_decoupledInput_ready = _T_20;
    assign io_validOutput_bits_a = _xOriginal__q;
    assign io_validOutput_bits_b = _yOriginal__q;
    assign io_validOutput_bits_gcd = _x__q;
    assign io_validOutput_valid = _T_31;
    assign _x__d = _GEN_7;
    assign _xOriginal__d = _GEN_2;
    assign _y__d = _GEN_8;
    assign _yOriginal__d = _GEN_3;
endmodule //GcdEngine
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
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
