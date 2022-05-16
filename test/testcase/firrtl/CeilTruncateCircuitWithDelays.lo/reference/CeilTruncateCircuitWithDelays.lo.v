module CeilTruncateCircuitWithDelays(
    input clock,
    input reset,
    input [11:0] io_inFixed,
    input [63:0] io_inReal_node,
    output [11:0] io_outFixedCeil,
    output [63:0] io_outRealCeil_node,
    output [11:0] io_outFixedTruncate,
    output [63:0] io_outRealTruncate_node
);
    wire [11:0] __T_16__q;
    wire [11:0] __T_16__d;
    DFF_POSCLK #(.width(12)) _T_16 (
        .q(__T_16__q),
        .d(__T_16__d),
        .clk(clock)
    );
    wire [11:0] _GEN_0;
    assign _GEN_0 = io_inFixed;
    wire [11:0] __T_18__q;
    wire [11:0] __T_18__d;
    DFF_POSCLK #(.width(12)) _T_18 (
        .q(__T_18__q),
        .d(__T_18__d),
        .clk(clock)
    );
    wire [11:0] _GEN_1;
    assign _GEN_1 = __T_16__q;
    wire [7:0] _T_19;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_1 (
        .y(_T_19),
        .in(__T_18__q)
    );
    wire [11:0] _node_0;
    SHL_SIGNED #(.width(8), .n(4)) s_shl_2 (
        .y(_node_0),
        .in(_T_19)
    );
    wire _T_20;
    EQ_SIGNED #(.width(12)) s_eq_3 (
        .y(_T_20),
        .a(__T_18__q),
        .b(_node_0)
    );
    wire [11:0] __T_23__q;
    wire [11:0] __T_23__d;
    DFF_POSCLK #(.width(12)) _T_23 (
        .q(__T_23__q),
        .d(__T_23__d),
        .clk(clock)
    );
    wire [11:0] _GEN_2;
    assign _GEN_2 = io_inFixed;
    wire [11:0] __T_25__q;
    wire [11:0] __T_25__d;
    DFF_POSCLK #(.width(12)) _T_25 (
        .q(__T_25__q),
        .d(__T_25__d),
        .clk(clock)
    );
    wire [11:0] _GEN_3;
    assign _GEN_3 = __T_23__q;
    wire [7:0] _T_26;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_4 (
        .y(_T_26),
        .in(__T_25__q)
    );
    wire [7:0] _T_27;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_5 (
        .y(_T_27),
        .in(io_inFixed)
    );
    wire [8:0] _T_29;
    wire [7:0] _WTEMP_0;
    PAD_SIGNED #(.width(2), .n(8)) s_pad_6 (
        .y(_WTEMP_0),
        .in(2'sh1)
    );
    ADD_SIGNED #(.width(8)) s_add_7 (
        .y(_T_29),
        .a(_T_27),
        .b(_WTEMP_0)
    );
    wire [8:0] __T_32__q;
    wire [8:0] __T_32__d;
    DFF_POSCLK #(.width(9)) _T_32 (
        .q(__T_32__q),
        .d(__T_32__d),
        .clk(clock)
    );
    wire [8:0] _GEN_4;
    assign _GEN_4 = _T_29;
    wire [8:0] __T_34__q;
    wire [8:0] __T_34__d;
    DFF_POSCLK #(.width(9)) _T_34 (
        .q(__T_34__q),
        .d(__T_34__d),
        .clk(clock)
    );
    wire [8:0] _GEN_5;
    assign _GEN_5 = __T_32__q;
    wire [8:0] _T_36;
    wire [8:0] _WTEMP_1;
    PAD_SIGNED #(.width(8), .n(9)) s_pad_8 (
        .y(_WTEMP_1),
        .in(_T_26)
    );
    MUX_SIGNED #(.width(9)) s_mux_9 (
        .y(_T_36),
        .sel(_T_20),
        .a(_WTEMP_1),
        .b(__T_34__q)
    );
    wire [63:0] __T_40_node__q;
    wire [63:0] __T_40_node__d;
    DFF_POSCLK #(.width(64)) _T_40_node (
        .q(__T_40_node__q),
        .d(__T_40_node__d),
        .clk(clock)
    );
    wire [63:0] _GEN_6;
    assign _GEN_6 = io_inReal_node;
    wire [63:0] __T_44_node__q;
    wire [63:0] __T_44_node__d;
    DFF_POSCLK #(.width(64)) _T_44_node (
        .q(__T_44_node__q),
        .d(__T_44_node__d),
        .clk(clock)
    );
    wire [63:0] _GEN_7;
    assign _GEN_7 = __T_40_node__q;
    wire [63:0] _BBFCeil__out;
    wire [63:0] _BBFCeil__in;
    BBFCeil BBFCeil (
        .out(_BBFCeil__out),
        .in(_BBFCeil__in)
    );
    wire [63:0] _T_48_node;
    wire [11:0] __T_52__q;
    wire [11:0] __T_52__d;
    DFF_POSCLK #(.width(12)) _T_52 (
        .q(__T_52__q),
        .d(__T_52__d),
        .clk(clock)
    );
    wire [11:0] _GEN_8;
    assign _GEN_8 = io_inFixed;
    wire [11:0] __T_54__q;
    wire [11:0] __T_54__d;
    DFF_POSCLK #(.width(12)) _T_54 (
        .q(__T_54__q),
        .d(__T_54__d),
        .clk(clock)
    );
    wire [11:0] _GEN_9;
    assign _GEN_9 = __T_52__q;
    wire _T_55;
    BITS #(.width(12), .high(11), .low(11)) bits_10 (
        .y(_T_55),
        .in(__T_54__q)
    );
    wire [11:0] __T_58__q;
    wire [11:0] __T_58__d;
    DFF_POSCLK #(.width(12)) _T_58 (
        .q(__T_58__q),
        .d(__T_58__d),
        .clk(clock)
    );
    wire [11:0] _GEN_10;
    assign _GEN_10 = io_inFixed;
    wire [11:0] __T_60__q;
    wire [11:0] __T_60__d;
    DFF_POSCLK #(.width(12)) _T_60 (
        .q(__T_60__q),
        .d(__T_60__d),
        .clk(clock)
    );
    wire [11:0] _GEN_11;
    assign _GEN_11 = __T_58__q;
    wire [7:0] _T_61;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_11 (
        .y(_T_61),
        .in(__T_60__q)
    );
    wire [11:0] _node_1;
    SHL_SIGNED #(.width(8), .n(4)) s_shl_12 (
        .y(_node_1),
        .in(_T_61)
    );
    wire _T_62;
    EQ_SIGNED #(.width(12)) s_eq_13 (
        .y(_T_62),
        .a(__T_60__q),
        .b(_node_1)
    );
    wire [11:0] __T_65__q;
    wire [11:0] __T_65__d;
    DFF_POSCLK #(.width(12)) _T_65 (
        .q(__T_65__q),
        .d(__T_65__d),
        .clk(clock)
    );
    wire [11:0] _GEN_12;
    assign _GEN_12 = io_inFixed;
    wire [11:0] __T_67__q;
    wire [11:0] __T_67__d;
    DFF_POSCLK #(.width(12)) _T_67 (
        .q(__T_67__q),
        .d(__T_67__d),
        .clk(clock)
    );
    wire [11:0] _GEN_13;
    assign _GEN_13 = __T_65__q;
    wire [7:0] _T_68;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_14 (
        .y(_T_68),
        .in(__T_67__q)
    );
    wire [7:0] _T_69;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_15 (
        .y(_T_69),
        .in(io_inFixed)
    );
    wire [8:0] _T_71;
    wire [7:0] _WTEMP_2;
    PAD_SIGNED #(.width(2), .n(8)) s_pad_16 (
        .y(_WTEMP_2),
        .in(2'sh1)
    );
    ADD_SIGNED #(.width(8)) s_add_17 (
        .y(_T_71),
        .a(_T_69),
        .b(_WTEMP_2)
    );
    wire [8:0] __T_74__q;
    wire [8:0] __T_74__d;
    DFF_POSCLK #(.width(9)) _T_74 (
        .q(__T_74__q),
        .d(__T_74__d),
        .clk(clock)
    );
    wire [8:0] _GEN_14;
    assign _GEN_14 = _T_71;
    wire [8:0] __T_76__q;
    wire [8:0] __T_76__d;
    DFF_POSCLK #(.width(9)) _T_76 (
        .q(__T_76__q),
        .d(__T_76__d),
        .clk(clock)
    );
    wire [8:0] _GEN_15;
    assign _GEN_15 = __T_74__q;
    wire [8:0] _T_78;
    wire [8:0] _WTEMP_3;
    PAD_SIGNED #(.width(8), .n(9)) s_pad_18 (
        .y(_WTEMP_3),
        .in(_T_68)
    );
    MUX_SIGNED #(.width(9)) s_mux_19 (
        .y(_T_78),
        .sel(_T_62),
        .a(_WTEMP_3),
        .b(__T_76__q)
    );
    wire [11:0] __T_81__q;
    wire [11:0] __T_81__d;
    DFF_POSCLK #(.width(12)) _T_81 (
        .q(__T_81__q),
        .d(__T_81__d),
        .clk(clock)
    );
    wire [11:0] _GEN_16;
    assign _GEN_16 = io_inFixed;
    wire [11:0] __T_83__q;
    wire [11:0] __T_83__d;
    DFF_POSCLK #(.width(12)) _T_83 (
        .q(__T_83__q),
        .d(__T_83__d),
        .clk(clock)
    );
    wire [11:0] _GEN_17;
    assign _GEN_17 = __T_81__q;
    wire [7:0] _T_84;
    SHR_SIGNED #(.width(12), .n(4)) s_shr_20 (
        .y(_T_84),
        .in(__T_83__q)
    );
    wire [8:0] _T_86;
    wire [8:0] _WTEMP_4;
    PAD_SIGNED #(.width(8), .n(9)) s_pad_21 (
        .y(_WTEMP_4),
        .in(_T_84)
    );
    MUX_SIGNED #(.width(9)) s_mux_22 (
        .y(_T_86),
        .sel(_T_55),
        .a(_T_78),
        .b(_WTEMP_4)
    );
    wire _BBFLessThan__out;
    wire [63:0] _BBFLessThan__in2;
    wire [63:0] _BBFLessThan__in1;
    BBFLessThan BBFLessThan (
        .out(_BBFLessThan__out),
        .in2(_BBFLessThan__in2),
        .in1(_BBFLessThan__in1)
    );
    wire _T_90;
    wire [63:0] _BBFCeil_1__out;
    wire [63:0] _BBFCeil_1__in;
    BBFCeil BBFCeil_1 (
        .out(_BBFCeil_1__out),
        .in(_BBFCeil_1__in)
    );
    wire [63:0] _T_93_node;
    wire [63:0] _BBFFloor__out;
    wire [63:0] _BBFFloor__in;
    BBFFloor BBFFloor (
        .out(_BBFFloor__out),
        .in(_BBFFloor__in)
    );
    wire [63:0] _T_97_node;
    wire [63:0] _T_99_node;
    MUX_UNSIGNED #(.width(64)) u_mux_23 (
        .y(_T_99_node),
        .sel(_T_90),
        .a(_T_93_node),
        .b(_T_97_node)
    );
    wire [12:0] _node_2;
    SHL_SIGNED #(.width(9), .n(4)) s_shl_24 (
        .y(_node_2),
        .in(_T_36)
    );
    wire [11:0] _node_3;
    BITS #(.width(13), .high(11), .low(0)) bits_25 (
        .y(_node_3),
        .in(_node_2)
    );
    wire [12:0] _node_4;
    SHL_SIGNED #(.width(9), .n(4)) s_shl_26 (
        .y(_node_4),
        .in(_T_86)
    );
    wire [11:0] _node_5;
    BITS #(.width(13), .high(11), .low(0)) bits_27 (
        .y(_node_5),
        .in(_node_4)
    );
    assign _BBFCeil__in = __T_44_node__q;
    assign _BBFCeil_1__in = io_inReal_node;
    assign _BBFFloor__in = io_inReal_node;
    assign _BBFLessThan__in1 = io_inReal_node;
    assign _BBFLessThan__in2 = 64'h0;
    assign __T_16__d = _GEN_0;
    assign __T_18__d = _GEN_1;
    assign __T_23__d = _GEN_2;
    assign __T_25__d = _GEN_3;
    assign __T_32__d = _GEN_4;
    assign __T_34__d = _GEN_5;
    assign __T_40_node__d = _GEN_6;
    assign __T_44_node__d = _GEN_7;
    assign _T_48_node = _BBFCeil__out;
    assign __T_52__d = _GEN_8;
    assign __T_54__d = _GEN_9;
    assign __T_58__d = _GEN_10;
    assign __T_60__d = _GEN_11;
    assign __T_65__d = _GEN_12;
    assign __T_67__d = _GEN_13;
    assign __T_74__d = _GEN_14;
    assign __T_76__d = _GEN_15;
    assign __T_81__d = _GEN_16;
    assign __T_83__d = _GEN_17;
    assign _T_90 = _BBFLessThan__out;
    assign _T_93_node = _BBFCeil_1__out;
    assign _T_97_node = _BBFFloor__out;
    ASSINT #(.width(12)) assint_28 (
        .y(io_outFixedCeil),
        .in(_node_3)
    );
    ASSINT #(.width(12)) assint_29 (
        .y(io_outFixedTruncate),
        .in(_node_5)
    );
    assign io_outRealCeil_node = _T_48_node;
    assign io_outRealTruncate_node = _T_99_node;
endmodule //CeilTruncateCircuitWithDelays
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
