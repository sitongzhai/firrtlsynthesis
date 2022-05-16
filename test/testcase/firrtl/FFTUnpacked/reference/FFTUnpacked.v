module FFTUnpacked(
    input clock,
    input reset,
    input io_in_valid,
    input [63:0] io_in_bits_0_real_node,
    input [63:0] io_in_bits_0_imaginary_node,
    input [63:0] io_in_bits_1_real_node,
    input [63:0] io_in_bits_1_imaginary_node,
    input [63:0] io_in_bits_2_real_node,
    input [63:0] io_in_bits_2_imaginary_node,
    input [63:0] io_in_bits_3_real_node,
    input [63:0] io_in_bits_3_imaginary_node,
    input [63:0] io_in_bits_4_real_node,
    input [63:0] io_in_bits_4_imaginary_node,
    input [63:0] io_in_bits_5_real_node,
    input [63:0] io_in_bits_5_imaginary_node,
    input [63:0] io_in_bits_6_real_node,
    input [63:0] io_in_bits_6_imaginary_node,
    input [63:0] io_in_bits_7_real_node,
    input [63:0] io_in_bits_7_imaginary_node,
    input io_in_sync,
    output io_out_valid,
    output [63:0] io_out_bits_0_real_node,
    output [63:0] io_out_bits_0_imaginary_node,
    output [63:0] io_out_bits_1_real_node,
    output [63:0] io_out_bits_1_imaginary_node,
    output [63:0] io_out_bits_2_real_node,
    output [63:0] io_out_bits_2_imaginary_node,
    output [63:0] io_out_bits_3_real_node,
    output [63:0] io_out_bits_3_imaginary_node,
    output [63:0] io_out_bits_4_real_node,
    output [63:0] io_out_bits_4_imaginary_node,
    output [63:0] io_out_bits_5_real_node,
    output [63:0] io_out_bits_5_imaginary_node,
    output [63:0] io_out_bits_6_real_node,
    output [63:0] io_out_bits_6_imaginary_node,
    output [63:0] io_out_bits_7_real_node,
    output [63:0] io_out_bits_7_imaginary_node,
    output io_out_sync
);
    wire [63:0] _T_5_node;
    wire [63:0] _T_12_node;
    wire [63:0] _T_316_node;
    wire [63:0] _T_323_node;
    wire _direct__clock;
    wire _direct__reset;
    wire _direct__io_in_valid;
    wire [63:0] _direct__io_in_bits_0_real_node;
    wire [63:0] _direct__io_in_bits_0_imaginary_node;
    wire [63:0] _direct__io_in_bits_1_real_node;
    wire [63:0] _direct__io_in_bits_1_imaginary_node;
    wire [63:0] _direct__io_in_bits_2_real_node;
    wire [63:0] _direct__io_in_bits_2_imaginary_node;
    wire [63:0] _direct__io_in_bits_3_real_node;
    wire [63:0] _direct__io_in_bits_3_imaginary_node;
    wire [63:0] _direct__io_in_bits_4_real_node;
    wire [63:0] _direct__io_in_bits_4_imaginary_node;
    wire [63:0] _direct__io_in_bits_5_real_node;
    wire [63:0] _direct__io_in_bits_5_imaginary_node;
    wire [63:0] _direct__io_in_bits_6_real_node;
    wire [63:0] _direct__io_in_bits_6_imaginary_node;
    wire [63:0] _direct__io_in_bits_7_real_node;
    wire [63:0] _direct__io_in_bits_7_imaginary_node;
    wire _direct__io_in_sync;
    wire _direct__io_out_valid;
    wire [63:0] _direct__io_out_bits_0_real_node;
    wire [63:0] _direct__io_out_bits_0_imaginary_node;
    wire [63:0] _direct__io_out_bits_1_real_node;
    wire [63:0] _direct__io_out_bits_1_imaginary_node;
    wire [63:0] _direct__io_out_bits_2_real_node;
    wire [63:0] _direct__io_out_bits_2_imaginary_node;
    wire [63:0] _direct__io_out_bits_3_real_node;
    wire [63:0] _direct__io_out_bits_3_imaginary_node;
    wire [63:0] _direct__io_out_bits_4_real_node;
    wire [63:0] _direct__io_out_bits_4_imaginary_node;
    wire [63:0] _direct__io_out_bits_5_real_node;
    wire [63:0] _direct__io_out_bits_5_imaginary_node;
    wire [63:0] _direct__io_out_bits_6_real_node;
    wire [63:0] _direct__io_out_bits_6_imaginary_node;
    wire [63:0] _direct__io_out_bits_7_real_node;
    wire [63:0] _direct__io_out_bits_7_imaginary_node;
    wire _direct__io_out_sync;
    DirectFFT direct (
        .clock(_direct__clock),
        .reset(_direct__reset),
        .io_in_valid(_direct__io_in_valid),
        .io_in_bits_0_real_node(_direct__io_in_bits_0_real_node),
        .io_in_bits_0_imaginary_node(_direct__io_in_bits_0_imaginary_node),
        .io_in_bits_1_real_node(_direct__io_in_bits_1_real_node),
        .io_in_bits_1_imaginary_node(_direct__io_in_bits_1_imaginary_node),
        .io_in_bits_2_real_node(_direct__io_in_bits_2_real_node),
        .io_in_bits_2_imaginary_node(_direct__io_in_bits_2_imaginary_node),
        .io_in_bits_3_real_node(_direct__io_in_bits_3_real_node),
        .io_in_bits_3_imaginary_node(_direct__io_in_bits_3_imaginary_node),
        .io_in_bits_4_real_node(_direct__io_in_bits_4_real_node),
        .io_in_bits_4_imaginary_node(_direct__io_in_bits_4_imaginary_node),
        .io_in_bits_5_real_node(_direct__io_in_bits_5_real_node),
        .io_in_bits_5_imaginary_node(_direct__io_in_bits_5_imaginary_node),
        .io_in_bits_6_real_node(_direct__io_in_bits_6_real_node),
        .io_in_bits_6_imaginary_node(_direct__io_in_bits_6_imaginary_node),
        .io_in_bits_7_real_node(_direct__io_in_bits_7_real_node),
        .io_in_bits_7_imaginary_node(_direct__io_in_bits_7_imaginary_node),
        .io_in_sync(_direct__io_in_sync),
        .io_out_valid(_direct__io_out_valid),
        .io_out_bits_0_real_node(_direct__io_out_bits_0_real_node),
        .io_out_bits_0_imaginary_node(_direct__io_out_bits_0_imaginary_node),
        .io_out_bits_1_real_node(_direct__io_out_bits_1_real_node),
        .io_out_bits_1_imaginary_node(_direct__io_out_bits_1_imaginary_node),
        .io_out_bits_2_real_node(_direct__io_out_bits_2_real_node),
        .io_out_bits_2_imaginary_node(_direct__io_out_bits_2_imaginary_node),
        .io_out_bits_3_real_node(_direct__io_out_bits_3_real_node),
        .io_out_bits_3_imaginary_node(_direct__io_out_bits_3_imaginary_node),
        .io_out_bits_4_real_node(_direct__io_out_bits_4_real_node),
        .io_out_bits_4_imaginary_node(_direct__io_out_bits_4_imaginary_node),
        .io_out_bits_5_real_node(_direct__io_out_bits_5_real_node),
        .io_out_bits_5_imaginary_node(_direct__io_out_bits_5_imaginary_node),
        .io_out_bits_6_real_node(_direct__io_out_bits_6_real_node),
        .io_out_bits_6_imaginary_node(_direct__io_out_bits_6_imaginary_node),
        .io_out_bits_7_real_node(_direct__io_out_bits_7_real_node),
        .io_out_bits_7_imaginary_node(_direct__io_out_bits_7_imaginary_node),
        .io_out_sync(_direct__io_out_sync)
    );
    wire _BiplexFFT_1__clock;
    wire _BiplexFFT_1__reset;
    wire _BiplexFFT_1__io_in_valid;
    wire [63:0] _BiplexFFT_1__io_in_bits_0_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_0_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_1_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_1_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_2_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_2_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_3_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_3_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_4_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_4_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_5_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_5_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_6_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_6_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_7_real_node;
    wire [63:0] _BiplexFFT_1__io_in_bits_7_imaginary_node;
    wire _BiplexFFT_1__io_in_sync;
    wire _BiplexFFT_1__io_out_valid;
    wire [63:0] _BiplexFFT_1__io_out_bits_0_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_0_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_1_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_1_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_2_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_2_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_3_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_3_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_4_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_4_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_5_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_5_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_6_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_6_imaginary_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_7_real_node;
    wire [63:0] _BiplexFFT_1__io_out_bits_7_imaginary_node;
    wire _BiplexFFT_1__io_out_sync;
    BiplexFFT BiplexFFT_1 (
        .clock(_BiplexFFT_1__clock),
        .reset(_BiplexFFT_1__reset),
        .io_in_valid(_BiplexFFT_1__io_in_valid),
        .io_in_bits_0_real_node(_BiplexFFT_1__io_in_bits_0_real_node),
        .io_in_bits_0_imaginary_node(_BiplexFFT_1__io_in_bits_0_imaginary_node),
        .io_in_bits_1_real_node(_BiplexFFT_1__io_in_bits_1_real_node),
        .io_in_bits_1_imaginary_node(_BiplexFFT_1__io_in_bits_1_imaginary_node),
        .io_in_bits_2_real_node(_BiplexFFT_1__io_in_bits_2_real_node),
        .io_in_bits_2_imaginary_node(_BiplexFFT_1__io_in_bits_2_imaginary_node),
        .io_in_bits_3_real_node(_BiplexFFT_1__io_in_bits_3_real_node),
        .io_in_bits_3_imaginary_node(_BiplexFFT_1__io_in_bits_3_imaginary_node),
        .io_in_bits_4_real_node(_BiplexFFT_1__io_in_bits_4_real_node),
        .io_in_bits_4_imaginary_node(_BiplexFFT_1__io_in_bits_4_imaginary_node),
        .io_in_bits_5_real_node(_BiplexFFT_1__io_in_bits_5_real_node),
        .io_in_bits_5_imaginary_node(_BiplexFFT_1__io_in_bits_5_imaginary_node),
        .io_in_bits_6_real_node(_BiplexFFT_1__io_in_bits_6_real_node),
        .io_in_bits_6_imaginary_node(_BiplexFFT_1__io_in_bits_6_imaginary_node),
        .io_in_bits_7_real_node(_BiplexFFT_1__io_in_bits_7_real_node),
        .io_in_bits_7_imaginary_node(_BiplexFFT_1__io_in_bits_7_imaginary_node),
        .io_in_sync(_BiplexFFT_1__io_in_sync),
        .io_out_valid(_BiplexFFT_1__io_out_valid),
        .io_out_bits_0_real_node(_BiplexFFT_1__io_out_bits_0_real_node),
        .io_out_bits_0_imaginary_node(_BiplexFFT_1__io_out_bits_0_imaginary_node),
        .io_out_bits_1_real_node(_BiplexFFT_1__io_out_bits_1_real_node),
        .io_out_bits_1_imaginary_node(_BiplexFFT_1__io_out_bits_1_imaginary_node),
        .io_out_bits_2_real_node(_BiplexFFT_1__io_out_bits_2_real_node),
        .io_out_bits_2_imaginary_node(_BiplexFFT_1__io_out_bits_2_imaginary_node),
        .io_out_bits_3_real_node(_BiplexFFT_1__io_out_bits_3_real_node),
        .io_out_bits_3_imaginary_node(_BiplexFFT_1__io_out_bits_3_imaginary_node),
        .io_out_bits_4_real_node(_BiplexFFT_1__io_out_bits_4_real_node),
        .io_out_bits_4_imaginary_node(_BiplexFFT_1__io_out_bits_4_imaginary_node),
        .io_out_bits_5_real_node(_BiplexFFT_1__io_out_bits_5_real_node),
        .io_out_bits_5_imaginary_node(_BiplexFFT_1__io_out_bits_5_imaginary_node),
        .io_out_bits_6_real_node(_BiplexFFT_1__io_out_bits_6_real_node),
        .io_out_bits_6_imaginary_node(_BiplexFFT_1__io_out_bits_6_imaginary_node),
        .io_out_bits_7_real_node(_BiplexFFT_1__io_out_bits_7_real_node),
        .io_out_bits_7_imaginary_node(_BiplexFFT_1__io_out_bits_7_imaginary_node),
        .io_out_sync(_BiplexFFT_1__io_out_sync)
    );
    assign _BiplexFFT_1__clock = clock;
    assign _BiplexFFT_1__io_in_bits_0_imaginary_node = io_in_bits_0_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_0_real_node = io_in_bits_0_real_node;
    assign _BiplexFFT_1__io_in_bits_1_imaginary_node = io_in_bits_1_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_1_real_node = io_in_bits_1_real_node;
    assign _BiplexFFT_1__io_in_bits_2_imaginary_node = io_in_bits_2_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_2_real_node = io_in_bits_2_real_node;
    assign _BiplexFFT_1__io_in_bits_3_imaginary_node = io_in_bits_3_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_3_real_node = io_in_bits_3_real_node;
    assign _BiplexFFT_1__io_in_bits_4_imaginary_node = io_in_bits_4_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_4_real_node = io_in_bits_4_real_node;
    assign _BiplexFFT_1__io_in_bits_5_imaginary_node = io_in_bits_5_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_5_real_node = io_in_bits_5_real_node;
    assign _BiplexFFT_1__io_in_bits_6_imaginary_node = io_in_bits_6_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_6_real_node = io_in_bits_6_real_node;
    assign _BiplexFFT_1__io_in_bits_7_imaginary_node = io_in_bits_7_imaginary_node;
    assign _BiplexFFT_1__io_in_bits_7_real_node = io_in_bits_7_real_node;
    assign _BiplexFFT_1__io_in_sync = io_in_sync;
    assign _BiplexFFT_1__io_in_valid = io_in_valid;
    assign _BiplexFFT_1__reset = reset;
    assign _T_12_node = 64'h0;
    assign _T_316_node = 64'h0;
    assign _T_323_node = 64'h0;
    assign _T_5_node = 64'h0;
    assign _direct__clock = clock;
    assign _direct__io_in_bits_0_imaginary_node = _BiplexFFT_1__io_out_bits_0_imaginary_node;
    assign _direct__io_in_bits_0_real_node = _BiplexFFT_1__io_out_bits_0_real_node;
    assign _direct__io_in_bits_1_imaginary_node = _BiplexFFT_1__io_out_bits_1_imaginary_node;
    assign _direct__io_in_bits_1_real_node = _BiplexFFT_1__io_out_bits_1_real_node;
    assign _direct__io_in_bits_2_imaginary_node = _BiplexFFT_1__io_out_bits_2_imaginary_node;
    assign _direct__io_in_bits_2_real_node = _BiplexFFT_1__io_out_bits_2_real_node;
    assign _direct__io_in_bits_3_imaginary_node = _BiplexFFT_1__io_out_bits_3_imaginary_node;
    assign _direct__io_in_bits_3_real_node = _BiplexFFT_1__io_out_bits_3_real_node;
    assign _direct__io_in_bits_4_imaginary_node = _BiplexFFT_1__io_out_bits_4_imaginary_node;
    assign _direct__io_in_bits_4_real_node = _BiplexFFT_1__io_out_bits_4_real_node;
    assign _direct__io_in_bits_5_imaginary_node = _BiplexFFT_1__io_out_bits_5_imaginary_node;
    assign _direct__io_in_bits_5_real_node = _BiplexFFT_1__io_out_bits_5_real_node;
    assign _direct__io_in_bits_6_imaginary_node = _BiplexFFT_1__io_out_bits_6_imaginary_node;
    assign _direct__io_in_bits_6_real_node = _BiplexFFT_1__io_out_bits_6_real_node;
    assign _direct__io_in_bits_7_imaginary_node = _BiplexFFT_1__io_out_bits_7_imaginary_node;
    assign _direct__io_in_bits_7_real_node = _BiplexFFT_1__io_out_bits_7_real_node;
    assign _direct__io_in_sync = _BiplexFFT_1__io_out_sync;
    assign _direct__io_in_valid = _BiplexFFT_1__io_out_valid;
    assign _direct__reset = reset;
    assign io_out_bits_0_imaginary_node = _direct__io_out_bits_0_imaginary_node;
    assign io_out_bits_0_real_node = _direct__io_out_bits_0_real_node;
    assign io_out_bits_1_imaginary_node = _direct__io_out_bits_1_imaginary_node;
    assign io_out_bits_1_real_node = _direct__io_out_bits_1_real_node;
    assign io_out_bits_2_imaginary_node = _direct__io_out_bits_2_imaginary_node;
    assign io_out_bits_2_real_node = _direct__io_out_bits_2_real_node;
    assign io_out_bits_3_imaginary_node = _direct__io_out_bits_3_imaginary_node;
    assign io_out_bits_3_real_node = _direct__io_out_bits_3_real_node;
    assign io_out_bits_4_imaginary_node = _direct__io_out_bits_4_imaginary_node;
    assign io_out_bits_4_real_node = _direct__io_out_bits_4_real_node;
    assign io_out_bits_5_imaginary_node = _direct__io_out_bits_5_imaginary_node;
    assign io_out_bits_5_real_node = _direct__io_out_bits_5_real_node;
    assign io_out_bits_6_imaginary_node = _direct__io_out_bits_6_imaginary_node;
    assign io_out_bits_6_real_node = _direct__io_out_bits_6_real_node;
    assign io_out_bits_7_imaginary_node = _direct__io_out_bits_7_imaginary_node;
    assign io_out_bits_7_real_node = _direct__io_out_bits_7_real_node;
    assign io_out_sync = _direct__io_out_sync;
    assign io_out_valid = _direct__io_out_valid;
endmodule //FFTUnpacked
module DirectFFT(
    input clock,
    input reset,
    input io_in_valid,
    input [63:0] io_in_bits_0_real_node,
    input [63:0] io_in_bits_0_imaginary_node,
    input [63:0] io_in_bits_1_real_node,
    input [63:0] io_in_bits_1_imaginary_node,
    input [63:0] io_in_bits_2_real_node,
    input [63:0] io_in_bits_2_imaginary_node,
    input [63:0] io_in_bits_3_real_node,
    input [63:0] io_in_bits_3_imaginary_node,
    input [63:0] io_in_bits_4_real_node,
    input [63:0] io_in_bits_4_imaginary_node,
    input [63:0] io_in_bits_5_real_node,
    input [63:0] io_in_bits_5_imaginary_node,
    input [63:0] io_in_bits_6_real_node,
    input [63:0] io_in_bits_6_imaginary_node,
    input [63:0] io_in_bits_7_real_node,
    input [63:0] io_in_bits_7_imaginary_node,
    input io_in_sync,
    output io_out_valid,
    output [63:0] io_out_bits_0_real_node,
    output [63:0] io_out_bits_0_imaginary_node,
    output [63:0] io_out_bits_1_real_node,
    output [63:0] io_out_bits_1_imaginary_node,
    output [63:0] io_out_bits_2_real_node,
    output [63:0] io_out_bits_2_imaginary_node,
    output [63:0] io_out_bits_3_real_node,
    output [63:0] io_out_bits_3_imaginary_node,
    output [63:0] io_out_bits_4_real_node,
    output [63:0] io_out_bits_4_imaginary_node,
    output [63:0] io_out_bits_5_real_node,
    output [63:0] io_out_bits_5_imaginary_node,
    output [63:0] io_out_bits_6_real_node,
    output [63:0] io_out_bits_6_imaginary_node,
    output [63:0] io_out_bits_7_real_node,
    output [63:0] io_out_bits_7_imaginary_node,
    output io_out_sync
);
    wire [63:0] _T_5_node;
    wire [63:0] _T_12_node;
    wire [63:0] _T_316_node;
    wire [63:0] _T_323_node;
    wire _T_624;
    BITWISEAND #(.width(1)) bitwiseand_1 (
        .y(_T_624),
        .a(io_in_sync),
        .b(io_in_valid)
    );
    wire _sync__q;
    wire _sync__d;
    DFF_POSCLK #(.width(1)) sync (
        .q(_sync__q),
        .d(_sync__d),
        .clk(clock)
    );
    wire _WTEMP_0;
    MUX_UNSIGNED #(.width(1)) u_mux_2 (
        .y(_sync__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_0)
    );
    wire _T_627;
    EQ_UNSIGNED #(.width(1)) u_eq_3 (
        .y(_T_627),
        .a(_sync__q),
        .b(1'h1)
    );
    wire [1:0] _T_629;
    ADD_UNSIGNED #(.width(1)) u_add_4 (
        .y(_T_629),
        .a(_sync__q),
        .b(1'h1)
    );
    wire _T_630;
    TAIL #(.width(2), .n(1)) tail_5 (
        .y(_T_630),
        .in(_T_629)
    );
    wire _T_631;
    BITWISEAND #(.width(1)) bitwiseand_6 (
        .y(_T_631),
        .a(io_in_valid),
        .b(_T_627)
    );
    wire _node_0;
    MUX_UNSIGNED #(.width(1)) u_mux_7 (
        .y(_node_0),
        .sel(io_in_valid),
        .a(_T_630),
        .b(_sync__q)
    );
    wire _T_635__T_644_clk;
    wire _T_635__T_644_en;
    wire _T_635__T_644_mask;
    wire _T_635__T_644_addr;
    wire _T_635__T_644_data;
    wire _T_635__T_645_data;
    wire _T_635__T_645_clk;
    wire _T_635__T_645_en;
    wire _T_635__T_645_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(1), .isSyncRead(0)) _T_635 (
        .read_data(_T_635__T_645_data),
        .read_clk(_T_635__T_645_clk),
        .read_en(_T_635__T_645_en),
        .read_addr(_T_635__T_645_addr),
        .write_clk(_T_635__T_644_clk),
        .write_en(_T_635__T_644_en),
        .write_mask(_T_635__T_644_mask),
        .write_addr(_T_635__T_644_addr),
        .write_data(_T_635__T_644_data)
    );
    wire __T_637__q;
    wire __T_637__d;
    DFF_POSCLK #(.width(1)) _T_637 (
        .q(__T_637__q),
        .d(__T_637__d),
        .clk(clock)
    );
    wire _WTEMP_1;
    MUX_UNSIGNED #(.width(1)) u_mux_8 (
        .y(__T_637__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_1)
    );
    wire _T_639;
    EQ_UNSIGNED #(.width(1)) u_eq_9 (
        .y(_T_639),
        .a(__T_637__q),
        .b(1'h1)
    );
    wire [1:0] _T_641;
    ADD_UNSIGNED #(.width(1)) u_add_10 (
        .y(_T_641),
        .a(__T_637__q),
        .b(1'h1)
    );
    wire _T_642;
    TAIL #(.width(2), .n(1)) tail_11 (
        .y(_T_642),
        .in(_T_641)
    );
    wire _T_643;
    BITWISEAND #(.width(1)) bitwiseand_12 (
        .y(_T_643),
        .a(io_in_valid),
        .b(_T_639)
    );
    assign _T_635__T_644_addr = __T_637__q;
    assign _T_635__T_644_en = io_in_valid;
    assign _T_635__T_644_clk = clock;
    assign _T_635__T_644_mask = 1'h1;
    assign _T_635__T_645_addr = __T_637__q;
    assign _T_635__T_645_en = 1'h1;
    assign _T_635__T_645_clk = clock;
    wire [63:0] _T_649_node;
    wire [63:0] _T_656_node;
    wire [63:0] twiddle_rom_0_real_node;
    wire [63:0] twiddle_rom_0_imaginary_node;
    wire [63:0] twiddle_rom_1_real_node;
    wire [63:0] twiddle_rom_1_imaginary_node;
    wire [63:0] twiddle_rom_2_real_node;
    wire [63:0] twiddle_rom_2_imaginary_node;
    wire [63:0] twiddle_rom_3_real_node;
    wire [63:0] twiddle_rom_3_imaginary_node;
    wire [63:0] _T_733_node;
    wire [63:0] _T_740_node;
    wire [63:0] _T_757_real_node;
    wire [63:0] _T_757_imaginary_node;
    wire [63:0] _T_761_node;
    wire [63:0] _T_768_node;
    wire [63:0] _T_785_real_node;
    wire [63:0] _T_785_imaginary_node;
    wire [63:0] _T_789_node;
    wire [63:0] _T_796_node;
    wire [63:0] _T_813_real_node;
    wire [63:0] _T_813_imaginary_node;
    wire [63:0] _T_817_node;
    wire [63:0] _T_824_node;
    wire [63:0] _T_841_real_node;
    wire [63:0] _T_841_imaginary_node;
    wire [2:0] indices_rom_0;
    wire [2:0] indices_rom_1;
    wire [2:0] indices_rom_2;
    wire [2:0] indices_rom_3;
    wire [2:0] indices_rom_4;
    wire [2:0] indices_rom_5;
    wire [2:0] indices_rom_6;
    wire [2:0] indices_rom_7;
    wire [2:0] indices_rom_8;
    wire [2:0] indices_rom_9;
    wire [2:0] indices_rom_10;
    wire [2:0] indices_rom_11;
    wire [2:0] indices_rom_12;
    wire [2:0] indices_rom_13;
    wire [3:0] start;
    MUL2_UNSIGNED #(.width_a(1), .width_b(3)) u_mul2_13 (
        .y(start),
        .a(_sync__q),
        .b(3'h7)
    );
    wire [63:0] _T_893_node;
    wire [63:0] _T_900_node;
    wire [63:0] _T_917_real_node;
    wire [63:0] _T_917_imaginary_node;
    wire [63:0] _T_921_node;
    wire [63:0] _T_928_node;
    wire [63:0] _T_945_real_node;
    wire [63:0] _T_945_imaginary_node;
    wire [63:0] _T_949_node;
    wire [63:0] _T_956_node;
    wire [63:0] _T_973_real_node;
    wire [63:0] _T_973_imaginary_node;
    wire [63:0] _T_977_node;
    wire [63:0] _T_984_node;
    wire [63:0] _T_1001_real_node;
    wire [63:0] _T_1001_imaginary_node;
    wire [63:0] _T_1005_node;
    wire [63:0] _T_1012_node;
    wire [63:0] _T_1029_real_node;
    wire [63:0] _T_1029_imaginary_node;
    wire [63:0] _T_1033_node;
    wire [63:0] _T_1040_node;
    wire [63:0] _T_1057_real_node;
    wire [63:0] _T_1057_imaginary_node;
    wire [63:0] _T_1061_node;
    wire [63:0] _T_1068_node;
    wire [63:0] _T_1085_real_node;
    wire [63:0] _T_1085_imaginary_node;
    wire [63:0] twiddle_0_real_node;
    wire [63:0] twiddle_0_imaginary_node;
    wire [63:0] twiddle_1_real_node;
    wire [63:0] twiddle_1_imaginary_node;
    wire [63:0] twiddle_2_real_node;
    wire [63:0] twiddle_2_imaginary_node;
    wire [63:0] twiddle_3_real_node;
    wire [63:0] twiddle_3_imaginary_node;
    wire [63:0] twiddle_4_real_node;
    wire [63:0] twiddle_4_imaginary_node;
    wire [63:0] twiddle_5_real_node;
    wire [63:0] twiddle_5_imaginary_node;
    wire [63:0] twiddle_6_real_node;
    wire [63:0] twiddle_6_imaginary_node;
    wire [4:0] _T_1298;
    wire [3:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_14 (
        .y(_WTEMP_2),
        .in(1'h0)
    );
    ADD_UNSIGNED #(.width(4)) u_add_15 (
        .y(_T_1298),
        .a(start),
        .b(_WTEMP_2)
    );
    wire [3:0] _T_1299;
    TAIL #(.width(5), .n(1)) tail_16 (
        .y(_T_1299),
        .in(_T_1298)
    );
    wire _node_1;
    EQ_UNSIGNED #(.width(4)) u_eq_17 (
        .y(_node_1),
        .a(4'd0),
        .b(_T_1299)
    );
    wire [2:0] _node_2;
    assign _node_2 = indices_rom_0;
    wire _node_3;
    EQ_UNSIGNED #(.width(4)) u_eq_18 (
        .y(_node_3),
        .a(4'd1),
        .b(_T_1299)
    );
    wire [2:0] _node_4;
    MUX_UNSIGNED #(.width(3)) u_mux_19 (
        .y(_node_4),
        .sel(_node_3),
        .a(indices_rom_1),
        .b(_node_2)
    );
    wire _node_5;
    EQ_UNSIGNED #(.width(4)) u_eq_20 (
        .y(_node_5),
        .a(4'd2),
        .b(_T_1299)
    );
    wire [2:0] _node_6;
    MUX_UNSIGNED #(.width(3)) u_mux_21 (
        .y(_node_6),
        .sel(_node_5),
        .a(indices_rom_2),
        .b(_node_4)
    );
    wire _node_7;
    EQ_UNSIGNED #(.width(4)) u_eq_22 (
        .y(_node_7),
        .a(4'd3),
        .b(_T_1299)
    );
    wire [2:0] _node_8;
    MUX_UNSIGNED #(.width(3)) u_mux_23 (
        .y(_node_8),
        .sel(_node_7),
        .a(indices_rom_3),
        .b(_node_6)
    );
    wire _node_9;
    EQ_UNSIGNED #(.width(4)) u_eq_24 (
        .y(_node_9),
        .a(4'd4),
        .b(_T_1299)
    );
    wire [2:0] _node_10;
    MUX_UNSIGNED #(.width(3)) u_mux_25 (
        .y(_node_10),
        .sel(_node_9),
        .a(indices_rom_4),
        .b(_node_8)
    );
    wire _node_11;
    EQ_UNSIGNED #(.width(4)) u_eq_26 (
        .y(_node_11),
        .a(4'd5),
        .b(_T_1299)
    );
    wire [2:0] _node_12;
    MUX_UNSIGNED #(.width(3)) u_mux_27 (
        .y(_node_12),
        .sel(_node_11),
        .a(indices_rom_5),
        .b(_node_10)
    );
    wire _node_13;
    EQ_UNSIGNED #(.width(4)) u_eq_28 (
        .y(_node_13),
        .a(4'd6),
        .b(_T_1299)
    );
    wire [2:0] _node_14;
    MUX_UNSIGNED #(.width(3)) u_mux_29 (
        .y(_node_14),
        .sel(_node_13),
        .a(indices_rom_6),
        .b(_node_12)
    );
    wire _node_15;
    EQ_UNSIGNED #(.width(4)) u_eq_30 (
        .y(_node_15),
        .a(4'd7),
        .b(_T_1299)
    );
    wire [2:0] _node_16;
    MUX_UNSIGNED #(.width(3)) u_mux_31 (
        .y(_node_16),
        .sel(_node_15),
        .a(indices_rom_7),
        .b(_node_14)
    );
    wire _node_17;
    EQ_UNSIGNED #(.width(4)) u_eq_32 (
        .y(_node_17),
        .a(4'd8),
        .b(_T_1299)
    );
    wire [2:0] _node_18;
    MUX_UNSIGNED #(.width(3)) u_mux_33 (
        .y(_node_18),
        .sel(_node_17),
        .a(indices_rom_8),
        .b(_node_16)
    );
    wire _node_19;
    EQ_UNSIGNED #(.width(4)) u_eq_34 (
        .y(_node_19),
        .a(4'd9),
        .b(_T_1299)
    );
    wire [2:0] _node_20;
    MUX_UNSIGNED #(.width(3)) u_mux_35 (
        .y(_node_20),
        .sel(_node_19),
        .a(indices_rom_9),
        .b(_node_18)
    );
    wire _node_21;
    EQ_UNSIGNED #(.width(4)) u_eq_36 (
        .y(_node_21),
        .a(4'd10),
        .b(_T_1299)
    );
    wire [2:0] _node_22;
    MUX_UNSIGNED #(.width(3)) u_mux_37 (
        .y(_node_22),
        .sel(_node_21),
        .a(indices_rom_10),
        .b(_node_20)
    );
    wire _node_23;
    EQ_UNSIGNED #(.width(4)) u_eq_38 (
        .y(_node_23),
        .a(4'd11),
        .b(_T_1299)
    );
    wire [2:0] _node_24;
    MUX_UNSIGNED #(.width(3)) u_mux_39 (
        .y(_node_24),
        .sel(_node_23),
        .a(indices_rom_11),
        .b(_node_22)
    );
    wire _node_25;
    EQ_UNSIGNED #(.width(4)) u_eq_40 (
        .y(_node_25),
        .a(4'd12),
        .b(_T_1299)
    );
    wire [2:0] _node_26;
    MUX_UNSIGNED #(.width(3)) u_mux_41 (
        .y(_node_26),
        .sel(_node_25),
        .a(indices_rom_12),
        .b(_node_24)
    );
    wire _node_27;
    EQ_UNSIGNED #(.width(4)) u_eq_42 (
        .y(_node_27),
        .a(4'd13),
        .b(_T_1299)
    );
    wire [2:0] _node_28;
    MUX_UNSIGNED #(.width(3)) u_mux_43 (
        .y(_node_28),
        .sel(_node_27),
        .a(indices_rom_13),
        .b(_node_26)
    );
    wire _T_1301;
    BITS #(.width(3), .high(2), .low(2)) bits_44 (
        .y(_T_1301),
        .in(_node_28)
    );
    wire [4:0] _T_1303;
    wire [3:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_45 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    ADD_UNSIGNED #(.width(4)) u_add_46 (
        .y(_T_1303),
        .a(start),
        .b(_WTEMP_3)
    );
    wire [3:0] _T_1304;
    TAIL #(.width(5), .n(1)) tail_47 (
        .y(_T_1304),
        .in(_T_1303)
    );
    wire _node_29;
    EQ_UNSIGNED #(.width(4)) u_eq_48 (
        .y(_node_29),
        .a(4'd0),
        .b(_T_1304)
    );
    wire [2:0] _node_30;
    assign _node_30 = indices_rom_0;
    wire _node_31;
    EQ_UNSIGNED #(.width(4)) u_eq_49 (
        .y(_node_31),
        .a(4'd1),
        .b(_T_1304)
    );
    wire [2:0] _node_32;
    MUX_UNSIGNED #(.width(3)) u_mux_50 (
        .y(_node_32),
        .sel(_node_31),
        .a(indices_rom_1),
        .b(_node_30)
    );
    wire _node_33;
    EQ_UNSIGNED #(.width(4)) u_eq_51 (
        .y(_node_33),
        .a(4'd2),
        .b(_T_1304)
    );
    wire [2:0] _node_34;
    MUX_UNSIGNED #(.width(3)) u_mux_52 (
        .y(_node_34),
        .sel(_node_33),
        .a(indices_rom_2),
        .b(_node_32)
    );
    wire _node_35;
    EQ_UNSIGNED #(.width(4)) u_eq_53 (
        .y(_node_35),
        .a(4'd3),
        .b(_T_1304)
    );
    wire [2:0] _node_36;
    MUX_UNSIGNED #(.width(3)) u_mux_54 (
        .y(_node_36),
        .sel(_node_35),
        .a(indices_rom_3),
        .b(_node_34)
    );
    wire _node_37;
    EQ_UNSIGNED #(.width(4)) u_eq_55 (
        .y(_node_37),
        .a(4'd4),
        .b(_T_1304)
    );
    wire [2:0] _node_38;
    MUX_UNSIGNED #(.width(3)) u_mux_56 (
        .y(_node_38),
        .sel(_node_37),
        .a(indices_rom_4),
        .b(_node_36)
    );
    wire _node_39;
    EQ_UNSIGNED #(.width(4)) u_eq_57 (
        .y(_node_39),
        .a(4'd5),
        .b(_T_1304)
    );
    wire [2:0] _node_40;
    MUX_UNSIGNED #(.width(3)) u_mux_58 (
        .y(_node_40),
        .sel(_node_39),
        .a(indices_rom_5),
        .b(_node_38)
    );
    wire _node_41;
    EQ_UNSIGNED #(.width(4)) u_eq_59 (
        .y(_node_41),
        .a(4'd6),
        .b(_T_1304)
    );
    wire [2:0] _node_42;
    MUX_UNSIGNED #(.width(3)) u_mux_60 (
        .y(_node_42),
        .sel(_node_41),
        .a(indices_rom_6),
        .b(_node_40)
    );
    wire _node_43;
    EQ_UNSIGNED #(.width(4)) u_eq_61 (
        .y(_node_43),
        .a(4'd7),
        .b(_T_1304)
    );
    wire [2:0] _node_44;
    MUX_UNSIGNED #(.width(3)) u_mux_62 (
        .y(_node_44),
        .sel(_node_43),
        .a(indices_rom_7),
        .b(_node_42)
    );
    wire _node_45;
    EQ_UNSIGNED #(.width(4)) u_eq_63 (
        .y(_node_45),
        .a(4'd8),
        .b(_T_1304)
    );
    wire [2:0] _node_46;
    MUX_UNSIGNED #(.width(3)) u_mux_64 (
        .y(_node_46),
        .sel(_node_45),
        .a(indices_rom_8),
        .b(_node_44)
    );
    wire _node_47;
    EQ_UNSIGNED #(.width(4)) u_eq_65 (
        .y(_node_47),
        .a(4'd9),
        .b(_T_1304)
    );
    wire [2:0] _node_48;
    MUX_UNSIGNED #(.width(3)) u_mux_66 (
        .y(_node_48),
        .sel(_node_47),
        .a(indices_rom_9),
        .b(_node_46)
    );
    wire _node_49;
    EQ_UNSIGNED #(.width(4)) u_eq_67 (
        .y(_node_49),
        .a(4'd10),
        .b(_T_1304)
    );
    wire [2:0] _node_50;
    MUX_UNSIGNED #(.width(3)) u_mux_68 (
        .y(_node_50),
        .sel(_node_49),
        .a(indices_rom_10),
        .b(_node_48)
    );
    wire _node_51;
    EQ_UNSIGNED #(.width(4)) u_eq_69 (
        .y(_node_51),
        .a(4'd11),
        .b(_T_1304)
    );
    wire [2:0] _node_52;
    MUX_UNSIGNED #(.width(3)) u_mux_70 (
        .y(_node_52),
        .sel(_node_51),
        .a(indices_rom_11),
        .b(_node_50)
    );
    wire _node_53;
    EQ_UNSIGNED #(.width(4)) u_eq_71 (
        .y(_node_53),
        .a(4'd12),
        .b(_T_1304)
    );
    wire [2:0] _node_54;
    MUX_UNSIGNED #(.width(3)) u_mux_72 (
        .y(_node_54),
        .sel(_node_53),
        .a(indices_rom_12),
        .b(_node_52)
    );
    wire _node_55;
    EQ_UNSIGNED #(.width(4)) u_eq_73 (
        .y(_node_55),
        .a(4'd13),
        .b(_T_1304)
    );
    wire [2:0] _node_56;
    MUX_UNSIGNED #(.width(3)) u_mux_74 (
        .y(_node_56),
        .sel(_node_55),
        .a(indices_rom_13),
        .b(_node_54)
    );
    wire [1:0] _T_1306;
    BITS #(.width(3), .high(1), .low(0)) bits_75 (
        .y(_T_1306),
        .in(_node_56)
    );
    wire [63:0] _T_1316_node;
    wire [63:0] _BBFSubtract_43__out;
    wire [63:0] _BBFSubtract_43__in2;
    wire [63:0] _BBFSubtract_43__in1;
    BBFSubtract BBFSubtract_43 (
        .out(_BBFSubtract_43__out),
        .in2(_BBFSubtract_43__in2),
        .in1(_BBFSubtract_43__in1)
    );
    wire _node_57;
    EQ_UNSIGNED #(.width(2)) u_eq_76 (
        .y(_node_57),
        .a(2'd0),
        .b(_T_1306)
    );
    wire [63:0] _node_58;
    assign _node_58 = twiddle_rom_0_real_node;
    wire _node_59;
    EQ_UNSIGNED #(.width(2)) u_eq_77 (
        .y(_node_59),
        .a(2'd1),
        .b(_T_1306)
    );
    wire [63:0] _node_60;
    MUX_UNSIGNED #(.width(64)) u_mux_78 (
        .y(_node_60),
        .sel(_node_59),
        .a(twiddle_rom_1_real_node),
        .b(_node_58)
    );
    wire _node_61;
    EQ_UNSIGNED #(.width(2)) u_eq_79 (
        .y(_node_61),
        .a(2'd2),
        .b(_T_1306)
    );
    wire [63:0] _node_62;
    MUX_UNSIGNED #(.width(64)) u_mux_80 (
        .y(_node_62),
        .sel(_node_61),
        .a(twiddle_rom_2_real_node),
        .b(_node_60)
    );
    wire _node_63;
    EQ_UNSIGNED #(.width(2)) u_eq_81 (
        .y(_node_63),
        .a(2'd3),
        .b(_T_1306)
    );
    wire [63:0] _node_64;
    MUX_UNSIGNED #(.width(64)) u_mux_82 (
        .y(_node_64),
        .sel(_node_63),
        .a(twiddle_rom_3_real_node),
        .b(_node_62)
    );
    wire [63:0] _T_1323_node;
    wire [63:0] _T_1339_real_node;
    wire [63:0] _T_1339_imaginary_node;
    wire _node_65;
    EQ_UNSIGNED #(.width(2)) u_eq_83 (
        .y(_node_65),
        .a(2'd0),
        .b(_T_1306)
    );
    wire [63:0] _node_66;
    assign _node_66 = twiddle_rom_0_imaginary_node;
    wire _node_67;
    EQ_UNSIGNED #(.width(2)) u_eq_84 (
        .y(_node_67),
        .a(2'd1),
        .b(_T_1306)
    );
    wire [63:0] _node_68;
    MUX_UNSIGNED #(.width(64)) u_mux_85 (
        .y(_node_68),
        .sel(_node_67),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_66)
    );
    wire _node_69;
    EQ_UNSIGNED #(.width(2)) u_eq_86 (
        .y(_node_69),
        .a(2'd2),
        .b(_T_1306)
    );
    wire [63:0] _node_70;
    MUX_UNSIGNED #(.width(64)) u_mux_87 (
        .y(_node_70),
        .sel(_node_69),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_68)
    );
    wire _node_71;
    EQ_UNSIGNED #(.width(2)) u_eq_88 (
        .y(_node_71),
        .a(2'd3),
        .b(_T_1306)
    );
    wire [63:0] _node_72;
    MUX_UNSIGNED #(.width(64)) u_mux_89 (
        .y(_node_72),
        .sel(_node_71),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_70)
    );
    wire [4:0] _T_1341;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_90 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    ADD_UNSIGNED #(.width(4)) u_add_91 (
        .y(_T_1341),
        .a(start),
        .b(_WTEMP_4)
    );
    wire [3:0] _T_1342;
    TAIL #(.width(5), .n(1)) tail_92 (
        .y(_T_1342),
        .in(_T_1341)
    );
    wire _node_73;
    EQ_UNSIGNED #(.width(4)) u_eq_93 (
        .y(_node_73),
        .a(4'd0),
        .b(_T_1342)
    );
    wire [2:0] _node_74;
    assign _node_74 = indices_rom_0;
    wire _node_75;
    EQ_UNSIGNED #(.width(4)) u_eq_94 (
        .y(_node_75),
        .a(4'd1),
        .b(_T_1342)
    );
    wire [2:0] _node_76;
    MUX_UNSIGNED #(.width(3)) u_mux_95 (
        .y(_node_76),
        .sel(_node_75),
        .a(indices_rom_1),
        .b(_node_74)
    );
    wire _node_77;
    EQ_UNSIGNED #(.width(4)) u_eq_96 (
        .y(_node_77),
        .a(4'd2),
        .b(_T_1342)
    );
    wire [2:0] _node_78;
    MUX_UNSIGNED #(.width(3)) u_mux_97 (
        .y(_node_78),
        .sel(_node_77),
        .a(indices_rom_2),
        .b(_node_76)
    );
    wire _node_79;
    EQ_UNSIGNED #(.width(4)) u_eq_98 (
        .y(_node_79),
        .a(4'd3),
        .b(_T_1342)
    );
    wire [2:0] _node_80;
    MUX_UNSIGNED #(.width(3)) u_mux_99 (
        .y(_node_80),
        .sel(_node_79),
        .a(indices_rom_3),
        .b(_node_78)
    );
    wire _node_81;
    EQ_UNSIGNED #(.width(4)) u_eq_100 (
        .y(_node_81),
        .a(4'd4),
        .b(_T_1342)
    );
    wire [2:0] _node_82;
    MUX_UNSIGNED #(.width(3)) u_mux_101 (
        .y(_node_82),
        .sel(_node_81),
        .a(indices_rom_4),
        .b(_node_80)
    );
    wire _node_83;
    EQ_UNSIGNED #(.width(4)) u_eq_102 (
        .y(_node_83),
        .a(4'd5),
        .b(_T_1342)
    );
    wire [2:0] _node_84;
    MUX_UNSIGNED #(.width(3)) u_mux_103 (
        .y(_node_84),
        .sel(_node_83),
        .a(indices_rom_5),
        .b(_node_82)
    );
    wire _node_85;
    EQ_UNSIGNED #(.width(4)) u_eq_104 (
        .y(_node_85),
        .a(4'd6),
        .b(_T_1342)
    );
    wire [2:0] _node_86;
    MUX_UNSIGNED #(.width(3)) u_mux_105 (
        .y(_node_86),
        .sel(_node_85),
        .a(indices_rom_6),
        .b(_node_84)
    );
    wire _node_87;
    EQ_UNSIGNED #(.width(4)) u_eq_106 (
        .y(_node_87),
        .a(4'd7),
        .b(_T_1342)
    );
    wire [2:0] _node_88;
    MUX_UNSIGNED #(.width(3)) u_mux_107 (
        .y(_node_88),
        .sel(_node_87),
        .a(indices_rom_7),
        .b(_node_86)
    );
    wire _node_89;
    EQ_UNSIGNED #(.width(4)) u_eq_108 (
        .y(_node_89),
        .a(4'd8),
        .b(_T_1342)
    );
    wire [2:0] _node_90;
    MUX_UNSIGNED #(.width(3)) u_mux_109 (
        .y(_node_90),
        .sel(_node_89),
        .a(indices_rom_8),
        .b(_node_88)
    );
    wire _node_91;
    EQ_UNSIGNED #(.width(4)) u_eq_110 (
        .y(_node_91),
        .a(4'd9),
        .b(_T_1342)
    );
    wire [2:0] _node_92;
    MUX_UNSIGNED #(.width(3)) u_mux_111 (
        .y(_node_92),
        .sel(_node_91),
        .a(indices_rom_9),
        .b(_node_90)
    );
    wire _node_93;
    EQ_UNSIGNED #(.width(4)) u_eq_112 (
        .y(_node_93),
        .a(4'd10),
        .b(_T_1342)
    );
    wire [2:0] _node_94;
    MUX_UNSIGNED #(.width(3)) u_mux_113 (
        .y(_node_94),
        .sel(_node_93),
        .a(indices_rom_10),
        .b(_node_92)
    );
    wire _node_95;
    EQ_UNSIGNED #(.width(4)) u_eq_114 (
        .y(_node_95),
        .a(4'd11),
        .b(_T_1342)
    );
    wire [2:0] _node_96;
    MUX_UNSIGNED #(.width(3)) u_mux_115 (
        .y(_node_96),
        .sel(_node_95),
        .a(indices_rom_11),
        .b(_node_94)
    );
    wire _node_97;
    EQ_UNSIGNED #(.width(4)) u_eq_116 (
        .y(_node_97),
        .a(4'd12),
        .b(_T_1342)
    );
    wire [2:0] _node_98;
    MUX_UNSIGNED #(.width(3)) u_mux_117 (
        .y(_node_98),
        .sel(_node_97),
        .a(indices_rom_12),
        .b(_node_96)
    );
    wire _node_99;
    EQ_UNSIGNED #(.width(4)) u_eq_118 (
        .y(_node_99),
        .a(4'd13),
        .b(_T_1342)
    );
    wire [2:0] _node_100;
    MUX_UNSIGNED #(.width(3)) u_mux_119 (
        .y(_node_100),
        .sel(_node_99),
        .a(indices_rom_13),
        .b(_node_98)
    );
    wire [1:0] _T_1350;
    BITS #(.width(3), .high(1), .low(0)) bits_120 (
        .y(_T_1350),
        .in(_node_100)
    );
    wire _node_101;
    EQ_UNSIGNED #(.width(2)) u_eq_121 (
        .y(_node_101),
        .a(2'd0),
        .b(_T_1350)
    );
    wire [63:0] _node_102;
    assign _node_102 = twiddle_rom_0_real_node;
    wire _node_103;
    EQ_UNSIGNED #(.width(2)) u_eq_122 (
        .y(_node_103),
        .a(2'd1),
        .b(_T_1350)
    );
    wire [63:0] _node_104;
    MUX_UNSIGNED #(.width(64)) u_mux_123 (
        .y(_node_104),
        .sel(_node_103),
        .a(twiddle_rom_1_real_node),
        .b(_node_102)
    );
    wire _node_105;
    EQ_UNSIGNED #(.width(2)) u_eq_124 (
        .y(_node_105),
        .a(2'd2),
        .b(_T_1350)
    );
    wire [63:0] _node_106;
    MUX_UNSIGNED #(.width(64)) u_mux_125 (
        .y(_node_106),
        .sel(_node_105),
        .a(twiddle_rom_2_real_node),
        .b(_node_104)
    );
    wire _node_107;
    EQ_UNSIGNED #(.width(2)) u_eq_126 (
        .y(_node_107),
        .a(2'd3),
        .b(_T_1350)
    );
    wire [63:0] _node_108;
    MUX_UNSIGNED #(.width(64)) u_mux_127 (
        .y(_node_108),
        .sel(_node_107),
        .a(twiddle_rom_3_real_node),
        .b(_node_106)
    );
    wire [63:0] _T_1357_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_128 (
        .y(_T_1357_real_node),
        .sel(_T_1301),
        .a(_T_1339_real_node),
        .b(_node_108)
    );
    wire _node_109;
    EQ_UNSIGNED #(.width(2)) u_eq_129 (
        .y(_node_109),
        .a(2'd0),
        .b(_T_1350)
    );
    wire [63:0] _node_110;
    assign _node_110 = twiddle_rom_0_imaginary_node;
    wire _node_111;
    EQ_UNSIGNED #(.width(2)) u_eq_130 (
        .y(_node_111),
        .a(2'd1),
        .b(_T_1350)
    );
    wire [63:0] _node_112;
    MUX_UNSIGNED #(.width(64)) u_mux_131 (
        .y(_node_112),
        .sel(_node_111),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_110)
    );
    wire _node_113;
    EQ_UNSIGNED #(.width(2)) u_eq_132 (
        .y(_node_113),
        .a(2'd2),
        .b(_T_1350)
    );
    wire [63:0] _node_114;
    MUX_UNSIGNED #(.width(64)) u_mux_133 (
        .y(_node_114),
        .sel(_node_113),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_112)
    );
    wire _node_115;
    EQ_UNSIGNED #(.width(2)) u_eq_134 (
        .y(_node_115),
        .a(2'd3),
        .b(_T_1350)
    );
    wire [63:0] _node_116;
    MUX_UNSIGNED #(.width(64)) u_mux_135 (
        .y(_node_116),
        .sel(_node_115),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_114)
    );
    wire [63:0] _T_1357_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_136 (
        .y(_T_1357_imaginary_node),
        .sel(_T_1301),
        .a(_T_1339_imaginary_node),
        .b(_node_116)
    );
    wire [4:0] _T_1359;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_137 (
        .y(_WTEMP_5),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_138 (
        .y(_T_1359),
        .a(start),
        .b(_WTEMP_5)
    );
    wire [3:0] _T_1360;
    TAIL #(.width(5), .n(1)) tail_139 (
        .y(_T_1360),
        .in(_T_1359)
    );
    wire _node_117;
    EQ_UNSIGNED #(.width(4)) u_eq_140 (
        .y(_node_117),
        .a(4'd0),
        .b(_T_1360)
    );
    wire [2:0] _node_118;
    assign _node_118 = indices_rom_0;
    wire _node_119;
    EQ_UNSIGNED #(.width(4)) u_eq_141 (
        .y(_node_119),
        .a(4'd1),
        .b(_T_1360)
    );
    wire [2:0] _node_120;
    MUX_UNSIGNED #(.width(3)) u_mux_142 (
        .y(_node_120),
        .sel(_node_119),
        .a(indices_rom_1),
        .b(_node_118)
    );
    wire _node_121;
    EQ_UNSIGNED #(.width(4)) u_eq_143 (
        .y(_node_121),
        .a(4'd2),
        .b(_T_1360)
    );
    wire [2:0] _node_122;
    MUX_UNSIGNED #(.width(3)) u_mux_144 (
        .y(_node_122),
        .sel(_node_121),
        .a(indices_rom_2),
        .b(_node_120)
    );
    wire _node_123;
    EQ_UNSIGNED #(.width(4)) u_eq_145 (
        .y(_node_123),
        .a(4'd3),
        .b(_T_1360)
    );
    wire [2:0] _node_124;
    MUX_UNSIGNED #(.width(3)) u_mux_146 (
        .y(_node_124),
        .sel(_node_123),
        .a(indices_rom_3),
        .b(_node_122)
    );
    wire _node_125;
    EQ_UNSIGNED #(.width(4)) u_eq_147 (
        .y(_node_125),
        .a(4'd4),
        .b(_T_1360)
    );
    wire [2:0] _node_126;
    MUX_UNSIGNED #(.width(3)) u_mux_148 (
        .y(_node_126),
        .sel(_node_125),
        .a(indices_rom_4),
        .b(_node_124)
    );
    wire _node_127;
    EQ_UNSIGNED #(.width(4)) u_eq_149 (
        .y(_node_127),
        .a(4'd5),
        .b(_T_1360)
    );
    wire [2:0] _node_128;
    MUX_UNSIGNED #(.width(3)) u_mux_150 (
        .y(_node_128),
        .sel(_node_127),
        .a(indices_rom_5),
        .b(_node_126)
    );
    wire _node_129;
    EQ_UNSIGNED #(.width(4)) u_eq_151 (
        .y(_node_129),
        .a(4'd6),
        .b(_T_1360)
    );
    wire [2:0] _node_130;
    MUX_UNSIGNED #(.width(3)) u_mux_152 (
        .y(_node_130),
        .sel(_node_129),
        .a(indices_rom_6),
        .b(_node_128)
    );
    wire _node_131;
    EQ_UNSIGNED #(.width(4)) u_eq_153 (
        .y(_node_131),
        .a(4'd7),
        .b(_T_1360)
    );
    wire [2:0] _node_132;
    MUX_UNSIGNED #(.width(3)) u_mux_154 (
        .y(_node_132),
        .sel(_node_131),
        .a(indices_rom_7),
        .b(_node_130)
    );
    wire _node_133;
    EQ_UNSIGNED #(.width(4)) u_eq_155 (
        .y(_node_133),
        .a(4'd8),
        .b(_T_1360)
    );
    wire [2:0] _node_134;
    MUX_UNSIGNED #(.width(3)) u_mux_156 (
        .y(_node_134),
        .sel(_node_133),
        .a(indices_rom_8),
        .b(_node_132)
    );
    wire _node_135;
    EQ_UNSIGNED #(.width(4)) u_eq_157 (
        .y(_node_135),
        .a(4'd9),
        .b(_T_1360)
    );
    wire [2:0] _node_136;
    MUX_UNSIGNED #(.width(3)) u_mux_158 (
        .y(_node_136),
        .sel(_node_135),
        .a(indices_rom_9),
        .b(_node_134)
    );
    wire _node_137;
    EQ_UNSIGNED #(.width(4)) u_eq_159 (
        .y(_node_137),
        .a(4'd10),
        .b(_T_1360)
    );
    wire [2:0] _node_138;
    MUX_UNSIGNED #(.width(3)) u_mux_160 (
        .y(_node_138),
        .sel(_node_137),
        .a(indices_rom_10),
        .b(_node_136)
    );
    wire _node_139;
    EQ_UNSIGNED #(.width(4)) u_eq_161 (
        .y(_node_139),
        .a(4'd11),
        .b(_T_1360)
    );
    wire [2:0] _node_140;
    MUX_UNSIGNED #(.width(3)) u_mux_162 (
        .y(_node_140),
        .sel(_node_139),
        .a(indices_rom_11),
        .b(_node_138)
    );
    wire _node_141;
    EQ_UNSIGNED #(.width(4)) u_eq_163 (
        .y(_node_141),
        .a(4'd12),
        .b(_T_1360)
    );
    wire [2:0] _node_142;
    MUX_UNSIGNED #(.width(3)) u_mux_164 (
        .y(_node_142),
        .sel(_node_141),
        .a(indices_rom_12),
        .b(_node_140)
    );
    wire _node_143;
    EQ_UNSIGNED #(.width(4)) u_eq_165 (
        .y(_node_143),
        .a(4'd13),
        .b(_T_1360)
    );
    wire [2:0] _node_144;
    MUX_UNSIGNED #(.width(3)) u_mux_166 (
        .y(_node_144),
        .sel(_node_143),
        .a(indices_rom_13),
        .b(_node_142)
    );
    wire _T_1362;
    BITS #(.width(3), .high(2), .low(2)) bits_167 (
        .y(_T_1362),
        .in(_node_144)
    );
    wire [4:0] _T_1364;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_168 (
        .y(_WTEMP_6),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_169 (
        .y(_T_1364),
        .a(start),
        .b(_WTEMP_6)
    );
    wire [3:0] _T_1365;
    TAIL #(.width(5), .n(1)) tail_170 (
        .y(_T_1365),
        .in(_T_1364)
    );
    wire _node_145;
    EQ_UNSIGNED #(.width(4)) u_eq_171 (
        .y(_node_145),
        .a(4'd0),
        .b(_T_1365)
    );
    wire [2:0] _node_146;
    assign _node_146 = indices_rom_0;
    wire _node_147;
    EQ_UNSIGNED #(.width(4)) u_eq_172 (
        .y(_node_147),
        .a(4'd1),
        .b(_T_1365)
    );
    wire [2:0] _node_148;
    MUX_UNSIGNED #(.width(3)) u_mux_173 (
        .y(_node_148),
        .sel(_node_147),
        .a(indices_rom_1),
        .b(_node_146)
    );
    wire _node_149;
    EQ_UNSIGNED #(.width(4)) u_eq_174 (
        .y(_node_149),
        .a(4'd2),
        .b(_T_1365)
    );
    wire [2:0] _node_150;
    MUX_UNSIGNED #(.width(3)) u_mux_175 (
        .y(_node_150),
        .sel(_node_149),
        .a(indices_rom_2),
        .b(_node_148)
    );
    wire _node_151;
    EQ_UNSIGNED #(.width(4)) u_eq_176 (
        .y(_node_151),
        .a(4'd3),
        .b(_T_1365)
    );
    wire [2:0] _node_152;
    MUX_UNSIGNED #(.width(3)) u_mux_177 (
        .y(_node_152),
        .sel(_node_151),
        .a(indices_rom_3),
        .b(_node_150)
    );
    wire _node_153;
    EQ_UNSIGNED #(.width(4)) u_eq_178 (
        .y(_node_153),
        .a(4'd4),
        .b(_T_1365)
    );
    wire [2:0] _node_154;
    MUX_UNSIGNED #(.width(3)) u_mux_179 (
        .y(_node_154),
        .sel(_node_153),
        .a(indices_rom_4),
        .b(_node_152)
    );
    wire _node_155;
    EQ_UNSIGNED #(.width(4)) u_eq_180 (
        .y(_node_155),
        .a(4'd5),
        .b(_T_1365)
    );
    wire [2:0] _node_156;
    MUX_UNSIGNED #(.width(3)) u_mux_181 (
        .y(_node_156),
        .sel(_node_155),
        .a(indices_rom_5),
        .b(_node_154)
    );
    wire _node_157;
    EQ_UNSIGNED #(.width(4)) u_eq_182 (
        .y(_node_157),
        .a(4'd6),
        .b(_T_1365)
    );
    wire [2:0] _node_158;
    MUX_UNSIGNED #(.width(3)) u_mux_183 (
        .y(_node_158),
        .sel(_node_157),
        .a(indices_rom_6),
        .b(_node_156)
    );
    wire _node_159;
    EQ_UNSIGNED #(.width(4)) u_eq_184 (
        .y(_node_159),
        .a(4'd7),
        .b(_T_1365)
    );
    wire [2:0] _node_160;
    MUX_UNSIGNED #(.width(3)) u_mux_185 (
        .y(_node_160),
        .sel(_node_159),
        .a(indices_rom_7),
        .b(_node_158)
    );
    wire _node_161;
    EQ_UNSIGNED #(.width(4)) u_eq_186 (
        .y(_node_161),
        .a(4'd8),
        .b(_T_1365)
    );
    wire [2:0] _node_162;
    MUX_UNSIGNED #(.width(3)) u_mux_187 (
        .y(_node_162),
        .sel(_node_161),
        .a(indices_rom_8),
        .b(_node_160)
    );
    wire _node_163;
    EQ_UNSIGNED #(.width(4)) u_eq_188 (
        .y(_node_163),
        .a(4'd9),
        .b(_T_1365)
    );
    wire [2:0] _node_164;
    MUX_UNSIGNED #(.width(3)) u_mux_189 (
        .y(_node_164),
        .sel(_node_163),
        .a(indices_rom_9),
        .b(_node_162)
    );
    wire _node_165;
    EQ_UNSIGNED #(.width(4)) u_eq_190 (
        .y(_node_165),
        .a(4'd10),
        .b(_T_1365)
    );
    wire [2:0] _node_166;
    MUX_UNSIGNED #(.width(3)) u_mux_191 (
        .y(_node_166),
        .sel(_node_165),
        .a(indices_rom_10),
        .b(_node_164)
    );
    wire _node_167;
    EQ_UNSIGNED #(.width(4)) u_eq_192 (
        .y(_node_167),
        .a(4'd11),
        .b(_T_1365)
    );
    wire [2:0] _node_168;
    MUX_UNSIGNED #(.width(3)) u_mux_193 (
        .y(_node_168),
        .sel(_node_167),
        .a(indices_rom_11),
        .b(_node_166)
    );
    wire _node_169;
    EQ_UNSIGNED #(.width(4)) u_eq_194 (
        .y(_node_169),
        .a(4'd12),
        .b(_T_1365)
    );
    wire [2:0] _node_170;
    MUX_UNSIGNED #(.width(3)) u_mux_195 (
        .y(_node_170),
        .sel(_node_169),
        .a(indices_rom_12),
        .b(_node_168)
    );
    wire _node_171;
    EQ_UNSIGNED #(.width(4)) u_eq_196 (
        .y(_node_171),
        .a(4'd13),
        .b(_T_1365)
    );
    wire [2:0] _node_172;
    MUX_UNSIGNED #(.width(3)) u_mux_197 (
        .y(_node_172),
        .sel(_node_171),
        .a(indices_rom_13),
        .b(_node_170)
    );
    wire [1:0] _T_1367;
    BITS #(.width(3), .high(1), .low(0)) bits_198 (
        .y(_T_1367),
        .in(_node_172)
    );
    wire [63:0] _T_1377_node;
    wire [63:0] _BBFSubtract_1_1__out;
    wire [63:0] _BBFSubtract_1_1__in2;
    wire [63:0] _BBFSubtract_1_1__in1;
    BBFSubtract BBFSubtract_1_1 (
        .out(_BBFSubtract_1_1__out),
        .in2(_BBFSubtract_1_1__in2),
        .in1(_BBFSubtract_1_1__in1)
    );
    wire _node_173;
    EQ_UNSIGNED #(.width(2)) u_eq_199 (
        .y(_node_173),
        .a(2'd0),
        .b(_T_1367)
    );
    wire [63:0] _node_174;
    assign _node_174 = twiddle_rom_0_real_node;
    wire _node_175;
    EQ_UNSIGNED #(.width(2)) u_eq_200 (
        .y(_node_175),
        .a(2'd1),
        .b(_T_1367)
    );
    wire [63:0] _node_176;
    MUX_UNSIGNED #(.width(64)) u_mux_201 (
        .y(_node_176),
        .sel(_node_175),
        .a(twiddle_rom_1_real_node),
        .b(_node_174)
    );
    wire _node_177;
    EQ_UNSIGNED #(.width(2)) u_eq_202 (
        .y(_node_177),
        .a(2'd2),
        .b(_T_1367)
    );
    wire [63:0] _node_178;
    MUX_UNSIGNED #(.width(64)) u_mux_203 (
        .y(_node_178),
        .sel(_node_177),
        .a(twiddle_rom_2_real_node),
        .b(_node_176)
    );
    wire _node_179;
    EQ_UNSIGNED #(.width(2)) u_eq_204 (
        .y(_node_179),
        .a(2'd3),
        .b(_T_1367)
    );
    wire [63:0] _node_180;
    MUX_UNSIGNED #(.width(64)) u_mux_205 (
        .y(_node_180),
        .sel(_node_179),
        .a(twiddle_rom_3_real_node),
        .b(_node_178)
    );
    wire [63:0] _T_1384_node;
    wire [63:0] _T_1400_real_node;
    wire [63:0] _T_1400_imaginary_node;
    wire _node_181;
    EQ_UNSIGNED #(.width(2)) u_eq_206 (
        .y(_node_181),
        .a(2'd0),
        .b(_T_1367)
    );
    wire [63:0] _node_182;
    assign _node_182 = twiddle_rom_0_imaginary_node;
    wire _node_183;
    EQ_UNSIGNED #(.width(2)) u_eq_207 (
        .y(_node_183),
        .a(2'd1),
        .b(_T_1367)
    );
    wire [63:0] _node_184;
    MUX_UNSIGNED #(.width(64)) u_mux_208 (
        .y(_node_184),
        .sel(_node_183),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_182)
    );
    wire _node_185;
    EQ_UNSIGNED #(.width(2)) u_eq_209 (
        .y(_node_185),
        .a(2'd2),
        .b(_T_1367)
    );
    wire [63:0] _node_186;
    MUX_UNSIGNED #(.width(64)) u_mux_210 (
        .y(_node_186),
        .sel(_node_185),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_184)
    );
    wire _node_187;
    EQ_UNSIGNED #(.width(2)) u_eq_211 (
        .y(_node_187),
        .a(2'd3),
        .b(_T_1367)
    );
    wire [63:0] _node_188;
    MUX_UNSIGNED #(.width(64)) u_mux_212 (
        .y(_node_188),
        .sel(_node_187),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_186)
    );
    wire [4:0] _T_1402;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_213 (
        .y(_WTEMP_7),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_214 (
        .y(_T_1402),
        .a(start),
        .b(_WTEMP_7)
    );
    wire [3:0] _T_1403;
    TAIL #(.width(5), .n(1)) tail_215 (
        .y(_T_1403),
        .in(_T_1402)
    );
    wire _node_189;
    EQ_UNSIGNED #(.width(4)) u_eq_216 (
        .y(_node_189),
        .a(4'd0),
        .b(_T_1403)
    );
    wire [2:0] _node_190;
    assign _node_190 = indices_rom_0;
    wire _node_191;
    EQ_UNSIGNED #(.width(4)) u_eq_217 (
        .y(_node_191),
        .a(4'd1),
        .b(_T_1403)
    );
    wire [2:0] _node_192;
    MUX_UNSIGNED #(.width(3)) u_mux_218 (
        .y(_node_192),
        .sel(_node_191),
        .a(indices_rom_1),
        .b(_node_190)
    );
    wire _node_193;
    EQ_UNSIGNED #(.width(4)) u_eq_219 (
        .y(_node_193),
        .a(4'd2),
        .b(_T_1403)
    );
    wire [2:0] _node_194;
    MUX_UNSIGNED #(.width(3)) u_mux_220 (
        .y(_node_194),
        .sel(_node_193),
        .a(indices_rom_2),
        .b(_node_192)
    );
    wire _node_195;
    EQ_UNSIGNED #(.width(4)) u_eq_221 (
        .y(_node_195),
        .a(4'd3),
        .b(_T_1403)
    );
    wire [2:0] _node_196;
    MUX_UNSIGNED #(.width(3)) u_mux_222 (
        .y(_node_196),
        .sel(_node_195),
        .a(indices_rom_3),
        .b(_node_194)
    );
    wire _node_197;
    EQ_UNSIGNED #(.width(4)) u_eq_223 (
        .y(_node_197),
        .a(4'd4),
        .b(_T_1403)
    );
    wire [2:0] _node_198;
    MUX_UNSIGNED #(.width(3)) u_mux_224 (
        .y(_node_198),
        .sel(_node_197),
        .a(indices_rom_4),
        .b(_node_196)
    );
    wire _node_199;
    EQ_UNSIGNED #(.width(4)) u_eq_225 (
        .y(_node_199),
        .a(4'd5),
        .b(_T_1403)
    );
    wire [2:0] _node_200;
    MUX_UNSIGNED #(.width(3)) u_mux_226 (
        .y(_node_200),
        .sel(_node_199),
        .a(indices_rom_5),
        .b(_node_198)
    );
    wire _node_201;
    EQ_UNSIGNED #(.width(4)) u_eq_227 (
        .y(_node_201),
        .a(4'd6),
        .b(_T_1403)
    );
    wire [2:0] _node_202;
    MUX_UNSIGNED #(.width(3)) u_mux_228 (
        .y(_node_202),
        .sel(_node_201),
        .a(indices_rom_6),
        .b(_node_200)
    );
    wire _node_203;
    EQ_UNSIGNED #(.width(4)) u_eq_229 (
        .y(_node_203),
        .a(4'd7),
        .b(_T_1403)
    );
    wire [2:0] _node_204;
    MUX_UNSIGNED #(.width(3)) u_mux_230 (
        .y(_node_204),
        .sel(_node_203),
        .a(indices_rom_7),
        .b(_node_202)
    );
    wire _node_205;
    EQ_UNSIGNED #(.width(4)) u_eq_231 (
        .y(_node_205),
        .a(4'd8),
        .b(_T_1403)
    );
    wire [2:0] _node_206;
    MUX_UNSIGNED #(.width(3)) u_mux_232 (
        .y(_node_206),
        .sel(_node_205),
        .a(indices_rom_8),
        .b(_node_204)
    );
    wire _node_207;
    EQ_UNSIGNED #(.width(4)) u_eq_233 (
        .y(_node_207),
        .a(4'd9),
        .b(_T_1403)
    );
    wire [2:0] _node_208;
    MUX_UNSIGNED #(.width(3)) u_mux_234 (
        .y(_node_208),
        .sel(_node_207),
        .a(indices_rom_9),
        .b(_node_206)
    );
    wire _node_209;
    EQ_UNSIGNED #(.width(4)) u_eq_235 (
        .y(_node_209),
        .a(4'd10),
        .b(_T_1403)
    );
    wire [2:0] _node_210;
    MUX_UNSIGNED #(.width(3)) u_mux_236 (
        .y(_node_210),
        .sel(_node_209),
        .a(indices_rom_10),
        .b(_node_208)
    );
    wire _node_211;
    EQ_UNSIGNED #(.width(4)) u_eq_237 (
        .y(_node_211),
        .a(4'd11),
        .b(_T_1403)
    );
    wire [2:0] _node_212;
    MUX_UNSIGNED #(.width(3)) u_mux_238 (
        .y(_node_212),
        .sel(_node_211),
        .a(indices_rom_11),
        .b(_node_210)
    );
    wire _node_213;
    EQ_UNSIGNED #(.width(4)) u_eq_239 (
        .y(_node_213),
        .a(4'd12),
        .b(_T_1403)
    );
    wire [2:0] _node_214;
    MUX_UNSIGNED #(.width(3)) u_mux_240 (
        .y(_node_214),
        .sel(_node_213),
        .a(indices_rom_12),
        .b(_node_212)
    );
    wire _node_215;
    EQ_UNSIGNED #(.width(4)) u_eq_241 (
        .y(_node_215),
        .a(4'd13),
        .b(_T_1403)
    );
    wire [2:0] _node_216;
    MUX_UNSIGNED #(.width(3)) u_mux_242 (
        .y(_node_216),
        .sel(_node_215),
        .a(indices_rom_13),
        .b(_node_214)
    );
    wire [1:0] _T_1411;
    BITS #(.width(3), .high(1), .low(0)) bits_243 (
        .y(_T_1411),
        .in(_node_216)
    );
    wire _node_217;
    EQ_UNSIGNED #(.width(2)) u_eq_244 (
        .y(_node_217),
        .a(2'd0),
        .b(_T_1411)
    );
    wire [63:0] _node_218;
    assign _node_218 = twiddle_rom_0_real_node;
    wire _node_219;
    EQ_UNSIGNED #(.width(2)) u_eq_245 (
        .y(_node_219),
        .a(2'd1),
        .b(_T_1411)
    );
    wire [63:0] _node_220;
    MUX_UNSIGNED #(.width(64)) u_mux_246 (
        .y(_node_220),
        .sel(_node_219),
        .a(twiddle_rom_1_real_node),
        .b(_node_218)
    );
    wire _node_221;
    EQ_UNSIGNED #(.width(2)) u_eq_247 (
        .y(_node_221),
        .a(2'd2),
        .b(_T_1411)
    );
    wire [63:0] _node_222;
    MUX_UNSIGNED #(.width(64)) u_mux_248 (
        .y(_node_222),
        .sel(_node_221),
        .a(twiddle_rom_2_real_node),
        .b(_node_220)
    );
    wire _node_223;
    EQ_UNSIGNED #(.width(2)) u_eq_249 (
        .y(_node_223),
        .a(2'd3),
        .b(_T_1411)
    );
    wire [63:0] _node_224;
    MUX_UNSIGNED #(.width(64)) u_mux_250 (
        .y(_node_224),
        .sel(_node_223),
        .a(twiddle_rom_3_real_node),
        .b(_node_222)
    );
    wire [63:0] _T_1418_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_251 (
        .y(_T_1418_real_node),
        .sel(_T_1362),
        .a(_T_1400_real_node),
        .b(_node_224)
    );
    wire _node_225;
    EQ_UNSIGNED #(.width(2)) u_eq_252 (
        .y(_node_225),
        .a(2'd0),
        .b(_T_1411)
    );
    wire [63:0] _node_226;
    assign _node_226 = twiddle_rom_0_imaginary_node;
    wire _node_227;
    EQ_UNSIGNED #(.width(2)) u_eq_253 (
        .y(_node_227),
        .a(2'd1),
        .b(_T_1411)
    );
    wire [63:0] _node_228;
    MUX_UNSIGNED #(.width(64)) u_mux_254 (
        .y(_node_228),
        .sel(_node_227),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_226)
    );
    wire _node_229;
    EQ_UNSIGNED #(.width(2)) u_eq_255 (
        .y(_node_229),
        .a(2'd2),
        .b(_T_1411)
    );
    wire [63:0] _node_230;
    MUX_UNSIGNED #(.width(64)) u_mux_256 (
        .y(_node_230),
        .sel(_node_229),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_228)
    );
    wire _node_231;
    EQ_UNSIGNED #(.width(2)) u_eq_257 (
        .y(_node_231),
        .a(2'd3),
        .b(_T_1411)
    );
    wire [63:0] _node_232;
    MUX_UNSIGNED #(.width(64)) u_mux_258 (
        .y(_node_232),
        .sel(_node_231),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_230)
    );
    wire [63:0] _T_1418_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_259 (
        .y(_T_1418_imaginary_node),
        .sel(_T_1362),
        .a(_T_1400_imaginary_node),
        .b(_node_232)
    );
    wire [4:0] _T_1420;
    wire [3:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_260 (
        .y(_WTEMP_8),
        .in(2'h2)
    );
    ADD_UNSIGNED #(.width(4)) u_add_261 (
        .y(_T_1420),
        .a(start),
        .b(_WTEMP_8)
    );
    wire [3:0] _T_1421;
    TAIL #(.width(5), .n(1)) tail_262 (
        .y(_T_1421),
        .in(_T_1420)
    );
    wire _node_233;
    EQ_UNSIGNED #(.width(4)) u_eq_263 (
        .y(_node_233),
        .a(4'd0),
        .b(_T_1421)
    );
    wire [2:0] _node_234;
    assign _node_234 = indices_rom_0;
    wire _node_235;
    EQ_UNSIGNED #(.width(4)) u_eq_264 (
        .y(_node_235),
        .a(4'd1),
        .b(_T_1421)
    );
    wire [2:0] _node_236;
    MUX_UNSIGNED #(.width(3)) u_mux_265 (
        .y(_node_236),
        .sel(_node_235),
        .a(indices_rom_1),
        .b(_node_234)
    );
    wire _node_237;
    EQ_UNSIGNED #(.width(4)) u_eq_266 (
        .y(_node_237),
        .a(4'd2),
        .b(_T_1421)
    );
    wire [2:0] _node_238;
    MUX_UNSIGNED #(.width(3)) u_mux_267 (
        .y(_node_238),
        .sel(_node_237),
        .a(indices_rom_2),
        .b(_node_236)
    );
    wire _node_239;
    EQ_UNSIGNED #(.width(4)) u_eq_268 (
        .y(_node_239),
        .a(4'd3),
        .b(_T_1421)
    );
    wire [2:0] _node_240;
    MUX_UNSIGNED #(.width(3)) u_mux_269 (
        .y(_node_240),
        .sel(_node_239),
        .a(indices_rom_3),
        .b(_node_238)
    );
    wire _node_241;
    EQ_UNSIGNED #(.width(4)) u_eq_270 (
        .y(_node_241),
        .a(4'd4),
        .b(_T_1421)
    );
    wire [2:0] _node_242;
    MUX_UNSIGNED #(.width(3)) u_mux_271 (
        .y(_node_242),
        .sel(_node_241),
        .a(indices_rom_4),
        .b(_node_240)
    );
    wire _node_243;
    EQ_UNSIGNED #(.width(4)) u_eq_272 (
        .y(_node_243),
        .a(4'd5),
        .b(_T_1421)
    );
    wire [2:0] _node_244;
    MUX_UNSIGNED #(.width(3)) u_mux_273 (
        .y(_node_244),
        .sel(_node_243),
        .a(indices_rom_5),
        .b(_node_242)
    );
    wire _node_245;
    EQ_UNSIGNED #(.width(4)) u_eq_274 (
        .y(_node_245),
        .a(4'd6),
        .b(_T_1421)
    );
    wire [2:0] _node_246;
    MUX_UNSIGNED #(.width(3)) u_mux_275 (
        .y(_node_246),
        .sel(_node_245),
        .a(indices_rom_6),
        .b(_node_244)
    );
    wire _node_247;
    EQ_UNSIGNED #(.width(4)) u_eq_276 (
        .y(_node_247),
        .a(4'd7),
        .b(_T_1421)
    );
    wire [2:0] _node_248;
    MUX_UNSIGNED #(.width(3)) u_mux_277 (
        .y(_node_248),
        .sel(_node_247),
        .a(indices_rom_7),
        .b(_node_246)
    );
    wire _node_249;
    EQ_UNSIGNED #(.width(4)) u_eq_278 (
        .y(_node_249),
        .a(4'd8),
        .b(_T_1421)
    );
    wire [2:0] _node_250;
    MUX_UNSIGNED #(.width(3)) u_mux_279 (
        .y(_node_250),
        .sel(_node_249),
        .a(indices_rom_8),
        .b(_node_248)
    );
    wire _node_251;
    EQ_UNSIGNED #(.width(4)) u_eq_280 (
        .y(_node_251),
        .a(4'd9),
        .b(_T_1421)
    );
    wire [2:0] _node_252;
    MUX_UNSIGNED #(.width(3)) u_mux_281 (
        .y(_node_252),
        .sel(_node_251),
        .a(indices_rom_9),
        .b(_node_250)
    );
    wire _node_253;
    EQ_UNSIGNED #(.width(4)) u_eq_282 (
        .y(_node_253),
        .a(4'd10),
        .b(_T_1421)
    );
    wire [2:0] _node_254;
    MUX_UNSIGNED #(.width(3)) u_mux_283 (
        .y(_node_254),
        .sel(_node_253),
        .a(indices_rom_10),
        .b(_node_252)
    );
    wire _node_255;
    EQ_UNSIGNED #(.width(4)) u_eq_284 (
        .y(_node_255),
        .a(4'd11),
        .b(_T_1421)
    );
    wire [2:0] _node_256;
    MUX_UNSIGNED #(.width(3)) u_mux_285 (
        .y(_node_256),
        .sel(_node_255),
        .a(indices_rom_11),
        .b(_node_254)
    );
    wire _node_257;
    EQ_UNSIGNED #(.width(4)) u_eq_286 (
        .y(_node_257),
        .a(4'd12),
        .b(_T_1421)
    );
    wire [2:0] _node_258;
    MUX_UNSIGNED #(.width(3)) u_mux_287 (
        .y(_node_258),
        .sel(_node_257),
        .a(indices_rom_12),
        .b(_node_256)
    );
    wire _node_259;
    EQ_UNSIGNED #(.width(4)) u_eq_288 (
        .y(_node_259),
        .a(4'd13),
        .b(_T_1421)
    );
    wire [2:0] _node_260;
    MUX_UNSIGNED #(.width(3)) u_mux_289 (
        .y(_node_260),
        .sel(_node_259),
        .a(indices_rom_13),
        .b(_node_258)
    );
    wire _T_1423;
    BITS #(.width(3), .high(2), .low(2)) bits_290 (
        .y(_T_1423),
        .in(_node_260)
    );
    wire [4:0] _T_1425;
    wire [3:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_291 (
        .y(_WTEMP_9),
        .in(2'h2)
    );
    ADD_UNSIGNED #(.width(4)) u_add_292 (
        .y(_T_1425),
        .a(start),
        .b(_WTEMP_9)
    );
    wire [3:0] _T_1426;
    TAIL #(.width(5), .n(1)) tail_293 (
        .y(_T_1426),
        .in(_T_1425)
    );
    wire _node_261;
    EQ_UNSIGNED #(.width(4)) u_eq_294 (
        .y(_node_261),
        .a(4'd0),
        .b(_T_1426)
    );
    wire [2:0] _node_262;
    assign _node_262 = indices_rom_0;
    wire _node_263;
    EQ_UNSIGNED #(.width(4)) u_eq_295 (
        .y(_node_263),
        .a(4'd1),
        .b(_T_1426)
    );
    wire [2:0] _node_264;
    MUX_UNSIGNED #(.width(3)) u_mux_296 (
        .y(_node_264),
        .sel(_node_263),
        .a(indices_rom_1),
        .b(_node_262)
    );
    wire _node_265;
    EQ_UNSIGNED #(.width(4)) u_eq_297 (
        .y(_node_265),
        .a(4'd2),
        .b(_T_1426)
    );
    wire [2:0] _node_266;
    MUX_UNSIGNED #(.width(3)) u_mux_298 (
        .y(_node_266),
        .sel(_node_265),
        .a(indices_rom_2),
        .b(_node_264)
    );
    wire _node_267;
    EQ_UNSIGNED #(.width(4)) u_eq_299 (
        .y(_node_267),
        .a(4'd3),
        .b(_T_1426)
    );
    wire [2:0] _node_268;
    MUX_UNSIGNED #(.width(3)) u_mux_300 (
        .y(_node_268),
        .sel(_node_267),
        .a(indices_rom_3),
        .b(_node_266)
    );
    wire _node_269;
    EQ_UNSIGNED #(.width(4)) u_eq_301 (
        .y(_node_269),
        .a(4'd4),
        .b(_T_1426)
    );
    wire [2:0] _node_270;
    MUX_UNSIGNED #(.width(3)) u_mux_302 (
        .y(_node_270),
        .sel(_node_269),
        .a(indices_rom_4),
        .b(_node_268)
    );
    wire _node_271;
    EQ_UNSIGNED #(.width(4)) u_eq_303 (
        .y(_node_271),
        .a(4'd5),
        .b(_T_1426)
    );
    wire [2:0] _node_272;
    MUX_UNSIGNED #(.width(3)) u_mux_304 (
        .y(_node_272),
        .sel(_node_271),
        .a(indices_rom_5),
        .b(_node_270)
    );
    wire _node_273;
    EQ_UNSIGNED #(.width(4)) u_eq_305 (
        .y(_node_273),
        .a(4'd6),
        .b(_T_1426)
    );
    wire [2:0] _node_274;
    MUX_UNSIGNED #(.width(3)) u_mux_306 (
        .y(_node_274),
        .sel(_node_273),
        .a(indices_rom_6),
        .b(_node_272)
    );
    wire _node_275;
    EQ_UNSIGNED #(.width(4)) u_eq_307 (
        .y(_node_275),
        .a(4'd7),
        .b(_T_1426)
    );
    wire [2:0] _node_276;
    MUX_UNSIGNED #(.width(3)) u_mux_308 (
        .y(_node_276),
        .sel(_node_275),
        .a(indices_rom_7),
        .b(_node_274)
    );
    wire _node_277;
    EQ_UNSIGNED #(.width(4)) u_eq_309 (
        .y(_node_277),
        .a(4'd8),
        .b(_T_1426)
    );
    wire [2:0] _node_278;
    MUX_UNSIGNED #(.width(3)) u_mux_310 (
        .y(_node_278),
        .sel(_node_277),
        .a(indices_rom_8),
        .b(_node_276)
    );
    wire _node_279;
    EQ_UNSIGNED #(.width(4)) u_eq_311 (
        .y(_node_279),
        .a(4'd9),
        .b(_T_1426)
    );
    wire [2:0] _node_280;
    MUX_UNSIGNED #(.width(3)) u_mux_312 (
        .y(_node_280),
        .sel(_node_279),
        .a(indices_rom_9),
        .b(_node_278)
    );
    wire _node_281;
    EQ_UNSIGNED #(.width(4)) u_eq_313 (
        .y(_node_281),
        .a(4'd10),
        .b(_T_1426)
    );
    wire [2:0] _node_282;
    MUX_UNSIGNED #(.width(3)) u_mux_314 (
        .y(_node_282),
        .sel(_node_281),
        .a(indices_rom_10),
        .b(_node_280)
    );
    wire _node_283;
    EQ_UNSIGNED #(.width(4)) u_eq_315 (
        .y(_node_283),
        .a(4'd11),
        .b(_T_1426)
    );
    wire [2:0] _node_284;
    MUX_UNSIGNED #(.width(3)) u_mux_316 (
        .y(_node_284),
        .sel(_node_283),
        .a(indices_rom_11),
        .b(_node_282)
    );
    wire _node_285;
    EQ_UNSIGNED #(.width(4)) u_eq_317 (
        .y(_node_285),
        .a(4'd12),
        .b(_T_1426)
    );
    wire [2:0] _node_286;
    MUX_UNSIGNED #(.width(3)) u_mux_318 (
        .y(_node_286),
        .sel(_node_285),
        .a(indices_rom_12),
        .b(_node_284)
    );
    wire _node_287;
    EQ_UNSIGNED #(.width(4)) u_eq_319 (
        .y(_node_287),
        .a(4'd13),
        .b(_T_1426)
    );
    wire [2:0] _node_288;
    MUX_UNSIGNED #(.width(3)) u_mux_320 (
        .y(_node_288),
        .sel(_node_287),
        .a(indices_rom_13),
        .b(_node_286)
    );
    wire [1:0] _T_1428;
    BITS #(.width(3), .high(1), .low(0)) bits_321 (
        .y(_T_1428),
        .in(_node_288)
    );
    wire [63:0] _T_1438_node;
    wire [63:0] _BBFSubtract_2_1__out;
    wire [63:0] _BBFSubtract_2_1__in2;
    wire [63:0] _BBFSubtract_2_1__in1;
    BBFSubtract BBFSubtract_2_1 (
        .out(_BBFSubtract_2_1__out),
        .in2(_BBFSubtract_2_1__in2),
        .in1(_BBFSubtract_2_1__in1)
    );
    wire _node_289;
    EQ_UNSIGNED #(.width(2)) u_eq_322 (
        .y(_node_289),
        .a(2'd0),
        .b(_T_1428)
    );
    wire [63:0] _node_290;
    assign _node_290 = twiddle_rom_0_real_node;
    wire _node_291;
    EQ_UNSIGNED #(.width(2)) u_eq_323 (
        .y(_node_291),
        .a(2'd1),
        .b(_T_1428)
    );
    wire [63:0] _node_292;
    MUX_UNSIGNED #(.width(64)) u_mux_324 (
        .y(_node_292),
        .sel(_node_291),
        .a(twiddle_rom_1_real_node),
        .b(_node_290)
    );
    wire _node_293;
    EQ_UNSIGNED #(.width(2)) u_eq_325 (
        .y(_node_293),
        .a(2'd2),
        .b(_T_1428)
    );
    wire [63:0] _node_294;
    MUX_UNSIGNED #(.width(64)) u_mux_326 (
        .y(_node_294),
        .sel(_node_293),
        .a(twiddle_rom_2_real_node),
        .b(_node_292)
    );
    wire _node_295;
    EQ_UNSIGNED #(.width(2)) u_eq_327 (
        .y(_node_295),
        .a(2'd3),
        .b(_T_1428)
    );
    wire [63:0] _node_296;
    MUX_UNSIGNED #(.width(64)) u_mux_328 (
        .y(_node_296),
        .sel(_node_295),
        .a(twiddle_rom_3_real_node),
        .b(_node_294)
    );
    wire [63:0] _T_1445_node;
    wire [63:0] _T_1461_real_node;
    wire [63:0] _T_1461_imaginary_node;
    wire _node_297;
    EQ_UNSIGNED #(.width(2)) u_eq_329 (
        .y(_node_297),
        .a(2'd0),
        .b(_T_1428)
    );
    wire [63:0] _node_298;
    assign _node_298 = twiddle_rom_0_imaginary_node;
    wire _node_299;
    EQ_UNSIGNED #(.width(2)) u_eq_330 (
        .y(_node_299),
        .a(2'd1),
        .b(_T_1428)
    );
    wire [63:0] _node_300;
    MUX_UNSIGNED #(.width(64)) u_mux_331 (
        .y(_node_300),
        .sel(_node_299),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_298)
    );
    wire _node_301;
    EQ_UNSIGNED #(.width(2)) u_eq_332 (
        .y(_node_301),
        .a(2'd2),
        .b(_T_1428)
    );
    wire [63:0] _node_302;
    MUX_UNSIGNED #(.width(64)) u_mux_333 (
        .y(_node_302),
        .sel(_node_301),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_300)
    );
    wire _node_303;
    EQ_UNSIGNED #(.width(2)) u_eq_334 (
        .y(_node_303),
        .a(2'd3),
        .b(_T_1428)
    );
    wire [63:0] _node_304;
    MUX_UNSIGNED #(.width(64)) u_mux_335 (
        .y(_node_304),
        .sel(_node_303),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_302)
    );
    wire [4:0] _T_1463;
    wire [3:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_336 (
        .y(_WTEMP_10),
        .in(2'h2)
    );
    ADD_UNSIGNED #(.width(4)) u_add_337 (
        .y(_T_1463),
        .a(start),
        .b(_WTEMP_10)
    );
    wire [3:0] _T_1464;
    TAIL #(.width(5), .n(1)) tail_338 (
        .y(_T_1464),
        .in(_T_1463)
    );
    wire _node_305;
    EQ_UNSIGNED #(.width(4)) u_eq_339 (
        .y(_node_305),
        .a(4'd0),
        .b(_T_1464)
    );
    wire [2:0] _node_306;
    assign _node_306 = indices_rom_0;
    wire _node_307;
    EQ_UNSIGNED #(.width(4)) u_eq_340 (
        .y(_node_307),
        .a(4'd1),
        .b(_T_1464)
    );
    wire [2:0] _node_308;
    MUX_UNSIGNED #(.width(3)) u_mux_341 (
        .y(_node_308),
        .sel(_node_307),
        .a(indices_rom_1),
        .b(_node_306)
    );
    wire _node_309;
    EQ_UNSIGNED #(.width(4)) u_eq_342 (
        .y(_node_309),
        .a(4'd2),
        .b(_T_1464)
    );
    wire [2:0] _node_310;
    MUX_UNSIGNED #(.width(3)) u_mux_343 (
        .y(_node_310),
        .sel(_node_309),
        .a(indices_rom_2),
        .b(_node_308)
    );
    wire _node_311;
    EQ_UNSIGNED #(.width(4)) u_eq_344 (
        .y(_node_311),
        .a(4'd3),
        .b(_T_1464)
    );
    wire [2:0] _node_312;
    MUX_UNSIGNED #(.width(3)) u_mux_345 (
        .y(_node_312),
        .sel(_node_311),
        .a(indices_rom_3),
        .b(_node_310)
    );
    wire _node_313;
    EQ_UNSIGNED #(.width(4)) u_eq_346 (
        .y(_node_313),
        .a(4'd4),
        .b(_T_1464)
    );
    wire [2:0] _node_314;
    MUX_UNSIGNED #(.width(3)) u_mux_347 (
        .y(_node_314),
        .sel(_node_313),
        .a(indices_rom_4),
        .b(_node_312)
    );
    wire _node_315;
    EQ_UNSIGNED #(.width(4)) u_eq_348 (
        .y(_node_315),
        .a(4'd5),
        .b(_T_1464)
    );
    wire [2:0] _node_316;
    MUX_UNSIGNED #(.width(3)) u_mux_349 (
        .y(_node_316),
        .sel(_node_315),
        .a(indices_rom_5),
        .b(_node_314)
    );
    wire _node_317;
    EQ_UNSIGNED #(.width(4)) u_eq_350 (
        .y(_node_317),
        .a(4'd6),
        .b(_T_1464)
    );
    wire [2:0] _node_318;
    MUX_UNSIGNED #(.width(3)) u_mux_351 (
        .y(_node_318),
        .sel(_node_317),
        .a(indices_rom_6),
        .b(_node_316)
    );
    wire _node_319;
    EQ_UNSIGNED #(.width(4)) u_eq_352 (
        .y(_node_319),
        .a(4'd7),
        .b(_T_1464)
    );
    wire [2:0] _node_320;
    MUX_UNSIGNED #(.width(3)) u_mux_353 (
        .y(_node_320),
        .sel(_node_319),
        .a(indices_rom_7),
        .b(_node_318)
    );
    wire _node_321;
    EQ_UNSIGNED #(.width(4)) u_eq_354 (
        .y(_node_321),
        .a(4'd8),
        .b(_T_1464)
    );
    wire [2:0] _node_322;
    MUX_UNSIGNED #(.width(3)) u_mux_355 (
        .y(_node_322),
        .sel(_node_321),
        .a(indices_rom_8),
        .b(_node_320)
    );
    wire _node_323;
    EQ_UNSIGNED #(.width(4)) u_eq_356 (
        .y(_node_323),
        .a(4'd9),
        .b(_T_1464)
    );
    wire [2:0] _node_324;
    MUX_UNSIGNED #(.width(3)) u_mux_357 (
        .y(_node_324),
        .sel(_node_323),
        .a(indices_rom_9),
        .b(_node_322)
    );
    wire _node_325;
    EQ_UNSIGNED #(.width(4)) u_eq_358 (
        .y(_node_325),
        .a(4'd10),
        .b(_T_1464)
    );
    wire [2:0] _node_326;
    MUX_UNSIGNED #(.width(3)) u_mux_359 (
        .y(_node_326),
        .sel(_node_325),
        .a(indices_rom_10),
        .b(_node_324)
    );
    wire _node_327;
    EQ_UNSIGNED #(.width(4)) u_eq_360 (
        .y(_node_327),
        .a(4'd11),
        .b(_T_1464)
    );
    wire [2:0] _node_328;
    MUX_UNSIGNED #(.width(3)) u_mux_361 (
        .y(_node_328),
        .sel(_node_327),
        .a(indices_rom_11),
        .b(_node_326)
    );
    wire _node_329;
    EQ_UNSIGNED #(.width(4)) u_eq_362 (
        .y(_node_329),
        .a(4'd12),
        .b(_T_1464)
    );
    wire [2:0] _node_330;
    MUX_UNSIGNED #(.width(3)) u_mux_363 (
        .y(_node_330),
        .sel(_node_329),
        .a(indices_rom_12),
        .b(_node_328)
    );
    wire _node_331;
    EQ_UNSIGNED #(.width(4)) u_eq_364 (
        .y(_node_331),
        .a(4'd13),
        .b(_T_1464)
    );
    wire [2:0] _node_332;
    MUX_UNSIGNED #(.width(3)) u_mux_365 (
        .y(_node_332),
        .sel(_node_331),
        .a(indices_rom_13),
        .b(_node_330)
    );
    wire [1:0] _T_1472;
    BITS #(.width(3), .high(1), .low(0)) bits_366 (
        .y(_T_1472),
        .in(_node_332)
    );
    wire _node_333;
    EQ_UNSIGNED #(.width(2)) u_eq_367 (
        .y(_node_333),
        .a(2'd0),
        .b(_T_1472)
    );
    wire [63:0] _node_334;
    assign _node_334 = twiddle_rom_0_real_node;
    wire _node_335;
    EQ_UNSIGNED #(.width(2)) u_eq_368 (
        .y(_node_335),
        .a(2'd1),
        .b(_T_1472)
    );
    wire [63:0] _node_336;
    MUX_UNSIGNED #(.width(64)) u_mux_369 (
        .y(_node_336),
        .sel(_node_335),
        .a(twiddle_rom_1_real_node),
        .b(_node_334)
    );
    wire _node_337;
    EQ_UNSIGNED #(.width(2)) u_eq_370 (
        .y(_node_337),
        .a(2'd2),
        .b(_T_1472)
    );
    wire [63:0] _node_338;
    MUX_UNSIGNED #(.width(64)) u_mux_371 (
        .y(_node_338),
        .sel(_node_337),
        .a(twiddle_rom_2_real_node),
        .b(_node_336)
    );
    wire _node_339;
    EQ_UNSIGNED #(.width(2)) u_eq_372 (
        .y(_node_339),
        .a(2'd3),
        .b(_T_1472)
    );
    wire [63:0] _node_340;
    MUX_UNSIGNED #(.width(64)) u_mux_373 (
        .y(_node_340),
        .sel(_node_339),
        .a(twiddle_rom_3_real_node),
        .b(_node_338)
    );
    wire [63:0] _T_1479_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_374 (
        .y(_T_1479_real_node),
        .sel(_T_1423),
        .a(_T_1461_real_node),
        .b(_node_340)
    );
    wire _node_341;
    EQ_UNSIGNED #(.width(2)) u_eq_375 (
        .y(_node_341),
        .a(2'd0),
        .b(_T_1472)
    );
    wire [63:0] _node_342;
    assign _node_342 = twiddle_rom_0_imaginary_node;
    wire _node_343;
    EQ_UNSIGNED #(.width(2)) u_eq_376 (
        .y(_node_343),
        .a(2'd1),
        .b(_T_1472)
    );
    wire [63:0] _node_344;
    MUX_UNSIGNED #(.width(64)) u_mux_377 (
        .y(_node_344),
        .sel(_node_343),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_342)
    );
    wire _node_345;
    EQ_UNSIGNED #(.width(2)) u_eq_378 (
        .y(_node_345),
        .a(2'd2),
        .b(_T_1472)
    );
    wire [63:0] _node_346;
    MUX_UNSIGNED #(.width(64)) u_mux_379 (
        .y(_node_346),
        .sel(_node_345),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_344)
    );
    wire _node_347;
    EQ_UNSIGNED #(.width(2)) u_eq_380 (
        .y(_node_347),
        .a(2'd3),
        .b(_T_1472)
    );
    wire [63:0] _node_348;
    MUX_UNSIGNED #(.width(64)) u_mux_381 (
        .y(_node_348),
        .sel(_node_347),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_346)
    );
    wire [63:0] _T_1479_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_382 (
        .y(_T_1479_imaginary_node),
        .sel(_T_1423),
        .a(_T_1461_imaginary_node),
        .b(_node_348)
    );
    wire [4:0] _T_1481;
    wire [3:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_383 (
        .y(_WTEMP_11),
        .in(2'h3)
    );
    ADD_UNSIGNED #(.width(4)) u_add_384 (
        .y(_T_1481),
        .a(start),
        .b(_WTEMP_11)
    );
    wire [3:0] _T_1482;
    TAIL #(.width(5), .n(1)) tail_385 (
        .y(_T_1482),
        .in(_T_1481)
    );
    wire _node_349;
    EQ_UNSIGNED #(.width(4)) u_eq_386 (
        .y(_node_349),
        .a(4'd0),
        .b(_T_1482)
    );
    wire [2:0] _node_350;
    assign _node_350 = indices_rom_0;
    wire _node_351;
    EQ_UNSIGNED #(.width(4)) u_eq_387 (
        .y(_node_351),
        .a(4'd1),
        .b(_T_1482)
    );
    wire [2:0] _node_352;
    MUX_UNSIGNED #(.width(3)) u_mux_388 (
        .y(_node_352),
        .sel(_node_351),
        .a(indices_rom_1),
        .b(_node_350)
    );
    wire _node_353;
    EQ_UNSIGNED #(.width(4)) u_eq_389 (
        .y(_node_353),
        .a(4'd2),
        .b(_T_1482)
    );
    wire [2:0] _node_354;
    MUX_UNSIGNED #(.width(3)) u_mux_390 (
        .y(_node_354),
        .sel(_node_353),
        .a(indices_rom_2),
        .b(_node_352)
    );
    wire _node_355;
    EQ_UNSIGNED #(.width(4)) u_eq_391 (
        .y(_node_355),
        .a(4'd3),
        .b(_T_1482)
    );
    wire [2:0] _node_356;
    MUX_UNSIGNED #(.width(3)) u_mux_392 (
        .y(_node_356),
        .sel(_node_355),
        .a(indices_rom_3),
        .b(_node_354)
    );
    wire _node_357;
    EQ_UNSIGNED #(.width(4)) u_eq_393 (
        .y(_node_357),
        .a(4'd4),
        .b(_T_1482)
    );
    wire [2:0] _node_358;
    MUX_UNSIGNED #(.width(3)) u_mux_394 (
        .y(_node_358),
        .sel(_node_357),
        .a(indices_rom_4),
        .b(_node_356)
    );
    wire _node_359;
    EQ_UNSIGNED #(.width(4)) u_eq_395 (
        .y(_node_359),
        .a(4'd5),
        .b(_T_1482)
    );
    wire [2:0] _node_360;
    MUX_UNSIGNED #(.width(3)) u_mux_396 (
        .y(_node_360),
        .sel(_node_359),
        .a(indices_rom_5),
        .b(_node_358)
    );
    wire _node_361;
    EQ_UNSIGNED #(.width(4)) u_eq_397 (
        .y(_node_361),
        .a(4'd6),
        .b(_T_1482)
    );
    wire [2:0] _node_362;
    MUX_UNSIGNED #(.width(3)) u_mux_398 (
        .y(_node_362),
        .sel(_node_361),
        .a(indices_rom_6),
        .b(_node_360)
    );
    wire _node_363;
    EQ_UNSIGNED #(.width(4)) u_eq_399 (
        .y(_node_363),
        .a(4'd7),
        .b(_T_1482)
    );
    wire [2:0] _node_364;
    MUX_UNSIGNED #(.width(3)) u_mux_400 (
        .y(_node_364),
        .sel(_node_363),
        .a(indices_rom_7),
        .b(_node_362)
    );
    wire _node_365;
    EQ_UNSIGNED #(.width(4)) u_eq_401 (
        .y(_node_365),
        .a(4'd8),
        .b(_T_1482)
    );
    wire [2:0] _node_366;
    MUX_UNSIGNED #(.width(3)) u_mux_402 (
        .y(_node_366),
        .sel(_node_365),
        .a(indices_rom_8),
        .b(_node_364)
    );
    wire _node_367;
    EQ_UNSIGNED #(.width(4)) u_eq_403 (
        .y(_node_367),
        .a(4'd9),
        .b(_T_1482)
    );
    wire [2:0] _node_368;
    MUX_UNSIGNED #(.width(3)) u_mux_404 (
        .y(_node_368),
        .sel(_node_367),
        .a(indices_rom_9),
        .b(_node_366)
    );
    wire _node_369;
    EQ_UNSIGNED #(.width(4)) u_eq_405 (
        .y(_node_369),
        .a(4'd10),
        .b(_T_1482)
    );
    wire [2:0] _node_370;
    MUX_UNSIGNED #(.width(3)) u_mux_406 (
        .y(_node_370),
        .sel(_node_369),
        .a(indices_rom_10),
        .b(_node_368)
    );
    wire _node_371;
    EQ_UNSIGNED #(.width(4)) u_eq_407 (
        .y(_node_371),
        .a(4'd11),
        .b(_T_1482)
    );
    wire [2:0] _node_372;
    MUX_UNSIGNED #(.width(3)) u_mux_408 (
        .y(_node_372),
        .sel(_node_371),
        .a(indices_rom_11),
        .b(_node_370)
    );
    wire _node_373;
    EQ_UNSIGNED #(.width(4)) u_eq_409 (
        .y(_node_373),
        .a(4'd12),
        .b(_T_1482)
    );
    wire [2:0] _node_374;
    MUX_UNSIGNED #(.width(3)) u_mux_410 (
        .y(_node_374),
        .sel(_node_373),
        .a(indices_rom_12),
        .b(_node_372)
    );
    wire _node_375;
    EQ_UNSIGNED #(.width(4)) u_eq_411 (
        .y(_node_375),
        .a(4'd13),
        .b(_T_1482)
    );
    wire [2:0] _node_376;
    MUX_UNSIGNED #(.width(3)) u_mux_412 (
        .y(_node_376),
        .sel(_node_375),
        .a(indices_rom_13),
        .b(_node_374)
    );
    wire _T_1484;
    BITS #(.width(3), .high(2), .low(2)) bits_413 (
        .y(_T_1484),
        .in(_node_376)
    );
    wire [4:0] _T_1486;
    wire [3:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_414 (
        .y(_WTEMP_12),
        .in(2'h3)
    );
    ADD_UNSIGNED #(.width(4)) u_add_415 (
        .y(_T_1486),
        .a(start),
        .b(_WTEMP_12)
    );
    wire [3:0] _T_1487;
    TAIL #(.width(5), .n(1)) tail_416 (
        .y(_T_1487),
        .in(_T_1486)
    );
    wire _node_377;
    EQ_UNSIGNED #(.width(4)) u_eq_417 (
        .y(_node_377),
        .a(4'd0),
        .b(_T_1487)
    );
    wire [2:0] _node_378;
    assign _node_378 = indices_rom_0;
    wire _node_379;
    EQ_UNSIGNED #(.width(4)) u_eq_418 (
        .y(_node_379),
        .a(4'd1),
        .b(_T_1487)
    );
    wire [2:0] _node_380;
    MUX_UNSIGNED #(.width(3)) u_mux_419 (
        .y(_node_380),
        .sel(_node_379),
        .a(indices_rom_1),
        .b(_node_378)
    );
    wire _node_381;
    EQ_UNSIGNED #(.width(4)) u_eq_420 (
        .y(_node_381),
        .a(4'd2),
        .b(_T_1487)
    );
    wire [2:0] _node_382;
    MUX_UNSIGNED #(.width(3)) u_mux_421 (
        .y(_node_382),
        .sel(_node_381),
        .a(indices_rom_2),
        .b(_node_380)
    );
    wire _node_383;
    EQ_UNSIGNED #(.width(4)) u_eq_422 (
        .y(_node_383),
        .a(4'd3),
        .b(_T_1487)
    );
    wire [2:0] _node_384;
    MUX_UNSIGNED #(.width(3)) u_mux_423 (
        .y(_node_384),
        .sel(_node_383),
        .a(indices_rom_3),
        .b(_node_382)
    );
    wire _node_385;
    EQ_UNSIGNED #(.width(4)) u_eq_424 (
        .y(_node_385),
        .a(4'd4),
        .b(_T_1487)
    );
    wire [2:0] _node_386;
    MUX_UNSIGNED #(.width(3)) u_mux_425 (
        .y(_node_386),
        .sel(_node_385),
        .a(indices_rom_4),
        .b(_node_384)
    );
    wire _node_387;
    EQ_UNSIGNED #(.width(4)) u_eq_426 (
        .y(_node_387),
        .a(4'd5),
        .b(_T_1487)
    );
    wire [2:0] _node_388;
    MUX_UNSIGNED #(.width(3)) u_mux_427 (
        .y(_node_388),
        .sel(_node_387),
        .a(indices_rom_5),
        .b(_node_386)
    );
    wire _node_389;
    EQ_UNSIGNED #(.width(4)) u_eq_428 (
        .y(_node_389),
        .a(4'd6),
        .b(_T_1487)
    );
    wire [2:0] _node_390;
    MUX_UNSIGNED #(.width(3)) u_mux_429 (
        .y(_node_390),
        .sel(_node_389),
        .a(indices_rom_6),
        .b(_node_388)
    );
    wire _node_391;
    EQ_UNSIGNED #(.width(4)) u_eq_430 (
        .y(_node_391),
        .a(4'd7),
        .b(_T_1487)
    );
    wire [2:0] _node_392;
    MUX_UNSIGNED #(.width(3)) u_mux_431 (
        .y(_node_392),
        .sel(_node_391),
        .a(indices_rom_7),
        .b(_node_390)
    );
    wire _node_393;
    EQ_UNSIGNED #(.width(4)) u_eq_432 (
        .y(_node_393),
        .a(4'd8),
        .b(_T_1487)
    );
    wire [2:0] _node_394;
    MUX_UNSIGNED #(.width(3)) u_mux_433 (
        .y(_node_394),
        .sel(_node_393),
        .a(indices_rom_8),
        .b(_node_392)
    );
    wire _node_395;
    EQ_UNSIGNED #(.width(4)) u_eq_434 (
        .y(_node_395),
        .a(4'd9),
        .b(_T_1487)
    );
    wire [2:0] _node_396;
    MUX_UNSIGNED #(.width(3)) u_mux_435 (
        .y(_node_396),
        .sel(_node_395),
        .a(indices_rom_9),
        .b(_node_394)
    );
    wire _node_397;
    EQ_UNSIGNED #(.width(4)) u_eq_436 (
        .y(_node_397),
        .a(4'd10),
        .b(_T_1487)
    );
    wire [2:0] _node_398;
    MUX_UNSIGNED #(.width(3)) u_mux_437 (
        .y(_node_398),
        .sel(_node_397),
        .a(indices_rom_10),
        .b(_node_396)
    );
    wire _node_399;
    EQ_UNSIGNED #(.width(4)) u_eq_438 (
        .y(_node_399),
        .a(4'd11),
        .b(_T_1487)
    );
    wire [2:0] _node_400;
    MUX_UNSIGNED #(.width(3)) u_mux_439 (
        .y(_node_400),
        .sel(_node_399),
        .a(indices_rom_11),
        .b(_node_398)
    );
    wire _node_401;
    EQ_UNSIGNED #(.width(4)) u_eq_440 (
        .y(_node_401),
        .a(4'd12),
        .b(_T_1487)
    );
    wire [2:0] _node_402;
    MUX_UNSIGNED #(.width(3)) u_mux_441 (
        .y(_node_402),
        .sel(_node_401),
        .a(indices_rom_12),
        .b(_node_400)
    );
    wire _node_403;
    EQ_UNSIGNED #(.width(4)) u_eq_442 (
        .y(_node_403),
        .a(4'd13),
        .b(_T_1487)
    );
    wire [2:0] _node_404;
    MUX_UNSIGNED #(.width(3)) u_mux_443 (
        .y(_node_404),
        .sel(_node_403),
        .a(indices_rom_13),
        .b(_node_402)
    );
    wire [1:0] _T_1489;
    BITS #(.width(3), .high(1), .low(0)) bits_444 (
        .y(_T_1489),
        .in(_node_404)
    );
    wire [63:0] _T_1499_node;
    wire [63:0] _BBFSubtract_3_1__out;
    wire [63:0] _BBFSubtract_3_1__in2;
    wire [63:0] _BBFSubtract_3_1__in1;
    BBFSubtract BBFSubtract_3_1 (
        .out(_BBFSubtract_3_1__out),
        .in2(_BBFSubtract_3_1__in2),
        .in1(_BBFSubtract_3_1__in1)
    );
    wire _node_405;
    EQ_UNSIGNED #(.width(2)) u_eq_445 (
        .y(_node_405),
        .a(2'd0),
        .b(_T_1489)
    );
    wire [63:0] _node_406;
    assign _node_406 = twiddle_rom_0_real_node;
    wire _node_407;
    EQ_UNSIGNED #(.width(2)) u_eq_446 (
        .y(_node_407),
        .a(2'd1),
        .b(_T_1489)
    );
    wire [63:0] _node_408;
    MUX_UNSIGNED #(.width(64)) u_mux_447 (
        .y(_node_408),
        .sel(_node_407),
        .a(twiddle_rom_1_real_node),
        .b(_node_406)
    );
    wire _node_409;
    EQ_UNSIGNED #(.width(2)) u_eq_448 (
        .y(_node_409),
        .a(2'd2),
        .b(_T_1489)
    );
    wire [63:0] _node_410;
    MUX_UNSIGNED #(.width(64)) u_mux_449 (
        .y(_node_410),
        .sel(_node_409),
        .a(twiddle_rom_2_real_node),
        .b(_node_408)
    );
    wire _node_411;
    EQ_UNSIGNED #(.width(2)) u_eq_450 (
        .y(_node_411),
        .a(2'd3),
        .b(_T_1489)
    );
    wire [63:0] _node_412;
    MUX_UNSIGNED #(.width(64)) u_mux_451 (
        .y(_node_412),
        .sel(_node_411),
        .a(twiddle_rom_3_real_node),
        .b(_node_410)
    );
    wire [63:0] _T_1506_node;
    wire [63:0] _T_1522_real_node;
    wire [63:0] _T_1522_imaginary_node;
    wire _node_413;
    EQ_UNSIGNED #(.width(2)) u_eq_452 (
        .y(_node_413),
        .a(2'd0),
        .b(_T_1489)
    );
    wire [63:0] _node_414;
    assign _node_414 = twiddle_rom_0_imaginary_node;
    wire _node_415;
    EQ_UNSIGNED #(.width(2)) u_eq_453 (
        .y(_node_415),
        .a(2'd1),
        .b(_T_1489)
    );
    wire [63:0] _node_416;
    MUX_UNSIGNED #(.width(64)) u_mux_454 (
        .y(_node_416),
        .sel(_node_415),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_414)
    );
    wire _node_417;
    EQ_UNSIGNED #(.width(2)) u_eq_455 (
        .y(_node_417),
        .a(2'd2),
        .b(_T_1489)
    );
    wire [63:0] _node_418;
    MUX_UNSIGNED #(.width(64)) u_mux_456 (
        .y(_node_418),
        .sel(_node_417),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_416)
    );
    wire _node_419;
    EQ_UNSIGNED #(.width(2)) u_eq_457 (
        .y(_node_419),
        .a(2'd3),
        .b(_T_1489)
    );
    wire [63:0] _node_420;
    MUX_UNSIGNED #(.width(64)) u_mux_458 (
        .y(_node_420),
        .sel(_node_419),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_418)
    );
    wire [4:0] _T_1524;
    wire [3:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_459 (
        .y(_WTEMP_13),
        .in(2'h3)
    );
    ADD_UNSIGNED #(.width(4)) u_add_460 (
        .y(_T_1524),
        .a(start),
        .b(_WTEMP_13)
    );
    wire [3:0] _T_1525;
    TAIL #(.width(5), .n(1)) tail_461 (
        .y(_T_1525),
        .in(_T_1524)
    );
    wire _node_421;
    EQ_UNSIGNED #(.width(4)) u_eq_462 (
        .y(_node_421),
        .a(4'd0),
        .b(_T_1525)
    );
    wire [2:0] _node_422;
    assign _node_422 = indices_rom_0;
    wire _node_423;
    EQ_UNSIGNED #(.width(4)) u_eq_463 (
        .y(_node_423),
        .a(4'd1),
        .b(_T_1525)
    );
    wire [2:0] _node_424;
    MUX_UNSIGNED #(.width(3)) u_mux_464 (
        .y(_node_424),
        .sel(_node_423),
        .a(indices_rom_1),
        .b(_node_422)
    );
    wire _node_425;
    EQ_UNSIGNED #(.width(4)) u_eq_465 (
        .y(_node_425),
        .a(4'd2),
        .b(_T_1525)
    );
    wire [2:0] _node_426;
    MUX_UNSIGNED #(.width(3)) u_mux_466 (
        .y(_node_426),
        .sel(_node_425),
        .a(indices_rom_2),
        .b(_node_424)
    );
    wire _node_427;
    EQ_UNSIGNED #(.width(4)) u_eq_467 (
        .y(_node_427),
        .a(4'd3),
        .b(_T_1525)
    );
    wire [2:0] _node_428;
    MUX_UNSIGNED #(.width(3)) u_mux_468 (
        .y(_node_428),
        .sel(_node_427),
        .a(indices_rom_3),
        .b(_node_426)
    );
    wire _node_429;
    EQ_UNSIGNED #(.width(4)) u_eq_469 (
        .y(_node_429),
        .a(4'd4),
        .b(_T_1525)
    );
    wire [2:0] _node_430;
    MUX_UNSIGNED #(.width(3)) u_mux_470 (
        .y(_node_430),
        .sel(_node_429),
        .a(indices_rom_4),
        .b(_node_428)
    );
    wire _node_431;
    EQ_UNSIGNED #(.width(4)) u_eq_471 (
        .y(_node_431),
        .a(4'd5),
        .b(_T_1525)
    );
    wire [2:0] _node_432;
    MUX_UNSIGNED #(.width(3)) u_mux_472 (
        .y(_node_432),
        .sel(_node_431),
        .a(indices_rom_5),
        .b(_node_430)
    );
    wire _node_433;
    EQ_UNSIGNED #(.width(4)) u_eq_473 (
        .y(_node_433),
        .a(4'd6),
        .b(_T_1525)
    );
    wire [2:0] _node_434;
    MUX_UNSIGNED #(.width(3)) u_mux_474 (
        .y(_node_434),
        .sel(_node_433),
        .a(indices_rom_6),
        .b(_node_432)
    );
    wire _node_435;
    EQ_UNSIGNED #(.width(4)) u_eq_475 (
        .y(_node_435),
        .a(4'd7),
        .b(_T_1525)
    );
    wire [2:0] _node_436;
    MUX_UNSIGNED #(.width(3)) u_mux_476 (
        .y(_node_436),
        .sel(_node_435),
        .a(indices_rom_7),
        .b(_node_434)
    );
    wire _node_437;
    EQ_UNSIGNED #(.width(4)) u_eq_477 (
        .y(_node_437),
        .a(4'd8),
        .b(_T_1525)
    );
    wire [2:0] _node_438;
    MUX_UNSIGNED #(.width(3)) u_mux_478 (
        .y(_node_438),
        .sel(_node_437),
        .a(indices_rom_8),
        .b(_node_436)
    );
    wire _node_439;
    EQ_UNSIGNED #(.width(4)) u_eq_479 (
        .y(_node_439),
        .a(4'd9),
        .b(_T_1525)
    );
    wire [2:0] _node_440;
    MUX_UNSIGNED #(.width(3)) u_mux_480 (
        .y(_node_440),
        .sel(_node_439),
        .a(indices_rom_9),
        .b(_node_438)
    );
    wire _node_441;
    EQ_UNSIGNED #(.width(4)) u_eq_481 (
        .y(_node_441),
        .a(4'd10),
        .b(_T_1525)
    );
    wire [2:0] _node_442;
    MUX_UNSIGNED #(.width(3)) u_mux_482 (
        .y(_node_442),
        .sel(_node_441),
        .a(indices_rom_10),
        .b(_node_440)
    );
    wire _node_443;
    EQ_UNSIGNED #(.width(4)) u_eq_483 (
        .y(_node_443),
        .a(4'd11),
        .b(_T_1525)
    );
    wire [2:0] _node_444;
    MUX_UNSIGNED #(.width(3)) u_mux_484 (
        .y(_node_444),
        .sel(_node_443),
        .a(indices_rom_11),
        .b(_node_442)
    );
    wire _node_445;
    EQ_UNSIGNED #(.width(4)) u_eq_485 (
        .y(_node_445),
        .a(4'd12),
        .b(_T_1525)
    );
    wire [2:0] _node_446;
    MUX_UNSIGNED #(.width(3)) u_mux_486 (
        .y(_node_446),
        .sel(_node_445),
        .a(indices_rom_12),
        .b(_node_444)
    );
    wire _node_447;
    EQ_UNSIGNED #(.width(4)) u_eq_487 (
        .y(_node_447),
        .a(4'd13),
        .b(_T_1525)
    );
    wire [2:0] _node_448;
    MUX_UNSIGNED #(.width(3)) u_mux_488 (
        .y(_node_448),
        .sel(_node_447),
        .a(indices_rom_13),
        .b(_node_446)
    );
    wire [1:0] _T_1533;
    BITS #(.width(3), .high(1), .low(0)) bits_489 (
        .y(_T_1533),
        .in(_node_448)
    );
    wire _node_449;
    EQ_UNSIGNED #(.width(2)) u_eq_490 (
        .y(_node_449),
        .a(2'd0),
        .b(_T_1533)
    );
    wire [63:0] _node_450;
    assign _node_450 = twiddle_rom_0_real_node;
    wire _node_451;
    EQ_UNSIGNED #(.width(2)) u_eq_491 (
        .y(_node_451),
        .a(2'd1),
        .b(_T_1533)
    );
    wire [63:0] _node_452;
    MUX_UNSIGNED #(.width(64)) u_mux_492 (
        .y(_node_452),
        .sel(_node_451),
        .a(twiddle_rom_1_real_node),
        .b(_node_450)
    );
    wire _node_453;
    EQ_UNSIGNED #(.width(2)) u_eq_493 (
        .y(_node_453),
        .a(2'd2),
        .b(_T_1533)
    );
    wire [63:0] _node_454;
    MUX_UNSIGNED #(.width(64)) u_mux_494 (
        .y(_node_454),
        .sel(_node_453),
        .a(twiddle_rom_2_real_node),
        .b(_node_452)
    );
    wire _node_455;
    EQ_UNSIGNED #(.width(2)) u_eq_495 (
        .y(_node_455),
        .a(2'd3),
        .b(_T_1533)
    );
    wire [63:0] _node_456;
    MUX_UNSIGNED #(.width(64)) u_mux_496 (
        .y(_node_456),
        .sel(_node_455),
        .a(twiddle_rom_3_real_node),
        .b(_node_454)
    );
    wire [63:0] _T_1540_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_497 (
        .y(_T_1540_real_node),
        .sel(_T_1484),
        .a(_T_1522_real_node),
        .b(_node_456)
    );
    wire _node_457;
    EQ_UNSIGNED #(.width(2)) u_eq_498 (
        .y(_node_457),
        .a(2'd0),
        .b(_T_1533)
    );
    wire [63:0] _node_458;
    assign _node_458 = twiddle_rom_0_imaginary_node;
    wire _node_459;
    EQ_UNSIGNED #(.width(2)) u_eq_499 (
        .y(_node_459),
        .a(2'd1),
        .b(_T_1533)
    );
    wire [63:0] _node_460;
    MUX_UNSIGNED #(.width(64)) u_mux_500 (
        .y(_node_460),
        .sel(_node_459),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_458)
    );
    wire _node_461;
    EQ_UNSIGNED #(.width(2)) u_eq_501 (
        .y(_node_461),
        .a(2'd2),
        .b(_T_1533)
    );
    wire [63:0] _node_462;
    MUX_UNSIGNED #(.width(64)) u_mux_502 (
        .y(_node_462),
        .sel(_node_461),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_460)
    );
    wire _node_463;
    EQ_UNSIGNED #(.width(2)) u_eq_503 (
        .y(_node_463),
        .a(2'd3),
        .b(_T_1533)
    );
    wire [63:0] _node_464;
    MUX_UNSIGNED #(.width(64)) u_mux_504 (
        .y(_node_464),
        .sel(_node_463),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_462)
    );
    wire [63:0] _T_1540_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_505 (
        .y(_T_1540_imaginary_node),
        .sel(_T_1484),
        .a(_T_1522_imaginary_node),
        .b(_node_464)
    );
    wire [4:0] _T_1542;
    wire [3:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_506 (
        .y(_WTEMP_14),
        .in(3'h4)
    );
    ADD_UNSIGNED #(.width(4)) u_add_507 (
        .y(_T_1542),
        .a(start),
        .b(_WTEMP_14)
    );
    wire [3:0] _T_1543;
    TAIL #(.width(5), .n(1)) tail_508 (
        .y(_T_1543),
        .in(_T_1542)
    );
    wire _node_465;
    EQ_UNSIGNED #(.width(4)) u_eq_509 (
        .y(_node_465),
        .a(4'd0),
        .b(_T_1543)
    );
    wire [2:0] _node_466;
    assign _node_466 = indices_rom_0;
    wire _node_467;
    EQ_UNSIGNED #(.width(4)) u_eq_510 (
        .y(_node_467),
        .a(4'd1),
        .b(_T_1543)
    );
    wire [2:0] _node_468;
    MUX_UNSIGNED #(.width(3)) u_mux_511 (
        .y(_node_468),
        .sel(_node_467),
        .a(indices_rom_1),
        .b(_node_466)
    );
    wire _node_469;
    EQ_UNSIGNED #(.width(4)) u_eq_512 (
        .y(_node_469),
        .a(4'd2),
        .b(_T_1543)
    );
    wire [2:0] _node_470;
    MUX_UNSIGNED #(.width(3)) u_mux_513 (
        .y(_node_470),
        .sel(_node_469),
        .a(indices_rom_2),
        .b(_node_468)
    );
    wire _node_471;
    EQ_UNSIGNED #(.width(4)) u_eq_514 (
        .y(_node_471),
        .a(4'd3),
        .b(_T_1543)
    );
    wire [2:0] _node_472;
    MUX_UNSIGNED #(.width(3)) u_mux_515 (
        .y(_node_472),
        .sel(_node_471),
        .a(indices_rom_3),
        .b(_node_470)
    );
    wire _node_473;
    EQ_UNSIGNED #(.width(4)) u_eq_516 (
        .y(_node_473),
        .a(4'd4),
        .b(_T_1543)
    );
    wire [2:0] _node_474;
    MUX_UNSIGNED #(.width(3)) u_mux_517 (
        .y(_node_474),
        .sel(_node_473),
        .a(indices_rom_4),
        .b(_node_472)
    );
    wire _node_475;
    EQ_UNSIGNED #(.width(4)) u_eq_518 (
        .y(_node_475),
        .a(4'd5),
        .b(_T_1543)
    );
    wire [2:0] _node_476;
    MUX_UNSIGNED #(.width(3)) u_mux_519 (
        .y(_node_476),
        .sel(_node_475),
        .a(indices_rom_5),
        .b(_node_474)
    );
    wire _node_477;
    EQ_UNSIGNED #(.width(4)) u_eq_520 (
        .y(_node_477),
        .a(4'd6),
        .b(_T_1543)
    );
    wire [2:0] _node_478;
    MUX_UNSIGNED #(.width(3)) u_mux_521 (
        .y(_node_478),
        .sel(_node_477),
        .a(indices_rom_6),
        .b(_node_476)
    );
    wire _node_479;
    EQ_UNSIGNED #(.width(4)) u_eq_522 (
        .y(_node_479),
        .a(4'd7),
        .b(_T_1543)
    );
    wire [2:0] _node_480;
    MUX_UNSIGNED #(.width(3)) u_mux_523 (
        .y(_node_480),
        .sel(_node_479),
        .a(indices_rom_7),
        .b(_node_478)
    );
    wire _node_481;
    EQ_UNSIGNED #(.width(4)) u_eq_524 (
        .y(_node_481),
        .a(4'd8),
        .b(_T_1543)
    );
    wire [2:0] _node_482;
    MUX_UNSIGNED #(.width(3)) u_mux_525 (
        .y(_node_482),
        .sel(_node_481),
        .a(indices_rom_8),
        .b(_node_480)
    );
    wire _node_483;
    EQ_UNSIGNED #(.width(4)) u_eq_526 (
        .y(_node_483),
        .a(4'd9),
        .b(_T_1543)
    );
    wire [2:0] _node_484;
    MUX_UNSIGNED #(.width(3)) u_mux_527 (
        .y(_node_484),
        .sel(_node_483),
        .a(indices_rom_9),
        .b(_node_482)
    );
    wire _node_485;
    EQ_UNSIGNED #(.width(4)) u_eq_528 (
        .y(_node_485),
        .a(4'd10),
        .b(_T_1543)
    );
    wire [2:0] _node_486;
    MUX_UNSIGNED #(.width(3)) u_mux_529 (
        .y(_node_486),
        .sel(_node_485),
        .a(indices_rom_10),
        .b(_node_484)
    );
    wire _node_487;
    EQ_UNSIGNED #(.width(4)) u_eq_530 (
        .y(_node_487),
        .a(4'd11),
        .b(_T_1543)
    );
    wire [2:0] _node_488;
    MUX_UNSIGNED #(.width(3)) u_mux_531 (
        .y(_node_488),
        .sel(_node_487),
        .a(indices_rom_11),
        .b(_node_486)
    );
    wire _node_489;
    EQ_UNSIGNED #(.width(4)) u_eq_532 (
        .y(_node_489),
        .a(4'd12),
        .b(_T_1543)
    );
    wire [2:0] _node_490;
    MUX_UNSIGNED #(.width(3)) u_mux_533 (
        .y(_node_490),
        .sel(_node_489),
        .a(indices_rom_12),
        .b(_node_488)
    );
    wire _node_491;
    EQ_UNSIGNED #(.width(4)) u_eq_534 (
        .y(_node_491),
        .a(4'd13),
        .b(_T_1543)
    );
    wire [2:0] _node_492;
    MUX_UNSIGNED #(.width(3)) u_mux_535 (
        .y(_node_492),
        .sel(_node_491),
        .a(indices_rom_13),
        .b(_node_490)
    );
    wire _T_1545;
    BITS #(.width(3), .high(2), .low(2)) bits_536 (
        .y(_T_1545),
        .in(_node_492)
    );
    wire [4:0] _T_1547;
    wire [3:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_537 (
        .y(_WTEMP_15),
        .in(3'h4)
    );
    ADD_UNSIGNED #(.width(4)) u_add_538 (
        .y(_T_1547),
        .a(start),
        .b(_WTEMP_15)
    );
    wire [3:0] _T_1548;
    TAIL #(.width(5), .n(1)) tail_539 (
        .y(_T_1548),
        .in(_T_1547)
    );
    wire _node_493;
    EQ_UNSIGNED #(.width(4)) u_eq_540 (
        .y(_node_493),
        .a(4'd0),
        .b(_T_1548)
    );
    wire [2:0] _node_494;
    assign _node_494 = indices_rom_0;
    wire _node_495;
    EQ_UNSIGNED #(.width(4)) u_eq_541 (
        .y(_node_495),
        .a(4'd1),
        .b(_T_1548)
    );
    wire [2:0] _node_496;
    MUX_UNSIGNED #(.width(3)) u_mux_542 (
        .y(_node_496),
        .sel(_node_495),
        .a(indices_rom_1),
        .b(_node_494)
    );
    wire _node_497;
    EQ_UNSIGNED #(.width(4)) u_eq_543 (
        .y(_node_497),
        .a(4'd2),
        .b(_T_1548)
    );
    wire [2:0] _node_498;
    MUX_UNSIGNED #(.width(3)) u_mux_544 (
        .y(_node_498),
        .sel(_node_497),
        .a(indices_rom_2),
        .b(_node_496)
    );
    wire _node_499;
    EQ_UNSIGNED #(.width(4)) u_eq_545 (
        .y(_node_499),
        .a(4'd3),
        .b(_T_1548)
    );
    wire [2:0] _node_500;
    MUX_UNSIGNED #(.width(3)) u_mux_546 (
        .y(_node_500),
        .sel(_node_499),
        .a(indices_rom_3),
        .b(_node_498)
    );
    wire _node_501;
    EQ_UNSIGNED #(.width(4)) u_eq_547 (
        .y(_node_501),
        .a(4'd4),
        .b(_T_1548)
    );
    wire [2:0] _node_502;
    MUX_UNSIGNED #(.width(3)) u_mux_548 (
        .y(_node_502),
        .sel(_node_501),
        .a(indices_rom_4),
        .b(_node_500)
    );
    wire _node_503;
    EQ_UNSIGNED #(.width(4)) u_eq_549 (
        .y(_node_503),
        .a(4'd5),
        .b(_T_1548)
    );
    wire [2:0] _node_504;
    MUX_UNSIGNED #(.width(3)) u_mux_550 (
        .y(_node_504),
        .sel(_node_503),
        .a(indices_rom_5),
        .b(_node_502)
    );
    wire _node_505;
    EQ_UNSIGNED #(.width(4)) u_eq_551 (
        .y(_node_505),
        .a(4'd6),
        .b(_T_1548)
    );
    wire [2:0] _node_506;
    MUX_UNSIGNED #(.width(3)) u_mux_552 (
        .y(_node_506),
        .sel(_node_505),
        .a(indices_rom_6),
        .b(_node_504)
    );
    wire _node_507;
    EQ_UNSIGNED #(.width(4)) u_eq_553 (
        .y(_node_507),
        .a(4'd7),
        .b(_T_1548)
    );
    wire [2:0] _node_508;
    MUX_UNSIGNED #(.width(3)) u_mux_554 (
        .y(_node_508),
        .sel(_node_507),
        .a(indices_rom_7),
        .b(_node_506)
    );
    wire _node_509;
    EQ_UNSIGNED #(.width(4)) u_eq_555 (
        .y(_node_509),
        .a(4'd8),
        .b(_T_1548)
    );
    wire [2:0] _node_510;
    MUX_UNSIGNED #(.width(3)) u_mux_556 (
        .y(_node_510),
        .sel(_node_509),
        .a(indices_rom_8),
        .b(_node_508)
    );
    wire _node_511;
    EQ_UNSIGNED #(.width(4)) u_eq_557 (
        .y(_node_511),
        .a(4'd9),
        .b(_T_1548)
    );
    wire [2:0] _node_512;
    MUX_UNSIGNED #(.width(3)) u_mux_558 (
        .y(_node_512),
        .sel(_node_511),
        .a(indices_rom_9),
        .b(_node_510)
    );
    wire _node_513;
    EQ_UNSIGNED #(.width(4)) u_eq_559 (
        .y(_node_513),
        .a(4'd10),
        .b(_T_1548)
    );
    wire [2:0] _node_514;
    MUX_UNSIGNED #(.width(3)) u_mux_560 (
        .y(_node_514),
        .sel(_node_513),
        .a(indices_rom_10),
        .b(_node_512)
    );
    wire _node_515;
    EQ_UNSIGNED #(.width(4)) u_eq_561 (
        .y(_node_515),
        .a(4'd11),
        .b(_T_1548)
    );
    wire [2:0] _node_516;
    MUX_UNSIGNED #(.width(3)) u_mux_562 (
        .y(_node_516),
        .sel(_node_515),
        .a(indices_rom_11),
        .b(_node_514)
    );
    wire _node_517;
    EQ_UNSIGNED #(.width(4)) u_eq_563 (
        .y(_node_517),
        .a(4'd12),
        .b(_T_1548)
    );
    wire [2:0] _node_518;
    MUX_UNSIGNED #(.width(3)) u_mux_564 (
        .y(_node_518),
        .sel(_node_517),
        .a(indices_rom_12),
        .b(_node_516)
    );
    wire _node_519;
    EQ_UNSIGNED #(.width(4)) u_eq_565 (
        .y(_node_519),
        .a(4'd13),
        .b(_T_1548)
    );
    wire [2:0] _node_520;
    MUX_UNSIGNED #(.width(3)) u_mux_566 (
        .y(_node_520),
        .sel(_node_519),
        .a(indices_rom_13),
        .b(_node_518)
    );
    wire [1:0] _T_1550;
    BITS #(.width(3), .high(1), .low(0)) bits_567 (
        .y(_T_1550),
        .in(_node_520)
    );
    wire [63:0] _T_1560_node;
    wire [63:0] _BBFSubtract_4_1__out;
    wire [63:0] _BBFSubtract_4_1__in2;
    wire [63:0] _BBFSubtract_4_1__in1;
    BBFSubtract BBFSubtract_4_1 (
        .out(_BBFSubtract_4_1__out),
        .in2(_BBFSubtract_4_1__in2),
        .in1(_BBFSubtract_4_1__in1)
    );
    wire _node_521;
    EQ_UNSIGNED #(.width(2)) u_eq_568 (
        .y(_node_521),
        .a(2'd0),
        .b(_T_1550)
    );
    wire [63:0] _node_522;
    assign _node_522 = twiddle_rom_0_real_node;
    wire _node_523;
    EQ_UNSIGNED #(.width(2)) u_eq_569 (
        .y(_node_523),
        .a(2'd1),
        .b(_T_1550)
    );
    wire [63:0] _node_524;
    MUX_UNSIGNED #(.width(64)) u_mux_570 (
        .y(_node_524),
        .sel(_node_523),
        .a(twiddle_rom_1_real_node),
        .b(_node_522)
    );
    wire _node_525;
    EQ_UNSIGNED #(.width(2)) u_eq_571 (
        .y(_node_525),
        .a(2'd2),
        .b(_T_1550)
    );
    wire [63:0] _node_526;
    MUX_UNSIGNED #(.width(64)) u_mux_572 (
        .y(_node_526),
        .sel(_node_525),
        .a(twiddle_rom_2_real_node),
        .b(_node_524)
    );
    wire _node_527;
    EQ_UNSIGNED #(.width(2)) u_eq_573 (
        .y(_node_527),
        .a(2'd3),
        .b(_T_1550)
    );
    wire [63:0] _node_528;
    MUX_UNSIGNED #(.width(64)) u_mux_574 (
        .y(_node_528),
        .sel(_node_527),
        .a(twiddle_rom_3_real_node),
        .b(_node_526)
    );
    wire [63:0] _T_1567_node;
    wire [63:0] _T_1583_real_node;
    wire [63:0] _T_1583_imaginary_node;
    wire _node_529;
    EQ_UNSIGNED #(.width(2)) u_eq_575 (
        .y(_node_529),
        .a(2'd0),
        .b(_T_1550)
    );
    wire [63:0] _node_530;
    assign _node_530 = twiddle_rom_0_imaginary_node;
    wire _node_531;
    EQ_UNSIGNED #(.width(2)) u_eq_576 (
        .y(_node_531),
        .a(2'd1),
        .b(_T_1550)
    );
    wire [63:0] _node_532;
    MUX_UNSIGNED #(.width(64)) u_mux_577 (
        .y(_node_532),
        .sel(_node_531),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_530)
    );
    wire _node_533;
    EQ_UNSIGNED #(.width(2)) u_eq_578 (
        .y(_node_533),
        .a(2'd2),
        .b(_T_1550)
    );
    wire [63:0] _node_534;
    MUX_UNSIGNED #(.width(64)) u_mux_579 (
        .y(_node_534),
        .sel(_node_533),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_532)
    );
    wire _node_535;
    EQ_UNSIGNED #(.width(2)) u_eq_580 (
        .y(_node_535),
        .a(2'd3),
        .b(_T_1550)
    );
    wire [63:0] _node_536;
    MUX_UNSIGNED #(.width(64)) u_mux_581 (
        .y(_node_536),
        .sel(_node_535),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_534)
    );
    wire [4:0] _T_1585;
    wire [3:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_582 (
        .y(_WTEMP_16),
        .in(3'h4)
    );
    ADD_UNSIGNED #(.width(4)) u_add_583 (
        .y(_T_1585),
        .a(start),
        .b(_WTEMP_16)
    );
    wire [3:0] _T_1586;
    TAIL #(.width(5), .n(1)) tail_584 (
        .y(_T_1586),
        .in(_T_1585)
    );
    wire _node_537;
    EQ_UNSIGNED #(.width(4)) u_eq_585 (
        .y(_node_537),
        .a(4'd0),
        .b(_T_1586)
    );
    wire [2:0] _node_538;
    assign _node_538 = indices_rom_0;
    wire _node_539;
    EQ_UNSIGNED #(.width(4)) u_eq_586 (
        .y(_node_539),
        .a(4'd1),
        .b(_T_1586)
    );
    wire [2:0] _node_540;
    MUX_UNSIGNED #(.width(3)) u_mux_587 (
        .y(_node_540),
        .sel(_node_539),
        .a(indices_rom_1),
        .b(_node_538)
    );
    wire _node_541;
    EQ_UNSIGNED #(.width(4)) u_eq_588 (
        .y(_node_541),
        .a(4'd2),
        .b(_T_1586)
    );
    wire [2:0] _node_542;
    MUX_UNSIGNED #(.width(3)) u_mux_589 (
        .y(_node_542),
        .sel(_node_541),
        .a(indices_rom_2),
        .b(_node_540)
    );
    wire _node_543;
    EQ_UNSIGNED #(.width(4)) u_eq_590 (
        .y(_node_543),
        .a(4'd3),
        .b(_T_1586)
    );
    wire [2:0] _node_544;
    MUX_UNSIGNED #(.width(3)) u_mux_591 (
        .y(_node_544),
        .sel(_node_543),
        .a(indices_rom_3),
        .b(_node_542)
    );
    wire _node_545;
    EQ_UNSIGNED #(.width(4)) u_eq_592 (
        .y(_node_545),
        .a(4'd4),
        .b(_T_1586)
    );
    wire [2:0] _node_546;
    MUX_UNSIGNED #(.width(3)) u_mux_593 (
        .y(_node_546),
        .sel(_node_545),
        .a(indices_rom_4),
        .b(_node_544)
    );
    wire _node_547;
    EQ_UNSIGNED #(.width(4)) u_eq_594 (
        .y(_node_547),
        .a(4'd5),
        .b(_T_1586)
    );
    wire [2:0] _node_548;
    MUX_UNSIGNED #(.width(3)) u_mux_595 (
        .y(_node_548),
        .sel(_node_547),
        .a(indices_rom_5),
        .b(_node_546)
    );
    wire _node_549;
    EQ_UNSIGNED #(.width(4)) u_eq_596 (
        .y(_node_549),
        .a(4'd6),
        .b(_T_1586)
    );
    wire [2:0] _node_550;
    MUX_UNSIGNED #(.width(3)) u_mux_597 (
        .y(_node_550),
        .sel(_node_549),
        .a(indices_rom_6),
        .b(_node_548)
    );
    wire _node_551;
    EQ_UNSIGNED #(.width(4)) u_eq_598 (
        .y(_node_551),
        .a(4'd7),
        .b(_T_1586)
    );
    wire [2:0] _node_552;
    MUX_UNSIGNED #(.width(3)) u_mux_599 (
        .y(_node_552),
        .sel(_node_551),
        .a(indices_rom_7),
        .b(_node_550)
    );
    wire _node_553;
    EQ_UNSIGNED #(.width(4)) u_eq_600 (
        .y(_node_553),
        .a(4'd8),
        .b(_T_1586)
    );
    wire [2:0] _node_554;
    MUX_UNSIGNED #(.width(3)) u_mux_601 (
        .y(_node_554),
        .sel(_node_553),
        .a(indices_rom_8),
        .b(_node_552)
    );
    wire _node_555;
    EQ_UNSIGNED #(.width(4)) u_eq_602 (
        .y(_node_555),
        .a(4'd9),
        .b(_T_1586)
    );
    wire [2:0] _node_556;
    MUX_UNSIGNED #(.width(3)) u_mux_603 (
        .y(_node_556),
        .sel(_node_555),
        .a(indices_rom_9),
        .b(_node_554)
    );
    wire _node_557;
    EQ_UNSIGNED #(.width(4)) u_eq_604 (
        .y(_node_557),
        .a(4'd10),
        .b(_T_1586)
    );
    wire [2:0] _node_558;
    MUX_UNSIGNED #(.width(3)) u_mux_605 (
        .y(_node_558),
        .sel(_node_557),
        .a(indices_rom_10),
        .b(_node_556)
    );
    wire _node_559;
    EQ_UNSIGNED #(.width(4)) u_eq_606 (
        .y(_node_559),
        .a(4'd11),
        .b(_T_1586)
    );
    wire [2:0] _node_560;
    MUX_UNSIGNED #(.width(3)) u_mux_607 (
        .y(_node_560),
        .sel(_node_559),
        .a(indices_rom_11),
        .b(_node_558)
    );
    wire _node_561;
    EQ_UNSIGNED #(.width(4)) u_eq_608 (
        .y(_node_561),
        .a(4'd12),
        .b(_T_1586)
    );
    wire [2:0] _node_562;
    MUX_UNSIGNED #(.width(3)) u_mux_609 (
        .y(_node_562),
        .sel(_node_561),
        .a(indices_rom_12),
        .b(_node_560)
    );
    wire _node_563;
    EQ_UNSIGNED #(.width(4)) u_eq_610 (
        .y(_node_563),
        .a(4'd13),
        .b(_T_1586)
    );
    wire [2:0] _node_564;
    MUX_UNSIGNED #(.width(3)) u_mux_611 (
        .y(_node_564),
        .sel(_node_563),
        .a(indices_rom_13),
        .b(_node_562)
    );
    wire [1:0] _T_1594;
    BITS #(.width(3), .high(1), .low(0)) bits_612 (
        .y(_T_1594),
        .in(_node_564)
    );
    wire _node_565;
    EQ_UNSIGNED #(.width(2)) u_eq_613 (
        .y(_node_565),
        .a(2'd0),
        .b(_T_1594)
    );
    wire [63:0] _node_566;
    assign _node_566 = twiddle_rom_0_real_node;
    wire _node_567;
    EQ_UNSIGNED #(.width(2)) u_eq_614 (
        .y(_node_567),
        .a(2'd1),
        .b(_T_1594)
    );
    wire [63:0] _node_568;
    MUX_UNSIGNED #(.width(64)) u_mux_615 (
        .y(_node_568),
        .sel(_node_567),
        .a(twiddle_rom_1_real_node),
        .b(_node_566)
    );
    wire _node_569;
    EQ_UNSIGNED #(.width(2)) u_eq_616 (
        .y(_node_569),
        .a(2'd2),
        .b(_T_1594)
    );
    wire [63:0] _node_570;
    MUX_UNSIGNED #(.width(64)) u_mux_617 (
        .y(_node_570),
        .sel(_node_569),
        .a(twiddle_rom_2_real_node),
        .b(_node_568)
    );
    wire _node_571;
    EQ_UNSIGNED #(.width(2)) u_eq_618 (
        .y(_node_571),
        .a(2'd3),
        .b(_T_1594)
    );
    wire [63:0] _node_572;
    MUX_UNSIGNED #(.width(64)) u_mux_619 (
        .y(_node_572),
        .sel(_node_571),
        .a(twiddle_rom_3_real_node),
        .b(_node_570)
    );
    wire [63:0] _T_1601_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_620 (
        .y(_T_1601_real_node),
        .sel(_T_1545),
        .a(_T_1583_real_node),
        .b(_node_572)
    );
    wire _node_573;
    EQ_UNSIGNED #(.width(2)) u_eq_621 (
        .y(_node_573),
        .a(2'd0),
        .b(_T_1594)
    );
    wire [63:0] _node_574;
    assign _node_574 = twiddle_rom_0_imaginary_node;
    wire _node_575;
    EQ_UNSIGNED #(.width(2)) u_eq_622 (
        .y(_node_575),
        .a(2'd1),
        .b(_T_1594)
    );
    wire [63:0] _node_576;
    MUX_UNSIGNED #(.width(64)) u_mux_623 (
        .y(_node_576),
        .sel(_node_575),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_574)
    );
    wire _node_577;
    EQ_UNSIGNED #(.width(2)) u_eq_624 (
        .y(_node_577),
        .a(2'd2),
        .b(_T_1594)
    );
    wire [63:0] _node_578;
    MUX_UNSIGNED #(.width(64)) u_mux_625 (
        .y(_node_578),
        .sel(_node_577),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_576)
    );
    wire _node_579;
    EQ_UNSIGNED #(.width(2)) u_eq_626 (
        .y(_node_579),
        .a(2'd3),
        .b(_T_1594)
    );
    wire [63:0] _node_580;
    MUX_UNSIGNED #(.width(64)) u_mux_627 (
        .y(_node_580),
        .sel(_node_579),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_578)
    );
    wire [63:0] _T_1601_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_628 (
        .y(_T_1601_imaginary_node),
        .sel(_T_1545),
        .a(_T_1583_imaginary_node),
        .b(_node_580)
    );
    wire [4:0] _T_1603;
    wire [3:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_629 (
        .y(_WTEMP_17),
        .in(3'h5)
    );
    ADD_UNSIGNED #(.width(4)) u_add_630 (
        .y(_T_1603),
        .a(start),
        .b(_WTEMP_17)
    );
    wire [3:0] _T_1604;
    TAIL #(.width(5), .n(1)) tail_631 (
        .y(_T_1604),
        .in(_T_1603)
    );
    wire _node_581;
    EQ_UNSIGNED #(.width(4)) u_eq_632 (
        .y(_node_581),
        .a(4'd0),
        .b(_T_1604)
    );
    wire [2:0] _node_582;
    assign _node_582 = indices_rom_0;
    wire _node_583;
    EQ_UNSIGNED #(.width(4)) u_eq_633 (
        .y(_node_583),
        .a(4'd1),
        .b(_T_1604)
    );
    wire [2:0] _node_584;
    MUX_UNSIGNED #(.width(3)) u_mux_634 (
        .y(_node_584),
        .sel(_node_583),
        .a(indices_rom_1),
        .b(_node_582)
    );
    wire _node_585;
    EQ_UNSIGNED #(.width(4)) u_eq_635 (
        .y(_node_585),
        .a(4'd2),
        .b(_T_1604)
    );
    wire [2:0] _node_586;
    MUX_UNSIGNED #(.width(3)) u_mux_636 (
        .y(_node_586),
        .sel(_node_585),
        .a(indices_rom_2),
        .b(_node_584)
    );
    wire _node_587;
    EQ_UNSIGNED #(.width(4)) u_eq_637 (
        .y(_node_587),
        .a(4'd3),
        .b(_T_1604)
    );
    wire [2:0] _node_588;
    MUX_UNSIGNED #(.width(3)) u_mux_638 (
        .y(_node_588),
        .sel(_node_587),
        .a(indices_rom_3),
        .b(_node_586)
    );
    wire _node_589;
    EQ_UNSIGNED #(.width(4)) u_eq_639 (
        .y(_node_589),
        .a(4'd4),
        .b(_T_1604)
    );
    wire [2:0] _node_590;
    MUX_UNSIGNED #(.width(3)) u_mux_640 (
        .y(_node_590),
        .sel(_node_589),
        .a(indices_rom_4),
        .b(_node_588)
    );
    wire _node_591;
    EQ_UNSIGNED #(.width(4)) u_eq_641 (
        .y(_node_591),
        .a(4'd5),
        .b(_T_1604)
    );
    wire [2:0] _node_592;
    MUX_UNSIGNED #(.width(3)) u_mux_642 (
        .y(_node_592),
        .sel(_node_591),
        .a(indices_rom_5),
        .b(_node_590)
    );
    wire _node_593;
    EQ_UNSIGNED #(.width(4)) u_eq_643 (
        .y(_node_593),
        .a(4'd6),
        .b(_T_1604)
    );
    wire [2:0] _node_594;
    MUX_UNSIGNED #(.width(3)) u_mux_644 (
        .y(_node_594),
        .sel(_node_593),
        .a(indices_rom_6),
        .b(_node_592)
    );
    wire _node_595;
    EQ_UNSIGNED #(.width(4)) u_eq_645 (
        .y(_node_595),
        .a(4'd7),
        .b(_T_1604)
    );
    wire [2:0] _node_596;
    MUX_UNSIGNED #(.width(3)) u_mux_646 (
        .y(_node_596),
        .sel(_node_595),
        .a(indices_rom_7),
        .b(_node_594)
    );
    wire _node_597;
    EQ_UNSIGNED #(.width(4)) u_eq_647 (
        .y(_node_597),
        .a(4'd8),
        .b(_T_1604)
    );
    wire [2:0] _node_598;
    MUX_UNSIGNED #(.width(3)) u_mux_648 (
        .y(_node_598),
        .sel(_node_597),
        .a(indices_rom_8),
        .b(_node_596)
    );
    wire _node_599;
    EQ_UNSIGNED #(.width(4)) u_eq_649 (
        .y(_node_599),
        .a(4'd9),
        .b(_T_1604)
    );
    wire [2:0] _node_600;
    MUX_UNSIGNED #(.width(3)) u_mux_650 (
        .y(_node_600),
        .sel(_node_599),
        .a(indices_rom_9),
        .b(_node_598)
    );
    wire _node_601;
    EQ_UNSIGNED #(.width(4)) u_eq_651 (
        .y(_node_601),
        .a(4'd10),
        .b(_T_1604)
    );
    wire [2:0] _node_602;
    MUX_UNSIGNED #(.width(3)) u_mux_652 (
        .y(_node_602),
        .sel(_node_601),
        .a(indices_rom_10),
        .b(_node_600)
    );
    wire _node_603;
    EQ_UNSIGNED #(.width(4)) u_eq_653 (
        .y(_node_603),
        .a(4'd11),
        .b(_T_1604)
    );
    wire [2:0] _node_604;
    MUX_UNSIGNED #(.width(3)) u_mux_654 (
        .y(_node_604),
        .sel(_node_603),
        .a(indices_rom_11),
        .b(_node_602)
    );
    wire _node_605;
    EQ_UNSIGNED #(.width(4)) u_eq_655 (
        .y(_node_605),
        .a(4'd12),
        .b(_T_1604)
    );
    wire [2:0] _node_606;
    MUX_UNSIGNED #(.width(3)) u_mux_656 (
        .y(_node_606),
        .sel(_node_605),
        .a(indices_rom_12),
        .b(_node_604)
    );
    wire _node_607;
    EQ_UNSIGNED #(.width(4)) u_eq_657 (
        .y(_node_607),
        .a(4'd13),
        .b(_T_1604)
    );
    wire [2:0] _node_608;
    MUX_UNSIGNED #(.width(3)) u_mux_658 (
        .y(_node_608),
        .sel(_node_607),
        .a(indices_rom_13),
        .b(_node_606)
    );
    wire _T_1606;
    BITS #(.width(3), .high(2), .low(2)) bits_659 (
        .y(_T_1606),
        .in(_node_608)
    );
    wire [4:0] _T_1608;
    wire [3:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_660 (
        .y(_WTEMP_18),
        .in(3'h5)
    );
    ADD_UNSIGNED #(.width(4)) u_add_661 (
        .y(_T_1608),
        .a(start),
        .b(_WTEMP_18)
    );
    wire [3:0] _T_1609;
    TAIL #(.width(5), .n(1)) tail_662 (
        .y(_T_1609),
        .in(_T_1608)
    );
    wire _node_609;
    EQ_UNSIGNED #(.width(4)) u_eq_663 (
        .y(_node_609),
        .a(4'd0),
        .b(_T_1609)
    );
    wire [2:0] _node_610;
    assign _node_610 = indices_rom_0;
    wire _node_611;
    EQ_UNSIGNED #(.width(4)) u_eq_664 (
        .y(_node_611),
        .a(4'd1),
        .b(_T_1609)
    );
    wire [2:0] _node_612;
    MUX_UNSIGNED #(.width(3)) u_mux_665 (
        .y(_node_612),
        .sel(_node_611),
        .a(indices_rom_1),
        .b(_node_610)
    );
    wire _node_613;
    EQ_UNSIGNED #(.width(4)) u_eq_666 (
        .y(_node_613),
        .a(4'd2),
        .b(_T_1609)
    );
    wire [2:0] _node_614;
    MUX_UNSIGNED #(.width(3)) u_mux_667 (
        .y(_node_614),
        .sel(_node_613),
        .a(indices_rom_2),
        .b(_node_612)
    );
    wire _node_615;
    EQ_UNSIGNED #(.width(4)) u_eq_668 (
        .y(_node_615),
        .a(4'd3),
        .b(_T_1609)
    );
    wire [2:0] _node_616;
    MUX_UNSIGNED #(.width(3)) u_mux_669 (
        .y(_node_616),
        .sel(_node_615),
        .a(indices_rom_3),
        .b(_node_614)
    );
    wire _node_617;
    EQ_UNSIGNED #(.width(4)) u_eq_670 (
        .y(_node_617),
        .a(4'd4),
        .b(_T_1609)
    );
    wire [2:0] _node_618;
    MUX_UNSIGNED #(.width(3)) u_mux_671 (
        .y(_node_618),
        .sel(_node_617),
        .a(indices_rom_4),
        .b(_node_616)
    );
    wire _node_619;
    EQ_UNSIGNED #(.width(4)) u_eq_672 (
        .y(_node_619),
        .a(4'd5),
        .b(_T_1609)
    );
    wire [2:0] _node_620;
    MUX_UNSIGNED #(.width(3)) u_mux_673 (
        .y(_node_620),
        .sel(_node_619),
        .a(indices_rom_5),
        .b(_node_618)
    );
    wire _node_621;
    EQ_UNSIGNED #(.width(4)) u_eq_674 (
        .y(_node_621),
        .a(4'd6),
        .b(_T_1609)
    );
    wire [2:0] _node_622;
    MUX_UNSIGNED #(.width(3)) u_mux_675 (
        .y(_node_622),
        .sel(_node_621),
        .a(indices_rom_6),
        .b(_node_620)
    );
    wire _node_623;
    EQ_UNSIGNED #(.width(4)) u_eq_676 (
        .y(_node_623),
        .a(4'd7),
        .b(_T_1609)
    );
    wire [2:0] _node_624;
    MUX_UNSIGNED #(.width(3)) u_mux_677 (
        .y(_node_624),
        .sel(_node_623),
        .a(indices_rom_7),
        .b(_node_622)
    );
    wire _node_625;
    EQ_UNSIGNED #(.width(4)) u_eq_678 (
        .y(_node_625),
        .a(4'd8),
        .b(_T_1609)
    );
    wire [2:0] _node_626;
    MUX_UNSIGNED #(.width(3)) u_mux_679 (
        .y(_node_626),
        .sel(_node_625),
        .a(indices_rom_8),
        .b(_node_624)
    );
    wire _node_627;
    EQ_UNSIGNED #(.width(4)) u_eq_680 (
        .y(_node_627),
        .a(4'd9),
        .b(_T_1609)
    );
    wire [2:0] _node_628;
    MUX_UNSIGNED #(.width(3)) u_mux_681 (
        .y(_node_628),
        .sel(_node_627),
        .a(indices_rom_9),
        .b(_node_626)
    );
    wire _node_629;
    EQ_UNSIGNED #(.width(4)) u_eq_682 (
        .y(_node_629),
        .a(4'd10),
        .b(_T_1609)
    );
    wire [2:0] _node_630;
    MUX_UNSIGNED #(.width(3)) u_mux_683 (
        .y(_node_630),
        .sel(_node_629),
        .a(indices_rom_10),
        .b(_node_628)
    );
    wire _node_631;
    EQ_UNSIGNED #(.width(4)) u_eq_684 (
        .y(_node_631),
        .a(4'd11),
        .b(_T_1609)
    );
    wire [2:0] _node_632;
    MUX_UNSIGNED #(.width(3)) u_mux_685 (
        .y(_node_632),
        .sel(_node_631),
        .a(indices_rom_11),
        .b(_node_630)
    );
    wire _node_633;
    EQ_UNSIGNED #(.width(4)) u_eq_686 (
        .y(_node_633),
        .a(4'd12),
        .b(_T_1609)
    );
    wire [2:0] _node_634;
    MUX_UNSIGNED #(.width(3)) u_mux_687 (
        .y(_node_634),
        .sel(_node_633),
        .a(indices_rom_12),
        .b(_node_632)
    );
    wire _node_635;
    EQ_UNSIGNED #(.width(4)) u_eq_688 (
        .y(_node_635),
        .a(4'd13),
        .b(_T_1609)
    );
    wire [2:0] _node_636;
    MUX_UNSIGNED #(.width(3)) u_mux_689 (
        .y(_node_636),
        .sel(_node_635),
        .a(indices_rom_13),
        .b(_node_634)
    );
    wire [1:0] _T_1611;
    BITS #(.width(3), .high(1), .low(0)) bits_690 (
        .y(_T_1611),
        .in(_node_636)
    );
    wire [63:0] _T_1621_node;
    wire [63:0] _BBFSubtract_5_1__out;
    wire [63:0] _BBFSubtract_5_1__in2;
    wire [63:0] _BBFSubtract_5_1__in1;
    BBFSubtract BBFSubtract_5_1 (
        .out(_BBFSubtract_5_1__out),
        .in2(_BBFSubtract_5_1__in2),
        .in1(_BBFSubtract_5_1__in1)
    );
    wire _node_637;
    EQ_UNSIGNED #(.width(2)) u_eq_691 (
        .y(_node_637),
        .a(2'd0),
        .b(_T_1611)
    );
    wire [63:0] _node_638;
    assign _node_638 = twiddle_rom_0_real_node;
    wire _node_639;
    EQ_UNSIGNED #(.width(2)) u_eq_692 (
        .y(_node_639),
        .a(2'd1),
        .b(_T_1611)
    );
    wire [63:0] _node_640;
    MUX_UNSIGNED #(.width(64)) u_mux_693 (
        .y(_node_640),
        .sel(_node_639),
        .a(twiddle_rom_1_real_node),
        .b(_node_638)
    );
    wire _node_641;
    EQ_UNSIGNED #(.width(2)) u_eq_694 (
        .y(_node_641),
        .a(2'd2),
        .b(_T_1611)
    );
    wire [63:0] _node_642;
    MUX_UNSIGNED #(.width(64)) u_mux_695 (
        .y(_node_642),
        .sel(_node_641),
        .a(twiddle_rom_2_real_node),
        .b(_node_640)
    );
    wire _node_643;
    EQ_UNSIGNED #(.width(2)) u_eq_696 (
        .y(_node_643),
        .a(2'd3),
        .b(_T_1611)
    );
    wire [63:0] _node_644;
    MUX_UNSIGNED #(.width(64)) u_mux_697 (
        .y(_node_644),
        .sel(_node_643),
        .a(twiddle_rom_3_real_node),
        .b(_node_642)
    );
    wire [63:0] _T_1628_node;
    wire [63:0] _T_1644_real_node;
    wire [63:0] _T_1644_imaginary_node;
    wire _node_645;
    EQ_UNSIGNED #(.width(2)) u_eq_698 (
        .y(_node_645),
        .a(2'd0),
        .b(_T_1611)
    );
    wire [63:0] _node_646;
    assign _node_646 = twiddle_rom_0_imaginary_node;
    wire _node_647;
    EQ_UNSIGNED #(.width(2)) u_eq_699 (
        .y(_node_647),
        .a(2'd1),
        .b(_T_1611)
    );
    wire [63:0] _node_648;
    MUX_UNSIGNED #(.width(64)) u_mux_700 (
        .y(_node_648),
        .sel(_node_647),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_646)
    );
    wire _node_649;
    EQ_UNSIGNED #(.width(2)) u_eq_701 (
        .y(_node_649),
        .a(2'd2),
        .b(_T_1611)
    );
    wire [63:0] _node_650;
    MUX_UNSIGNED #(.width(64)) u_mux_702 (
        .y(_node_650),
        .sel(_node_649),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_648)
    );
    wire _node_651;
    EQ_UNSIGNED #(.width(2)) u_eq_703 (
        .y(_node_651),
        .a(2'd3),
        .b(_T_1611)
    );
    wire [63:0] _node_652;
    MUX_UNSIGNED #(.width(64)) u_mux_704 (
        .y(_node_652),
        .sel(_node_651),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_650)
    );
    wire [4:0] _T_1646;
    wire [3:0] _WTEMP_19;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_705 (
        .y(_WTEMP_19),
        .in(3'h5)
    );
    ADD_UNSIGNED #(.width(4)) u_add_706 (
        .y(_T_1646),
        .a(start),
        .b(_WTEMP_19)
    );
    wire [3:0] _T_1647;
    TAIL #(.width(5), .n(1)) tail_707 (
        .y(_T_1647),
        .in(_T_1646)
    );
    wire _node_653;
    EQ_UNSIGNED #(.width(4)) u_eq_708 (
        .y(_node_653),
        .a(4'd0),
        .b(_T_1647)
    );
    wire [2:0] _node_654;
    assign _node_654 = indices_rom_0;
    wire _node_655;
    EQ_UNSIGNED #(.width(4)) u_eq_709 (
        .y(_node_655),
        .a(4'd1),
        .b(_T_1647)
    );
    wire [2:0] _node_656;
    MUX_UNSIGNED #(.width(3)) u_mux_710 (
        .y(_node_656),
        .sel(_node_655),
        .a(indices_rom_1),
        .b(_node_654)
    );
    wire _node_657;
    EQ_UNSIGNED #(.width(4)) u_eq_711 (
        .y(_node_657),
        .a(4'd2),
        .b(_T_1647)
    );
    wire [2:0] _node_658;
    MUX_UNSIGNED #(.width(3)) u_mux_712 (
        .y(_node_658),
        .sel(_node_657),
        .a(indices_rom_2),
        .b(_node_656)
    );
    wire _node_659;
    EQ_UNSIGNED #(.width(4)) u_eq_713 (
        .y(_node_659),
        .a(4'd3),
        .b(_T_1647)
    );
    wire [2:0] _node_660;
    MUX_UNSIGNED #(.width(3)) u_mux_714 (
        .y(_node_660),
        .sel(_node_659),
        .a(indices_rom_3),
        .b(_node_658)
    );
    wire _node_661;
    EQ_UNSIGNED #(.width(4)) u_eq_715 (
        .y(_node_661),
        .a(4'd4),
        .b(_T_1647)
    );
    wire [2:0] _node_662;
    MUX_UNSIGNED #(.width(3)) u_mux_716 (
        .y(_node_662),
        .sel(_node_661),
        .a(indices_rom_4),
        .b(_node_660)
    );
    wire _node_663;
    EQ_UNSIGNED #(.width(4)) u_eq_717 (
        .y(_node_663),
        .a(4'd5),
        .b(_T_1647)
    );
    wire [2:0] _node_664;
    MUX_UNSIGNED #(.width(3)) u_mux_718 (
        .y(_node_664),
        .sel(_node_663),
        .a(indices_rom_5),
        .b(_node_662)
    );
    wire _node_665;
    EQ_UNSIGNED #(.width(4)) u_eq_719 (
        .y(_node_665),
        .a(4'd6),
        .b(_T_1647)
    );
    wire [2:0] _node_666;
    MUX_UNSIGNED #(.width(3)) u_mux_720 (
        .y(_node_666),
        .sel(_node_665),
        .a(indices_rom_6),
        .b(_node_664)
    );
    wire _node_667;
    EQ_UNSIGNED #(.width(4)) u_eq_721 (
        .y(_node_667),
        .a(4'd7),
        .b(_T_1647)
    );
    wire [2:0] _node_668;
    MUX_UNSIGNED #(.width(3)) u_mux_722 (
        .y(_node_668),
        .sel(_node_667),
        .a(indices_rom_7),
        .b(_node_666)
    );
    wire _node_669;
    EQ_UNSIGNED #(.width(4)) u_eq_723 (
        .y(_node_669),
        .a(4'd8),
        .b(_T_1647)
    );
    wire [2:0] _node_670;
    MUX_UNSIGNED #(.width(3)) u_mux_724 (
        .y(_node_670),
        .sel(_node_669),
        .a(indices_rom_8),
        .b(_node_668)
    );
    wire _node_671;
    EQ_UNSIGNED #(.width(4)) u_eq_725 (
        .y(_node_671),
        .a(4'd9),
        .b(_T_1647)
    );
    wire [2:0] _node_672;
    MUX_UNSIGNED #(.width(3)) u_mux_726 (
        .y(_node_672),
        .sel(_node_671),
        .a(indices_rom_9),
        .b(_node_670)
    );
    wire _node_673;
    EQ_UNSIGNED #(.width(4)) u_eq_727 (
        .y(_node_673),
        .a(4'd10),
        .b(_T_1647)
    );
    wire [2:0] _node_674;
    MUX_UNSIGNED #(.width(3)) u_mux_728 (
        .y(_node_674),
        .sel(_node_673),
        .a(indices_rom_10),
        .b(_node_672)
    );
    wire _node_675;
    EQ_UNSIGNED #(.width(4)) u_eq_729 (
        .y(_node_675),
        .a(4'd11),
        .b(_T_1647)
    );
    wire [2:0] _node_676;
    MUX_UNSIGNED #(.width(3)) u_mux_730 (
        .y(_node_676),
        .sel(_node_675),
        .a(indices_rom_11),
        .b(_node_674)
    );
    wire _node_677;
    EQ_UNSIGNED #(.width(4)) u_eq_731 (
        .y(_node_677),
        .a(4'd12),
        .b(_T_1647)
    );
    wire [2:0] _node_678;
    MUX_UNSIGNED #(.width(3)) u_mux_732 (
        .y(_node_678),
        .sel(_node_677),
        .a(indices_rom_12),
        .b(_node_676)
    );
    wire _node_679;
    EQ_UNSIGNED #(.width(4)) u_eq_733 (
        .y(_node_679),
        .a(4'd13),
        .b(_T_1647)
    );
    wire [2:0] _node_680;
    MUX_UNSIGNED #(.width(3)) u_mux_734 (
        .y(_node_680),
        .sel(_node_679),
        .a(indices_rom_13),
        .b(_node_678)
    );
    wire [1:0] _T_1655;
    BITS #(.width(3), .high(1), .low(0)) bits_735 (
        .y(_T_1655),
        .in(_node_680)
    );
    wire _node_681;
    EQ_UNSIGNED #(.width(2)) u_eq_736 (
        .y(_node_681),
        .a(2'd0),
        .b(_T_1655)
    );
    wire [63:0] _node_682;
    assign _node_682 = twiddle_rom_0_real_node;
    wire _node_683;
    EQ_UNSIGNED #(.width(2)) u_eq_737 (
        .y(_node_683),
        .a(2'd1),
        .b(_T_1655)
    );
    wire [63:0] _node_684;
    MUX_UNSIGNED #(.width(64)) u_mux_738 (
        .y(_node_684),
        .sel(_node_683),
        .a(twiddle_rom_1_real_node),
        .b(_node_682)
    );
    wire _node_685;
    EQ_UNSIGNED #(.width(2)) u_eq_739 (
        .y(_node_685),
        .a(2'd2),
        .b(_T_1655)
    );
    wire [63:0] _node_686;
    MUX_UNSIGNED #(.width(64)) u_mux_740 (
        .y(_node_686),
        .sel(_node_685),
        .a(twiddle_rom_2_real_node),
        .b(_node_684)
    );
    wire _node_687;
    EQ_UNSIGNED #(.width(2)) u_eq_741 (
        .y(_node_687),
        .a(2'd3),
        .b(_T_1655)
    );
    wire [63:0] _node_688;
    MUX_UNSIGNED #(.width(64)) u_mux_742 (
        .y(_node_688),
        .sel(_node_687),
        .a(twiddle_rom_3_real_node),
        .b(_node_686)
    );
    wire [63:0] _T_1662_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_743 (
        .y(_T_1662_real_node),
        .sel(_T_1606),
        .a(_T_1644_real_node),
        .b(_node_688)
    );
    wire _node_689;
    EQ_UNSIGNED #(.width(2)) u_eq_744 (
        .y(_node_689),
        .a(2'd0),
        .b(_T_1655)
    );
    wire [63:0] _node_690;
    assign _node_690 = twiddle_rom_0_imaginary_node;
    wire _node_691;
    EQ_UNSIGNED #(.width(2)) u_eq_745 (
        .y(_node_691),
        .a(2'd1),
        .b(_T_1655)
    );
    wire [63:0] _node_692;
    MUX_UNSIGNED #(.width(64)) u_mux_746 (
        .y(_node_692),
        .sel(_node_691),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_690)
    );
    wire _node_693;
    EQ_UNSIGNED #(.width(2)) u_eq_747 (
        .y(_node_693),
        .a(2'd2),
        .b(_T_1655)
    );
    wire [63:0] _node_694;
    MUX_UNSIGNED #(.width(64)) u_mux_748 (
        .y(_node_694),
        .sel(_node_693),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_692)
    );
    wire _node_695;
    EQ_UNSIGNED #(.width(2)) u_eq_749 (
        .y(_node_695),
        .a(2'd3),
        .b(_T_1655)
    );
    wire [63:0] _node_696;
    MUX_UNSIGNED #(.width(64)) u_mux_750 (
        .y(_node_696),
        .sel(_node_695),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_694)
    );
    wire [63:0] _T_1662_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_751 (
        .y(_T_1662_imaginary_node),
        .sel(_T_1606),
        .a(_T_1644_imaginary_node),
        .b(_node_696)
    );
    wire [4:0] _T_1664;
    wire [3:0] _WTEMP_20;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_752 (
        .y(_WTEMP_20),
        .in(3'h6)
    );
    ADD_UNSIGNED #(.width(4)) u_add_753 (
        .y(_T_1664),
        .a(start),
        .b(_WTEMP_20)
    );
    wire [3:0] _T_1665;
    TAIL #(.width(5), .n(1)) tail_754 (
        .y(_T_1665),
        .in(_T_1664)
    );
    wire _node_697;
    EQ_UNSIGNED #(.width(4)) u_eq_755 (
        .y(_node_697),
        .a(4'd0),
        .b(_T_1665)
    );
    wire [2:0] _node_698;
    assign _node_698 = indices_rom_0;
    wire _node_699;
    EQ_UNSIGNED #(.width(4)) u_eq_756 (
        .y(_node_699),
        .a(4'd1),
        .b(_T_1665)
    );
    wire [2:0] _node_700;
    MUX_UNSIGNED #(.width(3)) u_mux_757 (
        .y(_node_700),
        .sel(_node_699),
        .a(indices_rom_1),
        .b(_node_698)
    );
    wire _node_701;
    EQ_UNSIGNED #(.width(4)) u_eq_758 (
        .y(_node_701),
        .a(4'd2),
        .b(_T_1665)
    );
    wire [2:0] _node_702;
    MUX_UNSIGNED #(.width(3)) u_mux_759 (
        .y(_node_702),
        .sel(_node_701),
        .a(indices_rom_2),
        .b(_node_700)
    );
    wire _node_703;
    EQ_UNSIGNED #(.width(4)) u_eq_760 (
        .y(_node_703),
        .a(4'd3),
        .b(_T_1665)
    );
    wire [2:0] _node_704;
    MUX_UNSIGNED #(.width(3)) u_mux_761 (
        .y(_node_704),
        .sel(_node_703),
        .a(indices_rom_3),
        .b(_node_702)
    );
    wire _node_705;
    EQ_UNSIGNED #(.width(4)) u_eq_762 (
        .y(_node_705),
        .a(4'd4),
        .b(_T_1665)
    );
    wire [2:0] _node_706;
    MUX_UNSIGNED #(.width(3)) u_mux_763 (
        .y(_node_706),
        .sel(_node_705),
        .a(indices_rom_4),
        .b(_node_704)
    );
    wire _node_707;
    EQ_UNSIGNED #(.width(4)) u_eq_764 (
        .y(_node_707),
        .a(4'd5),
        .b(_T_1665)
    );
    wire [2:0] _node_708;
    MUX_UNSIGNED #(.width(3)) u_mux_765 (
        .y(_node_708),
        .sel(_node_707),
        .a(indices_rom_5),
        .b(_node_706)
    );
    wire _node_709;
    EQ_UNSIGNED #(.width(4)) u_eq_766 (
        .y(_node_709),
        .a(4'd6),
        .b(_T_1665)
    );
    wire [2:0] _node_710;
    MUX_UNSIGNED #(.width(3)) u_mux_767 (
        .y(_node_710),
        .sel(_node_709),
        .a(indices_rom_6),
        .b(_node_708)
    );
    wire _node_711;
    EQ_UNSIGNED #(.width(4)) u_eq_768 (
        .y(_node_711),
        .a(4'd7),
        .b(_T_1665)
    );
    wire [2:0] _node_712;
    MUX_UNSIGNED #(.width(3)) u_mux_769 (
        .y(_node_712),
        .sel(_node_711),
        .a(indices_rom_7),
        .b(_node_710)
    );
    wire _node_713;
    EQ_UNSIGNED #(.width(4)) u_eq_770 (
        .y(_node_713),
        .a(4'd8),
        .b(_T_1665)
    );
    wire [2:0] _node_714;
    MUX_UNSIGNED #(.width(3)) u_mux_771 (
        .y(_node_714),
        .sel(_node_713),
        .a(indices_rom_8),
        .b(_node_712)
    );
    wire _node_715;
    EQ_UNSIGNED #(.width(4)) u_eq_772 (
        .y(_node_715),
        .a(4'd9),
        .b(_T_1665)
    );
    wire [2:0] _node_716;
    MUX_UNSIGNED #(.width(3)) u_mux_773 (
        .y(_node_716),
        .sel(_node_715),
        .a(indices_rom_9),
        .b(_node_714)
    );
    wire _node_717;
    EQ_UNSIGNED #(.width(4)) u_eq_774 (
        .y(_node_717),
        .a(4'd10),
        .b(_T_1665)
    );
    wire [2:0] _node_718;
    MUX_UNSIGNED #(.width(3)) u_mux_775 (
        .y(_node_718),
        .sel(_node_717),
        .a(indices_rom_10),
        .b(_node_716)
    );
    wire _node_719;
    EQ_UNSIGNED #(.width(4)) u_eq_776 (
        .y(_node_719),
        .a(4'd11),
        .b(_T_1665)
    );
    wire [2:0] _node_720;
    MUX_UNSIGNED #(.width(3)) u_mux_777 (
        .y(_node_720),
        .sel(_node_719),
        .a(indices_rom_11),
        .b(_node_718)
    );
    wire _node_721;
    EQ_UNSIGNED #(.width(4)) u_eq_778 (
        .y(_node_721),
        .a(4'd12),
        .b(_T_1665)
    );
    wire [2:0] _node_722;
    MUX_UNSIGNED #(.width(3)) u_mux_779 (
        .y(_node_722),
        .sel(_node_721),
        .a(indices_rom_12),
        .b(_node_720)
    );
    wire _node_723;
    EQ_UNSIGNED #(.width(4)) u_eq_780 (
        .y(_node_723),
        .a(4'd13),
        .b(_T_1665)
    );
    wire [2:0] _node_724;
    MUX_UNSIGNED #(.width(3)) u_mux_781 (
        .y(_node_724),
        .sel(_node_723),
        .a(indices_rom_13),
        .b(_node_722)
    );
    wire _T_1667;
    BITS #(.width(3), .high(2), .low(2)) bits_782 (
        .y(_T_1667),
        .in(_node_724)
    );
    wire [4:0] _T_1669;
    wire [3:0] _WTEMP_21;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_783 (
        .y(_WTEMP_21),
        .in(3'h6)
    );
    ADD_UNSIGNED #(.width(4)) u_add_784 (
        .y(_T_1669),
        .a(start),
        .b(_WTEMP_21)
    );
    wire [3:0] _T_1670;
    TAIL #(.width(5), .n(1)) tail_785 (
        .y(_T_1670),
        .in(_T_1669)
    );
    wire _node_725;
    EQ_UNSIGNED #(.width(4)) u_eq_786 (
        .y(_node_725),
        .a(4'd0),
        .b(_T_1670)
    );
    wire [2:0] _node_726;
    assign _node_726 = indices_rom_0;
    wire _node_727;
    EQ_UNSIGNED #(.width(4)) u_eq_787 (
        .y(_node_727),
        .a(4'd1),
        .b(_T_1670)
    );
    wire [2:0] _node_728;
    MUX_UNSIGNED #(.width(3)) u_mux_788 (
        .y(_node_728),
        .sel(_node_727),
        .a(indices_rom_1),
        .b(_node_726)
    );
    wire _node_729;
    EQ_UNSIGNED #(.width(4)) u_eq_789 (
        .y(_node_729),
        .a(4'd2),
        .b(_T_1670)
    );
    wire [2:0] _node_730;
    MUX_UNSIGNED #(.width(3)) u_mux_790 (
        .y(_node_730),
        .sel(_node_729),
        .a(indices_rom_2),
        .b(_node_728)
    );
    wire _node_731;
    EQ_UNSIGNED #(.width(4)) u_eq_791 (
        .y(_node_731),
        .a(4'd3),
        .b(_T_1670)
    );
    wire [2:0] _node_732;
    MUX_UNSIGNED #(.width(3)) u_mux_792 (
        .y(_node_732),
        .sel(_node_731),
        .a(indices_rom_3),
        .b(_node_730)
    );
    wire _node_733;
    EQ_UNSIGNED #(.width(4)) u_eq_793 (
        .y(_node_733),
        .a(4'd4),
        .b(_T_1670)
    );
    wire [2:0] _node_734;
    MUX_UNSIGNED #(.width(3)) u_mux_794 (
        .y(_node_734),
        .sel(_node_733),
        .a(indices_rom_4),
        .b(_node_732)
    );
    wire _node_735;
    EQ_UNSIGNED #(.width(4)) u_eq_795 (
        .y(_node_735),
        .a(4'd5),
        .b(_T_1670)
    );
    wire [2:0] _node_736;
    MUX_UNSIGNED #(.width(3)) u_mux_796 (
        .y(_node_736),
        .sel(_node_735),
        .a(indices_rom_5),
        .b(_node_734)
    );
    wire _node_737;
    EQ_UNSIGNED #(.width(4)) u_eq_797 (
        .y(_node_737),
        .a(4'd6),
        .b(_T_1670)
    );
    wire [2:0] _node_738;
    MUX_UNSIGNED #(.width(3)) u_mux_798 (
        .y(_node_738),
        .sel(_node_737),
        .a(indices_rom_6),
        .b(_node_736)
    );
    wire _node_739;
    EQ_UNSIGNED #(.width(4)) u_eq_799 (
        .y(_node_739),
        .a(4'd7),
        .b(_T_1670)
    );
    wire [2:0] _node_740;
    MUX_UNSIGNED #(.width(3)) u_mux_800 (
        .y(_node_740),
        .sel(_node_739),
        .a(indices_rom_7),
        .b(_node_738)
    );
    wire _node_741;
    EQ_UNSIGNED #(.width(4)) u_eq_801 (
        .y(_node_741),
        .a(4'd8),
        .b(_T_1670)
    );
    wire [2:0] _node_742;
    MUX_UNSIGNED #(.width(3)) u_mux_802 (
        .y(_node_742),
        .sel(_node_741),
        .a(indices_rom_8),
        .b(_node_740)
    );
    wire _node_743;
    EQ_UNSIGNED #(.width(4)) u_eq_803 (
        .y(_node_743),
        .a(4'd9),
        .b(_T_1670)
    );
    wire [2:0] _node_744;
    MUX_UNSIGNED #(.width(3)) u_mux_804 (
        .y(_node_744),
        .sel(_node_743),
        .a(indices_rom_9),
        .b(_node_742)
    );
    wire _node_745;
    EQ_UNSIGNED #(.width(4)) u_eq_805 (
        .y(_node_745),
        .a(4'd10),
        .b(_T_1670)
    );
    wire [2:0] _node_746;
    MUX_UNSIGNED #(.width(3)) u_mux_806 (
        .y(_node_746),
        .sel(_node_745),
        .a(indices_rom_10),
        .b(_node_744)
    );
    wire _node_747;
    EQ_UNSIGNED #(.width(4)) u_eq_807 (
        .y(_node_747),
        .a(4'd11),
        .b(_T_1670)
    );
    wire [2:0] _node_748;
    MUX_UNSIGNED #(.width(3)) u_mux_808 (
        .y(_node_748),
        .sel(_node_747),
        .a(indices_rom_11),
        .b(_node_746)
    );
    wire _node_749;
    EQ_UNSIGNED #(.width(4)) u_eq_809 (
        .y(_node_749),
        .a(4'd12),
        .b(_T_1670)
    );
    wire [2:0] _node_750;
    MUX_UNSIGNED #(.width(3)) u_mux_810 (
        .y(_node_750),
        .sel(_node_749),
        .a(indices_rom_12),
        .b(_node_748)
    );
    wire _node_751;
    EQ_UNSIGNED #(.width(4)) u_eq_811 (
        .y(_node_751),
        .a(4'd13),
        .b(_T_1670)
    );
    wire [2:0] _node_752;
    MUX_UNSIGNED #(.width(3)) u_mux_812 (
        .y(_node_752),
        .sel(_node_751),
        .a(indices_rom_13),
        .b(_node_750)
    );
    wire [1:0] _T_1672;
    BITS #(.width(3), .high(1), .low(0)) bits_813 (
        .y(_T_1672),
        .in(_node_752)
    );
    wire [63:0] _T_1682_node;
    wire [63:0] _BBFSubtract_6_1__out;
    wire [63:0] _BBFSubtract_6_1__in2;
    wire [63:0] _BBFSubtract_6_1__in1;
    BBFSubtract BBFSubtract_6_1 (
        .out(_BBFSubtract_6_1__out),
        .in2(_BBFSubtract_6_1__in2),
        .in1(_BBFSubtract_6_1__in1)
    );
    wire _node_753;
    EQ_UNSIGNED #(.width(2)) u_eq_814 (
        .y(_node_753),
        .a(2'd0),
        .b(_T_1672)
    );
    wire [63:0] _node_754;
    assign _node_754 = twiddle_rom_0_real_node;
    wire _node_755;
    EQ_UNSIGNED #(.width(2)) u_eq_815 (
        .y(_node_755),
        .a(2'd1),
        .b(_T_1672)
    );
    wire [63:0] _node_756;
    MUX_UNSIGNED #(.width(64)) u_mux_816 (
        .y(_node_756),
        .sel(_node_755),
        .a(twiddle_rom_1_real_node),
        .b(_node_754)
    );
    wire _node_757;
    EQ_UNSIGNED #(.width(2)) u_eq_817 (
        .y(_node_757),
        .a(2'd2),
        .b(_T_1672)
    );
    wire [63:0] _node_758;
    MUX_UNSIGNED #(.width(64)) u_mux_818 (
        .y(_node_758),
        .sel(_node_757),
        .a(twiddle_rom_2_real_node),
        .b(_node_756)
    );
    wire _node_759;
    EQ_UNSIGNED #(.width(2)) u_eq_819 (
        .y(_node_759),
        .a(2'd3),
        .b(_T_1672)
    );
    wire [63:0] _node_760;
    MUX_UNSIGNED #(.width(64)) u_mux_820 (
        .y(_node_760),
        .sel(_node_759),
        .a(twiddle_rom_3_real_node),
        .b(_node_758)
    );
    wire [63:0] _T_1689_node;
    wire [63:0] _T_1705_real_node;
    wire [63:0] _T_1705_imaginary_node;
    wire _node_761;
    EQ_UNSIGNED #(.width(2)) u_eq_821 (
        .y(_node_761),
        .a(2'd0),
        .b(_T_1672)
    );
    wire [63:0] _node_762;
    assign _node_762 = twiddle_rom_0_imaginary_node;
    wire _node_763;
    EQ_UNSIGNED #(.width(2)) u_eq_822 (
        .y(_node_763),
        .a(2'd1),
        .b(_T_1672)
    );
    wire [63:0] _node_764;
    MUX_UNSIGNED #(.width(64)) u_mux_823 (
        .y(_node_764),
        .sel(_node_763),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_762)
    );
    wire _node_765;
    EQ_UNSIGNED #(.width(2)) u_eq_824 (
        .y(_node_765),
        .a(2'd2),
        .b(_T_1672)
    );
    wire [63:0] _node_766;
    MUX_UNSIGNED #(.width(64)) u_mux_825 (
        .y(_node_766),
        .sel(_node_765),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_764)
    );
    wire _node_767;
    EQ_UNSIGNED #(.width(2)) u_eq_826 (
        .y(_node_767),
        .a(2'd3),
        .b(_T_1672)
    );
    wire [63:0] _node_768;
    MUX_UNSIGNED #(.width(64)) u_mux_827 (
        .y(_node_768),
        .sel(_node_767),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_766)
    );
    wire [4:0] _T_1707;
    wire [3:0] _WTEMP_22;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_828 (
        .y(_WTEMP_22),
        .in(3'h6)
    );
    ADD_UNSIGNED #(.width(4)) u_add_829 (
        .y(_T_1707),
        .a(start),
        .b(_WTEMP_22)
    );
    wire [3:0] _T_1708;
    TAIL #(.width(5), .n(1)) tail_830 (
        .y(_T_1708),
        .in(_T_1707)
    );
    wire _node_769;
    EQ_UNSIGNED #(.width(4)) u_eq_831 (
        .y(_node_769),
        .a(4'd0),
        .b(_T_1708)
    );
    wire [2:0] _node_770;
    assign _node_770 = indices_rom_0;
    wire _node_771;
    EQ_UNSIGNED #(.width(4)) u_eq_832 (
        .y(_node_771),
        .a(4'd1),
        .b(_T_1708)
    );
    wire [2:0] _node_772;
    MUX_UNSIGNED #(.width(3)) u_mux_833 (
        .y(_node_772),
        .sel(_node_771),
        .a(indices_rom_1),
        .b(_node_770)
    );
    wire _node_773;
    EQ_UNSIGNED #(.width(4)) u_eq_834 (
        .y(_node_773),
        .a(4'd2),
        .b(_T_1708)
    );
    wire [2:0] _node_774;
    MUX_UNSIGNED #(.width(3)) u_mux_835 (
        .y(_node_774),
        .sel(_node_773),
        .a(indices_rom_2),
        .b(_node_772)
    );
    wire _node_775;
    EQ_UNSIGNED #(.width(4)) u_eq_836 (
        .y(_node_775),
        .a(4'd3),
        .b(_T_1708)
    );
    wire [2:0] _node_776;
    MUX_UNSIGNED #(.width(3)) u_mux_837 (
        .y(_node_776),
        .sel(_node_775),
        .a(indices_rom_3),
        .b(_node_774)
    );
    wire _node_777;
    EQ_UNSIGNED #(.width(4)) u_eq_838 (
        .y(_node_777),
        .a(4'd4),
        .b(_T_1708)
    );
    wire [2:0] _node_778;
    MUX_UNSIGNED #(.width(3)) u_mux_839 (
        .y(_node_778),
        .sel(_node_777),
        .a(indices_rom_4),
        .b(_node_776)
    );
    wire _node_779;
    EQ_UNSIGNED #(.width(4)) u_eq_840 (
        .y(_node_779),
        .a(4'd5),
        .b(_T_1708)
    );
    wire [2:0] _node_780;
    MUX_UNSIGNED #(.width(3)) u_mux_841 (
        .y(_node_780),
        .sel(_node_779),
        .a(indices_rom_5),
        .b(_node_778)
    );
    wire _node_781;
    EQ_UNSIGNED #(.width(4)) u_eq_842 (
        .y(_node_781),
        .a(4'd6),
        .b(_T_1708)
    );
    wire [2:0] _node_782;
    MUX_UNSIGNED #(.width(3)) u_mux_843 (
        .y(_node_782),
        .sel(_node_781),
        .a(indices_rom_6),
        .b(_node_780)
    );
    wire _node_783;
    EQ_UNSIGNED #(.width(4)) u_eq_844 (
        .y(_node_783),
        .a(4'd7),
        .b(_T_1708)
    );
    wire [2:0] _node_784;
    MUX_UNSIGNED #(.width(3)) u_mux_845 (
        .y(_node_784),
        .sel(_node_783),
        .a(indices_rom_7),
        .b(_node_782)
    );
    wire _node_785;
    EQ_UNSIGNED #(.width(4)) u_eq_846 (
        .y(_node_785),
        .a(4'd8),
        .b(_T_1708)
    );
    wire [2:0] _node_786;
    MUX_UNSIGNED #(.width(3)) u_mux_847 (
        .y(_node_786),
        .sel(_node_785),
        .a(indices_rom_8),
        .b(_node_784)
    );
    wire _node_787;
    EQ_UNSIGNED #(.width(4)) u_eq_848 (
        .y(_node_787),
        .a(4'd9),
        .b(_T_1708)
    );
    wire [2:0] _node_788;
    MUX_UNSIGNED #(.width(3)) u_mux_849 (
        .y(_node_788),
        .sel(_node_787),
        .a(indices_rom_9),
        .b(_node_786)
    );
    wire _node_789;
    EQ_UNSIGNED #(.width(4)) u_eq_850 (
        .y(_node_789),
        .a(4'd10),
        .b(_T_1708)
    );
    wire [2:0] _node_790;
    MUX_UNSIGNED #(.width(3)) u_mux_851 (
        .y(_node_790),
        .sel(_node_789),
        .a(indices_rom_10),
        .b(_node_788)
    );
    wire _node_791;
    EQ_UNSIGNED #(.width(4)) u_eq_852 (
        .y(_node_791),
        .a(4'd11),
        .b(_T_1708)
    );
    wire [2:0] _node_792;
    MUX_UNSIGNED #(.width(3)) u_mux_853 (
        .y(_node_792),
        .sel(_node_791),
        .a(indices_rom_11),
        .b(_node_790)
    );
    wire _node_793;
    EQ_UNSIGNED #(.width(4)) u_eq_854 (
        .y(_node_793),
        .a(4'd12),
        .b(_T_1708)
    );
    wire [2:0] _node_794;
    MUX_UNSIGNED #(.width(3)) u_mux_855 (
        .y(_node_794),
        .sel(_node_793),
        .a(indices_rom_12),
        .b(_node_792)
    );
    wire _node_795;
    EQ_UNSIGNED #(.width(4)) u_eq_856 (
        .y(_node_795),
        .a(4'd13),
        .b(_T_1708)
    );
    wire [2:0] _node_796;
    MUX_UNSIGNED #(.width(3)) u_mux_857 (
        .y(_node_796),
        .sel(_node_795),
        .a(indices_rom_13),
        .b(_node_794)
    );
    wire [1:0] _T_1716;
    BITS #(.width(3), .high(1), .low(0)) bits_858 (
        .y(_T_1716),
        .in(_node_796)
    );
    wire _node_797;
    EQ_UNSIGNED #(.width(2)) u_eq_859 (
        .y(_node_797),
        .a(2'd0),
        .b(_T_1716)
    );
    wire [63:0] _node_798;
    assign _node_798 = twiddle_rom_0_real_node;
    wire _node_799;
    EQ_UNSIGNED #(.width(2)) u_eq_860 (
        .y(_node_799),
        .a(2'd1),
        .b(_T_1716)
    );
    wire [63:0] _node_800;
    MUX_UNSIGNED #(.width(64)) u_mux_861 (
        .y(_node_800),
        .sel(_node_799),
        .a(twiddle_rom_1_real_node),
        .b(_node_798)
    );
    wire _node_801;
    EQ_UNSIGNED #(.width(2)) u_eq_862 (
        .y(_node_801),
        .a(2'd2),
        .b(_T_1716)
    );
    wire [63:0] _node_802;
    MUX_UNSIGNED #(.width(64)) u_mux_863 (
        .y(_node_802),
        .sel(_node_801),
        .a(twiddle_rom_2_real_node),
        .b(_node_800)
    );
    wire _node_803;
    EQ_UNSIGNED #(.width(2)) u_eq_864 (
        .y(_node_803),
        .a(2'd3),
        .b(_T_1716)
    );
    wire [63:0] _node_804;
    MUX_UNSIGNED #(.width(64)) u_mux_865 (
        .y(_node_804),
        .sel(_node_803),
        .a(twiddle_rom_3_real_node),
        .b(_node_802)
    );
    wire [63:0] _T_1723_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_866 (
        .y(_T_1723_real_node),
        .sel(_T_1667),
        .a(_T_1705_real_node),
        .b(_node_804)
    );
    wire _node_805;
    EQ_UNSIGNED #(.width(2)) u_eq_867 (
        .y(_node_805),
        .a(2'd0),
        .b(_T_1716)
    );
    wire [63:0] _node_806;
    assign _node_806 = twiddle_rom_0_imaginary_node;
    wire _node_807;
    EQ_UNSIGNED #(.width(2)) u_eq_868 (
        .y(_node_807),
        .a(2'd1),
        .b(_T_1716)
    );
    wire [63:0] _node_808;
    MUX_UNSIGNED #(.width(64)) u_mux_869 (
        .y(_node_808),
        .sel(_node_807),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_806)
    );
    wire _node_809;
    EQ_UNSIGNED #(.width(2)) u_eq_870 (
        .y(_node_809),
        .a(2'd2),
        .b(_T_1716)
    );
    wire [63:0] _node_810;
    MUX_UNSIGNED #(.width(64)) u_mux_871 (
        .y(_node_810),
        .sel(_node_809),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_808)
    );
    wire _node_811;
    EQ_UNSIGNED #(.width(2)) u_eq_872 (
        .y(_node_811),
        .a(2'd3),
        .b(_T_1716)
    );
    wire [63:0] _node_812;
    MUX_UNSIGNED #(.width(64)) u_mux_873 (
        .y(_node_812),
        .sel(_node_811),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_810)
    );
    wire [63:0] _T_1723_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_874 (
        .y(_T_1723_imaginary_node),
        .sel(_T_1667),
        .a(_T_1705_imaginary_node),
        .b(_node_812)
    );
    wire [63:0] _T_1727_node;
    wire [63:0] _T_1734_node;
    wire [63:0] stage_outputs_0_0_real_node;
    wire [63:0] stage_outputs_0_0_imaginary_node;
    wire [63:0] _T_1754_node;
    wire [63:0] _T_1761_node;
    wire [63:0] stage_outputs_0_1_real_node;
    wire [63:0] stage_outputs_0_1_imaginary_node;
    wire [63:0] _T_1781_node;
    wire [63:0] _T_1788_node;
    wire [63:0] stage_outputs_0_2_real_node;
    wire [63:0] stage_outputs_0_2_imaginary_node;
    wire [63:0] _T_1808_node;
    wire [63:0] _T_1815_node;
    wire [63:0] stage_outputs_0_3_real_node;
    wire [63:0] stage_outputs_0_3_imaginary_node;
    wire [63:0] _T_1835_node;
    wire [63:0] _T_1842_node;
    wire [63:0] stage_outputs_0_4_real_node;
    wire [63:0] stage_outputs_0_4_imaginary_node;
    wire [63:0] _T_1862_node;
    wire [63:0] _T_1869_node;
    wire [63:0] stage_outputs_0_5_real_node;
    wire [63:0] stage_outputs_0_5_imaginary_node;
    wire [63:0] _T_1889_node;
    wire [63:0] _T_1896_node;
    wire [63:0] stage_outputs_0_6_real_node;
    wire [63:0] stage_outputs_0_6_imaginary_node;
    wire [63:0] _T_1916_node;
    wire [63:0] _T_1923_node;
    wire [63:0] stage_outputs_0_7_real_node;
    wire [63:0] stage_outputs_0_7_imaginary_node;
    wire [63:0] _T_1943_node;
    wire [63:0] _T_1950_node;
    wire [63:0] stage_outputs_1_0_real_node;
    wire [63:0] stage_outputs_1_0_imaginary_node;
    wire [63:0] _T_1970_node;
    wire [63:0] _T_1977_node;
    wire [63:0] stage_outputs_1_1_real_node;
    wire [63:0] stage_outputs_1_1_imaginary_node;
    wire [63:0] _T_1997_node;
    wire [63:0] _T_2004_node;
    wire [63:0] stage_outputs_1_2_real_node;
    wire [63:0] stage_outputs_1_2_imaginary_node;
    wire [63:0] _T_2024_node;
    wire [63:0] _T_2031_node;
    wire [63:0] stage_outputs_1_3_real_node;
    wire [63:0] stage_outputs_1_3_imaginary_node;
    wire [63:0] _T_2051_node;
    wire [63:0] _T_2058_node;
    wire [63:0] stage_outputs_1_4_real_node;
    wire [63:0] stage_outputs_1_4_imaginary_node;
    wire [63:0] _T_2078_node;
    wire [63:0] _T_2085_node;
    wire [63:0] stage_outputs_1_5_real_node;
    wire [63:0] stage_outputs_1_5_imaginary_node;
    wire [63:0] _T_2105_node;
    wire [63:0] _T_2112_node;
    wire [63:0] stage_outputs_1_6_real_node;
    wire [63:0] stage_outputs_1_6_imaginary_node;
    wire [63:0] _T_2132_node;
    wire [63:0] _T_2139_node;
    wire [63:0] stage_outputs_1_7_real_node;
    wire [63:0] stage_outputs_1_7_imaginary_node;
    wire [63:0] _T_2159_node;
    wire [63:0] _T_2166_node;
    wire [63:0] stage_outputs_2_0_real_node;
    wire [63:0] stage_outputs_2_0_imaginary_node;
    wire [63:0] _T_2186_node;
    wire [63:0] _T_2193_node;
    wire [63:0] stage_outputs_2_1_real_node;
    wire [63:0] stage_outputs_2_1_imaginary_node;
    wire [63:0] _T_2213_node;
    wire [63:0] _T_2220_node;
    wire [63:0] stage_outputs_2_2_real_node;
    wire [63:0] stage_outputs_2_2_imaginary_node;
    wire [63:0] _T_2240_node;
    wire [63:0] _T_2247_node;
    wire [63:0] stage_outputs_2_3_real_node;
    wire [63:0] stage_outputs_2_3_imaginary_node;
    wire [63:0] _T_2267_node;
    wire [63:0] _T_2274_node;
    wire [63:0] stage_outputs_2_4_real_node;
    wire [63:0] stage_outputs_2_4_imaginary_node;
    wire [63:0] _T_2294_node;
    wire [63:0] _T_2301_node;
    wire [63:0] stage_outputs_2_5_real_node;
    wire [63:0] stage_outputs_2_5_imaginary_node;
    wire [63:0] _T_2321_node;
    wire [63:0] _T_2328_node;
    wire [63:0] stage_outputs_2_6_real_node;
    wire [63:0] stage_outputs_2_6_imaginary_node;
    wire [63:0] _T_2348_node;
    wire [63:0] _T_2355_node;
    wire [63:0] stage_outputs_2_7_real_node;
    wire [63:0] stage_outputs_2_7_imaginary_node;
    wire [63:0] _T_2375_node;
    wire [63:0] _T_2382_node;
    wire [63:0] stage_outputs_3_0_real_node;
    wire [63:0] stage_outputs_3_0_imaginary_node;
    wire [63:0] _T_2402_node;
    wire [63:0] _T_2409_node;
    wire [63:0] stage_outputs_3_1_real_node;
    wire [63:0] stage_outputs_3_1_imaginary_node;
    wire [63:0] _T_2429_node;
    wire [63:0] _T_2436_node;
    wire [63:0] stage_outputs_3_2_real_node;
    wire [63:0] stage_outputs_3_2_imaginary_node;
    wire [63:0] _T_2456_node;
    wire [63:0] _T_2463_node;
    wire [63:0] stage_outputs_3_3_real_node;
    wire [63:0] stage_outputs_3_3_imaginary_node;
    wire [63:0] _T_2483_node;
    wire [63:0] _T_2490_node;
    wire [63:0] stage_outputs_3_4_real_node;
    wire [63:0] stage_outputs_3_4_imaginary_node;
    wire [63:0] _T_2510_node;
    wire [63:0] _T_2517_node;
    wire [63:0] stage_outputs_3_5_real_node;
    wire [63:0] stage_outputs_3_5_imaginary_node;
    wire [63:0] _T_2537_node;
    wire [63:0] _T_2544_node;
    wire [63:0] stage_outputs_3_6_real_node;
    wire [63:0] stage_outputs_3_6_imaginary_node;
    wire [63:0] _T_2564_node;
    wire [63:0] _T_2571_node;
    wire [63:0] stage_outputs_3_7_real_node;
    wire [63:0] stage_outputs_3_7_imaginary_node;
    wire [63:0] _BBFMultiply_48__out;
    wire [63:0] _BBFMultiply_48__in2;
    wire [63:0] _BBFMultiply_48__in1;
    BBFMultiply BBFMultiply_48 (
        .out(_BBFMultiply_48__out),
        .in2(_BBFMultiply_48__in2),
        .in1(_BBFMultiply_48__in1)
    );
    wire [63:0] _T_2591_node;
    wire [63:0] _BBFMultiply_1_1__out;
    wire [63:0] _BBFMultiply_1_1__in2;
    wire [63:0] _BBFMultiply_1_1__in1;
    BBFMultiply BBFMultiply_1_1 (
        .out(_BBFMultiply_1_1__out),
        .in2(_BBFMultiply_1_1__in2),
        .in1(_BBFMultiply_1_1__in1)
    );
    wire [63:0] _T_2597_node;
    wire [63:0] _T_2603_node;
    wire [63:0] _BBFSubtract_7_1__out;
    wire [63:0] _BBFSubtract_7_1__in2;
    wire [63:0] _BBFSubtract_7_1__in1;
    BBFSubtract BBFSubtract_7_1 (
        .out(_BBFSubtract_7_1__out),
        .in2(_BBFSubtract_7_1__in2),
        .in1(_BBFSubtract_7_1__in1)
    );
    wire [63:0] _T_2610_node;
    wire [63:0] _BBFAdd_72__out;
    wire [63:0] _BBFAdd_72__in2;
    wire [63:0] _BBFAdd_72__in1;
    BBFAdd BBFAdd_72 (
        .out(_BBFAdd_72__out),
        .in2(_BBFAdd_72__in2),
        .in1(_BBFAdd_72__in1)
    );
    wire [63:0] _T_2616_node;
    wire [63:0] _BBFMultiply_2_1__out;
    wire [63:0] _BBFMultiply_2_1__in2;
    wire [63:0] _BBFMultiply_2_1__in1;
    BBFMultiply BBFMultiply_2_1 (
        .out(_BBFMultiply_2_1__out),
        .in2(_BBFMultiply_2_1__in2),
        .in1(_BBFMultiply_2_1__in1)
    );
    wire [63:0] _T_2622_node;
    wire [63:0] _BBFMultiply_3_1__out;
    wire [63:0] _BBFMultiply_3_1__in2;
    wire [63:0] _BBFMultiply_3_1__in1;
    BBFMultiply BBFMultiply_3_1 (
        .out(_BBFMultiply_3_1__out),
        .in2(_BBFMultiply_3_1__in2),
        .in1(_BBFMultiply_3_1__in1)
    );
    wire [63:0] _T_2628_node;
    wire [63:0] _BBFAdd_1_1__out;
    wire [63:0] _BBFAdd_1_1__in2;
    wire [63:0] _BBFAdd_1_1__in1;
    BBFAdd BBFAdd_1_1 (
        .out(_BBFAdd_1_1__out),
        .in2(_BBFAdd_1_1__in2),
        .in1(_BBFAdd_1_1__in1)
    );
    wire [63:0] _T_2634_node;
    wire [63:0] _T_2650_real_node;
    wire [63:0] _T_2650_imaginary_node;
    wire [63:0] _BBFAdd_2_1__out;
    wire [63:0] _BBFAdd_2_1__in2;
    wire [63:0] _BBFAdd_2_1__in1;
    BBFAdd BBFAdd_2_1 (
        .out(_BBFAdd_2_1__out),
        .in2(_BBFAdd_2_1__in2),
        .in1(_BBFAdd_2_1__in1)
    );
    wire [63:0] _T_2654_node;
    wire [63:0] _BBFAdd_3_1__out;
    wire [63:0] _BBFAdd_3_1__in2;
    wire [63:0] _BBFAdd_3_1__in1;
    BBFAdd BBFAdd_3_1 (
        .out(_BBFAdd_3_1__out),
        .in2(_BBFAdd_3_1__in2),
        .in1(_BBFAdd_3_1__in1)
    );
    wire [63:0] _T_2660_node;
    wire [63:0] _T_2676_real_node;
    wire [63:0] _T_2676_imaginary_node;
    wire [63:0] _T_2680_node;
    wire [63:0] _BBFSubtract_8_1__out;
    wire [63:0] _BBFSubtract_8_1__in2;
    wire [63:0] _BBFSubtract_8_1__in1;
    BBFSubtract BBFSubtract_8_1 (
        .out(_BBFSubtract_8_1__out),
        .in2(_BBFSubtract_8_1__in2),
        .in1(_BBFSubtract_8_1__in1)
    );
    wire [63:0] _T_2687_node;
    wire [63:0] _T_2693_node;
    wire [63:0] _BBFSubtract_9_1__out;
    wire [63:0] _BBFSubtract_9_1__in2;
    wire [63:0] _BBFSubtract_9_1__in1;
    BBFSubtract BBFSubtract_9_1 (
        .out(_BBFSubtract_9_1__out),
        .in2(_BBFSubtract_9_1__in2),
        .in1(_BBFSubtract_9_1__in1)
    );
    wire [63:0] _T_2700_node;
    wire [63:0] _T_2716_real_node;
    wire [63:0] _T_2716_imaginary_node;
    wire [63:0] _BBFAdd_4_1__out;
    wire [63:0] _BBFAdd_4_1__in2;
    wire [63:0] _BBFAdd_4_1__in1;
    BBFAdd BBFAdd_4_1 (
        .out(_BBFAdd_4_1__out),
        .in2(_BBFAdd_4_1__in2),
        .in1(_BBFAdd_4_1__in1)
    );
    wire [63:0] _T_2720_node;
    wire [63:0] _BBFAdd_5_1__out;
    wire [63:0] _BBFAdd_5_1__in2;
    wire [63:0] _BBFAdd_5_1__in1;
    BBFAdd BBFAdd_5_1 (
        .out(_BBFAdd_5_1__out),
        .in2(_BBFAdd_5_1__in2),
        .in1(_BBFAdd_5_1__in1)
    );
    wire [63:0] _T_2726_node;
    wire [63:0] _T_2742_real_node;
    wire [63:0] _T_2742_imaginary_node;
    wire _T_2757_real_node__T_2768_clk;
    wire _T_2757_real_node__T_2768_en;
    wire _T_2757_real_node__T_2768_mask;
    wire _T_2757_real_node__T_2768_addr;
    wire [63:0] _T_2757_real_node__T_2768_data;
    wire [63:0] _T_2757_real_node__T_2776_data;
    wire _T_2757_real_node__T_2776_clk;
    wire _T_2757_real_node__T_2776_en;
    wire _T_2757_real_node__T_2776_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2757_real_node (
        .read_data(_T_2757_real_node__T_2776_data),
        .read_clk(_T_2757_real_node__T_2776_clk),
        .read_en(_T_2757_real_node__T_2776_en),
        .read_addr(_T_2757_real_node__T_2776_addr),
        .write_clk(_T_2757_real_node__T_2768_clk),
        .write_en(_T_2757_real_node__T_2768_en),
        .write_mask(_T_2757_real_node__T_2768_mask),
        .write_addr(_T_2757_real_node__T_2768_addr),
        .write_data(_T_2757_real_node__T_2768_data)
    );
    wire _T_2757_imaginary_node__T_2768_clk;
    wire _T_2757_imaginary_node__T_2768_en;
    wire _T_2757_imaginary_node__T_2768_mask;
    wire _T_2757_imaginary_node__T_2768_addr;
    wire [63:0] _T_2757_imaginary_node__T_2768_data;
    wire [63:0] _T_2757_imaginary_node__T_2776_data;
    wire _T_2757_imaginary_node__T_2776_clk;
    wire _T_2757_imaginary_node__T_2776_en;
    wire _T_2757_imaginary_node__T_2776_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2757_imaginary_node (
        .read_data(_T_2757_imaginary_node__T_2776_data),
        .read_clk(_T_2757_imaginary_node__T_2776_clk),
        .read_en(_T_2757_imaginary_node__T_2776_en),
        .read_addr(_T_2757_imaginary_node__T_2776_addr),
        .write_clk(_T_2757_imaginary_node__T_2768_clk),
        .write_en(_T_2757_imaginary_node__T_2768_en),
        .write_mask(_T_2757_imaginary_node__T_2768_mask),
        .write_addr(_T_2757_imaginary_node__T_2768_addr),
        .write_data(_T_2757_imaginary_node__T_2768_data)
    );
    wire _T_2760;
    BITWISEAND #(.width(1)) bitwiseand_875 (
        .y(_T_2760),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2757_real_node__T_2768_addr = 1'h0;
    assign _T_2757_real_node__T_2768_en = io_in_valid;
    assign _T_2757_real_node__T_2768_clk = clock;
    assign _T_2757_imaginary_node__T_2768_addr = 1'h0;
    assign _T_2757_imaginary_node__T_2768_en = io_in_valid;
    assign _T_2757_imaginary_node__T_2768_clk = clock;
    assign _T_2757_imaginary_node__T_2768_mask = 1'h1;
    assign _T_2757_real_node__T_2768_mask = 1'h1;
    assign _T_2757_real_node__T_2776_addr = 1'h0;
    assign _T_2757_real_node__T_2776_en = 1'h1;
    assign _T_2757_real_node__T_2776_clk = clock;
    assign _T_2757_imaginary_node__T_2776_addr = 1'h0;
    assign _T_2757_imaginary_node__T_2776_en = 1'h1;
    assign _T_2757_imaginary_node__T_2776_clk = clock;
    wire _T_2791_real_node__T_2802_clk;
    wire _T_2791_real_node__T_2802_en;
    wire _T_2791_real_node__T_2802_mask;
    wire _T_2791_real_node__T_2802_addr;
    wire [63:0] _T_2791_real_node__T_2802_data;
    wire [63:0] _T_2791_real_node__T_2810_data;
    wire _T_2791_real_node__T_2810_clk;
    wire _T_2791_real_node__T_2810_en;
    wire _T_2791_real_node__T_2810_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2791_real_node (
        .read_data(_T_2791_real_node__T_2810_data),
        .read_clk(_T_2791_real_node__T_2810_clk),
        .read_en(_T_2791_real_node__T_2810_en),
        .read_addr(_T_2791_real_node__T_2810_addr),
        .write_clk(_T_2791_real_node__T_2802_clk),
        .write_en(_T_2791_real_node__T_2802_en),
        .write_mask(_T_2791_real_node__T_2802_mask),
        .write_addr(_T_2791_real_node__T_2802_addr),
        .write_data(_T_2791_real_node__T_2802_data)
    );
    wire _T_2791_imaginary_node__T_2802_clk;
    wire _T_2791_imaginary_node__T_2802_en;
    wire _T_2791_imaginary_node__T_2802_mask;
    wire _T_2791_imaginary_node__T_2802_addr;
    wire [63:0] _T_2791_imaginary_node__T_2802_data;
    wire [63:0] _T_2791_imaginary_node__T_2810_data;
    wire _T_2791_imaginary_node__T_2810_clk;
    wire _T_2791_imaginary_node__T_2810_en;
    wire _T_2791_imaginary_node__T_2810_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2791_imaginary_node (
        .read_data(_T_2791_imaginary_node__T_2810_data),
        .read_clk(_T_2791_imaginary_node__T_2810_clk),
        .read_en(_T_2791_imaginary_node__T_2810_en),
        .read_addr(_T_2791_imaginary_node__T_2810_addr),
        .write_clk(_T_2791_imaginary_node__T_2802_clk),
        .write_en(_T_2791_imaginary_node__T_2802_en),
        .write_mask(_T_2791_imaginary_node__T_2802_mask),
        .write_addr(_T_2791_imaginary_node__T_2802_addr),
        .write_data(_T_2791_imaginary_node__T_2802_data)
    );
    wire _T_2794;
    BITWISEAND #(.width(1)) bitwiseand_876 (
        .y(_T_2794),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2791_real_node__T_2802_addr = 1'h0;
    assign _T_2791_real_node__T_2802_en = io_in_valid;
    assign _T_2791_real_node__T_2802_clk = clock;
    assign _T_2791_imaginary_node__T_2802_addr = 1'h0;
    assign _T_2791_imaginary_node__T_2802_en = io_in_valid;
    assign _T_2791_imaginary_node__T_2802_clk = clock;
    assign _T_2791_imaginary_node__T_2802_mask = 1'h1;
    assign _T_2791_real_node__T_2802_mask = 1'h1;
    assign _T_2791_real_node__T_2810_addr = 1'h0;
    assign _T_2791_real_node__T_2810_en = 1'h1;
    assign _T_2791_real_node__T_2810_clk = clock;
    assign _T_2791_imaginary_node__T_2810_addr = 1'h0;
    assign _T_2791_imaginary_node__T_2810_en = 1'h1;
    assign _T_2791_imaginary_node__T_2810_clk = clock;
    wire [63:0] _BBFMultiply_4_1__out;
    wire [63:0] _BBFMultiply_4_1__in2;
    wire [63:0] _BBFMultiply_4_1__in1;
    BBFMultiply BBFMultiply_4_1 (
        .out(_BBFMultiply_4_1__out),
        .in2(_BBFMultiply_4_1__in2),
        .in1(_BBFMultiply_4_1__in1)
    );
    wire [63:0] _T_2814_node;
    wire [63:0] _BBFMultiply_5_1__out;
    wire [63:0] _BBFMultiply_5_1__in2;
    wire [63:0] _BBFMultiply_5_1__in1;
    BBFMultiply BBFMultiply_5_1 (
        .out(_BBFMultiply_5_1__out),
        .in2(_BBFMultiply_5_1__in2),
        .in1(_BBFMultiply_5_1__in1)
    );
    wire [63:0] _T_2820_node;
    wire [63:0] _T_2826_node;
    wire [63:0] _BBFSubtract_10_1__out;
    wire [63:0] _BBFSubtract_10_1__in2;
    wire [63:0] _BBFSubtract_10_1__in1;
    BBFSubtract BBFSubtract_10_1 (
        .out(_BBFSubtract_10_1__out),
        .in2(_BBFSubtract_10_1__in2),
        .in1(_BBFSubtract_10_1__in1)
    );
    wire [63:0] _T_2833_node;
    wire [63:0] _BBFAdd_6_1__out;
    wire [63:0] _BBFAdd_6_1__in2;
    wire [63:0] _BBFAdd_6_1__in1;
    BBFAdd BBFAdd_6_1 (
        .out(_BBFAdd_6_1__out),
        .in2(_BBFAdd_6_1__in2),
        .in1(_BBFAdd_6_1__in1)
    );
    wire [63:0] _T_2839_node;
    wire [63:0] _BBFMultiply_6_1__out;
    wire [63:0] _BBFMultiply_6_1__in2;
    wire [63:0] _BBFMultiply_6_1__in1;
    BBFMultiply BBFMultiply_6_1 (
        .out(_BBFMultiply_6_1__out),
        .in2(_BBFMultiply_6_1__in2),
        .in1(_BBFMultiply_6_1__in1)
    );
    wire [63:0] _T_2845_node;
    wire [63:0] _BBFMultiply_7_1__out;
    wire [63:0] _BBFMultiply_7_1__in2;
    wire [63:0] _BBFMultiply_7_1__in1;
    BBFMultiply BBFMultiply_7_1 (
        .out(_BBFMultiply_7_1__out),
        .in2(_BBFMultiply_7_1__in2),
        .in1(_BBFMultiply_7_1__in1)
    );
    wire [63:0] _T_2851_node;
    wire [63:0] _BBFAdd_7_1__out;
    wire [63:0] _BBFAdd_7_1__in2;
    wire [63:0] _BBFAdd_7_1__in1;
    BBFAdd BBFAdd_7_1 (
        .out(_BBFAdd_7_1__out),
        .in2(_BBFAdd_7_1__in2),
        .in1(_BBFAdd_7_1__in1)
    );
    wire [63:0] _T_2857_node;
    wire [63:0] _T_2873_real_node;
    wire [63:0] _T_2873_imaginary_node;
    wire [63:0] _BBFAdd_8_1__out;
    wire [63:0] _BBFAdd_8_1__in2;
    wire [63:0] _BBFAdd_8_1__in1;
    BBFAdd BBFAdd_8_1 (
        .out(_BBFAdd_8_1__out),
        .in2(_BBFAdd_8_1__in2),
        .in1(_BBFAdd_8_1__in1)
    );
    wire [63:0] _T_2877_node;
    wire [63:0] _BBFAdd_9_1__out;
    wire [63:0] _BBFAdd_9_1__in2;
    wire [63:0] _BBFAdd_9_1__in1;
    BBFAdd BBFAdd_9_1 (
        .out(_BBFAdd_9_1__out),
        .in2(_BBFAdd_9_1__in2),
        .in1(_BBFAdd_9_1__in1)
    );
    wire [63:0] _T_2883_node;
    wire [63:0] _T_2899_real_node;
    wire [63:0] _T_2899_imaginary_node;
    wire [63:0] _T_2903_node;
    wire [63:0] _BBFSubtract_11_1__out;
    wire [63:0] _BBFSubtract_11_1__in2;
    wire [63:0] _BBFSubtract_11_1__in1;
    BBFSubtract BBFSubtract_11_1 (
        .out(_BBFSubtract_11_1__out),
        .in2(_BBFSubtract_11_1__in2),
        .in1(_BBFSubtract_11_1__in1)
    );
    wire [63:0] _T_2910_node;
    wire [63:0] _T_2916_node;
    wire [63:0] _BBFSubtract_12_1__out;
    wire [63:0] _BBFSubtract_12_1__in2;
    wire [63:0] _BBFSubtract_12_1__in1;
    BBFSubtract BBFSubtract_12_1 (
        .out(_BBFSubtract_12_1__out),
        .in2(_BBFSubtract_12_1__in2),
        .in1(_BBFSubtract_12_1__in1)
    );
    wire [63:0] _T_2923_node;
    wire [63:0] _T_2939_real_node;
    wire [63:0] _T_2939_imaginary_node;
    wire [63:0] _BBFAdd_10_1__out;
    wire [63:0] _BBFAdd_10_1__in2;
    wire [63:0] _BBFAdd_10_1__in1;
    BBFAdd BBFAdd_10_1 (
        .out(_BBFAdd_10_1__out),
        .in2(_BBFAdd_10_1__in2),
        .in1(_BBFAdd_10_1__in1)
    );
    wire [63:0] _T_2943_node;
    wire [63:0] _BBFAdd_11_1__out;
    wire [63:0] _BBFAdd_11_1__in2;
    wire [63:0] _BBFAdd_11_1__in1;
    BBFAdd BBFAdd_11_1 (
        .out(_BBFAdd_11_1__out),
        .in2(_BBFAdd_11_1__in2),
        .in1(_BBFAdd_11_1__in1)
    );
    wire [63:0] _T_2949_node;
    wire [63:0] _T_2965_real_node;
    wire [63:0] _T_2965_imaginary_node;
    wire _T_2980_real_node__T_2991_clk;
    wire _T_2980_real_node__T_2991_en;
    wire _T_2980_real_node__T_2991_mask;
    wire _T_2980_real_node__T_2991_addr;
    wire [63:0] _T_2980_real_node__T_2991_data;
    wire [63:0] _T_2980_real_node__T_2999_data;
    wire _T_2980_real_node__T_2999_clk;
    wire _T_2980_real_node__T_2999_en;
    wire _T_2980_real_node__T_2999_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2980_real_node (
        .read_data(_T_2980_real_node__T_2999_data),
        .read_clk(_T_2980_real_node__T_2999_clk),
        .read_en(_T_2980_real_node__T_2999_en),
        .read_addr(_T_2980_real_node__T_2999_addr),
        .write_clk(_T_2980_real_node__T_2991_clk),
        .write_en(_T_2980_real_node__T_2991_en),
        .write_mask(_T_2980_real_node__T_2991_mask),
        .write_addr(_T_2980_real_node__T_2991_addr),
        .write_data(_T_2980_real_node__T_2991_data)
    );
    wire _T_2980_imaginary_node__T_2991_clk;
    wire _T_2980_imaginary_node__T_2991_en;
    wire _T_2980_imaginary_node__T_2991_mask;
    wire _T_2980_imaginary_node__T_2991_addr;
    wire [63:0] _T_2980_imaginary_node__T_2991_data;
    wire [63:0] _T_2980_imaginary_node__T_2999_data;
    wire _T_2980_imaginary_node__T_2999_clk;
    wire _T_2980_imaginary_node__T_2999_en;
    wire _T_2980_imaginary_node__T_2999_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2980_imaginary_node (
        .read_data(_T_2980_imaginary_node__T_2999_data),
        .read_clk(_T_2980_imaginary_node__T_2999_clk),
        .read_en(_T_2980_imaginary_node__T_2999_en),
        .read_addr(_T_2980_imaginary_node__T_2999_addr),
        .write_clk(_T_2980_imaginary_node__T_2991_clk),
        .write_en(_T_2980_imaginary_node__T_2991_en),
        .write_mask(_T_2980_imaginary_node__T_2991_mask),
        .write_addr(_T_2980_imaginary_node__T_2991_addr),
        .write_data(_T_2980_imaginary_node__T_2991_data)
    );
    wire _T_2983;
    BITWISEAND #(.width(1)) bitwiseand_877 (
        .y(_T_2983),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2980_real_node__T_2991_addr = 1'h0;
    assign _T_2980_real_node__T_2991_en = io_in_valid;
    assign _T_2980_real_node__T_2991_clk = clock;
    assign _T_2980_imaginary_node__T_2991_addr = 1'h0;
    assign _T_2980_imaginary_node__T_2991_en = io_in_valid;
    assign _T_2980_imaginary_node__T_2991_clk = clock;
    assign _T_2980_imaginary_node__T_2991_mask = 1'h1;
    assign _T_2980_real_node__T_2991_mask = 1'h1;
    assign _T_2980_real_node__T_2999_addr = 1'h0;
    assign _T_2980_real_node__T_2999_en = 1'h1;
    assign _T_2980_real_node__T_2999_clk = clock;
    assign _T_2980_imaginary_node__T_2999_addr = 1'h0;
    assign _T_2980_imaginary_node__T_2999_en = 1'h1;
    assign _T_2980_imaginary_node__T_2999_clk = clock;
    wire _T_3014_real_node__T_3025_clk;
    wire _T_3014_real_node__T_3025_en;
    wire _T_3014_real_node__T_3025_mask;
    wire _T_3014_real_node__T_3025_addr;
    wire [63:0] _T_3014_real_node__T_3025_data;
    wire [63:0] _T_3014_real_node__T_3033_data;
    wire _T_3014_real_node__T_3033_clk;
    wire _T_3014_real_node__T_3033_en;
    wire _T_3014_real_node__T_3033_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3014_real_node (
        .read_data(_T_3014_real_node__T_3033_data),
        .read_clk(_T_3014_real_node__T_3033_clk),
        .read_en(_T_3014_real_node__T_3033_en),
        .read_addr(_T_3014_real_node__T_3033_addr),
        .write_clk(_T_3014_real_node__T_3025_clk),
        .write_en(_T_3014_real_node__T_3025_en),
        .write_mask(_T_3014_real_node__T_3025_mask),
        .write_addr(_T_3014_real_node__T_3025_addr),
        .write_data(_T_3014_real_node__T_3025_data)
    );
    wire _T_3014_imaginary_node__T_3025_clk;
    wire _T_3014_imaginary_node__T_3025_en;
    wire _T_3014_imaginary_node__T_3025_mask;
    wire _T_3014_imaginary_node__T_3025_addr;
    wire [63:0] _T_3014_imaginary_node__T_3025_data;
    wire [63:0] _T_3014_imaginary_node__T_3033_data;
    wire _T_3014_imaginary_node__T_3033_clk;
    wire _T_3014_imaginary_node__T_3033_en;
    wire _T_3014_imaginary_node__T_3033_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3014_imaginary_node (
        .read_data(_T_3014_imaginary_node__T_3033_data),
        .read_clk(_T_3014_imaginary_node__T_3033_clk),
        .read_en(_T_3014_imaginary_node__T_3033_en),
        .read_addr(_T_3014_imaginary_node__T_3033_addr),
        .write_clk(_T_3014_imaginary_node__T_3025_clk),
        .write_en(_T_3014_imaginary_node__T_3025_en),
        .write_mask(_T_3014_imaginary_node__T_3025_mask),
        .write_addr(_T_3014_imaginary_node__T_3025_addr),
        .write_data(_T_3014_imaginary_node__T_3025_data)
    );
    wire _T_3017;
    BITWISEAND #(.width(1)) bitwiseand_878 (
        .y(_T_3017),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3014_real_node__T_3025_addr = 1'h0;
    assign _T_3014_real_node__T_3025_en = io_in_valid;
    assign _T_3014_real_node__T_3025_clk = clock;
    assign _T_3014_imaginary_node__T_3025_addr = 1'h0;
    assign _T_3014_imaginary_node__T_3025_en = io_in_valid;
    assign _T_3014_imaginary_node__T_3025_clk = clock;
    assign _T_3014_imaginary_node__T_3025_mask = 1'h1;
    assign _T_3014_real_node__T_3025_mask = 1'h1;
    assign _T_3014_real_node__T_3033_addr = 1'h0;
    assign _T_3014_real_node__T_3033_en = 1'h1;
    assign _T_3014_real_node__T_3033_clk = clock;
    assign _T_3014_imaginary_node__T_3033_addr = 1'h0;
    assign _T_3014_imaginary_node__T_3033_en = 1'h1;
    assign _T_3014_imaginary_node__T_3033_clk = clock;
    wire [63:0] _BBFMultiply_8_1__out;
    wire [63:0] _BBFMultiply_8_1__in2;
    wire [63:0] _BBFMultiply_8_1__in1;
    BBFMultiply BBFMultiply_8_1 (
        .out(_BBFMultiply_8_1__out),
        .in2(_BBFMultiply_8_1__in2),
        .in1(_BBFMultiply_8_1__in1)
    );
    wire [63:0] _T_3037_node;
    wire [63:0] _BBFMultiply_9_1__out;
    wire [63:0] _BBFMultiply_9_1__in2;
    wire [63:0] _BBFMultiply_9_1__in1;
    BBFMultiply BBFMultiply_9_1 (
        .out(_BBFMultiply_9_1__out),
        .in2(_BBFMultiply_9_1__in2),
        .in1(_BBFMultiply_9_1__in1)
    );
    wire [63:0] _T_3043_node;
    wire [63:0] _T_3049_node;
    wire [63:0] _BBFSubtract_13_1__out;
    wire [63:0] _BBFSubtract_13_1__in2;
    wire [63:0] _BBFSubtract_13_1__in1;
    BBFSubtract BBFSubtract_13_1 (
        .out(_BBFSubtract_13_1__out),
        .in2(_BBFSubtract_13_1__in2),
        .in1(_BBFSubtract_13_1__in1)
    );
    wire [63:0] _T_3056_node;
    wire [63:0] _BBFAdd_12_1__out;
    wire [63:0] _BBFAdd_12_1__in2;
    wire [63:0] _BBFAdd_12_1__in1;
    BBFAdd BBFAdd_12_1 (
        .out(_BBFAdd_12_1__out),
        .in2(_BBFAdd_12_1__in2),
        .in1(_BBFAdd_12_1__in1)
    );
    wire [63:0] _T_3062_node;
    wire [63:0] _BBFMultiply_10_1__out;
    wire [63:0] _BBFMultiply_10_1__in2;
    wire [63:0] _BBFMultiply_10_1__in1;
    BBFMultiply BBFMultiply_10_1 (
        .out(_BBFMultiply_10_1__out),
        .in2(_BBFMultiply_10_1__in2),
        .in1(_BBFMultiply_10_1__in1)
    );
    wire [63:0] _T_3068_node;
    wire [63:0] _BBFMultiply_11_1__out;
    wire [63:0] _BBFMultiply_11_1__in2;
    wire [63:0] _BBFMultiply_11_1__in1;
    BBFMultiply BBFMultiply_11_1 (
        .out(_BBFMultiply_11_1__out),
        .in2(_BBFMultiply_11_1__in2),
        .in1(_BBFMultiply_11_1__in1)
    );
    wire [63:0] _T_3074_node;
    wire [63:0] _BBFAdd_13_1__out;
    wire [63:0] _BBFAdd_13_1__in2;
    wire [63:0] _BBFAdd_13_1__in1;
    BBFAdd BBFAdd_13_1 (
        .out(_BBFAdd_13_1__out),
        .in2(_BBFAdd_13_1__in2),
        .in1(_BBFAdd_13_1__in1)
    );
    wire [63:0] _T_3080_node;
    wire [63:0] _T_3096_real_node;
    wire [63:0] _T_3096_imaginary_node;
    wire [63:0] _BBFAdd_14_1__out;
    wire [63:0] _BBFAdd_14_1__in2;
    wire [63:0] _BBFAdd_14_1__in1;
    BBFAdd BBFAdd_14_1 (
        .out(_BBFAdd_14_1__out),
        .in2(_BBFAdd_14_1__in2),
        .in1(_BBFAdd_14_1__in1)
    );
    wire [63:0] _T_3100_node;
    wire [63:0] _BBFAdd_15_1__out;
    wire [63:0] _BBFAdd_15_1__in2;
    wire [63:0] _BBFAdd_15_1__in1;
    BBFAdd BBFAdd_15_1 (
        .out(_BBFAdd_15_1__out),
        .in2(_BBFAdd_15_1__in2),
        .in1(_BBFAdd_15_1__in1)
    );
    wire [63:0] _T_3106_node;
    wire [63:0] _T_3122_real_node;
    wire [63:0] _T_3122_imaginary_node;
    wire [63:0] _T_3126_node;
    wire [63:0] _BBFSubtract_14_1__out;
    wire [63:0] _BBFSubtract_14_1__in2;
    wire [63:0] _BBFSubtract_14_1__in1;
    BBFSubtract BBFSubtract_14_1 (
        .out(_BBFSubtract_14_1__out),
        .in2(_BBFSubtract_14_1__in2),
        .in1(_BBFSubtract_14_1__in1)
    );
    wire [63:0] _T_3133_node;
    wire [63:0] _T_3139_node;
    wire [63:0] _BBFSubtract_15_1__out;
    wire [63:0] _BBFSubtract_15_1__in2;
    wire [63:0] _BBFSubtract_15_1__in1;
    BBFSubtract BBFSubtract_15_1 (
        .out(_BBFSubtract_15_1__out),
        .in2(_BBFSubtract_15_1__in2),
        .in1(_BBFSubtract_15_1__in1)
    );
    wire [63:0] _T_3146_node;
    wire [63:0] _T_3162_real_node;
    wire [63:0] _T_3162_imaginary_node;
    wire [63:0] _BBFAdd_16_1__out;
    wire [63:0] _BBFAdd_16_1__in2;
    wire [63:0] _BBFAdd_16_1__in1;
    BBFAdd BBFAdd_16_1 (
        .out(_BBFAdd_16_1__out),
        .in2(_BBFAdd_16_1__in2),
        .in1(_BBFAdd_16_1__in1)
    );
    wire [63:0] _T_3166_node;
    wire [63:0] _BBFAdd_17_1__out;
    wire [63:0] _BBFAdd_17_1__in2;
    wire [63:0] _BBFAdd_17_1__in1;
    BBFAdd BBFAdd_17_1 (
        .out(_BBFAdd_17_1__out),
        .in2(_BBFAdd_17_1__in2),
        .in1(_BBFAdd_17_1__in1)
    );
    wire [63:0] _T_3172_node;
    wire [63:0] _T_3188_real_node;
    wire [63:0] _T_3188_imaginary_node;
    wire _T_3203_real_node__T_3214_clk;
    wire _T_3203_real_node__T_3214_en;
    wire _T_3203_real_node__T_3214_mask;
    wire _T_3203_real_node__T_3214_addr;
    wire [63:0] _T_3203_real_node__T_3214_data;
    wire [63:0] _T_3203_real_node__T_3222_data;
    wire _T_3203_real_node__T_3222_clk;
    wire _T_3203_real_node__T_3222_en;
    wire _T_3203_real_node__T_3222_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3203_real_node (
        .read_data(_T_3203_real_node__T_3222_data),
        .read_clk(_T_3203_real_node__T_3222_clk),
        .read_en(_T_3203_real_node__T_3222_en),
        .read_addr(_T_3203_real_node__T_3222_addr),
        .write_clk(_T_3203_real_node__T_3214_clk),
        .write_en(_T_3203_real_node__T_3214_en),
        .write_mask(_T_3203_real_node__T_3214_mask),
        .write_addr(_T_3203_real_node__T_3214_addr),
        .write_data(_T_3203_real_node__T_3214_data)
    );
    wire _T_3203_imaginary_node__T_3214_clk;
    wire _T_3203_imaginary_node__T_3214_en;
    wire _T_3203_imaginary_node__T_3214_mask;
    wire _T_3203_imaginary_node__T_3214_addr;
    wire [63:0] _T_3203_imaginary_node__T_3214_data;
    wire [63:0] _T_3203_imaginary_node__T_3222_data;
    wire _T_3203_imaginary_node__T_3222_clk;
    wire _T_3203_imaginary_node__T_3222_en;
    wire _T_3203_imaginary_node__T_3222_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3203_imaginary_node (
        .read_data(_T_3203_imaginary_node__T_3222_data),
        .read_clk(_T_3203_imaginary_node__T_3222_clk),
        .read_en(_T_3203_imaginary_node__T_3222_en),
        .read_addr(_T_3203_imaginary_node__T_3222_addr),
        .write_clk(_T_3203_imaginary_node__T_3214_clk),
        .write_en(_T_3203_imaginary_node__T_3214_en),
        .write_mask(_T_3203_imaginary_node__T_3214_mask),
        .write_addr(_T_3203_imaginary_node__T_3214_addr),
        .write_data(_T_3203_imaginary_node__T_3214_data)
    );
    wire _T_3206;
    BITWISEAND #(.width(1)) bitwiseand_879 (
        .y(_T_3206),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3203_real_node__T_3214_addr = 1'h0;
    assign _T_3203_real_node__T_3214_en = io_in_valid;
    assign _T_3203_real_node__T_3214_clk = clock;
    assign _T_3203_imaginary_node__T_3214_addr = 1'h0;
    assign _T_3203_imaginary_node__T_3214_en = io_in_valid;
    assign _T_3203_imaginary_node__T_3214_clk = clock;
    assign _T_3203_imaginary_node__T_3214_mask = 1'h1;
    assign _T_3203_real_node__T_3214_mask = 1'h1;
    assign _T_3203_real_node__T_3222_addr = 1'h0;
    assign _T_3203_real_node__T_3222_en = 1'h1;
    assign _T_3203_real_node__T_3222_clk = clock;
    assign _T_3203_imaginary_node__T_3222_addr = 1'h0;
    assign _T_3203_imaginary_node__T_3222_en = 1'h1;
    assign _T_3203_imaginary_node__T_3222_clk = clock;
    wire _T_3237_real_node__T_3248_clk;
    wire _T_3237_real_node__T_3248_en;
    wire _T_3237_real_node__T_3248_mask;
    wire _T_3237_real_node__T_3248_addr;
    wire [63:0] _T_3237_real_node__T_3248_data;
    wire [63:0] _T_3237_real_node__T_3256_data;
    wire _T_3237_real_node__T_3256_clk;
    wire _T_3237_real_node__T_3256_en;
    wire _T_3237_real_node__T_3256_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3237_real_node (
        .read_data(_T_3237_real_node__T_3256_data),
        .read_clk(_T_3237_real_node__T_3256_clk),
        .read_en(_T_3237_real_node__T_3256_en),
        .read_addr(_T_3237_real_node__T_3256_addr),
        .write_clk(_T_3237_real_node__T_3248_clk),
        .write_en(_T_3237_real_node__T_3248_en),
        .write_mask(_T_3237_real_node__T_3248_mask),
        .write_addr(_T_3237_real_node__T_3248_addr),
        .write_data(_T_3237_real_node__T_3248_data)
    );
    wire _T_3237_imaginary_node__T_3248_clk;
    wire _T_3237_imaginary_node__T_3248_en;
    wire _T_3237_imaginary_node__T_3248_mask;
    wire _T_3237_imaginary_node__T_3248_addr;
    wire [63:0] _T_3237_imaginary_node__T_3248_data;
    wire [63:0] _T_3237_imaginary_node__T_3256_data;
    wire _T_3237_imaginary_node__T_3256_clk;
    wire _T_3237_imaginary_node__T_3256_en;
    wire _T_3237_imaginary_node__T_3256_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3237_imaginary_node (
        .read_data(_T_3237_imaginary_node__T_3256_data),
        .read_clk(_T_3237_imaginary_node__T_3256_clk),
        .read_en(_T_3237_imaginary_node__T_3256_en),
        .read_addr(_T_3237_imaginary_node__T_3256_addr),
        .write_clk(_T_3237_imaginary_node__T_3248_clk),
        .write_en(_T_3237_imaginary_node__T_3248_en),
        .write_mask(_T_3237_imaginary_node__T_3248_mask),
        .write_addr(_T_3237_imaginary_node__T_3248_addr),
        .write_data(_T_3237_imaginary_node__T_3248_data)
    );
    wire _T_3240;
    BITWISEAND #(.width(1)) bitwiseand_880 (
        .y(_T_3240),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3237_real_node__T_3248_addr = 1'h0;
    assign _T_3237_real_node__T_3248_en = io_in_valid;
    assign _T_3237_real_node__T_3248_clk = clock;
    assign _T_3237_imaginary_node__T_3248_addr = 1'h0;
    assign _T_3237_imaginary_node__T_3248_en = io_in_valid;
    assign _T_3237_imaginary_node__T_3248_clk = clock;
    assign _T_3237_imaginary_node__T_3248_mask = 1'h1;
    assign _T_3237_real_node__T_3248_mask = 1'h1;
    assign _T_3237_real_node__T_3256_addr = 1'h0;
    assign _T_3237_real_node__T_3256_en = 1'h1;
    assign _T_3237_real_node__T_3256_clk = clock;
    assign _T_3237_imaginary_node__T_3256_addr = 1'h0;
    assign _T_3237_imaginary_node__T_3256_en = 1'h1;
    assign _T_3237_imaginary_node__T_3256_clk = clock;
    wire [63:0] _BBFMultiply_12_1__out;
    wire [63:0] _BBFMultiply_12_1__in2;
    wire [63:0] _BBFMultiply_12_1__in1;
    BBFMultiply BBFMultiply_12_1 (
        .out(_BBFMultiply_12_1__out),
        .in2(_BBFMultiply_12_1__in2),
        .in1(_BBFMultiply_12_1__in1)
    );
    wire [63:0] _T_3260_node;
    wire [63:0] _BBFMultiply_13_1__out;
    wire [63:0] _BBFMultiply_13_1__in2;
    wire [63:0] _BBFMultiply_13_1__in1;
    BBFMultiply BBFMultiply_13_1 (
        .out(_BBFMultiply_13_1__out),
        .in2(_BBFMultiply_13_1__in2),
        .in1(_BBFMultiply_13_1__in1)
    );
    wire [63:0] _T_3266_node;
    wire [63:0] _T_3272_node;
    wire [63:0] _BBFSubtract_16_1__out;
    wire [63:0] _BBFSubtract_16_1__in2;
    wire [63:0] _BBFSubtract_16_1__in1;
    BBFSubtract BBFSubtract_16_1 (
        .out(_BBFSubtract_16_1__out),
        .in2(_BBFSubtract_16_1__in2),
        .in1(_BBFSubtract_16_1__in1)
    );
    wire [63:0] _T_3279_node;
    wire [63:0] _BBFAdd_18_1__out;
    wire [63:0] _BBFAdd_18_1__in2;
    wire [63:0] _BBFAdd_18_1__in1;
    BBFAdd BBFAdd_18_1 (
        .out(_BBFAdd_18_1__out),
        .in2(_BBFAdd_18_1__in2),
        .in1(_BBFAdd_18_1__in1)
    );
    wire [63:0] _T_3285_node;
    wire [63:0] _BBFMultiply_14_1__out;
    wire [63:0] _BBFMultiply_14_1__in2;
    wire [63:0] _BBFMultiply_14_1__in1;
    BBFMultiply BBFMultiply_14_1 (
        .out(_BBFMultiply_14_1__out),
        .in2(_BBFMultiply_14_1__in2),
        .in1(_BBFMultiply_14_1__in1)
    );
    wire [63:0] _T_3291_node;
    wire [63:0] _BBFMultiply_15_1__out;
    wire [63:0] _BBFMultiply_15_1__in2;
    wire [63:0] _BBFMultiply_15_1__in1;
    BBFMultiply BBFMultiply_15_1 (
        .out(_BBFMultiply_15_1__out),
        .in2(_BBFMultiply_15_1__in2),
        .in1(_BBFMultiply_15_1__in1)
    );
    wire [63:0] _T_3297_node;
    wire [63:0] _BBFAdd_19_1__out;
    wire [63:0] _BBFAdd_19_1__in2;
    wire [63:0] _BBFAdd_19_1__in1;
    BBFAdd BBFAdd_19_1 (
        .out(_BBFAdd_19_1__out),
        .in2(_BBFAdd_19_1__in2),
        .in1(_BBFAdd_19_1__in1)
    );
    wire [63:0] _T_3303_node;
    wire [63:0] _T_3319_real_node;
    wire [63:0] _T_3319_imaginary_node;
    wire [63:0] _BBFAdd_20_1__out;
    wire [63:0] _BBFAdd_20_1__in2;
    wire [63:0] _BBFAdd_20_1__in1;
    BBFAdd BBFAdd_20_1 (
        .out(_BBFAdd_20_1__out),
        .in2(_BBFAdd_20_1__in2),
        .in1(_BBFAdd_20_1__in1)
    );
    wire [63:0] _T_3323_node;
    wire [63:0] _BBFAdd_21_1__out;
    wire [63:0] _BBFAdd_21_1__in2;
    wire [63:0] _BBFAdd_21_1__in1;
    BBFAdd BBFAdd_21_1 (
        .out(_BBFAdd_21_1__out),
        .in2(_BBFAdd_21_1__in2),
        .in1(_BBFAdd_21_1__in1)
    );
    wire [63:0] _T_3329_node;
    wire [63:0] _T_3345_real_node;
    wire [63:0] _T_3345_imaginary_node;
    wire [63:0] _T_3349_node;
    wire [63:0] _BBFSubtract_17_1__out;
    wire [63:0] _BBFSubtract_17_1__in2;
    wire [63:0] _BBFSubtract_17_1__in1;
    BBFSubtract BBFSubtract_17_1 (
        .out(_BBFSubtract_17_1__out),
        .in2(_BBFSubtract_17_1__in2),
        .in1(_BBFSubtract_17_1__in1)
    );
    wire [63:0] _T_3356_node;
    wire [63:0] _T_3362_node;
    wire [63:0] _BBFSubtract_18_1__out;
    wire [63:0] _BBFSubtract_18_1__in2;
    wire [63:0] _BBFSubtract_18_1__in1;
    BBFSubtract BBFSubtract_18_1 (
        .out(_BBFSubtract_18_1__out),
        .in2(_BBFSubtract_18_1__in2),
        .in1(_BBFSubtract_18_1__in1)
    );
    wire [63:0] _T_3369_node;
    wire [63:0] _T_3385_real_node;
    wire [63:0] _T_3385_imaginary_node;
    wire [63:0] _BBFAdd_22_1__out;
    wire [63:0] _BBFAdd_22_1__in2;
    wire [63:0] _BBFAdd_22_1__in1;
    BBFAdd BBFAdd_22_1 (
        .out(_BBFAdd_22_1__out),
        .in2(_BBFAdd_22_1__in2),
        .in1(_BBFAdd_22_1__in1)
    );
    wire [63:0] _T_3389_node;
    wire [63:0] _BBFAdd_23_1__out;
    wire [63:0] _BBFAdd_23_1__in2;
    wire [63:0] _BBFAdd_23_1__in1;
    BBFAdd BBFAdd_23_1 (
        .out(_BBFAdd_23_1__out),
        .in2(_BBFAdd_23_1__in2),
        .in1(_BBFAdd_23_1__in1)
    );
    wire [63:0] _T_3395_node;
    wire [63:0] _T_3411_real_node;
    wire [63:0] _T_3411_imaginary_node;
    wire _T_3426_real_node__T_3437_clk;
    wire _T_3426_real_node__T_3437_en;
    wire _T_3426_real_node__T_3437_mask;
    wire _T_3426_real_node__T_3437_addr;
    wire [63:0] _T_3426_real_node__T_3437_data;
    wire [63:0] _T_3426_real_node__T_3445_data;
    wire _T_3426_real_node__T_3445_clk;
    wire _T_3426_real_node__T_3445_en;
    wire _T_3426_real_node__T_3445_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3426_real_node (
        .read_data(_T_3426_real_node__T_3445_data),
        .read_clk(_T_3426_real_node__T_3445_clk),
        .read_en(_T_3426_real_node__T_3445_en),
        .read_addr(_T_3426_real_node__T_3445_addr),
        .write_clk(_T_3426_real_node__T_3437_clk),
        .write_en(_T_3426_real_node__T_3437_en),
        .write_mask(_T_3426_real_node__T_3437_mask),
        .write_addr(_T_3426_real_node__T_3437_addr),
        .write_data(_T_3426_real_node__T_3437_data)
    );
    wire _T_3426_imaginary_node__T_3437_clk;
    wire _T_3426_imaginary_node__T_3437_en;
    wire _T_3426_imaginary_node__T_3437_mask;
    wire _T_3426_imaginary_node__T_3437_addr;
    wire [63:0] _T_3426_imaginary_node__T_3437_data;
    wire [63:0] _T_3426_imaginary_node__T_3445_data;
    wire _T_3426_imaginary_node__T_3445_clk;
    wire _T_3426_imaginary_node__T_3445_en;
    wire _T_3426_imaginary_node__T_3445_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3426_imaginary_node (
        .read_data(_T_3426_imaginary_node__T_3445_data),
        .read_clk(_T_3426_imaginary_node__T_3445_clk),
        .read_en(_T_3426_imaginary_node__T_3445_en),
        .read_addr(_T_3426_imaginary_node__T_3445_addr),
        .write_clk(_T_3426_imaginary_node__T_3437_clk),
        .write_en(_T_3426_imaginary_node__T_3437_en),
        .write_mask(_T_3426_imaginary_node__T_3437_mask),
        .write_addr(_T_3426_imaginary_node__T_3437_addr),
        .write_data(_T_3426_imaginary_node__T_3437_data)
    );
    wire _T_3429;
    BITWISEAND #(.width(1)) bitwiseand_881 (
        .y(_T_3429),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3426_real_node__T_3437_addr = 1'h0;
    assign _T_3426_real_node__T_3437_en = io_in_valid;
    assign _T_3426_real_node__T_3437_clk = clock;
    assign _T_3426_imaginary_node__T_3437_addr = 1'h0;
    assign _T_3426_imaginary_node__T_3437_en = io_in_valid;
    assign _T_3426_imaginary_node__T_3437_clk = clock;
    assign _T_3426_imaginary_node__T_3437_mask = 1'h1;
    assign _T_3426_real_node__T_3437_mask = 1'h1;
    assign _T_3426_real_node__T_3445_addr = 1'h0;
    assign _T_3426_real_node__T_3445_en = 1'h1;
    assign _T_3426_real_node__T_3445_clk = clock;
    assign _T_3426_imaginary_node__T_3445_addr = 1'h0;
    assign _T_3426_imaginary_node__T_3445_en = 1'h1;
    assign _T_3426_imaginary_node__T_3445_clk = clock;
    wire _T_3460_real_node__T_3471_clk;
    wire _T_3460_real_node__T_3471_en;
    wire _T_3460_real_node__T_3471_mask;
    wire _T_3460_real_node__T_3471_addr;
    wire [63:0] _T_3460_real_node__T_3471_data;
    wire [63:0] _T_3460_real_node__T_3479_data;
    wire _T_3460_real_node__T_3479_clk;
    wire _T_3460_real_node__T_3479_en;
    wire _T_3460_real_node__T_3479_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3460_real_node (
        .read_data(_T_3460_real_node__T_3479_data),
        .read_clk(_T_3460_real_node__T_3479_clk),
        .read_en(_T_3460_real_node__T_3479_en),
        .read_addr(_T_3460_real_node__T_3479_addr),
        .write_clk(_T_3460_real_node__T_3471_clk),
        .write_en(_T_3460_real_node__T_3471_en),
        .write_mask(_T_3460_real_node__T_3471_mask),
        .write_addr(_T_3460_real_node__T_3471_addr),
        .write_data(_T_3460_real_node__T_3471_data)
    );
    wire _T_3460_imaginary_node__T_3471_clk;
    wire _T_3460_imaginary_node__T_3471_en;
    wire _T_3460_imaginary_node__T_3471_mask;
    wire _T_3460_imaginary_node__T_3471_addr;
    wire [63:0] _T_3460_imaginary_node__T_3471_data;
    wire [63:0] _T_3460_imaginary_node__T_3479_data;
    wire _T_3460_imaginary_node__T_3479_clk;
    wire _T_3460_imaginary_node__T_3479_en;
    wire _T_3460_imaginary_node__T_3479_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3460_imaginary_node (
        .read_data(_T_3460_imaginary_node__T_3479_data),
        .read_clk(_T_3460_imaginary_node__T_3479_clk),
        .read_en(_T_3460_imaginary_node__T_3479_en),
        .read_addr(_T_3460_imaginary_node__T_3479_addr),
        .write_clk(_T_3460_imaginary_node__T_3471_clk),
        .write_en(_T_3460_imaginary_node__T_3471_en),
        .write_mask(_T_3460_imaginary_node__T_3471_mask),
        .write_addr(_T_3460_imaginary_node__T_3471_addr),
        .write_data(_T_3460_imaginary_node__T_3471_data)
    );
    wire _T_3463;
    BITWISEAND #(.width(1)) bitwiseand_882 (
        .y(_T_3463),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3460_real_node__T_3471_addr = 1'h0;
    assign _T_3460_real_node__T_3471_en = io_in_valid;
    assign _T_3460_real_node__T_3471_clk = clock;
    assign _T_3460_imaginary_node__T_3471_addr = 1'h0;
    assign _T_3460_imaginary_node__T_3471_en = io_in_valid;
    assign _T_3460_imaginary_node__T_3471_clk = clock;
    assign _T_3460_imaginary_node__T_3471_mask = 1'h1;
    assign _T_3460_real_node__T_3471_mask = 1'h1;
    assign _T_3460_real_node__T_3479_addr = 1'h0;
    assign _T_3460_real_node__T_3479_en = 1'h1;
    assign _T_3460_real_node__T_3479_clk = clock;
    assign _T_3460_imaginary_node__T_3479_addr = 1'h0;
    assign _T_3460_imaginary_node__T_3479_en = 1'h1;
    assign _T_3460_imaginary_node__T_3479_clk = clock;
    wire _T_3494_real_node__T_3505_clk;
    wire _T_3494_real_node__T_3505_en;
    wire _T_3494_real_node__T_3505_mask;
    wire _T_3494_real_node__T_3505_addr;
    wire [63:0] _T_3494_real_node__T_3505_data;
    wire [63:0] _T_3494_real_node__T_3513_data;
    wire _T_3494_real_node__T_3513_clk;
    wire _T_3494_real_node__T_3513_en;
    wire _T_3494_real_node__T_3513_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3494_real_node (
        .read_data(_T_3494_real_node__T_3513_data),
        .read_clk(_T_3494_real_node__T_3513_clk),
        .read_en(_T_3494_real_node__T_3513_en),
        .read_addr(_T_3494_real_node__T_3513_addr),
        .write_clk(_T_3494_real_node__T_3505_clk),
        .write_en(_T_3494_real_node__T_3505_en),
        .write_mask(_T_3494_real_node__T_3505_mask),
        .write_addr(_T_3494_real_node__T_3505_addr),
        .write_data(_T_3494_real_node__T_3505_data)
    );
    wire _T_3494_imaginary_node__T_3505_clk;
    wire _T_3494_imaginary_node__T_3505_en;
    wire _T_3494_imaginary_node__T_3505_mask;
    wire _T_3494_imaginary_node__T_3505_addr;
    wire [63:0] _T_3494_imaginary_node__T_3505_data;
    wire [63:0] _T_3494_imaginary_node__T_3513_data;
    wire _T_3494_imaginary_node__T_3513_clk;
    wire _T_3494_imaginary_node__T_3513_en;
    wire _T_3494_imaginary_node__T_3513_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3494_imaginary_node (
        .read_data(_T_3494_imaginary_node__T_3513_data),
        .read_clk(_T_3494_imaginary_node__T_3513_clk),
        .read_en(_T_3494_imaginary_node__T_3513_en),
        .read_addr(_T_3494_imaginary_node__T_3513_addr),
        .write_clk(_T_3494_imaginary_node__T_3505_clk),
        .write_en(_T_3494_imaginary_node__T_3505_en),
        .write_mask(_T_3494_imaginary_node__T_3505_mask),
        .write_addr(_T_3494_imaginary_node__T_3505_addr),
        .write_data(_T_3494_imaginary_node__T_3505_data)
    );
    wire _T_3497;
    BITWISEAND #(.width(1)) bitwiseand_883 (
        .y(_T_3497),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3494_real_node__T_3505_addr = 1'h0;
    assign _T_3494_real_node__T_3505_en = io_in_valid;
    assign _T_3494_real_node__T_3505_clk = clock;
    assign _T_3494_imaginary_node__T_3505_addr = 1'h0;
    assign _T_3494_imaginary_node__T_3505_en = io_in_valid;
    assign _T_3494_imaginary_node__T_3505_clk = clock;
    assign _T_3494_imaginary_node__T_3505_mask = 1'h1;
    assign _T_3494_real_node__T_3505_mask = 1'h1;
    assign _T_3494_real_node__T_3513_addr = 1'h0;
    assign _T_3494_real_node__T_3513_en = 1'h1;
    assign _T_3494_real_node__T_3513_clk = clock;
    assign _T_3494_imaginary_node__T_3513_addr = 1'h0;
    assign _T_3494_imaginary_node__T_3513_en = 1'h1;
    assign _T_3494_imaginary_node__T_3513_clk = clock;
    wire [63:0] _BBFMultiply_16_1__out;
    wire [63:0] _BBFMultiply_16_1__in2;
    wire [63:0] _BBFMultiply_16_1__in1;
    BBFMultiply BBFMultiply_16_1 (
        .out(_BBFMultiply_16_1__out),
        .in2(_BBFMultiply_16_1__in2),
        .in1(_BBFMultiply_16_1__in1)
    );
    wire [63:0] _T_3517_node;
    wire [63:0] _BBFMultiply_17_1__out;
    wire [63:0] _BBFMultiply_17_1__in2;
    wire [63:0] _BBFMultiply_17_1__in1;
    BBFMultiply BBFMultiply_17_1 (
        .out(_BBFMultiply_17_1__out),
        .in2(_BBFMultiply_17_1__in2),
        .in1(_BBFMultiply_17_1__in1)
    );
    wire [63:0] _T_3523_node;
    wire [63:0] _T_3529_node;
    wire [63:0] _BBFSubtract_19_1__out;
    wire [63:0] _BBFSubtract_19_1__in2;
    wire [63:0] _BBFSubtract_19_1__in1;
    BBFSubtract BBFSubtract_19_1 (
        .out(_BBFSubtract_19_1__out),
        .in2(_BBFSubtract_19_1__in2),
        .in1(_BBFSubtract_19_1__in1)
    );
    wire [63:0] _T_3536_node;
    wire [63:0] _BBFAdd_24_1__out;
    wire [63:0] _BBFAdd_24_1__in2;
    wire [63:0] _BBFAdd_24_1__in1;
    BBFAdd BBFAdd_24_1 (
        .out(_BBFAdd_24_1__out),
        .in2(_BBFAdd_24_1__in2),
        .in1(_BBFAdd_24_1__in1)
    );
    wire [63:0] _T_3542_node;
    wire [63:0] _BBFMultiply_18_1__out;
    wire [63:0] _BBFMultiply_18_1__in2;
    wire [63:0] _BBFMultiply_18_1__in1;
    BBFMultiply BBFMultiply_18_1 (
        .out(_BBFMultiply_18_1__out),
        .in2(_BBFMultiply_18_1__in2),
        .in1(_BBFMultiply_18_1__in1)
    );
    wire [63:0] _T_3548_node;
    wire [63:0] _BBFMultiply_19_1__out;
    wire [63:0] _BBFMultiply_19_1__in2;
    wire [63:0] _BBFMultiply_19_1__in1;
    BBFMultiply BBFMultiply_19_1 (
        .out(_BBFMultiply_19_1__out),
        .in2(_BBFMultiply_19_1__in2),
        .in1(_BBFMultiply_19_1__in1)
    );
    wire [63:0] _T_3554_node;
    wire [63:0] _BBFAdd_25_1__out;
    wire [63:0] _BBFAdd_25_1__in2;
    wire [63:0] _BBFAdd_25_1__in1;
    BBFAdd BBFAdd_25_1 (
        .out(_BBFAdd_25_1__out),
        .in2(_BBFAdd_25_1__in2),
        .in1(_BBFAdd_25_1__in1)
    );
    wire [63:0] _T_3560_node;
    wire [63:0] _T_3576_real_node;
    wire [63:0] _T_3576_imaginary_node;
    wire [63:0] _BBFAdd_26_1__out;
    wire [63:0] _BBFAdd_26_1__in2;
    wire [63:0] _BBFAdd_26_1__in1;
    BBFAdd BBFAdd_26_1 (
        .out(_BBFAdd_26_1__out),
        .in2(_BBFAdd_26_1__in2),
        .in1(_BBFAdd_26_1__in1)
    );
    wire [63:0] _T_3580_node;
    wire [63:0] _BBFAdd_27_1__out;
    wire [63:0] _BBFAdd_27_1__in2;
    wire [63:0] _BBFAdd_27_1__in1;
    BBFAdd BBFAdd_27_1 (
        .out(_BBFAdd_27_1__out),
        .in2(_BBFAdd_27_1__in2),
        .in1(_BBFAdd_27_1__in1)
    );
    wire [63:0] _T_3586_node;
    wire [63:0] _T_3602_real_node;
    wire [63:0] _T_3602_imaginary_node;
    wire [63:0] _T_3606_node;
    wire [63:0] _BBFSubtract_20_1__out;
    wire [63:0] _BBFSubtract_20_1__in2;
    wire [63:0] _BBFSubtract_20_1__in1;
    BBFSubtract BBFSubtract_20_1 (
        .out(_BBFSubtract_20_1__out),
        .in2(_BBFSubtract_20_1__in2),
        .in1(_BBFSubtract_20_1__in1)
    );
    wire [63:0] _T_3613_node;
    wire [63:0] _T_3619_node;
    wire [63:0] _BBFSubtract_21_1__out;
    wire [63:0] _BBFSubtract_21_1__in2;
    wire [63:0] _BBFSubtract_21_1__in1;
    BBFSubtract BBFSubtract_21_1 (
        .out(_BBFSubtract_21_1__out),
        .in2(_BBFSubtract_21_1__in2),
        .in1(_BBFSubtract_21_1__in1)
    );
    wire [63:0] _T_3626_node;
    wire [63:0] _T_3642_real_node;
    wire [63:0] _T_3642_imaginary_node;
    wire [63:0] _BBFAdd_28_1__out;
    wire [63:0] _BBFAdd_28_1__in2;
    wire [63:0] _BBFAdd_28_1__in1;
    BBFAdd BBFAdd_28_1 (
        .out(_BBFAdd_28_1__out),
        .in2(_BBFAdd_28_1__in2),
        .in1(_BBFAdd_28_1__in1)
    );
    wire [63:0] _T_3646_node;
    wire [63:0] _BBFAdd_29_1__out;
    wire [63:0] _BBFAdd_29_1__in2;
    wire [63:0] _BBFAdd_29_1__in1;
    BBFAdd BBFAdd_29_1 (
        .out(_BBFAdd_29_1__out),
        .in2(_BBFAdd_29_1__in2),
        .in1(_BBFAdd_29_1__in1)
    );
    wire [63:0] _T_3652_node;
    wire [63:0] _T_3668_real_node;
    wire [63:0] _T_3668_imaginary_node;
    wire _T_3683_real_node__T_3694_clk;
    wire _T_3683_real_node__T_3694_en;
    wire _T_3683_real_node__T_3694_mask;
    wire _T_3683_real_node__T_3694_addr;
    wire [63:0] _T_3683_real_node__T_3694_data;
    wire [63:0] _T_3683_real_node__T_3702_data;
    wire _T_3683_real_node__T_3702_clk;
    wire _T_3683_real_node__T_3702_en;
    wire _T_3683_real_node__T_3702_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3683_real_node (
        .read_data(_T_3683_real_node__T_3702_data),
        .read_clk(_T_3683_real_node__T_3702_clk),
        .read_en(_T_3683_real_node__T_3702_en),
        .read_addr(_T_3683_real_node__T_3702_addr),
        .write_clk(_T_3683_real_node__T_3694_clk),
        .write_en(_T_3683_real_node__T_3694_en),
        .write_mask(_T_3683_real_node__T_3694_mask),
        .write_addr(_T_3683_real_node__T_3694_addr),
        .write_data(_T_3683_real_node__T_3694_data)
    );
    wire _T_3683_imaginary_node__T_3694_clk;
    wire _T_3683_imaginary_node__T_3694_en;
    wire _T_3683_imaginary_node__T_3694_mask;
    wire _T_3683_imaginary_node__T_3694_addr;
    wire [63:0] _T_3683_imaginary_node__T_3694_data;
    wire [63:0] _T_3683_imaginary_node__T_3702_data;
    wire _T_3683_imaginary_node__T_3702_clk;
    wire _T_3683_imaginary_node__T_3702_en;
    wire _T_3683_imaginary_node__T_3702_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3683_imaginary_node (
        .read_data(_T_3683_imaginary_node__T_3702_data),
        .read_clk(_T_3683_imaginary_node__T_3702_clk),
        .read_en(_T_3683_imaginary_node__T_3702_en),
        .read_addr(_T_3683_imaginary_node__T_3702_addr),
        .write_clk(_T_3683_imaginary_node__T_3694_clk),
        .write_en(_T_3683_imaginary_node__T_3694_en),
        .write_mask(_T_3683_imaginary_node__T_3694_mask),
        .write_addr(_T_3683_imaginary_node__T_3694_addr),
        .write_data(_T_3683_imaginary_node__T_3694_data)
    );
    wire _T_3686;
    BITWISEAND #(.width(1)) bitwiseand_884 (
        .y(_T_3686),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3683_real_node__T_3694_addr = 1'h0;
    assign _T_3683_real_node__T_3694_en = io_in_valid;
    assign _T_3683_real_node__T_3694_clk = clock;
    assign _T_3683_imaginary_node__T_3694_addr = 1'h0;
    assign _T_3683_imaginary_node__T_3694_en = io_in_valid;
    assign _T_3683_imaginary_node__T_3694_clk = clock;
    assign _T_3683_imaginary_node__T_3694_mask = 1'h1;
    assign _T_3683_real_node__T_3694_mask = 1'h1;
    assign _T_3683_real_node__T_3702_addr = 1'h0;
    assign _T_3683_real_node__T_3702_en = 1'h1;
    assign _T_3683_real_node__T_3702_clk = clock;
    assign _T_3683_imaginary_node__T_3702_addr = 1'h0;
    assign _T_3683_imaginary_node__T_3702_en = 1'h1;
    assign _T_3683_imaginary_node__T_3702_clk = clock;
    wire _T_3717_real_node__T_3728_clk;
    wire _T_3717_real_node__T_3728_en;
    wire _T_3717_real_node__T_3728_mask;
    wire _T_3717_real_node__T_3728_addr;
    wire [63:0] _T_3717_real_node__T_3728_data;
    wire [63:0] _T_3717_real_node__T_3736_data;
    wire _T_3717_real_node__T_3736_clk;
    wire _T_3717_real_node__T_3736_en;
    wire _T_3717_real_node__T_3736_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3717_real_node (
        .read_data(_T_3717_real_node__T_3736_data),
        .read_clk(_T_3717_real_node__T_3736_clk),
        .read_en(_T_3717_real_node__T_3736_en),
        .read_addr(_T_3717_real_node__T_3736_addr),
        .write_clk(_T_3717_real_node__T_3728_clk),
        .write_en(_T_3717_real_node__T_3728_en),
        .write_mask(_T_3717_real_node__T_3728_mask),
        .write_addr(_T_3717_real_node__T_3728_addr),
        .write_data(_T_3717_real_node__T_3728_data)
    );
    wire _T_3717_imaginary_node__T_3728_clk;
    wire _T_3717_imaginary_node__T_3728_en;
    wire _T_3717_imaginary_node__T_3728_mask;
    wire _T_3717_imaginary_node__T_3728_addr;
    wire [63:0] _T_3717_imaginary_node__T_3728_data;
    wire [63:0] _T_3717_imaginary_node__T_3736_data;
    wire _T_3717_imaginary_node__T_3736_clk;
    wire _T_3717_imaginary_node__T_3736_en;
    wire _T_3717_imaginary_node__T_3736_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3717_imaginary_node (
        .read_data(_T_3717_imaginary_node__T_3736_data),
        .read_clk(_T_3717_imaginary_node__T_3736_clk),
        .read_en(_T_3717_imaginary_node__T_3736_en),
        .read_addr(_T_3717_imaginary_node__T_3736_addr),
        .write_clk(_T_3717_imaginary_node__T_3728_clk),
        .write_en(_T_3717_imaginary_node__T_3728_en),
        .write_mask(_T_3717_imaginary_node__T_3728_mask),
        .write_addr(_T_3717_imaginary_node__T_3728_addr),
        .write_data(_T_3717_imaginary_node__T_3728_data)
    );
    wire _T_3720;
    BITWISEAND #(.width(1)) bitwiseand_885 (
        .y(_T_3720),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3717_real_node__T_3728_addr = 1'h0;
    assign _T_3717_real_node__T_3728_en = io_in_valid;
    assign _T_3717_real_node__T_3728_clk = clock;
    assign _T_3717_imaginary_node__T_3728_addr = 1'h0;
    assign _T_3717_imaginary_node__T_3728_en = io_in_valid;
    assign _T_3717_imaginary_node__T_3728_clk = clock;
    assign _T_3717_imaginary_node__T_3728_mask = 1'h1;
    assign _T_3717_real_node__T_3728_mask = 1'h1;
    assign _T_3717_real_node__T_3736_addr = 1'h0;
    assign _T_3717_real_node__T_3736_en = 1'h1;
    assign _T_3717_real_node__T_3736_clk = clock;
    assign _T_3717_imaginary_node__T_3736_addr = 1'h0;
    assign _T_3717_imaginary_node__T_3736_en = 1'h1;
    assign _T_3717_imaginary_node__T_3736_clk = clock;
    wire _T_3751_real_node__T_3762_clk;
    wire _T_3751_real_node__T_3762_en;
    wire _T_3751_real_node__T_3762_mask;
    wire _T_3751_real_node__T_3762_addr;
    wire [63:0] _T_3751_real_node__T_3762_data;
    wire [63:0] _T_3751_real_node__T_3770_data;
    wire _T_3751_real_node__T_3770_clk;
    wire _T_3751_real_node__T_3770_en;
    wire _T_3751_real_node__T_3770_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3751_real_node (
        .read_data(_T_3751_real_node__T_3770_data),
        .read_clk(_T_3751_real_node__T_3770_clk),
        .read_en(_T_3751_real_node__T_3770_en),
        .read_addr(_T_3751_real_node__T_3770_addr),
        .write_clk(_T_3751_real_node__T_3762_clk),
        .write_en(_T_3751_real_node__T_3762_en),
        .write_mask(_T_3751_real_node__T_3762_mask),
        .write_addr(_T_3751_real_node__T_3762_addr),
        .write_data(_T_3751_real_node__T_3762_data)
    );
    wire _T_3751_imaginary_node__T_3762_clk;
    wire _T_3751_imaginary_node__T_3762_en;
    wire _T_3751_imaginary_node__T_3762_mask;
    wire _T_3751_imaginary_node__T_3762_addr;
    wire [63:0] _T_3751_imaginary_node__T_3762_data;
    wire [63:0] _T_3751_imaginary_node__T_3770_data;
    wire _T_3751_imaginary_node__T_3770_clk;
    wire _T_3751_imaginary_node__T_3770_en;
    wire _T_3751_imaginary_node__T_3770_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3751_imaginary_node (
        .read_data(_T_3751_imaginary_node__T_3770_data),
        .read_clk(_T_3751_imaginary_node__T_3770_clk),
        .read_en(_T_3751_imaginary_node__T_3770_en),
        .read_addr(_T_3751_imaginary_node__T_3770_addr),
        .write_clk(_T_3751_imaginary_node__T_3762_clk),
        .write_en(_T_3751_imaginary_node__T_3762_en),
        .write_mask(_T_3751_imaginary_node__T_3762_mask),
        .write_addr(_T_3751_imaginary_node__T_3762_addr),
        .write_data(_T_3751_imaginary_node__T_3762_data)
    );
    wire _T_3754;
    BITWISEAND #(.width(1)) bitwiseand_886 (
        .y(_T_3754),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3751_real_node__T_3762_addr = 1'h0;
    assign _T_3751_real_node__T_3762_en = io_in_valid;
    assign _T_3751_real_node__T_3762_clk = clock;
    assign _T_3751_imaginary_node__T_3762_addr = 1'h0;
    assign _T_3751_imaginary_node__T_3762_en = io_in_valid;
    assign _T_3751_imaginary_node__T_3762_clk = clock;
    assign _T_3751_imaginary_node__T_3762_mask = 1'h1;
    assign _T_3751_real_node__T_3762_mask = 1'h1;
    assign _T_3751_real_node__T_3770_addr = 1'h0;
    assign _T_3751_real_node__T_3770_en = 1'h1;
    assign _T_3751_real_node__T_3770_clk = clock;
    assign _T_3751_imaginary_node__T_3770_addr = 1'h0;
    assign _T_3751_imaginary_node__T_3770_en = 1'h1;
    assign _T_3751_imaginary_node__T_3770_clk = clock;
    wire [63:0] _BBFMultiply_20_1__out;
    wire [63:0] _BBFMultiply_20_1__in2;
    wire [63:0] _BBFMultiply_20_1__in1;
    BBFMultiply BBFMultiply_20_1 (
        .out(_BBFMultiply_20_1__out),
        .in2(_BBFMultiply_20_1__in2),
        .in1(_BBFMultiply_20_1__in1)
    );
    wire [63:0] _T_3774_node;
    wire [63:0] _BBFMultiply_21_1__out;
    wire [63:0] _BBFMultiply_21_1__in2;
    wire [63:0] _BBFMultiply_21_1__in1;
    BBFMultiply BBFMultiply_21_1 (
        .out(_BBFMultiply_21_1__out),
        .in2(_BBFMultiply_21_1__in2),
        .in1(_BBFMultiply_21_1__in1)
    );
    wire [63:0] _T_3780_node;
    wire [63:0] _T_3786_node;
    wire [63:0] _BBFSubtract_22_1__out;
    wire [63:0] _BBFSubtract_22_1__in2;
    wire [63:0] _BBFSubtract_22_1__in1;
    BBFSubtract BBFSubtract_22_1 (
        .out(_BBFSubtract_22_1__out),
        .in2(_BBFSubtract_22_1__in2),
        .in1(_BBFSubtract_22_1__in1)
    );
    wire [63:0] _T_3793_node;
    wire [63:0] _BBFAdd_30_1__out;
    wire [63:0] _BBFAdd_30_1__in2;
    wire [63:0] _BBFAdd_30_1__in1;
    BBFAdd BBFAdd_30_1 (
        .out(_BBFAdd_30_1__out),
        .in2(_BBFAdd_30_1__in2),
        .in1(_BBFAdd_30_1__in1)
    );
    wire [63:0] _T_3799_node;
    wire [63:0] _BBFMultiply_22_1__out;
    wire [63:0] _BBFMultiply_22_1__in2;
    wire [63:0] _BBFMultiply_22_1__in1;
    BBFMultiply BBFMultiply_22_1 (
        .out(_BBFMultiply_22_1__out),
        .in2(_BBFMultiply_22_1__in2),
        .in1(_BBFMultiply_22_1__in1)
    );
    wire [63:0] _T_3805_node;
    wire [63:0] _BBFMultiply_23_1__out;
    wire [63:0] _BBFMultiply_23_1__in2;
    wire [63:0] _BBFMultiply_23_1__in1;
    BBFMultiply BBFMultiply_23_1 (
        .out(_BBFMultiply_23_1__out),
        .in2(_BBFMultiply_23_1__in2),
        .in1(_BBFMultiply_23_1__in1)
    );
    wire [63:0] _T_3811_node;
    wire [63:0] _BBFAdd_31_1__out;
    wire [63:0] _BBFAdd_31_1__in2;
    wire [63:0] _BBFAdd_31_1__in1;
    BBFAdd BBFAdd_31_1 (
        .out(_BBFAdd_31_1__out),
        .in2(_BBFAdd_31_1__in2),
        .in1(_BBFAdd_31_1__in1)
    );
    wire [63:0] _T_3817_node;
    wire [63:0] _T_3833_real_node;
    wire [63:0] _T_3833_imaginary_node;
    wire [63:0] _BBFAdd_32_1__out;
    wire [63:0] _BBFAdd_32_1__in2;
    wire [63:0] _BBFAdd_32_1__in1;
    BBFAdd BBFAdd_32_1 (
        .out(_BBFAdd_32_1__out),
        .in2(_BBFAdd_32_1__in2),
        .in1(_BBFAdd_32_1__in1)
    );
    wire [63:0] _T_3837_node;
    wire [63:0] _BBFAdd_33_1__out;
    wire [63:0] _BBFAdd_33_1__in2;
    wire [63:0] _BBFAdd_33_1__in1;
    BBFAdd BBFAdd_33_1 (
        .out(_BBFAdd_33_1__out),
        .in2(_BBFAdd_33_1__in2),
        .in1(_BBFAdd_33_1__in1)
    );
    wire [63:0] _T_3843_node;
    wire [63:0] _T_3859_real_node;
    wire [63:0] _T_3859_imaginary_node;
    wire [63:0] _T_3863_node;
    wire [63:0] _BBFSubtract_23_1__out;
    wire [63:0] _BBFSubtract_23_1__in2;
    wire [63:0] _BBFSubtract_23_1__in1;
    BBFSubtract BBFSubtract_23_1 (
        .out(_BBFSubtract_23_1__out),
        .in2(_BBFSubtract_23_1__in2),
        .in1(_BBFSubtract_23_1__in1)
    );
    wire [63:0] _T_3870_node;
    wire [63:0] _T_3876_node;
    wire [63:0] _BBFSubtract_24_1__out;
    wire [63:0] _BBFSubtract_24_1__in2;
    wire [63:0] _BBFSubtract_24_1__in1;
    BBFSubtract BBFSubtract_24_1 (
        .out(_BBFSubtract_24_1__out),
        .in2(_BBFSubtract_24_1__in2),
        .in1(_BBFSubtract_24_1__in1)
    );
    wire [63:0] _T_3883_node;
    wire [63:0] _T_3899_real_node;
    wire [63:0] _T_3899_imaginary_node;
    wire [63:0] _BBFAdd_34_1__out;
    wire [63:0] _BBFAdd_34_1__in2;
    wire [63:0] _BBFAdd_34_1__in1;
    BBFAdd BBFAdd_34_1 (
        .out(_BBFAdd_34_1__out),
        .in2(_BBFAdd_34_1__in2),
        .in1(_BBFAdd_34_1__in1)
    );
    wire [63:0] _T_3903_node;
    wire [63:0] _BBFAdd_35_1__out;
    wire [63:0] _BBFAdd_35_1__in2;
    wire [63:0] _BBFAdd_35_1__in1;
    BBFAdd BBFAdd_35_1 (
        .out(_BBFAdd_35_1__out),
        .in2(_BBFAdd_35_1__in2),
        .in1(_BBFAdd_35_1__in1)
    );
    wire [63:0] _T_3909_node;
    wire [63:0] _T_3925_real_node;
    wire [63:0] _T_3925_imaginary_node;
    wire _T_3940_real_node__T_3951_clk;
    wire _T_3940_real_node__T_3951_en;
    wire _T_3940_real_node__T_3951_mask;
    wire _T_3940_real_node__T_3951_addr;
    wire [63:0] _T_3940_real_node__T_3951_data;
    wire [63:0] _T_3940_real_node__T_3959_data;
    wire _T_3940_real_node__T_3959_clk;
    wire _T_3940_real_node__T_3959_en;
    wire _T_3940_real_node__T_3959_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3940_real_node (
        .read_data(_T_3940_real_node__T_3959_data),
        .read_clk(_T_3940_real_node__T_3959_clk),
        .read_en(_T_3940_real_node__T_3959_en),
        .read_addr(_T_3940_real_node__T_3959_addr),
        .write_clk(_T_3940_real_node__T_3951_clk),
        .write_en(_T_3940_real_node__T_3951_en),
        .write_mask(_T_3940_real_node__T_3951_mask),
        .write_addr(_T_3940_real_node__T_3951_addr),
        .write_data(_T_3940_real_node__T_3951_data)
    );
    wire _T_3940_imaginary_node__T_3951_clk;
    wire _T_3940_imaginary_node__T_3951_en;
    wire _T_3940_imaginary_node__T_3951_mask;
    wire _T_3940_imaginary_node__T_3951_addr;
    wire [63:0] _T_3940_imaginary_node__T_3951_data;
    wire [63:0] _T_3940_imaginary_node__T_3959_data;
    wire _T_3940_imaginary_node__T_3959_clk;
    wire _T_3940_imaginary_node__T_3959_en;
    wire _T_3940_imaginary_node__T_3959_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3940_imaginary_node (
        .read_data(_T_3940_imaginary_node__T_3959_data),
        .read_clk(_T_3940_imaginary_node__T_3959_clk),
        .read_en(_T_3940_imaginary_node__T_3959_en),
        .read_addr(_T_3940_imaginary_node__T_3959_addr),
        .write_clk(_T_3940_imaginary_node__T_3951_clk),
        .write_en(_T_3940_imaginary_node__T_3951_en),
        .write_mask(_T_3940_imaginary_node__T_3951_mask),
        .write_addr(_T_3940_imaginary_node__T_3951_addr),
        .write_data(_T_3940_imaginary_node__T_3951_data)
    );
    wire _T_3943;
    BITWISEAND #(.width(1)) bitwiseand_887 (
        .y(_T_3943),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3940_real_node__T_3951_addr = 1'h0;
    assign _T_3940_real_node__T_3951_en = io_in_valid;
    assign _T_3940_real_node__T_3951_clk = clock;
    assign _T_3940_imaginary_node__T_3951_addr = 1'h0;
    assign _T_3940_imaginary_node__T_3951_en = io_in_valid;
    assign _T_3940_imaginary_node__T_3951_clk = clock;
    assign _T_3940_imaginary_node__T_3951_mask = 1'h1;
    assign _T_3940_real_node__T_3951_mask = 1'h1;
    assign _T_3940_real_node__T_3959_addr = 1'h0;
    assign _T_3940_real_node__T_3959_en = 1'h1;
    assign _T_3940_real_node__T_3959_clk = clock;
    assign _T_3940_imaginary_node__T_3959_addr = 1'h0;
    assign _T_3940_imaginary_node__T_3959_en = 1'h1;
    assign _T_3940_imaginary_node__T_3959_clk = clock;
    wire _T_3974_real_node__T_3985_clk;
    wire _T_3974_real_node__T_3985_en;
    wire _T_3974_real_node__T_3985_mask;
    wire _T_3974_real_node__T_3985_addr;
    wire [63:0] _T_3974_real_node__T_3985_data;
    wire [63:0] _T_3974_real_node__T_3993_data;
    wire _T_3974_real_node__T_3993_clk;
    wire _T_3974_real_node__T_3993_en;
    wire _T_3974_real_node__T_3993_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3974_real_node (
        .read_data(_T_3974_real_node__T_3993_data),
        .read_clk(_T_3974_real_node__T_3993_clk),
        .read_en(_T_3974_real_node__T_3993_en),
        .read_addr(_T_3974_real_node__T_3993_addr),
        .write_clk(_T_3974_real_node__T_3985_clk),
        .write_en(_T_3974_real_node__T_3985_en),
        .write_mask(_T_3974_real_node__T_3985_mask),
        .write_addr(_T_3974_real_node__T_3985_addr),
        .write_data(_T_3974_real_node__T_3985_data)
    );
    wire _T_3974_imaginary_node__T_3985_clk;
    wire _T_3974_imaginary_node__T_3985_en;
    wire _T_3974_imaginary_node__T_3985_mask;
    wire _T_3974_imaginary_node__T_3985_addr;
    wire [63:0] _T_3974_imaginary_node__T_3985_data;
    wire [63:0] _T_3974_imaginary_node__T_3993_data;
    wire _T_3974_imaginary_node__T_3993_clk;
    wire _T_3974_imaginary_node__T_3993_en;
    wire _T_3974_imaginary_node__T_3993_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3974_imaginary_node (
        .read_data(_T_3974_imaginary_node__T_3993_data),
        .read_clk(_T_3974_imaginary_node__T_3993_clk),
        .read_en(_T_3974_imaginary_node__T_3993_en),
        .read_addr(_T_3974_imaginary_node__T_3993_addr),
        .write_clk(_T_3974_imaginary_node__T_3985_clk),
        .write_en(_T_3974_imaginary_node__T_3985_en),
        .write_mask(_T_3974_imaginary_node__T_3985_mask),
        .write_addr(_T_3974_imaginary_node__T_3985_addr),
        .write_data(_T_3974_imaginary_node__T_3985_data)
    );
    wire _T_3977;
    BITWISEAND #(.width(1)) bitwiseand_888 (
        .y(_T_3977),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3974_real_node__T_3985_addr = 1'h0;
    assign _T_3974_real_node__T_3985_en = io_in_valid;
    assign _T_3974_real_node__T_3985_clk = clock;
    assign _T_3974_imaginary_node__T_3985_addr = 1'h0;
    assign _T_3974_imaginary_node__T_3985_en = io_in_valid;
    assign _T_3974_imaginary_node__T_3985_clk = clock;
    assign _T_3974_imaginary_node__T_3985_mask = 1'h1;
    assign _T_3974_real_node__T_3985_mask = 1'h1;
    assign _T_3974_real_node__T_3993_addr = 1'h0;
    assign _T_3974_real_node__T_3993_en = 1'h1;
    assign _T_3974_real_node__T_3993_clk = clock;
    assign _T_3974_imaginary_node__T_3993_addr = 1'h0;
    assign _T_3974_imaginary_node__T_3993_en = 1'h1;
    assign _T_3974_imaginary_node__T_3993_clk = clock;
    wire _T_4008_real_node__T_4019_clk;
    wire _T_4008_real_node__T_4019_en;
    wire _T_4008_real_node__T_4019_mask;
    wire _T_4008_real_node__T_4019_addr;
    wire [63:0] _T_4008_real_node__T_4019_data;
    wire [63:0] _T_4008_real_node__T_4027_data;
    wire _T_4008_real_node__T_4027_clk;
    wire _T_4008_real_node__T_4027_en;
    wire _T_4008_real_node__T_4027_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4008_real_node (
        .read_data(_T_4008_real_node__T_4027_data),
        .read_clk(_T_4008_real_node__T_4027_clk),
        .read_en(_T_4008_real_node__T_4027_en),
        .read_addr(_T_4008_real_node__T_4027_addr),
        .write_clk(_T_4008_real_node__T_4019_clk),
        .write_en(_T_4008_real_node__T_4019_en),
        .write_mask(_T_4008_real_node__T_4019_mask),
        .write_addr(_T_4008_real_node__T_4019_addr),
        .write_data(_T_4008_real_node__T_4019_data)
    );
    wire _T_4008_imaginary_node__T_4019_clk;
    wire _T_4008_imaginary_node__T_4019_en;
    wire _T_4008_imaginary_node__T_4019_mask;
    wire _T_4008_imaginary_node__T_4019_addr;
    wire [63:0] _T_4008_imaginary_node__T_4019_data;
    wire [63:0] _T_4008_imaginary_node__T_4027_data;
    wire _T_4008_imaginary_node__T_4027_clk;
    wire _T_4008_imaginary_node__T_4027_en;
    wire _T_4008_imaginary_node__T_4027_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4008_imaginary_node (
        .read_data(_T_4008_imaginary_node__T_4027_data),
        .read_clk(_T_4008_imaginary_node__T_4027_clk),
        .read_en(_T_4008_imaginary_node__T_4027_en),
        .read_addr(_T_4008_imaginary_node__T_4027_addr),
        .write_clk(_T_4008_imaginary_node__T_4019_clk),
        .write_en(_T_4008_imaginary_node__T_4019_en),
        .write_mask(_T_4008_imaginary_node__T_4019_mask),
        .write_addr(_T_4008_imaginary_node__T_4019_addr),
        .write_data(_T_4008_imaginary_node__T_4019_data)
    );
    wire _T_4011;
    BITWISEAND #(.width(1)) bitwiseand_889 (
        .y(_T_4011),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4008_real_node__T_4019_addr = 1'h0;
    assign _T_4008_real_node__T_4019_en = io_in_valid;
    assign _T_4008_real_node__T_4019_clk = clock;
    assign _T_4008_imaginary_node__T_4019_addr = 1'h0;
    assign _T_4008_imaginary_node__T_4019_en = io_in_valid;
    assign _T_4008_imaginary_node__T_4019_clk = clock;
    assign _T_4008_imaginary_node__T_4019_mask = 1'h1;
    assign _T_4008_real_node__T_4019_mask = 1'h1;
    assign _T_4008_real_node__T_4027_addr = 1'h0;
    assign _T_4008_real_node__T_4027_en = 1'h1;
    assign _T_4008_real_node__T_4027_clk = clock;
    assign _T_4008_imaginary_node__T_4027_addr = 1'h0;
    assign _T_4008_imaginary_node__T_4027_en = 1'h1;
    assign _T_4008_imaginary_node__T_4027_clk = clock;
    wire [63:0] _BBFMultiply_24_1__out;
    wire [63:0] _BBFMultiply_24_1__in2;
    wire [63:0] _BBFMultiply_24_1__in1;
    BBFMultiply BBFMultiply_24_1 (
        .out(_BBFMultiply_24_1__out),
        .in2(_BBFMultiply_24_1__in2),
        .in1(_BBFMultiply_24_1__in1)
    );
    wire [63:0] _T_4031_node;
    wire [63:0] _BBFMultiply_25_1__out;
    wire [63:0] _BBFMultiply_25_1__in2;
    wire [63:0] _BBFMultiply_25_1__in1;
    BBFMultiply BBFMultiply_25_1 (
        .out(_BBFMultiply_25_1__out),
        .in2(_BBFMultiply_25_1__in2),
        .in1(_BBFMultiply_25_1__in1)
    );
    wire [63:0] _T_4037_node;
    wire [63:0] _T_4043_node;
    wire [63:0] _BBFSubtract_25_1__out;
    wire [63:0] _BBFSubtract_25_1__in2;
    wire [63:0] _BBFSubtract_25_1__in1;
    BBFSubtract BBFSubtract_25_1 (
        .out(_BBFSubtract_25_1__out),
        .in2(_BBFSubtract_25_1__in2),
        .in1(_BBFSubtract_25_1__in1)
    );
    wire [63:0] _T_4050_node;
    wire [63:0] _BBFAdd_36_1__out;
    wire [63:0] _BBFAdd_36_1__in2;
    wire [63:0] _BBFAdd_36_1__in1;
    BBFAdd BBFAdd_36_1 (
        .out(_BBFAdd_36_1__out),
        .in2(_BBFAdd_36_1__in2),
        .in1(_BBFAdd_36_1__in1)
    );
    wire [63:0] _T_4056_node;
    wire [63:0] _BBFMultiply_26_1__out;
    wire [63:0] _BBFMultiply_26_1__in2;
    wire [63:0] _BBFMultiply_26_1__in1;
    BBFMultiply BBFMultiply_26_1 (
        .out(_BBFMultiply_26_1__out),
        .in2(_BBFMultiply_26_1__in2),
        .in1(_BBFMultiply_26_1__in1)
    );
    wire [63:0] _T_4062_node;
    wire [63:0] _BBFMultiply_27_1__out;
    wire [63:0] _BBFMultiply_27_1__in2;
    wire [63:0] _BBFMultiply_27_1__in1;
    BBFMultiply BBFMultiply_27_1 (
        .out(_BBFMultiply_27_1__out),
        .in2(_BBFMultiply_27_1__in2),
        .in1(_BBFMultiply_27_1__in1)
    );
    wire [63:0] _T_4068_node;
    wire [63:0] _BBFAdd_37_1__out;
    wire [63:0] _BBFAdd_37_1__in2;
    wire [63:0] _BBFAdd_37_1__in1;
    BBFAdd BBFAdd_37_1 (
        .out(_BBFAdd_37_1__out),
        .in2(_BBFAdd_37_1__in2),
        .in1(_BBFAdd_37_1__in1)
    );
    wire [63:0] _T_4074_node;
    wire [63:0] _T_4090_real_node;
    wire [63:0] _T_4090_imaginary_node;
    wire [63:0] _BBFAdd_38_1__out;
    wire [63:0] _BBFAdd_38_1__in2;
    wire [63:0] _BBFAdd_38_1__in1;
    BBFAdd BBFAdd_38_1 (
        .out(_BBFAdd_38_1__out),
        .in2(_BBFAdd_38_1__in2),
        .in1(_BBFAdd_38_1__in1)
    );
    wire [63:0] _T_4094_node;
    wire [63:0] _BBFAdd_39_1__out;
    wire [63:0] _BBFAdd_39_1__in2;
    wire [63:0] _BBFAdd_39_1__in1;
    BBFAdd BBFAdd_39_1 (
        .out(_BBFAdd_39_1__out),
        .in2(_BBFAdd_39_1__in2),
        .in1(_BBFAdd_39_1__in1)
    );
    wire [63:0] _T_4100_node;
    wire [63:0] _T_4116_real_node;
    wire [63:0] _T_4116_imaginary_node;
    wire [63:0] _T_4120_node;
    wire [63:0] _BBFSubtract_26_1__out;
    wire [63:0] _BBFSubtract_26_1__in2;
    wire [63:0] _BBFSubtract_26_1__in1;
    BBFSubtract BBFSubtract_26_1 (
        .out(_BBFSubtract_26_1__out),
        .in2(_BBFSubtract_26_1__in2),
        .in1(_BBFSubtract_26_1__in1)
    );
    wire [63:0] _T_4127_node;
    wire [63:0] _T_4133_node;
    wire [63:0] _BBFSubtract_27_1__out;
    wire [63:0] _BBFSubtract_27_1__in2;
    wire [63:0] _BBFSubtract_27_1__in1;
    BBFSubtract BBFSubtract_27_1 (
        .out(_BBFSubtract_27_1__out),
        .in2(_BBFSubtract_27_1__in2),
        .in1(_BBFSubtract_27_1__in1)
    );
    wire [63:0] _T_4140_node;
    wire [63:0] _T_4156_real_node;
    wire [63:0] _T_4156_imaginary_node;
    wire [63:0] _BBFAdd_40_1__out;
    wire [63:0] _BBFAdd_40_1__in2;
    wire [63:0] _BBFAdd_40_1__in1;
    BBFAdd BBFAdd_40_1 (
        .out(_BBFAdd_40_1__out),
        .in2(_BBFAdd_40_1__in2),
        .in1(_BBFAdd_40_1__in1)
    );
    wire [63:0] _T_4160_node;
    wire [63:0] _BBFAdd_41_1__out;
    wire [63:0] _BBFAdd_41_1__in2;
    wire [63:0] _BBFAdd_41_1__in1;
    BBFAdd BBFAdd_41_1 (
        .out(_BBFAdd_41_1__out),
        .in2(_BBFAdd_41_1__in2),
        .in1(_BBFAdd_41_1__in1)
    );
    wire [63:0] _T_4166_node;
    wire [63:0] _T_4182_real_node;
    wire [63:0] _T_4182_imaginary_node;
    wire _T_4197_real_node__T_4208_clk;
    wire _T_4197_real_node__T_4208_en;
    wire _T_4197_real_node__T_4208_mask;
    wire _T_4197_real_node__T_4208_addr;
    wire [63:0] _T_4197_real_node__T_4208_data;
    wire [63:0] _T_4197_real_node__T_4216_data;
    wire _T_4197_real_node__T_4216_clk;
    wire _T_4197_real_node__T_4216_en;
    wire _T_4197_real_node__T_4216_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4197_real_node (
        .read_data(_T_4197_real_node__T_4216_data),
        .read_clk(_T_4197_real_node__T_4216_clk),
        .read_en(_T_4197_real_node__T_4216_en),
        .read_addr(_T_4197_real_node__T_4216_addr),
        .write_clk(_T_4197_real_node__T_4208_clk),
        .write_en(_T_4197_real_node__T_4208_en),
        .write_mask(_T_4197_real_node__T_4208_mask),
        .write_addr(_T_4197_real_node__T_4208_addr),
        .write_data(_T_4197_real_node__T_4208_data)
    );
    wire _T_4197_imaginary_node__T_4208_clk;
    wire _T_4197_imaginary_node__T_4208_en;
    wire _T_4197_imaginary_node__T_4208_mask;
    wire _T_4197_imaginary_node__T_4208_addr;
    wire [63:0] _T_4197_imaginary_node__T_4208_data;
    wire [63:0] _T_4197_imaginary_node__T_4216_data;
    wire _T_4197_imaginary_node__T_4216_clk;
    wire _T_4197_imaginary_node__T_4216_en;
    wire _T_4197_imaginary_node__T_4216_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4197_imaginary_node (
        .read_data(_T_4197_imaginary_node__T_4216_data),
        .read_clk(_T_4197_imaginary_node__T_4216_clk),
        .read_en(_T_4197_imaginary_node__T_4216_en),
        .read_addr(_T_4197_imaginary_node__T_4216_addr),
        .write_clk(_T_4197_imaginary_node__T_4208_clk),
        .write_en(_T_4197_imaginary_node__T_4208_en),
        .write_mask(_T_4197_imaginary_node__T_4208_mask),
        .write_addr(_T_4197_imaginary_node__T_4208_addr),
        .write_data(_T_4197_imaginary_node__T_4208_data)
    );
    wire _T_4200;
    BITWISEAND #(.width(1)) bitwiseand_890 (
        .y(_T_4200),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4197_real_node__T_4208_addr = 1'h0;
    assign _T_4197_real_node__T_4208_en = io_in_valid;
    assign _T_4197_real_node__T_4208_clk = clock;
    assign _T_4197_imaginary_node__T_4208_addr = 1'h0;
    assign _T_4197_imaginary_node__T_4208_en = io_in_valid;
    assign _T_4197_imaginary_node__T_4208_clk = clock;
    assign _T_4197_imaginary_node__T_4208_mask = 1'h1;
    assign _T_4197_real_node__T_4208_mask = 1'h1;
    assign _T_4197_real_node__T_4216_addr = 1'h0;
    assign _T_4197_real_node__T_4216_en = 1'h1;
    assign _T_4197_real_node__T_4216_clk = clock;
    assign _T_4197_imaginary_node__T_4216_addr = 1'h0;
    assign _T_4197_imaginary_node__T_4216_en = 1'h1;
    assign _T_4197_imaginary_node__T_4216_clk = clock;
    wire _T_4231_real_node__T_4242_clk;
    wire _T_4231_real_node__T_4242_en;
    wire _T_4231_real_node__T_4242_mask;
    wire _T_4231_real_node__T_4242_addr;
    wire [63:0] _T_4231_real_node__T_4242_data;
    wire [63:0] _T_4231_real_node__T_4250_data;
    wire _T_4231_real_node__T_4250_clk;
    wire _T_4231_real_node__T_4250_en;
    wire _T_4231_real_node__T_4250_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4231_real_node (
        .read_data(_T_4231_real_node__T_4250_data),
        .read_clk(_T_4231_real_node__T_4250_clk),
        .read_en(_T_4231_real_node__T_4250_en),
        .read_addr(_T_4231_real_node__T_4250_addr),
        .write_clk(_T_4231_real_node__T_4242_clk),
        .write_en(_T_4231_real_node__T_4242_en),
        .write_mask(_T_4231_real_node__T_4242_mask),
        .write_addr(_T_4231_real_node__T_4242_addr),
        .write_data(_T_4231_real_node__T_4242_data)
    );
    wire _T_4231_imaginary_node__T_4242_clk;
    wire _T_4231_imaginary_node__T_4242_en;
    wire _T_4231_imaginary_node__T_4242_mask;
    wire _T_4231_imaginary_node__T_4242_addr;
    wire [63:0] _T_4231_imaginary_node__T_4242_data;
    wire [63:0] _T_4231_imaginary_node__T_4250_data;
    wire _T_4231_imaginary_node__T_4250_clk;
    wire _T_4231_imaginary_node__T_4250_en;
    wire _T_4231_imaginary_node__T_4250_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4231_imaginary_node (
        .read_data(_T_4231_imaginary_node__T_4250_data),
        .read_clk(_T_4231_imaginary_node__T_4250_clk),
        .read_en(_T_4231_imaginary_node__T_4250_en),
        .read_addr(_T_4231_imaginary_node__T_4250_addr),
        .write_clk(_T_4231_imaginary_node__T_4242_clk),
        .write_en(_T_4231_imaginary_node__T_4242_en),
        .write_mask(_T_4231_imaginary_node__T_4242_mask),
        .write_addr(_T_4231_imaginary_node__T_4242_addr),
        .write_data(_T_4231_imaginary_node__T_4242_data)
    );
    wire _T_4234;
    BITWISEAND #(.width(1)) bitwiseand_891 (
        .y(_T_4234),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4231_real_node__T_4242_addr = 1'h0;
    assign _T_4231_real_node__T_4242_en = io_in_valid;
    assign _T_4231_real_node__T_4242_clk = clock;
    assign _T_4231_imaginary_node__T_4242_addr = 1'h0;
    assign _T_4231_imaginary_node__T_4242_en = io_in_valid;
    assign _T_4231_imaginary_node__T_4242_clk = clock;
    assign _T_4231_imaginary_node__T_4242_mask = 1'h1;
    assign _T_4231_real_node__T_4242_mask = 1'h1;
    assign _T_4231_real_node__T_4250_addr = 1'h0;
    assign _T_4231_real_node__T_4250_en = 1'h1;
    assign _T_4231_real_node__T_4250_clk = clock;
    assign _T_4231_imaginary_node__T_4250_addr = 1'h0;
    assign _T_4231_imaginary_node__T_4250_en = 1'h1;
    assign _T_4231_imaginary_node__T_4250_clk = clock;
    wire _T_4265_real_node__T_4276_clk;
    wire _T_4265_real_node__T_4276_en;
    wire _T_4265_real_node__T_4276_mask;
    wire _T_4265_real_node__T_4276_addr;
    wire [63:0] _T_4265_real_node__T_4276_data;
    wire [63:0] _T_4265_real_node__T_4284_data;
    wire _T_4265_real_node__T_4284_clk;
    wire _T_4265_real_node__T_4284_en;
    wire _T_4265_real_node__T_4284_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4265_real_node (
        .read_data(_T_4265_real_node__T_4284_data),
        .read_clk(_T_4265_real_node__T_4284_clk),
        .read_en(_T_4265_real_node__T_4284_en),
        .read_addr(_T_4265_real_node__T_4284_addr),
        .write_clk(_T_4265_real_node__T_4276_clk),
        .write_en(_T_4265_real_node__T_4276_en),
        .write_mask(_T_4265_real_node__T_4276_mask),
        .write_addr(_T_4265_real_node__T_4276_addr),
        .write_data(_T_4265_real_node__T_4276_data)
    );
    wire _T_4265_imaginary_node__T_4276_clk;
    wire _T_4265_imaginary_node__T_4276_en;
    wire _T_4265_imaginary_node__T_4276_mask;
    wire _T_4265_imaginary_node__T_4276_addr;
    wire [63:0] _T_4265_imaginary_node__T_4276_data;
    wire [63:0] _T_4265_imaginary_node__T_4284_data;
    wire _T_4265_imaginary_node__T_4284_clk;
    wire _T_4265_imaginary_node__T_4284_en;
    wire _T_4265_imaginary_node__T_4284_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4265_imaginary_node (
        .read_data(_T_4265_imaginary_node__T_4284_data),
        .read_clk(_T_4265_imaginary_node__T_4284_clk),
        .read_en(_T_4265_imaginary_node__T_4284_en),
        .read_addr(_T_4265_imaginary_node__T_4284_addr),
        .write_clk(_T_4265_imaginary_node__T_4276_clk),
        .write_en(_T_4265_imaginary_node__T_4276_en),
        .write_mask(_T_4265_imaginary_node__T_4276_mask),
        .write_addr(_T_4265_imaginary_node__T_4276_addr),
        .write_data(_T_4265_imaginary_node__T_4276_data)
    );
    wire _T_4268;
    BITWISEAND #(.width(1)) bitwiseand_892 (
        .y(_T_4268),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4265_real_node__T_4276_addr = 1'h0;
    assign _T_4265_real_node__T_4276_en = io_in_valid;
    assign _T_4265_real_node__T_4276_clk = clock;
    assign _T_4265_imaginary_node__T_4276_addr = 1'h0;
    assign _T_4265_imaginary_node__T_4276_en = io_in_valid;
    assign _T_4265_imaginary_node__T_4276_clk = clock;
    assign _T_4265_imaginary_node__T_4276_mask = 1'h1;
    assign _T_4265_real_node__T_4276_mask = 1'h1;
    assign _T_4265_real_node__T_4284_addr = 1'h0;
    assign _T_4265_real_node__T_4284_en = 1'h1;
    assign _T_4265_real_node__T_4284_clk = clock;
    assign _T_4265_imaginary_node__T_4284_addr = 1'h0;
    assign _T_4265_imaginary_node__T_4284_en = 1'h1;
    assign _T_4265_imaginary_node__T_4284_clk = clock;
    wire [63:0] _BBFMultiply_28_1__out;
    wire [63:0] _BBFMultiply_28_1__in2;
    wire [63:0] _BBFMultiply_28_1__in1;
    BBFMultiply BBFMultiply_28_1 (
        .out(_BBFMultiply_28_1__out),
        .in2(_BBFMultiply_28_1__in2),
        .in1(_BBFMultiply_28_1__in1)
    );
    wire [63:0] _T_4288_node;
    wire [63:0] _BBFMultiply_29_1__out;
    wire [63:0] _BBFMultiply_29_1__in2;
    wire [63:0] _BBFMultiply_29_1__in1;
    BBFMultiply BBFMultiply_29_1 (
        .out(_BBFMultiply_29_1__out),
        .in2(_BBFMultiply_29_1__in2),
        .in1(_BBFMultiply_29_1__in1)
    );
    wire [63:0] _T_4294_node;
    wire [63:0] _T_4300_node;
    wire [63:0] _BBFSubtract_28_1__out;
    wire [63:0] _BBFSubtract_28_1__in2;
    wire [63:0] _BBFSubtract_28_1__in1;
    BBFSubtract BBFSubtract_28_1 (
        .out(_BBFSubtract_28_1__out),
        .in2(_BBFSubtract_28_1__in2),
        .in1(_BBFSubtract_28_1__in1)
    );
    wire [63:0] _T_4307_node;
    wire [63:0] _BBFAdd_42_1__out;
    wire [63:0] _BBFAdd_42_1__in2;
    wire [63:0] _BBFAdd_42_1__in1;
    BBFAdd BBFAdd_42_1 (
        .out(_BBFAdd_42_1__out),
        .in2(_BBFAdd_42_1__in2),
        .in1(_BBFAdd_42_1__in1)
    );
    wire [63:0] _T_4313_node;
    wire [63:0] _BBFMultiply_30_1__out;
    wire [63:0] _BBFMultiply_30_1__in2;
    wire [63:0] _BBFMultiply_30_1__in1;
    BBFMultiply BBFMultiply_30_1 (
        .out(_BBFMultiply_30_1__out),
        .in2(_BBFMultiply_30_1__in2),
        .in1(_BBFMultiply_30_1__in1)
    );
    wire [63:0] _T_4319_node;
    wire [63:0] _BBFMultiply_31_1__out;
    wire [63:0] _BBFMultiply_31_1__in2;
    wire [63:0] _BBFMultiply_31_1__in1;
    BBFMultiply BBFMultiply_31_1 (
        .out(_BBFMultiply_31_1__out),
        .in2(_BBFMultiply_31_1__in2),
        .in1(_BBFMultiply_31_1__in1)
    );
    wire [63:0] _T_4325_node;
    wire [63:0] _BBFAdd_43_1__out;
    wire [63:0] _BBFAdd_43_1__in2;
    wire [63:0] _BBFAdd_43_1__in1;
    BBFAdd BBFAdd_43_1 (
        .out(_BBFAdd_43_1__out),
        .in2(_BBFAdd_43_1__in2),
        .in1(_BBFAdd_43_1__in1)
    );
    wire [63:0] _T_4331_node;
    wire [63:0] _T_4347_real_node;
    wire [63:0] _T_4347_imaginary_node;
    wire [63:0] _BBFAdd_44_1__out;
    wire [63:0] _BBFAdd_44_1__in2;
    wire [63:0] _BBFAdd_44_1__in1;
    BBFAdd BBFAdd_44_1 (
        .out(_BBFAdd_44_1__out),
        .in2(_BBFAdd_44_1__in2),
        .in1(_BBFAdd_44_1__in1)
    );
    wire [63:0] _T_4351_node;
    wire [63:0] _BBFAdd_45_1__out;
    wire [63:0] _BBFAdd_45_1__in2;
    wire [63:0] _BBFAdd_45_1__in1;
    BBFAdd BBFAdd_45_1 (
        .out(_BBFAdd_45_1__out),
        .in2(_BBFAdd_45_1__in2),
        .in1(_BBFAdd_45_1__in1)
    );
    wire [63:0] _T_4357_node;
    wire [63:0] _T_4373_real_node;
    wire [63:0] _T_4373_imaginary_node;
    wire [63:0] _T_4377_node;
    wire [63:0] _BBFSubtract_29_1__out;
    wire [63:0] _BBFSubtract_29_1__in2;
    wire [63:0] _BBFSubtract_29_1__in1;
    BBFSubtract BBFSubtract_29_1 (
        .out(_BBFSubtract_29_1__out),
        .in2(_BBFSubtract_29_1__in2),
        .in1(_BBFSubtract_29_1__in1)
    );
    wire [63:0] _T_4384_node;
    wire [63:0] _T_4390_node;
    wire [63:0] _BBFSubtract_30_1__out;
    wire [63:0] _BBFSubtract_30_1__in2;
    wire [63:0] _BBFSubtract_30_1__in1;
    BBFSubtract BBFSubtract_30_1 (
        .out(_BBFSubtract_30_1__out),
        .in2(_BBFSubtract_30_1__in2),
        .in1(_BBFSubtract_30_1__in1)
    );
    wire [63:0] _T_4397_node;
    wire [63:0] _T_4413_real_node;
    wire [63:0] _T_4413_imaginary_node;
    wire [63:0] _BBFAdd_46_1__out;
    wire [63:0] _BBFAdd_46_1__in2;
    wire [63:0] _BBFAdd_46_1__in1;
    BBFAdd BBFAdd_46_1 (
        .out(_BBFAdd_46_1__out),
        .in2(_BBFAdd_46_1__in2),
        .in1(_BBFAdd_46_1__in1)
    );
    wire [63:0] _T_4417_node;
    wire [63:0] _BBFAdd_47_1__out;
    wire [63:0] _BBFAdd_47_1__in2;
    wire [63:0] _BBFAdd_47_1__in1;
    BBFAdd BBFAdd_47_1 (
        .out(_BBFAdd_47_1__out),
        .in2(_BBFAdd_47_1__in2),
        .in1(_BBFAdd_47_1__in1)
    );
    wire [63:0] _T_4423_node;
    wire [63:0] _T_4439_real_node;
    wire [63:0] _T_4439_imaginary_node;
    wire _T_4454_real_node__T_4465_clk;
    wire _T_4454_real_node__T_4465_en;
    wire _T_4454_real_node__T_4465_mask;
    wire _T_4454_real_node__T_4465_addr;
    wire [63:0] _T_4454_real_node__T_4465_data;
    wire [63:0] _T_4454_real_node__T_4473_data;
    wire _T_4454_real_node__T_4473_clk;
    wire _T_4454_real_node__T_4473_en;
    wire _T_4454_real_node__T_4473_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4454_real_node (
        .read_data(_T_4454_real_node__T_4473_data),
        .read_clk(_T_4454_real_node__T_4473_clk),
        .read_en(_T_4454_real_node__T_4473_en),
        .read_addr(_T_4454_real_node__T_4473_addr),
        .write_clk(_T_4454_real_node__T_4465_clk),
        .write_en(_T_4454_real_node__T_4465_en),
        .write_mask(_T_4454_real_node__T_4465_mask),
        .write_addr(_T_4454_real_node__T_4465_addr),
        .write_data(_T_4454_real_node__T_4465_data)
    );
    wire _T_4454_imaginary_node__T_4465_clk;
    wire _T_4454_imaginary_node__T_4465_en;
    wire _T_4454_imaginary_node__T_4465_mask;
    wire _T_4454_imaginary_node__T_4465_addr;
    wire [63:0] _T_4454_imaginary_node__T_4465_data;
    wire [63:0] _T_4454_imaginary_node__T_4473_data;
    wire _T_4454_imaginary_node__T_4473_clk;
    wire _T_4454_imaginary_node__T_4473_en;
    wire _T_4454_imaginary_node__T_4473_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4454_imaginary_node (
        .read_data(_T_4454_imaginary_node__T_4473_data),
        .read_clk(_T_4454_imaginary_node__T_4473_clk),
        .read_en(_T_4454_imaginary_node__T_4473_en),
        .read_addr(_T_4454_imaginary_node__T_4473_addr),
        .write_clk(_T_4454_imaginary_node__T_4465_clk),
        .write_en(_T_4454_imaginary_node__T_4465_en),
        .write_mask(_T_4454_imaginary_node__T_4465_mask),
        .write_addr(_T_4454_imaginary_node__T_4465_addr),
        .write_data(_T_4454_imaginary_node__T_4465_data)
    );
    wire _T_4457;
    BITWISEAND #(.width(1)) bitwiseand_893 (
        .y(_T_4457),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4454_real_node__T_4465_addr = 1'h0;
    assign _T_4454_real_node__T_4465_en = io_in_valid;
    assign _T_4454_real_node__T_4465_clk = clock;
    assign _T_4454_imaginary_node__T_4465_addr = 1'h0;
    assign _T_4454_imaginary_node__T_4465_en = io_in_valid;
    assign _T_4454_imaginary_node__T_4465_clk = clock;
    assign _T_4454_imaginary_node__T_4465_mask = 1'h1;
    assign _T_4454_real_node__T_4465_mask = 1'h1;
    assign _T_4454_real_node__T_4473_addr = 1'h0;
    assign _T_4454_real_node__T_4473_en = 1'h1;
    assign _T_4454_real_node__T_4473_clk = clock;
    assign _T_4454_imaginary_node__T_4473_addr = 1'h0;
    assign _T_4454_imaginary_node__T_4473_en = 1'h1;
    assign _T_4454_imaginary_node__T_4473_clk = clock;
    wire _T_4488_real_node__T_4499_clk;
    wire _T_4488_real_node__T_4499_en;
    wire _T_4488_real_node__T_4499_mask;
    wire _T_4488_real_node__T_4499_addr;
    wire [63:0] _T_4488_real_node__T_4499_data;
    wire [63:0] _T_4488_real_node__T_4507_data;
    wire _T_4488_real_node__T_4507_clk;
    wire _T_4488_real_node__T_4507_en;
    wire _T_4488_real_node__T_4507_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4488_real_node (
        .read_data(_T_4488_real_node__T_4507_data),
        .read_clk(_T_4488_real_node__T_4507_clk),
        .read_en(_T_4488_real_node__T_4507_en),
        .read_addr(_T_4488_real_node__T_4507_addr),
        .write_clk(_T_4488_real_node__T_4499_clk),
        .write_en(_T_4488_real_node__T_4499_en),
        .write_mask(_T_4488_real_node__T_4499_mask),
        .write_addr(_T_4488_real_node__T_4499_addr),
        .write_data(_T_4488_real_node__T_4499_data)
    );
    wire _T_4488_imaginary_node__T_4499_clk;
    wire _T_4488_imaginary_node__T_4499_en;
    wire _T_4488_imaginary_node__T_4499_mask;
    wire _T_4488_imaginary_node__T_4499_addr;
    wire [63:0] _T_4488_imaginary_node__T_4499_data;
    wire [63:0] _T_4488_imaginary_node__T_4507_data;
    wire _T_4488_imaginary_node__T_4507_clk;
    wire _T_4488_imaginary_node__T_4507_en;
    wire _T_4488_imaginary_node__T_4507_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4488_imaginary_node (
        .read_data(_T_4488_imaginary_node__T_4507_data),
        .read_clk(_T_4488_imaginary_node__T_4507_clk),
        .read_en(_T_4488_imaginary_node__T_4507_en),
        .read_addr(_T_4488_imaginary_node__T_4507_addr),
        .write_clk(_T_4488_imaginary_node__T_4499_clk),
        .write_en(_T_4488_imaginary_node__T_4499_en),
        .write_mask(_T_4488_imaginary_node__T_4499_mask),
        .write_addr(_T_4488_imaginary_node__T_4499_addr),
        .write_data(_T_4488_imaginary_node__T_4499_data)
    );
    wire _T_4491;
    BITWISEAND #(.width(1)) bitwiseand_894 (
        .y(_T_4491),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4488_real_node__T_4499_addr = 1'h0;
    assign _T_4488_real_node__T_4499_en = io_in_valid;
    assign _T_4488_real_node__T_4499_clk = clock;
    assign _T_4488_imaginary_node__T_4499_addr = 1'h0;
    assign _T_4488_imaginary_node__T_4499_en = io_in_valid;
    assign _T_4488_imaginary_node__T_4499_clk = clock;
    assign _T_4488_imaginary_node__T_4499_mask = 1'h1;
    assign _T_4488_real_node__T_4499_mask = 1'h1;
    assign _T_4488_real_node__T_4507_addr = 1'h0;
    assign _T_4488_real_node__T_4507_en = 1'h1;
    assign _T_4488_real_node__T_4507_clk = clock;
    assign _T_4488_imaginary_node__T_4507_addr = 1'h0;
    assign _T_4488_imaginary_node__T_4507_en = 1'h1;
    assign _T_4488_imaginary_node__T_4507_clk = clock;
    wire _T_4522_real_node__T_4537_clk;
    wire _T_4522_real_node__T_4537_en;
    wire _T_4522_real_node__T_4537_mask;
    wire _T_4522_real_node__T_4537_addr;
    wire [63:0] _T_4522_real_node__T_4537_data;
    wire [63:0] _T_4522_real_node__T_4544_data;
    wire _T_4522_real_node__T_4544_clk;
    wire _T_4522_real_node__T_4544_en;
    wire _T_4522_real_node__T_4544_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4522_real_node (
        .read_data(_T_4522_real_node__T_4544_data),
        .read_clk(_T_4522_real_node__T_4544_clk),
        .read_en(_T_4522_real_node__T_4544_en),
        .read_addr(_T_4522_real_node__T_4544_addr),
        .write_clk(_T_4522_real_node__T_4537_clk),
        .write_en(_T_4522_real_node__T_4537_en),
        .write_mask(_T_4522_real_node__T_4537_mask),
        .write_addr(_T_4522_real_node__T_4537_addr),
        .write_data(_T_4522_real_node__T_4537_data)
    );
    wire _T_4522_imaginary_node__T_4537_clk;
    wire _T_4522_imaginary_node__T_4537_en;
    wire _T_4522_imaginary_node__T_4537_mask;
    wire _T_4522_imaginary_node__T_4537_addr;
    wire [63:0] _T_4522_imaginary_node__T_4537_data;
    wire [63:0] _T_4522_imaginary_node__T_4544_data;
    wire _T_4522_imaginary_node__T_4544_clk;
    wire _T_4522_imaginary_node__T_4544_en;
    wire _T_4522_imaginary_node__T_4544_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4522_imaginary_node (
        .read_data(_T_4522_imaginary_node__T_4544_data),
        .read_clk(_T_4522_imaginary_node__T_4544_clk),
        .read_en(_T_4522_imaginary_node__T_4544_en),
        .read_addr(_T_4522_imaginary_node__T_4544_addr),
        .write_clk(_T_4522_imaginary_node__T_4537_clk),
        .write_en(_T_4522_imaginary_node__T_4537_en),
        .write_mask(_T_4522_imaginary_node__T_4537_mask),
        .write_addr(_T_4522_imaginary_node__T_4537_addr),
        .write_data(_T_4522_imaginary_node__T_4537_data)
    );
    wire __T_4524__q;
    wire __T_4524__d;
    DFF_POSCLK #(.width(1)) _T_4524 (
        .q(__T_4524__q),
        .d(__T_4524__d),
        .clk(clock)
    );
    wire _WTEMP_23;
    MUX_UNSIGNED #(.width(1)) u_mux_895 (
        .y(__T_4524__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_23)
    );
    wire _T_4526;
    EQ_UNSIGNED #(.width(1)) u_eq_896 (
        .y(_T_4526),
        .a(__T_4524__q),
        .b(1'h1)
    );
    wire [1:0] _T_4528;
    ADD_UNSIGNED #(.width(1)) u_add_897 (
        .y(_T_4528),
        .a(__T_4524__q),
        .b(1'h1)
    );
    wire _T_4529;
    TAIL #(.width(2), .n(1)) tail_898 (
        .y(_T_4529),
        .in(_T_4528)
    );
    wire _T_4530;
    BITWISEAND #(.width(1)) bitwiseand_899 (
        .y(_T_4530),
        .a(io_in_valid),
        .b(_T_4526)
    );
    assign _T_4522_real_node__T_4537_addr = __T_4524__q;
    assign _T_4522_real_node__T_4537_en = io_in_valid;
    assign _T_4522_real_node__T_4537_clk = clock;
    assign _T_4522_imaginary_node__T_4537_addr = __T_4524__q;
    assign _T_4522_imaginary_node__T_4537_en = io_in_valid;
    assign _T_4522_imaginary_node__T_4537_clk = clock;
    assign _T_4522_imaginary_node__T_4537_mask = 1'h1;
    assign _T_4522_real_node__T_4537_mask = 1'h1;
    assign _T_4522_real_node__T_4544_addr = __T_4524__q;
    assign _T_4522_real_node__T_4544_en = 1'h1;
    assign _T_4522_real_node__T_4544_clk = clock;
    assign _T_4522_imaginary_node__T_4544_addr = __T_4524__q;
    assign _T_4522_imaginary_node__T_4544_en = 1'h1;
    assign _T_4522_imaginary_node__T_4544_clk = clock;
    wire [63:0] _BBFMultiply_32_1__out;
    wire [63:0] _BBFMultiply_32_1__in2;
    wire [63:0] _BBFMultiply_32_1__in1;
    BBFMultiply BBFMultiply_32_1 (
        .out(_BBFMultiply_32_1__out),
        .in2(_BBFMultiply_32_1__in2),
        .in1(_BBFMultiply_32_1__in1)
    );
    wire [63:0] _T_4548_node;
    wire [63:0] _BBFMultiply_33_1__out;
    wire [63:0] _BBFMultiply_33_1__in2;
    wire [63:0] _BBFMultiply_33_1__in1;
    BBFMultiply BBFMultiply_33_1 (
        .out(_BBFMultiply_33_1__out),
        .in2(_BBFMultiply_33_1__in2),
        .in1(_BBFMultiply_33_1__in1)
    );
    wire [63:0] _T_4554_node;
    wire [63:0] _T_4560_node;
    wire [63:0] _BBFSubtract_31_1__out;
    wire [63:0] _BBFSubtract_31_1__in2;
    wire [63:0] _BBFSubtract_31_1__in1;
    BBFSubtract BBFSubtract_31_1 (
        .out(_BBFSubtract_31_1__out),
        .in2(_BBFSubtract_31_1__in2),
        .in1(_BBFSubtract_31_1__in1)
    );
    wire [63:0] _T_4567_node;
    wire [63:0] _BBFAdd_48_1__out;
    wire [63:0] _BBFAdd_48_1__in2;
    wire [63:0] _BBFAdd_48_1__in1;
    BBFAdd BBFAdd_48_1 (
        .out(_BBFAdd_48_1__out),
        .in2(_BBFAdd_48_1__in2),
        .in1(_BBFAdd_48_1__in1)
    );
    wire [63:0] _T_4573_node;
    wire [63:0] _BBFMultiply_34_1__out;
    wire [63:0] _BBFMultiply_34_1__in2;
    wire [63:0] _BBFMultiply_34_1__in1;
    BBFMultiply BBFMultiply_34_1 (
        .out(_BBFMultiply_34_1__out),
        .in2(_BBFMultiply_34_1__in2),
        .in1(_BBFMultiply_34_1__in1)
    );
    wire [63:0] _T_4579_node;
    wire [63:0] _BBFMultiply_35_1__out;
    wire [63:0] _BBFMultiply_35_1__in2;
    wire [63:0] _BBFMultiply_35_1__in1;
    BBFMultiply BBFMultiply_35_1 (
        .out(_BBFMultiply_35_1__out),
        .in2(_BBFMultiply_35_1__in2),
        .in1(_BBFMultiply_35_1__in1)
    );
    wire [63:0] _T_4585_node;
    wire [63:0] _BBFAdd_49_1__out;
    wire [63:0] _BBFAdd_49_1__in2;
    wire [63:0] _BBFAdd_49_1__in1;
    BBFAdd BBFAdd_49_1 (
        .out(_BBFAdd_49_1__out),
        .in2(_BBFAdd_49_1__in2),
        .in1(_BBFAdd_49_1__in1)
    );
    wire [63:0] _T_4591_node;
    wire [63:0] _T_4607_real_node;
    wire [63:0] _T_4607_imaginary_node;
    wire [63:0] _BBFAdd_50_1__out;
    wire [63:0] _BBFAdd_50_1__in2;
    wire [63:0] _BBFAdd_50_1__in1;
    BBFAdd BBFAdd_50_1 (
        .out(_BBFAdd_50_1__out),
        .in2(_BBFAdd_50_1__in2),
        .in1(_BBFAdd_50_1__in1)
    );
    wire [63:0] _T_4611_node;
    wire [63:0] _BBFAdd_51_1__out;
    wire [63:0] _BBFAdd_51_1__in2;
    wire [63:0] _BBFAdd_51_1__in1;
    BBFAdd BBFAdd_51_1 (
        .out(_BBFAdd_51_1__out),
        .in2(_BBFAdd_51_1__in2),
        .in1(_BBFAdd_51_1__in1)
    );
    wire [63:0] _T_4617_node;
    wire [63:0] _T_4633_real_node;
    wire [63:0] _T_4633_imaginary_node;
    wire [63:0] _T_4637_node;
    wire [63:0] _BBFSubtract_32_1__out;
    wire [63:0] _BBFSubtract_32_1__in2;
    wire [63:0] _BBFSubtract_32_1__in1;
    BBFSubtract BBFSubtract_32_1 (
        .out(_BBFSubtract_32_1__out),
        .in2(_BBFSubtract_32_1__in2),
        .in1(_BBFSubtract_32_1__in1)
    );
    wire [63:0] _T_4644_node;
    wire [63:0] _T_4650_node;
    wire [63:0] _BBFSubtract_33_1__out;
    wire [63:0] _BBFSubtract_33_1__in2;
    wire [63:0] _BBFSubtract_33_1__in1;
    BBFSubtract BBFSubtract_33_1 (
        .out(_BBFSubtract_33_1__out),
        .in2(_BBFSubtract_33_1__in2),
        .in1(_BBFSubtract_33_1__in1)
    );
    wire [63:0] _T_4657_node;
    wire [63:0] _T_4673_real_node;
    wire [63:0] _T_4673_imaginary_node;
    wire [63:0] _BBFAdd_52_1__out;
    wire [63:0] _BBFAdd_52_1__in2;
    wire [63:0] _BBFAdd_52_1__in1;
    BBFAdd BBFAdd_52_1 (
        .out(_BBFAdd_52_1__out),
        .in2(_BBFAdd_52_1__in2),
        .in1(_BBFAdd_52_1__in1)
    );
    wire [63:0] _T_4677_node;
    wire [63:0] _BBFAdd_53_1__out;
    wire [63:0] _BBFAdd_53_1__in2;
    wire [63:0] _BBFAdd_53_1__in1;
    BBFAdd BBFAdd_53_1 (
        .out(_BBFAdd_53_1__out),
        .in2(_BBFAdd_53_1__in2),
        .in1(_BBFAdd_53_1__in1)
    );
    wire [63:0] _T_4683_node;
    wire [63:0] _T_4699_real_node;
    wire [63:0] _T_4699_imaginary_node;
    wire _T_4714_real_node__T_4729_clk;
    wire _T_4714_real_node__T_4729_en;
    wire _T_4714_real_node__T_4729_mask;
    wire _T_4714_real_node__T_4729_addr;
    wire [63:0] _T_4714_real_node__T_4729_data;
    wire [63:0] _T_4714_real_node__T_4736_data;
    wire _T_4714_real_node__T_4736_clk;
    wire _T_4714_real_node__T_4736_en;
    wire _T_4714_real_node__T_4736_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4714_real_node (
        .read_data(_T_4714_real_node__T_4736_data),
        .read_clk(_T_4714_real_node__T_4736_clk),
        .read_en(_T_4714_real_node__T_4736_en),
        .read_addr(_T_4714_real_node__T_4736_addr),
        .write_clk(_T_4714_real_node__T_4729_clk),
        .write_en(_T_4714_real_node__T_4729_en),
        .write_mask(_T_4714_real_node__T_4729_mask),
        .write_addr(_T_4714_real_node__T_4729_addr),
        .write_data(_T_4714_real_node__T_4729_data)
    );
    wire _T_4714_imaginary_node__T_4729_clk;
    wire _T_4714_imaginary_node__T_4729_en;
    wire _T_4714_imaginary_node__T_4729_mask;
    wire _T_4714_imaginary_node__T_4729_addr;
    wire [63:0] _T_4714_imaginary_node__T_4729_data;
    wire [63:0] _T_4714_imaginary_node__T_4736_data;
    wire _T_4714_imaginary_node__T_4736_clk;
    wire _T_4714_imaginary_node__T_4736_en;
    wire _T_4714_imaginary_node__T_4736_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4714_imaginary_node (
        .read_data(_T_4714_imaginary_node__T_4736_data),
        .read_clk(_T_4714_imaginary_node__T_4736_clk),
        .read_en(_T_4714_imaginary_node__T_4736_en),
        .read_addr(_T_4714_imaginary_node__T_4736_addr),
        .write_clk(_T_4714_imaginary_node__T_4729_clk),
        .write_en(_T_4714_imaginary_node__T_4729_en),
        .write_mask(_T_4714_imaginary_node__T_4729_mask),
        .write_addr(_T_4714_imaginary_node__T_4729_addr),
        .write_data(_T_4714_imaginary_node__T_4729_data)
    );
    wire __T_4716__q;
    wire __T_4716__d;
    DFF_POSCLK #(.width(1)) _T_4716 (
        .q(__T_4716__q),
        .d(__T_4716__d),
        .clk(clock)
    );
    wire _WTEMP_24;
    MUX_UNSIGNED #(.width(1)) u_mux_900 (
        .y(__T_4716__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_24)
    );
    wire _T_4718;
    EQ_UNSIGNED #(.width(1)) u_eq_901 (
        .y(_T_4718),
        .a(__T_4716__q),
        .b(1'h1)
    );
    wire [1:0] _T_4720;
    ADD_UNSIGNED #(.width(1)) u_add_902 (
        .y(_T_4720),
        .a(__T_4716__q),
        .b(1'h1)
    );
    wire _T_4721;
    TAIL #(.width(2), .n(1)) tail_903 (
        .y(_T_4721),
        .in(_T_4720)
    );
    wire _T_4722;
    BITWISEAND #(.width(1)) bitwiseand_904 (
        .y(_T_4722),
        .a(io_in_valid),
        .b(_T_4718)
    );
    assign _T_4714_real_node__T_4729_addr = __T_4716__q;
    assign _T_4714_real_node__T_4729_en = io_in_valid;
    assign _T_4714_real_node__T_4729_clk = clock;
    assign _T_4714_imaginary_node__T_4729_addr = __T_4716__q;
    assign _T_4714_imaginary_node__T_4729_en = io_in_valid;
    assign _T_4714_imaginary_node__T_4729_clk = clock;
    assign _T_4714_imaginary_node__T_4729_mask = 1'h1;
    assign _T_4714_real_node__T_4729_mask = 1'h1;
    assign _T_4714_real_node__T_4736_addr = __T_4716__q;
    assign _T_4714_real_node__T_4736_en = 1'h1;
    assign _T_4714_real_node__T_4736_clk = clock;
    assign _T_4714_imaginary_node__T_4736_addr = __T_4716__q;
    assign _T_4714_imaginary_node__T_4736_en = 1'h1;
    assign _T_4714_imaginary_node__T_4736_clk = clock;
    wire [63:0] _BBFMultiply_36_1__out;
    wire [63:0] _BBFMultiply_36_1__in2;
    wire [63:0] _BBFMultiply_36_1__in1;
    BBFMultiply BBFMultiply_36_1 (
        .out(_BBFMultiply_36_1__out),
        .in2(_BBFMultiply_36_1__in2),
        .in1(_BBFMultiply_36_1__in1)
    );
    wire [63:0] _T_4740_node;
    wire [63:0] _BBFMultiply_37_1__out;
    wire [63:0] _BBFMultiply_37_1__in2;
    wire [63:0] _BBFMultiply_37_1__in1;
    BBFMultiply BBFMultiply_37_1 (
        .out(_BBFMultiply_37_1__out),
        .in2(_BBFMultiply_37_1__in2),
        .in1(_BBFMultiply_37_1__in1)
    );
    wire [63:0] _T_4746_node;
    wire [63:0] _T_4752_node;
    wire [63:0] _BBFSubtract_34_1__out;
    wire [63:0] _BBFSubtract_34_1__in2;
    wire [63:0] _BBFSubtract_34_1__in1;
    BBFSubtract BBFSubtract_34_1 (
        .out(_BBFSubtract_34_1__out),
        .in2(_BBFSubtract_34_1__in2),
        .in1(_BBFSubtract_34_1__in1)
    );
    wire [63:0] _T_4759_node;
    wire [63:0] _BBFAdd_54_1__out;
    wire [63:0] _BBFAdd_54_1__in2;
    wire [63:0] _BBFAdd_54_1__in1;
    BBFAdd BBFAdd_54_1 (
        .out(_BBFAdd_54_1__out),
        .in2(_BBFAdd_54_1__in2),
        .in1(_BBFAdd_54_1__in1)
    );
    wire [63:0] _T_4765_node;
    wire [63:0] _BBFMultiply_38_1__out;
    wire [63:0] _BBFMultiply_38_1__in2;
    wire [63:0] _BBFMultiply_38_1__in1;
    BBFMultiply BBFMultiply_38_1 (
        .out(_BBFMultiply_38_1__out),
        .in2(_BBFMultiply_38_1__in2),
        .in1(_BBFMultiply_38_1__in1)
    );
    wire [63:0] _T_4771_node;
    wire [63:0] _BBFMultiply_39_1__out;
    wire [63:0] _BBFMultiply_39_1__in2;
    wire [63:0] _BBFMultiply_39_1__in1;
    BBFMultiply BBFMultiply_39_1 (
        .out(_BBFMultiply_39_1__out),
        .in2(_BBFMultiply_39_1__in2),
        .in1(_BBFMultiply_39_1__in1)
    );
    wire [63:0] _T_4777_node;
    wire [63:0] _BBFAdd_55_1__out;
    wire [63:0] _BBFAdd_55_1__in2;
    wire [63:0] _BBFAdd_55_1__in1;
    BBFAdd BBFAdd_55_1 (
        .out(_BBFAdd_55_1__out),
        .in2(_BBFAdd_55_1__in2),
        .in1(_BBFAdd_55_1__in1)
    );
    wire [63:0] _T_4783_node;
    wire [63:0] _T_4799_real_node;
    wire [63:0] _T_4799_imaginary_node;
    wire [63:0] _BBFAdd_56_1__out;
    wire [63:0] _BBFAdd_56_1__in2;
    wire [63:0] _BBFAdd_56_1__in1;
    BBFAdd BBFAdd_56_1 (
        .out(_BBFAdd_56_1__out),
        .in2(_BBFAdd_56_1__in2),
        .in1(_BBFAdd_56_1__in1)
    );
    wire [63:0] _T_4803_node;
    wire [63:0] _BBFAdd_57_1__out;
    wire [63:0] _BBFAdd_57_1__in2;
    wire [63:0] _BBFAdd_57_1__in1;
    BBFAdd BBFAdd_57_1 (
        .out(_BBFAdd_57_1__out),
        .in2(_BBFAdd_57_1__in2),
        .in1(_BBFAdd_57_1__in1)
    );
    wire [63:0] _T_4809_node;
    wire [63:0] _T_4825_real_node;
    wire [63:0] _T_4825_imaginary_node;
    wire [63:0] _T_4829_node;
    wire [63:0] _BBFSubtract_35_1__out;
    wire [63:0] _BBFSubtract_35_1__in2;
    wire [63:0] _BBFSubtract_35_1__in1;
    BBFSubtract BBFSubtract_35_1 (
        .out(_BBFSubtract_35_1__out),
        .in2(_BBFSubtract_35_1__in2),
        .in1(_BBFSubtract_35_1__in1)
    );
    wire [63:0] _T_4836_node;
    wire [63:0] _T_4842_node;
    wire [63:0] _BBFSubtract_36_1__out;
    wire [63:0] _BBFSubtract_36_1__in2;
    wire [63:0] _BBFSubtract_36_1__in1;
    BBFSubtract BBFSubtract_36_1 (
        .out(_BBFSubtract_36_1__out),
        .in2(_BBFSubtract_36_1__in2),
        .in1(_BBFSubtract_36_1__in1)
    );
    wire [63:0] _T_4849_node;
    wire [63:0] _T_4865_real_node;
    wire [63:0] _T_4865_imaginary_node;
    wire [63:0] _BBFAdd_58_1__out;
    wire [63:0] _BBFAdd_58_1__in2;
    wire [63:0] _BBFAdd_58_1__in1;
    BBFAdd BBFAdd_58_1 (
        .out(_BBFAdd_58_1__out),
        .in2(_BBFAdd_58_1__in2),
        .in1(_BBFAdd_58_1__in1)
    );
    wire [63:0] _T_4869_node;
    wire [63:0] _BBFAdd_59_1__out;
    wire [63:0] _BBFAdd_59_1__in2;
    wire [63:0] _BBFAdd_59_1__in1;
    BBFAdd BBFAdd_59_1 (
        .out(_BBFAdd_59_1__out),
        .in2(_BBFAdd_59_1__in2),
        .in1(_BBFAdd_59_1__in1)
    );
    wire [63:0] _T_4875_node;
    wire [63:0] _T_4891_real_node;
    wire [63:0] _T_4891_imaginary_node;
    wire _T_4906_real_node__T_4921_clk;
    wire _T_4906_real_node__T_4921_en;
    wire _T_4906_real_node__T_4921_mask;
    wire _T_4906_real_node__T_4921_addr;
    wire [63:0] _T_4906_real_node__T_4921_data;
    wire [63:0] _T_4906_real_node__T_4928_data;
    wire _T_4906_real_node__T_4928_clk;
    wire _T_4906_real_node__T_4928_en;
    wire _T_4906_real_node__T_4928_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4906_real_node (
        .read_data(_T_4906_real_node__T_4928_data),
        .read_clk(_T_4906_real_node__T_4928_clk),
        .read_en(_T_4906_real_node__T_4928_en),
        .read_addr(_T_4906_real_node__T_4928_addr),
        .write_clk(_T_4906_real_node__T_4921_clk),
        .write_en(_T_4906_real_node__T_4921_en),
        .write_mask(_T_4906_real_node__T_4921_mask),
        .write_addr(_T_4906_real_node__T_4921_addr),
        .write_data(_T_4906_real_node__T_4921_data)
    );
    wire _T_4906_imaginary_node__T_4921_clk;
    wire _T_4906_imaginary_node__T_4921_en;
    wire _T_4906_imaginary_node__T_4921_mask;
    wire _T_4906_imaginary_node__T_4921_addr;
    wire [63:0] _T_4906_imaginary_node__T_4921_data;
    wire [63:0] _T_4906_imaginary_node__T_4928_data;
    wire _T_4906_imaginary_node__T_4928_clk;
    wire _T_4906_imaginary_node__T_4928_en;
    wire _T_4906_imaginary_node__T_4928_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4906_imaginary_node (
        .read_data(_T_4906_imaginary_node__T_4928_data),
        .read_clk(_T_4906_imaginary_node__T_4928_clk),
        .read_en(_T_4906_imaginary_node__T_4928_en),
        .read_addr(_T_4906_imaginary_node__T_4928_addr),
        .write_clk(_T_4906_imaginary_node__T_4921_clk),
        .write_en(_T_4906_imaginary_node__T_4921_en),
        .write_mask(_T_4906_imaginary_node__T_4921_mask),
        .write_addr(_T_4906_imaginary_node__T_4921_addr),
        .write_data(_T_4906_imaginary_node__T_4921_data)
    );
    wire __T_4908__q;
    wire __T_4908__d;
    DFF_POSCLK #(.width(1)) _T_4908 (
        .q(__T_4908__q),
        .d(__T_4908__d),
        .clk(clock)
    );
    wire _WTEMP_25;
    MUX_UNSIGNED #(.width(1)) u_mux_905 (
        .y(__T_4908__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_25)
    );
    wire _T_4910;
    EQ_UNSIGNED #(.width(1)) u_eq_906 (
        .y(_T_4910),
        .a(__T_4908__q),
        .b(1'h1)
    );
    wire [1:0] _T_4912;
    ADD_UNSIGNED #(.width(1)) u_add_907 (
        .y(_T_4912),
        .a(__T_4908__q),
        .b(1'h1)
    );
    wire _T_4913;
    TAIL #(.width(2), .n(1)) tail_908 (
        .y(_T_4913),
        .in(_T_4912)
    );
    wire _T_4914;
    BITWISEAND #(.width(1)) bitwiseand_909 (
        .y(_T_4914),
        .a(io_in_valid),
        .b(_T_4910)
    );
    assign _T_4906_real_node__T_4921_addr = __T_4908__q;
    assign _T_4906_real_node__T_4921_en = io_in_valid;
    assign _T_4906_real_node__T_4921_clk = clock;
    assign _T_4906_imaginary_node__T_4921_addr = __T_4908__q;
    assign _T_4906_imaginary_node__T_4921_en = io_in_valid;
    assign _T_4906_imaginary_node__T_4921_clk = clock;
    assign _T_4906_imaginary_node__T_4921_mask = 1'h1;
    assign _T_4906_real_node__T_4921_mask = 1'h1;
    assign _T_4906_real_node__T_4928_addr = __T_4908__q;
    assign _T_4906_real_node__T_4928_en = 1'h1;
    assign _T_4906_real_node__T_4928_clk = clock;
    assign _T_4906_imaginary_node__T_4928_addr = __T_4908__q;
    assign _T_4906_imaginary_node__T_4928_en = 1'h1;
    assign _T_4906_imaginary_node__T_4928_clk = clock;
    wire [63:0] _BBFMultiply_40_1__out;
    wire [63:0] _BBFMultiply_40_1__in2;
    wire [63:0] _BBFMultiply_40_1__in1;
    BBFMultiply BBFMultiply_40_1 (
        .out(_BBFMultiply_40_1__out),
        .in2(_BBFMultiply_40_1__in2),
        .in1(_BBFMultiply_40_1__in1)
    );
    wire [63:0] _T_4932_node;
    wire [63:0] _BBFMultiply_41_1__out;
    wire [63:0] _BBFMultiply_41_1__in2;
    wire [63:0] _BBFMultiply_41_1__in1;
    BBFMultiply BBFMultiply_41_1 (
        .out(_BBFMultiply_41_1__out),
        .in2(_BBFMultiply_41_1__in2),
        .in1(_BBFMultiply_41_1__in1)
    );
    wire [63:0] _T_4938_node;
    wire [63:0] _T_4944_node;
    wire [63:0] _BBFSubtract_37_1__out;
    wire [63:0] _BBFSubtract_37_1__in2;
    wire [63:0] _BBFSubtract_37_1__in1;
    BBFSubtract BBFSubtract_37_1 (
        .out(_BBFSubtract_37_1__out),
        .in2(_BBFSubtract_37_1__in2),
        .in1(_BBFSubtract_37_1__in1)
    );
    wire [63:0] _T_4951_node;
    wire [63:0] _BBFAdd_60_1__out;
    wire [63:0] _BBFAdd_60_1__in2;
    wire [63:0] _BBFAdd_60_1__in1;
    BBFAdd BBFAdd_60_1 (
        .out(_BBFAdd_60_1__out),
        .in2(_BBFAdd_60_1__in2),
        .in1(_BBFAdd_60_1__in1)
    );
    wire [63:0] _T_4957_node;
    wire [63:0] _BBFMultiply_42_1__out;
    wire [63:0] _BBFMultiply_42_1__in2;
    wire [63:0] _BBFMultiply_42_1__in1;
    BBFMultiply BBFMultiply_42_1 (
        .out(_BBFMultiply_42_1__out),
        .in2(_BBFMultiply_42_1__in2),
        .in1(_BBFMultiply_42_1__in1)
    );
    wire [63:0] _T_4963_node;
    wire [63:0] _BBFMultiply_43_1__out;
    wire [63:0] _BBFMultiply_43_1__in2;
    wire [63:0] _BBFMultiply_43_1__in1;
    BBFMultiply BBFMultiply_43_1 (
        .out(_BBFMultiply_43_1__out),
        .in2(_BBFMultiply_43_1__in2),
        .in1(_BBFMultiply_43_1__in1)
    );
    wire [63:0] _T_4969_node;
    wire [63:0] _BBFAdd_61_1__out;
    wire [63:0] _BBFAdd_61_1__in2;
    wire [63:0] _BBFAdd_61_1__in1;
    BBFAdd BBFAdd_61_1 (
        .out(_BBFAdd_61_1__out),
        .in2(_BBFAdd_61_1__in2),
        .in1(_BBFAdd_61_1__in1)
    );
    wire [63:0] _T_4975_node;
    wire [63:0] _T_4991_real_node;
    wire [63:0] _T_4991_imaginary_node;
    wire [63:0] _BBFAdd_62_1__out;
    wire [63:0] _BBFAdd_62_1__in2;
    wire [63:0] _BBFAdd_62_1__in1;
    BBFAdd BBFAdd_62_1 (
        .out(_BBFAdd_62_1__out),
        .in2(_BBFAdd_62_1__in2),
        .in1(_BBFAdd_62_1__in1)
    );
    wire [63:0] _T_4995_node;
    wire [63:0] _BBFAdd_63_1__out;
    wire [63:0] _BBFAdd_63_1__in2;
    wire [63:0] _BBFAdd_63_1__in1;
    BBFAdd BBFAdd_63_1 (
        .out(_BBFAdd_63_1__out),
        .in2(_BBFAdd_63_1__in2),
        .in1(_BBFAdd_63_1__in1)
    );
    wire [63:0] _T_5001_node;
    wire [63:0] _T_5017_real_node;
    wire [63:0] _T_5017_imaginary_node;
    wire [63:0] _T_5021_node;
    wire [63:0] _BBFSubtract_38_1__out;
    wire [63:0] _BBFSubtract_38_1__in2;
    wire [63:0] _BBFSubtract_38_1__in1;
    BBFSubtract BBFSubtract_38_1 (
        .out(_BBFSubtract_38_1__out),
        .in2(_BBFSubtract_38_1__in2),
        .in1(_BBFSubtract_38_1__in1)
    );
    wire [63:0] _T_5028_node;
    wire [63:0] _T_5034_node;
    wire [63:0] _BBFSubtract_39_1__out;
    wire [63:0] _BBFSubtract_39_1__in2;
    wire [63:0] _BBFSubtract_39_1__in1;
    BBFSubtract BBFSubtract_39_1 (
        .out(_BBFSubtract_39_1__out),
        .in2(_BBFSubtract_39_1__in2),
        .in1(_BBFSubtract_39_1__in1)
    );
    wire [63:0] _T_5041_node;
    wire [63:0] _T_5057_real_node;
    wire [63:0] _T_5057_imaginary_node;
    wire [63:0] _BBFAdd_64_1__out;
    wire [63:0] _BBFAdd_64_1__in2;
    wire [63:0] _BBFAdd_64_1__in1;
    BBFAdd BBFAdd_64_1 (
        .out(_BBFAdd_64_1__out),
        .in2(_BBFAdd_64_1__in2),
        .in1(_BBFAdd_64_1__in1)
    );
    wire [63:0] _T_5061_node;
    wire [63:0] _BBFAdd_65_1__out;
    wire [63:0] _BBFAdd_65_1__in2;
    wire [63:0] _BBFAdd_65_1__in1;
    BBFAdd BBFAdd_65_1 (
        .out(_BBFAdd_65_1__out),
        .in2(_BBFAdd_65_1__in2),
        .in1(_BBFAdd_65_1__in1)
    );
    wire [63:0] _T_5067_node;
    wire [63:0] _T_5083_real_node;
    wire [63:0] _T_5083_imaginary_node;
    wire _T_5098_real_node__T_5113_clk;
    wire _T_5098_real_node__T_5113_en;
    wire _T_5098_real_node__T_5113_mask;
    wire _T_5098_real_node__T_5113_addr;
    wire [63:0] _T_5098_real_node__T_5113_data;
    wire [63:0] _T_5098_real_node__T_5120_data;
    wire _T_5098_real_node__T_5120_clk;
    wire _T_5098_real_node__T_5120_en;
    wire _T_5098_real_node__T_5120_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_5098_real_node (
        .read_data(_T_5098_real_node__T_5120_data),
        .read_clk(_T_5098_real_node__T_5120_clk),
        .read_en(_T_5098_real_node__T_5120_en),
        .read_addr(_T_5098_real_node__T_5120_addr),
        .write_clk(_T_5098_real_node__T_5113_clk),
        .write_en(_T_5098_real_node__T_5113_en),
        .write_mask(_T_5098_real_node__T_5113_mask),
        .write_addr(_T_5098_real_node__T_5113_addr),
        .write_data(_T_5098_real_node__T_5113_data)
    );
    wire _T_5098_imaginary_node__T_5113_clk;
    wire _T_5098_imaginary_node__T_5113_en;
    wire _T_5098_imaginary_node__T_5113_mask;
    wire _T_5098_imaginary_node__T_5113_addr;
    wire [63:0] _T_5098_imaginary_node__T_5113_data;
    wire [63:0] _T_5098_imaginary_node__T_5120_data;
    wire _T_5098_imaginary_node__T_5120_clk;
    wire _T_5098_imaginary_node__T_5120_en;
    wire _T_5098_imaginary_node__T_5120_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_5098_imaginary_node (
        .read_data(_T_5098_imaginary_node__T_5120_data),
        .read_clk(_T_5098_imaginary_node__T_5120_clk),
        .read_en(_T_5098_imaginary_node__T_5120_en),
        .read_addr(_T_5098_imaginary_node__T_5120_addr),
        .write_clk(_T_5098_imaginary_node__T_5113_clk),
        .write_en(_T_5098_imaginary_node__T_5113_en),
        .write_mask(_T_5098_imaginary_node__T_5113_mask),
        .write_addr(_T_5098_imaginary_node__T_5113_addr),
        .write_data(_T_5098_imaginary_node__T_5113_data)
    );
    wire __T_5100__q;
    wire __T_5100__d;
    DFF_POSCLK #(.width(1)) _T_5100 (
        .q(__T_5100__q),
        .d(__T_5100__d),
        .clk(clock)
    );
    wire _WTEMP_26;
    MUX_UNSIGNED #(.width(1)) u_mux_910 (
        .y(__T_5100__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_26)
    );
    wire _T_5102;
    EQ_UNSIGNED #(.width(1)) u_eq_911 (
        .y(_T_5102),
        .a(__T_5100__q),
        .b(1'h1)
    );
    wire [1:0] _T_5104;
    ADD_UNSIGNED #(.width(1)) u_add_912 (
        .y(_T_5104),
        .a(__T_5100__q),
        .b(1'h1)
    );
    wire _T_5105;
    TAIL #(.width(2), .n(1)) tail_913 (
        .y(_T_5105),
        .in(_T_5104)
    );
    wire _T_5106;
    BITWISEAND #(.width(1)) bitwiseand_914 (
        .y(_T_5106),
        .a(io_in_valid),
        .b(_T_5102)
    );
    assign _T_5098_real_node__T_5113_addr = __T_5100__q;
    assign _T_5098_real_node__T_5113_en = io_in_valid;
    assign _T_5098_real_node__T_5113_clk = clock;
    assign _T_5098_imaginary_node__T_5113_addr = __T_5100__q;
    assign _T_5098_imaginary_node__T_5113_en = io_in_valid;
    assign _T_5098_imaginary_node__T_5113_clk = clock;
    assign _T_5098_imaginary_node__T_5113_mask = 1'h1;
    assign _T_5098_real_node__T_5113_mask = 1'h1;
    assign _T_5098_real_node__T_5120_addr = __T_5100__q;
    assign _T_5098_real_node__T_5120_en = 1'h1;
    assign _T_5098_real_node__T_5120_clk = clock;
    assign _T_5098_imaginary_node__T_5120_addr = __T_5100__q;
    assign _T_5098_imaginary_node__T_5120_en = 1'h1;
    assign _T_5098_imaginary_node__T_5120_clk = clock;
    wire [63:0] _BBFMultiply_44_1__out;
    wire [63:0] _BBFMultiply_44_1__in2;
    wire [63:0] _BBFMultiply_44_1__in1;
    BBFMultiply BBFMultiply_44_1 (
        .out(_BBFMultiply_44_1__out),
        .in2(_BBFMultiply_44_1__in2),
        .in1(_BBFMultiply_44_1__in1)
    );
    wire [63:0] _T_5124_node;
    wire [63:0] _BBFMultiply_45_1__out;
    wire [63:0] _BBFMultiply_45_1__in2;
    wire [63:0] _BBFMultiply_45_1__in1;
    BBFMultiply BBFMultiply_45_1 (
        .out(_BBFMultiply_45_1__out),
        .in2(_BBFMultiply_45_1__in2),
        .in1(_BBFMultiply_45_1__in1)
    );
    wire [63:0] _T_5130_node;
    wire [63:0] _T_5136_node;
    wire [63:0] _BBFSubtract_40_1__out;
    wire [63:0] _BBFSubtract_40_1__in2;
    wire [63:0] _BBFSubtract_40_1__in1;
    BBFSubtract BBFSubtract_40_1 (
        .out(_BBFSubtract_40_1__out),
        .in2(_BBFSubtract_40_1__in2),
        .in1(_BBFSubtract_40_1__in1)
    );
    wire [63:0] _T_5143_node;
    wire [63:0] _BBFAdd_66_1__out;
    wire [63:0] _BBFAdd_66_1__in2;
    wire [63:0] _BBFAdd_66_1__in1;
    BBFAdd BBFAdd_66_1 (
        .out(_BBFAdd_66_1__out),
        .in2(_BBFAdd_66_1__in2),
        .in1(_BBFAdd_66_1__in1)
    );
    wire [63:0] _T_5149_node;
    wire [63:0] _BBFMultiply_46_1__out;
    wire [63:0] _BBFMultiply_46_1__in2;
    wire [63:0] _BBFMultiply_46_1__in1;
    BBFMultiply BBFMultiply_46_1 (
        .out(_BBFMultiply_46_1__out),
        .in2(_BBFMultiply_46_1__in2),
        .in1(_BBFMultiply_46_1__in1)
    );
    wire [63:0] _T_5155_node;
    wire [63:0] _BBFMultiply_47_1__out;
    wire [63:0] _BBFMultiply_47_1__in2;
    wire [63:0] _BBFMultiply_47_1__in1;
    BBFMultiply BBFMultiply_47_1 (
        .out(_BBFMultiply_47_1__out),
        .in2(_BBFMultiply_47_1__in2),
        .in1(_BBFMultiply_47_1__in1)
    );
    wire [63:0] _T_5161_node;
    wire [63:0] _BBFAdd_67_1__out;
    wire [63:0] _BBFAdd_67_1__in2;
    wire [63:0] _BBFAdd_67_1__in1;
    BBFAdd BBFAdd_67_1 (
        .out(_BBFAdd_67_1__out),
        .in2(_BBFAdd_67_1__in2),
        .in1(_BBFAdd_67_1__in1)
    );
    wire [63:0] _T_5167_node;
    wire [63:0] _T_5183_real_node;
    wire [63:0] _T_5183_imaginary_node;
    wire [63:0] _BBFAdd_68_1__out;
    wire [63:0] _BBFAdd_68_1__in2;
    wire [63:0] _BBFAdd_68_1__in1;
    BBFAdd BBFAdd_68_1 (
        .out(_BBFAdd_68_1__out),
        .in2(_BBFAdd_68_1__in2),
        .in1(_BBFAdd_68_1__in1)
    );
    wire [63:0] _T_5187_node;
    wire [63:0] _BBFAdd_69_1__out;
    wire [63:0] _BBFAdd_69_1__in2;
    wire [63:0] _BBFAdd_69_1__in1;
    BBFAdd BBFAdd_69_1 (
        .out(_BBFAdd_69_1__out),
        .in2(_BBFAdd_69_1__in2),
        .in1(_BBFAdd_69_1__in1)
    );
    wire [63:0] _T_5193_node;
    wire [63:0] _T_5209_real_node;
    wire [63:0] _T_5209_imaginary_node;
    wire [63:0] _T_5213_node;
    wire [63:0] _BBFSubtract_41_1__out;
    wire [63:0] _BBFSubtract_41_1__in2;
    wire [63:0] _BBFSubtract_41_1__in1;
    BBFSubtract BBFSubtract_41_1 (
        .out(_BBFSubtract_41_1__out),
        .in2(_BBFSubtract_41_1__in2),
        .in1(_BBFSubtract_41_1__in1)
    );
    wire [63:0] _T_5220_node;
    wire [63:0] _T_5226_node;
    wire [63:0] _BBFSubtract_42_1__out;
    wire [63:0] _BBFSubtract_42_1__in2;
    wire [63:0] _BBFSubtract_42_1__in1;
    BBFSubtract BBFSubtract_42_1 (
        .out(_BBFSubtract_42_1__out),
        .in2(_BBFSubtract_42_1__in2),
        .in1(_BBFSubtract_42_1__in1)
    );
    wire [63:0] _T_5233_node;
    wire [63:0] _T_5249_real_node;
    wire [63:0] _T_5249_imaginary_node;
    wire [63:0] _BBFAdd_70_1__out;
    wire [63:0] _BBFAdd_70_1__in2;
    wire [63:0] _BBFAdd_70_1__in1;
    BBFAdd BBFAdd_70_1 (
        .out(_BBFAdd_70_1__out),
        .in2(_BBFAdd_70_1__in2),
        .in1(_BBFAdd_70_1__in1)
    );
    wire [63:0] _T_5253_node;
    wire [63:0] _BBFAdd_71_1__out;
    wire [63:0] _BBFAdd_71_1__in2;
    wire [63:0] _BBFAdd_71_1__in1;
    BBFAdd BBFAdd_71_1 (
        .out(_BBFAdd_71_1__out),
        .in2(_BBFAdd_71_1__in2),
        .in1(_BBFAdd_71_1__in1)
    );
    wire [63:0] _T_5259_node;
    wire [63:0] _T_5275_real_node;
    wire [63:0] _T_5275_imaginary_node;
    assign _BBFAdd_10_1__in1 = stage_outputs_0_1_real_node;
    assign _BBFAdd_10_1__in2 = _T_2939_real_node;
    assign _BBFAdd_11_1__in1 = stage_outputs_0_1_imaginary_node;
    assign _BBFAdd_11_1__in2 = _T_2939_imaginary_node;
    assign _BBFAdd_12_1__in1 = _T_3037_node;
    assign _BBFAdd_12_1__in2 = _T_3056_node;
    assign _BBFAdd_13_1__in1 = _T_3068_node;
    assign _BBFAdd_13_1__in2 = _T_3074_node;
    assign _BBFAdd_14_1__in1 = stage_outputs_0_2_real_node;
    assign _BBFAdd_14_1__in2 = _T_3096_real_node;
    assign _BBFAdd_15_1__in1 = stage_outputs_0_2_imaginary_node;
    assign _BBFAdd_15_1__in2 = _T_3096_imaginary_node;
    assign _BBFAdd_16_1__in1 = stage_outputs_0_2_real_node;
    assign _BBFAdd_16_1__in2 = _T_3162_real_node;
    assign _BBFAdd_17_1__in1 = stage_outputs_0_2_imaginary_node;
    assign _BBFAdd_17_1__in2 = _T_3162_imaginary_node;
    assign _BBFAdd_18_1__in1 = _T_3260_node;
    assign _BBFAdd_18_1__in2 = _T_3279_node;
    assign _BBFAdd_19_1__in1 = _T_3291_node;
    assign _BBFAdd_19_1__in2 = _T_3297_node;
    assign _BBFAdd_1_1__in1 = _T_2622_node;
    assign _BBFAdd_1_1__in2 = _T_2628_node;
    assign _BBFAdd_20_1__in1 = stage_outputs_0_3_real_node;
    assign _BBFAdd_20_1__in2 = _T_3319_real_node;
    assign _BBFAdd_21_1__in1 = stage_outputs_0_3_imaginary_node;
    assign _BBFAdd_21_1__in2 = _T_3319_imaginary_node;
    assign _BBFAdd_22_1__in1 = stage_outputs_0_3_real_node;
    assign _BBFAdd_22_1__in2 = _T_3385_real_node;
    assign _BBFAdd_23_1__in1 = stage_outputs_0_3_imaginary_node;
    assign _BBFAdd_23_1__in2 = _T_3385_imaginary_node;
    assign _BBFAdd_24_1__in1 = _T_3517_node;
    assign _BBFAdd_24_1__in2 = _T_3536_node;
    assign _BBFAdd_25_1__in1 = _T_3548_node;
    assign _BBFAdd_25_1__in2 = _T_3554_node;
    assign _BBFAdd_26_1__in1 = stage_outputs_1_0_real_node;
    assign _BBFAdd_26_1__in2 = _T_3576_real_node;
    assign _BBFAdd_27_1__in1 = stage_outputs_1_0_imaginary_node;
    assign _BBFAdd_27_1__in2 = _T_3576_imaginary_node;
    assign _BBFAdd_28_1__in1 = stage_outputs_1_0_real_node;
    assign _BBFAdd_28_1__in2 = _T_3642_real_node;
    assign _BBFAdd_29_1__in1 = stage_outputs_1_0_imaginary_node;
    assign _BBFAdd_29_1__in2 = _T_3642_imaginary_node;
    assign _BBFAdd_2_1__in1 = stage_outputs_0_0_real_node;
    assign _BBFAdd_2_1__in2 = _T_2650_real_node;
    assign _BBFAdd_30_1__in1 = _T_3774_node;
    assign _BBFAdd_30_1__in2 = _T_3793_node;
    assign _BBFAdd_31_1__in1 = _T_3805_node;
    assign _BBFAdd_31_1__in2 = _T_3811_node;
    assign _BBFAdd_32_1__in1 = stage_outputs_1_1_real_node;
    assign _BBFAdd_32_1__in2 = _T_3833_real_node;
    assign _BBFAdd_33_1__in1 = stage_outputs_1_1_imaginary_node;
    assign _BBFAdd_33_1__in2 = _T_3833_imaginary_node;
    assign _BBFAdd_34_1__in1 = stage_outputs_1_1_real_node;
    assign _BBFAdd_34_1__in2 = _T_3899_real_node;
    assign _BBFAdd_35_1__in1 = stage_outputs_1_1_imaginary_node;
    assign _BBFAdd_35_1__in2 = _T_3899_imaginary_node;
    assign _BBFAdd_36_1__in1 = _T_4031_node;
    assign _BBFAdd_36_1__in2 = _T_4050_node;
    assign _BBFAdd_37_1__in1 = _T_4062_node;
    assign _BBFAdd_37_1__in2 = _T_4068_node;
    assign _BBFAdd_38_1__in1 = stage_outputs_1_4_real_node;
    assign _BBFAdd_38_1__in2 = _T_4090_real_node;
    assign _BBFAdd_39_1__in1 = stage_outputs_1_4_imaginary_node;
    assign _BBFAdd_39_1__in2 = _T_4090_imaginary_node;
    assign _BBFAdd_3_1__in1 = stage_outputs_0_0_imaginary_node;
    assign _BBFAdd_3_1__in2 = _T_2650_imaginary_node;
    assign _BBFAdd_40_1__in1 = stage_outputs_1_4_real_node;
    assign _BBFAdd_40_1__in2 = _T_4156_real_node;
    assign _BBFAdd_41_1__in1 = stage_outputs_1_4_imaginary_node;
    assign _BBFAdd_41_1__in2 = _T_4156_imaginary_node;
    assign _BBFAdd_42_1__in1 = _T_4288_node;
    assign _BBFAdd_42_1__in2 = _T_4307_node;
    assign _BBFAdd_43_1__in1 = _T_4319_node;
    assign _BBFAdd_43_1__in2 = _T_4325_node;
    assign _BBFAdd_44_1__in1 = stage_outputs_1_5_real_node;
    assign _BBFAdd_44_1__in2 = _T_4347_real_node;
    assign _BBFAdd_45_1__in1 = stage_outputs_1_5_imaginary_node;
    assign _BBFAdd_45_1__in2 = _T_4347_imaginary_node;
    assign _BBFAdd_46_1__in1 = stage_outputs_1_5_real_node;
    assign _BBFAdd_46_1__in2 = _T_4413_real_node;
    assign _BBFAdd_47_1__in1 = stage_outputs_1_5_imaginary_node;
    assign _BBFAdd_47_1__in2 = _T_4413_imaginary_node;
    assign _BBFAdd_48_1__in1 = _T_4548_node;
    assign _BBFAdd_48_1__in2 = _T_4567_node;
    assign _BBFAdd_49_1__in1 = _T_4579_node;
    assign _BBFAdd_49_1__in2 = _T_4585_node;
    assign _BBFAdd_4_1__in1 = stage_outputs_0_0_real_node;
    assign _BBFAdd_4_1__in2 = _T_2716_real_node;
    assign _BBFAdd_50_1__in1 = stage_outputs_2_0_real_node;
    assign _BBFAdd_50_1__in2 = _T_4607_real_node;
    assign _BBFAdd_51_1__in1 = stage_outputs_2_0_imaginary_node;
    assign _BBFAdd_51_1__in2 = _T_4607_imaginary_node;
    assign _BBFAdd_52_1__in1 = stage_outputs_2_0_real_node;
    assign _BBFAdd_52_1__in2 = _T_4673_real_node;
    assign _BBFAdd_53_1__in1 = stage_outputs_2_0_imaginary_node;
    assign _BBFAdd_53_1__in2 = _T_4673_imaginary_node;
    assign _BBFAdd_54_1__in1 = _T_4740_node;
    assign _BBFAdd_54_1__in2 = _T_4759_node;
    assign _BBFAdd_55_1__in1 = _T_4771_node;
    assign _BBFAdd_55_1__in2 = _T_4777_node;
    assign _BBFAdd_56_1__in1 = stage_outputs_2_2_real_node;
    assign _BBFAdd_56_1__in2 = _T_4799_real_node;
    assign _BBFAdd_57_1__in1 = stage_outputs_2_2_imaginary_node;
    assign _BBFAdd_57_1__in2 = _T_4799_imaginary_node;
    assign _BBFAdd_58_1__in1 = stage_outputs_2_2_real_node;
    assign _BBFAdd_58_1__in2 = _T_4865_real_node;
    assign _BBFAdd_59_1__in1 = stage_outputs_2_2_imaginary_node;
    assign _BBFAdd_59_1__in2 = _T_4865_imaginary_node;
    assign _BBFAdd_5_1__in1 = stage_outputs_0_0_imaginary_node;
    assign _BBFAdd_5_1__in2 = _T_2716_imaginary_node;
    assign _BBFAdd_60_1__in1 = _T_4932_node;
    assign _BBFAdd_60_1__in2 = _T_4951_node;
    assign _BBFAdd_61_1__in1 = _T_4963_node;
    assign _BBFAdd_61_1__in2 = _T_4969_node;
    assign _BBFAdd_62_1__in1 = stage_outputs_2_4_real_node;
    assign _BBFAdd_62_1__in2 = _T_4991_real_node;
    assign _BBFAdd_63_1__in1 = stage_outputs_2_4_imaginary_node;
    assign _BBFAdd_63_1__in2 = _T_4991_imaginary_node;
    assign _BBFAdd_64_1__in1 = stage_outputs_2_4_real_node;
    assign _BBFAdd_64_1__in2 = _T_5057_real_node;
    assign _BBFAdd_65_1__in1 = stage_outputs_2_4_imaginary_node;
    assign _BBFAdd_65_1__in2 = _T_5057_imaginary_node;
    assign _BBFAdd_66_1__in1 = _T_5124_node;
    assign _BBFAdd_66_1__in2 = _T_5143_node;
    assign _BBFAdd_67_1__in1 = _T_5155_node;
    assign _BBFAdd_67_1__in2 = _T_5161_node;
    assign _BBFAdd_68_1__in1 = stage_outputs_2_6_real_node;
    assign _BBFAdd_68_1__in2 = _T_5183_real_node;
    assign _BBFAdd_69_1__in1 = stage_outputs_2_6_imaginary_node;
    assign _BBFAdd_69_1__in2 = _T_5183_imaginary_node;
    assign _BBFAdd_6_1__in1 = _T_2814_node;
    assign _BBFAdd_6_1__in2 = _T_2833_node;
    assign _BBFAdd_70_1__in1 = stage_outputs_2_6_real_node;
    assign _BBFAdd_70_1__in2 = _T_5249_real_node;
    assign _BBFAdd_71_1__in1 = stage_outputs_2_6_imaginary_node;
    assign _BBFAdd_71_1__in2 = _T_5249_imaginary_node;
    assign _BBFAdd_72__in1 = _T_2591_node;
    assign _BBFAdd_72__in2 = _T_2610_node;
    assign _BBFAdd_7_1__in1 = _T_2845_node;
    assign _BBFAdd_7_1__in2 = _T_2851_node;
    assign _BBFAdd_8_1__in1 = stage_outputs_0_1_real_node;
    assign _BBFAdd_8_1__in2 = _T_2873_real_node;
    assign _BBFAdd_9_1__in1 = stage_outputs_0_1_imaginary_node;
    assign _BBFAdd_9_1__in2 = _T_2873_imaginary_node;
    assign _BBFMultiply_10_1__in1 = stage_outputs_0_6_real_node;
    assign _BBFMultiply_10_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_11_1__in1 = stage_outputs_0_6_imaginary_node;
    assign _BBFMultiply_11_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_12_1__in1 = stage_outputs_0_7_real_node;
    assign _BBFMultiply_12_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_13_1__in1 = stage_outputs_0_7_imaginary_node;
    assign _BBFMultiply_13_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_14_1__in1 = stage_outputs_0_7_real_node;
    assign _BBFMultiply_14_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_15_1__in1 = stage_outputs_0_7_imaginary_node;
    assign _BBFMultiply_15_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_16_1__in1 = stage_outputs_1_2_real_node;
    assign _BBFMultiply_16_1__in2 = _T_3494_real_node__T_3513_data;
    assign _BBFMultiply_17_1__in1 = stage_outputs_1_2_imaginary_node;
    assign _BBFMultiply_17_1__in2 = _T_3494_imaginary_node__T_3513_data;
    assign _BBFMultiply_18_1__in1 = stage_outputs_1_2_real_node;
    assign _BBFMultiply_18_1__in2 = _T_3494_imaginary_node__T_3513_data;
    assign _BBFMultiply_19_1__in1 = stage_outputs_1_2_imaginary_node;
    assign _BBFMultiply_19_1__in2 = _T_3494_real_node__T_3513_data;
    assign _BBFMultiply_1_1__in1 = stage_outputs_0_4_imaginary_node;
    assign _BBFMultiply_1_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_20_1__in1 = stage_outputs_1_3_real_node;
    assign _BBFMultiply_20_1__in2 = _T_3751_real_node__T_3770_data;
    assign _BBFMultiply_21_1__in1 = stage_outputs_1_3_imaginary_node;
    assign _BBFMultiply_21_1__in2 = _T_3751_imaginary_node__T_3770_data;
    assign _BBFMultiply_22_1__in1 = stage_outputs_1_3_real_node;
    assign _BBFMultiply_22_1__in2 = _T_3751_imaginary_node__T_3770_data;
    assign _BBFMultiply_23_1__in1 = stage_outputs_1_3_imaginary_node;
    assign _BBFMultiply_23_1__in2 = _T_3751_real_node__T_3770_data;
    assign _BBFMultiply_24_1__in1 = stage_outputs_1_6_real_node;
    assign _BBFMultiply_24_1__in2 = _T_4008_real_node__T_4027_data;
    assign _BBFMultiply_25_1__in1 = stage_outputs_1_6_imaginary_node;
    assign _BBFMultiply_25_1__in2 = _T_4008_imaginary_node__T_4027_data;
    assign _BBFMultiply_26_1__in1 = stage_outputs_1_6_real_node;
    assign _BBFMultiply_26_1__in2 = _T_4008_imaginary_node__T_4027_data;
    assign _BBFMultiply_27_1__in1 = stage_outputs_1_6_imaginary_node;
    assign _BBFMultiply_27_1__in2 = _T_4008_real_node__T_4027_data;
    assign _BBFMultiply_28_1__in1 = stage_outputs_1_7_real_node;
    assign _BBFMultiply_28_1__in2 = _T_4265_real_node__T_4284_data;
    assign _BBFMultiply_29_1__in1 = stage_outputs_1_7_imaginary_node;
    assign _BBFMultiply_29_1__in2 = _T_4265_imaginary_node__T_4284_data;
    assign _BBFMultiply_2_1__in1 = stage_outputs_0_4_real_node;
    assign _BBFMultiply_2_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_30_1__in1 = stage_outputs_1_7_real_node;
    assign _BBFMultiply_30_1__in2 = _T_4265_imaginary_node__T_4284_data;
    assign _BBFMultiply_31_1__in1 = stage_outputs_1_7_imaginary_node;
    assign _BBFMultiply_31_1__in2 = _T_4265_real_node__T_4284_data;
    assign _BBFMultiply_32_1__in1 = stage_outputs_2_1_real_node;
    assign _BBFMultiply_32_1__in2 = _T_4522_real_node__T_4544_data;
    assign _BBFMultiply_33_1__in1 = stage_outputs_2_1_imaginary_node;
    assign _BBFMultiply_33_1__in2 = _T_4522_imaginary_node__T_4544_data;
    assign _BBFMultiply_34_1__in1 = stage_outputs_2_1_real_node;
    assign _BBFMultiply_34_1__in2 = _T_4522_imaginary_node__T_4544_data;
    assign _BBFMultiply_35_1__in1 = stage_outputs_2_1_imaginary_node;
    assign _BBFMultiply_35_1__in2 = _T_4522_real_node__T_4544_data;
    assign _BBFMultiply_36_1__in1 = stage_outputs_2_3_real_node;
    assign _BBFMultiply_36_1__in2 = _T_4714_real_node__T_4736_data;
    assign _BBFMultiply_37_1__in1 = stage_outputs_2_3_imaginary_node;
    assign _BBFMultiply_37_1__in2 = _T_4714_imaginary_node__T_4736_data;
    assign _BBFMultiply_38_1__in1 = stage_outputs_2_3_real_node;
    assign _BBFMultiply_38_1__in2 = _T_4714_imaginary_node__T_4736_data;
    assign _BBFMultiply_39_1__in1 = stage_outputs_2_3_imaginary_node;
    assign _BBFMultiply_39_1__in2 = _T_4714_real_node__T_4736_data;
    assign _BBFMultiply_3_1__in1 = stage_outputs_0_4_imaginary_node;
    assign _BBFMultiply_3_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_40_1__in1 = stage_outputs_2_5_real_node;
    assign _BBFMultiply_40_1__in2 = _T_4906_real_node__T_4928_data;
    assign _BBFMultiply_41_1__in1 = stage_outputs_2_5_imaginary_node;
    assign _BBFMultiply_41_1__in2 = _T_4906_imaginary_node__T_4928_data;
    assign _BBFMultiply_42_1__in1 = stage_outputs_2_5_real_node;
    assign _BBFMultiply_42_1__in2 = _T_4906_imaginary_node__T_4928_data;
    assign _BBFMultiply_43_1__in1 = stage_outputs_2_5_imaginary_node;
    assign _BBFMultiply_43_1__in2 = _T_4906_real_node__T_4928_data;
    assign _BBFMultiply_44_1__in1 = stage_outputs_2_7_real_node;
    assign _BBFMultiply_44_1__in2 = _T_5098_real_node__T_5120_data;
    assign _BBFMultiply_45_1__in1 = stage_outputs_2_7_imaginary_node;
    assign _BBFMultiply_45_1__in2 = _T_5098_imaginary_node__T_5120_data;
    assign _BBFMultiply_46_1__in1 = stage_outputs_2_7_real_node;
    assign _BBFMultiply_46_1__in2 = _T_5098_imaginary_node__T_5120_data;
    assign _BBFMultiply_47_1__in1 = stage_outputs_2_7_imaginary_node;
    assign _BBFMultiply_47_1__in2 = _T_5098_real_node__T_5120_data;
    assign _BBFMultiply_48__in1 = stage_outputs_0_4_real_node;
    assign _BBFMultiply_48__in2 = twiddle_0_real_node;
    assign _BBFMultiply_4_1__in1 = stage_outputs_0_5_real_node;
    assign _BBFMultiply_4_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_5_1__in1 = stage_outputs_0_5_imaginary_node;
    assign _BBFMultiply_5_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_6_1__in1 = stage_outputs_0_5_real_node;
    assign _BBFMultiply_6_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_7_1__in1 = stage_outputs_0_5_imaginary_node;
    assign _BBFMultiply_7_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_8_1__in1 = stage_outputs_0_6_real_node;
    assign _BBFMultiply_8_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_9_1__in1 = stage_outputs_0_6_imaginary_node;
    assign _BBFMultiply_9_1__in2 = twiddle_0_imaginary_node;
    assign _BBFSubtract_10_1__in1 = _T_2826_node;
    assign _BBFSubtract_10_1__in2 = _T_2820_node;
    assign _BBFSubtract_11_1__in1 = _T_2903_node;
    assign _BBFSubtract_11_1__in2 = _T_2873_real_node;
    assign _BBFSubtract_12_1__in1 = _T_2916_node;
    assign _BBFSubtract_12_1__in2 = _T_2873_imaginary_node;
    assign _BBFSubtract_13_1__in1 = _T_3049_node;
    assign _BBFSubtract_13_1__in2 = _T_3043_node;
    assign _BBFSubtract_14_1__in1 = _T_3126_node;
    assign _BBFSubtract_14_1__in2 = _T_3096_real_node;
    assign _BBFSubtract_15_1__in1 = _T_3139_node;
    assign _BBFSubtract_15_1__in2 = _T_3096_imaginary_node;
    assign _BBFSubtract_16_1__in1 = _T_3272_node;
    assign _BBFSubtract_16_1__in2 = _T_3266_node;
    assign _BBFSubtract_17_1__in1 = _T_3349_node;
    assign _BBFSubtract_17_1__in2 = _T_3319_real_node;
    assign _BBFSubtract_18_1__in1 = _T_3362_node;
    assign _BBFSubtract_18_1__in2 = _T_3319_imaginary_node;
    assign _BBFSubtract_19_1__in1 = _T_3529_node;
    assign _BBFSubtract_19_1__in2 = _T_3523_node;
    assign _BBFSubtract_1_1__in1 = _T_1377_node;
    assign _BBFSubtract_1_1__in2 = _node_180;
    assign _BBFSubtract_20_1__in1 = _T_3606_node;
    assign _BBFSubtract_20_1__in2 = _T_3576_real_node;
    assign _BBFSubtract_21_1__in1 = _T_3619_node;
    assign _BBFSubtract_21_1__in2 = _T_3576_imaginary_node;
    assign _BBFSubtract_22_1__in1 = _T_3786_node;
    assign _BBFSubtract_22_1__in2 = _T_3780_node;
    assign _BBFSubtract_23_1__in1 = _T_3863_node;
    assign _BBFSubtract_23_1__in2 = _T_3833_real_node;
    assign _BBFSubtract_24_1__in1 = _T_3876_node;
    assign _BBFSubtract_24_1__in2 = _T_3833_imaginary_node;
    assign _BBFSubtract_25_1__in1 = _T_4043_node;
    assign _BBFSubtract_25_1__in2 = _T_4037_node;
    assign _BBFSubtract_26_1__in1 = _T_4120_node;
    assign _BBFSubtract_26_1__in2 = _T_4090_real_node;
    assign _BBFSubtract_27_1__in1 = _T_4133_node;
    assign _BBFSubtract_27_1__in2 = _T_4090_imaginary_node;
    assign _BBFSubtract_28_1__in1 = _T_4300_node;
    assign _BBFSubtract_28_1__in2 = _T_4294_node;
    assign _BBFSubtract_29_1__in1 = _T_4377_node;
    assign _BBFSubtract_29_1__in2 = _T_4347_real_node;
    assign _BBFSubtract_2_1__in1 = _T_1438_node;
    assign _BBFSubtract_2_1__in2 = _node_296;
    assign _BBFSubtract_30_1__in1 = _T_4390_node;
    assign _BBFSubtract_30_1__in2 = _T_4347_imaginary_node;
    assign _BBFSubtract_31_1__in1 = _T_4560_node;
    assign _BBFSubtract_31_1__in2 = _T_4554_node;
    assign _BBFSubtract_32_1__in1 = _T_4637_node;
    assign _BBFSubtract_32_1__in2 = _T_4607_real_node;
    assign _BBFSubtract_33_1__in1 = _T_4650_node;
    assign _BBFSubtract_33_1__in2 = _T_4607_imaginary_node;
    assign _BBFSubtract_34_1__in1 = _T_4752_node;
    assign _BBFSubtract_34_1__in2 = _T_4746_node;
    assign _BBFSubtract_35_1__in1 = _T_4829_node;
    assign _BBFSubtract_35_1__in2 = _T_4799_real_node;
    assign _BBFSubtract_36_1__in1 = _T_4842_node;
    assign _BBFSubtract_36_1__in2 = _T_4799_imaginary_node;
    assign _BBFSubtract_37_1__in1 = _T_4944_node;
    assign _BBFSubtract_37_1__in2 = _T_4938_node;
    assign _BBFSubtract_38_1__in1 = _T_5021_node;
    assign _BBFSubtract_38_1__in2 = _T_4991_real_node;
    assign _BBFSubtract_39_1__in1 = _T_5034_node;
    assign _BBFSubtract_39_1__in2 = _T_4991_imaginary_node;
    assign _BBFSubtract_3_1__in1 = _T_1499_node;
    assign _BBFSubtract_3_1__in2 = _node_412;
    assign _BBFSubtract_40_1__in1 = _T_5136_node;
    assign _BBFSubtract_40_1__in2 = _T_5130_node;
    assign _BBFSubtract_41_1__in1 = _T_5213_node;
    assign _BBFSubtract_41_1__in2 = _T_5183_real_node;
    assign _BBFSubtract_42_1__in1 = _T_5226_node;
    assign _BBFSubtract_42_1__in2 = _T_5183_imaginary_node;
    assign _BBFSubtract_43__in1 = _T_1316_node;
    assign _BBFSubtract_43__in2 = _node_64;
    assign _BBFSubtract_4_1__in1 = _T_1560_node;
    assign _BBFSubtract_4_1__in2 = _node_528;
    assign _BBFSubtract_5_1__in1 = _T_1621_node;
    assign _BBFSubtract_5_1__in2 = _node_644;
    assign _BBFSubtract_6_1__in1 = _T_1682_node;
    assign _BBFSubtract_6_1__in2 = _node_760;
    assign _BBFSubtract_7_1__in1 = _T_2603_node;
    assign _BBFSubtract_7_1__in2 = _T_2597_node;
    assign _BBFSubtract_8_1__in1 = _T_2680_node;
    assign _BBFSubtract_8_1__in2 = _T_2650_real_node;
    assign _BBFSubtract_9_1__in1 = _T_2693_node;
    assign _BBFSubtract_9_1__in2 = _T_2650_imaginary_node;
    assign _T_1005_node = 64'h0;
    assign _T_1012_node = 64'h0;
    assign _T_1033_node = 64'h0;
    assign _T_1040_node = 64'h0;
    assign _T_1061_node = 64'h0;
    assign _T_1068_node = 64'h0;
    assign _T_12_node = 64'h0;
    assign _T_1316_node = 64'h0;
    assign _T_1323_node = _BBFSubtract_43__out;
    assign _T_1339_imaginary_node = _T_1323_node;
    assign _T_1339_real_node = _node_72;
    assign _T_1377_node = 64'h0;
    assign _T_1384_node = _BBFSubtract_1_1__out;
    assign _T_1400_imaginary_node = _T_1384_node;
    assign _T_1400_real_node = _node_188;
    assign _T_1438_node = 64'h0;
    assign _T_1445_node = _BBFSubtract_2_1__out;
    assign _T_1461_imaginary_node = _T_1445_node;
    assign _T_1461_real_node = _node_304;
    assign _T_1499_node = 64'h0;
    assign _T_1506_node = _BBFSubtract_3_1__out;
    assign _T_1522_imaginary_node = _T_1506_node;
    assign _T_1522_real_node = _node_420;
    assign _T_1560_node = 64'h0;
    assign _T_1567_node = _BBFSubtract_4_1__out;
    assign _T_1583_imaginary_node = _T_1567_node;
    assign _T_1583_real_node = _node_536;
    assign _T_1621_node = 64'h0;
    assign _T_1628_node = _BBFSubtract_5_1__out;
    assign _T_1644_imaginary_node = _T_1628_node;
    assign _T_1644_real_node = _node_652;
    assign _T_1682_node = 64'h0;
    assign _T_1689_node = _BBFSubtract_6_1__out;
    assign _T_1705_imaginary_node = _T_1689_node;
    assign _T_1705_real_node = _node_768;
    assign _T_1727_node = 64'h0;
    assign _T_1734_node = 64'h0;
    assign _T_1754_node = 64'h0;
    assign _T_1761_node = 64'h0;
    assign _T_1781_node = 64'h0;
    assign _T_1788_node = 64'h0;
    assign _T_1808_node = 64'h0;
    assign _T_1815_node = 64'h0;
    assign _T_1835_node = 64'h0;
    assign _T_1842_node = 64'h0;
    assign _T_1862_node = 64'h0;
    assign _T_1869_node = 64'h0;
    assign _T_1889_node = 64'h0;
    assign _T_1896_node = 64'h0;
    assign _T_1916_node = 64'h0;
    assign _T_1923_node = 64'h0;
    assign _T_1943_node = 64'h0;
    assign _T_1950_node = 64'h0;
    assign _T_1970_node = 64'h0;
    assign _T_1977_node = 64'h0;
    assign _T_1997_node = 64'h0;
    assign _T_2004_node = 64'h0;
    assign _T_2024_node = 64'h0;
    assign _T_2031_node = 64'h0;
    assign _T_2051_node = 64'h0;
    assign _T_2058_node = 64'h0;
    assign _T_2078_node = 64'h0;
    assign _T_2085_node = 64'h0;
    assign _T_2105_node = 64'h0;
    assign _T_2112_node = 64'h0;
    assign _T_2132_node = 64'h0;
    assign _T_2139_node = 64'h0;
    assign _T_2159_node = 64'h0;
    assign _T_2166_node = 64'h0;
    assign _T_2186_node = 64'h0;
    assign _T_2193_node = 64'h0;
    assign _T_2213_node = 64'h0;
    assign _T_2220_node = 64'h0;
    assign _T_2240_node = 64'h0;
    assign _T_2247_node = 64'h0;
    assign _T_2267_node = 64'h0;
    assign _T_2274_node = 64'h0;
    assign _T_2294_node = 64'h0;
    assign _T_2301_node = 64'h0;
    assign _T_2321_node = 64'h0;
    assign _T_2328_node = 64'h0;
    assign _T_2348_node = 64'h0;
    assign _T_2355_node = 64'h0;
    assign _T_2375_node = 64'h0;
    assign _T_2382_node = 64'h0;
    assign _T_2402_node = 64'h0;
    assign _T_2409_node = 64'h0;
    assign _T_2429_node = 64'h0;
    assign _T_2436_node = 64'h0;
    assign _T_2456_node = 64'h0;
    assign _T_2463_node = 64'h0;
    assign _T_2483_node = 64'h0;
    assign _T_2490_node = 64'h0;
    assign _T_2510_node = 64'h0;
    assign _T_2517_node = 64'h0;
    assign _T_2537_node = 64'h0;
    assign _T_2544_node = 64'h0;
    assign _T_2564_node = 64'h0;
    assign _T_2571_node = 64'h0;
    assign _T_2591_node = _BBFMultiply_48__out;
    assign _T_2597_node = _BBFMultiply_1_1__out;
    assign _T_2603_node = 64'h0;
    assign _T_2610_node = _BBFSubtract_7_1__out;
    assign _T_2616_node = _BBFAdd_72__out;
    assign _T_2622_node = _BBFMultiply_2_1__out;
    assign _T_2628_node = _BBFMultiply_3_1__out;
    assign _T_2634_node = _BBFAdd_1_1__out;
    assign _T_2650_imaginary_node = _T_2634_node;
    assign _T_2650_real_node = _T_2616_node;
    assign _T_2654_node = _BBFAdd_2_1__out;
    assign _T_2660_node = _BBFAdd_3_1__out;
    assign _T_2676_imaginary_node = _T_2660_node;
    assign _T_2676_real_node = _T_2654_node;
    assign _T_2680_node = 64'h0;
    assign _T_2687_node = _BBFSubtract_8_1__out;
    assign _T_2693_node = 64'h0;
    assign _T_2700_node = _BBFSubtract_9_1__out;
    assign _T_2716_imaginary_node = _T_2700_node;
    assign _T_2716_real_node = _T_2687_node;
    assign _T_2720_node = _BBFAdd_4_1__out;
    assign _T_2726_node = _BBFAdd_5_1__out;
    assign _T_2742_imaginary_node = _T_2726_node;
    assign _T_2742_real_node = _T_2720_node;
    assign _T_2757_imaginary_node__T_2768_data = _T_2676_imaginary_node;
    assign _T_2757_real_node__T_2768_data = _T_2676_real_node;
    assign _T_2791_imaginary_node__T_2802_data = _T_2742_imaginary_node;
    assign _T_2791_real_node__T_2802_data = _T_2742_real_node;
    assign _T_2814_node = _BBFMultiply_4_1__out;
    assign _T_2820_node = _BBFMultiply_5_1__out;
    assign _T_2826_node = 64'h0;
    assign _T_2833_node = _BBFSubtract_10_1__out;
    assign _T_2839_node = _BBFAdd_6_1__out;
    assign _T_2845_node = _BBFMultiply_6_1__out;
    assign _T_2851_node = _BBFMultiply_7_1__out;
    assign _T_2857_node = _BBFAdd_7_1__out;
    assign _T_2873_imaginary_node = _T_2857_node;
    assign _T_2873_real_node = _T_2839_node;
    assign _T_2877_node = _BBFAdd_8_1__out;
    assign _T_2883_node = _BBFAdd_9_1__out;
    assign _T_2899_imaginary_node = _T_2883_node;
    assign _T_2899_real_node = _T_2877_node;
    assign _T_2903_node = 64'h0;
    assign _T_2910_node = _BBFSubtract_11_1__out;
    assign _T_2916_node = 64'h0;
    assign _T_2923_node = _BBFSubtract_12_1__out;
    assign _T_2939_imaginary_node = _T_2923_node;
    assign _T_2939_real_node = _T_2910_node;
    assign _T_2943_node = _BBFAdd_10_1__out;
    assign _T_2949_node = _BBFAdd_11_1__out;
    assign _T_2965_imaginary_node = _T_2949_node;
    assign _T_2965_real_node = _T_2943_node;
    assign _T_2980_imaginary_node__T_2991_data = _T_2899_imaginary_node;
    assign _T_2980_real_node__T_2991_data = _T_2899_real_node;
    assign _T_3014_imaginary_node__T_3025_data = _T_2965_imaginary_node;
    assign _T_3014_real_node__T_3025_data = _T_2965_real_node;
    assign _T_3037_node = _BBFMultiply_8_1__out;
    assign _T_3043_node = _BBFMultiply_9_1__out;
    assign _T_3049_node = 64'h0;
    assign _T_3056_node = _BBFSubtract_13_1__out;
    assign _T_3062_node = _BBFAdd_12_1__out;
    assign _T_3068_node = _BBFMultiply_10_1__out;
    assign _T_3074_node = _BBFMultiply_11_1__out;
    assign _T_3080_node = _BBFAdd_13_1__out;
    assign _T_3096_imaginary_node = _T_3080_node;
    assign _T_3096_real_node = _T_3062_node;
    assign _T_3100_node = _BBFAdd_14_1__out;
    assign _T_3106_node = _BBFAdd_15_1__out;
    assign _T_3122_imaginary_node = _T_3106_node;
    assign _T_3122_real_node = _T_3100_node;
    assign _T_3126_node = 64'h0;
    assign _T_3133_node = _BBFSubtract_14_1__out;
    assign _T_3139_node = 64'h0;
    assign _T_3146_node = _BBFSubtract_15_1__out;
    assign _T_316_node = 64'h0;
    assign _T_3162_imaginary_node = _T_3146_node;
    assign _T_3162_real_node = _T_3133_node;
    assign _T_3166_node = _BBFAdd_16_1__out;
    assign _T_3172_node = _BBFAdd_17_1__out;
    assign _T_3188_imaginary_node = _T_3172_node;
    assign _T_3188_real_node = _T_3166_node;
    assign _T_3203_imaginary_node__T_3214_data = _T_3122_imaginary_node;
    assign _T_3203_real_node__T_3214_data = _T_3122_real_node;
    assign _T_323_node = 64'h0;
    assign _T_3237_imaginary_node__T_3248_data = _T_3188_imaginary_node;
    assign _T_3237_real_node__T_3248_data = _T_3188_real_node;
    assign _T_3260_node = _BBFMultiply_12_1__out;
    assign _T_3266_node = _BBFMultiply_13_1__out;
    assign _T_3272_node = 64'h0;
    assign _T_3279_node = _BBFSubtract_16_1__out;
    assign _T_3285_node = _BBFAdd_18_1__out;
    assign _T_3291_node = _BBFMultiply_14_1__out;
    assign _T_3297_node = _BBFMultiply_15_1__out;
    assign _T_3303_node = _BBFAdd_19_1__out;
    assign _T_3319_imaginary_node = _T_3303_node;
    assign _T_3319_real_node = _T_3285_node;
    assign _T_3323_node = _BBFAdd_20_1__out;
    assign _T_3329_node = _BBFAdd_21_1__out;
    assign _T_3345_imaginary_node = _T_3329_node;
    assign _T_3345_real_node = _T_3323_node;
    assign _T_3349_node = 64'h0;
    assign _T_3356_node = _BBFSubtract_17_1__out;
    assign _T_3362_node = 64'h0;
    assign _T_3369_node = _BBFSubtract_18_1__out;
    assign _T_3385_imaginary_node = _T_3369_node;
    assign _T_3385_real_node = _T_3356_node;
    assign _T_3389_node = _BBFAdd_22_1__out;
    assign _T_3395_node = _BBFAdd_23_1__out;
    assign _T_3411_imaginary_node = _T_3395_node;
    assign _T_3411_real_node = _T_3389_node;
    assign _T_3426_imaginary_node__T_3437_data = _T_3345_imaginary_node;
    assign _T_3426_real_node__T_3437_data = _T_3345_real_node;
    assign _T_3460_imaginary_node__T_3471_data = _T_3411_imaginary_node;
    assign _T_3460_real_node__T_3471_data = _T_3411_real_node;
    assign _T_3494_imaginary_node__T_3505_data = twiddle_1_imaginary_node;
    assign _T_3494_real_node__T_3505_data = twiddle_1_real_node;
    assign _T_3517_node = _BBFMultiply_16_1__out;
    assign _T_3523_node = _BBFMultiply_17_1__out;
    assign _T_3529_node = 64'h0;
    assign _T_3536_node = _BBFSubtract_19_1__out;
    assign _T_3542_node = _BBFAdd_24_1__out;
    assign _T_3548_node = _BBFMultiply_18_1__out;
    assign _T_3554_node = _BBFMultiply_19_1__out;
    assign _T_3560_node = _BBFAdd_25_1__out;
    assign _T_3576_imaginary_node = _T_3560_node;
    assign _T_3576_real_node = _T_3542_node;
    assign _T_3580_node = _BBFAdd_26_1__out;
    assign _T_3586_node = _BBFAdd_27_1__out;
    assign _T_3602_imaginary_node = _T_3586_node;
    assign _T_3602_real_node = _T_3580_node;
    assign _T_3606_node = 64'h0;
    assign _T_3613_node = _BBFSubtract_20_1__out;
    assign _T_3619_node = 64'h0;
    assign _T_3626_node = _BBFSubtract_21_1__out;
    assign _T_3642_imaginary_node = _T_3626_node;
    assign _T_3642_real_node = _T_3613_node;
    assign _T_3646_node = _BBFAdd_28_1__out;
    assign _T_3652_node = _BBFAdd_29_1__out;
    assign _T_3668_imaginary_node = _T_3652_node;
    assign _T_3668_real_node = _T_3646_node;
    assign _T_3683_imaginary_node__T_3694_data = _T_3602_imaginary_node;
    assign _T_3683_real_node__T_3694_data = _T_3602_real_node;
    assign _T_3717_imaginary_node__T_3728_data = _T_3668_imaginary_node;
    assign _T_3717_real_node__T_3728_data = _T_3668_real_node;
    assign _T_3751_imaginary_node__T_3762_data = twiddle_1_imaginary_node;
    assign _T_3751_real_node__T_3762_data = twiddle_1_real_node;
    assign _T_3774_node = _BBFMultiply_20_1__out;
    assign _T_3780_node = _BBFMultiply_21_1__out;
    assign _T_3786_node = 64'h0;
    assign _T_3793_node = _BBFSubtract_22_1__out;
    assign _T_3799_node = _BBFAdd_30_1__out;
    assign _T_3805_node = _BBFMultiply_22_1__out;
    assign _T_3811_node = _BBFMultiply_23_1__out;
    assign _T_3817_node = _BBFAdd_31_1__out;
    assign _T_3833_imaginary_node = _T_3817_node;
    assign _T_3833_real_node = _T_3799_node;
    assign _T_3837_node = _BBFAdd_32_1__out;
    assign _T_3843_node = _BBFAdd_33_1__out;
    assign _T_3859_imaginary_node = _T_3843_node;
    assign _T_3859_real_node = _T_3837_node;
    assign _T_3863_node = 64'h0;
    assign _T_3870_node = _BBFSubtract_23_1__out;
    assign _T_3876_node = 64'h0;
    assign _T_3883_node = _BBFSubtract_24_1__out;
    assign _T_3899_imaginary_node = _T_3883_node;
    assign _T_3899_real_node = _T_3870_node;
    assign _T_3903_node = _BBFAdd_34_1__out;
    assign _T_3909_node = _BBFAdd_35_1__out;
    assign _T_3925_imaginary_node = _T_3909_node;
    assign _T_3925_real_node = _T_3903_node;
    assign _T_3940_imaginary_node__T_3951_data = _T_3859_imaginary_node;
    assign _T_3940_real_node__T_3951_data = _T_3859_real_node;
    assign _T_3974_imaginary_node__T_3985_data = _T_3925_imaginary_node;
    assign _T_3974_real_node__T_3985_data = _T_3925_real_node;
    assign _T_4008_imaginary_node__T_4019_data = twiddle_4_imaginary_node;
    assign _T_4008_real_node__T_4019_data = twiddle_4_real_node;
    assign _T_4031_node = _BBFMultiply_24_1__out;
    assign _T_4037_node = _BBFMultiply_25_1__out;
    assign _T_4043_node = 64'h0;
    assign _T_4050_node = _BBFSubtract_25_1__out;
    assign _T_4056_node = _BBFAdd_36_1__out;
    assign _T_4062_node = _BBFMultiply_26_1__out;
    assign _T_4068_node = _BBFMultiply_27_1__out;
    assign _T_4074_node = _BBFAdd_37_1__out;
    assign _T_4090_imaginary_node = _T_4074_node;
    assign _T_4090_real_node = _T_4056_node;
    assign _T_4094_node = _BBFAdd_38_1__out;
    assign _T_4100_node = _BBFAdd_39_1__out;
    assign _T_4116_imaginary_node = _T_4100_node;
    assign _T_4116_real_node = _T_4094_node;
    assign _T_4120_node = 64'h0;
    assign _T_4127_node = _BBFSubtract_26_1__out;
    assign _T_4133_node = 64'h0;
    assign _T_4140_node = _BBFSubtract_27_1__out;
    assign _T_4156_imaginary_node = _T_4140_node;
    assign _T_4156_real_node = _T_4127_node;
    assign _T_4160_node = _BBFAdd_40_1__out;
    assign _T_4166_node = _BBFAdd_41_1__out;
    assign _T_4182_imaginary_node = _T_4166_node;
    assign _T_4182_real_node = _T_4160_node;
    assign _T_4197_imaginary_node__T_4208_data = _T_4116_imaginary_node;
    assign _T_4197_real_node__T_4208_data = _T_4116_real_node;
    assign _T_4231_imaginary_node__T_4242_data = _T_4182_imaginary_node;
    assign _T_4231_real_node__T_4242_data = _T_4182_real_node;
    assign _T_4265_imaginary_node__T_4276_data = twiddle_4_imaginary_node;
    assign _T_4265_real_node__T_4276_data = twiddle_4_real_node;
    assign _T_4288_node = _BBFMultiply_28_1__out;
    assign _T_4294_node = _BBFMultiply_29_1__out;
    assign _T_4300_node = 64'h0;
    assign _T_4307_node = _BBFSubtract_28_1__out;
    assign _T_4313_node = _BBFAdd_42_1__out;
    assign _T_4319_node = _BBFMultiply_30_1__out;
    assign _T_4325_node = _BBFMultiply_31_1__out;
    assign _T_4331_node = _BBFAdd_43_1__out;
    assign _T_4347_imaginary_node = _T_4331_node;
    assign _T_4347_real_node = _T_4313_node;
    assign _T_4351_node = _BBFAdd_44_1__out;
    assign _T_4357_node = _BBFAdd_45_1__out;
    assign _T_4373_imaginary_node = _T_4357_node;
    assign _T_4373_real_node = _T_4351_node;
    assign _T_4377_node = 64'h0;
    assign _T_4384_node = _BBFSubtract_29_1__out;
    assign _T_4390_node = 64'h0;
    assign _T_4397_node = _BBFSubtract_30_1__out;
    assign _T_4413_imaginary_node = _T_4397_node;
    assign _T_4413_real_node = _T_4384_node;
    assign _T_4417_node = _BBFAdd_46_1__out;
    assign _T_4423_node = _BBFAdd_47_1__out;
    assign _T_4439_imaginary_node = _T_4423_node;
    assign _T_4439_real_node = _T_4417_node;
    assign _T_4454_imaginary_node__T_4465_data = _T_4373_imaginary_node;
    assign _T_4454_real_node__T_4465_data = _T_4373_real_node;
    assign _T_4488_imaginary_node__T_4499_data = _T_4439_imaginary_node;
    assign _T_4488_real_node__T_4499_data = _T_4439_real_node;
    assign _T_4522_imaginary_node__T_4537_data = twiddle_2_imaginary_node;
    assign _T_4522_real_node__T_4537_data = twiddle_2_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_915 (
        .y(_WTEMP_23),
        .sel(io_in_valid),
        .a(_T_4529),
        .b(__T_4524__q)
    );
    assign _T_4548_node = _BBFMultiply_32_1__out;
    assign _T_4554_node = _BBFMultiply_33_1__out;
    assign _T_4560_node = 64'h0;
    assign _T_4567_node = _BBFSubtract_31_1__out;
    assign _T_4573_node = _BBFAdd_48_1__out;
    assign _T_4579_node = _BBFMultiply_34_1__out;
    assign _T_4585_node = _BBFMultiply_35_1__out;
    assign _T_4591_node = _BBFAdd_49_1__out;
    assign _T_4607_imaginary_node = _T_4591_node;
    assign _T_4607_real_node = _T_4573_node;
    assign _T_4611_node = _BBFAdd_50_1__out;
    assign _T_4617_node = _BBFAdd_51_1__out;
    assign _T_4633_imaginary_node = _T_4617_node;
    assign _T_4633_real_node = _T_4611_node;
    assign _T_4637_node = 64'h0;
    assign _T_4644_node = _BBFSubtract_32_1__out;
    assign _T_4650_node = 64'h0;
    assign _T_4657_node = _BBFSubtract_33_1__out;
    assign _T_4673_imaginary_node = _T_4657_node;
    assign _T_4673_real_node = _T_4644_node;
    assign _T_4677_node = _BBFAdd_52_1__out;
    assign _T_4683_node = _BBFAdd_53_1__out;
    assign _T_4699_imaginary_node = _T_4683_node;
    assign _T_4699_real_node = _T_4677_node;
    assign _T_4714_imaginary_node__T_4729_data = twiddle_3_imaginary_node;
    assign _T_4714_real_node__T_4729_data = twiddle_3_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_916 (
        .y(_WTEMP_24),
        .sel(io_in_valid),
        .a(_T_4721),
        .b(__T_4716__q)
    );
    assign _T_4740_node = _BBFMultiply_36_1__out;
    assign _T_4746_node = _BBFMultiply_37_1__out;
    assign _T_4752_node = 64'h0;
    assign _T_4759_node = _BBFSubtract_34_1__out;
    assign _T_4765_node = _BBFAdd_54_1__out;
    assign _T_4771_node = _BBFMultiply_38_1__out;
    assign _T_4777_node = _BBFMultiply_39_1__out;
    assign _T_4783_node = _BBFAdd_55_1__out;
    assign _T_4799_imaginary_node = _T_4783_node;
    assign _T_4799_real_node = _T_4765_node;
    assign _T_4803_node = _BBFAdd_56_1__out;
    assign _T_4809_node = _BBFAdd_57_1__out;
    assign _T_4825_imaginary_node = _T_4809_node;
    assign _T_4825_real_node = _T_4803_node;
    assign _T_4829_node = 64'h0;
    assign _T_4836_node = _BBFSubtract_35_1__out;
    assign _T_4842_node = 64'h0;
    assign _T_4849_node = _BBFSubtract_36_1__out;
    assign _T_4865_imaginary_node = _T_4849_node;
    assign _T_4865_real_node = _T_4836_node;
    assign _T_4869_node = _BBFAdd_58_1__out;
    assign _T_4875_node = _BBFAdd_59_1__out;
    assign _T_4891_imaginary_node = _T_4875_node;
    assign _T_4891_real_node = _T_4869_node;
    assign _T_4906_imaginary_node__T_4921_data = twiddle_5_imaginary_node;
    assign _T_4906_real_node__T_4921_data = twiddle_5_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_917 (
        .y(_WTEMP_25),
        .sel(io_in_valid),
        .a(_T_4913),
        .b(__T_4908__q)
    );
    assign _T_4932_node = _BBFMultiply_40_1__out;
    assign _T_4938_node = _BBFMultiply_41_1__out;
    assign _T_4944_node = 64'h0;
    assign _T_4951_node = _BBFSubtract_37_1__out;
    assign _T_4957_node = _BBFAdd_60_1__out;
    assign _T_4963_node = _BBFMultiply_42_1__out;
    assign _T_4969_node = _BBFMultiply_43_1__out;
    assign _T_4975_node = _BBFAdd_61_1__out;
    assign _T_4991_imaginary_node = _T_4975_node;
    assign _T_4991_real_node = _T_4957_node;
    assign _T_4995_node = _BBFAdd_62_1__out;
    assign _T_5_node = 64'h0;
    assign _T_5001_node = _BBFAdd_63_1__out;
    assign _T_5017_imaginary_node = _T_5001_node;
    assign _T_5017_real_node = _T_4995_node;
    assign _T_5021_node = 64'h0;
    assign _T_5028_node = _BBFSubtract_38_1__out;
    assign _T_5034_node = 64'h0;
    assign _T_5041_node = _BBFSubtract_39_1__out;
    assign _T_5057_imaginary_node = _T_5041_node;
    assign _T_5057_real_node = _T_5028_node;
    assign _T_5061_node = _BBFAdd_64_1__out;
    assign _T_5067_node = _BBFAdd_65_1__out;
    assign _T_5083_imaginary_node = _T_5067_node;
    assign _T_5083_real_node = _T_5061_node;
    assign _T_5098_imaginary_node__T_5113_data = twiddle_6_imaginary_node;
    assign _T_5098_real_node__T_5113_data = twiddle_6_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_918 (
        .y(_WTEMP_26),
        .sel(io_in_valid),
        .a(_T_5105),
        .b(__T_5100__q)
    );
    assign _T_5124_node = _BBFMultiply_44_1__out;
    assign _T_5130_node = _BBFMultiply_45_1__out;
    assign _T_5136_node = 64'h0;
    assign _T_5143_node = _BBFSubtract_40_1__out;
    assign _T_5149_node = _BBFAdd_66_1__out;
    assign _T_5155_node = _BBFMultiply_46_1__out;
    assign _T_5161_node = _BBFMultiply_47_1__out;
    assign _T_5167_node = _BBFAdd_67_1__out;
    assign _T_5183_imaginary_node = _T_5167_node;
    assign _T_5183_real_node = _T_5149_node;
    assign _T_5187_node = _BBFAdd_68_1__out;
    assign _T_5193_node = _BBFAdd_69_1__out;
    assign _T_5209_imaginary_node = _T_5193_node;
    assign _T_5209_real_node = _T_5187_node;
    assign _T_5213_node = 64'h0;
    assign _T_5220_node = _BBFSubtract_41_1__out;
    assign _T_5226_node = 64'h0;
    assign _T_5233_node = _BBFSubtract_42_1__out;
    assign _T_5249_imaginary_node = _T_5233_node;
    assign _T_5249_real_node = _T_5220_node;
    assign _T_5253_node = _BBFAdd_70_1__out;
    assign _T_5259_node = _BBFAdd_71_1__out;
    assign _T_5275_imaginary_node = _T_5259_node;
    assign _T_5275_real_node = _T_5253_node;
    assign _T_635__T_644_data = io_in_sync;
    MUX_UNSIGNED #(.width(1)) u_mux_919 (
        .y(_WTEMP_1),
        .sel(io_in_valid),
        .a(_T_642),
        .b(__T_637__q)
    );
    assign _T_649_node = 64'h0;
    assign _T_656_node = 64'h0;
    assign _T_733_node = 64'h3FF0000000000000;
    assign _T_740_node = 64'h8000000000000000;
    assign _T_757_imaginary_node = _T_740_node;
    assign _T_757_real_node = _T_733_node;
    assign _T_761_node = 64'h3FED906BCF328D46;
    assign _T_768_node = 64'hBFD87DE2A6AEA963;
    assign _T_785_imaginary_node = _T_768_node;
    assign _T_785_real_node = _T_761_node;
    assign _T_789_node = 64'h3FE6A09E667F3BCD;
    assign _T_796_node = 64'hBFE6A09E667F3BCC;
    assign _T_813_imaginary_node = _T_796_node;
    assign _T_813_real_node = _T_789_node;
    assign _T_817_node = 64'h3FD87DE2A6AEA964;
    assign _T_824_node = 64'hBFED906BCF328D46;
    assign _T_841_imaginary_node = _T_824_node;
    assign _T_841_real_node = _T_817_node;
    assign _T_893_node = 64'h0;
    assign _T_900_node = 64'h0;
    assign _T_921_node = 64'h0;
    assign _T_928_node = 64'h0;
    assign _T_949_node = 64'h0;
    assign _T_956_node = 64'h0;
    assign _T_977_node = 64'h0;
    assign _T_984_node = 64'h0;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_920 (
        .y(indices_rom_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_921 (
        .y(indices_rom_1),
        .in(1'h0)
    );
    assign indices_rom_10 = 3'h5;
    assign indices_rom_11 = 3'h6;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_922 (
        .y(indices_rom_12),
        .in(2'h3)
    );
    assign indices_rom_13 = 3'h7;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_923 (
        .y(indices_rom_2),
        .in(1'h0)
    );
    assign indices_rom_3 = 3'h4;
    assign indices_rom_4 = 3'h4;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_924 (
        .y(indices_rom_5),
        .in(2'h2)
    );
    assign indices_rom_6 = 3'h6;
    assign indices_rom_7 = 3'h4;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_925 (
        .y(indices_rom_8),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_926 (
        .y(indices_rom_9),
        .in(1'h1)
    );
    assign io_out_bits_0_imaginary_node = stage_outputs_3_0_imaginary_node;
    assign io_out_bits_0_real_node = stage_outputs_3_0_real_node;
    assign io_out_bits_1_imaginary_node = stage_outputs_3_1_imaginary_node;
    assign io_out_bits_1_real_node = stage_outputs_3_1_real_node;
    assign io_out_bits_2_imaginary_node = stage_outputs_3_2_imaginary_node;
    assign io_out_bits_2_real_node = stage_outputs_3_2_real_node;
    assign io_out_bits_3_imaginary_node = stage_outputs_3_3_imaginary_node;
    assign io_out_bits_3_real_node = stage_outputs_3_3_real_node;
    assign io_out_bits_4_imaginary_node = stage_outputs_3_4_imaginary_node;
    assign io_out_bits_4_real_node = stage_outputs_3_4_real_node;
    assign io_out_bits_5_imaginary_node = stage_outputs_3_5_imaginary_node;
    assign io_out_bits_5_real_node = stage_outputs_3_5_real_node;
    assign io_out_bits_6_imaginary_node = stage_outputs_3_6_imaginary_node;
    assign io_out_bits_6_real_node = stage_outputs_3_6_real_node;
    assign io_out_bits_7_imaginary_node = stage_outputs_3_7_imaginary_node;
    assign io_out_bits_7_real_node = stage_outputs_3_7_real_node;
    assign io_out_sync = _T_635__T_645_data;
    assign io_out_valid = io_in_valid;
    assign stage_outputs_0_0_imaginary_node = io_in_bits_0_imaginary_node;
    assign stage_outputs_0_0_real_node = io_in_bits_0_real_node;
    assign stage_outputs_0_1_imaginary_node = io_in_bits_1_imaginary_node;
    assign stage_outputs_0_1_real_node = io_in_bits_1_real_node;
    assign stage_outputs_0_2_imaginary_node = io_in_bits_2_imaginary_node;
    assign stage_outputs_0_2_real_node = io_in_bits_2_real_node;
    assign stage_outputs_0_3_imaginary_node = io_in_bits_3_imaginary_node;
    assign stage_outputs_0_3_real_node = io_in_bits_3_real_node;
    assign stage_outputs_0_4_imaginary_node = io_in_bits_4_imaginary_node;
    assign stage_outputs_0_4_real_node = io_in_bits_4_real_node;
    assign stage_outputs_0_5_imaginary_node = io_in_bits_5_imaginary_node;
    assign stage_outputs_0_5_real_node = io_in_bits_5_real_node;
    assign stage_outputs_0_6_imaginary_node = io_in_bits_6_imaginary_node;
    assign stage_outputs_0_6_real_node = io_in_bits_6_real_node;
    assign stage_outputs_0_7_imaginary_node = io_in_bits_7_imaginary_node;
    assign stage_outputs_0_7_real_node = io_in_bits_7_real_node;
    assign stage_outputs_1_0_imaginary_node = _T_2757_imaginary_node__T_2776_data;
    assign stage_outputs_1_0_real_node = _T_2757_real_node__T_2776_data;
    assign stage_outputs_1_1_imaginary_node = _T_2980_imaginary_node__T_2999_data;
    assign stage_outputs_1_1_real_node = _T_2980_real_node__T_2999_data;
    assign stage_outputs_1_2_imaginary_node = _T_3203_imaginary_node__T_3222_data;
    assign stage_outputs_1_2_real_node = _T_3203_real_node__T_3222_data;
    assign stage_outputs_1_3_imaginary_node = _T_3426_imaginary_node__T_3445_data;
    assign stage_outputs_1_3_real_node = _T_3426_real_node__T_3445_data;
    assign stage_outputs_1_4_imaginary_node = _T_2791_imaginary_node__T_2810_data;
    assign stage_outputs_1_4_real_node = _T_2791_real_node__T_2810_data;
    assign stage_outputs_1_5_imaginary_node = _T_3014_imaginary_node__T_3033_data;
    assign stage_outputs_1_5_real_node = _T_3014_real_node__T_3033_data;
    assign stage_outputs_1_6_imaginary_node = _T_3237_imaginary_node__T_3256_data;
    assign stage_outputs_1_6_real_node = _T_3237_real_node__T_3256_data;
    assign stage_outputs_1_7_imaginary_node = _T_3460_imaginary_node__T_3479_data;
    assign stage_outputs_1_7_real_node = _T_3460_real_node__T_3479_data;
    assign stage_outputs_2_0_imaginary_node = _T_3683_imaginary_node__T_3702_data;
    assign stage_outputs_2_0_real_node = _T_3683_real_node__T_3702_data;
    assign stage_outputs_2_1_imaginary_node = _T_3940_imaginary_node__T_3959_data;
    assign stage_outputs_2_1_real_node = _T_3940_real_node__T_3959_data;
    assign stage_outputs_2_2_imaginary_node = _T_3717_imaginary_node__T_3736_data;
    assign stage_outputs_2_2_real_node = _T_3717_real_node__T_3736_data;
    assign stage_outputs_2_3_imaginary_node = _T_3974_imaginary_node__T_3993_data;
    assign stage_outputs_2_3_real_node = _T_3974_real_node__T_3993_data;
    assign stage_outputs_2_4_imaginary_node = _T_4197_imaginary_node__T_4216_data;
    assign stage_outputs_2_4_real_node = _T_4197_real_node__T_4216_data;
    assign stage_outputs_2_5_imaginary_node = _T_4454_imaginary_node__T_4473_data;
    assign stage_outputs_2_5_real_node = _T_4454_real_node__T_4473_data;
    assign stage_outputs_2_6_imaginary_node = _T_4231_imaginary_node__T_4250_data;
    assign stage_outputs_2_6_real_node = _T_4231_real_node__T_4250_data;
    assign stage_outputs_2_7_imaginary_node = _T_4488_imaginary_node__T_4507_data;
    assign stage_outputs_2_7_real_node = _T_4488_real_node__T_4507_data;
    assign stage_outputs_3_0_imaginary_node = _T_4633_imaginary_node;
    assign stage_outputs_3_0_real_node = _T_4633_real_node;
    assign stage_outputs_3_1_imaginary_node = _T_4699_imaginary_node;
    assign stage_outputs_3_1_real_node = _T_4699_real_node;
    assign stage_outputs_3_2_imaginary_node = _T_4825_imaginary_node;
    assign stage_outputs_3_2_real_node = _T_4825_real_node;
    assign stage_outputs_3_3_imaginary_node = _T_4891_imaginary_node;
    assign stage_outputs_3_3_real_node = _T_4891_real_node;
    assign stage_outputs_3_4_imaginary_node = _T_5017_imaginary_node;
    assign stage_outputs_3_4_real_node = _T_5017_real_node;
    assign stage_outputs_3_5_imaginary_node = _T_5083_imaginary_node;
    assign stage_outputs_3_5_real_node = _T_5083_real_node;
    assign stage_outputs_3_6_imaginary_node = _T_5209_imaginary_node;
    assign stage_outputs_3_6_real_node = _T_5209_real_node;
    assign stage_outputs_3_7_imaginary_node = _T_5275_imaginary_node;
    assign stage_outputs_3_7_real_node = _T_5275_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_927 (
        .y(_WTEMP_0),
        .sel(_T_624),
        .a(1'h0),
        .b(_node_0)
    );
    assign twiddle_0_imaginary_node = _T_1357_imaginary_node;
    assign twiddle_0_real_node = _T_1357_real_node;
    assign twiddle_1_imaginary_node = _T_1418_imaginary_node;
    assign twiddle_1_real_node = _T_1418_real_node;
    assign twiddle_2_imaginary_node = _T_1479_imaginary_node;
    assign twiddle_2_real_node = _T_1479_real_node;
    assign twiddle_3_imaginary_node = _T_1540_imaginary_node;
    assign twiddle_3_real_node = _T_1540_real_node;
    assign twiddle_4_imaginary_node = _T_1601_imaginary_node;
    assign twiddle_4_real_node = _T_1601_real_node;
    assign twiddle_5_imaginary_node = _T_1662_imaginary_node;
    assign twiddle_5_real_node = _T_1662_real_node;
    assign twiddle_6_imaginary_node = _T_1723_imaginary_node;
    assign twiddle_6_real_node = _T_1723_real_node;
    assign twiddle_rom_0_imaginary_node = _T_757_imaginary_node;
    assign twiddle_rom_0_real_node = _T_757_real_node;
    assign twiddle_rom_1_imaginary_node = _T_785_imaginary_node;
    assign twiddle_rom_1_real_node = _T_785_real_node;
    assign twiddle_rom_2_imaginary_node = _T_813_imaginary_node;
    assign twiddle_rom_2_real_node = _T_813_real_node;
    assign twiddle_rom_3_imaginary_node = _T_841_imaginary_node;
    assign twiddle_rom_3_real_node = _T_841_real_node;
endmodule //DirectFFT
module BITWISEAND(y, a, b);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a & b;
endmodule // BITWISEAND
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
module MUL2_UNSIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = a * b;
endmodule // MUL2_UNSIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
module BiplexFFT(
    input clock,
    input reset,
    input io_in_valid,
    input [63:0] io_in_bits_0_real_node,
    input [63:0] io_in_bits_0_imaginary_node,
    input [63:0] io_in_bits_1_real_node,
    input [63:0] io_in_bits_1_imaginary_node,
    input [63:0] io_in_bits_2_real_node,
    input [63:0] io_in_bits_2_imaginary_node,
    input [63:0] io_in_bits_3_real_node,
    input [63:0] io_in_bits_3_imaginary_node,
    input [63:0] io_in_bits_4_real_node,
    input [63:0] io_in_bits_4_imaginary_node,
    input [63:0] io_in_bits_5_real_node,
    input [63:0] io_in_bits_5_imaginary_node,
    input [63:0] io_in_bits_6_real_node,
    input [63:0] io_in_bits_6_imaginary_node,
    input [63:0] io_in_bits_7_real_node,
    input [63:0] io_in_bits_7_imaginary_node,
    input io_in_sync,
    output io_out_valid,
    output [63:0] io_out_bits_0_real_node,
    output [63:0] io_out_bits_0_imaginary_node,
    output [63:0] io_out_bits_1_real_node,
    output [63:0] io_out_bits_1_imaginary_node,
    output [63:0] io_out_bits_2_real_node,
    output [63:0] io_out_bits_2_imaginary_node,
    output [63:0] io_out_bits_3_real_node,
    output [63:0] io_out_bits_3_imaginary_node,
    output [63:0] io_out_bits_4_real_node,
    output [63:0] io_out_bits_4_imaginary_node,
    output [63:0] io_out_bits_5_real_node,
    output [63:0] io_out_bits_5_imaginary_node,
    output [63:0] io_out_bits_6_real_node,
    output [63:0] io_out_bits_6_imaginary_node,
    output [63:0] io_out_bits_7_real_node,
    output [63:0] io_out_bits_7_imaginary_node,
    output io_out_sync
);
    wire [63:0] _T_5_node;
    wire [63:0] _T_12_node;
    wire [63:0] _T_316_node;
    wire [63:0] _T_323_node;
    wire sync_0;
    wire sync_1;
    wire _T_626;
    BITWISEAND #(.width(1)) bitwiseand_928 (
        .y(_T_626),
        .a(io_in_sync),
        .b(io_in_valid)
    );
    wire __T_628__q;
    wire __T_628__d;
    DFF_POSCLK #(.width(1)) _T_628 (
        .q(__T_628__q),
        .d(__T_628__d),
        .clk(clock)
    );
    wire _WTEMP_27;
    MUX_UNSIGNED #(.width(1)) u_mux_929 (
        .y(__T_628__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_27)
    );
    wire _T_630;
    EQ_UNSIGNED #(.width(1)) u_eq_930 (
        .y(_T_630),
        .a(__T_628__q),
        .b(1'h1)
    );
    wire [1:0] _T_632;
    ADD_UNSIGNED #(.width(1)) u_add_931 (
        .y(_T_632),
        .a(__T_628__q),
        .b(1'h1)
    );
    wire _T_633;
    TAIL #(.width(2), .n(1)) tail_932 (
        .y(_T_633),
        .in(_T_632)
    );
    wire _T_634;
    BITWISEAND #(.width(1)) bitwiseand_933 (
        .y(_T_634),
        .a(io_in_valid),
        .b(_T_630)
    );
    wire _node_813;
    MUX_UNSIGNED #(.width(1)) u_mux_934 (
        .y(_node_813),
        .sel(io_in_valid),
        .a(_T_633),
        .b(__T_628__q)
    );
    wire _T_638__T_643_clk;
    wire _T_638__T_643_en;
    wire _T_638__T_643_mask;
    wire _T_638__T_643_addr;
    wire _T_638__T_643_data;
    wire _T_638__T_645_data;
    wire _T_638__T_645_clk;
    wire _T_638__T_645_en;
    wire _T_638__T_645_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(1), .isSyncRead(0)) _T_638 (
        .read_data(_T_638__T_645_data),
        .read_clk(_T_638__T_645_clk),
        .read_en(_T_638__T_645_en),
        .read_addr(_T_638__T_645_addr),
        .write_clk(_T_638__T_643_clk),
        .write_en(_T_638__T_643_en),
        .write_mask(_T_638__T_643_mask),
        .write_addr(_T_638__T_643_addr),
        .write_data(_T_638__T_643_data)
    );
    wire _T_641;
    BITWISEAND #(.width(1)) bitwiseand_935 (
        .y(_T_641),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_638__T_643_addr = 1'h0;
    assign _T_638__T_643_en = io_in_valid;
    assign _T_638__T_643_clk = clock;
    assign _T_638__T_643_mask = 1'h1;
    assign _T_638__T_645_addr = 1'h0;
    assign _T_638__T_645_en = 1'h1;
    assign _T_638__T_645_clk = clock;
    wire _T_647;
    EQ_UNSIGNED #(.width(1)) u_eq_936 (
        .y(_T_647),
        .a(sync_1),
        .b(1'h0)
    );
    wire [63:0] _T_651_node;
    wire [63:0] _T_658_node;
    wire [63:0] twiddle_rom_0_real_node;
    wire [63:0] twiddle_rom_0_imaginary_node;
    wire [63:0] twiddle_rom_1_real_node;
    wire [63:0] twiddle_rom_1_imaginary_node;
    wire [63:0] twiddle_rom_2_real_node;
    wire [63:0] twiddle_rom_2_imaginary_node;
    wire [63:0] twiddle_rom_3_real_node;
    wire [63:0] twiddle_rom_3_imaginary_node;
    wire [63:0] _T_735_node;
    wire [63:0] _T_742_node;
    wire [63:0] _T_759_real_node;
    wire [63:0] _T_759_imaginary_node;
    wire [63:0] _T_763_node;
    wire [63:0] _T_770_node;
    wire [63:0] _T_787_real_node;
    wire [63:0] _T_787_imaginary_node;
    wire [63:0] _T_791_node;
    wire [63:0] _T_798_node;
    wire [63:0] _T_815_real_node;
    wire [63:0] _T_815_imaginary_node;
    wire [63:0] _T_819_node;
    wire [63:0] _T_826_node;
    wire [63:0] _T_843_real_node;
    wire [63:0] _T_843_imaginary_node;
    wire indices_rom_0;
    wire [1:0] _T_854;
    assign _T_854 = 2'h0;
    wire [63:0] _T_860_node;
    wire [63:0] _T_867_node;
    wire [63:0] _T_884_real_node;
    wire [63:0] _T_884_imaginary_node;
    wire [63:0] twiddle_0_real_node;
    wire [63:0] twiddle_0_imaginary_node;
    wire [63:0] _T_974_0_real_node;
    wire [63:0] _T_974_0_imaginary_node;
    wire _node_814;
    wire [1:0] _WTEMP_28;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_937 (
        .y(_WTEMP_28),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_938 (
        .y(_node_814),
        .a(2'd0),
        .b(_WTEMP_28)
    );
    wire [63:0] _node_815;
    assign _node_815 = twiddle_rom_0_imaginary_node;
    wire _node_816;
    wire [1:0] _WTEMP_29;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_939 (
        .y(_WTEMP_29),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_940 (
        .y(_node_816),
        .a(2'd1),
        .b(_WTEMP_29)
    );
    wire [63:0] _node_817;
    MUX_UNSIGNED #(.width(64)) u_mux_941 (
        .y(_node_817),
        .sel(_node_816),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_815)
    );
    wire _node_818;
    wire [1:0] _WTEMP_30;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_942 (
        .y(_WTEMP_30),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_943 (
        .y(_node_818),
        .a(2'd0),
        .b(_WTEMP_30)
    );
    wire [63:0] _node_819;
    assign _node_819 = twiddle_rom_0_real_node;
    wire _node_820;
    wire [1:0] _WTEMP_31;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_944 (
        .y(_WTEMP_31),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_945 (
        .y(_node_820),
        .a(2'd1),
        .b(_WTEMP_31)
    );
    wire [63:0] _node_821;
    MUX_UNSIGNED #(.width(64)) u_mux_946 (
        .y(_node_821),
        .sel(_node_820),
        .a(twiddle_rom_1_real_node),
        .b(_node_819)
    );
    wire [63:0] _T_1005_node;
    wire [63:0] _T_1012_node;
    wire [63:0] stage_outputs_0_0_real_node;
    wire [63:0] stage_outputs_0_0_imaginary_node;
    wire [63:0] _T_1032_node;
    wire [63:0] _T_1039_node;
    wire [63:0] stage_outputs_0_1_real_node;
    wire [63:0] stage_outputs_0_1_imaginary_node;
    wire [63:0] _T_1059_node;
    wire [63:0] _T_1066_node;
    wire [63:0] stage_outputs_0_2_real_node;
    wire [63:0] stage_outputs_0_2_imaginary_node;
    wire [63:0] _T_1086_node;
    wire [63:0] _T_1093_node;
    wire [63:0] stage_outputs_0_3_real_node;
    wire [63:0] stage_outputs_0_3_imaginary_node;
    wire [63:0] _T_1113_node;
    wire [63:0] _T_1120_node;
    wire [63:0] stage_outputs_0_4_real_node;
    wire [63:0] stage_outputs_0_4_imaginary_node;
    wire [63:0] _T_1140_node;
    wire [63:0] _T_1147_node;
    wire [63:0] stage_outputs_0_5_real_node;
    wire [63:0] stage_outputs_0_5_imaginary_node;
    wire [63:0] _T_1167_node;
    wire [63:0] _T_1174_node;
    wire [63:0] stage_outputs_0_6_real_node;
    wire [63:0] stage_outputs_0_6_imaginary_node;
    wire [63:0] _T_1194_node;
    wire [63:0] _T_1201_node;
    wire [63:0] stage_outputs_0_7_real_node;
    wire [63:0] stage_outputs_0_7_imaginary_node;
    wire [63:0] _T_1221_node;
    wire [63:0] _T_1228_node;
    wire [63:0] stage_outputs_1_0_real_node;
    wire [63:0] stage_outputs_1_0_imaginary_node;
    wire [63:0] _T_1248_node;
    wire [63:0] _T_1255_node;
    wire [63:0] stage_outputs_1_1_real_node;
    wire [63:0] stage_outputs_1_1_imaginary_node;
    wire [63:0] _T_1275_node;
    wire [63:0] _T_1282_node;
    wire [63:0] stage_outputs_1_2_real_node;
    wire [63:0] stage_outputs_1_2_imaginary_node;
    wire [63:0] _T_1302_node;
    wire [63:0] _T_1309_node;
    wire [63:0] stage_outputs_1_3_real_node;
    wire [63:0] stage_outputs_1_3_imaginary_node;
    wire [63:0] _T_1329_node;
    wire [63:0] _T_1336_node;
    wire [63:0] stage_outputs_1_4_real_node;
    wire [63:0] stage_outputs_1_4_imaginary_node;
    wire [63:0] _T_1356_node;
    wire [63:0] _T_1363_node;
    wire [63:0] stage_outputs_1_5_real_node;
    wire [63:0] stage_outputs_1_5_imaginary_node;
    wire [63:0] _T_1383_node;
    wire [63:0] _T_1390_node;
    wire [63:0] stage_outputs_1_6_real_node;
    wire [63:0] stage_outputs_1_6_imaginary_node;
    wire [63:0] _T_1410_node;
    wire [63:0] _T_1417_node;
    wire [63:0] stage_outputs_1_7_real_node;
    wire [63:0] stage_outputs_1_7_imaginary_node;
    wire [63:0] _T_1437_node;
    wire [63:0] _T_1444_node;
    wire [63:0] stage_outputs_2_0_real_node;
    wire [63:0] stage_outputs_2_0_imaginary_node;
    wire [63:0] _T_1464_node;
    wire [63:0] _T_1471_node;
    wire [63:0] stage_outputs_2_1_real_node;
    wire [63:0] stage_outputs_2_1_imaginary_node;
    wire [63:0] _T_1491_node;
    wire [63:0] _T_1498_node;
    wire [63:0] stage_outputs_2_2_real_node;
    wire [63:0] stage_outputs_2_2_imaginary_node;
    wire [63:0] _T_1518_node;
    wire [63:0] _T_1525_node;
    wire [63:0] stage_outputs_2_3_real_node;
    wire [63:0] stage_outputs_2_3_imaginary_node;
    wire [63:0] _T_1545_node;
    wire [63:0] _T_1552_node;
    wire [63:0] stage_outputs_2_4_real_node;
    wire [63:0] stage_outputs_2_4_imaginary_node;
    wire [63:0] _T_1572_node;
    wire [63:0] _T_1579_node;
    wire [63:0] stage_outputs_2_5_real_node;
    wire [63:0] stage_outputs_2_5_imaginary_node;
    wire [63:0] _T_1599_node;
    wire [63:0] _T_1606_node;
    wire [63:0] stage_outputs_2_6_real_node;
    wire [63:0] stage_outputs_2_6_imaginary_node;
    wire [63:0] _T_1626_node;
    wire [63:0] _T_1633_node;
    wire [63:0] stage_outputs_2_7_real_node;
    wire [63:0] stage_outputs_2_7_imaginary_node;
    wire _T_1664_real_node__T_1675_clk;
    wire _T_1664_real_node__T_1675_en;
    wire _T_1664_real_node__T_1675_mask;
    wire _T_1664_real_node__T_1675_addr;
    wire [63:0] _T_1664_real_node__T_1675_data;
    wire [63:0] _T_1664_real_node__T_1683_data;
    wire _T_1664_real_node__T_1683_clk;
    wire _T_1664_real_node__T_1683_en;
    wire _T_1664_real_node__T_1683_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_1664_real_node (
        .read_data(_T_1664_real_node__T_1683_data),
        .read_clk(_T_1664_real_node__T_1683_clk),
        .read_en(_T_1664_real_node__T_1683_en),
        .read_addr(_T_1664_real_node__T_1683_addr),
        .write_clk(_T_1664_real_node__T_1675_clk),
        .write_en(_T_1664_real_node__T_1675_en),
        .write_mask(_T_1664_real_node__T_1675_mask),
        .write_addr(_T_1664_real_node__T_1675_addr),
        .write_data(_T_1664_real_node__T_1675_data)
    );
    wire _T_1664_imaginary_node__T_1675_clk;
    wire _T_1664_imaginary_node__T_1675_en;
    wire _T_1664_imaginary_node__T_1675_mask;
    wire _T_1664_imaginary_node__T_1675_addr;
    wire [63:0] _T_1664_imaginary_node__T_1675_data;
    wire [63:0] _T_1664_imaginary_node__T_1683_data;
    wire _T_1664_imaginary_node__T_1683_clk;
    wire _T_1664_imaginary_node__T_1683_en;
    wire _T_1664_imaginary_node__T_1683_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_1664_imaginary_node (
        .read_data(_T_1664_imaginary_node__T_1683_data),
        .read_clk(_T_1664_imaginary_node__T_1683_clk),
        .read_en(_T_1664_imaginary_node__T_1683_en),
        .read_addr(_T_1664_imaginary_node__T_1683_addr),
        .write_clk(_T_1664_imaginary_node__T_1675_clk),
        .write_en(_T_1664_imaginary_node__T_1675_en),
        .write_mask(_T_1664_imaginary_node__T_1675_mask),
        .write_addr(_T_1664_imaginary_node__T_1675_addr),
        .write_data(_T_1664_imaginary_node__T_1675_data)
    );
    wire _T_1667;
    BITWISEAND #(.width(1)) bitwiseand_947 (
        .y(_T_1667),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_1664_real_node__T_1675_addr = 1'h0;
    assign _T_1664_real_node__T_1675_en = io_in_valid;
    assign _T_1664_real_node__T_1675_clk = clock;
    assign _T_1664_imaginary_node__T_1675_addr = 1'h0;
    assign _T_1664_imaginary_node__T_1675_en = io_in_valid;
    assign _T_1664_imaginary_node__T_1675_clk = clock;
    assign _T_1664_imaginary_node__T_1675_mask = 1'h1;
    assign _T_1664_real_node__T_1675_mask = 1'h1;
    assign _T_1664_real_node__T_1683_addr = 1'h0;
    assign _T_1664_real_node__T_1683_en = 1'h1;
    assign _T_1664_real_node__T_1683_clk = clock;
    assign _T_1664_imaginary_node__T_1683_addr = 1'h0;
    assign _T_1664_imaginary_node__T_1683_en = 1'h1;
    assign _T_1664_imaginary_node__T_1683_clk = clock;
    wire [63:0] _T_1725_0_real_node;
    wire [63:0] _T_1725_0_imaginary_node;
    wire [63:0] _T_1725_1_real_node;
    wire [63:0] _T_1725_1_imaginary_node;
    wire _T_1766;
    BITS #(.width(1), .high(0), .low(0)) bits_948 (
        .y(_T_1766),
        .in(sync_0)
    );
    wire _T_1768;
    wire [1:0] _T_1770;
    ADD_UNSIGNED #(.width(1)) u_add_949 (
        .y(_T_1770),
        .a(_T_1766),
        .b(1'h0)
    );
    wire _T_1771;
    TAIL #(.width(2), .n(1)) tail_950 (
        .y(_T_1771),
        .in(_T_1770)
    );
    wire _T_1786;
    wire [1:0] _T_1788;
    ADD_UNSIGNED #(.width(1)) u_add_951 (
        .y(_T_1788),
        .a(_T_1766),
        .b(1'h1)
    );
    wire _T_1789;
    TAIL #(.width(2), .n(1)) tail_952 (
        .y(_T_1789),
        .in(_T_1788)
    );
    wire [63:0] _T_1844_0_real_node;
    wire [63:0] _T_1844_0_imaginary_node;
    wire [63:0] _T_1844_1_real_node;
    wire [63:0] _T_1844_1_imaginary_node;
    wire _node_822;
    EQ_UNSIGNED #(.width(1)) u_eq_953 (
        .y(_node_822),
        .a(1'd0),
        .b(_T_1768)
    );
    wire [63:0] _node_823;
    assign _node_823 = _T_1725_0_imaginary_node;
    wire _node_824;
    EQ_UNSIGNED #(.width(1)) u_eq_954 (
        .y(_node_824),
        .a(1'd1),
        .b(_T_1768)
    );
    wire [63:0] _node_825;
    MUX_UNSIGNED #(.width(64)) u_mux_955 (
        .y(_node_825),
        .sel(_node_824),
        .a(_T_1725_1_imaginary_node),
        .b(_node_823)
    );
    wire _node_826;
    EQ_UNSIGNED #(.width(1)) u_eq_956 (
        .y(_node_826),
        .a(1'd0),
        .b(_T_1768)
    );
    wire [63:0] _node_827;
    assign _node_827 = _T_1725_0_real_node;
    wire _node_828;
    EQ_UNSIGNED #(.width(1)) u_eq_957 (
        .y(_node_828),
        .a(1'd1),
        .b(_T_1768)
    );
    wire [63:0] _node_829;
    MUX_UNSIGNED #(.width(64)) u_mux_958 (
        .y(_node_829),
        .sel(_node_828),
        .a(_T_1725_1_real_node),
        .b(_node_827)
    );
    wire _node_830;
    EQ_UNSIGNED #(.width(1)) u_eq_959 (
        .y(_node_830),
        .a(1'd0),
        .b(_T_1786)
    );
    wire [63:0] _node_831;
    assign _node_831 = _T_1725_0_imaginary_node;
    wire _node_832;
    EQ_UNSIGNED #(.width(1)) u_eq_960 (
        .y(_node_832),
        .a(1'd1),
        .b(_T_1786)
    );
    wire [63:0] _node_833;
    MUX_UNSIGNED #(.width(64)) u_mux_961 (
        .y(_node_833),
        .sel(_node_832),
        .a(_T_1725_1_imaginary_node),
        .b(_node_831)
    );
    wire _node_834;
    EQ_UNSIGNED #(.width(1)) u_eq_962 (
        .y(_node_834),
        .a(1'd0),
        .b(_T_1786)
    );
    wire [63:0] _node_835;
    assign _node_835 = _T_1725_0_real_node;
    wire _node_836;
    EQ_UNSIGNED #(.width(1)) u_eq_963 (
        .y(_node_836),
        .a(1'd1),
        .b(_T_1786)
    );
    wire [63:0] _node_837;
    MUX_UNSIGNED #(.width(64)) u_mux_964 (
        .y(_node_837),
        .sel(_node_836),
        .a(_T_1725_1_real_node),
        .b(_node_835)
    );
    wire _T_1899_real_node__T_1910_clk;
    wire _T_1899_real_node__T_1910_en;
    wire _T_1899_real_node__T_1910_mask;
    wire _T_1899_real_node__T_1910_addr;
    wire [63:0] _T_1899_real_node__T_1910_data;
    wire [63:0] _T_1899_real_node__T_1918_data;
    wire _T_1899_real_node__T_1918_clk;
    wire _T_1899_real_node__T_1918_en;
    wire _T_1899_real_node__T_1918_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_1899_real_node (
        .read_data(_T_1899_real_node__T_1918_data),
        .read_clk(_T_1899_real_node__T_1918_clk),
        .read_en(_T_1899_real_node__T_1918_en),
        .read_addr(_T_1899_real_node__T_1918_addr),
        .write_clk(_T_1899_real_node__T_1910_clk),
        .write_en(_T_1899_real_node__T_1910_en),
        .write_mask(_T_1899_real_node__T_1910_mask),
        .write_addr(_T_1899_real_node__T_1910_addr),
        .write_data(_T_1899_real_node__T_1910_data)
    );
    wire _T_1899_imaginary_node__T_1910_clk;
    wire _T_1899_imaginary_node__T_1910_en;
    wire _T_1899_imaginary_node__T_1910_mask;
    wire _T_1899_imaginary_node__T_1910_addr;
    wire [63:0] _T_1899_imaginary_node__T_1910_data;
    wire [63:0] _T_1899_imaginary_node__T_1918_data;
    wire _T_1899_imaginary_node__T_1918_clk;
    wire _T_1899_imaginary_node__T_1918_en;
    wire _T_1899_imaginary_node__T_1918_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_1899_imaginary_node (
        .read_data(_T_1899_imaginary_node__T_1918_data),
        .read_clk(_T_1899_imaginary_node__T_1918_clk),
        .read_en(_T_1899_imaginary_node__T_1918_en),
        .read_addr(_T_1899_imaginary_node__T_1918_addr),
        .write_clk(_T_1899_imaginary_node__T_1910_clk),
        .write_en(_T_1899_imaginary_node__T_1910_en),
        .write_mask(_T_1899_imaginary_node__T_1910_mask),
        .write_addr(_T_1899_imaginary_node__T_1910_addr),
        .write_data(_T_1899_imaginary_node__T_1910_data)
    );
    wire _T_1902;
    BITWISEAND #(.width(1)) bitwiseand_965 (
        .y(_T_1902),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_1899_real_node__T_1910_addr = 1'h0;
    assign _T_1899_real_node__T_1910_en = io_in_valid;
    assign _T_1899_real_node__T_1910_clk = clock;
    assign _T_1899_imaginary_node__T_1910_addr = 1'h0;
    assign _T_1899_imaginary_node__T_1910_en = io_in_valid;
    assign _T_1899_imaginary_node__T_1910_clk = clock;
    assign _T_1899_imaginary_node__T_1910_mask = 1'h1;
    assign _T_1899_real_node__T_1910_mask = 1'h1;
    assign _T_1899_real_node__T_1918_addr = 1'h0;
    assign _T_1899_real_node__T_1918_en = 1'h1;
    assign _T_1899_real_node__T_1918_clk = clock;
    assign _T_1899_imaginary_node__T_1918_addr = 1'h0;
    assign _T_1899_imaginary_node__T_1918_en = 1'h1;
    assign _T_1899_imaginary_node__T_1918_clk = clock;
    wire [63:0] _BBFMultiply_48_1__out;
    wire [63:0] _BBFMultiply_48_1__in2;
    wire [63:0] _BBFMultiply_48_1__in1;
    BBFMultiply BBFMultiply_48_1 (
        .out(_BBFMultiply_48_1__out),
        .in2(_BBFMultiply_48_1__in2),
        .in1(_BBFMultiply_48_1__in1)
    );
    wire [63:0] _T_1922_node;
    wire [63:0] _BBFMultiply_49_1__out;
    wire [63:0] _BBFMultiply_49_1__in2;
    wire [63:0] _BBFMultiply_49_1__in1;
    BBFMultiply BBFMultiply_49_1 (
        .out(_BBFMultiply_49_1__out),
        .in2(_BBFMultiply_49_1__in2),
        .in1(_BBFMultiply_49_1__in1)
    );
    wire [63:0] _T_1928_node;
    wire [63:0] _T_1934_node;
    wire [63:0] _BBFSubtract_43_1__out;
    wire [63:0] _BBFSubtract_43_1__in2;
    wire [63:0] _BBFSubtract_43_1__in1;
    BBFSubtract BBFSubtract_43_1 (
        .out(_BBFSubtract_43_1__out),
        .in2(_BBFSubtract_43_1__in2),
        .in1(_BBFSubtract_43_1__in1)
    );
    wire [63:0] _T_1941_node;
    wire [63:0] _BBFAdd_72_1__out;
    wire [63:0] _BBFAdd_72_1__in2;
    wire [63:0] _BBFAdd_72_1__in1;
    BBFAdd BBFAdd_72_1 (
        .out(_BBFAdd_72_1__out),
        .in2(_BBFAdd_72_1__in2),
        .in1(_BBFAdd_72_1__in1)
    );
    wire [63:0] _T_1947_node;
    wire [63:0] _BBFMultiply_50_1__out;
    wire [63:0] _BBFMultiply_50_1__in2;
    wire [63:0] _BBFMultiply_50_1__in1;
    BBFMultiply BBFMultiply_50_1 (
        .out(_BBFMultiply_50_1__out),
        .in2(_BBFMultiply_50_1__in2),
        .in1(_BBFMultiply_50_1__in1)
    );
    wire [63:0] _T_1953_node;
    wire [63:0] _BBFMultiply_51_1__out;
    wire [63:0] _BBFMultiply_51_1__in2;
    wire [63:0] _BBFMultiply_51_1__in1;
    BBFMultiply BBFMultiply_51_1 (
        .out(_BBFMultiply_51_1__out),
        .in2(_BBFMultiply_51_1__in2),
        .in1(_BBFMultiply_51_1__in1)
    );
    wire [63:0] _T_1959_node;
    wire [63:0] _BBFAdd_73_1__out;
    wire [63:0] _BBFAdd_73_1__in2;
    wire [63:0] _BBFAdd_73_1__in1;
    BBFAdd BBFAdd_73_1 (
        .out(_BBFAdd_73_1__out),
        .in2(_BBFAdd_73_1__in2),
        .in1(_BBFAdd_73_1__in1)
    );
    wire [63:0] _T_1965_node;
    wire [63:0] _T_1981_real_node;
    wire [63:0] _T_1981_imaginary_node;
    wire [63:0] _BBFAdd_74_1__out;
    wire [63:0] _BBFAdd_74_1__in2;
    wire [63:0] _BBFAdd_74_1__in1;
    BBFAdd BBFAdd_74_1 (
        .out(_BBFAdd_74_1__out),
        .in2(_BBFAdd_74_1__in2),
        .in1(_BBFAdd_74_1__in1)
    );
    wire [63:0] _T_1985_node;
    wire [63:0] _BBFAdd_75_1__out;
    wire [63:0] _BBFAdd_75_1__in2;
    wire [63:0] _BBFAdd_75_1__in1;
    BBFAdd BBFAdd_75_1 (
        .out(_BBFAdd_75_1__out),
        .in2(_BBFAdd_75_1__in2),
        .in1(_BBFAdd_75_1__in1)
    );
    wire [63:0] _T_1991_node;
    wire [63:0] _T_2007_real_node;
    wire [63:0] _T_2007_imaginary_node;
    wire [63:0] _T_2011_node;
    wire [63:0] _BBFSubtract_44_1__out;
    wire [63:0] _BBFSubtract_44_1__in2;
    wire [63:0] _BBFSubtract_44_1__in1;
    BBFSubtract BBFSubtract_44_1 (
        .out(_BBFSubtract_44_1__out),
        .in2(_BBFSubtract_44_1__in2),
        .in1(_BBFSubtract_44_1__in1)
    );
    wire [63:0] _T_2018_node;
    wire [63:0] _T_2024_node;
    wire [63:0] _BBFSubtract_45_1__out;
    wire [63:0] _BBFSubtract_45_1__in2;
    wire [63:0] _BBFSubtract_45_1__in1;
    BBFSubtract BBFSubtract_45_1 (
        .out(_BBFSubtract_45_1__out),
        .in2(_BBFSubtract_45_1__in2),
        .in1(_BBFSubtract_45_1__in1)
    );
    wire [63:0] _T_2031_node;
    wire [63:0] _T_2047_real_node;
    wire [63:0] _T_2047_imaginary_node;
    wire [63:0] _BBFAdd_76_1__out;
    wire [63:0] _BBFAdd_76_1__in2;
    wire [63:0] _BBFAdd_76_1__in1;
    BBFAdd BBFAdd_76_1 (
        .out(_BBFAdd_76_1__out),
        .in2(_BBFAdd_76_1__in2),
        .in1(_BBFAdd_76_1__in1)
    );
    wire [63:0] _T_2051_node;
    wire [63:0] _BBFAdd_77_1__out;
    wire [63:0] _BBFAdd_77_1__in2;
    wire [63:0] _BBFAdd_77_1__in1;
    BBFAdd BBFAdd_77_1 (
        .out(_BBFAdd_77_1__out),
        .in2(_BBFAdd_77_1__in2),
        .in1(_BBFAdd_77_1__in1)
    );
    wire [63:0] _T_2057_node;
    wire [63:0] _T_2073_real_node;
    wire [63:0] _T_2073_imaginary_node;
    wire _T_2088_real_node__T_2099_clk;
    wire _T_2088_real_node__T_2099_en;
    wire _T_2088_real_node__T_2099_mask;
    wire _T_2088_real_node__T_2099_addr;
    wire [63:0] _T_2088_real_node__T_2099_data;
    wire [63:0] _T_2088_real_node__T_2107_data;
    wire _T_2088_real_node__T_2107_clk;
    wire _T_2088_real_node__T_2107_en;
    wire _T_2088_real_node__T_2107_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2088_real_node (
        .read_data(_T_2088_real_node__T_2107_data),
        .read_clk(_T_2088_real_node__T_2107_clk),
        .read_en(_T_2088_real_node__T_2107_en),
        .read_addr(_T_2088_real_node__T_2107_addr),
        .write_clk(_T_2088_real_node__T_2099_clk),
        .write_en(_T_2088_real_node__T_2099_en),
        .write_mask(_T_2088_real_node__T_2099_mask),
        .write_addr(_T_2088_real_node__T_2099_addr),
        .write_data(_T_2088_real_node__T_2099_data)
    );
    wire _T_2088_imaginary_node__T_2099_clk;
    wire _T_2088_imaginary_node__T_2099_en;
    wire _T_2088_imaginary_node__T_2099_mask;
    wire _T_2088_imaginary_node__T_2099_addr;
    wire [63:0] _T_2088_imaginary_node__T_2099_data;
    wire [63:0] _T_2088_imaginary_node__T_2107_data;
    wire _T_2088_imaginary_node__T_2107_clk;
    wire _T_2088_imaginary_node__T_2107_en;
    wire _T_2088_imaginary_node__T_2107_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2088_imaginary_node (
        .read_data(_T_2088_imaginary_node__T_2107_data),
        .read_clk(_T_2088_imaginary_node__T_2107_clk),
        .read_en(_T_2088_imaginary_node__T_2107_en),
        .read_addr(_T_2088_imaginary_node__T_2107_addr),
        .write_clk(_T_2088_imaginary_node__T_2099_clk),
        .write_en(_T_2088_imaginary_node__T_2099_en),
        .write_mask(_T_2088_imaginary_node__T_2099_mask),
        .write_addr(_T_2088_imaginary_node__T_2099_addr),
        .write_data(_T_2088_imaginary_node__T_2099_data)
    );
    wire _T_2091;
    BITWISEAND #(.width(1)) bitwiseand_966 (
        .y(_T_2091),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2088_real_node__T_2099_addr = 1'h0;
    assign _T_2088_real_node__T_2099_en = io_in_valid;
    assign _T_2088_real_node__T_2099_clk = clock;
    assign _T_2088_imaginary_node__T_2099_addr = 1'h0;
    assign _T_2088_imaginary_node__T_2099_en = io_in_valid;
    assign _T_2088_imaginary_node__T_2099_clk = clock;
    assign _T_2088_imaginary_node__T_2099_mask = 1'h1;
    assign _T_2088_real_node__T_2099_mask = 1'h1;
    assign _T_2088_real_node__T_2107_addr = 1'h0;
    assign _T_2088_real_node__T_2107_en = 1'h1;
    assign _T_2088_real_node__T_2107_clk = clock;
    assign _T_2088_imaginary_node__T_2107_addr = 1'h0;
    assign _T_2088_imaginary_node__T_2107_en = 1'h1;
    assign _T_2088_imaginary_node__T_2107_clk = clock;
    wire [63:0] _T_2149_0_real_node;
    wire [63:0] _T_2149_0_imaginary_node;
    wire [63:0] _T_2149_1_real_node;
    wire [63:0] _T_2149_1_imaginary_node;
    wire _T_2190;
    BITS #(.width(1), .high(0), .low(0)) bits_967 (
        .y(_T_2190),
        .in(sync_0)
    );
    wire _T_2192;
    wire [1:0] _T_2194;
    ADD_UNSIGNED #(.width(1)) u_add_968 (
        .y(_T_2194),
        .a(_T_2190),
        .b(1'h0)
    );
    wire _T_2195;
    TAIL #(.width(2), .n(1)) tail_969 (
        .y(_T_2195),
        .in(_T_2194)
    );
    wire _T_2210;
    wire [1:0] _T_2212;
    ADD_UNSIGNED #(.width(1)) u_add_970 (
        .y(_T_2212),
        .a(_T_2190),
        .b(1'h1)
    );
    wire _T_2213;
    TAIL #(.width(2), .n(1)) tail_971 (
        .y(_T_2213),
        .in(_T_2212)
    );
    wire [63:0] _T_2268_0_real_node;
    wire [63:0] _T_2268_0_imaginary_node;
    wire [63:0] _T_2268_1_real_node;
    wire [63:0] _T_2268_1_imaginary_node;
    wire _node_838;
    EQ_UNSIGNED #(.width(1)) u_eq_972 (
        .y(_node_838),
        .a(1'd0),
        .b(_T_2192)
    );
    wire [63:0] _node_839;
    assign _node_839 = _T_2149_0_imaginary_node;
    wire _node_840;
    EQ_UNSIGNED #(.width(1)) u_eq_973 (
        .y(_node_840),
        .a(1'd1),
        .b(_T_2192)
    );
    wire [63:0] _node_841;
    MUX_UNSIGNED #(.width(64)) u_mux_974 (
        .y(_node_841),
        .sel(_node_840),
        .a(_T_2149_1_imaginary_node),
        .b(_node_839)
    );
    wire _node_842;
    EQ_UNSIGNED #(.width(1)) u_eq_975 (
        .y(_node_842),
        .a(1'd0),
        .b(_T_2192)
    );
    wire [63:0] _node_843;
    assign _node_843 = _T_2149_0_real_node;
    wire _node_844;
    EQ_UNSIGNED #(.width(1)) u_eq_976 (
        .y(_node_844),
        .a(1'd1),
        .b(_T_2192)
    );
    wire [63:0] _node_845;
    MUX_UNSIGNED #(.width(64)) u_mux_977 (
        .y(_node_845),
        .sel(_node_844),
        .a(_T_2149_1_real_node),
        .b(_node_843)
    );
    wire _node_846;
    EQ_UNSIGNED #(.width(1)) u_eq_978 (
        .y(_node_846),
        .a(1'd0),
        .b(_T_2210)
    );
    wire [63:0] _node_847;
    assign _node_847 = _T_2149_0_imaginary_node;
    wire _node_848;
    EQ_UNSIGNED #(.width(1)) u_eq_979 (
        .y(_node_848),
        .a(1'd1),
        .b(_T_2210)
    );
    wire [63:0] _node_849;
    MUX_UNSIGNED #(.width(64)) u_mux_980 (
        .y(_node_849),
        .sel(_node_848),
        .a(_T_2149_1_imaginary_node),
        .b(_node_847)
    );
    wire _node_850;
    EQ_UNSIGNED #(.width(1)) u_eq_981 (
        .y(_node_850),
        .a(1'd0),
        .b(_T_2210)
    );
    wire [63:0] _node_851;
    assign _node_851 = _T_2149_0_real_node;
    wire _node_852;
    EQ_UNSIGNED #(.width(1)) u_eq_982 (
        .y(_node_852),
        .a(1'd1),
        .b(_T_2210)
    );
    wire [63:0] _node_853;
    MUX_UNSIGNED #(.width(64)) u_mux_983 (
        .y(_node_853),
        .sel(_node_852),
        .a(_T_2149_1_real_node),
        .b(_node_851)
    );
    wire _T_2323_real_node__T_2334_clk;
    wire _T_2323_real_node__T_2334_en;
    wire _T_2323_real_node__T_2334_mask;
    wire _T_2323_real_node__T_2334_addr;
    wire [63:0] _T_2323_real_node__T_2334_data;
    wire [63:0] _T_2323_real_node__T_2342_data;
    wire _T_2323_real_node__T_2342_clk;
    wire _T_2323_real_node__T_2342_en;
    wire _T_2323_real_node__T_2342_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2323_real_node (
        .read_data(_T_2323_real_node__T_2342_data),
        .read_clk(_T_2323_real_node__T_2342_clk),
        .read_en(_T_2323_real_node__T_2342_en),
        .read_addr(_T_2323_real_node__T_2342_addr),
        .write_clk(_T_2323_real_node__T_2334_clk),
        .write_en(_T_2323_real_node__T_2334_en),
        .write_mask(_T_2323_real_node__T_2334_mask),
        .write_addr(_T_2323_real_node__T_2334_addr),
        .write_data(_T_2323_real_node__T_2334_data)
    );
    wire _T_2323_imaginary_node__T_2334_clk;
    wire _T_2323_imaginary_node__T_2334_en;
    wire _T_2323_imaginary_node__T_2334_mask;
    wire _T_2323_imaginary_node__T_2334_addr;
    wire [63:0] _T_2323_imaginary_node__T_2334_data;
    wire [63:0] _T_2323_imaginary_node__T_2342_data;
    wire _T_2323_imaginary_node__T_2342_clk;
    wire _T_2323_imaginary_node__T_2342_en;
    wire _T_2323_imaginary_node__T_2342_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2323_imaginary_node (
        .read_data(_T_2323_imaginary_node__T_2342_data),
        .read_clk(_T_2323_imaginary_node__T_2342_clk),
        .read_en(_T_2323_imaginary_node__T_2342_en),
        .read_addr(_T_2323_imaginary_node__T_2342_addr),
        .write_clk(_T_2323_imaginary_node__T_2334_clk),
        .write_en(_T_2323_imaginary_node__T_2334_en),
        .write_mask(_T_2323_imaginary_node__T_2334_mask),
        .write_addr(_T_2323_imaginary_node__T_2334_addr),
        .write_data(_T_2323_imaginary_node__T_2334_data)
    );
    wire _T_2326;
    BITWISEAND #(.width(1)) bitwiseand_984 (
        .y(_T_2326),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2323_real_node__T_2334_addr = 1'h0;
    assign _T_2323_real_node__T_2334_en = io_in_valid;
    assign _T_2323_real_node__T_2334_clk = clock;
    assign _T_2323_imaginary_node__T_2334_addr = 1'h0;
    assign _T_2323_imaginary_node__T_2334_en = io_in_valid;
    assign _T_2323_imaginary_node__T_2334_clk = clock;
    assign _T_2323_imaginary_node__T_2334_mask = 1'h1;
    assign _T_2323_real_node__T_2334_mask = 1'h1;
    assign _T_2323_real_node__T_2342_addr = 1'h0;
    assign _T_2323_real_node__T_2342_en = 1'h1;
    assign _T_2323_real_node__T_2342_clk = clock;
    assign _T_2323_imaginary_node__T_2342_addr = 1'h0;
    assign _T_2323_imaginary_node__T_2342_en = 1'h1;
    assign _T_2323_imaginary_node__T_2342_clk = clock;
    wire [63:0] _BBFMultiply_52_1__out;
    wire [63:0] _BBFMultiply_52_1__in2;
    wire [63:0] _BBFMultiply_52_1__in1;
    BBFMultiply BBFMultiply_52_1 (
        .out(_BBFMultiply_52_1__out),
        .in2(_BBFMultiply_52_1__in2),
        .in1(_BBFMultiply_52_1__in1)
    );
    wire [63:0] _T_2346_node;
    wire [63:0] _BBFMultiply_53_1__out;
    wire [63:0] _BBFMultiply_53_1__in2;
    wire [63:0] _BBFMultiply_53_1__in1;
    BBFMultiply BBFMultiply_53_1 (
        .out(_BBFMultiply_53_1__out),
        .in2(_BBFMultiply_53_1__in2),
        .in1(_BBFMultiply_53_1__in1)
    );
    wire [63:0] _T_2352_node;
    wire [63:0] _T_2358_node;
    wire [63:0] _BBFSubtract_46_1__out;
    wire [63:0] _BBFSubtract_46_1__in2;
    wire [63:0] _BBFSubtract_46_1__in1;
    BBFSubtract BBFSubtract_46_1 (
        .out(_BBFSubtract_46_1__out),
        .in2(_BBFSubtract_46_1__in2),
        .in1(_BBFSubtract_46_1__in1)
    );
    wire [63:0] _T_2365_node;
    wire [63:0] _BBFAdd_78_1__out;
    wire [63:0] _BBFAdd_78_1__in2;
    wire [63:0] _BBFAdd_78_1__in1;
    BBFAdd BBFAdd_78_1 (
        .out(_BBFAdd_78_1__out),
        .in2(_BBFAdd_78_1__in2),
        .in1(_BBFAdd_78_1__in1)
    );
    wire [63:0] _T_2371_node;
    wire [63:0] _BBFMultiply_54_1__out;
    wire [63:0] _BBFMultiply_54_1__in2;
    wire [63:0] _BBFMultiply_54_1__in1;
    BBFMultiply BBFMultiply_54_1 (
        .out(_BBFMultiply_54_1__out),
        .in2(_BBFMultiply_54_1__in2),
        .in1(_BBFMultiply_54_1__in1)
    );
    wire [63:0] _T_2377_node;
    wire [63:0] _BBFMultiply_55_1__out;
    wire [63:0] _BBFMultiply_55_1__in2;
    wire [63:0] _BBFMultiply_55_1__in1;
    BBFMultiply BBFMultiply_55_1 (
        .out(_BBFMultiply_55_1__out),
        .in2(_BBFMultiply_55_1__in2),
        .in1(_BBFMultiply_55_1__in1)
    );
    wire [63:0] _T_2383_node;
    wire [63:0] _BBFAdd_79_1__out;
    wire [63:0] _BBFAdd_79_1__in2;
    wire [63:0] _BBFAdd_79_1__in1;
    BBFAdd BBFAdd_79_1 (
        .out(_BBFAdd_79_1__out),
        .in2(_BBFAdd_79_1__in2),
        .in1(_BBFAdd_79_1__in1)
    );
    wire [63:0] _T_2389_node;
    wire [63:0] _T_2405_real_node;
    wire [63:0] _T_2405_imaginary_node;
    wire [63:0] _BBFAdd_80_1__out;
    wire [63:0] _BBFAdd_80_1__in2;
    wire [63:0] _BBFAdd_80_1__in1;
    BBFAdd BBFAdd_80_1 (
        .out(_BBFAdd_80_1__out),
        .in2(_BBFAdd_80_1__in2),
        .in1(_BBFAdd_80_1__in1)
    );
    wire [63:0] _T_2409_node;
    wire [63:0] _BBFAdd_81_1__out;
    wire [63:0] _BBFAdd_81_1__in2;
    wire [63:0] _BBFAdd_81_1__in1;
    BBFAdd BBFAdd_81_1 (
        .out(_BBFAdd_81_1__out),
        .in2(_BBFAdd_81_1__in2),
        .in1(_BBFAdd_81_1__in1)
    );
    wire [63:0] _T_2415_node;
    wire [63:0] _T_2431_real_node;
    wire [63:0] _T_2431_imaginary_node;
    wire [63:0] _T_2435_node;
    wire [63:0] _BBFSubtract_47_1__out;
    wire [63:0] _BBFSubtract_47_1__in2;
    wire [63:0] _BBFSubtract_47_1__in1;
    BBFSubtract BBFSubtract_47_1 (
        .out(_BBFSubtract_47_1__out),
        .in2(_BBFSubtract_47_1__in2),
        .in1(_BBFSubtract_47_1__in1)
    );
    wire [63:0] _T_2442_node;
    wire [63:0] _T_2448_node;
    wire [63:0] _BBFSubtract_48_1__out;
    wire [63:0] _BBFSubtract_48_1__in2;
    wire [63:0] _BBFSubtract_48_1__in1;
    BBFSubtract BBFSubtract_48_1 (
        .out(_BBFSubtract_48_1__out),
        .in2(_BBFSubtract_48_1__in2),
        .in1(_BBFSubtract_48_1__in1)
    );
    wire [63:0] _T_2455_node;
    wire [63:0] _T_2471_real_node;
    wire [63:0] _T_2471_imaginary_node;
    wire [63:0] _BBFAdd_82_1__out;
    wire [63:0] _BBFAdd_82_1__in2;
    wire [63:0] _BBFAdd_82_1__in1;
    BBFAdd BBFAdd_82_1 (
        .out(_BBFAdd_82_1__out),
        .in2(_BBFAdd_82_1__in2),
        .in1(_BBFAdd_82_1__in1)
    );
    wire [63:0] _T_2475_node;
    wire [63:0] _BBFAdd_83_1__out;
    wire [63:0] _BBFAdd_83_1__in2;
    wire [63:0] _BBFAdd_83_1__in1;
    BBFAdd BBFAdd_83_1 (
        .out(_BBFAdd_83_1__out),
        .in2(_BBFAdd_83_1__in2),
        .in1(_BBFAdd_83_1__in1)
    );
    wire [63:0] _T_2481_node;
    wire [63:0] _T_2497_real_node;
    wire [63:0] _T_2497_imaginary_node;
    wire _T_2512_real_node__T_2523_clk;
    wire _T_2512_real_node__T_2523_en;
    wire _T_2512_real_node__T_2523_mask;
    wire _T_2512_real_node__T_2523_addr;
    wire [63:0] _T_2512_real_node__T_2523_data;
    wire [63:0] _T_2512_real_node__T_2531_data;
    wire _T_2512_real_node__T_2531_clk;
    wire _T_2512_real_node__T_2531_en;
    wire _T_2512_real_node__T_2531_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2512_real_node (
        .read_data(_T_2512_real_node__T_2531_data),
        .read_clk(_T_2512_real_node__T_2531_clk),
        .read_en(_T_2512_real_node__T_2531_en),
        .read_addr(_T_2512_real_node__T_2531_addr),
        .write_clk(_T_2512_real_node__T_2523_clk),
        .write_en(_T_2512_real_node__T_2523_en),
        .write_mask(_T_2512_real_node__T_2523_mask),
        .write_addr(_T_2512_real_node__T_2523_addr),
        .write_data(_T_2512_real_node__T_2523_data)
    );
    wire _T_2512_imaginary_node__T_2523_clk;
    wire _T_2512_imaginary_node__T_2523_en;
    wire _T_2512_imaginary_node__T_2523_mask;
    wire _T_2512_imaginary_node__T_2523_addr;
    wire [63:0] _T_2512_imaginary_node__T_2523_data;
    wire [63:0] _T_2512_imaginary_node__T_2531_data;
    wire _T_2512_imaginary_node__T_2531_clk;
    wire _T_2512_imaginary_node__T_2531_en;
    wire _T_2512_imaginary_node__T_2531_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2512_imaginary_node (
        .read_data(_T_2512_imaginary_node__T_2531_data),
        .read_clk(_T_2512_imaginary_node__T_2531_clk),
        .read_en(_T_2512_imaginary_node__T_2531_en),
        .read_addr(_T_2512_imaginary_node__T_2531_addr),
        .write_clk(_T_2512_imaginary_node__T_2523_clk),
        .write_en(_T_2512_imaginary_node__T_2523_en),
        .write_mask(_T_2512_imaginary_node__T_2523_mask),
        .write_addr(_T_2512_imaginary_node__T_2523_addr),
        .write_data(_T_2512_imaginary_node__T_2523_data)
    );
    wire _T_2515;
    BITWISEAND #(.width(1)) bitwiseand_985 (
        .y(_T_2515),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2512_real_node__T_2523_addr = 1'h0;
    assign _T_2512_real_node__T_2523_en = io_in_valid;
    assign _T_2512_real_node__T_2523_clk = clock;
    assign _T_2512_imaginary_node__T_2523_addr = 1'h0;
    assign _T_2512_imaginary_node__T_2523_en = io_in_valid;
    assign _T_2512_imaginary_node__T_2523_clk = clock;
    assign _T_2512_imaginary_node__T_2523_mask = 1'h1;
    assign _T_2512_real_node__T_2523_mask = 1'h1;
    assign _T_2512_real_node__T_2531_addr = 1'h0;
    assign _T_2512_real_node__T_2531_en = 1'h1;
    assign _T_2512_real_node__T_2531_clk = clock;
    assign _T_2512_imaginary_node__T_2531_addr = 1'h0;
    assign _T_2512_imaginary_node__T_2531_en = 1'h1;
    assign _T_2512_imaginary_node__T_2531_clk = clock;
    wire [63:0] _T_2573_0_real_node;
    wire [63:0] _T_2573_0_imaginary_node;
    wire [63:0] _T_2573_1_real_node;
    wire [63:0] _T_2573_1_imaginary_node;
    wire _T_2614;
    BITS #(.width(1), .high(0), .low(0)) bits_986 (
        .y(_T_2614),
        .in(sync_0)
    );
    wire _T_2616;
    wire [1:0] _T_2618;
    ADD_UNSIGNED #(.width(1)) u_add_987 (
        .y(_T_2618),
        .a(_T_2614),
        .b(1'h0)
    );
    wire _T_2619;
    TAIL #(.width(2), .n(1)) tail_988 (
        .y(_T_2619),
        .in(_T_2618)
    );
    wire _T_2634;
    wire [1:0] _T_2636;
    ADD_UNSIGNED #(.width(1)) u_add_989 (
        .y(_T_2636),
        .a(_T_2614),
        .b(1'h1)
    );
    wire _T_2637;
    TAIL #(.width(2), .n(1)) tail_990 (
        .y(_T_2637),
        .in(_T_2636)
    );
    wire [63:0] _T_2692_0_real_node;
    wire [63:0] _T_2692_0_imaginary_node;
    wire [63:0] _T_2692_1_real_node;
    wire [63:0] _T_2692_1_imaginary_node;
    wire _node_854;
    EQ_UNSIGNED #(.width(1)) u_eq_991 (
        .y(_node_854),
        .a(1'd0),
        .b(_T_2616)
    );
    wire [63:0] _node_855;
    assign _node_855 = _T_2573_0_imaginary_node;
    wire _node_856;
    EQ_UNSIGNED #(.width(1)) u_eq_992 (
        .y(_node_856),
        .a(1'd1),
        .b(_T_2616)
    );
    wire [63:0] _node_857;
    MUX_UNSIGNED #(.width(64)) u_mux_993 (
        .y(_node_857),
        .sel(_node_856),
        .a(_T_2573_1_imaginary_node),
        .b(_node_855)
    );
    wire _node_858;
    EQ_UNSIGNED #(.width(1)) u_eq_994 (
        .y(_node_858),
        .a(1'd0),
        .b(_T_2616)
    );
    wire [63:0] _node_859;
    assign _node_859 = _T_2573_0_real_node;
    wire _node_860;
    EQ_UNSIGNED #(.width(1)) u_eq_995 (
        .y(_node_860),
        .a(1'd1),
        .b(_T_2616)
    );
    wire [63:0] _node_861;
    MUX_UNSIGNED #(.width(64)) u_mux_996 (
        .y(_node_861),
        .sel(_node_860),
        .a(_T_2573_1_real_node),
        .b(_node_859)
    );
    wire _node_862;
    EQ_UNSIGNED #(.width(1)) u_eq_997 (
        .y(_node_862),
        .a(1'd0),
        .b(_T_2634)
    );
    wire [63:0] _node_863;
    assign _node_863 = _T_2573_0_imaginary_node;
    wire _node_864;
    EQ_UNSIGNED #(.width(1)) u_eq_998 (
        .y(_node_864),
        .a(1'd1),
        .b(_T_2634)
    );
    wire [63:0] _node_865;
    MUX_UNSIGNED #(.width(64)) u_mux_999 (
        .y(_node_865),
        .sel(_node_864),
        .a(_T_2573_1_imaginary_node),
        .b(_node_863)
    );
    wire _node_866;
    EQ_UNSIGNED #(.width(1)) u_eq_1000 (
        .y(_node_866),
        .a(1'd0),
        .b(_T_2634)
    );
    wire [63:0] _node_867;
    assign _node_867 = _T_2573_0_real_node;
    wire _node_868;
    EQ_UNSIGNED #(.width(1)) u_eq_1001 (
        .y(_node_868),
        .a(1'd1),
        .b(_T_2634)
    );
    wire [63:0] _node_869;
    MUX_UNSIGNED #(.width(64)) u_mux_1002 (
        .y(_node_869),
        .sel(_node_868),
        .a(_T_2573_1_real_node),
        .b(_node_867)
    );
    wire _T_2747_real_node__T_2758_clk;
    wire _T_2747_real_node__T_2758_en;
    wire _T_2747_real_node__T_2758_mask;
    wire _T_2747_real_node__T_2758_addr;
    wire [63:0] _T_2747_real_node__T_2758_data;
    wire [63:0] _T_2747_real_node__T_2766_data;
    wire _T_2747_real_node__T_2766_clk;
    wire _T_2747_real_node__T_2766_en;
    wire _T_2747_real_node__T_2766_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2747_real_node (
        .read_data(_T_2747_real_node__T_2766_data),
        .read_clk(_T_2747_real_node__T_2766_clk),
        .read_en(_T_2747_real_node__T_2766_en),
        .read_addr(_T_2747_real_node__T_2766_addr),
        .write_clk(_T_2747_real_node__T_2758_clk),
        .write_en(_T_2747_real_node__T_2758_en),
        .write_mask(_T_2747_real_node__T_2758_mask),
        .write_addr(_T_2747_real_node__T_2758_addr),
        .write_data(_T_2747_real_node__T_2758_data)
    );
    wire _T_2747_imaginary_node__T_2758_clk;
    wire _T_2747_imaginary_node__T_2758_en;
    wire _T_2747_imaginary_node__T_2758_mask;
    wire _T_2747_imaginary_node__T_2758_addr;
    wire [63:0] _T_2747_imaginary_node__T_2758_data;
    wire [63:0] _T_2747_imaginary_node__T_2766_data;
    wire _T_2747_imaginary_node__T_2766_clk;
    wire _T_2747_imaginary_node__T_2766_en;
    wire _T_2747_imaginary_node__T_2766_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2747_imaginary_node (
        .read_data(_T_2747_imaginary_node__T_2766_data),
        .read_clk(_T_2747_imaginary_node__T_2766_clk),
        .read_en(_T_2747_imaginary_node__T_2766_en),
        .read_addr(_T_2747_imaginary_node__T_2766_addr),
        .write_clk(_T_2747_imaginary_node__T_2758_clk),
        .write_en(_T_2747_imaginary_node__T_2758_en),
        .write_mask(_T_2747_imaginary_node__T_2758_mask),
        .write_addr(_T_2747_imaginary_node__T_2758_addr),
        .write_data(_T_2747_imaginary_node__T_2758_data)
    );
    wire _T_2750;
    BITWISEAND #(.width(1)) bitwiseand_1003 (
        .y(_T_2750),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2747_real_node__T_2758_addr = 1'h0;
    assign _T_2747_real_node__T_2758_en = io_in_valid;
    assign _T_2747_real_node__T_2758_clk = clock;
    assign _T_2747_imaginary_node__T_2758_addr = 1'h0;
    assign _T_2747_imaginary_node__T_2758_en = io_in_valid;
    assign _T_2747_imaginary_node__T_2758_clk = clock;
    assign _T_2747_imaginary_node__T_2758_mask = 1'h1;
    assign _T_2747_real_node__T_2758_mask = 1'h1;
    assign _T_2747_real_node__T_2766_addr = 1'h0;
    assign _T_2747_real_node__T_2766_en = 1'h1;
    assign _T_2747_real_node__T_2766_clk = clock;
    assign _T_2747_imaginary_node__T_2766_addr = 1'h0;
    assign _T_2747_imaginary_node__T_2766_en = 1'h1;
    assign _T_2747_imaginary_node__T_2766_clk = clock;
    wire [63:0] _BBFMultiply_56_1__out;
    wire [63:0] _BBFMultiply_56_1__in2;
    wire [63:0] _BBFMultiply_56_1__in1;
    BBFMultiply BBFMultiply_56_1 (
        .out(_BBFMultiply_56_1__out),
        .in2(_BBFMultiply_56_1__in2),
        .in1(_BBFMultiply_56_1__in1)
    );
    wire [63:0] _T_2770_node;
    wire [63:0] _BBFMultiply_57_1__out;
    wire [63:0] _BBFMultiply_57_1__in2;
    wire [63:0] _BBFMultiply_57_1__in1;
    BBFMultiply BBFMultiply_57_1 (
        .out(_BBFMultiply_57_1__out),
        .in2(_BBFMultiply_57_1__in2),
        .in1(_BBFMultiply_57_1__in1)
    );
    wire [63:0] _T_2776_node;
    wire [63:0] _T_2782_node;
    wire [63:0] _BBFSubtract_49_1__out;
    wire [63:0] _BBFSubtract_49_1__in2;
    wire [63:0] _BBFSubtract_49_1__in1;
    BBFSubtract BBFSubtract_49_1 (
        .out(_BBFSubtract_49_1__out),
        .in2(_BBFSubtract_49_1__in2),
        .in1(_BBFSubtract_49_1__in1)
    );
    wire [63:0] _T_2789_node;
    wire [63:0] _BBFAdd_84_1__out;
    wire [63:0] _BBFAdd_84_1__in2;
    wire [63:0] _BBFAdd_84_1__in1;
    BBFAdd BBFAdd_84_1 (
        .out(_BBFAdd_84_1__out),
        .in2(_BBFAdd_84_1__in2),
        .in1(_BBFAdd_84_1__in1)
    );
    wire [63:0] _T_2795_node;
    wire [63:0] _BBFMultiply_58_1__out;
    wire [63:0] _BBFMultiply_58_1__in2;
    wire [63:0] _BBFMultiply_58_1__in1;
    BBFMultiply BBFMultiply_58_1 (
        .out(_BBFMultiply_58_1__out),
        .in2(_BBFMultiply_58_1__in2),
        .in1(_BBFMultiply_58_1__in1)
    );
    wire [63:0] _T_2801_node;
    wire [63:0] _BBFMultiply_59_1__out;
    wire [63:0] _BBFMultiply_59_1__in2;
    wire [63:0] _BBFMultiply_59_1__in1;
    BBFMultiply BBFMultiply_59_1 (
        .out(_BBFMultiply_59_1__out),
        .in2(_BBFMultiply_59_1__in2),
        .in1(_BBFMultiply_59_1__in1)
    );
    wire [63:0] _T_2807_node;
    wire [63:0] _BBFAdd_85_1__out;
    wire [63:0] _BBFAdd_85_1__in2;
    wire [63:0] _BBFAdd_85_1__in1;
    BBFAdd BBFAdd_85_1 (
        .out(_BBFAdd_85_1__out),
        .in2(_BBFAdd_85_1__in2),
        .in1(_BBFAdd_85_1__in1)
    );
    wire [63:0] _T_2813_node;
    wire [63:0] _T_2829_real_node;
    wire [63:0] _T_2829_imaginary_node;
    wire [63:0] _BBFAdd_86_1__out;
    wire [63:0] _BBFAdd_86_1__in2;
    wire [63:0] _BBFAdd_86_1__in1;
    BBFAdd BBFAdd_86_1 (
        .out(_BBFAdd_86_1__out),
        .in2(_BBFAdd_86_1__in2),
        .in1(_BBFAdd_86_1__in1)
    );
    wire [63:0] _T_2833_node;
    wire [63:0] _BBFAdd_87_1__out;
    wire [63:0] _BBFAdd_87_1__in2;
    wire [63:0] _BBFAdd_87_1__in1;
    BBFAdd BBFAdd_87_1 (
        .out(_BBFAdd_87_1__out),
        .in2(_BBFAdd_87_1__in2),
        .in1(_BBFAdd_87_1__in1)
    );
    wire [63:0] _T_2839_node;
    wire [63:0] _T_2855_real_node;
    wire [63:0] _T_2855_imaginary_node;
    wire [63:0] _T_2859_node;
    wire [63:0] _BBFSubtract_50_1__out;
    wire [63:0] _BBFSubtract_50_1__in2;
    wire [63:0] _BBFSubtract_50_1__in1;
    BBFSubtract BBFSubtract_50_1 (
        .out(_BBFSubtract_50_1__out),
        .in2(_BBFSubtract_50_1__in2),
        .in1(_BBFSubtract_50_1__in1)
    );
    wire [63:0] _T_2866_node;
    wire [63:0] _T_2872_node;
    wire [63:0] _BBFSubtract_51_1__out;
    wire [63:0] _BBFSubtract_51_1__in2;
    wire [63:0] _BBFSubtract_51_1__in1;
    BBFSubtract BBFSubtract_51_1 (
        .out(_BBFSubtract_51_1__out),
        .in2(_BBFSubtract_51_1__in2),
        .in1(_BBFSubtract_51_1__in1)
    );
    wire [63:0] _T_2879_node;
    wire [63:0] _T_2895_real_node;
    wire [63:0] _T_2895_imaginary_node;
    wire [63:0] _BBFAdd_88_1__out;
    wire [63:0] _BBFAdd_88_1__in2;
    wire [63:0] _BBFAdd_88_1__in1;
    BBFAdd BBFAdd_88_1 (
        .out(_BBFAdd_88_1__out),
        .in2(_BBFAdd_88_1__in2),
        .in1(_BBFAdd_88_1__in1)
    );
    wire [63:0] _T_2899_node;
    wire [63:0] _BBFAdd_89_1__out;
    wire [63:0] _BBFAdd_89_1__in2;
    wire [63:0] _BBFAdd_89_1__in1;
    BBFAdd BBFAdd_89_1 (
        .out(_BBFAdd_89_1__out),
        .in2(_BBFAdd_89_1__in2),
        .in1(_BBFAdd_89_1__in1)
    );
    wire [63:0] _T_2905_node;
    wire [63:0] _T_2921_real_node;
    wire [63:0] _T_2921_imaginary_node;
    wire _T_2936_real_node__T_2947_clk;
    wire _T_2936_real_node__T_2947_en;
    wire _T_2936_real_node__T_2947_mask;
    wire _T_2936_real_node__T_2947_addr;
    wire [63:0] _T_2936_real_node__T_2947_data;
    wire [63:0] _T_2936_real_node__T_2955_data;
    wire _T_2936_real_node__T_2955_clk;
    wire _T_2936_real_node__T_2955_en;
    wire _T_2936_real_node__T_2955_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2936_real_node (
        .read_data(_T_2936_real_node__T_2955_data),
        .read_clk(_T_2936_real_node__T_2955_clk),
        .read_en(_T_2936_real_node__T_2955_en),
        .read_addr(_T_2936_real_node__T_2955_addr),
        .write_clk(_T_2936_real_node__T_2947_clk),
        .write_en(_T_2936_real_node__T_2947_en),
        .write_mask(_T_2936_real_node__T_2947_mask),
        .write_addr(_T_2936_real_node__T_2947_addr),
        .write_data(_T_2936_real_node__T_2947_data)
    );
    wire _T_2936_imaginary_node__T_2947_clk;
    wire _T_2936_imaginary_node__T_2947_en;
    wire _T_2936_imaginary_node__T_2947_mask;
    wire _T_2936_imaginary_node__T_2947_addr;
    wire [63:0] _T_2936_imaginary_node__T_2947_data;
    wire [63:0] _T_2936_imaginary_node__T_2955_data;
    wire _T_2936_imaginary_node__T_2955_clk;
    wire _T_2936_imaginary_node__T_2955_en;
    wire _T_2936_imaginary_node__T_2955_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2936_imaginary_node (
        .read_data(_T_2936_imaginary_node__T_2955_data),
        .read_clk(_T_2936_imaginary_node__T_2955_clk),
        .read_en(_T_2936_imaginary_node__T_2955_en),
        .read_addr(_T_2936_imaginary_node__T_2955_addr),
        .write_clk(_T_2936_imaginary_node__T_2947_clk),
        .write_en(_T_2936_imaginary_node__T_2947_en),
        .write_mask(_T_2936_imaginary_node__T_2947_mask),
        .write_addr(_T_2936_imaginary_node__T_2947_addr),
        .write_data(_T_2936_imaginary_node__T_2947_data)
    );
    wire _T_2939;
    BITWISEAND #(.width(1)) bitwiseand_1004 (
        .y(_T_2939),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2936_real_node__T_2947_addr = 1'h0;
    assign _T_2936_real_node__T_2947_en = io_in_valid;
    assign _T_2936_real_node__T_2947_clk = clock;
    assign _T_2936_imaginary_node__T_2947_addr = 1'h0;
    assign _T_2936_imaginary_node__T_2947_en = io_in_valid;
    assign _T_2936_imaginary_node__T_2947_clk = clock;
    assign _T_2936_imaginary_node__T_2947_mask = 1'h1;
    assign _T_2936_real_node__T_2947_mask = 1'h1;
    assign _T_2936_real_node__T_2955_addr = 1'h0;
    assign _T_2936_real_node__T_2955_en = 1'h1;
    assign _T_2936_real_node__T_2955_clk = clock;
    assign _T_2936_imaginary_node__T_2955_addr = 1'h0;
    assign _T_2936_imaginary_node__T_2955_en = 1'h1;
    assign _T_2936_imaginary_node__T_2955_clk = clock;
    wire [63:0] _T_2997_0_real_node;
    wire [63:0] _T_2997_0_imaginary_node;
    wire [63:0] _T_2997_1_real_node;
    wire [63:0] _T_2997_1_imaginary_node;
    wire _T_3038;
    BITS #(.width(1), .high(0), .low(0)) bits_1005 (
        .y(_T_3038),
        .in(sync_0)
    );
    wire _T_3040;
    wire [1:0] _T_3042;
    ADD_UNSIGNED #(.width(1)) u_add_1006 (
        .y(_T_3042),
        .a(_T_3038),
        .b(1'h0)
    );
    wire _T_3043;
    TAIL #(.width(2), .n(1)) tail_1007 (
        .y(_T_3043),
        .in(_T_3042)
    );
    wire _T_3058;
    wire [1:0] _T_3060;
    ADD_UNSIGNED #(.width(1)) u_add_1008 (
        .y(_T_3060),
        .a(_T_3038),
        .b(1'h1)
    );
    wire _T_3061;
    TAIL #(.width(2), .n(1)) tail_1009 (
        .y(_T_3061),
        .in(_T_3060)
    );
    wire [63:0] _T_3116_0_real_node;
    wire [63:0] _T_3116_0_imaginary_node;
    wire [63:0] _T_3116_1_real_node;
    wire [63:0] _T_3116_1_imaginary_node;
    wire _node_870;
    EQ_UNSIGNED #(.width(1)) u_eq_1010 (
        .y(_node_870),
        .a(1'd0),
        .b(_T_3040)
    );
    wire [63:0] _node_871;
    assign _node_871 = _T_2997_0_imaginary_node;
    wire _node_872;
    EQ_UNSIGNED #(.width(1)) u_eq_1011 (
        .y(_node_872),
        .a(1'd1),
        .b(_T_3040)
    );
    wire [63:0] _node_873;
    MUX_UNSIGNED #(.width(64)) u_mux_1012 (
        .y(_node_873),
        .sel(_node_872),
        .a(_T_2997_1_imaginary_node),
        .b(_node_871)
    );
    wire _node_874;
    EQ_UNSIGNED #(.width(1)) u_eq_1013 (
        .y(_node_874),
        .a(1'd0),
        .b(_T_3040)
    );
    wire [63:0] _node_875;
    assign _node_875 = _T_2997_0_real_node;
    wire _node_876;
    EQ_UNSIGNED #(.width(1)) u_eq_1014 (
        .y(_node_876),
        .a(1'd1),
        .b(_T_3040)
    );
    wire [63:0] _node_877;
    MUX_UNSIGNED #(.width(64)) u_mux_1015 (
        .y(_node_877),
        .sel(_node_876),
        .a(_T_2997_1_real_node),
        .b(_node_875)
    );
    wire _node_878;
    EQ_UNSIGNED #(.width(1)) u_eq_1016 (
        .y(_node_878),
        .a(1'd0),
        .b(_T_3058)
    );
    wire [63:0] _node_879;
    assign _node_879 = _T_2997_0_imaginary_node;
    wire _node_880;
    EQ_UNSIGNED #(.width(1)) u_eq_1017 (
        .y(_node_880),
        .a(1'd1),
        .b(_T_3058)
    );
    wire [63:0] _node_881;
    MUX_UNSIGNED #(.width(64)) u_mux_1018 (
        .y(_node_881),
        .sel(_node_880),
        .a(_T_2997_1_imaginary_node),
        .b(_node_879)
    );
    wire _node_882;
    EQ_UNSIGNED #(.width(1)) u_eq_1019 (
        .y(_node_882),
        .a(1'd0),
        .b(_T_3058)
    );
    wire [63:0] _node_883;
    assign _node_883 = _T_2997_0_real_node;
    wire _node_884;
    EQ_UNSIGNED #(.width(1)) u_eq_1020 (
        .y(_node_884),
        .a(1'd1),
        .b(_T_3058)
    );
    wire [63:0] _node_885;
    MUX_UNSIGNED #(.width(64)) u_mux_1021 (
        .y(_node_885),
        .sel(_node_884),
        .a(_T_2997_1_real_node),
        .b(_node_883)
    );
    wire _T_3171_real_node__T_3182_clk;
    wire _T_3171_real_node__T_3182_en;
    wire _T_3171_real_node__T_3182_mask;
    wire _T_3171_real_node__T_3182_addr;
    wire [63:0] _T_3171_real_node__T_3182_data;
    wire [63:0] _T_3171_real_node__T_3190_data;
    wire _T_3171_real_node__T_3190_clk;
    wire _T_3171_real_node__T_3190_en;
    wire _T_3171_real_node__T_3190_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3171_real_node (
        .read_data(_T_3171_real_node__T_3190_data),
        .read_clk(_T_3171_real_node__T_3190_clk),
        .read_en(_T_3171_real_node__T_3190_en),
        .read_addr(_T_3171_real_node__T_3190_addr),
        .write_clk(_T_3171_real_node__T_3182_clk),
        .write_en(_T_3171_real_node__T_3182_en),
        .write_mask(_T_3171_real_node__T_3182_mask),
        .write_addr(_T_3171_real_node__T_3182_addr),
        .write_data(_T_3171_real_node__T_3182_data)
    );
    wire _T_3171_imaginary_node__T_3182_clk;
    wire _T_3171_imaginary_node__T_3182_en;
    wire _T_3171_imaginary_node__T_3182_mask;
    wire _T_3171_imaginary_node__T_3182_addr;
    wire [63:0] _T_3171_imaginary_node__T_3182_data;
    wire [63:0] _T_3171_imaginary_node__T_3190_data;
    wire _T_3171_imaginary_node__T_3190_clk;
    wire _T_3171_imaginary_node__T_3190_en;
    wire _T_3171_imaginary_node__T_3190_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3171_imaginary_node (
        .read_data(_T_3171_imaginary_node__T_3190_data),
        .read_clk(_T_3171_imaginary_node__T_3190_clk),
        .read_en(_T_3171_imaginary_node__T_3190_en),
        .read_addr(_T_3171_imaginary_node__T_3190_addr),
        .write_clk(_T_3171_imaginary_node__T_3182_clk),
        .write_en(_T_3171_imaginary_node__T_3182_en),
        .write_mask(_T_3171_imaginary_node__T_3182_mask),
        .write_addr(_T_3171_imaginary_node__T_3182_addr),
        .write_data(_T_3171_imaginary_node__T_3182_data)
    );
    wire _T_3174;
    BITWISEAND #(.width(1)) bitwiseand_1022 (
        .y(_T_3174),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3171_real_node__T_3182_addr = 1'h0;
    assign _T_3171_real_node__T_3182_en = io_in_valid;
    assign _T_3171_real_node__T_3182_clk = clock;
    assign _T_3171_imaginary_node__T_3182_addr = 1'h0;
    assign _T_3171_imaginary_node__T_3182_en = io_in_valid;
    assign _T_3171_imaginary_node__T_3182_clk = clock;
    assign _T_3171_imaginary_node__T_3182_mask = 1'h1;
    assign _T_3171_real_node__T_3182_mask = 1'h1;
    assign _T_3171_real_node__T_3190_addr = 1'h0;
    assign _T_3171_real_node__T_3190_en = 1'h1;
    assign _T_3171_real_node__T_3190_clk = clock;
    assign _T_3171_imaginary_node__T_3190_addr = 1'h0;
    assign _T_3171_imaginary_node__T_3190_en = 1'h1;
    assign _T_3171_imaginary_node__T_3190_clk = clock;
    wire [63:0] _BBFMultiply_60_1__out;
    wire [63:0] _BBFMultiply_60_1__in2;
    wire [63:0] _BBFMultiply_60_1__in1;
    BBFMultiply BBFMultiply_60_1 (
        .out(_BBFMultiply_60_1__out),
        .in2(_BBFMultiply_60_1__in2),
        .in1(_BBFMultiply_60_1__in1)
    );
    wire [63:0] _T_3194_node;
    wire [63:0] _BBFMultiply_61_1__out;
    wire [63:0] _BBFMultiply_61_1__in2;
    wire [63:0] _BBFMultiply_61_1__in1;
    BBFMultiply BBFMultiply_61_1 (
        .out(_BBFMultiply_61_1__out),
        .in2(_BBFMultiply_61_1__in2),
        .in1(_BBFMultiply_61_1__in1)
    );
    wire [63:0] _T_3200_node;
    wire [63:0] _T_3206_node;
    wire [63:0] _BBFSubtract_52_1__out;
    wire [63:0] _BBFSubtract_52_1__in2;
    wire [63:0] _BBFSubtract_52_1__in1;
    BBFSubtract BBFSubtract_52_1 (
        .out(_BBFSubtract_52_1__out),
        .in2(_BBFSubtract_52_1__in2),
        .in1(_BBFSubtract_52_1__in1)
    );
    wire [63:0] _T_3213_node;
    wire [63:0] _BBFAdd_90_1__out;
    wire [63:0] _BBFAdd_90_1__in2;
    wire [63:0] _BBFAdd_90_1__in1;
    BBFAdd BBFAdd_90_1 (
        .out(_BBFAdd_90_1__out),
        .in2(_BBFAdd_90_1__in2),
        .in1(_BBFAdd_90_1__in1)
    );
    wire [63:0] _T_3219_node;
    wire [63:0] _BBFMultiply_62_1__out;
    wire [63:0] _BBFMultiply_62_1__in2;
    wire [63:0] _BBFMultiply_62_1__in1;
    BBFMultiply BBFMultiply_62_1 (
        .out(_BBFMultiply_62_1__out),
        .in2(_BBFMultiply_62_1__in2),
        .in1(_BBFMultiply_62_1__in1)
    );
    wire [63:0] _T_3225_node;
    wire [63:0] _BBFMultiply_63_1__out;
    wire [63:0] _BBFMultiply_63_1__in2;
    wire [63:0] _BBFMultiply_63_1__in1;
    BBFMultiply BBFMultiply_63_1 (
        .out(_BBFMultiply_63_1__out),
        .in2(_BBFMultiply_63_1__in2),
        .in1(_BBFMultiply_63_1__in1)
    );
    wire [63:0] _T_3231_node;
    wire [63:0] _BBFAdd_91_1__out;
    wire [63:0] _BBFAdd_91_1__in2;
    wire [63:0] _BBFAdd_91_1__in1;
    BBFAdd BBFAdd_91_1 (
        .out(_BBFAdd_91_1__out),
        .in2(_BBFAdd_91_1__in2),
        .in1(_BBFAdd_91_1__in1)
    );
    wire [63:0] _T_3237_node;
    wire [63:0] _T_3253_real_node;
    wire [63:0] _T_3253_imaginary_node;
    wire [63:0] _BBFAdd_92_1__out;
    wire [63:0] _BBFAdd_92_1__in2;
    wire [63:0] _BBFAdd_92_1__in1;
    BBFAdd BBFAdd_92_1 (
        .out(_BBFAdd_92_1__out),
        .in2(_BBFAdd_92_1__in2),
        .in1(_BBFAdd_92_1__in1)
    );
    wire [63:0] _T_3257_node;
    wire [63:0] _BBFAdd_93_1__out;
    wire [63:0] _BBFAdd_93_1__in2;
    wire [63:0] _BBFAdd_93_1__in1;
    BBFAdd BBFAdd_93_1 (
        .out(_BBFAdd_93_1__out),
        .in2(_BBFAdd_93_1__in2),
        .in1(_BBFAdd_93_1__in1)
    );
    wire [63:0] _T_3263_node;
    wire [63:0] _T_3279_real_node;
    wire [63:0] _T_3279_imaginary_node;
    wire [63:0] _T_3283_node;
    wire [63:0] _BBFSubtract_53_1__out;
    wire [63:0] _BBFSubtract_53_1__in2;
    wire [63:0] _BBFSubtract_53_1__in1;
    BBFSubtract BBFSubtract_53_1 (
        .out(_BBFSubtract_53_1__out),
        .in2(_BBFSubtract_53_1__in2),
        .in1(_BBFSubtract_53_1__in1)
    );
    wire [63:0] _T_3290_node;
    wire [63:0] _T_3296_node;
    wire [63:0] _BBFSubtract_54_1__out;
    wire [63:0] _BBFSubtract_54_1__in2;
    wire [63:0] _BBFSubtract_54_1__in1;
    BBFSubtract BBFSubtract_54_1 (
        .out(_BBFSubtract_54_1__out),
        .in2(_BBFSubtract_54_1__in2),
        .in1(_BBFSubtract_54_1__in1)
    );
    wire [63:0] _T_3303_node;
    wire [63:0] _T_3319_real_node;
    wire [63:0] _T_3319_imaginary_node;
    wire [63:0] _BBFAdd_94_1__out;
    wire [63:0] _BBFAdd_94_1__in2;
    wire [63:0] _BBFAdd_94_1__in1;
    BBFAdd BBFAdd_94_1 (
        .out(_BBFAdd_94_1__out),
        .in2(_BBFAdd_94_1__in2),
        .in1(_BBFAdd_94_1__in1)
    );
    wire [63:0] _T_3323_node;
    wire [63:0] _BBFAdd_95_1__out;
    wire [63:0] _BBFAdd_95_1__in2;
    wire [63:0] _BBFAdd_95_1__in1;
    BBFAdd BBFAdd_95_1 (
        .out(_BBFAdd_95_1__out),
        .in2(_BBFAdd_95_1__in2),
        .in1(_BBFAdd_95_1__in1)
    );
    wire [63:0] _T_3329_node;
    wire [63:0] _T_3345_real_node;
    wire [63:0] _T_3345_imaginary_node;
    wire _T_3360_real_node__T_3371_clk;
    wire _T_3360_real_node__T_3371_en;
    wire _T_3360_real_node__T_3371_mask;
    wire _T_3360_real_node__T_3371_addr;
    wire [63:0] _T_3360_real_node__T_3371_data;
    wire [63:0] _T_3360_real_node__T_3379_data;
    wire _T_3360_real_node__T_3379_clk;
    wire _T_3360_real_node__T_3379_en;
    wire _T_3360_real_node__T_3379_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3360_real_node (
        .read_data(_T_3360_real_node__T_3379_data),
        .read_clk(_T_3360_real_node__T_3379_clk),
        .read_en(_T_3360_real_node__T_3379_en),
        .read_addr(_T_3360_real_node__T_3379_addr),
        .write_clk(_T_3360_real_node__T_3371_clk),
        .write_en(_T_3360_real_node__T_3371_en),
        .write_mask(_T_3360_real_node__T_3371_mask),
        .write_addr(_T_3360_real_node__T_3371_addr),
        .write_data(_T_3360_real_node__T_3371_data)
    );
    wire _T_3360_imaginary_node__T_3371_clk;
    wire _T_3360_imaginary_node__T_3371_en;
    wire _T_3360_imaginary_node__T_3371_mask;
    wire _T_3360_imaginary_node__T_3371_addr;
    wire [63:0] _T_3360_imaginary_node__T_3371_data;
    wire [63:0] _T_3360_imaginary_node__T_3379_data;
    wire _T_3360_imaginary_node__T_3379_clk;
    wire _T_3360_imaginary_node__T_3379_en;
    wire _T_3360_imaginary_node__T_3379_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3360_imaginary_node (
        .read_data(_T_3360_imaginary_node__T_3379_data),
        .read_clk(_T_3360_imaginary_node__T_3379_clk),
        .read_en(_T_3360_imaginary_node__T_3379_en),
        .read_addr(_T_3360_imaginary_node__T_3379_addr),
        .write_clk(_T_3360_imaginary_node__T_3371_clk),
        .write_en(_T_3360_imaginary_node__T_3371_en),
        .write_mask(_T_3360_imaginary_node__T_3371_mask),
        .write_addr(_T_3360_imaginary_node__T_3371_addr),
        .write_data(_T_3360_imaginary_node__T_3371_data)
    );
    wire _T_3363;
    BITWISEAND #(.width(1)) bitwiseand_1023 (
        .y(_T_3363),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3360_real_node__T_3371_addr = 1'h0;
    assign _T_3360_real_node__T_3371_en = io_in_valid;
    assign _T_3360_real_node__T_3371_clk = clock;
    assign _T_3360_imaginary_node__T_3371_addr = 1'h0;
    assign _T_3360_imaginary_node__T_3371_en = io_in_valid;
    assign _T_3360_imaginary_node__T_3371_clk = clock;
    assign _T_3360_imaginary_node__T_3371_mask = 1'h1;
    assign _T_3360_real_node__T_3371_mask = 1'h1;
    assign _T_3360_real_node__T_3379_addr = 1'h0;
    assign _T_3360_real_node__T_3379_en = 1'h1;
    assign _T_3360_real_node__T_3379_clk = clock;
    assign _T_3360_imaginary_node__T_3379_addr = 1'h0;
    assign _T_3360_imaginary_node__T_3379_en = 1'h1;
    assign _T_3360_imaginary_node__T_3379_clk = clock;
    wire [63:0] _T_3421_0_real_node;
    wire [63:0] _T_3421_0_imaginary_node;
    wire [63:0] _T_3421_1_real_node;
    wire [63:0] _T_3421_1_imaginary_node;
    wire _T_3462;
    BITS #(.width(1), .high(0), .low(0)) bits_1024 (
        .y(_T_3462),
        .in(sync_1)
    );
    wire _T_3464;
    wire [1:0] _T_3466;
    ADD_UNSIGNED #(.width(1)) u_add_1025 (
        .y(_T_3466),
        .a(_T_3462),
        .b(1'h0)
    );
    wire _T_3467;
    TAIL #(.width(2), .n(1)) tail_1026 (
        .y(_T_3467),
        .in(_T_3466)
    );
    wire _T_3482;
    wire [1:0] _T_3484;
    ADD_UNSIGNED #(.width(1)) u_add_1027 (
        .y(_T_3484),
        .a(_T_3462),
        .b(1'h1)
    );
    wire _T_3485;
    TAIL #(.width(2), .n(1)) tail_1028 (
        .y(_T_3485),
        .in(_T_3484)
    );
    wire [63:0] _T_3540_0_real_node;
    wire [63:0] _T_3540_0_imaginary_node;
    wire [63:0] _T_3540_1_real_node;
    wire [63:0] _T_3540_1_imaginary_node;
    wire _node_886;
    EQ_UNSIGNED #(.width(1)) u_eq_1029 (
        .y(_node_886),
        .a(1'd0),
        .b(_T_3464)
    );
    wire [63:0] _node_887;
    assign _node_887 = _T_3421_0_imaginary_node;
    wire _node_888;
    EQ_UNSIGNED #(.width(1)) u_eq_1030 (
        .y(_node_888),
        .a(1'd1),
        .b(_T_3464)
    );
    wire [63:0] _node_889;
    MUX_UNSIGNED #(.width(64)) u_mux_1031 (
        .y(_node_889),
        .sel(_node_888),
        .a(_T_3421_1_imaginary_node),
        .b(_node_887)
    );
    wire _node_890;
    EQ_UNSIGNED #(.width(1)) u_eq_1032 (
        .y(_node_890),
        .a(1'd0),
        .b(_T_3464)
    );
    wire [63:0] _node_891;
    assign _node_891 = _T_3421_0_real_node;
    wire _node_892;
    EQ_UNSIGNED #(.width(1)) u_eq_1033 (
        .y(_node_892),
        .a(1'd1),
        .b(_T_3464)
    );
    wire [63:0] _node_893;
    MUX_UNSIGNED #(.width(64)) u_mux_1034 (
        .y(_node_893),
        .sel(_node_892),
        .a(_T_3421_1_real_node),
        .b(_node_891)
    );
    wire _node_894;
    EQ_UNSIGNED #(.width(1)) u_eq_1035 (
        .y(_node_894),
        .a(1'd0),
        .b(_T_3482)
    );
    wire [63:0] _node_895;
    assign _node_895 = _T_3421_0_imaginary_node;
    wire _node_896;
    EQ_UNSIGNED #(.width(1)) u_eq_1036 (
        .y(_node_896),
        .a(1'd1),
        .b(_T_3482)
    );
    wire [63:0] _node_897;
    MUX_UNSIGNED #(.width(64)) u_mux_1037 (
        .y(_node_897),
        .sel(_node_896),
        .a(_T_3421_1_imaginary_node),
        .b(_node_895)
    );
    wire _node_898;
    EQ_UNSIGNED #(.width(1)) u_eq_1038 (
        .y(_node_898),
        .a(1'd0),
        .b(_T_3482)
    );
    wire [63:0] _node_899;
    assign _node_899 = _T_3421_0_real_node;
    wire _node_900;
    EQ_UNSIGNED #(.width(1)) u_eq_1039 (
        .y(_node_900),
        .a(1'd1),
        .b(_T_3482)
    );
    wire [63:0] _node_901;
    MUX_UNSIGNED #(.width(64)) u_mux_1040 (
        .y(_node_901),
        .sel(_node_900),
        .a(_T_3421_1_real_node),
        .b(_node_899)
    );
    wire _T_3595_real_node__T_3606_clk;
    wire _T_3595_real_node__T_3606_en;
    wire _T_3595_real_node__T_3606_mask;
    wire _T_3595_real_node__T_3606_addr;
    wire [63:0] _T_3595_real_node__T_3606_data;
    wire [63:0] _T_3595_real_node__T_3614_data;
    wire _T_3595_real_node__T_3614_clk;
    wire _T_3595_real_node__T_3614_en;
    wire _T_3595_real_node__T_3614_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3595_real_node (
        .read_data(_T_3595_real_node__T_3614_data),
        .read_clk(_T_3595_real_node__T_3614_clk),
        .read_en(_T_3595_real_node__T_3614_en),
        .read_addr(_T_3595_real_node__T_3614_addr),
        .write_clk(_T_3595_real_node__T_3606_clk),
        .write_en(_T_3595_real_node__T_3606_en),
        .write_mask(_T_3595_real_node__T_3606_mask),
        .write_addr(_T_3595_real_node__T_3606_addr),
        .write_data(_T_3595_real_node__T_3606_data)
    );
    wire _T_3595_imaginary_node__T_3606_clk;
    wire _T_3595_imaginary_node__T_3606_en;
    wire _T_3595_imaginary_node__T_3606_mask;
    wire _T_3595_imaginary_node__T_3606_addr;
    wire [63:0] _T_3595_imaginary_node__T_3606_data;
    wire [63:0] _T_3595_imaginary_node__T_3614_data;
    wire _T_3595_imaginary_node__T_3614_clk;
    wire _T_3595_imaginary_node__T_3614_en;
    wire _T_3595_imaginary_node__T_3614_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3595_imaginary_node (
        .read_data(_T_3595_imaginary_node__T_3614_data),
        .read_clk(_T_3595_imaginary_node__T_3614_clk),
        .read_en(_T_3595_imaginary_node__T_3614_en),
        .read_addr(_T_3595_imaginary_node__T_3614_addr),
        .write_clk(_T_3595_imaginary_node__T_3606_clk),
        .write_en(_T_3595_imaginary_node__T_3606_en),
        .write_mask(_T_3595_imaginary_node__T_3606_mask),
        .write_addr(_T_3595_imaginary_node__T_3606_addr),
        .write_data(_T_3595_imaginary_node__T_3606_data)
    );
    wire _T_3598;
    BITWISEAND #(.width(1)) bitwiseand_1041 (
        .y(_T_3598),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3595_real_node__T_3606_addr = 1'h0;
    assign _T_3595_real_node__T_3606_en = io_in_valid;
    assign _T_3595_real_node__T_3606_clk = clock;
    assign _T_3595_imaginary_node__T_3606_addr = 1'h0;
    assign _T_3595_imaginary_node__T_3606_en = io_in_valid;
    assign _T_3595_imaginary_node__T_3606_clk = clock;
    assign _T_3595_imaginary_node__T_3606_mask = 1'h1;
    assign _T_3595_real_node__T_3606_mask = 1'h1;
    assign _T_3595_real_node__T_3614_addr = 1'h0;
    assign _T_3595_real_node__T_3614_en = 1'h1;
    assign _T_3595_real_node__T_3614_clk = clock;
    assign _T_3595_imaginary_node__T_3614_addr = 1'h0;
    assign _T_3595_imaginary_node__T_3614_en = 1'h1;
    assign _T_3595_imaginary_node__T_3614_clk = clock;
    wire _T_3629_real_node__T_3640_clk;
    wire _T_3629_real_node__T_3640_en;
    wire _T_3629_real_node__T_3640_mask;
    wire _T_3629_real_node__T_3640_addr;
    wire [63:0] _T_3629_real_node__T_3640_data;
    wire [63:0] _T_3629_real_node__T_3648_data;
    wire _T_3629_real_node__T_3648_clk;
    wire _T_3629_real_node__T_3648_en;
    wire _T_3629_real_node__T_3648_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3629_real_node (
        .read_data(_T_3629_real_node__T_3648_data),
        .read_clk(_T_3629_real_node__T_3648_clk),
        .read_en(_T_3629_real_node__T_3648_en),
        .read_addr(_T_3629_real_node__T_3648_addr),
        .write_clk(_T_3629_real_node__T_3640_clk),
        .write_en(_T_3629_real_node__T_3640_en),
        .write_mask(_T_3629_real_node__T_3640_mask),
        .write_addr(_T_3629_real_node__T_3640_addr),
        .write_data(_T_3629_real_node__T_3640_data)
    );
    wire _T_3629_imaginary_node__T_3640_clk;
    wire _T_3629_imaginary_node__T_3640_en;
    wire _T_3629_imaginary_node__T_3640_mask;
    wire _T_3629_imaginary_node__T_3640_addr;
    wire [63:0] _T_3629_imaginary_node__T_3640_data;
    wire [63:0] _T_3629_imaginary_node__T_3648_data;
    wire _T_3629_imaginary_node__T_3648_clk;
    wire _T_3629_imaginary_node__T_3648_en;
    wire _T_3629_imaginary_node__T_3648_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3629_imaginary_node (
        .read_data(_T_3629_imaginary_node__T_3648_data),
        .read_clk(_T_3629_imaginary_node__T_3648_clk),
        .read_en(_T_3629_imaginary_node__T_3648_en),
        .read_addr(_T_3629_imaginary_node__T_3648_addr),
        .write_clk(_T_3629_imaginary_node__T_3640_clk),
        .write_en(_T_3629_imaginary_node__T_3640_en),
        .write_mask(_T_3629_imaginary_node__T_3640_mask),
        .write_addr(_T_3629_imaginary_node__T_3640_addr),
        .write_data(_T_3629_imaginary_node__T_3640_data)
    );
    wire _T_3632;
    BITWISEAND #(.width(1)) bitwiseand_1042 (
        .y(_T_3632),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3629_real_node__T_3640_addr = 1'h0;
    assign _T_3629_real_node__T_3640_en = io_in_valid;
    assign _T_3629_real_node__T_3640_clk = clock;
    assign _T_3629_imaginary_node__T_3640_addr = 1'h0;
    assign _T_3629_imaginary_node__T_3640_en = io_in_valid;
    assign _T_3629_imaginary_node__T_3640_clk = clock;
    assign _T_3629_imaginary_node__T_3640_mask = 1'h1;
    assign _T_3629_real_node__T_3640_mask = 1'h1;
    assign _T_3629_real_node__T_3648_addr = 1'h0;
    assign _T_3629_real_node__T_3648_en = 1'h1;
    assign _T_3629_real_node__T_3648_clk = clock;
    assign _T_3629_imaginary_node__T_3648_addr = 1'h0;
    assign _T_3629_imaginary_node__T_3648_en = 1'h1;
    assign _T_3629_imaginary_node__T_3648_clk = clock;
    wire [63:0] _T_3690_0_real_node;
    wire [63:0] _T_3690_0_imaginary_node;
    wire [63:0] _T_3690_1_real_node;
    wire [63:0] _T_3690_1_imaginary_node;
    wire _T_3731;
    BITS #(.width(1), .high(0), .low(0)) bits_1043 (
        .y(_T_3731),
        .in(sync_1)
    );
    wire _T_3733;
    wire [1:0] _T_3735;
    ADD_UNSIGNED #(.width(1)) u_add_1044 (
        .y(_T_3735),
        .a(_T_3731),
        .b(1'h0)
    );
    wire _T_3736;
    TAIL #(.width(2), .n(1)) tail_1045 (
        .y(_T_3736),
        .in(_T_3735)
    );
    wire _T_3751;
    wire [1:0] _T_3753;
    ADD_UNSIGNED #(.width(1)) u_add_1046 (
        .y(_T_3753),
        .a(_T_3731),
        .b(1'h1)
    );
    wire _T_3754;
    TAIL #(.width(2), .n(1)) tail_1047 (
        .y(_T_3754),
        .in(_T_3753)
    );
    wire [63:0] _T_3809_0_real_node;
    wire [63:0] _T_3809_0_imaginary_node;
    wire [63:0] _T_3809_1_real_node;
    wire [63:0] _T_3809_1_imaginary_node;
    wire _node_902;
    EQ_UNSIGNED #(.width(1)) u_eq_1048 (
        .y(_node_902),
        .a(1'd0),
        .b(_T_3733)
    );
    wire [63:0] _node_903;
    assign _node_903 = _T_3690_0_imaginary_node;
    wire _node_904;
    EQ_UNSIGNED #(.width(1)) u_eq_1049 (
        .y(_node_904),
        .a(1'd1),
        .b(_T_3733)
    );
    wire [63:0] _node_905;
    MUX_UNSIGNED #(.width(64)) u_mux_1050 (
        .y(_node_905),
        .sel(_node_904),
        .a(_T_3690_1_imaginary_node),
        .b(_node_903)
    );
    wire _node_906;
    EQ_UNSIGNED #(.width(1)) u_eq_1051 (
        .y(_node_906),
        .a(1'd0),
        .b(_T_3733)
    );
    wire [63:0] _node_907;
    assign _node_907 = _T_3690_0_real_node;
    wire _node_908;
    EQ_UNSIGNED #(.width(1)) u_eq_1052 (
        .y(_node_908),
        .a(1'd1),
        .b(_T_3733)
    );
    wire [63:0] _node_909;
    MUX_UNSIGNED #(.width(64)) u_mux_1053 (
        .y(_node_909),
        .sel(_node_908),
        .a(_T_3690_1_real_node),
        .b(_node_907)
    );
    wire _node_910;
    EQ_UNSIGNED #(.width(1)) u_eq_1054 (
        .y(_node_910),
        .a(1'd0),
        .b(_T_3751)
    );
    wire [63:0] _node_911;
    assign _node_911 = _T_3690_0_imaginary_node;
    wire _node_912;
    EQ_UNSIGNED #(.width(1)) u_eq_1055 (
        .y(_node_912),
        .a(1'd1),
        .b(_T_3751)
    );
    wire [63:0] _node_913;
    MUX_UNSIGNED #(.width(64)) u_mux_1056 (
        .y(_node_913),
        .sel(_node_912),
        .a(_T_3690_1_imaginary_node),
        .b(_node_911)
    );
    wire _node_914;
    EQ_UNSIGNED #(.width(1)) u_eq_1057 (
        .y(_node_914),
        .a(1'd0),
        .b(_T_3751)
    );
    wire [63:0] _node_915;
    assign _node_915 = _T_3690_0_real_node;
    wire _node_916;
    EQ_UNSIGNED #(.width(1)) u_eq_1058 (
        .y(_node_916),
        .a(1'd1),
        .b(_T_3751)
    );
    wire [63:0] _node_917;
    MUX_UNSIGNED #(.width(64)) u_mux_1059 (
        .y(_node_917),
        .sel(_node_916),
        .a(_T_3690_1_real_node),
        .b(_node_915)
    );
    wire _T_3864_real_node__T_3875_clk;
    wire _T_3864_real_node__T_3875_en;
    wire _T_3864_real_node__T_3875_mask;
    wire _T_3864_real_node__T_3875_addr;
    wire [63:0] _T_3864_real_node__T_3875_data;
    wire [63:0] _T_3864_real_node__T_3883_data;
    wire _T_3864_real_node__T_3883_clk;
    wire _T_3864_real_node__T_3883_en;
    wire _T_3864_real_node__T_3883_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3864_real_node (
        .read_data(_T_3864_real_node__T_3883_data),
        .read_clk(_T_3864_real_node__T_3883_clk),
        .read_en(_T_3864_real_node__T_3883_en),
        .read_addr(_T_3864_real_node__T_3883_addr),
        .write_clk(_T_3864_real_node__T_3875_clk),
        .write_en(_T_3864_real_node__T_3875_en),
        .write_mask(_T_3864_real_node__T_3875_mask),
        .write_addr(_T_3864_real_node__T_3875_addr),
        .write_data(_T_3864_real_node__T_3875_data)
    );
    wire _T_3864_imaginary_node__T_3875_clk;
    wire _T_3864_imaginary_node__T_3875_en;
    wire _T_3864_imaginary_node__T_3875_mask;
    wire _T_3864_imaginary_node__T_3875_addr;
    wire [63:0] _T_3864_imaginary_node__T_3875_data;
    wire [63:0] _T_3864_imaginary_node__T_3883_data;
    wire _T_3864_imaginary_node__T_3883_clk;
    wire _T_3864_imaginary_node__T_3883_en;
    wire _T_3864_imaginary_node__T_3883_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3864_imaginary_node (
        .read_data(_T_3864_imaginary_node__T_3883_data),
        .read_clk(_T_3864_imaginary_node__T_3883_clk),
        .read_en(_T_3864_imaginary_node__T_3883_en),
        .read_addr(_T_3864_imaginary_node__T_3883_addr),
        .write_clk(_T_3864_imaginary_node__T_3875_clk),
        .write_en(_T_3864_imaginary_node__T_3875_en),
        .write_mask(_T_3864_imaginary_node__T_3875_mask),
        .write_addr(_T_3864_imaginary_node__T_3875_addr),
        .write_data(_T_3864_imaginary_node__T_3875_data)
    );
    wire _T_3867;
    BITWISEAND #(.width(1)) bitwiseand_1060 (
        .y(_T_3867),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3864_real_node__T_3875_addr = 1'h0;
    assign _T_3864_real_node__T_3875_en = io_in_valid;
    assign _T_3864_real_node__T_3875_clk = clock;
    assign _T_3864_imaginary_node__T_3875_addr = 1'h0;
    assign _T_3864_imaginary_node__T_3875_en = io_in_valid;
    assign _T_3864_imaginary_node__T_3875_clk = clock;
    assign _T_3864_imaginary_node__T_3875_mask = 1'h1;
    assign _T_3864_real_node__T_3875_mask = 1'h1;
    assign _T_3864_real_node__T_3883_addr = 1'h0;
    assign _T_3864_real_node__T_3883_en = 1'h1;
    assign _T_3864_real_node__T_3883_clk = clock;
    assign _T_3864_imaginary_node__T_3883_addr = 1'h0;
    assign _T_3864_imaginary_node__T_3883_en = 1'h1;
    assign _T_3864_imaginary_node__T_3883_clk = clock;
    wire _T_3898_real_node__T_3909_clk;
    wire _T_3898_real_node__T_3909_en;
    wire _T_3898_real_node__T_3909_mask;
    wire _T_3898_real_node__T_3909_addr;
    wire [63:0] _T_3898_real_node__T_3909_data;
    wire [63:0] _T_3898_real_node__T_3917_data;
    wire _T_3898_real_node__T_3917_clk;
    wire _T_3898_real_node__T_3917_en;
    wire _T_3898_real_node__T_3917_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3898_real_node (
        .read_data(_T_3898_real_node__T_3917_data),
        .read_clk(_T_3898_real_node__T_3917_clk),
        .read_en(_T_3898_real_node__T_3917_en),
        .read_addr(_T_3898_real_node__T_3917_addr),
        .write_clk(_T_3898_real_node__T_3909_clk),
        .write_en(_T_3898_real_node__T_3909_en),
        .write_mask(_T_3898_real_node__T_3909_mask),
        .write_addr(_T_3898_real_node__T_3909_addr),
        .write_data(_T_3898_real_node__T_3909_data)
    );
    wire _T_3898_imaginary_node__T_3909_clk;
    wire _T_3898_imaginary_node__T_3909_en;
    wire _T_3898_imaginary_node__T_3909_mask;
    wire _T_3898_imaginary_node__T_3909_addr;
    wire [63:0] _T_3898_imaginary_node__T_3909_data;
    wire [63:0] _T_3898_imaginary_node__T_3917_data;
    wire _T_3898_imaginary_node__T_3917_clk;
    wire _T_3898_imaginary_node__T_3917_en;
    wire _T_3898_imaginary_node__T_3917_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3898_imaginary_node (
        .read_data(_T_3898_imaginary_node__T_3917_data),
        .read_clk(_T_3898_imaginary_node__T_3917_clk),
        .read_en(_T_3898_imaginary_node__T_3917_en),
        .read_addr(_T_3898_imaginary_node__T_3917_addr),
        .write_clk(_T_3898_imaginary_node__T_3909_clk),
        .write_en(_T_3898_imaginary_node__T_3909_en),
        .write_mask(_T_3898_imaginary_node__T_3909_mask),
        .write_addr(_T_3898_imaginary_node__T_3909_addr),
        .write_data(_T_3898_imaginary_node__T_3909_data)
    );
    wire _T_3901;
    BITWISEAND #(.width(1)) bitwiseand_1061 (
        .y(_T_3901),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3898_real_node__T_3909_addr = 1'h0;
    assign _T_3898_real_node__T_3909_en = io_in_valid;
    assign _T_3898_real_node__T_3909_clk = clock;
    assign _T_3898_imaginary_node__T_3909_addr = 1'h0;
    assign _T_3898_imaginary_node__T_3909_en = io_in_valid;
    assign _T_3898_imaginary_node__T_3909_clk = clock;
    assign _T_3898_imaginary_node__T_3909_mask = 1'h1;
    assign _T_3898_real_node__T_3909_mask = 1'h1;
    assign _T_3898_real_node__T_3917_addr = 1'h0;
    assign _T_3898_real_node__T_3917_en = 1'h1;
    assign _T_3898_real_node__T_3917_clk = clock;
    assign _T_3898_imaginary_node__T_3917_addr = 1'h0;
    assign _T_3898_imaginary_node__T_3917_en = 1'h1;
    assign _T_3898_imaginary_node__T_3917_clk = clock;
    wire [63:0] _T_3959_0_real_node;
    wire [63:0] _T_3959_0_imaginary_node;
    wire [63:0] _T_3959_1_real_node;
    wire [63:0] _T_3959_1_imaginary_node;
    wire _T_4000;
    BITS #(.width(1), .high(0), .low(0)) bits_1062 (
        .y(_T_4000),
        .in(sync_1)
    );
    wire _T_4002;
    wire [1:0] _T_4004;
    ADD_UNSIGNED #(.width(1)) u_add_1063 (
        .y(_T_4004),
        .a(_T_4000),
        .b(1'h0)
    );
    wire _T_4005;
    TAIL #(.width(2), .n(1)) tail_1064 (
        .y(_T_4005),
        .in(_T_4004)
    );
    wire _T_4020;
    wire [1:0] _T_4022;
    ADD_UNSIGNED #(.width(1)) u_add_1065 (
        .y(_T_4022),
        .a(_T_4000),
        .b(1'h1)
    );
    wire _T_4023;
    TAIL #(.width(2), .n(1)) tail_1066 (
        .y(_T_4023),
        .in(_T_4022)
    );
    wire [63:0] _T_4078_0_real_node;
    wire [63:0] _T_4078_0_imaginary_node;
    wire [63:0] _T_4078_1_real_node;
    wire [63:0] _T_4078_1_imaginary_node;
    wire _node_918;
    EQ_UNSIGNED #(.width(1)) u_eq_1067 (
        .y(_node_918),
        .a(1'd0),
        .b(_T_4002)
    );
    wire [63:0] _node_919;
    assign _node_919 = _T_3959_0_imaginary_node;
    wire _node_920;
    EQ_UNSIGNED #(.width(1)) u_eq_1068 (
        .y(_node_920),
        .a(1'd1),
        .b(_T_4002)
    );
    wire [63:0] _node_921;
    MUX_UNSIGNED #(.width(64)) u_mux_1069 (
        .y(_node_921),
        .sel(_node_920),
        .a(_T_3959_1_imaginary_node),
        .b(_node_919)
    );
    wire _node_922;
    EQ_UNSIGNED #(.width(1)) u_eq_1070 (
        .y(_node_922),
        .a(1'd0),
        .b(_T_4002)
    );
    wire [63:0] _node_923;
    assign _node_923 = _T_3959_0_real_node;
    wire _node_924;
    EQ_UNSIGNED #(.width(1)) u_eq_1071 (
        .y(_node_924),
        .a(1'd1),
        .b(_T_4002)
    );
    wire [63:0] _node_925;
    MUX_UNSIGNED #(.width(64)) u_mux_1072 (
        .y(_node_925),
        .sel(_node_924),
        .a(_T_3959_1_real_node),
        .b(_node_923)
    );
    wire _node_926;
    EQ_UNSIGNED #(.width(1)) u_eq_1073 (
        .y(_node_926),
        .a(1'd0),
        .b(_T_4020)
    );
    wire [63:0] _node_927;
    assign _node_927 = _T_3959_0_imaginary_node;
    wire _node_928;
    EQ_UNSIGNED #(.width(1)) u_eq_1074 (
        .y(_node_928),
        .a(1'd1),
        .b(_T_4020)
    );
    wire [63:0] _node_929;
    MUX_UNSIGNED #(.width(64)) u_mux_1075 (
        .y(_node_929),
        .sel(_node_928),
        .a(_T_3959_1_imaginary_node),
        .b(_node_927)
    );
    wire _node_930;
    EQ_UNSIGNED #(.width(1)) u_eq_1076 (
        .y(_node_930),
        .a(1'd0),
        .b(_T_4020)
    );
    wire [63:0] _node_931;
    assign _node_931 = _T_3959_0_real_node;
    wire _node_932;
    EQ_UNSIGNED #(.width(1)) u_eq_1077 (
        .y(_node_932),
        .a(1'd1),
        .b(_T_4020)
    );
    wire [63:0] _node_933;
    MUX_UNSIGNED #(.width(64)) u_mux_1078 (
        .y(_node_933),
        .sel(_node_932),
        .a(_T_3959_1_real_node),
        .b(_node_931)
    );
    wire _T_4133_real_node__T_4144_clk;
    wire _T_4133_real_node__T_4144_en;
    wire _T_4133_real_node__T_4144_mask;
    wire _T_4133_real_node__T_4144_addr;
    wire [63:0] _T_4133_real_node__T_4144_data;
    wire [63:0] _T_4133_real_node__T_4152_data;
    wire _T_4133_real_node__T_4152_clk;
    wire _T_4133_real_node__T_4152_en;
    wire _T_4133_real_node__T_4152_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4133_real_node (
        .read_data(_T_4133_real_node__T_4152_data),
        .read_clk(_T_4133_real_node__T_4152_clk),
        .read_en(_T_4133_real_node__T_4152_en),
        .read_addr(_T_4133_real_node__T_4152_addr),
        .write_clk(_T_4133_real_node__T_4144_clk),
        .write_en(_T_4133_real_node__T_4144_en),
        .write_mask(_T_4133_real_node__T_4144_mask),
        .write_addr(_T_4133_real_node__T_4144_addr),
        .write_data(_T_4133_real_node__T_4144_data)
    );
    wire _T_4133_imaginary_node__T_4144_clk;
    wire _T_4133_imaginary_node__T_4144_en;
    wire _T_4133_imaginary_node__T_4144_mask;
    wire _T_4133_imaginary_node__T_4144_addr;
    wire [63:0] _T_4133_imaginary_node__T_4144_data;
    wire [63:0] _T_4133_imaginary_node__T_4152_data;
    wire _T_4133_imaginary_node__T_4152_clk;
    wire _T_4133_imaginary_node__T_4152_en;
    wire _T_4133_imaginary_node__T_4152_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4133_imaginary_node (
        .read_data(_T_4133_imaginary_node__T_4152_data),
        .read_clk(_T_4133_imaginary_node__T_4152_clk),
        .read_en(_T_4133_imaginary_node__T_4152_en),
        .read_addr(_T_4133_imaginary_node__T_4152_addr),
        .write_clk(_T_4133_imaginary_node__T_4144_clk),
        .write_en(_T_4133_imaginary_node__T_4144_en),
        .write_mask(_T_4133_imaginary_node__T_4144_mask),
        .write_addr(_T_4133_imaginary_node__T_4144_addr),
        .write_data(_T_4133_imaginary_node__T_4144_data)
    );
    wire _T_4136;
    BITWISEAND #(.width(1)) bitwiseand_1079 (
        .y(_T_4136),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4133_real_node__T_4144_addr = 1'h0;
    assign _T_4133_real_node__T_4144_en = io_in_valid;
    assign _T_4133_real_node__T_4144_clk = clock;
    assign _T_4133_imaginary_node__T_4144_addr = 1'h0;
    assign _T_4133_imaginary_node__T_4144_en = io_in_valid;
    assign _T_4133_imaginary_node__T_4144_clk = clock;
    assign _T_4133_imaginary_node__T_4144_mask = 1'h1;
    assign _T_4133_real_node__T_4144_mask = 1'h1;
    assign _T_4133_real_node__T_4152_addr = 1'h0;
    assign _T_4133_real_node__T_4152_en = 1'h1;
    assign _T_4133_real_node__T_4152_clk = clock;
    assign _T_4133_imaginary_node__T_4152_addr = 1'h0;
    assign _T_4133_imaginary_node__T_4152_en = 1'h1;
    assign _T_4133_imaginary_node__T_4152_clk = clock;
    wire _T_4167_real_node__T_4178_clk;
    wire _T_4167_real_node__T_4178_en;
    wire _T_4167_real_node__T_4178_mask;
    wire _T_4167_real_node__T_4178_addr;
    wire [63:0] _T_4167_real_node__T_4178_data;
    wire [63:0] _T_4167_real_node__T_4186_data;
    wire _T_4167_real_node__T_4186_clk;
    wire _T_4167_real_node__T_4186_en;
    wire _T_4167_real_node__T_4186_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4167_real_node (
        .read_data(_T_4167_real_node__T_4186_data),
        .read_clk(_T_4167_real_node__T_4186_clk),
        .read_en(_T_4167_real_node__T_4186_en),
        .read_addr(_T_4167_real_node__T_4186_addr),
        .write_clk(_T_4167_real_node__T_4178_clk),
        .write_en(_T_4167_real_node__T_4178_en),
        .write_mask(_T_4167_real_node__T_4178_mask),
        .write_addr(_T_4167_real_node__T_4178_addr),
        .write_data(_T_4167_real_node__T_4178_data)
    );
    wire _T_4167_imaginary_node__T_4178_clk;
    wire _T_4167_imaginary_node__T_4178_en;
    wire _T_4167_imaginary_node__T_4178_mask;
    wire _T_4167_imaginary_node__T_4178_addr;
    wire [63:0] _T_4167_imaginary_node__T_4178_data;
    wire [63:0] _T_4167_imaginary_node__T_4186_data;
    wire _T_4167_imaginary_node__T_4186_clk;
    wire _T_4167_imaginary_node__T_4186_en;
    wire _T_4167_imaginary_node__T_4186_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4167_imaginary_node (
        .read_data(_T_4167_imaginary_node__T_4186_data),
        .read_clk(_T_4167_imaginary_node__T_4186_clk),
        .read_en(_T_4167_imaginary_node__T_4186_en),
        .read_addr(_T_4167_imaginary_node__T_4186_addr),
        .write_clk(_T_4167_imaginary_node__T_4178_clk),
        .write_en(_T_4167_imaginary_node__T_4178_en),
        .write_mask(_T_4167_imaginary_node__T_4178_mask),
        .write_addr(_T_4167_imaginary_node__T_4178_addr),
        .write_data(_T_4167_imaginary_node__T_4178_data)
    );
    wire _T_4170;
    BITWISEAND #(.width(1)) bitwiseand_1080 (
        .y(_T_4170),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4167_real_node__T_4178_addr = 1'h0;
    assign _T_4167_real_node__T_4178_en = io_in_valid;
    assign _T_4167_real_node__T_4178_clk = clock;
    assign _T_4167_imaginary_node__T_4178_addr = 1'h0;
    assign _T_4167_imaginary_node__T_4178_en = io_in_valid;
    assign _T_4167_imaginary_node__T_4178_clk = clock;
    assign _T_4167_imaginary_node__T_4178_mask = 1'h1;
    assign _T_4167_real_node__T_4178_mask = 1'h1;
    assign _T_4167_real_node__T_4186_addr = 1'h0;
    assign _T_4167_real_node__T_4186_en = 1'h1;
    assign _T_4167_real_node__T_4186_clk = clock;
    assign _T_4167_imaginary_node__T_4186_addr = 1'h0;
    assign _T_4167_imaginary_node__T_4186_en = 1'h1;
    assign _T_4167_imaginary_node__T_4186_clk = clock;
    wire [63:0] _T_4228_0_real_node;
    wire [63:0] _T_4228_0_imaginary_node;
    wire [63:0] _T_4228_1_real_node;
    wire [63:0] _T_4228_1_imaginary_node;
    wire _T_4269;
    BITS #(.width(1), .high(0), .low(0)) bits_1081 (
        .y(_T_4269),
        .in(sync_1)
    );
    wire _T_4271;
    wire [1:0] _T_4273;
    ADD_UNSIGNED #(.width(1)) u_add_1082 (
        .y(_T_4273),
        .a(_T_4269),
        .b(1'h0)
    );
    wire _T_4274;
    TAIL #(.width(2), .n(1)) tail_1083 (
        .y(_T_4274),
        .in(_T_4273)
    );
    wire _T_4289;
    wire [1:0] _T_4291;
    ADD_UNSIGNED #(.width(1)) u_add_1084 (
        .y(_T_4291),
        .a(_T_4269),
        .b(1'h1)
    );
    wire _T_4292;
    TAIL #(.width(2), .n(1)) tail_1085 (
        .y(_T_4292),
        .in(_T_4291)
    );
    wire [63:0] _T_4347_0_real_node;
    wire [63:0] _T_4347_0_imaginary_node;
    wire [63:0] _T_4347_1_real_node;
    wire [63:0] _T_4347_1_imaginary_node;
    wire _node_934;
    EQ_UNSIGNED #(.width(1)) u_eq_1086 (
        .y(_node_934),
        .a(1'd0),
        .b(_T_4271)
    );
    wire [63:0] _node_935;
    assign _node_935 = _T_4228_0_imaginary_node;
    wire _node_936;
    EQ_UNSIGNED #(.width(1)) u_eq_1087 (
        .y(_node_936),
        .a(1'd1),
        .b(_T_4271)
    );
    wire [63:0] _node_937;
    MUX_UNSIGNED #(.width(64)) u_mux_1088 (
        .y(_node_937),
        .sel(_node_936),
        .a(_T_4228_1_imaginary_node),
        .b(_node_935)
    );
    wire _node_938;
    EQ_UNSIGNED #(.width(1)) u_eq_1089 (
        .y(_node_938),
        .a(1'd0),
        .b(_T_4271)
    );
    wire [63:0] _node_939;
    assign _node_939 = _T_4228_0_real_node;
    wire _node_940;
    EQ_UNSIGNED #(.width(1)) u_eq_1090 (
        .y(_node_940),
        .a(1'd1),
        .b(_T_4271)
    );
    wire [63:0] _node_941;
    MUX_UNSIGNED #(.width(64)) u_mux_1091 (
        .y(_node_941),
        .sel(_node_940),
        .a(_T_4228_1_real_node),
        .b(_node_939)
    );
    wire _node_942;
    EQ_UNSIGNED #(.width(1)) u_eq_1092 (
        .y(_node_942),
        .a(1'd0),
        .b(_T_4289)
    );
    wire [63:0] _node_943;
    assign _node_943 = _T_4228_0_imaginary_node;
    wire _node_944;
    EQ_UNSIGNED #(.width(1)) u_eq_1093 (
        .y(_node_944),
        .a(1'd1),
        .b(_T_4289)
    );
    wire [63:0] _node_945;
    MUX_UNSIGNED #(.width(64)) u_mux_1094 (
        .y(_node_945),
        .sel(_node_944),
        .a(_T_4228_1_imaginary_node),
        .b(_node_943)
    );
    wire _node_946;
    EQ_UNSIGNED #(.width(1)) u_eq_1095 (
        .y(_node_946),
        .a(1'd0),
        .b(_T_4289)
    );
    wire [63:0] _node_947;
    assign _node_947 = _T_4228_0_real_node;
    wire _node_948;
    EQ_UNSIGNED #(.width(1)) u_eq_1096 (
        .y(_node_948),
        .a(1'd1),
        .b(_T_4289)
    );
    wire [63:0] _node_949;
    MUX_UNSIGNED #(.width(64)) u_mux_1097 (
        .y(_node_949),
        .sel(_node_948),
        .a(_T_4228_1_real_node),
        .b(_node_947)
    );
    wire _T_4402_real_node__T_4413_clk;
    wire _T_4402_real_node__T_4413_en;
    wire _T_4402_real_node__T_4413_mask;
    wire _T_4402_real_node__T_4413_addr;
    wire [63:0] _T_4402_real_node__T_4413_data;
    wire [63:0] _T_4402_real_node__T_4421_data;
    wire _T_4402_real_node__T_4421_clk;
    wire _T_4402_real_node__T_4421_en;
    wire _T_4402_real_node__T_4421_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4402_real_node (
        .read_data(_T_4402_real_node__T_4421_data),
        .read_clk(_T_4402_real_node__T_4421_clk),
        .read_en(_T_4402_real_node__T_4421_en),
        .read_addr(_T_4402_real_node__T_4421_addr),
        .write_clk(_T_4402_real_node__T_4413_clk),
        .write_en(_T_4402_real_node__T_4413_en),
        .write_mask(_T_4402_real_node__T_4413_mask),
        .write_addr(_T_4402_real_node__T_4413_addr),
        .write_data(_T_4402_real_node__T_4413_data)
    );
    wire _T_4402_imaginary_node__T_4413_clk;
    wire _T_4402_imaginary_node__T_4413_en;
    wire _T_4402_imaginary_node__T_4413_mask;
    wire _T_4402_imaginary_node__T_4413_addr;
    wire [63:0] _T_4402_imaginary_node__T_4413_data;
    wire [63:0] _T_4402_imaginary_node__T_4421_data;
    wire _T_4402_imaginary_node__T_4421_clk;
    wire _T_4402_imaginary_node__T_4421_en;
    wire _T_4402_imaginary_node__T_4421_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4402_imaginary_node (
        .read_data(_T_4402_imaginary_node__T_4421_data),
        .read_clk(_T_4402_imaginary_node__T_4421_clk),
        .read_en(_T_4402_imaginary_node__T_4421_en),
        .read_addr(_T_4402_imaginary_node__T_4421_addr),
        .write_clk(_T_4402_imaginary_node__T_4413_clk),
        .write_en(_T_4402_imaginary_node__T_4413_en),
        .write_mask(_T_4402_imaginary_node__T_4413_mask),
        .write_addr(_T_4402_imaginary_node__T_4413_addr),
        .write_data(_T_4402_imaginary_node__T_4413_data)
    );
    wire _T_4405;
    BITWISEAND #(.width(1)) bitwiseand_1098 (
        .y(_T_4405),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4402_real_node__T_4413_addr = 1'h0;
    assign _T_4402_real_node__T_4413_en = io_in_valid;
    assign _T_4402_real_node__T_4413_clk = clock;
    assign _T_4402_imaginary_node__T_4413_addr = 1'h0;
    assign _T_4402_imaginary_node__T_4413_en = io_in_valid;
    assign _T_4402_imaginary_node__T_4413_clk = clock;
    assign _T_4402_imaginary_node__T_4413_mask = 1'h1;
    assign _T_4402_real_node__T_4413_mask = 1'h1;
    assign _T_4402_real_node__T_4421_addr = 1'h0;
    assign _T_4402_real_node__T_4421_en = 1'h1;
    assign _T_4402_real_node__T_4421_clk = clock;
    assign _T_4402_imaginary_node__T_4421_addr = 1'h0;
    assign _T_4402_imaginary_node__T_4421_en = 1'h1;
    assign _T_4402_imaginary_node__T_4421_clk = clock;
    assign _BBFAdd_72_1__in1 = _T_1922_node;
    assign _BBFAdd_72_1__in2 = _T_1941_node;
    assign _BBFAdd_73_1__in1 = _T_1953_node;
    assign _BBFAdd_73_1__in2 = _T_1959_node;
    assign _BBFAdd_74_1__in1 = _T_1899_real_node__T_1918_data;
    assign _BBFAdd_74_1__in2 = _T_1981_real_node;
    assign _BBFAdd_75_1__in1 = _T_1899_imaginary_node__T_1918_data;
    assign _BBFAdd_75_1__in2 = _T_1981_imaginary_node;
    assign _BBFAdd_76_1__in1 = _T_1899_real_node__T_1918_data;
    assign _BBFAdd_76_1__in2 = _T_2047_real_node;
    assign _BBFAdd_77_1__in1 = _T_1899_imaginary_node__T_1918_data;
    assign _BBFAdd_77_1__in2 = _T_2047_imaginary_node;
    assign _BBFAdd_78_1__in1 = _T_2346_node;
    assign _BBFAdd_78_1__in2 = _T_2365_node;
    assign _BBFAdd_79_1__in1 = _T_2377_node;
    assign _BBFAdd_79_1__in2 = _T_2383_node;
    assign _BBFAdd_80_1__in1 = _T_2323_real_node__T_2342_data;
    assign _BBFAdd_80_1__in2 = _T_2405_real_node;
    assign _BBFAdd_81_1__in1 = _T_2323_imaginary_node__T_2342_data;
    assign _BBFAdd_81_1__in2 = _T_2405_imaginary_node;
    assign _BBFAdd_82_1__in1 = _T_2323_real_node__T_2342_data;
    assign _BBFAdd_82_1__in2 = _T_2471_real_node;
    assign _BBFAdd_83_1__in1 = _T_2323_imaginary_node__T_2342_data;
    assign _BBFAdd_83_1__in2 = _T_2471_imaginary_node;
    assign _BBFAdd_84_1__in1 = _T_2770_node;
    assign _BBFAdd_84_1__in2 = _T_2789_node;
    assign _BBFAdd_85_1__in1 = _T_2801_node;
    assign _BBFAdd_85_1__in2 = _T_2807_node;
    assign _BBFAdd_86_1__in1 = _T_2747_real_node__T_2766_data;
    assign _BBFAdd_86_1__in2 = _T_2829_real_node;
    assign _BBFAdd_87_1__in1 = _T_2747_imaginary_node__T_2766_data;
    assign _BBFAdd_87_1__in2 = _T_2829_imaginary_node;
    assign _BBFAdd_88_1__in1 = _T_2747_real_node__T_2766_data;
    assign _BBFAdd_88_1__in2 = _T_2895_real_node;
    assign _BBFAdd_89_1__in1 = _T_2747_imaginary_node__T_2766_data;
    assign _BBFAdd_89_1__in2 = _T_2895_imaginary_node;
    assign _BBFAdd_90_1__in1 = _T_3194_node;
    assign _BBFAdd_90_1__in2 = _T_3213_node;
    assign _BBFAdd_91_1__in1 = _T_3225_node;
    assign _BBFAdd_91_1__in2 = _T_3231_node;
    assign _BBFAdd_92_1__in1 = _T_3171_real_node__T_3190_data;
    assign _BBFAdd_92_1__in2 = _T_3253_real_node;
    assign _BBFAdd_93_1__in1 = _T_3171_imaginary_node__T_3190_data;
    assign _BBFAdd_93_1__in2 = _T_3253_imaginary_node;
    assign _BBFAdd_94_1__in1 = _T_3171_real_node__T_3190_data;
    assign _BBFAdd_94_1__in2 = _T_3319_real_node;
    assign _BBFAdd_95_1__in1 = _T_3171_imaginary_node__T_3190_data;
    assign _BBFAdd_95_1__in2 = _T_3319_imaginary_node;
    assign _BBFMultiply_48_1__in1 = _T_1844_1_real_node;
    assign _BBFMultiply_48_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_49_1__in1 = _T_1844_1_imaginary_node;
    assign _BBFMultiply_49_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_50_1__in1 = _T_1844_1_real_node;
    assign _BBFMultiply_50_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_51_1__in1 = _T_1844_1_imaginary_node;
    assign _BBFMultiply_51_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_52_1__in1 = _T_2268_1_real_node;
    assign _BBFMultiply_52_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_53_1__in1 = _T_2268_1_imaginary_node;
    assign _BBFMultiply_53_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_54_1__in1 = _T_2268_1_real_node;
    assign _BBFMultiply_54_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_55_1__in1 = _T_2268_1_imaginary_node;
    assign _BBFMultiply_55_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_56_1__in1 = _T_2692_1_real_node;
    assign _BBFMultiply_56_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_57_1__in1 = _T_2692_1_imaginary_node;
    assign _BBFMultiply_57_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_58_1__in1 = _T_2692_1_real_node;
    assign _BBFMultiply_58_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_59_1__in1 = _T_2692_1_imaginary_node;
    assign _BBFMultiply_59_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_60_1__in1 = _T_3116_1_real_node;
    assign _BBFMultiply_60_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_61_1__in1 = _T_3116_1_imaginary_node;
    assign _BBFMultiply_61_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_62_1__in1 = _T_3116_1_real_node;
    assign _BBFMultiply_62_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_63_1__in1 = _T_3116_1_imaginary_node;
    assign _BBFMultiply_63_1__in2 = twiddle_0_real_node;
    assign _BBFSubtract_43_1__in1 = _T_1934_node;
    assign _BBFSubtract_43_1__in2 = _T_1928_node;
    assign _BBFSubtract_44_1__in1 = _T_2011_node;
    assign _BBFSubtract_44_1__in2 = _T_1981_real_node;
    assign _BBFSubtract_45_1__in1 = _T_2024_node;
    assign _BBFSubtract_45_1__in2 = _T_1981_imaginary_node;
    assign _BBFSubtract_46_1__in1 = _T_2358_node;
    assign _BBFSubtract_46_1__in2 = _T_2352_node;
    assign _BBFSubtract_47_1__in1 = _T_2435_node;
    assign _BBFSubtract_47_1__in2 = _T_2405_real_node;
    assign _BBFSubtract_48_1__in1 = _T_2448_node;
    assign _BBFSubtract_48_1__in2 = _T_2405_imaginary_node;
    assign _BBFSubtract_49_1__in1 = _T_2782_node;
    assign _BBFSubtract_49_1__in2 = _T_2776_node;
    assign _BBFSubtract_50_1__in1 = _T_2859_node;
    assign _BBFSubtract_50_1__in2 = _T_2829_real_node;
    assign _BBFSubtract_51_1__in1 = _T_2872_node;
    assign _BBFSubtract_51_1__in2 = _T_2829_imaginary_node;
    assign _BBFSubtract_52_1__in1 = _T_3206_node;
    assign _BBFSubtract_52_1__in2 = _T_3200_node;
    assign _BBFSubtract_53_1__in1 = _T_3283_node;
    assign _BBFSubtract_53_1__in2 = _T_3253_real_node;
    assign _BBFSubtract_54_1__in1 = _T_3296_node;
    assign _BBFSubtract_54_1__in2 = _T_3253_imaginary_node;
    assign _T_1005_node = 64'h0;
    assign _T_1012_node = 64'h0;
    assign _T_1032_node = 64'h0;
    assign _T_1039_node = 64'h0;
    assign _T_1059_node = 64'h0;
    assign _T_1066_node = 64'h0;
    assign _T_1086_node = 64'h0;
    assign _T_1093_node = 64'h0;
    assign _T_1113_node = 64'h0;
    assign _T_1120_node = 64'h0;
    assign _T_1140_node = 64'h0;
    assign _T_1147_node = 64'h0;
    assign _T_1167_node = 64'h0;
    assign _T_1174_node = 64'h0;
    assign _T_1194_node = 64'h0;
    assign _T_12_node = 64'h0;
    assign _T_1201_node = 64'h0;
    assign _T_1221_node = 64'h0;
    assign _T_1228_node = 64'h0;
    assign _T_1248_node = 64'h0;
    assign _T_1255_node = 64'h0;
    assign _T_1275_node = 64'h0;
    assign _T_1282_node = 64'h0;
    assign _T_1302_node = 64'h0;
    assign _T_1309_node = 64'h0;
    assign _T_1329_node = 64'h0;
    assign _T_1336_node = 64'h0;
    assign _T_1356_node = 64'h0;
    assign _T_1363_node = 64'h0;
    assign _T_1383_node = 64'h0;
    assign _T_1390_node = 64'h0;
    assign _T_1410_node = 64'h0;
    assign _T_1417_node = 64'h0;
    assign _T_1437_node = 64'h0;
    assign _T_1444_node = 64'h0;
    assign _T_1464_node = 64'h0;
    assign _T_1471_node = 64'h0;
    assign _T_1491_node = 64'h0;
    assign _T_1498_node = 64'h0;
    assign _T_1518_node = 64'h0;
    assign _T_1525_node = 64'h0;
    assign _T_1545_node = 64'h0;
    assign _T_1552_node = 64'h0;
    assign _T_1572_node = 64'h0;
    assign _T_1579_node = 64'h0;
    assign _T_1599_node = 64'h0;
    assign _T_1606_node = 64'h0;
    assign _T_1626_node = 64'h0;
    assign _T_1633_node = 64'h0;
    assign _T_1664_imaginary_node__T_1675_data = stage_outputs_0_1_imaginary_node;
    assign _T_1664_real_node__T_1675_data = stage_outputs_0_1_real_node;
    assign _T_1725_0_imaginary_node = stage_outputs_0_0_imaginary_node;
    assign _T_1725_0_real_node = stage_outputs_0_0_real_node;
    assign _T_1725_1_imaginary_node = _T_1664_imaginary_node__T_1683_data;
    assign _T_1725_1_real_node = _T_1664_real_node__T_1683_data;
    assign _T_1768 = _T_1771;
    assign _T_1786 = _T_1789;
    assign _T_1844_0_imaginary_node = _node_825;
    assign _T_1844_0_real_node = _node_829;
    assign _T_1844_1_imaginary_node = _node_833;
    assign _T_1844_1_real_node = _node_837;
    assign _T_1899_imaginary_node__T_1910_data = _T_1844_0_imaginary_node;
    assign _T_1899_real_node__T_1910_data = _T_1844_0_real_node;
    assign _T_1922_node = _BBFMultiply_48_1__out;
    assign _T_1928_node = _BBFMultiply_49_1__out;
    assign _T_1934_node = 64'h0;
    assign _T_1941_node = _BBFSubtract_43_1__out;
    assign _T_1947_node = _BBFAdd_72_1__out;
    assign _T_1953_node = _BBFMultiply_50_1__out;
    assign _T_1959_node = _BBFMultiply_51_1__out;
    assign _T_1965_node = _BBFAdd_73_1__out;
    assign _T_1981_imaginary_node = _T_1965_node;
    assign _T_1981_real_node = _T_1947_node;
    assign _T_1985_node = _BBFAdd_74_1__out;
    assign _T_1991_node = _BBFAdd_75_1__out;
    assign _T_2007_imaginary_node = _T_1991_node;
    assign _T_2007_real_node = _T_1985_node;
    assign _T_2011_node = 64'h0;
    assign _T_2018_node = _BBFSubtract_44_1__out;
    assign _T_2024_node = 64'h0;
    assign _T_2031_node = _BBFSubtract_45_1__out;
    assign _T_2047_imaginary_node = _T_2031_node;
    assign _T_2047_real_node = _T_2018_node;
    assign _T_2051_node = _BBFAdd_76_1__out;
    assign _T_2057_node = _BBFAdd_77_1__out;
    assign _T_2073_imaginary_node = _T_2057_node;
    assign _T_2073_real_node = _T_2051_node;
    assign _T_2088_imaginary_node__T_2099_data = stage_outputs_0_3_imaginary_node;
    assign _T_2088_real_node__T_2099_data = stage_outputs_0_3_real_node;
    assign _T_2149_0_imaginary_node = stage_outputs_0_2_imaginary_node;
    assign _T_2149_0_real_node = stage_outputs_0_2_real_node;
    assign _T_2149_1_imaginary_node = _T_2088_imaginary_node__T_2107_data;
    assign _T_2149_1_real_node = _T_2088_real_node__T_2107_data;
    assign _T_2192 = _T_2195;
    assign _T_2210 = _T_2213;
    assign _T_2268_0_imaginary_node = _node_841;
    assign _T_2268_0_real_node = _node_845;
    assign _T_2268_1_imaginary_node = _node_849;
    assign _T_2268_1_real_node = _node_853;
    assign _T_2323_imaginary_node__T_2334_data = _T_2268_0_imaginary_node;
    assign _T_2323_real_node__T_2334_data = _T_2268_0_real_node;
    assign _T_2346_node = _BBFMultiply_52_1__out;
    assign _T_2352_node = _BBFMultiply_53_1__out;
    assign _T_2358_node = 64'h0;
    assign _T_2365_node = _BBFSubtract_46_1__out;
    assign _T_2371_node = _BBFAdd_78_1__out;
    assign _T_2377_node = _BBFMultiply_54_1__out;
    assign _T_2383_node = _BBFMultiply_55_1__out;
    assign _T_2389_node = _BBFAdd_79_1__out;
    assign _T_2405_imaginary_node = _T_2389_node;
    assign _T_2405_real_node = _T_2371_node;
    assign _T_2409_node = _BBFAdd_80_1__out;
    assign _T_2415_node = _BBFAdd_81_1__out;
    assign _T_2431_imaginary_node = _T_2415_node;
    assign _T_2431_real_node = _T_2409_node;
    assign _T_2435_node = 64'h0;
    assign _T_2442_node = _BBFSubtract_47_1__out;
    assign _T_2448_node = 64'h0;
    assign _T_2455_node = _BBFSubtract_48_1__out;
    assign _T_2471_imaginary_node = _T_2455_node;
    assign _T_2471_real_node = _T_2442_node;
    assign _T_2475_node = _BBFAdd_82_1__out;
    assign _T_2481_node = _BBFAdd_83_1__out;
    assign _T_2497_imaginary_node = _T_2481_node;
    assign _T_2497_real_node = _T_2475_node;
    assign _T_2512_imaginary_node__T_2523_data = stage_outputs_0_5_imaginary_node;
    assign _T_2512_real_node__T_2523_data = stage_outputs_0_5_real_node;
    assign _T_2573_0_imaginary_node = stage_outputs_0_4_imaginary_node;
    assign _T_2573_0_real_node = stage_outputs_0_4_real_node;
    assign _T_2573_1_imaginary_node = _T_2512_imaginary_node__T_2531_data;
    assign _T_2573_1_real_node = _T_2512_real_node__T_2531_data;
    assign _T_2616 = _T_2619;
    assign _T_2634 = _T_2637;
    assign _T_2692_0_imaginary_node = _node_857;
    assign _T_2692_0_real_node = _node_861;
    assign _T_2692_1_imaginary_node = _node_865;
    assign _T_2692_1_real_node = _node_869;
    assign _T_2747_imaginary_node__T_2758_data = _T_2692_0_imaginary_node;
    assign _T_2747_real_node__T_2758_data = _T_2692_0_real_node;
    assign _T_2770_node = _BBFMultiply_56_1__out;
    assign _T_2776_node = _BBFMultiply_57_1__out;
    assign _T_2782_node = 64'h0;
    assign _T_2789_node = _BBFSubtract_49_1__out;
    assign _T_2795_node = _BBFAdd_84_1__out;
    assign _T_2801_node = _BBFMultiply_58_1__out;
    assign _T_2807_node = _BBFMultiply_59_1__out;
    assign _T_2813_node = _BBFAdd_85_1__out;
    assign _T_2829_imaginary_node = _T_2813_node;
    assign _T_2829_real_node = _T_2795_node;
    assign _T_2833_node = _BBFAdd_86_1__out;
    assign _T_2839_node = _BBFAdd_87_1__out;
    assign _T_2855_imaginary_node = _T_2839_node;
    assign _T_2855_real_node = _T_2833_node;
    assign _T_2859_node = 64'h0;
    assign _T_2866_node = _BBFSubtract_50_1__out;
    assign _T_2872_node = 64'h0;
    assign _T_2879_node = _BBFSubtract_51_1__out;
    assign _T_2895_imaginary_node = _T_2879_node;
    assign _T_2895_real_node = _T_2866_node;
    assign _T_2899_node = _BBFAdd_88_1__out;
    assign _T_2905_node = _BBFAdd_89_1__out;
    assign _T_2921_imaginary_node = _T_2905_node;
    assign _T_2921_real_node = _T_2899_node;
    assign _T_2936_imaginary_node__T_2947_data = stage_outputs_0_7_imaginary_node;
    assign _T_2936_real_node__T_2947_data = stage_outputs_0_7_real_node;
    assign _T_2997_0_imaginary_node = stage_outputs_0_6_imaginary_node;
    assign _T_2997_0_real_node = stage_outputs_0_6_real_node;
    assign _T_2997_1_imaginary_node = _T_2936_imaginary_node__T_2955_data;
    assign _T_2997_1_real_node = _T_2936_real_node__T_2955_data;
    assign _T_3040 = _T_3043;
    assign _T_3058 = _T_3061;
    assign _T_3116_0_imaginary_node = _node_873;
    assign _T_3116_0_real_node = _node_877;
    assign _T_3116_1_imaginary_node = _node_881;
    assign _T_3116_1_real_node = _node_885;
    assign _T_316_node = 64'h0;
    assign _T_3171_imaginary_node__T_3182_data = _T_3116_0_imaginary_node;
    assign _T_3171_real_node__T_3182_data = _T_3116_0_real_node;
    assign _T_3194_node = _BBFMultiply_60_1__out;
    assign _T_3200_node = _BBFMultiply_61_1__out;
    assign _T_3206_node = 64'h0;
    assign _T_3213_node = _BBFSubtract_52_1__out;
    assign _T_3219_node = _BBFAdd_90_1__out;
    assign _T_3225_node = _BBFMultiply_62_1__out;
    assign _T_323_node = 64'h0;
    assign _T_3231_node = _BBFMultiply_63_1__out;
    assign _T_3237_node = _BBFAdd_91_1__out;
    assign _T_3253_imaginary_node = _T_3237_node;
    assign _T_3253_real_node = _T_3219_node;
    assign _T_3257_node = _BBFAdd_92_1__out;
    assign _T_3263_node = _BBFAdd_93_1__out;
    assign _T_3279_imaginary_node = _T_3263_node;
    assign _T_3279_real_node = _T_3257_node;
    assign _T_3283_node = 64'h0;
    assign _T_3290_node = _BBFSubtract_53_1__out;
    assign _T_3296_node = 64'h0;
    assign _T_3303_node = _BBFSubtract_54_1__out;
    assign _T_3319_imaginary_node = _T_3303_node;
    assign _T_3319_real_node = _T_3290_node;
    assign _T_3323_node = _BBFAdd_94_1__out;
    assign _T_3329_node = _BBFAdd_95_1__out;
    assign _T_3345_imaginary_node = _T_3329_node;
    assign _T_3345_real_node = _T_3323_node;
    assign _T_3360_imaginary_node__T_3371_data = stage_outputs_1_1_imaginary_node;
    assign _T_3360_real_node__T_3371_data = stage_outputs_1_1_real_node;
    assign _T_3421_0_imaginary_node = stage_outputs_1_0_imaginary_node;
    assign _T_3421_0_real_node = stage_outputs_1_0_real_node;
    assign _T_3421_1_imaginary_node = _T_3360_imaginary_node__T_3379_data;
    assign _T_3421_1_real_node = _T_3360_real_node__T_3379_data;
    assign _T_3464 = _T_3467;
    assign _T_3482 = _T_3485;
    assign _T_3540_0_imaginary_node = _node_889;
    assign _T_3540_0_real_node = _node_893;
    assign _T_3540_1_imaginary_node = _node_897;
    assign _T_3540_1_real_node = _node_901;
    assign _T_3595_imaginary_node__T_3606_data = _T_3540_0_imaginary_node;
    assign _T_3595_real_node__T_3606_data = _T_3540_0_real_node;
    assign _T_3629_imaginary_node__T_3640_data = stage_outputs_1_3_imaginary_node;
    assign _T_3629_real_node__T_3640_data = stage_outputs_1_3_real_node;
    assign _T_3690_0_imaginary_node = stage_outputs_1_2_imaginary_node;
    assign _T_3690_0_real_node = stage_outputs_1_2_real_node;
    assign _T_3690_1_imaginary_node = _T_3629_imaginary_node__T_3648_data;
    assign _T_3690_1_real_node = _T_3629_real_node__T_3648_data;
    assign _T_3733 = _T_3736;
    assign _T_3751 = _T_3754;
    assign _T_3809_0_imaginary_node = _node_905;
    assign _T_3809_0_real_node = _node_909;
    assign _T_3809_1_imaginary_node = _node_913;
    assign _T_3809_1_real_node = _node_917;
    assign _T_3864_imaginary_node__T_3875_data = _T_3809_0_imaginary_node;
    assign _T_3864_real_node__T_3875_data = _T_3809_0_real_node;
    assign _T_3898_imaginary_node__T_3909_data = stage_outputs_1_5_imaginary_node;
    assign _T_3898_real_node__T_3909_data = stage_outputs_1_5_real_node;
    assign _T_3959_0_imaginary_node = stage_outputs_1_4_imaginary_node;
    assign _T_3959_0_real_node = stage_outputs_1_4_real_node;
    assign _T_3959_1_imaginary_node = _T_3898_imaginary_node__T_3917_data;
    assign _T_3959_1_real_node = _T_3898_real_node__T_3917_data;
    assign _T_4002 = _T_4005;
    assign _T_4020 = _T_4023;
    assign _T_4078_0_imaginary_node = _node_921;
    assign _T_4078_0_real_node = _node_925;
    assign _T_4078_1_imaginary_node = _node_929;
    assign _T_4078_1_real_node = _node_933;
    assign _T_4133_imaginary_node__T_4144_data = _T_4078_0_imaginary_node;
    assign _T_4133_real_node__T_4144_data = _T_4078_0_real_node;
    assign _T_4167_imaginary_node__T_4178_data = stage_outputs_1_7_imaginary_node;
    assign _T_4167_real_node__T_4178_data = stage_outputs_1_7_real_node;
    assign _T_4228_0_imaginary_node = stage_outputs_1_6_imaginary_node;
    assign _T_4228_0_real_node = stage_outputs_1_6_real_node;
    assign _T_4228_1_imaginary_node = _T_4167_imaginary_node__T_4186_data;
    assign _T_4228_1_real_node = _T_4167_real_node__T_4186_data;
    assign _T_4271 = _T_4274;
    assign _T_4289 = _T_4292;
    assign _T_4347_0_imaginary_node = _node_937;
    assign _T_4347_0_real_node = _node_941;
    assign _T_4347_1_imaginary_node = _node_945;
    assign _T_4347_1_real_node = _node_949;
    assign _T_4402_imaginary_node__T_4413_data = _T_4347_0_imaginary_node;
    assign _T_4402_real_node__T_4413_data = _T_4347_0_real_node;
    assign _T_5_node = 64'h0;
    MUX_UNSIGNED #(.width(1)) u_mux_1099 (
        .y(_WTEMP_27),
        .sel(_T_626),
        .a(1'h0),
        .b(_node_813)
    );
    assign _T_638__T_643_data = sync_0;
    assign _T_651_node = 64'h0;
    assign _T_658_node = 64'h0;
    assign _T_735_node = 64'h3FF0000000000000;
    assign _T_742_node = 64'h8000000000000000;
    assign _T_759_imaginary_node = _T_742_node;
    assign _T_759_real_node = _T_735_node;
    assign _T_763_node = 64'h3FED906BCF328D46;
    assign _T_770_node = 64'hBFD87DE2A6AEA963;
    assign _T_787_imaginary_node = _T_770_node;
    assign _T_787_real_node = _T_763_node;
    assign _T_791_node = 64'h3FE6A09E667F3BCD;
    assign _T_798_node = 64'hBFE6A09E667F3BCC;
    assign _T_815_imaginary_node = _T_798_node;
    assign _T_815_real_node = _T_791_node;
    assign _T_819_node = 64'h3FD87DE2A6AEA964;
    assign _T_826_node = 64'hBFED906BCF328D46;
    assign _T_843_imaginary_node = _T_826_node;
    assign _T_843_real_node = _T_819_node;
    assign _T_860_node = 64'h0;
    assign _T_867_node = 64'h0;
    assign _T_974_0_imaginary_node = _node_817;
    assign _T_974_0_real_node = _node_821;
    assign indices_rom_0 = 1'h0;
    assign io_out_bits_0_imaginary_node = stage_outputs_2_0_imaginary_node;
    assign io_out_bits_0_real_node = stage_outputs_2_0_real_node;
    assign io_out_bits_1_imaginary_node = stage_outputs_2_1_imaginary_node;
    assign io_out_bits_1_real_node = stage_outputs_2_1_real_node;
    assign io_out_bits_2_imaginary_node = stage_outputs_2_2_imaginary_node;
    assign io_out_bits_2_real_node = stage_outputs_2_2_real_node;
    assign io_out_bits_3_imaginary_node = stage_outputs_2_3_imaginary_node;
    assign io_out_bits_3_real_node = stage_outputs_2_3_real_node;
    assign io_out_bits_4_imaginary_node = stage_outputs_2_4_imaginary_node;
    assign io_out_bits_4_real_node = stage_outputs_2_4_real_node;
    assign io_out_bits_5_imaginary_node = stage_outputs_2_5_imaginary_node;
    assign io_out_bits_5_real_node = stage_outputs_2_5_real_node;
    assign io_out_bits_6_imaginary_node = stage_outputs_2_6_imaginary_node;
    assign io_out_bits_6_real_node = stage_outputs_2_6_real_node;
    assign io_out_bits_7_imaginary_node = stage_outputs_2_7_imaginary_node;
    assign io_out_bits_7_real_node = stage_outputs_2_7_real_node;
    assign io_out_sync = _T_647;
    assign io_out_valid = io_in_valid;
    assign stage_outputs_0_0_imaginary_node = io_in_bits_0_imaginary_node;
    assign stage_outputs_0_0_real_node = io_in_bits_0_real_node;
    assign stage_outputs_0_1_imaginary_node = io_in_bits_1_imaginary_node;
    assign stage_outputs_0_1_real_node = io_in_bits_1_real_node;
    assign stage_outputs_0_2_imaginary_node = io_in_bits_2_imaginary_node;
    assign stage_outputs_0_2_real_node = io_in_bits_2_real_node;
    assign stage_outputs_0_3_imaginary_node = io_in_bits_3_imaginary_node;
    assign stage_outputs_0_3_real_node = io_in_bits_3_real_node;
    assign stage_outputs_0_4_imaginary_node = io_in_bits_4_imaginary_node;
    assign stage_outputs_0_4_real_node = io_in_bits_4_real_node;
    assign stage_outputs_0_5_imaginary_node = io_in_bits_5_imaginary_node;
    assign stage_outputs_0_5_real_node = io_in_bits_5_real_node;
    assign stage_outputs_0_6_imaginary_node = io_in_bits_6_imaginary_node;
    assign stage_outputs_0_6_real_node = io_in_bits_6_real_node;
    assign stage_outputs_0_7_imaginary_node = io_in_bits_7_imaginary_node;
    assign stage_outputs_0_7_real_node = io_in_bits_7_real_node;
    assign stage_outputs_1_0_imaginary_node = _T_2007_imaginary_node;
    assign stage_outputs_1_0_real_node = _T_2007_real_node;
    assign stage_outputs_1_1_imaginary_node = _T_2073_imaginary_node;
    assign stage_outputs_1_1_real_node = _T_2073_real_node;
    assign stage_outputs_1_2_imaginary_node = _T_2431_imaginary_node;
    assign stage_outputs_1_2_real_node = _T_2431_real_node;
    assign stage_outputs_1_3_imaginary_node = _T_2497_imaginary_node;
    assign stage_outputs_1_3_real_node = _T_2497_real_node;
    assign stage_outputs_1_4_imaginary_node = _T_2855_imaginary_node;
    assign stage_outputs_1_4_real_node = _T_2855_real_node;
    assign stage_outputs_1_5_imaginary_node = _T_2921_imaginary_node;
    assign stage_outputs_1_5_real_node = _T_2921_real_node;
    assign stage_outputs_1_6_imaginary_node = _T_3279_imaginary_node;
    assign stage_outputs_1_6_real_node = _T_3279_real_node;
    assign stage_outputs_1_7_imaginary_node = _T_3345_imaginary_node;
    assign stage_outputs_1_7_real_node = _T_3345_real_node;
    assign stage_outputs_2_0_imaginary_node = _T_3595_imaginary_node__T_3614_data;
    assign stage_outputs_2_0_real_node = _T_3595_real_node__T_3614_data;
    assign stage_outputs_2_1_imaginary_node = _T_3540_1_imaginary_node;
    assign stage_outputs_2_1_real_node = _T_3540_1_real_node;
    assign stage_outputs_2_2_imaginary_node = _T_3864_imaginary_node__T_3883_data;
    assign stage_outputs_2_2_real_node = _T_3864_real_node__T_3883_data;
    assign stage_outputs_2_3_imaginary_node = _T_3809_1_imaginary_node;
    assign stage_outputs_2_3_real_node = _T_3809_1_real_node;
    assign stage_outputs_2_4_imaginary_node = _T_4133_imaginary_node__T_4152_data;
    assign stage_outputs_2_4_real_node = _T_4133_real_node__T_4152_data;
    assign stage_outputs_2_5_imaginary_node = _T_4078_1_imaginary_node;
    assign stage_outputs_2_5_real_node = _T_4078_1_real_node;
    assign stage_outputs_2_6_imaginary_node = _T_4402_imaginary_node__T_4421_data;
    assign stage_outputs_2_6_real_node = _T_4402_real_node__T_4421_data;
    assign stage_outputs_2_7_imaginary_node = _T_4347_1_imaginary_node;
    assign stage_outputs_2_7_real_node = _T_4347_1_real_node;
    assign sync_0 = __T_628__q;
    assign sync_1 = _T_638__T_645_data;
    assign twiddle_0_imaginary_node = _T_974_0_imaginary_node;
    assign twiddle_0_real_node = _T_974_0_real_node;
    assign twiddle_rom_0_imaginary_node = _T_759_imaginary_node;
    assign twiddle_rom_0_real_node = _T_759_real_node;
    assign twiddle_rom_1_imaginary_node = _T_787_imaginary_node;
    assign twiddle_rom_1_real_node = _T_787_real_node;
    assign twiddle_rom_2_imaginary_node = _T_815_imaginary_node;
    assign twiddle_rom_2_real_node = _T_815_real_node;
    assign twiddle_rom_3_imaginary_node = _T_843_imaginary_node;
    assign twiddle_rom_3_real_node = _T_843_real_node;
endmodule //BiplexFFT
