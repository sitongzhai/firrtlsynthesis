module ReadwriterTester2(
    input clock,
    input [4:0] waddr,
    input [31:0] wdata,
    input [4:0] raddr,
    input rw_wen,
    output [31:0] rdata,
    output [31:0] rw_rdata
);
    wire [31:0] m_read_data;
    wire m_read_clk;
    wire m_read_en;
    wire [4:0] m_read_addr;
    wire m_write_clk;
    wire m_write_en;
    wire m_write_mask;
    wire [4:0] m_write_addr;
    wire [31:0] m_write_data;
    wire [31:0] m_rw_rdata;
    wire m_rw_wmode;
    wire m_rw_clk;
    wire m_rw_en;
    wire m_rw_wmask;
    wire [4:0] m_rw_addr;
    wire [31:0] m_rw_wdata;
    wire [63:0] m_read_datas;
    wire [1:0] m_read_clks;
    wire [1:0] m_read_ens;
    wire [9:0] m_read_addrs;
    wire [1:0] m_write_clks;
    wire [1:0] m_write_ens;
    wire [1:0] m_write_masks;
    wire [9:0] m_write_addrs;
    wire [63:0] m_write_datas;
    wire _WTEMP_0;
    BITWISENOT #(.width(1)) bitwisenot_1 (
        .y(_WTEMP_0),
        .in(m_rw_wmode)
    );
    BITS #(.width(64), .high(31), .low(0)) bits_2 (
        .y(m_read_data),
        .in(m_read_datas)
    );
    BITS #(.width(64), .high(63), .low(32)) bits_3 (
        .y(m_rw_rdata),
        .in(m_read_datas)
    );
    CAT #(.width_a(1), .width_b(1)) cat_4 (
        .y(m_read_clks),
        .a(m_rw_clk),
        .b(m_read_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_5 (
        .y(m_read_ens),
        .a(_WTEMP_0),
        .b(m_read_en)
    );
    CAT #(.width_a(5), .width_b(5)) cat_6 (
        .y(m_read_addrs),
        .a(m_rw_addr),
        .b(m_read_addr)
    );
    CAT #(.width_a(32), .width_b(32)) cat_7 (
        .y(m_write_datas),
        .a(m_rw_wdata),
        .b(m_write_data)
    );
    CAT #(.width_a(1), .width_b(1)) cat_8 (
        .y(m_write_clks),
        .a(m_rw_clk),
        .b(m_write_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_9 (
        .y(m_write_ens),
        .a(m_rw_wmode),
        .b(m_write_en)
    );
    CAT #(.width_a(5), .width_b(5)) cat_10 (
        .y(m_write_addrs),
        .a(m_rw_addr),
        .b(m_write_addr)
    );
    CAT #(.width_a(1), .width_b(1)) cat_11 (
        .y(m_write_masks),
        .a(m_rw_wmask),
        .b(m_write_mask)
    );
    MRMWMEM #(.depth(32), .addrbits(5), .width(32), .readernum(2), .writernum(2), .isSyncRead(1)) m (
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
    assign m_rw_addr = waddr;
    assign m_rw_clk = clock;
    assign m_rw_en = 1'h1;
    assign m_rw_wdata = wdata;
    assign m_rw_wmask = 1'h1;
    assign m_rw_wmode = rw_wen;
    assign m_write_addr = waddr;
    assign m_write_clk = clock;
    assign m_write_data = wdata;
    assign m_write_en = 1'h1;
    assign m_write_mask = 1'h1;
    assign rdata = m_read_data;
    assign rw_rdata = m_rw_rdata;
endmodule //ReadwriterTester2
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
