module ChirrtlMems(
    input clock,
    input reset
);
    wire [31:0] ram_r_data;
    wire ram_r_clk;
    wire ram_r_en;
    wire [3:0] ram_r_addr;
    wire ram_w_clk;
    wire ram_w_en;
    wire ram_w_mask;
    wire [3:0] ram_w_addr;
    wire [31:0] ram_w_data;
    RAMMEM #(.depth(16), .addrbits(4), .width(32), .isSyncRead(0)) ram (
        .read_data(ram_r_data),
        .read_clk(ram_r_clk),
        .read_en(ram_r_en),
        .read_addr(ram_r_addr),
        .write_clk(ram_w_clk),
        .write_en(ram_w_en),
        .write_mask(ram_w_mask),
        .write_addr(ram_w_addr),
        .write_data(ram_w_data)
    );
    wire newClock;
    assign newClock = clock;
    wire wen;
    wire [3:0] _raddr__q;
    wire [3:0] _raddr__d;
    DFF_POSCLK #(.width(4)) raddr (
        .q(_raddr__q),
        .d(_raddr__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(4)) u_mux_1 (
        .y(_raddr__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_0)
    );
    assign ram_r_addr = _raddr__q;
    assign ram_r_en = 1'h1;
    assign ram_r_clk = newClock;
    wire [3:0] _waddr__q;
    wire [3:0] _waddr__d;
    DFF_POSCLK #(.width(4)) waddr (
        .q(_waddr__q),
        .d(_waddr__d),
        .clk(clock)
    );
    wire [3:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(4)) u_mux_2 (
        .y(_waddr__d),
        .sel(reset),
        .a(1'd0),
        .b(_WTEMP_1)
    );
    wire newerClock;
    assign newerClock = clock;
    assign ram_w_addr = _waddr__q;
    assign ram_w_en = wen;
    assign ram_w_clk = newerClock;
    assign ram_w_mask = 1'h1;
    wire _node_0;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_3 (
        .y(_WTEMP_2),
        .in(1'd0)
    );
    EQ_UNSIGNED #(.width(4)) u_eq_4 (
        .y(_node_0),
        .a(_waddr__q),
        .b(_WTEMP_2)
    );
    wire [4:0] _node_1;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_5 (
        .y(_WTEMP_3),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_6 (
        .y(_node_1),
        .a(_raddr__q),
        .b(_WTEMP_3)
    );
    wire [4:0] _node_2;
    wire [4:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_7 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_8 (
        .y(_node_2),
        .sel(_node_0),
        .a(_WTEMP_4),
        .b(_node_1)
    );
    wire [4:0] _node_3;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_9 (
        .y(_WTEMP_5),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_10 (
        .y(_node_3),
        .a(_raddr__q),
        .b(_WTEMP_5)
    );
    wire [4:0] _node_4;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_11 (
        .y(_WTEMP_6),
        .in(1'd1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_12 (
        .y(_node_4),
        .a(_waddr__q),
        .b(_WTEMP_6)
    );
    wire [4:0] _WTEMP_7;
    MUX_UNSIGNED #(.width(5)) u_mux_13 (
        .y(_WTEMP_7),
        .sel(wen),
        .a(_node_2),
        .b(_node_3)
    );
    BITS #(.width(5), .high(3), .low(0)) bits_14 (
        .y(_WTEMP_0),
        .in(_WTEMP_7)
    );
    PAD_UNSIGNED #(.width(4), .n(32)) u_pad_15 (
        .y(ram_w_data),
        .in(_waddr__q)
    );
    wire [4:0] _WTEMP_8;
    wire [4:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(4), .n(5)) u_pad_16 (
        .y(_WTEMP_9),
        .in(_waddr__q)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_17 (
        .y(_WTEMP_8),
        .sel(wen),
        .a(_node_4),
        .b(_WTEMP_9)
    );
    BITS #(.width(5), .high(3), .low(0)) bits_18 (
        .y(_WTEMP_1),
        .in(_WTEMP_8)
    );
    BITWISENOT #(.width(1)) bitwisenot_19 (
        .y(wen),
        .in(reset)
    );
endmodule //ChirrtlMems
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
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
