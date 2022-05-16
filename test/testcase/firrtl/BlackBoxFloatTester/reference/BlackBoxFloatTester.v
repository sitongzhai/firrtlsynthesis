module BlackBoxFloatTester(
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
        .b(4'h9)
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
    wire _T_11;
    BITWISEAND #(.width(1)) bitwiseand_8 (
        .y(_T_11),
        .a(1'h1),
        .b(_T_6)
    );
    wire [63:0] _T_13_node;
    wire [63:0] _accum_node__q;
    wire [63:0] _accum_node__d;
    DFF_POSCLK #(.width(64)) accum_node (
        .q(_accum_node__q),
        .d(_accum_node__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_3;
    MUX_UNSIGNED #(.width(64)) u_mux_9 (
        .y(_accum_node__d),
        .sel(reset),
        .a(_T_13_node),
        .b(_WTEMP_3)
    );
    wire [63:0] _BBFAdd__out;
    wire [63:0] _BBFAdd__in2;
    wire [63:0] _BBFAdd__in1;
    BBFAdd BBFAdd (
        .out(_BBFAdd__out),
        .in2(_BBFAdd__in2),
        .in1(_BBFAdd__in1)
    );
    wire [63:0] addOut_node;
    wire [63:0] _BBFMultiply__out;
    wire [63:0] _BBFMultiply__in2;
    wire [63:0] _BBFMultiply__in1;
    BBFMultiply BBFMultiply (
        .out(_BBFMultiply__out),
        .in2(_BBFMultiply__in2),
        .in1(_BBFMultiply__in1)
    );
    wire [63:0] mulOut_node;
    wire _T_26;
    BITS #(.width(1), .high(0), .low(0)) bits_10 (
        .y(_T_26),
        .in(reset)
    );
    wire _T_28;
    EQ_UNSIGNED #(.width(1)) u_eq_11 (
        .y(_T_28),
        .a(_T_26),
        .b(1'h0)
    );
    wire _T_30;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_12 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_13 (
        .y(_T_30),
        .a(_value__q),
        .b(_WTEMP_4)
    );
    wire _BBFEquals__out;
    wire [63:0] _BBFEquals__in2;
    wire [63:0] _BBFEquals__in1;
    BBFEquals BBFEquals (
        .out(_BBFEquals__out),
        .in2(_BBFEquals__in2),
        .in1(_BBFEquals__in1)
    );
    wire _T_34;
    wire _T_35;
    BITS #(.width(1), .high(0), .low(0)) bits_14 (
        .y(_T_35),
        .in(reset)
    );
    wire _T_36;
    BITWISEOR #(.width(1)) bitwiseor_15 (
        .y(_T_36),
        .a(_T_34),
        .b(_T_35)
    );
    wire _T_38;
    EQ_UNSIGNED #(.width(1)) u_eq_16 (
        .y(_T_38),
        .a(_T_36),
        .b(1'h0)
    );
    wire _BBFEquals_1__out;
    wire [63:0] _BBFEquals_1__in2;
    wire [63:0] _BBFEquals_1__in1;
    BBFEquals BBFEquals_1 (
        .out(_BBFEquals_1__out),
        .in2(_BBFEquals_1__in2),
        .in1(_BBFEquals_1__in1)
    );
    wire _T_42;
    wire _T_43;
    BITS #(.width(1), .high(0), .low(0)) bits_17 (
        .y(_T_43),
        .in(reset)
    );
    wire _T_44;
    BITWISEOR #(.width(1)) bitwiseor_18 (
        .y(_T_44),
        .a(_T_42),
        .b(_T_43)
    );
    wire _T_46;
    EQ_UNSIGNED #(.width(1)) u_eq_19 (
        .y(_T_46),
        .a(_T_44),
        .b(1'h0)
    );
    wire _T_48;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_20 (
        .y(_WTEMP_5),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_21 (
        .y(_T_48),
        .a(_value__q),
        .b(_WTEMP_5)
    );
    wire _BBFEquals_2__out;
    wire [63:0] _BBFEquals_2__in2;
    wire [63:0] _BBFEquals_2__in1;
    BBFEquals BBFEquals_2 (
        .out(_BBFEquals_2__out),
        .in2(_BBFEquals_2__in2),
        .in1(_BBFEquals_2__in1)
    );
    wire _T_52;
    wire _T_53;
    BITS #(.width(1), .high(0), .low(0)) bits_22 (
        .y(_T_53),
        .in(reset)
    );
    wire _T_54;
    BITWISEOR #(.width(1)) bitwiseor_23 (
        .y(_T_54),
        .a(_T_52),
        .b(_T_53)
    );
    wire _T_56;
    EQ_UNSIGNED #(.width(1)) u_eq_24 (
        .y(_T_56),
        .a(_T_54),
        .b(1'h0)
    );
    wire _BBFEquals_3__out;
    wire [63:0] _BBFEquals_3__in2;
    wire [63:0] _BBFEquals_3__in1;
    BBFEquals BBFEquals_3 (
        .out(_BBFEquals_3__out),
        .in2(_BBFEquals_3__in2),
        .in1(_BBFEquals_3__in1)
    );
    wire _T_60;
    wire _T_61;
    BITS #(.width(1), .high(0), .low(0)) bits_25 (
        .y(_T_61),
        .in(reset)
    );
    wire _T_62;
    BITWISEOR #(.width(1)) bitwiseor_26 (
        .y(_T_62),
        .a(_T_60),
        .b(_T_61)
    );
    wire _T_64;
    EQ_UNSIGNED #(.width(1)) u_eq_27 (
        .y(_T_64),
        .a(_T_62),
        .b(1'h0)
    );
    wire _T_66;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_28 (
        .y(_WTEMP_6),
        .in(2'h2)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_29 (
        .y(_T_66),
        .a(_value__q),
        .b(_WTEMP_6)
    );
    wire _BBFEquals_4__out;
    wire [63:0] _BBFEquals_4__in2;
    wire [63:0] _BBFEquals_4__in1;
    BBFEquals BBFEquals_4 (
        .out(_BBFEquals_4__out),
        .in2(_BBFEquals_4__in2),
        .in1(_BBFEquals_4__in1)
    );
    wire _T_70;
    wire _T_71;
    BITS #(.width(1), .high(0), .low(0)) bits_30 (
        .y(_T_71),
        .in(reset)
    );
    wire _T_72;
    BITWISEOR #(.width(1)) bitwiseor_31 (
        .y(_T_72),
        .a(_T_70),
        .b(_T_71)
    );
    wire _T_74;
    EQ_UNSIGNED #(.width(1)) u_eq_32 (
        .y(_T_74),
        .a(_T_72),
        .b(1'h0)
    );
    wire _BBFEquals_5__out;
    wire [63:0] _BBFEquals_5__in2;
    wire [63:0] _BBFEquals_5__in1;
    BBFEquals BBFEquals_5 (
        .out(_BBFEquals_5__out),
        .in2(_BBFEquals_5__in2),
        .in1(_BBFEquals_5__in1)
    );
    wire _T_78;
    wire _T_79;
    BITS #(.width(1), .high(0), .low(0)) bits_33 (
        .y(_T_79),
        .in(reset)
    );
    wire _T_80;
    BITWISEOR #(.width(1)) bitwiseor_34 (
        .y(_T_80),
        .a(_T_78),
        .b(_T_79)
    );
    wire _T_82;
    EQ_UNSIGNED #(.width(1)) u_eq_35 (
        .y(_T_82),
        .a(_T_80),
        .b(1'h0)
    );
    wire _T_84;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_36 (
        .y(_WTEMP_7),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_37 (
        .y(_T_84),
        .a(_value__q),
        .b(_WTEMP_7)
    );
    wire _BBFEquals_6__out;
    wire [63:0] _BBFEquals_6__in2;
    wire [63:0] _BBFEquals_6__in1;
    BBFEquals BBFEquals_6 (
        .out(_BBFEquals_6__out),
        .in2(_BBFEquals_6__in2),
        .in1(_BBFEquals_6__in1)
    );
    wire _T_88;
    wire _T_89;
    BITS #(.width(1), .high(0), .low(0)) bits_38 (
        .y(_T_89),
        .in(reset)
    );
    wire _T_90;
    BITWISEOR #(.width(1)) bitwiseor_39 (
        .y(_T_90),
        .a(_T_88),
        .b(_T_89)
    );
    wire _T_92;
    EQ_UNSIGNED #(.width(1)) u_eq_40 (
        .y(_T_92),
        .a(_T_90),
        .b(1'h0)
    );
    wire _BBFEquals_7__out;
    wire [63:0] _BBFEquals_7__in2;
    wire [63:0] _BBFEquals_7__in1;
    BBFEquals BBFEquals_7 (
        .out(_BBFEquals_7__out),
        .in2(_BBFEquals_7__in2),
        .in1(_BBFEquals_7__in1)
    );
    wire _T_96;
    wire _T_97;
    BITS #(.width(1), .high(0), .low(0)) bits_41 (
        .y(_T_97),
        .in(reset)
    );
    wire _T_98;
    BITWISEOR #(.width(1)) bitwiseor_42 (
        .y(_T_98),
        .a(_T_96),
        .b(_T_97)
    );
    wire _T_100;
    EQ_UNSIGNED #(.width(1)) u_eq_43 (
        .y(_T_100),
        .a(_T_98),
        .b(1'h0)
    );
    wire [63:0] _node_1;
    assign _node_1 = addOut_node;
    wire _node_2;
    BITWISENOT #(.width(1)) bitwisenot_44 (
        .y(_node_2),
        .in(_T_66)
    );
    wire [63:0] _node_3;
    assign _node_3 = 64'h4010000000000000;
    wire _node_4;
    BITWISENOT #(.width(1)) bitwisenot_45 (
        .y(_node_4),
        .in(_T_66)
    );
    wire [63:0] _node_5;
    assign _node_5 = mulOut_node;
    wire _node_6;
    BITWISENOT #(.width(1)) bitwisenot_46 (
        .y(_node_6),
        .in(_T_66)
    );
    wire [63:0] _node_7;
    assign _node_7 = 64'h4020000000000000;
    wire _node_8;
    BITWISENOT #(.width(1)) bitwisenot_47 (
        .y(_node_8),
        .in(_T_66)
    );
    wire _node_9;
    assign _node_9 = _BBFEquals_6__out;
    wire _node_10;
    BITWISENOT #(.width(1)) bitwisenot_48 (
        .y(_node_10),
        .in(_T_66)
    );
    wire _node_11;
    assign _node_11 = _BBFEquals_7__out;
    wire _node_12;
    BITWISENOT #(.width(1)) bitwisenot_49 (
        .y(_node_12),
        .in(_T_66)
    );
    wire [63:0] _node_13;
    assign _node_13 = addOut_node;
    wire _node_14;
    BITWISENOT #(.width(1)) bitwisenot_50 (
        .y(_node_14),
        .in(_T_48)
    );
    wire [63:0] _node_15;
    assign _node_15 = 64'h4008000000000000;
    wire _node_16;
    BITWISENOT #(.width(1)) bitwisenot_51 (
        .y(_node_16),
        .in(_T_48)
    );
    wire [63:0] _node_17;
    assign _node_17 = mulOut_node;
    wire _node_18;
    BITWISENOT #(.width(1)) bitwisenot_52 (
        .y(_node_18),
        .in(_T_48)
    );
    wire [63:0] _node_19;
    assign _node_19 = 64'h4018000000000000;
    wire _node_20;
    BITWISENOT #(.width(1)) bitwisenot_53 (
        .y(_node_20),
        .in(_T_48)
    );
    wire [63:0] _node_21;
    assign _node_21 = _node_1;
    wire _node_22;
    BITWISENOT #(.width(1)) bitwisenot_54 (
        .y(_node_22),
        .in(_T_48)
    );
    wire [63:0] _node_23;
    assign _node_23 = _node_3;
    wire _node_24;
    BITWISENOT #(.width(1)) bitwisenot_55 (
        .y(_node_24),
        .in(_T_48)
    );
    wire [63:0] _node_25;
    assign _node_25 = _node_5;
    wire _node_26;
    BITWISENOT #(.width(1)) bitwisenot_56 (
        .y(_node_26),
        .in(_T_48)
    );
    wire [63:0] _node_27;
    assign _node_27 = _node_7;
    wire _node_28;
    BITWISENOT #(.width(1)) bitwisenot_57 (
        .y(_node_28),
        .in(_T_48)
    );
    wire _node_29;
    assign _node_29 = _BBFEquals_4__out;
    wire _node_30;
    BITWISENOT #(.width(1)) bitwisenot_58 (
        .y(_node_30),
        .in(_T_48)
    );
    wire _node_31;
    assign _node_31 = _BBFEquals_5__out;
    wire _node_32;
    BITWISENOT #(.width(1)) bitwisenot_59 (
        .y(_node_32),
        .in(_T_48)
    );
    wire _node_33;
    assign _node_33 = _node_9;
    wire _node_34;
    BITWISENOT #(.width(1)) bitwisenot_60 (
        .y(_node_34),
        .in(_T_48)
    );
    wire _node_35;
    assign _node_35 = _node_11;
    wire _node_36;
    BITWISENOT #(.width(1)) bitwisenot_61 (
        .y(_node_36),
        .in(_T_48)
    );
    wire [63:0] _node_37;
    assign _node_37 = addOut_node;
    wire _node_38;
    BITWISENOT #(.width(1)) bitwisenot_62 (
        .y(_node_38),
        .in(_T_30)
    );
    wire [63:0] _node_39;
    assign _node_39 = 64'h4000000000000000;
    wire _node_40;
    BITWISENOT #(.width(1)) bitwisenot_63 (
        .y(_node_40),
        .in(_T_30)
    );
    wire [63:0] _node_41;
    assign _node_41 = mulOut_node;
    wire _node_42;
    BITWISENOT #(.width(1)) bitwisenot_64 (
        .y(_node_42),
        .in(_T_30)
    );
    wire [63:0] _node_43;
    assign _node_43 = 64'h4010000000000000;
    wire _node_44;
    BITWISENOT #(.width(1)) bitwisenot_65 (
        .y(_node_44),
        .in(_T_30)
    );
    wire [63:0] _node_45;
    assign _node_45 = _node_13;
    wire _node_46;
    BITWISENOT #(.width(1)) bitwisenot_66 (
        .y(_node_46),
        .in(_T_30)
    );
    wire [63:0] _node_47;
    assign _node_47 = _node_15;
    wire _node_48;
    BITWISENOT #(.width(1)) bitwisenot_67 (
        .y(_node_48),
        .in(_T_30)
    );
    wire [63:0] _node_49;
    assign _node_49 = _node_17;
    wire _node_50;
    BITWISENOT #(.width(1)) bitwisenot_68 (
        .y(_node_50),
        .in(_T_30)
    );
    wire [63:0] _node_51;
    assign _node_51 = _node_19;
    wire _node_52;
    BITWISENOT #(.width(1)) bitwisenot_69 (
        .y(_node_52),
        .in(_T_30)
    );
    wire [63:0] _node_53;
    assign _node_53 = _node_21;
    wire _node_54;
    BITWISENOT #(.width(1)) bitwisenot_70 (
        .y(_node_54),
        .in(_T_30)
    );
    wire [63:0] _node_55;
    assign _node_55 = _node_23;
    wire _node_56;
    BITWISENOT #(.width(1)) bitwisenot_71 (
        .y(_node_56),
        .in(_T_30)
    );
    wire [63:0] _node_57;
    assign _node_57 = _node_25;
    wire _node_58;
    BITWISENOT #(.width(1)) bitwisenot_72 (
        .y(_node_58),
        .in(_T_30)
    );
    wire [63:0] _node_59;
    assign _node_59 = _node_27;
    wire _node_60;
    BITWISENOT #(.width(1)) bitwisenot_73 (
        .y(_node_60),
        .in(_T_30)
    );
    wire _node_61;
    assign _node_61 = _BBFEquals_2__out;
    wire _node_62;
    BITWISENOT #(.width(1)) bitwisenot_74 (
        .y(_node_62),
        .in(_T_30)
    );
    wire _node_63;
    assign _node_63 = _BBFEquals_3__out;
    wire _node_64;
    BITWISENOT #(.width(1)) bitwisenot_75 (
        .y(_node_64),
        .in(_T_30)
    );
    wire _node_65;
    assign _node_65 = _node_29;
    wire _node_66;
    BITWISENOT #(.width(1)) bitwisenot_76 (
        .y(_node_66),
        .in(_T_30)
    );
    wire _node_67;
    assign _node_67 = _node_31;
    wire _node_68;
    BITWISENOT #(.width(1)) bitwisenot_77 (
        .y(_node_68),
        .in(_T_30)
    );
    wire _node_69;
    assign _node_69 = _node_33;
    wire _node_70;
    BITWISENOT #(.width(1)) bitwisenot_78 (
        .y(_node_70),
        .in(_T_30)
    );
    wire _node_71;
    assign _node_71 = _node_35;
    wire _node_72;
    BITWISENOT #(.width(1)) bitwisenot_79 (
        .y(_node_72),
        .in(_T_30)
    );
    wire _T_102;
    wire [3:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_80 (
        .y(_WTEMP_8),
        .in(2'h3)
    );
    GEQ_UNSIGNED #(.width(4)) u_geq_81 (
        .y(_T_102),
        .a(_value__q),
        .b(_WTEMP_8)
    );
    wire _T_103;
    BITS #(.width(1), .high(0), .low(0)) bits_82 (
        .y(_T_103),
        .in(reset)
    );
    wire _T_105;
    EQ_UNSIGNED #(.width(1)) u_eq_83 (
        .y(_T_105),
        .a(_T_103),
        .b(1'h0)
    );
    assign _BBFAdd__in1 = _accum_node__q;
    assign _BBFAdd__in2 = 64'h3FF0000000000000;
    assign _BBFEquals__in1 = addOut_node;
    assign _BBFEquals__in2 = 64'h3FF0000000000000;
    assign _BBFEquals_1__in1 = mulOut_node;
    assign _BBFEquals_1__in2 = 64'h4000000000000000;
    assign _BBFEquals_2__in1 = _node_37;
    assign _BBFEquals_2__in2 = _node_39;
    assign _BBFEquals_3__in1 = _node_41;
    assign _BBFEquals_3__in2 = _node_43;
    assign _BBFEquals_4__in1 = _node_45;
    assign _BBFEquals_4__in2 = _node_47;
    assign _BBFEquals_5__in1 = _node_49;
    assign _BBFEquals_5__in2 = _node_51;
    assign _BBFEquals_6__in1 = _node_53;
    assign _BBFEquals_6__in2 = _node_55;
    assign _BBFEquals_7__in1 = _node_57;
    assign _BBFEquals_7__in2 = _node_59;
    assign _BBFMultiply__in1 = addOut_node;
    assign _BBFMultiply__in2 = 64'h4000000000000000;
    assign _T_34 = _BBFEquals__out;
    assign _T_42 = _BBFEquals_1__out;
    assign _T_52 = _node_61;
    assign _T_60 = _node_63;
    assign _T_70 = _node_65;
    assign _T_78 = _node_67;
    assign _T_88 = _node_69;
    assign _T_96 = _node_71;
    assign _WTEMP_3 = addOut_node;
    assign addOut_node = _BBFAdd__out;
    assign mulOut_node = _BBFMultiply__out;
    MUX_UNSIGNED #(.width(4)) u_mux_84 (
        .y(_WTEMP_0),
        .sel(1'h1),
        .a(_node_0),
        .b(_value__q)
    );
endmodule //BlackBoxFloatTester
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module GEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a >= b;
endmodule // GEQ_UNSIGNED
