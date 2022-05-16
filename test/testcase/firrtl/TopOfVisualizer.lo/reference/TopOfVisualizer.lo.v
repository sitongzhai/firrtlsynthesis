module TopOfVisualizer(
    input clock,
    input reset,
    input [31:0] io_in1,
    input [31:0] io_in2,
    input io_select,
    output [31:0] io_out,
    output [31:0] io_memOut
);
    wire [31:0] _x__q;
    wire [31:0] _x__d;
    DFF_POSCLK #(.width(32)) x (
        .q(_x__q),
        .d(_x__d),
        .clk(clock)
    );
    wire [31:0] _y__q;
    wire [31:0] _y__d;
    DFF_POSCLK #(.width(32)) y (
        .q(_y__q),
        .d(_y__d),
        .clk(clock)
    );
    wire [31:0] myMem__T_16_data;
    wire myMem__T_16_clk;
    wire myMem__T_16_en;
    wire [3:0] myMem__T_16_addr;
    wire myMem__T_12_clk;
    wire myMem__T_12_en;
    wire myMem__T_12_mask;
    wire [3:0] myMem__T_12_addr;
    wire [31:0] myMem__T_12_data;
    RAMMEM #(.depth(16), .addrbits(4), .width(32), .isSyncRead(0)) myMem (
        .read_data(myMem__T_16_data),
        .read_clk(myMem__T_16_clk),
        .read_en(myMem__T_16_en),
        .read_addr(myMem__T_16_addr),
        .write_clk(myMem__T_12_clk),
        .write_en(myMem__T_12_en),
        .write_mask(myMem__T_12_mask),
        .write_addr(myMem__T_12_addr),
        .write_data(myMem__T_12_data)
    );
    wire _modA__clock;
    wire _modA__reset;
    wire [31:0] _modA__io_in;
    wire [15:0] _modA__io_out;
    VizModA modA (
        .clock(_modA__clock),
        .reset(_modA__reset),
        .io_in(_modA__io_in),
        .io_out(_modA__io_out)
    );
    wire [3:0] _T_11;
    BITS #(.width(32), .high(3), .low(0)) bits_2 (
        .y(_T_11),
        .in(io_in1)
    );
    wire [31:0] _GEN_0;
    MUX_UNSIGNED #(.width(32)) u_mux_3 (
        .y(_GEN_0),
        .sel(io_select),
        .a(io_in1),
        .b(_x__q)
    );
    wire [3:0] _GEN_1;
    assign _GEN_1 = _T_11;
    wire _GEN_2;
    assign _GEN_2 = clock;
    wire _GEN_3;
    MUX_UNSIGNED #(.width(1)) u_mux_4 (
        .y(_GEN_3),
        .sel(io_select),
        .a(1'h1),
        .b(1'h0)
    );
    wire [31:0] _GEN_4;
    assign _GEN_4 = io_in2;
    wire _T_14;
    EQ_UNSIGNED #(.width(1)) u_eq_5 (
        .y(_T_14),
        .a(io_select),
        .b(1'h0)
    );
    wire [3:0] _T_15;
    BITS #(.width(32), .high(3), .low(0)) bits_6 (
        .y(_T_15),
        .in(io_in1)
    );
    wire [31:0] _GEN_5;
    MUX_UNSIGNED #(.width(32)) u_mux_7 (
        .y(_GEN_5),
        .sel(_T_14),
        .a(io_in2),
        .b(_GEN_0)
    );
    wire [3:0] _GEN_6;
    assign _GEN_6 = _T_15;
    wire _GEN_7;
    assign _GEN_7 = clock;
    wire _GEN_8;
    MUX_UNSIGNED #(.width(1)) u_mux_8 (
        .y(_GEN_8),
        .sel(_T_14),
        .a(1'h1),
        .b(1'h0)
    );
    wire [31:0] _GEN_9;
    assign _GEN_9 = myMem__T_16_data;
    wire [32:0] _T_17;
    wire [31:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(16), .n(32)) u_pad_9 (
        .y(_WTEMP_0),
        .in(_modA__io_out)
    );
    ADD_UNSIGNED #(.width(32)) u_add_10 (
        .y(_T_17),
        .a(_WTEMP_0),
        .b(io_in2)
    );
    wire [31:0] _T_18;
    TAIL #(.width(33), .n(1)) tail_11 (
        .y(_T_18),
        .in(_T_17)
    );
    assign io_memOut = _GEN_9;
    assign io_out = _y__q;
    assign _modA__clock = clock;
    assign _modA__io_in = _x__q;
    assign _modA__reset = reset;
    assign myMem__T_12_addr = _GEN_1;
    assign myMem__T_12_clk = _GEN_2;
    assign myMem__T_12_data = _GEN_4;
    assign myMem__T_12_en = _GEN_3;
    assign myMem__T_12_mask = _GEN_3;
    assign myMem__T_16_addr = _GEN_6;
    assign myMem__T_16_clk = _GEN_7;
    assign myMem__T_16_en = _GEN_8;
    assign _x__d = _GEN_5;
    assign _y__d = _T_18;
endmodule //TopOfVisualizer
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
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
module VizModA(
    input clock,
    input reset,
    input [31:0] io_in,
    output [15:0] io_out
);
    wire _modC__clock;
    wire _modC__reset;
    wire [15:0] _modC__io_in;
    wire [15:0] _modC__io_out;
    VizModC modC (
        .clock(_modC__clock),
        .reset(_modC__reset),
        .io_in(_modC__io_in),
        .io_out(_modC__io_out)
    );
    assign io_out = _modC__io_out;
    assign _modC__clock = clock;
    BITS #(.width(32), .high(15), .low(0)) bits_1 (
        .y(_modC__io_in),
        .in(io_in)
    );
    assign _modC__reset = reset;
endmodule //VizModA
module VizModC(
    input clock,
    input reset,
    input [15:0] io_in,
    output [15:0] io_out
);
    assign io_out = io_in;
endmodule //VizModC
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
