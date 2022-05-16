module MultiClockMemTest(
    input clock,
    input reset
);
    wire _cDiv__q;
    wire _cDiv__d;
    DFF_POSCLK #(.width(1)) cDiv (
        .q(_cDiv__q),
        .d(_cDiv__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_cDiv__d),
        .sel(reset),
        .a(1'h1),
        .b(_WTEMP_0)
    );
    wire _T_5;
    EQ_UNSIGNED #(.width(1)) u_eq_2 (
        .y(_T_5),
        .a(_cDiv__q),
        .b(1'h0)
    );
    wire clock2;
    assign clock2 = _cDiv__q;
    wire mem__T_24_clk;
    wire mem__T_24_en;
    wire mem__T_24_mask;
    wire [2:0] mem__T_24_addr;
    wire [31:0] mem__T_24_data;
    wire [31:0] mem_rdata_data;
    wire mem_rdata_clk;
    wire mem_rdata_en;
    wire [2:0] mem_rdata_addr;
    wire mem__T_45_clk;
    wire mem__T_45_en;
    wire mem__T_45_mask;
    wire [2:0] mem__T_45_addr;
    wire [31:0] mem__T_45_data;
    wire [31:0] mem_read_datas;
    wire mem_read_clks;
    wire mem_read_ens;
    wire [2:0] mem_read_addrs;
    wire [1:0] mem_write_clks;
    wire [1:0] mem_write_ens;
    wire [1:0] mem_write_masks;
    wire [5:0] mem_write_addrs;
    wire [63:0] mem_write_datas;
    BITS #(.width(32), .high(31), .low(0)) bits_3 (
        .y(mem_rdata_data),
        .in(mem_read_datas)
    );
    assign mem_read_clks = mem_rdata_clk;
    assign mem_read_ens = mem_rdata_en;
    assign mem_read_addrs = mem_rdata_addr;
    CAT #(.width_a(32), .width_b(32)) cat_4 (
        .y(mem_write_datas),
        .a(mem__T_45_data),
        .b(mem__T_24_data)
    );
    CAT #(.width_a(1), .width_b(1)) cat_5 (
        .y(mem_write_clks),
        .a(mem__T_45_clk),
        .b(mem__T_24_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_6 (
        .y(mem_write_ens),
        .a(mem__T_45_en),
        .b(mem__T_24_en)
    );
    CAT #(.width_a(3), .width_b(3)) cat_7 (
        .y(mem_write_addrs),
        .a(mem__T_45_addr),
        .b(mem__T_24_addr)
    );
    CAT #(.width_a(1), .width_b(1)) cat_8 (
        .y(mem_write_masks),
        .a(mem__T_45_mask),
        .b(mem__T_24_mask)
    );
    MRMWMEM #(.depth(8), .addrbits(3), .width(32), .readernum(1), .writernum(2), .isSyncRead(0)) mem (
        .read_datas(mem_read_datas),
        .read_clks(mem_read_clks),
        .read_ens(mem_read_ens),
        .read_addrs(mem_read_addrs),
        .write_clks(mem_write_clks),
        .write_ens(mem_write_ens),
        .write_masks(mem_write_masks),
        .write_addrs(mem_write_addrs),
        .write_datas(mem_write_datas)
    );
    wire [4:0] _value__q;
    wire [4:0] _value__d;
    DFF_POSCLK #(.width(5)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(5)) u_mux_9 (
        .y(_value__d),
        .sel(reset),
        .a(5'h0),
        .b(_WTEMP_1)
    );
    wire _T_12;
    EQ_UNSIGNED #(.width(5)) u_eq_10 (
        .y(_T_12),
        .a(_value__q),
        .b(5'h13)
    );
    wire [5:0] _T_14;
    wire [4:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_11 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(5)) u_add_12 (
        .y(_T_14),
        .a(_value__q),
        .b(_WTEMP_2)
    );
    wire [4:0] _T_15;
    TAIL #(.width(6), .n(1)) tail_13 (
        .y(_T_15),
        .in(_T_14)
    );
    wire [4:0] _node_0;
    wire [4:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_14 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_15 (
        .y(_node_0),
        .sel(_T_12),
        .a(_WTEMP_3),
        .b(_T_15)
    );
    wire done;
    BITWISEAND #(.width(1)) bitwiseand_16 (
        .y(done),
        .a(1'h1),
        .b(_T_12)
    );
    wire [2:0] _waddr__q;
    wire [2:0] _waddr__d;
    DFF_POSCLK #(.width(3)) waddr (
        .q(_waddr__q),
        .d(_waddr__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_4;
    MUX_UNSIGNED #(.width(3)) u_mux_17 (
        .y(_waddr__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_4)
    );
    wire [3:0] _T_20;
    wire [2:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_18 (
        .y(_WTEMP_5),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_19 (
        .y(_T_20),
        .a(_waddr__q),
        .b(_WTEMP_5)
    );
    wire [2:0] _T_21;
    TAIL #(.width(4), .n(1)) tail_20 (
        .y(_T_21),
        .in(_T_20)
    );
    wire _T_23;
    wire [4:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_21 (
        .y(_WTEMP_6),
        .in(4'h8)
    );
    LT_UNSIGNED #(.width(5)) u_lt_22 (
        .y(_T_23),
        .a(_value__q),
        .b(_WTEMP_6)
    );
    assign mem__T_24_addr = _waddr__q;
    assign mem__T_24_en = _T_23;
    assign mem__T_24_clk = clock;
    assign mem__T_24_mask = 1'h1;
    wire [3:0] _T_27;
    wire [2:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_23 (
        .y(_WTEMP_7),
        .in(1'h1)
    );
    SUB_UNSIGNED #(.width(3)) u_sub_24 (
        .y(_T_27),
        .a(_waddr__q),
        .b(_WTEMP_7)
    );
    wire [3:0] _T_28;
    ASUINT #(.width(4)) asuint_25 (
        .y(_T_28),
        .in(_T_27)
    );
    wire [2:0] raddr;
    TAIL #(.width(4), .n(1)) tail_26 (
        .y(raddr),
        .in(_T_28)
    );
    assign mem_rdata_addr = raddr;
    assign mem_rdata_en = 1'h1;
    assign mem_rdata_clk = clock;
    wire _T_30;
    wire [4:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_27 (
        .y(_WTEMP_8),
        .in(1'h0)
    );
    GT_UNSIGNED #(.width(5)) u_gt_28 (
        .y(_T_30),
        .a(_value__q),
        .b(_WTEMP_8)
    );
    wire _T_32;
    wire [4:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_29 (
        .y(_WTEMP_9),
        .in(4'h9)
    );
    LT_UNSIGNED #(.width(5)) u_lt_30 (
        .y(_T_32),
        .a(_value__q),
        .b(_WTEMP_9)
    );
    wire _T_33;
    BITWISEAND #(.width(1)) bitwiseand_31 (
        .y(_T_33),
        .a(_T_30),
        .b(_T_32)
    );
    wire _T_35;
    wire [31:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(7), .n(32)) u_pad_32 (
        .y(_WTEMP_10),
        .in(7'h7B)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_33 (
        .y(_T_35),
        .a(mem_rdata_data),
        .b(_WTEMP_10)
    );
    wire _T_36;
    BITS #(.width(1), .high(0), .low(0)) bits_34 (
        .y(_T_36),
        .in(reset)
    );
    wire _T_37;
    BITWISEOR #(.width(1)) bitwiseor_35 (
        .y(_T_37),
        .a(_T_35),
        .b(_T_36)
    );
    wire _T_39;
    EQ_UNSIGNED #(.width(1)) u_eq_36 (
        .y(_T_39),
        .a(_T_37),
        .b(1'h0)
    );
    wire _T_41;
    wire [4:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_37 (
        .y(_WTEMP_11),
        .in(4'h8)
    );
    GEQ_UNSIGNED #(.width(5)) u_geq_38 (
        .y(_T_41),
        .a(_value__q),
        .b(_WTEMP_11)
    );
    wire _T_43;
    LT_UNSIGNED #(.width(5)) u_lt_39 (
        .y(_T_43),
        .a(_value__q),
        .b(5'h10)
    );
    wire _T_44;
    BITWISEAND #(.width(1)) bitwiseand_40 (
        .y(_T_44),
        .a(_T_41),
        .b(_T_43)
    );
    assign mem__T_45_addr = _waddr__q;
    assign mem__T_45_en = _T_44;
    assign mem__T_45_clk = clock2;
    assign mem__T_45_mask = 1'h1;
    wire _T_48;
    wire [4:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_41 (
        .y(_WTEMP_12),
        .in(4'h8)
    );
    GT_UNSIGNED #(.width(5)) u_gt_42 (
        .y(_T_48),
        .a(_value__q),
        .b(_WTEMP_12)
    );
    wire _T_50;
    LT_UNSIGNED #(.width(5)) u_lt_43 (
        .y(_T_50),
        .a(_value__q),
        .b(5'h11)
    );
    wire _T_51;
    BITWISEAND #(.width(1)) bitwiseand_44 (
        .y(_T_51),
        .a(_T_48),
        .b(_T_50)
    );
    wire [1:0] _T_53;
    REM_UNSIGNED #(.width_num(3), .width_den(2), .width(2)) u_rem_45 (
        .y(_T_53),
        .num(raddr),
        .den(2'h2)
    );
    wire _T_55;
    wire [1:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_46 (
        .y(_WTEMP_13),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_47 (
        .y(_T_55),
        .a(_T_53),
        .b(_WTEMP_13)
    );
    wire _T_57;
    wire [31:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(9), .n(32)) u_pad_48 (
        .y(_WTEMP_14),
        .in(9'h1C8)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_49 (
        .y(_T_57),
        .a(mem_rdata_data),
        .b(_WTEMP_14)
    );
    wire _T_58;
    BITS #(.width(1), .high(0), .low(0)) bits_50 (
        .y(_T_58),
        .in(reset)
    );
    wire _T_59;
    BITWISEOR #(.width(1)) bitwiseor_51 (
        .y(_T_59),
        .a(_T_57),
        .b(_T_58)
    );
    wire _T_61;
    EQ_UNSIGNED #(.width(1)) u_eq_52 (
        .y(_T_61),
        .a(_T_59),
        .b(1'h0)
    );
    wire _T_63;
    wire [31:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(7), .n(32)) u_pad_53 (
        .y(_WTEMP_15),
        .in(7'h7B)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_54 (
        .y(_T_63),
        .a(mem_rdata_data),
        .b(_WTEMP_15)
    );
    wire _T_64;
    BITS #(.width(1), .high(0), .low(0)) bits_55 (
        .y(_T_64),
        .in(reset)
    );
    wire _T_65;
    BITWISEOR #(.width(1)) bitwiseor_56 (
        .y(_T_65),
        .a(_T_63),
        .b(_T_64)
    );
    wire _T_67;
    EQ_UNSIGNED #(.width(1)) u_eq_57 (
        .y(_T_67),
        .a(_T_65),
        .b(1'h0)
    );
    wire _T_68;
    BITS #(.width(1), .high(0), .low(0)) bits_58 (
        .y(_T_68),
        .in(reset)
    );
    wire _T_70;
    EQ_UNSIGNED #(.width(1)) u_eq_59 (
        .y(_T_70),
        .a(_T_68),
        .b(1'h0)
    );
    assign _WTEMP_0 = _T_5;
    PAD_UNSIGNED #(.width(7), .n(32)) u_pad_60 (
        .y(mem__T_24_data),
        .in(7'h7B)
    );
    PAD_UNSIGNED #(.width(9), .n(32)) u_pad_61 (
        .y(mem__T_45_data),
        .in(9'h1C8)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_62 (
        .y(_WTEMP_1),
        .sel(1'h1),
        .a(_node_0),
        .b(_value__q)
    );
    assign _WTEMP_4 = _T_21;
endmodule //MultiClockMemTest
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
module MRMWMEM(read_datas, read_clks, read_ens, read_addrs, write_clks, write_ens, write_masks, write_addrs, write_datas);
    parameter depth = 16;
    parameter addrbits = 4;
    parameter width = 32;
    parameter readernum = 2;
    parameter writernum = 2;
    parameter isSyncRead = 0;
    output [(width*readernum-1):0] read_datas;
    input [(1*readernum-1):0] read_clks;
    input [(1*readernum-1):0] read_ens;
    input [(addrbits*readernum-1):0] read_addrs;
    input [1*writernum-1:0] write_clks;
    input [1*writernum-1:0] write_ens;
    input [1*writernum-1:0] write_masks;
    input [(addrbits*writernum-1):0] write_addrs;
    input [(width*writernum-1):0] write_datas;
    reg [width-1:0] memcore [0:depth-1];
    wire [(addrbits*readernum-1):0] final_read_addrs;
    genvar gv_n;
    generate
        for (gv_n = 0; gv_n < readernum; gv_n = gv_n + 1) begin: get_final_raddrs
            if (isSyncRead) begin: raddr_processor
                reg [addrbits-1:0] read_addr_pipe_0;
                always @(posedge read_clks[gv_n]) begin
                    if (read_ens[gv_n]) begin
                        read_addr_pipe_0 <= read_addrs[gv_n*addrbits +: addrbits];
                    end
                end
                assign final_read_addrs[gv_n*addrbits +: addrbits] = read_addr_pipe_0;
            end else begin: raddr_processor
                assign final_read_addrs[gv_n*addrbits +: addrbits] = read_addrs[gv_n*addrbits +: addrbits];
            end
        end
    endgenerate
    genvar gv_k;
    generate
        for (gv_k = 0; gv_k < readernum; gv_k = gv_k + 1) begin: form_read_datas
            assign read_datas[gv_k*width +: width] = memcore[final_read_addrs[gv_k*addrbits +: addrbits]];
        end
    endgenerate
    integer i;
    always @(posedge write_clks[0]) begin
        for (i = 0; i < writernum; i = i + 1) begin
            if (write_ens[i] & write_masks[i]) begin
                memcore[write_addrs[i*addrbits +: addrbits]] <= write_datas[i*width +: width];
            end
        end
    end
endmodule // MRMWMEM
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
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
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
module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module GEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a >= b;
endmodule // GEQ_UNSIGNED
module REM_UNSIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    parameter width = 4;
    output [width-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = num % den;
endmodule // REM_UNSIGNED
