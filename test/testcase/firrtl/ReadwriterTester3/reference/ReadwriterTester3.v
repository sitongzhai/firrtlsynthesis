module ReadwriterTester3(
    input clock,
    input [4:0] waddr,
    input [4:0] waddr2,
    input [31:0] wdata,
    input [31:0] wdata2,
    input [4:0] raddr,
    input [4:0] raddr2,
    input rw_wen,
    input rw_wen2,
    output [31:0] rdata,
    output [31:0] rdata2,
    output [31:0] rw_rdata,
    output [31:0] rw_rdata2
);
    wire [31:0] m_read_data;
    wire m_read_clk;
    wire m_read_en;
    wire [4:0] m_read_addr;
    wire [31:0] m_read2_data;
    wire m_read2_clk;
    wire m_read2_en;
    wire [4:0] m_read2_addr;
    wire m_write_clk;
    wire m_write_en;
    wire m_write_mask;
    wire [4:0] m_write_addr;
    wire [31:0] m_write_data;
    wire m_write2_clk;
    wire m_write2_en;
    wire m_write2_mask;
    wire [4:0] m_write2_addr;
    wire [31:0] m_write2_data;
    wire [31:0] m_rw_rdata;
    wire m_rw_wmode;
    wire m_rw_clk;
    wire m_rw_en;
    wire m_rw_wmask;
    wire [4:0] m_rw_addr;
    wire [31:0] m_rw_wdata;
    wire [31:0] m_rw2_rdata;
    wire m_rw2_wmode;
    wire m_rw2_clk;
    wire m_rw2_en;
    wire m_rw2_wmask;
    wire [4:0] m_rw2_addr;
    wire [31:0] m_rw2_wdata;
    wire [127:0] m_read_datas;
    wire [3:0] m_read_clks;
    wire [3:0] m_read_ens;
    wire [19:0] m_read_addrs;
    wire [3:0] m_write_clks;
    wire [3:0] m_write_ens;
    wire [3:0] m_write_masks;
    wire [19:0] m_write_addrs;
    wire [127:0] m_write_datas;
    wire _WTEMP_0;
    BITWISENOT #(.width(1)) bitwisenot_1 (
        .y(_WTEMP_0),
        .in(m_rw_wmode)
    );
    wire _WTEMP_1;
    BITWISENOT #(.width(1)) bitwisenot_2 (
        .y(_WTEMP_1),
        .in(m_rw2_wmode)
    );
    BITS #(.width(128), .high(31), .low(0)) bits_3 (
        .y(m_read_data),
        .in(m_read_datas)
    );
    BITS #(.width(128), .high(63), .low(32)) bits_4 (
        .y(m_read2_data),
        .in(m_read_datas)
    );
    BITS #(.width(128), .high(95), .low(64)) bits_5 (
        .y(m_rw_rdata),
        .in(m_read_datas)
    );
    BITS #(.width(128), .high(127), .low(96)) bits_6 (
        .y(m_rw2_rdata),
        .in(m_read_datas)
    );
    wire [1:0] _WTEMP_2;
    CAT #(.width_a(1), .width_b(1)) cat_7 (
        .y(_WTEMP_2),
        .a(m_rw2_clk),
        .b(m_rw_clk)
    );
    wire [2:0] _WTEMP_3;
    CAT #(.width_a(2), .width_b(1)) cat_8 (
        .y(_WTEMP_3),
        .a(_WTEMP_2),
        .b(m_read2_clk)
    );
    CAT #(.width_a(3), .width_b(1)) cat_9 (
        .y(m_read_clks),
        .a(_WTEMP_3),
        .b(m_read_clk)
    );
    wire [1:0] _WTEMP_4;
    CAT #(.width_a(1), .width_b(1)) cat_10 (
        .y(_WTEMP_4),
        .a(_WTEMP_1),
        .b(_WTEMP_0)
    );
    wire [2:0] _WTEMP_5;
    CAT #(.width_a(2), .width_b(1)) cat_11 (
        .y(_WTEMP_5),
        .a(_WTEMP_4),
        .b(m_read2_en)
    );
    CAT #(.width_a(3), .width_b(1)) cat_12 (
        .y(m_read_ens),
        .a(_WTEMP_5),
        .b(m_read_en)
    );
    wire [9:0] _WTEMP_6;
    CAT #(.width_a(5), .width_b(5)) cat_13 (
        .y(_WTEMP_6),
        .a(m_rw2_addr),
        .b(m_rw_addr)
    );
    wire [14:0] _WTEMP_7;
    CAT #(.width_a(10), .width_b(5)) cat_14 (
        .y(_WTEMP_7),
        .a(_WTEMP_6),
        .b(m_read2_addr)
    );
    CAT #(.width_a(15), .width_b(5)) cat_15 (
        .y(m_read_addrs),
        .a(_WTEMP_7),
        .b(m_read_addr)
    );
    wire [63:0] _WTEMP_8;
    CAT #(.width_a(32), .width_b(32)) cat_16 (
        .y(_WTEMP_8),
        .a(m_rw2_wdata),
        .b(m_rw_wdata)
    );
    wire [95:0] _WTEMP_9;
    CAT #(.width_a(64), .width_b(32)) cat_17 (
        .y(_WTEMP_9),
        .a(_WTEMP_8),
        .b(m_write2_data)
    );
    CAT #(.width_a(96), .width_b(32)) cat_18 (
        .y(m_write_datas),
        .a(_WTEMP_9),
        .b(m_write_data)
    );
    wire [1:0] _WTEMP_10;
    CAT #(.width_a(1), .width_b(1)) cat_19 (
        .y(_WTEMP_10),
        .a(m_rw2_clk),
        .b(m_rw_clk)
    );
    wire [2:0] _WTEMP_11;
    CAT #(.width_a(2), .width_b(1)) cat_20 (
        .y(_WTEMP_11),
        .a(_WTEMP_10),
        .b(m_write2_clk)
    );
    CAT #(.width_a(3), .width_b(1)) cat_21 (
        .y(m_write_clks),
        .a(_WTEMP_11),
        .b(m_write_clk)
    );
    wire [1:0] _WTEMP_12;
    CAT #(.width_a(1), .width_b(1)) cat_22 (
        .y(_WTEMP_12),
        .a(m_rw2_wmode),
        .b(m_rw_wmode)
    );
    wire [2:0] _WTEMP_13;
    CAT #(.width_a(2), .width_b(1)) cat_23 (
        .y(_WTEMP_13),
        .a(_WTEMP_12),
        .b(m_write2_en)
    );
    CAT #(.width_a(3), .width_b(1)) cat_24 (
        .y(m_write_ens),
        .a(_WTEMP_13),
        .b(m_write_en)
    );
    wire [9:0] _WTEMP_14;
    CAT #(.width_a(5), .width_b(5)) cat_25 (
        .y(_WTEMP_14),
        .a(m_rw2_addr),
        .b(m_rw_addr)
    );
    wire [14:0] _WTEMP_15;
    CAT #(.width_a(10), .width_b(5)) cat_26 (
        .y(_WTEMP_15),
        .a(_WTEMP_14),
        .b(m_write2_addr)
    );
    CAT #(.width_a(15), .width_b(5)) cat_27 (
        .y(m_write_addrs),
        .a(_WTEMP_15),
        .b(m_write_addr)
    );
    wire [1:0] _WTEMP_16;
    CAT #(.width_a(1), .width_b(1)) cat_28 (
        .y(_WTEMP_16),
        .a(m_rw2_wmask),
        .b(m_rw_wmask)
    );
    wire [2:0] _WTEMP_17;
    CAT #(.width_a(2), .width_b(1)) cat_29 (
        .y(_WTEMP_17),
        .a(_WTEMP_16),
        .b(m_write2_mask)
    );
    CAT #(.width_a(3), .width_b(1)) cat_30 (
        .y(m_write_masks),
        .a(_WTEMP_17),
        .b(m_write_mask)
    );
    MRMWMEM #(.depth(32), .addrbits(5), .width(32), .readernum(4), .writernum(4), .isSyncRead(1)) m (
        .read_datas(m_read_datas),
        .read_clks(m_read_clks),
        .read_ens(m_read_ens),
        .read_addrs(m_read_addrs),
        .write_clks(m_write_clks),
        .write_ens(m_write_ens),
        .write_masks(m_write_masks),
        .write_addrs(m_write_addrs),
        .write_datas(m_write_datas)
    );
    assign m_read_addr = raddr;
    assign m_read_clk = clock;
    assign m_read_en = 1'h1;
    assign m_read2_addr = raddr2;
    assign m_read2_clk = clock;
    assign m_read2_en = 1'h1;
    assign m_rw_addr = waddr;
    assign m_rw_clk = clock;
    assign m_rw_en = 1'h1;
    assign m_rw_wdata = wdata;
    assign m_rw_wmask = 1'h1;
    assign m_rw_wmode = rw_wen;
    assign m_rw2_addr = waddr2;
    assign m_rw2_clk = clock;
    assign m_rw2_en = 1'h1;
    assign m_rw2_wdata = wdata2;
    assign m_rw2_wmask = 1'h1;
    assign m_rw2_wmode = rw_wen2;
    assign m_write_addr = waddr;
    assign m_write_clk = clock;
    assign m_write_data = wdata;
    assign m_write_en = 1'h1;
    assign m_write_mask = 1'h1;
    assign m_write2_addr = waddr2;
    assign m_write2_clk = clock;
    assign m_write2_data = wdata2;
    assign m_write2_en = 1'h1;
    assign m_write2_mask = 1'h1;
    assign rdata = m_read_data;
    assign rdata2 = m_read2_data;
    assign rw_rdata = m_rw_rdata;
    assign rw_rdata2 = m_rw2_rdata;
endmodule //ReadwriterTester3
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
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
