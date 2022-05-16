module Sort(
    input clock,
    input reset,
    input [15:0] io_inputs_0,
    input [15:0] io_inputs_1,
    input [15:0] io_inputs_2,
    input [15:0] io_inputs_3,
    input [15:0] io_inputs_4,
    input io_newInputs,
    output [15:0] io_outputs_0,
    output [15:0] io_outputs_1,
    output [15:0] io_outputs_2,
    output [15:0] io_outputs_3,
    output [15:0] io_outputs_4,
    output io_sortDone
);
    wire [63:0] _orderedRegs_0__q;
    wire [63:0] _orderedRegs_0__d;
    DFF_POSCLK #(.width(64)) orderedRegs_0 (
        .q(_orderedRegs_0__q),
        .d(_orderedRegs_0__d),
        .clk(clock)
    );
    wire [63:0] _orderedRegs_1__q;
    wire [63:0] _orderedRegs_1__d;
    DFF_POSCLK #(.width(64)) orderedRegs_1 (
        .q(_orderedRegs_1__q),
        .d(_orderedRegs_1__d),
        .clk(clock)
    );
    wire [63:0] _orderedRegs_2__q;
    wire [63:0] _orderedRegs_2__d;
    DFF_POSCLK #(.width(64)) orderedRegs_2 (
        .q(_orderedRegs_2__q),
        .d(_orderedRegs_2__d),
        .clk(clock)
    );
    wire [63:0] _orderedRegs_3__q;
    wire [63:0] _orderedRegs_3__d;
    DFF_POSCLK #(.width(64)) orderedRegs_3 (
        .q(_orderedRegs_3__q),
        .d(_orderedRegs_3__d),
        .clk(clock)
    );
    wire [63:0] _orderedRegs_4__q;
    wire [63:0] _orderedRegs_4__d;
    DFF_POSCLK #(.width(64)) orderedRegs_4 (
        .q(_orderedRegs_4__q),
        .d(_orderedRegs_4__d),
        .clk(clock)
    );
    wire _busy__q;
    wire _busy__d;
    DFF_POSCLK #(.width(1)) busy (
        .q(_busy__q),
        .d(_busy__d),
        .clk(clock)
    );
    wire [2:0] _sortCounter__q;
    wire [2:0] _sortCounter__d;
    DFF_POSCLK #(.width(3)) sortCounter (
        .q(_sortCounter__q),
        .d(_sortCounter__d),
        .clk(clock)
    );
    wire _isEvenCycle__q;
    wire _isEvenCycle__d;
    DFF_POSCLK #(.width(1)) isEvenCycle (
        .q(_isEvenCycle__q),
        .d(_isEvenCycle__d),
        .clk(clock)
    );
    wire _T_42;
    EQ_UNSIGNED #(.width(1)) u_eq_1 (
        .y(_T_42),
        .a(_isEvenCycle__q),
        .b(1'h0)
    );
    wire [3:0] _T_44;
    wire [2:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_2 (
        .y(_WTEMP_0),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_3 (
        .y(_T_44),
        .a(_sortCounter__q),
        .b(_WTEMP_0)
    );
    wire [2:0] _T_45;
    TAIL #(.width(4), .n(1)) tail_4 (
        .y(_T_45),
        .in(_T_44)
    );
    wire _T_47;
    GT_UNSIGNED #(.width(3)) u_gt_5 (
        .y(_T_47),
        .a(_sortCounter__q),
        .b(3'h5)
    );
    wire _GEN_0;
    MUX_UNSIGNED #(.width(1)) u_mux_6 (
        .y(_GEN_0),
        .sel(_T_47),
        .a(1'h0),
        .b(_busy__q)
    );
    wire _T_49;
    GT_SIGNED #(.width(64)) s_gt_7 (
        .y(_T_49),
        .a(_orderedRegs_0__q),
        .b(_orderedRegs_1__q)
    );
    wire [63:0] _GEN_1;
    MUX_SIGNED #(.width(64)) s_mux_8 (
        .y(_GEN_1),
        .sel(_T_49),
        .a(_orderedRegs_1__q),
        .b(_orderedRegs_0__q)
    );
    wire [63:0] _GEN_2;
    MUX_SIGNED #(.width(64)) s_mux_9 (
        .y(_GEN_2),
        .sel(_T_49),
        .a(_orderedRegs_0__q),
        .b(_orderedRegs_1__q)
    );
    wire _T_50;
    GT_SIGNED #(.width(64)) s_gt_10 (
        .y(_T_50),
        .a(_orderedRegs_2__q),
        .b(_orderedRegs_3__q)
    );
    wire [63:0] _GEN_3;
    MUX_SIGNED #(.width(64)) s_mux_11 (
        .y(_GEN_3),
        .sel(_T_50),
        .a(_orderedRegs_3__q),
        .b(_orderedRegs_2__q)
    );
    wire [63:0] _GEN_4;
    MUX_SIGNED #(.width(64)) s_mux_12 (
        .y(_GEN_4),
        .sel(_T_50),
        .a(_orderedRegs_2__q),
        .b(_orderedRegs_3__q)
    );
    wire _T_51;
    GT_SIGNED #(.width(64)) s_gt_13 (
        .y(_T_51),
        .a(_orderedRegs_1__q),
        .b(_orderedRegs_2__q)
    );
    wire [63:0] _GEN_5;
    MUX_SIGNED #(.width(64)) s_mux_14 (
        .y(_GEN_5),
        .sel(_T_51),
        .a(_orderedRegs_2__q),
        .b(_orderedRegs_1__q)
    );
    wire [63:0] _GEN_6;
    MUX_SIGNED #(.width(64)) s_mux_15 (
        .y(_GEN_6),
        .sel(_T_51),
        .a(_orderedRegs_1__q),
        .b(_orderedRegs_2__q)
    );
    wire _T_52;
    GT_SIGNED #(.width(64)) s_gt_16 (
        .y(_T_52),
        .a(_orderedRegs_3__q),
        .b(_orderedRegs_4__q)
    );
    wire [63:0] _GEN_7;
    MUX_SIGNED #(.width(64)) s_mux_17 (
        .y(_GEN_7),
        .sel(_T_52),
        .a(_orderedRegs_4__q),
        .b(_orderedRegs_3__q)
    );
    wire [63:0] _GEN_8;
    MUX_SIGNED #(.width(64)) s_mux_18 (
        .y(_GEN_8),
        .sel(_T_52),
        .a(_orderedRegs_3__q),
        .b(_orderedRegs_4__q)
    );
    wire [63:0] _GEN_9;
    MUX_SIGNED #(.width(64)) s_mux_19 (
        .y(_GEN_9),
        .sel(_isEvenCycle__q),
        .a(_GEN_1),
        .b(_orderedRegs_0__q)
    );
    wire [63:0] _GEN_10;
    MUX_SIGNED #(.width(64)) s_mux_20 (
        .y(_GEN_10),
        .sel(_isEvenCycle__q),
        .a(_GEN_2),
        .b(_GEN_5)
    );
    wire [63:0] _GEN_11;
    MUX_SIGNED #(.width(64)) s_mux_21 (
        .y(_GEN_11),
        .sel(_isEvenCycle__q),
        .a(_GEN_3),
        .b(_GEN_6)
    );
    wire [63:0] _GEN_12;
    MUX_SIGNED #(.width(64)) s_mux_22 (
        .y(_GEN_12),
        .sel(_isEvenCycle__q),
        .a(_GEN_4),
        .b(_GEN_7)
    );
    wire [63:0] _GEN_13;
    MUX_SIGNED #(.width(64)) s_mux_23 (
        .y(_GEN_13),
        .sel(_isEvenCycle__q),
        .a(_orderedRegs_4__q),
        .b(_GEN_8)
    );
    wire _GEN_14;
    MUX_UNSIGNED #(.width(1)) u_mux_24 (
        .y(_GEN_14),
        .sel(_busy__q),
        .a(_T_42),
        .b(_isEvenCycle__q)
    );
    wire [2:0] _GEN_15;
    MUX_UNSIGNED #(.width(3)) u_mux_25 (
        .y(_GEN_15),
        .sel(_busy__q),
        .a(_T_45),
        .b(_sortCounter__q)
    );
    wire _GEN_16;
    MUX_UNSIGNED #(.width(1)) u_mux_26 (
        .y(_GEN_16),
        .sel(_busy__q),
        .a(_GEN_0),
        .b(_busy__q)
    );
    wire [63:0] _GEN_17;
    MUX_SIGNED #(.width(64)) s_mux_27 (
        .y(_GEN_17),
        .sel(_busy__q),
        .a(_GEN_9),
        .b(_orderedRegs_0__q)
    );
    wire [63:0] _GEN_18;
    MUX_SIGNED #(.width(64)) s_mux_28 (
        .y(_GEN_18),
        .sel(_busy__q),
        .a(_GEN_10),
        .b(_orderedRegs_1__q)
    );
    wire [63:0] _GEN_19;
    MUX_SIGNED #(.width(64)) s_mux_29 (
        .y(_GEN_19),
        .sel(_busy__q),
        .a(_GEN_11),
        .b(_orderedRegs_2__q)
    );
    wire [63:0] _GEN_20;
    MUX_SIGNED #(.width(64)) s_mux_30 (
        .y(_GEN_20),
        .sel(_busy__q),
        .a(_GEN_12),
        .b(_orderedRegs_3__q)
    );
    wire [63:0] _GEN_21;
    MUX_SIGNED #(.width(64)) s_mux_31 (
        .y(_GEN_21),
        .sel(_busy__q),
        .a(_GEN_13),
        .b(_orderedRegs_4__q)
    );
    wire [23:0] _node_0;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_32 (
        .y(_node_0),
        .in(io_inputs_0)
    );
    wire [63:0] _GEN_22;
    wire [63:0] _WTEMP_1;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_33 (
        .y(_WTEMP_1),
        .in(_node_0)
    );
    MUX_SIGNED #(.width(64)) s_mux_34 (
        .y(_GEN_22),
        .sel(io_newInputs),
        .a(_WTEMP_1),
        .b(_GEN_17)
    );
    wire [23:0] _node_1;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_35 (
        .y(_node_1),
        .in(io_inputs_1)
    );
    wire [63:0] _GEN_23;
    wire [63:0] _WTEMP_2;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_36 (
        .y(_WTEMP_2),
        .in(_node_1)
    );
    MUX_SIGNED #(.width(64)) s_mux_37 (
        .y(_GEN_23),
        .sel(io_newInputs),
        .a(_WTEMP_2),
        .b(_GEN_18)
    );
    wire [23:0] _node_2;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_38 (
        .y(_node_2),
        .in(io_inputs_2)
    );
    wire [63:0] _GEN_24;
    wire [63:0] _WTEMP_3;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_39 (
        .y(_WTEMP_3),
        .in(_node_2)
    );
    MUX_SIGNED #(.width(64)) s_mux_40 (
        .y(_GEN_24),
        .sel(io_newInputs),
        .a(_WTEMP_3),
        .b(_GEN_19)
    );
    wire [23:0] _node_3;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_41 (
        .y(_node_3),
        .in(io_inputs_3)
    );
    wire [63:0] _GEN_25;
    wire [63:0] _WTEMP_4;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_42 (
        .y(_WTEMP_4),
        .in(_node_3)
    );
    MUX_SIGNED #(.width(64)) s_mux_43 (
        .y(_GEN_25),
        .sel(io_newInputs),
        .a(_WTEMP_4),
        .b(_GEN_20)
    );
    wire [23:0] _node_4;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_44 (
        .y(_node_4),
        .in(io_inputs_4)
    );
    wire [63:0] _GEN_26;
    wire [63:0] _WTEMP_5;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_45 (
        .y(_WTEMP_5),
        .in(_node_4)
    );
    MUX_SIGNED #(.width(64)) s_mux_46 (
        .y(_GEN_26),
        .sel(io_newInputs),
        .a(_WTEMP_5),
        .b(_GEN_21)
    );
    wire _GEN_27;
    MUX_UNSIGNED #(.width(1)) u_mux_47 (
        .y(_GEN_27),
        .sel(io_newInputs),
        .a(1'h1),
        .b(_GEN_16)
    );
    wire [2:0] _GEN_28;
    wire [2:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_48 (
        .y(_WTEMP_6),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_49 (
        .y(_GEN_28),
        .sel(io_newInputs),
        .a(_WTEMP_6),
        .b(_GEN_15)
    );
    wire _GEN_29;
    MUX_UNSIGNED #(.width(1)) u_mux_50 (
        .y(_GEN_29),
        .sel(io_newInputs),
        .a(1'h0),
        .b(_GEN_14)
    );
    wire _T_54;
    EQ_UNSIGNED #(.width(1)) u_eq_51 (
        .y(_T_54),
        .a(_busy__q),
        .b(1'h0)
    );
    wire [55:0] _node_5;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_52 (
        .y(_node_5),
        .in(_orderedRegs_0__q)
    );
    wire [15:0] _node_6;
    BITS #(.width(56), .high(15), .low(0)) bits_53 (
        .y(_node_6),
        .in(_node_5)
    );
    wire [55:0] _node_7;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_54 (
        .y(_node_7),
        .in(_orderedRegs_1__q)
    );
    wire [15:0] _node_8;
    BITS #(.width(56), .high(15), .low(0)) bits_55 (
        .y(_node_8),
        .in(_node_7)
    );
    wire [55:0] _node_9;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_56 (
        .y(_node_9),
        .in(_orderedRegs_2__q)
    );
    wire [15:0] _node_10;
    BITS #(.width(56), .high(15), .low(0)) bits_57 (
        .y(_node_10),
        .in(_node_9)
    );
    wire [55:0] _node_11;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_58 (
        .y(_node_11),
        .in(_orderedRegs_3__q)
    );
    wire [15:0] _node_12;
    BITS #(.width(56), .high(15), .low(0)) bits_59 (
        .y(_node_12),
        .in(_node_11)
    );
    wire [55:0] _node_13;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_60 (
        .y(_node_13),
        .in(_orderedRegs_4__q)
    );
    wire [15:0] _node_14;
    BITS #(.width(56), .high(15), .low(0)) bits_61 (
        .y(_node_14),
        .in(_node_13)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_62 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_27)
    );
    ASSINT #(.width(16)) assint_63 (
        .y(io_outputs_0),
        .in(_node_6)
    );
    ASSINT #(.width(16)) assint_64 (
        .y(io_outputs_1),
        .in(_node_8)
    );
    ASSINT #(.width(16)) assint_65 (
        .y(io_outputs_2),
        .in(_node_10)
    );
    ASSINT #(.width(16)) assint_66 (
        .y(io_outputs_3),
        .in(_node_12)
    );
    ASSINT #(.width(16)) assint_67 (
        .y(io_outputs_4),
        .in(_node_14)
    );
    assign io_sortDone = _T_54;
    MUX_UNSIGNED #(.width(1)) u_mux_68 (
        .y(_isEvenCycle__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_29)
    );
    assign _orderedRegs_0__d = _GEN_22;
    assign _orderedRegs_1__d = _GEN_23;
    assign _orderedRegs_2__d = _GEN_24;
    assign _orderedRegs_3__d = _GEN_25;
    assign _orderedRegs_4__d = _GEN_26;
    MUX_UNSIGNED #(.width(3)) u_mux_69 (
        .y(_sortCounter__d),
        .sel(reset),
        .a(3'h0),
        .b(_GEN_28)
    );
endmodule //Sort
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
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module GT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) > $signed(b);
endmodule // GT_SIGNED
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
