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
    GcdEngine_1 GcdEngine_1 (
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
    GcdEngine_2 GcdEngine_2 (
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
    GcdEngine_3 GcdEngine_3 (
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
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_20),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_3 (
        .y(_T_22),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_23;
    BITWISEAND #(.width(1)) bitwiseand_4 (
        .y(_T_23),
        .a(io_decoupledInput_valid),
        .b(_T_22)
    );
    wire _T_25;
    GT_UNSIGNED #(.width(16)) u_gt_5 (
        .y(_T_25),
        .a(_x__q),
        .b(_y__q)
    );
    wire [15:0] _node_0;
    MUX_UNSIGNED #(.width(16)) u_mux_6 (
        .y(_node_0),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_1;
    MUX_UNSIGNED #(.width(16)) u_mux_7 (
        .y(_node_1),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_8 (
        .y(_T_27),
        .a(_T_25),
        .b(1'h0)
    );
    wire [16:0] _T_28;
    SUB_UNSIGNED #(.width(16)) u_sub_9 (
        .y(_T_28),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_29;
    ASUINT #(.width(17)) asuint_10 (
        .y(_T_29),
        .in(_T_28)
    );
    wire [15:0] _T_30;
    TAIL #(.width(17), .n(1)) tail_11 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [15:0] _node_2;
    MUX_UNSIGNED #(.width(16)) u_mux_12 (
        .y(_node_2),
        .sel(_T_25),
        .a(_x__q),
        .b(_node_1)
    );
    wire [15:0] _node_3;
    MUX_UNSIGNED #(.width(16)) u_mux_13 (
        .y(_node_3),
        .sel(_T_25),
        .a(_y__q),
        .b(_node_0)
    );
    wire [15:0] _node_4;
    MUX_UNSIGNED #(.width(16)) u_mux_14 (
        .y(_node_4),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_5;
    MUX_UNSIGNED #(.width(16)) u_mux_15 (
        .y(_node_5),
        .sel(_T_27),
        .a(_T_30),
        .b(_node_2)
    );
    wire [15:0] _node_6;
    MUX_UNSIGNED #(.width(16)) u_mux_16 (
        .y(_node_6),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_32;
    wire [15:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_17 (
        .y(_WTEMP_1),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_18 (
        .y(_T_32),
        .a(_y__q),
        .b(_WTEMP_1)
    );
    wire _T_33;
    BITWISEAND #(.width(1)) bitwiseand_19 (
        .y(_T_33),
        .a(_T_32),
        .b(_busy__q)
    );
    wire _node_7;
    MUX_UNSIGNED #(.width(1)) u_mux_20 (
        .y(_node_7),
        .sel(_T_23),
        .a(1'h1),
        .b(_busy__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_21 (
        .y(_WTEMP_0),
        .sel(io_validOutput_valid),
        .a(1'h0),
        .b(_node_7)
    );
    assign io_decoupledInput_ready = _T_20;
    assign io_validOutput_bits_a = _xOriginal__q;
    assign io_validOutput_bits_b = _yOriginal__q;
    assign io_validOutput_bits_gcd = _x__q;
    assign io_validOutput_valid = _T_33;
    MUX_UNSIGNED #(.width(16)) u_mux_22 (
        .y(_x__d),
        .sel(_busy__q),
        .a(_node_3),
        .b(_node_4)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_23 (
        .y(_xOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_xOriginal__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_24 (
        .y(_y__d),
        .sel(_busy__q),
        .a(_node_5),
        .b(_node_6)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_25 (
        .y(_yOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_yOriginal__q)
    );
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
module GcdEngine_1(
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
    wire _WTEMP_2;
    MUX_UNSIGNED #(.width(1)) u_mux_26 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_2)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(1)) u_eq_27 (
        .y(_T_20),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_28 (
        .y(_T_22),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_23;
    BITWISEAND #(.width(1)) bitwiseand_29 (
        .y(_T_23),
        .a(io_decoupledInput_valid),
        .b(_T_22)
    );
    wire _T_25;
    GT_UNSIGNED #(.width(16)) u_gt_30 (
        .y(_T_25),
        .a(_x__q),
        .b(_y__q)
    );
    wire [15:0] _node_8;
    MUX_UNSIGNED #(.width(16)) u_mux_31 (
        .y(_node_8),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_9;
    MUX_UNSIGNED #(.width(16)) u_mux_32 (
        .y(_node_9),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_33 (
        .y(_T_27),
        .a(_T_25),
        .b(1'h0)
    );
    wire [16:0] _T_28;
    SUB_UNSIGNED #(.width(16)) u_sub_34 (
        .y(_T_28),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_29;
    ASUINT #(.width(17)) asuint_35 (
        .y(_T_29),
        .in(_T_28)
    );
    wire [15:0] _T_30;
    TAIL #(.width(17), .n(1)) tail_36 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [15:0] _node_10;
    MUX_UNSIGNED #(.width(16)) u_mux_37 (
        .y(_node_10),
        .sel(_T_25),
        .a(_x__q),
        .b(_node_9)
    );
    wire [15:0] _node_11;
    MUX_UNSIGNED #(.width(16)) u_mux_38 (
        .y(_node_11),
        .sel(_T_25),
        .a(_y__q),
        .b(_node_8)
    );
    wire [15:0] _node_12;
    MUX_UNSIGNED #(.width(16)) u_mux_39 (
        .y(_node_12),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_13;
    MUX_UNSIGNED #(.width(16)) u_mux_40 (
        .y(_node_13),
        .sel(_T_27),
        .a(_T_30),
        .b(_node_10)
    );
    wire [15:0] _node_14;
    MUX_UNSIGNED #(.width(16)) u_mux_41 (
        .y(_node_14),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_32;
    wire [15:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_42 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_43 (
        .y(_T_32),
        .a(_y__q),
        .b(_WTEMP_3)
    );
    wire _T_33;
    BITWISEAND #(.width(1)) bitwiseand_44 (
        .y(_T_33),
        .a(_T_32),
        .b(_busy__q)
    );
    wire _node_15;
    MUX_UNSIGNED #(.width(1)) u_mux_45 (
        .y(_node_15),
        .sel(_T_23),
        .a(1'h1),
        .b(_busy__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_46 (
        .y(_WTEMP_2),
        .sel(io_validOutput_valid),
        .a(1'h0),
        .b(_node_15)
    );
    assign io_decoupledInput_ready = _T_20;
    assign io_validOutput_bits_a = _xOriginal__q;
    assign io_validOutput_bits_b = _yOriginal__q;
    assign io_validOutput_bits_gcd = _x__q;
    assign io_validOutput_valid = _T_33;
    MUX_UNSIGNED #(.width(16)) u_mux_47 (
        .y(_x__d),
        .sel(_busy__q),
        .a(_node_11),
        .b(_node_12)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_48 (
        .y(_xOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_xOriginal__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_49 (
        .y(_y__d),
        .sel(_busy__q),
        .a(_node_13),
        .b(_node_14)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_50 (
        .y(_yOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_yOriginal__q)
    );
endmodule //GcdEngine_1
module GcdEngine_2(
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
    wire _WTEMP_4;
    MUX_UNSIGNED #(.width(1)) u_mux_51 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_4)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(1)) u_eq_52 (
        .y(_T_20),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_53 (
        .y(_T_22),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_23;
    BITWISEAND #(.width(1)) bitwiseand_54 (
        .y(_T_23),
        .a(io_decoupledInput_valid),
        .b(_T_22)
    );
    wire _T_25;
    GT_UNSIGNED #(.width(16)) u_gt_55 (
        .y(_T_25),
        .a(_x__q),
        .b(_y__q)
    );
    wire [15:0] _node_16;
    MUX_UNSIGNED #(.width(16)) u_mux_56 (
        .y(_node_16),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_17;
    MUX_UNSIGNED #(.width(16)) u_mux_57 (
        .y(_node_17),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_58 (
        .y(_T_27),
        .a(_T_25),
        .b(1'h0)
    );
    wire [16:0] _T_28;
    SUB_UNSIGNED #(.width(16)) u_sub_59 (
        .y(_T_28),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_29;
    ASUINT #(.width(17)) asuint_60 (
        .y(_T_29),
        .in(_T_28)
    );
    wire [15:0] _T_30;
    TAIL #(.width(17), .n(1)) tail_61 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [15:0] _node_18;
    MUX_UNSIGNED #(.width(16)) u_mux_62 (
        .y(_node_18),
        .sel(_T_25),
        .a(_x__q),
        .b(_node_17)
    );
    wire [15:0] _node_19;
    MUX_UNSIGNED #(.width(16)) u_mux_63 (
        .y(_node_19),
        .sel(_T_25),
        .a(_y__q),
        .b(_node_16)
    );
    wire [15:0] _node_20;
    MUX_UNSIGNED #(.width(16)) u_mux_64 (
        .y(_node_20),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_21;
    MUX_UNSIGNED #(.width(16)) u_mux_65 (
        .y(_node_21),
        .sel(_T_27),
        .a(_T_30),
        .b(_node_18)
    );
    wire [15:0] _node_22;
    MUX_UNSIGNED #(.width(16)) u_mux_66 (
        .y(_node_22),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_32;
    wire [15:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_67 (
        .y(_WTEMP_5),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_68 (
        .y(_T_32),
        .a(_y__q),
        .b(_WTEMP_5)
    );
    wire _T_33;
    BITWISEAND #(.width(1)) bitwiseand_69 (
        .y(_T_33),
        .a(_T_32),
        .b(_busy__q)
    );
    wire _node_23;
    MUX_UNSIGNED #(.width(1)) u_mux_70 (
        .y(_node_23),
        .sel(_T_23),
        .a(1'h1),
        .b(_busy__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_71 (
        .y(_WTEMP_4),
        .sel(io_validOutput_valid),
        .a(1'h0),
        .b(_node_23)
    );
    assign io_decoupledInput_ready = _T_20;
    assign io_validOutput_bits_a = _xOriginal__q;
    assign io_validOutput_bits_b = _yOriginal__q;
    assign io_validOutput_bits_gcd = _x__q;
    assign io_validOutput_valid = _T_33;
    MUX_UNSIGNED #(.width(16)) u_mux_72 (
        .y(_x__d),
        .sel(_busy__q),
        .a(_node_19),
        .b(_node_20)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_73 (
        .y(_xOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_xOriginal__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_74 (
        .y(_y__d),
        .sel(_busy__q),
        .a(_node_21),
        .b(_node_22)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_75 (
        .y(_yOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_yOriginal__q)
    );
endmodule //GcdEngine_2
module GcdEngine_3(
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
    wire _WTEMP_6;
    MUX_UNSIGNED #(.width(1)) u_mux_76 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_6)
    );
    wire _T_20;
    EQ_UNSIGNED #(.width(1)) u_eq_77 (
        .y(_T_20),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_22;
    EQ_UNSIGNED #(.width(1)) u_eq_78 (
        .y(_T_22),
        .a(_busy__q),
        .b(1'h0)
    );
    wire _T_23;
    BITWISEAND #(.width(1)) bitwiseand_79 (
        .y(_T_23),
        .a(io_decoupledInput_valid),
        .b(_T_22)
    );
    wire _T_25;
    GT_UNSIGNED #(.width(16)) u_gt_80 (
        .y(_T_25),
        .a(_x__q),
        .b(_y__q)
    );
    wire [15:0] _node_24;
    MUX_UNSIGNED #(.width(16)) u_mux_81 (
        .y(_node_24),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_25;
    MUX_UNSIGNED #(.width(16)) u_mux_82 (
        .y(_node_25),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_83 (
        .y(_T_27),
        .a(_T_25),
        .b(1'h0)
    );
    wire [16:0] _T_28;
    SUB_UNSIGNED #(.width(16)) u_sub_84 (
        .y(_T_28),
        .a(_y__q),
        .b(_x__q)
    );
    wire [16:0] _T_29;
    ASUINT #(.width(17)) asuint_85 (
        .y(_T_29),
        .in(_T_28)
    );
    wire [15:0] _T_30;
    TAIL #(.width(17), .n(1)) tail_86 (
        .y(_T_30),
        .in(_T_29)
    );
    wire [15:0] _node_26;
    MUX_UNSIGNED #(.width(16)) u_mux_87 (
        .y(_node_26),
        .sel(_T_25),
        .a(_x__q),
        .b(_node_25)
    );
    wire [15:0] _node_27;
    MUX_UNSIGNED #(.width(16)) u_mux_88 (
        .y(_node_27),
        .sel(_T_25),
        .a(_y__q),
        .b(_node_24)
    );
    wire [15:0] _node_28;
    MUX_UNSIGNED #(.width(16)) u_mux_89 (
        .y(_node_28),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_x__q)
    );
    wire [15:0] _node_29;
    MUX_UNSIGNED #(.width(16)) u_mux_90 (
        .y(_node_29),
        .sel(_T_27),
        .a(_T_30),
        .b(_node_26)
    );
    wire [15:0] _node_30;
    MUX_UNSIGNED #(.width(16)) u_mux_91 (
        .y(_node_30),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_y__q)
    );
    wire _T_32;
    wire [15:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(16)) u_pad_92 (
        .y(_WTEMP_7),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(16)) u_eq_93 (
        .y(_T_32),
        .a(_y__q),
        .b(_WTEMP_7)
    );
    wire _T_33;
    BITWISEAND #(.width(1)) bitwiseand_94 (
        .y(_T_33),
        .a(_T_32),
        .b(_busy__q)
    );
    wire _node_31;
    MUX_UNSIGNED #(.width(1)) u_mux_95 (
        .y(_node_31),
        .sel(_T_23),
        .a(1'h1),
        .b(_busy__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_96 (
        .y(_WTEMP_6),
        .sel(io_validOutput_valid),
        .a(1'h0),
        .b(_node_31)
    );
    assign io_decoupledInput_ready = _T_20;
    assign io_validOutput_bits_a = _xOriginal__q;
    assign io_validOutput_bits_b = _yOriginal__q;
    assign io_validOutput_bits_gcd = _x__q;
    assign io_validOutput_valid = _T_33;
    MUX_UNSIGNED #(.width(16)) u_mux_97 (
        .y(_x__d),
        .sel(_busy__q),
        .a(_node_27),
        .b(_node_28)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_98 (
        .y(_xOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_a),
        .b(_xOriginal__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_99 (
        .y(_y__d),
        .sel(_busy__q),
        .a(_node_29),
        .b(_node_30)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_100 (
        .y(_yOriginal__d),
        .sel(_T_23),
        .a(io_decoupledInput_bits_b),
        .b(_yOriginal__q)
    );
endmodule //GcdEngine_3
