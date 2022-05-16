module SimpleLitModule(
    input clock,
    input reset,
    input [63:0] io_i_r_node,
    input io_i_b,
    input [15:0] io_i_cGenL_real,
    input [15:0] io_i_cGenL_imag,
    input [7:0] io_i_cFS_real,
    input [7:0] io_i_cFS_imag,
    input [63:0] io_i_cR_real_node,
    input [63:0] io_i_cR_imag_node,
    input [7:0] io_i_short_gen,
    input [7:0] io_i_short_s,
    input [7:0] io_i_short_f,
    input [7:0] io_i_short_u,
    input [15:0] io_i_long_gen,
    input [15:0] io_i_long_s,
    input [15:0] io_i_long_f,
    input [15:0] io_i_long_u,
    input [7:0] io_i_vU_0,
    input [7:0] io_i_vU_1,
    input [7:0] io_i_vU_2,
    input [7:0] io_i_vU_3,
    input [7:0] io_i_vU_4,
    input [7:0] io_i_vU_5,
    input [7:0] io_i_vU_6,
    input [7:0] io_i_vU_7,
    input [7:0] io_i_vU_8,
    input [7:0] io_i_vU_9,
    input [7:0] io_i_vS_0,
    input [7:0] io_i_vS_1,
    input [7:0] io_i_vS_2,
    input [7:0] io_i_vS_3,
    input [7:0] io_i_vS_4,
    input [7:0] io_i_vS_5,
    input [7:0] io_i_vS_6,
    input [7:0] io_i_vS_7,
    input [7:0] io_i_vS_8,
    input [7:0] io_i_vS_9,
    input [7:0] io_i_vF_0,
    input [7:0] io_i_vF_1,
    input [7:0] io_i_vF_2,
    input [7:0] io_i_vF_3,
    input [7:0] io_i_vF_4,
    input [7:0] io_i_vF_5,
    input [7:0] io_i_vF_6,
    input [7:0] io_i_vF_7,
    input [7:0] io_i_vF_8,
    input [7:0] io_i_vF_9,
    output [63:0] io_o_r_node,
    output io_o_b,
    output [15:0] io_o_cGenL_real,
    output [15:0] io_o_cGenL_imag,
    output [7:0] io_o_cFS_real,
    output [7:0] io_o_cFS_imag,
    output [63:0] io_o_cR_real_node,
    output [63:0] io_o_cR_imag_node,
    output [7:0] io_o_short_gen,
    output [7:0] io_o_short_s,
    output [7:0] io_o_short_f,
    output [7:0] io_o_short_u,
    output [15:0] io_o_long_gen,
    output [15:0] io_o_long_s,
    output [15:0] io_o_long_f,
    output [15:0] io_o_long_u,
    output [7:0] io_o_vU_0,
    output [7:0] io_o_vU_1,
    output [7:0] io_o_vU_2,
    output [7:0] io_o_vU_3,
    output [7:0] io_o_vU_4,
    output [7:0] io_o_vU_5,
    output [7:0] io_o_vU_6,
    output [7:0] io_o_vU_7,
    output [7:0] io_o_vU_8,
    output [7:0] io_o_vU_9,
    output [7:0] io_o_vS_0,
    output [7:0] io_o_vS_1,
    output [7:0] io_o_vS_2,
    output [7:0] io_o_vS_3,
    output [7:0] io_o_vS_4,
    output [7:0] io_o_vS_5,
    output [7:0] io_o_vS_6,
    output [7:0] io_o_vS_7,
    output [7:0] io_o_vS_8,
    output [7:0] io_o_vS_9,
    output [7:0] io_o_vF_0,
    output [7:0] io_o_vF_1,
    output [7:0] io_o_vF_2,
    output [7:0] io_o_vF_3,
    output [7:0] io_o_vF_4,
    output [7:0] io_o_vF_5,
    output [7:0] io_o_vF_6,
    output [7:0] io_o_vF_7,
    output [7:0] io_o_vF_8,
    output [7:0] io_o_vF_9
);
    wire [7:0] lutGen_0;
    wire [7:0] lutGen_1;
    wire [7:0] lutGen_2;
    wire [7:0] lutGen_3;
    wire [7:0] lutGen_4;
    wire [7:0] lutGen_5;
    wire [7:0] lutGen_6;
    wire [7:0] lutGen_7;
    wire [7:0] lutGen_8;
    wire [7:0] lutGen_9;
    wire [7:0] lutS_0;
    wire [7:0] lutS_1;
    wire [7:0] lutS_2;
    wire [7:0] lutS_3;
    wire [7:0] lutS_4;
    wire [7:0] lutS_5;
    wire [7:0] lutS_6;
    wire [7:0] lutS_7;
    wire [7:0] lutS_8;
    wire [7:0] lutS_9;
    wire [3:0] _T_314;
    BITS #(.width(8), .high(3), .low(0)) bits_1 (
        .y(_T_314),
        .in(io_i_short_u)
    );
    wire _node_0;
    EQ_UNSIGNED #(.width(4)) u_eq_2 (
        .y(_node_0),
        .a(4'd0),
        .b(_T_314)
    );
    wire [7:0] _node_1;
    assign _node_1 = lutGen_0;
    wire _node_2;
    EQ_UNSIGNED #(.width(4)) u_eq_3 (
        .y(_node_2),
        .a(4'd1),
        .b(_T_314)
    );
    wire [7:0] _node_3;
    MUX_SIGNED #(.width(8)) s_mux_4 (
        .y(_node_3),
        .sel(_node_2),
        .a(lutGen_1),
        .b(_node_1)
    );
    wire _node_4;
    EQ_UNSIGNED #(.width(4)) u_eq_5 (
        .y(_node_4),
        .a(4'd2),
        .b(_T_314)
    );
    wire [7:0] _node_5;
    MUX_SIGNED #(.width(8)) s_mux_6 (
        .y(_node_5),
        .sel(_node_4),
        .a(lutGen_2),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(4)) u_eq_7 (
        .y(_node_6),
        .a(4'd3),
        .b(_T_314)
    );
    wire [7:0] _node_7;
    MUX_SIGNED #(.width(8)) s_mux_8 (
        .y(_node_7),
        .sel(_node_6),
        .a(lutGen_3),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(4)) u_eq_9 (
        .y(_node_8),
        .a(4'd4),
        .b(_T_314)
    );
    wire [7:0] _node_9;
    MUX_SIGNED #(.width(8)) s_mux_10 (
        .y(_node_9),
        .sel(_node_8),
        .a(lutGen_4),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(4)) u_eq_11 (
        .y(_node_10),
        .a(4'd5),
        .b(_T_314)
    );
    wire [7:0] _node_11;
    MUX_SIGNED #(.width(8)) s_mux_12 (
        .y(_node_11),
        .sel(_node_10),
        .a(lutGen_5),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(4)) u_eq_13 (
        .y(_node_12),
        .a(4'd6),
        .b(_T_314)
    );
    wire [7:0] _node_13;
    MUX_SIGNED #(.width(8)) s_mux_14 (
        .y(_node_13),
        .sel(_node_12),
        .a(lutGen_6),
        .b(_node_11)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(4)) u_eq_15 (
        .y(_node_14),
        .a(4'd7),
        .b(_T_314)
    );
    wire [7:0] _node_15;
    MUX_SIGNED #(.width(8)) s_mux_16 (
        .y(_node_15),
        .sel(_node_14),
        .a(lutGen_7),
        .b(_node_13)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(4)) u_eq_17 (
        .y(_node_16),
        .a(4'd8),
        .b(_T_314)
    );
    wire [7:0] _node_17;
    MUX_SIGNED #(.width(8)) s_mux_18 (
        .y(_node_17),
        .sel(_node_16),
        .a(lutGen_8),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(4)) u_eq_19 (
        .y(_node_18),
        .a(4'd9),
        .b(_T_314)
    );
    wire [7:0] _node_19;
    MUX_SIGNED #(.width(8)) s_mux_20 (
        .y(_node_19),
        .sel(_node_18),
        .a(lutGen_9),
        .b(_node_17)
    );
    wire [3:0] _T_316;
    BITS #(.width(8), .high(3), .low(0)) bits_21 (
        .y(_T_316),
        .in(io_i_short_u)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(4)) u_eq_22 (
        .y(_node_20),
        .a(4'd0),
        .b(_T_316)
    );
    wire [7:0] _node_21;
    assign _node_21 = lutS_0;
    wire _node_22;
    EQ_UNSIGNED #(.width(4)) u_eq_23 (
        .y(_node_22),
        .a(4'd1),
        .b(_T_316)
    );
    wire [7:0] _node_23;
    MUX_SIGNED #(.width(8)) s_mux_24 (
        .y(_node_23),
        .sel(_node_22),
        .a(lutS_1),
        .b(_node_21)
    );
    wire _node_24;
    EQ_UNSIGNED #(.width(4)) u_eq_25 (
        .y(_node_24),
        .a(4'd2),
        .b(_T_316)
    );
    wire [7:0] _node_25;
    MUX_SIGNED #(.width(8)) s_mux_26 (
        .y(_node_25),
        .sel(_node_24),
        .a(lutS_2),
        .b(_node_23)
    );
    wire _node_26;
    EQ_UNSIGNED #(.width(4)) u_eq_27 (
        .y(_node_26),
        .a(4'd3),
        .b(_T_316)
    );
    wire [7:0] _node_27;
    MUX_SIGNED #(.width(8)) s_mux_28 (
        .y(_node_27),
        .sel(_node_26),
        .a(lutS_3),
        .b(_node_25)
    );
    wire _node_28;
    EQ_UNSIGNED #(.width(4)) u_eq_29 (
        .y(_node_28),
        .a(4'd4),
        .b(_T_316)
    );
    wire [7:0] _node_29;
    MUX_SIGNED #(.width(8)) s_mux_30 (
        .y(_node_29),
        .sel(_node_28),
        .a(lutS_4),
        .b(_node_27)
    );
    wire _node_30;
    EQ_UNSIGNED #(.width(4)) u_eq_31 (
        .y(_node_30),
        .a(4'd5),
        .b(_T_316)
    );
    wire [7:0] _node_31;
    MUX_SIGNED #(.width(8)) s_mux_32 (
        .y(_node_31),
        .sel(_node_30),
        .a(lutS_5),
        .b(_node_29)
    );
    wire _node_32;
    EQ_UNSIGNED #(.width(4)) u_eq_33 (
        .y(_node_32),
        .a(4'd6),
        .b(_T_316)
    );
    wire [7:0] _node_33;
    MUX_SIGNED #(.width(8)) s_mux_34 (
        .y(_node_33),
        .sel(_node_32),
        .a(lutS_6),
        .b(_node_31)
    );
    wire _node_34;
    EQ_UNSIGNED #(.width(4)) u_eq_35 (
        .y(_node_34),
        .a(4'd7),
        .b(_T_316)
    );
    wire [7:0] _node_35;
    MUX_SIGNED #(.width(8)) s_mux_36 (
        .y(_node_35),
        .sel(_node_34),
        .a(lutS_7),
        .b(_node_33)
    );
    wire _node_36;
    EQ_UNSIGNED #(.width(4)) u_eq_37 (
        .y(_node_36),
        .a(4'd8),
        .b(_T_316)
    );
    wire [7:0] _node_37;
    MUX_SIGNED #(.width(8)) s_mux_38 (
        .y(_node_37),
        .sel(_node_36),
        .a(lutS_8),
        .b(_node_35)
    );
    wire _node_38;
    EQ_UNSIGNED #(.width(4)) u_eq_39 (
        .y(_node_38),
        .a(4'd9),
        .b(_T_316)
    );
    wire [7:0] _node_39;
    MUX_SIGNED #(.width(8)) s_mux_40 (
        .y(_node_39),
        .sel(_node_38),
        .a(lutS_9),
        .b(_node_37)
    );
    assign io_o_b = 1'h0;
    ASSINT #(.width(8)) assint_41 (
        .y(io_o_cFS_imag),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_42 (
        .y(io_o_cFS_real),
        .in(8'h0)
    );
    ASSINT #(.width(16)) assint_43 (
        .y(io_o_cGenL_imag),
        .in(16'h0)
    );
    ASSINT #(.width(16)) assint_44 (
        .y(io_o_cGenL_real),
        .in(16'h0)
    );
    assign io_o_cR_imag_node = 64'h0;
    assign io_o_cR_real_node = 64'h0;
    ASSINT #(.width(16)) assint_45 (
        .y(io_o_long_f),
        .in(16'h0)
    );
    ASSINT #(.width(16)) assint_46 (
        .y(io_o_long_gen),
        .in(16'h0)
    );
    assign io_o_long_s = 16'sh0;
    assign io_o_long_u = 16'h0;
    assign io_o_r_node = 64'h0;
    ASSINT #(.width(8)) assint_47 (
        .y(io_o_short_f),
        .in(8'h0)
    );
    assign io_o_short_gen = _node_19;
    assign io_o_short_s = _node_39;
    assign io_o_short_u = 8'h0;
    ASSINT #(.width(8)) assint_48 (
        .y(io_o_vF_0),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_49 (
        .y(io_o_vF_1),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_50 (
        .y(io_o_vF_2),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_51 (
        .y(io_o_vF_3),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_52 (
        .y(io_o_vF_4),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_53 (
        .y(io_o_vF_5),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_54 (
        .y(io_o_vF_6),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_55 (
        .y(io_o_vF_7),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_56 (
        .y(io_o_vF_8),
        .in(8'h0)
    );
    ASSINT #(.width(8)) assint_57 (
        .y(io_o_vF_9),
        .in(8'h0)
    );
    assign io_o_vS_0 = 8'sh0;
    assign io_o_vS_1 = 8'sh0;
    assign io_o_vS_2 = 8'sh0;
    assign io_o_vS_3 = 8'sh0;
    assign io_o_vS_4 = 8'sh0;
    assign io_o_vS_5 = 8'sh0;
    assign io_o_vS_6 = 8'sh0;
    assign io_o_vS_7 = 8'sh0;
    assign io_o_vS_8 = 8'sh0;
    assign io_o_vS_9 = 8'sh0;
    assign io_o_vU_0 = 8'h0;
    assign io_o_vU_1 = 8'h0;
    assign io_o_vU_2 = 8'h0;
    assign io_o_vU_3 = 8'h0;
    assign io_o_vU_4 = 8'h0;
    assign io_o_vU_5 = 8'h0;
    assign io_o_vU_6 = 8'h0;
    assign io_o_vU_7 = 8'h0;
    assign io_o_vU_8 = 8'h0;
    assign io_o_vU_9 = 8'h0;
    ASSINT #(.width(8)) assint_58 (
        .y(lutGen_0),
        .in(8'hCB)
    );
    ASSINT #(.width(8)) assint_59 (
        .y(lutGen_1),
        .in(8'hDD)
    );
    ASSINT #(.width(8)) assint_60 (
        .y(lutGen_2),
        .in(8'hEE)
    );
    ASSINT #(.width(8)) assint_61 (
        .y(lutGen_3),
        .in(8'hF7)
    );
    ASSINT #(.width(8)) assint_62 (
        .y(lutGen_4),
        .in(8'hFA)
    );
    ASSINT #(.width(8)) assint_63 (
        .y(lutGen_5),
        .in(8'h6)
    );
    ASSINT #(.width(8)) assint_64 (
        .y(lutGen_6),
        .in(8'h9)
    );
    ASSINT #(.width(8)) assint_65 (
        .y(lutGen_7),
        .in(8'h12)
    );
    ASSINT #(.width(8)) assint_66 (
        .y(lutGen_8),
        .in(8'h23)
    );
    ASSINT #(.width(8)) assint_67 (
        .y(lutGen_9),
        .in(8'h35)
    );
    assign lutS_0 = -8'sh3;
    assign lutS_1 = -8'sh2;
    assign lutS_2 = -8'sh1;
    assign lutS_3 = -8'sh1;
    assign lutS_4 = 8'sh0;
    assign lutS_5 = 8'sh0;
    assign lutS_6 = 8'sh1;
    assign lutS_7 = 8'sh1;
    assign lutS_8 = 8'sh2;
    assign lutS_9 = 8'sh3;
endmodule //SimpleLitModule
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
module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
