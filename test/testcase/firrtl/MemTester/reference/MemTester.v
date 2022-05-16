module MemTester(
    input clock,
    input reset
);
    wire [31:0] _count__q;
    wire [31:0] _count__d;
    DFF_POSCLK #(.width(32)) count (
        .q(_count__q),
        .d(_count__d),
        .clk(clock)
    );
    wire [31:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(32)) u_mux_1 (
        .y(_count__d),
        .sel(reset),
        .a(7'd100),
        .b(_WTEMP_0)
    );
    wire [32:0] _node_0;
    wire [31:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_2 (
        .y(_WTEMP_1),
        .in(1'd1)
    );
    SUB_UNSIGNED #(.width(32)) u_sub_3 (
        .y(_node_0),
        .a(_count__q),
        .b(_WTEMP_1)
    );
    wire _rwMod__clock;
    wire _rwMod__reset;
    ReadWrite rwMod (
        .clock(_rwMod__clock),
        .reset(_rwMod__reset)
    );
    TAIL #(.width(33), .n(1)) tail_32 (
        .y(_WTEMP_0),
        .in(_node_0)
    );
    assign _rwMod__clock = clock;
    assign _rwMod__reset = reset;
endmodule //MemTester
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ReadWrite(
    input clock,
    input reset
);
    wire [31:0] _n__q;
    wire [31:0] _n__d;
    DFF_POSCLK #(.width(32)) n (
        .q(_n__q),
        .d(_n__d),
        .clk(clock)
    );
    wire [31:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(32)) u_mux_4 (
        .y(_n__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_2)
    );
    wire _wmode__q;
    wire _wmode__d;
    DFF_POSCLK #(.width(1)) wmode (
        .q(_wmode__q),
        .d(_wmode__d),
        .clk(clock)
    );
    wire _WTEMP_3;
    MUX_UNSIGNED #(.width(1)) u_mux_5 (
        .y(_wmode__d),
        .sel(reset),
        .a(1'd1),
        .b(_WTEMP_3)
    );
    wire [4:0] _addr__q;
    wire [4:0] _addr__d;
    DFF_POSCLK #(.width(5)) addr (
        .q(_addr__q),
        .d(_addr__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_4;
    MUX_UNSIGNED #(.width(5)) u_mux_6 (
        .y(_addr__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_4)
    );
    wire [31:0] aa_rw_rdata;
    wire aa_rw_wmode;
    wire aa_rw_clk;
    wire aa_rw_en;
    wire aa_rw_wmask;
    wire [4:0] aa_rw_addr;
    wire [31:0] aa_rw_wdata;
    wire [31:0] aa_rw1_rdata;
    wire aa_rw1_wmode;
    wire aa_rw1_clk;
    wire aa_rw1_en;
    wire aa_rw1_wmask;
    wire [4:0] aa_rw1_addr;
    wire [31:0] aa_rw1_wdata;
    wire [63:0] aa_read_datas;
    wire [1:0] aa_read_clks;
    wire [1:0] aa_read_ens;
    wire [9:0] aa_read_addrs;
    wire [1:0] aa_write_clks;
    wire [1:0] aa_write_ens;
    wire [1:0] aa_write_masks;
    wire [9:0] aa_write_addrs;
    wire [63:0] aa_write_datas;
    wire _WTEMP_5;
    BITWISENOT #(.width(1)) bitwisenot_7 (
        .y(_WTEMP_5),
        .in(aa_rw_wmode)
    );
    wire _WTEMP_6;
    BITWISENOT #(.width(1)) bitwisenot_8 (
        .y(_WTEMP_6),
        .in(aa_rw1_wmode)
    );
    BITS #(.width(64), .high(31), .low(0)) bits_9 (
        .y(aa_rw_rdata),
        .in(aa_read_datas)
    );
    BITS #(.width(64), .high(63), .low(32)) bits_10 (
        .y(aa_rw1_rdata),
        .in(aa_read_datas)
    );
    CAT #(.width_a(1), .width_b(1)) cat_11 (
        .y(aa_read_clks),
        .a(aa_rw1_clk),
        .b(aa_rw_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_12 (
        .y(aa_read_ens),
        .a(_WTEMP_6),
        .b(_WTEMP_5)
    );
    CAT #(.width_a(5), .width_b(5)) cat_13 (
        .y(aa_read_addrs),
        .a(aa_rw1_addr),
        .b(aa_rw_addr)
    );
    CAT #(.width_a(32), .width_b(32)) cat_14 (
        .y(aa_write_datas),
        .a(aa_rw1_wdata),
        .b(aa_rw_wdata)
    );
    CAT #(.width_a(1), .width_b(1)) cat_15 (
        .y(aa_write_clks),
        .a(aa_rw1_clk),
        .b(aa_rw_clk)
    );
    CAT #(.width_a(1), .width_b(1)) cat_16 (
        .y(aa_write_ens),
        .a(aa_rw1_wmode),
        .b(aa_rw_wmode)
    );
    CAT #(.width_a(5), .width_b(5)) cat_17 (
        .y(aa_write_addrs),
        .a(aa_rw1_addr),
        .b(aa_rw_addr)
    );
    CAT #(.width_a(1), .width_b(1)) cat_18 (
        .y(aa_write_masks),
        .a(aa_rw1_wmask),
        .b(aa_rw_wmask)
    );
    MRMWMEM #(.depth(32), .addrbits(5), .width(32), .readernum(2), .writernum(2), .isSyncRead(0)) aa (
        .read_datas(aa_read_datas),
        .read_clks(aa_read_clks),
        .read_ens(aa_read_ens),
        .read_addrs(aa_read_addrs),
        .write_clks(aa_write_clks),
        .write_ens(aa_write_ens),
        .write_masks(aa_write_masks),
        .write_addrs(aa_write_addrs),
        .write_datas(aa_write_datas)
    );
    wire _node_1;
    EQ_UNSIGNED #(.width(1)) u_eq_19 (
        .y(_node_1),
        .a(_wmode__q),
        .b(1'd0)
    );
    wire [5:0] _node_2;
    wire [4:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_20 (
        .y(_WTEMP_7),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(5)) u_add_21 (
        .y(_node_2),
        .a(_addr__q),
        .b(_WTEMP_7)
    );
    wire [32:0] _node_3;
    wire [31:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_22 (
        .y(_WTEMP_8),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(32)) u_add_23 (
        .y(_node_3),
        .a(_n__q),
        .b(_WTEMP_8)
    );
    wire [31:0] m_rw_rdata;
    wire m_rw_wmode;
    wire m_rw_clk;
    wire m_rw_en;
    wire m_rw_wmask;
    wire [4:0] m_rw_addr;
    wire [31:0] m_rw_wdata;
    wire _WTEMP_9;
    BITWISENOT #(.width(1)) bitwisenot_24 (
        .y(_WTEMP_9),
        .in(m_rw_wmode)
    );
    RAMMEM #(.depth(32), .addrbits(5), .width(32), .isSyncRead(0)) m (
        .read_data(m_rw_rdata),
        .read_clk(m_rw_clk),
        .read_en(_WTEMP_9),
        .read_addr(m_rw_addr),
        .write_clk(m_rw_clk),
        .write_en(m_rw_wmode),
        .write_mask(m_rw_wmask),
        .write_addr(m_rw_addr),
        .write_data(m_rw_wdata)
    );
    assign aa_rw_addr = _addr__q;
    assign aa_rw_clk = clock;
    assign aa_rw_en = 1'h1;
    assign aa_rw_wdata = _n__q;
    assign aa_rw_wmask = 1'h1;
    assign aa_rw_wmode = _wmode__q;
    assign aa_rw1_addr = _addr__q;
    assign aa_rw1_clk = clock;
    assign aa_rw1_en = 1'h1;
    assign aa_rw1_wdata = _n__q;
    assign aa_rw1_wmask = 1'h1;
    assign aa_rw1_wmode = _wmode__q;
    wire [5:0] _WTEMP_10;
    wire [5:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(5), .n(6)) u_pad_25 (
        .y(_WTEMP_11),
        .in(_addr__q)
    );
    MUX_UNSIGNED #(.width(6)) u_mux_26 (
        .y(_WTEMP_10),
        .sel(_node_1),
        .a(_node_2),
        .b(_WTEMP_11)
    );
    BITS #(.width(6), .high(4), .low(0)) bits_27 (
        .y(_WTEMP_4),
        .in(_WTEMP_10)
    );
    assign m_rw_addr = _addr__q;
    assign m_rw_clk = clock;
    assign m_rw_en = 1'h1;
    assign m_rw_wdata = _n__q;
    assign m_rw_wmask = 1'h1;
    assign m_rw_wmode = _wmode__q;
    wire [32:0] _WTEMP_12;
    wire [32:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(32), .n(33)) u_pad_28 (
        .y(_WTEMP_13),
        .in(_n__q)
    );
    MUX_UNSIGNED #(.width(33)) u_mux_29 (
        .y(_WTEMP_12),
        .sel(_node_1),
        .a(_node_3),
        .b(_WTEMP_13)
    );
    BITS #(.width(33), .high(31), .low(0)) bits_30 (
        .y(_WTEMP_2),
        .in(_WTEMP_12)
    );
    BITWISENOT #(.width(1)) bitwisenot_31 (
        .y(_WTEMP_3),
        .in(_wmode__q)
    );
endmodule //ReadWrite
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module RAMMEM(read_data, read_clk, read_en, read_addr, write_clk, write_en, write_mask, write_addr, write_data);
    parameter depth = 16;
    parameter addrbits = 4;
    parameter width = 32;
    parameter isSyncRead = 0;
    output [width-1:0] read_data;
    input read_clk;
    input read_en;
    input [addrbits-1:0] read_addr;
    input write_clk;
    input write_en;
    input write_mask;
    input [addrbits-1:0] write_addr;
    input [width-1:0] write_data;
    reg [width-1:0] memcore [0:depth-1];
    wire [addrbits-1:0] final_read_addr;
    generate
        if (isSyncRead) begin: raddr_processor
            reg [addrbits-1:0] read_addr_pipe_0;
            always @(posedge read_clk) begin
                if (read_en) begin
                    read_addr_pipe_0 <= read_addr;
                end
            end
            assign final_read_addr = read_addr_pipe_0;
        end else begin: raddr_processor
            assign final_read_addr = read_addr;
        end
    endgenerate
    assign read_data = memcore[final_read_addr];
    always @(posedge write_clk) begin
        if (write_en & write_mask) begin
            memcore[write_addr] <= write_data;
        end
    end
endmodule // RAMMEM
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
