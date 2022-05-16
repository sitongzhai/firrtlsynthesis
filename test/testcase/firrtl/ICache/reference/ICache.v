module ICache(
    input clock,
    input reset,
    input io_req_valid,
    input [38:0] io_req_bits_addr,
    input [31:0] io_s1_paddr,
    input io_s1_kill,
    input io_s2_kill,
    input io_resp_ready,
    output io_resp_valid,
    output [15:0] io_resp_bits_data,
    output [63:0] io_resp_bits_datablock,
    input io_invalidate,
    input io_mem_0_a_ready,
    output io_mem_0_a_valid,
    output [2:0] io_mem_0_a_bits_opcode,
    output [2:0] io_mem_0_a_bits_param,
    output [3:0] io_mem_0_a_bits_size,
    output io_mem_0_a_bits_source,
    output [31:0] io_mem_0_a_bits_address,
    output [7:0] io_mem_0_a_bits_mask,
    output [63:0] io_mem_0_a_bits_data,
    output io_mem_0_b_ready,
    input io_mem_0_b_valid,
    input [2:0] io_mem_0_b_bits_opcode,
    input [1:0] io_mem_0_b_bits_param,
    input [3:0] io_mem_0_b_bits_size,
    input io_mem_0_b_bits_source,
    input [31:0] io_mem_0_b_bits_address,
    input [7:0] io_mem_0_b_bits_mask,
    input [63:0] io_mem_0_b_bits_data,
    input io_mem_0_c_ready,
    output io_mem_0_c_valid,
    output [2:0] io_mem_0_c_bits_opcode,
    output [2:0] io_mem_0_c_bits_param,
    output [3:0] io_mem_0_c_bits_size,
    output io_mem_0_c_bits_source,
    output [31:0] io_mem_0_c_bits_address,
    output [63:0] io_mem_0_c_bits_data,
    output io_mem_0_c_bits_error,
    output io_mem_0_d_ready,
    input io_mem_0_d_valid,
    input [2:0] io_mem_0_d_bits_opcode,
    input [1:0] io_mem_0_d_bits_param,
    input [3:0] io_mem_0_d_bits_size,
    input io_mem_0_d_bits_source,
    input [3:0] io_mem_0_d_bits_sink,
    input [2:0] io_mem_0_d_bits_addr_lo,
    input [63:0] io_mem_0_d_bits_data,
    input io_mem_0_d_bits_error,
    input io_mem_0_e_ready,
    output io_mem_0_e_valid,
    output [3:0] io_mem_0_e_bits_sink
);
    wire [1:0] _state__q;
    wire [1:0] _state__d;
    DFF_POSCLK #(.width(2)) state (
        .q(_state__q),
        .d(_state__d),
        .clk(clock)
    );
    wire [1:0] _WTEMP_0;
    MUX_UNSIGNED #(.width(2)) u_mux_1 (
        .y(_state__d),
        .sel(reset),
        .a(2'h0),
        .b(_WTEMP_0)
    );
    wire _invalidated__q;
    wire _invalidated__d;
    DFF_POSCLK #(.width(1)) invalidated (
        .q(_invalidated__q),
        .d(_invalidated__d),
        .clk(clock)
    );
    wire _WTEMP_1;
    MUX_UNSIGNED #(.width(1)) u_mux_2 (
        .y(_invalidated__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_1)
    );
    wire stall;
    EQ_UNSIGNED #(.width(1)) u_eq_3 (
        .y(stall),
        .a(io_resp_ready),
        .b(1'h0)
    );
    wire [31:0] _refill_addr__q;
    wire [31:0] _refill_addr__d;
    DFF_POSCLK #(.width(32)) refill_addr (
        .q(_refill_addr__q),
        .d(_refill_addr__d),
        .clk(clock)
    );
    wire [31:0] _WTEMP_2;
    MUX_UNSIGNED #(.width(32)) u_mux_4 (
        .y(_refill_addr__d),
        .sel(reset),
        .a(32'h0),
        .b(_WTEMP_2)
    );
    wire s1_any_tag_hit;
    wire _s1_valid__q;
    wire _s1_valid__d;
    DFF_POSCLK #(.width(1)) s1_valid (
        .q(_s1_valid__q),
        .d(_s1_valid__d),
        .clk(clock)
    );
    wire _WTEMP_3;
    MUX_UNSIGNED #(.width(1)) u_mux_5 (
        .y(_s1_valid__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_3)
    );
    wire _T_221;
    EQ_UNSIGNED #(.width(1)) u_eq_6 (
        .y(_T_221),
        .a(io_s1_kill),
        .b(1'h0)
    );
    wire _T_222;
    BITWISEAND #(.width(1)) bitwiseand_7 (
        .y(_T_222),
        .a(_s1_valid__q),
        .b(_T_221)
    );
    wire _T_223;
    EQ_UNSIGNED #(.width(2)) u_eq_8 (
        .y(_T_223),
        .a(_state__q),
        .b(2'h0)
    );
    wire out_valid;
    BITWISEAND #(.width(1)) bitwiseand_9 (
        .y(out_valid),
        .a(_T_222),
        .b(_T_223)
    );
    wire [5:0] s1_idx;
    BITS #(.width(32), .high(11), .low(6)) bits_10 (
        .y(s1_idx),
        .in(io_s1_paddr)
    );
    wire [19:0] s1_tag;
    BITS #(.width(32), .high(31), .low(12)) bits_11 (
        .y(s1_tag),
        .in(io_s1_paddr)
    );
    wire s1_hit;
    BITWISEAND #(.width(1)) bitwiseand_12 (
        .y(s1_hit),
        .a(out_valid),
        .b(s1_any_tag_hit)
    );
    wire _T_225;
    EQ_UNSIGNED #(.width(1)) u_eq_13 (
        .y(_T_225),
        .a(s1_any_tag_hit),
        .b(1'h0)
    );
    wire s1_miss;
    BITWISEAND #(.width(1)) bitwiseand_14 (
        .y(s1_miss),
        .a(out_valid),
        .b(_T_225)
    );
    wire _T_226;
    EQ_UNSIGNED #(.width(2)) u_eq_15 (
        .y(_T_226),
        .a(_state__q),
        .b(2'h0)
    );
    wire _T_227;
    BITWISEAND #(.width(1)) bitwiseand_16 (
        .y(_T_227),
        .a(io_req_valid),
        .b(_T_226)
    );
    wire _T_228;
    BITWISEAND #(.width(1)) bitwiseand_17 (
        .y(_T_228),
        .a(out_valid),
        .b(stall)
    );
    wire _T_230;
    EQ_UNSIGNED #(.width(1)) u_eq_18 (
        .y(_T_230),
        .a(_T_228),
        .b(1'h0)
    );
    wire s0_valid;
    BITWISEAND #(.width(1)) bitwiseand_19 (
        .y(s0_valid),
        .a(_T_227),
        .b(_T_230)
    );
    wire _T_231;
    BITWISEAND #(.width(1)) bitwiseand_20 (
        .y(_T_231),
        .a(out_valid),
        .b(stall)
    );
    wire _T_232;
    BITWISEOR #(.width(1)) bitwiseor_21 (
        .y(_T_232),
        .a(s0_valid),
        .b(_T_231)
    );
    wire _T_233;
    EQ_UNSIGNED #(.width(2)) u_eq_22 (
        .y(_T_233),
        .a(_state__q),
        .b(2'h0)
    );
    wire _T_234;
    BITWISEAND #(.width(1)) bitwiseand_23 (
        .y(_T_234),
        .a(s1_miss),
        .b(_T_233)
    );
    wire [19:0] refill_tag;
    BITS #(.width(32), .high(31), .low(12)) bits_24 (
        .y(refill_tag),
        .in(_refill_addr__q)
    );
    wire [5:0] refill_idx;
    BITS #(.width(32), .high(11), .low(6)) bits_25 (
        .y(refill_idx),
        .in(_refill_addr__q)
    );
    wire _T_235;
    BITWISEAND #(.width(1)) bitwiseand_26 (
        .y(_T_235),
        .a(io_mem_0_d_ready),
        .b(io_mem_0_d_valid)
    );
    wire [7:0] _T_237;
    assign _T_237 = 8'hFF;
    wire [22:0] _T_238;
    DSHL_UNSIGNED #(.width_in(8), .width_n(4)) u_dshl_27 (
        .y(_T_238),
        .in(_T_237),
        .n(io_mem_0_d_bits_size)
    );
    wire [7:0] _T_239;
    BITS #(.width(23), .high(7), .low(0)) bits_28 (
        .y(_T_239),
        .in(_T_238)
    );
    wire [7:0] _T_240;
    BITWISENOT #(.width(8)) bitwisenot_29 (
        .y(_T_240),
        .in(_T_239)
    );
    wire [4:0] _T_241;
    SHR_UNSIGNED #(.width(8), .n(3)) u_shr_30 (
        .y(_T_241),
        .in(_T_240)
    );
    wire _T_242;
    BITS #(.width(3), .high(0), .low(0)) bits_31 (
        .y(_T_242),
        .in(io_mem_0_d_bits_opcode)
    );
    wire [4:0] _T_244;
    wire [4:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_32 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_33 (
        .y(_T_244),
        .sel(_T_242),
        .a(_T_241),
        .b(_WTEMP_4)
    );
    wire [4:0] __T_246__q;
    wire [4:0] __T_246__d;
    DFF_POSCLK #(.width(5)) _T_246 (
        .q(__T_246__q),
        .d(__T_246__d),
        .clk(clock)
    );
    wire [4:0] _WTEMP_5;
    MUX_UNSIGNED #(.width(5)) u_mux_34 (
        .y(__T_246__d),
        .sel(reset),
        .a(5'h0),
        .b(_WTEMP_5)
    );
    wire [5:0] _T_248;
    wire [4:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_35 (
        .y(_WTEMP_6),
        .in(1'h1)
    );
    SUB_UNSIGNED #(.width(5)) u_sub_36 (
        .y(_T_248),
        .a(__T_246__q),
        .b(_WTEMP_6)
    );
    wire [5:0] _T_249;
    ASUINT #(.width(6)) asuint_37 (
        .y(_T_249),
        .in(_T_248)
    );
    wire [4:0] _T_250;
    TAIL #(.width(6), .n(1)) tail_38 (
        .y(_T_250),
        .in(_T_249)
    );
    wire _T_252;
    wire [4:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_39 (
        .y(_WTEMP_7),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(5)) u_eq_40 (
        .y(_T_252),
        .a(__T_246__q),
        .b(_WTEMP_7)
    );
    wire _T_254;
    wire [4:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_41 (
        .y(_WTEMP_8),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(5)) u_eq_42 (
        .y(_T_254),
        .a(__T_246__q),
        .b(_WTEMP_8)
    );
    wire _T_256;
    wire [4:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_43 (
        .y(_WTEMP_9),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(5)) u_eq_44 (
        .y(_T_256),
        .a(_T_244),
        .b(_WTEMP_9)
    );
    wire _T_257;
    BITWISEOR #(.width(1)) bitwiseor_45 (
        .y(_T_257),
        .a(_T_254),
        .b(_T_256)
    );
    wire refill_done;
    BITWISEAND #(.width(1)) bitwiseand_46 (
        .y(refill_done),
        .a(_T_257),
        .b(_T_235)
    );
    wire [4:0] _T_258;
    BITWISENOT #(.width(5)) bitwisenot_47 (
        .y(_T_258),
        .in(_T_250)
    );
    wire [4:0] refill_cnt;
    BITWISEAND #(.width(5)) bitwiseand_48 (
        .y(refill_cnt),
        .a(_T_244),
        .b(_T_258)
    );
    wire [4:0] _T_259;
    MUX_UNSIGNED #(.width(5)) u_mux_49 (
        .y(_T_259),
        .sel(_T_252),
        .a(_T_244),
        .b(_T_250)
    );
    wire [15:0] __T_262__q;
    wire [15:0] __T_262__d;
    DFF_POSCLK #(.width(16)) _T_262 (
        .q(__T_262__q),
        .d(__T_262__d),
        .clk(clock)
    );
    wire [15:0] _WTEMP_10;
    MUX_UNSIGNED #(.width(16)) u_mux_50 (
        .y(__T_262__d),
        .sel(reset),
        .a(16'h1),
        .b(_WTEMP_10)
    );
    wire _T_263;
    BITS #(.width(16), .high(0), .low(0)) bits_51 (
        .y(_T_263),
        .in(__T_262__q)
    );
    wire _T_264;
    BITS #(.width(16), .high(2), .low(2)) bits_52 (
        .y(_T_264),
        .in(__T_262__q)
    );
    wire _T_265;
    BITWISEXOR #(.width(1)) bitwisexor_53 (
        .y(_T_265),
        .a(_T_263),
        .b(_T_264)
    );
    wire _T_266;
    BITS #(.width(16), .high(3), .low(3)) bits_54 (
        .y(_T_266),
        .in(__T_262__q)
    );
    wire _T_267;
    BITWISEXOR #(.width(1)) bitwisexor_55 (
        .y(_T_267),
        .a(_T_265),
        .b(_T_266)
    );
    wire _T_268;
    BITS #(.width(16), .high(5), .low(5)) bits_56 (
        .y(_T_268),
        .in(__T_262__q)
    );
    wire _T_269;
    BITWISEXOR #(.width(1)) bitwisexor_57 (
        .y(_T_269),
        .a(_T_267),
        .b(_T_268)
    );
    wire [14:0] _T_270;
    BITS #(.width(16), .high(15), .low(1)) bits_58 (
        .y(_T_270),
        .in(__T_262__q)
    );
    wire [15:0] _T_271;
    CAT #(.width_a(1), .width_b(15)) cat_59 (
        .y(_T_271),
        .a(_T_269),
        .b(_T_270)
    );
    wire [1:0] repl_way;
    BITS #(.width(16), .high(1), .low(0)) bits_60 (
        .y(repl_way),
        .in(__T_262__q)
    );
    wire [19:0] tag_array_0_tag_rdata_data;
    wire tag_array_0_tag_rdata_clk;
    wire tag_array_0_tag_rdata_en;
    wire [5:0] tag_array_0_tag_rdata_addr;
    wire tag_array_0__T_328_clk;
    wire tag_array_0__T_328_en;
    wire tag_array_0__T_328_mask;
    wire [5:0] tag_array_0__T_328_addr;
    wire [19:0] tag_array_0__T_328_data;
    RAMMEM #(.depth(64), .addrbits(6), .width(20), .isSyncRead(1)) tag_array_0 (
        .read_data(tag_array_0_tag_rdata_data),
        .read_clk(tag_array_0_tag_rdata_clk),
        .read_en(tag_array_0_tag_rdata_en),
        .read_addr(tag_array_0_tag_rdata_addr),
        .write_clk(tag_array_0__T_328_clk),
        .write_en(tag_array_0__T_328_en),
        .write_mask(tag_array_0__T_328_mask),
        .write_addr(tag_array_0__T_328_addr),
        .write_data(tag_array_0__T_328_data)
    );
    wire [19:0] tag_array_1_tag_rdata_data;
    wire tag_array_1_tag_rdata_clk;
    wire tag_array_1_tag_rdata_en;
    wire [5:0] tag_array_1_tag_rdata_addr;
    wire tag_array_1__T_328_clk;
    wire tag_array_1__T_328_en;
    wire tag_array_1__T_328_mask;
    wire [5:0] tag_array_1__T_328_addr;
    wire [19:0] tag_array_1__T_328_data;
    RAMMEM #(.depth(64), .addrbits(6), .width(20), .isSyncRead(1)) tag_array_1 (
        .read_data(tag_array_1_tag_rdata_data),
        .read_clk(tag_array_1_tag_rdata_clk),
        .read_en(tag_array_1_tag_rdata_en),
        .read_addr(tag_array_1_tag_rdata_addr),
        .write_clk(tag_array_1__T_328_clk),
        .write_en(tag_array_1__T_328_en),
        .write_mask(tag_array_1__T_328_mask),
        .write_addr(tag_array_1__T_328_addr),
        .write_data(tag_array_1__T_328_data)
    );
    wire [19:0] tag_array_2_tag_rdata_data;
    wire tag_array_2_tag_rdata_clk;
    wire tag_array_2_tag_rdata_en;
    wire [5:0] tag_array_2_tag_rdata_addr;
    wire tag_array_2__T_328_clk;
    wire tag_array_2__T_328_en;
    wire tag_array_2__T_328_mask;
    wire [5:0] tag_array_2__T_328_addr;
    wire [19:0] tag_array_2__T_328_data;
    RAMMEM #(.depth(64), .addrbits(6), .width(20), .isSyncRead(1)) tag_array_2 (
        .read_data(tag_array_2_tag_rdata_data),
        .read_clk(tag_array_2_tag_rdata_clk),
        .read_en(tag_array_2_tag_rdata_en),
        .read_addr(tag_array_2_tag_rdata_addr),
        .write_clk(tag_array_2__T_328_clk),
        .write_en(tag_array_2__T_328_en),
        .write_mask(tag_array_2__T_328_mask),
        .write_addr(tag_array_2__T_328_addr),
        .write_data(tag_array_2__T_328_data)
    );
    wire [19:0] tag_array_3_tag_rdata_data;
    wire tag_array_3_tag_rdata_clk;
    wire tag_array_3_tag_rdata_en;
    wire [5:0] tag_array_3_tag_rdata_addr;
    wire tag_array_3__T_328_clk;
    wire tag_array_3__T_328_en;
    wire tag_array_3__T_328_mask;
    wire [5:0] tag_array_3__T_328_addr;
    wire [19:0] tag_array_3__T_328_data;
    RAMMEM #(.depth(64), .addrbits(6), .width(20), .isSyncRead(1)) tag_array_3 (
        .read_data(tag_array_3_tag_rdata_data),
        .read_clk(tag_array_3_tag_rdata_clk),
        .read_en(tag_array_3_tag_rdata_en),
        .read_addr(tag_array_3_tag_rdata_addr),
        .write_clk(tag_array_3__T_328_clk),
        .write_en(tag_array_3__T_328_en),
        .write_mask(tag_array_3__T_328_mask),
        .write_addr(tag_array_3__T_328_addr),
        .write_data(tag_array_3__T_328_data)
    );
    wire [5:0] _T_282;
    BITS #(.width(39), .high(11), .low(6)) bits_61 (
        .y(_T_282),
        .in(io_req_bits_addr)
    );
    wire _T_284;
    EQ_UNSIGNED #(.width(1)) u_eq_62 (
        .y(_T_284),
        .a(refill_done),
        .b(1'h0)
    );
    wire _T_285;
    BITWISEAND #(.width(1)) bitwiseand_63 (
        .y(_T_285),
        .a(_T_284),
        .b(s0_valid)
    );
    wire [5:0] _T_287;
    wire [5:0] _T_289;
    BITWISEOR #(.width(6)) bitwiseor_64 (
        .y(_T_289),
        .a(_T_287),
        .b(6'h0)
    );
    wire [5:0] _T_290;
    BITS #(.width(6), .high(5), .low(0)) bits_65 (
        .y(_T_290),
        .in(_T_289)
    );
    assign tag_array_0_tag_rdata_addr = _T_290;
    assign tag_array_0_tag_rdata_en = _T_285;
    assign tag_array_0_tag_rdata_clk = clock;
    assign tag_array_1_tag_rdata_addr = _T_290;
    assign tag_array_1_tag_rdata_en = _T_285;
    assign tag_array_1_tag_rdata_clk = clock;
    assign tag_array_2_tag_rdata_addr = _T_290;
    assign tag_array_2_tag_rdata_en = _T_285;
    assign tag_array_2_tag_rdata_clk = clock;
    assign tag_array_3_tag_rdata_addr = _T_290;
    assign tag_array_3_tag_rdata_en = _T_285;
    assign tag_array_3_tag_rdata_clk = clock;
    wire [19:0] _T_304_0;
    wire [19:0] _T_304_1;
    wire [19:0] _T_304_2;
    wire [19:0] _T_304_3;
    wire _T_312;
    wire [1:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_66 (
        .y(_WTEMP_11),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_67 (
        .y(_T_312),
        .a(repl_way),
        .b(_WTEMP_11)
    );
    wire _T_314;
    wire [1:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_68 (
        .y(_WTEMP_12),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_69 (
        .y(_T_314),
        .a(repl_way),
        .b(_WTEMP_12)
    );
    wire _T_316;
    EQ_UNSIGNED #(.width(2)) u_eq_70 (
        .y(_T_316),
        .a(repl_way),
        .b(2'h2)
    );
    wire _T_318;
    EQ_UNSIGNED #(.width(2)) u_eq_71 (
        .y(_T_318),
        .a(repl_way),
        .b(2'h3)
    );
    wire _T_321_0;
    wire _T_321_1;
    wire _T_321_2;
    wire _T_321_3;
    assign tag_array_0__T_328_addr = refill_idx;
    assign tag_array_0__T_328_en = refill_done;
    assign tag_array_0__T_328_clk = clock;
    assign tag_array_1__T_328_addr = refill_idx;
    assign tag_array_1__T_328_en = refill_done;
    assign tag_array_1__T_328_clk = clock;
    assign tag_array_2__T_328_addr = refill_idx;
    assign tag_array_2__T_328_en = refill_done;
    assign tag_array_2__T_328_clk = clock;
    assign tag_array_3__T_328_addr = refill_idx;
    assign tag_array_3__T_328_en = refill_done;
    assign tag_array_3__T_328_clk = clock;
    assign tag_array_0__T_328_mask = _T_321_0;
    assign tag_array_1__T_328_mask = _T_321_1;
    assign tag_array_2__T_328_mask = _T_321_2;
    assign tag_array_3__T_328_mask = _T_321_3;
    wire [19:0] _node_0;
    assign _node_0 = _T_304_0;
    wire [19:0] _node_1;
    assign _node_1 = _T_304_1;
    wire [19:0] _node_2;
    assign _node_2 = _T_304_2;
    wire [19:0] _node_3;
    assign _node_3 = _T_304_3;
    wire [255:0] _vb_array__q;
    wire [255:0] _vb_array__d;
    DFF_POSCLK #(.width(256)) vb_array (
        .q(_vb_array__q),
        .d(_vb_array__d),
        .clk(clock)
    );
    wire [255:0] _WTEMP_13;
    MUX_UNSIGNED #(.width(256)) u_mux_72 (
        .y(_vb_array__d),
        .sel(reset),
        .a(256'h0),
        .b(_WTEMP_13)
    );
    wire _T_342;
    EQ_UNSIGNED #(.width(1)) u_eq_73 (
        .y(_T_342),
        .a(_invalidated__q),
        .b(1'h0)
    );
    wire _T_343;
    BITWISEAND #(.width(1)) bitwiseand_74 (
        .y(_T_343),
        .a(refill_done),
        .b(_T_342)
    );
    wire [7:0] _T_344;
    CAT #(.width_a(2), .width_b(6)) cat_75 (
        .y(_T_344),
        .a(repl_way),
        .b(refill_idx)
    );
    wire [255:0] _T_347;
    DSHL_UNSIGNED #(.width_in(1), .width_n(8)) u_dshl_76 (
        .y(_T_347),
        .in(1'h1),
        .n(_T_344)
    );
    wire [255:0] _T_348;
    BITWISEOR #(.width(256)) bitwiseor_77 (
        .y(_T_348),
        .a(_vb_array__q),
        .b(_T_347)
    );
    wire [255:0] _T_349;
    BITWISENOT #(.width(256)) bitwisenot_78 (
        .y(_T_349),
        .in(_vb_array__q)
    );
    wire [255:0] _T_350;
    BITWISEOR #(.width(256)) bitwiseor_79 (
        .y(_T_350),
        .a(_T_349),
        .b(_T_347)
    );
    wire [255:0] _T_351;
    BITWISENOT #(.width(256)) bitwisenot_80 (
        .y(_T_351),
        .in(_T_350)
    );
    wire [255:0] _T_352;
    assign _T_352 = _T_348;
    wire [255:0] _node_4;
    MUX_UNSIGNED #(.width(256)) u_mux_81 (
        .y(_node_4),
        .sel(_T_343),
        .a(_T_352),
        .b(_vb_array__q)
    );
    wire s1_disparity_0;
    wire s1_disparity_1;
    wire s1_disparity_2;
    wire s1_disparity_3;
    wire _T_364;
    BITWISEAND #(.width(1)) bitwiseand_82 (
        .y(_T_364),
        .a(_s1_valid__q),
        .b(s1_disparity_0)
    );
    wire [6:0] _T_366;
    CAT #(.width_a(1), .width_b(6)) cat_83 (
        .y(_T_366),
        .a(1'h0),
        .b(s1_idx)
    );
    wire [127:0] _T_369;
    DSHL_UNSIGNED #(.width_in(1), .width_n(7)) u_dshl_84 (
        .y(_T_369),
        .in(1'h1),
        .n(_T_366)
    );
    wire [255:0] _T_370;
    wire [255:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(128), .n(256)) u_pad_85 (
        .y(_WTEMP_14),
        .in(_T_369)
    );
    BITWISEOR #(.width(256)) bitwiseor_86 (
        .y(_T_370),
        .a(_vb_array__q),
        .b(_WTEMP_14)
    );
    wire [255:0] _T_371;
    BITWISENOT #(.width(256)) bitwisenot_87 (
        .y(_T_371),
        .in(_vb_array__q)
    );
    wire [255:0] _T_372;
    wire [255:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(128), .n(256)) u_pad_88 (
        .y(_WTEMP_15),
        .in(_T_369)
    );
    BITWISEOR #(.width(256)) bitwiseor_89 (
        .y(_T_372),
        .a(_T_371),
        .b(_WTEMP_15)
    );
    wire [255:0] _T_373;
    BITWISENOT #(.width(256)) bitwisenot_90 (
        .y(_T_373),
        .in(_T_372)
    );
    wire [255:0] _T_374;
    assign _T_374 = _T_373;
    wire [255:0] _node_5;
    wire [255:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(1), .n(256)) u_pad_91 (
        .y(_WTEMP_16),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(256)) u_mux_92 (
        .y(_node_5),
        .sel(io_invalidate),
        .a(_WTEMP_16),
        .b(_node_4)
    );
    wire _T_375;
    BITWISEAND #(.width(1)) bitwiseand_93 (
        .y(_T_375),
        .a(_s1_valid__q),
        .b(s1_disparity_1)
    );
    wire [6:0] _T_377;
    CAT #(.width_a(1), .width_b(6)) cat_94 (
        .y(_T_377),
        .a(1'h1),
        .b(s1_idx)
    );
    wire [127:0] _T_380;
    DSHL_UNSIGNED #(.width_in(1), .width_n(7)) u_dshl_95 (
        .y(_T_380),
        .in(1'h1),
        .n(_T_377)
    );
    wire [255:0] _T_381;
    wire [255:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(128), .n(256)) u_pad_96 (
        .y(_WTEMP_17),
        .in(_T_380)
    );
    BITWISEOR #(.width(256)) bitwiseor_97 (
        .y(_T_381),
        .a(_vb_array__q),
        .b(_WTEMP_17)
    );
    wire [255:0] _T_382;
    BITWISENOT #(.width(256)) bitwisenot_98 (
        .y(_T_382),
        .in(_vb_array__q)
    );
    wire [255:0] _T_383;
    wire [255:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(128), .n(256)) u_pad_99 (
        .y(_WTEMP_18),
        .in(_T_380)
    );
    BITWISEOR #(.width(256)) bitwiseor_100 (
        .y(_T_383),
        .a(_T_382),
        .b(_WTEMP_18)
    );
    wire [255:0] _T_384;
    BITWISENOT #(.width(256)) bitwisenot_101 (
        .y(_T_384),
        .in(_T_383)
    );
    wire [255:0] _T_385;
    assign _T_385 = _T_384;
    wire [255:0] _node_6;
    MUX_UNSIGNED #(.width(256)) u_mux_102 (
        .y(_node_6),
        .sel(_T_364),
        .a(_T_374),
        .b(_node_5)
    );
    wire _T_386;
    BITWISEAND #(.width(1)) bitwiseand_103 (
        .y(_T_386),
        .a(_s1_valid__q),
        .b(s1_disparity_2)
    );
    wire [7:0] _T_388;
    CAT #(.width_a(2), .width_b(6)) cat_104 (
        .y(_T_388),
        .a(2'h2),
        .b(s1_idx)
    );
    wire [255:0] _T_391;
    DSHL_UNSIGNED #(.width_in(1), .width_n(8)) u_dshl_105 (
        .y(_T_391),
        .in(1'h1),
        .n(_T_388)
    );
    wire [255:0] _T_392;
    BITWISEOR #(.width(256)) bitwiseor_106 (
        .y(_T_392),
        .a(_vb_array__q),
        .b(_T_391)
    );
    wire [255:0] _T_393;
    BITWISENOT #(.width(256)) bitwisenot_107 (
        .y(_T_393),
        .in(_vb_array__q)
    );
    wire [255:0] _T_394;
    BITWISEOR #(.width(256)) bitwiseor_108 (
        .y(_T_394),
        .a(_T_393),
        .b(_T_391)
    );
    wire [255:0] _T_395;
    BITWISENOT #(.width(256)) bitwisenot_109 (
        .y(_T_395),
        .in(_T_394)
    );
    wire [255:0] _T_396;
    assign _T_396 = _T_395;
    wire [255:0] _node_7;
    MUX_UNSIGNED #(.width(256)) u_mux_110 (
        .y(_node_7),
        .sel(_T_375),
        .a(_T_385),
        .b(_node_6)
    );
    wire _T_397;
    BITWISEAND #(.width(1)) bitwiseand_111 (
        .y(_T_397),
        .a(_s1_valid__q),
        .b(s1_disparity_3)
    );
    wire [7:0] _T_399;
    CAT #(.width_a(2), .width_b(6)) cat_112 (
        .y(_T_399),
        .a(2'h3),
        .b(s1_idx)
    );
    wire [255:0] _T_402;
    DSHL_UNSIGNED #(.width_in(1), .width_n(8)) u_dshl_113 (
        .y(_T_402),
        .in(1'h1),
        .n(_T_399)
    );
    wire [255:0] _T_403;
    BITWISEOR #(.width(256)) bitwiseor_114 (
        .y(_T_403),
        .a(_vb_array__q),
        .b(_T_402)
    );
    wire [255:0] _T_404;
    BITWISENOT #(.width(256)) bitwisenot_115 (
        .y(_T_404),
        .in(_vb_array__q)
    );
    wire [255:0] _T_405;
    BITWISEOR #(.width(256)) bitwiseor_116 (
        .y(_T_405),
        .a(_T_404),
        .b(_T_402)
    );
    wire [255:0] _T_406;
    BITWISENOT #(.width(256)) bitwisenot_117 (
        .y(_T_406),
        .in(_T_405)
    );
    wire [255:0] _T_407;
    assign _T_407 = _T_406;
    wire [255:0] _node_8;
    MUX_UNSIGNED #(.width(256)) u_mux_118 (
        .y(_node_8),
        .sel(_T_386),
        .a(_T_396),
        .b(_node_7)
    );
    wire s1_tag_match_0;
    wire s1_tag_match_1;
    wire s1_tag_match_2;
    wire s1_tag_match_3;
    wire s1_tag_hit_0;
    wire s1_tag_hit_1;
    wire s1_tag_hit_2;
    wire s1_tag_hit_3;
    wire [63:0] s1_dout_0;
    wire [63:0] s1_dout_1;
    wire [63:0] s1_dout_2;
    wire [63:0] s1_dout_3;
    wire _s1_dout_valid__q;
    wire _s1_dout_valid__d;
    DFF_POSCLK #(.width(1)) s1_dout_valid (
        .q(_s1_dout_valid__q),
        .d(_s1_dout_valid__d),
        .clk(clock)
    );
    wire _WTEMP_19;
    MUX_UNSIGNED #(.width(1)) u_mux_119 (
        .y(_s1_dout_valid__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_19)
    );
    wire _T_436;
    EQ_UNSIGNED #(.width(1)) u_eq_120 (
        .y(_T_436),
        .a(io_invalidate),
        .b(1'h0)
    );
    wire [5:0] _T_438;
    BITS #(.width(32), .high(11), .low(6)) bits_121 (
        .y(_T_438),
        .in(io_s1_paddr)
    );
    wire [6:0] _T_439;
    CAT #(.width_a(1), .width_b(6)) cat_122 (
        .y(_T_439),
        .a(1'h0),
        .b(_T_438)
    );
    wire [255:0] _T_440;
    DSHR_UNSIGNED #(.width_in(256), .width_n(7)) u_dshr_123 (
        .y(_T_440),
        .in(_vb_array__q),
        .n(_T_439)
    );
    wire _T_441;
    BITS #(.width(256), .high(0), .low(0)) bits_124 (
        .y(_T_441),
        .in(_T_440)
    );
    wire _T_442;
    BITS #(.width(1), .high(0), .low(0)) bits_125 (
        .y(_T_442),
        .in(_T_441)
    );
    wire _T_443;
    BITWISEAND #(.width(1)) bitwiseand_126 (
        .y(_T_443),
        .a(_T_436),
        .b(_T_442)
    );
    wire _T_446;
    assign _T_446 = 1'h0;
    wire __T_448__q;
    wire __T_448__d;
    DFF_POSCLK #(.width(1)) _T_448 (
        .q(__T_448__q),
        .d(__T_448__d),
        .clk(clock)
    );
    wire _WTEMP_20;
    MUX_UNSIGNED #(.width(1)) u_mux_127 (
        .y(__T_448__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_20)
    );
    wire _T_449;
    MUX_UNSIGNED #(.width(1)) u_mux_128 (
        .y(_T_449),
        .sel(_s1_dout_valid__q),
        .a(_T_446),
        .b(__T_448__q)
    );
    wire [19:0] _T_450;
    BITS #(.width(20), .high(19), .low(0)) bits_129 (
        .y(_T_450),
        .in(tag_array_0_tag_rdata_data)
    );
    wire _T_451;
    EQ_UNSIGNED #(.width(20)) u_eq_130 (
        .y(_T_451),
        .a(_T_450),
        .b(s1_tag)
    );
    wire __T_453__q;
    wire __T_453__d;
    DFF_POSCLK #(.width(1)) _T_453 (
        .q(__T_453__q),
        .d(__T_453__d),
        .clk(clock)
    );
    wire _WTEMP_21;
    MUX_UNSIGNED #(.width(1)) u_mux_131 (
        .y(__T_453__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_21)
    );
    wire _T_454;
    MUX_UNSIGNED #(.width(1)) u_mux_132 (
        .y(_T_454),
        .sel(_s1_dout_valid__q),
        .a(_T_451),
        .b(__T_453__q)
    );
    wire _T_455;
    BITWISEAND #(.width(1)) bitwiseand_133 (
        .y(_T_455),
        .a(_T_443),
        .b(s1_tag_match_0)
    );
    wire _T_458;
    assign _T_458 = 1'h0;
    wire _T_459;
    BITWISEOR #(.width(1)) bitwiseor_134 (
        .y(_T_459),
        .a(_T_449),
        .b(_T_458)
    );
    wire _T_460;
    BITWISEAND #(.width(1)) bitwiseand_135 (
        .y(_T_460),
        .a(_T_443),
        .b(_T_459)
    );
    wire _T_462;
    EQ_UNSIGNED #(.width(1)) u_eq_136 (
        .y(_T_462),
        .a(io_invalidate),
        .b(1'h0)
    );
    wire [5:0] _T_464;
    BITS #(.width(32), .high(11), .low(6)) bits_137 (
        .y(_T_464),
        .in(io_s1_paddr)
    );
    wire [6:0] _T_465;
    CAT #(.width_a(1), .width_b(6)) cat_138 (
        .y(_T_465),
        .a(1'h1),
        .b(_T_464)
    );
    wire [255:0] _T_466;
    DSHR_UNSIGNED #(.width_in(256), .width_n(7)) u_dshr_139 (
        .y(_T_466),
        .in(_vb_array__q),
        .n(_T_465)
    );
    wire _T_467;
    BITS #(.width(256), .high(0), .low(0)) bits_140 (
        .y(_T_467),
        .in(_T_466)
    );
    wire _T_468;
    BITS #(.width(1), .high(0), .low(0)) bits_141 (
        .y(_T_468),
        .in(_T_467)
    );
    wire _T_469;
    BITWISEAND #(.width(1)) bitwiseand_142 (
        .y(_T_469),
        .a(_T_462),
        .b(_T_468)
    );
    wire _T_472;
    assign _T_472 = 1'h0;
    wire __T_474__q;
    wire __T_474__d;
    DFF_POSCLK #(.width(1)) _T_474 (
        .q(__T_474__q),
        .d(__T_474__d),
        .clk(clock)
    );
    wire _WTEMP_22;
    MUX_UNSIGNED #(.width(1)) u_mux_143 (
        .y(__T_474__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_22)
    );
    wire _T_475;
    MUX_UNSIGNED #(.width(1)) u_mux_144 (
        .y(_T_475),
        .sel(_s1_dout_valid__q),
        .a(_T_472),
        .b(__T_474__q)
    );
    wire [19:0] _T_476;
    BITS #(.width(20), .high(19), .low(0)) bits_145 (
        .y(_T_476),
        .in(tag_array_1_tag_rdata_data)
    );
    wire _T_477;
    EQ_UNSIGNED #(.width(20)) u_eq_146 (
        .y(_T_477),
        .a(_T_476),
        .b(s1_tag)
    );
    wire __T_479__q;
    wire __T_479__d;
    DFF_POSCLK #(.width(1)) _T_479 (
        .q(__T_479__q),
        .d(__T_479__d),
        .clk(clock)
    );
    wire _WTEMP_23;
    MUX_UNSIGNED #(.width(1)) u_mux_147 (
        .y(__T_479__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_23)
    );
    wire _T_480;
    MUX_UNSIGNED #(.width(1)) u_mux_148 (
        .y(_T_480),
        .sel(_s1_dout_valid__q),
        .a(_T_477),
        .b(__T_479__q)
    );
    wire _T_481;
    BITWISEAND #(.width(1)) bitwiseand_149 (
        .y(_T_481),
        .a(_T_469),
        .b(s1_tag_match_1)
    );
    wire _T_484;
    assign _T_484 = 1'h0;
    wire _T_485;
    BITWISEOR #(.width(1)) bitwiseor_150 (
        .y(_T_485),
        .a(_T_475),
        .b(_T_484)
    );
    wire _T_486;
    BITWISEAND #(.width(1)) bitwiseand_151 (
        .y(_T_486),
        .a(_T_469),
        .b(_T_485)
    );
    wire _T_488;
    EQ_UNSIGNED #(.width(1)) u_eq_152 (
        .y(_T_488),
        .a(io_invalidate),
        .b(1'h0)
    );
    wire [5:0] _T_490;
    BITS #(.width(32), .high(11), .low(6)) bits_153 (
        .y(_T_490),
        .in(io_s1_paddr)
    );
    wire [7:0] _T_491;
    CAT #(.width_a(2), .width_b(6)) cat_154 (
        .y(_T_491),
        .a(2'h2),
        .b(_T_490)
    );
    wire [255:0] _T_492;
    DSHR_UNSIGNED #(.width_in(256), .width_n(8)) u_dshr_155 (
        .y(_T_492),
        .in(_vb_array__q),
        .n(_T_491)
    );
    wire _T_493;
    BITS #(.width(256), .high(0), .low(0)) bits_156 (
        .y(_T_493),
        .in(_T_492)
    );
    wire _T_494;
    BITS #(.width(1), .high(0), .low(0)) bits_157 (
        .y(_T_494),
        .in(_T_493)
    );
    wire _T_495;
    BITWISEAND #(.width(1)) bitwiseand_158 (
        .y(_T_495),
        .a(_T_488),
        .b(_T_494)
    );
    wire _T_498;
    assign _T_498 = 1'h0;
    wire __T_500__q;
    wire __T_500__d;
    DFF_POSCLK #(.width(1)) _T_500 (
        .q(__T_500__q),
        .d(__T_500__d),
        .clk(clock)
    );
    wire _WTEMP_24;
    MUX_UNSIGNED #(.width(1)) u_mux_159 (
        .y(__T_500__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_24)
    );
    wire _T_501;
    MUX_UNSIGNED #(.width(1)) u_mux_160 (
        .y(_T_501),
        .sel(_s1_dout_valid__q),
        .a(_T_498),
        .b(__T_500__q)
    );
    wire [19:0] _T_502;
    BITS #(.width(20), .high(19), .low(0)) bits_161 (
        .y(_T_502),
        .in(tag_array_2_tag_rdata_data)
    );
    wire _T_503;
    EQ_UNSIGNED #(.width(20)) u_eq_162 (
        .y(_T_503),
        .a(_T_502),
        .b(s1_tag)
    );
    wire __T_505__q;
    wire __T_505__d;
    DFF_POSCLK #(.width(1)) _T_505 (
        .q(__T_505__q),
        .d(__T_505__d),
        .clk(clock)
    );
    wire _WTEMP_25;
    MUX_UNSIGNED #(.width(1)) u_mux_163 (
        .y(__T_505__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_25)
    );
    wire _T_506;
    MUX_UNSIGNED #(.width(1)) u_mux_164 (
        .y(_T_506),
        .sel(_s1_dout_valid__q),
        .a(_T_503),
        .b(__T_505__q)
    );
    wire _T_507;
    BITWISEAND #(.width(1)) bitwiseand_165 (
        .y(_T_507),
        .a(_T_495),
        .b(s1_tag_match_2)
    );
    wire _T_510;
    assign _T_510 = 1'h0;
    wire _T_511;
    BITWISEOR #(.width(1)) bitwiseor_166 (
        .y(_T_511),
        .a(_T_501),
        .b(_T_510)
    );
    wire _T_512;
    BITWISEAND #(.width(1)) bitwiseand_167 (
        .y(_T_512),
        .a(_T_495),
        .b(_T_511)
    );
    wire _T_514;
    EQ_UNSIGNED #(.width(1)) u_eq_168 (
        .y(_T_514),
        .a(io_invalidate),
        .b(1'h0)
    );
    wire [5:0] _T_516;
    BITS #(.width(32), .high(11), .low(6)) bits_169 (
        .y(_T_516),
        .in(io_s1_paddr)
    );
    wire [7:0] _T_517;
    CAT #(.width_a(2), .width_b(6)) cat_170 (
        .y(_T_517),
        .a(2'h3),
        .b(_T_516)
    );
    wire [255:0] _T_518;
    DSHR_UNSIGNED #(.width_in(256), .width_n(8)) u_dshr_171 (
        .y(_T_518),
        .in(_vb_array__q),
        .n(_T_517)
    );
    wire _T_519;
    BITS #(.width(256), .high(0), .low(0)) bits_172 (
        .y(_T_519),
        .in(_T_518)
    );
    wire _T_520;
    BITS #(.width(1), .high(0), .low(0)) bits_173 (
        .y(_T_520),
        .in(_T_519)
    );
    wire _T_521;
    BITWISEAND #(.width(1)) bitwiseand_174 (
        .y(_T_521),
        .a(_T_514),
        .b(_T_520)
    );
    wire _T_524;
    assign _T_524 = 1'h0;
    wire __T_526__q;
    wire __T_526__d;
    DFF_POSCLK #(.width(1)) _T_526 (
        .q(__T_526__q),
        .d(__T_526__d),
        .clk(clock)
    );
    wire _WTEMP_26;
    MUX_UNSIGNED #(.width(1)) u_mux_175 (
        .y(__T_526__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_26)
    );
    wire _T_527;
    MUX_UNSIGNED #(.width(1)) u_mux_176 (
        .y(_T_527),
        .sel(_s1_dout_valid__q),
        .a(_T_524),
        .b(__T_526__q)
    );
    wire [19:0] _T_528;
    BITS #(.width(20), .high(19), .low(0)) bits_177 (
        .y(_T_528),
        .in(tag_array_3_tag_rdata_data)
    );
    wire _T_529;
    EQ_UNSIGNED #(.width(20)) u_eq_178 (
        .y(_T_529),
        .a(_T_528),
        .b(s1_tag)
    );
    wire __T_531__q;
    wire __T_531__d;
    DFF_POSCLK #(.width(1)) _T_531 (
        .q(__T_531__q),
        .d(__T_531__d),
        .clk(clock)
    );
    wire _WTEMP_27;
    MUX_UNSIGNED #(.width(1)) u_mux_179 (
        .y(__T_531__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_27)
    );
    wire _T_532;
    MUX_UNSIGNED #(.width(1)) u_mux_180 (
        .y(_T_532),
        .sel(_s1_dout_valid__q),
        .a(_T_529),
        .b(__T_531__q)
    );
    wire _T_533;
    BITWISEAND #(.width(1)) bitwiseand_181 (
        .y(_T_533),
        .a(_T_521),
        .b(s1_tag_match_3)
    );
    wire _T_536;
    assign _T_536 = 1'h0;
    wire _T_537;
    BITWISEOR #(.width(1)) bitwiseor_182 (
        .y(_T_537),
        .a(_T_527),
        .b(_T_536)
    );
    wire _T_538;
    BITWISEAND #(.width(1)) bitwiseand_183 (
        .y(_T_538),
        .a(_T_521),
        .b(_T_537)
    );
    wire _T_539;
    BITWISEOR #(.width(1)) bitwiseor_184 (
        .y(_T_539),
        .a(s1_tag_hit_0),
        .b(s1_tag_hit_1)
    );
    wire _T_540;
    BITWISEOR #(.width(1)) bitwiseor_185 (
        .y(_T_540),
        .a(_T_539),
        .b(s1_tag_hit_2)
    );
    wire _T_541;
    BITWISEOR #(.width(1)) bitwiseor_186 (
        .y(_T_541),
        .a(_T_540),
        .b(s1_tag_hit_3)
    );
    wire _T_542;
    BITWISEOR #(.width(1)) bitwiseor_187 (
        .y(_T_542),
        .a(s1_disparity_0),
        .b(s1_disparity_1)
    );
    wire _T_543;
    BITWISEOR #(.width(1)) bitwiseor_188 (
        .y(_T_543),
        .a(_T_542),
        .b(s1_disparity_2)
    );
    wire _T_544;
    BITWISEOR #(.width(1)) bitwiseor_189 (
        .y(_T_544),
        .a(_T_543),
        .b(s1_disparity_3)
    );
    wire _T_546;
    EQ_UNSIGNED #(.width(1)) u_eq_190 (
        .y(_T_546),
        .a(_T_544),
        .b(1'h0)
    );
    wire _T_547;
    BITWISEAND #(.width(1)) bitwiseand_191 (
        .y(_T_547),
        .a(_T_541),
        .b(_T_546)
    );
    wire _T_550__T_556_clk;
    wire _T_550__T_556_en;
    wire _T_550__T_556_mask;
    wire [8:0] _T_550__T_556_addr;
    wire [63:0] _T_550__T_556_data;
    wire [63:0] _T_550__T_566_data;
    wire _T_550__T_566_clk;
    wire _T_550__T_566_en;
    wire [8:0] _T_550__T_566_addr;
    RAMMEM #(.depth(512), .addrbits(9), .width(64), .isSyncRead(1)) _T_550 (
        .read_data(_T_550__T_566_data),
        .read_clk(_T_550__T_566_clk),
        .read_en(_T_550__T_566_en),
        .read_addr(_T_550__T_566_addr),
        .write_clk(_T_550__T_556_clk),
        .write_en(_T_550__T_556_en),
        .write_mask(_T_550__T_556_mask),
        .write_addr(_T_550__T_556_addr),
        .write_data(_T_550__T_556_data)
    );
    wire _T_552;
    wire [1:0] _WTEMP_28;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_192 (
        .y(_WTEMP_28),
        .in(1'h0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_193 (
        .y(_T_552),
        .a(repl_way),
        .b(_WTEMP_28)
    );
    wire _T_553;
    BITWISEAND #(.width(1)) bitwiseand_194 (
        .y(_T_553),
        .a(io_mem_0_d_valid),
        .b(_T_552)
    );
    wire [8:0] _T_554;
    SHL_UNSIGNED #(.width(6), .n(3)) u_shl_195 (
        .y(_T_554),
        .in(refill_idx)
    );
    wire [8:0] _T_555;
    wire [8:0] _WTEMP_29;
    PAD_UNSIGNED #(.width(5), .n(9)) u_pad_196 (
        .y(_WTEMP_29),
        .in(refill_cnt)
    );
    BITWISEOR #(.width(9)) bitwiseor_197 (
        .y(_T_555),
        .a(_T_554),
        .b(_WTEMP_29)
    );
    assign _T_550__T_556_addr = _T_555;
    assign _T_550__T_556_en = _T_553;
    assign _T_550__T_556_clk = clock;
    assign _T_550__T_556_mask = 1'h1;
    wire [8:0] _T_557;
    BITS #(.width(39), .high(11), .low(3)) bits_198 (
        .y(_T_557),
        .in(io_req_bits_addr)
    );
    wire _T_559;
    EQ_UNSIGNED #(.width(1)) u_eq_199 (
        .y(_T_559),
        .a(_T_553),
        .b(1'h0)
    );
    wire _T_560;
    BITWISEAND #(.width(1)) bitwiseand_200 (
        .y(_T_560),
        .a(_T_559),
        .b(s0_valid)
    );
    wire [8:0] _T_562;
    wire [8:0] _T_564;
    BITWISEOR #(.width(9)) bitwiseor_201 (
        .y(_T_564),
        .a(_T_562),
        .b(9'h0)
    );
    wire [8:0] _T_565;
    BITS #(.width(9), .high(8), .low(0)) bits_202 (
        .y(_T_565),
        .in(_T_564)
    );
    assign _T_550__T_566_addr = _T_565;
    assign _T_550__T_566_en = _T_560;
    assign _T_550__T_566_clk = clock;
    wire [63:0] __T_568__q;
    wire [63:0] __T_568__d;
    DFF_POSCLK #(.width(64)) _T_568 (
        .q(__T_568__q),
        .d(__T_568__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_30;
    MUX_UNSIGNED #(.width(64)) u_mux_203 (
        .y(__T_568__d),
        .sel(reset),
        .a(64'h0),
        .b(_WTEMP_30)
    );
    wire [63:0] _T_569;
    MUX_UNSIGNED #(.width(64)) u_mux_204 (
        .y(_T_569),
        .sel(_s1_dout_valid__q),
        .a(_T_550__T_566_data),
        .b(__T_568__q)
    );
    wire _T_572__T_578_clk;
    wire _T_572__T_578_en;
    wire _T_572__T_578_mask;
    wire [8:0] _T_572__T_578_addr;
    wire [63:0] _T_572__T_578_data;
    wire [63:0] _T_572__T_588_data;
    wire _T_572__T_588_clk;
    wire _T_572__T_588_en;
    wire [8:0] _T_572__T_588_addr;
    RAMMEM #(.depth(512), .addrbits(9), .width(64), .isSyncRead(1)) _T_572 (
        .read_data(_T_572__T_588_data),
        .read_clk(_T_572__T_588_clk),
        .read_en(_T_572__T_588_en),
        .read_addr(_T_572__T_588_addr),
        .write_clk(_T_572__T_578_clk),
        .write_en(_T_572__T_578_en),
        .write_mask(_T_572__T_578_mask),
        .write_addr(_T_572__T_578_addr),
        .write_data(_T_572__T_578_data)
    );
    wire _T_574;
    wire [1:0] _WTEMP_31;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_205 (
        .y(_WTEMP_31),
        .in(1'h1)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_206 (
        .y(_T_574),
        .a(repl_way),
        .b(_WTEMP_31)
    );
    wire _T_575;
    BITWISEAND #(.width(1)) bitwiseand_207 (
        .y(_T_575),
        .a(io_mem_0_d_valid),
        .b(_T_574)
    );
    wire [8:0] _T_576;
    SHL_UNSIGNED #(.width(6), .n(3)) u_shl_208 (
        .y(_T_576),
        .in(refill_idx)
    );
    wire [8:0] _T_577;
    wire [8:0] _WTEMP_32;
    PAD_UNSIGNED #(.width(5), .n(9)) u_pad_209 (
        .y(_WTEMP_32),
        .in(refill_cnt)
    );
    BITWISEOR #(.width(9)) bitwiseor_210 (
        .y(_T_577),
        .a(_T_576),
        .b(_WTEMP_32)
    );
    assign _T_572__T_578_addr = _T_577;
    assign _T_572__T_578_en = _T_575;
    assign _T_572__T_578_clk = clock;
    assign _T_572__T_578_mask = 1'h1;
    wire [8:0] _T_579;
    BITS #(.width(39), .high(11), .low(3)) bits_211 (
        .y(_T_579),
        .in(io_req_bits_addr)
    );
    wire _T_581;
    EQ_UNSIGNED #(.width(1)) u_eq_212 (
        .y(_T_581),
        .a(_T_575),
        .b(1'h0)
    );
    wire _T_582;
    BITWISEAND #(.width(1)) bitwiseand_213 (
        .y(_T_582),
        .a(_T_581),
        .b(s0_valid)
    );
    wire [8:0] _T_584;
    wire [8:0] _T_586;
    BITWISEOR #(.width(9)) bitwiseor_214 (
        .y(_T_586),
        .a(_T_584),
        .b(9'h0)
    );
    wire [8:0] _T_587;
    BITS #(.width(9), .high(8), .low(0)) bits_215 (
        .y(_T_587),
        .in(_T_586)
    );
    assign _T_572__T_588_addr = _T_587;
    assign _T_572__T_588_en = _T_582;
    assign _T_572__T_588_clk = clock;
    wire [63:0] __T_590__q;
    wire [63:0] __T_590__d;
    DFF_POSCLK #(.width(64)) _T_590 (
        .q(__T_590__q),
        .d(__T_590__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_33;
    MUX_UNSIGNED #(.width(64)) u_mux_216 (
        .y(__T_590__d),
        .sel(reset),
        .a(64'h0),
        .b(_WTEMP_33)
    );
    wire [63:0] _T_591;
    MUX_UNSIGNED #(.width(64)) u_mux_217 (
        .y(_T_591),
        .sel(_s1_dout_valid__q),
        .a(_T_572__T_588_data),
        .b(__T_590__q)
    );
    wire _T_594__T_600_clk;
    wire _T_594__T_600_en;
    wire _T_594__T_600_mask;
    wire [8:0] _T_594__T_600_addr;
    wire [63:0] _T_594__T_600_data;
    wire [63:0] _T_594__T_610_data;
    wire _T_594__T_610_clk;
    wire _T_594__T_610_en;
    wire [8:0] _T_594__T_610_addr;
    RAMMEM #(.depth(512), .addrbits(9), .width(64), .isSyncRead(1)) _T_594 (
        .read_data(_T_594__T_610_data),
        .read_clk(_T_594__T_610_clk),
        .read_en(_T_594__T_610_en),
        .read_addr(_T_594__T_610_addr),
        .write_clk(_T_594__T_600_clk),
        .write_en(_T_594__T_600_en),
        .write_mask(_T_594__T_600_mask),
        .write_addr(_T_594__T_600_addr),
        .write_data(_T_594__T_600_data)
    );
    wire _T_596;
    EQ_UNSIGNED #(.width(2)) u_eq_218 (
        .y(_T_596),
        .a(repl_way),
        .b(2'h2)
    );
    wire _T_597;
    BITWISEAND #(.width(1)) bitwiseand_219 (
        .y(_T_597),
        .a(io_mem_0_d_valid),
        .b(_T_596)
    );
    wire [8:0] _T_598;
    SHL_UNSIGNED #(.width(6), .n(3)) u_shl_220 (
        .y(_T_598),
        .in(refill_idx)
    );
    wire [8:0] _T_599;
    wire [8:0] _WTEMP_34;
    PAD_UNSIGNED #(.width(5), .n(9)) u_pad_221 (
        .y(_WTEMP_34),
        .in(refill_cnt)
    );
    BITWISEOR #(.width(9)) bitwiseor_222 (
        .y(_T_599),
        .a(_T_598),
        .b(_WTEMP_34)
    );
    assign _T_594__T_600_addr = _T_599;
    assign _T_594__T_600_en = _T_597;
    assign _T_594__T_600_clk = clock;
    assign _T_594__T_600_mask = 1'h1;
    wire [8:0] _T_601;
    BITS #(.width(39), .high(11), .low(3)) bits_223 (
        .y(_T_601),
        .in(io_req_bits_addr)
    );
    wire _T_603;
    EQ_UNSIGNED #(.width(1)) u_eq_224 (
        .y(_T_603),
        .a(_T_597),
        .b(1'h0)
    );
    wire _T_604;
    BITWISEAND #(.width(1)) bitwiseand_225 (
        .y(_T_604),
        .a(_T_603),
        .b(s0_valid)
    );
    wire [8:0] _T_606;
    wire [8:0] _T_608;
    BITWISEOR #(.width(9)) bitwiseor_226 (
        .y(_T_608),
        .a(_T_606),
        .b(9'h0)
    );
    wire [8:0] _T_609;
    BITS #(.width(9), .high(8), .low(0)) bits_227 (
        .y(_T_609),
        .in(_T_608)
    );
    assign _T_594__T_610_addr = _T_609;
    assign _T_594__T_610_en = _T_604;
    assign _T_594__T_610_clk = clock;
    wire [63:0] __T_612__q;
    wire [63:0] __T_612__d;
    DFF_POSCLK #(.width(64)) _T_612 (
        .q(__T_612__q),
        .d(__T_612__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_35;
    MUX_UNSIGNED #(.width(64)) u_mux_228 (
        .y(__T_612__d),
        .sel(reset),
        .a(64'h0),
        .b(_WTEMP_35)
    );
    wire [63:0] _T_613;
    MUX_UNSIGNED #(.width(64)) u_mux_229 (
        .y(_T_613),
        .sel(_s1_dout_valid__q),
        .a(_T_594__T_610_data),
        .b(__T_612__q)
    );
    wire _T_616__T_622_clk;
    wire _T_616__T_622_en;
    wire _T_616__T_622_mask;
    wire [8:0] _T_616__T_622_addr;
    wire [63:0] _T_616__T_622_data;
    wire [63:0] _T_616__T_632_data;
    wire _T_616__T_632_clk;
    wire _T_616__T_632_en;
    wire [8:0] _T_616__T_632_addr;
    RAMMEM #(.depth(512), .addrbits(9), .width(64), .isSyncRead(1)) _T_616 (
        .read_data(_T_616__T_632_data),
        .read_clk(_T_616__T_632_clk),
        .read_en(_T_616__T_632_en),
        .read_addr(_T_616__T_632_addr),
        .write_clk(_T_616__T_622_clk),
        .write_en(_T_616__T_622_en),
        .write_mask(_T_616__T_622_mask),
        .write_addr(_T_616__T_622_addr),
        .write_data(_T_616__T_622_data)
    );
    wire _T_618;
    EQ_UNSIGNED #(.width(2)) u_eq_230 (
        .y(_T_618),
        .a(repl_way),
        .b(2'h3)
    );
    wire _T_619;
    BITWISEAND #(.width(1)) bitwiseand_231 (
        .y(_T_619),
        .a(io_mem_0_d_valid),
        .b(_T_618)
    );
    wire [8:0] _T_620;
    SHL_UNSIGNED #(.width(6), .n(3)) u_shl_232 (
        .y(_T_620),
        .in(refill_idx)
    );
    wire [8:0] _T_621;
    wire [8:0] _WTEMP_36;
    PAD_UNSIGNED #(.width(5), .n(9)) u_pad_233 (
        .y(_WTEMP_36),
        .in(refill_cnt)
    );
    BITWISEOR #(.width(9)) bitwiseor_234 (
        .y(_T_621),
        .a(_T_620),
        .b(_WTEMP_36)
    );
    assign _T_616__T_622_addr = _T_621;
    assign _T_616__T_622_en = _T_619;
    assign _T_616__T_622_clk = clock;
    assign _T_616__T_622_mask = 1'h1;
    wire [8:0] _T_623;
    BITS #(.width(39), .high(11), .low(3)) bits_235 (
        .y(_T_623),
        .in(io_req_bits_addr)
    );
    wire _T_625;
    EQ_UNSIGNED #(.width(1)) u_eq_236 (
        .y(_T_625),
        .a(_T_619),
        .b(1'h0)
    );
    wire _T_626;
    BITWISEAND #(.width(1)) bitwiseand_237 (
        .y(_T_626),
        .a(_T_625),
        .b(s0_valid)
    );
    wire [8:0] _T_628;
    wire [8:0] _T_630;
    BITWISEOR #(.width(9)) bitwiseor_238 (
        .y(_T_630),
        .a(_T_628),
        .b(9'h0)
    );
    wire [8:0] _T_631;
    BITS #(.width(9), .high(8), .low(0)) bits_239 (
        .y(_T_631),
        .in(_T_630)
    );
    assign _T_616__T_632_addr = _T_631;
    assign _T_616__T_632_en = _T_626;
    assign _T_616__T_632_clk = clock;
    wire [63:0] __T_634__q;
    wire [63:0] __T_634__d;
    DFF_POSCLK #(.width(64)) _T_634 (
        .q(__T_634__q),
        .d(__T_634__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_37;
    MUX_UNSIGNED #(.width(64)) u_mux_240 (
        .y(__T_634__d),
        .sel(reset),
        .a(64'h0),
        .b(_WTEMP_37)
    );
    wire [63:0] _T_635;
    MUX_UNSIGNED #(.width(64)) u_mux_241 (
        .y(_T_635),
        .sel(_s1_dout_valid__q),
        .a(_T_616__T_632_data),
        .b(__T_634__q)
    );
    wire _T_638;
    EQ_UNSIGNED #(.width(1)) u_eq_242 (
        .y(_T_638),
        .a(stall),
        .b(1'h0)
    );
    wire __T_639__q;
    wire __T_639__d;
    DFF_POSCLK #(.width(1)) _T_639 (
        .q(__T_639__q),
        .d(__T_639__d),
        .clk(clock)
    );
    wire _WTEMP_38;
    MUX_UNSIGNED #(.width(1)) u_mux_243 (
        .y(__T_639__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_38)
    );
    wire _T_641;
    EQ_UNSIGNED #(.width(1)) u_eq_244 (
        .y(_T_641),
        .a(stall),
        .b(1'h0)
    );
    wire wire_T_654_0;
    wire wire_T_654_1;
    wire wire_T_654_2;
    wire wire_T_654_3;
    wire __T_654_0__q;
    wire __T_654_0__d;
    DFF_POSCLK #(.width(1)) _T_654_0 (
        .q(__T_654_0__q),
        .d(__T_654_0__d),
        .clk(clock)
    );
    wire _WTEMP_39;
    MUX_UNSIGNED #(.width(1)) u_mux_245 (
        .y(__T_654_0__d),
        .sel(reset),
        .a(wire_T_654_0),
        .b(_WTEMP_39)
    );
    wire __T_654_1__q;
    wire __T_654_1__d;
    DFF_POSCLK #(.width(1)) _T_654_1 (
        .q(__T_654_1__q),
        .d(__T_654_1__d),
        .clk(clock)
    );
    wire _WTEMP_40;
    MUX_UNSIGNED #(.width(1)) u_mux_246 (
        .y(__T_654_1__d),
        .sel(reset),
        .a(wire_T_654_1),
        .b(_WTEMP_40)
    );
    wire __T_654_2__q;
    wire __T_654_2__d;
    DFF_POSCLK #(.width(1)) _T_654_2 (
        .q(__T_654_2__q),
        .d(__T_654_2__d),
        .clk(clock)
    );
    wire _WTEMP_41;
    MUX_UNSIGNED #(.width(1)) u_mux_247 (
        .y(__T_654_2__d),
        .sel(reset),
        .a(wire_T_654_2),
        .b(_WTEMP_41)
    );
    wire __T_654_3__q;
    wire __T_654_3__d;
    DFF_POSCLK #(.width(1)) _T_654_3 (
        .q(__T_654_3__q),
        .d(__T_654_3__d),
        .clk(clock)
    );
    wire _WTEMP_42;
    MUX_UNSIGNED #(.width(1)) u_mux_248 (
        .y(__T_654_3__d),
        .sel(reset),
        .a(wire_T_654_3),
        .b(_WTEMP_42)
    );
    wire _T_672;
    EQ_UNSIGNED #(.width(1)) u_eq_249 (
        .y(_T_672),
        .a(stall),
        .b(1'h0)
    );
    wire [63:0] wire_T_685_0;
    wire [63:0] wire_T_685_1;
    wire [63:0] wire_T_685_2;
    wire [63:0] wire_T_685_3;
    wire [63:0] __T_685_0__q;
    wire [63:0] __T_685_0__d;
    DFF_POSCLK #(.width(64)) _T_685_0 (
        .q(__T_685_0__q),
        .d(__T_685_0__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_43;
    MUX_UNSIGNED #(.width(64)) u_mux_250 (
        .y(__T_685_0__d),
        .sel(reset),
        .a(wire_T_685_0),
        .b(_WTEMP_43)
    );
    wire [63:0] __T_685_1__q;
    wire [63:0] __T_685_1__d;
    DFF_POSCLK #(.width(64)) _T_685_1 (
        .q(__T_685_1__q),
        .d(__T_685_1__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_44;
    MUX_UNSIGNED #(.width(64)) u_mux_251 (
        .y(__T_685_1__d),
        .sel(reset),
        .a(wire_T_685_1),
        .b(_WTEMP_44)
    );
    wire [63:0] __T_685_2__q;
    wire [63:0] __T_685_2__d;
    DFF_POSCLK #(.width(64)) _T_685_2 (
        .q(__T_685_2__q),
        .d(__T_685_2__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_45;
    MUX_UNSIGNED #(.width(64)) u_mux_252 (
        .y(__T_685_2__d),
        .sel(reset),
        .a(wire_T_685_2),
        .b(_WTEMP_45)
    );
    wire [63:0] __T_685_3__q;
    wire [63:0] __T_685_3__d;
    DFF_POSCLK #(.width(64)) _T_685_3 (
        .q(__T_685_3__q),
        .d(__T_685_3__d),
        .clk(clock)
    );
    wire [63:0] _WTEMP_46;
    MUX_UNSIGNED #(.width(64)) u_mux_253 (
        .y(__T_685_3__d),
        .sel(reset),
        .a(wire_T_685_3),
        .b(_WTEMP_46)
    );
    wire [63:0] _T_703;
    wire [63:0] _WTEMP_47;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_254 (
        .y(_WTEMP_47),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_255 (
        .y(_T_703),
        .sel(__T_654_0__q),
        .a(__T_685_0__q),
        .b(_WTEMP_47)
    );
    wire [63:0] _T_705;
    wire [63:0] _WTEMP_48;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_256 (
        .y(_WTEMP_48),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_257 (
        .y(_T_705),
        .sel(__T_654_1__q),
        .a(__T_685_1__q),
        .b(_WTEMP_48)
    );
    wire [63:0] _T_707;
    wire [63:0] _WTEMP_49;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_258 (
        .y(_WTEMP_49),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_259 (
        .y(_T_707),
        .sel(__T_654_2__q),
        .a(__T_685_2__q),
        .b(_WTEMP_49)
    );
    wire [63:0] _T_709;
    wire [63:0] _WTEMP_50;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_260 (
        .y(_WTEMP_50),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_261 (
        .y(_T_709),
        .sel(__T_654_3__q),
        .a(__T_685_3__q),
        .b(_WTEMP_50)
    );
    wire [63:0] _T_711;
    BITWISEOR #(.width(64)) bitwiseor_262 (
        .y(_T_711),
        .a(_T_703),
        .b(_T_705)
    );
    wire [63:0] _T_712;
    BITWISEOR #(.width(64)) bitwiseor_263 (
        .y(_T_712),
        .a(_T_711),
        .b(_T_707)
    );
    wire [63:0] _T_713;
    BITWISEOR #(.width(64)) bitwiseor_264 (
        .y(_T_713),
        .a(_T_712),
        .b(_T_709)
    );
    wire [63:0] _T_715;
    wire _T_716;
    EQ_UNSIGNED #(.width(2)) u_eq_265 (
        .y(_T_716),
        .a(_state__q),
        .b(2'h1)
    );
    wire _T_718;
    EQ_UNSIGNED #(.width(1)) u_eq_266 (
        .y(_T_718),
        .a(io_s2_kill),
        .b(1'h0)
    );
    wire _T_719;
    BITWISEAND #(.width(1)) bitwiseand_267 (
        .y(_T_719),
        .a(_T_716),
        .b(_T_718)
    );
    wire [25:0] _T_721;
    SHR_UNSIGNED #(.width(32), .n(6)) u_shr_268 (
        .y(_T_721),
        .in(_refill_addr__q)
    );
    wire [31:0] _T_722;
    SHL_UNSIGNED #(.width(26), .n(6)) u_shl_269 (
        .y(_T_722),
        .in(_T_721)
    );
    wire _T_726;
    assign _T_726 = 1'h1;
    wire _T_728;
    assign _T_728 = 1'h1;
    wire _T_729;
    assign _T_729 = 1'h1;
    wire _T_730;
    assign _T_730 = 1'h1;
    wire [31:0] _T_732;
    wire [31:0] _WTEMP_51;
    PAD_UNSIGNED #(.width(1), .n(32)) u_pad_270 (
        .y(_WTEMP_51),
        .in(1'h0)
    );
    BITWISEXOR #(.width(32)) bitwisexor_271 (
        .y(_T_732),
        .a(_T_722),
        .b(_WTEMP_51)
    );
    wire [32:0] _T_733;
    CVT_UNSIGNED #(.width(32)) u_cvt_272 (
        .y(_T_733),
        .in(_T_732)
    );
    wire [32:0] _T_735;
    wire [32:0] _WTEMP_52;
    PAD_SIGNED #(.width(31), .n(33)) s_pad_273 (
        .y(_WTEMP_52),
        .in(31'sh20000000)
    );
    BITWISEAND #(.width(33)) bitwiseand_274 (
        .y(_T_735),
        .a(_T_733),
        .b(_WTEMP_52)
    );
    wire [32:0] _T_736;
    ASSINT #(.width(33)) assint_275 (
        .y(_T_736),
        .in(_T_735)
    );
    wire _T_738;
    wire [32:0] _WTEMP_53;
    PAD_SIGNED #(.width(1), .n(33)) s_pad_276 (
        .y(_WTEMP_53),
        .in(1'sh0)
    );
    EQ_SIGNED #(.width(33)) s_eq_277 (
        .y(_T_738),
        .a(_T_736),
        .b(_WTEMP_53)
    );
    wire _T_739;
    BITWISEAND #(.width(1)) bitwiseand_278 (
        .y(_T_739),
        .a(_T_730),
        .b(_T_738)
    );
    wire _T_742;
    assign _T_742 = 1'h1;
    wire _T_744;
    assign _T_744 = 1'h1;
    wire _T_745;
    assign _T_745 = 1'h1;
    wire _T_746;
    assign _T_746 = 1'h1;
    wire [31:0] _T_748;
    wire [31:0] _WTEMP_54;
    PAD_UNSIGNED #(.width(30), .n(32)) u_pad_279 (
        .y(_WTEMP_54),
        .in(30'h20000000)
    );
    BITWISEXOR #(.width(32)) bitwisexor_280 (
        .y(_T_748),
        .a(_T_722),
        .b(_WTEMP_54)
    );
    wire [32:0] _T_749;
    CVT_UNSIGNED #(.width(32)) u_cvt_281 (
        .y(_T_749),
        .in(_T_748)
    );
    wire [32:0] _T_751;
    wire [32:0] _WTEMP_55;
    PAD_SIGNED #(.width(31), .n(33)) s_pad_282 (
        .y(_WTEMP_55),
        .in(31'sh20000000)
    );
    BITWISEAND #(.width(33)) bitwiseand_283 (
        .y(_T_751),
        .a(_T_749),
        .b(_WTEMP_55)
    );
    wire [32:0] _T_752;
    ASSINT #(.width(33)) assint_284 (
        .y(_T_752),
        .in(_T_751)
    );
    wire _T_754;
    wire [32:0] _WTEMP_56;
    PAD_SIGNED #(.width(1), .n(33)) s_pad_285 (
        .y(_WTEMP_56),
        .in(1'sh0)
    );
    EQ_SIGNED #(.width(33)) s_eq_286 (
        .y(_T_754),
        .a(_T_752),
        .b(_WTEMP_56)
    );
    wire _T_755;
    BITWISEAND #(.width(1)) bitwiseand_287 (
        .y(_T_755),
        .a(_T_746),
        .b(_T_754)
    );
    wire _T_757;
    BITWISEOR #(.width(1)) bitwiseor_288 (
        .y(_T_757),
        .a(1'h0),
        .b(_T_739)
    );
    wire _T_758;
    BITWISEOR #(.width(1)) bitwiseor_289 (
        .y(_T_758),
        .a(_T_757),
        .b(_T_755)
    );
    wire [2:0] _T_767_opcode;
    wire [2:0] _T_767_param;
    wire [3:0] _T_767_size;
    wire _T_767_source;
    wire [31:0] _T_767_address;
    wire [7:0] _T_767_mask;
    wire [63:0] _T_767_data;
    wire [3:0] _T_779;
    assign _T_779 = 4'h4;
    wire [2:0] _T_780;
    assign _T_780 = 3'h4;
    wire _T_782;
    assign _T_782 = 1'h1;
    wire _T_784;
    assign _T_784 = 1'h1;
    wire _T_785;
    BITS #(.width(32), .high(2), .low(2)) bits_290 (
        .y(_T_785),
        .in(_T_722)
    );
    wire _T_787;
    EQ_UNSIGNED #(.width(1)) u_eq_291 (
        .y(_T_787),
        .a(_T_785),
        .b(1'h0)
    );
    wire _T_788;
    BITWISEAND #(.width(1)) bitwiseand_292 (
        .y(_T_788),
        .a(1'h1),
        .b(_T_787)
    );
    wire _T_789;
    BITWISEAND #(.width(1)) bitwiseand_293 (
        .y(_T_789),
        .a(_T_784),
        .b(_T_788)
    );
    wire _T_790;
    assign _T_790 = 1'h1;
    wire _T_791;
    BITWISEAND #(.width(1)) bitwiseand_294 (
        .y(_T_791),
        .a(1'h1),
        .b(_T_785)
    );
    wire _T_792;
    BITWISEAND #(.width(1)) bitwiseand_295 (
        .y(_T_792),
        .a(_T_784),
        .b(_T_791)
    );
    wire _T_793;
    assign _T_793 = 1'h1;
    wire _T_794;
    assign _T_794 = 1'h0;
    wire _T_795;
    BITS #(.width(32), .high(1), .low(1)) bits_296 (
        .y(_T_795),
        .in(_T_722)
    );
    wire _T_797;
    EQ_UNSIGNED #(.width(1)) u_eq_297 (
        .y(_T_797),
        .a(_T_795),
        .b(1'h0)
    );
    wire _T_798;
    BITWISEAND #(.width(1)) bitwiseand_298 (
        .y(_T_798),
        .a(_T_788),
        .b(_T_797)
    );
    wire _T_799;
    assign _T_799 = 1'h0;
    wire _T_800;
    assign _T_800 = 1'h1;
    wire _T_801;
    BITWISEAND #(.width(1)) bitwiseand_299 (
        .y(_T_801),
        .a(_T_788),
        .b(_T_795)
    );
    wire _T_802;
    assign _T_802 = 1'h0;
    wire _T_803;
    assign _T_803 = 1'h1;
    wire _T_804;
    BITWISEAND #(.width(1)) bitwiseand_300 (
        .y(_T_804),
        .a(_T_791),
        .b(_T_797)
    );
    wire _T_805;
    assign _T_805 = 1'h0;
    wire _T_806;
    assign _T_806 = 1'h1;
    wire _T_807;
    BITWISEAND #(.width(1)) bitwiseand_301 (
        .y(_T_807),
        .a(_T_791),
        .b(_T_795)
    );
    wire _T_808;
    assign _T_808 = 1'h0;
    wire _T_809;
    assign _T_809 = 1'h1;
    wire _T_810;
    assign _T_810 = 1'h0;
    wire _T_811;
    BITS #(.width(32), .high(0), .low(0)) bits_302 (
        .y(_T_811),
        .in(_T_722)
    );
    wire _T_813;
    EQ_UNSIGNED #(.width(1)) u_eq_303 (
        .y(_T_813),
        .a(_T_811),
        .b(1'h0)
    );
    wire _T_814;
    BITWISEAND #(.width(1)) bitwiseand_304 (
        .y(_T_814),
        .a(_T_798),
        .b(_T_813)
    );
    wire _T_815;
    assign _T_815 = 1'h0;
    wire _T_816;
    assign _T_816 = 1'h1;
    wire _T_817;
    BITWISEAND #(.width(1)) bitwiseand_305 (
        .y(_T_817),
        .a(_T_798),
        .b(_T_811)
    );
    wire _T_818;
    assign _T_818 = 1'h0;
    wire _T_819;
    assign _T_819 = 1'h1;
    wire _T_820;
    BITWISEAND #(.width(1)) bitwiseand_306 (
        .y(_T_820),
        .a(_T_801),
        .b(_T_813)
    );
    wire _T_821;
    assign _T_821 = 1'h0;
    wire _T_822;
    assign _T_822 = 1'h1;
    wire _T_823;
    BITWISEAND #(.width(1)) bitwiseand_307 (
        .y(_T_823),
        .a(_T_801),
        .b(_T_811)
    );
    wire _T_824;
    assign _T_824 = 1'h0;
    wire _T_825;
    assign _T_825 = 1'h1;
    wire _T_826;
    BITWISEAND #(.width(1)) bitwiseand_308 (
        .y(_T_826),
        .a(_T_804),
        .b(_T_813)
    );
    wire _T_827;
    assign _T_827 = 1'h0;
    wire _T_828;
    assign _T_828 = 1'h1;
    wire _T_829;
    BITWISEAND #(.width(1)) bitwiseand_309 (
        .y(_T_829),
        .a(_T_804),
        .b(_T_811)
    );
    wire _T_830;
    assign _T_830 = 1'h0;
    wire _T_831;
    assign _T_831 = 1'h1;
    wire _T_832;
    BITWISEAND #(.width(1)) bitwiseand_310 (
        .y(_T_832),
        .a(_T_807),
        .b(_T_813)
    );
    wire _T_833;
    assign _T_833 = 1'h0;
    wire _T_834;
    assign _T_834 = 1'h1;
    wire _T_835;
    BITWISEAND #(.width(1)) bitwiseand_311 (
        .y(_T_835),
        .a(_T_807),
        .b(_T_811)
    );
    wire _T_836;
    assign _T_836 = 1'h0;
    wire _T_837;
    assign _T_837 = 1'h1;
    wire [1:0] _T_838;
    assign _T_838 = 2'h3;
    wire [1:0] _T_839;
    assign _T_839 = 2'h3;
    wire [3:0] _T_840;
    assign _T_840 = 4'hF;
    wire [1:0] _T_841;
    assign _T_841 = 2'h3;
    wire [1:0] _T_842;
    assign _T_842 = 2'h3;
    wire [3:0] _T_843;
    assign _T_843 = 4'hF;
    wire [7:0] _T_844;
    assign _T_844 = 8'hFF;
    wire _T_848;
    EQ_UNSIGNED #(.width(2)) u_eq_312 (
        .y(_T_848),
        .a(2'h0),
        .b(_state__q)
    );
    wire _node_9;
    MUX_UNSIGNED #(.width(1)) u_mux_313 (
        .y(_node_9),
        .sel(io_invalidate),
        .a(1'h1),
        .b(_invalidated__q)
    );
    wire [1:0] _node_10;
    MUX_UNSIGNED #(.width(2)) u_mux_314 (
        .y(_node_10),
        .sel(s1_miss),
        .a(2'h1),
        .b(_state__q)
    );
    wire _T_850;
    EQ_UNSIGNED #(.width(2)) u_eq_315 (
        .y(_T_850),
        .a(2'h1),
        .b(_state__q)
    );
    wire [1:0] _node_11;
    MUX_UNSIGNED #(.width(2)) u_mux_316 (
        .y(_node_11),
        .sel(_T_848),
        .a(_node_10),
        .b(_state__q)
    );
    wire [1:0] _node_12;
    MUX_UNSIGNED #(.width(2)) u_mux_317 (
        .y(_node_12),
        .sel(io_mem_0_a_ready),
        .a(2'h2),
        .b(_node_11)
    );
    wire [1:0] _node_13;
    MUX_UNSIGNED #(.width(2)) u_mux_318 (
        .y(_node_13),
        .sel(io_s2_kill),
        .a(2'h0),
        .b(_node_12)
    );
    wire [1:0] _node_14;
    MUX_UNSIGNED #(.width(2)) u_mux_319 (
        .y(_node_14),
        .sel(_T_848),
        .a(_node_10),
        .b(_state__q)
    );
    wire _T_851;
    EQ_UNSIGNED #(.width(2)) u_eq_320 (
        .y(_T_851),
        .a(2'h2),
        .b(_state__q)
    );
    wire [1:0] _node_15;
    MUX_UNSIGNED #(.width(2)) u_mux_321 (
        .y(_node_15),
        .sel(_T_850),
        .a(_node_13),
        .b(_node_14)
    );
    wire [1:0] _node_16;
    MUX_UNSIGNED #(.width(2)) u_mux_322 (
        .y(_node_16),
        .sel(io_mem_0_d_valid),
        .a(2'h3),
        .b(_node_15)
    );
    wire [1:0] _node_17;
    MUX_UNSIGNED #(.width(2)) u_mux_323 (
        .y(_node_17),
        .sel(_T_850),
        .a(_node_13),
        .b(_node_14)
    );
    wire _T_852;
    EQ_UNSIGNED #(.width(2)) u_eq_324 (
        .y(_T_852),
        .a(2'h3),
        .b(_state__q)
    );
    wire [1:0] _node_18;
    MUX_UNSIGNED #(.width(2)) u_mux_325 (
        .y(_node_18),
        .sel(_T_851),
        .a(_node_16),
        .b(_node_17)
    );
    wire [1:0] _node_19;
    MUX_UNSIGNED #(.width(2)) u_mux_326 (
        .y(_node_19),
        .sel(refill_done),
        .a(2'h0),
        .b(_node_18)
    );
    wire [1:0] _node_20;
    MUX_UNSIGNED #(.width(2)) u_mux_327 (
        .y(_node_20),
        .sel(_T_851),
        .a(_node_16),
        .b(_node_17)
    );
    MUX_UNSIGNED #(.width(5)) u_mux_328 (
        .y(_WTEMP_5),
        .sel(_T_235),
        .a(_T_259),
        .b(__T_246__q)
    );
    MUX_UNSIGNED #(.width(16)) u_mux_329 (
        .y(_WTEMP_10),
        .sel(s1_miss),
        .a(_T_271),
        .b(__T_262__q)
    );
    assign _T_287 = _T_282;
    assign _T_304_0 = refill_tag;
    assign _T_304_1 = refill_tag;
    assign _T_304_2 = refill_tag;
    assign _T_304_3 = refill_tag;
    assign _T_321_0 = _T_312;
    assign _T_321_1 = _T_314;
    assign _T_321_2 = _T_316;
    assign _T_321_3 = _T_318;
    MUX_UNSIGNED #(.width(1)) u_mux_330 (
        .y(_WTEMP_20),
        .sel(_s1_dout_valid__q),
        .a(1'h0),
        .b(__T_448__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_331 (
        .y(_WTEMP_21),
        .sel(_s1_dout_valid__q),
        .a(_T_451),
        .b(__T_453__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_332 (
        .y(_WTEMP_22),
        .sel(_s1_dout_valid__q),
        .a(1'h0),
        .b(__T_474__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_333 (
        .y(_WTEMP_23),
        .sel(_s1_dout_valid__q),
        .a(_T_477),
        .b(__T_479__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_334 (
        .y(_WTEMP_24),
        .sel(_s1_dout_valid__q),
        .a(1'h0),
        .b(__T_500__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_335 (
        .y(_WTEMP_25),
        .sel(_s1_dout_valid__q),
        .a(_T_503),
        .b(__T_505__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_336 (
        .y(_WTEMP_26),
        .sel(_s1_dout_valid__q),
        .a(1'h0),
        .b(__T_526__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_337 (
        .y(_WTEMP_27),
        .sel(_s1_dout_valid__q),
        .a(_T_529),
        .b(__T_531__q)
    );
    assign _T_550__T_556_data = io_mem_0_d_bits_data;
    assign _T_562 = _T_557;
    MUX_UNSIGNED #(.width(64)) u_mux_338 (
        .y(_WTEMP_30),
        .sel(_s1_dout_valid__q),
        .a(_T_550__T_566_data),
        .b(__T_568__q)
    );
    assign _T_572__T_578_data = io_mem_0_d_bits_data;
    assign _T_584 = _T_579;
    MUX_UNSIGNED #(.width(64)) u_mux_339 (
        .y(_WTEMP_33),
        .sel(_s1_dout_valid__q),
        .a(_T_572__T_588_data),
        .b(__T_590__q)
    );
    assign _T_594__T_600_data = io_mem_0_d_bits_data;
    assign _T_606 = _T_601;
    MUX_UNSIGNED #(.width(64)) u_mux_340 (
        .y(_WTEMP_35),
        .sel(_s1_dout_valid__q),
        .a(_T_594__T_610_data),
        .b(__T_612__q)
    );
    assign _T_616__T_622_data = io_mem_0_d_bits_data;
    assign _T_628 = _T_623;
    MUX_UNSIGNED #(.width(64)) u_mux_341 (
        .y(_WTEMP_37),
        .sel(_s1_dout_valid__q),
        .a(_T_616__T_632_data),
        .b(__T_634__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_342 (
        .y(_WTEMP_38),
        .sel(_T_638),
        .a(s1_hit),
        .b(__T_639__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_343 (
        .y(_WTEMP_39),
        .sel(_T_641),
        .a(s1_tag_hit_0),
        .b(__T_654_0__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_344 (
        .y(_WTEMP_40),
        .sel(_T_641),
        .a(s1_tag_hit_1),
        .b(__T_654_1__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_345 (
        .y(_WTEMP_41),
        .sel(_T_641),
        .a(s1_tag_hit_2),
        .b(__T_654_2__q)
    );
    MUX_UNSIGNED #(.width(1)) u_mux_346 (
        .y(_WTEMP_42),
        .sel(_T_641),
        .a(s1_tag_hit_3),
        .b(__T_654_3__q)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_347 (
        .y(_WTEMP_43),
        .sel(_T_672),
        .a(s1_dout_0),
        .b(__T_685_0__q)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_348 (
        .y(_WTEMP_44),
        .sel(_T_672),
        .a(s1_dout_1),
        .b(__T_685_1__q)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_349 (
        .y(_WTEMP_45),
        .sel(_T_672),
        .a(s1_dout_2),
        .b(__T_685_2__q)
    );
    MUX_UNSIGNED #(.width(64)) u_mux_350 (
        .y(_WTEMP_46),
        .sel(_T_672),
        .a(s1_dout_3),
        .b(__T_685_3__q)
    );
    assign _T_715 = _T_713;
    assign _T_767_address = _T_722;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_351 (
        .y(_T_767_data),
        .in(1'h0)
    );
    assign _T_767_mask = 8'hFF;
    assign _T_767_opcode = 3'h4;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_352 (
        .y(_T_767_param),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_353 (
        .y(_T_767_size),
        .in(3'h6)
    );
    assign _T_767_source = 1'h0;
    MUX_UNSIGNED #(.width(1)) u_mux_354 (
        .y(_WTEMP_1),
        .sel(_T_848),
        .a(1'h0),
        .b(_node_9)
    );
    assign io_mem_0_a_bits_address = _T_767_address;
    assign io_mem_0_a_bits_data = _T_767_data;
    assign io_mem_0_a_bits_mask = _T_767_mask;
    assign io_mem_0_a_bits_opcode = _T_767_opcode;
    assign io_mem_0_a_bits_param = _T_767_param;
    assign io_mem_0_a_bits_size = _T_767_size;
    assign io_mem_0_a_bits_source = _T_767_source;
    assign io_mem_0_a_valid = _T_719;
    assign io_mem_0_c_valid = 1'h0;
    assign io_mem_0_d_ready = 1'h1;
    assign io_mem_0_e_valid = 1'h0;
    assign io_resp_bits_datablock = _T_715;
    assign io_resp_valid = __T_639__q;
    MUX_UNSIGNED #(.width(32)) u_mux_355 (
        .y(_WTEMP_2),
        .sel(_T_234),
        .a(io_s1_paddr),
        .b(_refill_addr__q)
    );
    assign s1_any_tag_hit = _T_547;
    assign s1_disparity_0 = _T_460;
    assign s1_disparity_1 = _T_486;
    assign s1_disparity_2 = _T_512;
    assign s1_disparity_3 = _T_538;
    assign s1_dout_0 = _T_569;
    assign s1_dout_1 = _T_591;
    assign s1_dout_2 = _T_613;
    assign s1_dout_3 = _T_635;
    assign _WTEMP_19 = s0_valid;
    assign s1_tag_hit_0 = _T_455;
    assign s1_tag_hit_1 = _T_481;
    assign s1_tag_hit_2 = _T_507;
    assign s1_tag_hit_3 = _T_533;
    assign s1_tag_match_0 = _T_454;
    assign s1_tag_match_1 = _T_480;
    assign s1_tag_match_2 = _T_506;
    assign s1_tag_match_3 = _T_532;
    assign _WTEMP_3 = _T_232;
    MUX_UNSIGNED #(.width(2)) u_mux_356 (
        .y(_WTEMP_0),
        .sel(_T_852),
        .a(_node_19),
        .b(_node_20)
    );
    assign tag_array_0__T_328_data = _node_0;
    assign tag_array_1__T_328_data = _node_1;
    assign tag_array_2__T_328_data = _node_2;
    assign tag_array_3__T_328_data = _node_3;
    MUX_UNSIGNED #(.width(256)) u_mux_357 (
        .y(_WTEMP_13),
        .sel(_T_397),
        .a(_T_407),
        .b(_node_8)
    );
    assign wire_T_654_0 = 1'h0;
    assign wire_T_654_1 = 1'h0;
    assign wire_T_654_2 = 1'h0;
    assign wire_T_654_3 = 1'h0;
    assign wire_T_685_0 = 64'h0;
    assign wire_T_685_1 = 64'h0;
    assign wire_T_685_2 = 64'h0;
    assign wire_T_685_3 = 64'h0;
endmodule //ICache
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
module EQ_UNSIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a == b;
endmodule // EQ_UNSIGNED
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module BITWISEOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a | b;
endmodule // BITWISEOR
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
module BITWISENOT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = ~in;
endmodule // BITWISENOT
module SHR_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : 1'b0;
endmodule // SHR_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
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
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module BITWISEXOR(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a ^ b;
endmodule // BITWISEXOR
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
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
module DSHR_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = in >> n;
endmodule // DSHR_UNSIGNED
module SHL_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{1'b0}}, in};
    assign y = temp << n;
endmodule // SHL_UNSIGNED
module CVT_UNSIGNED(y, in);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] in;
    assign y = $signed({1'b0, in});
endmodule // CVT_UNSIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module EQ_SIGNED(y, a, b);
    parameter width = 4;
    output y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) == $signed(b);
endmodule // EQ_SIGNED
