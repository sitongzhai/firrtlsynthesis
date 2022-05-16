module Memo(
    input clock,
    input reset,
    input io_wen,
    input [7:0] io_wrAddr,
    input [7:0] io_wrData,
    input io_ren,
    input [7:0] io_rdAddr,
    output [7:0] io_rdData
);
    wire mem__T_19_clk;
    wire mem__T_19_en;
    wire mem__T_19_mask;
    wire [7:0] mem__T_19_addr;
    wire [7:0] mem__T_19_data;
    wire [7:0] mem__T_21_data;
    wire mem__T_21_clk;
    wire mem__T_21_en;
    wire [7:0] mem__T_21_addr;
    RAMMEM #(.depth(256), .addrbits(8), .width(8), .isSyncRead(0)) mem (
        .read_data(mem__T_21_data),
        .read_clk(mem__T_21_clk),
        .read_en(mem__T_21_en),
        .read_addr(mem__T_21_addr),
        .write_clk(mem__T_19_clk),
        .write_en(mem__T_19_en),
        .write_mask(mem__T_19_mask),
        .write_addr(mem__T_19_addr),
        .write_data(mem__T_19_data)
    );
    assign mem__T_19_addr = io_wrAddr;
    assign mem__T_19_en = io_wen;
    assign mem__T_19_clk = clock;
    assign mem__T_19_mask = 1'h1;
    assign mem__T_21_addr = io_rdAddr;
    assign mem__T_21_en = io_ren;
    assign mem__T_21_clk = clock;
    wire [7:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(8)) u_pad_1 (
        .y(_WTEMP_0),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(8)) u_mux_2 (
        .y(io_rdData),
        .sel(io_ren),
        .a(mem__T_21_data),
        .b(_WTEMP_0)
    );
    assign mem__T_19_data = io_wrData;
endmodule //Memo
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
