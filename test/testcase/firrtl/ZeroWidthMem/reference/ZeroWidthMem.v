module ZeroWidthMem(
    input clock,
    input reset,
    input [3:0] waddr,
    input [9:0] in_0,
    input [3:0] raddr,
    output [9:0] out_0
);
    wire ram_0_ramin_clk;
    wire ram_0_ramin_en;
    wire ram_0_ramin_mask;
    wire [3:0] ram_0_ramin_addr;
    wire [9:0] ram_0_ramin_data;
    wire [9:0] ram_0_ramout_data;
    wire ram_0_ramout_clk;
    wire ram_0_ramout_en;
    wire [3:0] ram_0_ramout_addr;
    RAMMEM #(.depth(16), .addrbits(4), .width(10), .isSyncRead(0)) ram_0 (
        .read_data(ram_0_ramout_data),
        .read_clk(ram_0_ramout_clk),
        .read_en(ram_0_ramout_en),
        .read_addr(ram_0_ramout_addr),
        .write_clk(ram_0_ramin_clk),
        .write_en(ram_0_ramin_en),
        .write_mask(ram_0_ramin_mask),
        .write_addr(ram_0_ramin_addr),
        .write_data(ram_0_ramin_data)
    );
    assign ram_0_ramin_addr = waddr;
    assign ram_0_ramin_en = 1'h1;
    assign ram_0_ramin_clk = clock;
    assign ram_0_ramout_addr = raddr;
    assign ram_0_ramout_en = 1'h1;
    assign ram_0_ramout_clk = clock;
    assign ram_0_ramin_mask = 1'h1;
    wire [31:0] foo;
    assign foo = 32'hDEADBEEF;
    assign out_0 = ram_0_ramout_data;
    assign ram_0_ramin_data = in_0;
endmodule //ZeroWidthMem
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
