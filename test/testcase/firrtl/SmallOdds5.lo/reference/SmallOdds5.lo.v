module SmallOdds5(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _smalls__clock;
    wire _smalls__reset;
    wire _smalls__io_in_ready;
    wire _smalls__io_in_valid;
    wire [31:0] _smalls__io_in_bits;
    wire _smalls__io_out_ready;
    wire _smalls__io_out_valid;
    wire [31:0] _smalls__io_out_bits;
    SmallOdds5Filter smalls (
        .clock(_smalls__clock),
        .reset(_smalls__reset),
        .io_in_ready(_smalls__io_in_ready),
        .io_in_valid(_smalls__io_in_valid),
        .io_in_bits(_smalls__io_in_bits),
        .io_out_ready(_smalls__io_out_ready),
        .io_out_valid(_smalls__io_out_valid),
        .io_out_bits(_smalls__io_out_bits)
    );
    wire _q__clock;
    wire _q__reset;
    wire _q__io_enq_ready;
    wire _q__io_enq_valid;
    wire [31:0] _q__io_enq_bits;
    wire _q__io_deq_ready;
    wire _q__io_deq_valid;
    wire [31:0] _q__io_deq_bits;
    wire [1:0] _q__io_count;
    Queue q (
        .clock(_q__clock),
        .reset(_q__reset),
        .io_enq_ready(_q__io_enq_ready),
        .io_enq_valid(_q__io_enq_valid),
        .io_enq_bits(_q__io_enq_bits),
        .io_deq_ready(_q__io_deq_ready),
        .io_deq_valid(_q__io_deq_valid),
        .io_deq_bits(_q__io_deq_bits),
        .io_count(_q__io_count)
    );
    wire _odds__clock;
    wire _odds__reset;
    wire _odds__io_in_ready;
    wire _odds__io_in_valid;
    wire [31:0] _odds__io_in_bits;
    wire _odds__io_out_ready;
    wire _odds__io_out_valid;
    wire [31:0] _odds__io_out_bits;
    SmallOdds5Filter_1 odds (
        .clock(_odds__clock),
        .reset(_odds__reset),
        .io_in_ready(_odds__io_in_ready),
        .io_in_valid(_odds__io_in_valid),
        .io_in_bits(_odds__io_in_bits),
        .io_out_ready(_odds__io_out_ready),
        .io_out_valid(_odds__io_out_valid),
        .io_out_bits(_odds__io_out_bits)
    );
    assign io_in_ready = _smalls__io_in_ready;
    assign io_out_bits = _odds__io_out_bits;
    assign io_out_valid = _odds__io_out_valid;
    assign _odds__clock = clock;
    assign _odds__io_in_bits = _q__io_deq_bits;
    assign _odds__io_in_valid = _q__io_deq_valid;
    assign _odds__io_out_ready = io_out_ready;
    assign _odds__reset = reset;
    assign _q__clock = clock;
    assign _q__io_deq_ready = _odds__io_in_ready;
    assign _q__io_enq_bits = _smalls__io_out_bits;
    assign _q__io_enq_valid = _smalls__io_out_valid;
    assign _q__reset = reset;
    assign _smalls__clock = clock;
    assign _smalls__io_in_bits = io_in_bits;
    assign _smalls__io_in_valid = io_in_valid;
    assign _smalls__io_out_ready = _q__io_enq_ready;
    assign _smalls__reset = reset;
endmodule //SmallOdds5
module SmallOdds5Filter(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _valid__q;
    wire _valid__d;
    DFF_POSCLK #(.width(1)) valid (
        .q(_valid__q),
        .d(_valid__d),
        .clk(clock)
    );
    wire [31:0] _result__q;
    wire [31:0] _result__d;
    DFF_POSCLK #(.width(32)) result (
        .q(_result__q),
        .d(_result__d),
        .clk(clock)
    );
    wire _T_17;
    wire [31:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(4), .n(32)) u_pad_1 (
        .y(_WTEMP_0),
        .in(4'hA)
    );
    LT_UNSIGNED #(.width(32)) u_lt_2 (
        .y(_T_17),
        .a(io_in_bits),
        .b(_WTEMP_0)
    );
    wire _T_18;
    BITWISEAND #(.width(1)) bitwiseand_3 (
        .y(_T_18),
        .a(io_in_valid),
        .b(_T_17)
    );
    wire [31:0] _GEN_0;
    MUX_UNSIGNED #(.width(32)) u_mux_4 (
        .y(_GEN_0),
        .sel(_T_18),
        .a(io_in_bits),
        .b(_result__q)
    );
    wire _GEN_1;
    MUX_UNSIGNED #(.width(1)) u_mux_5 (
        .y(_GEN_1),
        .sel(_T_18),
        .a(1'h1),
        .b(1'h0)
    );
    wire _T_21;
    BITWISEAND #(.width(1)) bitwiseand_6 (
        .y(_T_21),
        .a(io_out_ready),
        .b(_valid__q)
    );
    assign io_in_ready = io_out_ready;
    assign io_out_bits = _result__q;
    assign io_out_valid = _T_21;
    assign _result__d = _GEN_0;
    assign _valid__d = _GEN_1;
endmodule //SmallOdds5Filter
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module LT_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a < b;
endmodule // LT_UNSIGNED
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module MUX_UNSIGNED(y, sel, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input sel;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = sel ? a : b;
endmodule // MUX_UNSIGNED
module Queue(
    input clock,
    input reset,
    output io_enq_ready,
    input io_enq_valid,
    input [31:0] io_enq_bits,
    input io_deq_ready,
    output io_deq_valid,
    output [31:0] io_deq_bits,
    output [1:0] io_count
);
    wire [31:0] ram__T_50_data;
    wire ram__T_50_clk;
    wire ram__T_50_en;
    wire ram__T_50_addr;
    wire ram__T_36_clk;
    wire ram__T_36_en;
    wire ram__T_36_mask;
    wire ram__T_36_addr;
    wire [31:0] ram__T_36_data;
    RAMMEM #(.depth(2), .addrbits(1), .width(32), .isSyncRead(0)) ram (
        .read_data(ram__T_50_data),
        .read_clk(ram__T_50_clk),
        .read_en(ram__T_50_en),
        .read_addr(ram__T_50_addr),
        .write_clk(ram__T_36_clk),
        .write_en(ram__T_36_en),
        .write_mask(ram__T_36_mask),
        .write_addr(ram__T_36_addr),
        .write_data(ram__T_36_data)
    );
    wire _value__q;
    wire _value__d;
    DFF_POSCLK #(.width(1)) value (
        .q(_value__q),
        .d(_value__d),
        .clk(clock)
    );
    wire _value_1__q;
    wire _value_1__d;
    DFF_POSCLK #(.width(1)) value_1 (
        .q(_value_1__q),
        .d(_value_1__d),
        .clk(clock)
    );
    wire _maybe_full__q;
    wire _maybe_full__d;
    DFF_POSCLK #(.width(1)) maybe_full (
        .q(_maybe_full__q),
        .d(_maybe_full__d),
        .clk(clock)
    );
    wire _T_28;
    EQ_UNSIGNED #(.width(1)) u_eq_7 (
        .y(_T_28),
        .a(_value__q),
        .b(_value_1__q)
    );
    wire _T_30;
    EQ_UNSIGNED #(.width(1)) u_eq_8 (
        .y(_T_30),
        .a(_maybe_full__q),
        .b(1'h0)
    );
    wire empty;
    BITWISEAND #(.width(1)) bitwiseand_9 (
        .y(empty),
        .a(_T_28),
        .b(_T_30)
    );
    wire _T_31;
    BITWISEAND #(.width(1)) bitwiseand_10 (
        .y(_T_31),
        .a(_T_28),
        .b(_maybe_full__q)
    );
    wire _T_32;
    BITWISEAND #(.width(1)) bitwiseand_11 (
        .y(_T_32),
        .a(io_enq_ready),
        .b(io_enq_valid)
    );
    wire do_enq;
    wire _T_34;
    BITWISEAND #(.width(1)) bitwiseand_12 (
        .y(_T_34),
        .a(io_deq_ready),
        .b(io_deq_valid)
    );
    wire do_deq;
    wire wrap;
    EQ_UNSIGNED #(.width(1)) u_eq_13 (
        .y(wrap),
        .a(_value__q),
        .b(1'h1)
    );
    wire [1:0] _T_39;
    ADD_UNSIGNED #(.width(1)) u_add_14 (
        .y(_T_39),
        .a(_value__q),
        .b(1'h1)
    );
    wire _T_40;
    TAIL #(.width(2), .n(1)) tail_15 (
        .y(_T_40),
        .in(_T_39)
    );
    wire _GEN_0;
    assign _GEN_0 = _value__q;
    wire _GEN_1;
    assign _GEN_1 = clock;
    wire _GEN_2;
    MUX_UNSIGNED #(.width(1)) u_mux_16 (
        .y(_GEN_2),
        .sel(do_enq),
        .a(1'h1),
        .b(1'h0)
    );
    wire [31:0] _GEN_3;
    assign _GEN_3 = io_enq_bits;
    wire _GEN_4;
    MUX_UNSIGNED #(.width(1)) u_mux_17 (
        .y(_GEN_4),
        .sel(do_enq),
        .a(_T_40),
        .b(_value__q)
    );
    wire wrap_1;
    EQ_UNSIGNED #(.width(1)) u_eq_18 (
        .y(wrap_1),
        .a(_value_1__q),
        .b(1'h1)
    );
    wire [1:0] _T_43;
    ADD_UNSIGNED #(.width(1)) u_add_19 (
        .y(_T_43),
        .a(_value_1__q),
        .b(1'h1)
    );
    wire _T_44;
    TAIL #(.width(2), .n(1)) tail_20 (
        .y(_T_44),
        .in(_T_43)
    );
    wire _GEN_5;
    MUX_UNSIGNED #(.width(1)) u_mux_21 (
        .y(_GEN_5),
        .sel(do_deq),
        .a(_T_44),
        .b(_value_1__q)
    );
    wire _T_45;
    NEQ_UNSIGNED #(.width(1)) u_neq_22 (
        .y(_T_45),
        .a(do_enq),
        .b(do_deq)
    );
    wire _GEN_6;
    MUX_UNSIGNED #(.width(1)) u_mux_23 (
        .y(_GEN_6),
        .sel(_T_45),
        .a(do_enq),
        .b(_maybe_full__q)
    );
    wire _T_47;
    EQ_UNSIGNED #(.width(1)) u_eq_24 (
        .y(_T_47),
        .a(empty),
        .b(1'h0)
    );
    wire _T_49;
    EQ_UNSIGNED #(.width(1)) u_eq_25 (
        .y(_T_49),
        .a(_T_31),
        .b(1'h0)
    );
    wire [1:0] _T_51;
    SUB_UNSIGNED #(.width(1)) u_sub_26 (
        .y(_T_51),
        .a(_value__q),
        .b(_value_1__q)
    );
    wire [1:0] _T_52;
    ASUINT #(.width(2)) asuint_27 (
        .y(_T_52),
        .in(_T_51)
    );
    wire _T_53;
    TAIL #(.width(2), .n(1)) tail_28 (
        .y(_T_53),
        .in(_T_52)
    );
    wire _T_54;
    BITWISEAND #(.width(1)) bitwiseand_29 (
        .y(_T_54),
        .a(_maybe_full__q),
        .b(_T_28)
    );
    wire [1:0] _T_55;
    CAT #(.width_a(1), .width_b(1)) cat_30 (
        .y(_T_55),
        .a(_T_54),
        .b(_T_53)
    );
    assign do_deq = _T_34;
    assign do_enq = _T_32;
    assign io_count = _T_55;
    assign io_deq_bits = ram__T_50_data;
    assign io_deq_valid = _T_47;
    assign io_enq_ready = _T_49;
    MUX_UNSIGNED #(.width(1)) u_mux_31 (
        .y(_maybe_full__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_6)
    );
    assign ram__T_36_addr = _GEN_0;
    assign ram__T_36_clk = _GEN_1;
    assign ram__T_36_data = _GEN_3;
    assign ram__T_36_en = _GEN_2;
    assign ram__T_36_mask = _GEN_2;
    assign ram__T_50_addr = _value_1__q;
    assign ram__T_50_clk = clock;
    assign ram__T_50_en = 1'h1;
    MUX_UNSIGNED #(.width(1)) u_mux_32 (
        .y(_value__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_4)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_33 (
        .y(_value_1__d),
        .sel(reset),
        .a(1'h0),
        .b(_GEN_5)
    );
endmodule //Queue
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
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module NEQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a != b;
endmodule // NEQ_UNSIGNED
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
module SmallOdds5Filter_1(
    input clock,
    input reset,
    output io_in_ready,
    input io_in_valid,
    input [31:0] io_in_bits,
    input io_out_ready,
    output io_out_valid,
    output [31:0] io_out_bits
);
    wire _valid__q;
    wire _valid__d;
    DFF_POSCLK #(.width(1)) valid (
        .q(_valid__q),
        .d(_valid__d),
        .clk(clock)
    );
    wire [31:0] _result__q;
    wire [31:0] _result__d;
    DFF_POSCLK #(.width(32)) result (
        .q(_result__q),
        .d(_result__d),
        .clk(clock)
    );
    wire [31:0] _T_17;
    wire [31:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_34 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    BITWISEAND #(.width(32)) bitwiseand_35 (
        .y(_T_17),
        .a(io_in_bits),
        .b(_WTEMP_1)
    );
    wire _T_19;
    wire [31:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_36 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(32)) u_eq_37 (
        .y(_T_19),
        .a(_T_17),
        .b(_WTEMP_2)
    );
    wire _T_20;
    BITWISEAND #(.width(1)) bitwiseand_38 (
        .y(_T_20),
        .a(io_in_valid),
        .b(_T_19)
    );
    wire [31:0] _GEN_0;
    MUX_UNSIGNED #(.width(32)) u_mux_39 (
        .y(_GEN_0),
        .sel(_T_20),
        .a(io_in_bits),
        .b(_result__q)
    );
    wire _GEN_1;
    MUX_UNSIGNED #(.width(1)) u_mux_40 (
        .y(_GEN_1),
        .sel(_T_20),
        .a(1'h1),
        .b(1'h0)
    );
    wire _T_23;
    BITWISEAND #(.width(1)) bitwiseand_41 (
        .y(_T_23),
        .a(io_out_ready),
        .b(_valid__q)
    );
    assign io_in_ready = io_out_ready;
    assign io_out_bits = _result__q;
    assign io_out_valid = _T_23;
    assign _result__d = _GEN_0;
    assign _valid__d = _GEN_1;
endmodule //SmallOdds5Filter_1
