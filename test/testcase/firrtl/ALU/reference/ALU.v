module ALU(
    input clock,
    input reset,
    input [31:0] io_in1,
    input [31:0] io_in2,
    input [12:0] io_alu_opcode,
    output [31:0] io_out
);
    wire [12:0] mux_alu_opcode;
    BITS #(.width(13), .high(12), .low(0)) bits_1 (
        .y(mux_alu_opcode),
        .in(io_alu_opcode)
    );
    wire [32:0] _T_7;
    ADD_UNSIGNED #(.width(32)) u_add_2 (
        .y(_T_7),
        .a(io_in1),
        .b(io_in2)
    );
    wire [31:0] _T_8;
    TAIL #(.width(33), .n(1)) tail_3 (
        .y(_T_8),
        .in(_T_7)
    );
    wire [32:0] _T_9;
    SUB_UNSIGNED #(.width(32)) u_sub_4 (
        .y(_T_9),
        .a(io_in1),
        .b(io_in2)
    );
    wire [32:0] _T_10;
    ASUINT #(.width(33)) asuint_5 (
        .y(_T_10),
        .in(_T_9)
    );
    wire [31:0] _T_11;
    TAIL #(.width(33), .n(1)) tail_6 (
        .y(_T_11),
        .in(_T_10)
    );
    wire [31:0] _T_12;
    BITWISEAND #(.width(32)) bitwiseand_7 (
        .y(_T_12),
        .a(io_in1),
        .b(io_in2)
    );
    wire [31:0] _T_13;
    BITWISEOR #(.width(32)) bitwiseor_8 (
        .y(_T_13),
        .a(io_in1),
        .b(io_in2)
    );
    wire [31:0] _T_14;
    BITWISEXOR #(.width(32)) bitwisexor_9 (
        .y(_T_14),
        .a(io_in1),
        .b(io_in2)
    );
    wire [31:0] _T_15;
    BITWISEXOR #(.width(32)) bitwisexor_10 (
        .y(_T_15),
        .a(io_in1),
        .b(io_in2)
    );
    wire [31:0] _T_16;
    BITWISENOT #(.width(32)) bitwisenot_11 (
        .y(_T_16),
        .in(_T_15)
    );
    wire [4:0] _T_17;
    BITS #(.width(32), .high(4), .low(0)) bits_12 (
        .y(_T_17),
        .in(io_in2)
    );
    wire [62:0] _T_18;
    DSHL_UNSIGNED #(.width_in(32), .width_n(5)) u_dshl_13 (
        .y(_T_18),
        .in(io_in1),
        .n(_T_17)
    );
    wire [4:0] _T_19;
    BITS #(.width(32), .high(4), .low(0)) bits_14 (
        .y(_T_19),
        .in(io_in2)
    );
    wire [31:0] _T_20;
    DSHR_UNSIGNED #(.width_in(32), .width_n(5)) u_dshr_15 (
        .y(_T_20),
        .in(io_in1),
        .n(_T_19)
    );
    wire [31:0] _T_21;
    ASSINT #(.width(32)) assint_16 (
        .y(_T_21),
        .in(io_in1)
    );
    wire [4:0] _T_22;
    BITS #(.width(32), .high(4), .low(0)) bits_17 (
        .y(_T_22),
        .in(io_in2)
    );
    wire [31:0] _T_23;
    DSHR_SIGNED #(.width_in(32), .width_n(5)) s_dshr_18 (
        .y(_T_23),
        .in(_T_21),
        .n(_T_22)
    );
    wire [31:0] _T_24;
    ASUINT #(.width(32)) asuint_19 (
        .y(_T_24),
        .in(_T_23)
    );
    wire [31:0] _T_25;
    ASSINT #(.width(32)) assint_20 (
        .y(_T_25),
        .in(io_in1)
    );
    wire [31:0] _T_26;
    ASSINT #(.width(32)) assint_21 (
        .y(_T_26),
        .in(io_in2)
    );
    wire _T_27;
    LT_SIGNED #(.width(32)) s_lt_22 (
        .y(_T_27),
        .a(_T_25),
        .b(_T_26)
    );
    wire _T_28;
    LT_UNSIGNED #(.width(32)) u_lt_23 (
        .y(_T_28),
        .a(io_in1),
        .b(io_in2)
    );
    wire _T_29;
    wire [12:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(4), .n(13)) u_pad_24 (
        .y(_WTEMP_0),
        .in(4'hD)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_25 (
        .y(_T_29),
        .a(_WTEMP_0),
        .b(mux_alu_opcode)
    );
    wire [31:0] _T_30;
    MUX_UNSIGNED #(.width(32)) u_mux_26 (
        .y(_T_30),
        .sel(_T_29),
        .a(io_in2),
        .b(32'hDEADF00D)
    );
    wire _T_31;
    wire [12:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(4), .n(13)) u_pad_27 (
        .y(_WTEMP_1),
        .in(4'hC)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_28 (
        .y(_T_31),
        .a(_WTEMP_1),
        .b(mux_alu_opcode)
    );
    wire [31:0] _T_32;
    MUX_UNSIGNED #(.width(32)) u_mux_29 (
        .y(_T_32),
        .sel(_T_31),
        .a(io_in1),
        .b(_T_30)
    );
    wire _T_33;
    wire [12:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(4), .n(13)) u_pad_30 (
        .y(_WTEMP_2),
        .in(4'hB)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_31 (
        .y(_T_33),
        .a(_WTEMP_2),
        .b(mux_alu_opcode)
    );
    wire [31:0] _T_34;
    wire [31:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_32 (
        .y(_WTEMP_3),
        .in(_T_28)
    );
    MUX_UNSIGNED #(.width(32)) u_mux_33 (
        .y(_T_34),
        .sel(_T_33),
        .a(_WTEMP_3),
        .b(_T_32)
    );
    wire _T_35;
    wire [12:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(4), .n(13)) u_pad_34 (
        .y(_WTEMP_4),
        .in(4'hA)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_35 (
        .y(_T_35),
        .a(_WTEMP_4),
        .b(mux_alu_opcode)
    );
    wire [31:0] _T_36;
    wire [31:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_36 (
        .y(_WTEMP_5),
        .in(_T_27)
    );
    MUX_UNSIGNED #(.width(32)) u_mux_37 (
        .y(_T_36),
        .sel(_T_35),
        .a(_WTEMP_5),
        .b(_T_34)
    );
    wire _T_37;
    wire [12:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(4), .n(13)) u_pad_38 (
        .y(_WTEMP_6),
        .in(4'h9)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_39 (
        .y(_T_37),
        .a(_WTEMP_6),
        .b(mux_alu_opcode)
    );
    wire [31:0] _T_38;
    MUX_UNSIGNED #(.width(32)) u_mux_40 (
        .y(_T_38),
        .sel(_T_37),
        .a(_T_24),
        .b(_T_36)
    );
    wire _T_39;
    wire [12:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(4), .n(13)) u_pad_41 (
        .y(_WTEMP_7),
        .in(4'h8)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_42 (
        .y(_T_39),
        .a(_WTEMP_7),
        .b(mux_alu_opcode)
    );
    wire [31:0] _T_40;
    MUX_UNSIGNED #(.width(32)) u_mux_43 (
        .y(_T_40),
        .sel(_T_39),
        .a(_T_20),
        .b(_T_38)
    );
    wire _T_41;
    wire [12:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(3), .n(13)) u_pad_44 (
        .y(_WTEMP_8),
        .in(3'h7)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_45 (
        .y(_T_41),
        .a(_WTEMP_8),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_42;
    wire [62:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_46 (
        .y(_WTEMP_9),
        .in(_T_40)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_47 (
        .y(_T_42),
        .sel(_T_41),
        .a(_T_18),
        .b(_WTEMP_9)
    );
    wire _T_43;
    wire [12:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(3), .n(13)) u_pad_48 (
        .y(_WTEMP_10),
        .in(3'h6)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_49 (
        .y(_T_43),
        .a(_WTEMP_10),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_44;
    wire [62:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_50 (
        .y(_WTEMP_11),
        .in(_T_16)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_51 (
        .y(_T_44),
        .sel(_T_43),
        .a(_WTEMP_11),
        .b(_T_42)
    );
    wire _T_45;
    wire [12:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(3), .n(13)) u_pad_52 (
        .y(_WTEMP_12),
        .in(3'h5)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_53 (
        .y(_T_45),
        .a(_WTEMP_12),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_46;
    wire [62:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_54 (
        .y(_WTEMP_13),
        .in(_T_14)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_55 (
        .y(_T_46),
        .sel(_T_45),
        .a(_WTEMP_13),
        .b(_T_44)
    );
    wire _T_47;
    wire [12:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(3), .n(13)) u_pad_56 (
        .y(_WTEMP_14),
        .in(3'h4)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_57 (
        .y(_T_47),
        .a(_WTEMP_14),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_48;
    wire [62:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_58 (
        .y(_WTEMP_15),
        .in(_T_13)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_59 (
        .y(_T_48),
        .sel(_T_47),
        .a(_WTEMP_15),
        .b(_T_46)
    );
    wire _T_49;
    wire [12:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(2), .n(13)) u_pad_60 (
        .y(_WTEMP_16),
        .in(2'h3)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_61 (
        .y(_T_49),
        .a(_WTEMP_16),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_50;
    wire [62:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_62 (
        .y(_WTEMP_17),
        .in(_T_12)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_63 (
        .y(_T_50),
        .sel(_T_49),
        .a(_WTEMP_17),
        .b(_T_48)
    );
    wire _T_51;
    wire [12:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(2), .n(13)) u_pad_64 (
        .y(_WTEMP_18),
        .in(2'h2)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_65 (
        .y(_T_51),
        .a(_WTEMP_18),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_52;
    wire [62:0] _WTEMP_19;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_66 (
        .y(_WTEMP_19),
        .in(_T_11)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_67 (
        .y(_T_52),
        .sel(_T_51),
        .a(_WTEMP_19),
        .b(_T_50)
    );
    wire _T_53;
    wire [12:0] _WTEMP_20;
    PAD_UNSIGNED #(.width(1), .n(13)) u_pad_68 (
        .y(_WTEMP_20),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(13)) u_eq_69 (
        .y(_T_53),
        .a(_WTEMP_20),
        .b(mux_alu_opcode)
    );
    wire [62:0] _T_54;
    wire [62:0] _WTEMP_21;
    PAD_UNSIGNED #(.width(32), .n(63)) u_pad_70 (
        .y(_WTEMP_21),
        .in(_T_8)
    );
    MUX_UNSIGNED #(.width(63)) u_mux_71 (
        .y(_T_54),
        .sel(_T_53),
        .a(_WTEMP_21),
        .b(_T_52)
    );
    wire _T_57;
    EQ_UNSIGNED #(.width(1)) u_eq_72 (
        .y(_T_57),
        .a(reset),
        .b(1'h0)
    );
    BITS #(.width(63), .high(31), .low(0)) bits_73 (
        .y(io_out),
        .in(_T_54)
    );
endmodule //ALU
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
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
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module BITWISEXOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a ^ b;
endmodule // BITWISEXOR
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module DSHL_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [(width_in+2**width_n-1)-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    wire [(width_in+2**width_n-1)-1:0] temp;
    assign temp = {{(2**width_n-1){1'b0}}, in};
    assign y = temp << n;
endmodule // DSHL_UNSIGNED
module DSHR_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = in >> n;
endmodule // DSHR_UNSIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module DSHR_SIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = $signed(in) >>> n;
endmodule // DSHR_SIGNED
module LT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) < $signed(b);
endmodule // LT_SIGNED
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
