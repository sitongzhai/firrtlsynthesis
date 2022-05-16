module SimpleIOModule(
    input clock,
    input reset,
    input io_i_b,
    input [15:0] io_i_cGenL_real,
    input [15:0] io_i_cGenL_imag,
    input [7:0] io_i_cFS_real,
    input [7:0] io_i_cFS_imag,
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
    output io_o_b,
    output [15:0] io_o_cGenL_real,
    output [15:0] io_o_cGenL_imag,
    output [7:0] io_o_cFS_real,
    output [7:0] io_o_cFS_imag,
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
    wire [7:0] __T_49_gen__q;
    wire [7:0] __T_49_gen__d;
    DFF_POSCLK #(.width(8)) _T_49_gen (
        .q(__T_49_gen__q),
        .d(__T_49_gen__d),
        .clk(clock)
    );
    wire [7:0] __T_49_s__q;
    wire [7:0] __T_49_s__d;
    DFF_POSCLK #(.width(8)) _T_49_s (
        .q(__T_49_s__q),
        .d(__T_49_s__d),
        .clk(clock)
    );
    wire [7:0] __T_49_f__q;
    wire [7:0] __T_49_f__d;
    DFF_POSCLK #(.width(8)) _T_49_f (
        .q(__T_49_f__q),
        .d(__T_49_f__d),
        .clk(clock)
    );
    wire [7:0] __T_49_u__q;
    wire [7:0] __T_49_u__d;
    DFF_POSCLK #(.width(8)) _T_49_u (
        .q(__T_49_u__q),
        .d(__T_49_u__d),
        .clk(clock)
    );
    wire [11:0] _node_0;
    SHL_SIGNED #(.width(8), .n(4)) s_shl_1 (
        .y(_node_0),
        .in(__T_49_f__q)
    );
    wire [11:0] _node_1;
    SHL_SIGNED #(.width(8), .n(4)) s_shl_2 (
        .y(_node_1),
        .in(__T_49_gen__q)
    );
    wire [15:0] __T_51_gen__q;
    wire [15:0] __T_51_gen__d;
    DFF_POSCLK #(.width(16)) _T_51_gen (
        .q(__T_51_gen__q),
        .d(__T_51_gen__d),
        .clk(clock)
    );
    wire [15:0] __T_51_s__q;
    wire [15:0] __T_51_s__d;
    DFF_POSCLK #(.width(16)) _T_51_s (
        .q(__T_51_s__q),
        .d(__T_51_s__d),
        .clk(clock)
    );
    wire [15:0] __T_51_f__q;
    wire [15:0] __T_51_f__d;
    DFF_POSCLK #(.width(16)) _T_51_f (
        .q(__T_51_f__q),
        .d(__T_51_f__d),
        .clk(clock)
    );
    wire [15:0] __T_51_u__q;
    wire [15:0] __T_51_u__d;
    DFF_POSCLK #(.width(16)) _T_51_u (
        .q(__T_51_u__q),
        .d(__T_51_u__d),
        .clk(clock)
    );
    wire [11:0] _node_2;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_3 (
        .y(_node_2),
        .in(__T_51_f__q)
    );
    wire [11:0] _node_3;
    SHR_SIGNED #(.width(16), .n(4)) s_shr_4 (
        .y(_node_3),
        .in(__T_51_gen__q)
    );
    wire __T_53__q;
    wire __T_53__d;
    DFF_POSCLK #(.width(1)) _T_53 (
        .q(__T_53__q),
        .d(__T_53__d),
        .clk(clock)
    );
    wire [15:0] __T_59_real__q;
    wire [15:0] __T_59_real__d;
    DFF_POSCLK #(.width(16)) _T_59_real (
        .q(__T_59_real__q),
        .d(__T_59_real__d),
        .clk(clock)
    );
    wire [15:0] __T_59_imag__q;
    wire [15:0] __T_59_imag__d;
    DFF_POSCLK #(.width(16)) _T_59_imag (
        .q(__T_59_imag__q),
        .d(__T_59_imag__d),
        .clk(clock)
    );
    wire [7:0] __T_65_real__q;
    wire [7:0] __T_65_real__d;
    DFF_POSCLK #(.width(8)) _T_65_real (
        .q(__T_65_real__q),
        .d(__T_65_real__d),
        .clk(clock)
    );
    wire [7:0] __T_65_imag__q;
    wire [7:0] __T_65_imag__d;
    DFF_POSCLK #(.width(8)) _T_65_imag (
        .q(__T_65_imag__q),
        .d(__T_65_imag__d),
        .clk(clock)
    );
    wire [7:0] __T_79_0__q;
    wire [7:0] __T_79_0__d;
    DFF_POSCLK #(.width(8)) _T_79_0 (
        .q(__T_79_0__q),
        .d(__T_79_0__d),
        .clk(clock)
    );
    wire [7:0] __T_79_1__q;
    wire [7:0] __T_79_1__d;
    DFF_POSCLK #(.width(8)) _T_79_1 (
        .q(__T_79_1__q),
        .d(__T_79_1__d),
        .clk(clock)
    );
    wire [7:0] __T_79_2__q;
    wire [7:0] __T_79_2__d;
    DFF_POSCLK #(.width(8)) _T_79_2 (
        .q(__T_79_2__q),
        .d(__T_79_2__d),
        .clk(clock)
    );
    wire [7:0] __T_79_3__q;
    wire [7:0] __T_79_3__d;
    DFF_POSCLK #(.width(8)) _T_79_3 (
        .q(__T_79_3__q),
        .d(__T_79_3__d),
        .clk(clock)
    );
    wire [7:0] __T_79_4__q;
    wire [7:0] __T_79_4__d;
    DFF_POSCLK #(.width(8)) _T_79_4 (
        .q(__T_79_4__q),
        .d(__T_79_4__d),
        .clk(clock)
    );
    wire [7:0] __T_79_5__q;
    wire [7:0] __T_79_5__d;
    DFF_POSCLK #(.width(8)) _T_79_5 (
        .q(__T_79_5__q),
        .d(__T_79_5__d),
        .clk(clock)
    );
    wire [7:0] __T_79_6__q;
    wire [7:0] __T_79_6__d;
    DFF_POSCLK #(.width(8)) _T_79_6 (
        .q(__T_79_6__q),
        .d(__T_79_6__d),
        .clk(clock)
    );
    wire [7:0] __T_79_7__q;
    wire [7:0] __T_79_7__d;
    DFF_POSCLK #(.width(8)) _T_79_7 (
        .q(__T_79_7__q),
        .d(__T_79_7__d),
        .clk(clock)
    );
    wire [7:0] __T_79_8__q;
    wire [7:0] __T_79_8__d;
    DFF_POSCLK #(.width(8)) _T_79_8 (
        .q(__T_79_8__q),
        .d(__T_79_8__d),
        .clk(clock)
    );
    wire [7:0] __T_79_9__q;
    wire [7:0] __T_79_9__d;
    DFF_POSCLK #(.width(8)) _T_79_9 (
        .q(__T_79_9__q),
        .d(__T_79_9__d),
        .clk(clock)
    );
    wire [7:0] __T_116_0__q;
    wire [7:0] __T_116_0__d;
    DFF_POSCLK #(.width(8)) _T_116_0 (
        .q(__T_116_0__q),
        .d(__T_116_0__d),
        .clk(clock)
    );
    wire [7:0] __T_116_1__q;
    wire [7:0] __T_116_1__d;
    DFF_POSCLK #(.width(8)) _T_116_1 (
        .q(__T_116_1__q),
        .d(__T_116_1__d),
        .clk(clock)
    );
    wire [7:0] __T_116_2__q;
    wire [7:0] __T_116_2__d;
    DFF_POSCLK #(.width(8)) _T_116_2 (
        .q(__T_116_2__q),
        .d(__T_116_2__d),
        .clk(clock)
    );
    wire [7:0] __T_116_3__q;
    wire [7:0] __T_116_3__d;
    DFF_POSCLK #(.width(8)) _T_116_3 (
        .q(__T_116_3__q),
        .d(__T_116_3__d),
        .clk(clock)
    );
    wire [7:0] __T_116_4__q;
    wire [7:0] __T_116_4__d;
    DFF_POSCLK #(.width(8)) _T_116_4 (
        .q(__T_116_4__q),
        .d(__T_116_4__d),
        .clk(clock)
    );
    wire [7:0] __T_116_5__q;
    wire [7:0] __T_116_5__d;
    DFF_POSCLK #(.width(8)) _T_116_5 (
        .q(__T_116_5__q),
        .d(__T_116_5__d),
        .clk(clock)
    );
    wire [7:0] __T_116_6__q;
    wire [7:0] __T_116_6__d;
    DFF_POSCLK #(.width(8)) _T_116_6 (
        .q(__T_116_6__q),
        .d(__T_116_6__d),
        .clk(clock)
    );
    wire [7:0] __T_116_7__q;
    wire [7:0] __T_116_7__d;
    DFF_POSCLK #(.width(8)) _T_116_7 (
        .q(__T_116_7__q),
        .d(__T_116_7__d),
        .clk(clock)
    );
    wire [7:0] __T_116_8__q;
    wire [7:0] __T_116_8__d;
    DFF_POSCLK #(.width(8)) _T_116_8 (
        .q(__T_116_8__q),
        .d(__T_116_8__d),
        .clk(clock)
    );
    wire [7:0] __T_116_9__q;
    wire [7:0] __T_116_9__d;
    DFF_POSCLK #(.width(8)) _T_116_9 (
        .q(__T_116_9__q),
        .d(__T_116_9__d),
        .clk(clock)
    );
    wire [7:0] __T_153_0__q;
    wire [7:0] __T_153_0__d;
    DFF_POSCLK #(.width(8)) _T_153_0 (
        .q(__T_153_0__q),
        .d(__T_153_0__d),
        .clk(clock)
    );
    wire [7:0] __T_153_1__q;
    wire [7:0] __T_153_1__d;
    DFF_POSCLK #(.width(8)) _T_153_1 (
        .q(__T_153_1__q),
        .d(__T_153_1__d),
        .clk(clock)
    );
    wire [7:0] __T_153_2__q;
    wire [7:0] __T_153_2__d;
    DFF_POSCLK #(.width(8)) _T_153_2 (
        .q(__T_153_2__q),
        .d(__T_153_2__d),
        .clk(clock)
    );
    wire [7:0] __T_153_3__q;
    wire [7:0] __T_153_3__d;
    DFF_POSCLK #(.width(8)) _T_153_3 (
        .q(__T_153_3__q),
        .d(__T_153_3__d),
        .clk(clock)
    );
    wire [7:0] __T_153_4__q;
    wire [7:0] __T_153_4__d;
    DFF_POSCLK #(.width(8)) _T_153_4 (
        .q(__T_153_4__q),
        .d(__T_153_4__d),
        .clk(clock)
    );
    wire [7:0] __T_153_5__q;
    wire [7:0] __T_153_5__d;
    DFF_POSCLK #(.width(8)) _T_153_5 (
        .q(__T_153_5__q),
        .d(__T_153_5__d),
        .clk(clock)
    );
    wire [7:0] __T_153_6__q;
    wire [7:0] __T_153_6__d;
    DFF_POSCLK #(.width(8)) _T_153_6 (
        .q(__T_153_6__q),
        .d(__T_153_6__d),
        .clk(clock)
    );
    wire [7:0] __T_153_7__q;
    wire [7:0] __T_153_7__d;
    DFF_POSCLK #(.width(8)) _T_153_7 (
        .q(__T_153_7__q),
        .d(__T_153_7__d),
        .clk(clock)
    );
    wire [7:0] __T_153_8__q;
    wire [7:0] __T_153_8__d;
    DFF_POSCLK #(.width(8)) _T_153_8 (
        .q(__T_153_8__q),
        .d(__T_153_8__d),
        .clk(clock)
    );
    wire [7:0] __T_153_9__q;
    wire [7:0] __T_153_9__d;
    DFF_POSCLK #(.width(8)) _T_153_9 (
        .q(__T_153_9__q),
        .d(__T_153_9__d),
        .clk(clock)
    );
    assign __T_116_0__d = io_i_vS_0;
    assign __T_116_1__d = io_i_vS_1;
    assign __T_116_2__d = io_i_vS_2;
    assign __T_116_3__d = io_i_vS_3;
    assign __T_116_4__d = io_i_vS_4;
    assign __T_116_5__d = io_i_vS_5;
    assign __T_116_6__d = io_i_vS_6;
    assign __T_116_7__d = io_i_vS_7;
    assign __T_116_8__d = io_i_vS_8;
    assign __T_116_9__d = io_i_vS_9;
    assign __T_153_0__d = io_i_vF_0;
    assign __T_153_1__d = io_i_vF_1;
    assign __T_153_2__d = io_i_vF_2;
    assign __T_153_3__d = io_i_vF_3;
    assign __T_153_4__d = io_i_vF_4;
    assign __T_153_5__d = io_i_vF_5;
    assign __T_153_6__d = io_i_vF_6;
    assign __T_153_7__d = io_i_vF_7;
    assign __T_153_8__d = io_i_vF_8;
    assign __T_153_9__d = io_i_vF_9;
    assign __T_49_f__d = io_i_short_f;
    assign __T_49_gen__d = io_i_short_gen;
    assign __T_49_s__d = io_i_short_s;
    assign __T_49_u__d = io_i_short_u;
    assign __T_51_f__d = io_i_long_f;
    assign __T_51_gen__d = io_i_long_gen;
    assign __T_51_s__d = io_i_long_s;
    assign __T_51_u__d = io_i_long_u;
    assign __T_53__d = io_i_b;
    assign __T_59_imag__d = io_i_cGenL_imag;
    assign __T_59_real__d = io_i_cGenL_real;
    assign __T_65_imag__d = io_i_cFS_imag;
    assign __T_65_real__d = io_i_cFS_real;
    assign __T_79_0__d = io_i_vU_0;
    assign __T_79_1__d = io_i_vU_1;
    assign __T_79_2__d = io_i_vU_2;
    assign __T_79_3__d = io_i_vU_3;
    assign __T_79_4__d = io_i_vU_4;
    assign __T_79_5__d = io_i_vU_5;
    assign __T_79_6__d = io_i_vU_6;
    assign __T_79_7__d = io_i_vU_7;
    assign __T_79_8__d = io_i_vU_8;
    assign __T_79_9__d = io_i_vU_9;
    assign io_o_b = __T_53__q;
    assign io_o_cFS_imag = __T_65_imag__q;
    assign io_o_cFS_real = __T_65_real__q;
    assign io_o_cGenL_imag = __T_59_imag__q;
    assign io_o_cGenL_real = __T_59_real__q;
    PAD_SIGNED #(.width(12), .n(16)) s_pad_5 (
        .y(io_o_long_f),
        .in(_node_0)
    );
    PAD_SIGNED #(.width(12), .n(16)) s_pad_6 (
        .y(io_o_long_gen),
        .in(_node_1)
    );
    PAD_SIGNED #(.width(8), .n(16)) s_pad_7 (
        .y(io_o_long_s),
        .in(__T_49_s__q)
    );
    PAD_UNSIGNED #(.width(8), .n(16)) u_pad_8 (
        .y(io_o_long_u),
        .in(__T_49_u__q)
    );
    wire [7:0] _WTEMP_0;
    BITS #(.width(12), .high(7), .low(0)) bits_9 (
        .y(_WTEMP_0),
        .in(_node_2)
    );
    ASSINT #(.width(8)) assint_10 (
        .y(io_o_short_f),
        .in(_WTEMP_0)
    );
    wire [7:0] _WTEMP_1;
    BITS #(.width(12), .high(7), .low(0)) bits_11 (
        .y(_WTEMP_1),
        .in(_node_3)
    );
    ASSINT #(.width(8)) assint_12 (
        .y(io_o_short_gen),
        .in(_WTEMP_1)
    );
    wire [7:0] _WTEMP_2;
    BITS #(.width(16), .high(7), .low(0)) bits_13 (
        .y(_WTEMP_2),
        .in(__T_51_s__q)
    );
    ASSINT #(.width(8)) assint_14 (
        .y(io_o_short_s),
        .in(_WTEMP_2)
    );
    BITS #(.width(16), .high(7), .low(0)) bits_15 (
        .y(io_o_short_u),
        .in(__T_51_u__q)
    );
    assign io_o_vF_0 = __T_153_0__q;
    assign io_o_vF_1 = __T_153_1__q;
    assign io_o_vF_2 = __T_153_2__q;
    assign io_o_vF_3 = __T_153_3__q;
    assign io_o_vF_4 = __T_153_4__q;
    assign io_o_vF_5 = __T_153_5__q;
    assign io_o_vF_6 = __T_153_6__q;
    assign io_o_vF_7 = __T_153_7__q;
    assign io_o_vF_8 = __T_153_8__q;
    assign io_o_vF_9 = __T_153_9__q;
    assign io_o_vS_0 = __T_116_0__q;
    assign io_o_vS_1 = __T_116_1__q;
    assign io_o_vS_2 = __T_116_2__q;
    assign io_o_vS_3 = __T_116_3__q;
    assign io_o_vS_4 = __T_116_4__q;
    assign io_o_vS_5 = __T_116_5__q;
    assign io_o_vS_6 = __T_116_6__q;
    assign io_o_vS_7 = __T_116_7__q;
    assign io_o_vS_8 = __T_116_8__q;
    assign io_o_vS_9 = __T_116_9__q;
    assign io_o_vU_0 = __T_79_0__q;
    assign io_o_vU_1 = __T_79_1__q;
    assign io_o_vU_2 = __T_79_2__q;
    assign io_o_vU_3 = __T_79_3__q;
    assign io_o_vU_4 = __T_79_4__q;
    assign io_o_vU_5 = __T_79_5__q;
    assign io_o_vU_6 = __T_79_6__q;
    assign io_o_vU_7 = __T_79_7__q;
    assign io_o_vU_8 = __T_79_8__q;
    assign io_o_vU_9 = __T_79_9__q;
endmodule //SimpleIOModule
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
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
