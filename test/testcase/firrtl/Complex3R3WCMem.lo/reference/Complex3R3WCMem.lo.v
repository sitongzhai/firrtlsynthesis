module Complex3R3WCMem(
    input clock,
    input reset,
    input [3:0] io_rdAddr,
    output [7:0] io_rdData,
    input [3:0] io_rdAddr2,
    output [7:0] io_rdData2,
    input [3:0] io_rdAddr3,
    output [7:0] io_rdData3,
    input io_wrEna,
    input [7:0] io_wrData,
    input [3:0] io_wrAddr,
    input io_wrEna2,
    input [7:0] io_wrData2,
    input [3:0] io_wrAddr2,
    input io_wrEna3,
    input [7:0] io_wrData3,
    input [3:0] io_wrAddr3
);
    wire [7:0] mem__T_37_data;
    wire mem__T_37_clk;
    wire mem__T_37_en;
    wire [3:0] mem__T_37_addr;
    wire [7:0] mem__T_38_data;
    wire mem__T_38_clk;
    wire mem__T_38_en;
    wire [3:0] mem__T_38_addr;
    wire [7:0] mem__T_39_data;
    wire mem__T_39_clk;
    wire mem__T_39_en;
    wire [3:0] mem__T_39_addr;
    wire mem__T_40_clk;
    wire mem__T_40_en;
    wire mem__T_40_mask;
    wire [3:0] mem__T_40_addr;
    wire [7:0] mem__T_40_data;
    wire mem__T_41_clk;
    wire mem__T_41_en;
    wire mem__T_41_mask;
    wire [3:0] mem__T_41_addr;
    wire [7:0] mem__T_41_data;
    wire mem__T_42_clk;
    wire mem__T_42_en;
    wire mem__T_42_mask;
    wire [3:0] mem__T_42_addr;
    wire [7:0] mem__T_42_data;
    wire [23:0] mem_read_datas;
    wire [2:0] mem_read_clks;
    wire [2:0] mem_read_ens;
    wire [11:0] mem_read_addrs;
    wire [2:0] mem_write_clks;
    wire [2:0] mem_write_ens;
    wire [2:0] mem_write_masks;
    wire [11:0] mem_write_addrs;
    wire [23:0] mem_write_datas;
    BITS #(.width(24), .high(7), .low(0)) bits_1 (
        .y(mem__T_37_data),
        .in(mem_read_datas)
    );
    BITS #(.width(24), .high(15), .low(8)) bits_2 (
        .y(mem__T_38_data),
        .in(mem_read_datas)
    );
    BITS #(.width(24), .high(23), .low(16)) bits_3 (
        .y(mem__T_39_data),
        .in(mem_read_datas)
    );
    wire [1:0] _WTEMP_0;
    CAT #(.width_a(1), .width_b(1)) cat_4 (
        .y(_WTEMP_0),
        .a(mem__T_39_clk),
        .b(mem__T_38_clk)
    );
    CAT #(.width_a(2), .width_b(1)) cat_5 (
        .y(mem_read_clks),
        .a(_WTEMP_0),
        .b(mem__T_37_clk)
    );
    wire [1:0] _WTEMP_1;
    CAT #(.width_a(1), .width_b(1)) cat_6 (
        .y(_WTEMP_1),
        .a(mem__T_39_en),
        .b(mem__T_38_en)
    );
    CAT #(.width_a(2), .width_b(1)) cat_7 (
        .y(mem_read_ens),
        .a(_WTEMP_1),
        .b(mem__T_37_en)
    );
    wire [7:0] _WTEMP_2;
    CAT #(.width_a(4), .width_b(4)) cat_8 (
        .y(_WTEMP_2),
        .a(mem__T_39_addr),
        .b(mem__T_38_addr)
    );
    CAT #(.width_a(8), .width_b(4)) cat_9 (
        .y(mem_read_addrs),
        .a(_WTEMP_2),
        .b(mem__T_37_addr)
    );
    wire [15:0] _WTEMP_3;
    CAT #(.width_a(8), .width_b(8)) cat_10 (
        .y(_WTEMP_3),
        .a(mem__T_42_data),
        .b(mem__T_41_data)
    );
    CAT #(.width_a(16), .width_b(8)) cat_11 (
        .y(mem_write_datas),
        .a(_WTEMP_3),
        .b(mem__T_40_data)
    );
    wire [1:0] _WTEMP_4;
    CAT #(.width_a(1), .width_b(1)) cat_12 (
        .y(_WTEMP_4),
        .a(mem__T_42_clk),
        .b(mem__T_41_clk)
    );
    CAT #(.width_a(2), .width_b(1)) cat_13 (
        .y(mem_write_clks),
        .a(_WTEMP_4),
        .b(mem__T_40_clk)
    );
    wire [1:0] _WTEMP_5;
    CAT #(.width_a(1), .width_b(1)) cat_14 (
        .y(_WTEMP_5),
        .a(mem__T_42_en),
        .b(mem__T_41_en)
    );
    CAT #(.width_a(2), .width_b(1)) cat_15 (
        .y(mem_write_ens),
        .a(_WTEMP_5),
        .b(mem__T_40_en)
    );
    wire [7:0] _WTEMP_6;
    CAT #(.width_a(4), .width_b(4)) cat_16 (
        .y(_WTEMP_6),
        .a(mem__T_42_addr),
        .b(mem__T_41_addr)
    );
    CAT #(.width_a(8), .width_b(4)) cat_17 (
        .y(mem_write_addrs),
        .a(_WTEMP_6),
        .b(mem__T_40_addr)
    );
    wire [1:0] _WTEMP_7;
    CAT #(.width_a(1), .width_b(1)) cat_18 (
        .y(_WTEMP_7),
        .a(mem__T_42_mask),
        .b(mem__T_41_mask)
    );
    CAT #(.width_a(2), .width_b(1)) cat_19 (
        .y(mem_write_masks),
        .a(_WTEMP_7),
        .b(mem__T_40_mask)
    );
    MRMWMEM #(.depth(16), .addrbits(4), .width(8), .readernum(3), .writernum(3), .isSyncRead(0)) mem (
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
    wire [3:0] _GEN_0;
    assign _GEN_0 = io_wrAddr;
    wire _GEN_1;
    assign _GEN_1 = clock;
    wire _GEN_2;
    MUX_UNSIGNED #(.width(1)) u_mux_20 (
        .y(_GEN_2),
        .sel(io_wrEna),
        .a(1'h1),
        .b(1'h0)
    );
    wire _GEN_3;
    assign _GEN_3 = 1'h1;
    wire [7:0] _GEN_4;
    assign _GEN_4 = io_wrData;
    wire [3:0] _GEN_5;
    assign _GEN_5 = io_wrAddr2;
    wire _GEN_6;
    assign _GEN_6 = clock;
    wire _GEN_7;
    MUX_UNSIGNED #(.width(1)) u_mux_21 (
        .y(_GEN_7),
        .sel(io_wrEna2),
        .a(1'h1),
        .b(1'h0)
    );
    wire _GEN_8;
    assign _GEN_8 = 1'h1;
    wire [7:0] _GEN_9;
    assign _GEN_9 = io_wrData2;
    wire [3:0] _GEN_10;
    assign _GEN_10 = io_wrAddr3;
    wire _GEN_11;
    assign _GEN_11 = clock;
    wire _GEN_12;
    MUX_UNSIGNED #(.width(1)) u_mux_22 (
        .y(_GEN_12),
        .sel(io_wrEna3),
        .a(1'h1),
        .b(1'h0)
    );
    wire _GEN_13;
    assign _GEN_13 = 1'h1;
    wire [7:0] _GEN_14;
    assign _GEN_14 = io_wrData3;
    assign io_rdData = mem__T_37_data;
    assign io_rdData2 = mem__T_38_data;
    assign io_rdData3 = mem__T_39_data;
    assign mem__T_37_addr = io_rdAddr;
    assign mem__T_37_clk = clock;
    assign mem__T_37_en = 1'h1;
    assign mem__T_38_addr = io_rdAddr2;
    assign mem__T_38_clk = clock;
    assign mem__T_38_en = 1'h1;
    assign mem__T_39_addr = io_rdAddr3;
    assign mem__T_39_clk = clock;
    assign mem__T_39_en = 1'h1;
    assign mem__T_40_addr = _GEN_0;
    assign mem__T_40_clk = _GEN_1;
    assign mem__T_40_data = _GEN_4;
    assign mem__T_40_en = _GEN_2;
    assign mem__T_40_mask = _GEN_3;
    assign mem__T_41_addr = _GEN_5;
    assign mem__T_41_clk = _GEN_6;
    assign mem__T_41_data = _GEN_9;
    assign mem__T_41_en = _GEN_7;
    assign mem__T_41_mask = _GEN_8;
    assign mem__T_42_addr = _GEN_10;
    assign mem__T_42_clk = _GEN_11;
    assign mem__T_42_data = _GEN_14;
    assign mem__T_42_en = _GEN_12;
    assign mem__T_42_mask = _GEN_13;
endmodule //Complex3R3WCMem
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
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
