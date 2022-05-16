////////////// Operations ////////////////////////
//using verilog operations
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED

module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED

module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED

module SUB_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) - $signed(b);
endmodule // SUB_SIGNED

module MUL_UNSIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a; 
    input [width_b-1:0] b;
    assign y = a * b;
endmodule // MUL_UNSIGNED

module MUL_SIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a; 
    input [width_b-1:0] b;
    assign y = $signed(a) * $signed(b);
endmodule // MUL_SIGNED

module DIV_UNSIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    output [width_num-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = num / den;
endmodule // DIV_UNSIGNED

module DIV_SIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    output [width_num:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = $signed(num) / $signed(den);
endmodule // DIV_SIGNED

module REM_UNSIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    parameter width_rem = 4;
    output [width_rem-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = num % den;
endmodule // REM_UNSIGNED

module REM_SIGNED(y, num, den);
    parameter width_num = 4;
    parameter width_den = 4;
    parameter width_rem = 4;
    output [width_rem-1:0] y;
    input [width_num-1:0] num;
    input [width_den-1:0] den;
    assign y = $signed(num) % $signed(den);
endmodule // REM_SIGNED

module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED

module LT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) < $signed(b);
endmodule // LT_SIGNED

module LEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a <= b;
endmodule // LEQ_UNSIGNED

module LEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) <= $signed(b);
endmodule // LEQ_SIGNED

module GT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a > b;
endmodule // GT_UNSIGNED

module GT_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) > $signed(b);
endmodule // GT_SIGNED

module GEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a >= b;
endmodule // GEQ_UNSIGNED

module GEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) >= $signed(b);
endmodule // GEQ_SIGNED

module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED

module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED

module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED

module NEQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) != $signed(b);
endmodule // NEQ_SIGNED

module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n  = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED

module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED

module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT

module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT

module SHL_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{1'b0}}, in};
    assign y = temp << n;
endmodule // SHL_UNSIGNED

module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED

module SHR_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : 1'b0;
endmodule // SHR_UNSIGNED

module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED

module DSHL_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [(width_in+2**width_n-1)-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    wire [(width_in+2**width_n-1)-1:0] temp;
    assign temp = {{(2**width_n-1){1'b0}}, in};
    assign y = temp << n;
endmodule // DSHL_UNSIGNED

module DSHL_SIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [(width_in+2**width_n-1)-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    wire [(width_in+2**width_n-1)-1:0] temp;
    assign temp = {{(2**width_n-1){in[width_in-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // DSHL_SIGNED

module DSHR_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = in >> n;
endmodule // DSHR_UNSIGNED

module DSHR_SIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = $signed(in) >>> n;
endmodule // DSHR_SIGNED

module CVT_UNSIGNED(y, in);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] in;
    assign y = $signed({1'b0, in});
endmodule // CVT_UNSIGNED

module CVT_SIGNED(y, in);
    parameter width  = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // CVT_SIGNED

module NEG_UNSIGNED(y, in);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] in;
    assign y = ~in + 1;
endmodule // NEG_UNSIGNED

module NEG_SIGNED(y, in);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] in;
    wire [width:0] temp;
    assign temp = {in[width-1], in};
    assign y = ~temp + 1;
endmodule // NEG_SIGNED

module NEG_UNSIGNED_ST(y, in);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] in;
    wire [width:0] temp;
    assign temp = {1'b0, in};
    assign y = ~temp + 1;
endmodule // NEG_UNSIGNED_ST

module NEG_SIGNED_ST(y, in);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] in;
    wire [width:0] temp;
    assign temp = {in[width-1], in};
    assign y = ~temp + 1;
endmodule // NEG_SIGNED_ST

module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT

module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND

module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR

module BITWISEXOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a ^ b;
endmodule // BITWISEXOR

module ANDR(y, in);
    parameter width = 4;
    output y;
    input [width-1:0] in;
    assign y = &in;
endmodule // ANDR

module ORR(y, in);
    parameter width = 4;
    output y;
    input [width-1:0] in;
    assign y = |in;
endmodule // ORR

module XORR(y, in);
    parameter width = 4;
    output y;
    input [width-1:0] in;
    assign y = ^in;
endmodule // XORR

module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT

module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS

module HEAD(y, in);
    parameter width = 4;
    parameter n = 2;
    output [n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-1:width-n];
endmodule // HEAD

module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0]; 
endmodule // TAIL

module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK

module DFF_NEGCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(negedge clk) begin
        q <= d;
    end
endmodule // DFF_NEGCLK

module DFF_POSCLK_POSASYNCRST(q, d, rst, rstval, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input rst;
    input [width-1:0] rstval;
    input clk;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= rstval;
        end else begin
            q <= d;
        end
    end
endmodule // DFF_POSCLK_POSASYNCRST

module DFF_POSCLK_NEGASYNCRST(q, d, rst, rstval, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input rst;
    input [width-1:0] rstval;
    input clk;
    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            q <= rstval;
        end else begin
            q <= d;
        end
    end
endmodule // DFF_POSCLK_NEGASYNCRST

module DFF_NEGCLK_POSASYNCRST(q, d, rst, rstval, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input rst;
    input [width-1:0] rstval;
    input clk;
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            q <= rstval;
        end else begin
            q <= d;
        end
    end
endmodule // DFF_NEGCLK_POSASYNCRST

module DFF_NEGCLK_NEGASYNCRST(q, d, rst, rstval, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input rst;
    input [width-1:0] rstval;
    input clk;
    always @(negedge clk or negedge rst) begin
        if (~rst) begin
            q <= rstval;
        end else begin
            q <= d;
        end
    end
endmodule // DFF_NEGCLK_NEGASYNCRST

module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a; 
    input [width-1:0] b; 
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED

module MUX_SIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a; 
    input [width-1:0] b; 
    assign y = sel ? $signed(a) : $signed(b);
endmodule // MUX_SIGNED

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

module MRROMMEM(read_datas, read_clks, read_ens, read_addrs);
    parameter depth = 16;
    parameter addrbits = 4;
    parameter width = 32;
    parameter readernum = 2;
    parameter isSyncRead = 0;
    output [(width*readernum-1):0] read_datas;
    input [(1*readernum-1):0] read_clks;
    input [(1*readernum-1):0] read_ens;
    input [(addrbits*readernum-1):0] read_addrs;
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
endmodule // MRROMMEM

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
    genvar gv_k;
    generate
        if (isSyncRead) begin
            reg [(width*readernum-1):0] read_data_pipe_0;
            for (gv_k = 0; gv_k < readernum; gv_k = gv_k + 1) begin: form_read_datas
                always @(posedge read_clks[gv_k]) begin
                    if (read_ens[gv_k]) begin
                        read_data_pipe_0[gv_k*width +: width] <= memcore[read_addrs[gv_k*addrbits +: addrbits]];
                    end
                end
            end
            assign read_datas = read_data_pipe_0;
        end else begin
            for (gv_k = 0; gv_k < readernum; gv_k = gv_k + 1) begin: form_read_datas
                if (read_ens[gv_k]) begin
                    assign read_datas[gv_k*width +: width] = memcore[read_addrs[gv_k*addrbits +: addrbits]];
                end
            end
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

