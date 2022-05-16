module SimpleCMemRAM(
    input clock,
    input reset,
    input [3:0] io_rdAddr,
    output [7:0] io_rdData,
    input io_wrEna,
    input [7:0] io_wrData,
    input [3:0] io_wrAddr
);
    wire [7:0] mem__T_17_data;
    wire mem__T_17_clk;
    wire mem__T_17_en;
    wire [3:0] mem__T_17_addr;
    wire mem__T_18_clk;
    wire mem__T_18_en;
    wire mem__T_18_mask;
    wire [3:0] mem__T_18_addr;
    wire [7:0] mem__T_18_data;
    RAMMEM #(.depth(16), .addrbits(4), .width(8), .isSyncRead(0)) mem (
        .read_data(mem__T_17_data),
        .read_clk(mem__T_17_clk),
        .read_en(mem__T_17_en),
        .read_addr(mem__T_17_addr),
        .write_clk(mem__T_18_clk),
        .write_en(mem__T_18_en),
        .write_mask(mem__T_18_mask),
        .write_addr(mem__T_18_addr),
        .write_data(mem__T_18_data)
    );
    wire [3:0] _GEN_0;
    assign _GEN_0 = io_wrAddr;
    wire _GEN_1;
    assign _GEN_1 = clock;
    wire _GEN_2;
    MUX_UNSIGNED #(.width(1)) u_mux_1 (
        .y(_GEN_2),
        .sel(io_wrEna),
        .a(1'h1),
        .b(1'h0)
    );
    wire _GEN_3;
    assign _GEN_3 = 1'h1;
    wire [7:0] _GEN_4;
    assign _GEN_4 = io_wrData;
    assign io_rdData = mem__T_17_data;
    assign mem__T_17_addr = io_rdAddr;
    assign mem__T_17_clk = clock;
    assign mem__T_17_en = 1'h1;
    assign mem__T_18_addr = _GEN_0;
    assign mem__T_18_clk = _GEN_1;
    assign mem__T_18_data = _GEN_4;
    assign mem__T_18_en = _GEN_2;
    assign mem__T_18_mask = _GEN_3;
endmodule //SimpleCMemRAM
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
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
