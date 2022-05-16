module SimpleCMemROM(
    input clock,
    input reset,
    input [3:0] io_rdAddr,
    output [7:0] io_rdData
);
    wire [7:0] mem__T_11_data;
    wire mem__T_11_clk;
    wire mem__T_11_en;
    wire [3:0] mem__T_11_addr;
    ROMMEM #(.depth(16), .addrbits(4), .width(8), .isSyncRead(0)) mem (
        .read_data(mem__T_11_data),
        .read_clk(mem__T_11_clk),
        .read_en(mem__T_11_en),
        .read_addr(mem__T_11_addr)
    );
    assign io_rdData = mem__T_11_data;
    assign mem__T_11_addr = io_rdAddr;
    assign mem__T_11_clk = clock;
    assign mem__T_11_en = 1'h1;
endmodule //SimpleCMemROM
module ROMMEM(read_data, read_clk, read_en, read_addr);
    parameter depth = 16;
    parameter addrbits = 4;
    parameter width = 32;
    parameter isSyncRead = 0;
    output [width-1:0] read_data;
    input read_clk;
    input read_en;
    input [addrbits-1:0] read_addr;
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
endmodule // ROMMEM
