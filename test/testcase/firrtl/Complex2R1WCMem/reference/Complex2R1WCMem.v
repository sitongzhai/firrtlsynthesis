module Complex2R1WCMem(
    input clock,
    input reset,
    input [3:0] io_rdAddr,
    output [7:0] io_rdData,
    input [3:0] io_rdAddr2,
    output [7:0] io_rdData2,
    input io_wrEna,
    input [7:0] io_wrData,
    input [3:0] io_wrAddr
);
    wire [7:0] mem__T_21_data;
    wire mem__T_21_clk;
    wire mem__T_21_en;
    wire [3:0] mem__T_21_addr;
    wire [7:0] mem__T_22_data;
    wire mem__T_22_clk;
    wire mem__T_22_en;
    wire [3:0] mem__T_22_addr;
    wire mem__T_23_clk;
    wire mem__T_23_en;
    wire mem__T_23_mask;
    wire [3:0] mem__T_23_addr;
    wire [7:0] mem__T_23_data;
    wire [15:0] mem_read_datas;
    wire [1:0] mem_read_clks;
    wire [1:0] mem_read_ens;
    wire [7:0] mem_read_addrs;
    wire mem_write_clks;
    wire mem_write_ens;
    wire mem_write_masks;
    wire [3:0] mem_write_addrs;
    wire [7:0] mem_write_datas;
    BITS #(.width(16), .high(7), .low(0)) bits_1 (
        .y(mem__T_21_data),
        .in(mem_read_datas)
    );
    BITS #(.width(16), .high(15), .low(8)) bits_2 (
        .y(mem__T_22_data),
        .in(mem_read_datas)
    );
    CAT #(.width_a(1), .width_b(1)) cat_3 (
        .y(mem_read_clks),
        .a(mem__T_22_clk),
        .b(mem__T_21_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_4 (
        .y(mem_read_ens),
        .a(mem__T_22_en),
        .b(mem__T_21_en)
    );
    CAT #(.width_a(4), .width_b(4)) cat_5 (
        .y(mem_read_addrs),
        .a(mem__T_22_addr),
        .b(mem__T_21_addr)
    );
    assign mem_write_datas = mem__T_23_data;
    assign mem_write_clks = mem__T_23_clk;
    assign mem_write_ens = mem__T_23_en;
    assign mem_write_addrs = mem__T_23_addr;
    assign mem_write_masks = mem__T_23_mask;
    MRMWMEM #(.depth(16), .addrbits(4), .width(8), .readernum(2), .writernum(1), .isSyncRead(0)) mem (
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
    assign mem__T_21_addr = io_rdAddr;
    assign mem__T_21_en = 1'h1;
    assign mem__T_21_clk = clock;
    assign mem__T_22_addr = io_rdAddr2;
    assign mem__T_22_en = 1'h1;
    assign mem__T_22_clk = clock;
    assign mem__T_23_addr = io_wrAddr;
    assign mem__T_23_en = io_wrEna;
    assign mem__T_23_clk = clock;
    assign mem__T_23_mask = 1'h1;
    assign io_rdData = mem__T_21_data;
    assign io_rdData2 = mem__T_22_data;
    assign mem__T_23_data = io_wrData;
endmodule //Complex2R1WCMem
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
