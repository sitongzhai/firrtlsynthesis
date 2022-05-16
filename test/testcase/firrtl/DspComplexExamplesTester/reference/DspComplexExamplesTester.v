module DspComplexExamplesTester(
    input clock,
    input reset
);
    wire _dut__clock;
    wire _dut__reset;
    wire [4:0] _dut__io_in_real;
    wire [4:0] _dut__io_in_imag;
    wire [4:0] _dut__io_outJ_real;
    wire [4:0] _dut__io_outJ_imag;
    wire [4:0] _dut__io_inByJ_real;
    wire [4:0] _dut__io_inByJ_imag;
    wire [4:0] _dut__io_inByJShortcut_real;
    wire [4:0] _dut__io_inByJShortcut_imag;
    DspComplexExamples dut (
        .clock(_dut__clock),
        .reset(_dut__reset),
        .io_in_real(_dut__io_in_real),
        .io_in_imag(_dut__io_in_imag),
        .io_outJ_real(_dut__io_outJ_real),
        .io_outJ_imag(_dut__io_outJ_imag),
        .io_inByJ_real(_dut__io_inByJ_real),
        .io_inByJ_imag(_dut__io_inByJ_imag),
        .io_inByJShortcut_real(_dut__io_inByJShortcut_real),
        .io_inByJShortcut_imag(_dut__io_inByJShortcut_imag)
    );
    wire _T_4;
    BITS #(.width(1), .high(0), .low(0)) bits_31 (
        .y(_T_4),
        .in(reset)
    );
    wire _T_6;
    EQ_UNSIGNED #(.width(1)) u_eq_32 (
        .y(_T_6),
        .a(_T_4),
        .b(1'h0)
    );
    wire _T_7;
    BITS #(.width(1), .high(0), .low(0)) bits_33 (
        .y(_T_7),
        .in(reset)
    );
    wire _T_9;
    EQ_UNSIGNED #(.width(1)) u_eq_34 (
        .y(_T_9),
        .a(_T_7),
        .b(1'h0)
    );
    wire _T_10;
    BITS #(.width(1), .high(0), .low(0)) bits_35 (
        .y(_T_10),
        .in(reset)
    );
    wire _T_12;
    EQ_UNSIGNED #(.width(1)) u_eq_36 (
        .y(_T_12),
        .a(_T_10),
        .b(1'h0)
    );
    wire _T_13;
    BITS #(.width(1), .high(0), .low(0)) bits_37 (
        .y(_T_13),
        .in(reset)
    );
    wire _T_15;
    EQ_UNSIGNED #(.width(1)) u_eq_38 (
        .y(_T_15),
        .a(_T_13),
        .b(1'h0)
    );
    wire _T_17;
    wire [4:0] _WTEMP_5;
    PAD_SIGNED #(.width(1), .n(5)) s_pad_39 (
        .y(_WTEMP_5),
        .in(1'sh0)
    );
    EQ_SIGNED #(.width(5)) s_eq_40 (
        .y(_T_17),
        .a(_dut__io_outJ_real),
        .b(_WTEMP_5)
    );
    wire _T_18;
    BITS #(.width(1), .high(0), .low(0)) bits_41 (
        .y(_T_18),
        .in(reset)
    );
    wire _T_19;
    BITWISEOR #(.width(1)) bitwiseor_42 (
        .y(_T_19),
        .a(_T_17),
        .b(_T_18)
    );
    wire _T_21;
    EQ_UNSIGNED #(.width(1)) u_eq_43 (
        .y(_T_21),
        .a(_T_19),
        .b(1'h0)
    );
    wire _T_23;
    wire [4:0] _WTEMP_6;
    PAD_SIGNED #(.width(2), .n(5)) s_pad_44 (
        .y(_WTEMP_6),
        .in(2'sh1)
    );
    EQ_SIGNED #(.width(5)) s_eq_45 (
        .y(_T_23),
        .a(_dut__io_outJ_imag),
        .b(_WTEMP_6)
    );
    wire _T_24;
    BITS #(.width(1), .high(0), .low(0)) bits_46 (
        .y(_T_24),
        .in(reset)
    );
    wire _T_25;
    BITWISEOR #(.width(1)) bitwiseor_47 (
        .y(_T_25),
        .a(_T_23),
        .b(_T_24)
    );
    wire _T_27;
    EQ_UNSIGNED #(.width(1)) u_eq_48 (
        .y(_T_27),
        .a(_T_25),
        .b(1'h0)
    );
    wire _T_29;
    wire [4:0] _WTEMP_7;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_49 (
        .y(_WTEMP_7),
        .in(4'sh4)
    );
    EQ_SIGNED #(.width(5)) s_eq_50 (
        .y(_T_29),
        .a(_dut__io_inByJ_real),
        .b(_WTEMP_7)
    );
    wire _T_30;
    BITS #(.width(1), .high(0), .low(0)) bits_51 (
        .y(_T_30),
        .in(reset)
    );
    wire _T_31;
    BITWISEOR #(.width(1)) bitwiseor_52 (
        .y(_T_31),
        .a(_T_29),
        .b(_T_30)
    );
    wire _T_33;
    EQ_UNSIGNED #(.width(1)) u_eq_53 (
        .y(_T_33),
        .a(_T_31),
        .b(1'h0)
    );
    wire _T_35;
    wire [4:0] _WTEMP_8;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_54 (
        .y(_WTEMP_8),
        .in(4'sh7)
    );
    EQ_SIGNED #(.width(5)) s_eq_55 (
        .y(_T_35),
        .a(_dut__io_inByJ_imag),
        .b(_WTEMP_8)
    );
    wire _T_36;
    BITS #(.width(1), .high(0), .low(0)) bits_56 (
        .y(_T_36),
        .in(reset)
    );
    wire _T_37;
    BITWISEOR #(.width(1)) bitwiseor_57 (
        .y(_T_37),
        .a(_T_35),
        .b(_T_36)
    );
    wire _T_39;
    EQ_UNSIGNED #(.width(1)) u_eq_58 (
        .y(_T_39),
        .a(_T_37),
        .b(1'h0)
    );
    wire _T_41;
    wire [4:0] _WTEMP_9;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_59 (
        .y(_WTEMP_9),
        .in(4'sh4)
    );
    EQ_SIGNED #(.width(5)) s_eq_60 (
        .y(_T_41),
        .a(_dut__io_inByJShortcut_real),
        .b(_WTEMP_9)
    );
    wire _T_42;
    BITS #(.width(1), .high(0), .low(0)) bits_61 (
        .y(_T_42),
        .in(reset)
    );
    wire _T_43;
    BITWISEOR #(.width(1)) bitwiseor_62 (
        .y(_T_43),
        .a(_T_41),
        .b(_T_42)
    );
    wire _T_45;
    EQ_UNSIGNED #(.width(1)) u_eq_63 (
        .y(_T_45),
        .a(_T_43),
        .b(1'h0)
    );
    wire _T_47;
    wire [4:0] _WTEMP_10;
    PAD_SIGNED #(.width(4), .n(5)) s_pad_64 (
        .y(_WTEMP_10),
        .in(4'sh7)
    );
    EQ_SIGNED #(.width(5)) s_eq_65 (
        .y(_T_47),
        .a(_dut__io_inByJShortcut_imag),
        .b(_WTEMP_10)
    );
    wire _T_48;
    BITS #(.width(1), .high(0), .low(0)) bits_66 (
        .y(_T_48),
        .in(reset)
    );
    wire _T_49;
    BITWISEOR #(.width(1)) bitwiseor_67 (
        .y(_T_49),
        .a(_T_47),
        .b(_T_48)
    );
    wire _T_51;
    EQ_UNSIGNED #(.width(1)) u_eq_68 (
        .y(_T_51),
        .a(_T_49),
        .b(1'h0)
    );
    wire _T_52;
    BITS #(.width(1), .high(0), .low(0)) bits_69 (
        .y(_T_52),
        .in(reset)
    );
    wire _T_54;
    EQ_UNSIGNED #(.width(1)) u_eq_70 (
        .y(_T_54),
        .a(_T_52),
        .b(1'h0)
    );
    assign _dut__clock = clock;
    PAD_SIGNED #(.width(3), .n(5)) s_pad_71 (
        .y(_dut__io_in_imag),
        .in(-3'sh4)
    );
    PAD_SIGNED #(.width(4), .n(5)) s_pad_72 (
        .y(_dut__io_in_real),
        .in(4'sh7)
    );
    assign _dut__reset = reset;
endmodule //DspComplexExamplesTester
module DspComplexExamples(
    input clock,
    input reset,
    input [4:0] io_in_real,
    input [4:0] io_in_imag,
    output [4:0] io_outJ_real,
    output [4:0] io_outJ_imag,
    output [4:0] io_inByJ_real,
    output [4:0] io_inByJ_imag,
    output [4:0] io_inByJShortcut_real,
    output [4:0] io_inByJShortcut_imag
);
    wire _T_39_real;
    wire [1:0] _T_39_imag;
    wire _T_49_real;
    wire [1:0] _T_49_imag;
    wire [2:0] _T_50;
    wire [1:0] _WTEMP_0;
    PAD_SIGNED #(.width(1), .n(2)) s_pad_1 (
        .y(_WTEMP_0),
        .in(_T_49_real)
    );
    ADD_SIGNED #(.width(2)) s_add_2 (
        .y(_T_50),
        .a(_WTEMP_0),
        .b(_T_49_imag)
    );
    wire [1:0] _T_51;
    TAIL #(.width(3), .n(1)) tail_3 (
        .y(_T_51),
        .in(_T_50)
    );
    wire [1:0] _T_52;
    ASSINT #(.width(2)) assint_4 (
        .y(_T_52),
        .in(_T_51)
    );
    wire [5:0] _T_53;
    ADD_SIGNED #(.width(5)) s_add_5 (
        .y(_T_53),
        .a(io_in_real),
        .b(io_in_imag)
    );
    wire [4:0] _T_54;
    TAIL #(.width(6), .n(1)) tail_6 (
        .y(_T_54),
        .in(_T_53)
    );
    wire [4:0] _T_55;
    ASSINT #(.width(5)) assint_7 (
        .y(_T_55),
        .in(_T_54)
    );
    wire [5:0] _T_56;
    SUB_SIGNED #(.width(5)) s_sub_8 (
        .y(_T_56),
        .a(io_in_imag),
        .b(io_in_real)
    );
    wire [4:0] _T_57;
    TAIL #(.width(6), .n(1)) tail_9 (
        .y(_T_57),
        .in(_T_56)
    );
    wire [4:0] _T_58;
    ASSINT #(.width(5)) assint_10 (
        .y(_T_58),
        .in(_T_57)
    );
    wire [6:0] _T_59;
    MUL2_SIGNED #(.width_a(5), .width_b(2)) s_mul2_11 (
        .y(_T_59),
        .a(io_in_real),
        .b(_T_52)
    );
    wire [6:0] _T_60;
    MUL2_SIGNED #(.width_a(5), .width_b(2)) s_mul2_12 (
        .y(_T_60),
        .a(_T_55),
        .b(_T_49_imag)
    );
    wire [5:0] _T_61;
    MUL2_SIGNED #(.width_a(5), .width_b(1)) s_mul2_13 (
        .y(_T_61),
        .a(_T_58),
        .b(_T_49_real)
    );
    wire [7:0] _T_62;
    SUB_SIGNED #(.width(7)) s_sub_14 (
        .y(_T_62),
        .a(_T_59),
        .b(_T_60)
    );
    wire [6:0] _T_63;
    TAIL #(.width(8), .n(1)) tail_15 (
        .y(_T_63),
        .in(_T_62)
    );
    wire [6:0] _T_64;
    ASSINT #(.width(7)) assint_16 (
        .y(_T_64),
        .in(_T_63)
    );
    wire [7:0] _T_65;
    wire [6:0] _WTEMP_1;
    PAD_SIGNED #(.width(6), .n(7)) s_pad_17 (
        .y(_WTEMP_1),
        .in(_T_61)
    );
    ADD_SIGNED #(.width(7)) s_add_18 (
        .y(_T_65),
        .a(_T_59),
        .b(_WTEMP_1)
    );
    wire [6:0] _T_66;
    TAIL #(.width(8), .n(1)) tail_19 (
        .y(_T_66),
        .in(_T_65)
    );
    wire [6:0] _T_67;
    ASSINT #(.width(7)) assint_20 (
        .y(_T_67),
        .in(_T_66)
    );
    wire [6:0] _T_75_real;
    wire [6:0] _T_75_imag;
    wire [5:0] _T_77;
    wire [4:0] _WTEMP_2;
    PAD_SIGNED #(.width(1), .n(5)) s_pad_21 (
        .y(_WTEMP_2),
        .in(1'sh0)
    );
    SUB_SIGNED #(.width(5)) s_sub_22 (
        .y(_T_77),
        .a(_WTEMP_2),
        .b(io_in_imag)
    );
    wire [4:0] _T_78;
    TAIL #(.width(6), .n(1)) tail_23 (
        .y(_T_78),
        .in(_T_77)
    );
    wire [4:0] _T_79;
    ASSINT #(.width(5)) assint_24 (
        .y(_T_79),
        .in(_T_78)
    );
    wire [4:0] _T_87_real;
    wire [4:0] _T_87_imag;
    assign _T_39_imag = 2'sh1;
    assign _T_39_real = 1'sh0;
    assign _T_49_imag = 2'sh1;
    assign _T_49_real = 1'sh0;
    assign _T_75_imag = _T_67;
    assign _T_75_real = _T_64;
    assign _T_87_imag = io_in_real;
    assign _T_87_real = _T_79;
    wire [4:0] _WTEMP_3;
    BITS #(.width(7), .high(4), .low(0)) bits_25 (
        .y(_WTEMP_3),
        .in(_T_75_imag)
    );
    ASSINT #(.width(5)) assint_26 (
        .y(io_inByJ_imag),
        .in(_WTEMP_3)
    );
    wire [4:0] _WTEMP_4;
    BITS #(.width(7), .high(4), .low(0)) bits_27 (
        .y(_WTEMP_4),
        .in(_T_75_real)
    );
    ASSINT #(.width(5)) assint_28 (
        .y(io_inByJ_real),
        .in(_WTEMP_4)
    );
    assign io_inByJShortcut_imag = _T_87_imag;
    assign io_inByJShortcut_real = _T_87_real;
    PAD_SIGNED #(.width(2), .n(5)) s_pad_29 (
        .y(io_outJ_imag),
        .in(_T_39_imag)
    );
    PAD_SIGNED #(.width(1), .n(5)) s_pad_30 (
        .y(io_outJ_real),
        .in(_T_39_real)
    );
endmodule //DspComplexExamples
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
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
