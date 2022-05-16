module DynamicMemorySearch(
    input clock,
    input reset,
    input io_isWr,
    input [2:0] io_wrAddr,
    input [3:0] io_data,
    input io_en,
    output [2:0] io_target,
    output io_done
);
    wire [2:0] _index__q;
    wire [2:0] _index__d;
    DFF_POSCLK #(.width(3)) index (
        .q(_index__q),
        .d(_index__d),
        .clk(clock)
    );
    wire [2:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(3)) u_mux_1 (
        .y(_index__d),
        .sel(reset),
        .a(3'h0),
        .b(_WTEMP_0)
    );
    wire [3:0] list_memVal_data;
    wire list_memVal_clk;
    wire list_memVal_en;
    wire [2:0] list_memVal_addr;
    wire list__T_19_clk;
    wire list__T_19_en;
    wire list__T_19_mask;
    wire [2:0] list__T_19_addr;
    wire [3:0] list__T_19_data;
    wire list__T_22_clk;
    wire list__T_22_en;
    wire list__T_22_mask;
    wire [2:0] list__T_22_addr;
    wire [3:0] list__T_22_data;
    wire list__T_25_clk;
    wire list__T_25_en;
    wire list__T_25_mask;
    wire [2:0] list__T_25_addr;
    wire [3:0] list__T_25_data;
    wire list__T_28_clk;
    wire list__T_28_en;
    wire list__T_28_mask;
    wire [2:0] list__T_28_addr;
    wire [3:0] list__T_28_data;
    wire list__T_31_clk;
    wire list__T_31_en;
    wire list__T_31_mask;
    wire [2:0] list__T_31_addr;
    wire [3:0] list__T_31_data;
    wire list__T_34_clk;
    wire list__T_34_en;
    wire list__T_34_mask;
    wire [2:0] list__T_34_addr;
    wire [3:0] list__T_34_data;
    wire list__T_37_clk;
    wire list__T_37_en;
    wire list__T_37_mask;
    wire [2:0] list__T_37_addr;
    wire [3:0] list__T_37_data;
    wire list__T_40_clk;
    wire list__T_40_en;
    wire list__T_40_mask;
    wire [2:0] list__T_40_addr;
    wire [3:0] list__T_40_data;
    wire list__T_42_clk;
    wire list__T_42_en;
    wire list__T_42_mask;
    wire [2:0] list__T_42_addr;
    wire [3:0] list__T_42_data;
    wire [3:0] list_read_datas;
    wire list_read_clks;
    wire list_read_ens;
    wire [2:0] list_read_addrs;
    wire [8:0] list_write_clks;
    wire [8:0] list_write_ens;
    wire [8:0] list_write_masks;
    wire [26:0] list_write_addrs;
    wire [35:0] list_write_datas;
    BITS #(.width(4), .high(3), .low(0)) bits_2 (
        .y(list_memVal_data),
        .in(list_read_datas)
    );
    assign list_read_clks = list_memVal_clk;
    assign list_read_ens = list_memVal_en;
    assign list_read_addrs = list_memVal_addr;
    wire [7:0] _WTEMP_1;
    CAT #(.width_a(4), .width_b(4)) cat_3 (
        .y(_WTEMP_1),
        .a(list__T_42_data),
        .b(list__T_40_data)
    );
    wire [11:0] _WTEMP_2;
    CAT #(.width_a(8), .width_b(4)) cat_4 (
        .y(_WTEMP_2),
        .a(_WTEMP_1),
        .b(list__T_37_data)
    );
    wire [15:0] _WTEMP_3;
    CAT #(.width_a(12), .width_b(4)) cat_5 (
        .y(_WTEMP_3),
        .a(_WTEMP_2),
        .b(list__T_34_data)
    );
    wire [19:0] _WTEMP_4;
    CAT #(.width_a(16), .width_b(4)) cat_6 (
        .y(_WTEMP_4),
        .a(_WTEMP_3),
        .b(list__T_31_data)
    );
    wire [23:0] _WTEMP_5;
    CAT #(.width_a(20), .width_b(4)) cat_7 (
        .y(_WTEMP_5),
        .a(_WTEMP_4),
        .b(list__T_28_data)
    );
    wire [27:0] _WTEMP_6;
    CAT #(.width_a(24), .width_b(4)) cat_8 (
        .y(_WTEMP_6),
        .a(_WTEMP_5),
        .b(list__T_25_data)
    );
    wire [31:0] _WTEMP_7;
    CAT #(.width_a(28), .width_b(4)) cat_9 (
        .y(_WTEMP_7),
        .a(_WTEMP_6),
        .b(list__T_22_data)
    );
    CAT #(.width_a(32), .width_b(4)) cat_10 (
        .y(list_write_datas),
        .a(_WTEMP_7),
        .b(list__T_19_data)
    );
    wire [1:0] _WTEMP_8;
    CAT #(.width_a(1), .width_b(1)) cat_11 (
        .y(_WTEMP_8),
        .a(list__T_42_clk),
        .b(list__T_40_clk)
    );
    wire [2:0] _WTEMP_9;
    CAT #(.width_a(2), .width_b(1)) cat_12 (
        .y(_WTEMP_9),
        .a(_WTEMP_8),
        .b(list__T_37_clk)
    );
    wire [3:0] _WTEMP_10;
    CAT #(.width_a(3), .width_b(1)) cat_13 (
        .y(_WTEMP_10),
        .a(_WTEMP_9),
        .b(list__T_34_clk)
    );
    wire [4:0] _WTEMP_11;
    CAT #(.width_a(4), .width_b(1)) cat_14 (
        .y(_WTEMP_11),
        .a(_WTEMP_10),
        .b(list__T_31_clk)
    );
    wire [5:0] _WTEMP_12;
    CAT #(.width_a(5), .width_b(1)) cat_15 (
        .y(_WTEMP_12),
        .a(_WTEMP_11),
        .b(list__T_28_clk)
    );
    wire [6:0] _WTEMP_13;
    CAT #(.width_a(6), .width_b(1)) cat_16 (
        .y(_WTEMP_13),
        .a(_WTEMP_12),
        .b(list__T_25_clk)
    );
    wire [7:0] _WTEMP_14;
    CAT #(.width_a(7), .width_b(1)) cat_17 (
        .y(_WTEMP_14),
        .a(_WTEMP_13),
        .b(list__T_22_clk)
    );
    CAT #(.width_a(8), .width_b(1)) cat_18 (
        .y(list_write_clks),
        .a(_WTEMP_14),
        .b(list__T_19_clk)
    );
    wire [1:0] _WTEMP_15;
    CAT #(.width_a(1), .width_b(1)) cat_19 (
        .y(_WTEMP_15),
        .a(list__T_42_en),
        .b(list__T_40_en)
    );
    wire [2:0] _WTEMP_16;
    CAT #(.width_a(2), .width_b(1)) cat_20 (
        .y(_WTEMP_16),
        .a(_WTEMP_15),
        .b(list__T_37_en)
    );
    wire [3:0] _WTEMP_17;
    CAT #(.width_a(3), .width_b(1)) cat_21 (
        .y(_WTEMP_17),
        .a(_WTEMP_16),
        .b(list__T_34_en)
    );
    wire [4:0] _WTEMP_18;
    CAT #(.width_a(4), .width_b(1)) cat_22 (
        .y(_WTEMP_18),
        .a(_WTEMP_17),
        .b(list__T_31_en)
    );
    wire [5:0] _WTEMP_19;
    CAT #(.width_a(5), .width_b(1)) cat_23 (
        .y(_WTEMP_19),
        .a(_WTEMP_18),
        .b(list__T_28_en)
    );
    wire [6:0] _WTEMP_20;
    CAT #(.width_a(6), .width_b(1)) cat_24 (
        .y(_WTEMP_20),
        .a(_WTEMP_19),
        .b(list__T_25_en)
    );
    wire [7:0] _WTEMP_21;
    CAT #(.width_a(7), .width_b(1)) cat_25 (
        .y(_WTEMP_21),
        .a(_WTEMP_20),
        .b(list__T_22_en)
    );
    CAT #(.width_a(8), .width_b(1)) cat_26 (
        .y(list_write_ens),
        .a(_WTEMP_21),
        .b(list__T_19_en)
    );
    wire [5:0] _WTEMP_22;
    CAT #(.width_a(3), .width_b(3)) cat_27 (
        .y(_WTEMP_22),
        .a(list__T_42_addr),
        .b(list__T_40_addr)
    );
    wire [8:0] _WTEMP_23;
    CAT #(.width_a(6), .width_b(3)) cat_28 (
        .y(_WTEMP_23),
        .a(_WTEMP_22),
        .b(list__T_37_addr)
    );
    wire [11:0] _WTEMP_24;
    CAT #(.width_a(9), .width_b(3)) cat_29 (
        .y(_WTEMP_24),
        .a(_WTEMP_23),
        .b(list__T_34_addr)
    );
    wire [14:0] _WTEMP_25;
    CAT #(.width_a(12), .width_b(3)) cat_30 (
        .y(_WTEMP_25),
        .a(_WTEMP_24),
        .b(list__T_31_addr)
    );
    wire [17:0] _WTEMP_26;
    CAT #(.width_a(15), .width_b(3)) cat_31 (
        .y(_WTEMP_26),
        .a(_WTEMP_25),
        .b(list__T_28_addr)
    );
    wire [20:0] _WTEMP_27;
    CAT #(.width_a(18), .width_b(3)) cat_32 (
        .y(_WTEMP_27),
        .a(_WTEMP_26),
        .b(list__T_25_addr)
    );
    wire [23:0] _WTEMP_28;
    CAT #(.width_a(21), .width_b(3)) cat_33 (
        .y(_WTEMP_28),
        .a(_WTEMP_27),
        .b(list__T_22_addr)
    );
    CAT #(.width_a(24), .width_b(3)) cat_34 (
        .y(list_write_addrs),
        .a(_WTEMP_28),
        .b(list__T_19_addr)
    );
    wire [1:0] _WTEMP_29;
    CAT #(.width_a(1), .width_b(1)) cat_35 (
        .y(_WTEMP_29),
        .a(list__T_42_mask),
        .b(list__T_40_mask)
    );
    wire [2:0] _WTEMP_30;
    CAT #(.width_a(2), .width_b(1)) cat_36 (
        .y(_WTEMP_30),
        .a(_WTEMP_29),
        .b(list__T_37_mask)
    );
    wire [3:0] _WTEMP_31;
    CAT #(.width_a(3), .width_b(1)) cat_37 (
        .y(_WTEMP_31),
        .a(_WTEMP_30),
        .b(list__T_34_mask)
    );
    wire [4:0] _WTEMP_32;
    CAT #(.width_a(4), .width_b(1)) cat_38 (
        .y(_WTEMP_32),
        .a(_WTEMP_31),
        .b(list__T_31_mask)
    );
    wire [5:0] _WTEMP_33;
    CAT #(.width_a(5), .width_b(1)) cat_39 (
        .y(_WTEMP_33),
        .a(_WTEMP_32),
        .b(list__T_28_mask)
    );
    wire [6:0] _WTEMP_34;
    CAT #(.width_a(6), .width_b(1)) cat_40 (
        .y(_WTEMP_34),
        .a(_WTEMP_33),
        .b(list__T_25_mask)
    );
    wire [7:0] _WTEMP_35;
    CAT #(.width_a(7), .width_b(1)) cat_41 (
        .y(_WTEMP_35),
        .a(_WTEMP_34),
        .b(list__T_22_mask)
    );
    CAT #(.width_a(8), .width_b(1)) cat_42 (
        .y(list_write_masks),
        .a(_WTEMP_35),
        .b(list__T_19_mask)
    );
    MRMWMEM #(.depth(8), .addrbits(3), .width(4), .readernum(1), .writernum(9), .isSyncRead(0)) list (
        .read_datas(list_read_datas),
        .read_clks(list_read_clks),
        .read_ens(list_read_ens),
        .read_addrs(list_read_addrs),
        .write_clks(list_write_clks),
        .write_ens(list_write_ens),
        .write_masks(list_write_masks),
        .write_addrs(list_write_addrs),
        .write_datas(list_write_datas)
    );
    assign list_memVal_addr = _index__q;
    assign list_memVal_en = 1'h1;
    assign list_memVal_clk = clock;
    wire _T_13;
    EQ_UNSIGNED #(.width(1)) u_eq_43 (
        .y(_T_13),
        .a(io_en),
        .b(1'h0)
    );
    wire _T_14;
    EQ_UNSIGNED #(.width(4)) u_eq_44 (
        .y(_T_14),
        .a(list_memVal_data),
        .b(io_data)
    );
    wire _T_16;
    EQ_UNSIGNED #(.width(3)) u_eq_45 (
        .y(_T_16),
        .a(_index__q),
        .b(3'h7)
    );
    wire _T_17;
    BITWISEOR #(.width(1)) bitwiseor_46 (
        .y(_T_17),
        .a(_T_14),
        .b(_T_16)
    );
    wire over;
    BITWISEAND #(.width(1)) bitwiseand_47 (
        .y(over),
        .a(_T_13),
        .b(_T_17)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_48 (
        .y(list__T_19_addr),
        .in(1'h0)
    );
    assign list__T_19_en = reset;
    assign list__T_19_clk = clock;
    assign list__T_19_mask = 1'h1;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_49 (
        .y(list__T_22_addr),
        .in(1'h1)
    );
    assign list__T_22_en = reset;
    assign list__T_22_clk = clock;
    assign list__T_22_mask = 1'h1;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_50 (
        .y(list__T_25_addr),
        .in(2'h2)
    );
    assign list__T_25_en = reset;
    assign list__T_25_clk = clock;
    assign list__T_25_mask = 1'h1;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_51 (
        .y(list__T_28_addr),
        .in(2'h3)
    );
    assign list__T_28_en = reset;
    assign list__T_28_clk = clock;
    assign list__T_28_mask = 1'h1;
    assign list__T_31_addr = 3'h4;
    assign list__T_31_en = reset;
    assign list__T_31_clk = clock;
    assign list__T_31_mask = 1'h1;
    assign list__T_34_addr = 3'h5;
    assign list__T_34_en = reset;
    assign list__T_34_clk = clock;
    assign list__T_34_mask = 1'h1;
    assign list__T_37_addr = 3'h6;
    assign list__T_37_en = reset;
    assign list__T_37_clk = clock;
    assign list__T_37_mask = 1'h1;
    assign list__T_40_addr = 3'h7;
    assign list__T_40_en = reset;
    assign list__T_40_clk = clock;
    assign list__T_40_mask = 1'h1;
    assign list__T_42_addr = io_wrAddr;
    assign list__T_42_en = io_isWr;
    assign list__T_42_clk = clock;
    assign list__T_42_mask = 1'h1;
    wire _T_44;
    EQ_UNSIGNED #(.width(1)) u_eq_52 (
        .y(_T_44),
        .a(io_isWr),
        .b(1'h0)
    );
    wire _T_45;
    BITWISEAND #(.width(1)) bitwiseand_53 (
        .y(_T_45),
        .a(_T_44),
        .b(io_en)
    );
    wire _T_48;
    EQ_UNSIGNED #(.width(1)) u_eq_54 (
        .y(_T_48),
        .a(over),
        .b(1'h0)
    );
    wire _T_50;
    EQ_UNSIGNED #(.width(1)) u_eq_55 (
        .y(_T_50),
        .a(io_isWr),
        .b(1'h0)
    );
    wire _T_52;
    EQ_UNSIGNED #(.width(1)) u_eq_56 (
        .y(_T_52),
        .a(io_en),
        .b(1'h0)
    );
    wire _T_53;
    BITWISEAND #(.width(1)) bitwiseand_57 (
        .y(_T_53),
        .a(_T_50),
        .b(_T_52)
    );
    wire _T_54;
    BITWISEAND #(.width(1)) bitwiseand_58 (
        .y(_T_54),
        .a(_T_53),
        .b(_T_48)
    );
    wire [3:0] _T_56;
    wire [2:0] _WTEMP_36;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_59 (
        .y(_WTEMP_36),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(3)) u_add_60 (
        .y(_T_56),
        .a(_index__q),
        .b(_WTEMP_36)
    );
    wire [2:0] _T_57;
    TAIL #(.width(4), .n(1)) tail_61 (
        .y(_T_57),
        .in(_T_56)
    );
    wire [2:0] _node_0;
    wire [2:0] _WTEMP_37;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_62 (
        .y(_WTEMP_37),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_63 (
        .y(_node_0),
        .sel(_T_45),
        .a(_WTEMP_37),
        .b(_index__q)
    );
    MUX_UNSIGNED #(.width(3)) u_mux_64 (
        .y(_WTEMP_0),
        .sel(_T_54),
        .a(_T_57),
        .b(_node_0)
    );
    assign io_done = over;
    assign io_target = _index__q;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_65 (
        .y(list__T_19_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_66 (
        .y(list__T_22_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_67 (
        .y(list__T_25_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_68 (
        .y(list__T_28_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_69 (
        .y(list__T_31_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_70 (
        .y(list__T_34_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_71 (
        .y(list__T_37_data),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_72 (
        .y(list__T_40_data),
        .in(1'h0)
    );
    assign list__T_42_data = io_data;
endmodule //DynamicMemorySearch
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
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
