module OuterMemModule(
    input clock,
    input reset,
    input [9:0] io_readAddress,
    output [31:0] io_readData
);
    wire [31:0] billy__T_6_data;
    wire billy__T_6_clk;
    wire billy__T_6_en;
    wire [9:0] billy__T_6_addr;
    ROMMEM #(.depth(1024), .addrbits(10), .width(32), .isSyncRead(0)) billy (
        .read_data(billy__T_6_data),
        .read_clk(billy__T_6_clk),
        .read_en(billy__T_6_en),
        .read_addr(billy__T_6_addr)
    );
    wire _inner__clock;
    wire _inner__reset;
    InnerMemModule inner (
        .clock(_inner__clock),
        .reset(_inner__reset)
    );
    assign billy__T_6_addr = io_readAddress;
    assign billy__T_6_clk = clock;
    assign billy__T_6_en = 1'h1;
    assign _inner__clock = clock;
    assign _inner__reset = reset;
    assign io_readData = billy__T_6_data;
endmodule //OuterMemModule
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
module InnerMemModule(
    input clock,
    input reset
);
endmodule //InnerMemModule
