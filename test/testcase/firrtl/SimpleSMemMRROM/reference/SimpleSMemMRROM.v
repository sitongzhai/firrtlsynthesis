module SimpleSMemMRROM(
    input clock,
    input reset,
    input [3:0] io_rdAddr,
    output [7:0] io_rdData,
    input [3:0] io_rdAddr2,
    output [7:0] io_rdData2
);
    wire [7:0] mem__T_15_data;
    wire mem__T_15_clk;
    wire mem__T_15_en;
    wire [5:0] mem__T_15_addr;
    wire [7:0] mem__T_16_data;
    wire mem__T_16_clk;
    wire mem__T_16_en;
    wire [5:0] mem__T_16_addr;
    wire [15:0] mem_read_datas;
    wire [1:0] mem_read_clks;
    wire [1:0] mem_read_ens;
    wire [11:0] mem_read_addrs;
    BITS #(.width(16), .high(7), .low(0)) bits_1 (
        .y(mem__T_15_data),
        .in(mem_read_datas)
    );
    BITS #(.width(16), .high(15), .low(8)) bits_2 (
        .y(mem__T_16_data),
        .in(mem_read_datas)
    );
    CAT #(.width_a(1), .width_b(1)) cat_3 (
        .y(mem_read_clks),
        .a(mem__T_16_clk),
        .b(mem__T_15_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_4 (
        .y(mem_read_ens),
        .a(mem__T_16_en),
        .b(mem__T_15_en)
    );
    CAT #(.width_a(6), .width_b(6)) cat_5 (
        .y(mem_read_addrs),
        .a(mem__T_16_addr),
        .b(mem__T_15_addr)
    );
    MRROMMEM #(.depth(64), .addrbits(6), .width(8), .readernum(2), .isSyncRead(1)) mem (
        .read_datas(mem_read_datas),
        .read_clks(mem_read_clks),
        .read_ens(mem_read_ens),
        .read_addrs(mem_read_addrs)
    );
    PAD_UNSIGNED #(.width(4), .n(6)) u_pad_6 (
        .y(mem__T_15_addr),
        .in(io_rdAddr)
    );
    assign mem__T_15_en = 1'h1;
    assign mem__T_15_clk = clock;
    PAD_UNSIGNED #(.width(4), .n(6)) u_pad_7 (
        .y(mem__T_16_addr),
        .in(io_rdAddr2)
    );
    assign mem__T_16_en = 1'h1;
    assign mem__T_16_clk = clock;
    assign io_rdData = mem__T_15_data;
    assign io_rdData2 = mem__T_16_data;
endmodule //SimpleSMemMRROM
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
module MRROMMEM(read_datas, read_clks, read_ens, read_addrs);
    parameter depth = 16;
    parameter addrbits = 4;
    parameter width = 32;
    parameter readernum = 2;
    parameter isSyncRead = 0;
    output [(width*readernum-1):0] read_datas;
    input [(1*readernum-1):0] read_clks;
    input [(1*readernum-1):0] read_ens;
    input [(addrbits*readernum-1):0] read_addrs;
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
endmodule // MRROMMEM
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
