module ReadwriterTester1(
    input clock,
    input [4:0] waddr,
    input [31:0] wdata,
    input rw_wen,
    output [31:0] rw_rdata
);
    wire [31:0] m_rw_rdata;
    wire m_rw_wmode;
    wire m_rw_clk;
    wire m_rw_en;
    wire m_rw_wmask;
    wire [4:0] m_rw_addr;
    wire [31:0] m_rw_wdata;
    wire _WTEMP_0;
    BITWISENOT #(.width(1)) bitwisenot_1 (
        .y(_WTEMP_0),
        .in(m_rw_wmode)
    );
    RAMMEM #(.depth(32), .addrbits(5), .width(32), .isSyncRead(0)) m (
        .read_data(m_rw_rdata),
        .read_clk(m_rw_clk),
        .read_en(_WTEMP_0),
        .read_addr(m_rw_addr),
        .write_clk(m_rw_clk),
        .write_en(m_rw_wmode),
        .write_mask(m_rw_wmask),
        .write_addr(m_rw_addr),
        .write_data(m_rw_wdata)
    );
    assign m_rw_addr = waddr;
    assign m_rw_clk = clock;
    assign m_rw_en = 1'h1;
    assign m_rw_wdata = wdata;
    assign m_rw_wmask = 1'h1;
    assign m_rw_wmode = rw_wen;
    assign rw_rdata = m_rw_rdata;
endmodule //ReadwriterTester1
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
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
