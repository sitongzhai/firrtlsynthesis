module SortFixed(
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
    wire [63:0] initValue_0;
    wire [63:0] initValue_1;
    wire [63:0] initValue_2;
    wire [63:0] initValue_3;
    wire [63:0] initValue_4;
    wire [63:0] _orderedRegs_0__q;
    wire [63:0] _orderedRegs_0__d;
    DFF_POSCLK #(.width(64)) orderedRegs_0 (
        .q(_orderedRegs_0__q),
        .d(_orderedRegs_0__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_0;
    MUX_SIGNED #(.width(64)) s_mux_1 (
        .y(_orderedRegs_0__d),
        .sel(reset),
        .a(initValue_0),
        .b(_WTEMP_0)
    );
    wire [63:0] _orderedRegs_1__q;
    wire [63:0] _orderedRegs_1__d;
    DFF_POSCLK #(.width(64)) orderedRegs_1 (
        .q(_orderedRegs_1__q),
        .d(_orderedRegs_1__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_1;
    MUX_SIGNED #(.width(64)) s_mux_2 (
        .y(_orderedRegs_1__d),
        .sel(reset),
        .a(initValue_1),
        .b(_WTEMP_1)
    );
    wire [63:0] _orderedRegs_2__q;
    wire [63:0] _orderedRegs_2__d;
    DFF_POSCLK #(.width(64)) orderedRegs_2 (
        .q(_orderedRegs_2__q),
        .d(_orderedRegs_2__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_2;
    MUX_SIGNED #(.width(64)) s_mux_3 (
        .y(_orderedRegs_2__d),
        .sel(reset),
        .a(initValue_2),
        .b(_WTEMP_2)
    );
    wire [63:0] _orderedRegs_3__q;
    wire [63:0] _orderedRegs_3__d;
    DFF_POSCLK #(.width(64)) orderedRegs_3 (
        .q(_orderedRegs_3__q),
        .d(_orderedRegs_3__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_3;
    MUX_SIGNED #(.width(64)) s_mux_4 (
        .y(_orderedRegs_3__d),
        .sel(reset),
        .a(initValue_3),
        .b(_WTEMP_3)
    );
    wire [63:0] _orderedRegs_4__q;
    wire [63:0] _orderedRegs_4__d;
    DFF_POSCLK #(.width(64)) orderedRegs_4 (
        .q(_orderedRegs_4__q),
        .d(_orderedRegs_4__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_4;
    MUX_SIGNED #(.width(64)) s_mux_5 (
        .y(_orderedRegs_4__d),
        .sel(reset),
        .a(initValue_4),
        .b(_WTEMP_4)
    );
    wire _busy__q;
    wire _busy__d;
    DFF_POSCLK #(.width(1)) busy (
        .q(_busy__q),
        .d(_busy__d),
        .clk(clock)
    );
    wire _WTEMP_5;
    MUX_UNSIGNED #(.width(1)) u_mux_6 (
        .y(_busy__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_5)
    );
    wire [2:0] _sortCounter__q;
    wire [2:0] _sortCounter__d;
    DFF_POSCLK #(.width(3)) sortCounter (
        .q(_sortCounter__q),
        .d(_sortCounter__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_6;
    MUX_UNSIGNED #(.width(3)) u_mux_7 (
        .y(_sortCounter__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_6)
    );
    wire _isEvenCycle__q;
    wire _isEvenCycle__d;
    DFF_POSCLK #(.width(1)) isEvenCycle (
        .q(_isEvenCycle__q),
        .d(_isEvenCycle__d),
        .clk(clock)
    );
    wire _WTEMP_7;
    MUX_UNSIGNED #(.width(1)) u_mux_8 (
        .y(_isEvenCycle__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_7)
    );
    wire [23:0] _node_0;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_9 (
        .y(_node_0),
        .in(io_inputs_0)
    );
    wire [23:0] _node_1;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_10 (
        .y(_node_1),
        .in(io_inputs_1)
    );
    wire [23:0] _node_2;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_11 (
        .y(_node_2),
        .in(io_inputs_2)
    );
    wire [23:0] _node_3;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_12 (
        .y(_node_3),
        .in(io_inputs_3)
    );
    wire [23:0] _node_4;
    SHL_SIGNED #(.width(16), .n(8)) s_shl_13 (
        .y(_node_4),
        .in(io_inputs_4)
    );
    wire _T_107;
    EQ_UNSIGNED #(.width(1)) u_eq_14 (
        .y(_T_107),
        .a(_isEvenCycle__q),
        .b(1'h0)
    );
    wire [3:0] _T_109;
    wire [2:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_15 (
        .y(_WTEMP_8),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_16 (
        .y(_T_109),
        .a(_sortCounter__q),
        .b(_WTEMP_8)
    );
    wire [2:0] _T_110;
    TAIL #(.width(4), .n(1)) tail_17 (
        .y(_T_110),
        .in(_T_109)
    );
    wire _T_112;
    GT_UNSIGNED #(.width(3)) u_gt_18 (
        .y(_T_112),
        .a(_sortCounter__q),
        .b(3'h5)
    );
    wire _T_114;
    GT_SIGNED #(.width(64)) s_gt_19 (
        .y(_T_114),
        .a(_orderedRegs_0__q),
        .b(_orderedRegs_1__q)
    );
    wire _T_115;
    GT_SIGNED #(.width(64)) s_gt_20 (
        .y(_T_115),
        .a(_orderedRegs_2__q),
        .b(_orderedRegs_3__q)
    );
    wire _T_116;
    GT_SIGNED #(.width(64)) s_gt_21 (
        .y(_T_116),
        .a(_orderedRegs_1__q),
        .b(_orderedRegs_2__q)
    );
    wire _T_117;
    GT_SIGNED #(.width(64)) s_gt_22 (
        .y(_T_117),
        .a(_orderedRegs_3__q),
        .b(_orderedRegs_4__q)
    );
    wire [63:0] _node_5;
    MUX_SIGNED #(.width(64)) s_mux_23 (
        .y(_node_5),
        .sel(_T_114),
        .a(_orderedRegs_1__q),
        .b(_orderedRegs_0__q)
    );
    wire [63:0] _node_6;
    MUX_SIGNED #(.width(64)) s_mux_24 (
        .y(_node_6),
        .sel(_T_114),
        .a(_orderedRegs_0__q),
        .b(_orderedRegs_1__q)
    );
    wire [63:0] _node_7;
    MUX_SIGNED #(.width(64)) s_mux_25 (
        .y(_node_7),
        .sel(_T_116),
        .a(_orderedRegs_2__q),
        .b(_orderedRegs_1__q)
    );
    wire [63:0] _node_8;
    MUX_SIGNED #(.width(64)) s_mux_26 (
        .y(_node_8),
        .sel(_T_115),
        .a(_orderedRegs_3__q),
        .b(_orderedRegs_2__q)
    );
    wire [63:0] _node_9;
    MUX_SIGNED #(.width(64)) s_mux_27 (
        .y(_node_9),
        .sel(_T_116),
        .a(_orderedRegs_1__q),
        .b(_orderedRegs_2__q)
    );
    wire [63:0] _node_10;
    MUX_SIGNED #(.width(64)) s_mux_28 (
        .y(_node_10),
        .sel(_T_115),
        .a(_orderedRegs_2__q),
        .b(_orderedRegs_3__q)
    );
    wire [63:0] _node_11;
    MUX_SIGNED #(.width(64)) s_mux_29 (
        .y(_node_11),
        .sel(_T_117),
        .a(_orderedRegs_4__q),
        .b(_orderedRegs_3__q)
    );
    wire [63:0] _node_12;
    MUX_SIGNED #(.width(64)) s_mux_30 (
        .y(_node_12),
        .sel(_T_117),
        .a(_orderedRegs_3__q),
        .b(_orderedRegs_4__q)
    );
    wire _node_13;
    MUX_UNSIGNED #(.width(1)) u_mux_31 (
        .y(_node_13),
        .sel(_T_112),
        .a(1'h0),
        .b(_busy__q)
    );
    wire [63:0] _node_14;
    MUX_SIGNED #(.width(64)) s_mux_32 (
        .y(_node_14),
        .sel(_isEvenCycle__q),
        .a(_node_5),
        .b(_orderedRegs_0__q)
    );
    wire [63:0] _node_15;
    MUX_SIGNED #(.width(64)) s_mux_33 (
        .y(_node_15),
        .sel(_isEvenCycle__q),
        .a(_node_6),
        .b(_node_7)
    );
    wire [63:0] _node_16;
    MUX_SIGNED #(.width(64)) s_mux_34 (
        .y(_node_16),
        .sel(_isEvenCycle__q),
        .a(_node_8),
        .b(_node_9)
    );
    wire [63:0] _node_17;
    MUX_SIGNED #(.width(64)) s_mux_35 (
        .y(_node_17),
        .sel(_isEvenCycle__q),
        .a(_node_10),
        .b(_node_11)
    );
    wire [63:0] _node_18;
    MUX_SIGNED #(.width(64)) s_mux_36 (
        .y(_node_18),
        .sel(_isEvenCycle__q),
        .a(_orderedRegs_4__q),
        .b(_node_12)
    );
    wire _node_19;
    MUX_UNSIGNED #(.width(1)) u_mux_37 (
        .y(_node_19),
        .sel(_busy__q),
        .a(_node_13),
        .b(_busy__q)
    );
    wire _node_20;
    MUX_UNSIGNED #(.width(1)) u_mux_38 (
        .y(_node_20),
        .sel(_busy__q),
        .a(_T_107),
        .b(_isEvenCycle__q)
    );
    wire [63:0] _node_21;
    MUX_SIGNED #(.width(64)) s_mux_39 (
        .y(_node_21),
        .sel(_busy__q),
        .a(_node_14),
        .b(_orderedRegs_0__q)
    );
    wire [63:0] _node_22;
    MUX_SIGNED #(.width(64)) s_mux_40 (
        .y(_node_22),
        .sel(_busy__q),
        .a(_node_15),
        .b(_orderedRegs_1__q)
    );
    wire [63:0] _node_23;
    MUX_SIGNED #(.width(64)) s_mux_41 (
        .y(_node_23),
        .sel(_busy__q),
        .a(_node_16),
        .b(_orderedRegs_2__q)
    );
    wire [63:0] _node_24;
    MUX_SIGNED #(.width(64)) s_mux_42 (
        .y(_node_24),
        .sel(_busy__q),
        .a(_node_17),
        .b(_orderedRegs_3__q)
    );
    wire [63:0] _node_25;
    MUX_SIGNED #(.width(64)) s_mux_43 (
        .y(_node_25),
        .sel(_busy__q),
        .a(_node_18),
        .b(_orderedRegs_4__q)
    );
    wire [2:0] _node_26;
    MUX_UNSIGNED #(.width(3)) u_mux_44 (
        .y(_node_26),
        .sel(_busy__q),
        .a(_T_110),
        .b(_sortCounter__q)
    );
    wire _T_119;
    EQ_UNSIGNED #(.width(1)) u_eq_45 (
        .y(_T_119),
        .a(_busy__q),
        .b(1'h0)
    );
    wire [55:0] _node_27;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_46 (
        .y(_node_27),
        .in(_orderedRegs_0__q)
    );
    wire [55:0] _node_28;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_47 (
        .y(_node_28),
        .in(_orderedRegs_1__q)
    );
    wire [55:0] _node_29;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_48 (
        .y(_node_29),
        .in(_orderedRegs_2__q)
    );
    wire [55:0] _node_30;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_49 (
        .y(_node_30),
        .in(_orderedRegs_3__q)
    );
    wire [55:0] _node_31;
    SHR_SIGNED #(.width(64), .n(8)) s_shr_50 (
        .y(_node_31),
        .in(_orderedRegs_4__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_51 (
        .y(_WTEMP_5),
        .sel(io_newInputs),
        .a(1'h1),
        .b(_node_19)
    );
    ASSINT #(.width(64)) assint_52 (
        .y(initValue_0),
        .in(64'h0)
    );
    ASSINT #(.width(64)) assint_53 (
        .y(initValue_1),
        .in(64'h0)
    );
    ASSINT #(.width(64)) assint_54 (
        .y(initValue_2),
        .in(64'h0)
    );
    ASSINT #(.width(64)) assint_55 (
        .y(initValue_3),
        .in(64'h0)
    );
    ASSINT #(.width(64)) assint_56 (
        .y(initValue_4),
        .in(64'h0)
    );
    wire [15:0] _WTEMP_9;
    BITS #(.width(56), .high(15), .low(0)) bits_57 (
        .y(_WTEMP_9),
        .in(_node_27)
    );
    ASSINT #(.width(16)) assint_58 (
        .y(io_outputs_0),
        .in(_WTEMP_9)
    );
    wire [15:0] _WTEMP_10;
    BITS #(.width(56), .high(15), .low(0)) bits_59 (
        .y(_WTEMP_10),
        .in(_node_28)
    );
    ASSINT #(.width(16)) assint_60 (
        .y(io_outputs_1),
        .in(_WTEMP_10)
    );
    wire [15:0] _WTEMP_11;
    BITS #(.width(56), .high(15), .low(0)) bits_61 (
        .y(_WTEMP_11),
        .in(_node_29)
    );
    ASSINT #(.width(16)) assint_62 (
        .y(io_outputs_2),
        .in(_WTEMP_11)
    );
    wire [15:0] _WTEMP_12;
    BITS #(.width(56), .high(15), .low(0)) bits_63 (
        .y(_WTEMP_12),
        .in(_node_30)
    );
    ASSINT #(.width(16)) assint_64 (
        .y(io_outputs_3),
        .in(_WTEMP_12)
    );
    wire [15:0] _WTEMP_13;
    BITS #(.width(56), .high(15), .low(0)) bits_65 (
        .y(_WTEMP_13),
        .in(_node_31)
    );
    ASSINT #(.width(16)) assint_66 (
        .y(io_outputs_4),
        .in(_WTEMP_13)
    );
    assign io_sortDone = _T_119;
    MUX_UNSIGNED #(.width(1)) u_mux_67 (
        .y(_WTEMP_7),
        .sel(io_newInputs),
        .a(1'h0),
        .b(_node_20)
    );
    wire [63:0] _WTEMP_14;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_68 (
        .y(_WTEMP_14),
        .in(_node_0)
    );
    MUX_SIGNED #(.width(64)) s_mux_69 (
        .y(_WTEMP_0),
        .sel(io_newInputs),
        .a(_WTEMP_14),
        .b(_node_21)
    );
    wire [63:0] _WTEMP_15;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_70 (
        .y(_WTEMP_15),
        .in(_node_1)
    );
    MUX_SIGNED #(.width(64)) s_mux_71 (
        .y(_WTEMP_1),
        .sel(io_newInputs),
        .a(_WTEMP_15),
        .b(_node_22)
    );
    wire [63:0] _WTEMP_16;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_72 (
        .y(_WTEMP_16),
        .in(_node_2)
    );
    MUX_SIGNED #(.width(64)) s_mux_73 (
        .y(_WTEMP_2),
        .sel(io_newInputs),
        .a(_WTEMP_16),
        .b(_node_23)
    );
    wire [63:0] _WTEMP_17;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_74 (
        .y(_WTEMP_17),
        .in(_node_3)
    );
    MUX_SIGNED #(.width(64)) s_mux_75 (
        .y(_WTEMP_3),
        .sel(io_newInputs),
        .a(_WTEMP_17),
        .b(_node_24)
    );
    wire [63:0] _WTEMP_18;
    PAD_SIGNED #(.width(24), .n(64)) s_pad_76 (
        .y(_WTEMP_18),
        .in(_node_4)
    );
    MUX_SIGNED #(.width(64)) s_mux_77 (
        .y(_WTEMP_4),
        .sel(io_newInputs),
        .a(_WTEMP_18),
        .b(_node_25)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_78 (
        .y(_WTEMP_6),
        .sel(io_newInputs),
        .a(3'h0),
        .b(_node_26)
    );
endmodule //SortFixed
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
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
module GT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) > $signed(b);
endmodule // GT_SIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
