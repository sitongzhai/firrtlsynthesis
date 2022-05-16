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
    wire _T_635__T_645_clk;
    wire _T_635__T_645_en;
    wire _T_635__T_645_mask;
    wire [1:0] _T_635__T_645_addr;
    wire _T_635__T_645_data;
    wire _T_635__T_646_data;
    wire _T_635__T_646_clk;
    wire _T_635__T_646_en;
    wire [1:0] _T_635__T_646_addr;
    RAMMEM #(.depth(3), .addrbits(2), .width(1), .isSyncRead(0)) _T_635 (
        .read_data(_T_635__T_646_data),
        .read_clk(_T_635__T_646_clk),
        .read_en(_T_635__T_646_en),
        .read_addr(_T_635__T_646_addr),
        .write_clk(_T_635__T_645_clk),
        .write_en(_T_635__T_645_en),
        .write_mask(_T_635__T_645_mask),
        .write_addr(_T_635__T_645_addr),
        .write_data(_T_635__T_645_data)
    );
    wire [1:0] __T_637__q;
    wire [1:0] __T_637__d;
    DFF_POSCLK #(.width(2)) _T_637 (
        .q(__T_637__q),
        .d(__T_637__d),
        .clk(clock)
    );
    wire [1:0] _WTEMP_1;
    MUX_UNSIGNED #(.width(2)) u_mux_8 (
        .y(__T_637__d),
        .sel(reset),
        .a(2'h0),
        .b(_WTEMP_1)
    );
    wire _T_639;
    EQ_UNSIGNED #(.width(2)) u_eq_9 (
        .y(_T_639),
        .a(__T_637__q),
        .b(2'h2)
    );
    wire [2:0] _T_641;
    wire [1:0] _WTEMP_2;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_10 (
        .y(_WTEMP_2),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(2)) u_add_11 (
        .y(_T_641),
        .a(__T_637__q),
        .b(_WTEMP_2)
    );
    wire [1:0] _T_642;
    TAIL #(.width(3), .n(1)) tail_12 (
        .y(_T_642),
        .in(_T_641)
    );
    wire [1:0] _node_1;
    wire [1:0] _WTEMP_3;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_13 (
        .y(_WTEMP_3),
        .in(1'h0)
    );
    MUX_UNSIGNED #(.width(2)) u_mux_14 (
        .y(_node_1),
        .sel(_T_639),
        .a(_WTEMP_3),
        .b(_T_642)
    );
    wire _T_644;
    BITWISEAND #(.width(1)) bitwiseand_15 (
        .y(_T_644),
        .a(io_in_valid),
        .b(_T_639)
    );
    assign _T_635__T_645_addr = __T_637__q;
    assign _T_635__T_645_en = io_in_valid;
    assign _T_635__T_645_clk = clock;
    assign _T_635__T_645_mask = 1'h1;
    assign _T_635__T_646_addr = __T_637__q;
    assign _T_635__T_646_en = 1'h1;
    assign _T_635__T_646_clk = clock;
    wire [63:0] _T_650_node;
    wire [63:0] _T_657_node;
    wire [63:0] twiddle_rom_0_real_node;
    wire [63:0] twiddle_rom_0_imaginary_node;
    wire [63:0] twiddle_rom_1_real_node;
    wire [63:0] twiddle_rom_1_imaginary_node;
    wire [63:0] twiddle_rom_2_real_node;
    wire [63:0] twiddle_rom_2_imaginary_node;
    wire [63:0] twiddle_rom_3_real_node;
    wire [63:0] twiddle_rom_3_imaginary_node;
    wire [63:0] _T_734_node;
    wire [63:0] _T_741_node;
    wire [63:0] _T_758_real_node;
    wire [63:0] _T_758_imaginary_node;
    wire [63:0] _T_762_node;
    wire [63:0] _T_769_node;
    wire [63:0] _T_786_real_node;
    wire [63:0] _T_786_imaginary_node;
    wire [63:0] _T_790_node;
    wire [63:0] _T_797_node;
    wire [63:0] _T_814_real_node;
    wire [63:0] _T_814_imaginary_node;
    wire [63:0] _T_818_node;
    wire [63:0] _T_825_node;
    wire [63:0] _T_842_real_node;
    wire [63:0] _T_842_imaginary_node;
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
    MUL2_UNSIGNED #(.width_a(1), .width_b(3)) u_mul2_16 (
        .y(start),
        .a(_sync__q),
        .b(3'h7)
    );
    wire [63:0] _T_894_node;
    wire [63:0] _T_901_node;
    wire [63:0] _T_918_real_node;
    wire [63:0] _T_918_imaginary_node;
    wire [63:0] _T_922_node;
    wire [63:0] _T_929_node;
    wire [63:0] _T_946_real_node;
    wire [63:0] _T_946_imaginary_node;
    wire [63:0] _T_950_node;
    wire [63:0] _T_957_node;
    wire [63:0] _T_974_real_node;
    wire [63:0] _T_974_imaginary_node;
    wire [63:0] _T_978_node;
    wire [63:0] _T_985_node;
    wire [63:0] _T_1002_real_node;
    wire [63:0] _T_1002_imaginary_node;
    wire [63:0] _T_1006_node;
    wire [63:0] _T_1013_node;
    wire [63:0] _T_1030_real_node;
    wire [63:0] _T_1030_imaginary_node;
    wire [63:0] _T_1034_node;
    wire [63:0] _T_1041_node;
    wire [63:0] _T_1058_real_node;
    wire [63:0] _T_1058_imaginary_node;
    wire [63:0] _T_1062_node;
    wire [63:0] _T_1069_node;
    wire [63:0] _T_1086_real_node;
    wire [63:0] _T_1086_imaginary_node;
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
    wire [4:0] _T_1299;
    wire [3:0] _WTEMP_4;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_17 (
        .y(_WTEMP_4),
        .in(1'h0)
    );
    ADD_UNSIGNED #(.width(4)) u_add_18 (
        .y(_T_1299),
        .a(start),
        .b(_WTEMP_4)
    );
    wire [3:0] _T_1300;
    TAIL #(.width(5), .n(1)) tail_19 (
        .y(_T_1300),
        .in(_T_1299)
    );
    wire _node_2;
    EQ_UNSIGNED #(.width(4)) u_eq_20 (
        .y(_node_2),
        .a(4'd0),
        .b(_T_1300)
    );
    wire [2:0] _node_3;
    assign _node_3 = indices_rom_0;
    wire _node_4;
    EQ_UNSIGNED #(.width(4)) u_eq_21 (
        .y(_node_4),
        .a(4'd1),
        .b(_T_1300)
    );
    wire [2:0] _node_5;
    MUX_UNSIGNED #(.width(3)) u_mux_22 (
        .y(_node_5),
        .sel(_node_4),
        .a(indices_rom_1),
        .b(_node_3)
    );
    wire _node_6;
    EQ_UNSIGNED #(.width(4)) u_eq_23 (
        .y(_node_6),
        .a(4'd2),
        .b(_T_1300)
    );
    wire [2:0] _node_7;
    MUX_UNSIGNED #(.width(3)) u_mux_24 (
        .y(_node_7),
        .sel(_node_6),
        .a(indices_rom_2),
        .b(_node_5)
    );
    wire _node_8;
    EQ_UNSIGNED #(.width(4)) u_eq_25 (
        .y(_node_8),
        .a(4'd3),
        .b(_T_1300)
    );
    wire [2:0] _node_9;
    MUX_UNSIGNED #(.width(3)) u_mux_26 (
        .y(_node_9),
        .sel(_node_8),
        .a(indices_rom_3),
        .b(_node_7)
    );
    wire _node_10;
    EQ_UNSIGNED #(.width(4)) u_eq_27 (
        .y(_node_10),
        .a(4'd4),
        .b(_T_1300)
    );
    wire [2:0] _node_11;
    MUX_UNSIGNED #(.width(3)) u_mux_28 (
        .y(_node_11),
        .sel(_node_10),
        .a(indices_rom_4),
        .b(_node_9)
    );
    wire _node_12;
    EQ_UNSIGNED #(.width(4)) u_eq_29 (
        .y(_node_12),
        .a(4'd5),
        .b(_T_1300)
    );
    wire [2:0] _node_13;
    MUX_UNSIGNED #(.width(3)) u_mux_30 (
        .y(_node_13),
        .sel(_node_12),
        .a(indices_rom_5),
        .b(_node_11)
    );
    wire _node_14;
    EQ_UNSIGNED #(.width(4)) u_eq_31 (
        .y(_node_14),
        .a(4'd6),
        .b(_T_1300)
    );
    wire [2:0] _node_15;
    MUX_UNSIGNED #(.width(3)) u_mux_32 (
        .y(_node_15),
        .sel(_node_14),
        .a(indices_rom_6),
        .b(_node_13)
    );
    wire _node_16;
    EQ_UNSIGNED #(.width(4)) u_eq_33 (
        .y(_node_16),
        .a(4'd7),
        .b(_T_1300)
    );
    wire [2:0] _node_17;
    MUX_UNSIGNED #(.width(3)) u_mux_34 (
        .y(_node_17),
        .sel(_node_16),
        .a(indices_rom_7),
        .b(_node_15)
    );
    wire _node_18;
    EQ_UNSIGNED #(.width(4)) u_eq_35 (
        .y(_node_18),
        .a(4'd8),
        .b(_T_1300)
    );
    wire [2:0] _node_19;
    MUX_UNSIGNED #(.width(3)) u_mux_36 (
        .y(_node_19),
        .sel(_node_18),
        .a(indices_rom_8),
        .b(_node_17)
    );
    wire _node_20;
    EQ_UNSIGNED #(.width(4)) u_eq_37 (
        .y(_node_20),
        .a(4'd9),
        .b(_T_1300)
    );
    wire [2:0] _node_21;
    MUX_UNSIGNED #(.width(3)) u_mux_38 (
        .y(_node_21),
        .sel(_node_20),
        .a(indices_rom_9),
        .b(_node_19)
    );
    wire _node_22;
    EQ_UNSIGNED #(.width(4)) u_eq_39 (
        .y(_node_22),
        .a(4'd10),
        .b(_T_1300)
    );
    wire [2:0] _node_23;
    MUX_UNSIGNED #(.width(3)) u_mux_40 (
        .y(_node_23),
        .sel(_node_22),
        .a(indices_rom_10),
        .b(_node_21)
    );
    wire _node_24;
    EQ_UNSIGNED #(.width(4)) u_eq_41 (
        .y(_node_24),
        .a(4'd11),
        .b(_T_1300)
    );
    wire [2:0] _node_25;
    MUX_UNSIGNED #(.width(3)) u_mux_42 (
        .y(_node_25),
        .sel(_node_24),
        .a(indices_rom_11),
        .b(_node_23)
    );
    wire _node_26;
    EQ_UNSIGNED #(.width(4)) u_eq_43 (
        .y(_node_26),
        .a(4'd12),
        .b(_T_1300)
    );
    wire [2:0] _node_27;
    MUX_UNSIGNED #(.width(3)) u_mux_44 (
        .y(_node_27),
        .sel(_node_26),
        .a(indices_rom_12),
        .b(_node_25)
    );
    wire _node_28;
    EQ_UNSIGNED #(.width(4)) u_eq_45 (
        .y(_node_28),
        .a(4'd13),
        .b(_T_1300)
    );
    wire [2:0] _node_29;
    MUX_UNSIGNED #(.width(3)) u_mux_46 (
        .y(_node_29),
        .sel(_node_28),
        .a(indices_rom_13),
        .b(_node_27)
    );
    wire _T_1302;
    BITS #(.width(3), .high(2), .low(2)) bits_47 (
        .y(_T_1302),
        .in(_node_29)
    );
    wire [4:0] _T_1304;
    wire [3:0] _WTEMP_5;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_48 (
        .y(_WTEMP_5),
        .in(1'h0)
    );
    ADD_UNSIGNED #(.width(4)) u_add_49 (
        .y(_T_1304),
        .a(start),
        .b(_WTEMP_5)
    );
    wire [3:0] _T_1305;
    TAIL #(.width(5), .n(1)) tail_50 (
        .y(_T_1305),
        .in(_T_1304)
    );
    wire _node_30;
    EQ_UNSIGNED #(.width(4)) u_eq_51 (
        .y(_node_30),
        .a(4'd0),
        .b(_T_1305)
    );
    wire [2:0] _node_31;
    assign _node_31 = indices_rom_0;
    wire _node_32;
    EQ_UNSIGNED #(.width(4)) u_eq_52 (
        .y(_node_32),
        .a(4'd1),
        .b(_T_1305)
    );
    wire [2:0] _node_33;
    MUX_UNSIGNED #(.width(3)) u_mux_53 (
        .y(_node_33),
        .sel(_node_32),
        .a(indices_rom_1),
        .b(_node_31)
    );
    wire _node_34;
    EQ_UNSIGNED #(.width(4)) u_eq_54 (
        .y(_node_34),
        .a(4'd2),
        .b(_T_1305)
    );
    wire [2:0] _node_35;
    MUX_UNSIGNED #(.width(3)) u_mux_55 (
        .y(_node_35),
        .sel(_node_34),
        .a(indices_rom_2),
        .b(_node_33)
    );
    wire _node_36;
    EQ_UNSIGNED #(.width(4)) u_eq_56 (
        .y(_node_36),
        .a(4'd3),
        .b(_T_1305)
    );
    wire [2:0] _node_37;
    MUX_UNSIGNED #(.width(3)) u_mux_57 (
        .y(_node_37),
        .sel(_node_36),
        .a(indices_rom_3),
        .b(_node_35)
    );
    wire _node_38;
    EQ_UNSIGNED #(.width(4)) u_eq_58 (
        .y(_node_38),
        .a(4'd4),
        .b(_T_1305)
    );
    wire [2:0] _node_39;
    MUX_UNSIGNED #(.width(3)) u_mux_59 (
        .y(_node_39),
        .sel(_node_38),
        .a(indices_rom_4),
        .b(_node_37)
    );
    wire _node_40;
    EQ_UNSIGNED #(.width(4)) u_eq_60 (
        .y(_node_40),
        .a(4'd5),
        .b(_T_1305)
    );
    wire [2:0] _node_41;
    MUX_UNSIGNED #(.width(3)) u_mux_61 (
        .y(_node_41),
        .sel(_node_40),
        .a(indices_rom_5),
        .b(_node_39)
    );
    wire _node_42;
    EQ_UNSIGNED #(.width(4)) u_eq_62 (
        .y(_node_42),
        .a(4'd6),
        .b(_T_1305)
    );
    wire [2:0] _node_43;
    MUX_UNSIGNED #(.width(3)) u_mux_63 (
        .y(_node_43),
        .sel(_node_42),
        .a(indices_rom_6),
        .b(_node_41)
    );
    wire _node_44;
    EQ_UNSIGNED #(.width(4)) u_eq_64 (
        .y(_node_44),
        .a(4'd7),
        .b(_T_1305)
    );
    wire [2:0] _node_45;
    MUX_UNSIGNED #(.width(3)) u_mux_65 (
        .y(_node_45),
        .sel(_node_44),
        .a(indices_rom_7),
        .b(_node_43)
    );
    wire _node_46;
    EQ_UNSIGNED #(.width(4)) u_eq_66 (
        .y(_node_46),
        .a(4'd8),
        .b(_T_1305)
    );
    wire [2:0] _node_47;
    MUX_UNSIGNED #(.width(3)) u_mux_67 (
        .y(_node_47),
        .sel(_node_46),
        .a(indices_rom_8),
        .b(_node_45)
    );
    wire _node_48;
    EQ_UNSIGNED #(.width(4)) u_eq_68 (
        .y(_node_48),
        .a(4'd9),
        .b(_T_1305)
    );
    wire [2:0] _node_49;
    MUX_UNSIGNED #(.width(3)) u_mux_69 (
        .y(_node_49),
        .sel(_node_48),
        .a(indices_rom_9),
        .b(_node_47)
    );
    wire _node_50;
    EQ_UNSIGNED #(.width(4)) u_eq_70 (
        .y(_node_50),
        .a(4'd10),
        .b(_T_1305)
    );
    wire [2:0] _node_51;
    MUX_UNSIGNED #(.width(3)) u_mux_71 (
        .y(_node_51),
        .sel(_node_50),
        .a(indices_rom_10),
        .b(_node_49)
    );
    wire _node_52;
    EQ_UNSIGNED #(.width(4)) u_eq_72 (
        .y(_node_52),
        .a(4'd11),
        .b(_T_1305)
    );
    wire [2:0] _node_53;
    MUX_UNSIGNED #(.width(3)) u_mux_73 (
        .y(_node_53),
        .sel(_node_52),
        .a(indices_rom_11),
        .b(_node_51)
    );
    wire _node_54;
    EQ_UNSIGNED #(.width(4)) u_eq_74 (
        .y(_node_54),
        .a(4'd12),
        .b(_T_1305)
    );
    wire [2:0] _node_55;
    MUX_UNSIGNED #(.width(3)) u_mux_75 (
        .y(_node_55),
        .sel(_node_54),
        .a(indices_rom_12),
        .b(_node_53)
    );
    wire _node_56;
    EQ_UNSIGNED #(.width(4)) u_eq_76 (
        .y(_node_56),
        .a(4'd13),
        .b(_T_1305)
    );
    wire [2:0] _node_57;
    MUX_UNSIGNED #(.width(3)) u_mux_77 (
        .y(_node_57),
        .sel(_node_56),
        .a(indices_rom_13),
        .b(_node_55)
    );
    wire [1:0] _T_1307;
    BITS #(.width(3), .high(1), .low(0)) bits_78 (
        .y(_T_1307),
        .in(_node_57)
    );
    wire [63:0] _T_1317_node;
    wire [63:0] _BBFSubtract_43__out;
    wire [63:0] _BBFSubtract_43__in2;
    wire [63:0] _BBFSubtract_43__in1;
    BBFSubtract BBFSubtract_43 (
        .out(_BBFSubtract_43__out),
        .in2(_BBFSubtract_43__in2),
        .in1(_BBFSubtract_43__in1)
    );
    wire _node_58;
    EQ_UNSIGNED #(.width(2)) u_eq_79 (
        .y(_node_58),
        .a(2'd0),
        .b(_T_1307)
    );
    wire [63:0] _node_59;
    assign _node_59 = twiddle_rom_0_real_node;
    wire _node_60;
    EQ_UNSIGNED #(.width(2)) u_eq_80 (
        .y(_node_60),
        .a(2'd1),
        .b(_T_1307)
    );
    wire [63:0] _node_61;
    MUX_UNSIGNED #(.width(64)) u_mux_81 (
        .y(_node_61),
        .sel(_node_60),
        .a(twiddle_rom_1_real_node),
        .b(_node_59)
    );
    wire _node_62;
    EQ_UNSIGNED #(.width(2)) u_eq_82 (
        .y(_node_62),
        .a(2'd2),
        .b(_T_1307)
    );
    wire [63:0] _node_63;
    MUX_UNSIGNED #(.width(64)) u_mux_83 (
        .y(_node_63),
        .sel(_node_62),
        .a(twiddle_rom_2_real_node),
        .b(_node_61)
    );
    wire _node_64;
    EQ_UNSIGNED #(.width(2)) u_eq_84 (
        .y(_node_64),
        .a(2'd3),
        .b(_T_1307)
    );
    wire [63:0] _node_65;
    MUX_UNSIGNED #(.width(64)) u_mux_85 (
        .y(_node_65),
        .sel(_node_64),
        .a(twiddle_rom_3_real_node),
        .b(_node_63)
    );
    wire [63:0] _T_1324_node;
    wire [63:0] _T_1340_real_node;
    wire [63:0] _T_1340_imaginary_node;
    wire _node_66;
    EQ_UNSIGNED #(.width(2)) u_eq_86 (
        .y(_node_66),
        .a(2'd0),
        .b(_T_1307)
    );
    wire [63:0] _node_67;
    assign _node_67 = twiddle_rom_0_imaginary_node;
    wire _node_68;
    EQ_UNSIGNED #(.width(2)) u_eq_87 (
        .y(_node_68),
        .a(2'd1),
        .b(_T_1307)
    );
    wire [63:0] _node_69;
    MUX_UNSIGNED #(.width(64)) u_mux_88 (
        .y(_node_69),
        .sel(_node_68),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_67)
    );
    wire _node_70;
    EQ_UNSIGNED #(.width(2)) u_eq_89 (
        .y(_node_70),
        .a(2'd2),
        .b(_T_1307)
    );
    wire [63:0] _node_71;
    MUX_UNSIGNED #(.width(64)) u_mux_90 (
        .y(_node_71),
        .sel(_node_70),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_69)
    );
    wire _node_72;
    EQ_UNSIGNED #(.width(2)) u_eq_91 (
        .y(_node_72),
        .a(2'd3),
        .b(_T_1307)
    );
    wire [63:0] _node_73;
    MUX_UNSIGNED #(.width(64)) u_mux_92 (
        .y(_node_73),
        .sel(_node_72),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_71)
    );
    wire [4:0] _T_1342;
    wire [3:0] _WTEMP_6;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_93 (
        .y(_WTEMP_6),
        .in(1'h0)
    );
    ADD_UNSIGNED #(.width(4)) u_add_94 (
        .y(_T_1342),
        .a(start),
        .b(_WTEMP_6)
    );
    wire [3:0] _T_1343;
    TAIL #(.width(5), .n(1)) tail_95 (
        .y(_T_1343),
        .in(_T_1342)
    );
    wire _node_74;
    EQ_UNSIGNED #(.width(4)) u_eq_96 (
        .y(_node_74),
        .a(4'd0),
        .b(_T_1343)
    );
    wire [2:0] _node_75;
    assign _node_75 = indices_rom_0;
    wire _node_76;
    EQ_UNSIGNED #(.width(4)) u_eq_97 (
        .y(_node_76),
        .a(4'd1),
        .b(_T_1343)
    );
    wire [2:0] _node_77;
    MUX_UNSIGNED #(.width(3)) u_mux_98 (
        .y(_node_77),
        .sel(_node_76),
        .a(indices_rom_1),
        .b(_node_75)
    );
    wire _node_78;
    EQ_UNSIGNED #(.width(4)) u_eq_99 (
        .y(_node_78),
        .a(4'd2),
        .b(_T_1343)
    );
    wire [2:0] _node_79;
    MUX_UNSIGNED #(.width(3)) u_mux_100 (
        .y(_node_79),
        .sel(_node_78),
        .a(indices_rom_2),
        .b(_node_77)
    );
    wire _node_80;
    EQ_UNSIGNED #(.width(4)) u_eq_101 (
        .y(_node_80),
        .a(4'd3),
        .b(_T_1343)
    );
    wire [2:0] _node_81;
    MUX_UNSIGNED #(.width(3)) u_mux_102 (
        .y(_node_81),
        .sel(_node_80),
        .a(indices_rom_3),
        .b(_node_79)
    );
    wire _node_82;
    EQ_UNSIGNED #(.width(4)) u_eq_103 (
        .y(_node_82),
        .a(4'd4),
        .b(_T_1343)
    );
    wire [2:0] _node_83;
    MUX_UNSIGNED #(.width(3)) u_mux_104 (
        .y(_node_83),
        .sel(_node_82),
        .a(indices_rom_4),
        .b(_node_81)
    );
    wire _node_84;
    EQ_UNSIGNED #(.width(4)) u_eq_105 (
        .y(_node_84),
        .a(4'd5),
        .b(_T_1343)
    );
    wire [2:0] _node_85;
    MUX_UNSIGNED #(.width(3)) u_mux_106 (
        .y(_node_85),
        .sel(_node_84),
        .a(indices_rom_5),
        .b(_node_83)
    );
    wire _node_86;
    EQ_UNSIGNED #(.width(4)) u_eq_107 (
        .y(_node_86),
        .a(4'd6),
        .b(_T_1343)
    );
    wire [2:0] _node_87;
    MUX_UNSIGNED #(.width(3)) u_mux_108 (
        .y(_node_87),
        .sel(_node_86),
        .a(indices_rom_6),
        .b(_node_85)
    );
    wire _node_88;
    EQ_UNSIGNED #(.width(4)) u_eq_109 (
        .y(_node_88),
        .a(4'd7),
        .b(_T_1343)
    );
    wire [2:0] _node_89;
    MUX_UNSIGNED #(.width(3)) u_mux_110 (
        .y(_node_89),
        .sel(_node_88),
        .a(indices_rom_7),
        .b(_node_87)
    );
    wire _node_90;
    EQ_UNSIGNED #(.width(4)) u_eq_111 (
        .y(_node_90),
        .a(4'd8),
        .b(_T_1343)
    );
    wire [2:0] _node_91;
    MUX_UNSIGNED #(.width(3)) u_mux_112 (
        .y(_node_91),
        .sel(_node_90),
        .a(indices_rom_8),
        .b(_node_89)
    );
    wire _node_92;
    EQ_UNSIGNED #(.width(4)) u_eq_113 (
        .y(_node_92),
        .a(4'd9),
        .b(_T_1343)
    );
    wire [2:0] _node_93;
    MUX_UNSIGNED #(.width(3)) u_mux_114 (
        .y(_node_93),
        .sel(_node_92),
        .a(indices_rom_9),
        .b(_node_91)
    );
    wire _node_94;
    EQ_UNSIGNED #(.width(4)) u_eq_115 (
        .y(_node_94),
        .a(4'd10),
        .b(_T_1343)
    );
    wire [2:0] _node_95;
    MUX_UNSIGNED #(.width(3)) u_mux_116 (
        .y(_node_95),
        .sel(_node_94),
        .a(indices_rom_10),
        .b(_node_93)
    );
    wire _node_96;
    EQ_UNSIGNED #(.width(4)) u_eq_117 (
        .y(_node_96),
        .a(4'd11),
        .b(_T_1343)
    );
    wire [2:0] _node_97;
    MUX_UNSIGNED #(.width(3)) u_mux_118 (
        .y(_node_97),
        .sel(_node_96),
        .a(indices_rom_11),
        .b(_node_95)
    );
    wire _node_98;
    EQ_UNSIGNED #(.width(4)) u_eq_119 (
        .y(_node_98),
        .a(4'd12),
        .b(_T_1343)
    );
    wire [2:0] _node_99;
    MUX_UNSIGNED #(.width(3)) u_mux_120 (
        .y(_node_99),
        .sel(_node_98),
        .a(indices_rom_12),
        .b(_node_97)
    );
    wire _node_100;
    EQ_UNSIGNED #(.width(4)) u_eq_121 (
        .y(_node_100),
        .a(4'd13),
        .b(_T_1343)
    );
    wire [2:0] _node_101;
    MUX_UNSIGNED #(.width(3)) u_mux_122 (
        .y(_node_101),
        .sel(_node_100),
        .a(indices_rom_13),
        .b(_node_99)
    );
    wire [1:0] _T_1351;
    BITS #(.width(3), .high(1), .low(0)) bits_123 (
        .y(_T_1351),
        .in(_node_101)
    );
    wire _node_102;
    EQ_UNSIGNED #(.width(2)) u_eq_124 (
        .y(_node_102),
        .a(2'd0),
        .b(_T_1351)
    );
    wire [63:0] _node_103;
    assign _node_103 = twiddle_rom_0_real_node;
    wire _node_104;
    EQ_UNSIGNED #(.width(2)) u_eq_125 (
        .y(_node_104),
        .a(2'd1),
        .b(_T_1351)
    );
    wire [63:0] _node_105;
    MUX_UNSIGNED #(.width(64)) u_mux_126 (
        .y(_node_105),
        .sel(_node_104),
        .a(twiddle_rom_1_real_node),
        .b(_node_103)
    );
    wire _node_106;
    EQ_UNSIGNED #(.width(2)) u_eq_127 (
        .y(_node_106),
        .a(2'd2),
        .b(_T_1351)
    );
    wire [63:0] _node_107;
    MUX_UNSIGNED #(.width(64)) u_mux_128 (
        .y(_node_107),
        .sel(_node_106),
        .a(twiddle_rom_2_real_node),
        .b(_node_105)
    );
    wire _node_108;
    EQ_UNSIGNED #(.width(2)) u_eq_129 (
        .y(_node_108),
        .a(2'd3),
        .b(_T_1351)
    );
    wire [63:0] _node_109;
    MUX_UNSIGNED #(.width(64)) u_mux_130 (
        .y(_node_109),
        .sel(_node_108),
        .a(twiddle_rom_3_real_node),
        .b(_node_107)
    );
    wire [63:0] _T_1358_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_131 (
        .y(_T_1358_real_node),
        .sel(_T_1302),
        .a(_T_1340_real_node),
        .b(_node_109)
    );
    wire _node_110;
    EQ_UNSIGNED #(.width(2)) u_eq_132 (
        .y(_node_110),
        .a(2'd0),
        .b(_T_1351)
    );
    wire [63:0] _node_111;
    assign _node_111 = twiddle_rom_0_imaginary_node;
    wire _node_112;
    EQ_UNSIGNED #(.width(2)) u_eq_133 (
        .y(_node_112),
        .a(2'd1),
        .b(_T_1351)
    );
    wire [63:0] _node_113;
    MUX_UNSIGNED #(.width(64)) u_mux_134 (
        .y(_node_113),
        .sel(_node_112),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_111)
    );
    wire _node_114;
    EQ_UNSIGNED #(.width(2)) u_eq_135 (
        .y(_node_114),
        .a(2'd2),
        .b(_T_1351)
    );
    wire [63:0] _node_115;
    MUX_UNSIGNED #(.width(64)) u_mux_136 (
        .y(_node_115),
        .sel(_node_114),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_113)
    );
    wire _node_116;
    EQ_UNSIGNED #(.width(2)) u_eq_137 (
        .y(_node_116),
        .a(2'd3),
        .b(_T_1351)
    );
    wire [63:0] _node_117;
    MUX_UNSIGNED #(.width(64)) u_mux_138 (
        .y(_node_117),
        .sel(_node_116),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_115)
    );
    wire [63:0] _T_1358_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_139 (
        .y(_T_1358_imaginary_node),
        .sel(_T_1302),
        .a(_T_1340_imaginary_node),
        .b(_node_117)
    );
    wire [4:0] _T_1360;
    wire [3:0] _WTEMP_7;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_140 (
        .y(_WTEMP_7),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_141 (
        .y(_T_1360),
        .a(start),
        .b(_WTEMP_7)
    );
    wire [3:0] _T_1361;
    TAIL #(.width(5), .n(1)) tail_142 (
        .y(_T_1361),
        .in(_T_1360)
    );
    wire _node_118;
    EQ_UNSIGNED #(.width(4)) u_eq_143 (
        .y(_node_118),
        .a(4'd0),
        .b(_T_1361)
    );
    wire [2:0] _node_119;
    assign _node_119 = indices_rom_0;
    wire _node_120;
    EQ_UNSIGNED #(.width(4)) u_eq_144 (
        .y(_node_120),
        .a(4'd1),
        .b(_T_1361)
    );
    wire [2:0] _node_121;
    MUX_UNSIGNED #(.width(3)) u_mux_145 (
        .y(_node_121),
        .sel(_node_120),
        .a(indices_rom_1),
        .b(_node_119)
    );
    wire _node_122;
    EQ_UNSIGNED #(.width(4)) u_eq_146 (
        .y(_node_122),
        .a(4'd2),
        .b(_T_1361)
    );
    wire [2:0] _node_123;
    MUX_UNSIGNED #(.width(3)) u_mux_147 (
        .y(_node_123),
        .sel(_node_122),
        .a(indices_rom_2),
        .b(_node_121)
    );
    wire _node_124;
    EQ_UNSIGNED #(.width(4)) u_eq_148 (
        .y(_node_124),
        .a(4'd3),
        .b(_T_1361)
    );
    wire [2:0] _node_125;
    MUX_UNSIGNED #(.width(3)) u_mux_149 (
        .y(_node_125),
        .sel(_node_124),
        .a(indices_rom_3),
        .b(_node_123)
    );
    wire _node_126;
    EQ_UNSIGNED #(.width(4)) u_eq_150 (
        .y(_node_126),
        .a(4'd4),
        .b(_T_1361)
    );
    wire [2:0] _node_127;
    MUX_UNSIGNED #(.width(3)) u_mux_151 (
        .y(_node_127),
        .sel(_node_126),
        .a(indices_rom_4),
        .b(_node_125)
    );
    wire _node_128;
    EQ_UNSIGNED #(.width(4)) u_eq_152 (
        .y(_node_128),
        .a(4'd5),
        .b(_T_1361)
    );
    wire [2:0] _node_129;
    MUX_UNSIGNED #(.width(3)) u_mux_153 (
        .y(_node_129),
        .sel(_node_128),
        .a(indices_rom_5),
        .b(_node_127)
    );
    wire _node_130;
    EQ_UNSIGNED #(.width(4)) u_eq_154 (
        .y(_node_130),
        .a(4'd6),
        .b(_T_1361)
    );
    wire [2:0] _node_131;
    MUX_UNSIGNED #(.width(3)) u_mux_155 (
        .y(_node_131),
        .sel(_node_130),
        .a(indices_rom_6),
        .b(_node_129)
    );
    wire _node_132;
    EQ_UNSIGNED #(.width(4)) u_eq_156 (
        .y(_node_132),
        .a(4'd7),
        .b(_T_1361)
    );
    wire [2:0] _node_133;
    MUX_UNSIGNED #(.width(3)) u_mux_157 (
        .y(_node_133),
        .sel(_node_132),
        .a(indices_rom_7),
        .b(_node_131)
    );
    wire _node_134;
    EQ_UNSIGNED #(.width(4)) u_eq_158 (
        .y(_node_134),
        .a(4'd8),
        .b(_T_1361)
    );
    wire [2:0] _node_135;
    MUX_UNSIGNED #(.width(3)) u_mux_159 (
        .y(_node_135),
        .sel(_node_134),
        .a(indices_rom_8),
        .b(_node_133)
    );
    wire _node_136;
    EQ_UNSIGNED #(.width(4)) u_eq_160 (
        .y(_node_136),
        .a(4'd9),
        .b(_T_1361)
    );
    wire [2:0] _node_137;
    MUX_UNSIGNED #(.width(3)) u_mux_161 (
        .y(_node_137),
        .sel(_node_136),
        .a(indices_rom_9),
        .b(_node_135)
    );
    wire _node_138;
    EQ_UNSIGNED #(.width(4)) u_eq_162 (
        .y(_node_138),
        .a(4'd10),
        .b(_T_1361)
    );
    wire [2:0] _node_139;
    MUX_UNSIGNED #(.width(3)) u_mux_163 (
        .y(_node_139),
        .sel(_node_138),
        .a(indices_rom_10),
        .b(_node_137)
    );
    wire _node_140;
    EQ_UNSIGNED #(.width(4)) u_eq_164 (
        .y(_node_140),
        .a(4'd11),
        .b(_T_1361)
    );
    wire [2:0] _node_141;
    MUX_UNSIGNED #(.width(3)) u_mux_165 (
        .y(_node_141),
        .sel(_node_140),
        .a(indices_rom_11),
        .b(_node_139)
    );
    wire _node_142;
    EQ_UNSIGNED #(.width(4)) u_eq_166 (
        .y(_node_142),
        .a(4'd12),
        .b(_T_1361)
    );
    wire [2:0] _node_143;
    MUX_UNSIGNED #(.width(3)) u_mux_167 (
        .y(_node_143),
        .sel(_node_142),
        .a(indices_rom_12),
        .b(_node_141)
    );
    wire _node_144;
    EQ_UNSIGNED #(.width(4)) u_eq_168 (
        .y(_node_144),
        .a(4'd13),
        .b(_T_1361)
    );
    wire [2:0] _node_145;
    MUX_UNSIGNED #(.width(3)) u_mux_169 (
        .y(_node_145),
        .sel(_node_144),
        .a(indices_rom_13),
        .b(_node_143)
    );
    wire _T_1363;
    BITS #(.width(3), .high(2), .low(2)) bits_170 (
        .y(_T_1363),
        .in(_node_145)
    );
    wire [4:0] _T_1365;
    wire [3:0] _WTEMP_8;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_171 (
        .y(_WTEMP_8),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_172 (
        .y(_T_1365),
        .a(start),
        .b(_WTEMP_8)
    );
    wire [3:0] _T_1366;
    TAIL #(.width(5), .n(1)) tail_173 (
        .y(_T_1366),
        .in(_T_1365)
    );
    wire _node_146;
    EQ_UNSIGNED #(.width(4)) u_eq_174 (
        .y(_node_146),
        .a(4'd0),
        .b(_T_1366)
    );
    wire [2:0] _node_147;
    assign _node_147 = indices_rom_0;
    wire _node_148;
    EQ_UNSIGNED #(.width(4)) u_eq_175 (
        .y(_node_148),
        .a(4'd1),
        .b(_T_1366)
    );
    wire [2:0] _node_149;
    MUX_UNSIGNED #(.width(3)) u_mux_176 (
        .y(_node_149),
        .sel(_node_148),
        .a(indices_rom_1),
        .b(_node_147)
    );
    wire _node_150;
    EQ_UNSIGNED #(.width(4)) u_eq_177 (
        .y(_node_150),
        .a(4'd2),
        .b(_T_1366)
    );
    wire [2:0] _node_151;
    MUX_UNSIGNED #(.width(3)) u_mux_178 (
        .y(_node_151),
        .sel(_node_150),
        .a(indices_rom_2),
        .b(_node_149)
    );
    wire _node_152;
    EQ_UNSIGNED #(.width(4)) u_eq_179 (
        .y(_node_152),
        .a(4'd3),
        .b(_T_1366)
    );
    wire [2:0] _node_153;
    MUX_UNSIGNED #(.width(3)) u_mux_180 (
        .y(_node_153),
        .sel(_node_152),
        .a(indices_rom_3),
        .b(_node_151)
    );
    wire _node_154;
    EQ_UNSIGNED #(.width(4)) u_eq_181 (
        .y(_node_154),
        .a(4'd4),
        .b(_T_1366)
    );
    wire [2:0] _node_155;
    MUX_UNSIGNED #(.width(3)) u_mux_182 (
        .y(_node_155),
        .sel(_node_154),
        .a(indices_rom_4),
        .b(_node_153)
    );
    wire _node_156;
    EQ_UNSIGNED #(.width(4)) u_eq_183 (
        .y(_node_156),
        .a(4'd5),
        .b(_T_1366)
    );
    wire [2:0] _node_157;
    MUX_UNSIGNED #(.width(3)) u_mux_184 (
        .y(_node_157),
        .sel(_node_156),
        .a(indices_rom_5),
        .b(_node_155)
    );
    wire _node_158;
    EQ_UNSIGNED #(.width(4)) u_eq_185 (
        .y(_node_158),
        .a(4'd6),
        .b(_T_1366)
    );
    wire [2:0] _node_159;
    MUX_UNSIGNED #(.width(3)) u_mux_186 (
        .y(_node_159),
        .sel(_node_158),
        .a(indices_rom_6),
        .b(_node_157)
    );
    wire _node_160;
    EQ_UNSIGNED #(.width(4)) u_eq_187 (
        .y(_node_160),
        .a(4'd7),
        .b(_T_1366)
    );
    wire [2:0] _node_161;
    MUX_UNSIGNED #(.width(3)) u_mux_188 (
        .y(_node_161),
        .sel(_node_160),
        .a(indices_rom_7),
        .b(_node_159)
    );
    wire _node_162;
    EQ_UNSIGNED #(.width(4)) u_eq_189 (
        .y(_node_162),
        .a(4'd8),
        .b(_T_1366)
    );
    wire [2:0] _node_163;
    MUX_UNSIGNED #(.width(3)) u_mux_190 (
        .y(_node_163),
        .sel(_node_162),
        .a(indices_rom_8),
        .b(_node_161)
    );
    wire _node_164;
    EQ_UNSIGNED #(.width(4)) u_eq_191 (
        .y(_node_164),
        .a(4'd9),
        .b(_T_1366)
    );
    wire [2:0] _node_165;
    MUX_UNSIGNED #(.width(3)) u_mux_192 (
        .y(_node_165),
        .sel(_node_164),
        .a(indices_rom_9),
        .b(_node_163)
    );
    wire _node_166;
    EQ_UNSIGNED #(.width(4)) u_eq_193 (
        .y(_node_166),
        .a(4'd10),
        .b(_T_1366)
    );
    wire [2:0] _node_167;
    MUX_UNSIGNED #(.width(3)) u_mux_194 (
        .y(_node_167),
        .sel(_node_166),
        .a(indices_rom_10),
        .b(_node_165)
    );
    wire _node_168;
    EQ_UNSIGNED #(.width(4)) u_eq_195 (
        .y(_node_168),
        .a(4'd11),
        .b(_T_1366)
    );
    wire [2:0] _node_169;
    MUX_UNSIGNED #(.width(3)) u_mux_196 (
        .y(_node_169),
        .sel(_node_168),
        .a(indices_rom_11),
        .b(_node_167)
    );
    wire _node_170;
    EQ_UNSIGNED #(.width(4)) u_eq_197 (
        .y(_node_170),
        .a(4'd12),
        .b(_T_1366)
    );
    wire [2:0] _node_171;
    MUX_UNSIGNED #(.width(3)) u_mux_198 (
        .y(_node_171),
        .sel(_node_170),
        .a(indices_rom_12),
        .b(_node_169)
    );
    wire _node_172;
    EQ_UNSIGNED #(.width(4)) u_eq_199 (
        .y(_node_172),
        .a(4'd13),
        .b(_T_1366)
    );
    wire [2:0] _node_173;
    MUX_UNSIGNED #(.width(3)) u_mux_200 (
        .y(_node_173),
        .sel(_node_172),
        .a(indices_rom_13),
        .b(_node_171)
    );
    wire [1:0] _T_1368;
    BITS #(.width(3), .high(1), .low(0)) bits_201 (
        .y(_T_1368),
        .in(_node_173)
    );
    wire [63:0] _T_1378_node;
    wire [63:0] _BBFSubtract_1_1__out;
    wire [63:0] _BBFSubtract_1_1__in2;
    wire [63:0] _BBFSubtract_1_1__in1;
    BBFSubtract BBFSubtract_1_1 (
        .out(_BBFSubtract_1_1__out),
        .in2(_BBFSubtract_1_1__in2),
        .in1(_BBFSubtract_1_1__in1)
    );
    wire _node_174;
    EQ_UNSIGNED #(.width(2)) u_eq_202 (
        .y(_node_174),
        .a(2'd0),
        .b(_T_1368)
    );
    wire [63:0] _node_175;
    assign _node_175 = twiddle_rom_0_real_node;
    wire _node_176;
    EQ_UNSIGNED #(.width(2)) u_eq_203 (
        .y(_node_176),
        .a(2'd1),
        .b(_T_1368)
    );
    wire [63:0] _node_177;
    MUX_UNSIGNED #(.width(64)) u_mux_204 (
        .y(_node_177),
        .sel(_node_176),
        .a(twiddle_rom_1_real_node),
        .b(_node_175)
    );
    wire _node_178;
    EQ_UNSIGNED #(.width(2)) u_eq_205 (
        .y(_node_178),
        .a(2'd2),
        .b(_T_1368)
    );
    wire [63:0] _node_179;
    MUX_UNSIGNED #(.width(64)) u_mux_206 (
        .y(_node_179),
        .sel(_node_178),
        .a(twiddle_rom_2_real_node),
        .b(_node_177)
    );
    wire _node_180;
    EQ_UNSIGNED #(.width(2)) u_eq_207 (
        .y(_node_180),
        .a(2'd3),
        .b(_T_1368)
    );
    wire [63:0] _node_181;
    MUX_UNSIGNED #(.width(64)) u_mux_208 (
        .y(_node_181),
        .sel(_node_180),
        .a(twiddle_rom_3_real_node),
        .b(_node_179)
    );
    wire [63:0] _T_1385_node;
    wire [63:0] _T_1401_real_node;
    wire [63:0] _T_1401_imaginary_node;
    wire _node_182;
    EQ_UNSIGNED #(.width(2)) u_eq_209 (
        .y(_node_182),
        .a(2'd0),
        .b(_T_1368)
    );
    wire [63:0] _node_183;
    assign _node_183 = twiddle_rom_0_imaginary_node;
    wire _node_184;
    EQ_UNSIGNED #(.width(2)) u_eq_210 (
        .y(_node_184),
        .a(2'd1),
        .b(_T_1368)
    );
    wire [63:0] _node_185;
    MUX_UNSIGNED #(.width(64)) u_mux_211 (
        .y(_node_185),
        .sel(_node_184),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_183)
    );
    wire _node_186;
    EQ_UNSIGNED #(.width(2)) u_eq_212 (
        .y(_node_186),
        .a(2'd2),
        .b(_T_1368)
    );
    wire [63:0] _node_187;
    MUX_UNSIGNED #(.width(64)) u_mux_213 (
        .y(_node_187),
        .sel(_node_186),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_185)
    );
    wire _node_188;
    EQ_UNSIGNED #(.width(2)) u_eq_214 (
        .y(_node_188),
        .a(2'd3),
        .b(_T_1368)
    );
    wire [63:0] _node_189;
    MUX_UNSIGNED #(.width(64)) u_mux_215 (
        .y(_node_189),
        .sel(_node_188),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_187)
    );
    wire [4:0] _T_1403;
    wire [3:0] _WTEMP_9;
    PAD_UNSIGNED #(.width(1), .n(4)) u_pad_216 (
        .y(_WTEMP_9),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(4)) u_add_217 (
        .y(_T_1403),
        .a(start),
        .b(_WTEMP_9)
    );
    wire [3:0] _T_1404;
    TAIL #(.width(5), .n(1)) tail_218 (
        .y(_T_1404),
        .in(_T_1403)
    );
    wire _node_190;
    EQ_UNSIGNED #(.width(4)) u_eq_219 (
        .y(_node_190),
        .a(4'd0),
        .b(_T_1404)
    );
    wire [2:0] _node_191;
    assign _node_191 = indices_rom_0;
    wire _node_192;
    EQ_UNSIGNED #(.width(4)) u_eq_220 (
        .y(_node_192),
        .a(4'd1),
        .b(_T_1404)
    );
    wire [2:0] _node_193;
    MUX_UNSIGNED #(.width(3)) u_mux_221 (
        .y(_node_193),
        .sel(_node_192),
        .a(indices_rom_1),
        .b(_node_191)
    );
    wire _node_194;
    EQ_UNSIGNED #(.width(4)) u_eq_222 (
        .y(_node_194),
        .a(4'd2),
        .b(_T_1404)
    );
    wire [2:0] _node_195;
    MUX_UNSIGNED #(.width(3)) u_mux_223 (
        .y(_node_195),
        .sel(_node_194),
        .a(indices_rom_2),
        .b(_node_193)
    );
    wire _node_196;
    EQ_UNSIGNED #(.width(4)) u_eq_224 (
        .y(_node_196),
        .a(4'd3),
        .b(_T_1404)
    );
    wire [2:0] _node_197;
    MUX_UNSIGNED #(.width(3)) u_mux_225 (
        .y(_node_197),
        .sel(_node_196),
        .a(indices_rom_3),
        .b(_node_195)
    );
    wire _node_198;
    EQ_UNSIGNED #(.width(4)) u_eq_226 (
        .y(_node_198),
        .a(4'd4),
        .b(_T_1404)
    );
    wire [2:0] _node_199;
    MUX_UNSIGNED #(.width(3)) u_mux_227 (
        .y(_node_199),
        .sel(_node_198),
        .a(indices_rom_4),
        .b(_node_197)
    );
    wire _node_200;
    EQ_UNSIGNED #(.width(4)) u_eq_228 (
        .y(_node_200),
        .a(4'd5),
        .b(_T_1404)
    );
    wire [2:0] _node_201;
    MUX_UNSIGNED #(.width(3)) u_mux_229 (
        .y(_node_201),
        .sel(_node_200),
        .a(indices_rom_5),
        .b(_node_199)
    );
    wire _node_202;
    EQ_UNSIGNED #(.width(4)) u_eq_230 (
        .y(_node_202),
        .a(4'd6),
        .b(_T_1404)
    );
    wire [2:0] _node_203;
    MUX_UNSIGNED #(.width(3)) u_mux_231 (
        .y(_node_203),
        .sel(_node_202),
        .a(indices_rom_6),
        .b(_node_201)
    );
    wire _node_204;
    EQ_UNSIGNED #(.width(4)) u_eq_232 (
        .y(_node_204),
        .a(4'd7),
        .b(_T_1404)
    );
    wire [2:0] _node_205;
    MUX_UNSIGNED #(.width(3)) u_mux_233 (
        .y(_node_205),
        .sel(_node_204),
        .a(indices_rom_7),
        .b(_node_203)
    );
    wire _node_206;
    EQ_UNSIGNED #(.width(4)) u_eq_234 (
        .y(_node_206),
        .a(4'd8),
        .b(_T_1404)
    );
    wire [2:0] _node_207;
    MUX_UNSIGNED #(.width(3)) u_mux_235 (
        .y(_node_207),
        .sel(_node_206),
        .a(indices_rom_8),
        .b(_node_205)
    );
    wire _node_208;
    EQ_UNSIGNED #(.width(4)) u_eq_236 (
        .y(_node_208),
        .a(4'd9),
        .b(_T_1404)
    );
    wire [2:0] _node_209;
    MUX_UNSIGNED #(.width(3)) u_mux_237 (
        .y(_node_209),
        .sel(_node_208),
        .a(indices_rom_9),
        .b(_node_207)
    );
    wire _node_210;
    EQ_UNSIGNED #(.width(4)) u_eq_238 (
        .y(_node_210),
        .a(4'd10),
        .b(_T_1404)
    );
    wire [2:0] _node_211;
    MUX_UNSIGNED #(.width(3)) u_mux_239 (
        .y(_node_211),
        .sel(_node_210),
        .a(indices_rom_10),
        .b(_node_209)
    );
    wire _node_212;
    EQ_UNSIGNED #(.width(4)) u_eq_240 (
        .y(_node_212),
        .a(4'd11),
        .b(_T_1404)
    );
    wire [2:0] _node_213;
    MUX_UNSIGNED #(.width(3)) u_mux_241 (
        .y(_node_213),
        .sel(_node_212),
        .a(indices_rom_11),
        .b(_node_211)
    );
    wire _node_214;
    EQ_UNSIGNED #(.width(4)) u_eq_242 (
        .y(_node_214),
        .a(4'd12),
        .b(_T_1404)
    );
    wire [2:0] _node_215;
    MUX_UNSIGNED #(.width(3)) u_mux_243 (
        .y(_node_215),
        .sel(_node_214),
        .a(indices_rom_12),
        .b(_node_213)
    );
    wire _node_216;
    EQ_UNSIGNED #(.width(4)) u_eq_244 (
        .y(_node_216),
        .a(4'd13),
        .b(_T_1404)
    );
    wire [2:0] _node_217;
    MUX_UNSIGNED #(.width(3)) u_mux_245 (
        .y(_node_217),
        .sel(_node_216),
        .a(indices_rom_13),
        .b(_node_215)
    );
    wire [1:0] _T_1412;
    BITS #(.width(3), .high(1), .low(0)) bits_246 (
        .y(_T_1412),
        .in(_node_217)
    );
    wire _node_218;
    EQ_UNSIGNED #(.width(2)) u_eq_247 (
        .y(_node_218),
        .a(2'd0),
        .b(_T_1412)
    );
    wire [63:0] _node_219;
    assign _node_219 = twiddle_rom_0_real_node;
    wire _node_220;
    EQ_UNSIGNED #(.width(2)) u_eq_248 (
        .y(_node_220),
        .a(2'd1),
        .b(_T_1412)
    );
    wire [63:0] _node_221;
    MUX_UNSIGNED #(.width(64)) u_mux_249 (
        .y(_node_221),
        .sel(_node_220),
        .a(twiddle_rom_1_real_node),
        .b(_node_219)
    );
    wire _node_222;
    EQ_UNSIGNED #(.width(2)) u_eq_250 (
        .y(_node_222),
        .a(2'd2),
        .b(_T_1412)
    );
    wire [63:0] _node_223;
    MUX_UNSIGNED #(.width(64)) u_mux_251 (
        .y(_node_223),
        .sel(_node_222),
        .a(twiddle_rom_2_real_node),
        .b(_node_221)
    );
    wire _node_224;
    EQ_UNSIGNED #(.width(2)) u_eq_252 (
        .y(_node_224),
        .a(2'd3),
        .b(_T_1412)
    );
    wire [63:0] _node_225;
    MUX_UNSIGNED #(.width(64)) u_mux_253 (
        .y(_node_225),
        .sel(_node_224),
        .a(twiddle_rom_3_real_node),
        .b(_node_223)
    );
    wire [63:0] _T_1419_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_254 (
        .y(_T_1419_real_node),
        .sel(_T_1363),
        .a(_T_1401_real_node),
        .b(_node_225)
    );
    wire _node_226;
    EQ_UNSIGNED #(.width(2)) u_eq_255 (
        .y(_node_226),
        .a(2'd0),
        .b(_T_1412)
    );
    wire [63:0] _node_227;
    assign _node_227 = twiddle_rom_0_imaginary_node;
    wire _node_228;
    EQ_UNSIGNED #(.width(2)) u_eq_256 (
        .y(_node_228),
        .a(2'd1),
        .b(_T_1412)
    );
    wire [63:0] _node_229;
    MUX_UNSIGNED #(.width(64)) u_mux_257 (
        .y(_node_229),
        .sel(_node_228),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_227)
    );
    wire _node_230;
    EQ_UNSIGNED #(.width(2)) u_eq_258 (
        .y(_node_230),
        .a(2'd2),
        .b(_T_1412)
    );
    wire [63:0] _node_231;
    MUX_UNSIGNED #(.width(64)) u_mux_259 (
        .y(_node_231),
        .sel(_node_230),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_229)
    );
    wire _node_232;
    EQ_UNSIGNED #(.width(2)) u_eq_260 (
        .y(_node_232),
        .a(2'd3),
        .b(_T_1412)
    );
    wire [63:0] _node_233;
    MUX_UNSIGNED #(.width(64)) u_mux_261 (
        .y(_node_233),
        .sel(_node_232),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_231)
    );
    wire [63:0] _T_1419_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_262 (
        .y(_T_1419_imaginary_node),
        .sel(_T_1363),
        .a(_T_1401_imaginary_node),
        .b(_node_233)
    );
    wire [4:0] _T_1421;
    wire [3:0] _WTEMP_10;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_263 (
        .y(_WTEMP_10),
        .in(2'h2)
    );
    ADD_UNSIGNED #(.width(4)) u_add_264 (
        .y(_T_1421),
        .a(start),
        .b(_WTEMP_10)
    );
    wire [3:0] _T_1422;
    TAIL #(.width(5), .n(1)) tail_265 (
        .y(_T_1422),
        .in(_T_1421)
    );
    wire _node_234;
    EQ_UNSIGNED #(.width(4)) u_eq_266 (
        .y(_node_234),
        .a(4'd0),
        .b(_T_1422)
    );
    wire [2:0] _node_235;
    assign _node_235 = indices_rom_0;
    wire _node_236;
    EQ_UNSIGNED #(.width(4)) u_eq_267 (
        .y(_node_236),
        .a(4'd1),
        .b(_T_1422)
    );
    wire [2:0] _node_237;
    MUX_UNSIGNED #(.width(3)) u_mux_268 (
        .y(_node_237),
        .sel(_node_236),
        .a(indices_rom_1),
        .b(_node_235)
    );
    wire _node_238;
    EQ_UNSIGNED #(.width(4)) u_eq_269 (
        .y(_node_238),
        .a(4'd2),
        .b(_T_1422)
    );
    wire [2:0] _node_239;
    MUX_UNSIGNED #(.width(3)) u_mux_270 (
        .y(_node_239),
        .sel(_node_238),
        .a(indices_rom_2),
        .b(_node_237)
    );
    wire _node_240;
    EQ_UNSIGNED #(.width(4)) u_eq_271 (
        .y(_node_240),
        .a(4'd3),
        .b(_T_1422)
    );
    wire [2:0] _node_241;
    MUX_UNSIGNED #(.width(3)) u_mux_272 (
        .y(_node_241),
        .sel(_node_240),
        .a(indices_rom_3),
        .b(_node_239)
    );
    wire _node_242;
    EQ_UNSIGNED #(.width(4)) u_eq_273 (
        .y(_node_242),
        .a(4'd4),
        .b(_T_1422)
    );
    wire [2:0] _node_243;
    MUX_UNSIGNED #(.width(3)) u_mux_274 (
        .y(_node_243),
        .sel(_node_242),
        .a(indices_rom_4),
        .b(_node_241)
    );
    wire _node_244;
    EQ_UNSIGNED #(.width(4)) u_eq_275 (
        .y(_node_244),
        .a(4'd5),
        .b(_T_1422)
    );
    wire [2:0] _node_245;
    MUX_UNSIGNED #(.width(3)) u_mux_276 (
        .y(_node_245),
        .sel(_node_244),
        .a(indices_rom_5),
        .b(_node_243)
    );
    wire _node_246;
    EQ_UNSIGNED #(.width(4)) u_eq_277 (
        .y(_node_246),
        .a(4'd6),
        .b(_T_1422)
    );
    wire [2:0] _node_247;
    MUX_UNSIGNED #(.width(3)) u_mux_278 (
        .y(_node_247),
        .sel(_node_246),
        .a(indices_rom_6),
        .b(_node_245)
    );
    wire _node_248;
    EQ_UNSIGNED #(.width(4)) u_eq_279 (
        .y(_node_248),
        .a(4'd7),
        .b(_T_1422)
    );
    wire [2:0] _node_249;
    MUX_UNSIGNED #(.width(3)) u_mux_280 (
        .y(_node_249),
        .sel(_node_248),
        .a(indices_rom_7),
        .b(_node_247)
    );
    wire _node_250;
    EQ_UNSIGNED #(.width(4)) u_eq_281 (
        .y(_node_250),
        .a(4'd8),
        .b(_T_1422)
    );
    wire [2:0] _node_251;
    MUX_UNSIGNED #(.width(3)) u_mux_282 (
        .y(_node_251),
        .sel(_node_250),
        .a(indices_rom_8),
        .b(_node_249)
    );
    wire _node_252;
    EQ_UNSIGNED #(.width(4)) u_eq_283 (
        .y(_node_252),
        .a(4'd9),
        .b(_T_1422)
    );
    wire [2:0] _node_253;
    MUX_UNSIGNED #(.width(3)) u_mux_284 (
        .y(_node_253),
        .sel(_node_252),
        .a(indices_rom_9),
        .b(_node_251)
    );
    wire _node_254;
    EQ_UNSIGNED #(.width(4)) u_eq_285 (
        .y(_node_254),
        .a(4'd10),
        .b(_T_1422)
    );
    wire [2:0] _node_255;
    MUX_UNSIGNED #(.width(3)) u_mux_286 (
        .y(_node_255),
        .sel(_node_254),
        .a(indices_rom_10),
        .b(_node_253)
    );
    wire _node_256;
    EQ_UNSIGNED #(.width(4)) u_eq_287 (
        .y(_node_256),
        .a(4'd11),
        .b(_T_1422)
    );
    wire [2:0] _node_257;
    MUX_UNSIGNED #(.width(3)) u_mux_288 (
        .y(_node_257),
        .sel(_node_256),
        .a(indices_rom_11),
        .b(_node_255)
    );
    wire _node_258;
    EQ_UNSIGNED #(.width(4)) u_eq_289 (
        .y(_node_258),
        .a(4'd12),
        .b(_T_1422)
    );
    wire [2:0] _node_259;
    MUX_UNSIGNED #(.width(3)) u_mux_290 (
        .y(_node_259),
        .sel(_node_258),
        .a(indices_rom_12),
        .b(_node_257)
    );
    wire _node_260;
    EQ_UNSIGNED #(.width(4)) u_eq_291 (
        .y(_node_260),
        .a(4'd13),
        .b(_T_1422)
    );
    wire [2:0] _node_261;
    MUX_UNSIGNED #(.width(3)) u_mux_292 (
        .y(_node_261),
        .sel(_node_260),
        .a(indices_rom_13),
        .b(_node_259)
    );
    wire _T_1424;
    BITS #(.width(3), .high(2), .low(2)) bits_293 (
        .y(_T_1424),
        .in(_node_261)
    );
    wire [4:0] _T_1426;
    wire [3:0] _WTEMP_11;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_294 (
        .y(_WTEMP_11),
        .in(2'h2)
    );
    ADD_UNSIGNED #(.width(4)) u_add_295 (
        .y(_T_1426),
        .a(start),
        .b(_WTEMP_11)
    );
    wire [3:0] _T_1427;
    TAIL #(.width(5), .n(1)) tail_296 (
        .y(_T_1427),
        .in(_T_1426)
    );
    wire _node_262;
    EQ_UNSIGNED #(.width(4)) u_eq_297 (
        .y(_node_262),
        .a(4'd0),
        .b(_T_1427)
    );
    wire [2:0] _node_263;
    assign _node_263 = indices_rom_0;
    wire _node_264;
    EQ_UNSIGNED #(.width(4)) u_eq_298 (
        .y(_node_264),
        .a(4'd1),
        .b(_T_1427)
    );
    wire [2:0] _node_265;
    MUX_UNSIGNED #(.width(3)) u_mux_299 (
        .y(_node_265),
        .sel(_node_264),
        .a(indices_rom_1),
        .b(_node_263)
    );
    wire _node_266;
    EQ_UNSIGNED #(.width(4)) u_eq_300 (
        .y(_node_266),
        .a(4'd2),
        .b(_T_1427)
    );
    wire [2:0] _node_267;
    MUX_UNSIGNED #(.width(3)) u_mux_301 (
        .y(_node_267),
        .sel(_node_266),
        .a(indices_rom_2),
        .b(_node_265)
    );
    wire _node_268;
    EQ_UNSIGNED #(.width(4)) u_eq_302 (
        .y(_node_268),
        .a(4'd3),
        .b(_T_1427)
    );
    wire [2:0] _node_269;
    MUX_UNSIGNED #(.width(3)) u_mux_303 (
        .y(_node_269),
        .sel(_node_268),
        .a(indices_rom_3),
        .b(_node_267)
    );
    wire _node_270;
    EQ_UNSIGNED #(.width(4)) u_eq_304 (
        .y(_node_270),
        .a(4'd4),
        .b(_T_1427)
    );
    wire [2:0] _node_271;
    MUX_UNSIGNED #(.width(3)) u_mux_305 (
        .y(_node_271),
        .sel(_node_270),
        .a(indices_rom_4),
        .b(_node_269)
    );
    wire _node_272;
    EQ_UNSIGNED #(.width(4)) u_eq_306 (
        .y(_node_272),
        .a(4'd5),
        .b(_T_1427)
    );
    wire [2:0] _node_273;
    MUX_UNSIGNED #(.width(3)) u_mux_307 (
        .y(_node_273),
        .sel(_node_272),
        .a(indices_rom_5),
        .b(_node_271)
    );
    wire _node_274;
    EQ_UNSIGNED #(.width(4)) u_eq_308 (
        .y(_node_274),
        .a(4'd6),
        .b(_T_1427)
    );
    wire [2:0] _node_275;
    MUX_UNSIGNED #(.width(3)) u_mux_309 (
        .y(_node_275),
        .sel(_node_274),
        .a(indices_rom_6),
        .b(_node_273)
    );
    wire _node_276;
    EQ_UNSIGNED #(.width(4)) u_eq_310 (
        .y(_node_276),
        .a(4'd7),
        .b(_T_1427)
    );
    wire [2:0] _node_277;
    MUX_UNSIGNED #(.width(3)) u_mux_311 (
        .y(_node_277),
        .sel(_node_276),
        .a(indices_rom_7),
        .b(_node_275)
    );
    wire _node_278;
    EQ_UNSIGNED #(.width(4)) u_eq_312 (
        .y(_node_278),
        .a(4'd8),
        .b(_T_1427)
    );
    wire [2:0] _node_279;
    MUX_UNSIGNED #(.width(3)) u_mux_313 (
        .y(_node_279),
        .sel(_node_278),
        .a(indices_rom_8),
        .b(_node_277)
    );
    wire _node_280;
    EQ_UNSIGNED #(.width(4)) u_eq_314 (
        .y(_node_280),
        .a(4'd9),
        .b(_T_1427)
    );
    wire [2:0] _node_281;
    MUX_UNSIGNED #(.width(3)) u_mux_315 (
        .y(_node_281),
        .sel(_node_280),
        .a(indices_rom_9),
        .b(_node_279)
    );
    wire _node_282;
    EQ_UNSIGNED #(.width(4)) u_eq_316 (
        .y(_node_282),
        .a(4'd10),
        .b(_T_1427)
    );
    wire [2:0] _node_283;
    MUX_UNSIGNED #(.width(3)) u_mux_317 (
        .y(_node_283),
        .sel(_node_282),
        .a(indices_rom_10),
        .b(_node_281)
    );
    wire _node_284;
    EQ_UNSIGNED #(.width(4)) u_eq_318 (
        .y(_node_284),
        .a(4'd11),
        .b(_T_1427)
    );
    wire [2:0] _node_285;
    MUX_UNSIGNED #(.width(3)) u_mux_319 (
        .y(_node_285),
        .sel(_node_284),
        .a(indices_rom_11),
        .b(_node_283)
    );
    wire _node_286;
    EQ_UNSIGNED #(.width(4)) u_eq_320 (
        .y(_node_286),
        .a(4'd12),
        .b(_T_1427)
    );
    wire [2:0] _node_287;
    MUX_UNSIGNED #(.width(3)) u_mux_321 (
        .y(_node_287),
        .sel(_node_286),
        .a(indices_rom_12),
        .b(_node_285)
    );
    wire _node_288;
    EQ_UNSIGNED #(.width(4)) u_eq_322 (
        .y(_node_288),
        .a(4'd13),
        .b(_T_1427)
    );
    wire [2:0] _node_289;
    MUX_UNSIGNED #(.width(3)) u_mux_323 (
        .y(_node_289),
        .sel(_node_288),
        .a(indices_rom_13),
        .b(_node_287)
    );
    wire [1:0] _T_1429;
    BITS #(.width(3), .high(1), .low(0)) bits_324 (
        .y(_T_1429),
        .in(_node_289)
    );
    wire [63:0] _T_1439_node;
    wire [63:0] _BBFSubtract_2_1__out;
    wire [63:0] _BBFSubtract_2_1__in2;
    wire [63:0] _BBFSubtract_2_1__in1;
    BBFSubtract BBFSubtract_2_1 (
        .out(_BBFSubtract_2_1__out),
        .in2(_BBFSubtract_2_1__in2),
        .in1(_BBFSubtract_2_1__in1)
    );
    wire _node_290;
    EQ_UNSIGNED #(.width(2)) u_eq_325 (
        .y(_node_290),
        .a(2'd0),
        .b(_T_1429)
    );
    wire [63:0] _node_291;
    assign _node_291 = twiddle_rom_0_real_node;
    wire _node_292;
    EQ_UNSIGNED #(.width(2)) u_eq_326 (
        .y(_node_292),
        .a(2'd1),
        .b(_T_1429)
    );
    wire [63:0] _node_293;
    MUX_UNSIGNED #(.width(64)) u_mux_327 (
        .y(_node_293),
        .sel(_node_292),
        .a(twiddle_rom_1_real_node),
        .b(_node_291)
    );
    wire _node_294;
    EQ_UNSIGNED #(.width(2)) u_eq_328 (
        .y(_node_294),
        .a(2'd2),
        .b(_T_1429)
    );
    wire [63:0] _node_295;
    MUX_UNSIGNED #(.width(64)) u_mux_329 (
        .y(_node_295),
        .sel(_node_294),
        .a(twiddle_rom_2_real_node),
        .b(_node_293)
    );
    wire _node_296;
    EQ_UNSIGNED #(.width(2)) u_eq_330 (
        .y(_node_296),
        .a(2'd3),
        .b(_T_1429)
    );
    wire [63:0] _node_297;
    MUX_UNSIGNED #(.width(64)) u_mux_331 (
        .y(_node_297),
        .sel(_node_296),
        .a(twiddle_rom_3_real_node),
        .b(_node_295)
    );
    wire [63:0] _T_1446_node;
    wire [63:0] _T_1462_real_node;
    wire [63:0] _T_1462_imaginary_node;
    wire _node_298;
    EQ_UNSIGNED #(.width(2)) u_eq_332 (
        .y(_node_298),
        .a(2'd0),
        .b(_T_1429)
    );
    wire [63:0] _node_299;
    assign _node_299 = twiddle_rom_0_imaginary_node;
    wire _node_300;
    EQ_UNSIGNED #(.width(2)) u_eq_333 (
        .y(_node_300),
        .a(2'd1),
        .b(_T_1429)
    );
    wire [63:0] _node_301;
    MUX_UNSIGNED #(.width(64)) u_mux_334 (
        .y(_node_301),
        .sel(_node_300),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_299)
    );
    wire _node_302;
    EQ_UNSIGNED #(.width(2)) u_eq_335 (
        .y(_node_302),
        .a(2'd2),
        .b(_T_1429)
    );
    wire [63:0] _node_303;
    MUX_UNSIGNED #(.width(64)) u_mux_336 (
        .y(_node_303),
        .sel(_node_302),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_301)
    );
    wire _node_304;
    EQ_UNSIGNED #(.width(2)) u_eq_337 (
        .y(_node_304),
        .a(2'd3),
        .b(_T_1429)
    );
    wire [63:0] _node_305;
    MUX_UNSIGNED #(.width(64)) u_mux_338 (
        .y(_node_305),
        .sel(_node_304),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_303)
    );
    wire [4:0] _T_1464;
    wire [3:0] _WTEMP_12;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_339 (
        .y(_WTEMP_12),
        .in(2'h2)
    );
    ADD_UNSIGNED #(.width(4)) u_add_340 (
        .y(_T_1464),
        .a(start),
        .b(_WTEMP_12)
    );
    wire [3:0] _T_1465;
    TAIL #(.width(5), .n(1)) tail_341 (
        .y(_T_1465),
        .in(_T_1464)
    );
    wire _node_306;
    EQ_UNSIGNED #(.width(4)) u_eq_342 (
        .y(_node_306),
        .a(4'd0),
        .b(_T_1465)
    );
    wire [2:0] _node_307;
    assign _node_307 = indices_rom_0;
    wire _node_308;
    EQ_UNSIGNED #(.width(4)) u_eq_343 (
        .y(_node_308),
        .a(4'd1),
        .b(_T_1465)
    );
    wire [2:0] _node_309;
    MUX_UNSIGNED #(.width(3)) u_mux_344 (
        .y(_node_309),
        .sel(_node_308),
        .a(indices_rom_1),
        .b(_node_307)
    );
    wire _node_310;
    EQ_UNSIGNED #(.width(4)) u_eq_345 (
        .y(_node_310),
        .a(4'd2),
        .b(_T_1465)
    );
    wire [2:0] _node_311;
    MUX_UNSIGNED #(.width(3)) u_mux_346 (
        .y(_node_311),
        .sel(_node_310),
        .a(indices_rom_2),
        .b(_node_309)
    );
    wire _node_312;
    EQ_UNSIGNED #(.width(4)) u_eq_347 (
        .y(_node_312),
        .a(4'd3),
        .b(_T_1465)
    );
    wire [2:0] _node_313;
    MUX_UNSIGNED #(.width(3)) u_mux_348 (
        .y(_node_313),
        .sel(_node_312),
        .a(indices_rom_3),
        .b(_node_311)
    );
    wire _node_314;
    EQ_UNSIGNED #(.width(4)) u_eq_349 (
        .y(_node_314),
        .a(4'd4),
        .b(_T_1465)
    );
    wire [2:0] _node_315;
    MUX_UNSIGNED #(.width(3)) u_mux_350 (
        .y(_node_315),
        .sel(_node_314),
        .a(indices_rom_4),
        .b(_node_313)
    );
    wire _node_316;
    EQ_UNSIGNED #(.width(4)) u_eq_351 (
        .y(_node_316),
        .a(4'd5),
        .b(_T_1465)
    );
    wire [2:0] _node_317;
    MUX_UNSIGNED #(.width(3)) u_mux_352 (
        .y(_node_317),
        .sel(_node_316),
        .a(indices_rom_5),
        .b(_node_315)
    );
    wire _node_318;
    EQ_UNSIGNED #(.width(4)) u_eq_353 (
        .y(_node_318),
        .a(4'd6),
        .b(_T_1465)
    );
    wire [2:0] _node_319;
    MUX_UNSIGNED #(.width(3)) u_mux_354 (
        .y(_node_319),
        .sel(_node_318),
        .a(indices_rom_6),
        .b(_node_317)
    );
    wire _node_320;
    EQ_UNSIGNED #(.width(4)) u_eq_355 (
        .y(_node_320),
        .a(4'd7),
        .b(_T_1465)
    );
    wire [2:0] _node_321;
    MUX_UNSIGNED #(.width(3)) u_mux_356 (
        .y(_node_321),
        .sel(_node_320),
        .a(indices_rom_7),
        .b(_node_319)
    );
    wire _node_322;
    EQ_UNSIGNED #(.width(4)) u_eq_357 (
        .y(_node_322),
        .a(4'd8),
        .b(_T_1465)
    );
    wire [2:0] _node_323;
    MUX_UNSIGNED #(.width(3)) u_mux_358 (
        .y(_node_323),
        .sel(_node_322),
        .a(indices_rom_8),
        .b(_node_321)
    );
    wire _node_324;
    EQ_UNSIGNED #(.width(4)) u_eq_359 (
        .y(_node_324),
        .a(4'd9),
        .b(_T_1465)
    );
    wire [2:0] _node_325;
    MUX_UNSIGNED #(.width(3)) u_mux_360 (
        .y(_node_325),
        .sel(_node_324),
        .a(indices_rom_9),
        .b(_node_323)
    );
    wire _node_326;
    EQ_UNSIGNED #(.width(4)) u_eq_361 (
        .y(_node_326),
        .a(4'd10),
        .b(_T_1465)
    );
    wire [2:0] _node_327;
    MUX_UNSIGNED #(.width(3)) u_mux_362 (
        .y(_node_327),
        .sel(_node_326),
        .a(indices_rom_10),
        .b(_node_325)
    );
    wire _node_328;
    EQ_UNSIGNED #(.width(4)) u_eq_363 (
        .y(_node_328),
        .a(4'd11),
        .b(_T_1465)
    );
    wire [2:0] _node_329;
    MUX_UNSIGNED #(.width(3)) u_mux_364 (
        .y(_node_329),
        .sel(_node_328),
        .a(indices_rom_11),
        .b(_node_327)
    );
    wire _node_330;
    EQ_UNSIGNED #(.width(4)) u_eq_365 (
        .y(_node_330),
        .a(4'd12),
        .b(_T_1465)
    );
    wire [2:0] _node_331;
    MUX_UNSIGNED #(.width(3)) u_mux_366 (
        .y(_node_331),
        .sel(_node_330),
        .a(indices_rom_12),
        .b(_node_329)
    );
    wire _node_332;
    EQ_UNSIGNED #(.width(4)) u_eq_367 (
        .y(_node_332),
        .a(4'd13),
        .b(_T_1465)
    );
    wire [2:0] _node_333;
    MUX_UNSIGNED #(.width(3)) u_mux_368 (
        .y(_node_333),
        .sel(_node_332),
        .a(indices_rom_13),
        .b(_node_331)
    );
    wire [1:0] _T_1473;
    BITS #(.width(3), .high(1), .low(0)) bits_369 (
        .y(_T_1473),
        .in(_node_333)
    );
    wire _node_334;
    EQ_UNSIGNED #(.width(2)) u_eq_370 (
        .y(_node_334),
        .a(2'd0),
        .b(_T_1473)
    );
    wire [63:0] _node_335;
    assign _node_335 = twiddle_rom_0_real_node;
    wire _node_336;
    EQ_UNSIGNED #(.width(2)) u_eq_371 (
        .y(_node_336),
        .a(2'd1),
        .b(_T_1473)
    );
    wire [63:0] _node_337;
    MUX_UNSIGNED #(.width(64)) u_mux_372 (
        .y(_node_337),
        .sel(_node_336),
        .a(twiddle_rom_1_real_node),
        .b(_node_335)
    );
    wire _node_338;
    EQ_UNSIGNED #(.width(2)) u_eq_373 (
        .y(_node_338),
        .a(2'd2),
        .b(_T_1473)
    );
    wire [63:0] _node_339;
    MUX_UNSIGNED #(.width(64)) u_mux_374 (
        .y(_node_339),
        .sel(_node_338),
        .a(twiddle_rom_2_real_node),
        .b(_node_337)
    );
    wire _node_340;
    EQ_UNSIGNED #(.width(2)) u_eq_375 (
        .y(_node_340),
        .a(2'd3),
        .b(_T_1473)
    );
    wire [63:0] _node_341;
    MUX_UNSIGNED #(.width(64)) u_mux_376 (
        .y(_node_341),
        .sel(_node_340),
        .a(twiddle_rom_3_real_node),
        .b(_node_339)
    );
    wire [63:0] _T_1480_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_377 (
        .y(_T_1480_real_node),
        .sel(_T_1424),
        .a(_T_1462_real_node),
        .b(_node_341)
    );
    wire _node_342;
    EQ_UNSIGNED #(.width(2)) u_eq_378 (
        .y(_node_342),
        .a(2'd0),
        .b(_T_1473)
    );
    wire [63:0] _node_343;
    assign _node_343 = twiddle_rom_0_imaginary_node;
    wire _node_344;
    EQ_UNSIGNED #(.width(2)) u_eq_379 (
        .y(_node_344),
        .a(2'd1),
        .b(_T_1473)
    );
    wire [63:0] _node_345;
    MUX_UNSIGNED #(.width(64)) u_mux_380 (
        .y(_node_345),
        .sel(_node_344),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_343)
    );
    wire _node_346;
    EQ_UNSIGNED #(.width(2)) u_eq_381 (
        .y(_node_346),
        .a(2'd2),
        .b(_T_1473)
    );
    wire [63:0] _node_347;
    MUX_UNSIGNED #(.width(64)) u_mux_382 (
        .y(_node_347),
        .sel(_node_346),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_345)
    );
    wire _node_348;
    EQ_UNSIGNED #(.width(2)) u_eq_383 (
        .y(_node_348),
        .a(2'd3),
        .b(_T_1473)
    );
    wire [63:0] _node_349;
    MUX_UNSIGNED #(.width(64)) u_mux_384 (
        .y(_node_349),
        .sel(_node_348),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_347)
    );
    wire [63:0] _T_1480_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_385 (
        .y(_T_1480_imaginary_node),
        .sel(_T_1424),
        .a(_T_1462_imaginary_node),
        .b(_node_349)
    );
    wire [4:0] _T_1482;
    wire [3:0] _WTEMP_13;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_386 (
        .y(_WTEMP_13),
        .in(2'h3)
    );
    ADD_UNSIGNED #(.width(4)) u_add_387 (
        .y(_T_1482),
        .a(start),
        .b(_WTEMP_13)
    );
    wire [3:0] _T_1483;
    TAIL #(.width(5), .n(1)) tail_388 (
        .y(_T_1483),
        .in(_T_1482)
    );
    wire _node_350;
    EQ_UNSIGNED #(.width(4)) u_eq_389 (
        .y(_node_350),
        .a(4'd0),
        .b(_T_1483)
    );
    wire [2:0] _node_351;
    assign _node_351 = indices_rom_0;
    wire _node_352;
    EQ_UNSIGNED #(.width(4)) u_eq_390 (
        .y(_node_352),
        .a(4'd1),
        .b(_T_1483)
    );
    wire [2:0] _node_353;
    MUX_UNSIGNED #(.width(3)) u_mux_391 (
        .y(_node_353),
        .sel(_node_352),
        .a(indices_rom_1),
        .b(_node_351)
    );
    wire _node_354;
    EQ_UNSIGNED #(.width(4)) u_eq_392 (
        .y(_node_354),
        .a(4'd2),
        .b(_T_1483)
    );
    wire [2:0] _node_355;
    MUX_UNSIGNED #(.width(3)) u_mux_393 (
        .y(_node_355),
        .sel(_node_354),
        .a(indices_rom_2),
        .b(_node_353)
    );
    wire _node_356;
    EQ_UNSIGNED #(.width(4)) u_eq_394 (
        .y(_node_356),
        .a(4'd3),
        .b(_T_1483)
    );
    wire [2:0] _node_357;
    MUX_UNSIGNED #(.width(3)) u_mux_395 (
        .y(_node_357),
        .sel(_node_356),
        .a(indices_rom_3),
        .b(_node_355)
    );
    wire _node_358;
    EQ_UNSIGNED #(.width(4)) u_eq_396 (
        .y(_node_358),
        .a(4'd4),
        .b(_T_1483)
    );
    wire [2:0] _node_359;
    MUX_UNSIGNED #(.width(3)) u_mux_397 (
        .y(_node_359),
        .sel(_node_358),
        .a(indices_rom_4),
        .b(_node_357)
    );
    wire _node_360;
    EQ_UNSIGNED #(.width(4)) u_eq_398 (
        .y(_node_360),
        .a(4'd5),
        .b(_T_1483)
    );
    wire [2:0] _node_361;
    MUX_UNSIGNED #(.width(3)) u_mux_399 (
        .y(_node_361),
        .sel(_node_360),
        .a(indices_rom_5),
        .b(_node_359)
    );
    wire _node_362;
    EQ_UNSIGNED #(.width(4)) u_eq_400 (
        .y(_node_362),
        .a(4'd6),
        .b(_T_1483)
    );
    wire [2:0] _node_363;
    MUX_UNSIGNED #(.width(3)) u_mux_401 (
        .y(_node_363),
        .sel(_node_362),
        .a(indices_rom_6),
        .b(_node_361)
    );
    wire _node_364;
    EQ_UNSIGNED #(.width(4)) u_eq_402 (
        .y(_node_364),
        .a(4'd7),
        .b(_T_1483)
    );
    wire [2:0] _node_365;
    MUX_UNSIGNED #(.width(3)) u_mux_403 (
        .y(_node_365),
        .sel(_node_364),
        .a(indices_rom_7),
        .b(_node_363)
    );
    wire _node_366;
    EQ_UNSIGNED #(.width(4)) u_eq_404 (
        .y(_node_366),
        .a(4'd8),
        .b(_T_1483)
    );
    wire [2:0] _node_367;
    MUX_UNSIGNED #(.width(3)) u_mux_405 (
        .y(_node_367),
        .sel(_node_366),
        .a(indices_rom_8),
        .b(_node_365)
    );
    wire _node_368;
    EQ_UNSIGNED #(.width(4)) u_eq_406 (
        .y(_node_368),
        .a(4'd9),
        .b(_T_1483)
    );
    wire [2:0] _node_369;
    MUX_UNSIGNED #(.width(3)) u_mux_407 (
        .y(_node_369),
        .sel(_node_368),
        .a(indices_rom_9),
        .b(_node_367)
    );
    wire _node_370;
    EQ_UNSIGNED #(.width(4)) u_eq_408 (
        .y(_node_370),
        .a(4'd10),
        .b(_T_1483)
    );
    wire [2:0] _node_371;
    MUX_UNSIGNED #(.width(3)) u_mux_409 (
        .y(_node_371),
        .sel(_node_370),
        .a(indices_rom_10),
        .b(_node_369)
    );
    wire _node_372;
    EQ_UNSIGNED #(.width(4)) u_eq_410 (
        .y(_node_372),
        .a(4'd11),
        .b(_T_1483)
    );
    wire [2:0] _node_373;
    MUX_UNSIGNED #(.width(3)) u_mux_411 (
        .y(_node_373),
        .sel(_node_372),
        .a(indices_rom_11),
        .b(_node_371)
    );
    wire _node_374;
    EQ_UNSIGNED #(.width(4)) u_eq_412 (
        .y(_node_374),
        .a(4'd12),
        .b(_T_1483)
    );
    wire [2:0] _node_375;
    MUX_UNSIGNED #(.width(3)) u_mux_413 (
        .y(_node_375),
        .sel(_node_374),
        .a(indices_rom_12),
        .b(_node_373)
    );
    wire _node_376;
    EQ_UNSIGNED #(.width(4)) u_eq_414 (
        .y(_node_376),
        .a(4'd13),
        .b(_T_1483)
    );
    wire [2:0] _node_377;
    MUX_UNSIGNED #(.width(3)) u_mux_415 (
        .y(_node_377),
        .sel(_node_376),
        .a(indices_rom_13),
        .b(_node_375)
    );
    wire _T_1485;
    BITS #(.width(3), .high(2), .low(2)) bits_416 (
        .y(_T_1485),
        .in(_node_377)
    );
    wire [4:0] _T_1487;
    wire [3:0] _WTEMP_14;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_417 (
        .y(_WTEMP_14),
        .in(2'h3)
    );
    ADD_UNSIGNED #(.width(4)) u_add_418 (
        .y(_T_1487),
        .a(start),
        .b(_WTEMP_14)
    );
    wire [3:0] _T_1488;
    TAIL #(.width(5), .n(1)) tail_419 (
        .y(_T_1488),
        .in(_T_1487)
    );
    wire _node_378;
    EQ_UNSIGNED #(.width(4)) u_eq_420 (
        .y(_node_378),
        .a(4'd0),
        .b(_T_1488)
    );
    wire [2:0] _node_379;
    assign _node_379 = indices_rom_0;
    wire _node_380;
    EQ_UNSIGNED #(.width(4)) u_eq_421 (
        .y(_node_380),
        .a(4'd1),
        .b(_T_1488)
    );
    wire [2:0] _node_381;
    MUX_UNSIGNED #(.width(3)) u_mux_422 (
        .y(_node_381),
        .sel(_node_380),
        .a(indices_rom_1),
        .b(_node_379)
    );
    wire _node_382;
    EQ_UNSIGNED #(.width(4)) u_eq_423 (
        .y(_node_382),
        .a(4'd2),
        .b(_T_1488)
    );
    wire [2:0] _node_383;
    MUX_UNSIGNED #(.width(3)) u_mux_424 (
        .y(_node_383),
        .sel(_node_382),
        .a(indices_rom_2),
        .b(_node_381)
    );
    wire _node_384;
    EQ_UNSIGNED #(.width(4)) u_eq_425 (
        .y(_node_384),
        .a(4'd3),
        .b(_T_1488)
    );
    wire [2:0] _node_385;
    MUX_UNSIGNED #(.width(3)) u_mux_426 (
        .y(_node_385),
        .sel(_node_384),
        .a(indices_rom_3),
        .b(_node_383)
    );
    wire _node_386;
    EQ_UNSIGNED #(.width(4)) u_eq_427 (
        .y(_node_386),
        .a(4'd4),
        .b(_T_1488)
    );
    wire [2:0] _node_387;
    MUX_UNSIGNED #(.width(3)) u_mux_428 (
        .y(_node_387),
        .sel(_node_386),
        .a(indices_rom_4),
        .b(_node_385)
    );
    wire _node_388;
    EQ_UNSIGNED #(.width(4)) u_eq_429 (
        .y(_node_388),
        .a(4'd5),
        .b(_T_1488)
    );
    wire [2:0] _node_389;
    MUX_UNSIGNED #(.width(3)) u_mux_430 (
        .y(_node_389),
        .sel(_node_388),
        .a(indices_rom_5),
        .b(_node_387)
    );
    wire _node_390;
    EQ_UNSIGNED #(.width(4)) u_eq_431 (
        .y(_node_390),
        .a(4'd6),
        .b(_T_1488)
    );
    wire [2:0] _node_391;
    MUX_UNSIGNED #(.width(3)) u_mux_432 (
        .y(_node_391),
        .sel(_node_390),
        .a(indices_rom_6),
        .b(_node_389)
    );
    wire _node_392;
    EQ_UNSIGNED #(.width(4)) u_eq_433 (
        .y(_node_392),
        .a(4'd7),
        .b(_T_1488)
    );
    wire [2:0] _node_393;
    MUX_UNSIGNED #(.width(3)) u_mux_434 (
        .y(_node_393),
        .sel(_node_392),
        .a(indices_rom_7),
        .b(_node_391)
    );
    wire _node_394;
    EQ_UNSIGNED #(.width(4)) u_eq_435 (
        .y(_node_394),
        .a(4'd8),
        .b(_T_1488)
    );
    wire [2:0] _node_395;
    MUX_UNSIGNED #(.width(3)) u_mux_436 (
        .y(_node_395),
        .sel(_node_394),
        .a(indices_rom_8),
        .b(_node_393)
    );
    wire _node_396;
    EQ_UNSIGNED #(.width(4)) u_eq_437 (
        .y(_node_396),
        .a(4'd9),
        .b(_T_1488)
    );
    wire [2:0] _node_397;
    MUX_UNSIGNED #(.width(3)) u_mux_438 (
        .y(_node_397),
        .sel(_node_396),
        .a(indices_rom_9),
        .b(_node_395)
    );
    wire _node_398;
    EQ_UNSIGNED #(.width(4)) u_eq_439 (
        .y(_node_398),
        .a(4'd10),
        .b(_T_1488)
    );
    wire [2:0] _node_399;
    MUX_UNSIGNED #(.width(3)) u_mux_440 (
        .y(_node_399),
        .sel(_node_398),
        .a(indices_rom_10),
        .b(_node_397)
    );
    wire _node_400;
    EQ_UNSIGNED #(.width(4)) u_eq_441 (
        .y(_node_400),
        .a(4'd11),
        .b(_T_1488)
    );
    wire [2:0] _node_401;
    MUX_UNSIGNED #(.width(3)) u_mux_442 (
        .y(_node_401),
        .sel(_node_400),
        .a(indices_rom_11),
        .b(_node_399)
    );
    wire _node_402;
    EQ_UNSIGNED #(.width(4)) u_eq_443 (
        .y(_node_402),
        .a(4'd12),
        .b(_T_1488)
    );
    wire [2:0] _node_403;
    MUX_UNSIGNED #(.width(3)) u_mux_444 (
        .y(_node_403),
        .sel(_node_402),
        .a(indices_rom_12),
        .b(_node_401)
    );
    wire _node_404;
    EQ_UNSIGNED #(.width(4)) u_eq_445 (
        .y(_node_404),
        .a(4'd13),
        .b(_T_1488)
    );
    wire [2:0] _node_405;
    MUX_UNSIGNED #(.width(3)) u_mux_446 (
        .y(_node_405),
        .sel(_node_404),
        .a(indices_rom_13),
        .b(_node_403)
    );
    wire [1:0] _T_1490;
    BITS #(.width(3), .high(1), .low(0)) bits_447 (
        .y(_T_1490),
        .in(_node_405)
    );
    wire [63:0] _T_1500_node;
    wire [63:0] _BBFSubtract_3_1__out;
    wire [63:0] _BBFSubtract_3_1__in2;
    wire [63:0] _BBFSubtract_3_1__in1;
    BBFSubtract BBFSubtract_3_1 (
        .out(_BBFSubtract_3_1__out),
        .in2(_BBFSubtract_3_1__in2),
        .in1(_BBFSubtract_3_1__in1)
    );
    wire _node_406;
    EQ_UNSIGNED #(.width(2)) u_eq_448 (
        .y(_node_406),
        .a(2'd0),
        .b(_T_1490)
    );
    wire [63:0] _node_407;
    assign _node_407 = twiddle_rom_0_real_node;
    wire _node_408;
    EQ_UNSIGNED #(.width(2)) u_eq_449 (
        .y(_node_408),
        .a(2'd1),
        .b(_T_1490)
    );
    wire [63:0] _node_409;
    MUX_UNSIGNED #(.width(64)) u_mux_450 (
        .y(_node_409),
        .sel(_node_408),
        .a(twiddle_rom_1_real_node),
        .b(_node_407)
    );
    wire _node_410;
    EQ_UNSIGNED #(.width(2)) u_eq_451 (
        .y(_node_410),
        .a(2'd2),
        .b(_T_1490)
    );
    wire [63:0] _node_411;
    MUX_UNSIGNED #(.width(64)) u_mux_452 (
        .y(_node_411),
        .sel(_node_410),
        .a(twiddle_rom_2_real_node),
        .b(_node_409)
    );
    wire _node_412;
    EQ_UNSIGNED #(.width(2)) u_eq_453 (
        .y(_node_412),
        .a(2'd3),
        .b(_T_1490)
    );
    wire [63:0] _node_413;
    MUX_UNSIGNED #(.width(64)) u_mux_454 (
        .y(_node_413),
        .sel(_node_412),
        .a(twiddle_rom_3_real_node),
        .b(_node_411)
    );
    wire [63:0] _T_1507_node;
    wire [63:0] _T_1523_real_node;
    wire [63:0] _T_1523_imaginary_node;
    wire _node_414;
    EQ_UNSIGNED #(.width(2)) u_eq_455 (
        .y(_node_414),
        .a(2'd0),
        .b(_T_1490)
    );
    wire [63:0] _node_415;
    assign _node_415 = twiddle_rom_0_imaginary_node;
    wire _node_416;
    EQ_UNSIGNED #(.width(2)) u_eq_456 (
        .y(_node_416),
        .a(2'd1),
        .b(_T_1490)
    );
    wire [63:0] _node_417;
    MUX_UNSIGNED #(.width(64)) u_mux_457 (
        .y(_node_417),
        .sel(_node_416),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_415)
    );
    wire _node_418;
    EQ_UNSIGNED #(.width(2)) u_eq_458 (
        .y(_node_418),
        .a(2'd2),
        .b(_T_1490)
    );
    wire [63:0] _node_419;
    MUX_UNSIGNED #(.width(64)) u_mux_459 (
        .y(_node_419),
        .sel(_node_418),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_417)
    );
    wire _node_420;
    EQ_UNSIGNED #(.width(2)) u_eq_460 (
        .y(_node_420),
        .a(2'd3),
        .b(_T_1490)
    );
    wire [63:0] _node_421;
    MUX_UNSIGNED #(.width(64)) u_mux_461 (
        .y(_node_421),
        .sel(_node_420),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_419)
    );
    wire [4:0] _T_1525;
    wire [3:0] _WTEMP_15;
    PAD_UNSIGNED #(.width(2), .n(4)) u_pad_462 (
        .y(_WTEMP_15),
        .in(2'h3)
    );
    ADD_UNSIGNED #(.width(4)) u_add_463 (
        .y(_T_1525),
        .a(start),
        .b(_WTEMP_15)
    );
    wire [3:0] _T_1526;
    TAIL #(.width(5), .n(1)) tail_464 (
        .y(_T_1526),
        .in(_T_1525)
    );
    wire _node_422;
    EQ_UNSIGNED #(.width(4)) u_eq_465 (
        .y(_node_422),
        .a(4'd0),
        .b(_T_1526)
    );
    wire [2:0] _node_423;
    assign _node_423 = indices_rom_0;
    wire _node_424;
    EQ_UNSIGNED #(.width(4)) u_eq_466 (
        .y(_node_424),
        .a(4'd1),
        .b(_T_1526)
    );
    wire [2:0] _node_425;
    MUX_UNSIGNED #(.width(3)) u_mux_467 (
        .y(_node_425),
        .sel(_node_424),
        .a(indices_rom_1),
        .b(_node_423)
    );
    wire _node_426;
    EQ_UNSIGNED #(.width(4)) u_eq_468 (
        .y(_node_426),
        .a(4'd2),
        .b(_T_1526)
    );
    wire [2:0] _node_427;
    MUX_UNSIGNED #(.width(3)) u_mux_469 (
        .y(_node_427),
        .sel(_node_426),
        .a(indices_rom_2),
        .b(_node_425)
    );
    wire _node_428;
    EQ_UNSIGNED #(.width(4)) u_eq_470 (
        .y(_node_428),
        .a(4'd3),
        .b(_T_1526)
    );
    wire [2:0] _node_429;
    MUX_UNSIGNED #(.width(3)) u_mux_471 (
        .y(_node_429),
        .sel(_node_428),
        .a(indices_rom_3),
        .b(_node_427)
    );
    wire _node_430;
    EQ_UNSIGNED #(.width(4)) u_eq_472 (
        .y(_node_430),
        .a(4'd4),
        .b(_T_1526)
    );
    wire [2:0] _node_431;
    MUX_UNSIGNED #(.width(3)) u_mux_473 (
        .y(_node_431),
        .sel(_node_430),
        .a(indices_rom_4),
        .b(_node_429)
    );
    wire _node_432;
    EQ_UNSIGNED #(.width(4)) u_eq_474 (
        .y(_node_432),
        .a(4'd5),
        .b(_T_1526)
    );
    wire [2:0] _node_433;
    MUX_UNSIGNED #(.width(3)) u_mux_475 (
        .y(_node_433),
        .sel(_node_432),
        .a(indices_rom_5),
        .b(_node_431)
    );
    wire _node_434;
    EQ_UNSIGNED #(.width(4)) u_eq_476 (
        .y(_node_434),
        .a(4'd6),
        .b(_T_1526)
    );
    wire [2:0] _node_435;
    MUX_UNSIGNED #(.width(3)) u_mux_477 (
        .y(_node_435),
        .sel(_node_434),
        .a(indices_rom_6),
        .b(_node_433)
    );
    wire _node_436;
    EQ_UNSIGNED #(.width(4)) u_eq_478 (
        .y(_node_436),
        .a(4'd7),
        .b(_T_1526)
    );
    wire [2:0] _node_437;
    MUX_UNSIGNED #(.width(3)) u_mux_479 (
        .y(_node_437),
        .sel(_node_436),
        .a(indices_rom_7),
        .b(_node_435)
    );
    wire _node_438;
    EQ_UNSIGNED #(.width(4)) u_eq_480 (
        .y(_node_438),
        .a(4'd8),
        .b(_T_1526)
    );
    wire [2:0] _node_439;
    MUX_UNSIGNED #(.width(3)) u_mux_481 (
        .y(_node_439),
        .sel(_node_438),
        .a(indices_rom_8),
        .b(_node_437)
    );
    wire _node_440;
    EQ_UNSIGNED #(.width(4)) u_eq_482 (
        .y(_node_440),
        .a(4'd9),
        .b(_T_1526)
    );
    wire [2:0] _node_441;
    MUX_UNSIGNED #(.width(3)) u_mux_483 (
        .y(_node_441),
        .sel(_node_440),
        .a(indices_rom_9),
        .b(_node_439)
    );
    wire _node_442;
    EQ_UNSIGNED #(.width(4)) u_eq_484 (
        .y(_node_442),
        .a(4'd10),
        .b(_T_1526)
    );
    wire [2:0] _node_443;
    MUX_UNSIGNED #(.width(3)) u_mux_485 (
        .y(_node_443),
        .sel(_node_442),
        .a(indices_rom_10),
        .b(_node_441)
    );
    wire _node_444;
    EQ_UNSIGNED #(.width(4)) u_eq_486 (
        .y(_node_444),
        .a(4'd11),
        .b(_T_1526)
    );
    wire [2:0] _node_445;
    MUX_UNSIGNED #(.width(3)) u_mux_487 (
        .y(_node_445),
        .sel(_node_444),
        .a(indices_rom_11),
        .b(_node_443)
    );
    wire _node_446;
    EQ_UNSIGNED #(.width(4)) u_eq_488 (
        .y(_node_446),
        .a(4'd12),
        .b(_T_1526)
    );
    wire [2:0] _node_447;
    MUX_UNSIGNED #(.width(3)) u_mux_489 (
        .y(_node_447),
        .sel(_node_446),
        .a(indices_rom_12),
        .b(_node_445)
    );
    wire _node_448;
    EQ_UNSIGNED #(.width(4)) u_eq_490 (
        .y(_node_448),
        .a(4'd13),
        .b(_T_1526)
    );
    wire [2:0] _node_449;
    MUX_UNSIGNED #(.width(3)) u_mux_491 (
        .y(_node_449),
        .sel(_node_448),
        .a(indices_rom_13),
        .b(_node_447)
    );
    wire [1:0] _T_1534;
    BITS #(.width(3), .high(1), .low(0)) bits_492 (
        .y(_T_1534),
        .in(_node_449)
    );
    wire _node_450;
    EQ_UNSIGNED #(.width(2)) u_eq_493 (
        .y(_node_450),
        .a(2'd0),
        .b(_T_1534)
    );
    wire [63:0] _node_451;
    assign _node_451 = twiddle_rom_0_real_node;
    wire _node_452;
    EQ_UNSIGNED #(.width(2)) u_eq_494 (
        .y(_node_452),
        .a(2'd1),
        .b(_T_1534)
    );
    wire [63:0] _node_453;
    MUX_UNSIGNED #(.width(64)) u_mux_495 (
        .y(_node_453),
        .sel(_node_452),
        .a(twiddle_rom_1_real_node),
        .b(_node_451)
    );
    wire _node_454;
    EQ_UNSIGNED #(.width(2)) u_eq_496 (
        .y(_node_454),
        .a(2'd2),
        .b(_T_1534)
    );
    wire [63:0] _node_455;
    MUX_UNSIGNED #(.width(64)) u_mux_497 (
        .y(_node_455),
        .sel(_node_454),
        .a(twiddle_rom_2_real_node),
        .b(_node_453)
    );
    wire _node_456;
    EQ_UNSIGNED #(.width(2)) u_eq_498 (
        .y(_node_456),
        .a(2'd3),
        .b(_T_1534)
    );
    wire [63:0] _node_457;
    MUX_UNSIGNED #(.width(64)) u_mux_499 (
        .y(_node_457),
        .sel(_node_456),
        .a(twiddle_rom_3_real_node),
        .b(_node_455)
    );
    wire [63:0] _T_1541_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_500 (
        .y(_T_1541_real_node),
        .sel(_T_1485),
        .a(_T_1523_real_node),
        .b(_node_457)
    );
    wire _node_458;
    EQ_UNSIGNED #(.width(2)) u_eq_501 (
        .y(_node_458),
        .a(2'd0),
        .b(_T_1534)
    );
    wire [63:0] _node_459;
    assign _node_459 = twiddle_rom_0_imaginary_node;
    wire _node_460;
    EQ_UNSIGNED #(.width(2)) u_eq_502 (
        .y(_node_460),
        .a(2'd1),
        .b(_T_1534)
    );
    wire [63:0] _node_461;
    MUX_UNSIGNED #(.width(64)) u_mux_503 (
        .y(_node_461),
        .sel(_node_460),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_459)
    );
    wire _node_462;
    EQ_UNSIGNED #(.width(2)) u_eq_504 (
        .y(_node_462),
        .a(2'd2),
        .b(_T_1534)
    );
    wire [63:0] _node_463;
    MUX_UNSIGNED #(.width(64)) u_mux_505 (
        .y(_node_463),
        .sel(_node_462),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_461)
    );
    wire _node_464;
    EQ_UNSIGNED #(.width(2)) u_eq_506 (
        .y(_node_464),
        .a(2'd3),
        .b(_T_1534)
    );
    wire [63:0] _node_465;
    MUX_UNSIGNED #(.width(64)) u_mux_507 (
        .y(_node_465),
        .sel(_node_464),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_463)
    );
    wire [63:0] _T_1541_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_508 (
        .y(_T_1541_imaginary_node),
        .sel(_T_1485),
        .a(_T_1523_imaginary_node),
        .b(_node_465)
    );
    wire [4:0] _T_1543;
    wire [3:0] _WTEMP_16;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_509 (
        .y(_WTEMP_16),
        .in(3'h4)
    );
    ADD_UNSIGNED #(.width(4)) u_add_510 (
        .y(_T_1543),
        .a(start),
        .b(_WTEMP_16)
    );
    wire [3:0] _T_1544;
    TAIL #(.width(5), .n(1)) tail_511 (
        .y(_T_1544),
        .in(_T_1543)
    );
    wire _node_466;
    EQ_UNSIGNED #(.width(4)) u_eq_512 (
        .y(_node_466),
        .a(4'd0),
        .b(_T_1544)
    );
    wire [2:0] _node_467;
    assign _node_467 = indices_rom_0;
    wire _node_468;
    EQ_UNSIGNED #(.width(4)) u_eq_513 (
        .y(_node_468),
        .a(4'd1),
        .b(_T_1544)
    );
    wire [2:0] _node_469;
    MUX_UNSIGNED #(.width(3)) u_mux_514 (
        .y(_node_469),
        .sel(_node_468),
        .a(indices_rom_1),
        .b(_node_467)
    );
    wire _node_470;
    EQ_UNSIGNED #(.width(4)) u_eq_515 (
        .y(_node_470),
        .a(4'd2),
        .b(_T_1544)
    );
    wire [2:0] _node_471;
    MUX_UNSIGNED #(.width(3)) u_mux_516 (
        .y(_node_471),
        .sel(_node_470),
        .a(indices_rom_2),
        .b(_node_469)
    );
    wire _node_472;
    EQ_UNSIGNED #(.width(4)) u_eq_517 (
        .y(_node_472),
        .a(4'd3),
        .b(_T_1544)
    );
    wire [2:0] _node_473;
    MUX_UNSIGNED #(.width(3)) u_mux_518 (
        .y(_node_473),
        .sel(_node_472),
        .a(indices_rom_3),
        .b(_node_471)
    );
    wire _node_474;
    EQ_UNSIGNED #(.width(4)) u_eq_519 (
        .y(_node_474),
        .a(4'd4),
        .b(_T_1544)
    );
    wire [2:0] _node_475;
    MUX_UNSIGNED #(.width(3)) u_mux_520 (
        .y(_node_475),
        .sel(_node_474),
        .a(indices_rom_4),
        .b(_node_473)
    );
    wire _node_476;
    EQ_UNSIGNED #(.width(4)) u_eq_521 (
        .y(_node_476),
        .a(4'd5),
        .b(_T_1544)
    );
    wire [2:0] _node_477;
    MUX_UNSIGNED #(.width(3)) u_mux_522 (
        .y(_node_477),
        .sel(_node_476),
        .a(indices_rom_5),
        .b(_node_475)
    );
    wire _node_478;
    EQ_UNSIGNED #(.width(4)) u_eq_523 (
        .y(_node_478),
        .a(4'd6),
        .b(_T_1544)
    );
    wire [2:0] _node_479;
    MUX_UNSIGNED #(.width(3)) u_mux_524 (
        .y(_node_479),
        .sel(_node_478),
        .a(indices_rom_6),
        .b(_node_477)
    );
    wire _node_480;
    EQ_UNSIGNED #(.width(4)) u_eq_525 (
        .y(_node_480),
        .a(4'd7),
        .b(_T_1544)
    );
    wire [2:0] _node_481;
    MUX_UNSIGNED #(.width(3)) u_mux_526 (
        .y(_node_481),
        .sel(_node_480),
        .a(indices_rom_7),
        .b(_node_479)
    );
    wire _node_482;
    EQ_UNSIGNED #(.width(4)) u_eq_527 (
        .y(_node_482),
        .a(4'd8),
        .b(_T_1544)
    );
    wire [2:0] _node_483;
    MUX_UNSIGNED #(.width(3)) u_mux_528 (
        .y(_node_483),
        .sel(_node_482),
        .a(indices_rom_8),
        .b(_node_481)
    );
    wire _node_484;
    EQ_UNSIGNED #(.width(4)) u_eq_529 (
        .y(_node_484),
        .a(4'd9),
        .b(_T_1544)
    );
    wire [2:0] _node_485;
    MUX_UNSIGNED #(.width(3)) u_mux_530 (
        .y(_node_485),
        .sel(_node_484),
        .a(indices_rom_9),
        .b(_node_483)
    );
    wire _node_486;
    EQ_UNSIGNED #(.width(4)) u_eq_531 (
        .y(_node_486),
        .a(4'd10),
        .b(_T_1544)
    );
    wire [2:0] _node_487;
    MUX_UNSIGNED #(.width(3)) u_mux_532 (
        .y(_node_487),
        .sel(_node_486),
        .a(indices_rom_10),
        .b(_node_485)
    );
    wire _node_488;
    EQ_UNSIGNED #(.width(4)) u_eq_533 (
        .y(_node_488),
        .a(4'd11),
        .b(_T_1544)
    );
    wire [2:0] _node_489;
    MUX_UNSIGNED #(.width(3)) u_mux_534 (
        .y(_node_489),
        .sel(_node_488),
        .a(indices_rom_11),
        .b(_node_487)
    );
    wire _node_490;
    EQ_UNSIGNED #(.width(4)) u_eq_535 (
        .y(_node_490),
        .a(4'd12),
        .b(_T_1544)
    );
    wire [2:0] _node_491;
    MUX_UNSIGNED #(.width(3)) u_mux_536 (
        .y(_node_491),
        .sel(_node_490),
        .a(indices_rom_12),
        .b(_node_489)
    );
    wire _node_492;
    EQ_UNSIGNED #(.width(4)) u_eq_537 (
        .y(_node_492),
        .a(4'd13),
        .b(_T_1544)
    );
    wire [2:0] _node_493;
    MUX_UNSIGNED #(.width(3)) u_mux_538 (
        .y(_node_493),
        .sel(_node_492),
        .a(indices_rom_13),
        .b(_node_491)
    );
    wire _T_1546;
    BITS #(.width(3), .high(2), .low(2)) bits_539 (
        .y(_T_1546),
        .in(_node_493)
    );
    wire [4:0] _T_1548;
    wire [3:0] _WTEMP_17;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_540 (
        .y(_WTEMP_17),
        .in(3'h4)
    );
    ADD_UNSIGNED #(.width(4)) u_add_541 (
        .y(_T_1548),
        .a(start),
        .b(_WTEMP_17)
    );
    wire [3:0] _T_1549;
    TAIL #(.width(5), .n(1)) tail_542 (
        .y(_T_1549),
        .in(_T_1548)
    );
    wire _node_494;
    EQ_UNSIGNED #(.width(4)) u_eq_543 (
        .y(_node_494),
        .a(4'd0),
        .b(_T_1549)
    );
    wire [2:0] _node_495;
    assign _node_495 = indices_rom_0;
    wire _node_496;
    EQ_UNSIGNED #(.width(4)) u_eq_544 (
        .y(_node_496),
        .a(4'd1),
        .b(_T_1549)
    );
    wire [2:0] _node_497;
    MUX_UNSIGNED #(.width(3)) u_mux_545 (
        .y(_node_497),
        .sel(_node_496),
        .a(indices_rom_1),
        .b(_node_495)
    );
    wire _node_498;
    EQ_UNSIGNED #(.width(4)) u_eq_546 (
        .y(_node_498),
        .a(4'd2),
        .b(_T_1549)
    );
    wire [2:0] _node_499;
    MUX_UNSIGNED #(.width(3)) u_mux_547 (
        .y(_node_499),
        .sel(_node_498),
        .a(indices_rom_2),
        .b(_node_497)
    );
    wire _node_500;
    EQ_UNSIGNED #(.width(4)) u_eq_548 (
        .y(_node_500),
        .a(4'd3),
        .b(_T_1549)
    );
    wire [2:0] _node_501;
    MUX_UNSIGNED #(.width(3)) u_mux_549 (
        .y(_node_501),
        .sel(_node_500),
        .a(indices_rom_3),
        .b(_node_499)
    );
    wire _node_502;
    EQ_UNSIGNED #(.width(4)) u_eq_550 (
        .y(_node_502),
        .a(4'd4),
        .b(_T_1549)
    );
    wire [2:0] _node_503;
    MUX_UNSIGNED #(.width(3)) u_mux_551 (
        .y(_node_503),
        .sel(_node_502),
        .a(indices_rom_4),
        .b(_node_501)
    );
    wire _node_504;
    EQ_UNSIGNED #(.width(4)) u_eq_552 (
        .y(_node_504),
        .a(4'd5),
        .b(_T_1549)
    );
    wire [2:0] _node_505;
    MUX_UNSIGNED #(.width(3)) u_mux_553 (
        .y(_node_505),
        .sel(_node_504),
        .a(indices_rom_5),
        .b(_node_503)
    );
    wire _node_506;
    EQ_UNSIGNED #(.width(4)) u_eq_554 (
        .y(_node_506),
        .a(4'd6),
        .b(_T_1549)
    );
    wire [2:0] _node_507;
    MUX_UNSIGNED #(.width(3)) u_mux_555 (
        .y(_node_507),
        .sel(_node_506),
        .a(indices_rom_6),
        .b(_node_505)
    );
    wire _node_508;
    EQ_UNSIGNED #(.width(4)) u_eq_556 (
        .y(_node_508),
        .a(4'd7),
        .b(_T_1549)
    );
    wire [2:0] _node_509;
    MUX_UNSIGNED #(.width(3)) u_mux_557 (
        .y(_node_509),
        .sel(_node_508),
        .a(indices_rom_7),
        .b(_node_507)
    );
    wire _node_510;
    EQ_UNSIGNED #(.width(4)) u_eq_558 (
        .y(_node_510),
        .a(4'd8),
        .b(_T_1549)
    );
    wire [2:0] _node_511;
    MUX_UNSIGNED #(.width(3)) u_mux_559 (
        .y(_node_511),
        .sel(_node_510),
        .a(indices_rom_8),
        .b(_node_509)
    );
    wire _node_512;
    EQ_UNSIGNED #(.width(4)) u_eq_560 (
        .y(_node_512),
        .a(4'd9),
        .b(_T_1549)
    );
    wire [2:0] _node_513;
    MUX_UNSIGNED #(.width(3)) u_mux_561 (
        .y(_node_513),
        .sel(_node_512),
        .a(indices_rom_9),
        .b(_node_511)
    );
    wire _node_514;
    EQ_UNSIGNED #(.width(4)) u_eq_562 (
        .y(_node_514),
        .a(4'd10),
        .b(_T_1549)
    );
    wire [2:0] _node_515;
    MUX_UNSIGNED #(.width(3)) u_mux_563 (
        .y(_node_515),
        .sel(_node_514),
        .a(indices_rom_10),
        .b(_node_513)
    );
    wire _node_516;
    EQ_UNSIGNED #(.width(4)) u_eq_564 (
        .y(_node_516),
        .a(4'd11),
        .b(_T_1549)
    );
    wire [2:0] _node_517;
    MUX_UNSIGNED #(.width(3)) u_mux_565 (
        .y(_node_517),
        .sel(_node_516),
        .a(indices_rom_11),
        .b(_node_515)
    );
    wire _node_518;
    EQ_UNSIGNED #(.width(4)) u_eq_566 (
        .y(_node_518),
        .a(4'd12),
        .b(_T_1549)
    );
    wire [2:0] _node_519;
    MUX_UNSIGNED #(.width(3)) u_mux_567 (
        .y(_node_519),
        .sel(_node_518),
        .a(indices_rom_12),
        .b(_node_517)
    );
    wire _node_520;
    EQ_UNSIGNED #(.width(4)) u_eq_568 (
        .y(_node_520),
        .a(4'd13),
        .b(_T_1549)
    );
    wire [2:0] _node_521;
    MUX_UNSIGNED #(.width(3)) u_mux_569 (
        .y(_node_521),
        .sel(_node_520),
        .a(indices_rom_13),
        .b(_node_519)
    );
    wire [1:0] _T_1551;
    BITS #(.width(3), .high(1), .low(0)) bits_570 (
        .y(_T_1551),
        .in(_node_521)
    );
    wire [63:0] _T_1561_node;
    wire [63:0] _BBFSubtract_4_1__out;
    wire [63:0] _BBFSubtract_4_1__in2;
    wire [63:0] _BBFSubtract_4_1__in1;
    BBFSubtract BBFSubtract_4_1 (
        .out(_BBFSubtract_4_1__out),
        .in2(_BBFSubtract_4_1__in2),
        .in1(_BBFSubtract_4_1__in1)
    );
    wire _node_522;
    EQ_UNSIGNED #(.width(2)) u_eq_571 (
        .y(_node_522),
        .a(2'd0),
        .b(_T_1551)
    );
    wire [63:0] _node_523;
    assign _node_523 = twiddle_rom_0_real_node;
    wire _node_524;
    EQ_UNSIGNED #(.width(2)) u_eq_572 (
        .y(_node_524),
        .a(2'd1),
        .b(_T_1551)
    );
    wire [63:0] _node_525;
    MUX_UNSIGNED #(.width(64)) u_mux_573 (
        .y(_node_525),
        .sel(_node_524),
        .a(twiddle_rom_1_real_node),
        .b(_node_523)
    );
    wire _node_526;
    EQ_UNSIGNED #(.width(2)) u_eq_574 (
        .y(_node_526),
        .a(2'd2),
        .b(_T_1551)
    );
    wire [63:0] _node_527;
    MUX_UNSIGNED #(.width(64)) u_mux_575 (
        .y(_node_527),
        .sel(_node_526),
        .a(twiddle_rom_2_real_node),
        .b(_node_525)
    );
    wire _node_528;
    EQ_UNSIGNED #(.width(2)) u_eq_576 (
        .y(_node_528),
        .a(2'd3),
        .b(_T_1551)
    );
    wire [63:0] _node_529;
    MUX_UNSIGNED #(.width(64)) u_mux_577 (
        .y(_node_529),
        .sel(_node_528),
        .a(twiddle_rom_3_real_node),
        .b(_node_527)
    );
    wire [63:0] _T_1568_node;
    wire [63:0] _T_1584_real_node;
    wire [63:0] _T_1584_imaginary_node;
    wire _node_530;
    EQ_UNSIGNED #(.width(2)) u_eq_578 (
        .y(_node_530),
        .a(2'd0),
        .b(_T_1551)
    );
    wire [63:0] _node_531;
    assign _node_531 = twiddle_rom_0_imaginary_node;
    wire _node_532;
    EQ_UNSIGNED #(.width(2)) u_eq_579 (
        .y(_node_532),
        .a(2'd1),
        .b(_T_1551)
    );
    wire [63:0] _node_533;
    MUX_UNSIGNED #(.width(64)) u_mux_580 (
        .y(_node_533),
        .sel(_node_532),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_531)
    );
    wire _node_534;
    EQ_UNSIGNED #(.width(2)) u_eq_581 (
        .y(_node_534),
        .a(2'd2),
        .b(_T_1551)
    );
    wire [63:0] _node_535;
    MUX_UNSIGNED #(.width(64)) u_mux_582 (
        .y(_node_535),
        .sel(_node_534),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_533)
    );
    wire _node_536;
    EQ_UNSIGNED #(.width(2)) u_eq_583 (
        .y(_node_536),
        .a(2'd3),
        .b(_T_1551)
    );
    wire [63:0] _node_537;
    MUX_UNSIGNED #(.width(64)) u_mux_584 (
        .y(_node_537),
        .sel(_node_536),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_535)
    );
    wire [4:0] _T_1586;
    wire [3:0] _WTEMP_18;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_585 (
        .y(_WTEMP_18),
        .in(3'h4)
    );
    ADD_UNSIGNED #(.width(4)) u_add_586 (
        .y(_T_1586),
        .a(start),
        .b(_WTEMP_18)
    );
    wire [3:0] _T_1587;
    TAIL #(.width(5), .n(1)) tail_587 (
        .y(_T_1587),
        .in(_T_1586)
    );
    wire _node_538;
    EQ_UNSIGNED #(.width(4)) u_eq_588 (
        .y(_node_538),
        .a(4'd0),
        .b(_T_1587)
    );
    wire [2:0] _node_539;
    assign _node_539 = indices_rom_0;
    wire _node_540;
    EQ_UNSIGNED #(.width(4)) u_eq_589 (
        .y(_node_540),
        .a(4'd1),
        .b(_T_1587)
    );
    wire [2:0] _node_541;
    MUX_UNSIGNED #(.width(3)) u_mux_590 (
        .y(_node_541),
        .sel(_node_540),
        .a(indices_rom_1),
        .b(_node_539)
    );
    wire _node_542;
    EQ_UNSIGNED #(.width(4)) u_eq_591 (
        .y(_node_542),
        .a(4'd2),
        .b(_T_1587)
    );
    wire [2:0] _node_543;
    MUX_UNSIGNED #(.width(3)) u_mux_592 (
        .y(_node_543),
        .sel(_node_542),
        .a(indices_rom_2),
        .b(_node_541)
    );
    wire _node_544;
    EQ_UNSIGNED #(.width(4)) u_eq_593 (
        .y(_node_544),
        .a(4'd3),
        .b(_T_1587)
    );
    wire [2:0] _node_545;
    MUX_UNSIGNED #(.width(3)) u_mux_594 (
        .y(_node_545),
        .sel(_node_544),
        .a(indices_rom_3),
        .b(_node_543)
    );
    wire _node_546;
    EQ_UNSIGNED #(.width(4)) u_eq_595 (
        .y(_node_546),
        .a(4'd4),
        .b(_T_1587)
    );
    wire [2:0] _node_547;
    MUX_UNSIGNED #(.width(3)) u_mux_596 (
        .y(_node_547),
        .sel(_node_546),
        .a(indices_rom_4),
        .b(_node_545)
    );
    wire _node_548;
    EQ_UNSIGNED #(.width(4)) u_eq_597 (
        .y(_node_548),
        .a(4'd5),
        .b(_T_1587)
    );
    wire [2:0] _node_549;
    MUX_UNSIGNED #(.width(3)) u_mux_598 (
        .y(_node_549),
        .sel(_node_548),
        .a(indices_rom_5),
        .b(_node_547)
    );
    wire _node_550;
    EQ_UNSIGNED #(.width(4)) u_eq_599 (
        .y(_node_550),
        .a(4'd6),
        .b(_T_1587)
    );
    wire [2:0] _node_551;
    MUX_UNSIGNED #(.width(3)) u_mux_600 (
        .y(_node_551),
        .sel(_node_550),
        .a(indices_rom_6),
        .b(_node_549)
    );
    wire _node_552;
    EQ_UNSIGNED #(.width(4)) u_eq_601 (
        .y(_node_552),
        .a(4'd7),
        .b(_T_1587)
    );
    wire [2:0] _node_553;
    MUX_UNSIGNED #(.width(3)) u_mux_602 (
        .y(_node_553),
        .sel(_node_552),
        .a(indices_rom_7),
        .b(_node_551)
    );
    wire _node_554;
    EQ_UNSIGNED #(.width(4)) u_eq_603 (
        .y(_node_554),
        .a(4'd8),
        .b(_T_1587)
    );
    wire [2:0] _node_555;
    MUX_UNSIGNED #(.width(3)) u_mux_604 (
        .y(_node_555),
        .sel(_node_554),
        .a(indices_rom_8),
        .b(_node_553)
    );
    wire _node_556;
    EQ_UNSIGNED #(.width(4)) u_eq_605 (
        .y(_node_556),
        .a(4'd9),
        .b(_T_1587)
    );
    wire [2:0] _node_557;
    MUX_UNSIGNED #(.width(3)) u_mux_606 (
        .y(_node_557),
        .sel(_node_556),
        .a(indices_rom_9),
        .b(_node_555)
    );
    wire _node_558;
    EQ_UNSIGNED #(.width(4)) u_eq_607 (
        .y(_node_558),
        .a(4'd10),
        .b(_T_1587)
    );
    wire [2:0] _node_559;
    MUX_UNSIGNED #(.width(3)) u_mux_608 (
        .y(_node_559),
        .sel(_node_558),
        .a(indices_rom_10),
        .b(_node_557)
    );
    wire _node_560;
    EQ_UNSIGNED #(.width(4)) u_eq_609 (
        .y(_node_560),
        .a(4'd11),
        .b(_T_1587)
    );
    wire [2:0] _node_561;
    MUX_UNSIGNED #(.width(3)) u_mux_610 (
        .y(_node_561),
        .sel(_node_560),
        .a(indices_rom_11),
        .b(_node_559)
    );
    wire _node_562;
    EQ_UNSIGNED #(.width(4)) u_eq_611 (
        .y(_node_562),
        .a(4'd12),
        .b(_T_1587)
    );
    wire [2:0] _node_563;
    MUX_UNSIGNED #(.width(3)) u_mux_612 (
        .y(_node_563),
        .sel(_node_562),
        .a(indices_rom_12),
        .b(_node_561)
    );
    wire _node_564;
    EQ_UNSIGNED #(.width(4)) u_eq_613 (
        .y(_node_564),
        .a(4'd13),
        .b(_T_1587)
    );
    wire [2:0] _node_565;
    MUX_UNSIGNED #(.width(3)) u_mux_614 (
        .y(_node_565),
        .sel(_node_564),
        .a(indices_rom_13),
        .b(_node_563)
    );
    wire [1:0] _T_1595;
    BITS #(.width(3), .high(1), .low(0)) bits_615 (
        .y(_T_1595),
        .in(_node_565)
    );
    wire _node_566;
    EQ_UNSIGNED #(.width(2)) u_eq_616 (
        .y(_node_566),
        .a(2'd0),
        .b(_T_1595)
    );
    wire [63:0] _node_567;
    assign _node_567 = twiddle_rom_0_real_node;
    wire _node_568;
    EQ_UNSIGNED #(.width(2)) u_eq_617 (
        .y(_node_568),
        .a(2'd1),
        .b(_T_1595)
    );
    wire [63:0] _node_569;
    MUX_UNSIGNED #(.width(64)) u_mux_618 (
        .y(_node_569),
        .sel(_node_568),
        .a(twiddle_rom_1_real_node),
        .b(_node_567)
    );
    wire _node_570;
    EQ_UNSIGNED #(.width(2)) u_eq_619 (
        .y(_node_570),
        .a(2'd2),
        .b(_T_1595)
    );
    wire [63:0] _node_571;
    MUX_UNSIGNED #(.width(64)) u_mux_620 (
        .y(_node_571),
        .sel(_node_570),
        .a(twiddle_rom_2_real_node),
        .b(_node_569)
    );
    wire _node_572;
    EQ_UNSIGNED #(.width(2)) u_eq_621 (
        .y(_node_572),
        .a(2'd3),
        .b(_T_1595)
    );
    wire [63:0] _node_573;
    MUX_UNSIGNED #(.width(64)) u_mux_622 (
        .y(_node_573),
        .sel(_node_572),
        .a(twiddle_rom_3_real_node),
        .b(_node_571)
    );
    wire [63:0] _T_1602_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_623 (
        .y(_T_1602_real_node),
        .sel(_T_1546),
        .a(_T_1584_real_node),
        .b(_node_573)
    );
    wire _node_574;
    EQ_UNSIGNED #(.width(2)) u_eq_624 (
        .y(_node_574),
        .a(2'd0),
        .b(_T_1595)
    );
    wire [63:0] _node_575;
    assign _node_575 = twiddle_rom_0_imaginary_node;
    wire _node_576;
    EQ_UNSIGNED #(.width(2)) u_eq_625 (
        .y(_node_576),
        .a(2'd1),
        .b(_T_1595)
    );
    wire [63:0] _node_577;
    MUX_UNSIGNED #(.width(64)) u_mux_626 (
        .y(_node_577),
        .sel(_node_576),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_575)
    );
    wire _node_578;
    EQ_UNSIGNED #(.width(2)) u_eq_627 (
        .y(_node_578),
        .a(2'd2),
        .b(_T_1595)
    );
    wire [63:0] _node_579;
    MUX_UNSIGNED #(.width(64)) u_mux_628 (
        .y(_node_579),
        .sel(_node_578),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_577)
    );
    wire _node_580;
    EQ_UNSIGNED #(.width(2)) u_eq_629 (
        .y(_node_580),
        .a(2'd3),
        .b(_T_1595)
    );
    wire [63:0] _node_581;
    MUX_UNSIGNED #(.width(64)) u_mux_630 (
        .y(_node_581),
        .sel(_node_580),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_579)
    );
    wire [63:0] _T_1602_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_631 (
        .y(_T_1602_imaginary_node),
        .sel(_T_1546),
        .a(_T_1584_imaginary_node),
        .b(_node_581)
    );
    wire [4:0] _T_1604;
    wire [3:0] _WTEMP_19;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_632 (
        .y(_WTEMP_19),
        .in(3'h5)
    );
    ADD_UNSIGNED #(.width(4)) u_add_633 (
        .y(_T_1604),
        .a(start),
        .b(_WTEMP_19)
    );
    wire [3:0] _T_1605;
    TAIL #(.width(5), .n(1)) tail_634 (
        .y(_T_1605),
        .in(_T_1604)
    );
    wire _node_582;
    EQ_UNSIGNED #(.width(4)) u_eq_635 (
        .y(_node_582),
        .a(4'd0),
        .b(_T_1605)
    );
    wire [2:0] _node_583;
    assign _node_583 = indices_rom_0;
    wire _node_584;
    EQ_UNSIGNED #(.width(4)) u_eq_636 (
        .y(_node_584),
        .a(4'd1),
        .b(_T_1605)
    );
    wire [2:0] _node_585;
    MUX_UNSIGNED #(.width(3)) u_mux_637 (
        .y(_node_585),
        .sel(_node_584),
        .a(indices_rom_1),
        .b(_node_583)
    );
    wire _node_586;
    EQ_UNSIGNED #(.width(4)) u_eq_638 (
        .y(_node_586),
        .a(4'd2),
        .b(_T_1605)
    );
    wire [2:0] _node_587;
    MUX_UNSIGNED #(.width(3)) u_mux_639 (
        .y(_node_587),
        .sel(_node_586),
        .a(indices_rom_2),
        .b(_node_585)
    );
    wire _node_588;
    EQ_UNSIGNED #(.width(4)) u_eq_640 (
        .y(_node_588),
        .a(4'd3),
        .b(_T_1605)
    );
    wire [2:0] _node_589;
    MUX_UNSIGNED #(.width(3)) u_mux_641 (
        .y(_node_589),
        .sel(_node_588),
        .a(indices_rom_3),
        .b(_node_587)
    );
    wire _node_590;
    EQ_UNSIGNED #(.width(4)) u_eq_642 (
        .y(_node_590),
        .a(4'd4),
        .b(_T_1605)
    );
    wire [2:0] _node_591;
    MUX_UNSIGNED #(.width(3)) u_mux_643 (
        .y(_node_591),
        .sel(_node_590),
        .a(indices_rom_4),
        .b(_node_589)
    );
    wire _node_592;
    EQ_UNSIGNED #(.width(4)) u_eq_644 (
        .y(_node_592),
        .a(4'd5),
        .b(_T_1605)
    );
    wire [2:0] _node_593;
    MUX_UNSIGNED #(.width(3)) u_mux_645 (
        .y(_node_593),
        .sel(_node_592),
        .a(indices_rom_5),
        .b(_node_591)
    );
    wire _node_594;
    EQ_UNSIGNED #(.width(4)) u_eq_646 (
        .y(_node_594),
        .a(4'd6),
        .b(_T_1605)
    );
    wire [2:0] _node_595;
    MUX_UNSIGNED #(.width(3)) u_mux_647 (
        .y(_node_595),
        .sel(_node_594),
        .a(indices_rom_6),
        .b(_node_593)
    );
    wire _node_596;
    EQ_UNSIGNED #(.width(4)) u_eq_648 (
        .y(_node_596),
        .a(4'd7),
        .b(_T_1605)
    );
    wire [2:0] _node_597;
    MUX_UNSIGNED #(.width(3)) u_mux_649 (
        .y(_node_597),
        .sel(_node_596),
        .a(indices_rom_7),
        .b(_node_595)
    );
    wire _node_598;
    EQ_UNSIGNED #(.width(4)) u_eq_650 (
        .y(_node_598),
        .a(4'd8),
        .b(_T_1605)
    );
    wire [2:0] _node_599;
    MUX_UNSIGNED #(.width(3)) u_mux_651 (
        .y(_node_599),
        .sel(_node_598),
        .a(indices_rom_8),
        .b(_node_597)
    );
    wire _node_600;
    EQ_UNSIGNED #(.width(4)) u_eq_652 (
        .y(_node_600),
        .a(4'd9),
        .b(_T_1605)
    );
    wire [2:0] _node_601;
    MUX_UNSIGNED #(.width(3)) u_mux_653 (
        .y(_node_601),
        .sel(_node_600),
        .a(indices_rom_9),
        .b(_node_599)
    );
    wire _node_602;
    EQ_UNSIGNED #(.width(4)) u_eq_654 (
        .y(_node_602),
        .a(4'd10),
        .b(_T_1605)
    );
    wire [2:0] _node_603;
    MUX_UNSIGNED #(.width(3)) u_mux_655 (
        .y(_node_603),
        .sel(_node_602),
        .a(indices_rom_10),
        .b(_node_601)
    );
    wire _node_604;
    EQ_UNSIGNED #(.width(4)) u_eq_656 (
        .y(_node_604),
        .a(4'd11),
        .b(_T_1605)
    );
    wire [2:0] _node_605;
    MUX_UNSIGNED #(.width(3)) u_mux_657 (
        .y(_node_605),
        .sel(_node_604),
        .a(indices_rom_11),
        .b(_node_603)
    );
    wire _node_606;
    EQ_UNSIGNED #(.width(4)) u_eq_658 (
        .y(_node_606),
        .a(4'd12),
        .b(_T_1605)
    );
    wire [2:0] _node_607;
    MUX_UNSIGNED #(.width(3)) u_mux_659 (
        .y(_node_607),
        .sel(_node_606),
        .a(indices_rom_12),
        .b(_node_605)
    );
    wire _node_608;
    EQ_UNSIGNED #(.width(4)) u_eq_660 (
        .y(_node_608),
        .a(4'd13),
        .b(_T_1605)
    );
    wire [2:0] _node_609;
    MUX_UNSIGNED #(.width(3)) u_mux_661 (
        .y(_node_609),
        .sel(_node_608),
        .a(indices_rom_13),
        .b(_node_607)
    );
    wire _T_1607;
    BITS #(.width(3), .high(2), .low(2)) bits_662 (
        .y(_T_1607),
        .in(_node_609)
    );
    wire [4:0] _T_1609;
    wire [3:0] _WTEMP_20;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_663 (
        .y(_WTEMP_20),
        .in(3'h5)
    );
    ADD_UNSIGNED #(.width(4)) u_add_664 (
        .y(_T_1609),
        .a(start),
        .b(_WTEMP_20)
    );
    wire [3:0] _T_1610;
    TAIL #(.width(5), .n(1)) tail_665 (
        .y(_T_1610),
        .in(_T_1609)
    );
    wire _node_610;
    EQ_UNSIGNED #(.width(4)) u_eq_666 (
        .y(_node_610),
        .a(4'd0),
        .b(_T_1610)
    );
    wire [2:0] _node_611;
    assign _node_611 = indices_rom_0;
    wire _node_612;
    EQ_UNSIGNED #(.width(4)) u_eq_667 (
        .y(_node_612),
        .a(4'd1),
        .b(_T_1610)
    );
    wire [2:0] _node_613;
    MUX_UNSIGNED #(.width(3)) u_mux_668 (
        .y(_node_613),
        .sel(_node_612),
        .a(indices_rom_1),
        .b(_node_611)
    );
    wire _node_614;
    EQ_UNSIGNED #(.width(4)) u_eq_669 (
        .y(_node_614),
        .a(4'd2),
        .b(_T_1610)
    );
    wire [2:0] _node_615;
    MUX_UNSIGNED #(.width(3)) u_mux_670 (
        .y(_node_615),
        .sel(_node_614),
        .a(indices_rom_2),
        .b(_node_613)
    );
    wire _node_616;
    EQ_UNSIGNED #(.width(4)) u_eq_671 (
        .y(_node_616),
        .a(4'd3),
        .b(_T_1610)
    );
    wire [2:0] _node_617;
    MUX_UNSIGNED #(.width(3)) u_mux_672 (
        .y(_node_617),
        .sel(_node_616),
        .a(indices_rom_3),
        .b(_node_615)
    );
    wire _node_618;
    EQ_UNSIGNED #(.width(4)) u_eq_673 (
        .y(_node_618),
        .a(4'd4),
        .b(_T_1610)
    );
    wire [2:0] _node_619;
    MUX_UNSIGNED #(.width(3)) u_mux_674 (
        .y(_node_619),
        .sel(_node_618),
        .a(indices_rom_4),
        .b(_node_617)
    );
    wire _node_620;
    EQ_UNSIGNED #(.width(4)) u_eq_675 (
        .y(_node_620),
        .a(4'd5),
        .b(_T_1610)
    );
    wire [2:0] _node_621;
    MUX_UNSIGNED #(.width(3)) u_mux_676 (
        .y(_node_621),
        .sel(_node_620),
        .a(indices_rom_5),
        .b(_node_619)
    );
    wire _node_622;
    EQ_UNSIGNED #(.width(4)) u_eq_677 (
        .y(_node_622),
        .a(4'd6),
        .b(_T_1610)
    );
    wire [2:0] _node_623;
    MUX_UNSIGNED #(.width(3)) u_mux_678 (
        .y(_node_623),
        .sel(_node_622),
        .a(indices_rom_6),
        .b(_node_621)
    );
    wire _node_624;
    EQ_UNSIGNED #(.width(4)) u_eq_679 (
        .y(_node_624),
        .a(4'd7),
        .b(_T_1610)
    );
    wire [2:0] _node_625;
    MUX_UNSIGNED #(.width(3)) u_mux_680 (
        .y(_node_625),
        .sel(_node_624),
        .a(indices_rom_7),
        .b(_node_623)
    );
    wire _node_626;
    EQ_UNSIGNED #(.width(4)) u_eq_681 (
        .y(_node_626),
        .a(4'd8),
        .b(_T_1610)
    );
    wire [2:0] _node_627;
    MUX_UNSIGNED #(.width(3)) u_mux_682 (
        .y(_node_627),
        .sel(_node_626),
        .a(indices_rom_8),
        .b(_node_625)
    );
    wire _node_628;
    EQ_UNSIGNED #(.width(4)) u_eq_683 (
        .y(_node_628),
        .a(4'd9),
        .b(_T_1610)
    );
    wire [2:0] _node_629;
    MUX_UNSIGNED #(.width(3)) u_mux_684 (
        .y(_node_629),
        .sel(_node_628),
        .a(indices_rom_9),
        .b(_node_627)
    );
    wire _node_630;
    EQ_UNSIGNED #(.width(4)) u_eq_685 (
        .y(_node_630),
        .a(4'd10),
        .b(_T_1610)
    );
    wire [2:0] _node_631;
    MUX_UNSIGNED #(.width(3)) u_mux_686 (
        .y(_node_631),
        .sel(_node_630),
        .a(indices_rom_10),
        .b(_node_629)
    );
    wire _node_632;
    EQ_UNSIGNED #(.width(4)) u_eq_687 (
        .y(_node_632),
        .a(4'd11),
        .b(_T_1610)
    );
    wire [2:0] _node_633;
    MUX_UNSIGNED #(.width(3)) u_mux_688 (
        .y(_node_633),
        .sel(_node_632),
        .a(indices_rom_11),
        .b(_node_631)
    );
    wire _node_634;
    EQ_UNSIGNED #(.width(4)) u_eq_689 (
        .y(_node_634),
        .a(4'd12),
        .b(_T_1610)
    );
    wire [2:0] _node_635;
    MUX_UNSIGNED #(.width(3)) u_mux_690 (
        .y(_node_635),
        .sel(_node_634),
        .a(indices_rom_12),
        .b(_node_633)
    );
    wire _node_636;
    EQ_UNSIGNED #(.width(4)) u_eq_691 (
        .y(_node_636),
        .a(4'd13),
        .b(_T_1610)
    );
    wire [2:0] _node_637;
    MUX_UNSIGNED #(.width(3)) u_mux_692 (
        .y(_node_637),
        .sel(_node_636),
        .a(indices_rom_13),
        .b(_node_635)
    );
    wire [1:0] _T_1612;
    BITS #(.width(3), .high(1), .low(0)) bits_693 (
        .y(_T_1612),
        .in(_node_637)
    );
    wire [63:0] _T_1622_node;
    wire [63:0] _BBFSubtract_5_1__out;
    wire [63:0] _BBFSubtract_5_1__in2;
    wire [63:0] _BBFSubtract_5_1__in1;
    BBFSubtract BBFSubtract_5_1 (
        .out(_BBFSubtract_5_1__out),
        .in2(_BBFSubtract_5_1__in2),
        .in1(_BBFSubtract_5_1__in1)
    );
    wire _node_638;
    EQ_UNSIGNED #(.width(2)) u_eq_694 (
        .y(_node_638),
        .a(2'd0),
        .b(_T_1612)
    );
    wire [63:0] _node_639;
    assign _node_639 = twiddle_rom_0_real_node;
    wire _node_640;
    EQ_UNSIGNED #(.width(2)) u_eq_695 (
        .y(_node_640),
        .a(2'd1),
        .b(_T_1612)
    );
    wire [63:0] _node_641;
    MUX_UNSIGNED #(.width(64)) u_mux_696 (
        .y(_node_641),
        .sel(_node_640),
        .a(twiddle_rom_1_real_node),
        .b(_node_639)
    );
    wire _node_642;
    EQ_UNSIGNED #(.width(2)) u_eq_697 (
        .y(_node_642),
        .a(2'd2),
        .b(_T_1612)
    );
    wire [63:0] _node_643;
    MUX_UNSIGNED #(.width(64)) u_mux_698 (
        .y(_node_643),
        .sel(_node_642),
        .a(twiddle_rom_2_real_node),
        .b(_node_641)
    );
    wire _node_644;
    EQ_UNSIGNED #(.width(2)) u_eq_699 (
        .y(_node_644),
        .a(2'd3),
        .b(_T_1612)
    );
    wire [63:0] _node_645;
    MUX_UNSIGNED #(.width(64)) u_mux_700 (
        .y(_node_645),
        .sel(_node_644),
        .a(twiddle_rom_3_real_node),
        .b(_node_643)
    );
    wire [63:0] _T_1629_node;
    wire [63:0] _T_1645_real_node;
    wire [63:0] _T_1645_imaginary_node;
    wire _node_646;
    EQ_UNSIGNED #(.width(2)) u_eq_701 (
        .y(_node_646),
        .a(2'd0),
        .b(_T_1612)
    );
    wire [63:0] _node_647;
    assign _node_647 = twiddle_rom_0_imaginary_node;
    wire _node_648;
    EQ_UNSIGNED #(.width(2)) u_eq_702 (
        .y(_node_648),
        .a(2'd1),
        .b(_T_1612)
    );
    wire [63:0] _node_649;
    MUX_UNSIGNED #(.width(64)) u_mux_703 (
        .y(_node_649),
        .sel(_node_648),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_647)
    );
    wire _node_650;
    EQ_UNSIGNED #(.width(2)) u_eq_704 (
        .y(_node_650),
        .a(2'd2),
        .b(_T_1612)
    );
    wire [63:0] _node_651;
    MUX_UNSIGNED #(.width(64)) u_mux_705 (
        .y(_node_651),
        .sel(_node_650),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_649)
    );
    wire _node_652;
    EQ_UNSIGNED #(.width(2)) u_eq_706 (
        .y(_node_652),
        .a(2'd3),
        .b(_T_1612)
    );
    wire [63:0] _node_653;
    MUX_UNSIGNED #(.width(64)) u_mux_707 (
        .y(_node_653),
        .sel(_node_652),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_651)
    );
    wire [4:0] _T_1647;
    wire [3:0] _WTEMP_21;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_708 (
        .y(_WTEMP_21),
        .in(3'h5)
    );
    ADD_UNSIGNED #(.width(4)) u_add_709 (
        .y(_T_1647),
        .a(start),
        .b(_WTEMP_21)
    );
    wire [3:0] _T_1648;
    TAIL #(.width(5), .n(1)) tail_710 (
        .y(_T_1648),
        .in(_T_1647)
    );
    wire _node_654;
    EQ_UNSIGNED #(.width(4)) u_eq_711 (
        .y(_node_654),
        .a(4'd0),
        .b(_T_1648)
    );
    wire [2:0] _node_655;
    assign _node_655 = indices_rom_0;
    wire _node_656;
    EQ_UNSIGNED #(.width(4)) u_eq_712 (
        .y(_node_656),
        .a(4'd1),
        .b(_T_1648)
    );
    wire [2:0] _node_657;
    MUX_UNSIGNED #(.width(3)) u_mux_713 (
        .y(_node_657),
        .sel(_node_656),
        .a(indices_rom_1),
        .b(_node_655)
    );
    wire _node_658;
    EQ_UNSIGNED #(.width(4)) u_eq_714 (
        .y(_node_658),
        .a(4'd2),
        .b(_T_1648)
    );
    wire [2:0] _node_659;
    MUX_UNSIGNED #(.width(3)) u_mux_715 (
        .y(_node_659),
        .sel(_node_658),
        .a(indices_rom_2),
        .b(_node_657)
    );
    wire _node_660;
    EQ_UNSIGNED #(.width(4)) u_eq_716 (
        .y(_node_660),
        .a(4'd3),
        .b(_T_1648)
    );
    wire [2:0] _node_661;
    MUX_UNSIGNED #(.width(3)) u_mux_717 (
        .y(_node_661),
        .sel(_node_660),
        .a(indices_rom_3),
        .b(_node_659)
    );
    wire _node_662;
    EQ_UNSIGNED #(.width(4)) u_eq_718 (
        .y(_node_662),
        .a(4'd4),
        .b(_T_1648)
    );
    wire [2:0] _node_663;
    MUX_UNSIGNED #(.width(3)) u_mux_719 (
        .y(_node_663),
        .sel(_node_662),
        .a(indices_rom_4),
        .b(_node_661)
    );
    wire _node_664;
    EQ_UNSIGNED #(.width(4)) u_eq_720 (
        .y(_node_664),
        .a(4'd5),
        .b(_T_1648)
    );
    wire [2:0] _node_665;
    MUX_UNSIGNED #(.width(3)) u_mux_721 (
        .y(_node_665),
        .sel(_node_664),
        .a(indices_rom_5),
        .b(_node_663)
    );
    wire _node_666;
    EQ_UNSIGNED #(.width(4)) u_eq_722 (
        .y(_node_666),
        .a(4'd6),
        .b(_T_1648)
    );
    wire [2:0] _node_667;
    MUX_UNSIGNED #(.width(3)) u_mux_723 (
        .y(_node_667),
        .sel(_node_666),
        .a(indices_rom_6),
        .b(_node_665)
    );
    wire _node_668;
    EQ_UNSIGNED #(.width(4)) u_eq_724 (
        .y(_node_668),
        .a(4'd7),
        .b(_T_1648)
    );
    wire [2:0] _node_669;
    MUX_UNSIGNED #(.width(3)) u_mux_725 (
        .y(_node_669),
        .sel(_node_668),
        .a(indices_rom_7),
        .b(_node_667)
    );
    wire _node_670;
    EQ_UNSIGNED #(.width(4)) u_eq_726 (
        .y(_node_670),
        .a(4'd8),
        .b(_T_1648)
    );
    wire [2:0] _node_671;
    MUX_UNSIGNED #(.width(3)) u_mux_727 (
        .y(_node_671),
        .sel(_node_670),
        .a(indices_rom_8),
        .b(_node_669)
    );
    wire _node_672;
    EQ_UNSIGNED #(.width(4)) u_eq_728 (
        .y(_node_672),
        .a(4'd9),
        .b(_T_1648)
    );
    wire [2:0] _node_673;
    MUX_UNSIGNED #(.width(3)) u_mux_729 (
        .y(_node_673),
        .sel(_node_672),
        .a(indices_rom_9),
        .b(_node_671)
    );
    wire _node_674;
    EQ_UNSIGNED #(.width(4)) u_eq_730 (
        .y(_node_674),
        .a(4'd10),
        .b(_T_1648)
    );
    wire [2:0] _node_675;
    MUX_UNSIGNED #(.width(3)) u_mux_731 (
        .y(_node_675),
        .sel(_node_674),
        .a(indices_rom_10),
        .b(_node_673)
    );
    wire _node_676;
    EQ_UNSIGNED #(.width(4)) u_eq_732 (
        .y(_node_676),
        .a(4'd11),
        .b(_T_1648)
    );
    wire [2:0] _node_677;
    MUX_UNSIGNED #(.width(3)) u_mux_733 (
        .y(_node_677),
        .sel(_node_676),
        .a(indices_rom_11),
        .b(_node_675)
    );
    wire _node_678;
    EQ_UNSIGNED #(.width(4)) u_eq_734 (
        .y(_node_678),
        .a(4'd12),
        .b(_T_1648)
    );
    wire [2:0] _node_679;
    MUX_UNSIGNED #(.width(3)) u_mux_735 (
        .y(_node_679),
        .sel(_node_678),
        .a(indices_rom_12),
        .b(_node_677)
    );
    wire _node_680;
    EQ_UNSIGNED #(.width(4)) u_eq_736 (
        .y(_node_680),
        .a(4'd13),
        .b(_T_1648)
    );
    wire [2:0] _node_681;
    MUX_UNSIGNED #(.width(3)) u_mux_737 (
        .y(_node_681),
        .sel(_node_680),
        .a(indices_rom_13),
        .b(_node_679)
    );
    wire [1:0] _T_1656;
    BITS #(.width(3), .high(1), .low(0)) bits_738 (
        .y(_T_1656),
        .in(_node_681)
    );
    wire _node_682;
    EQ_UNSIGNED #(.width(2)) u_eq_739 (
        .y(_node_682),
        .a(2'd0),
        .b(_T_1656)
    );
    wire [63:0] _node_683;
    assign _node_683 = twiddle_rom_0_real_node;
    wire _node_684;
    EQ_UNSIGNED #(.width(2)) u_eq_740 (
        .y(_node_684),
        .a(2'd1),
        .b(_T_1656)
    );
    wire [63:0] _node_685;
    MUX_UNSIGNED #(.width(64)) u_mux_741 (
        .y(_node_685),
        .sel(_node_684),
        .a(twiddle_rom_1_real_node),
        .b(_node_683)
    );
    wire _node_686;
    EQ_UNSIGNED #(.width(2)) u_eq_742 (
        .y(_node_686),
        .a(2'd2),
        .b(_T_1656)
    );
    wire [63:0] _node_687;
    MUX_UNSIGNED #(.width(64)) u_mux_743 (
        .y(_node_687),
        .sel(_node_686),
        .a(twiddle_rom_2_real_node),
        .b(_node_685)
    );
    wire _node_688;
    EQ_UNSIGNED #(.width(2)) u_eq_744 (
        .y(_node_688),
        .a(2'd3),
        .b(_T_1656)
    );
    wire [63:0] _node_689;
    MUX_UNSIGNED #(.width(64)) u_mux_745 (
        .y(_node_689),
        .sel(_node_688),
        .a(twiddle_rom_3_real_node),
        .b(_node_687)
    );
    wire [63:0] _T_1663_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_746 (
        .y(_T_1663_real_node),
        .sel(_T_1607),
        .a(_T_1645_real_node),
        .b(_node_689)
    );
    wire _node_690;
    EQ_UNSIGNED #(.width(2)) u_eq_747 (
        .y(_node_690),
        .a(2'd0),
        .b(_T_1656)
    );
    wire [63:0] _node_691;
    assign _node_691 = twiddle_rom_0_imaginary_node;
    wire _node_692;
    EQ_UNSIGNED #(.width(2)) u_eq_748 (
        .y(_node_692),
        .a(2'd1),
        .b(_T_1656)
    );
    wire [63:0] _node_693;
    MUX_UNSIGNED #(.width(64)) u_mux_749 (
        .y(_node_693),
        .sel(_node_692),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_691)
    );
    wire _node_694;
    EQ_UNSIGNED #(.width(2)) u_eq_750 (
        .y(_node_694),
        .a(2'd2),
        .b(_T_1656)
    );
    wire [63:0] _node_695;
    MUX_UNSIGNED #(.width(64)) u_mux_751 (
        .y(_node_695),
        .sel(_node_694),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_693)
    );
    wire _node_696;
    EQ_UNSIGNED #(.width(2)) u_eq_752 (
        .y(_node_696),
        .a(2'd3),
        .b(_T_1656)
    );
    wire [63:0] _node_697;
    MUX_UNSIGNED #(.width(64)) u_mux_753 (
        .y(_node_697),
        .sel(_node_696),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_695)
    );
    wire [63:0] _T_1663_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_754 (
        .y(_T_1663_imaginary_node),
        .sel(_T_1607),
        .a(_T_1645_imaginary_node),
        .b(_node_697)
    );
    wire [4:0] _T_1665;
    wire [3:0] _WTEMP_22;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_755 (
        .y(_WTEMP_22),
        .in(3'h6)
    );
    ADD_UNSIGNED #(.width(4)) u_add_756 (
        .y(_T_1665),
        .a(start),
        .b(_WTEMP_22)
    );
    wire [3:0] _T_1666;
    TAIL #(.width(5), .n(1)) tail_757 (
        .y(_T_1666),
        .in(_T_1665)
    );
    wire _node_698;
    EQ_UNSIGNED #(.width(4)) u_eq_758 (
        .y(_node_698),
        .a(4'd0),
        .b(_T_1666)
    );
    wire [2:0] _node_699;
    assign _node_699 = indices_rom_0;
    wire _node_700;
    EQ_UNSIGNED #(.width(4)) u_eq_759 (
        .y(_node_700),
        .a(4'd1),
        .b(_T_1666)
    );
    wire [2:0] _node_701;
    MUX_UNSIGNED #(.width(3)) u_mux_760 (
        .y(_node_701),
        .sel(_node_700),
        .a(indices_rom_1),
        .b(_node_699)
    );
    wire _node_702;
    EQ_UNSIGNED #(.width(4)) u_eq_761 (
        .y(_node_702),
        .a(4'd2),
        .b(_T_1666)
    );
    wire [2:0] _node_703;
    MUX_UNSIGNED #(.width(3)) u_mux_762 (
        .y(_node_703),
        .sel(_node_702),
        .a(indices_rom_2),
        .b(_node_701)
    );
    wire _node_704;
    EQ_UNSIGNED #(.width(4)) u_eq_763 (
        .y(_node_704),
        .a(4'd3),
        .b(_T_1666)
    );
    wire [2:0] _node_705;
    MUX_UNSIGNED #(.width(3)) u_mux_764 (
        .y(_node_705),
        .sel(_node_704),
        .a(indices_rom_3),
        .b(_node_703)
    );
    wire _node_706;
    EQ_UNSIGNED #(.width(4)) u_eq_765 (
        .y(_node_706),
        .a(4'd4),
        .b(_T_1666)
    );
    wire [2:0] _node_707;
    MUX_UNSIGNED #(.width(3)) u_mux_766 (
        .y(_node_707),
        .sel(_node_706),
        .a(indices_rom_4),
        .b(_node_705)
    );
    wire _node_708;
    EQ_UNSIGNED #(.width(4)) u_eq_767 (
        .y(_node_708),
        .a(4'd5),
        .b(_T_1666)
    );
    wire [2:0] _node_709;
    MUX_UNSIGNED #(.width(3)) u_mux_768 (
        .y(_node_709),
        .sel(_node_708),
        .a(indices_rom_5),
        .b(_node_707)
    );
    wire _node_710;
    EQ_UNSIGNED #(.width(4)) u_eq_769 (
        .y(_node_710),
        .a(4'd6),
        .b(_T_1666)
    );
    wire [2:0] _node_711;
    MUX_UNSIGNED #(.width(3)) u_mux_770 (
        .y(_node_711),
        .sel(_node_710),
        .a(indices_rom_6),
        .b(_node_709)
    );
    wire _node_712;
    EQ_UNSIGNED #(.width(4)) u_eq_771 (
        .y(_node_712),
        .a(4'd7),
        .b(_T_1666)
    );
    wire [2:0] _node_713;
    MUX_UNSIGNED #(.width(3)) u_mux_772 (
        .y(_node_713),
        .sel(_node_712),
        .a(indices_rom_7),
        .b(_node_711)
    );
    wire _node_714;
    EQ_UNSIGNED #(.width(4)) u_eq_773 (
        .y(_node_714),
        .a(4'd8),
        .b(_T_1666)
    );
    wire [2:0] _node_715;
    MUX_UNSIGNED #(.width(3)) u_mux_774 (
        .y(_node_715),
        .sel(_node_714),
        .a(indices_rom_8),
        .b(_node_713)
    );
    wire _node_716;
    EQ_UNSIGNED #(.width(4)) u_eq_775 (
        .y(_node_716),
        .a(4'd9),
        .b(_T_1666)
    );
    wire [2:0] _node_717;
    MUX_UNSIGNED #(.width(3)) u_mux_776 (
        .y(_node_717),
        .sel(_node_716),
        .a(indices_rom_9),
        .b(_node_715)
    );
    wire _node_718;
    EQ_UNSIGNED #(.width(4)) u_eq_777 (
        .y(_node_718),
        .a(4'd10),
        .b(_T_1666)
    );
    wire [2:0] _node_719;
    MUX_UNSIGNED #(.width(3)) u_mux_778 (
        .y(_node_719),
        .sel(_node_718),
        .a(indices_rom_10),
        .b(_node_717)
    );
    wire _node_720;
    EQ_UNSIGNED #(.width(4)) u_eq_779 (
        .y(_node_720),
        .a(4'd11),
        .b(_T_1666)
    );
    wire [2:0] _node_721;
    MUX_UNSIGNED #(.width(3)) u_mux_780 (
        .y(_node_721),
        .sel(_node_720),
        .a(indices_rom_11),
        .b(_node_719)
    );
    wire _node_722;
    EQ_UNSIGNED #(.width(4)) u_eq_781 (
        .y(_node_722),
        .a(4'd12),
        .b(_T_1666)
    );
    wire [2:0] _node_723;
    MUX_UNSIGNED #(.width(3)) u_mux_782 (
        .y(_node_723),
        .sel(_node_722),
        .a(indices_rom_12),
        .b(_node_721)
    );
    wire _node_724;
    EQ_UNSIGNED #(.width(4)) u_eq_783 (
        .y(_node_724),
        .a(4'd13),
        .b(_T_1666)
    );
    wire [2:0] _node_725;
    MUX_UNSIGNED #(.width(3)) u_mux_784 (
        .y(_node_725),
        .sel(_node_724),
        .a(indices_rom_13),
        .b(_node_723)
    );
    wire _T_1668;
    BITS #(.width(3), .high(2), .low(2)) bits_785 (
        .y(_T_1668),
        .in(_node_725)
    );
    wire [4:0] _T_1670;
    wire [3:0] _WTEMP_23;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_786 (
        .y(_WTEMP_23),
        .in(3'h6)
    );
    ADD_UNSIGNED #(.width(4)) u_add_787 (
        .y(_T_1670),
        .a(start),
        .b(_WTEMP_23)
    );
    wire [3:0] _T_1671;
    TAIL #(.width(5), .n(1)) tail_788 (
        .y(_T_1671),
        .in(_T_1670)
    );
    wire _node_726;
    EQ_UNSIGNED #(.width(4)) u_eq_789 (
        .y(_node_726),
        .a(4'd0),
        .b(_T_1671)
    );
    wire [2:0] _node_727;
    assign _node_727 = indices_rom_0;
    wire _node_728;
    EQ_UNSIGNED #(.width(4)) u_eq_790 (
        .y(_node_728),
        .a(4'd1),
        .b(_T_1671)
    );
    wire [2:0] _node_729;
    MUX_UNSIGNED #(.width(3)) u_mux_791 (
        .y(_node_729),
        .sel(_node_728),
        .a(indices_rom_1),
        .b(_node_727)
    );
    wire _node_730;
    EQ_UNSIGNED #(.width(4)) u_eq_792 (
        .y(_node_730),
        .a(4'd2),
        .b(_T_1671)
    );
    wire [2:0] _node_731;
    MUX_UNSIGNED #(.width(3)) u_mux_793 (
        .y(_node_731),
        .sel(_node_730),
        .a(indices_rom_2),
        .b(_node_729)
    );
    wire _node_732;
    EQ_UNSIGNED #(.width(4)) u_eq_794 (
        .y(_node_732),
        .a(4'd3),
        .b(_T_1671)
    );
    wire [2:0] _node_733;
    MUX_UNSIGNED #(.width(3)) u_mux_795 (
        .y(_node_733),
        .sel(_node_732),
        .a(indices_rom_3),
        .b(_node_731)
    );
    wire _node_734;
    EQ_UNSIGNED #(.width(4)) u_eq_796 (
        .y(_node_734),
        .a(4'd4),
        .b(_T_1671)
    );
    wire [2:0] _node_735;
    MUX_UNSIGNED #(.width(3)) u_mux_797 (
        .y(_node_735),
        .sel(_node_734),
        .a(indices_rom_4),
        .b(_node_733)
    );
    wire _node_736;
    EQ_UNSIGNED #(.width(4)) u_eq_798 (
        .y(_node_736),
        .a(4'd5),
        .b(_T_1671)
    );
    wire [2:0] _node_737;
    MUX_UNSIGNED #(.width(3)) u_mux_799 (
        .y(_node_737),
        .sel(_node_736),
        .a(indices_rom_5),
        .b(_node_735)
    );
    wire _node_738;
    EQ_UNSIGNED #(.width(4)) u_eq_800 (
        .y(_node_738),
        .a(4'd6),
        .b(_T_1671)
    );
    wire [2:0] _node_739;
    MUX_UNSIGNED #(.width(3)) u_mux_801 (
        .y(_node_739),
        .sel(_node_738),
        .a(indices_rom_6),
        .b(_node_737)
    );
    wire _node_740;
    EQ_UNSIGNED #(.width(4)) u_eq_802 (
        .y(_node_740),
        .a(4'd7),
        .b(_T_1671)
    );
    wire [2:0] _node_741;
    MUX_UNSIGNED #(.width(3)) u_mux_803 (
        .y(_node_741),
        .sel(_node_740),
        .a(indices_rom_7),
        .b(_node_739)
    );
    wire _node_742;
    EQ_UNSIGNED #(.width(4)) u_eq_804 (
        .y(_node_742),
        .a(4'd8),
        .b(_T_1671)
    );
    wire [2:0] _node_743;
    MUX_UNSIGNED #(.width(3)) u_mux_805 (
        .y(_node_743),
        .sel(_node_742),
        .a(indices_rom_8),
        .b(_node_741)
    );
    wire _node_744;
    EQ_UNSIGNED #(.width(4)) u_eq_806 (
        .y(_node_744),
        .a(4'd9),
        .b(_T_1671)
    );
    wire [2:0] _node_745;
    MUX_UNSIGNED #(.width(3)) u_mux_807 (
        .y(_node_745),
        .sel(_node_744),
        .a(indices_rom_9),
        .b(_node_743)
    );
    wire _node_746;
    EQ_UNSIGNED #(.width(4)) u_eq_808 (
        .y(_node_746),
        .a(4'd10),
        .b(_T_1671)
    );
    wire [2:0] _node_747;
    MUX_UNSIGNED #(.width(3)) u_mux_809 (
        .y(_node_747),
        .sel(_node_746),
        .a(indices_rom_10),
        .b(_node_745)
    );
    wire _node_748;
    EQ_UNSIGNED #(.width(4)) u_eq_810 (
        .y(_node_748),
        .a(4'd11),
        .b(_T_1671)
    );
    wire [2:0] _node_749;
    MUX_UNSIGNED #(.width(3)) u_mux_811 (
        .y(_node_749),
        .sel(_node_748),
        .a(indices_rom_11),
        .b(_node_747)
    );
    wire _node_750;
    EQ_UNSIGNED #(.width(4)) u_eq_812 (
        .y(_node_750),
        .a(4'd12),
        .b(_T_1671)
    );
    wire [2:0] _node_751;
    MUX_UNSIGNED #(.width(3)) u_mux_813 (
        .y(_node_751),
        .sel(_node_750),
        .a(indices_rom_12),
        .b(_node_749)
    );
    wire _node_752;
    EQ_UNSIGNED #(.width(4)) u_eq_814 (
        .y(_node_752),
        .a(4'd13),
        .b(_T_1671)
    );
    wire [2:0] _node_753;
    MUX_UNSIGNED #(.width(3)) u_mux_815 (
        .y(_node_753),
        .sel(_node_752),
        .a(indices_rom_13),
        .b(_node_751)
    );
    wire [1:0] _T_1673;
    BITS #(.width(3), .high(1), .low(0)) bits_816 (
        .y(_T_1673),
        .in(_node_753)
    );
    wire [63:0] _T_1683_node;
    wire [63:0] _BBFSubtract_6_1__out;
    wire [63:0] _BBFSubtract_6_1__in2;
    wire [63:0] _BBFSubtract_6_1__in1;
    BBFSubtract BBFSubtract_6_1 (
        .out(_BBFSubtract_6_1__out),
        .in2(_BBFSubtract_6_1__in2),
        .in1(_BBFSubtract_6_1__in1)
    );
    wire _node_754;
    EQ_UNSIGNED #(.width(2)) u_eq_817 (
        .y(_node_754),
        .a(2'd0),
        .b(_T_1673)
    );
    wire [63:0] _node_755;
    assign _node_755 = twiddle_rom_0_real_node;
    wire _node_756;
    EQ_UNSIGNED #(.width(2)) u_eq_818 (
        .y(_node_756),
        .a(2'd1),
        .b(_T_1673)
    );
    wire [63:0] _node_757;
    MUX_UNSIGNED #(.width(64)) u_mux_819 (
        .y(_node_757),
        .sel(_node_756),
        .a(twiddle_rom_1_real_node),
        .b(_node_755)
    );
    wire _node_758;
    EQ_UNSIGNED #(.width(2)) u_eq_820 (
        .y(_node_758),
        .a(2'd2),
        .b(_T_1673)
    );
    wire [63:0] _node_759;
    MUX_UNSIGNED #(.width(64)) u_mux_821 (
        .y(_node_759),
        .sel(_node_758),
        .a(twiddle_rom_2_real_node),
        .b(_node_757)
    );
    wire _node_760;
    EQ_UNSIGNED #(.width(2)) u_eq_822 (
        .y(_node_760),
        .a(2'd3),
        .b(_T_1673)
    );
    wire [63:0] _node_761;
    MUX_UNSIGNED #(.width(64)) u_mux_823 (
        .y(_node_761),
        .sel(_node_760),
        .a(twiddle_rom_3_real_node),
        .b(_node_759)
    );
    wire [63:0] _T_1690_node;
    wire [63:0] _T_1706_real_node;
    wire [63:0] _T_1706_imaginary_node;
    wire _node_762;
    EQ_UNSIGNED #(.width(2)) u_eq_824 (
        .y(_node_762),
        .a(2'd0),
        .b(_T_1673)
    );
    wire [63:0] _node_763;
    assign _node_763 = twiddle_rom_0_imaginary_node;
    wire _node_764;
    EQ_UNSIGNED #(.width(2)) u_eq_825 (
        .y(_node_764),
        .a(2'd1),
        .b(_T_1673)
    );
    wire [63:0] _node_765;
    MUX_UNSIGNED #(.width(64)) u_mux_826 (
        .y(_node_765),
        .sel(_node_764),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_763)
    );
    wire _node_766;
    EQ_UNSIGNED #(.width(2)) u_eq_827 (
        .y(_node_766),
        .a(2'd2),
        .b(_T_1673)
    );
    wire [63:0] _node_767;
    MUX_UNSIGNED #(.width(64)) u_mux_828 (
        .y(_node_767),
        .sel(_node_766),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_765)
    );
    wire _node_768;
    EQ_UNSIGNED #(.width(2)) u_eq_829 (
        .y(_node_768),
        .a(2'd3),
        .b(_T_1673)
    );
    wire [63:0] _node_769;
    MUX_UNSIGNED #(.width(64)) u_mux_830 (
        .y(_node_769),
        .sel(_node_768),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_767)
    );
    wire [4:0] _T_1708;
    wire [3:0] _WTEMP_24;
    PAD_UNSIGNED #(.width(3), .n(4)) u_pad_831 (
        .y(_WTEMP_24),
        .in(3'h6)
    );
    ADD_UNSIGNED #(.width(4)) u_add_832 (
        .y(_T_1708),
        .a(start),
        .b(_WTEMP_24)
    );
    wire [3:0] _T_1709;
    TAIL #(.width(5), .n(1)) tail_833 (
        .y(_T_1709),
        .in(_T_1708)
    );
    wire _node_770;
    EQ_UNSIGNED #(.width(4)) u_eq_834 (
        .y(_node_770),
        .a(4'd0),
        .b(_T_1709)
    );
    wire [2:0] _node_771;
    assign _node_771 = indices_rom_0;
    wire _node_772;
    EQ_UNSIGNED #(.width(4)) u_eq_835 (
        .y(_node_772),
        .a(4'd1),
        .b(_T_1709)
    );
    wire [2:0] _node_773;
    MUX_UNSIGNED #(.width(3)) u_mux_836 (
        .y(_node_773),
        .sel(_node_772),
        .a(indices_rom_1),
        .b(_node_771)
    );
    wire _node_774;
    EQ_UNSIGNED #(.width(4)) u_eq_837 (
        .y(_node_774),
        .a(4'd2),
        .b(_T_1709)
    );
    wire [2:0] _node_775;
    MUX_UNSIGNED #(.width(3)) u_mux_838 (
        .y(_node_775),
        .sel(_node_774),
        .a(indices_rom_2),
        .b(_node_773)
    );
    wire _node_776;
    EQ_UNSIGNED #(.width(4)) u_eq_839 (
        .y(_node_776),
        .a(4'd3),
        .b(_T_1709)
    );
    wire [2:0] _node_777;
    MUX_UNSIGNED #(.width(3)) u_mux_840 (
        .y(_node_777),
        .sel(_node_776),
        .a(indices_rom_3),
        .b(_node_775)
    );
    wire _node_778;
    EQ_UNSIGNED #(.width(4)) u_eq_841 (
        .y(_node_778),
        .a(4'd4),
        .b(_T_1709)
    );
    wire [2:0] _node_779;
    MUX_UNSIGNED #(.width(3)) u_mux_842 (
        .y(_node_779),
        .sel(_node_778),
        .a(indices_rom_4),
        .b(_node_777)
    );
    wire _node_780;
    EQ_UNSIGNED #(.width(4)) u_eq_843 (
        .y(_node_780),
        .a(4'd5),
        .b(_T_1709)
    );
    wire [2:0] _node_781;
    MUX_UNSIGNED #(.width(3)) u_mux_844 (
        .y(_node_781),
        .sel(_node_780),
        .a(indices_rom_5),
        .b(_node_779)
    );
    wire _node_782;
    EQ_UNSIGNED #(.width(4)) u_eq_845 (
        .y(_node_782),
        .a(4'd6),
        .b(_T_1709)
    );
    wire [2:0] _node_783;
    MUX_UNSIGNED #(.width(3)) u_mux_846 (
        .y(_node_783),
        .sel(_node_782),
        .a(indices_rom_6),
        .b(_node_781)
    );
    wire _node_784;
    EQ_UNSIGNED #(.width(4)) u_eq_847 (
        .y(_node_784),
        .a(4'd7),
        .b(_T_1709)
    );
    wire [2:0] _node_785;
    MUX_UNSIGNED #(.width(3)) u_mux_848 (
        .y(_node_785),
        .sel(_node_784),
        .a(indices_rom_7),
        .b(_node_783)
    );
    wire _node_786;
    EQ_UNSIGNED #(.width(4)) u_eq_849 (
        .y(_node_786),
        .a(4'd8),
        .b(_T_1709)
    );
    wire [2:0] _node_787;
    MUX_UNSIGNED #(.width(3)) u_mux_850 (
        .y(_node_787),
        .sel(_node_786),
        .a(indices_rom_8),
        .b(_node_785)
    );
    wire _node_788;
    EQ_UNSIGNED #(.width(4)) u_eq_851 (
        .y(_node_788),
        .a(4'd9),
        .b(_T_1709)
    );
    wire [2:0] _node_789;
    MUX_UNSIGNED #(.width(3)) u_mux_852 (
        .y(_node_789),
        .sel(_node_788),
        .a(indices_rom_9),
        .b(_node_787)
    );
    wire _node_790;
    EQ_UNSIGNED #(.width(4)) u_eq_853 (
        .y(_node_790),
        .a(4'd10),
        .b(_T_1709)
    );
    wire [2:0] _node_791;
    MUX_UNSIGNED #(.width(3)) u_mux_854 (
        .y(_node_791),
        .sel(_node_790),
        .a(indices_rom_10),
        .b(_node_789)
    );
    wire _node_792;
    EQ_UNSIGNED #(.width(4)) u_eq_855 (
        .y(_node_792),
        .a(4'd11),
        .b(_T_1709)
    );
    wire [2:0] _node_793;
    MUX_UNSIGNED #(.width(3)) u_mux_856 (
        .y(_node_793),
        .sel(_node_792),
        .a(indices_rom_11),
        .b(_node_791)
    );
    wire _node_794;
    EQ_UNSIGNED #(.width(4)) u_eq_857 (
        .y(_node_794),
        .a(4'd12),
        .b(_T_1709)
    );
    wire [2:0] _node_795;
    MUX_UNSIGNED #(.width(3)) u_mux_858 (
        .y(_node_795),
        .sel(_node_794),
        .a(indices_rom_12),
        .b(_node_793)
    );
    wire _node_796;
    EQ_UNSIGNED #(.width(4)) u_eq_859 (
        .y(_node_796),
        .a(4'd13),
        .b(_T_1709)
    );
    wire [2:0] _node_797;
    MUX_UNSIGNED #(.width(3)) u_mux_860 (
        .y(_node_797),
        .sel(_node_796),
        .a(indices_rom_13),
        .b(_node_795)
    );
    wire [1:0] _T_1717;
    BITS #(.width(3), .high(1), .low(0)) bits_861 (
        .y(_T_1717),
        .in(_node_797)
    );
    wire _node_798;
    EQ_UNSIGNED #(.width(2)) u_eq_862 (
        .y(_node_798),
        .a(2'd0),
        .b(_T_1717)
    );
    wire [63:0] _node_799;
    assign _node_799 = twiddle_rom_0_real_node;
    wire _node_800;
    EQ_UNSIGNED #(.width(2)) u_eq_863 (
        .y(_node_800),
        .a(2'd1),
        .b(_T_1717)
    );
    wire [63:0] _node_801;
    MUX_UNSIGNED #(.width(64)) u_mux_864 (
        .y(_node_801),
        .sel(_node_800),
        .a(twiddle_rom_1_real_node),
        .b(_node_799)
    );
    wire _node_802;
    EQ_UNSIGNED #(.width(2)) u_eq_865 (
        .y(_node_802),
        .a(2'd2),
        .b(_T_1717)
    );
    wire [63:0] _node_803;
    MUX_UNSIGNED #(.width(64)) u_mux_866 (
        .y(_node_803),
        .sel(_node_802),
        .a(twiddle_rom_2_real_node),
        .b(_node_801)
    );
    wire _node_804;
    EQ_UNSIGNED #(.width(2)) u_eq_867 (
        .y(_node_804),
        .a(2'd3),
        .b(_T_1717)
    );
    wire [63:0] _node_805;
    MUX_UNSIGNED #(.width(64)) u_mux_868 (
        .y(_node_805),
        .sel(_node_804),
        .a(twiddle_rom_3_real_node),
        .b(_node_803)
    );
    wire [63:0] _T_1724_real_node;
    MUX_UNSIGNED #(.width(64)) u_mux_869 (
        .y(_T_1724_real_node),
        .sel(_T_1668),
        .a(_T_1706_real_node),
        .b(_node_805)
    );
    wire _node_806;
    EQ_UNSIGNED #(.width(2)) u_eq_870 (
        .y(_node_806),
        .a(2'd0),
        .b(_T_1717)
    );
    wire [63:0] _node_807;
    assign _node_807 = twiddle_rom_0_imaginary_node;
    wire _node_808;
    EQ_UNSIGNED #(.width(2)) u_eq_871 (
        .y(_node_808),
        .a(2'd1),
        .b(_T_1717)
    );
    wire [63:0] _node_809;
    MUX_UNSIGNED #(.width(64)) u_mux_872 (
        .y(_node_809),
        .sel(_node_808),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_807)
    );
    wire _node_810;
    EQ_UNSIGNED #(.width(2)) u_eq_873 (
        .y(_node_810),
        .a(2'd2),
        .b(_T_1717)
    );
    wire [63:0] _node_811;
    MUX_UNSIGNED #(.width(64)) u_mux_874 (
        .y(_node_811),
        .sel(_node_810),
        .a(twiddle_rom_2_imaginary_node),
        .b(_node_809)
    );
    wire _node_812;
    EQ_UNSIGNED #(.width(2)) u_eq_875 (
        .y(_node_812),
        .a(2'd3),
        .b(_T_1717)
    );
    wire [63:0] _node_813;
    MUX_UNSIGNED #(.width(64)) u_mux_876 (
        .y(_node_813),
        .sel(_node_812),
        .a(twiddle_rom_3_imaginary_node),
        .b(_node_811)
    );
    wire [63:0] _T_1724_imaginary_node;
    MUX_UNSIGNED #(.width(64)) u_mux_877 (
        .y(_T_1724_imaginary_node),
        .sel(_T_1668),
        .a(_T_1706_imaginary_node),
        .b(_node_813)
    );
    wire [63:0] _T_1728_node;
    wire [63:0] _T_1735_node;
    wire [63:0] stage_outputs_0_0_real_node;
    wire [63:0] stage_outputs_0_0_imaginary_node;
    wire [63:0] _T_1755_node;
    wire [63:0] _T_1762_node;
    wire [63:0] stage_outputs_0_1_real_node;
    wire [63:0] stage_outputs_0_1_imaginary_node;
    wire [63:0] _T_1782_node;
    wire [63:0] _T_1789_node;
    wire [63:0] stage_outputs_0_2_real_node;
    wire [63:0] stage_outputs_0_2_imaginary_node;
    wire [63:0] _T_1809_node;
    wire [63:0] _T_1816_node;
    wire [63:0] stage_outputs_0_3_real_node;
    wire [63:0] stage_outputs_0_3_imaginary_node;
    wire [63:0] _T_1836_node;
    wire [63:0] _T_1843_node;
    wire [63:0] stage_outputs_0_4_real_node;
    wire [63:0] stage_outputs_0_4_imaginary_node;
    wire [63:0] _T_1863_node;
    wire [63:0] _T_1870_node;
    wire [63:0] stage_outputs_0_5_real_node;
    wire [63:0] stage_outputs_0_5_imaginary_node;
    wire [63:0] _T_1890_node;
    wire [63:0] _T_1897_node;
    wire [63:0] stage_outputs_0_6_real_node;
    wire [63:0] stage_outputs_0_6_imaginary_node;
    wire [63:0] _T_1917_node;
    wire [63:0] _T_1924_node;
    wire [63:0] stage_outputs_0_7_real_node;
    wire [63:0] stage_outputs_0_7_imaginary_node;
    wire [63:0] _T_1944_node;
    wire [63:0] _T_1951_node;
    wire [63:0] stage_outputs_1_0_real_node;
    wire [63:0] stage_outputs_1_0_imaginary_node;
    wire [63:0] _T_1971_node;
    wire [63:0] _T_1978_node;
    wire [63:0] stage_outputs_1_1_real_node;
    wire [63:0] stage_outputs_1_1_imaginary_node;
    wire [63:0] _T_1998_node;
    wire [63:0] _T_2005_node;
    wire [63:0] stage_outputs_1_2_real_node;
    wire [63:0] stage_outputs_1_2_imaginary_node;
    wire [63:0] _T_2025_node;
    wire [63:0] _T_2032_node;
    wire [63:0] stage_outputs_1_3_real_node;
    wire [63:0] stage_outputs_1_3_imaginary_node;
    wire [63:0] _T_2052_node;
    wire [63:0] _T_2059_node;
    wire [63:0] stage_outputs_1_4_real_node;
    wire [63:0] stage_outputs_1_4_imaginary_node;
    wire [63:0] _T_2079_node;
    wire [63:0] _T_2086_node;
    wire [63:0] stage_outputs_1_5_real_node;
    wire [63:0] stage_outputs_1_5_imaginary_node;
    wire [63:0] _T_2106_node;
    wire [63:0] _T_2113_node;
    wire [63:0] stage_outputs_1_6_real_node;
    wire [63:0] stage_outputs_1_6_imaginary_node;
    wire [63:0] _T_2133_node;
    wire [63:0] _T_2140_node;
    wire [63:0] stage_outputs_1_7_real_node;
    wire [63:0] stage_outputs_1_7_imaginary_node;
    wire [63:0] _T_2160_node;
    wire [63:0] _T_2167_node;
    wire [63:0] stage_outputs_2_0_real_node;
    wire [63:0] stage_outputs_2_0_imaginary_node;
    wire [63:0] _T_2187_node;
    wire [63:0] _T_2194_node;
    wire [63:0] stage_outputs_2_1_real_node;
    wire [63:0] stage_outputs_2_1_imaginary_node;
    wire [63:0] _T_2214_node;
    wire [63:0] _T_2221_node;
    wire [63:0] stage_outputs_2_2_real_node;
    wire [63:0] stage_outputs_2_2_imaginary_node;
    wire [63:0] _T_2241_node;
    wire [63:0] _T_2248_node;
    wire [63:0] stage_outputs_2_3_real_node;
    wire [63:0] stage_outputs_2_3_imaginary_node;
    wire [63:0] _T_2268_node;
    wire [63:0] _T_2275_node;
    wire [63:0] stage_outputs_2_4_real_node;
    wire [63:0] stage_outputs_2_4_imaginary_node;
    wire [63:0] _T_2295_node;
    wire [63:0] _T_2302_node;
    wire [63:0] stage_outputs_2_5_real_node;
    wire [63:0] stage_outputs_2_5_imaginary_node;
    wire [63:0] _T_2322_node;
    wire [63:0] _T_2329_node;
    wire [63:0] stage_outputs_2_6_real_node;
    wire [63:0] stage_outputs_2_6_imaginary_node;
    wire [63:0] _T_2349_node;
    wire [63:0] _T_2356_node;
    wire [63:0] stage_outputs_2_7_real_node;
    wire [63:0] stage_outputs_2_7_imaginary_node;
    wire [63:0] _T_2376_node;
    wire [63:0] _T_2383_node;
    wire [63:0] stage_outputs_3_0_real_node;
    wire [63:0] stage_outputs_3_0_imaginary_node;
    wire [63:0] _T_2403_node;
    wire [63:0] _T_2410_node;
    wire [63:0] stage_outputs_3_1_real_node;
    wire [63:0] stage_outputs_3_1_imaginary_node;
    wire [63:0] _T_2430_node;
    wire [63:0] _T_2437_node;
    wire [63:0] stage_outputs_3_2_real_node;
    wire [63:0] stage_outputs_3_2_imaginary_node;
    wire [63:0] _T_2457_node;
    wire [63:0] _T_2464_node;
    wire [63:0] stage_outputs_3_3_real_node;
    wire [63:0] stage_outputs_3_3_imaginary_node;
    wire [63:0] _T_2484_node;
    wire [63:0] _T_2491_node;
    wire [63:0] stage_outputs_3_4_real_node;
    wire [63:0] stage_outputs_3_4_imaginary_node;
    wire [63:0] _T_2511_node;
    wire [63:0] _T_2518_node;
    wire [63:0] stage_outputs_3_5_real_node;
    wire [63:0] stage_outputs_3_5_imaginary_node;
    wire [63:0] _T_2538_node;
    wire [63:0] _T_2545_node;
    wire [63:0] stage_outputs_3_6_real_node;
    wire [63:0] stage_outputs_3_6_imaginary_node;
    wire [63:0] _T_2565_node;
    wire [63:0] _T_2572_node;
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
    wire [63:0] _T_2592_node;
    wire [63:0] _BBFMultiply_1_1__out;
    wire [63:0] _BBFMultiply_1_1__in2;
    wire [63:0] _BBFMultiply_1_1__in1;
    BBFMultiply BBFMultiply_1_1 (
        .out(_BBFMultiply_1_1__out),
        .in2(_BBFMultiply_1_1__in2),
        .in1(_BBFMultiply_1_1__in1)
    );
    wire [63:0] _T_2598_node;
    wire [63:0] _T_2604_node;
    wire [63:0] _BBFSubtract_7_1__out;
    wire [63:0] _BBFSubtract_7_1__in2;
    wire [63:0] _BBFSubtract_7_1__in1;
    BBFSubtract BBFSubtract_7_1 (
        .out(_BBFSubtract_7_1__out),
        .in2(_BBFSubtract_7_1__in2),
        .in1(_BBFSubtract_7_1__in1)
    );
    wire [63:0] _T_2611_node;
    wire [63:0] _BBFAdd_72__out;
    wire [63:0] _BBFAdd_72__in2;
    wire [63:0] _BBFAdd_72__in1;
    BBFAdd BBFAdd_72 (
        .out(_BBFAdd_72__out),
        .in2(_BBFAdd_72__in2),
        .in1(_BBFAdd_72__in1)
    );
    wire [63:0] _T_2617_node;
    wire [63:0] _BBFMultiply_2_1__out;
    wire [63:0] _BBFMultiply_2_1__in2;
    wire [63:0] _BBFMultiply_2_1__in1;
    BBFMultiply BBFMultiply_2_1 (
        .out(_BBFMultiply_2_1__out),
        .in2(_BBFMultiply_2_1__in2),
        .in1(_BBFMultiply_2_1__in1)
    );
    wire [63:0] _T_2623_node;
    wire [63:0] _BBFMultiply_3_1__out;
    wire [63:0] _BBFMultiply_3_1__in2;
    wire [63:0] _BBFMultiply_3_1__in1;
    BBFMultiply BBFMultiply_3_1 (
        .out(_BBFMultiply_3_1__out),
        .in2(_BBFMultiply_3_1__in2),
        .in1(_BBFMultiply_3_1__in1)
    );
    wire [63:0] _T_2629_node;
    wire [63:0] _BBFAdd_1_1__out;
    wire [63:0] _BBFAdd_1_1__in2;
    wire [63:0] _BBFAdd_1_1__in1;
    BBFAdd BBFAdd_1_1 (
        .out(_BBFAdd_1_1__out),
        .in2(_BBFAdd_1_1__in2),
        .in1(_BBFAdd_1_1__in1)
    );
    wire [63:0] _T_2635_node;
    wire [63:0] _T_2651_real_node;
    wire [63:0] _T_2651_imaginary_node;
    wire [63:0] _BBFAdd_2_1__out;
    wire [63:0] _BBFAdd_2_1__in2;
    wire [63:0] _BBFAdd_2_1__in1;
    BBFAdd BBFAdd_2_1 (
        .out(_BBFAdd_2_1__out),
        .in2(_BBFAdd_2_1__in2),
        .in1(_BBFAdd_2_1__in1)
    );
    wire [63:0] _T_2655_node;
    wire [63:0] _BBFAdd_3_1__out;
    wire [63:0] _BBFAdd_3_1__in2;
    wire [63:0] _BBFAdd_3_1__in1;
    BBFAdd BBFAdd_3_1 (
        .out(_BBFAdd_3_1__out),
        .in2(_BBFAdd_3_1__in2),
        .in1(_BBFAdd_3_1__in1)
    );
    wire [63:0] _T_2661_node;
    wire [63:0] _T_2677_real_node;
    wire [63:0] _T_2677_imaginary_node;
    wire [63:0] _T_2681_node;
    wire [63:0] _BBFSubtract_8_1__out;
    wire [63:0] _BBFSubtract_8_1__in2;
    wire [63:0] _BBFSubtract_8_1__in1;
    BBFSubtract BBFSubtract_8_1 (
        .out(_BBFSubtract_8_1__out),
        .in2(_BBFSubtract_8_1__in2),
        .in1(_BBFSubtract_8_1__in1)
    );
    wire [63:0] _T_2688_node;
    wire [63:0] _T_2694_node;
    wire [63:0] _BBFSubtract_9_1__out;
    wire [63:0] _BBFSubtract_9_1__in2;
    wire [63:0] _BBFSubtract_9_1__in1;
    BBFSubtract BBFSubtract_9_1 (
        .out(_BBFSubtract_9_1__out),
        .in2(_BBFSubtract_9_1__in2),
        .in1(_BBFSubtract_9_1__in1)
    );
    wire [63:0] _T_2701_node;
    wire [63:0] _T_2717_real_node;
    wire [63:0] _T_2717_imaginary_node;
    wire [63:0] _BBFAdd_4_1__out;
    wire [63:0] _BBFAdd_4_1__in2;
    wire [63:0] _BBFAdd_4_1__in1;
    BBFAdd BBFAdd_4_1 (
        .out(_BBFAdd_4_1__out),
        .in2(_BBFAdd_4_1__in2),
        .in1(_BBFAdd_4_1__in1)
    );
    wire [63:0] _T_2721_node;
    wire [63:0] _BBFAdd_5_1__out;
    wire [63:0] _BBFAdd_5_1__in2;
    wire [63:0] _BBFAdd_5_1__in1;
    BBFAdd BBFAdd_5_1 (
        .out(_BBFAdd_5_1__out),
        .in2(_BBFAdd_5_1__in2),
        .in1(_BBFAdd_5_1__in1)
    );
    wire [63:0] _T_2727_node;
    wire [63:0] _T_2743_real_node;
    wire [63:0] _T_2743_imaginary_node;
    wire _T_2758_real_node__T_2769_clk;
    wire _T_2758_real_node__T_2769_en;
    wire _T_2758_real_node__T_2769_mask;
    wire _T_2758_real_node__T_2769_addr;
    wire [63:0] _T_2758_real_node__T_2769_data;
    wire [63:0] _T_2758_real_node__T_2777_data;
    wire _T_2758_real_node__T_2777_clk;
    wire _T_2758_real_node__T_2777_en;
    wire _T_2758_real_node__T_2777_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2758_real_node (
        .read_data(_T_2758_real_node__T_2777_data),
        .read_clk(_T_2758_real_node__T_2777_clk),
        .read_en(_T_2758_real_node__T_2777_en),
        .read_addr(_T_2758_real_node__T_2777_addr),
        .write_clk(_T_2758_real_node__T_2769_clk),
        .write_en(_T_2758_real_node__T_2769_en),
        .write_mask(_T_2758_real_node__T_2769_mask),
        .write_addr(_T_2758_real_node__T_2769_addr),
        .write_data(_T_2758_real_node__T_2769_data)
    );
    wire _T_2758_imaginary_node__T_2769_clk;
    wire _T_2758_imaginary_node__T_2769_en;
    wire _T_2758_imaginary_node__T_2769_mask;
    wire _T_2758_imaginary_node__T_2769_addr;
    wire [63:0] _T_2758_imaginary_node__T_2769_data;
    wire [63:0] _T_2758_imaginary_node__T_2777_data;
    wire _T_2758_imaginary_node__T_2777_clk;
    wire _T_2758_imaginary_node__T_2777_en;
    wire _T_2758_imaginary_node__T_2777_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2758_imaginary_node (
        .read_data(_T_2758_imaginary_node__T_2777_data),
        .read_clk(_T_2758_imaginary_node__T_2777_clk),
        .read_en(_T_2758_imaginary_node__T_2777_en),
        .read_addr(_T_2758_imaginary_node__T_2777_addr),
        .write_clk(_T_2758_imaginary_node__T_2769_clk),
        .write_en(_T_2758_imaginary_node__T_2769_en),
        .write_mask(_T_2758_imaginary_node__T_2769_mask),
        .write_addr(_T_2758_imaginary_node__T_2769_addr),
        .write_data(_T_2758_imaginary_node__T_2769_data)
    );
    wire _T_2761;
    BITWISEAND #(.width(1)) bitwiseand_878 (
        .y(_T_2761),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2758_real_node__T_2769_addr = 1'h0;
    assign _T_2758_real_node__T_2769_en = io_in_valid;
    assign _T_2758_real_node__T_2769_clk = clock;
    assign _T_2758_imaginary_node__T_2769_addr = 1'h0;
    assign _T_2758_imaginary_node__T_2769_en = io_in_valid;
    assign _T_2758_imaginary_node__T_2769_clk = clock;
    assign _T_2758_imaginary_node__T_2769_mask = 1'h1;
    assign _T_2758_real_node__T_2769_mask = 1'h1;
    assign _T_2758_real_node__T_2777_addr = 1'h0;
    assign _T_2758_real_node__T_2777_en = 1'h1;
    assign _T_2758_real_node__T_2777_clk = clock;
    assign _T_2758_imaginary_node__T_2777_addr = 1'h0;
    assign _T_2758_imaginary_node__T_2777_en = 1'h1;
    assign _T_2758_imaginary_node__T_2777_clk = clock;
    wire _T_2792_real_node__T_2803_clk;
    wire _T_2792_real_node__T_2803_en;
    wire _T_2792_real_node__T_2803_mask;
    wire _T_2792_real_node__T_2803_addr;
    wire [63:0] _T_2792_real_node__T_2803_data;
    wire [63:0] _T_2792_real_node__T_2811_data;
    wire _T_2792_real_node__T_2811_clk;
    wire _T_2792_real_node__T_2811_en;
    wire _T_2792_real_node__T_2811_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2792_real_node (
        .read_data(_T_2792_real_node__T_2811_data),
        .read_clk(_T_2792_real_node__T_2811_clk),
        .read_en(_T_2792_real_node__T_2811_en),
        .read_addr(_T_2792_real_node__T_2811_addr),
        .write_clk(_T_2792_real_node__T_2803_clk),
        .write_en(_T_2792_real_node__T_2803_en),
        .write_mask(_T_2792_real_node__T_2803_mask),
        .write_addr(_T_2792_real_node__T_2803_addr),
        .write_data(_T_2792_real_node__T_2803_data)
    );
    wire _T_2792_imaginary_node__T_2803_clk;
    wire _T_2792_imaginary_node__T_2803_en;
    wire _T_2792_imaginary_node__T_2803_mask;
    wire _T_2792_imaginary_node__T_2803_addr;
    wire [63:0] _T_2792_imaginary_node__T_2803_data;
    wire [63:0] _T_2792_imaginary_node__T_2811_data;
    wire _T_2792_imaginary_node__T_2811_clk;
    wire _T_2792_imaginary_node__T_2811_en;
    wire _T_2792_imaginary_node__T_2811_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2792_imaginary_node (
        .read_data(_T_2792_imaginary_node__T_2811_data),
        .read_clk(_T_2792_imaginary_node__T_2811_clk),
        .read_en(_T_2792_imaginary_node__T_2811_en),
        .read_addr(_T_2792_imaginary_node__T_2811_addr),
        .write_clk(_T_2792_imaginary_node__T_2803_clk),
        .write_en(_T_2792_imaginary_node__T_2803_en),
        .write_mask(_T_2792_imaginary_node__T_2803_mask),
        .write_addr(_T_2792_imaginary_node__T_2803_addr),
        .write_data(_T_2792_imaginary_node__T_2803_data)
    );
    wire _T_2795;
    BITWISEAND #(.width(1)) bitwiseand_879 (
        .y(_T_2795),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2792_real_node__T_2803_addr = 1'h0;
    assign _T_2792_real_node__T_2803_en = io_in_valid;
    assign _T_2792_real_node__T_2803_clk = clock;
    assign _T_2792_imaginary_node__T_2803_addr = 1'h0;
    assign _T_2792_imaginary_node__T_2803_en = io_in_valid;
    assign _T_2792_imaginary_node__T_2803_clk = clock;
    assign _T_2792_imaginary_node__T_2803_mask = 1'h1;
    assign _T_2792_real_node__T_2803_mask = 1'h1;
    assign _T_2792_real_node__T_2811_addr = 1'h0;
    assign _T_2792_real_node__T_2811_en = 1'h1;
    assign _T_2792_real_node__T_2811_clk = clock;
    assign _T_2792_imaginary_node__T_2811_addr = 1'h0;
    assign _T_2792_imaginary_node__T_2811_en = 1'h1;
    assign _T_2792_imaginary_node__T_2811_clk = clock;
    wire [63:0] _BBFMultiply_4_1__out;
    wire [63:0] _BBFMultiply_4_1__in2;
    wire [63:0] _BBFMultiply_4_1__in1;
    BBFMultiply BBFMultiply_4_1 (
        .out(_BBFMultiply_4_1__out),
        .in2(_BBFMultiply_4_1__in2),
        .in1(_BBFMultiply_4_1__in1)
    );
    wire [63:0] _T_2815_node;
    wire [63:0] _BBFMultiply_5_1__out;
    wire [63:0] _BBFMultiply_5_1__in2;
    wire [63:0] _BBFMultiply_5_1__in1;
    BBFMultiply BBFMultiply_5_1 (
        .out(_BBFMultiply_5_1__out),
        .in2(_BBFMultiply_5_1__in2),
        .in1(_BBFMultiply_5_1__in1)
    );
    wire [63:0] _T_2821_node;
    wire [63:0] _T_2827_node;
    wire [63:0] _BBFSubtract_10_1__out;
    wire [63:0] _BBFSubtract_10_1__in2;
    wire [63:0] _BBFSubtract_10_1__in1;
    BBFSubtract BBFSubtract_10_1 (
        .out(_BBFSubtract_10_1__out),
        .in2(_BBFSubtract_10_1__in2),
        .in1(_BBFSubtract_10_1__in1)
    );
    wire [63:0] _T_2834_node;
    wire [63:0] _BBFAdd_6_1__out;
    wire [63:0] _BBFAdd_6_1__in2;
    wire [63:0] _BBFAdd_6_1__in1;
    BBFAdd BBFAdd_6_1 (
        .out(_BBFAdd_6_1__out),
        .in2(_BBFAdd_6_1__in2),
        .in1(_BBFAdd_6_1__in1)
    );
    wire [63:0] _T_2840_node;
    wire [63:0] _BBFMultiply_6_1__out;
    wire [63:0] _BBFMultiply_6_1__in2;
    wire [63:0] _BBFMultiply_6_1__in1;
    BBFMultiply BBFMultiply_6_1 (
        .out(_BBFMultiply_6_1__out),
        .in2(_BBFMultiply_6_1__in2),
        .in1(_BBFMultiply_6_1__in1)
    );
    wire [63:0] _T_2846_node;
    wire [63:0] _BBFMultiply_7_1__out;
    wire [63:0] _BBFMultiply_7_1__in2;
    wire [63:0] _BBFMultiply_7_1__in1;
    BBFMultiply BBFMultiply_7_1 (
        .out(_BBFMultiply_7_1__out),
        .in2(_BBFMultiply_7_1__in2),
        .in1(_BBFMultiply_7_1__in1)
    );
    wire [63:0] _T_2852_node;
    wire [63:0] _BBFAdd_7_1__out;
    wire [63:0] _BBFAdd_7_1__in2;
    wire [63:0] _BBFAdd_7_1__in1;
    BBFAdd BBFAdd_7_1 (
        .out(_BBFAdd_7_1__out),
        .in2(_BBFAdd_7_1__in2),
        .in1(_BBFAdd_7_1__in1)
    );
    wire [63:0] _T_2858_node;
    wire [63:0] _T_2874_real_node;
    wire [63:0] _T_2874_imaginary_node;
    wire [63:0] _BBFAdd_8_1__out;
    wire [63:0] _BBFAdd_8_1__in2;
    wire [63:0] _BBFAdd_8_1__in1;
    BBFAdd BBFAdd_8_1 (
        .out(_BBFAdd_8_1__out),
        .in2(_BBFAdd_8_1__in2),
        .in1(_BBFAdd_8_1__in1)
    );
    wire [63:0] _T_2878_node;
    wire [63:0] _BBFAdd_9_1__out;
    wire [63:0] _BBFAdd_9_1__in2;
    wire [63:0] _BBFAdd_9_1__in1;
    BBFAdd BBFAdd_9_1 (
        .out(_BBFAdd_9_1__out),
        .in2(_BBFAdd_9_1__in2),
        .in1(_BBFAdd_9_1__in1)
    );
    wire [63:0] _T_2884_node;
    wire [63:0] _T_2900_real_node;
    wire [63:0] _T_2900_imaginary_node;
    wire [63:0] _T_2904_node;
    wire [63:0] _BBFSubtract_11_1__out;
    wire [63:0] _BBFSubtract_11_1__in2;
    wire [63:0] _BBFSubtract_11_1__in1;
    BBFSubtract BBFSubtract_11_1 (
        .out(_BBFSubtract_11_1__out),
        .in2(_BBFSubtract_11_1__in2),
        .in1(_BBFSubtract_11_1__in1)
    );
    wire [63:0] _T_2911_node;
    wire [63:0] _T_2917_node;
    wire [63:0] _BBFSubtract_12_1__out;
    wire [63:0] _BBFSubtract_12_1__in2;
    wire [63:0] _BBFSubtract_12_1__in1;
    BBFSubtract BBFSubtract_12_1 (
        .out(_BBFSubtract_12_1__out),
        .in2(_BBFSubtract_12_1__in2),
        .in1(_BBFSubtract_12_1__in1)
    );
    wire [63:0] _T_2924_node;
    wire [63:0] _T_2940_real_node;
    wire [63:0] _T_2940_imaginary_node;
    wire [63:0] _BBFAdd_10_1__out;
    wire [63:0] _BBFAdd_10_1__in2;
    wire [63:0] _BBFAdd_10_1__in1;
    BBFAdd BBFAdd_10_1 (
        .out(_BBFAdd_10_1__out),
        .in2(_BBFAdd_10_1__in2),
        .in1(_BBFAdd_10_1__in1)
    );
    wire [63:0] _T_2944_node;
    wire [63:0] _BBFAdd_11_1__out;
    wire [63:0] _BBFAdd_11_1__in2;
    wire [63:0] _BBFAdd_11_1__in1;
    BBFAdd BBFAdd_11_1 (
        .out(_BBFAdd_11_1__out),
        .in2(_BBFAdd_11_1__in2),
        .in1(_BBFAdd_11_1__in1)
    );
    wire [63:0] _T_2950_node;
    wire [63:0] _T_2966_real_node;
    wire [63:0] _T_2966_imaginary_node;
    wire _T_2981_real_node__T_2992_clk;
    wire _T_2981_real_node__T_2992_en;
    wire _T_2981_real_node__T_2992_mask;
    wire _T_2981_real_node__T_2992_addr;
    wire [63:0] _T_2981_real_node__T_2992_data;
    wire [63:0] _T_2981_real_node__T_3000_data;
    wire _T_2981_real_node__T_3000_clk;
    wire _T_2981_real_node__T_3000_en;
    wire _T_2981_real_node__T_3000_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2981_real_node (
        .read_data(_T_2981_real_node__T_3000_data),
        .read_clk(_T_2981_real_node__T_3000_clk),
        .read_en(_T_2981_real_node__T_3000_en),
        .read_addr(_T_2981_real_node__T_3000_addr),
        .write_clk(_T_2981_real_node__T_2992_clk),
        .write_en(_T_2981_real_node__T_2992_en),
        .write_mask(_T_2981_real_node__T_2992_mask),
        .write_addr(_T_2981_real_node__T_2992_addr),
        .write_data(_T_2981_real_node__T_2992_data)
    );
    wire _T_2981_imaginary_node__T_2992_clk;
    wire _T_2981_imaginary_node__T_2992_en;
    wire _T_2981_imaginary_node__T_2992_mask;
    wire _T_2981_imaginary_node__T_2992_addr;
    wire [63:0] _T_2981_imaginary_node__T_2992_data;
    wire [63:0] _T_2981_imaginary_node__T_3000_data;
    wire _T_2981_imaginary_node__T_3000_clk;
    wire _T_2981_imaginary_node__T_3000_en;
    wire _T_2981_imaginary_node__T_3000_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2981_imaginary_node (
        .read_data(_T_2981_imaginary_node__T_3000_data),
        .read_clk(_T_2981_imaginary_node__T_3000_clk),
        .read_en(_T_2981_imaginary_node__T_3000_en),
        .read_addr(_T_2981_imaginary_node__T_3000_addr),
        .write_clk(_T_2981_imaginary_node__T_2992_clk),
        .write_en(_T_2981_imaginary_node__T_2992_en),
        .write_mask(_T_2981_imaginary_node__T_2992_mask),
        .write_addr(_T_2981_imaginary_node__T_2992_addr),
        .write_data(_T_2981_imaginary_node__T_2992_data)
    );
    wire _T_2984;
    BITWISEAND #(.width(1)) bitwiseand_880 (
        .y(_T_2984),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2981_real_node__T_2992_addr = 1'h0;
    assign _T_2981_real_node__T_2992_en = io_in_valid;
    assign _T_2981_real_node__T_2992_clk = clock;
    assign _T_2981_imaginary_node__T_2992_addr = 1'h0;
    assign _T_2981_imaginary_node__T_2992_en = io_in_valid;
    assign _T_2981_imaginary_node__T_2992_clk = clock;
    assign _T_2981_imaginary_node__T_2992_mask = 1'h1;
    assign _T_2981_real_node__T_2992_mask = 1'h1;
    assign _T_2981_real_node__T_3000_addr = 1'h0;
    assign _T_2981_real_node__T_3000_en = 1'h1;
    assign _T_2981_real_node__T_3000_clk = clock;
    assign _T_2981_imaginary_node__T_3000_addr = 1'h0;
    assign _T_2981_imaginary_node__T_3000_en = 1'h1;
    assign _T_2981_imaginary_node__T_3000_clk = clock;
    wire _T_3015_real_node__T_3026_clk;
    wire _T_3015_real_node__T_3026_en;
    wire _T_3015_real_node__T_3026_mask;
    wire _T_3015_real_node__T_3026_addr;
    wire [63:0] _T_3015_real_node__T_3026_data;
    wire [63:0] _T_3015_real_node__T_3034_data;
    wire _T_3015_real_node__T_3034_clk;
    wire _T_3015_real_node__T_3034_en;
    wire _T_3015_real_node__T_3034_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3015_real_node (
        .read_data(_T_3015_real_node__T_3034_data),
        .read_clk(_T_3015_real_node__T_3034_clk),
        .read_en(_T_3015_real_node__T_3034_en),
        .read_addr(_T_3015_real_node__T_3034_addr),
        .write_clk(_T_3015_real_node__T_3026_clk),
        .write_en(_T_3015_real_node__T_3026_en),
        .write_mask(_T_3015_real_node__T_3026_mask),
        .write_addr(_T_3015_real_node__T_3026_addr),
        .write_data(_T_3015_real_node__T_3026_data)
    );
    wire _T_3015_imaginary_node__T_3026_clk;
    wire _T_3015_imaginary_node__T_3026_en;
    wire _T_3015_imaginary_node__T_3026_mask;
    wire _T_3015_imaginary_node__T_3026_addr;
    wire [63:0] _T_3015_imaginary_node__T_3026_data;
    wire [63:0] _T_3015_imaginary_node__T_3034_data;
    wire _T_3015_imaginary_node__T_3034_clk;
    wire _T_3015_imaginary_node__T_3034_en;
    wire _T_3015_imaginary_node__T_3034_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3015_imaginary_node (
        .read_data(_T_3015_imaginary_node__T_3034_data),
        .read_clk(_T_3015_imaginary_node__T_3034_clk),
        .read_en(_T_3015_imaginary_node__T_3034_en),
        .read_addr(_T_3015_imaginary_node__T_3034_addr),
        .write_clk(_T_3015_imaginary_node__T_3026_clk),
        .write_en(_T_3015_imaginary_node__T_3026_en),
        .write_mask(_T_3015_imaginary_node__T_3026_mask),
        .write_addr(_T_3015_imaginary_node__T_3026_addr),
        .write_data(_T_3015_imaginary_node__T_3026_data)
    );
    wire _T_3018;
    BITWISEAND #(.width(1)) bitwiseand_881 (
        .y(_T_3018),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3015_real_node__T_3026_addr = 1'h0;
    assign _T_3015_real_node__T_3026_en = io_in_valid;
    assign _T_3015_real_node__T_3026_clk = clock;
    assign _T_3015_imaginary_node__T_3026_addr = 1'h0;
    assign _T_3015_imaginary_node__T_3026_en = io_in_valid;
    assign _T_3015_imaginary_node__T_3026_clk = clock;
    assign _T_3015_imaginary_node__T_3026_mask = 1'h1;
    assign _T_3015_real_node__T_3026_mask = 1'h1;
    assign _T_3015_real_node__T_3034_addr = 1'h0;
    assign _T_3015_real_node__T_3034_en = 1'h1;
    assign _T_3015_real_node__T_3034_clk = clock;
    assign _T_3015_imaginary_node__T_3034_addr = 1'h0;
    assign _T_3015_imaginary_node__T_3034_en = 1'h1;
    assign _T_3015_imaginary_node__T_3034_clk = clock;
    wire [63:0] _BBFMultiply_8_1__out;
    wire [63:0] _BBFMultiply_8_1__in2;
    wire [63:0] _BBFMultiply_8_1__in1;
    BBFMultiply BBFMultiply_8_1 (
        .out(_BBFMultiply_8_1__out),
        .in2(_BBFMultiply_8_1__in2),
        .in1(_BBFMultiply_8_1__in1)
    );
    wire [63:0] _T_3038_node;
    wire [63:0] _BBFMultiply_9_1__out;
    wire [63:0] _BBFMultiply_9_1__in2;
    wire [63:0] _BBFMultiply_9_1__in1;
    BBFMultiply BBFMultiply_9_1 (
        .out(_BBFMultiply_9_1__out),
        .in2(_BBFMultiply_9_1__in2),
        .in1(_BBFMultiply_9_1__in1)
    );
    wire [63:0] _T_3044_node;
    wire [63:0] _T_3050_node;
    wire [63:0] _BBFSubtract_13_1__out;
    wire [63:0] _BBFSubtract_13_1__in2;
    wire [63:0] _BBFSubtract_13_1__in1;
    BBFSubtract BBFSubtract_13_1 (
        .out(_BBFSubtract_13_1__out),
        .in2(_BBFSubtract_13_1__in2),
        .in1(_BBFSubtract_13_1__in1)
    );
    wire [63:0] _T_3057_node;
    wire [63:0] _BBFAdd_12_1__out;
    wire [63:0] _BBFAdd_12_1__in2;
    wire [63:0] _BBFAdd_12_1__in1;
    BBFAdd BBFAdd_12_1 (
        .out(_BBFAdd_12_1__out),
        .in2(_BBFAdd_12_1__in2),
        .in1(_BBFAdd_12_1__in1)
    );
    wire [63:0] _T_3063_node;
    wire [63:0] _BBFMultiply_10_1__out;
    wire [63:0] _BBFMultiply_10_1__in2;
    wire [63:0] _BBFMultiply_10_1__in1;
    BBFMultiply BBFMultiply_10_1 (
        .out(_BBFMultiply_10_1__out),
        .in2(_BBFMultiply_10_1__in2),
        .in1(_BBFMultiply_10_1__in1)
    );
    wire [63:0] _T_3069_node;
    wire [63:0] _BBFMultiply_11_1__out;
    wire [63:0] _BBFMultiply_11_1__in2;
    wire [63:0] _BBFMultiply_11_1__in1;
    BBFMultiply BBFMultiply_11_1 (
        .out(_BBFMultiply_11_1__out),
        .in2(_BBFMultiply_11_1__in2),
        .in1(_BBFMultiply_11_1__in1)
    );
    wire [63:0] _T_3075_node;
    wire [63:0] _BBFAdd_13_1__out;
    wire [63:0] _BBFAdd_13_1__in2;
    wire [63:0] _BBFAdd_13_1__in1;
    BBFAdd BBFAdd_13_1 (
        .out(_BBFAdd_13_1__out),
        .in2(_BBFAdd_13_1__in2),
        .in1(_BBFAdd_13_1__in1)
    );
    wire [63:0] _T_3081_node;
    wire [63:0] _T_3097_real_node;
    wire [63:0] _T_3097_imaginary_node;
    wire [63:0] _BBFAdd_14_1__out;
    wire [63:0] _BBFAdd_14_1__in2;
    wire [63:0] _BBFAdd_14_1__in1;
    BBFAdd BBFAdd_14_1 (
        .out(_BBFAdd_14_1__out),
        .in2(_BBFAdd_14_1__in2),
        .in1(_BBFAdd_14_1__in1)
    );
    wire [63:0] _T_3101_node;
    wire [63:0] _BBFAdd_15_1__out;
    wire [63:0] _BBFAdd_15_1__in2;
    wire [63:0] _BBFAdd_15_1__in1;
    BBFAdd BBFAdd_15_1 (
        .out(_BBFAdd_15_1__out),
        .in2(_BBFAdd_15_1__in2),
        .in1(_BBFAdd_15_1__in1)
    );
    wire [63:0] _T_3107_node;
    wire [63:0] _T_3123_real_node;
    wire [63:0] _T_3123_imaginary_node;
    wire [63:0] _T_3127_node;
    wire [63:0] _BBFSubtract_14_1__out;
    wire [63:0] _BBFSubtract_14_1__in2;
    wire [63:0] _BBFSubtract_14_1__in1;
    BBFSubtract BBFSubtract_14_1 (
        .out(_BBFSubtract_14_1__out),
        .in2(_BBFSubtract_14_1__in2),
        .in1(_BBFSubtract_14_1__in1)
    );
    wire [63:0] _T_3134_node;
    wire [63:0] _T_3140_node;
    wire [63:0] _BBFSubtract_15_1__out;
    wire [63:0] _BBFSubtract_15_1__in2;
    wire [63:0] _BBFSubtract_15_1__in1;
    BBFSubtract BBFSubtract_15_1 (
        .out(_BBFSubtract_15_1__out),
        .in2(_BBFSubtract_15_1__in2),
        .in1(_BBFSubtract_15_1__in1)
    );
    wire [63:0] _T_3147_node;
    wire [63:0] _T_3163_real_node;
    wire [63:0] _T_3163_imaginary_node;
    wire [63:0] _BBFAdd_16_1__out;
    wire [63:0] _BBFAdd_16_1__in2;
    wire [63:0] _BBFAdd_16_1__in1;
    BBFAdd BBFAdd_16_1 (
        .out(_BBFAdd_16_1__out),
        .in2(_BBFAdd_16_1__in2),
        .in1(_BBFAdd_16_1__in1)
    );
    wire [63:0] _T_3167_node;
    wire [63:0] _BBFAdd_17_1__out;
    wire [63:0] _BBFAdd_17_1__in2;
    wire [63:0] _BBFAdd_17_1__in1;
    BBFAdd BBFAdd_17_1 (
        .out(_BBFAdd_17_1__out),
        .in2(_BBFAdd_17_1__in2),
        .in1(_BBFAdd_17_1__in1)
    );
    wire [63:0] _T_3173_node;
    wire [63:0] _T_3189_real_node;
    wire [63:0] _T_3189_imaginary_node;
    wire _T_3204_real_node__T_3215_clk;
    wire _T_3204_real_node__T_3215_en;
    wire _T_3204_real_node__T_3215_mask;
    wire _T_3204_real_node__T_3215_addr;
    wire [63:0] _T_3204_real_node__T_3215_data;
    wire [63:0] _T_3204_real_node__T_3223_data;
    wire _T_3204_real_node__T_3223_clk;
    wire _T_3204_real_node__T_3223_en;
    wire _T_3204_real_node__T_3223_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3204_real_node (
        .read_data(_T_3204_real_node__T_3223_data),
        .read_clk(_T_3204_real_node__T_3223_clk),
        .read_en(_T_3204_real_node__T_3223_en),
        .read_addr(_T_3204_real_node__T_3223_addr),
        .write_clk(_T_3204_real_node__T_3215_clk),
        .write_en(_T_3204_real_node__T_3215_en),
        .write_mask(_T_3204_real_node__T_3215_mask),
        .write_addr(_T_3204_real_node__T_3215_addr),
        .write_data(_T_3204_real_node__T_3215_data)
    );
    wire _T_3204_imaginary_node__T_3215_clk;
    wire _T_3204_imaginary_node__T_3215_en;
    wire _T_3204_imaginary_node__T_3215_mask;
    wire _T_3204_imaginary_node__T_3215_addr;
    wire [63:0] _T_3204_imaginary_node__T_3215_data;
    wire [63:0] _T_3204_imaginary_node__T_3223_data;
    wire _T_3204_imaginary_node__T_3223_clk;
    wire _T_3204_imaginary_node__T_3223_en;
    wire _T_3204_imaginary_node__T_3223_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3204_imaginary_node (
        .read_data(_T_3204_imaginary_node__T_3223_data),
        .read_clk(_T_3204_imaginary_node__T_3223_clk),
        .read_en(_T_3204_imaginary_node__T_3223_en),
        .read_addr(_T_3204_imaginary_node__T_3223_addr),
        .write_clk(_T_3204_imaginary_node__T_3215_clk),
        .write_en(_T_3204_imaginary_node__T_3215_en),
        .write_mask(_T_3204_imaginary_node__T_3215_mask),
        .write_addr(_T_3204_imaginary_node__T_3215_addr),
        .write_data(_T_3204_imaginary_node__T_3215_data)
    );
    wire _T_3207;
    BITWISEAND #(.width(1)) bitwiseand_882 (
        .y(_T_3207),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3204_real_node__T_3215_addr = 1'h0;
    assign _T_3204_real_node__T_3215_en = io_in_valid;
    assign _T_3204_real_node__T_3215_clk = clock;
    assign _T_3204_imaginary_node__T_3215_addr = 1'h0;
    assign _T_3204_imaginary_node__T_3215_en = io_in_valid;
    assign _T_3204_imaginary_node__T_3215_clk = clock;
    assign _T_3204_imaginary_node__T_3215_mask = 1'h1;
    assign _T_3204_real_node__T_3215_mask = 1'h1;
    assign _T_3204_real_node__T_3223_addr = 1'h0;
    assign _T_3204_real_node__T_3223_en = 1'h1;
    assign _T_3204_real_node__T_3223_clk = clock;
    assign _T_3204_imaginary_node__T_3223_addr = 1'h0;
    assign _T_3204_imaginary_node__T_3223_en = 1'h1;
    assign _T_3204_imaginary_node__T_3223_clk = clock;
    wire _T_3238_real_node__T_3249_clk;
    wire _T_3238_real_node__T_3249_en;
    wire _T_3238_real_node__T_3249_mask;
    wire _T_3238_real_node__T_3249_addr;
    wire [63:0] _T_3238_real_node__T_3249_data;
    wire [63:0] _T_3238_real_node__T_3257_data;
    wire _T_3238_real_node__T_3257_clk;
    wire _T_3238_real_node__T_3257_en;
    wire _T_3238_real_node__T_3257_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3238_real_node (
        .read_data(_T_3238_real_node__T_3257_data),
        .read_clk(_T_3238_real_node__T_3257_clk),
        .read_en(_T_3238_real_node__T_3257_en),
        .read_addr(_T_3238_real_node__T_3257_addr),
        .write_clk(_T_3238_real_node__T_3249_clk),
        .write_en(_T_3238_real_node__T_3249_en),
        .write_mask(_T_3238_real_node__T_3249_mask),
        .write_addr(_T_3238_real_node__T_3249_addr),
        .write_data(_T_3238_real_node__T_3249_data)
    );
    wire _T_3238_imaginary_node__T_3249_clk;
    wire _T_3238_imaginary_node__T_3249_en;
    wire _T_3238_imaginary_node__T_3249_mask;
    wire _T_3238_imaginary_node__T_3249_addr;
    wire [63:0] _T_3238_imaginary_node__T_3249_data;
    wire [63:0] _T_3238_imaginary_node__T_3257_data;
    wire _T_3238_imaginary_node__T_3257_clk;
    wire _T_3238_imaginary_node__T_3257_en;
    wire _T_3238_imaginary_node__T_3257_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3238_imaginary_node (
        .read_data(_T_3238_imaginary_node__T_3257_data),
        .read_clk(_T_3238_imaginary_node__T_3257_clk),
        .read_en(_T_3238_imaginary_node__T_3257_en),
        .read_addr(_T_3238_imaginary_node__T_3257_addr),
        .write_clk(_T_3238_imaginary_node__T_3249_clk),
        .write_en(_T_3238_imaginary_node__T_3249_en),
        .write_mask(_T_3238_imaginary_node__T_3249_mask),
        .write_addr(_T_3238_imaginary_node__T_3249_addr),
        .write_data(_T_3238_imaginary_node__T_3249_data)
    );
    wire _T_3241;
    BITWISEAND #(.width(1)) bitwiseand_883 (
        .y(_T_3241),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3238_real_node__T_3249_addr = 1'h0;
    assign _T_3238_real_node__T_3249_en = io_in_valid;
    assign _T_3238_real_node__T_3249_clk = clock;
    assign _T_3238_imaginary_node__T_3249_addr = 1'h0;
    assign _T_3238_imaginary_node__T_3249_en = io_in_valid;
    assign _T_3238_imaginary_node__T_3249_clk = clock;
    assign _T_3238_imaginary_node__T_3249_mask = 1'h1;
    assign _T_3238_real_node__T_3249_mask = 1'h1;
    assign _T_3238_real_node__T_3257_addr = 1'h0;
    assign _T_3238_real_node__T_3257_en = 1'h1;
    assign _T_3238_real_node__T_3257_clk = clock;
    assign _T_3238_imaginary_node__T_3257_addr = 1'h0;
    assign _T_3238_imaginary_node__T_3257_en = 1'h1;
    assign _T_3238_imaginary_node__T_3257_clk = clock;
    wire [63:0] _BBFMultiply_12_1__out;
    wire [63:0] _BBFMultiply_12_1__in2;
    wire [63:0] _BBFMultiply_12_1__in1;
    BBFMultiply BBFMultiply_12_1 (
        .out(_BBFMultiply_12_1__out),
        .in2(_BBFMultiply_12_1__in2),
        .in1(_BBFMultiply_12_1__in1)
    );
    wire [63:0] _T_3261_node;
    wire [63:0] _BBFMultiply_13_1__out;
    wire [63:0] _BBFMultiply_13_1__in2;
    wire [63:0] _BBFMultiply_13_1__in1;
    BBFMultiply BBFMultiply_13_1 (
        .out(_BBFMultiply_13_1__out),
        .in2(_BBFMultiply_13_1__in2),
        .in1(_BBFMultiply_13_1__in1)
    );
    wire [63:0] _T_3267_node;
    wire [63:0] _T_3273_node;
    wire [63:0] _BBFSubtract_16_1__out;
    wire [63:0] _BBFSubtract_16_1__in2;
    wire [63:0] _BBFSubtract_16_1__in1;
    BBFSubtract BBFSubtract_16_1 (
        .out(_BBFSubtract_16_1__out),
        .in2(_BBFSubtract_16_1__in2),
        .in1(_BBFSubtract_16_1__in1)
    );
    wire [63:0] _T_3280_node;
    wire [63:0] _BBFAdd_18_1__out;
    wire [63:0] _BBFAdd_18_1__in2;
    wire [63:0] _BBFAdd_18_1__in1;
    BBFAdd BBFAdd_18_1 (
        .out(_BBFAdd_18_1__out),
        .in2(_BBFAdd_18_1__in2),
        .in1(_BBFAdd_18_1__in1)
    );
    wire [63:0] _T_3286_node;
    wire [63:0] _BBFMultiply_14_1__out;
    wire [63:0] _BBFMultiply_14_1__in2;
    wire [63:0] _BBFMultiply_14_1__in1;
    BBFMultiply BBFMultiply_14_1 (
        .out(_BBFMultiply_14_1__out),
        .in2(_BBFMultiply_14_1__in2),
        .in1(_BBFMultiply_14_1__in1)
    );
    wire [63:0] _T_3292_node;
    wire [63:0] _BBFMultiply_15_1__out;
    wire [63:0] _BBFMultiply_15_1__in2;
    wire [63:0] _BBFMultiply_15_1__in1;
    BBFMultiply BBFMultiply_15_1 (
        .out(_BBFMultiply_15_1__out),
        .in2(_BBFMultiply_15_1__in2),
        .in1(_BBFMultiply_15_1__in1)
    );
    wire [63:0] _T_3298_node;
    wire [63:0] _BBFAdd_19_1__out;
    wire [63:0] _BBFAdd_19_1__in2;
    wire [63:0] _BBFAdd_19_1__in1;
    BBFAdd BBFAdd_19_1 (
        .out(_BBFAdd_19_1__out),
        .in2(_BBFAdd_19_1__in2),
        .in1(_BBFAdd_19_1__in1)
    );
    wire [63:0] _T_3304_node;
    wire [63:0] _T_3320_real_node;
    wire [63:0] _T_3320_imaginary_node;
    wire [63:0] _BBFAdd_20_1__out;
    wire [63:0] _BBFAdd_20_1__in2;
    wire [63:0] _BBFAdd_20_1__in1;
    BBFAdd BBFAdd_20_1 (
        .out(_BBFAdd_20_1__out),
        .in2(_BBFAdd_20_1__in2),
        .in1(_BBFAdd_20_1__in1)
    );
    wire [63:0] _T_3324_node;
    wire [63:0] _BBFAdd_21_1__out;
    wire [63:0] _BBFAdd_21_1__in2;
    wire [63:0] _BBFAdd_21_1__in1;
    BBFAdd BBFAdd_21_1 (
        .out(_BBFAdd_21_1__out),
        .in2(_BBFAdd_21_1__in2),
        .in1(_BBFAdd_21_1__in1)
    );
    wire [63:0] _T_3330_node;
    wire [63:0] _T_3346_real_node;
    wire [63:0] _T_3346_imaginary_node;
    wire [63:0] _T_3350_node;
    wire [63:0] _BBFSubtract_17_1__out;
    wire [63:0] _BBFSubtract_17_1__in2;
    wire [63:0] _BBFSubtract_17_1__in1;
    BBFSubtract BBFSubtract_17_1 (
        .out(_BBFSubtract_17_1__out),
        .in2(_BBFSubtract_17_1__in2),
        .in1(_BBFSubtract_17_1__in1)
    );
    wire [63:0] _T_3357_node;
    wire [63:0] _T_3363_node;
    wire [63:0] _BBFSubtract_18_1__out;
    wire [63:0] _BBFSubtract_18_1__in2;
    wire [63:0] _BBFSubtract_18_1__in1;
    BBFSubtract BBFSubtract_18_1 (
        .out(_BBFSubtract_18_1__out),
        .in2(_BBFSubtract_18_1__in2),
        .in1(_BBFSubtract_18_1__in1)
    );
    wire [63:0] _T_3370_node;
    wire [63:0] _T_3386_real_node;
    wire [63:0] _T_3386_imaginary_node;
    wire [63:0] _BBFAdd_22_1__out;
    wire [63:0] _BBFAdd_22_1__in2;
    wire [63:0] _BBFAdd_22_1__in1;
    BBFAdd BBFAdd_22_1 (
        .out(_BBFAdd_22_1__out),
        .in2(_BBFAdd_22_1__in2),
        .in1(_BBFAdd_22_1__in1)
    );
    wire [63:0] _T_3390_node;
    wire [63:0] _BBFAdd_23_1__out;
    wire [63:0] _BBFAdd_23_1__in2;
    wire [63:0] _BBFAdd_23_1__in1;
    BBFAdd BBFAdd_23_1 (
        .out(_BBFAdd_23_1__out),
        .in2(_BBFAdd_23_1__in2),
        .in1(_BBFAdd_23_1__in1)
    );
    wire [63:0] _T_3396_node;
    wire [63:0] _T_3412_real_node;
    wire [63:0] _T_3412_imaginary_node;
    wire _T_3427_real_node__T_3438_clk;
    wire _T_3427_real_node__T_3438_en;
    wire _T_3427_real_node__T_3438_mask;
    wire _T_3427_real_node__T_3438_addr;
    wire [63:0] _T_3427_real_node__T_3438_data;
    wire [63:0] _T_3427_real_node__T_3446_data;
    wire _T_3427_real_node__T_3446_clk;
    wire _T_3427_real_node__T_3446_en;
    wire _T_3427_real_node__T_3446_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3427_real_node (
        .read_data(_T_3427_real_node__T_3446_data),
        .read_clk(_T_3427_real_node__T_3446_clk),
        .read_en(_T_3427_real_node__T_3446_en),
        .read_addr(_T_3427_real_node__T_3446_addr),
        .write_clk(_T_3427_real_node__T_3438_clk),
        .write_en(_T_3427_real_node__T_3438_en),
        .write_mask(_T_3427_real_node__T_3438_mask),
        .write_addr(_T_3427_real_node__T_3438_addr),
        .write_data(_T_3427_real_node__T_3438_data)
    );
    wire _T_3427_imaginary_node__T_3438_clk;
    wire _T_3427_imaginary_node__T_3438_en;
    wire _T_3427_imaginary_node__T_3438_mask;
    wire _T_3427_imaginary_node__T_3438_addr;
    wire [63:0] _T_3427_imaginary_node__T_3438_data;
    wire [63:0] _T_3427_imaginary_node__T_3446_data;
    wire _T_3427_imaginary_node__T_3446_clk;
    wire _T_3427_imaginary_node__T_3446_en;
    wire _T_3427_imaginary_node__T_3446_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3427_imaginary_node (
        .read_data(_T_3427_imaginary_node__T_3446_data),
        .read_clk(_T_3427_imaginary_node__T_3446_clk),
        .read_en(_T_3427_imaginary_node__T_3446_en),
        .read_addr(_T_3427_imaginary_node__T_3446_addr),
        .write_clk(_T_3427_imaginary_node__T_3438_clk),
        .write_en(_T_3427_imaginary_node__T_3438_en),
        .write_mask(_T_3427_imaginary_node__T_3438_mask),
        .write_addr(_T_3427_imaginary_node__T_3438_addr),
        .write_data(_T_3427_imaginary_node__T_3438_data)
    );
    wire _T_3430;
    BITWISEAND #(.width(1)) bitwiseand_884 (
        .y(_T_3430),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3427_real_node__T_3438_addr = 1'h0;
    assign _T_3427_real_node__T_3438_en = io_in_valid;
    assign _T_3427_real_node__T_3438_clk = clock;
    assign _T_3427_imaginary_node__T_3438_addr = 1'h0;
    assign _T_3427_imaginary_node__T_3438_en = io_in_valid;
    assign _T_3427_imaginary_node__T_3438_clk = clock;
    assign _T_3427_imaginary_node__T_3438_mask = 1'h1;
    assign _T_3427_real_node__T_3438_mask = 1'h1;
    assign _T_3427_real_node__T_3446_addr = 1'h0;
    assign _T_3427_real_node__T_3446_en = 1'h1;
    assign _T_3427_real_node__T_3446_clk = clock;
    assign _T_3427_imaginary_node__T_3446_addr = 1'h0;
    assign _T_3427_imaginary_node__T_3446_en = 1'h1;
    assign _T_3427_imaginary_node__T_3446_clk = clock;
    wire _T_3461_real_node__T_3472_clk;
    wire _T_3461_real_node__T_3472_en;
    wire _T_3461_real_node__T_3472_mask;
    wire _T_3461_real_node__T_3472_addr;
    wire [63:0] _T_3461_real_node__T_3472_data;
    wire [63:0] _T_3461_real_node__T_3480_data;
    wire _T_3461_real_node__T_3480_clk;
    wire _T_3461_real_node__T_3480_en;
    wire _T_3461_real_node__T_3480_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3461_real_node (
        .read_data(_T_3461_real_node__T_3480_data),
        .read_clk(_T_3461_real_node__T_3480_clk),
        .read_en(_T_3461_real_node__T_3480_en),
        .read_addr(_T_3461_real_node__T_3480_addr),
        .write_clk(_T_3461_real_node__T_3472_clk),
        .write_en(_T_3461_real_node__T_3472_en),
        .write_mask(_T_3461_real_node__T_3472_mask),
        .write_addr(_T_3461_real_node__T_3472_addr),
        .write_data(_T_3461_real_node__T_3472_data)
    );
    wire _T_3461_imaginary_node__T_3472_clk;
    wire _T_3461_imaginary_node__T_3472_en;
    wire _T_3461_imaginary_node__T_3472_mask;
    wire _T_3461_imaginary_node__T_3472_addr;
    wire [63:0] _T_3461_imaginary_node__T_3472_data;
    wire [63:0] _T_3461_imaginary_node__T_3480_data;
    wire _T_3461_imaginary_node__T_3480_clk;
    wire _T_3461_imaginary_node__T_3480_en;
    wire _T_3461_imaginary_node__T_3480_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3461_imaginary_node (
        .read_data(_T_3461_imaginary_node__T_3480_data),
        .read_clk(_T_3461_imaginary_node__T_3480_clk),
        .read_en(_T_3461_imaginary_node__T_3480_en),
        .read_addr(_T_3461_imaginary_node__T_3480_addr),
        .write_clk(_T_3461_imaginary_node__T_3472_clk),
        .write_en(_T_3461_imaginary_node__T_3472_en),
        .write_mask(_T_3461_imaginary_node__T_3472_mask),
        .write_addr(_T_3461_imaginary_node__T_3472_addr),
        .write_data(_T_3461_imaginary_node__T_3472_data)
    );
    wire _T_3464;
    BITWISEAND #(.width(1)) bitwiseand_885 (
        .y(_T_3464),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3461_real_node__T_3472_addr = 1'h0;
    assign _T_3461_real_node__T_3472_en = io_in_valid;
    assign _T_3461_real_node__T_3472_clk = clock;
    assign _T_3461_imaginary_node__T_3472_addr = 1'h0;
    assign _T_3461_imaginary_node__T_3472_en = io_in_valid;
    assign _T_3461_imaginary_node__T_3472_clk = clock;
    assign _T_3461_imaginary_node__T_3472_mask = 1'h1;
    assign _T_3461_real_node__T_3472_mask = 1'h1;
    assign _T_3461_real_node__T_3480_addr = 1'h0;
    assign _T_3461_real_node__T_3480_en = 1'h1;
    assign _T_3461_real_node__T_3480_clk = clock;
    assign _T_3461_imaginary_node__T_3480_addr = 1'h0;
    assign _T_3461_imaginary_node__T_3480_en = 1'h1;
    assign _T_3461_imaginary_node__T_3480_clk = clock;
    wire _T_3495_real_node__T_3506_clk;
    wire _T_3495_real_node__T_3506_en;
    wire _T_3495_real_node__T_3506_mask;
    wire _T_3495_real_node__T_3506_addr;
    wire [63:0] _T_3495_real_node__T_3506_data;
    wire [63:0] _T_3495_real_node__T_3514_data;
    wire _T_3495_real_node__T_3514_clk;
    wire _T_3495_real_node__T_3514_en;
    wire _T_3495_real_node__T_3514_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3495_real_node (
        .read_data(_T_3495_real_node__T_3514_data),
        .read_clk(_T_3495_real_node__T_3514_clk),
        .read_en(_T_3495_real_node__T_3514_en),
        .read_addr(_T_3495_real_node__T_3514_addr),
        .write_clk(_T_3495_real_node__T_3506_clk),
        .write_en(_T_3495_real_node__T_3506_en),
        .write_mask(_T_3495_real_node__T_3506_mask),
        .write_addr(_T_3495_real_node__T_3506_addr),
        .write_data(_T_3495_real_node__T_3506_data)
    );
    wire _T_3495_imaginary_node__T_3506_clk;
    wire _T_3495_imaginary_node__T_3506_en;
    wire _T_3495_imaginary_node__T_3506_mask;
    wire _T_3495_imaginary_node__T_3506_addr;
    wire [63:0] _T_3495_imaginary_node__T_3506_data;
    wire [63:0] _T_3495_imaginary_node__T_3514_data;
    wire _T_3495_imaginary_node__T_3514_clk;
    wire _T_3495_imaginary_node__T_3514_en;
    wire _T_3495_imaginary_node__T_3514_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3495_imaginary_node (
        .read_data(_T_3495_imaginary_node__T_3514_data),
        .read_clk(_T_3495_imaginary_node__T_3514_clk),
        .read_en(_T_3495_imaginary_node__T_3514_en),
        .read_addr(_T_3495_imaginary_node__T_3514_addr),
        .write_clk(_T_3495_imaginary_node__T_3506_clk),
        .write_en(_T_3495_imaginary_node__T_3506_en),
        .write_mask(_T_3495_imaginary_node__T_3506_mask),
        .write_addr(_T_3495_imaginary_node__T_3506_addr),
        .write_data(_T_3495_imaginary_node__T_3506_data)
    );
    wire _T_3498;
    BITWISEAND #(.width(1)) bitwiseand_886 (
        .y(_T_3498),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3495_real_node__T_3506_addr = 1'h0;
    assign _T_3495_real_node__T_3506_en = io_in_valid;
    assign _T_3495_real_node__T_3506_clk = clock;
    assign _T_3495_imaginary_node__T_3506_addr = 1'h0;
    assign _T_3495_imaginary_node__T_3506_en = io_in_valid;
    assign _T_3495_imaginary_node__T_3506_clk = clock;
    assign _T_3495_imaginary_node__T_3506_mask = 1'h1;
    assign _T_3495_real_node__T_3506_mask = 1'h1;
    assign _T_3495_real_node__T_3514_addr = 1'h0;
    assign _T_3495_real_node__T_3514_en = 1'h1;
    assign _T_3495_real_node__T_3514_clk = clock;
    assign _T_3495_imaginary_node__T_3514_addr = 1'h0;
    assign _T_3495_imaginary_node__T_3514_en = 1'h1;
    assign _T_3495_imaginary_node__T_3514_clk = clock;
    wire [63:0] _BBFMultiply_16_1__out;
    wire [63:0] _BBFMultiply_16_1__in2;
    wire [63:0] _BBFMultiply_16_1__in1;
    BBFMultiply BBFMultiply_16_1 (
        .out(_BBFMultiply_16_1__out),
        .in2(_BBFMultiply_16_1__in2),
        .in1(_BBFMultiply_16_1__in1)
    );
    wire [63:0] _T_3518_node;
    wire [63:0] _BBFMultiply_17_1__out;
    wire [63:0] _BBFMultiply_17_1__in2;
    wire [63:0] _BBFMultiply_17_1__in1;
    BBFMultiply BBFMultiply_17_1 (
        .out(_BBFMultiply_17_1__out),
        .in2(_BBFMultiply_17_1__in2),
        .in1(_BBFMultiply_17_1__in1)
    );
    wire [63:0] _T_3524_node;
    wire [63:0] _T_3530_node;
    wire [63:0] _BBFSubtract_19_1__out;
    wire [63:0] _BBFSubtract_19_1__in2;
    wire [63:0] _BBFSubtract_19_1__in1;
    BBFSubtract BBFSubtract_19_1 (
        .out(_BBFSubtract_19_1__out),
        .in2(_BBFSubtract_19_1__in2),
        .in1(_BBFSubtract_19_1__in1)
    );
    wire [63:0] _T_3537_node;
    wire [63:0] _BBFAdd_24_1__out;
    wire [63:0] _BBFAdd_24_1__in2;
    wire [63:0] _BBFAdd_24_1__in1;
    BBFAdd BBFAdd_24_1 (
        .out(_BBFAdd_24_1__out),
        .in2(_BBFAdd_24_1__in2),
        .in1(_BBFAdd_24_1__in1)
    );
    wire [63:0] _T_3543_node;
    wire [63:0] _BBFMultiply_18_1__out;
    wire [63:0] _BBFMultiply_18_1__in2;
    wire [63:0] _BBFMultiply_18_1__in1;
    BBFMultiply BBFMultiply_18_1 (
        .out(_BBFMultiply_18_1__out),
        .in2(_BBFMultiply_18_1__in2),
        .in1(_BBFMultiply_18_1__in1)
    );
    wire [63:0] _T_3549_node;
    wire [63:0] _BBFMultiply_19_1__out;
    wire [63:0] _BBFMultiply_19_1__in2;
    wire [63:0] _BBFMultiply_19_1__in1;
    BBFMultiply BBFMultiply_19_1 (
        .out(_BBFMultiply_19_1__out),
        .in2(_BBFMultiply_19_1__in2),
        .in1(_BBFMultiply_19_1__in1)
    );
    wire [63:0] _T_3555_node;
    wire [63:0] _BBFAdd_25_1__out;
    wire [63:0] _BBFAdd_25_1__in2;
    wire [63:0] _BBFAdd_25_1__in1;
    BBFAdd BBFAdd_25_1 (
        .out(_BBFAdd_25_1__out),
        .in2(_BBFAdd_25_1__in2),
        .in1(_BBFAdd_25_1__in1)
    );
    wire [63:0] _T_3561_node;
    wire [63:0] _T_3577_real_node;
    wire [63:0] _T_3577_imaginary_node;
    wire [63:0] _BBFAdd_26_1__out;
    wire [63:0] _BBFAdd_26_1__in2;
    wire [63:0] _BBFAdd_26_1__in1;
    BBFAdd BBFAdd_26_1 (
        .out(_BBFAdd_26_1__out),
        .in2(_BBFAdd_26_1__in2),
        .in1(_BBFAdd_26_1__in1)
    );
    wire [63:0] _T_3581_node;
    wire [63:0] _BBFAdd_27_1__out;
    wire [63:0] _BBFAdd_27_1__in2;
    wire [63:0] _BBFAdd_27_1__in1;
    BBFAdd BBFAdd_27_1 (
        .out(_BBFAdd_27_1__out),
        .in2(_BBFAdd_27_1__in2),
        .in1(_BBFAdd_27_1__in1)
    );
    wire [63:0] _T_3587_node;
    wire [63:0] _T_3603_real_node;
    wire [63:0] _T_3603_imaginary_node;
    wire [63:0] _T_3607_node;
    wire [63:0] _BBFSubtract_20_1__out;
    wire [63:0] _BBFSubtract_20_1__in2;
    wire [63:0] _BBFSubtract_20_1__in1;
    BBFSubtract BBFSubtract_20_1 (
        .out(_BBFSubtract_20_1__out),
        .in2(_BBFSubtract_20_1__in2),
        .in1(_BBFSubtract_20_1__in1)
    );
    wire [63:0] _T_3614_node;
    wire [63:0] _T_3620_node;
    wire [63:0] _BBFSubtract_21_1__out;
    wire [63:0] _BBFSubtract_21_1__in2;
    wire [63:0] _BBFSubtract_21_1__in1;
    BBFSubtract BBFSubtract_21_1 (
        .out(_BBFSubtract_21_1__out),
        .in2(_BBFSubtract_21_1__in2),
        .in1(_BBFSubtract_21_1__in1)
    );
    wire [63:0] _T_3627_node;
    wire [63:0] _T_3643_real_node;
    wire [63:0] _T_3643_imaginary_node;
    wire [63:0] _BBFAdd_28_1__out;
    wire [63:0] _BBFAdd_28_1__in2;
    wire [63:0] _BBFAdd_28_1__in1;
    BBFAdd BBFAdd_28_1 (
        .out(_BBFAdd_28_1__out),
        .in2(_BBFAdd_28_1__in2),
        .in1(_BBFAdd_28_1__in1)
    );
    wire [63:0] _T_3647_node;
    wire [63:0] _BBFAdd_29_1__out;
    wire [63:0] _BBFAdd_29_1__in2;
    wire [63:0] _BBFAdd_29_1__in1;
    BBFAdd BBFAdd_29_1 (
        .out(_BBFAdd_29_1__out),
        .in2(_BBFAdd_29_1__in2),
        .in1(_BBFAdd_29_1__in1)
    );
    wire [63:0] _T_3653_node;
    wire [63:0] _T_3669_real_node;
    wire [63:0] _T_3669_imaginary_node;
    wire _T_3684_real_node__T_3695_clk;
    wire _T_3684_real_node__T_3695_en;
    wire _T_3684_real_node__T_3695_mask;
    wire _T_3684_real_node__T_3695_addr;
    wire [63:0] _T_3684_real_node__T_3695_data;
    wire [63:0] _T_3684_real_node__T_3703_data;
    wire _T_3684_real_node__T_3703_clk;
    wire _T_3684_real_node__T_3703_en;
    wire _T_3684_real_node__T_3703_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3684_real_node (
        .read_data(_T_3684_real_node__T_3703_data),
        .read_clk(_T_3684_real_node__T_3703_clk),
        .read_en(_T_3684_real_node__T_3703_en),
        .read_addr(_T_3684_real_node__T_3703_addr),
        .write_clk(_T_3684_real_node__T_3695_clk),
        .write_en(_T_3684_real_node__T_3695_en),
        .write_mask(_T_3684_real_node__T_3695_mask),
        .write_addr(_T_3684_real_node__T_3695_addr),
        .write_data(_T_3684_real_node__T_3695_data)
    );
    wire _T_3684_imaginary_node__T_3695_clk;
    wire _T_3684_imaginary_node__T_3695_en;
    wire _T_3684_imaginary_node__T_3695_mask;
    wire _T_3684_imaginary_node__T_3695_addr;
    wire [63:0] _T_3684_imaginary_node__T_3695_data;
    wire [63:0] _T_3684_imaginary_node__T_3703_data;
    wire _T_3684_imaginary_node__T_3703_clk;
    wire _T_3684_imaginary_node__T_3703_en;
    wire _T_3684_imaginary_node__T_3703_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3684_imaginary_node (
        .read_data(_T_3684_imaginary_node__T_3703_data),
        .read_clk(_T_3684_imaginary_node__T_3703_clk),
        .read_en(_T_3684_imaginary_node__T_3703_en),
        .read_addr(_T_3684_imaginary_node__T_3703_addr),
        .write_clk(_T_3684_imaginary_node__T_3695_clk),
        .write_en(_T_3684_imaginary_node__T_3695_en),
        .write_mask(_T_3684_imaginary_node__T_3695_mask),
        .write_addr(_T_3684_imaginary_node__T_3695_addr),
        .write_data(_T_3684_imaginary_node__T_3695_data)
    );
    wire _T_3687;
    BITWISEAND #(.width(1)) bitwiseand_887 (
        .y(_T_3687),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3684_real_node__T_3695_addr = 1'h0;
    assign _T_3684_real_node__T_3695_en = io_in_valid;
    assign _T_3684_real_node__T_3695_clk = clock;
    assign _T_3684_imaginary_node__T_3695_addr = 1'h0;
    assign _T_3684_imaginary_node__T_3695_en = io_in_valid;
    assign _T_3684_imaginary_node__T_3695_clk = clock;
    assign _T_3684_imaginary_node__T_3695_mask = 1'h1;
    assign _T_3684_real_node__T_3695_mask = 1'h1;
    assign _T_3684_real_node__T_3703_addr = 1'h0;
    assign _T_3684_real_node__T_3703_en = 1'h1;
    assign _T_3684_real_node__T_3703_clk = clock;
    assign _T_3684_imaginary_node__T_3703_addr = 1'h0;
    assign _T_3684_imaginary_node__T_3703_en = 1'h1;
    assign _T_3684_imaginary_node__T_3703_clk = clock;
    wire _T_3718_real_node__T_3729_clk;
    wire _T_3718_real_node__T_3729_en;
    wire _T_3718_real_node__T_3729_mask;
    wire _T_3718_real_node__T_3729_addr;
    wire [63:0] _T_3718_real_node__T_3729_data;
    wire [63:0] _T_3718_real_node__T_3737_data;
    wire _T_3718_real_node__T_3737_clk;
    wire _T_3718_real_node__T_3737_en;
    wire _T_3718_real_node__T_3737_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3718_real_node (
        .read_data(_T_3718_real_node__T_3737_data),
        .read_clk(_T_3718_real_node__T_3737_clk),
        .read_en(_T_3718_real_node__T_3737_en),
        .read_addr(_T_3718_real_node__T_3737_addr),
        .write_clk(_T_3718_real_node__T_3729_clk),
        .write_en(_T_3718_real_node__T_3729_en),
        .write_mask(_T_3718_real_node__T_3729_mask),
        .write_addr(_T_3718_real_node__T_3729_addr),
        .write_data(_T_3718_real_node__T_3729_data)
    );
    wire _T_3718_imaginary_node__T_3729_clk;
    wire _T_3718_imaginary_node__T_3729_en;
    wire _T_3718_imaginary_node__T_3729_mask;
    wire _T_3718_imaginary_node__T_3729_addr;
    wire [63:0] _T_3718_imaginary_node__T_3729_data;
    wire [63:0] _T_3718_imaginary_node__T_3737_data;
    wire _T_3718_imaginary_node__T_3737_clk;
    wire _T_3718_imaginary_node__T_3737_en;
    wire _T_3718_imaginary_node__T_3737_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3718_imaginary_node (
        .read_data(_T_3718_imaginary_node__T_3737_data),
        .read_clk(_T_3718_imaginary_node__T_3737_clk),
        .read_en(_T_3718_imaginary_node__T_3737_en),
        .read_addr(_T_3718_imaginary_node__T_3737_addr),
        .write_clk(_T_3718_imaginary_node__T_3729_clk),
        .write_en(_T_3718_imaginary_node__T_3729_en),
        .write_mask(_T_3718_imaginary_node__T_3729_mask),
        .write_addr(_T_3718_imaginary_node__T_3729_addr),
        .write_data(_T_3718_imaginary_node__T_3729_data)
    );
    wire _T_3721;
    BITWISEAND #(.width(1)) bitwiseand_888 (
        .y(_T_3721),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3718_real_node__T_3729_addr = 1'h0;
    assign _T_3718_real_node__T_3729_en = io_in_valid;
    assign _T_3718_real_node__T_3729_clk = clock;
    assign _T_3718_imaginary_node__T_3729_addr = 1'h0;
    assign _T_3718_imaginary_node__T_3729_en = io_in_valid;
    assign _T_3718_imaginary_node__T_3729_clk = clock;
    assign _T_3718_imaginary_node__T_3729_mask = 1'h1;
    assign _T_3718_real_node__T_3729_mask = 1'h1;
    assign _T_3718_real_node__T_3737_addr = 1'h0;
    assign _T_3718_real_node__T_3737_en = 1'h1;
    assign _T_3718_real_node__T_3737_clk = clock;
    assign _T_3718_imaginary_node__T_3737_addr = 1'h0;
    assign _T_3718_imaginary_node__T_3737_en = 1'h1;
    assign _T_3718_imaginary_node__T_3737_clk = clock;
    wire _T_3752_real_node__T_3763_clk;
    wire _T_3752_real_node__T_3763_en;
    wire _T_3752_real_node__T_3763_mask;
    wire _T_3752_real_node__T_3763_addr;
    wire [63:0] _T_3752_real_node__T_3763_data;
    wire [63:0] _T_3752_real_node__T_3771_data;
    wire _T_3752_real_node__T_3771_clk;
    wire _T_3752_real_node__T_3771_en;
    wire _T_3752_real_node__T_3771_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3752_real_node (
        .read_data(_T_3752_real_node__T_3771_data),
        .read_clk(_T_3752_real_node__T_3771_clk),
        .read_en(_T_3752_real_node__T_3771_en),
        .read_addr(_T_3752_real_node__T_3771_addr),
        .write_clk(_T_3752_real_node__T_3763_clk),
        .write_en(_T_3752_real_node__T_3763_en),
        .write_mask(_T_3752_real_node__T_3763_mask),
        .write_addr(_T_3752_real_node__T_3763_addr),
        .write_data(_T_3752_real_node__T_3763_data)
    );
    wire _T_3752_imaginary_node__T_3763_clk;
    wire _T_3752_imaginary_node__T_3763_en;
    wire _T_3752_imaginary_node__T_3763_mask;
    wire _T_3752_imaginary_node__T_3763_addr;
    wire [63:0] _T_3752_imaginary_node__T_3763_data;
    wire [63:0] _T_3752_imaginary_node__T_3771_data;
    wire _T_3752_imaginary_node__T_3771_clk;
    wire _T_3752_imaginary_node__T_3771_en;
    wire _T_3752_imaginary_node__T_3771_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3752_imaginary_node (
        .read_data(_T_3752_imaginary_node__T_3771_data),
        .read_clk(_T_3752_imaginary_node__T_3771_clk),
        .read_en(_T_3752_imaginary_node__T_3771_en),
        .read_addr(_T_3752_imaginary_node__T_3771_addr),
        .write_clk(_T_3752_imaginary_node__T_3763_clk),
        .write_en(_T_3752_imaginary_node__T_3763_en),
        .write_mask(_T_3752_imaginary_node__T_3763_mask),
        .write_addr(_T_3752_imaginary_node__T_3763_addr),
        .write_data(_T_3752_imaginary_node__T_3763_data)
    );
    wire _T_3755;
    BITWISEAND #(.width(1)) bitwiseand_889 (
        .y(_T_3755),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3752_real_node__T_3763_addr = 1'h0;
    assign _T_3752_real_node__T_3763_en = io_in_valid;
    assign _T_3752_real_node__T_3763_clk = clock;
    assign _T_3752_imaginary_node__T_3763_addr = 1'h0;
    assign _T_3752_imaginary_node__T_3763_en = io_in_valid;
    assign _T_3752_imaginary_node__T_3763_clk = clock;
    assign _T_3752_imaginary_node__T_3763_mask = 1'h1;
    assign _T_3752_real_node__T_3763_mask = 1'h1;
    assign _T_3752_real_node__T_3771_addr = 1'h0;
    assign _T_3752_real_node__T_3771_en = 1'h1;
    assign _T_3752_real_node__T_3771_clk = clock;
    assign _T_3752_imaginary_node__T_3771_addr = 1'h0;
    assign _T_3752_imaginary_node__T_3771_en = 1'h1;
    assign _T_3752_imaginary_node__T_3771_clk = clock;
    wire [63:0] _BBFMultiply_20_1__out;
    wire [63:0] _BBFMultiply_20_1__in2;
    wire [63:0] _BBFMultiply_20_1__in1;
    BBFMultiply BBFMultiply_20_1 (
        .out(_BBFMultiply_20_1__out),
        .in2(_BBFMultiply_20_1__in2),
        .in1(_BBFMultiply_20_1__in1)
    );
    wire [63:0] _T_3775_node;
    wire [63:0] _BBFMultiply_21_1__out;
    wire [63:0] _BBFMultiply_21_1__in2;
    wire [63:0] _BBFMultiply_21_1__in1;
    BBFMultiply BBFMultiply_21_1 (
        .out(_BBFMultiply_21_1__out),
        .in2(_BBFMultiply_21_1__in2),
        .in1(_BBFMultiply_21_1__in1)
    );
    wire [63:0] _T_3781_node;
    wire [63:0] _T_3787_node;
    wire [63:0] _BBFSubtract_22_1__out;
    wire [63:0] _BBFSubtract_22_1__in2;
    wire [63:0] _BBFSubtract_22_1__in1;
    BBFSubtract BBFSubtract_22_1 (
        .out(_BBFSubtract_22_1__out),
        .in2(_BBFSubtract_22_1__in2),
        .in1(_BBFSubtract_22_1__in1)
    );
    wire [63:0] _T_3794_node;
    wire [63:0] _BBFAdd_30_1__out;
    wire [63:0] _BBFAdd_30_1__in2;
    wire [63:0] _BBFAdd_30_1__in1;
    BBFAdd BBFAdd_30_1 (
        .out(_BBFAdd_30_1__out),
        .in2(_BBFAdd_30_1__in2),
        .in1(_BBFAdd_30_1__in1)
    );
    wire [63:0] _T_3800_node;
    wire [63:0] _BBFMultiply_22_1__out;
    wire [63:0] _BBFMultiply_22_1__in2;
    wire [63:0] _BBFMultiply_22_1__in1;
    BBFMultiply BBFMultiply_22_1 (
        .out(_BBFMultiply_22_1__out),
        .in2(_BBFMultiply_22_1__in2),
        .in1(_BBFMultiply_22_1__in1)
    );
    wire [63:0] _T_3806_node;
    wire [63:0] _BBFMultiply_23_1__out;
    wire [63:0] _BBFMultiply_23_1__in2;
    wire [63:0] _BBFMultiply_23_1__in1;
    BBFMultiply BBFMultiply_23_1 (
        .out(_BBFMultiply_23_1__out),
        .in2(_BBFMultiply_23_1__in2),
        .in1(_BBFMultiply_23_1__in1)
    );
    wire [63:0] _T_3812_node;
    wire [63:0] _BBFAdd_31_1__out;
    wire [63:0] _BBFAdd_31_1__in2;
    wire [63:0] _BBFAdd_31_1__in1;
    BBFAdd BBFAdd_31_1 (
        .out(_BBFAdd_31_1__out),
        .in2(_BBFAdd_31_1__in2),
        .in1(_BBFAdd_31_1__in1)
    );
    wire [63:0] _T_3818_node;
    wire [63:0] _T_3834_real_node;
    wire [63:0] _T_3834_imaginary_node;
    wire [63:0] _BBFAdd_32_1__out;
    wire [63:0] _BBFAdd_32_1__in2;
    wire [63:0] _BBFAdd_32_1__in1;
    BBFAdd BBFAdd_32_1 (
        .out(_BBFAdd_32_1__out),
        .in2(_BBFAdd_32_1__in2),
        .in1(_BBFAdd_32_1__in1)
    );
    wire [63:0] _T_3838_node;
    wire [63:0] _BBFAdd_33_1__out;
    wire [63:0] _BBFAdd_33_1__in2;
    wire [63:0] _BBFAdd_33_1__in1;
    BBFAdd BBFAdd_33_1 (
        .out(_BBFAdd_33_1__out),
        .in2(_BBFAdd_33_1__in2),
        .in1(_BBFAdd_33_1__in1)
    );
    wire [63:0] _T_3844_node;
    wire [63:0] _T_3860_real_node;
    wire [63:0] _T_3860_imaginary_node;
    wire [63:0] _T_3864_node;
    wire [63:0] _BBFSubtract_23_1__out;
    wire [63:0] _BBFSubtract_23_1__in2;
    wire [63:0] _BBFSubtract_23_1__in1;
    BBFSubtract BBFSubtract_23_1 (
        .out(_BBFSubtract_23_1__out),
        .in2(_BBFSubtract_23_1__in2),
        .in1(_BBFSubtract_23_1__in1)
    );
    wire [63:0] _T_3871_node;
    wire [63:0] _T_3877_node;
    wire [63:0] _BBFSubtract_24_1__out;
    wire [63:0] _BBFSubtract_24_1__in2;
    wire [63:0] _BBFSubtract_24_1__in1;
    BBFSubtract BBFSubtract_24_1 (
        .out(_BBFSubtract_24_1__out),
        .in2(_BBFSubtract_24_1__in2),
        .in1(_BBFSubtract_24_1__in1)
    );
    wire [63:0] _T_3884_node;
    wire [63:0] _T_3900_real_node;
    wire [63:0] _T_3900_imaginary_node;
    wire [63:0] _BBFAdd_34_1__out;
    wire [63:0] _BBFAdd_34_1__in2;
    wire [63:0] _BBFAdd_34_1__in1;
    BBFAdd BBFAdd_34_1 (
        .out(_BBFAdd_34_1__out),
        .in2(_BBFAdd_34_1__in2),
        .in1(_BBFAdd_34_1__in1)
    );
    wire [63:0] _T_3904_node;
    wire [63:0] _BBFAdd_35_1__out;
    wire [63:0] _BBFAdd_35_1__in2;
    wire [63:0] _BBFAdd_35_1__in1;
    BBFAdd BBFAdd_35_1 (
        .out(_BBFAdd_35_1__out),
        .in2(_BBFAdd_35_1__in2),
        .in1(_BBFAdd_35_1__in1)
    );
    wire [63:0] _T_3910_node;
    wire [63:0] _T_3926_real_node;
    wire [63:0] _T_3926_imaginary_node;
    wire _T_3941_real_node__T_3952_clk;
    wire _T_3941_real_node__T_3952_en;
    wire _T_3941_real_node__T_3952_mask;
    wire _T_3941_real_node__T_3952_addr;
    wire [63:0] _T_3941_real_node__T_3952_data;
    wire [63:0] _T_3941_real_node__T_3960_data;
    wire _T_3941_real_node__T_3960_clk;
    wire _T_3941_real_node__T_3960_en;
    wire _T_3941_real_node__T_3960_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3941_real_node (
        .read_data(_T_3941_real_node__T_3960_data),
        .read_clk(_T_3941_real_node__T_3960_clk),
        .read_en(_T_3941_real_node__T_3960_en),
        .read_addr(_T_3941_real_node__T_3960_addr),
        .write_clk(_T_3941_real_node__T_3952_clk),
        .write_en(_T_3941_real_node__T_3952_en),
        .write_mask(_T_3941_real_node__T_3952_mask),
        .write_addr(_T_3941_real_node__T_3952_addr),
        .write_data(_T_3941_real_node__T_3952_data)
    );
    wire _T_3941_imaginary_node__T_3952_clk;
    wire _T_3941_imaginary_node__T_3952_en;
    wire _T_3941_imaginary_node__T_3952_mask;
    wire _T_3941_imaginary_node__T_3952_addr;
    wire [63:0] _T_3941_imaginary_node__T_3952_data;
    wire [63:0] _T_3941_imaginary_node__T_3960_data;
    wire _T_3941_imaginary_node__T_3960_clk;
    wire _T_3941_imaginary_node__T_3960_en;
    wire _T_3941_imaginary_node__T_3960_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3941_imaginary_node (
        .read_data(_T_3941_imaginary_node__T_3960_data),
        .read_clk(_T_3941_imaginary_node__T_3960_clk),
        .read_en(_T_3941_imaginary_node__T_3960_en),
        .read_addr(_T_3941_imaginary_node__T_3960_addr),
        .write_clk(_T_3941_imaginary_node__T_3952_clk),
        .write_en(_T_3941_imaginary_node__T_3952_en),
        .write_mask(_T_3941_imaginary_node__T_3952_mask),
        .write_addr(_T_3941_imaginary_node__T_3952_addr),
        .write_data(_T_3941_imaginary_node__T_3952_data)
    );
    wire _T_3944;
    BITWISEAND #(.width(1)) bitwiseand_890 (
        .y(_T_3944),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3941_real_node__T_3952_addr = 1'h0;
    assign _T_3941_real_node__T_3952_en = io_in_valid;
    assign _T_3941_real_node__T_3952_clk = clock;
    assign _T_3941_imaginary_node__T_3952_addr = 1'h0;
    assign _T_3941_imaginary_node__T_3952_en = io_in_valid;
    assign _T_3941_imaginary_node__T_3952_clk = clock;
    assign _T_3941_imaginary_node__T_3952_mask = 1'h1;
    assign _T_3941_real_node__T_3952_mask = 1'h1;
    assign _T_3941_real_node__T_3960_addr = 1'h0;
    assign _T_3941_real_node__T_3960_en = 1'h1;
    assign _T_3941_real_node__T_3960_clk = clock;
    assign _T_3941_imaginary_node__T_3960_addr = 1'h0;
    assign _T_3941_imaginary_node__T_3960_en = 1'h1;
    assign _T_3941_imaginary_node__T_3960_clk = clock;
    wire _T_3975_real_node__T_3986_clk;
    wire _T_3975_real_node__T_3986_en;
    wire _T_3975_real_node__T_3986_mask;
    wire _T_3975_real_node__T_3986_addr;
    wire [63:0] _T_3975_real_node__T_3986_data;
    wire [63:0] _T_3975_real_node__T_3994_data;
    wire _T_3975_real_node__T_3994_clk;
    wire _T_3975_real_node__T_3994_en;
    wire _T_3975_real_node__T_3994_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3975_real_node (
        .read_data(_T_3975_real_node__T_3994_data),
        .read_clk(_T_3975_real_node__T_3994_clk),
        .read_en(_T_3975_real_node__T_3994_en),
        .read_addr(_T_3975_real_node__T_3994_addr),
        .write_clk(_T_3975_real_node__T_3986_clk),
        .write_en(_T_3975_real_node__T_3986_en),
        .write_mask(_T_3975_real_node__T_3986_mask),
        .write_addr(_T_3975_real_node__T_3986_addr),
        .write_data(_T_3975_real_node__T_3986_data)
    );
    wire _T_3975_imaginary_node__T_3986_clk;
    wire _T_3975_imaginary_node__T_3986_en;
    wire _T_3975_imaginary_node__T_3986_mask;
    wire _T_3975_imaginary_node__T_3986_addr;
    wire [63:0] _T_3975_imaginary_node__T_3986_data;
    wire [63:0] _T_3975_imaginary_node__T_3994_data;
    wire _T_3975_imaginary_node__T_3994_clk;
    wire _T_3975_imaginary_node__T_3994_en;
    wire _T_3975_imaginary_node__T_3994_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3975_imaginary_node (
        .read_data(_T_3975_imaginary_node__T_3994_data),
        .read_clk(_T_3975_imaginary_node__T_3994_clk),
        .read_en(_T_3975_imaginary_node__T_3994_en),
        .read_addr(_T_3975_imaginary_node__T_3994_addr),
        .write_clk(_T_3975_imaginary_node__T_3986_clk),
        .write_en(_T_3975_imaginary_node__T_3986_en),
        .write_mask(_T_3975_imaginary_node__T_3986_mask),
        .write_addr(_T_3975_imaginary_node__T_3986_addr),
        .write_data(_T_3975_imaginary_node__T_3986_data)
    );
    wire _T_3978;
    BITWISEAND #(.width(1)) bitwiseand_891 (
        .y(_T_3978),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3975_real_node__T_3986_addr = 1'h0;
    assign _T_3975_real_node__T_3986_en = io_in_valid;
    assign _T_3975_real_node__T_3986_clk = clock;
    assign _T_3975_imaginary_node__T_3986_addr = 1'h0;
    assign _T_3975_imaginary_node__T_3986_en = io_in_valid;
    assign _T_3975_imaginary_node__T_3986_clk = clock;
    assign _T_3975_imaginary_node__T_3986_mask = 1'h1;
    assign _T_3975_real_node__T_3986_mask = 1'h1;
    assign _T_3975_real_node__T_3994_addr = 1'h0;
    assign _T_3975_real_node__T_3994_en = 1'h1;
    assign _T_3975_real_node__T_3994_clk = clock;
    assign _T_3975_imaginary_node__T_3994_addr = 1'h0;
    assign _T_3975_imaginary_node__T_3994_en = 1'h1;
    assign _T_3975_imaginary_node__T_3994_clk = clock;
    wire _T_4009_real_node__T_4020_clk;
    wire _T_4009_real_node__T_4020_en;
    wire _T_4009_real_node__T_4020_mask;
    wire _T_4009_real_node__T_4020_addr;
    wire [63:0] _T_4009_real_node__T_4020_data;
    wire [63:0] _T_4009_real_node__T_4028_data;
    wire _T_4009_real_node__T_4028_clk;
    wire _T_4009_real_node__T_4028_en;
    wire _T_4009_real_node__T_4028_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4009_real_node (
        .read_data(_T_4009_real_node__T_4028_data),
        .read_clk(_T_4009_real_node__T_4028_clk),
        .read_en(_T_4009_real_node__T_4028_en),
        .read_addr(_T_4009_real_node__T_4028_addr),
        .write_clk(_T_4009_real_node__T_4020_clk),
        .write_en(_T_4009_real_node__T_4020_en),
        .write_mask(_T_4009_real_node__T_4020_mask),
        .write_addr(_T_4009_real_node__T_4020_addr),
        .write_data(_T_4009_real_node__T_4020_data)
    );
    wire _T_4009_imaginary_node__T_4020_clk;
    wire _T_4009_imaginary_node__T_4020_en;
    wire _T_4009_imaginary_node__T_4020_mask;
    wire _T_4009_imaginary_node__T_4020_addr;
    wire [63:0] _T_4009_imaginary_node__T_4020_data;
    wire [63:0] _T_4009_imaginary_node__T_4028_data;
    wire _T_4009_imaginary_node__T_4028_clk;
    wire _T_4009_imaginary_node__T_4028_en;
    wire _T_4009_imaginary_node__T_4028_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4009_imaginary_node (
        .read_data(_T_4009_imaginary_node__T_4028_data),
        .read_clk(_T_4009_imaginary_node__T_4028_clk),
        .read_en(_T_4009_imaginary_node__T_4028_en),
        .read_addr(_T_4009_imaginary_node__T_4028_addr),
        .write_clk(_T_4009_imaginary_node__T_4020_clk),
        .write_en(_T_4009_imaginary_node__T_4020_en),
        .write_mask(_T_4009_imaginary_node__T_4020_mask),
        .write_addr(_T_4009_imaginary_node__T_4020_addr),
        .write_data(_T_4009_imaginary_node__T_4020_data)
    );
    wire _T_4012;
    BITWISEAND #(.width(1)) bitwiseand_892 (
        .y(_T_4012),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4009_real_node__T_4020_addr = 1'h0;
    assign _T_4009_real_node__T_4020_en = io_in_valid;
    assign _T_4009_real_node__T_4020_clk = clock;
    assign _T_4009_imaginary_node__T_4020_addr = 1'h0;
    assign _T_4009_imaginary_node__T_4020_en = io_in_valid;
    assign _T_4009_imaginary_node__T_4020_clk = clock;
    assign _T_4009_imaginary_node__T_4020_mask = 1'h1;
    assign _T_4009_real_node__T_4020_mask = 1'h1;
    assign _T_4009_real_node__T_4028_addr = 1'h0;
    assign _T_4009_real_node__T_4028_en = 1'h1;
    assign _T_4009_real_node__T_4028_clk = clock;
    assign _T_4009_imaginary_node__T_4028_addr = 1'h0;
    assign _T_4009_imaginary_node__T_4028_en = 1'h1;
    assign _T_4009_imaginary_node__T_4028_clk = clock;
    wire [63:0] _BBFMultiply_24_1__out;
    wire [63:0] _BBFMultiply_24_1__in2;
    wire [63:0] _BBFMultiply_24_1__in1;
    BBFMultiply BBFMultiply_24_1 (
        .out(_BBFMultiply_24_1__out),
        .in2(_BBFMultiply_24_1__in2),
        .in1(_BBFMultiply_24_1__in1)
    );
    wire [63:0] _T_4032_node;
    wire [63:0] _BBFMultiply_25_1__out;
    wire [63:0] _BBFMultiply_25_1__in2;
    wire [63:0] _BBFMultiply_25_1__in1;
    BBFMultiply BBFMultiply_25_1 (
        .out(_BBFMultiply_25_1__out),
        .in2(_BBFMultiply_25_1__in2),
        .in1(_BBFMultiply_25_1__in1)
    );
    wire [63:0] _T_4038_node;
    wire [63:0] _T_4044_node;
    wire [63:0] _BBFSubtract_25_1__out;
    wire [63:0] _BBFSubtract_25_1__in2;
    wire [63:0] _BBFSubtract_25_1__in1;
    BBFSubtract BBFSubtract_25_1 (
        .out(_BBFSubtract_25_1__out),
        .in2(_BBFSubtract_25_1__in2),
        .in1(_BBFSubtract_25_1__in1)
    );
    wire [63:0] _T_4051_node;
    wire [63:0] _BBFAdd_36_1__out;
    wire [63:0] _BBFAdd_36_1__in2;
    wire [63:0] _BBFAdd_36_1__in1;
    BBFAdd BBFAdd_36_1 (
        .out(_BBFAdd_36_1__out),
        .in2(_BBFAdd_36_1__in2),
        .in1(_BBFAdd_36_1__in1)
    );
    wire [63:0] _T_4057_node;
    wire [63:0] _BBFMultiply_26_1__out;
    wire [63:0] _BBFMultiply_26_1__in2;
    wire [63:0] _BBFMultiply_26_1__in1;
    BBFMultiply BBFMultiply_26_1 (
        .out(_BBFMultiply_26_1__out),
        .in2(_BBFMultiply_26_1__in2),
        .in1(_BBFMultiply_26_1__in1)
    );
    wire [63:0] _T_4063_node;
    wire [63:0] _BBFMultiply_27_1__out;
    wire [63:0] _BBFMultiply_27_1__in2;
    wire [63:0] _BBFMultiply_27_1__in1;
    BBFMultiply BBFMultiply_27_1 (
        .out(_BBFMultiply_27_1__out),
        .in2(_BBFMultiply_27_1__in2),
        .in1(_BBFMultiply_27_1__in1)
    );
    wire [63:0] _T_4069_node;
    wire [63:0] _BBFAdd_37_1__out;
    wire [63:0] _BBFAdd_37_1__in2;
    wire [63:0] _BBFAdd_37_1__in1;
    BBFAdd BBFAdd_37_1 (
        .out(_BBFAdd_37_1__out),
        .in2(_BBFAdd_37_1__in2),
        .in1(_BBFAdd_37_1__in1)
    );
    wire [63:0] _T_4075_node;
    wire [63:0] _T_4091_real_node;
    wire [63:0] _T_4091_imaginary_node;
    wire [63:0] _BBFAdd_38_1__out;
    wire [63:0] _BBFAdd_38_1__in2;
    wire [63:0] _BBFAdd_38_1__in1;
    BBFAdd BBFAdd_38_1 (
        .out(_BBFAdd_38_1__out),
        .in2(_BBFAdd_38_1__in2),
        .in1(_BBFAdd_38_1__in1)
    );
    wire [63:0] _T_4095_node;
    wire [63:0] _BBFAdd_39_1__out;
    wire [63:0] _BBFAdd_39_1__in2;
    wire [63:0] _BBFAdd_39_1__in1;
    BBFAdd BBFAdd_39_1 (
        .out(_BBFAdd_39_1__out),
        .in2(_BBFAdd_39_1__in2),
        .in1(_BBFAdd_39_1__in1)
    );
    wire [63:0] _T_4101_node;
    wire [63:0] _T_4117_real_node;
    wire [63:0] _T_4117_imaginary_node;
    wire [63:0] _T_4121_node;
    wire [63:0] _BBFSubtract_26_1__out;
    wire [63:0] _BBFSubtract_26_1__in2;
    wire [63:0] _BBFSubtract_26_1__in1;
    BBFSubtract BBFSubtract_26_1 (
        .out(_BBFSubtract_26_1__out),
        .in2(_BBFSubtract_26_1__in2),
        .in1(_BBFSubtract_26_1__in1)
    );
    wire [63:0] _T_4128_node;
    wire [63:0] _T_4134_node;
    wire [63:0] _BBFSubtract_27_1__out;
    wire [63:0] _BBFSubtract_27_1__in2;
    wire [63:0] _BBFSubtract_27_1__in1;
    BBFSubtract BBFSubtract_27_1 (
        .out(_BBFSubtract_27_1__out),
        .in2(_BBFSubtract_27_1__in2),
        .in1(_BBFSubtract_27_1__in1)
    );
    wire [63:0] _T_4141_node;
    wire [63:0] _T_4157_real_node;
    wire [63:0] _T_4157_imaginary_node;
    wire [63:0] _BBFAdd_40_1__out;
    wire [63:0] _BBFAdd_40_1__in2;
    wire [63:0] _BBFAdd_40_1__in1;
    BBFAdd BBFAdd_40_1 (
        .out(_BBFAdd_40_1__out),
        .in2(_BBFAdd_40_1__in2),
        .in1(_BBFAdd_40_1__in1)
    );
    wire [63:0] _T_4161_node;
    wire [63:0] _BBFAdd_41_1__out;
    wire [63:0] _BBFAdd_41_1__in2;
    wire [63:0] _BBFAdd_41_1__in1;
    BBFAdd BBFAdd_41_1 (
        .out(_BBFAdd_41_1__out),
        .in2(_BBFAdd_41_1__in2),
        .in1(_BBFAdd_41_1__in1)
    );
    wire [63:0] _T_4167_node;
    wire [63:0] _T_4183_real_node;
    wire [63:0] _T_4183_imaginary_node;
    wire _T_4198_real_node__T_4209_clk;
    wire _T_4198_real_node__T_4209_en;
    wire _T_4198_real_node__T_4209_mask;
    wire _T_4198_real_node__T_4209_addr;
    wire [63:0] _T_4198_real_node__T_4209_data;
    wire [63:0] _T_4198_real_node__T_4217_data;
    wire _T_4198_real_node__T_4217_clk;
    wire _T_4198_real_node__T_4217_en;
    wire _T_4198_real_node__T_4217_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4198_real_node (
        .read_data(_T_4198_real_node__T_4217_data),
        .read_clk(_T_4198_real_node__T_4217_clk),
        .read_en(_T_4198_real_node__T_4217_en),
        .read_addr(_T_4198_real_node__T_4217_addr),
        .write_clk(_T_4198_real_node__T_4209_clk),
        .write_en(_T_4198_real_node__T_4209_en),
        .write_mask(_T_4198_real_node__T_4209_mask),
        .write_addr(_T_4198_real_node__T_4209_addr),
        .write_data(_T_4198_real_node__T_4209_data)
    );
    wire _T_4198_imaginary_node__T_4209_clk;
    wire _T_4198_imaginary_node__T_4209_en;
    wire _T_4198_imaginary_node__T_4209_mask;
    wire _T_4198_imaginary_node__T_4209_addr;
    wire [63:0] _T_4198_imaginary_node__T_4209_data;
    wire [63:0] _T_4198_imaginary_node__T_4217_data;
    wire _T_4198_imaginary_node__T_4217_clk;
    wire _T_4198_imaginary_node__T_4217_en;
    wire _T_4198_imaginary_node__T_4217_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4198_imaginary_node (
        .read_data(_T_4198_imaginary_node__T_4217_data),
        .read_clk(_T_4198_imaginary_node__T_4217_clk),
        .read_en(_T_4198_imaginary_node__T_4217_en),
        .read_addr(_T_4198_imaginary_node__T_4217_addr),
        .write_clk(_T_4198_imaginary_node__T_4209_clk),
        .write_en(_T_4198_imaginary_node__T_4209_en),
        .write_mask(_T_4198_imaginary_node__T_4209_mask),
        .write_addr(_T_4198_imaginary_node__T_4209_addr),
        .write_data(_T_4198_imaginary_node__T_4209_data)
    );
    wire _T_4201;
    BITWISEAND #(.width(1)) bitwiseand_893 (
        .y(_T_4201),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4198_real_node__T_4209_addr = 1'h0;
    assign _T_4198_real_node__T_4209_en = io_in_valid;
    assign _T_4198_real_node__T_4209_clk = clock;
    assign _T_4198_imaginary_node__T_4209_addr = 1'h0;
    assign _T_4198_imaginary_node__T_4209_en = io_in_valid;
    assign _T_4198_imaginary_node__T_4209_clk = clock;
    assign _T_4198_imaginary_node__T_4209_mask = 1'h1;
    assign _T_4198_real_node__T_4209_mask = 1'h1;
    assign _T_4198_real_node__T_4217_addr = 1'h0;
    assign _T_4198_real_node__T_4217_en = 1'h1;
    assign _T_4198_real_node__T_4217_clk = clock;
    assign _T_4198_imaginary_node__T_4217_addr = 1'h0;
    assign _T_4198_imaginary_node__T_4217_en = 1'h1;
    assign _T_4198_imaginary_node__T_4217_clk = clock;
    wire _T_4232_real_node__T_4243_clk;
    wire _T_4232_real_node__T_4243_en;
    wire _T_4232_real_node__T_4243_mask;
    wire _T_4232_real_node__T_4243_addr;
    wire [63:0] _T_4232_real_node__T_4243_data;
    wire [63:0] _T_4232_real_node__T_4251_data;
    wire _T_4232_real_node__T_4251_clk;
    wire _T_4232_real_node__T_4251_en;
    wire _T_4232_real_node__T_4251_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4232_real_node (
        .read_data(_T_4232_real_node__T_4251_data),
        .read_clk(_T_4232_real_node__T_4251_clk),
        .read_en(_T_4232_real_node__T_4251_en),
        .read_addr(_T_4232_real_node__T_4251_addr),
        .write_clk(_T_4232_real_node__T_4243_clk),
        .write_en(_T_4232_real_node__T_4243_en),
        .write_mask(_T_4232_real_node__T_4243_mask),
        .write_addr(_T_4232_real_node__T_4243_addr),
        .write_data(_T_4232_real_node__T_4243_data)
    );
    wire _T_4232_imaginary_node__T_4243_clk;
    wire _T_4232_imaginary_node__T_4243_en;
    wire _T_4232_imaginary_node__T_4243_mask;
    wire _T_4232_imaginary_node__T_4243_addr;
    wire [63:0] _T_4232_imaginary_node__T_4243_data;
    wire [63:0] _T_4232_imaginary_node__T_4251_data;
    wire _T_4232_imaginary_node__T_4251_clk;
    wire _T_4232_imaginary_node__T_4251_en;
    wire _T_4232_imaginary_node__T_4251_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4232_imaginary_node (
        .read_data(_T_4232_imaginary_node__T_4251_data),
        .read_clk(_T_4232_imaginary_node__T_4251_clk),
        .read_en(_T_4232_imaginary_node__T_4251_en),
        .read_addr(_T_4232_imaginary_node__T_4251_addr),
        .write_clk(_T_4232_imaginary_node__T_4243_clk),
        .write_en(_T_4232_imaginary_node__T_4243_en),
        .write_mask(_T_4232_imaginary_node__T_4243_mask),
        .write_addr(_T_4232_imaginary_node__T_4243_addr),
        .write_data(_T_4232_imaginary_node__T_4243_data)
    );
    wire _T_4235;
    BITWISEAND #(.width(1)) bitwiseand_894 (
        .y(_T_4235),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4232_real_node__T_4243_addr = 1'h0;
    assign _T_4232_real_node__T_4243_en = io_in_valid;
    assign _T_4232_real_node__T_4243_clk = clock;
    assign _T_4232_imaginary_node__T_4243_addr = 1'h0;
    assign _T_4232_imaginary_node__T_4243_en = io_in_valid;
    assign _T_4232_imaginary_node__T_4243_clk = clock;
    assign _T_4232_imaginary_node__T_4243_mask = 1'h1;
    assign _T_4232_real_node__T_4243_mask = 1'h1;
    assign _T_4232_real_node__T_4251_addr = 1'h0;
    assign _T_4232_real_node__T_4251_en = 1'h1;
    assign _T_4232_real_node__T_4251_clk = clock;
    assign _T_4232_imaginary_node__T_4251_addr = 1'h0;
    assign _T_4232_imaginary_node__T_4251_en = 1'h1;
    assign _T_4232_imaginary_node__T_4251_clk = clock;
    wire _T_4266_real_node__T_4277_clk;
    wire _T_4266_real_node__T_4277_en;
    wire _T_4266_real_node__T_4277_mask;
    wire _T_4266_real_node__T_4277_addr;
    wire [63:0] _T_4266_real_node__T_4277_data;
    wire [63:0] _T_4266_real_node__T_4285_data;
    wire _T_4266_real_node__T_4285_clk;
    wire _T_4266_real_node__T_4285_en;
    wire _T_4266_real_node__T_4285_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4266_real_node (
        .read_data(_T_4266_real_node__T_4285_data),
        .read_clk(_T_4266_real_node__T_4285_clk),
        .read_en(_T_4266_real_node__T_4285_en),
        .read_addr(_T_4266_real_node__T_4285_addr),
        .write_clk(_T_4266_real_node__T_4277_clk),
        .write_en(_T_4266_real_node__T_4277_en),
        .write_mask(_T_4266_real_node__T_4277_mask),
        .write_addr(_T_4266_real_node__T_4277_addr),
        .write_data(_T_4266_real_node__T_4277_data)
    );
    wire _T_4266_imaginary_node__T_4277_clk;
    wire _T_4266_imaginary_node__T_4277_en;
    wire _T_4266_imaginary_node__T_4277_mask;
    wire _T_4266_imaginary_node__T_4277_addr;
    wire [63:0] _T_4266_imaginary_node__T_4277_data;
    wire [63:0] _T_4266_imaginary_node__T_4285_data;
    wire _T_4266_imaginary_node__T_4285_clk;
    wire _T_4266_imaginary_node__T_4285_en;
    wire _T_4266_imaginary_node__T_4285_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4266_imaginary_node (
        .read_data(_T_4266_imaginary_node__T_4285_data),
        .read_clk(_T_4266_imaginary_node__T_4285_clk),
        .read_en(_T_4266_imaginary_node__T_4285_en),
        .read_addr(_T_4266_imaginary_node__T_4285_addr),
        .write_clk(_T_4266_imaginary_node__T_4277_clk),
        .write_en(_T_4266_imaginary_node__T_4277_en),
        .write_mask(_T_4266_imaginary_node__T_4277_mask),
        .write_addr(_T_4266_imaginary_node__T_4277_addr),
        .write_data(_T_4266_imaginary_node__T_4277_data)
    );
    wire _T_4269;
    BITWISEAND #(.width(1)) bitwiseand_895 (
        .y(_T_4269),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4266_real_node__T_4277_addr = 1'h0;
    assign _T_4266_real_node__T_4277_en = io_in_valid;
    assign _T_4266_real_node__T_4277_clk = clock;
    assign _T_4266_imaginary_node__T_4277_addr = 1'h0;
    assign _T_4266_imaginary_node__T_4277_en = io_in_valid;
    assign _T_4266_imaginary_node__T_4277_clk = clock;
    assign _T_4266_imaginary_node__T_4277_mask = 1'h1;
    assign _T_4266_real_node__T_4277_mask = 1'h1;
    assign _T_4266_real_node__T_4285_addr = 1'h0;
    assign _T_4266_real_node__T_4285_en = 1'h1;
    assign _T_4266_real_node__T_4285_clk = clock;
    assign _T_4266_imaginary_node__T_4285_addr = 1'h0;
    assign _T_4266_imaginary_node__T_4285_en = 1'h1;
    assign _T_4266_imaginary_node__T_4285_clk = clock;
    wire [63:0] _BBFMultiply_28_1__out;
    wire [63:0] _BBFMultiply_28_1__in2;
    wire [63:0] _BBFMultiply_28_1__in1;
    BBFMultiply BBFMultiply_28_1 (
        .out(_BBFMultiply_28_1__out),
        .in2(_BBFMultiply_28_1__in2),
        .in1(_BBFMultiply_28_1__in1)
    );
    wire [63:0] _T_4289_node;
    wire [63:0] _BBFMultiply_29_1__out;
    wire [63:0] _BBFMultiply_29_1__in2;
    wire [63:0] _BBFMultiply_29_1__in1;
    BBFMultiply BBFMultiply_29_1 (
        .out(_BBFMultiply_29_1__out),
        .in2(_BBFMultiply_29_1__in2),
        .in1(_BBFMultiply_29_1__in1)
    );
    wire [63:0] _T_4295_node;
    wire [63:0] _T_4301_node;
    wire [63:0] _BBFSubtract_28_1__out;
    wire [63:0] _BBFSubtract_28_1__in2;
    wire [63:0] _BBFSubtract_28_1__in1;
    BBFSubtract BBFSubtract_28_1 (
        .out(_BBFSubtract_28_1__out),
        .in2(_BBFSubtract_28_1__in2),
        .in1(_BBFSubtract_28_1__in1)
    );
    wire [63:0] _T_4308_node;
    wire [63:0] _BBFAdd_42_1__out;
    wire [63:0] _BBFAdd_42_1__in2;
    wire [63:0] _BBFAdd_42_1__in1;
    BBFAdd BBFAdd_42_1 (
        .out(_BBFAdd_42_1__out),
        .in2(_BBFAdd_42_1__in2),
        .in1(_BBFAdd_42_1__in1)
    );
    wire [63:0] _T_4314_node;
    wire [63:0] _BBFMultiply_30_1__out;
    wire [63:0] _BBFMultiply_30_1__in2;
    wire [63:0] _BBFMultiply_30_1__in1;
    BBFMultiply BBFMultiply_30_1 (
        .out(_BBFMultiply_30_1__out),
        .in2(_BBFMultiply_30_1__in2),
        .in1(_BBFMultiply_30_1__in1)
    );
    wire [63:0] _T_4320_node;
    wire [63:0] _BBFMultiply_31_1__out;
    wire [63:0] _BBFMultiply_31_1__in2;
    wire [63:0] _BBFMultiply_31_1__in1;
    BBFMultiply BBFMultiply_31_1 (
        .out(_BBFMultiply_31_1__out),
        .in2(_BBFMultiply_31_1__in2),
        .in1(_BBFMultiply_31_1__in1)
    );
    wire [63:0] _T_4326_node;
    wire [63:0] _BBFAdd_43_1__out;
    wire [63:0] _BBFAdd_43_1__in2;
    wire [63:0] _BBFAdd_43_1__in1;
    BBFAdd BBFAdd_43_1 (
        .out(_BBFAdd_43_1__out),
        .in2(_BBFAdd_43_1__in2),
        .in1(_BBFAdd_43_1__in1)
    );
    wire [63:0] _T_4332_node;
    wire [63:0] _T_4348_real_node;
    wire [63:0] _T_4348_imaginary_node;
    wire [63:0] _BBFAdd_44_1__out;
    wire [63:0] _BBFAdd_44_1__in2;
    wire [63:0] _BBFAdd_44_1__in1;
    BBFAdd BBFAdd_44_1 (
        .out(_BBFAdd_44_1__out),
        .in2(_BBFAdd_44_1__in2),
        .in1(_BBFAdd_44_1__in1)
    );
    wire [63:0] _T_4352_node;
    wire [63:0] _BBFAdd_45_1__out;
    wire [63:0] _BBFAdd_45_1__in2;
    wire [63:0] _BBFAdd_45_1__in1;
    BBFAdd BBFAdd_45_1 (
        .out(_BBFAdd_45_1__out),
        .in2(_BBFAdd_45_1__in2),
        .in1(_BBFAdd_45_1__in1)
    );
    wire [63:0] _T_4358_node;
    wire [63:0] _T_4374_real_node;
    wire [63:0] _T_4374_imaginary_node;
    wire [63:0] _T_4378_node;
    wire [63:0] _BBFSubtract_29_1__out;
    wire [63:0] _BBFSubtract_29_1__in2;
    wire [63:0] _BBFSubtract_29_1__in1;
    BBFSubtract BBFSubtract_29_1 (
        .out(_BBFSubtract_29_1__out),
        .in2(_BBFSubtract_29_1__in2),
        .in1(_BBFSubtract_29_1__in1)
    );
    wire [63:0] _T_4385_node;
    wire [63:0] _T_4391_node;
    wire [63:0] _BBFSubtract_30_1__out;
    wire [63:0] _BBFSubtract_30_1__in2;
    wire [63:0] _BBFSubtract_30_1__in1;
    BBFSubtract BBFSubtract_30_1 (
        .out(_BBFSubtract_30_1__out),
        .in2(_BBFSubtract_30_1__in2),
        .in1(_BBFSubtract_30_1__in1)
    );
    wire [63:0] _T_4398_node;
    wire [63:0] _T_4414_real_node;
    wire [63:0] _T_4414_imaginary_node;
    wire [63:0] _BBFAdd_46_1__out;
    wire [63:0] _BBFAdd_46_1__in2;
    wire [63:0] _BBFAdd_46_1__in1;
    BBFAdd BBFAdd_46_1 (
        .out(_BBFAdd_46_1__out),
        .in2(_BBFAdd_46_1__in2),
        .in1(_BBFAdd_46_1__in1)
    );
    wire [63:0] _T_4418_node;
    wire [63:0] _BBFAdd_47_1__out;
    wire [63:0] _BBFAdd_47_1__in2;
    wire [63:0] _BBFAdd_47_1__in1;
    BBFAdd BBFAdd_47_1 (
        .out(_BBFAdd_47_1__out),
        .in2(_BBFAdd_47_1__in2),
        .in1(_BBFAdd_47_1__in1)
    );
    wire [63:0] _T_4424_node;
    wire [63:0] _T_4440_real_node;
    wire [63:0] _T_4440_imaginary_node;
    wire _T_4455_real_node__T_4466_clk;
    wire _T_4455_real_node__T_4466_en;
    wire _T_4455_real_node__T_4466_mask;
    wire _T_4455_real_node__T_4466_addr;
    wire [63:0] _T_4455_real_node__T_4466_data;
    wire [63:0] _T_4455_real_node__T_4474_data;
    wire _T_4455_real_node__T_4474_clk;
    wire _T_4455_real_node__T_4474_en;
    wire _T_4455_real_node__T_4474_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4455_real_node (
        .read_data(_T_4455_real_node__T_4474_data),
        .read_clk(_T_4455_real_node__T_4474_clk),
        .read_en(_T_4455_real_node__T_4474_en),
        .read_addr(_T_4455_real_node__T_4474_addr),
        .write_clk(_T_4455_real_node__T_4466_clk),
        .write_en(_T_4455_real_node__T_4466_en),
        .write_mask(_T_4455_real_node__T_4466_mask),
        .write_addr(_T_4455_real_node__T_4466_addr),
        .write_data(_T_4455_real_node__T_4466_data)
    );
    wire _T_4455_imaginary_node__T_4466_clk;
    wire _T_4455_imaginary_node__T_4466_en;
    wire _T_4455_imaginary_node__T_4466_mask;
    wire _T_4455_imaginary_node__T_4466_addr;
    wire [63:0] _T_4455_imaginary_node__T_4466_data;
    wire [63:0] _T_4455_imaginary_node__T_4474_data;
    wire _T_4455_imaginary_node__T_4474_clk;
    wire _T_4455_imaginary_node__T_4474_en;
    wire _T_4455_imaginary_node__T_4474_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4455_imaginary_node (
        .read_data(_T_4455_imaginary_node__T_4474_data),
        .read_clk(_T_4455_imaginary_node__T_4474_clk),
        .read_en(_T_4455_imaginary_node__T_4474_en),
        .read_addr(_T_4455_imaginary_node__T_4474_addr),
        .write_clk(_T_4455_imaginary_node__T_4466_clk),
        .write_en(_T_4455_imaginary_node__T_4466_en),
        .write_mask(_T_4455_imaginary_node__T_4466_mask),
        .write_addr(_T_4455_imaginary_node__T_4466_addr),
        .write_data(_T_4455_imaginary_node__T_4466_data)
    );
    wire _T_4458;
    BITWISEAND #(.width(1)) bitwiseand_896 (
        .y(_T_4458),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4455_real_node__T_4466_addr = 1'h0;
    assign _T_4455_real_node__T_4466_en = io_in_valid;
    assign _T_4455_real_node__T_4466_clk = clock;
    assign _T_4455_imaginary_node__T_4466_addr = 1'h0;
    assign _T_4455_imaginary_node__T_4466_en = io_in_valid;
    assign _T_4455_imaginary_node__T_4466_clk = clock;
    assign _T_4455_imaginary_node__T_4466_mask = 1'h1;
    assign _T_4455_real_node__T_4466_mask = 1'h1;
    assign _T_4455_real_node__T_4474_addr = 1'h0;
    assign _T_4455_real_node__T_4474_en = 1'h1;
    assign _T_4455_real_node__T_4474_clk = clock;
    assign _T_4455_imaginary_node__T_4474_addr = 1'h0;
    assign _T_4455_imaginary_node__T_4474_en = 1'h1;
    assign _T_4455_imaginary_node__T_4474_clk = clock;
    wire _T_4489_real_node__T_4500_clk;
    wire _T_4489_real_node__T_4500_en;
    wire _T_4489_real_node__T_4500_mask;
    wire _T_4489_real_node__T_4500_addr;
    wire [63:0] _T_4489_real_node__T_4500_data;
    wire [63:0] _T_4489_real_node__T_4508_data;
    wire _T_4489_real_node__T_4508_clk;
    wire _T_4489_real_node__T_4508_en;
    wire _T_4489_real_node__T_4508_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4489_real_node (
        .read_data(_T_4489_real_node__T_4508_data),
        .read_clk(_T_4489_real_node__T_4508_clk),
        .read_en(_T_4489_real_node__T_4508_en),
        .read_addr(_T_4489_real_node__T_4508_addr),
        .write_clk(_T_4489_real_node__T_4500_clk),
        .write_en(_T_4489_real_node__T_4500_en),
        .write_mask(_T_4489_real_node__T_4500_mask),
        .write_addr(_T_4489_real_node__T_4500_addr),
        .write_data(_T_4489_real_node__T_4500_data)
    );
    wire _T_4489_imaginary_node__T_4500_clk;
    wire _T_4489_imaginary_node__T_4500_en;
    wire _T_4489_imaginary_node__T_4500_mask;
    wire _T_4489_imaginary_node__T_4500_addr;
    wire [63:0] _T_4489_imaginary_node__T_4500_data;
    wire [63:0] _T_4489_imaginary_node__T_4508_data;
    wire _T_4489_imaginary_node__T_4508_clk;
    wire _T_4489_imaginary_node__T_4508_en;
    wire _T_4489_imaginary_node__T_4508_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4489_imaginary_node (
        .read_data(_T_4489_imaginary_node__T_4508_data),
        .read_clk(_T_4489_imaginary_node__T_4508_clk),
        .read_en(_T_4489_imaginary_node__T_4508_en),
        .read_addr(_T_4489_imaginary_node__T_4508_addr),
        .write_clk(_T_4489_imaginary_node__T_4500_clk),
        .write_en(_T_4489_imaginary_node__T_4500_en),
        .write_mask(_T_4489_imaginary_node__T_4500_mask),
        .write_addr(_T_4489_imaginary_node__T_4500_addr),
        .write_data(_T_4489_imaginary_node__T_4500_data)
    );
    wire _T_4492;
    BITWISEAND #(.width(1)) bitwiseand_897 (
        .y(_T_4492),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4489_real_node__T_4500_addr = 1'h0;
    assign _T_4489_real_node__T_4500_en = io_in_valid;
    assign _T_4489_real_node__T_4500_clk = clock;
    assign _T_4489_imaginary_node__T_4500_addr = 1'h0;
    assign _T_4489_imaginary_node__T_4500_en = io_in_valid;
    assign _T_4489_imaginary_node__T_4500_clk = clock;
    assign _T_4489_imaginary_node__T_4500_mask = 1'h1;
    assign _T_4489_real_node__T_4500_mask = 1'h1;
    assign _T_4489_real_node__T_4508_addr = 1'h0;
    assign _T_4489_real_node__T_4508_en = 1'h1;
    assign _T_4489_real_node__T_4508_clk = clock;
    assign _T_4489_imaginary_node__T_4508_addr = 1'h0;
    assign _T_4489_imaginary_node__T_4508_en = 1'h1;
    assign _T_4489_imaginary_node__T_4508_clk = clock;
    wire _T_4523_real_node__T_4538_clk;
    wire _T_4523_real_node__T_4538_en;
    wire _T_4523_real_node__T_4538_mask;
    wire _T_4523_real_node__T_4538_addr;
    wire [63:0] _T_4523_real_node__T_4538_data;
    wire [63:0] _T_4523_real_node__T_4545_data;
    wire _T_4523_real_node__T_4545_clk;
    wire _T_4523_real_node__T_4545_en;
    wire _T_4523_real_node__T_4545_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4523_real_node (
        .read_data(_T_4523_real_node__T_4545_data),
        .read_clk(_T_4523_real_node__T_4545_clk),
        .read_en(_T_4523_real_node__T_4545_en),
        .read_addr(_T_4523_real_node__T_4545_addr),
        .write_clk(_T_4523_real_node__T_4538_clk),
        .write_en(_T_4523_real_node__T_4538_en),
        .write_mask(_T_4523_real_node__T_4538_mask),
        .write_addr(_T_4523_real_node__T_4538_addr),
        .write_data(_T_4523_real_node__T_4538_data)
    );
    wire _T_4523_imaginary_node__T_4538_clk;
    wire _T_4523_imaginary_node__T_4538_en;
    wire _T_4523_imaginary_node__T_4538_mask;
    wire _T_4523_imaginary_node__T_4538_addr;
    wire [63:0] _T_4523_imaginary_node__T_4538_data;
    wire [63:0] _T_4523_imaginary_node__T_4545_data;
    wire _T_4523_imaginary_node__T_4545_clk;
    wire _T_4523_imaginary_node__T_4545_en;
    wire _T_4523_imaginary_node__T_4545_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4523_imaginary_node (
        .read_data(_T_4523_imaginary_node__T_4545_data),
        .read_clk(_T_4523_imaginary_node__T_4545_clk),
        .read_en(_T_4523_imaginary_node__T_4545_en),
        .read_addr(_T_4523_imaginary_node__T_4545_addr),
        .write_clk(_T_4523_imaginary_node__T_4538_clk),
        .write_en(_T_4523_imaginary_node__T_4538_en),
        .write_mask(_T_4523_imaginary_node__T_4538_mask),
        .write_addr(_T_4523_imaginary_node__T_4538_addr),
        .write_data(_T_4523_imaginary_node__T_4538_data)
    );
    wire __T_4525__q;
    wire __T_4525__d;
    DFF_POSCLK #(.width(1)) _T_4525 (
        .q(__T_4525__q),
        .d(__T_4525__d),
        .clk(clock)
    );
    wire _WTEMP_25;
    MUX_UNSIGNED #(.width(1)) u_mux_898 (
        .y(__T_4525__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_25)
    );
    wire _T_4527;
    EQ_UNSIGNED #(.width(1)) u_eq_899 (
        .y(_T_4527),
        .a(__T_4525__q),
        .b(1'h1)
    );
    wire [1:0] _T_4529;
    ADD_UNSIGNED #(.width(1)) u_add_900 (
        .y(_T_4529),
        .a(__T_4525__q),
        .b(1'h1)
    );
    wire _T_4530;
    TAIL #(.width(2), .n(1)) tail_901 (
        .y(_T_4530),
        .in(_T_4529)
    );
    wire _T_4531;
    BITWISEAND #(.width(1)) bitwiseand_902 (
        .y(_T_4531),
        .a(io_in_valid),
        .b(_T_4527)
    );
    assign _T_4523_real_node__T_4538_addr = __T_4525__q;
    assign _T_4523_real_node__T_4538_en = io_in_valid;
    assign _T_4523_real_node__T_4538_clk = clock;
    assign _T_4523_imaginary_node__T_4538_addr = __T_4525__q;
    assign _T_4523_imaginary_node__T_4538_en = io_in_valid;
    assign _T_4523_imaginary_node__T_4538_clk = clock;
    assign _T_4523_imaginary_node__T_4538_mask = 1'h1;
    assign _T_4523_real_node__T_4538_mask = 1'h1;
    assign _T_4523_real_node__T_4545_addr = __T_4525__q;
    assign _T_4523_real_node__T_4545_en = 1'h1;
    assign _T_4523_real_node__T_4545_clk = clock;
    assign _T_4523_imaginary_node__T_4545_addr = __T_4525__q;
    assign _T_4523_imaginary_node__T_4545_en = 1'h1;
    assign _T_4523_imaginary_node__T_4545_clk = clock;
    wire [63:0] _BBFMultiply_32_1__out;
    wire [63:0] _BBFMultiply_32_1__in2;
    wire [63:0] _BBFMultiply_32_1__in1;
    BBFMultiply BBFMultiply_32_1 (
        .out(_BBFMultiply_32_1__out),
        .in2(_BBFMultiply_32_1__in2),
        .in1(_BBFMultiply_32_1__in1)
    );
    wire [63:0] _T_4549_node;
    wire [63:0] _BBFMultiply_33_1__out;
    wire [63:0] _BBFMultiply_33_1__in2;
    wire [63:0] _BBFMultiply_33_1__in1;
    BBFMultiply BBFMultiply_33_1 (
        .out(_BBFMultiply_33_1__out),
        .in2(_BBFMultiply_33_1__in2),
        .in1(_BBFMultiply_33_1__in1)
    );
    wire [63:0] _T_4555_node;
    wire [63:0] _T_4561_node;
    wire [63:0] _BBFSubtract_31_1__out;
    wire [63:0] _BBFSubtract_31_1__in2;
    wire [63:0] _BBFSubtract_31_1__in1;
    BBFSubtract BBFSubtract_31_1 (
        .out(_BBFSubtract_31_1__out),
        .in2(_BBFSubtract_31_1__in2),
        .in1(_BBFSubtract_31_1__in1)
    );
    wire [63:0] _T_4568_node;
    wire [63:0] _BBFAdd_48_1__out;
    wire [63:0] _BBFAdd_48_1__in2;
    wire [63:0] _BBFAdd_48_1__in1;
    BBFAdd BBFAdd_48_1 (
        .out(_BBFAdd_48_1__out),
        .in2(_BBFAdd_48_1__in2),
        .in1(_BBFAdd_48_1__in1)
    );
    wire [63:0] _T_4574_node;
    wire [63:0] _BBFMultiply_34_1__out;
    wire [63:0] _BBFMultiply_34_1__in2;
    wire [63:0] _BBFMultiply_34_1__in1;
    BBFMultiply BBFMultiply_34_1 (
        .out(_BBFMultiply_34_1__out),
        .in2(_BBFMultiply_34_1__in2),
        .in1(_BBFMultiply_34_1__in1)
    );
    wire [63:0] _T_4580_node;
    wire [63:0] _BBFMultiply_35_1__out;
    wire [63:0] _BBFMultiply_35_1__in2;
    wire [63:0] _BBFMultiply_35_1__in1;
    BBFMultiply BBFMultiply_35_1 (
        .out(_BBFMultiply_35_1__out),
        .in2(_BBFMultiply_35_1__in2),
        .in1(_BBFMultiply_35_1__in1)
    );
    wire [63:0] _T_4586_node;
    wire [63:0] _BBFAdd_49_1__out;
    wire [63:0] _BBFAdd_49_1__in2;
    wire [63:0] _BBFAdd_49_1__in1;
    BBFAdd BBFAdd_49_1 (
        .out(_BBFAdd_49_1__out),
        .in2(_BBFAdd_49_1__in2),
        .in1(_BBFAdd_49_1__in1)
    );
    wire [63:0] _T_4592_node;
    wire [63:0] _T_4608_real_node;
    wire [63:0] _T_4608_imaginary_node;
    wire [63:0] _BBFAdd_50_1__out;
    wire [63:0] _BBFAdd_50_1__in2;
    wire [63:0] _BBFAdd_50_1__in1;
    BBFAdd BBFAdd_50_1 (
        .out(_BBFAdd_50_1__out),
        .in2(_BBFAdd_50_1__in2),
        .in1(_BBFAdd_50_1__in1)
    );
    wire [63:0] _T_4612_node;
    wire [63:0] _BBFAdd_51_1__out;
    wire [63:0] _BBFAdd_51_1__in2;
    wire [63:0] _BBFAdd_51_1__in1;
    BBFAdd BBFAdd_51_1 (
        .out(_BBFAdd_51_1__out),
        .in2(_BBFAdd_51_1__in2),
        .in1(_BBFAdd_51_1__in1)
    );
    wire [63:0] _T_4618_node;
    wire [63:0] _T_4634_real_node;
    wire [63:0] _T_4634_imaginary_node;
    wire [63:0] _T_4638_node;
    wire [63:0] _BBFSubtract_32_1__out;
    wire [63:0] _BBFSubtract_32_1__in2;
    wire [63:0] _BBFSubtract_32_1__in1;
    BBFSubtract BBFSubtract_32_1 (
        .out(_BBFSubtract_32_1__out),
        .in2(_BBFSubtract_32_1__in2),
        .in1(_BBFSubtract_32_1__in1)
    );
    wire [63:0] _T_4645_node;
    wire [63:0] _T_4651_node;
    wire [63:0] _BBFSubtract_33_1__out;
    wire [63:0] _BBFSubtract_33_1__in2;
    wire [63:0] _BBFSubtract_33_1__in1;
    BBFSubtract BBFSubtract_33_1 (
        .out(_BBFSubtract_33_1__out),
        .in2(_BBFSubtract_33_1__in2),
        .in1(_BBFSubtract_33_1__in1)
    );
    wire [63:0] _T_4658_node;
    wire [63:0] _T_4674_real_node;
    wire [63:0] _T_4674_imaginary_node;
    wire [63:0] _BBFAdd_52_1__out;
    wire [63:0] _BBFAdd_52_1__in2;
    wire [63:0] _BBFAdd_52_1__in1;
    BBFAdd BBFAdd_52_1 (
        .out(_BBFAdd_52_1__out),
        .in2(_BBFAdd_52_1__in2),
        .in1(_BBFAdd_52_1__in1)
    );
    wire [63:0] _T_4678_node;
    wire [63:0] _BBFAdd_53_1__out;
    wire [63:0] _BBFAdd_53_1__in2;
    wire [63:0] _BBFAdd_53_1__in1;
    BBFAdd BBFAdd_53_1 (
        .out(_BBFAdd_53_1__out),
        .in2(_BBFAdd_53_1__in2),
        .in1(_BBFAdd_53_1__in1)
    );
    wire [63:0] _T_4684_node;
    wire [63:0] _T_4700_real_node;
    wire [63:0] _T_4700_imaginary_node;
    wire _T_4715_real_node__T_4726_clk;
    wire _T_4715_real_node__T_4726_en;
    wire _T_4715_real_node__T_4726_mask;
    wire _T_4715_real_node__T_4726_addr;
    wire [63:0] _T_4715_real_node__T_4726_data;
    wire [63:0] _T_4715_real_node__T_4734_data;
    wire _T_4715_real_node__T_4734_clk;
    wire _T_4715_real_node__T_4734_en;
    wire _T_4715_real_node__T_4734_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4715_real_node (
        .read_data(_T_4715_real_node__T_4734_data),
        .read_clk(_T_4715_real_node__T_4734_clk),
        .read_en(_T_4715_real_node__T_4734_en),
        .read_addr(_T_4715_real_node__T_4734_addr),
        .write_clk(_T_4715_real_node__T_4726_clk),
        .write_en(_T_4715_real_node__T_4726_en),
        .write_mask(_T_4715_real_node__T_4726_mask),
        .write_addr(_T_4715_real_node__T_4726_addr),
        .write_data(_T_4715_real_node__T_4726_data)
    );
    wire _T_4715_imaginary_node__T_4726_clk;
    wire _T_4715_imaginary_node__T_4726_en;
    wire _T_4715_imaginary_node__T_4726_mask;
    wire _T_4715_imaginary_node__T_4726_addr;
    wire [63:0] _T_4715_imaginary_node__T_4726_data;
    wire [63:0] _T_4715_imaginary_node__T_4734_data;
    wire _T_4715_imaginary_node__T_4734_clk;
    wire _T_4715_imaginary_node__T_4734_en;
    wire _T_4715_imaginary_node__T_4734_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4715_imaginary_node (
        .read_data(_T_4715_imaginary_node__T_4734_data),
        .read_clk(_T_4715_imaginary_node__T_4734_clk),
        .read_en(_T_4715_imaginary_node__T_4734_en),
        .read_addr(_T_4715_imaginary_node__T_4734_addr),
        .write_clk(_T_4715_imaginary_node__T_4726_clk),
        .write_en(_T_4715_imaginary_node__T_4726_en),
        .write_mask(_T_4715_imaginary_node__T_4726_mask),
        .write_addr(_T_4715_imaginary_node__T_4726_addr),
        .write_data(_T_4715_imaginary_node__T_4726_data)
    );
    wire _T_4718;
    BITWISEAND #(.width(1)) bitwiseand_903 (
        .y(_T_4718),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4715_real_node__T_4726_addr = 1'h0;
    assign _T_4715_real_node__T_4726_en = io_in_valid;
    assign _T_4715_real_node__T_4726_clk = clock;
    assign _T_4715_imaginary_node__T_4726_addr = 1'h0;
    assign _T_4715_imaginary_node__T_4726_en = io_in_valid;
    assign _T_4715_imaginary_node__T_4726_clk = clock;
    assign _T_4715_imaginary_node__T_4726_mask = 1'h1;
    assign _T_4715_real_node__T_4726_mask = 1'h1;
    assign _T_4715_real_node__T_4734_addr = 1'h0;
    assign _T_4715_real_node__T_4734_en = 1'h1;
    assign _T_4715_real_node__T_4734_clk = clock;
    assign _T_4715_imaginary_node__T_4734_addr = 1'h0;
    assign _T_4715_imaginary_node__T_4734_en = 1'h1;
    assign _T_4715_imaginary_node__T_4734_clk = clock;
    wire _T_4749_real_node__T_4760_clk;
    wire _T_4749_real_node__T_4760_en;
    wire _T_4749_real_node__T_4760_mask;
    wire _T_4749_real_node__T_4760_addr;
    wire [63:0] _T_4749_real_node__T_4760_data;
    wire [63:0] _T_4749_real_node__T_4768_data;
    wire _T_4749_real_node__T_4768_clk;
    wire _T_4749_real_node__T_4768_en;
    wire _T_4749_real_node__T_4768_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4749_real_node (
        .read_data(_T_4749_real_node__T_4768_data),
        .read_clk(_T_4749_real_node__T_4768_clk),
        .read_en(_T_4749_real_node__T_4768_en),
        .read_addr(_T_4749_real_node__T_4768_addr),
        .write_clk(_T_4749_real_node__T_4760_clk),
        .write_en(_T_4749_real_node__T_4760_en),
        .write_mask(_T_4749_real_node__T_4760_mask),
        .write_addr(_T_4749_real_node__T_4760_addr),
        .write_data(_T_4749_real_node__T_4760_data)
    );
    wire _T_4749_imaginary_node__T_4760_clk;
    wire _T_4749_imaginary_node__T_4760_en;
    wire _T_4749_imaginary_node__T_4760_mask;
    wire _T_4749_imaginary_node__T_4760_addr;
    wire [63:0] _T_4749_imaginary_node__T_4760_data;
    wire [63:0] _T_4749_imaginary_node__T_4768_data;
    wire _T_4749_imaginary_node__T_4768_clk;
    wire _T_4749_imaginary_node__T_4768_en;
    wire _T_4749_imaginary_node__T_4768_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4749_imaginary_node (
        .read_data(_T_4749_imaginary_node__T_4768_data),
        .read_clk(_T_4749_imaginary_node__T_4768_clk),
        .read_en(_T_4749_imaginary_node__T_4768_en),
        .read_addr(_T_4749_imaginary_node__T_4768_addr),
        .write_clk(_T_4749_imaginary_node__T_4760_clk),
        .write_en(_T_4749_imaginary_node__T_4760_en),
        .write_mask(_T_4749_imaginary_node__T_4760_mask),
        .write_addr(_T_4749_imaginary_node__T_4760_addr),
        .write_data(_T_4749_imaginary_node__T_4760_data)
    );
    wire _T_4752;
    BITWISEAND #(.width(1)) bitwiseand_904 (
        .y(_T_4752),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4749_real_node__T_4760_addr = 1'h0;
    assign _T_4749_real_node__T_4760_en = io_in_valid;
    assign _T_4749_real_node__T_4760_clk = clock;
    assign _T_4749_imaginary_node__T_4760_addr = 1'h0;
    assign _T_4749_imaginary_node__T_4760_en = io_in_valid;
    assign _T_4749_imaginary_node__T_4760_clk = clock;
    assign _T_4749_imaginary_node__T_4760_mask = 1'h1;
    assign _T_4749_real_node__T_4760_mask = 1'h1;
    assign _T_4749_real_node__T_4768_addr = 1'h0;
    assign _T_4749_real_node__T_4768_en = 1'h1;
    assign _T_4749_real_node__T_4768_clk = clock;
    assign _T_4749_imaginary_node__T_4768_addr = 1'h0;
    assign _T_4749_imaginary_node__T_4768_en = 1'h1;
    assign _T_4749_imaginary_node__T_4768_clk = clock;
    wire _T_4783_real_node__T_4798_clk;
    wire _T_4783_real_node__T_4798_en;
    wire _T_4783_real_node__T_4798_mask;
    wire _T_4783_real_node__T_4798_addr;
    wire [63:0] _T_4783_real_node__T_4798_data;
    wire [63:0] _T_4783_real_node__T_4805_data;
    wire _T_4783_real_node__T_4805_clk;
    wire _T_4783_real_node__T_4805_en;
    wire _T_4783_real_node__T_4805_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4783_real_node (
        .read_data(_T_4783_real_node__T_4805_data),
        .read_clk(_T_4783_real_node__T_4805_clk),
        .read_en(_T_4783_real_node__T_4805_en),
        .read_addr(_T_4783_real_node__T_4805_addr),
        .write_clk(_T_4783_real_node__T_4798_clk),
        .write_en(_T_4783_real_node__T_4798_en),
        .write_mask(_T_4783_real_node__T_4798_mask),
        .write_addr(_T_4783_real_node__T_4798_addr),
        .write_data(_T_4783_real_node__T_4798_data)
    );
    wire _T_4783_imaginary_node__T_4798_clk;
    wire _T_4783_imaginary_node__T_4798_en;
    wire _T_4783_imaginary_node__T_4798_mask;
    wire _T_4783_imaginary_node__T_4798_addr;
    wire [63:0] _T_4783_imaginary_node__T_4798_data;
    wire [63:0] _T_4783_imaginary_node__T_4805_data;
    wire _T_4783_imaginary_node__T_4805_clk;
    wire _T_4783_imaginary_node__T_4805_en;
    wire _T_4783_imaginary_node__T_4805_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_4783_imaginary_node (
        .read_data(_T_4783_imaginary_node__T_4805_data),
        .read_clk(_T_4783_imaginary_node__T_4805_clk),
        .read_en(_T_4783_imaginary_node__T_4805_en),
        .read_addr(_T_4783_imaginary_node__T_4805_addr),
        .write_clk(_T_4783_imaginary_node__T_4798_clk),
        .write_en(_T_4783_imaginary_node__T_4798_en),
        .write_mask(_T_4783_imaginary_node__T_4798_mask),
        .write_addr(_T_4783_imaginary_node__T_4798_addr),
        .write_data(_T_4783_imaginary_node__T_4798_data)
    );
    wire __T_4785__q;
    wire __T_4785__d;
    DFF_POSCLK #(.width(1)) _T_4785 (
        .q(__T_4785__q),
        .d(__T_4785__d),
        .clk(clock)
    );
    wire _WTEMP_26;
    MUX_UNSIGNED #(.width(1)) u_mux_905 (
        .y(__T_4785__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_26)
    );
    wire _T_4787;
    EQ_UNSIGNED #(.width(1)) u_eq_906 (
        .y(_T_4787),
        .a(__T_4785__q),
        .b(1'h1)
    );
    wire [1:0] _T_4789;
    ADD_UNSIGNED #(.width(1)) u_add_907 (
        .y(_T_4789),
        .a(__T_4785__q),
        .b(1'h1)
    );
    wire _T_4790;
    TAIL #(.width(2), .n(1)) tail_908 (
        .y(_T_4790),
        .in(_T_4789)
    );
    wire _T_4791;
    BITWISEAND #(.width(1)) bitwiseand_909 (
        .y(_T_4791),
        .a(io_in_valid),
        .b(_T_4787)
    );
    assign _T_4783_real_node__T_4798_addr = __T_4785__q;
    assign _T_4783_real_node__T_4798_en = io_in_valid;
    assign _T_4783_real_node__T_4798_clk = clock;
    assign _T_4783_imaginary_node__T_4798_addr = __T_4785__q;
    assign _T_4783_imaginary_node__T_4798_en = io_in_valid;
    assign _T_4783_imaginary_node__T_4798_clk = clock;
    assign _T_4783_imaginary_node__T_4798_mask = 1'h1;
    assign _T_4783_real_node__T_4798_mask = 1'h1;
    assign _T_4783_real_node__T_4805_addr = __T_4785__q;
    assign _T_4783_real_node__T_4805_en = 1'h1;
    assign _T_4783_real_node__T_4805_clk = clock;
    assign _T_4783_imaginary_node__T_4805_addr = __T_4785__q;
    assign _T_4783_imaginary_node__T_4805_en = 1'h1;
    assign _T_4783_imaginary_node__T_4805_clk = clock;
    wire [63:0] _BBFMultiply_36_1__out;
    wire [63:0] _BBFMultiply_36_1__in2;
    wire [63:0] _BBFMultiply_36_1__in1;
    BBFMultiply BBFMultiply_36_1 (
        .out(_BBFMultiply_36_1__out),
        .in2(_BBFMultiply_36_1__in2),
        .in1(_BBFMultiply_36_1__in1)
    );
    wire [63:0] _T_4809_node;
    wire [63:0] _BBFMultiply_37_1__out;
    wire [63:0] _BBFMultiply_37_1__in2;
    wire [63:0] _BBFMultiply_37_1__in1;
    BBFMultiply BBFMultiply_37_1 (
        .out(_BBFMultiply_37_1__out),
        .in2(_BBFMultiply_37_1__in2),
        .in1(_BBFMultiply_37_1__in1)
    );
    wire [63:0] _T_4815_node;
    wire [63:0] _T_4821_node;
    wire [63:0] _BBFSubtract_34_1__out;
    wire [63:0] _BBFSubtract_34_1__in2;
    wire [63:0] _BBFSubtract_34_1__in1;
    BBFSubtract BBFSubtract_34_1 (
        .out(_BBFSubtract_34_1__out),
        .in2(_BBFSubtract_34_1__in2),
        .in1(_BBFSubtract_34_1__in1)
    );
    wire [63:0] _T_4828_node;
    wire [63:0] _BBFAdd_54_1__out;
    wire [63:0] _BBFAdd_54_1__in2;
    wire [63:0] _BBFAdd_54_1__in1;
    BBFAdd BBFAdd_54_1 (
        .out(_BBFAdd_54_1__out),
        .in2(_BBFAdd_54_1__in2),
        .in1(_BBFAdd_54_1__in1)
    );
    wire [63:0] _T_4834_node;
    wire [63:0] _BBFMultiply_38_1__out;
    wire [63:0] _BBFMultiply_38_1__in2;
    wire [63:0] _BBFMultiply_38_1__in1;
    BBFMultiply BBFMultiply_38_1 (
        .out(_BBFMultiply_38_1__out),
        .in2(_BBFMultiply_38_1__in2),
        .in1(_BBFMultiply_38_1__in1)
    );
    wire [63:0] _T_4840_node;
    wire [63:0] _BBFMultiply_39_1__out;
    wire [63:0] _BBFMultiply_39_1__in2;
    wire [63:0] _BBFMultiply_39_1__in1;
    BBFMultiply BBFMultiply_39_1 (
        .out(_BBFMultiply_39_1__out),
        .in2(_BBFMultiply_39_1__in2),
        .in1(_BBFMultiply_39_1__in1)
    );
    wire [63:0] _T_4846_node;
    wire [63:0] _BBFAdd_55_1__out;
    wire [63:0] _BBFAdd_55_1__in2;
    wire [63:0] _BBFAdd_55_1__in1;
    BBFAdd BBFAdd_55_1 (
        .out(_BBFAdd_55_1__out),
        .in2(_BBFAdd_55_1__in2),
        .in1(_BBFAdd_55_1__in1)
    );
    wire [63:0] _T_4852_node;
    wire [63:0] _T_4868_real_node;
    wire [63:0] _T_4868_imaginary_node;
    wire [63:0] _BBFAdd_56_1__out;
    wire [63:0] _BBFAdd_56_1__in2;
    wire [63:0] _BBFAdd_56_1__in1;
    BBFAdd BBFAdd_56_1 (
        .out(_BBFAdd_56_1__out),
        .in2(_BBFAdd_56_1__in2),
        .in1(_BBFAdd_56_1__in1)
    );
    wire [63:0] _T_4872_node;
    wire [63:0] _BBFAdd_57_1__out;
    wire [63:0] _BBFAdd_57_1__in2;
    wire [63:0] _BBFAdd_57_1__in1;
    BBFAdd BBFAdd_57_1 (
        .out(_BBFAdd_57_1__out),
        .in2(_BBFAdd_57_1__in2),
        .in1(_BBFAdd_57_1__in1)
    );
    wire [63:0] _T_4878_node;
    wire [63:0] _T_4894_real_node;
    wire [63:0] _T_4894_imaginary_node;
    wire [63:0] _T_4898_node;
    wire [63:0] _BBFSubtract_35_1__out;
    wire [63:0] _BBFSubtract_35_1__in2;
    wire [63:0] _BBFSubtract_35_1__in1;
    BBFSubtract BBFSubtract_35_1 (
        .out(_BBFSubtract_35_1__out),
        .in2(_BBFSubtract_35_1__in2),
        .in1(_BBFSubtract_35_1__in1)
    );
    wire [63:0] _T_4905_node;
    wire [63:0] _T_4911_node;
    wire [63:0] _BBFSubtract_36_1__out;
    wire [63:0] _BBFSubtract_36_1__in2;
    wire [63:0] _BBFSubtract_36_1__in1;
    BBFSubtract BBFSubtract_36_1 (
        .out(_BBFSubtract_36_1__out),
        .in2(_BBFSubtract_36_1__in2),
        .in1(_BBFSubtract_36_1__in1)
    );
    wire [63:0] _T_4918_node;
    wire [63:0] _T_4934_real_node;
    wire [63:0] _T_4934_imaginary_node;
    wire [63:0] _BBFAdd_58_1__out;
    wire [63:0] _BBFAdd_58_1__in2;
    wire [63:0] _BBFAdd_58_1__in1;
    BBFAdd BBFAdd_58_1 (
        .out(_BBFAdd_58_1__out),
        .in2(_BBFAdd_58_1__in2),
        .in1(_BBFAdd_58_1__in1)
    );
    wire [63:0] _T_4938_node;
    wire [63:0] _BBFAdd_59_1__out;
    wire [63:0] _BBFAdd_59_1__in2;
    wire [63:0] _BBFAdd_59_1__in1;
    BBFAdd BBFAdd_59_1 (
        .out(_BBFAdd_59_1__out),
        .in2(_BBFAdd_59_1__in2),
        .in1(_BBFAdd_59_1__in1)
    );
    wire [63:0] _T_4944_node;
    wire [63:0] _T_4960_real_node;
    wire [63:0] _T_4960_imaginary_node;
    wire _T_4975_real_node__T_4986_clk;
    wire _T_4975_real_node__T_4986_en;
    wire _T_4975_real_node__T_4986_mask;
    wire _T_4975_real_node__T_4986_addr;
    wire [63:0] _T_4975_real_node__T_4986_data;
    wire [63:0] _T_4975_real_node__T_4994_data;
    wire _T_4975_real_node__T_4994_clk;
    wire _T_4975_real_node__T_4994_en;
    wire _T_4975_real_node__T_4994_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4975_real_node (
        .read_data(_T_4975_real_node__T_4994_data),
        .read_clk(_T_4975_real_node__T_4994_clk),
        .read_en(_T_4975_real_node__T_4994_en),
        .read_addr(_T_4975_real_node__T_4994_addr),
        .write_clk(_T_4975_real_node__T_4986_clk),
        .write_en(_T_4975_real_node__T_4986_en),
        .write_mask(_T_4975_real_node__T_4986_mask),
        .write_addr(_T_4975_real_node__T_4986_addr),
        .write_data(_T_4975_real_node__T_4986_data)
    );
    wire _T_4975_imaginary_node__T_4986_clk;
    wire _T_4975_imaginary_node__T_4986_en;
    wire _T_4975_imaginary_node__T_4986_mask;
    wire _T_4975_imaginary_node__T_4986_addr;
    wire [63:0] _T_4975_imaginary_node__T_4986_data;
    wire [63:0] _T_4975_imaginary_node__T_4994_data;
    wire _T_4975_imaginary_node__T_4994_clk;
    wire _T_4975_imaginary_node__T_4994_en;
    wire _T_4975_imaginary_node__T_4994_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4975_imaginary_node (
        .read_data(_T_4975_imaginary_node__T_4994_data),
        .read_clk(_T_4975_imaginary_node__T_4994_clk),
        .read_en(_T_4975_imaginary_node__T_4994_en),
        .read_addr(_T_4975_imaginary_node__T_4994_addr),
        .write_clk(_T_4975_imaginary_node__T_4986_clk),
        .write_en(_T_4975_imaginary_node__T_4986_en),
        .write_mask(_T_4975_imaginary_node__T_4986_mask),
        .write_addr(_T_4975_imaginary_node__T_4986_addr),
        .write_data(_T_4975_imaginary_node__T_4986_data)
    );
    wire _T_4978;
    BITWISEAND #(.width(1)) bitwiseand_910 (
        .y(_T_4978),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4975_real_node__T_4986_addr = 1'h0;
    assign _T_4975_real_node__T_4986_en = io_in_valid;
    assign _T_4975_real_node__T_4986_clk = clock;
    assign _T_4975_imaginary_node__T_4986_addr = 1'h0;
    assign _T_4975_imaginary_node__T_4986_en = io_in_valid;
    assign _T_4975_imaginary_node__T_4986_clk = clock;
    assign _T_4975_imaginary_node__T_4986_mask = 1'h1;
    assign _T_4975_real_node__T_4986_mask = 1'h1;
    assign _T_4975_real_node__T_4994_addr = 1'h0;
    assign _T_4975_real_node__T_4994_en = 1'h1;
    assign _T_4975_real_node__T_4994_clk = clock;
    assign _T_4975_imaginary_node__T_4994_addr = 1'h0;
    assign _T_4975_imaginary_node__T_4994_en = 1'h1;
    assign _T_4975_imaginary_node__T_4994_clk = clock;
    wire _T_5009_real_node__T_5020_clk;
    wire _T_5009_real_node__T_5020_en;
    wire _T_5009_real_node__T_5020_mask;
    wire _T_5009_real_node__T_5020_addr;
    wire [63:0] _T_5009_real_node__T_5020_data;
    wire [63:0] _T_5009_real_node__T_5028_data;
    wire _T_5009_real_node__T_5028_clk;
    wire _T_5009_real_node__T_5028_en;
    wire _T_5009_real_node__T_5028_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5009_real_node (
        .read_data(_T_5009_real_node__T_5028_data),
        .read_clk(_T_5009_real_node__T_5028_clk),
        .read_en(_T_5009_real_node__T_5028_en),
        .read_addr(_T_5009_real_node__T_5028_addr),
        .write_clk(_T_5009_real_node__T_5020_clk),
        .write_en(_T_5009_real_node__T_5020_en),
        .write_mask(_T_5009_real_node__T_5020_mask),
        .write_addr(_T_5009_real_node__T_5020_addr),
        .write_data(_T_5009_real_node__T_5020_data)
    );
    wire _T_5009_imaginary_node__T_5020_clk;
    wire _T_5009_imaginary_node__T_5020_en;
    wire _T_5009_imaginary_node__T_5020_mask;
    wire _T_5009_imaginary_node__T_5020_addr;
    wire [63:0] _T_5009_imaginary_node__T_5020_data;
    wire [63:0] _T_5009_imaginary_node__T_5028_data;
    wire _T_5009_imaginary_node__T_5028_clk;
    wire _T_5009_imaginary_node__T_5028_en;
    wire _T_5009_imaginary_node__T_5028_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5009_imaginary_node (
        .read_data(_T_5009_imaginary_node__T_5028_data),
        .read_clk(_T_5009_imaginary_node__T_5028_clk),
        .read_en(_T_5009_imaginary_node__T_5028_en),
        .read_addr(_T_5009_imaginary_node__T_5028_addr),
        .write_clk(_T_5009_imaginary_node__T_5020_clk),
        .write_en(_T_5009_imaginary_node__T_5020_en),
        .write_mask(_T_5009_imaginary_node__T_5020_mask),
        .write_addr(_T_5009_imaginary_node__T_5020_addr),
        .write_data(_T_5009_imaginary_node__T_5020_data)
    );
    wire _T_5012;
    BITWISEAND #(.width(1)) bitwiseand_911 (
        .y(_T_5012),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_5009_real_node__T_5020_addr = 1'h0;
    assign _T_5009_real_node__T_5020_en = io_in_valid;
    assign _T_5009_real_node__T_5020_clk = clock;
    assign _T_5009_imaginary_node__T_5020_addr = 1'h0;
    assign _T_5009_imaginary_node__T_5020_en = io_in_valid;
    assign _T_5009_imaginary_node__T_5020_clk = clock;
    assign _T_5009_imaginary_node__T_5020_mask = 1'h1;
    assign _T_5009_real_node__T_5020_mask = 1'h1;
    assign _T_5009_real_node__T_5028_addr = 1'h0;
    assign _T_5009_real_node__T_5028_en = 1'h1;
    assign _T_5009_real_node__T_5028_clk = clock;
    assign _T_5009_imaginary_node__T_5028_addr = 1'h0;
    assign _T_5009_imaginary_node__T_5028_en = 1'h1;
    assign _T_5009_imaginary_node__T_5028_clk = clock;
    wire _T_5043_real_node__T_5058_clk;
    wire _T_5043_real_node__T_5058_en;
    wire _T_5043_real_node__T_5058_mask;
    wire _T_5043_real_node__T_5058_addr;
    wire [63:0] _T_5043_real_node__T_5058_data;
    wire [63:0] _T_5043_real_node__T_5065_data;
    wire _T_5043_real_node__T_5065_clk;
    wire _T_5043_real_node__T_5065_en;
    wire _T_5043_real_node__T_5065_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_5043_real_node (
        .read_data(_T_5043_real_node__T_5065_data),
        .read_clk(_T_5043_real_node__T_5065_clk),
        .read_en(_T_5043_real_node__T_5065_en),
        .read_addr(_T_5043_real_node__T_5065_addr),
        .write_clk(_T_5043_real_node__T_5058_clk),
        .write_en(_T_5043_real_node__T_5058_en),
        .write_mask(_T_5043_real_node__T_5058_mask),
        .write_addr(_T_5043_real_node__T_5058_addr),
        .write_data(_T_5043_real_node__T_5058_data)
    );
    wire _T_5043_imaginary_node__T_5058_clk;
    wire _T_5043_imaginary_node__T_5058_en;
    wire _T_5043_imaginary_node__T_5058_mask;
    wire _T_5043_imaginary_node__T_5058_addr;
    wire [63:0] _T_5043_imaginary_node__T_5058_data;
    wire [63:0] _T_5043_imaginary_node__T_5065_data;
    wire _T_5043_imaginary_node__T_5065_clk;
    wire _T_5043_imaginary_node__T_5065_en;
    wire _T_5043_imaginary_node__T_5065_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_5043_imaginary_node (
        .read_data(_T_5043_imaginary_node__T_5065_data),
        .read_clk(_T_5043_imaginary_node__T_5065_clk),
        .read_en(_T_5043_imaginary_node__T_5065_en),
        .read_addr(_T_5043_imaginary_node__T_5065_addr),
        .write_clk(_T_5043_imaginary_node__T_5058_clk),
        .write_en(_T_5043_imaginary_node__T_5058_en),
        .write_mask(_T_5043_imaginary_node__T_5058_mask),
        .write_addr(_T_5043_imaginary_node__T_5058_addr),
        .write_data(_T_5043_imaginary_node__T_5058_data)
    );
    wire __T_5045__q;
    wire __T_5045__d;
    DFF_POSCLK #(.width(1)) _T_5045 (
        .q(__T_5045__q),
        .d(__T_5045__d),
        .clk(clock)
    );
    wire _WTEMP_27;
    MUX_UNSIGNED #(.width(1)) u_mux_912 (
        .y(__T_5045__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_27)
    );
    wire _T_5047;
    EQ_UNSIGNED #(.width(1)) u_eq_913 (
        .y(_T_5047),
        .a(__T_5045__q),
        .b(1'h1)
    );
    wire [1:0] _T_5049;
    ADD_UNSIGNED #(.width(1)) u_add_914 (
        .y(_T_5049),
        .a(__T_5045__q),
        .b(1'h1)
    );
    wire _T_5050;
    TAIL #(.width(2), .n(1)) tail_915 (
        .y(_T_5050),
        .in(_T_5049)
    );
    wire _T_5051;
    BITWISEAND #(.width(1)) bitwiseand_916 (
        .y(_T_5051),
        .a(io_in_valid),
        .b(_T_5047)
    );
    assign _T_5043_real_node__T_5058_addr = __T_5045__q;
    assign _T_5043_real_node__T_5058_en = io_in_valid;
    assign _T_5043_real_node__T_5058_clk = clock;
    assign _T_5043_imaginary_node__T_5058_addr = __T_5045__q;
    assign _T_5043_imaginary_node__T_5058_en = io_in_valid;
    assign _T_5043_imaginary_node__T_5058_clk = clock;
    assign _T_5043_imaginary_node__T_5058_mask = 1'h1;
    assign _T_5043_real_node__T_5058_mask = 1'h1;
    assign _T_5043_real_node__T_5065_addr = __T_5045__q;
    assign _T_5043_real_node__T_5065_en = 1'h1;
    assign _T_5043_real_node__T_5065_clk = clock;
    assign _T_5043_imaginary_node__T_5065_addr = __T_5045__q;
    assign _T_5043_imaginary_node__T_5065_en = 1'h1;
    assign _T_5043_imaginary_node__T_5065_clk = clock;
    wire [63:0] _BBFMultiply_40_1__out;
    wire [63:0] _BBFMultiply_40_1__in2;
    wire [63:0] _BBFMultiply_40_1__in1;
    BBFMultiply BBFMultiply_40_1 (
        .out(_BBFMultiply_40_1__out),
        .in2(_BBFMultiply_40_1__in2),
        .in1(_BBFMultiply_40_1__in1)
    );
    wire [63:0] _T_5069_node;
    wire [63:0] _BBFMultiply_41_1__out;
    wire [63:0] _BBFMultiply_41_1__in2;
    wire [63:0] _BBFMultiply_41_1__in1;
    BBFMultiply BBFMultiply_41_1 (
        .out(_BBFMultiply_41_1__out),
        .in2(_BBFMultiply_41_1__in2),
        .in1(_BBFMultiply_41_1__in1)
    );
    wire [63:0] _T_5075_node;
    wire [63:0] _T_5081_node;
    wire [63:0] _BBFSubtract_37_1__out;
    wire [63:0] _BBFSubtract_37_1__in2;
    wire [63:0] _BBFSubtract_37_1__in1;
    BBFSubtract BBFSubtract_37_1 (
        .out(_BBFSubtract_37_1__out),
        .in2(_BBFSubtract_37_1__in2),
        .in1(_BBFSubtract_37_1__in1)
    );
    wire [63:0] _T_5088_node;
    wire [63:0] _BBFAdd_60_1__out;
    wire [63:0] _BBFAdd_60_1__in2;
    wire [63:0] _BBFAdd_60_1__in1;
    BBFAdd BBFAdd_60_1 (
        .out(_BBFAdd_60_1__out),
        .in2(_BBFAdd_60_1__in2),
        .in1(_BBFAdd_60_1__in1)
    );
    wire [63:0] _T_5094_node;
    wire [63:0] _BBFMultiply_42_1__out;
    wire [63:0] _BBFMultiply_42_1__in2;
    wire [63:0] _BBFMultiply_42_1__in1;
    BBFMultiply BBFMultiply_42_1 (
        .out(_BBFMultiply_42_1__out),
        .in2(_BBFMultiply_42_1__in2),
        .in1(_BBFMultiply_42_1__in1)
    );
    wire [63:0] _T_5100_node;
    wire [63:0] _BBFMultiply_43_1__out;
    wire [63:0] _BBFMultiply_43_1__in2;
    wire [63:0] _BBFMultiply_43_1__in1;
    BBFMultiply BBFMultiply_43_1 (
        .out(_BBFMultiply_43_1__out),
        .in2(_BBFMultiply_43_1__in2),
        .in1(_BBFMultiply_43_1__in1)
    );
    wire [63:0] _T_5106_node;
    wire [63:0] _BBFAdd_61_1__out;
    wire [63:0] _BBFAdd_61_1__in2;
    wire [63:0] _BBFAdd_61_1__in1;
    BBFAdd BBFAdd_61_1 (
        .out(_BBFAdd_61_1__out),
        .in2(_BBFAdd_61_1__in2),
        .in1(_BBFAdd_61_1__in1)
    );
    wire [63:0] _T_5112_node;
    wire [63:0] _T_5128_real_node;
    wire [63:0] _T_5128_imaginary_node;
    wire [63:0] _BBFAdd_62_1__out;
    wire [63:0] _BBFAdd_62_1__in2;
    wire [63:0] _BBFAdd_62_1__in1;
    BBFAdd BBFAdd_62_1 (
        .out(_BBFAdd_62_1__out),
        .in2(_BBFAdd_62_1__in2),
        .in1(_BBFAdd_62_1__in1)
    );
    wire [63:0] _T_5132_node;
    wire [63:0] _BBFAdd_63_1__out;
    wire [63:0] _BBFAdd_63_1__in2;
    wire [63:0] _BBFAdd_63_1__in1;
    BBFAdd BBFAdd_63_1 (
        .out(_BBFAdd_63_1__out),
        .in2(_BBFAdd_63_1__in2),
        .in1(_BBFAdd_63_1__in1)
    );
    wire [63:0] _T_5138_node;
    wire [63:0] _T_5154_real_node;
    wire [63:0] _T_5154_imaginary_node;
    wire [63:0] _T_5158_node;
    wire [63:0] _BBFSubtract_38_1__out;
    wire [63:0] _BBFSubtract_38_1__in2;
    wire [63:0] _BBFSubtract_38_1__in1;
    BBFSubtract BBFSubtract_38_1 (
        .out(_BBFSubtract_38_1__out),
        .in2(_BBFSubtract_38_1__in2),
        .in1(_BBFSubtract_38_1__in1)
    );
    wire [63:0] _T_5165_node;
    wire [63:0] _T_5171_node;
    wire [63:0] _BBFSubtract_39_1__out;
    wire [63:0] _BBFSubtract_39_1__in2;
    wire [63:0] _BBFSubtract_39_1__in1;
    BBFSubtract BBFSubtract_39_1 (
        .out(_BBFSubtract_39_1__out),
        .in2(_BBFSubtract_39_1__in2),
        .in1(_BBFSubtract_39_1__in1)
    );
    wire [63:0] _T_5178_node;
    wire [63:0] _T_5194_real_node;
    wire [63:0] _T_5194_imaginary_node;
    wire [63:0] _BBFAdd_64_1__out;
    wire [63:0] _BBFAdd_64_1__in2;
    wire [63:0] _BBFAdd_64_1__in1;
    BBFAdd BBFAdd_64_1 (
        .out(_BBFAdd_64_1__out),
        .in2(_BBFAdd_64_1__in2),
        .in1(_BBFAdd_64_1__in1)
    );
    wire [63:0] _T_5198_node;
    wire [63:0] _BBFAdd_65_1__out;
    wire [63:0] _BBFAdd_65_1__in2;
    wire [63:0] _BBFAdd_65_1__in1;
    BBFAdd BBFAdd_65_1 (
        .out(_BBFAdd_65_1__out),
        .in2(_BBFAdd_65_1__in2),
        .in1(_BBFAdd_65_1__in1)
    );
    wire [63:0] _T_5204_node;
    wire [63:0] _T_5220_real_node;
    wire [63:0] _T_5220_imaginary_node;
    wire _T_5235_real_node__T_5246_clk;
    wire _T_5235_real_node__T_5246_en;
    wire _T_5235_real_node__T_5246_mask;
    wire _T_5235_real_node__T_5246_addr;
    wire [63:0] _T_5235_real_node__T_5246_data;
    wire [63:0] _T_5235_real_node__T_5254_data;
    wire _T_5235_real_node__T_5254_clk;
    wire _T_5235_real_node__T_5254_en;
    wire _T_5235_real_node__T_5254_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5235_real_node (
        .read_data(_T_5235_real_node__T_5254_data),
        .read_clk(_T_5235_real_node__T_5254_clk),
        .read_en(_T_5235_real_node__T_5254_en),
        .read_addr(_T_5235_real_node__T_5254_addr),
        .write_clk(_T_5235_real_node__T_5246_clk),
        .write_en(_T_5235_real_node__T_5246_en),
        .write_mask(_T_5235_real_node__T_5246_mask),
        .write_addr(_T_5235_real_node__T_5246_addr),
        .write_data(_T_5235_real_node__T_5246_data)
    );
    wire _T_5235_imaginary_node__T_5246_clk;
    wire _T_5235_imaginary_node__T_5246_en;
    wire _T_5235_imaginary_node__T_5246_mask;
    wire _T_5235_imaginary_node__T_5246_addr;
    wire [63:0] _T_5235_imaginary_node__T_5246_data;
    wire [63:0] _T_5235_imaginary_node__T_5254_data;
    wire _T_5235_imaginary_node__T_5254_clk;
    wire _T_5235_imaginary_node__T_5254_en;
    wire _T_5235_imaginary_node__T_5254_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5235_imaginary_node (
        .read_data(_T_5235_imaginary_node__T_5254_data),
        .read_clk(_T_5235_imaginary_node__T_5254_clk),
        .read_en(_T_5235_imaginary_node__T_5254_en),
        .read_addr(_T_5235_imaginary_node__T_5254_addr),
        .write_clk(_T_5235_imaginary_node__T_5246_clk),
        .write_en(_T_5235_imaginary_node__T_5246_en),
        .write_mask(_T_5235_imaginary_node__T_5246_mask),
        .write_addr(_T_5235_imaginary_node__T_5246_addr),
        .write_data(_T_5235_imaginary_node__T_5246_data)
    );
    wire _T_5238;
    BITWISEAND #(.width(1)) bitwiseand_917 (
        .y(_T_5238),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_5235_real_node__T_5246_addr = 1'h0;
    assign _T_5235_real_node__T_5246_en = io_in_valid;
    assign _T_5235_real_node__T_5246_clk = clock;
    assign _T_5235_imaginary_node__T_5246_addr = 1'h0;
    assign _T_5235_imaginary_node__T_5246_en = io_in_valid;
    assign _T_5235_imaginary_node__T_5246_clk = clock;
    assign _T_5235_imaginary_node__T_5246_mask = 1'h1;
    assign _T_5235_real_node__T_5246_mask = 1'h1;
    assign _T_5235_real_node__T_5254_addr = 1'h0;
    assign _T_5235_real_node__T_5254_en = 1'h1;
    assign _T_5235_real_node__T_5254_clk = clock;
    assign _T_5235_imaginary_node__T_5254_addr = 1'h0;
    assign _T_5235_imaginary_node__T_5254_en = 1'h1;
    assign _T_5235_imaginary_node__T_5254_clk = clock;
    wire _T_5269_real_node__T_5280_clk;
    wire _T_5269_real_node__T_5280_en;
    wire _T_5269_real_node__T_5280_mask;
    wire _T_5269_real_node__T_5280_addr;
    wire [63:0] _T_5269_real_node__T_5280_data;
    wire [63:0] _T_5269_real_node__T_5288_data;
    wire _T_5269_real_node__T_5288_clk;
    wire _T_5269_real_node__T_5288_en;
    wire _T_5269_real_node__T_5288_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5269_real_node (
        .read_data(_T_5269_real_node__T_5288_data),
        .read_clk(_T_5269_real_node__T_5288_clk),
        .read_en(_T_5269_real_node__T_5288_en),
        .read_addr(_T_5269_real_node__T_5288_addr),
        .write_clk(_T_5269_real_node__T_5280_clk),
        .write_en(_T_5269_real_node__T_5280_en),
        .write_mask(_T_5269_real_node__T_5280_mask),
        .write_addr(_T_5269_real_node__T_5280_addr),
        .write_data(_T_5269_real_node__T_5280_data)
    );
    wire _T_5269_imaginary_node__T_5280_clk;
    wire _T_5269_imaginary_node__T_5280_en;
    wire _T_5269_imaginary_node__T_5280_mask;
    wire _T_5269_imaginary_node__T_5280_addr;
    wire [63:0] _T_5269_imaginary_node__T_5280_data;
    wire [63:0] _T_5269_imaginary_node__T_5288_data;
    wire _T_5269_imaginary_node__T_5288_clk;
    wire _T_5269_imaginary_node__T_5288_en;
    wire _T_5269_imaginary_node__T_5288_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5269_imaginary_node (
        .read_data(_T_5269_imaginary_node__T_5288_data),
        .read_clk(_T_5269_imaginary_node__T_5288_clk),
        .read_en(_T_5269_imaginary_node__T_5288_en),
        .read_addr(_T_5269_imaginary_node__T_5288_addr),
        .write_clk(_T_5269_imaginary_node__T_5280_clk),
        .write_en(_T_5269_imaginary_node__T_5280_en),
        .write_mask(_T_5269_imaginary_node__T_5280_mask),
        .write_addr(_T_5269_imaginary_node__T_5280_addr),
        .write_data(_T_5269_imaginary_node__T_5280_data)
    );
    wire _T_5272;
    BITWISEAND #(.width(1)) bitwiseand_918 (
        .y(_T_5272),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_5269_real_node__T_5280_addr = 1'h0;
    assign _T_5269_real_node__T_5280_en = io_in_valid;
    assign _T_5269_real_node__T_5280_clk = clock;
    assign _T_5269_imaginary_node__T_5280_addr = 1'h0;
    assign _T_5269_imaginary_node__T_5280_en = io_in_valid;
    assign _T_5269_imaginary_node__T_5280_clk = clock;
    assign _T_5269_imaginary_node__T_5280_mask = 1'h1;
    assign _T_5269_real_node__T_5280_mask = 1'h1;
    assign _T_5269_real_node__T_5288_addr = 1'h0;
    assign _T_5269_real_node__T_5288_en = 1'h1;
    assign _T_5269_real_node__T_5288_clk = clock;
    assign _T_5269_imaginary_node__T_5288_addr = 1'h0;
    assign _T_5269_imaginary_node__T_5288_en = 1'h1;
    assign _T_5269_imaginary_node__T_5288_clk = clock;
    wire _T_5303_real_node__T_5318_clk;
    wire _T_5303_real_node__T_5318_en;
    wire _T_5303_real_node__T_5318_mask;
    wire _T_5303_real_node__T_5318_addr;
    wire [63:0] _T_5303_real_node__T_5318_data;
    wire [63:0] _T_5303_real_node__T_5325_data;
    wire _T_5303_real_node__T_5325_clk;
    wire _T_5303_real_node__T_5325_en;
    wire _T_5303_real_node__T_5325_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_5303_real_node (
        .read_data(_T_5303_real_node__T_5325_data),
        .read_clk(_T_5303_real_node__T_5325_clk),
        .read_en(_T_5303_real_node__T_5325_en),
        .read_addr(_T_5303_real_node__T_5325_addr),
        .write_clk(_T_5303_real_node__T_5318_clk),
        .write_en(_T_5303_real_node__T_5318_en),
        .write_mask(_T_5303_real_node__T_5318_mask),
        .write_addr(_T_5303_real_node__T_5318_addr),
        .write_data(_T_5303_real_node__T_5318_data)
    );
    wire _T_5303_imaginary_node__T_5318_clk;
    wire _T_5303_imaginary_node__T_5318_en;
    wire _T_5303_imaginary_node__T_5318_mask;
    wire _T_5303_imaginary_node__T_5318_addr;
    wire [63:0] _T_5303_imaginary_node__T_5318_data;
    wire [63:0] _T_5303_imaginary_node__T_5325_data;
    wire _T_5303_imaginary_node__T_5325_clk;
    wire _T_5303_imaginary_node__T_5325_en;
    wire _T_5303_imaginary_node__T_5325_addr;
    RAMMEM #(.depth(2), .addrbits(1), .width(64), .isSyncRead(0)) _T_5303_imaginary_node (
        .read_data(_T_5303_imaginary_node__T_5325_data),
        .read_clk(_T_5303_imaginary_node__T_5325_clk),
        .read_en(_T_5303_imaginary_node__T_5325_en),
        .read_addr(_T_5303_imaginary_node__T_5325_addr),
        .write_clk(_T_5303_imaginary_node__T_5318_clk),
        .write_en(_T_5303_imaginary_node__T_5318_en),
        .write_mask(_T_5303_imaginary_node__T_5318_mask),
        .write_addr(_T_5303_imaginary_node__T_5318_addr),
        .write_data(_T_5303_imaginary_node__T_5318_data)
    );
    wire __T_5305__q;
    wire __T_5305__d;
    DFF_POSCLK #(.width(1)) _T_5305 (
        .q(__T_5305__q),
        .d(__T_5305__d),
        .clk(clock)
    );
    wire _WTEMP_28;
    MUX_UNSIGNED #(.width(1)) u_mux_919 (
        .y(__T_5305__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_28)
    );
    wire _T_5307;
    EQ_UNSIGNED #(.width(1)) u_eq_920 (
        .y(_T_5307),
        .a(__T_5305__q),
        .b(1'h1)
    );
    wire [1:0] _T_5309;
    ADD_UNSIGNED #(.width(1)) u_add_921 (
        .y(_T_5309),
        .a(__T_5305__q),
        .b(1'h1)
    );
    wire _T_5310;
    TAIL #(.width(2), .n(1)) tail_922 (
        .y(_T_5310),
        .in(_T_5309)
    );
    wire _T_5311;
    BITWISEAND #(.width(1)) bitwiseand_923 (
        .y(_T_5311),
        .a(io_in_valid),
        .b(_T_5307)
    );
    assign _T_5303_real_node__T_5318_addr = __T_5305__q;
    assign _T_5303_real_node__T_5318_en = io_in_valid;
    assign _T_5303_real_node__T_5318_clk = clock;
    assign _T_5303_imaginary_node__T_5318_addr = __T_5305__q;
    assign _T_5303_imaginary_node__T_5318_en = io_in_valid;
    assign _T_5303_imaginary_node__T_5318_clk = clock;
    assign _T_5303_imaginary_node__T_5318_mask = 1'h1;
    assign _T_5303_real_node__T_5318_mask = 1'h1;
    assign _T_5303_real_node__T_5325_addr = __T_5305__q;
    assign _T_5303_real_node__T_5325_en = 1'h1;
    assign _T_5303_real_node__T_5325_clk = clock;
    assign _T_5303_imaginary_node__T_5325_addr = __T_5305__q;
    assign _T_5303_imaginary_node__T_5325_en = 1'h1;
    assign _T_5303_imaginary_node__T_5325_clk = clock;
    wire [63:0] _BBFMultiply_44_1__out;
    wire [63:0] _BBFMultiply_44_1__in2;
    wire [63:0] _BBFMultiply_44_1__in1;
    BBFMultiply BBFMultiply_44_1 (
        .out(_BBFMultiply_44_1__out),
        .in2(_BBFMultiply_44_1__in2),
        .in1(_BBFMultiply_44_1__in1)
    );
    wire [63:0] _T_5329_node;
    wire [63:0] _BBFMultiply_45_1__out;
    wire [63:0] _BBFMultiply_45_1__in2;
    wire [63:0] _BBFMultiply_45_1__in1;
    BBFMultiply BBFMultiply_45_1 (
        .out(_BBFMultiply_45_1__out),
        .in2(_BBFMultiply_45_1__in2),
        .in1(_BBFMultiply_45_1__in1)
    );
    wire [63:0] _T_5335_node;
    wire [63:0] _T_5341_node;
    wire [63:0] _BBFSubtract_40_1__out;
    wire [63:0] _BBFSubtract_40_1__in2;
    wire [63:0] _BBFSubtract_40_1__in1;
    BBFSubtract BBFSubtract_40_1 (
        .out(_BBFSubtract_40_1__out),
        .in2(_BBFSubtract_40_1__in2),
        .in1(_BBFSubtract_40_1__in1)
    );
    wire [63:0] _T_5348_node;
    wire [63:0] _BBFAdd_66_1__out;
    wire [63:0] _BBFAdd_66_1__in2;
    wire [63:0] _BBFAdd_66_1__in1;
    BBFAdd BBFAdd_66_1 (
        .out(_BBFAdd_66_1__out),
        .in2(_BBFAdd_66_1__in2),
        .in1(_BBFAdd_66_1__in1)
    );
    wire [63:0] _T_5354_node;
    wire [63:0] _BBFMultiply_46_1__out;
    wire [63:0] _BBFMultiply_46_1__in2;
    wire [63:0] _BBFMultiply_46_1__in1;
    BBFMultiply BBFMultiply_46_1 (
        .out(_BBFMultiply_46_1__out),
        .in2(_BBFMultiply_46_1__in2),
        .in1(_BBFMultiply_46_1__in1)
    );
    wire [63:0] _T_5360_node;
    wire [63:0] _BBFMultiply_47_1__out;
    wire [63:0] _BBFMultiply_47_1__in2;
    wire [63:0] _BBFMultiply_47_1__in1;
    BBFMultiply BBFMultiply_47_1 (
        .out(_BBFMultiply_47_1__out),
        .in2(_BBFMultiply_47_1__in2),
        .in1(_BBFMultiply_47_1__in1)
    );
    wire [63:0] _T_5366_node;
    wire [63:0] _BBFAdd_67_1__out;
    wire [63:0] _BBFAdd_67_1__in2;
    wire [63:0] _BBFAdd_67_1__in1;
    BBFAdd BBFAdd_67_1 (
        .out(_BBFAdd_67_1__out),
        .in2(_BBFAdd_67_1__in2),
        .in1(_BBFAdd_67_1__in1)
    );
    wire [63:0] _T_5372_node;
    wire [63:0] _T_5388_real_node;
    wire [63:0] _T_5388_imaginary_node;
    wire [63:0] _BBFAdd_68_1__out;
    wire [63:0] _BBFAdd_68_1__in2;
    wire [63:0] _BBFAdd_68_1__in1;
    BBFAdd BBFAdd_68_1 (
        .out(_BBFAdd_68_1__out),
        .in2(_BBFAdd_68_1__in2),
        .in1(_BBFAdd_68_1__in1)
    );
    wire [63:0] _T_5392_node;
    wire [63:0] _BBFAdd_69_1__out;
    wire [63:0] _BBFAdd_69_1__in2;
    wire [63:0] _BBFAdd_69_1__in1;
    BBFAdd BBFAdd_69_1 (
        .out(_BBFAdd_69_1__out),
        .in2(_BBFAdd_69_1__in2),
        .in1(_BBFAdd_69_1__in1)
    );
    wire [63:0] _T_5398_node;
    wire [63:0] _T_5414_real_node;
    wire [63:0] _T_5414_imaginary_node;
    wire [63:0] _T_5418_node;
    wire [63:0] _BBFSubtract_41_1__out;
    wire [63:0] _BBFSubtract_41_1__in2;
    wire [63:0] _BBFSubtract_41_1__in1;
    BBFSubtract BBFSubtract_41_1 (
        .out(_BBFSubtract_41_1__out),
        .in2(_BBFSubtract_41_1__in2),
        .in1(_BBFSubtract_41_1__in1)
    );
    wire [63:0] _T_5425_node;
    wire [63:0] _T_5431_node;
    wire [63:0] _BBFSubtract_42_1__out;
    wire [63:0] _BBFSubtract_42_1__in2;
    wire [63:0] _BBFSubtract_42_1__in1;
    BBFSubtract BBFSubtract_42_1 (
        .out(_BBFSubtract_42_1__out),
        .in2(_BBFSubtract_42_1__in2),
        .in1(_BBFSubtract_42_1__in1)
    );
    wire [63:0] _T_5438_node;
    wire [63:0] _T_5454_real_node;
    wire [63:0] _T_5454_imaginary_node;
    wire [63:0] _BBFAdd_70_1__out;
    wire [63:0] _BBFAdd_70_1__in2;
    wire [63:0] _BBFAdd_70_1__in1;
    BBFAdd BBFAdd_70_1 (
        .out(_BBFAdd_70_1__out),
        .in2(_BBFAdd_70_1__in2),
        .in1(_BBFAdd_70_1__in1)
    );
    wire [63:0] _T_5458_node;
    wire [63:0] _BBFAdd_71_1__out;
    wire [63:0] _BBFAdd_71_1__in2;
    wire [63:0] _BBFAdd_71_1__in1;
    BBFAdd BBFAdd_71_1 (
        .out(_BBFAdd_71_1__out),
        .in2(_BBFAdd_71_1__in2),
        .in1(_BBFAdd_71_1__in1)
    );
    wire [63:0] _T_5464_node;
    wire [63:0] _T_5480_real_node;
    wire [63:0] _T_5480_imaginary_node;
    wire _T_5495_real_node__T_5506_clk;
    wire _T_5495_real_node__T_5506_en;
    wire _T_5495_real_node__T_5506_mask;
    wire _T_5495_real_node__T_5506_addr;
    wire [63:0] _T_5495_real_node__T_5506_data;
    wire [63:0] _T_5495_real_node__T_5514_data;
    wire _T_5495_real_node__T_5514_clk;
    wire _T_5495_real_node__T_5514_en;
    wire _T_5495_real_node__T_5514_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5495_real_node (
        .read_data(_T_5495_real_node__T_5514_data),
        .read_clk(_T_5495_real_node__T_5514_clk),
        .read_en(_T_5495_real_node__T_5514_en),
        .read_addr(_T_5495_real_node__T_5514_addr),
        .write_clk(_T_5495_real_node__T_5506_clk),
        .write_en(_T_5495_real_node__T_5506_en),
        .write_mask(_T_5495_real_node__T_5506_mask),
        .write_addr(_T_5495_real_node__T_5506_addr),
        .write_data(_T_5495_real_node__T_5506_data)
    );
    wire _T_5495_imaginary_node__T_5506_clk;
    wire _T_5495_imaginary_node__T_5506_en;
    wire _T_5495_imaginary_node__T_5506_mask;
    wire _T_5495_imaginary_node__T_5506_addr;
    wire [63:0] _T_5495_imaginary_node__T_5506_data;
    wire [63:0] _T_5495_imaginary_node__T_5514_data;
    wire _T_5495_imaginary_node__T_5514_clk;
    wire _T_5495_imaginary_node__T_5514_en;
    wire _T_5495_imaginary_node__T_5514_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5495_imaginary_node (
        .read_data(_T_5495_imaginary_node__T_5514_data),
        .read_clk(_T_5495_imaginary_node__T_5514_clk),
        .read_en(_T_5495_imaginary_node__T_5514_en),
        .read_addr(_T_5495_imaginary_node__T_5514_addr),
        .write_clk(_T_5495_imaginary_node__T_5506_clk),
        .write_en(_T_5495_imaginary_node__T_5506_en),
        .write_mask(_T_5495_imaginary_node__T_5506_mask),
        .write_addr(_T_5495_imaginary_node__T_5506_addr),
        .write_data(_T_5495_imaginary_node__T_5506_data)
    );
    wire _T_5498;
    BITWISEAND #(.width(1)) bitwiseand_924 (
        .y(_T_5498),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_5495_real_node__T_5506_addr = 1'h0;
    assign _T_5495_real_node__T_5506_en = io_in_valid;
    assign _T_5495_real_node__T_5506_clk = clock;
    assign _T_5495_imaginary_node__T_5506_addr = 1'h0;
    assign _T_5495_imaginary_node__T_5506_en = io_in_valid;
    assign _T_5495_imaginary_node__T_5506_clk = clock;
    assign _T_5495_imaginary_node__T_5506_mask = 1'h1;
    assign _T_5495_real_node__T_5506_mask = 1'h1;
    assign _T_5495_real_node__T_5514_addr = 1'h0;
    assign _T_5495_real_node__T_5514_en = 1'h1;
    assign _T_5495_real_node__T_5514_clk = clock;
    assign _T_5495_imaginary_node__T_5514_addr = 1'h0;
    assign _T_5495_imaginary_node__T_5514_en = 1'h1;
    assign _T_5495_imaginary_node__T_5514_clk = clock;
    wire _T_5529_real_node__T_5540_clk;
    wire _T_5529_real_node__T_5540_en;
    wire _T_5529_real_node__T_5540_mask;
    wire _T_5529_real_node__T_5540_addr;
    wire [63:0] _T_5529_real_node__T_5540_data;
    wire [63:0] _T_5529_real_node__T_5548_data;
    wire _T_5529_real_node__T_5548_clk;
    wire _T_5529_real_node__T_5548_en;
    wire _T_5529_real_node__T_5548_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5529_real_node (
        .read_data(_T_5529_real_node__T_5548_data),
        .read_clk(_T_5529_real_node__T_5548_clk),
        .read_en(_T_5529_real_node__T_5548_en),
        .read_addr(_T_5529_real_node__T_5548_addr),
        .write_clk(_T_5529_real_node__T_5540_clk),
        .write_en(_T_5529_real_node__T_5540_en),
        .write_mask(_T_5529_real_node__T_5540_mask),
        .write_addr(_T_5529_real_node__T_5540_addr),
        .write_data(_T_5529_real_node__T_5540_data)
    );
    wire _T_5529_imaginary_node__T_5540_clk;
    wire _T_5529_imaginary_node__T_5540_en;
    wire _T_5529_imaginary_node__T_5540_mask;
    wire _T_5529_imaginary_node__T_5540_addr;
    wire [63:0] _T_5529_imaginary_node__T_5540_data;
    wire [63:0] _T_5529_imaginary_node__T_5548_data;
    wire _T_5529_imaginary_node__T_5548_clk;
    wire _T_5529_imaginary_node__T_5548_en;
    wire _T_5529_imaginary_node__T_5548_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_5529_imaginary_node (
        .read_data(_T_5529_imaginary_node__T_5548_data),
        .read_clk(_T_5529_imaginary_node__T_5548_clk),
        .read_en(_T_5529_imaginary_node__T_5548_en),
        .read_addr(_T_5529_imaginary_node__T_5548_addr),
        .write_clk(_T_5529_imaginary_node__T_5540_clk),
        .write_en(_T_5529_imaginary_node__T_5540_en),
        .write_mask(_T_5529_imaginary_node__T_5540_mask),
        .write_addr(_T_5529_imaginary_node__T_5540_addr),
        .write_data(_T_5529_imaginary_node__T_5540_data)
    );
    wire _T_5532;
    BITWISEAND #(.width(1)) bitwiseand_925 (
        .y(_T_5532),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_5529_real_node__T_5540_addr = 1'h0;
    assign _T_5529_real_node__T_5540_en = io_in_valid;
    assign _T_5529_real_node__T_5540_clk = clock;
    assign _T_5529_imaginary_node__T_5540_addr = 1'h0;
    assign _T_5529_imaginary_node__T_5540_en = io_in_valid;
    assign _T_5529_imaginary_node__T_5540_clk = clock;
    assign _T_5529_imaginary_node__T_5540_mask = 1'h1;
    assign _T_5529_real_node__T_5540_mask = 1'h1;
    assign _T_5529_real_node__T_5548_addr = 1'h0;
    assign _T_5529_real_node__T_5548_en = 1'h1;
    assign _T_5529_real_node__T_5548_clk = clock;
    assign _T_5529_imaginary_node__T_5548_addr = 1'h0;
    assign _T_5529_imaginary_node__T_5548_en = 1'h1;
    assign _T_5529_imaginary_node__T_5548_clk = clock;
    assign _BBFAdd_10_1__in1 = stage_outputs_0_1_real_node;
    assign _BBFAdd_10_1__in2 = _T_2940_real_node;
    assign _BBFAdd_11_1__in1 = stage_outputs_0_1_imaginary_node;
    assign _BBFAdd_11_1__in2 = _T_2940_imaginary_node;
    assign _BBFAdd_12_1__in1 = _T_3038_node;
    assign _BBFAdd_12_1__in2 = _T_3057_node;
    assign _BBFAdd_13_1__in1 = _T_3069_node;
    assign _BBFAdd_13_1__in2 = _T_3075_node;
    assign _BBFAdd_14_1__in1 = stage_outputs_0_2_real_node;
    assign _BBFAdd_14_1__in2 = _T_3097_real_node;
    assign _BBFAdd_15_1__in1 = stage_outputs_0_2_imaginary_node;
    assign _BBFAdd_15_1__in2 = _T_3097_imaginary_node;
    assign _BBFAdd_16_1__in1 = stage_outputs_0_2_real_node;
    assign _BBFAdd_16_1__in2 = _T_3163_real_node;
    assign _BBFAdd_17_1__in1 = stage_outputs_0_2_imaginary_node;
    assign _BBFAdd_17_1__in2 = _T_3163_imaginary_node;
    assign _BBFAdd_18_1__in1 = _T_3261_node;
    assign _BBFAdd_18_1__in2 = _T_3280_node;
    assign _BBFAdd_19_1__in1 = _T_3292_node;
    assign _BBFAdd_19_1__in2 = _T_3298_node;
    assign _BBFAdd_1_1__in1 = _T_2623_node;
    assign _BBFAdd_1_1__in2 = _T_2629_node;
    assign _BBFAdd_20_1__in1 = stage_outputs_0_3_real_node;
    assign _BBFAdd_20_1__in2 = _T_3320_real_node;
    assign _BBFAdd_21_1__in1 = stage_outputs_0_3_imaginary_node;
    assign _BBFAdd_21_1__in2 = _T_3320_imaginary_node;
    assign _BBFAdd_22_1__in1 = stage_outputs_0_3_real_node;
    assign _BBFAdd_22_1__in2 = _T_3386_real_node;
    assign _BBFAdd_23_1__in1 = stage_outputs_0_3_imaginary_node;
    assign _BBFAdd_23_1__in2 = _T_3386_imaginary_node;
    assign _BBFAdd_24_1__in1 = _T_3518_node;
    assign _BBFAdd_24_1__in2 = _T_3537_node;
    assign _BBFAdd_25_1__in1 = _T_3549_node;
    assign _BBFAdd_25_1__in2 = _T_3555_node;
    assign _BBFAdd_26_1__in1 = stage_outputs_1_0_real_node;
    assign _BBFAdd_26_1__in2 = _T_3577_real_node;
    assign _BBFAdd_27_1__in1 = stage_outputs_1_0_imaginary_node;
    assign _BBFAdd_27_1__in2 = _T_3577_imaginary_node;
    assign _BBFAdd_28_1__in1 = stage_outputs_1_0_real_node;
    assign _BBFAdd_28_1__in2 = _T_3643_real_node;
    assign _BBFAdd_29_1__in1 = stage_outputs_1_0_imaginary_node;
    assign _BBFAdd_29_1__in2 = _T_3643_imaginary_node;
    assign _BBFAdd_2_1__in1 = stage_outputs_0_0_real_node;
    assign _BBFAdd_2_1__in2 = _T_2651_real_node;
    assign _BBFAdd_30_1__in1 = _T_3775_node;
    assign _BBFAdd_30_1__in2 = _T_3794_node;
    assign _BBFAdd_31_1__in1 = _T_3806_node;
    assign _BBFAdd_31_1__in2 = _T_3812_node;
    assign _BBFAdd_32_1__in1 = stage_outputs_1_1_real_node;
    assign _BBFAdd_32_1__in2 = _T_3834_real_node;
    assign _BBFAdd_33_1__in1 = stage_outputs_1_1_imaginary_node;
    assign _BBFAdd_33_1__in2 = _T_3834_imaginary_node;
    assign _BBFAdd_34_1__in1 = stage_outputs_1_1_real_node;
    assign _BBFAdd_34_1__in2 = _T_3900_real_node;
    assign _BBFAdd_35_1__in1 = stage_outputs_1_1_imaginary_node;
    assign _BBFAdd_35_1__in2 = _T_3900_imaginary_node;
    assign _BBFAdd_36_1__in1 = _T_4032_node;
    assign _BBFAdd_36_1__in2 = _T_4051_node;
    assign _BBFAdd_37_1__in1 = _T_4063_node;
    assign _BBFAdd_37_1__in2 = _T_4069_node;
    assign _BBFAdd_38_1__in1 = stage_outputs_1_4_real_node;
    assign _BBFAdd_38_1__in2 = _T_4091_real_node;
    assign _BBFAdd_39_1__in1 = stage_outputs_1_4_imaginary_node;
    assign _BBFAdd_39_1__in2 = _T_4091_imaginary_node;
    assign _BBFAdd_3_1__in1 = stage_outputs_0_0_imaginary_node;
    assign _BBFAdd_3_1__in2 = _T_2651_imaginary_node;
    assign _BBFAdd_40_1__in1 = stage_outputs_1_4_real_node;
    assign _BBFAdd_40_1__in2 = _T_4157_real_node;
    assign _BBFAdd_41_1__in1 = stage_outputs_1_4_imaginary_node;
    assign _BBFAdd_41_1__in2 = _T_4157_imaginary_node;
    assign _BBFAdd_42_1__in1 = _T_4289_node;
    assign _BBFAdd_42_1__in2 = _T_4308_node;
    assign _BBFAdd_43_1__in1 = _T_4320_node;
    assign _BBFAdd_43_1__in2 = _T_4326_node;
    assign _BBFAdd_44_1__in1 = stage_outputs_1_5_real_node;
    assign _BBFAdd_44_1__in2 = _T_4348_real_node;
    assign _BBFAdd_45_1__in1 = stage_outputs_1_5_imaginary_node;
    assign _BBFAdd_45_1__in2 = _T_4348_imaginary_node;
    assign _BBFAdd_46_1__in1 = stage_outputs_1_5_real_node;
    assign _BBFAdd_46_1__in2 = _T_4414_real_node;
    assign _BBFAdd_47_1__in1 = stage_outputs_1_5_imaginary_node;
    assign _BBFAdd_47_1__in2 = _T_4414_imaginary_node;
    assign _BBFAdd_48_1__in1 = _T_4549_node;
    assign _BBFAdd_48_1__in2 = _T_4568_node;
    assign _BBFAdd_49_1__in1 = _T_4580_node;
    assign _BBFAdd_49_1__in2 = _T_4586_node;
    assign _BBFAdd_4_1__in1 = stage_outputs_0_0_real_node;
    assign _BBFAdd_4_1__in2 = _T_2717_real_node;
    assign _BBFAdd_50_1__in1 = stage_outputs_2_0_real_node;
    assign _BBFAdd_50_1__in2 = _T_4608_real_node;
    assign _BBFAdd_51_1__in1 = stage_outputs_2_0_imaginary_node;
    assign _BBFAdd_51_1__in2 = _T_4608_imaginary_node;
    assign _BBFAdd_52_1__in1 = stage_outputs_2_0_real_node;
    assign _BBFAdd_52_1__in2 = _T_4674_real_node;
    assign _BBFAdd_53_1__in1 = stage_outputs_2_0_imaginary_node;
    assign _BBFAdd_53_1__in2 = _T_4674_imaginary_node;
    assign _BBFAdd_54_1__in1 = _T_4809_node;
    assign _BBFAdd_54_1__in2 = _T_4828_node;
    assign _BBFAdd_55_1__in1 = _T_4840_node;
    assign _BBFAdd_55_1__in2 = _T_4846_node;
    assign _BBFAdd_56_1__in1 = stage_outputs_2_2_real_node;
    assign _BBFAdd_56_1__in2 = _T_4868_real_node;
    assign _BBFAdd_57_1__in1 = stage_outputs_2_2_imaginary_node;
    assign _BBFAdd_57_1__in2 = _T_4868_imaginary_node;
    assign _BBFAdd_58_1__in1 = stage_outputs_2_2_real_node;
    assign _BBFAdd_58_1__in2 = _T_4934_real_node;
    assign _BBFAdd_59_1__in1 = stage_outputs_2_2_imaginary_node;
    assign _BBFAdd_59_1__in2 = _T_4934_imaginary_node;
    assign _BBFAdd_5_1__in1 = stage_outputs_0_0_imaginary_node;
    assign _BBFAdd_5_1__in2 = _T_2717_imaginary_node;
    assign _BBFAdd_60_1__in1 = _T_5069_node;
    assign _BBFAdd_60_1__in2 = _T_5088_node;
    assign _BBFAdd_61_1__in1 = _T_5100_node;
    assign _BBFAdd_61_1__in2 = _T_5106_node;
    assign _BBFAdd_62_1__in1 = stage_outputs_2_4_real_node;
    assign _BBFAdd_62_1__in2 = _T_5128_real_node;
    assign _BBFAdd_63_1__in1 = stage_outputs_2_4_imaginary_node;
    assign _BBFAdd_63_1__in2 = _T_5128_imaginary_node;
    assign _BBFAdd_64_1__in1 = stage_outputs_2_4_real_node;
    assign _BBFAdd_64_1__in2 = _T_5194_real_node;
    assign _BBFAdd_65_1__in1 = stage_outputs_2_4_imaginary_node;
    assign _BBFAdd_65_1__in2 = _T_5194_imaginary_node;
    assign _BBFAdd_66_1__in1 = _T_5329_node;
    assign _BBFAdd_66_1__in2 = _T_5348_node;
    assign _BBFAdd_67_1__in1 = _T_5360_node;
    assign _BBFAdd_67_1__in2 = _T_5366_node;
    assign _BBFAdd_68_1__in1 = stage_outputs_2_6_real_node;
    assign _BBFAdd_68_1__in2 = _T_5388_real_node;
    assign _BBFAdd_69_1__in1 = stage_outputs_2_6_imaginary_node;
    assign _BBFAdd_69_1__in2 = _T_5388_imaginary_node;
    assign _BBFAdd_6_1__in1 = _T_2815_node;
    assign _BBFAdd_6_1__in2 = _T_2834_node;
    assign _BBFAdd_70_1__in1 = stage_outputs_2_6_real_node;
    assign _BBFAdd_70_1__in2 = _T_5454_real_node;
    assign _BBFAdd_71_1__in1 = stage_outputs_2_6_imaginary_node;
    assign _BBFAdd_71_1__in2 = _T_5454_imaginary_node;
    assign _BBFAdd_72__in1 = _T_2592_node;
    assign _BBFAdd_72__in2 = _T_2611_node;
    assign _BBFAdd_7_1__in1 = _T_2846_node;
    assign _BBFAdd_7_1__in2 = _T_2852_node;
    assign _BBFAdd_8_1__in1 = stage_outputs_0_1_real_node;
    assign _BBFAdd_8_1__in2 = _T_2874_real_node;
    assign _BBFAdd_9_1__in1 = stage_outputs_0_1_imaginary_node;
    assign _BBFAdd_9_1__in2 = _T_2874_imaginary_node;
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
    assign _BBFMultiply_16_1__in2 = _T_3495_real_node__T_3514_data;
    assign _BBFMultiply_17_1__in1 = stage_outputs_1_2_imaginary_node;
    assign _BBFMultiply_17_1__in2 = _T_3495_imaginary_node__T_3514_data;
    assign _BBFMultiply_18_1__in1 = stage_outputs_1_2_real_node;
    assign _BBFMultiply_18_1__in2 = _T_3495_imaginary_node__T_3514_data;
    assign _BBFMultiply_19_1__in1 = stage_outputs_1_2_imaginary_node;
    assign _BBFMultiply_19_1__in2 = _T_3495_real_node__T_3514_data;
    assign _BBFMultiply_1_1__in1 = stage_outputs_0_4_imaginary_node;
    assign _BBFMultiply_1_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_20_1__in1 = stage_outputs_1_3_real_node;
    assign _BBFMultiply_20_1__in2 = _T_3752_real_node__T_3771_data;
    assign _BBFMultiply_21_1__in1 = stage_outputs_1_3_imaginary_node;
    assign _BBFMultiply_21_1__in2 = _T_3752_imaginary_node__T_3771_data;
    assign _BBFMultiply_22_1__in1 = stage_outputs_1_3_real_node;
    assign _BBFMultiply_22_1__in2 = _T_3752_imaginary_node__T_3771_data;
    assign _BBFMultiply_23_1__in1 = stage_outputs_1_3_imaginary_node;
    assign _BBFMultiply_23_1__in2 = _T_3752_real_node__T_3771_data;
    assign _BBFMultiply_24_1__in1 = stage_outputs_1_6_real_node;
    assign _BBFMultiply_24_1__in2 = _T_4009_real_node__T_4028_data;
    assign _BBFMultiply_25_1__in1 = stage_outputs_1_6_imaginary_node;
    assign _BBFMultiply_25_1__in2 = _T_4009_imaginary_node__T_4028_data;
    assign _BBFMultiply_26_1__in1 = stage_outputs_1_6_real_node;
    assign _BBFMultiply_26_1__in2 = _T_4009_imaginary_node__T_4028_data;
    assign _BBFMultiply_27_1__in1 = stage_outputs_1_6_imaginary_node;
    assign _BBFMultiply_27_1__in2 = _T_4009_real_node__T_4028_data;
    assign _BBFMultiply_28_1__in1 = stage_outputs_1_7_real_node;
    assign _BBFMultiply_28_1__in2 = _T_4266_real_node__T_4285_data;
    assign _BBFMultiply_29_1__in1 = stage_outputs_1_7_imaginary_node;
    assign _BBFMultiply_29_1__in2 = _T_4266_imaginary_node__T_4285_data;
    assign _BBFMultiply_2_1__in1 = stage_outputs_0_4_real_node;
    assign _BBFMultiply_2_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_30_1__in1 = stage_outputs_1_7_real_node;
    assign _BBFMultiply_30_1__in2 = _T_4266_imaginary_node__T_4285_data;
    assign _BBFMultiply_31_1__in1 = stage_outputs_1_7_imaginary_node;
    assign _BBFMultiply_31_1__in2 = _T_4266_real_node__T_4285_data;
    assign _BBFMultiply_32_1__in1 = stage_outputs_2_1_real_node;
    assign _BBFMultiply_32_1__in2 = _T_4523_real_node__T_4545_data;
    assign _BBFMultiply_33_1__in1 = stage_outputs_2_1_imaginary_node;
    assign _BBFMultiply_33_1__in2 = _T_4523_imaginary_node__T_4545_data;
    assign _BBFMultiply_34_1__in1 = stage_outputs_2_1_real_node;
    assign _BBFMultiply_34_1__in2 = _T_4523_imaginary_node__T_4545_data;
    assign _BBFMultiply_35_1__in1 = stage_outputs_2_1_imaginary_node;
    assign _BBFMultiply_35_1__in2 = _T_4523_real_node__T_4545_data;
    assign _BBFMultiply_36_1__in1 = stage_outputs_2_3_real_node;
    assign _BBFMultiply_36_1__in2 = _T_4783_real_node__T_4805_data;
    assign _BBFMultiply_37_1__in1 = stage_outputs_2_3_imaginary_node;
    assign _BBFMultiply_37_1__in2 = _T_4783_imaginary_node__T_4805_data;
    assign _BBFMultiply_38_1__in1 = stage_outputs_2_3_real_node;
    assign _BBFMultiply_38_1__in2 = _T_4783_imaginary_node__T_4805_data;
    assign _BBFMultiply_39_1__in1 = stage_outputs_2_3_imaginary_node;
    assign _BBFMultiply_39_1__in2 = _T_4783_real_node__T_4805_data;
    assign _BBFMultiply_3_1__in1 = stage_outputs_0_4_imaginary_node;
    assign _BBFMultiply_3_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_40_1__in1 = stage_outputs_2_5_real_node;
    assign _BBFMultiply_40_1__in2 = _T_5043_real_node__T_5065_data;
    assign _BBFMultiply_41_1__in1 = stage_outputs_2_5_imaginary_node;
    assign _BBFMultiply_41_1__in2 = _T_5043_imaginary_node__T_5065_data;
    assign _BBFMultiply_42_1__in1 = stage_outputs_2_5_real_node;
    assign _BBFMultiply_42_1__in2 = _T_5043_imaginary_node__T_5065_data;
    assign _BBFMultiply_43_1__in1 = stage_outputs_2_5_imaginary_node;
    assign _BBFMultiply_43_1__in2 = _T_5043_real_node__T_5065_data;
    assign _BBFMultiply_44_1__in1 = stage_outputs_2_7_real_node;
    assign _BBFMultiply_44_1__in2 = _T_5303_real_node__T_5325_data;
    assign _BBFMultiply_45_1__in1 = stage_outputs_2_7_imaginary_node;
    assign _BBFMultiply_45_1__in2 = _T_5303_imaginary_node__T_5325_data;
    assign _BBFMultiply_46_1__in1 = stage_outputs_2_7_real_node;
    assign _BBFMultiply_46_1__in2 = _T_5303_imaginary_node__T_5325_data;
    assign _BBFMultiply_47_1__in1 = stage_outputs_2_7_imaginary_node;
    assign _BBFMultiply_47_1__in2 = _T_5303_real_node__T_5325_data;
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
    assign _BBFSubtract_10_1__in1 = _T_2827_node;
    assign _BBFSubtract_10_1__in2 = _T_2821_node;
    assign _BBFSubtract_11_1__in1 = _T_2904_node;
    assign _BBFSubtract_11_1__in2 = _T_2874_real_node;
    assign _BBFSubtract_12_1__in1 = _T_2917_node;
    assign _BBFSubtract_12_1__in2 = _T_2874_imaginary_node;
    assign _BBFSubtract_13_1__in1 = _T_3050_node;
    assign _BBFSubtract_13_1__in2 = _T_3044_node;
    assign _BBFSubtract_14_1__in1 = _T_3127_node;
    assign _BBFSubtract_14_1__in2 = _T_3097_real_node;
    assign _BBFSubtract_15_1__in1 = _T_3140_node;
    assign _BBFSubtract_15_1__in2 = _T_3097_imaginary_node;
    assign _BBFSubtract_16_1__in1 = _T_3273_node;
    assign _BBFSubtract_16_1__in2 = _T_3267_node;
    assign _BBFSubtract_17_1__in1 = _T_3350_node;
    assign _BBFSubtract_17_1__in2 = _T_3320_real_node;
    assign _BBFSubtract_18_1__in1 = _T_3363_node;
    assign _BBFSubtract_18_1__in2 = _T_3320_imaginary_node;
    assign _BBFSubtract_19_1__in1 = _T_3530_node;
    assign _BBFSubtract_19_1__in2 = _T_3524_node;
    assign _BBFSubtract_1_1__in1 = _T_1378_node;
    assign _BBFSubtract_1_1__in2 = _node_181;
    assign _BBFSubtract_20_1__in1 = _T_3607_node;
    assign _BBFSubtract_20_1__in2 = _T_3577_real_node;
    assign _BBFSubtract_21_1__in1 = _T_3620_node;
    assign _BBFSubtract_21_1__in2 = _T_3577_imaginary_node;
    assign _BBFSubtract_22_1__in1 = _T_3787_node;
    assign _BBFSubtract_22_1__in2 = _T_3781_node;
    assign _BBFSubtract_23_1__in1 = _T_3864_node;
    assign _BBFSubtract_23_1__in2 = _T_3834_real_node;
    assign _BBFSubtract_24_1__in1 = _T_3877_node;
    assign _BBFSubtract_24_1__in2 = _T_3834_imaginary_node;
    assign _BBFSubtract_25_1__in1 = _T_4044_node;
    assign _BBFSubtract_25_1__in2 = _T_4038_node;
    assign _BBFSubtract_26_1__in1 = _T_4121_node;
    assign _BBFSubtract_26_1__in2 = _T_4091_real_node;
    assign _BBFSubtract_27_1__in1 = _T_4134_node;
    assign _BBFSubtract_27_1__in2 = _T_4091_imaginary_node;
    assign _BBFSubtract_28_1__in1 = _T_4301_node;
    assign _BBFSubtract_28_1__in2 = _T_4295_node;
    assign _BBFSubtract_29_1__in1 = _T_4378_node;
    assign _BBFSubtract_29_1__in2 = _T_4348_real_node;
    assign _BBFSubtract_2_1__in1 = _T_1439_node;
    assign _BBFSubtract_2_1__in2 = _node_297;
    assign _BBFSubtract_30_1__in1 = _T_4391_node;
    assign _BBFSubtract_30_1__in2 = _T_4348_imaginary_node;
    assign _BBFSubtract_31_1__in1 = _T_4561_node;
    assign _BBFSubtract_31_1__in2 = _T_4555_node;
    assign _BBFSubtract_32_1__in1 = _T_4638_node;
    assign _BBFSubtract_32_1__in2 = _T_4608_real_node;
    assign _BBFSubtract_33_1__in1 = _T_4651_node;
    assign _BBFSubtract_33_1__in2 = _T_4608_imaginary_node;
    assign _BBFSubtract_34_1__in1 = _T_4821_node;
    assign _BBFSubtract_34_1__in2 = _T_4815_node;
    assign _BBFSubtract_35_1__in1 = _T_4898_node;
    assign _BBFSubtract_35_1__in2 = _T_4868_real_node;
    assign _BBFSubtract_36_1__in1 = _T_4911_node;
    assign _BBFSubtract_36_1__in2 = _T_4868_imaginary_node;
    assign _BBFSubtract_37_1__in1 = _T_5081_node;
    assign _BBFSubtract_37_1__in2 = _T_5075_node;
    assign _BBFSubtract_38_1__in1 = _T_5158_node;
    assign _BBFSubtract_38_1__in2 = _T_5128_real_node;
    assign _BBFSubtract_39_1__in1 = _T_5171_node;
    assign _BBFSubtract_39_1__in2 = _T_5128_imaginary_node;
    assign _BBFSubtract_3_1__in1 = _T_1500_node;
    assign _BBFSubtract_3_1__in2 = _node_413;
    assign _BBFSubtract_40_1__in1 = _T_5341_node;
    assign _BBFSubtract_40_1__in2 = _T_5335_node;
    assign _BBFSubtract_41_1__in1 = _T_5418_node;
    assign _BBFSubtract_41_1__in2 = _T_5388_real_node;
    assign _BBFSubtract_42_1__in1 = _T_5431_node;
    assign _BBFSubtract_42_1__in2 = _T_5388_imaginary_node;
    assign _BBFSubtract_43__in1 = _T_1317_node;
    assign _BBFSubtract_43__in2 = _node_65;
    assign _BBFSubtract_4_1__in1 = _T_1561_node;
    assign _BBFSubtract_4_1__in2 = _node_529;
    assign _BBFSubtract_5_1__in1 = _T_1622_node;
    assign _BBFSubtract_5_1__in2 = _node_645;
    assign _BBFSubtract_6_1__in1 = _T_1683_node;
    assign _BBFSubtract_6_1__in2 = _node_761;
    assign _BBFSubtract_7_1__in1 = _T_2604_node;
    assign _BBFSubtract_7_1__in2 = _T_2598_node;
    assign _BBFSubtract_8_1__in1 = _T_2681_node;
    assign _BBFSubtract_8_1__in2 = _T_2651_real_node;
    assign _BBFSubtract_9_1__in1 = _T_2694_node;
    assign _BBFSubtract_9_1__in2 = _T_2651_imaginary_node;
    assign _T_1006_node = 64'h0;
    assign _T_1013_node = 64'h0;
    assign _T_1034_node = 64'h0;
    assign _T_1041_node = 64'h0;
    assign _T_1062_node = 64'h0;
    assign _T_1069_node = 64'h0;
    assign _T_12_node = 64'h0;
    assign _T_1317_node = 64'h0;
    assign _T_1324_node = _BBFSubtract_43__out;
    assign _T_1340_imaginary_node = _T_1324_node;
    assign _T_1340_real_node = _node_73;
    assign _T_1378_node = 64'h0;
    assign _T_1385_node = _BBFSubtract_1_1__out;
    assign _T_1401_imaginary_node = _T_1385_node;
    assign _T_1401_real_node = _node_189;
    assign _T_1439_node = 64'h0;
    assign _T_1446_node = _BBFSubtract_2_1__out;
    assign _T_1462_imaginary_node = _T_1446_node;
    assign _T_1462_real_node = _node_305;
    assign _T_1500_node = 64'h0;
    assign _T_1507_node = _BBFSubtract_3_1__out;
    assign _T_1523_imaginary_node = _T_1507_node;
    assign _T_1523_real_node = _node_421;
    assign _T_1561_node = 64'h0;
    assign _T_1568_node = _BBFSubtract_4_1__out;
    assign _T_1584_imaginary_node = _T_1568_node;
    assign _T_1584_real_node = _node_537;
    assign _T_1622_node = 64'h0;
    assign _T_1629_node = _BBFSubtract_5_1__out;
    assign _T_1645_imaginary_node = _T_1629_node;
    assign _T_1645_real_node = _node_653;
    assign _T_1683_node = 64'h0;
    assign _T_1690_node = _BBFSubtract_6_1__out;
    assign _T_1706_imaginary_node = _T_1690_node;
    assign _T_1706_real_node = _node_769;
    assign _T_1728_node = 64'h0;
    assign _T_1735_node = 64'h0;
    assign _T_1755_node = 64'h0;
    assign _T_1762_node = 64'h0;
    assign _T_1782_node = 64'h0;
    assign _T_1789_node = 64'h0;
    assign _T_1809_node = 64'h0;
    assign _T_1816_node = 64'h0;
    assign _T_1836_node = 64'h0;
    assign _T_1843_node = 64'h0;
    assign _T_1863_node = 64'h0;
    assign _T_1870_node = 64'h0;
    assign _T_1890_node = 64'h0;
    assign _T_1897_node = 64'h0;
    assign _T_1917_node = 64'h0;
    assign _T_1924_node = 64'h0;
    assign _T_1944_node = 64'h0;
    assign _T_1951_node = 64'h0;
    assign _T_1971_node = 64'h0;
    assign _T_1978_node = 64'h0;
    assign _T_1998_node = 64'h0;
    assign _T_2005_node = 64'h0;
    assign _T_2025_node = 64'h0;
    assign _T_2032_node = 64'h0;
    assign _T_2052_node = 64'h0;
    assign _T_2059_node = 64'h0;
    assign _T_2079_node = 64'h0;
    assign _T_2086_node = 64'h0;
    assign _T_2106_node = 64'h0;
    assign _T_2113_node = 64'h0;
    assign _T_2133_node = 64'h0;
    assign _T_2140_node = 64'h0;
    assign _T_2160_node = 64'h0;
    assign _T_2167_node = 64'h0;
    assign _T_2187_node = 64'h0;
    assign _T_2194_node = 64'h0;
    assign _T_2214_node = 64'h0;
    assign _T_2221_node = 64'h0;
    assign _T_2241_node = 64'h0;
    assign _T_2248_node = 64'h0;
    assign _T_2268_node = 64'h0;
    assign _T_2275_node = 64'h0;
    assign _T_2295_node = 64'h0;
    assign _T_2302_node = 64'h0;
    assign _T_2322_node = 64'h0;
    assign _T_2329_node = 64'h0;
    assign _T_2349_node = 64'h0;
    assign _T_2356_node = 64'h0;
    assign _T_2376_node = 64'h0;
    assign _T_2383_node = 64'h0;
    assign _T_2403_node = 64'h0;
    assign _T_2410_node = 64'h0;
    assign _T_2430_node = 64'h0;
    assign _T_2437_node = 64'h0;
    assign _T_2457_node = 64'h0;
    assign _T_2464_node = 64'h0;
    assign _T_2484_node = 64'h0;
    assign _T_2491_node = 64'h0;
    assign _T_2511_node = 64'h0;
    assign _T_2518_node = 64'h0;
    assign _T_2538_node = 64'h0;
    assign _T_2545_node = 64'h0;
    assign _T_2565_node = 64'h0;
    assign _T_2572_node = 64'h0;
    assign _T_2592_node = _BBFMultiply_48__out;
    assign _T_2598_node = _BBFMultiply_1_1__out;
    assign _T_2604_node = 64'h0;
    assign _T_2611_node = _BBFSubtract_7_1__out;
    assign _T_2617_node = _BBFAdd_72__out;
    assign _T_2623_node = _BBFMultiply_2_1__out;
    assign _T_2629_node = _BBFMultiply_3_1__out;
    assign _T_2635_node = _BBFAdd_1_1__out;
    assign _T_2651_imaginary_node = _T_2635_node;
    assign _T_2651_real_node = _T_2617_node;
    assign _T_2655_node = _BBFAdd_2_1__out;
    assign _T_2661_node = _BBFAdd_3_1__out;
    assign _T_2677_imaginary_node = _T_2661_node;
    assign _T_2677_real_node = _T_2655_node;
    assign _T_2681_node = 64'h0;
    assign _T_2688_node = _BBFSubtract_8_1__out;
    assign _T_2694_node = 64'h0;
    assign _T_2701_node = _BBFSubtract_9_1__out;
    assign _T_2717_imaginary_node = _T_2701_node;
    assign _T_2717_real_node = _T_2688_node;
    assign _T_2721_node = _BBFAdd_4_1__out;
    assign _T_2727_node = _BBFAdd_5_1__out;
    assign _T_2743_imaginary_node = _T_2727_node;
    assign _T_2743_real_node = _T_2721_node;
    assign _T_2758_imaginary_node__T_2769_data = _T_2677_imaginary_node;
    assign _T_2758_real_node__T_2769_data = _T_2677_real_node;
    assign _T_2792_imaginary_node__T_2803_data = _T_2743_imaginary_node;
    assign _T_2792_real_node__T_2803_data = _T_2743_real_node;
    assign _T_2815_node = _BBFMultiply_4_1__out;
    assign _T_2821_node = _BBFMultiply_5_1__out;
    assign _T_2827_node = 64'h0;
    assign _T_2834_node = _BBFSubtract_10_1__out;
    assign _T_2840_node = _BBFAdd_6_1__out;
    assign _T_2846_node = _BBFMultiply_6_1__out;
    assign _T_2852_node = _BBFMultiply_7_1__out;
    assign _T_2858_node = _BBFAdd_7_1__out;
    assign _T_2874_imaginary_node = _T_2858_node;
    assign _T_2874_real_node = _T_2840_node;
    assign _T_2878_node = _BBFAdd_8_1__out;
    assign _T_2884_node = _BBFAdd_9_1__out;
    assign _T_2900_imaginary_node = _T_2884_node;
    assign _T_2900_real_node = _T_2878_node;
    assign _T_2904_node = 64'h0;
    assign _T_2911_node = _BBFSubtract_11_1__out;
    assign _T_2917_node = 64'h0;
    assign _T_2924_node = _BBFSubtract_12_1__out;
    assign _T_2940_imaginary_node = _T_2924_node;
    assign _T_2940_real_node = _T_2911_node;
    assign _T_2944_node = _BBFAdd_10_1__out;
    assign _T_2950_node = _BBFAdd_11_1__out;
    assign _T_2966_imaginary_node = _T_2950_node;
    assign _T_2966_real_node = _T_2944_node;
    assign _T_2981_imaginary_node__T_2992_data = _T_2900_imaginary_node;
    assign _T_2981_real_node__T_2992_data = _T_2900_real_node;
    assign _T_3015_imaginary_node__T_3026_data = _T_2966_imaginary_node;
    assign _T_3015_real_node__T_3026_data = _T_2966_real_node;
    assign _T_3038_node = _BBFMultiply_8_1__out;
    assign _T_3044_node = _BBFMultiply_9_1__out;
    assign _T_3050_node = 64'h0;
    assign _T_3057_node = _BBFSubtract_13_1__out;
    assign _T_3063_node = _BBFAdd_12_1__out;
    assign _T_3069_node = _BBFMultiply_10_1__out;
    assign _T_3075_node = _BBFMultiply_11_1__out;
    assign _T_3081_node = _BBFAdd_13_1__out;
    assign _T_3097_imaginary_node = _T_3081_node;
    assign _T_3097_real_node = _T_3063_node;
    assign _T_3101_node = _BBFAdd_14_1__out;
    assign _T_3107_node = _BBFAdd_15_1__out;
    assign _T_3123_imaginary_node = _T_3107_node;
    assign _T_3123_real_node = _T_3101_node;
    assign _T_3127_node = 64'h0;
    assign _T_3134_node = _BBFSubtract_14_1__out;
    assign _T_3140_node = 64'h0;
    assign _T_3147_node = _BBFSubtract_15_1__out;
    assign _T_316_node = 64'h0;
    assign _T_3163_imaginary_node = _T_3147_node;
    assign _T_3163_real_node = _T_3134_node;
    assign _T_3167_node = _BBFAdd_16_1__out;
    assign _T_3173_node = _BBFAdd_17_1__out;
    assign _T_3189_imaginary_node = _T_3173_node;
    assign _T_3189_real_node = _T_3167_node;
    assign _T_3204_imaginary_node__T_3215_data = _T_3123_imaginary_node;
    assign _T_3204_real_node__T_3215_data = _T_3123_real_node;
    assign _T_323_node = 64'h0;
    assign _T_3238_imaginary_node__T_3249_data = _T_3189_imaginary_node;
    assign _T_3238_real_node__T_3249_data = _T_3189_real_node;
    assign _T_3261_node = _BBFMultiply_12_1__out;
    assign _T_3267_node = _BBFMultiply_13_1__out;
    assign _T_3273_node = 64'h0;
    assign _T_3280_node = _BBFSubtract_16_1__out;
    assign _T_3286_node = _BBFAdd_18_1__out;
    assign _T_3292_node = _BBFMultiply_14_1__out;
    assign _T_3298_node = _BBFMultiply_15_1__out;
    assign _T_3304_node = _BBFAdd_19_1__out;
    assign _T_3320_imaginary_node = _T_3304_node;
    assign _T_3320_real_node = _T_3286_node;
    assign _T_3324_node = _BBFAdd_20_1__out;
    assign _T_3330_node = _BBFAdd_21_1__out;
    assign _T_3346_imaginary_node = _T_3330_node;
    assign _T_3346_real_node = _T_3324_node;
    assign _T_3350_node = 64'h0;
    assign _T_3357_node = _BBFSubtract_17_1__out;
    assign _T_3363_node = 64'h0;
    assign _T_3370_node = _BBFSubtract_18_1__out;
    assign _T_3386_imaginary_node = _T_3370_node;
    assign _T_3386_real_node = _T_3357_node;
    assign _T_3390_node = _BBFAdd_22_1__out;
    assign _T_3396_node = _BBFAdd_23_1__out;
    assign _T_3412_imaginary_node = _T_3396_node;
    assign _T_3412_real_node = _T_3390_node;
    assign _T_3427_imaginary_node__T_3438_data = _T_3346_imaginary_node;
    assign _T_3427_real_node__T_3438_data = _T_3346_real_node;
    assign _T_3461_imaginary_node__T_3472_data = _T_3412_imaginary_node;
    assign _T_3461_real_node__T_3472_data = _T_3412_real_node;
    assign _T_3495_imaginary_node__T_3506_data = twiddle_1_imaginary_node;
    assign _T_3495_real_node__T_3506_data = twiddle_1_real_node;
    assign _T_3518_node = _BBFMultiply_16_1__out;
    assign _T_3524_node = _BBFMultiply_17_1__out;
    assign _T_3530_node = 64'h0;
    assign _T_3537_node = _BBFSubtract_19_1__out;
    assign _T_3543_node = _BBFAdd_24_1__out;
    assign _T_3549_node = _BBFMultiply_18_1__out;
    assign _T_3555_node = _BBFMultiply_19_1__out;
    assign _T_3561_node = _BBFAdd_25_1__out;
    assign _T_3577_imaginary_node = _T_3561_node;
    assign _T_3577_real_node = _T_3543_node;
    assign _T_3581_node = _BBFAdd_26_1__out;
    assign _T_3587_node = _BBFAdd_27_1__out;
    assign _T_3603_imaginary_node = _T_3587_node;
    assign _T_3603_real_node = _T_3581_node;
    assign _T_3607_node = 64'h0;
    assign _T_3614_node = _BBFSubtract_20_1__out;
    assign _T_3620_node = 64'h0;
    assign _T_3627_node = _BBFSubtract_21_1__out;
    assign _T_3643_imaginary_node = _T_3627_node;
    assign _T_3643_real_node = _T_3614_node;
    assign _T_3647_node = _BBFAdd_28_1__out;
    assign _T_3653_node = _BBFAdd_29_1__out;
    assign _T_3669_imaginary_node = _T_3653_node;
    assign _T_3669_real_node = _T_3647_node;
    assign _T_3684_imaginary_node__T_3695_data = _T_3603_imaginary_node;
    assign _T_3684_real_node__T_3695_data = _T_3603_real_node;
    assign _T_3718_imaginary_node__T_3729_data = _T_3669_imaginary_node;
    assign _T_3718_real_node__T_3729_data = _T_3669_real_node;
    assign _T_3752_imaginary_node__T_3763_data = twiddle_1_imaginary_node;
    assign _T_3752_real_node__T_3763_data = twiddle_1_real_node;
    assign _T_3775_node = _BBFMultiply_20_1__out;
    assign _T_3781_node = _BBFMultiply_21_1__out;
    assign _T_3787_node = 64'h0;
    assign _T_3794_node = _BBFSubtract_22_1__out;
    assign _T_3800_node = _BBFAdd_30_1__out;
    assign _T_3806_node = _BBFMultiply_22_1__out;
    assign _T_3812_node = _BBFMultiply_23_1__out;
    assign _T_3818_node = _BBFAdd_31_1__out;
    assign _T_3834_imaginary_node = _T_3818_node;
    assign _T_3834_real_node = _T_3800_node;
    assign _T_3838_node = _BBFAdd_32_1__out;
    assign _T_3844_node = _BBFAdd_33_1__out;
    assign _T_3860_imaginary_node = _T_3844_node;
    assign _T_3860_real_node = _T_3838_node;
    assign _T_3864_node = 64'h0;
    assign _T_3871_node = _BBFSubtract_23_1__out;
    assign _T_3877_node = 64'h0;
    assign _T_3884_node = _BBFSubtract_24_1__out;
    assign _T_3900_imaginary_node = _T_3884_node;
    assign _T_3900_real_node = _T_3871_node;
    assign _T_3904_node = _BBFAdd_34_1__out;
    assign _T_3910_node = _BBFAdd_35_1__out;
    assign _T_3926_imaginary_node = _T_3910_node;
    assign _T_3926_real_node = _T_3904_node;
    assign _T_3941_imaginary_node__T_3952_data = _T_3860_imaginary_node;
    assign _T_3941_real_node__T_3952_data = _T_3860_real_node;
    assign _T_3975_imaginary_node__T_3986_data = _T_3926_imaginary_node;
    assign _T_3975_real_node__T_3986_data = _T_3926_real_node;
    assign _T_4009_imaginary_node__T_4020_data = twiddle_4_imaginary_node;
    assign _T_4009_real_node__T_4020_data = twiddle_4_real_node;
    assign _T_4032_node = _BBFMultiply_24_1__out;
    assign _T_4038_node = _BBFMultiply_25_1__out;
    assign _T_4044_node = 64'h0;
    assign _T_4051_node = _BBFSubtract_25_1__out;
    assign _T_4057_node = _BBFAdd_36_1__out;
    assign _T_4063_node = _BBFMultiply_26_1__out;
    assign _T_4069_node = _BBFMultiply_27_1__out;
    assign _T_4075_node = _BBFAdd_37_1__out;
    assign _T_4091_imaginary_node = _T_4075_node;
    assign _T_4091_real_node = _T_4057_node;
    assign _T_4095_node = _BBFAdd_38_1__out;
    assign _T_4101_node = _BBFAdd_39_1__out;
    assign _T_4117_imaginary_node = _T_4101_node;
    assign _T_4117_real_node = _T_4095_node;
    assign _T_4121_node = 64'h0;
    assign _T_4128_node = _BBFSubtract_26_1__out;
    assign _T_4134_node = 64'h0;
    assign _T_4141_node = _BBFSubtract_27_1__out;
    assign _T_4157_imaginary_node = _T_4141_node;
    assign _T_4157_real_node = _T_4128_node;
    assign _T_4161_node = _BBFAdd_40_1__out;
    assign _T_4167_node = _BBFAdd_41_1__out;
    assign _T_4183_imaginary_node = _T_4167_node;
    assign _T_4183_real_node = _T_4161_node;
    assign _T_4198_imaginary_node__T_4209_data = _T_4117_imaginary_node;
    assign _T_4198_real_node__T_4209_data = _T_4117_real_node;
    assign _T_4232_imaginary_node__T_4243_data = _T_4183_imaginary_node;
    assign _T_4232_real_node__T_4243_data = _T_4183_real_node;
    assign _T_4266_imaginary_node__T_4277_data = twiddle_4_imaginary_node;
    assign _T_4266_real_node__T_4277_data = twiddle_4_real_node;
    assign _T_4289_node = _BBFMultiply_28_1__out;
    assign _T_4295_node = _BBFMultiply_29_1__out;
    assign _T_4301_node = 64'h0;
    assign _T_4308_node = _BBFSubtract_28_1__out;
    assign _T_4314_node = _BBFAdd_42_1__out;
    assign _T_4320_node = _BBFMultiply_30_1__out;
    assign _T_4326_node = _BBFMultiply_31_1__out;
    assign _T_4332_node = _BBFAdd_43_1__out;
    assign _T_4348_imaginary_node = _T_4332_node;
    assign _T_4348_real_node = _T_4314_node;
    assign _T_4352_node = _BBFAdd_44_1__out;
    assign _T_4358_node = _BBFAdd_45_1__out;
    assign _T_4374_imaginary_node = _T_4358_node;
    assign _T_4374_real_node = _T_4352_node;
    assign _T_4378_node = 64'h0;
    assign _T_4385_node = _BBFSubtract_29_1__out;
    assign _T_4391_node = 64'h0;
    assign _T_4398_node = _BBFSubtract_30_1__out;
    assign _T_4414_imaginary_node = _T_4398_node;
    assign _T_4414_real_node = _T_4385_node;
    assign _T_4418_node = _BBFAdd_46_1__out;
    assign _T_4424_node = _BBFAdd_47_1__out;
    assign _T_4440_imaginary_node = _T_4424_node;
    assign _T_4440_real_node = _T_4418_node;
    assign _T_4455_imaginary_node__T_4466_data = _T_4374_imaginary_node;
    assign _T_4455_real_node__T_4466_data = _T_4374_real_node;
    assign _T_4489_imaginary_node__T_4500_data = _T_4440_imaginary_node;
    assign _T_4489_real_node__T_4500_data = _T_4440_real_node;
    assign _T_4523_imaginary_node__T_4538_data = twiddle_2_imaginary_node;
    assign _T_4523_real_node__T_4538_data = twiddle_2_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_926 (
        .y(_WTEMP_25),
        .sel(io_in_valid),
        .a(_T_4530),
        .b(__T_4525__q)
    );
    assign _T_4549_node = _BBFMultiply_32_1__out;
    assign _T_4555_node = _BBFMultiply_33_1__out;
    assign _T_4561_node = 64'h0;
    assign _T_4568_node = _BBFSubtract_31_1__out;
    assign _T_4574_node = _BBFAdd_48_1__out;
    assign _T_4580_node = _BBFMultiply_34_1__out;
    assign _T_4586_node = _BBFMultiply_35_1__out;
    assign _T_4592_node = _BBFAdd_49_1__out;
    assign _T_4608_imaginary_node = _T_4592_node;
    assign _T_4608_real_node = _T_4574_node;
    assign _T_4612_node = _BBFAdd_50_1__out;
    assign _T_4618_node = _BBFAdd_51_1__out;
    assign _T_4634_imaginary_node = _T_4618_node;
    assign _T_4634_real_node = _T_4612_node;
    assign _T_4638_node = 64'h0;
    assign _T_4645_node = _BBFSubtract_32_1__out;
    assign _T_4651_node = 64'h0;
    assign _T_4658_node = _BBFSubtract_33_1__out;
    assign _T_4674_imaginary_node = _T_4658_node;
    assign _T_4674_real_node = _T_4645_node;
    assign _T_4678_node = _BBFAdd_52_1__out;
    assign _T_4684_node = _BBFAdd_53_1__out;
    assign _T_4700_imaginary_node = _T_4684_node;
    assign _T_4700_real_node = _T_4678_node;
    assign _T_4715_imaginary_node__T_4726_data = _T_4634_imaginary_node;
    assign _T_4715_real_node__T_4726_data = _T_4634_real_node;
    assign _T_4749_imaginary_node__T_4760_data = _T_4700_imaginary_node;
    assign _T_4749_real_node__T_4760_data = _T_4700_real_node;
    assign _T_4783_imaginary_node__T_4798_data = twiddle_3_imaginary_node;
    assign _T_4783_real_node__T_4798_data = twiddle_3_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_927 (
        .y(_WTEMP_26),
        .sel(io_in_valid),
        .a(_T_4790),
        .b(__T_4785__q)
    );
    assign _T_4809_node = _BBFMultiply_36_1__out;
    assign _T_4815_node = _BBFMultiply_37_1__out;
    assign _T_4821_node = 64'h0;
    assign _T_4828_node = _BBFSubtract_34_1__out;
    assign _T_4834_node = _BBFAdd_54_1__out;
    assign _T_4840_node = _BBFMultiply_38_1__out;
    assign _T_4846_node = _BBFMultiply_39_1__out;
    assign _T_4852_node = _BBFAdd_55_1__out;
    assign _T_4868_imaginary_node = _T_4852_node;
    assign _T_4868_real_node = _T_4834_node;
    assign _T_4872_node = _BBFAdd_56_1__out;
    assign _T_4878_node = _BBFAdd_57_1__out;
    assign _T_4894_imaginary_node = _T_4878_node;
    assign _T_4894_real_node = _T_4872_node;
    assign _T_4898_node = 64'h0;
    assign _T_4905_node = _BBFSubtract_35_1__out;
    assign _T_4911_node = 64'h0;
    assign _T_4918_node = _BBFSubtract_36_1__out;
    assign _T_4934_imaginary_node = _T_4918_node;
    assign _T_4934_real_node = _T_4905_node;
    assign _T_4938_node = _BBFAdd_58_1__out;
    assign _T_4944_node = _BBFAdd_59_1__out;
    assign _T_4960_imaginary_node = _T_4944_node;
    assign _T_4960_real_node = _T_4938_node;
    assign _T_4975_imaginary_node__T_4986_data = _T_4894_imaginary_node;
    assign _T_4975_real_node__T_4986_data = _T_4894_real_node;
    assign _T_5_node = 64'h0;
    assign _T_5009_imaginary_node__T_5020_data = _T_4960_imaginary_node;
    assign _T_5009_real_node__T_5020_data = _T_4960_real_node;
    assign _T_5043_imaginary_node__T_5058_data = twiddle_5_imaginary_node;
    assign _T_5043_real_node__T_5058_data = twiddle_5_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_928 (
        .y(_WTEMP_27),
        .sel(io_in_valid),
        .a(_T_5050),
        .b(__T_5045__q)
    );
    assign _T_5069_node = _BBFMultiply_40_1__out;
    assign _T_5075_node = _BBFMultiply_41_1__out;
    assign _T_5081_node = 64'h0;
    assign _T_5088_node = _BBFSubtract_37_1__out;
    assign _T_5094_node = _BBFAdd_60_1__out;
    assign _T_5100_node = _BBFMultiply_42_1__out;
    assign _T_5106_node = _BBFMultiply_43_1__out;
    assign _T_5112_node = _BBFAdd_61_1__out;
    assign _T_5128_imaginary_node = _T_5112_node;
    assign _T_5128_real_node = _T_5094_node;
    assign _T_5132_node = _BBFAdd_62_1__out;
    assign _T_5138_node = _BBFAdd_63_1__out;
    assign _T_5154_imaginary_node = _T_5138_node;
    assign _T_5154_real_node = _T_5132_node;
    assign _T_5158_node = 64'h0;
    assign _T_5165_node = _BBFSubtract_38_1__out;
    assign _T_5171_node = 64'h0;
    assign _T_5178_node = _BBFSubtract_39_1__out;
    assign _T_5194_imaginary_node = _T_5178_node;
    assign _T_5194_real_node = _T_5165_node;
    assign _T_5198_node = _BBFAdd_64_1__out;
    assign _T_5204_node = _BBFAdd_65_1__out;
    assign _T_5220_imaginary_node = _T_5204_node;
    assign _T_5220_real_node = _T_5198_node;
    assign _T_5235_imaginary_node__T_5246_data = _T_5154_imaginary_node;
    assign _T_5235_real_node__T_5246_data = _T_5154_real_node;
    assign _T_5269_imaginary_node__T_5280_data = _T_5220_imaginary_node;
    assign _T_5269_real_node__T_5280_data = _T_5220_real_node;
    assign _T_5303_imaginary_node__T_5318_data = twiddle_6_imaginary_node;
    assign _T_5303_real_node__T_5318_data = twiddle_6_real_node;
    MUX_UNSIGNED #(.width(1)) u_mux_929 (
        .y(_WTEMP_28),
        .sel(io_in_valid),
        .a(_T_5310),
        .b(__T_5305__q)
    );
    assign _T_5329_node = _BBFMultiply_44_1__out;
    assign _T_5335_node = _BBFMultiply_45_1__out;
    assign _T_5341_node = 64'h0;
    assign _T_5348_node = _BBFSubtract_40_1__out;
    assign _T_5354_node = _BBFAdd_66_1__out;
    assign _T_5360_node = _BBFMultiply_46_1__out;
    assign _T_5366_node = _BBFMultiply_47_1__out;
    assign _T_5372_node = _BBFAdd_67_1__out;
    assign _T_5388_imaginary_node = _T_5372_node;
    assign _T_5388_real_node = _T_5354_node;
    assign _T_5392_node = _BBFAdd_68_1__out;
    assign _T_5398_node = _BBFAdd_69_1__out;
    assign _T_5414_imaginary_node = _T_5398_node;
    assign _T_5414_real_node = _T_5392_node;
    assign _T_5418_node = 64'h0;
    assign _T_5425_node = _BBFSubtract_41_1__out;
    assign _T_5431_node = 64'h0;
    assign _T_5438_node = _BBFSubtract_42_1__out;
    assign _T_5454_imaginary_node = _T_5438_node;
    assign _T_5454_real_node = _T_5425_node;
    assign _T_5458_node = _BBFAdd_70_1__out;
    assign _T_5464_node = _BBFAdd_71_1__out;
    assign _T_5480_imaginary_node = _T_5464_node;
    assign _T_5480_real_node = _T_5458_node;
    assign _T_5495_imaginary_node__T_5506_data = _T_5414_imaginary_node;
    assign _T_5495_real_node__T_5506_data = _T_5414_real_node;
    assign _T_5529_imaginary_node__T_5540_data = _T_5480_imaginary_node;
    assign _T_5529_real_node__T_5540_data = _T_5480_real_node;
    assign _T_635__T_645_data = io_in_sync;
    MUX_UNSIGNED #(.width(2)) u_mux_930 (
        .y(_WTEMP_1),
        .sel(io_in_valid),
        .a(_node_1),
        .b(__T_637__q)
    );
    assign _T_650_node = 64'h0;
    assign _T_657_node = 64'h0;
    assign _T_734_node = 64'h3FF0000000000000;
    assign _T_741_node = 64'h8000000000000000;
    assign _T_758_imaginary_node = _T_741_node;
    assign _T_758_real_node = _T_734_node;
    assign _T_762_node = 64'h3FED906BCF328D46;
    assign _T_769_node = 64'hBFD87DE2A6AEA963;
    assign _T_786_imaginary_node = _T_769_node;
    assign _T_786_real_node = _T_762_node;
    assign _T_790_node = 64'h3FE6A09E667F3BCD;
    assign _T_797_node = 64'hBFE6A09E667F3BCC;
    assign _T_814_imaginary_node = _T_797_node;
    assign _T_814_real_node = _T_790_node;
    assign _T_818_node = 64'h3FD87DE2A6AEA964;
    assign _T_825_node = 64'hBFED906BCF328D46;
    assign _T_842_imaginary_node = _T_825_node;
    assign _T_842_real_node = _T_818_node;
    assign _T_894_node = 64'h0;
    assign _T_901_node = 64'h0;
    assign _T_922_node = 64'h0;
    assign _T_929_node = 64'h0;
    assign _T_950_node = 64'h0;
    assign _T_957_node = 64'h0;
    assign _T_978_node = 64'h0;
    assign _T_985_node = 64'h0;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_931 (
        .y(indices_rom_0),
        .in(1'h0)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_932 (
        .y(indices_rom_1),
        .in(1'h0)
    );
    assign indices_rom_10 = 3'h5;
    assign indices_rom_11 = 3'h6;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_933 (
        .y(indices_rom_12),
        .in(2'h3)
    );
    assign indices_rom_13 = 3'h7;
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_934 (
        .y(indices_rom_2),
        .in(1'h0)
    );
    assign indices_rom_3 = 3'h4;
    assign indices_rom_4 = 3'h4;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_935 (
        .y(indices_rom_5),
        .in(2'h2)
    );
    assign indices_rom_6 = 3'h6;
    assign indices_rom_7 = 3'h4;
    PAD_UNSIGNED #(.width(2), .n(3)) u_pad_936 (
        .y(indices_rom_8),
        .in(2'h2)
    );
    PAD_UNSIGNED #(.width(1), .n(3)) u_pad_937 (
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
    assign io_out_sync = _T_635__T_646_data;
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
    assign stage_outputs_1_0_imaginary_node = _T_2758_imaginary_node__T_2777_data;
    assign stage_outputs_1_0_real_node = _T_2758_real_node__T_2777_data;
    assign stage_outputs_1_1_imaginary_node = _T_2981_imaginary_node__T_3000_data;
    assign stage_outputs_1_1_real_node = _T_2981_real_node__T_3000_data;
    assign stage_outputs_1_2_imaginary_node = _T_3204_imaginary_node__T_3223_data;
    assign stage_outputs_1_2_real_node = _T_3204_real_node__T_3223_data;
    assign stage_outputs_1_3_imaginary_node = _T_3427_imaginary_node__T_3446_data;
    assign stage_outputs_1_3_real_node = _T_3427_real_node__T_3446_data;
    assign stage_outputs_1_4_imaginary_node = _T_2792_imaginary_node__T_2811_data;
    assign stage_outputs_1_4_real_node = _T_2792_real_node__T_2811_data;
    assign stage_outputs_1_5_imaginary_node = _T_3015_imaginary_node__T_3034_data;
    assign stage_outputs_1_5_real_node = _T_3015_real_node__T_3034_data;
    assign stage_outputs_1_6_imaginary_node = _T_3238_imaginary_node__T_3257_data;
    assign stage_outputs_1_6_real_node = _T_3238_real_node__T_3257_data;
    assign stage_outputs_1_7_imaginary_node = _T_3461_imaginary_node__T_3480_data;
    assign stage_outputs_1_7_real_node = _T_3461_real_node__T_3480_data;
    assign stage_outputs_2_0_imaginary_node = _T_3684_imaginary_node__T_3703_data;
    assign stage_outputs_2_0_real_node = _T_3684_real_node__T_3703_data;
    assign stage_outputs_2_1_imaginary_node = _T_3941_imaginary_node__T_3960_data;
    assign stage_outputs_2_1_real_node = _T_3941_real_node__T_3960_data;
    assign stage_outputs_2_2_imaginary_node = _T_3718_imaginary_node__T_3737_data;
    assign stage_outputs_2_2_real_node = _T_3718_real_node__T_3737_data;
    assign stage_outputs_2_3_imaginary_node = _T_3975_imaginary_node__T_3994_data;
    assign stage_outputs_2_3_real_node = _T_3975_real_node__T_3994_data;
    assign stage_outputs_2_4_imaginary_node = _T_4198_imaginary_node__T_4217_data;
    assign stage_outputs_2_4_real_node = _T_4198_real_node__T_4217_data;
    assign stage_outputs_2_5_imaginary_node = _T_4455_imaginary_node__T_4474_data;
    assign stage_outputs_2_5_real_node = _T_4455_real_node__T_4474_data;
    assign stage_outputs_2_6_imaginary_node = _T_4232_imaginary_node__T_4251_data;
    assign stage_outputs_2_6_real_node = _T_4232_real_node__T_4251_data;
    assign stage_outputs_2_7_imaginary_node = _T_4489_imaginary_node__T_4508_data;
    assign stage_outputs_2_7_real_node = _T_4489_real_node__T_4508_data;
    assign stage_outputs_3_0_imaginary_node = _T_4715_imaginary_node__T_4734_data;
    assign stage_outputs_3_0_real_node = _T_4715_real_node__T_4734_data;
    assign stage_outputs_3_1_imaginary_node = _T_4749_imaginary_node__T_4768_data;
    assign stage_outputs_3_1_real_node = _T_4749_real_node__T_4768_data;
    assign stage_outputs_3_2_imaginary_node = _T_4975_imaginary_node__T_4994_data;
    assign stage_outputs_3_2_real_node = _T_4975_real_node__T_4994_data;
    assign stage_outputs_3_3_imaginary_node = _T_5009_imaginary_node__T_5028_data;
    assign stage_outputs_3_3_real_node = _T_5009_real_node__T_5028_data;
    assign stage_outputs_3_4_imaginary_node = _T_5235_imaginary_node__T_5254_data;
    assign stage_outputs_3_4_real_node = _T_5235_real_node__T_5254_data;
    assign stage_outputs_3_5_imaginary_node = _T_5269_imaginary_node__T_5288_data;
    assign stage_outputs_3_5_real_node = _T_5269_real_node__T_5288_data;
    assign stage_outputs_3_6_imaginary_node = _T_5495_imaginary_node__T_5514_data;
    assign stage_outputs_3_6_real_node = _T_5495_real_node__T_5514_data;
    assign stage_outputs_3_7_imaginary_node = _T_5529_imaginary_node__T_5548_data;
    assign stage_outputs_3_7_real_node = _T_5529_real_node__T_5548_data;
    MUX_UNSIGNED #(.width(1)) u_mux_938 (
        .y(_WTEMP_0),
        .sel(_T_624),
        .a(1'h0),
        .b(_node_0)
    );
    assign twiddle_0_imaginary_node = _T_1358_imaginary_node;
    assign twiddle_0_real_node = _T_1358_real_node;
    assign twiddle_1_imaginary_node = _T_1419_imaginary_node;
    assign twiddle_1_real_node = _T_1419_real_node;
    assign twiddle_2_imaginary_node = _T_1480_imaginary_node;
    assign twiddle_2_real_node = _T_1480_real_node;
    assign twiddle_3_imaginary_node = _T_1541_imaginary_node;
    assign twiddle_3_real_node = _T_1541_real_node;
    assign twiddle_4_imaginary_node = _T_1602_imaginary_node;
    assign twiddle_4_real_node = _T_1602_real_node;
    assign twiddle_5_imaginary_node = _T_1663_imaginary_node;
    assign twiddle_5_real_node = _T_1663_real_node;
    assign twiddle_6_imaginary_node = _T_1724_imaginary_node;
    assign twiddle_6_real_node = _T_1724_real_node;
    assign twiddle_rom_0_imaginary_node = _T_758_imaginary_node;
    assign twiddle_rom_0_real_node = _T_758_real_node;
    assign twiddle_rom_1_imaginary_node = _T_786_imaginary_node;
    assign twiddle_rom_1_real_node = _T_786_real_node;
    assign twiddle_rom_2_imaginary_node = _T_814_imaginary_node;
    assign twiddle_rom_2_real_node = _T_814_real_node;
    assign twiddle_rom_3_imaginary_node = _T_842_imaginary_node;
    assign twiddle_rom_3_real_node = _T_842_real_node;
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
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module MUL2_UNSIGNED(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = a * b;
endmodule // MUL2_UNSIGNED
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
    BITWISEAND #(.width(1)) bitwiseand_939 (
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
    wire _WTEMP_29;
    MUX_UNSIGNED #(.width(1)) u_mux_940 (
        .y(__T_628__d),
        .sel(reset),
        .a(1'h0),
        .b(_WTEMP_29)
    );
    wire _T_630;
    EQ_UNSIGNED #(.width(1)) u_eq_941 (
        .y(_T_630),
        .a(__T_628__q),
        .b(1'h1)
    );
    wire [1:0] _T_632;
    ADD_UNSIGNED #(.width(1)) u_add_942 (
        .y(_T_632),
        .a(__T_628__q),
        .b(1'h1)
    );
    wire _T_633;
    TAIL #(.width(2), .n(1)) tail_943 (
        .y(_T_633),
        .in(_T_632)
    );
    wire _T_634;
    BITWISEAND #(.width(1)) bitwiseand_944 (
        .y(_T_634),
        .a(io_in_valid),
        .b(_T_630)
    );
    wire _node_814;
    MUX_UNSIGNED #(.width(1)) u_mux_945 (
        .y(_node_814),
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
    BITWISEAND #(.width(1)) bitwiseand_946 (
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
    EQ_UNSIGNED #(.width(1)) u_eq_947 (
        .y(_T_647),
        .a(sync_1),
        .b(1'h1)
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
    wire _node_815;
    wire [1:0] _WTEMP_30;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_948 (
        .y(_WTEMP_30),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_949 (
        .y(_node_815),
        .a(2'd0),
        .b(_WTEMP_30)
    );
    wire [63:0] _node_816;
    assign _node_816 = twiddle_rom_0_imaginary_node;
    wire _node_817;
    wire [1:0] _WTEMP_31;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_950 (
        .y(_WTEMP_31),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_951 (
        .y(_node_817),
        .a(2'd1),
        .b(_WTEMP_31)
    );
    wire [63:0] _node_818;
    MUX_UNSIGNED #(.width(64)) u_mux_952 (
        .y(_node_818),
        .sel(_node_817),
        .a(twiddle_rom_1_imaginary_node),
        .b(_node_816)
    );
    wire _node_819;
    wire [1:0] _WTEMP_32;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_953 (
        .y(_WTEMP_32),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_954 (
        .y(_node_819),
        .a(2'd0),
        .b(_WTEMP_32)
    );
    wire [63:0] _node_820;
    assign _node_820 = twiddle_rom_0_real_node;
    wire _node_821;
    wire [1:0] _WTEMP_33;
    PAD_UNSIGNED #(.width(1), .n(2)) u_pad_955 (
        .y(_WTEMP_33),
        .in(indices_rom_0)
    );
    EQ_UNSIGNED #(.width(2)) u_eq_956 (
        .y(_node_821),
        .a(2'd1),
        .b(_WTEMP_33)
    );
    wire [63:0] _node_822;
    MUX_UNSIGNED #(.width(64)) u_mux_957 (
        .y(_node_822),
        .sel(_node_821),
        .a(twiddle_rom_1_real_node),
        .b(_node_820)
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
    BITWISEAND #(.width(1)) bitwiseand_958 (
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
    BITS #(.width(1), .high(0), .low(0)) bits_959 (
        .y(_T_1766),
        .in(sync_0)
    );
    wire _T_1768;
    wire [1:0] _T_1770;
    ADD_UNSIGNED #(.width(1)) u_add_960 (
        .y(_T_1770),
        .a(_T_1766),
        .b(1'h0)
    );
    wire _T_1771;
    TAIL #(.width(2), .n(1)) tail_961 (
        .y(_T_1771),
        .in(_T_1770)
    );
    wire _T_1786;
    wire [1:0] _T_1788;
    ADD_UNSIGNED #(.width(1)) u_add_962 (
        .y(_T_1788),
        .a(_T_1766),
        .b(1'h1)
    );
    wire _T_1789;
    TAIL #(.width(2), .n(1)) tail_963 (
        .y(_T_1789),
        .in(_T_1788)
    );
    wire [63:0] _T_1844_0_real_node;
    wire [63:0] _T_1844_0_imaginary_node;
    wire [63:0] _T_1844_1_real_node;
    wire [63:0] _T_1844_1_imaginary_node;
    wire _node_823;
    EQ_UNSIGNED #(.width(1)) u_eq_964 (
        .y(_node_823),
        .a(1'd0),
        .b(_T_1768)
    );
    wire [63:0] _node_824;
    assign _node_824 = _T_1725_0_imaginary_node;
    wire _node_825;
    EQ_UNSIGNED #(.width(1)) u_eq_965 (
        .y(_node_825),
        .a(1'd1),
        .b(_T_1768)
    );
    wire [63:0] _node_826;
    MUX_UNSIGNED #(.width(64)) u_mux_966 (
        .y(_node_826),
        .sel(_node_825),
        .a(_T_1725_1_imaginary_node),
        .b(_node_824)
    );
    wire _node_827;
    EQ_UNSIGNED #(.width(1)) u_eq_967 (
        .y(_node_827),
        .a(1'd0),
        .b(_T_1768)
    );
    wire [63:0] _node_828;
    assign _node_828 = _T_1725_0_real_node;
    wire _node_829;
    EQ_UNSIGNED #(.width(1)) u_eq_968 (
        .y(_node_829),
        .a(1'd1),
        .b(_T_1768)
    );
    wire [63:0] _node_830;
    MUX_UNSIGNED #(.width(64)) u_mux_969 (
        .y(_node_830),
        .sel(_node_829),
        .a(_T_1725_1_real_node),
        .b(_node_828)
    );
    wire _node_831;
    EQ_UNSIGNED #(.width(1)) u_eq_970 (
        .y(_node_831),
        .a(1'd0),
        .b(_T_1786)
    );
    wire [63:0] _node_832;
    assign _node_832 = _T_1725_0_imaginary_node;
    wire _node_833;
    EQ_UNSIGNED #(.width(1)) u_eq_971 (
        .y(_node_833),
        .a(1'd1),
        .b(_T_1786)
    );
    wire [63:0] _node_834;
    MUX_UNSIGNED #(.width(64)) u_mux_972 (
        .y(_node_834),
        .sel(_node_833),
        .a(_T_1725_1_imaginary_node),
        .b(_node_832)
    );
    wire _node_835;
    EQ_UNSIGNED #(.width(1)) u_eq_973 (
        .y(_node_835),
        .a(1'd0),
        .b(_T_1786)
    );
    wire [63:0] _node_836;
    assign _node_836 = _T_1725_0_real_node;
    wire _node_837;
    EQ_UNSIGNED #(.width(1)) u_eq_974 (
        .y(_node_837),
        .a(1'd1),
        .b(_T_1786)
    );
    wire [63:0] _node_838;
    MUX_UNSIGNED #(.width(64)) u_mux_975 (
        .y(_node_838),
        .sel(_node_837),
        .a(_T_1725_1_real_node),
        .b(_node_836)
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
    BITWISEAND #(.width(1)) bitwiseand_976 (
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
    BITWISEAND #(.width(1)) bitwiseand_977 (
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
    wire _T_2122_real_node__T_2133_clk;
    wire _T_2122_real_node__T_2133_en;
    wire _T_2122_real_node__T_2133_mask;
    wire _T_2122_real_node__T_2133_addr;
    wire [63:0] _T_2122_real_node__T_2133_data;
    wire [63:0] _T_2122_real_node__T_2141_data;
    wire _T_2122_real_node__T_2141_clk;
    wire _T_2122_real_node__T_2141_en;
    wire _T_2122_real_node__T_2141_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2122_real_node (
        .read_data(_T_2122_real_node__T_2141_data),
        .read_clk(_T_2122_real_node__T_2141_clk),
        .read_en(_T_2122_real_node__T_2141_en),
        .read_addr(_T_2122_real_node__T_2141_addr),
        .write_clk(_T_2122_real_node__T_2133_clk),
        .write_en(_T_2122_real_node__T_2133_en),
        .write_mask(_T_2122_real_node__T_2133_mask),
        .write_addr(_T_2122_real_node__T_2133_addr),
        .write_data(_T_2122_real_node__T_2133_data)
    );
    wire _T_2122_imaginary_node__T_2133_clk;
    wire _T_2122_imaginary_node__T_2133_en;
    wire _T_2122_imaginary_node__T_2133_mask;
    wire _T_2122_imaginary_node__T_2133_addr;
    wire [63:0] _T_2122_imaginary_node__T_2133_data;
    wire [63:0] _T_2122_imaginary_node__T_2141_data;
    wire _T_2122_imaginary_node__T_2141_clk;
    wire _T_2122_imaginary_node__T_2141_en;
    wire _T_2122_imaginary_node__T_2141_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2122_imaginary_node (
        .read_data(_T_2122_imaginary_node__T_2141_data),
        .read_clk(_T_2122_imaginary_node__T_2141_clk),
        .read_en(_T_2122_imaginary_node__T_2141_en),
        .read_addr(_T_2122_imaginary_node__T_2141_addr),
        .write_clk(_T_2122_imaginary_node__T_2133_clk),
        .write_en(_T_2122_imaginary_node__T_2133_en),
        .write_mask(_T_2122_imaginary_node__T_2133_mask),
        .write_addr(_T_2122_imaginary_node__T_2133_addr),
        .write_data(_T_2122_imaginary_node__T_2133_data)
    );
    wire _T_2125;
    BITWISEAND #(.width(1)) bitwiseand_978 (
        .y(_T_2125),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2122_real_node__T_2133_addr = 1'h0;
    assign _T_2122_real_node__T_2133_en = io_in_valid;
    assign _T_2122_real_node__T_2133_clk = clock;
    assign _T_2122_imaginary_node__T_2133_addr = 1'h0;
    assign _T_2122_imaginary_node__T_2133_en = io_in_valid;
    assign _T_2122_imaginary_node__T_2133_clk = clock;
    assign _T_2122_imaginary_node__T_2133_mask = 1'h1;
    assign _T_2122_real_node__T_2133_mask = 1'h1;
    assign _T_2122_real_node__T_2141_addr = 1'h0;
    assign _T_2122_real_node__T_2141_en = 1'h1;
    assign _T_2122_real_node__T_2141_clk = clock;
    assign _T_2122_imaginary_node__T_2141_addr = 1'h0;
    assign _T_2122_imaginary_node__T_2141_en = 1'h1;
    assign _T_2122_imaginary_node__T_2141_clk = clock;
    wire _T_2156_real_node__T_2167_clk;
    wire _T_2156_real_node__T_2167_en;
    wire _T_2156_real_node__T_2167_mask;
    wire _T_2156_real_node__T_2167_addr;
    wire [63:0] _T_2156_real_node__T_2167_data;
    wire [63:0] _T_2156_real_node__T_2175_data;
    wire _T_2156_real_node__T_2175_clk;
    wire _T_2156_real_node__T_2175_en;
    wire _T_2156_real_node__T_2175_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2156_real_node (
        .read_data(_T_2156_real_node__T_2175_data),
        .read_clk(_T_2156_real_node__T_2175_clk),
        .read_en(_T_2156_real_node__T_2175_en),
        .read_addr(_T_2156_real_node__T_2175_addr),
        .write_clk(_T_2156_real_node__T_2167_clk),
        .write_en(_T_2156_real_node__T_2167_en),
        .write_mask(_T_2156_real_node__T_2167_mask),
        .write_addr(_T_2156_real_node__T_2167_addr),
        .write_data(_T_2156_real_node__T_2167_data)
    );
    wire _T_2156_imaginary_node__T_2167_clk;
    wire _T_2156_imaginary_node__T_2167_en;
    wire _T_2156_imaginary_node__T_2167_mask;
    wire _T_2156_imaginary_node__T_2167_addr;
    wire [63:0] _T_2156_imaginary_node__T_2167_data;
    wire [63:0] _T_2156_imaginary_node__T_2175_data;
    wire _T_2156_imaginary_node__T_2175_clk;
    wire _T_2156_imaginary_node__T_2175_en;
    wire _T_2156_imaginary_node__T_2175_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2156_imaginary_node (
        .read_data(_T_2156_imaginary_node__T_2175_data),
        .read_clk(_T_2156_imaginary_node__T_2175_clk),
        .read_en(_T_2156_imaginary_node__T_2175_en),
        .read_addr(_T_2156_imaginary_node__T_2175_addr),
        .write_clk(_T_2156_imaginary_node__T_2167_clk),
        .write_en(_T_2156_imaginary_node__T_2167_en),
        .write_mask(_T_2156_imaginary_node__T_2167_mask),
        .write_addr(_T_2156_imaginary_node__T_2167_addr),
        .write_data(_T_2156_imaginary_node__T_2167_data)
    );
    wire _T_2159;
    BITWISEAND #(.width(1)) bitwiseand_979 (
        .y(_T_2159),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2156_real_node__T_2167_addr = 1'h0;
    assign _T_2156_real_node__T_2167_en = io_in_valid;
    assign _T_2156_real_node__T_2167_clk = clock;
    assign _T_2156_imaginary_node__T_2167_addr = 1'h0;
    assign _T_2156_imaginary_node__T_2167_en = io_in_valid;
    assign _T_2156_imaginary_node__T_2167_clk = clock;
    assign _T_2156_imaginary_node__T_2167_mask = 1'h1;
    assign _T_2156_real_node__T_2167_mask = 1'h1;
    assign _T_2156_real_node__T_2175_addr = 1'h0;
    assign _T_2156_real_node__T_2175_en = 1'h1;
    assign _T_2156_real_node__T_2175_clk = clock;
    assign _T_2156_imaginary_node__T_2175_addr = 1'h0;
    assign _T_2156_imaginary_node__T_2175_en = 1'h1;
    assign _T_2156_imaginary_node__T_2175_clk = clock;
    wire [63:0] _T_2217_0_real_node;
    wire [63:0] _T_2217_0_imaginary_node;
    wire [63:0] _T_2217_1_real_node;
    wire [63:0] _T_2217_1_imaginary_node;
    wire _T_2258;
    BITS #(.width(1), .high(0), .low(0)) bits_980 (
        .y(_T_2258),
        .in(sync_0)
    );
    wire _T_2260;
    wire [1:0] _T_2262;
    ADD_UNSIGNED #(.width(1)) u_add_981 (
        .y(_T_2262),
        .a(_T_2258),
        .b(1'h0)
    );
    wire _T_2263;
    TAIL #(.width(2), .n(1)) tail_982 (
        .y(_T_2263),
        .in(_T_2262)
    );
    wire _T_2278;
    wire [1:0] _T_2280;
    ADD_UNSIGNED #(.width(1)) u_add_983 (
        .y(_T_2280),
        .a(_T_2258),
        .b(1'h1)
    );
    wire _T_2281;
    TAIL #(.width(2), .n(1)) tail_984 (
        .y(_T_2281),
        .in(_T_2280)
    );
    wire [63:0] _T_2336_0_real_node;
    wire [63:0] _T_2336_0_imaginary_node;
    wire [63:0] _T_2336_1_real_node;
    wire [63:0] _T_2336_1_imaginary_node;
    wire _node_839;
    EQ_UNSIGNED #(.width(1)) u_eq_985 (
        .y(_node_839),
        .a(1'd0),
        .b(_T_2260)
    );
    wire [63:0] _node_840;
    assign _node_840 = _T_2217_0_imaginary_node;
    wire _node_841;
    EQ_UNSIGNED #(.width(1)) u_eq_986 (
        .y(_node_841),
        .a(1'd1),
        .b(_T_2260)
    );
    wire [63:0] _node_842;
    MUX_UNSIGNED #(.width(64)) u_mux_987 (
        .y(_node_842),
        .sel(_node_841),
        .a(_T_2217_1_imaginary_node),
        .b(_node_840)
    );
    wire _node_843;
    EQ_UNSIGNED #(.width(1)) u_eq_988 (
        .y(_node_843),
        .a(1'd0),
        .b(_T_2260)
    );
    wire [63:0] _node_844;
    assign _node_844 = _T_2217_0_real_node;
    wire _node_845;
    EQ_UNSIGNED #(.width(1)) u_eq_989 (
        .y(_node_845),
        .a(1'd1),
        .b(_T_2260)
    );
    wire [63:0] _node_846;
    MUX_UNSIGNED #(.width(64)) u_mux_990 (
        .y(_node_846),
        .sel(_node_845),
        .a(_T_2217_1_real_node),
        .b(_node_844)
    );
    wire _node_847;
    EQ_UNSIGNED #(.width(1)) u_eq_991 (
        .y(_node_847),
        .a(1'd0),
        .b(_T_2278)
    );
    wire [63:0] _node_848;
    assign _node_848 = _T_2217_0_imaginary_node;
    wire _node_849;
    EQ_UNSIGNED #(.width(1)) u_eq_992 (
        .y(_node_849),
        .a(1'd1),
        .b(_T_2278)
    );
    wire [63:0] _node_850;
    MUX_UNSIGNED #(.width(64)) u_mux_993 (
        .y(_node_850),
        .sel(_node_849),
        .a(_T_2217_1_imaginary_node),
        .b(_node_848)
    );
    wire _node_851;
    EQ_UNSIGNED #(.width(1)) u_eq_994 (
        .y(_node_851),
        .a(1'd0),
        .b(_T_2278)
    );
    wire [63:0] _node_852;
    assign _node_852 = _T_2217_0_real_node;
    wire _node_853;
    EQ_UNSIGNED #(.width(1)) u_eq_995 (
        .y(_node_853),
        .a(1'd1),
        .b(_T_2278)
    );
    wire [63:0] _node_854;
    MUX_UNSIGNED #(.width(64)) u_mux_996 (
        .y(_node_854),
        .sel(_node_853),
        .a(_T_2217_1_real_node),
        .b(_node_852)
    );
    wire _T_2391_real_node__T_2402_clk;
    wire _T_2391_real_node__T_2402_en;
    wire _T_2391_real_node__T_2402_mask;
    wire _T_2391_real_node__T_2402_addr;
    wire [63:0] _T_2391_real_node__T_2402_data;
    wire [63:0] _T_2391_real_node__T_2410_data;
    wire _T_2391_real_node__T_2410_clk;
    wire _T_2391_real_node__T_2410_en;
    wire _T_2391_real_node__T_2410_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2391_real_node (
        .read_data(_T_2391_real_node__T_2410_data),
        .read_clk(_T_2391_real_node__T_2410_clk),
        .read_en(_T_2391_real_node__T_2410_en),
        .read_addr(_T_2391_real_node__T_2410_addr),
        .write_clk(_T_2391_real_node__T_2402_clk),
        .write_en(_T_2391_real_node__T_2402_en),
        .write_mask(_T_2391_real_node__T_2402_mask),
        .write_addr(_T_2391_real_node__T_2402_addr),
        .write_data(_T_2391_real_node__T_2402_data)
    );
    wire _T_2391_imaginary_node__T_2402_clk;
    wire _T_2391_imaginary_node__T_2402_en;
    wire _T_2391_imaginary_node__T_2402_mask;
    wire _T_2391_imaginary_node__T_2402_addr;
    wire [63:0] _T_2391_imaginary_node__T_2402_data;
    wire [63:0] _T_2391_imaginary_node__T_2410_data;
    wire _T_2391_imaginary_node__T_2410_clk;
    wire _T_2391_imaginary_node__T_2410_en;
    wire _T_2391_imaginary_node__T_2410_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2391_imaginary_node (
        .read_data(_T_2391_imaginary_node__T_2410_data),
        .read_clk(_T_2391_imaginary_node__T_2410_clk),
        .read_en(_T_2391_imaginary_node__T_2410_en),
        .read_addr(_T_2391_imaginary_node__T_2410_addr),
        .write_clk(_T_2391_imaginary_node__T_2402_clk),
        .write_en(_T_2391_imaginary_node__T_2402_en),
        .write_mask(_T_2391_imaginary_node__T_2402_mask),
        .write_addr(_T_2391_imaginary_node__T_2402_addr),
        .write_data(_T_2391_imaginary_node__T_2402_data)
    );
    wire _T_2394;
    BITWISEAND #(.width(1)) bitwiseand_997 (
        .y(_T_2394),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2391_real_node__T_2402_addr = 1'h0;
    assign _T_2391_real_node__T_2402_en = io_in_valid;
    assign _T_2391_real_node__T_2402_clk = clock;
    assign _T_2391_imaginary_node__T_2402_addr = 1'h0;
    assign _T_2391_imaginary_node__T_2402_en = io_in_valid;
    assign _T_2391_imaginary_node__T_2402_clk = clock;
    assign _T_2391_imaginary_node__T_2402_mask = 1'h1;
    assign _T_2391_real_node__T_2402_mask = 1'h1;
    assign _T_2391_real_node__T_2410_addr = 1'h0;
    assign _T_2391_real_node__T_2410_en = 1'h1;
    assign _T_2391_real_node__T_2410_clk = clock;
    assign _T_2391_imaginary_node__T_2410_addr = 1'h0;
    assign _T_2391_imaginary_node__T_2410_en = 1'h1;
    assign _T_2391_imaginary_node__T_2410_clk = clock;
    wire [63:0] _BBFMultiply_52_1__out;
    wire [63:0] _BBFMultiply_52_1__in2;
    wire [63:0] _BBFMultiply_52_1__in1;
    BBFMultiply BBFMultiply_52_1 (
        .out(_BBFMultiply_52_1__out),
        .in2(_BBFMultiply_52_1__in2),
        .in1(_BBFMultiply_52_1__in1)
    );
    wire [63:0] _T_2414_node;
    wire [63:0] _BBFMultiply_53_1__out;
    wire [63:0] _BBFMultiply_53_1__in2;
    wire [63:0] _BBFMultiply_53_1__in1;
    BBFMultiply BBFMultiply_53_1 (
        .out(_BBFMultiply_53_1__out),
        .in2(_BBFMultiply_53_1__in2),
        .in1(_BBFMultiply_53_1__in1)
    );
    wire [63:0] _T_2420_node;
    wire [63:0] _T_2426_node;
    wire [63:0] _BBFSubtract_46_1__out;
    wire [63:0] _BBFSubtract_46_1__in2;
    wire [63:0] _BBFSubtract_46_1__in1;
    BBFSubtract BBFSubtract_46_1 (
        .out(_BBFSubtract_46_1__out),
        .in2(_BBFSubtract_46_1__in2),
        .in1(_BBFSubtract_46_1__in1)
    );
    wire [63:0] _T_2433_node;
    wire [63:0] _BBFAdd_78_1__out;
    wire [63:0] _BBFAdd_78_1__in2;
    wire [63:0] _BBFAdd_78_1__in1;
    BBFAdd BBFAdd_78_1 (
        .out(_BBFAdd_78_1__out),
        .in2(_BBFAdd_78_1__in2),
        .in1(_BBFAdd_78_1__in1)
    );
    wire [63:0] _T_2439_node;
    wire [63:0] _BBFMultiply_54_1__out;
    wire [63:0] _BBFMultiply_54_1__in2;
    wire [63:0] _BBFMultiply_54_1__in1;
    BBFMultiply BBFMultiply_54_1 (
        .out(_BBFMultiply_54_1__out),
        .in2(_BBFMultiply_54_1__in2),
        .in1(_BBFMultiply_54_1__in1)
    );
    wire [63:0] _T_2445_node;
    wire [63:0] _BBFMultiply_55_1__out;
    wire [63:0] _BBFMultiply_55_1__in2;
    wire [63:0] _BBFMultiply_55_1__in1;
    BBFMultiply BBFMultiply_55_1 (
        .out(_BBFMultiply_55_1__out),
        .in2(_BBFMultiply_55_1__in2),
        .in1(_BBFMultiply_55_1__in1)
    );
    wire [63:0] _T_2451_node;
    wire [63:0] _BBFAdd_79_1__out;
    wire [63:0] _BBFAdd_79_1__in2;
    wire [63:0] _BBFAdd_79_1__in1;
    BBFAdd BBFAdd_79_1 (
        .out(_BBFAdd_79_1__out),
        .in2(_BBFAdd_79_1__in2),
        .in1(_BBFAdd_79_1__in1)
    );
    wire [63:0] _T_2457_node;
    wire [63:0] _T_2473_real_node;
    wire [63:0] _T_2473_imaginary_node;
    wire [63:0] _BBFAdd_80_1__out;
    wire [63:0] _BBFAdd_80_1__in2;
    wire [63:0] _BBFAdd_80_1__in1;
    BBFAdd BBFAdd_80_1 (
        .out(_BBFAdd_80_1__out),
        .in2(_BBFAdd_80_1__in2),
        .in1(_BBFAdd_80_1__in1)
    );
    wire [63:0] _T_2477_node;
    wire [63:0] _BBFAdd_81_1__out;
    wire [63:0] _BBFAdd_81_1__in2;
    wire [63:0] _BBFAdd_81_1__in1;
    BBFAdd BBFAdd_81_1 (
        .out(_BBFAdd_81_1__out),
        .in2(_BBFAdd_81_1__in2),
        .in1(_BBFAdd_81_1__in1)
    );
    wire [63:0] _T_2483_node;
    wire [63:0] _T_2499_real_node;
    wire [63:0] _T_2499_imaginary_node;
    wire [63:0] _T_2503_node;
    wire [63:0] _BBFSubtract_47_1__out;
    wire [63:0] _BBFSubtract_47_1__in2;
    wire [63:0] _BBFSubtract_47_1__in1;
    BBFSubtract BBFSubtract_47_1 (
        .out(_BBFSubtract_47_1__out),
        .in2(_BBFSubtract_47_1__in2),
        .in1(_BBFSubtract_47_1__in1)
    );
    wire [63:0] _T_2510_node;
    wire [63:0] _T_2516_node;
    wire [63:0] _BBFSubtract_48_1__out;
    wire [63:0] _BBFSubtract_48_1__in2;
    wire [63:0] _BBFSubtract_48_1__in1;
    BBFSubtract BBFSubtract_48_1 (
        .out(_BBFSubtract_48_1__out),
        .in2(_BBFSubtract_48_1__in2),
        .in1(_BBFSubtract_48_1__in1)
    );
    wire [63:0] _T_2523_node;
    wire [63:0] _T_2539_real_node;
    wire [63:0] _T_2539_imaginary_node;
    wire [63:0] _BBFAdd_82_1__out;
    wire [63:0] _BBFAdd_82_1__in2;
    wire [63:0] _BBFAdd_82_1__in1;
    BBFAdd BBFAdd_82_1 (
        .out(_BBFAdd_82_1__out),
        .in2(_BBFAdd_82_1__in2),
        .in1(_BBFAdd_82_1__in1)
    );
    wire [63:0] _T_2543_node;
    wire [63:0] _BBFAdd_83_1__out;
    wire [63:0] _BBFAdd_83_1__in2;
    wire [63:0] _BBFAdd_83_1__in1;
    BBFAdd BBFAdd_83_1 (
        .out(_BBFAdd_83_1__out),
        .in2(_BBFAdd_83_1__in2),
        .in1(_BBFAdd_83_1__in1)
    );
    wire [63:0] _T_2549_node;
    wire [63:0] _T_2565_real_node;
    wire [63:0] _T_2565_imaginary_node;
    wire _T_2580_real_node__T_2591_clk;
    wire _T_2580_real_node__T_2591_en;
    wire _T_2580_real_node__T_2591_mask;
    wire _T_2580_real_node__T_2591_addr;
    wire [63:0] _T_2580_real_node__T_2591_data;
    wire [63:0] _T_2580_real_node__T_2599_data;
    wire _T_2580_real_node__T_2599_clk;
    wire _T_2580_real_node__T_2599_en;
    wire _T_2580_real_node__T_2599_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2580_real_node (
        .read_data(_T_2580_real_node__T_2599_data),
        .read_clk(_T_2580_real_node__T_2599_clk),
        .read_en(_T_2580_real_node__T_2599_en),
        .read_addr(_T_2580_real_node__T_2599_addr),
        .write_clk(_T_2580_real_node__T_2591_clk),
        .write_en(_T_2580_real_node__T_2591_en),
        .write_mask(_T_2580_real_node__T_2591_mask),
        .write_addr(_T_2580_real_node__T_2591_addr),
        .write_data(_T_2580_real_node__T_2591_data)
    );
    wire _T_2580_imaginary_node__T_2591_clk;
    wire _T_2580_imaginary_node__T_2591_en;
    wire _T_2580_imaginary_node__T_2591_mask;
    wire _T_2580_imaginary_node__T_2591_addr;
    wire [63:0] _T_2580_imaginary_node__T_2591_data;
    wire [63:0] _T_2580_imaginary_node__T_2599_data;
    wire _T_2580_imaginary_node__T_2599_clk;
    wire _T_2580_imaginary_node__T_2599_en;
    wire _T_2580_imaginary_node__T_2599_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2580_imaginary_node (
        .read_data(_T_2580_imaginary_node__T_2599_data),
        .read_clk(_T_2580_imaginary_node__T_2599_clk),
        .read_en(_T_2580_imaginary_node__T_2599_en),
        .read_addr(_T_2580_imaginary_node__T_2599_addr),
        .write_clk(_T_2580_imaginary_node__T_2591_clk),
        .write_en(_T_2580_imaginary_node__T_2591_en),
        .write_mask(_T_2580_imaginary_node__T_2591_mask),
        .write_addr(_T_2580_imaginary_node__T_2591_addr),
        .write_data(_T_2580_imaginary_node__T_2591_data)
    );
    wire _T_2583;
    BITWISEAND #(.width(1)) bitwiseand_998 (
        .y(_T_2583),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2580_real_node__T_2591_addr = 1'h0;
    assign _T_2580_real_node__T_2591_en = io_in_valid;
    assign _T_2580_real_node__T_2591_clk = clock;
    assign _T_2580_imaginary_node__T_2591_addr = 1'h0;
    assign _T_2580_imaginary_node__T_2591_en = io_in_valid;
    assign _T_2580_imaginary_node__T_2591_clk = clock;
    assign _T_2580_imaginary_node__T_2591_mask = 1'h1;
    assign _T_2580_real_node__T_2591_mask = 1'h1;
    assign _T_2580_real_node__T_2599_addr = 1'h0;
    assign _T_2580_real_node__T_2599_en = 1'h1;
    assign _T_2580_real_node__T_2599_clk = clock;
    assign _T_2580_imaginary_node__T_2599_addr = 1'h0;
    assign _T_2580_imaginary_node__T_2599_en = 1'h1;
    assign _T_2580_imaginary_node__T_2599_clk = clock;
    wire _T_2614_real_node__T_2625_clk;
    wire _T_2614_real_node__T_2625_en;
    wire _T_2614_real_node__T_2625_mask;
    wire _T_2614_real_node__T_2625_addr;
    wire [63:0] _T_2614_real_node__T_2625_data;
    wire [63:0] _T_2614_real_node__T_2633_data;
    wire _T_2614_real_node__T_2633_clk;
    wire _T_2614_real_node__T_2633_en;
    wire _T_2614_real_node__T_2633_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2614_real_node (
        .read_data(_T_2614_real_node__T_2633_data),
        .read_clk(_T_2614_real_node__T_2633_clk),
        .read_en(_T_2614_real_node__T_2633_en),
        .read_addr(_T_2614_real_node__T_2633_addr),
        .write_clk(_T_2614_real_node__T_2625_clk),
        .write_en(_T_2614_real_node__T_2625_en),
        .write_mask(_T_2614_real_node__T_2625_mask),
        .write_addr(_T_2614_real_node__T_2625_addr),
        .write_data(_T_2614_real_node__T_2625_data)
    );
    wire _T_2614_imaginary_node__T_2625_clk;
    wire _T_2614_imaginary_node__T_2625_en;
    wire _T_2614_imaginary_node__T_2625_mask;
    wire _T_2614_imaginary_node__T_2625_addr;
    wire [63:0] _T_2614_imaginary_node__T_2625_data;
    wire [63:0] _T_2614_imaginary_node__T_2633_data;
    wire _T_2614_imaginary_node__T_2633_clk;
    wire _T_2614_imaginary_node__T_2633_en;
    wire _T_2614_imaginary_node__T_2633_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2614_imaginary_node (
        .read_data(_T_2614_imaginary_node__T_2633_data),
        .read_clk(_T_2614_imaginary_node__T_2633_clk),
        .read_en(_T_2614_imaginary_node__T_2633_en),
        .read_addr(_T_2614_imaginary_node__T_2633_addr),
        .write_clk(_T_2614_imaginary_node__T_2625_clk),
        .write_en(_T_2614_imaginary_node__T_2625_en),
        .write_mask(_T_2614_imaginary_node__T_2625_mask),
        .write_addr(_T_2614_imaginary_node__T_2625_addr),
        .write_data(_T_2614_imaginary_node__T_2625_data)
    );
    wire _T_2617;
    BITWISEAND #(.width(1)) bitwiseand_999 (
        .y(_T_2617),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2614_real_node__T_2625_addr = 1'h0;
    assign _T_2614_real_node__T_2625_en = io_in_valid;
    assign _T_2614_real_node__T_2625_clk = clock;
    assign _T_2614_imaginary_node__T_2625_addr = 1'h0;
    assign _T_2614_imaginary_node__T_2625_en = io_in_valid;
    assign _T_2614_imaginary_node__T_2625_clk = clock;
    assign _T_2614_imaginary_node__T_2625_mask = 1'h1;
    assign _T_2614_real_node__T_2625_mask = 1'h1;
    assign _T_2614_real_node__T_2633_addr = 1'h0;
    assign _T_2614_real_node__T_2633_en = 1'h1;
    assign _T_2614_real_node__T_2633_clk = clock;
    assign _T_2614_imaginary_node__T_2633_addr = 1'h0;
    assign _T_2614_imaginary_node__T_2633_en = 1'h1;
    assign _T_2614_imaginary_node__T_2633_clk = clock;
    wire _T_2648_real_node__T_2659_clk;
    wire _T_2648_real_node__T_2659_en;
    wire _T_2648_real_node__T_2659_mask;
    wire _T_2648_real_node__T_2659_addr;
    wire [63:0] _T_2648_real_node__T_2659_data;
    wire [63:0] _T_2648_real_node__T_2667_data;
    wire _T_2648_real_node__T_2667_clk;
    wire _T_2648_real_node__T_2667_en;
    wire _T_2648_real_node__T_2667_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2648_real_node (
        .read_data(_T_2648_real_node__T_2667_data),
        .read_clk(_T_2648_real_node__T_2667_clk),
        .read_en(_T_2648_real_node__T_2667_en),
        .read_addr(_T_2648_real_node__T_2667_addr),
        .write_clk(_T_2648_real_node__T_2659_clk),
        .write_en(_T_2648_real_node__T_2659_en),
        .write_mask(_T_2648_real_node__T_2659_mask),
        .write_addr(_T_2648_real_node__T_2659_addr),
        .write_data(_T_2648_real_node__T_2659_data)
    );
    wire _T_2648_imaginary_node__T_2659_clk;
    wire _T_2648_imaginary_node__T_2659_en;
    wire _T_2648_imaginary_node__T_2659_mask;
    wire _T_2648_imaginary_node__T_2659_addr;
    wire [63:0] _T_2648_imaginary_node__T_2659_data;
    wire [63:0] _T_2648_imaginary_node__T_2667_data;
    wire _T_2648_imaginary_node__T_2667_clk;
    wire _T_2648_imaginary_node__T_2667_en;
    wire _T_2648_imaginary_node__T_2667_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2648_imaginary_node (
        .read_data(_T_2648_imaginary_node__T_2667_data),
        .read_clk(_T_2648_imaginary_node__T_2667_clk),
        .read_en(_T_2648_imaginary_node__T_2667_en),
        .read_addr(_T_2648_imaginary_node__T_2667_addr),
        .write_clk(_T_2648_imaginary_node__T_2659_clk),
        .write_en(_T_2648_imaginary_node__T_2659_en),
        .write_mask(_T_2648_imaginary_node__T_2659_mask),
        .write_addr(_T_2648_imaginary_node__T_2659_addr),
        .write_data(_T_2648_imaginary_node__T_2659_data)
    );
    wire _T_2651;
    BITWISEAND #(.width(1)) bitwiseand_1000 (
        .y(_T_2651),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2648_real_node__T_2659_addr = 1'h0;
    assign _T_2648_real_node__T_2659_en = io_in_valid;
    assign _T_2648_real_node__T_2659_clk = clock;
    assign _T_2648_imaginary_node__T_2659_addr = 1'h0;
    assign _T_2648_imaginary_node__T_2659_en = io_in_valid;
    assign _T_2648_imaginary_node__T_2659_clk = clock;
    assign _T_2648_imaginary_node__T_2659_mask = 1'h1;
    assign _T_2648_real_node__T_2659_mask = 1'h1;
    assign _T_2648_real_node__T_2667_addr = 1'h0;
    assign _T_2648_real_node__T_2667_en = 1'h1;
    assign _T_2648_real_node__T_2667_clk = clock;
    assign _T_2648_imaginary_node__T_2667_addr = 1'h0;
    assign _T_2648_imaginary_node__T_2667_en = 1'h1;
    assign _T_2648_imaginary_node__T_2667_clk = clock;
    wire [63:0] _T_2709_0_real_node;
    wire [63:0] _T_2709_0_imaginary_node;
    wire [63:0] _T_2709_1_real_node;
    wire [63:0] _T_2709_1_imaginary_node;
    wire _T_2750;
    BITS #(.width(1), .high(0), .low(0)) bits_1001 (
        .y(_T_2750),
        .in(sync_0)
    );
    wire _T_2752;
    wire [1:0] _T_2754;
    ADD_UNSIGNED #(.width(1)) u_add_1002 (
        .y(_T_2754),
        .a(_T_2750),
        .b(1'h0)
    );
    wire _T_2755;
    TAIL #(.width(2), .n(1)) tail_1003 (
        .y(_T_2755),
        .in(_T_2754)
    );
    wire _T_2770;
    wire [1:0] _T_2772;
    ADD_UNSIGNED #(.width(1)) u_add_1004 (
        .y(_T_2772),
        .a(_T_2750),
        .b(1'h1)
    );
    wire _T_2773;
    TAIL #(.width(2), .n(1)) tail_1005 (
        .y(_T_2773),
        .in(_T_2772)
    );
    wire [63:0] _T_2828_0_real_node;
    wire [63:0] _T_2828_0_imaginary_node;
    wire [63:0] _T_2828_1_real_node;
    wire [63:0] _T_2828_1_imaginary_node;
    wire _node_855;
    EQ_UNSIGNED #(.width(1)) u_eq_1006 (
        .y(_node_855),
        .a(1'd0),
        .b(_T_2752)
    );
    wire [63:0] _node_856;
    assign _node_856 = _T_2709_0_imaginary_node;
    wire _node_857;
    EQ_UNSIGNED #(.width(1)) u_eq_1007 (
        .y(_node_857),
        .a(1'd1),
        .b(_T_2752)
    );
    wire [63:0] _node_858;
    MUX_UNSIGNED #(.width(64)) u_mux_1008 (
        .y(_node_858),
        .sel(_node_857),
        .a(_T_2709_1_imaginary_node),
        .b(_node_856)
    );
    wire _node_859;
    EQ_UNSIGNED #(.width(1)) u_eq_1009 (
        .y(_node_859),
        .a(1'd0),
        .b(_T_2752)
    );
    wire [63:0] _node_860;
    assign _node_860 = _T_2709_0_real_node;
    wire _node_861;
    EQ_UNSIGNED #(.width(1)) u_eq_1010 (
        .y(_node_861),
        .a(1'd1),
        .b(_T_2752)
    );
    wire [63:0] _node_862;
    MUX_UNSIGNED #(.width(64)) u_mux_1011 (
        .y(_node_862),
        .sel(_node_861),
        .a(_T_2709_1_real_node),
        .b(_node_860)
    );
    wire _node_863;
    EQ_UNSIGNED #(.width(1)) u_eq_1012 (
        .y(_node_863),
        .a(1'd0),
        .b(_T_2770)
    );
    wire [63:0] _node_864;
    assign _node_864 = _T_2709_0_imaginary_node;
    wire _node_865;
    EQ_UNSIGNED #(.width(1)) u_eq_1013 (
        .y(_node_865),
        .a(1'd1),
        .b(_T_2770)
    );
    wire [63:0] _node_866;
    MUX_UNSIGNED #(.width(64)) u_mux_1014 (
        .y(_node_866),
        .sel(_node_865),
        .a(_T_2709_1_imaginary_node),
        .b(_node_864)
    );
    wire _node_867;
    EQ_UNSIGNED #(.width(1)) u_eq_1015 (
        .y(_node_867),
        .a(1'd0),
        .b(_T_2770)
    );
    wire [63:0] _node_868;
    assign _node_868 = _T_2709_0_real_node;
    wire _node_869;
    EQ_UNSIGNED #(.width(1)) u_eq_1016 (
        .y(_node_869),
        .a(1'd1),
        .b(_T_2770)
    );
    wire [63:0] _node_870;
    MUX_UNSIGNED #(.width(64)) u_mux_1017 (
        .y(_node_870),
        .sel(_node_869),
        .a(_T_2709_1_real_node),
        .b(_node_868)
    );
    wire _T_2883_real_node__T_2894_clk;
    wire _T_2883_real_node__T_2894_en;
    wire _T_2883_real_node__T_2894_mask;
    wire _T_2883_real_node__T_2894_addr;
    wire [63:0] _T_2883_real_node__T_2894_data;
    wire [63:0] _T_2883_real_node__T_2902_data;
    wire _T_2883_real_node__T_2902_clk;
    wire _T_2883_real_node__T_2902_en;
    wire _T_2883_real_node__T_2902_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2883_real_node (
        .read_data(_T_2883_real_node__T_2902_data),
        .read_clk(_T_2883_real_node__T_2902_clk),
        .read_en(_T_2883_real_node__T_2902_en),
        .read_addr(_T_2883_real_node__T_2902_addr),
        .write_clk(_T_2883_real_node__T_2894_clk),
        .write_en(_T_2883_real_node__T_2894_en),
        .write_mask(_T_2883_real_node__T_2894_mask),
        .write_addr(_T_2883_real_node__T_2894_addr),
        .write_data(_T_2883_real_node__T_2894_data)
    );
    wire _T_2883_imaginary_node__T_2894_clk;
    wire _T_2883_imaginary_node__T_2894_en;
    wire _T_2883_imaginary_node__T_2894_mask;
    wire _T_2883_imaginary_node__T_2894_addr;
    wire [63:0] _T_2883_imaginary_node__T_2894_data;
    wire [63:0] _T_2883_imaginary_node__T_2902_data;
    wire _T_2883_imaginary_node__T_2902_clk;
    wire _T_2883_imaginary_node__T_2902_en;
    wire _T_2883_imaginary_node__T_2902_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_2883_imaginary_node (
        .read_data(_T_2883_imaginary_node__T_2902_data),
        .read_clk(_T_2883_imaginary_node__T_2902_clk),
        .read_en(_T_2883_imaginary_node__T_2902_en),
        .read_addr(_T_2883_imaginary_node__T_2902_addr),
        .write_clk(_T_2883_imaginary_node__T_2894_clk),
        .write_en(_T_2883_imaginary_node__T_2894_en),
        .write_mask(_T_2883_imaginary_node__T_2894_mask),
        .write_addr(_T_2883_imaginary_node__T_2894_addr),
        .write_data(_T_2883_imaginary_node__T_2894_data)
    );
    wire _T_2886;
    BITWISEAND #(.width(1)) bitwiseand_1018 (
        .y(_T_2886),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_2883_real_node__T_2894_addr = 1'h0;
    assign _T_2883_real_node__T_2894_en = io_in_valid;
    assign _T_2883_real_node__T_2894_clk = clock;
    assign _T_2883_imaginary_node__T_2894_addr = 1'h0;
    assign _T_2883_imaginary_node__T_2894_en = io_in_valid;
    assign _T_2883_imaginary_node__T_2894_clk = clock;
    assign _T_2883_imaginary_node__T_2894_mask = 1'h1;
    assign _T_2883_real_node__T_2894_mask = 1'h1;
    assign _T_2883_real_node__T_2902_addr = 1'h0;
    assign _T_2883_real_node__T_2902_en = 1'h1;
    assign _T_2883_real_node__T_2902_clk = clock;
    assign _T_2883_imaginary_node__T_2902_addr = 1'h0;
    assign _T_2883_imaginary_node__T_2902_en = 1'h1;
    assign _T_2883_imaginary_node__T_2902_clk = clock;
    wire [63:0] _BBFMultiply_56_1__out;
    wire [63:0] _BBFMultiply_56_1__in2;
    wire [63:0] _BBFMultiply_56_1__in1;
    BBFMultiply BBFMultiply_56_1 (
        .out(_BBFMultiply_56_1__out),
        .in2(_BBFMultiply_56_1__in2),
        .in1(_BBFMultiply_56_1__in1)
    );
    wire [63:0] _T_2906_node;
    wire [63:0] _BBFMultiply_57_1__out;
    wire [63:0] _BBFMultiply_57_1__in2;
    wire [63:0] _BBFMultiply_57_1__in1;
    BBFMultiply BBFMultiply_57_1 (
        .out(_BBFMultiply_57_1__out),
        .in2(_BBFMultiply_57_1__in2),
        .in1(_BBFMultiply_57_1__in1)
    );
    wire [63:0] _T_2912_node;
    wire [63:0] _T_2918_node;
    wire [63:0] _BBFSubtract_49_1__out;
    wire [63:0] _BBFSubtract_49_1__in2;
    wire [63:0] _BBFSubtract_49_1__in1;
    BBFSubtract BBFSubtract_49_1 (
        .out(_BBFSubtract_49_1__out),
        .in2(_BBFSubtract_49_1__in2),
        .in1(_BBFSubtract_49_1__in1)
    );
    wire [63:0] _T_2925_node;
    wire [63:0] _BBFAdd_84_1__out;
    wire [63:0] _BBFAdd_84_1__in2;
    wire [63:0] _BBFAdd_84_1__in1;
    BBFAdd BBFAdd_84_1 (
        .out(_BBFAdd_84_1__out),
        .in2(_BBFAdd_84_1__in2),
        .in1(_BBFAdd_84_1__in1)
    );
    wire [63:0] _T_2931_node;
    wire [63:0] _BBFMultiply_58_1__out;
    wire [63:0] _BBFMultiply_58_1__in2;
    wire [63:0] _BBFMultiply_58_1__in1;
    BBFMultiply BBFMultiply_58_1 (
        .out(_BBFMultiply_58_1__out),
        .in2(_BBFMultiply_58_1__in2),
        .in1(_BBFMultiply_58_1__in1)
    );
    wire [63:0] _T_2937_node;
    wire [63:0] _BBFMultiply_59_1__out;
    wire [63:0] _BBFMultiply_59_1__in2;
    wire [63:0] _BBFMultiply_59_1__in1;
    BBFMultiply BBFMultiply_59_1 (
        .out(_BBFMultiply_59_1__out),
        .in2(_BBFMultiply_59_1__in2),
        .in1(_BBFMultiply_59_1__in1)
    );
    wire [63:0] _T_2943_node;
    wire [63:0] _BBFAdd_85_1__out;
    wire [63:0] _BBFAdd_85_1__in2;
    wire [63:0] _BBFAdd_85_1__in1;
    BBFAdd BBFAdd_85_1 (
        .out(_BBFAdd_85_1__out),
        .in2(_BBFAdd_85_1__in2),
        .in1(_BBFAdd_85_1__in1)
    );
    wire [63:0] _T_2949_node;
    wire [63:0] _T_2965_real_node;
    wire [63:0] _T_2965_imaginary_node;
    wire [63:0] _BBFAdd_86_1__out;
    wire [63:0] _BBFAdd_86_1__in2;
    wire [63:0] _BBFAdd_86_1__in1;
    BBFAdd BBFAdd_86_1 (
        .out(_BBFAdd_86_1__out),
        .in2(_BBFAdd_86_1__in2),
        .in1(_BBFAdd_86_1__in1)
    );
    wire [63:0] _T_2969_node;
    wire [63:0] _BBFAdd_87_1__out;
    wire [63:0] _BBFAdd_87_1__in2;
    wire [63:0] _BBFAdd_87_1__in1;
    BBFAdd BBFAdd_87_1 (
        .out(_BBFAdd_87_1__out),
        .in2(_BBFAdd_87_1__in2),
        .in1(_BBFAdd_87_1__in1)
    );
    wire [63:0] _T_2975_node;
    wire [63:0] _T_2991_real_node;
    wire [63:0] _T_2991_imaginary_node;
    wire [63:0] _T_2995_node;
    wire [63:0] _BBFSubtract_50_1__out;
    wire [63:0] _BBFSubtract_50_1__in2;
    wire [63:0] _BBFSubtract_50_1__in1;
    BBFSubtract BBFSubtract_50_1 (
        .out(_BBFSubtract_50_1__out),
        .in2(_BBFSubtract_50_1__in2),
        .in1(_BBFSubtract_50_1__in1)
    );
    wire [63:0] _T_3002_node;
    wire [63:0] _T_3008_node;
    wire [63:0] _BBFSubtract_51_1__out;
    wire [63:0] _BBFSubtract_51_1__in2;
    wire [63:0] _BBFSubtract_51_1__in1;
    BBFSubtract BBFSubtract_51_1 (
        .out(_BBFSubtract_51_1__out),
        .in2(_BBFSubtract_51_1__in2),
        .in1(_BBFSubtract_51_1__in1)
    );
    wire [63:0] _T_3015_node;
    wire [63:0] _T_3031_real_node;
    wire [63:0] _T_3031_imaginary_node;
    wire [63:0] _BBFAdd_88_1__out;
    wire [63:0] _BBFAdd_88_1__in2;
    wire [63:0] _BBFAdd_88_1__in1;
    BBFAdd BBFAdd_88_1 (
        .out(_BBFAdd_88_1__out),
        .in2(_BBFAdd_88_1__in2),
        .in1(_BBFAdd_88_1__in1)
    );
    wire [63:0] _T_3035_node;
    wire [63:0] _BBFAdd_89_1__out;
    wire [63:0] _BBFAdd_89_1__in2;
    wire [63:0] _BBFAdd_89_1__in1;
    BBFAdd BBFAdd_89_1 (
        .out(_BBFAdd_89_1__out),
        .in2(_BBFAdd_89_1__in2),
        .in1(_BBFAdd_89_1__in1)
    );
    wire [63:0] _T_3041_node;
    wire [63:0] _T_3057_real_node;
    wire [63:0] _T_3057_imaginary_node;
    wire _T_3072_real_node__T_3083_clk;
    wire _T_3072_real_node__T_3083_en;
    wire _T_3072_real_node__T_3083_mask;
    wire _T_3072_real_node__T_3083_addr;
    wire [63:0] _T_3072_real_node__T_3083_data;
    wire [63:0] _T_3072_real_node__T_3091_data;
    wire _T_3072_real_node__T_3091_clk;
    wire _T_3072_real_node__T_3091_en;
    wire _T_3072_real_node__T_3091_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3072_real_node (
        .read_data(_T_3072_real_node__T_3091_data),
        .read_clk(_T_3072_real_node__T_3091_clk),
        .read_en(_T_3072_real_node__T_3091_en),
        .read_addr(_T_3072_real_node__T_3091_addr),
        .write_clk(_T_3072_real_node__T_3083_clk),
        .write_en(_T_3072_real_node__T_3083_en),
        .write_mask(_T_3072_real_node__T_3083_mask),
        .write_addr(_T_3072_real_node__T_3083_addr),
        .write_data(_T_3072_real_node__T_3083_data)
    );
    wire _T_3072_imaginary_node__T_3083_clk;
    wire _T_3072_imaginary_node__T_3083_en;
    wire _T_3072_imaginary_node__T_3083_mask;
    wire _T_3072_imaginary_node__T_3083_addr;
    wire [63:0] _T_3072_imaginary_node__T_3083_data;
    wire [63:0] _T_3072_imaginary_node__T_3091_data;
    wire _T_3072_imaginary_node__T_3091_clk;
    wire _T_3072_imaginary_node__T_3091_en;
    wire _T_3072_imaginary_node__T_3091_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3072_imaginary_node (
        .read_data(_T_3072_imaginary_node__T_3091_data),
        .read_clk(_T_3072_imaginary_node__T_3091_clk),
        .read_en(_T_3072_imaginary_node__T_3091_en),
        .read_addr(_T_3072_imaginary_node__T_3091_addr),
        .write_clk(_T_3072_imaginary_node__T_3083_clk),
        .write_en(_T_3072_imaginary_node__T_3083_en),
        .write_mask(_T_3072_imaginary_node__T_3083_mask),
        .write_addr(_T_3072_imaginary_node__T_3083_addr),
        .write_data(_T_3072_imaginary_node__T_3083_data)
    );
    wire _T_3075;
    BITWISEAND #(.width(1)) bitwiseand_1019 (
        .y(_T_3075),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3072_real_node__T_3083_addr = 1'h0;
    assign _T_3072_real_node__T_3083_en = io_in_valid;
    assign _T_3072_real_node__T_3083_clk = clock;
    assign _T_3072_imaginary_node__T_3083_addr = 1'h0;
    assign _T_3072_imaginary_node__T_3083_en = io_in_valid;
    assign _T_3072_imaginary_node__T_3083_clk = clock;
    assign _T_3072_imaginary_node__T_3083_mask = 1'h1;
    assign _T_3072_real_node__T_3083_mask = 1'h1;
    assign _T_3072_real_node__T_3091_addr = 1'h0;
    assign _T_3072_real_node__T_3091_en = 1'h1;
    assign _T_3072_real_node__T_3091_clk = clock;
    assign _T_3072_imaginary_node__T_3091_addr = 1'h0;
    assign _T_3072_imaginary_node__T_3091_en = 1'h1;
    assign _T_3072_imaginary_node__T_3091_clk = clock;
    wire _T_3106_real_node__T_3117_clk;
    wire _T_3106_real_node__T_3117_en;
    wire _T_3106_real_node__T_3117_mask;
    wire _T_3106_real_node__T_3117_addr;
    wire [63:0] _T_3106_real_node__T_3117_data;
    wire [63:0] _T_3106_real_node__T_3125_data;
    wire _T_3106_real_node__T_3125_clk;
    wire _T_3106_real_node__T_3125_en;
    wire _T_3106_real_node__T_3125_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3106_real_node (
        .read_data(_T_3106_real_node__T_3125_data),
        .read_clk(_T_3106_real_node__T_3125_clk),
        .read_en(_T_3106_real_node__T_3125_en),
        .read_addr(_T_3106_real_node__T_3125_addr),
        .write_clk(_T_3106_real_node__T_3117_clk),
        .write_en(_T_3106_real_node__T_3117_en),
        .write_mask(_T_3106_real_node__T_3117_mask),
        .write_addr(_T_3106_real_node__T_3117_addr),
        .write_data(_T_3106_real_node__T_3117_data)
    );
    wire _T_3106_imaginary_node__T_3117_clk;
    wire _T_3106_imaginary_node__T_3117_en;
    wire _T_3106_imaginary_node__T_3117_mask;
    wire _T_3106_imaginary_node__T_3117_addr;
    wire [63:0] _T_3106_imaginary_node__T_3117_data;
    wire [63:0] _T_3106_imaginary_node__T_3125_data;
    wire _T_3106_imaginary_node__T_3125_clk;
    wire _T_3106_imaginary_node__T_3125_en;
    wire _T_3106_imaginary_node__T_3125_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3106_imaginary_node (
        .read_data(_T_3106_imaginary_node__T_3125_data),
        .read_clk(_T_3106_imaginary_node__T_3125_clk),
        .read_en(_T_3106_imaginary_node__T_3125_en),
        .read_addr(_T_3106_imaginary_node__T_3125_addr),
        .write_clk(_T_3106_imaginary_node__T_3117_clk),
        .write_en(_T_3106_imaginary_node__T_3117_en),
        .write_mask(_T_3106_imaginary_node__T_3117_mask),
        .write_addr(_T_3106_imaginary_node__T_3117_addr),
        .write_data(_T_3106_imaginary_node__T_3117_data)
    );
    wire _T_3109;
    BITWISEAND #(.width(1)) bitwiseand_1020 (
        .y(_T_3109),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3106_real_node__T_3117_addr = 1'h0;
    assign _T_3106_real_node__T_3117_en = io_in_valid;
    assign _T_3106_real_node__T_3117_clk = clock;
    assign _T_3106_imaginary_node__T_3117_addr = 1'h0;
    assign _T_3106_imaginary_node__T_3117_en = io_in_valid;
    assign _T_3106_imaginary_node__T_3117_clk = clock;
    assign _T_3106_imaginary_node__T_3117_mask = 1'h1;
    assign _T_3106_real_node__T_3117_mask = 1'h1;
    assign _T_3106_real_node__T_3125_addr = 1'h0;
    assign _T_3106_real_node__T_3125_en = 1'h1;
    assign _T_3106_real_node__T_3125_clk = clock;
    assign _T_3106_imaginary_node__T_3125_addr = 1'h0;
    assign _T_3106_imaginary_node__T_3125_en = 1'h1;
    assign _T_3106_imaginary_node__T_3125_clk = clock;
    wire _T_3140_real_node__T_3151_clk;
    wire _T_3140_real_node__T_3151_en;
    wire _T_3140_real_node__T_3151_mask;
    wire _T_3140_real_node__T_3151_addr;
    wire [63:0] _T_3140_real_node__T_3151_data;
    wire [63:0] _T_3140_real_node__T_3159_data;
    wire _T_3140_real_node__T_3159_clk;
    wire _T_3140_real_node__T_3159_en;
    wire _T_3140_real_node__T_3159_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3140_real_node (
        .read_data(_T_3140_real_node__T_3159_data),
        .read_clk(_T_3140_real_node__T_3159_clk),
        .read_en(_T_3140_real_node__T_3159_en),
        .read_addr(_T_3140_real_node__T_3159_addr),
        .write_clk(_T_3140_real_node__T_3151_clk),
        .write_en(_T_3140_real_node__T_3151_en),
        .write_mask(_T_3140_real_node__T_3151_mask),
        .write_addr(_T_3140_real_node__T_3151_addr),
        .write_data(_T_3140_real_node__T_3151_data)
    );
    wire _T_3140_imaginary_node__T_3151_clk;
    wire _T_3140_imaginary_node__T_3151_en;
    wire _T_3140_imaginary_node__T_3151_mask;
    wire _T_3140_imaginary_node__T_3151_addr;
    wire [63:0] _T_3140_imaginary_node__T_3151_data;
    wire [63:0] _T_3140_imaginary_node__T_3159_data;
    wire _T_3140_imaginary_node__T_3159_clk;
    wire _T_3140_imaginary_node__T_3159_en;
    wire _T_3140_imaginary_node__T_3159_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3140_imaginary_node (
        .read_data(_T_3140_imaginary_node__T_3159_data),
        .read_clk(_T_3140_imaginary_node__T_3159_clk),
        .read_en(_T_3140_imaginary_node__T_3159_en),
        .read_addr(_T_3140_imaginary_node__T_3159_addr),
        .write_clk(_T_3140_imaginary_node__T_3151_clk),
        .write_en(_T_3140_imaginary_node__T_3151_en),
        .write_mask(_T_3140_imaginary_node__T_3151_mask),
        .write_addr(_T_3140_imaginary_node__T_3151_addr),
        .write_data(_T_3140_imaginary_node__T_3151_data)
    );
    wire _T_3143;
    BITWISEAND #(.width(1)) bitwiseand_1021 (
        .y(_T_3143),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3140_real_node__T_3151_addr = 1'h0;
    assign _T_3140_real_node__T_3151_en = io_in_valid;
    assign _T_3140_real_node__T_3151_clk = clock;
    assign _T_3140_imaginary_node__T_3151_addr = 1'h0;
    assign _T_3140_imaginary_node__T_3151_en = io_in_valid;
    assign _T_3140_imaginary_node__T_3151_clk = clock;
    assign _T_3140_imaginary_node__T_3151_mask = 1'h1;
    assign _T_3140_real_node__T_3151_mask = 1'h1;
    assign _T_3140_real_node__T_3159_addr = 1'h0;
    assign _T_3140_real_node__T_3159_en = 1'h1;
    assign _T_3140_real_node__T_3159_clk = clock;
    assign _T_3140_imaginary_node__T_3159_addr = 1'h0;
    assign _T_3140_imaginary_node__T_3159_en = 1'h1;
    assign _T_3140_imaginary_node__T_3159_clk = clock;
    wire [63:0] _T_3201_0_real_node;
    wire [63:0] _T_3201_0_imaginary_node;
    wire [63:0] _T_3201_1_real_node;
    wire [63:0] _T_3201_1_imaginary_node;
    wire _T_3242;
    BITS #(.width(1), .high(0), .low(0)) bits_1022 (
        .y(_T_3242),
        .in(sync_0)
    );
    wire _T_3244;
    wire [1:0] _T_3246;
    ADD_UNSIGNED #(.width(1)) u_add_1023 (
        .y(_T_3246),
        .a(_T_3242),
        .b(1'h0)
    );
    wire _T_3247;
    TAIL #(.width(2), .n(1)) tail_1024 (
        .y(_T_3247),
        .in(_T_3246)
    );
    wire _T_3262;
    wire [1:0] _T_3264;
    ADD_UNSIGNED #(.width(1)) u_add_1025 (
        .y(_T_3264),
        .a(_T_3242),
        .b(1'h1)
    );
    wire _T_3265;
    TAIL #(.width(2), .n(1)) tail_1026 (
        .y(_T_3265),
        .in(_T_3264)
    );
    wire [63:0] _T_3320_0_real_node;
    wire [63:0] _T_3320_0_imaginary_node;
    wire [63:0] _T_3320_1_real_node;
    wire [63:0] _T_3320_1_imaginary_node;
    wire _node_871;
    EQ_UNSIGNED #(.width(1)) u_eq_1027 (
        .y(_node_871),
        .a(1'd0),
        .b(_T_3244)
    );
    wire [63:0] _node_872;
    assign _node_872 = _T_3201_0_imaginary_node;
    wire _node_873;
    EQ_UNSIGNED #(.width(1)) u_eq_1028 (
        .y(_node_873),
        .a(1'd1),
        .b(_T_3244)
    );
    wire [63:0] _node_874;
    MUX_UNSIGNED #(.width(64)) u_mux_1029 (
        .y(_node_874),
        .sel(_node_873),
        .a(_T_3201_1_imaginary_node),
        .b(_node_872)
    );
    wire _node_875;
    EQ_UNSIGNED #(.width(1)) u_eq_1030 (
        .y(_node_875),
        .a(1'd0),
        .b(_T_3244)
    );
    wire [63:0] _node_876;
    assign _node_876 = _T_3201_0_real_node;
    wire _node_877;
    EQ_UNSIGNED #(.width(1)) u_eq_1031 (
        .y(_node_877),
        .a(1'd1),
        .b(_T_3244)
    );
    wire [63:0] _node_878;
    MUX_UNSIGNED #(.width(64)) u_mux_1032 (
        .y(_node_878),
        .sel(_node_877),
        .a(_T_3201_1_real_node),
        .b(_node_876)
    );
    wire _node_879;
    EQ_UNSIGNED #(.width(1)) u_eq_1033 (
        .y(_node_879),
        .a(1'd0),
        .b(_T_3262)
    );
    wire [63:0] _node_880;
    assign _node_880 = _T_3201_0_imaginary_node;
    wire _node_881;
    EQ_UNSIGNED #(.width(1)) u_eq_1034 (
        .y(_node_881),
        .a(1'd1),
        .b(_T_3262)
    );
    wire [63:0] _node_882;
    MUX_UNSIGNED #(.width(64)) u_mux_1035 (
        .y(_node_882),
        .sel(_node_881),
        .a(_T_3201_1_imaginary_node),
        .b(_node_880)
    );
    wire _node_883;
    EQ_UNSIGNED #(.width(1)) u_eq_1036 (
        .y(_node_883),
        .a(1'd0),
        .b(_T_3262)
    );
    wire [63:0] _node_884;
    assign _node_884 = _T_3201_0_real_node;
    wire _node_885;
    EQ_UNSIGNED #(.width(1)) u_eq_1037 (
        .y(_node_885),
        .a(1'd1),
        .b(_T_3262)
    );
    wire [63:0] _node_886;
    MUX_UNSIGNED #(.width(64)) u_mux_1038 (
        .y(_node_886),
        .sel(_node_885),
        .a(_T_3201_1_real_node),
        .b(_node_884)
    );
    wire _T_3375_real_node__T_3386_clk;
    wire _T_3375_real_node__T_3386_en;
    wire _T_3375_real_node__T_3386_mask;
    wire _T_3375_real_node__T_3386_addr;
    wire [63:0] _T_3375_real_node__T_3386_data;
    wire [63:0] _T_3375_real_node__T_3394_data;
    wire _T_3375_real_node__T_3394_clk;
    wire _T_3375_real_node__T_3394_en;
    wire _T_3375_real_node__T_3394_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3375_real_node (
        .read_data(_T_3375_real_node__T_3394_data),
        .read_clk(_T_3375_real_node__T_3394_clk),
        .read_en(_T_3375_real_node__T_3394_en),
        .read_addr(_T_3375_real_node__T_3394_addr),
        .write_clk(_T_3375_real_node__T_3386_clk),
        .write_en(_T_3375_real_node__T_3386_en),
        .write_mask(_T_3375_real_node__T_3386_mask),
        .write_addr(_T_3375_real_node__T_3386_addr),
        .write_data(_T_3375_real_node__T_3386_data)
    );
    wire _T_3375_imaginary_node__T_3386_clk;
    wire _T_3375_imaginary_node__T_3386_en;
    wire _T_3375_imaginary_node__T_3386_mask;
    wire _T_3375_imaginary_node__T_3386_addr;
    wire [63:0] _T_3375_imaginary_node__T_3386_data;
    wire [63:0] _T_3375_imaginary_node__T_3394_data;
    wire _T_3375_imaginary_node__T_3394_clk;
    wire _T_3375_imaginary_node__T_3394_en;
    wire _T_3375_imaginary_node__T_3394_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3375_imaginary_node (
        .read_data(_T_3375_imaginary_node__T_3394_data),
        .read_clk(_T_3375_imaginary_node__T_3394_clk),
        .read_en(_T_3375_imaginary_node__T_3394_en),
        .read_addr(_T_3375_imaginary_node__T_3394_addr),
        .write_clk(_T_3375_imaginary_node__T_3386_clk),
        .write_en(_T_3375_imaginary_node__T_3386_en),
        .write_mask(_T_3375_imaginary_node__T_3386_mask),
        .write_addr(_T_3375_imaginary_node__T_3386_addr),
        .write_data(_T_3375_imaginary_node__T_3386_data)
    );
    wire _T_3378;
    BITWISEAND #(.width(1)) bitwiseand_1039 (
        .y(_T_3378),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3375_real_node__T_3386_addr = 1'h0;
    assign _T_3375_real_node__T_3386_en = io_in_valid;
    assign _T_3375_real_node__T_3386_clk = clock;
    assign _T_3375_imaginary_node__T_3386_addr = 1'h0;
    assign _T_3375_imaginary_node__T_3386_en = io_in_valid;
    assign _T_3375_imaginary_node__T_3386_clk = clock;
    assign _T_3375_imaginary_node__T_3386_mask = 1'h1;
    assign _T_3375_real_node__T_3386_mask = 1'h1;
    assign _T_3375_real_node__T_3394_addr = 1'h0;
    assign _T_3375_real_node__T_3394_en = 1'h1;
    assign _T_3375_real_node__T_3394_clk = clock;
    assign _T_3375_imaginary_node__T_3394_addr = 1'h0;
    assign _T_3375_imaginary_node__T_3394_en = 1'h1;
    assign _T_3375_imaginary_node__T_3394_clk = clock;
    wire [63:0] _BBFMultiply_60_1__out;
    wire [63:0] _BBFMultiply_60_1__in2;
    wire [63:0] _BBFMultiply_60_1__in1;
    BBFMultiply BBFMultiply_60_1 (
        .out(_BBFMultiply_60_1__out),
        .in2(_BBFMultiply_60_1__in2),
        .in1(_BBFMultiply_60_1__in1)
    );
    wire [63:0] _T_3398_node;
    wire [63:0] _BBFMultiply_61_1__out;
    wire [63:0] _BBFMultiply_61_1__in2;
    wire [63:0] _BBFMultiply_61_1__in1;
    BBFMultiply BBFMultiply_61_1 (
        .out(_BBFMultiply_61_1__out),
        .in2(_BBFMultiply_61_1__in2),
        .in1(_BBFMultiply_61_1__in1)
    );
    wire [63:0] _T_3404_node;
    wire [63:0] _T_3410_node;
    wire [63:0] _BBFSubtract_52_1__out;
    wire [63:0] _BBFSubtract_52_1__in2;
    wire [63:0] _BBFSubtract_52_1__in1;
    BBFSubtract BBFSubtract_52_1 (
        .out(_BBFSubtract_52_1__out),
        .in2(_BBFSubtract_52_1__in2),
        .in1(_BBFSubtract_52_1__in1)
    );
    wire [63:0] _T_3417_node;
    wire [63:0] _BBFAdd_90_1__out;
    wire [63:0] _BBFAdd_90_1__in2;
    wire [63:0] _BBFAdd_90_1__in1;
    BBFAdd BBFAdd_90_1 (
        .out(_BBFAdd_90_1__out),
        .in2(_BBFAdd_90_1__in2),
        .in1(_BBFAdd_90_1__in1)
    );
    wire [63:0] _T_3423_node;
    wire [63:0] _BBFMultiply_62_1__out;
    wire [63:0] _BBFMultiply_62_1__in2;
    wire [63:0] _BBFMultiply_62_1__in1;
    BBFMultiply BBFMultiply_62_1 (
        .out(_BBFMultiply_62_1__out),
        .in2(_BBFMultiply_62_1__in2),
        .in1(_BBFMultiply_62_1__in1)
    );
    wire [63:0] _T_3429_node;
    wire [63:0] _BBFMultiply_63_1__out;
    wire [63:0] _BBFMultiply_63_1__in2;
    wire [63:0] _BBFMultiply_63_1__in1;
    BBFMultiply BBFMultiply_63_1 (
        .out(_BBFMultiply_63_1__out),
        .in2(_BBFMultiply_63_1__in2),
        .in1(_BBFMultiply_63_1__in1)
    );
    wire [63:0] _T_3435_node;
    wire [63:0] _BBFAdd_91_1__out;
    wire [63:0] _BBFAdd_91_1__in2;
    wire [63:0] _BBFAdd_91_1__in1;
    BBFAdd BBFAdd_91_1 (
        .out(_BBFAdd_91_1__out),
        .in2(_BBFAdd_91_1__in2),
        .in1(_BBFAdd_91_1__in1)
    );
    wire [63:0] _T_3441_node;
    wire [63:0] _T_3457_real_node;
    wire [63:0] _T_3457_imaginary_node;
    wire [63:0] _BBFAdd_92_1__out;
    wire [63:0] _BBFAdd_92_1__in2;
    wire [63:0] _BBFAdd_92_1__in1;
    BBFAdd BBFAdd_92_1 (
        .out(_BBFAdd_92_1__out),
        .in2(_BBFAdd_92_1__in2),
        .in1(_BBFAdd_92_1__in1)
    );
    wire [63:0] _T_3461_node;
    wire [63:0] _BBFAdd_93_1__out;
    wire [63:0] _BBFAdd_93_1__in2;
    wire [63:0] _BBFAdd_93_1__in1;
    BBFAdd BBFAdd_93_1 (
        .out(_BBFAdd_93_1__out),
        .in2(_BBFAdd_93_1__in2),
        .in1(_BBFAdd_93_1__in1)
    );
    wire [63:0] _T_3467_node;
    wire [63:0] _T_3483_real_node;
    wire [63:0] _T_3483_imaginary_node;
    wire [63:0] _T_3487_node;
    wire [63:0] _BBFSubtract_53_1__out;
    wire [63:0] _BBFSubtract_53_1__in2;
    wire [63:0] _BBFSubtract_53_1__in1;
    BBFSubtract BBFSubtract_53_1 (
        .out(_BBFSubtract_53_1__out),
        .in2(_BBFSubtract_53_1__in2),
        .in1(_BBFSubtract_53_1__in1)
    );
    wire [63:0] _T_3494_node;
    wire [63:0] _T_3500_node;
    wire [63:0] _BBFSubtract_54_1__out;
    wire [63:0] _BBFSubtract_54_1__in2;
    wire [63:0] _BBFSubtract_54_1__in1;
    BBFSubtract BBFSubtract_54_1 (
        .out(_BBFSubtract_54_1__out),
        .in2(_BBFSubtract_54_1__in2),
        .in1(_BBFSubtract_54_1__in1)
    );
    wire [63:0] _T_3507_node;
    wire [63:0] _T_3523_real_node;
    wire [63:0] _T_3523_imaginary_node;
    wire [63:0] _BBFAdd_94_1__out;
    wire [63:0] _BBFAdd_94_1__in2;
    wire [63:0] _BBFAdd_94_1__in1;
    BBFAdd BBFAdd_94_1 (
        .out(_BBFAdd_94_1__out),
        .in2(_BBFAdd_94_1__in2),
        .in1(_BBFAdd_94_1__in1)
    );
    wire [63:0] _T_3527_node;
    wire [63:0] _BBFAdd_95_1__out;
    wire [63:0] _BBFAdd_95_1__in2;
    wire [63:0] _BBFAdd_95_1__in1;
    BBFAdd BBFAdd_95_1 (
        .out(_BBFAdd_95_1__out),
        .in2(_BBFAdd_95_1__in2),
        .in1(_BBFAdd_95_1__in1)
    );
    wire [63:0] _T_3533_node;
    wire [63:0] _T_3549_real_node;
    wire [63:0] _T_3549_imaginary_node;
    wire _T_3564_real_node__T_3575_clk;
    wire _T_3564_real_node__T_3575_en;
    wire _T_3564_real_node__T_3575_mask;
    wire _T_3564_real_node__T_3575_addr;
    wire [63:0] _T_3564_real_node__T_3575_data;
    wire [63:0] _T_3564_real_node__T_3583_data;
    wire _T_3564_real_node__T_3583_clk;
    wire _T_3564_real_node__T_3583_en;
    wire _T_3564_real_node__T_3583_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3564_real_node (
        .read_data(_T_3564_real_node__T_3583_data),
        .read_clk(_T_3564_real_node__T_3583_clk),
        .read_en(_T_3564_real_node__T_3583_en),
        .read_addr(_T_3564_real_node__T_3583_addr),
        .write_clk(_T_3564_real_node__T_3575_clk),
        .write_en(_T_3564_real_node__T_3575_en),
        .write_mask(_T_3564_real_node__T_3575_mask),
        .write_addr(_T_3564_real_node__T_3575_addr),
        .write_data(_T_3564_real_node__T_3575_data)
    );
    wire _T_3564_imaginary_node__T_3575_clk;
    wire _T_3564_imaginary_node__T_3575_en;
    wire _T_3564_imaginary_node__T_3575_mask;
    wire _T_3564_imaginary_node__T_3575_addr;
    wire [63:0] _T_3564_imaginary_node__T_3575_data;
    wire [63:0] _T_3564_imaginary_node__T_3583_data;
    wire _T_3564_imaginary_node__T_3583_clk;
    wire _T_3564_imaginary_node__T_3583_en;
    wire _T_3564_imaginary_node__T_3583_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3564_imaginary_node (
        .read_data(_T_3564_imaginary_node__T_3583_data),
        .read_clk(_T_3564_imaginary_node__T_3583_clk),
        .read_en(_T_3564_imaginary_node__T_3583_en),
        .read_addr(_T_3564_imaginary_node__T_3583_addr),
        .write_clk(_T_3564_imaginary_node__T_3575_clk),
        .write_en(_T_3564_imaginary_node__T_3575_en),
        .write_mask(_T_3564_imaginary_node__T_3575_mask),
        .write_addr(_T_3564_imaginary_node__T_3575_addr),
        .write_data(_T_3564_imaginary_node__T_3575_data)
    );
    wire _T_3567;
    BITWISEAND #(.width(1)) bitwiseand_1040 (
        .y(_T_3567),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3564_real_node__T_3575_addr = 1'h0;
    assign _T_3564_real_node__T_3575_en = io_in_valid;
    assign _T_3564_real_node__T_3575_clk = clock;
    assign _T_3564_imaginary_node__T_3575_addr = 1'h0;
    assign _T_3564_imaginary_node__T_3575_en = io_in_valid;
    assign _T_3564_imaginary_node__T_3575_clk = clock;
    assign _T_3564_imaginary_node__T_3575_mask = 1'h1;
    assign _T_3564_real_node__T_3575_mask = 1'h1;
    assign _T_3564_real_node__T_3583_addr = 1'h0;
    assign _T_3564_real_node__T_3583_en = 1'h1;
    assign _T_3564_real_node__T_3583_clk = clock;
    assign _T_3564_imaginary_node__T_3583_addr = 1'h0;
    assign _T_3564_imaginary_node__T_3583_en = 1'h1;
    assign _T_3564_imaginary_node__T_3583_clk = clock;
    wire _T_3598_real_node__T_3609_clk;
    wire _T_3598_real_node__T_3609_en;
    wire _T_3598_real_node__T_3609_mask;
    wire _T_3598_real_node__T_3609_addr;
    wire [63:0] _T_3598_real_node__T_3609_data;
    wire [63:0] _T_3598_real_node__T_3617_data;
    wire _T_3598_real_node__T_3617_clk;
    wire _T_3598_real_node__T_3617_en;
    wire _T_3598_real_node__T_3617_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3598_real_node (
        .read_data(_T_3598_real_node__T_3617_data),
        .read_clk(_T_3598_real_node__T_3617_clk),
        .read_en(_T_3598_real_node__T_3617_en),
        .read_addr(_T_3598_real_node__T_3617_addr),
        .write_clk(_T_3598_real_node__T_3609_clk),
        .write_en(_T_3598_real_node__T_3609_en),
        .write_mask(_T_3598_real_node__T_3609_mask),
        .write_addr(_T_3598_real_node__T_3609_addr),
        .write_data(_T_3598_real_node__T_3609_data)
    );
    wire _T_3598_imaginary_node__T_3609_clk;
    wire _T_3598_imaginary_node__T_3609_en;
    wire _T_3598_imaginary_node__T_3609_mask;
    wire _T_3598_imaginary_node__T_3609_addr;
    wire [63:0] _T_3598_imaginary_node__T_3609_data;
    wire [63:0] _T_3598_imaginary_node__T_3617_data;
    wire _T_3598_imaginary_node__T_3617_clk;
    wire _T_3598_imaginary_node__T_3617_en;
    wire _T_3598_imaginary_node__T_3617_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3598_imaginary_node (
        .read_data(_T_3598_imaginary_node__T_3617_data),
        .read_clk(_T_3598_imaginary_node__T_3617_clk),
        .read_en(_T_3598_imaginary_node__T_3617_en),
        .read_addr(_T_3598_imaginary_node__T_3617_addr),
        .write_clk(_T_3598_imaginary_node__T_3609_clk),
        .write_en(_T_3598_imaginary_node__T_3609_en),
        .write_mask(_T_3598_imaginary_node__T_3609_mask),
        .write_addr(_T_3598_imaginary_node__T_3609_addr),
        .write_data(_T_3598_imaginary_node__T_3609_data)
    );
    wire _T_3601;
    BITWISEAND #(.width(1)) bitwiseand_1041 (
        .y(_T_3601),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3598_real_node__T_3609_addr = 1'h0;
    assign _T_3598_real_node__T_3609_en = io_in_valid;
    assign _T_3598_real_node__T_3609_clk = clock;
    assign _T_3598_imaginary_node__T_3609_addr = 1'h0;
    assign _T_3598_imaginary_node__T_3609_en = io_in_valid;
    assign _T_3598_imaginary_node__T_3609_clk = clock;
    assign _T_3598_imaginary_node__T_3609_mask = 1'h1;
    assign _T_3598_real_node__T_3609_mask = 1'h1;
    assign _T_3598_real_node__T_3617_addr = 1'h0;
    assign _T_3598_real_node__T_3617_en = 1'h1;
    assign _T_3598_real_node__T_3617_clk = clock;
    assign _T_3598_imaginary_node__T_3617_addr = 1'h0;
    assign _T_3598_imaginary_node__T_3617_en = 1'h1;
    assign _T_3598_imaginary_node__T_3617_clk = clock;
    wire _T_3632_real_node__T_3643_clk;
    wire _T_3632_real_node__T_3643_en;
    wire _T_3632_real_node__T_3643_mask;
    wire _T_3632_real_node__T_3643_addr;
    wire [63:0] _T_3632_real_node__T_3643_data;
    wire [63:0] _T_3632_real_node__T_3651_data;
    wire _T_3632_real_node__T_3651_clk;
    wire _T_3632_real_node__T_3651_en;
    wire _T_3632_real_node__T_3651_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3632_real_node (
        .read_data(_T_3632_real_node__T_3651_data),
        .read_clk(_T_3632_real_node__T_3651_clk),
        .read_en(_T_3632_real_node__T_3651_en),
        .read_addr(_T_3632_real_node__T_3651_addr),
        .write_clk(_T_3632_real_node__T_3643_clk),
        .write_en(_T_3632_real_node__T_3643_en),
        .write_mask(_T_3632_real_node__T_3643_mask),
        .write_addr(_T_3632_real_node__T_3643_addr),
        .write_data(_T_3632_real_node__T_3643_data)
    );
    wire _T_3632_imaginary_node__T_3643_clk;
    wire _T_3632_imaginary_node__T_3643_en;
    wire _T_3632_imaginary_node__T_3643_mask;
    wire _T_3632_imaginary_node__T_3643_addr;
    wire [63:0] _T_3632_imaginary_node__T_3643_data;
    wire [63:0] _T_3632_imaginary_node__T_3651_data;
    wire _T_3632_imaginary_node__T_3651_clk;
    wire _T_3632_imaginary_node__T_3651_en;
    wire _T_3632_imaginary_node__T_3651_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3632_imaginary_node (
        .read_data(_T_3632_imaginary_node__T_3651_data),
        .read_clk(_T_3632_imaginary_node__T_3651_clk),
        .read_en(_T_3632_imaginary_node__T_3651_en),
        .read_addr(_T_3632_imaginary_node__T_3651_addr),
        .write_clk(_T_3632_imaginary_node__T_3643_clk),
        .write_en(_T_3632_imaginary_node__T_3643_en),
        .write_mask(_T_3632_imaginary_node__T_3643_mask),
        .write_addr(_T_3632_imaginary_node__T_3643_addr),
        .write_data(_T_3632_imaginary_node__T_3643_data)
    );
    wire _T_3635;
    BITWISEAND #(.width(1)) bitwiseand_1042 (
        .y(_T_3635),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3632_real_node__T_3643_addr = 1'h0;
    assign _T_3632_real_node__T_3643_en = io_in_valid;
    assign _T_3632_real_node__T_3643_clk = clock;
    assign _T_3632_imaginary_node__T_3643_addr = 1'h0;
    assign _T_3632_imaginary_node__T_3643_en = io_in_valid;
    assign _T_3632_imaginary_node__T_3643_clk = clock;
    assign _T_3632_imaginary_node__T_3643_mask = 1'h1;
    assign _T_3632_real_node__T_3643_mask = 1'h1;
    assign _T_3632_real_node__T_3651_addr = 1'h0;
    assign _T_3632_real_node__T_3651_en = 1'h1;
    assign _T_3632_real_node__T_3651_clk = clock;
    assign _T_3632_imaginary_node__T_3651_addr = 1'h0;
    assign _T_3632_imaginary_node__T_3651_en = 1'h1;
    assign _T_3632_imaginary_node__T_3651_clk = clock;
    wire [63:0] _T_3693_0_real_node;
    wire [63:0] _T_3693_0_imaginary_node;
    wire [63:0] _T_3693_1_real_node;
    wire [63:0] _T_3693_1_imaginary_node;
    wire _T_3734;
    BITS #(.width(1), .high(0), .low(0)) bits_1043 (
        .y(_T_3734),
        .in(sync_1)
    );
    wire _T_3737__T_3742_clk;
    wire _T_3737__T_3742_en;
    wire _T_3737__T_3742_mask;
    wire _T_3737__T_3742_addr;
    wire _T_3737__T_3742_data;
    wire _T_3737__T_3744_data;
    wire _T_3737__T_3744_clk;
    wire _T_3737__T_3744_en;
    wire _T_3737__T_3744_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(1), .isSyncRead(0)) _T_3737 (
        .read_data(_T_3737__T_3744_data),
        .read_clk(_T_3737__T_3744_clk),
        .read_en(_T_3737__T_3744_en),
        .read_addr(_T_3737__T_3744_addr),
        .write_clk(_T_3737__T_3742_clk),
        .write_en(_T_3737__T_3742_en),
        .write_mask(_T_3737__T_3742_mask),
        .write_addr(_T_3737__T_3742_addr),
        .write_data(_T_3737__T_3742_data)
    );
    wire _T_3740;
    BITWISEAND #(.width(1)) bitwiseand_1044 (
        .y(_T_3740),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3737__T_3742_addr = 1'h0;
    assign _T_3737__T_3742_en = io_in_valid;
    assign _T_3737__T_3742_clk = clock;
    assign _T_3737__T_3742_mask = 1'h1;
    assign _T_3737__T_3744_addr = 1'h0;
    assign _T_3737__T_3744_en = 1'h1;
    assign _T_3737__T_3744_clk = clock;
    wire _T_3746;
    wire [1:0] _T_3748;
    ADD_UNSIGNED #(.width(1)) u_add_1045 (
        .y(_T_3748),
        .a(_T_3737__T_3744_data),
        .b(1'h0)
    );
    wire _T_3749;
    TAIL #(.width(2), .n(1)) tail_1046 (
        .y(_T_3749),
        .in(_T_3748)
    );
    wire _T_3764;
    wire [1:0] _T_3766;
    ADD_UNSIGNED #(.width(1)) u_add_1047 (
        .y(_T_3766),
        .a(_T_3737__T_3744_data),
        .b(1'h1)
    );
    wire _T_3767;
    TAIL #(.width(2), .n(1)) tail_1048 (
        .y(_T_3767),
        .in(_T_3766)
    );
    wire [63:0] _T_3822_0_real_node;
    wire [63:0] _T_3822_0_imaginary_node;
    wire [63:0] _T_3822_1_real_node;
    wire [63:0] _T_3822_1_imaginary_node;
    wire _node_887;
    EQ_UNSIGNED #(.width(1)) u_eq_1049 (
        .y(_node_887),
        .a(1'd0),
        .b(_T_3746)
    );
    wire [63:0] _node_888;
    assign _node_888 = _T_3693_0_imaginary_node;
    wire _node_889;
    EQ_UNSIGNED #(.width(1)) u_eq_1050 (
        .y(_node_889),
        .a(1'd1),
        .b(_T_3746)
    );
    wire [63:0] _node_890;
    MUX_UNSIGNED #(.width(64)) u_mux_1051 (
        .y(_node_890),
        .sel(_node_889),
        .a(_T_3693_1_imaginary_node),
        .b(_node_888)
    );
    wire _node_891;
    EQ_UNSIGNED #(.width(1)) u_eq_1052 (
        .y(_node_891),
        .a(1'd0),
        .b(_T_3746)
    );
    wire [63:0] _node_892;
    assign _node_892 = _T_3693_0_real_node;
    wire _node_893;
    EQ_UNSIGNED #(.width(1)) u_eq_1053 (
        .y(_node_893),
        .a(1'd1),
        .b(_T_3746)
    );
    wire [63:0] _node_894;
    MUX_UNSIGNED #(.width(64)) u_mux_1054 (
        .y(_node_894),
        .sel(_node_893),
        .a(_T_3693_1_real_node),
        .b(_node_892)
    );
    wire _node_895;
    EQ_UNSIGNED #(.width(1)) u_eq_1055 (
        .y(_node_895),
        .a(1'd0),
        .b(_T_3764)
    );
    wire [63:0] _node_896;
    assign _node_896 = _T_3693_0_imaginary_node;
    wire _node_897;
    EQ_UNSIGNED #(.width(1)) u_eq_1056 (
        .y(_node_897),
        .a(1'd1),
        .b(_T_3764)
    );
    wire [63:0] _node_898;
    MUX_UNSIGNED #(.width(64)) u_mux_1057 (
        .y(_node_898),
        .sel(_node_897),
        .a(_T_3693_1_imaginary_node),
        .b(_node_896)
    );
    wire _node_899;
    EQ_UNSIGNED #(.width(1)) u_eq_1058 (
        .y(_node_899),
        .a(1'd0),
        .b(_T_3764)
    );
    wire [63:0] _node_900;
    assign _node_900 = _T_3693_0_real_node;
    wire _node_901;
    EQ_UNSIGNED #(.width(1)) u_eq_1059 (
        .y(_node_901),
        .a(1'd1),
        .b(_T_3764)
    );
    wire [63:0] _node_902;
    MUX_UNSIGNED #(.width(64)) u_mux_1060 (
        .y(_node_902),
        .sel(_node_901),
        .a(_T_3693_1_real_node),
        .b(_node_900)
    );
    wire _T_3877_real_node__T_3888_clk;
    wire _T_3877_real_node__T_3888_en;
    wire _T_3877_real_node__T_3888_mask;
    wire _T_3877_real_node__T_3888_addr;
    wire [63:0] _T_3877_real_node__T_3888_data;
    wire [63:0] _T_3877_real_node__T_3896_data;
    wire _T_3877_real_node__T_3896_clk;
    wire _T_3877_real_node__T_3896_en;
    wire _T_3877_real_node__T_3896_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3877_real_node (
        .read_data(_T_3877_real_node__T_3896_data),
        .read_clk(_T_3877_real_node__T_3896_clk),
        .read_en(_T_3877_real_node__T_3896_en),
        .read_addr(_T_3877_real_node__T_3896_addr),
        .write_clk(_T_3877_real_node__T_3888_clk),
        .write_en(_T_3877_real_node__T_3888_en),
        .write_mask(_T_3877_real_node__T_3888_mask),
        .write_addr(_T_3877_real_node__T_3888_addr),
        .write_data(_T_3877_real_node__T_3888_data)
    );
    wire _T_3877_imaginary_node__T_3888_clk;
    wire _T_3877_imaginary_node__T_3888_en;
    wire _T_3877_imaginary_node__T_3888_mask;
    wire _T_3877_imaginary_node__T_3888_addr;
    wire [63:0] _T_3877_imaginary_node__T_3888_data;
    wire [63:0] _T_3877_imaginary_node__T_3896_data;
    wire _T_3877_imaginary_node__T_3896_clk;
    wire _T_3877_imaginary_node__T_3896_en;
    wire _T_3877_imaginary_node__T_3896_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3877_imaginary_node (
        .read_data(_T_3877_imaginary_node__T_3896_data),
        .read_clk(_T_3877_imaginary_node__T_3896_clk),
        .read_en(_T_3877_imaginary_node__T_3896_en),
        .read_addr(_T_3877_imaginary_node__T_3896_addr),
        .write_clk(_T_3877_imaginary_node__T_3888_clk),
        .write_en(_T_3877_imaginary_node__T_3888_en),
        .write_mask(_T_3877_imaginary_node__T_3888_mask),
        .write_addr(_T_3877_imaginary_node__T_3888_addr),
        .write_data(_T_3877_imaginary_node__T_3888_data)
    );
    wire _T_3880;
    BITWISEAND #(.width(1)) bitwiseand_1061 (
        .y(_T_3880),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3877_real_node__T_3888_addr = 1'h0;
    assign _T_3877_real_node__T_3888_en = io_in_valid;
    assign _T_3877_real_node__T_3888_clk = clock;
    assign _T_3877_imaginary_node__T_3888_addr = 1'h0;
    assign _T_3877_imaginary_node__T_3888_en = io_in_valid;
    assign _T_3877_imaginary_node__T_3888_clk = clock;
    assign _T_3877_imaginary_node__T_3888_mask = 1'h1;
    assign _T_3877_real_node__T_3888_mask = 1'h1;
    assign _T_3877_real_node__T_3896_addr = 1'h0;
    assign _T_3877_real_node__T_3896_en = 1'h1;
    assign _T_3877_real_node__T_3896_clk = clock;
    assign _T_3877_imaginary_node__T_3896_addr = 1'h0;
    assign _T_3877_imaginary_node__T_3896_en = 1'h1;
    assign _T_3877_imaginary_node__T_3896_clk = clock;
    wire _T_3911_real_node__T_3922_clk;
    wire _T_3911_real_node__T_3922_en;
    wire _T_3911_real_node__T_3922_mask;
    wire _T_3911_real_node__T_3922_addr;
    wire [63:0] _T_3911_real_node__T_3922_data;
    wire [63:0] _T_3911_real_node__T_3930_data;
    wire _T_3911_real_node__T_3930_clk;
    wire _T_3911_real_node__T_3930_en;
    wire _T_3911_real_node__T_3930_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3911_real_node (
        .read_data(_T_3911_real_node__T_3930_data),
        .read_clk(_T_3911_real_node__T_3930_clk),
        .read_en(_T_3911_real_node__T_3930_en),
        .read_addr(_T_3911_real_node__T_3930_addr),
        .write_clk(_T_3911_real_node__T_3922_clk),
        .write_en(_T_3911_real_node__T_3922_en),
        .write_mask(_T_3911_real_node__T_3922_mask),
        .write_addr(_T_3911_real_node__T_3922_addr),
        .write_data(_T_3911_real_node__T_3922_data)
    );
    wire _T_3911_imaginary_node__T_3922_clk;
    wire _T_3911_imaginary_node__T_3922_en;
    wire _T_3911_imaginary_node__T_3922_mask;
    wire _T_3911_imaginary_node__T_3922_addr;
    wire [63:0] _T_3911_imaginary_node__T_3922_data;
    wire [63:0] _T_3911_imaginary_node__T_3930_data;
    wire _T_3911_imaginary_node__T_3930_clk;
    wire _T_3911_imaginary_node__T_3930_en;
    wire _T_3911_imaginary_node__T_3930_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_3911_imaginary_node (
        .read_data(_T_3911_imaginary_node__T_3930_data),
        .read_clk(_T_3911_imaginary_node__T_3930_clk),
        .read_en(_T_3911_imaginary_node__T_3930_en),
        .read_addr(_T_3911_imaginary_node__T_3930_addr),
        .write_clk(_T_3911_imaginary_node__T_3922_clk),
        .write_en(_T_3911_imaginary_node__T_3922_en),
        .write_mask(_T_3911_imaginary_node__T_3922_mask),
        .write_addr(_T_3911_imaginary_node__T_3922_addr),
        .write_data(_T_3911_imaginary_node__T_3922_data)
    );
    wire _T_3914;
    BITWISEAND #(.width(1)) bitwiseand_1062 (
        .y(_T_3914),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_3911_real_node__T_3922_addr = 1'h0;
    assign _T_3911_real_node__T_3922_en = io_in_valid;
    assign _T_3911_real_node__T_3922_clk = clock;
    assign _T_3911_imaginary_node__T_3922_addr = 1'h0;
    assign _T_3911_imaginary_node__T_3922_en = io_in_valid;
    assign _T_3911_imaginary_node__T_3922_clk = clock;
    assign _T_3911_imaginary_node__T_3922_mask = 1'h1;
    assign _T_3911_real_node__T_3922_mask = 1'h1;
    assign _T_3911_real_node__T_3930_addr = 1'h0;
    assign _T_3911_real_node__T_3930_en = 1'h1;
    assign _T_3911_real_node__T_3930_clk = clock;
    assign _T_3911_imaginary_node__T_3930_addr = 1'h0;
    assign _T_3911_imaginary_node__T_3930_en = 1'h1;
    assign _T_3911_imaginary_node__T_3930_clk = clock;
    wire [63:0] _T_3972_0_real_node;
    wire [63:0] _T_3972_0_imaginary_node;
    wire [63:0] _T_3972_1_real_node;
    wire [63:0] _T_3972_1_imaginary_node;
    wire _T_4013;
    BITS #(.width(1), .high(0), .low(0)) bits_1063 (
        .y(_T_4013),
        .in(sync_1)
    );
    wire _T_4016__T_4021_clk;
    wire _T_4016__T_4021_en;
    wire _T_4016__T_4021_mask;
    wire _T_4016__T_4021_addr;
    wire _T_4016__T_4021_data;
    wire _T_4016__T_4023_data;
    wire _T_4016__T_4023_clk;
    wire _T_4016__T_4023_en;
    wire _T_4016__T_4023_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(1), .isSyncRead(0)) _T_4016 (
        .read_data(_T_4016__T_4023_data),
        .read_clk(_T_4016__T_4023_clk),
        .read_en(_T_4016__T_4023_en),
        .read_addr(_T_4016__T_4023_addr),
        .write_clk(_T_4016__T_4021_clk),
        .write_en(_T_4016__T_4021_en),
        .write_mask(_T_4016__T_4021_mask),
        .write_addr(_T_4016__T_4021_addr),
        .write_data(_T_4016__T_4021_data)
    );
    wire _T_4019;
    BITWISEAND #(.width(1)) bitwiseand_1064 (
        .y(_T_4019),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4016__T_4021_addr = 1'h0;
    assign _T_4016__T_4021_en = io_in_valid;
    assign _T_4016__T_4021_clk = clock;
    assign _T_4016__T_4021_mask = 1'h1;
    assign _T_4016__T_4023_addr = 1'h0;
    assign _T_4016__T_4023_en = 1'h1;
    assign _T_4016__T_4023_clk = clock;
    wire _T_4025;
    wire [1:0] _T_4027;
    ADD_UNSIGNED #(.width(1)) u_add_1065 (
        .y(_T_4027),
        .a(_T_4016__T_4023_data),
        .b(1'h0)
    );
    wire _T_4028;
    TAIL #(.width(2), .n(1)) tail_1066 (
        .y(_T_4028),
        .in(_T_4027)
    );
    wire _T_4043;
    wire [1:0] _T_4045;
    ADD_UNSIGNED #(.width(1)) u_add_1067 (
        .y(_T_4045),
        .a(_T_4016__T_4023_data),
        .b(1'h1)
    );
    wire _T_4046;
    TAIL #(.width(2), .n(1)) tail_1068 (
        .y(_T_4046),
        .in(_T_4045)
    );
    wire [63:0] _T_4101_0_real_node;
    wire [63:0] _T_4101_0_imaginary_node;
    wire [63:0] _T_4101_1_real_node;
    wire [63:0] _T_4101_1_imaginary_node;
    wire _node_903;
    EQ_UNSIGNED #(.width(1)) u_eq_1069 (
        .y(_node_903),
        .a(1'd0),
        .b(_T_4025)
    );
    wire [63:0] _node_904;
    assign _node_904 = _T_3972_0_imaginary_node;
    wire _node_905;
    EQ_UNSIGNED #(.width(1)) u_eq_1070 (
        .y(_node_905),
        .a(1'd1),
        .b(_T_4025)
    );
    wire [63:0] _node_906;
    MUX_UNSIGNED #(.width(64)) u_mux_1071 (
        .y(_node_906),
        .sel(_node_905),
        .a(_T_3972_1_imaginary_node),
        .b(_node_904)
    );
    wire _node_907;
    EQ_UNSIGNED #(.width(1)) u_eq_1072 (
        .y(_node_907),
        .a(1'd0),
        .b(_T_4025)
    );
    wire [63:0] _node_908;
    assign _node_908 = _T_3972_0_real_node;
    wire _node_909;
    EQ_UNSIGNED #(.width(1)) u_eq_1073 (
        .y(_node_909),
        .a(1'd1),
        .b(_T_4025)
    );
    wire [63:0] _node_910;
    MUX_UNSIGNED #(.width(64)) u_mux_1074 (
        .y(_node_910),
        .sel(_node_909),
        .a(_T_3972_1_real_node),
        .b(_node_908)
    );
    wire _node_911;
    EQ_UNSIGNED #(.width(1)) u_eq_1075 (
        .y(_node_911),
        .a(1'd0),
        .b(_T_4043)
    );
    wire [63:0] _node_912;
    assign _node_912 = _T_3972_0_imaginary_node;
    wire _node_913;
    EQ_UNSIGNED #(.width(1)) u_eq_1076 (
        .y(_node_913),
        .a(1'd1),
        .b(_T_4043)
    );
    wire [63:0] _node_914;
    MUX_UNSIGNED #(.width(64)) u_mux_1077 (
        .y(_node_914),
        .sel(_node_913),
        .a(_T_3972_1_imaginary_node),
        .b(_node_912)
    );
    wire _node_915;
    EQ_UNSIGNED #(.width(1)) u_eq_1078 (
        .y(_node_915),
        .a(1'd0),
        .b(_T_4043)
    );
    wire [63:0] _node_916;
    assign _node_916 = _T_3972_0_real_node;
    wire _node_917;
    EQ_UNSIGNED #(.width(1)) u_eq_1079 (
        .y(_node_917),
        .a(1'd1),
        .b(_T_4043)
    );
    wire [63:0] _node_918;
    MUX_UNSIGNED #(.width(64)) u_mux_1080 (
        .y(_node_918),
        .sel(_node_917),
        .a(_T_3972_1_real_node),
        .b(_node_916)
    );
    wire _T_4156_real_node__T_4167_clk;
    wire _T_4156_real_node__T_4167_en;
    wire _T_4156_real_node__T_4167_mask;
    wire _T_4156_real_node__T_4167_addr;
    wire [63:0] _T_4156_real_node__T_4167_data;
    wire [63:0] _T_4156_real_node__T_4175_data;
    wire _T_4156_real_node__T_4175_clk;
    wire _T_4156_real_node__T_4175_en;
    wire _T_4156_real_node__T_4175_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4156_real_node (
        .read_data(_T_4156_real_node__T_4175_data),
        .read_clk(_T_4156_real_node__T_4175_clk),
        .read_en(_T_4156_real_node__T_4175_en),
        .read_addr(_T_4156_real_node__T_4175_addr),
        .write_clk(_T_4156_real_node__T_4167_clk),
        .write_en(_T_4156_real_node__T_4167_en),
        .write_mask(_T_4156_real_node__T_4167_mask),
        .write_addr(_T_4156_real_node__T_4167_addr),
        .write_data(_T_4156_real_node__T_4167_data)
    );
    wire _T_4156_imaginary_node__T_4167_clk;
    wire _T_4156_imaginary_node__T_4167_en;
    wire _T_4156_imaginary_node__T_4167_mask;
    wire _T_4156_imaginary_node__T_4167_addr;
    wire [63:0] _T_4156_imaginary_node__T_4167_data;
    wire [63:0] _T_4156_imaginary_node__T_4175_data;
    wire _T_4156_imaginary_node__T_4175_clk;
    wire _T_4156_imaginary_node__T_4175_en;
    wire _T_4156_imaginary_node__T_4175_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4156_imaginary_node (
        .read_data(_T_4156_imaginary_node__T_4175_data),
        .read_clk(_T_4156_imaginary_node__T_4175_clk),
        .read_en(_T_4156_imaginary_node__T_4175_en),
        .read_addr(_T_4156_imaginary_node__T_4175_addr),
        .write_clk(_T_4156_imaginary_node__T_4167_clk),
        .write_en(_T_4156_imaginary_node__T_4167_en),
        .write_mask(_T_4156_imaginary_node__T_4167_mask),
        .write_addr(_T_4156_imaginary_node__T_4167_addr),
        .write_data(_T_4156_imaginary_node__T_4167_data)
    );
    wire _T_4159;
    BITWISEAND #(.width(1)) bitwiseand_1081 (
        .y(_T_4159),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4156_real_node__T_4167_addr = 1'h0;
    assign _T_4156_real_node__T_4167_en = io_in_valid;
    assign _T_4156_real_node__T_4167_clk = clock;
    assign _T_4156_imaginary_node__T_4167_addr = 1'h0;
    assign _T_4156_imaginary_node__T_4167_en = io_in_valid;
    assign _T_4156_imaginary_node__T_4167_clk = clock;
    assign _T_4156_imaginary_node__T_4167_mask = 1'h1;
    assign _T_4156_real_node__T_4167_mask = 1'h1;
    assign _T_4156_real_node__T_4175_addr = 1'h0;
    assign _T_4156_real_node__T_4175_en = 1'h1;
    assign _T_4156_real_node__T_4175_clk = clock;
    assign _T_4156_imaginary_node__T_4175_addr = 1'h0;
    assign _T_4156_imaginary_node__T_4175_en = 1'h1;
    assign _T_4156_imaginary_node__T_4175_clk = clock;
    wire _T_4190_real_node__T_4201_clk;
    wire _T_4190_real_node__T_4201_en;
    wire _T_4190_real_node__T_4201_mask;
    wire _T_4190_real_node__T_4201_addr;
    wire [63:0] _T_4190_real_node__T_4201_data;
    wire [63:0] _T_4190_real_node__T_4209_data;
    wire _T_4190_real_node__T_4209_clk;
    wire _T_4190_real_node__T_4209_en;
    wire _T_4190_real_node__T_4209_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4190_real_node (
        .read_data(_T_4190_real_node__T_4209_data),
        .read_clk(_T_4190_real_node__T_4209_clk),
        .read_en(_T_4190_real_node__T_4209_en),
        .read_addr(_T_4190_real_node__T_4209_addr),
        .write_clk(_T_4190_real_node__T_4201_clk),
        .write_en(_T_4190_real_node__T_4201_en),
        .write_mask(_T_4190_real_node__T_4201_mask),
        .write_addr(_T_4190_real_node__T_4201_addr),
        .write_data(_T_4190_real_node__T_4201_data)
    );
    wire _T_4190_imaginary_node__T_4201_clk;
    wire _T_4190_imaginary_node__T_4201_en;
    wire _T_4190_imaginary_node__T_4201_mask;
    wire _T_4190_imaginary_node__T_4201_addr;
    wire [63:0] _T_4190_imaginary_node__T_4201_data;
    wire [63:0] _T_4190_imaginary_node__T_4209_data;
    wire _T_4190_imaginary_node__T_4209_clk;
    wire _T_4190_imaginary_node__T_4209_en;
    wire _T_4190_imaginary_node__T_4209_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4190_imaginary_node (
        .read_data(_T_4190_imaginary_node__T_4209_data),
        .read_clk(_T_4190_imaginary_node__T_4209_clk),
        .read_en(_T_4190_imaginary_node__T_4209_en),
        .read_addr(_T_4190_imaginary_node__T_4209_addr),
        .write_clk(_T_4190_imaginary_node__T_4201_clk),
        .write_en(_T_4190_imaginary_node__T_4201_en),
        .write_mask(_T_4190_imaginary_node__T_4201_mask),
        .write_addr(_T_4190_imaginary_node__T_4201_addr),
        .write_data(_T_4190_imaginary_node__T_4201_data)
    );
    wire _T_4193;
    BITWISEAND #(.width(1)) bitwiseand_1082 (
        .y(_T_4193),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4190_real_node__T_4201_addr = 1'h0;
    assign _T_4190_real_node__T_4201_en = io_in_valid;
    assign _T_4190_real_node__T_4201_clk = clock;
    assign _T_4190_imaginary_node__T_4201_addr = 1'h0;
    assign _T_4190_imaginary_node__T_4201_en = io_in_valid;
    assign _T_4190_imaginary_node__T_4201_clk = clock;
    assign _T_4190_imaginary_node__T_4201_mask = 1'h1;
    assign _T_4190_real_node__T_4201_mask = 1'h1;
    assign _T_4190_real_node__T_4209_addr = 1'h0;
    assign _T_4190_real_node__T_4209_en = 1'h1;
    assign _T_4190_real_node__T_4209_clk = clock;
    assign _T_4190_imaginary_node__T_4209_addr = 1'h0;
    assign _T_4190_imaginary_node__T_4209_en = 1'h1;
    assign _T_4190_imaginary_node__T_4209_clk = clock;
    wire [63:0] _T_4251_0_real_node;
    wire [63:0] _T_4251_0_imaginary_node;
    wire [63:0] _T_4251_1_real_node;
    wire [63:0] _T_4251_1_imaginary_node;
    wire _T_4292;
    BITS #(.width(1), .high(0), .low(0)) bits_1083 (
        .y(_T_4292),
        .in(sync_1)
    );
    wire _T_4295__T_4300_clk;
    wire _T_4295__T_4300_en;
    wire _T_4295__T_4300_mask;
    wire _T_4295__T_4300_addr;
    wire _T_4295__T_4300_data;
    wire _T_4295__T_4302_data;
    wire _T_4295__T_4302_clk;
    wire _T_4295__T_4302_en;
    wire _T_4295__T_4302_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(1), .isSyncRead(0)) _T_4295 (
        .read_data(_T_4295__T_4302_data),
        .read_clk(_T_4295__T_4302_clk),
        .read_en(_T_4295__T_4302_en),
        .read_addr(_T_4295__T_4302_addr),
        .write_clk(_T_4295__T_4300_clk),
        .write_en(_T_4295__T_4300_en),
        .write_mask(_T_4295__T_4300_mask),
        .write_addr(_T_4295__T_4300_addr),
        .write_data(_T_4295__T_4300_data)
    );
    wire _T_4298;
    BITWISEAND #(.width(1)) bitwiseand_1084 (
        .y(_T_4298),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4295__T_4300_addr = 1'h0;
    assign _T_4295__T_4300_en = io_in_valid;
    assign _T_4295__T_4300_clk = clock;
    assign _T_4295__T_4300_mask = 1'h1;
    assign _T_4295__T_4302_addr = 1'h0;
    assign _T_4295__T_4302_en = 1'h1;
    assign _T_4295__T_4302_clk = clock;
    wire _T_4304;
    wire [1:0] _T_4306;
    ADD_UNSIGNED #(.width(1)) u_add_1085 (
        .y(_T_4306),
        .a(_T_4295__T_4302_data),
        .b(1'h0)
    );
    wire _T_4307;
    TAIL #(.width(2), .n(1)) tail_1086 (
        .y(_T_4307),
        .in(_T_4306)
    );
    wire _T_4322;
    wire [1:0] _T_4324;
    ADD_UNSIGNED #(.width(1)) u_add_1087 (
        .y(_T_4324),
        .a(_T_4295__T_4302_data),
        .b(1'h1)
    );
    wire _T_4325;
    TAIL #(.width(2), .n(1)) tail_1088 (
        .y(_T_4325),
        .in(_T_4324)
    );
    wire [63:0] _T_4380_0_real_node;
    wire [63:0] _T_4380_0_imaginary_node;
    wire [63:0] _T_4380_1_real_node;
    wire [63:0] _T_4380_1_imaginary_node;
    wire _node_919;
    EQ_UNSIGNED #(.width(1)) u_eq_1089 (
        .y(_node_919),
        .a(1'd0),
        .b(_T_4304)
    );
    wire [63:0] _node_920;
    assign _node_920 = _T_4251_0_imaginary_node;
    wire _node_921;
    EQ_UNSIGNED #(.width(1)) u_eq_1090 (
        .y(_node_921),
        .a(1'd1),
        .b(_T_4304)
    );
    wire [63:0] _node_922;
    MUX_UNSIGNED #(.width(64)) u_mux_1091 (
        .y(_node_922),
        .sel(_node_921),
        .a(_T_4251_1_imaginary_node),
        .b(_node_920)
    );
    wire _node_923;
    EQ_UNSIGNED #(.width(1)) u_eq_1092 (
        .y(_node_923),
        .a(1'd0),
        .b(_T_4304)
    );
    wire [63:0] _node_924;
    assign _node_924 = _T_4251_0_real_node;
    wire _node_925;
    EQ_UNSIGNED #(.width(1)) u_eq_1093 (
        .y(_node_925),
        .a(1'd1),
        .b(_T_4304)
    );
    wire [63:0] _node_926;
    MUX_UNSIGNED #(.width(64)) u_mux_1094 (
        .y(_node_926),
        .sel(_node_925),
        .a(_T_4251_1_real_node),
        .b(_node_924)
    );
    wire _node_927;
    EQ_UNSIGNED #(.width(1)) u_eq_1095 (
        .y(_node_927),
        .a(1'd0),
        .b(_T_4322)
    );
    wire [63:0] _node_928;
    assign _node_928 = _T_4251_0_imaginary_node;
    wire _node_929;
    EQ_UNSIGNED #(.width(1)) u_eq_1096 (
        .y(_node_929),
        .a(1'd1),
        .b(_T_4322)
    );
    wire [63:0] _node_930;
    MUX_UNSIGNED #(.width(64)) u_mux_1097 (
        .y(_node_930),
        .sel(_node_929),
        .a(_T_4251_1_imaginary_node),
        .b(_node_928)
    );
    wire _node_931;
    EQ_UNSIGNED #(.width(1)) u_eq_1098 (
        .y(_node_931),
        .a(1'd0),
        .b(_T_4322)
    );
    wire [63:0] _node_932;
    assign _node_932 = _T_4251_0_real_node;
    wire _node_933;
    EQ_UNSIGNED #(.width(1)) u_eq_1099 (
        .y(_node_933),
        .a(1'd1),
        .b(_T_4322)
    );
    wire [63:0] _node_934;
    MUX_UNSIGNED #(.width(64)) u_mux_1100 (
        .y(_node_934),
        .sel(_node_933),
        .a(_T_4251_1_real_node),
        .b(_node_932)
    );
    wire _T_4435_real_node__T_4446_clk;
    wire _T_4435_real_node__T_4446_en;
    wire _T_4435_real_node__T_4446_mask;
    wire _T_4435_real_node__T_4446_addr;
    wire [63:0] _T_4435_real_node__T_4446_data;
    wire [63:0] _T_4435_real_node__T_4454_data;
    wire _T_4435_real_node__T_4454_clk;
    wire _T_4435_real_node__T_4454_en;
    wire _T_4435_real_node__T_4454_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4435_real_node (
        .read_data(_T_4435_real_node__T_4454_data),
        .read_clk(_T_4435_real_node__T_4454_clk),
        .read_en(_T_4435_real_node__T_4454_en),
        .read_addr(_T_4435_real_node__T_4454_addr),
        .write_clk(_T_4435_real_node__T_4446_clk),
        .write_en(_T_4435_real_node__T_4446_en),
        .write_mask(_T_4435_real_node__T_4446_mask),
        .write_addr(_T_4435_real_node__T_4446_addr),
        .write_data(_T_4435_real_node__T_4446_data)
    );
    wire _T_4435_imaginary_node__T_4446_clk;
    wire _T_4435_imaginary_node__T_4446_en;
    wire _T_4435_imaginary_node__T_4446_mask;
    wire _T_4435_imaginary_node__T_4446_addr;
    wire [63:0] _T_4435_imaginary_node__T_4446_data;
    wire [63:0] _T_4435_imaginary_node__T_4454_data;
    wire _T_4435_imaginary_node__T_4454_clk;
    wire _T_4435_imaginary_node__T_4454_en;
    wire _T_4435_imaginary_node__T_4454_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4435_imaginary_node (
        .read_data(_T_4435_imaginary_node__T_4454_data),
        .read_clk(_T_4435_imaginary_node__T_4454_clk),
        .read_en(_T_4435_imaginary_node__T_4454_en),
        .read_addr(_T_4435_imaginary_node__T_4454_addr),
        .write_clk(_T_4435_imaginary_node__T_4446_clk),
        .write_en(_T_4435_imaginary_node__T_4446_en),
        .write_mask(_T_4435_imaginary_node__T_4446_mask),
        .write_addr(_T_4435_imaginary_node__T_4446_addr),
        .write_data(_T_4435_imaginary_node__T_4446_data)
    );
    wire _T_4438;
    BITWISEAND #(.width(1)) bitwiseand_1101 (
        .y(_T_4438),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4435_real_node__T_4446_addr = 1'h0;
    assign _T_4435_real_node__T_4446_en = io_in_valid;
    assign _T_4435_real_node__T_4446_clk = clock;
    assign _T_4435_imaginary_node__T_4446_addr = 1'h0;
    assign _T_4435_imaginary_node__T_4446_en = io_in_valid;
    assign _T_4435_imaginary_node__T_4446_clk = clock;
    assign _T_4435_imaginary_node__T_4446_mask = 1'h1;
    assign _T_4435_real_node__T_4446_mask = 1'h1;
    assign _T_4435_real_node__T_4454_addr = 1'h0;
    assign _T_4435_real_node__T_4454_en = 1'h1;
    assign _T_4435_real_node__T_4454_clk = clock;
    assign _T_4435_imaginary_node__T_4454_addr = 1'h0;
    assign _T_4435_imaginary_node__T_4454_en = 1'h1;
    assign _T_4435_imaginary_node__T_4454_clk = clock;
    wire _T_4469_real_node__T_4480_clk;
    wire _T_4469_real_node__T_4480_en;
    wire _T_4469_real_node__T_4480_mask;
    wire _T_4469_real_node__T_4480_addr;
    wire [63:0] _T_4469_real_node__T_4480_data;
    wire [63:0] _T_4469_real_node__T_4488_data;
    wire _T_4469_real_node__T_4488_clk;
    wire _T_4469_real_node__T_4488_en;
    wire _T_4469_real_node__T_4488_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4469_real_node (
        .read_data(_T_4469_real_node__T_4488_data),
        .read_clk(_T_4469_real_node__T_4488_clk),
        .read_en(_T_4469_real_node__T_4488_en),
        .read_addr(_T_4469_real_node__T_4488_addr),
        .write_clk(_T_4469_real_node__T_4480_clk),
        .write_en(_T_4469_real_node__T_4480_en),
        .write_mask(_T_4469_real_node__T_4480_mask),
        .write_addr(_T_4469_real_node__T_4480_addr),
        .write_data(_T_4469_real_node__T_4480_data)
    );
    wire _T_4469_imaginary_node__T_4480_clk;
    wire _T_4469_imaginary_node__T_4480_en;
    wire _T_4469_imaginary_node__T_4480_mask;
    wire _T_4469_imaginary_node__T_4480_addr;
    wire [63:0] _T_4469_imaginary_node__T_4480_data;
    wire [63:0] _T_4469_imaginary_node__T_4488_data;
    wire _T_4469_imaginary_node__T_4488_clk;
    wire _T_4469_imaginary_node__T_4488_en;
    wire _T_4469_imaginary_node__T_4488_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4469_imaginary_node (
        .read_data(_T_4469_imaginary_node__T_4488_data),
        .read_clk(_T_4469_imaginary_node__T_4488_clk),
        .read_en(_T_4469_imaginary_node__T_4488_en),
        .read_addr(_T_4469_imaginary_node__T_4488_addr),
        .write_clk(_T_4469_imaginary_node__T_4480_clk),
        .write_en(_T_4469_imaginary_node__T_4480_en),
        .write_mask(_T_4469_imaginary_node__T_4480_mask),
        .write_addr(_T_4469_imaginary_node__T_4480_addr),
        .write_data(_T_4469_imaginary_node__T_4480_data)
    );
    wire _T_4472;
    BITWISEAND #(.width(1)) bitwiseand_1102 (
        .y(_T_4472),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4469_real_node__T_4480_addr = 1'h0;
    assign _T_4469_real_node__T_4480_en = io_in_valid;
    assign _T_4469_real_node__T_4480_clk = clock;
    assign _T_4469_imaginary_node__T_4480_addr = 1'h0;
    assign _T_4469_imaginary_node__T_4480_en = io_in_valid;
    assign _T_4469_imaginary_node__T_4480_clk = clock;
    assign _T_4469_imaginary_node__T_4480_mask = 1'h1;
    assign _T_4469_real_node__T_4480_mask = 1'h1;
    assign _T_4469_real_node__T_4488_addr = 1'h0;
    assign _T_4469_real_node__T_4488_en = 1'h1;
    assign _T_4469_real_node__T_4488_clk = clock;
    assign _T_4469_imaginary_node__T_4488_addr = 1'h0;
    assign _T_4469_imaginary_node__T_4488_en = 1'h1;
    assign _T_4469_imaginary_node__T_4488_clk = clock;
    wire [63:0] _T_4530_0_real_node;
    wire [63:0] _T_4530_0_imaginary_node;
    wire [63:0] _T_4530_1_real_node;
    wire [63:0] _T_4530_1_imaginary_node;
    wire _T_4571;
    BITS #(.width(1), .high(0), .low(0)) bits_1103 (
        .y(_T_4571),
        .in(sync_1)
    );
    wire _T_4574__T_4579_clk;
    wire _T_4574__T_4579_en;
    wire _T_4574__T_4579_mask;
    wire _T_4574__T_4579_addr;
    wire _T_4574__T_4579_data;
    wire _T_4574__T_4581_data;
    wire _T_4574__T_4581_clk;
    wire _T_4574__T_4581_en;
    wire _T_4574__T_4581_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(1), .isSyncRead(0)) _T_4574 (
        .read_data(_T_4574__T_4581_data),
        .read_clk(_T_4574__T_4581_clk),
        .read_en(_T_4574__T_4581_en),
        .read_addr(_T_4574__T_4581_addr),
        .write_clk(_T_4574__T_4579_clk),
        .write_en(_T_4574__T_4579_en),
        .write_mask(_T_4574__T_4579_mask),
        .write_addr(_T_4574__T_4579_addr),
        .write_data(_T_4574__T_4579_data)
    );
    wire _T_4577;
    BITWISEAND #(.width(1)) bitwiseand_1104 (
        .y(_T_4577),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4574__T_4579_addr = 1'h0;
    assign _T_4574__T_4579_en = io_in_valid;
    assign _T_4574__T_4579_clk = clock;
    assign _T_4574__T_4579_mask = 1'h1;
    assign _T_4574__T_4581_addr = 1'h0;
    assign _T_4574__T_4581_en = 1'h1;
    assign _T_4574__T_4581_clk = clock;
    wire _T_4583;
    wire [1:0] _T_4585;
    ADD_UNSIGNED #(.width(1)) u_add_1105 (
        .y(_T_4585),
        .a(_T_4574__T_4581_data),
        .b(1'h0)
    );
    wire _T_4586;
    TAIL #(.width(2), .n(1)) tail_1106 (
        .y(_T_4586),
        .in(_T_4585)
    );
    wire _T_4601;
    wire [1:0] _T_4603;
    ADD_UNSIGNED #(.width(1)) u_add_1107 (
        .y(_T_4603),
        .a(_T_4574__T_4581_data),
        .b(1'h1)
    );
    wire _T_4604;
    TAIL #(.width(2), .n(1)) tail_1108 (
        .y(_T_4604),
        .in(_T_4603)
    );
    wire [63:0] _T_4659_0_real_node;
    wire [63:0] _T_4659_0_imaginary_node;
    wire [63:0] _T_4659_1_real_node;
    wire [63:0] _T_4659_1_imaginary_node;
    wire _node_935;
    EQ_UNSIGNED #(.width(1)) u_eq_1109 (
        .y(_node_935),
        .a(1'd0),
        .b(_T_4583)
    );
    wire [63:0] _node_936;
    assign _node_936 = _T_4530_0_imaginary_node;
    wire _node_937;
    EQ_UNSIGNED #(.width(1)) u_eq_1110 (
        .y(_node_937),
        .a(1'd1),
        .b(_T_4583)
    );
    wire [63:0] _node_938;
    MUX_UNSIGNED #(.width(64)) u_mux_1111 (
        .y(_node_938),
        .sel(_node_937),
        .a(_T_4530_1_imaginary_node),
        .b(_node_936)
    );
    wire _node_939;
    EQ_UNSIGNED #(.width(1)) u_eq_1112 (
        .y(_node_939),
        .a(1'd0),
        .b(_T_4583)
    );
    wire [63:0] _node_940;
    assign _node_940 = _T_4530_0_real_node;
    wire _node_941;
    EQ_UNSIGNED #(.width(1)) u_eq_1113 (
        .y(_node_941),
        .a(1'd1),
        .b(_T_4583)
    );
    wire [63:0] _node_942;
    MUX_UNSIGNED #(.width(64)) u_mux_1114 (
        .y(_node_942),
        .sel(_node_941),
        .a(_T_4530_1_real_node),
        .b(_node_940)
    );
    wire _node_943;
    EQ_UNSIGNED #(.width(1)) u_eq_1115 (
        .y(_node_943),
        .a(1'd0),
        .b(_T_4601)
    );
    wire [63:0] _node_944;
    assign _node_944 = _T_4530_0_imaginary_node;
    wire _node_945;
    EQ_UNSIGNED #(.width(1)) u_eq_1116 (
        .y(_node_945),
        .a(1'd1),
        .b(_T_4601)
    );
    wire [63:0] _node_946;
    MUX_UNSIGNED #(.width(64)) u_mux_1117 (
        .y(_node_946),
        .sel(_node_945),
        .a(_T_4530_1_imaginary_node),
        .b(_node_944)
    );
    wire _node_947;
    EQ_UNSIGNED #(.width(1)) u_eq_1118 (
        .y(_node_947),
        .a(1'd0),
        .b(_T_4601)
    );
    wire [63:0] _node_948;
    assign _node_948 = _T_4530_0_real_node;
    wire _node_949;
    EQ_UNSIGNED #(.width(1)) u_eq_1119 (
        .y(_node_949),
        .a(1'd1),
        .b(_T_4601)
    );
    wire [63:0] _node_950;
    MUX_UNSIGNED #(.width(64)) u_mux_1120 (
        .y(_node_950),
        .sel(_node_949),
        .a(_T_4530_1_real_node),
        .b(_node_948)
    );
    wire _T_4714_real_node__T_4725_clk;
    wire _T_4714_real_node__T_4725_en;
    wire _T_4714_real_node__T_4725_mask;
    wire _T_4714_real_node__T_4725_addr;
    wire [63:0] _T_4714_real_node__T_4725_data;
    wire [63:0] _T_4714_real_node__T_4733_data;
    wire _T_4714_real_node__T_4733_clk;
    wire _T_4714_real_node__T_4733_en;
    wire _T_4714_real_node__T_4733_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4714_real_node (
        .read_data(_T_4714_real_node__T_4733_data),
        .read_clk(_T_4714_real_node__T_4733_clk),
        .read_en(_T_4714_real_node__T_4733_en),
        .read_addr(_T_4714_real_node__T_4733_addr),
        .write_clk(_T_4714_real_node__T_4725_clk),
        .write_en(_T_4714_real_node__T_4725_en),
        .write_mask(_T_4714_real_node__T_4725_mask),
        .write_addr(_T_4714_real_node__T_4725_addr),
        .write_data(_T_4714_real_node__T_4725_data)
    );
    wire _T_4714_imaginary_node__T_4725_clk;
    wire _T_4714_imaginary_node__T_4725_en;
    wire _T_4714_imaginary_node__T_4725_mask;
    wire _T_4714_imaginary_node__T_4725_addr;
    wire [63:0] _T_4714_imaginary_node__T_4725_data;
    wire [63:0] _T_4714_imaginary_node__T_4733_data;
    wire _T_4714_imaginary_node__T_4733_clk;
    wire _T_4714_imaginary_node__T_4733_en;
    wire _T_4714_imaginary_node__T_4733_addr;
    RAMMEM #(.depth(1), .addrbits(1), .width(64), .isSyncRead(0)) _T_4714_imaginary_node (
        .read_data(_T_4714_imaginary_node__T_4733_data),
        .read_clk(_T_4714_imaginary_node__T_4733_clk),
        .read_en(_T_4714_imaginary_node__T_4733_en),
        .read_addr(_T_4714_imaginary_node__T_4733_addr),
        .write_clk(_T_4714_imaginary_node__T_4725_clk),
        .write_en(_T_4714_imaginary_node__T_4725_en),
        .write_mask(_T_4714_imaginary_node__T_4725_mask),
        .write_addr(_T_4714_imaginary_node__T_4725_addr),
        .write_data(_T_4714_imaginary_node__T_4725_data)
    );
    wire _T_4717;
    BITWISEAND #(.width(1)) bitwiseand_1121 (
        .y(_T_4717),
        .a(io_in_valid),
        .b(1'h1)
    );
    assign _T_4714_real_node__T_4725_addr = 1'h0;
    assign _T_4714_real_node__T_4725_en = io_in_valid;
    assign _T_4714_real_node__T_4725_clk = clock;
    assign _T_4714_imaginary_node__T_4725_addr = 1'h0;
    assign _T_4714_imaginary_node__T_4725_en = io_in_valid;
    assign _T_4714_imaginary_node__T_4725_clk = clock;
    assign _T_4714_imaginary_node__T_4725_mask = 1'h1;
    assign _T_4714_real_node__T_4725_mask = 1'h1;
    assign _T_4714_real_node__T_4733_addr = 1'h0;
    assign _T_4714_real_node__T_4733_en = 1'h1;
    assign _T_4714_real_node__T_4733_clk = clock;
    assign _T_4714_imaginary_node__T_4733_addr = 1'h0;
    assign _T_4714_imaginary_node__T_4733_en = 1'h1;
    assign _T_4714_imaginary_node__T_4733_clk = clock;
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
    assign _BBFAdd_78_1__in1 = _T_2414_node;
    assign _BBFAdd_78_1__in2 = _T_2433_node;
    assign _BBFAdd_79_1__in1 = _T_2445_node;
    assign _BBFAdd_79_1__in2 = _T_2451_node;
    assign _BBFAdd_80_1__in1 = _T_2391_real_node__T_2410_data;
    assign _BBFAdd_80_1__in2 = _T_2473_real_node;
    assign _BBFAdd_81_1__in1 = _T_2391_imaginary_node__T_2410_data;
    assign _BBFAdd_81_1__in2 = _T_2473_imaginary_node;
    assign _BBFAdd_82_1__in1 = _T_2391_real_node__T_2410_data;
    assign _BBFAdd_82_1__in2 = _T_2539_real_node;
    assign _BBFAdd_83_1__in1 = _T_2391_imaginary_node__T_2410_data;
    assign _BBFAdd_83_1__in2 = _T_2539_imaginary_node;
    assign _BBFAdd_84_1__in1 = _T_2906_node;
    assign _BBFAdd_84_1__in2 = _T_2925_node;
    assign _BBFAdd_85_1__in1 = _T_2937_node;
    assign _BBFAdd_85_1__in2 = _T_2943_node;
    assign _BBFAdd_86_1__in1 = _T_2883_real_node__T_2902_data;
    assign _BBFAdd_86_1__in2 = _T_2965_real_node;
    assign _BBFAdd_87_1__in1 = _T_2883_imaginary_node__T_2902_data;
    assign _BBFAdd_87_1__in2 = _T_2965_imaginary_node;
    assign _BBFAdd_88_1__in1 = _T_2883_real_node__T_2902_data;
    assign _BBFAdd_88_1__in2 = _T_3031_real_node;
    assign _BBFAdd_89_1__in1 = _T_2883_imaginary_node__T_2902_data;
    assign _BBFAdd_89_1__in2 = _T_3031_imaginary_node;
    assign _BBFAdd_90_1__in1 = _T_3398_node;
    assign _BBFAdd_90_1__in2 = _T_3417_node;
    assign _BBFAdd_91_1__in1 = _T_3429_node;
    assign _BBFAdd_91_1__in2 = _T_3435_node;
    assign _BBFAdd_92_1__in1 = _T_3375_real_node__T_3394_data;
    assign _BBFAdd_92_1__in2 = _T_3457_real_node;
    assign _BBFAdd_93_1__in1 = _T_3375_imaginary_node__T_3394_data;
    assign _BBFAdd_93_1__in2 = _T_3457_imaginary_node;
    assign _BBFAdd_94_1__in1 = _T_3375_real_node__T_3394_data;
    assign _BBFAdd_94_1__in2 = _T_3523_real_node;
    assign _BBFAdd_95_1__in1 = _T_3375_imaginary_node__T_3394_data;
    assign _BBFAdd_95_1__in2 = _T_3523_imaginary_node;
    assign _BBFMultiply_48_1__in1 = _T_1844_1_real_node;
    assign _BBFMultiply_48_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_49_1__in1 = _T_1844_1_imaginary_node;
    assign _BBFMultiply_49_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_50_1__in1 = _T_1844_1_real_node;
    assign _BBFMultiply_50_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_51_1__in1 = _T_1844_1_imaginary_node;
    assign _BBFMultiply_51_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_52_1__in1 = _T_2336_1_real_node;
    assign _BBFMultiply_52_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_53_1__in1 = _T_2336_1_imaginary_node;
    assign _BBFMultiply_53_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_54_1__in1 = _T_2336_1_real_node;
    assign _BBFMultiply_54_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_55_1__in1 = _T_2336_1_imaginary_node;
    assign _BBFMultiply_55_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_56_1__in1 = _T_2828_1_real_node;
    assign _BBFMultiply_56_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_57_1__in1 = _T_2828_1_imaginary_node;
    assign _BBFMultiply_57_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_58_1__in1 = _T_2828_1_real_node;
    assign _BBFMultiply_58_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_59_1__in1 = _T_2828_1_imaginary_node;
    assign _BBFMultiply_59_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_60_1__in1 = _T_3320_1_real_node;
    assign _BBFMultiply_60_1__in2 = twiddle_0_real_node;
    assign _BBFMultiply_61_1__in1 = _T_3320_1_imaginary_node;
    assign _BBFMultiply_61_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_62_1__in1 = _T_3320_1_real_node;
    assign _BBFMultiply_62_1__in2 = twiddle_0_imaginary_node;
    assign _BBFMultiply_63_1__in1 = _T_3320_1_imaginary_node;
    assign _BBFMultiply_63_1__in2 = twiddle_0_real_node;
    assign _BBFSubtract_43_1__in1 = _T_1934_node;
    assign _BBFSubtract_43_1__in2 = _T_1928_node;
    assign _BBFSubtract_44_1__in1 = _T_2011_node;
    assign _BBFSubtract_44_1__in2 = _T_1981_real_node;
    assign _BBFSubtract_45_1__in1 = _T_2024_node;
    assign _BBFSubtract_45_1__in2 = _T_1981_imaginary_node;
    assign _BBFSubtract_46_1__in1 = _T_2426_node;
    assign _BBFSubtract_46_1__in2 = _T_2420_node;
    assign _BBFSubtract_47_1__in1 = _T_2503_node;
    assign _BBFSubtract_47_1__in2 = _T_2473_real_node;
    assign _BBFSubtract_48_1__in1 = _T_2516_node;
    assign _BBFSubtract_48_1__in2 = _T_2473_imaginary_node;
    assign _BBFSubtract_49_1__in1 = _T_2918_node;
    assign _BBFSubtract_49_1__in2 = _T_2912_node;
    assign _BBFSubtract_50_1__in1 = _T_2995_node;
    assign _BBFSubtract_50_1__in2 = _T_2965_real_node;
    assign _BBFSubtract_51_1__in1 = _T_3008_node;
    assign _BBFSubtract_51_1__in2 = _T_2965_imaginary_node;
    assign _BBFSubtract_52_1__in1 = _T_3410_node;
    assign _BBFSubtract_52_1__in2 = _T_3404_node;
    assign _BBFSubtract_53_1__in1 = _T_3487_node;
    assign _BBFSubtract_53_1__in2 = _T_3457_real_node;
    assign _BBFSubtract_54_1__in1 = _T_3500_node;
    assign _BBFSubtract_54_1__in2 = _T_3457_imaginary_node;
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
    assign _T_1844_0_imaginary_node = _node_826;
    assign _T_1844_0_real_node = _node_830;
    assign _T_1844_1_imaginary_node = _node_834;
    assign _T_1844_1_real_node = _node_838;
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
    assign _T_2088_imaginary_node__T_2099_data = _T_2007_imaginary_node;
    assign _T_2088_real_node__T_2099_data = _T_2007_real_node;
    assign _T_2122_imaginary_node__T_2133_data = _T_2073_imaginary_node;
    assign _T_2122_real_node__T_2133_data = _T_2073_real_node;
    assign _T_2156_imaginary_node__T_2167_data = stage_outputs_0_3_imaginary_node;
    assign _T_2156_real_node__T_2167_data = stage_outputs_0_3_real_node;
    assign _T_2217_0_imaginary_node = stage_outputs_0_2_imaginary_node;
    assign _T_2217_0_real_node = stage_outputs_0_2_real_node;
    assign _T_2217_1_imaginary_node = _T_2156_imaginary_node__T_2175_data;
    assign _T_2217_1_real_node = _T_2156_real_node__T_2175_data;
    assign _T_2260 = _T_2263;
    assign _T_2278 = _T_2281;
    assign _T_2336_0_imaginary_node = _node_842;
    assign _T_2336_0_real_node = _node_846;
    assign _T_2336_1_imaginary_node = _node_850;
    assign _T_2336_1_real_node = _node_854;
    assign _T_2391_imaginary_node__T_2402_data = _T_2336_0_imaginary_node;
    assign _T_2391_real_node__T_2402_data = _T_2336_0_real_node;
    assign _T_2414_node = _BBFMultiply_52_1__out;
    assign _T_2420_node = _BBFMultiply_53_1__out;
    assign _T_2426_node = 64'h0;
    assign _T_2433_node = _BBFSubtract_46_1__out;
    assign _T_2439_node = _BBFAdd_78_1__out;
    assign _T_2445_node = _BBFMultiply_54_1__out;
    assign _T_2451_node = _BBFMultiply_55_1__out;
    assign _T_2457_node = _BBFAdd_79_1__out;
    assign _T_2473_imaginary_node = _T_2457_node;
    assign _T_2473_real_node = _T_2439_node;
    assign _T_2477_node = _BBFAdd_80_1__out;
    assign _T_2483_node = _BBFAdd_81_1__out;
    assign _T_2499_imaginary_node = _T_2483_node;
    assign _T_2499_real_node = _T_2477_node;
    assign _T_2503_node = 64'h0;
    assign _T_2510_node = _BBFSubtract_47_1__out;
    assign _T_2516_node = 64'h0;
    assign _T_2523_node = _BBFSubtract_48_1__out;
    assign _T_2539_imaginary_node = _T_2523_node;
    assign _T_2539_real_node = _T_2510_node;
    assign _T_2543_node = _BBFAdd_82_1__out;
    assign _T_2549_node = _BBFAdd_83_1__out;
    assign _T_2565_imaginary_node = _T_2549_node;
    assign _T_2565_real_node = _T_2543_node;
    assign _T_2580_imaginary_node__T_2591_data = _T_2499_imaginary_node;
    assign _T_2580_real_node__T_2591_data = _T_2499_real_node;
    assign _T_2614_imaginary_node__T_2625_data = _T_2565_imaginary_node;
    assign _T_2614_real_node__T_2625_data = _T_2565_real_node;
    assign _T_2648_imaginary_node__T_2659_data = stage_outputs_0_5_imaginary_node;
    assign _T_2648_real_node__T_2659_data = stage_outputs_0_5_real_node;
    assign _T_2709_0_imaginary_node = stage_outputs_0_4_imaginary_node;
    assign _T_2709_0_real_node = stage_outputs_0_4_real_node;
    assign _T_2709_1_imaginary_node = _T_2648_imaginary_node__T_2667_data;
    assign _T_2709_1_real_node = _T_2648_real_node__T_2667_data;
    assign _T_2752 = _T_2755;
    assign _T_2770 = _T_2773;
    assign _T_2828_0_imaginary_node = _node_858;
    assign _T_2828_0_real_node = _node_862;
    assign _T_2828_1_imaginary_node = _node_866;
    assign _T_2828_1_real_node = _node_870;
    assign _T_2883_imaginary_node__T_2894_data = _T_2828_0_imaginary_node;
    assign _T_2883_real_node__T_2894_data = _T_2828_0_real_node;
    assign _T_2906_node = _BBFMultiply_56_1__out;
    assign _T_2912_node = _BBFMultiply_57_1__out;
    assign _T_2918_node = 64'h0;
    assign _T_2925_node = _BBFSubtract_49_1__out;
    assign _T_2931_node = _BBFAdd_84_1__out;
    assign _T_2937_node = _BBFMultiply_58_1__out;
    assign _T_2943_node = _BBFMultiply_59_1__out;
    assign _T_2949_node = _BBFAdd_85_1__out;
    assign _T_2965_imaginary_node = _T_2949_node;
    assign _T_2965_real_node = _T_2931_node;
    assign _T_2969_node = _BBFAdd_86_1__out;
    assign _T_2975_node = _BBFAdd_87_1__out;
    assign _T_2991_imaginary_node = _T_2975_node;
    assign _T_2991_real_node = _T_2969_node;
    assign _T_2995_node = 64'h0;
    assign _T_3002_node = _BBFSubtract_50_1__out;
    assign _T_3008_node = 64'h0;
    assign _T_3015_node = _BBFSubtract_51_1__out;
    assign _T_3031_imaginary_node = _T_3015_node;
    assign _T_3031_real_node = _T_3002_node;
    assign _T_3035_node = _BBFAdd_88_1__out;
    assign _T_3041_node = _BBFAdd_89_1__out;
    assign _T_3057_imaginary_node = _T_3041_node;
    assign _T_3057_real_node = _T_3035_node;
    assign _T_3072_imaginary_node__T_3083_data = _T_2991_imaginary_node;
    assign _T_3072_real_node__T_3083_data = _T_2991_real_node;
    assign _T_3106_imaginary_node__T_3117_data = _T_3057_imaginary_node;
    assign _T_3106_real_node__T_3117_data = _T_3057_real_node;
    assign _T_3140_imaginary_node__T_3151_data = stage_outputs_0_7_imaginary_node;
    assign _T_3140_real_node__T_3151_data = stage_outputs_0_7_real_node;
    assign _T_316_node = 64'h0;
    assign _T_3201_0_imaginary_node = stage_outputs_0_6_imaginary_node;
    assign _T_3201_0_real_node = stage_outputs_0_6_real_node;
    assign _T_3201_1_imaginary_node = _T_3140_imaginary_node__T_3159_data;
    assign _T_3201_1_real_node = _T_3140_real_node__T_3159_data;
    assign _T_323_node = 64'h0;
    assign _T_3244 = _T_3247;
    assign _T_3262 = _T_3265;
    assign _T_3320_0_imaginary_node = _node_874;
    assign _T_3320_0_real_node = _node_878;
    assign _T_3320_1_imaginary_node = _node_882;
    assign _T_3320_1_real_node = _node_886;
    assign _T_3375_imaginary_node__T_3386_data = _T_3320_0_imaginary_node;
    assign _T_3375_real_node__T_3386_data = _T_3320_0_real_node;
    assign _T_3398_node = _BBFMultiply_60_1__out;
    assign _T_3404_node = _BBFMultiply_61_1__out;
    assign _T_3410_node = 64'h0;
    assign _T_3417_node = _BBFSubtract_52_1__out;
    assign _T_3423_node = _BBFAdd_90_1__out;
    assign _T_3429_node = _BBFMultiply_62_1__out;
    assign _T_3435_node = _BBFMultiply_63_1__out;
    assign _T_3441_node = _BBFAdd_91_1__out;
    assign _T_3457_imaginary_node = _T_3441_node;
    assign _T_3457_real_node = _T_3423_node;
    assign _T_3461_node = _BBFAdd_92_1__out;
    assign _T_3467_node = _BBFAdd_93_1__out;
    assign _T_3483_imaginary_node = _T_3467_node;
    assign _T_3483_real_node = _T_3461_node;
    assign _T_3487_node = 64'h0;
    assign _T_3494_node = _BBFSubtract_53_1__out;
    assign _T_3500_node = 64'h0;
    assign _T_3507_node = _BBFSubtract_54_1__out;
    assign _T_3523_imaginary_node = _T_3507_node;
    assign _T_3523_real_node = _T_3494_node;
    assign _T_3527_node = _BBFAdd_94_1__out;
    assign _T_3533_node = _BBFAdd_95_1__out;
    assign _T_3549_imaginary_node = _T_3533_node;
    assign _T_3549_real_node = _T_3527_node;
    assign _T_3564_imaginary_node__T_3575_data = _T_3483_imaginary_node;
    assign _T_3564_real_node__T_3575_data = _T_3483_real_node;
    assign _T_3598_imaginary_node__T_3609_data = _T_3549_imaginary_node;
    assign _T_3598_real_node__T_3609_data = _T_3549_real_node;
    assign _T_3632_imaginary_node__T_3643_data = stage_outputs_1_1_imaginary_node;
    assign _T_3632_real_node__T_3643_data = stage_outputs_1_1_real_node;
    assign _T_3693_0_imaginary_node = stage_outputs_1_0_imaginary_node;
    assign _T_3693_0_real_node = stage_outputs_1_0_real_node;
    assign _T_3693_1_imaginary_node = _T_3632_imaginary_node__T_3651_data;
    assign _T_3693_1_real_node = _T_3632_real_node__T_3651_data;
    assign _T_3737__T_3742_data = _T_3734;
    assign _T_3746 = _T_3749;
    assign _T_3764 = _T_3767;
    assign _T_3822_0_imaginary_node = _node_890;
    assign _T_3822_0_real_node = _node_894;
    assign _T_3822_1_imaginary_node = _node_898;
    assign _T_3822_1_real_node = _node_902;
    assign _T_3877_imaginary_node__T_3888_data = _T_3822_0_imaginary_node;
    assign _T_3877_real_node__T_3888_data = _T_3822_0_real_node;
    assign _T_3911_imaginary_node__T_3922_data = stage_outputs_1_3_imaginary_node;
    assign _T_3911_real_node__T_3922_data = stage_outputs_1_3_real_node;
    assign _T_3972_0_imaginary_node = stage_outputs_1_2_imaginary_node;
    assign _T_3972_0_real_node = stage_outputs_1_2_real_node;
    assign _T_3972_1_imaginary_node = _T_3911_imaginary_node__T_3930_data;
    assign _T_3972_1_real_node = _T_3911_real_node__T_3930_data;
    assign _T_4016__T_4021_data = _T_4013;
    assign _T_4025 = _T_4028;
    assign _T_4043 = _T_4046;
    assign _T_4101_0_imaginary_node = _node_906;
    assign _T_4101_0_real_node = _node_910;
    assign _T_4101_1_imaginary_node = _node_914;
    assign _T_4101_1_real_node = _node_918;
    assign _T_4156_imaginary_node__T_4167_data = _T_4101_0_imaginary_node;
    assign _T_4156_real_node__T_4167_data = _T_4101_0_real_node;
    assign _T_4190_imaginary_node__T_4201_data = stage_outputs_1_5_imaginary_node;
    assign _T_4190_real_node__T_4201_data = stage_outputs_1_5_real_node;
    assign _T_4251_0_imaginary_node = stage_outputs_1_4_imaginary_node;
    assign _T_4251_0_real_node = stage_outputs_1_4_real_node;
    assign _T_4251_1_imaginary_node = _T_4190_imaginary_node__T_4209_data;
    assign _T_4251_1_real_node = _T_4190_real_node__T_4209_data;
    assign _T_4295__T_4300_data = _T_4292;
    assign _T_4304 = _T_4307;
    assign _T_4322 = _T_4325;
    assign _T_4380_0_imaginary_node = _node_922;
    assign _T_4380_0_real_node = _node_926;
    assign _T_4380_1_imaginary_node = _node_930;
    assign _T_4380_1_real_node = _node_934;
    assign _T_4435_imaginary_node__T_4446_data = _T_4380_0_imaginary_node;
    assign _T_4435_real_node__T_4446_data = _T_4380_0_real_node;
    assign _T_4469_imaginary_node__T_4480_data = stage_outputs_1_7_imaginary_node;
    assign _T_4469_real_node__T_4480_data = stage_outputs_1_7_real_node;
    assign _T_4530_0_imaginary_node = stage_outputs_1_6_imaginary_node;
    assign _T_4530_0_real_node = stage_outputs_1_6_real_node;
    assign _T_4530_1_imaginary_node = _T_4469_imaginary_node__T_4488_data;
    assign _T_4530_1_real_node = _T_4469_real_node__T_4488_data;
    assign _T_4574__T_4579_data = _T_4571;
    assign _T_4583 = _T_4586;
    assign _T_4601 = _T_4604;
    assign _T_4659_0_imaginary_node = _node_938;
    assign _T_4659_0_real_node = _node_942;
    assign _T_4659_1_imaginary_node = _node_946;
    assign _T_4659_1_real_node = _node_950;
    assign _T_4714_imaginary_node__T_4725_data = _T_4659_0_imaginary_node;
    assign _T_4714_real_node__T_4725_data = _T_4659_0_real_node;
    assign _T_5_node = 64'h0;
    MUX_UNSIGNED #(.width(1)) u_mux_1122 (
        .y(_WTEMP_29),
        .sel(_T_626),
        .a(1'h0),
        .b(_node_814)
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
    assign _T_974_0_imaginary_node = _node_818;
    assign _T_974_0_real_node = _node_822;
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
    assign stage_outputs_1_0_imaginary_node = _T_2088_imaginary_node__T_2107_data;
    assign stage_outputs_1_0_real_node = _T_2088_real_node__T_2107_data;
    assign stage_outputs_1_1_imaginary_node = _T_2122_imaginary_node__T_2141_data;
    assign stage_outputs_1_1_real_node = _T_2122_real_node__T_2141_data;
    assign stage_outputs_1_2_imaginary_node = _T_2580_imaginary_node__T_2599_data;
    assign stage_outputs_1_2_real_node = _T_2580_real_node__T_2599_data;
    assign stage_outputs_1_3_imaginary_node = _T_2614_imaginary_node__T_2633_data;
    assign stage_outputs_1_3_real_node = _T_2614_real_node__T_2633_data;
    assign stage_outputs_1_4_imaginary_node = _T_3072_imaginary_node__T_3091_data;
    assign stage_outputs_1_4_real_node = _T_3072_real_node__T_3091_data;
    assign stage_outputs_1_5_imaginary_node = _T_3106_imaginary_node__T_3125_data;
    assign stage_outputs_1_5_real_node = _T_3106_real_node__T_3125_data;
    assign stage_outputs_1_6_imaginary_node = _T_3564_imaginary_node__T_3583_data;
    assign stage_outputs_1_6_real_node = _T_3564_real_node__T_3583_data;
    assign stage_outputs_1_7_imaginary_node = _T_3598_imaginary_node__T_3617_data;
    assign stage_outputs_1_7_real_node = _T_3598_real_node__T_3617_data;
    assign stage_outputs_2_0_imaginary_node = _T_3877_imaginary_node__T_3896_data;
    assign stage_outputs_2_0_real_node = _T_3877_real_node__T_3896_data;
    assign stage_outputs_2_1_imaginary_node = _T_3822_1_imaginary_node;
    assign stage_outputs_2_1_real_node = _T_3822_1_real_node;
    assign stage_outputs_2_2_imaginary_node = _T_4156_imaginary_node__T_4175_data;
    assign stage_outputs_2_2_real_node = _T_4156_real_node__T_4175_data;
    assign stage_outputs_2_3_imaginary_node = _T_4101_1_imaginary_node;
    assign stage_outputs_2_3_real_node = _T_4101_1_real_node;
    assign stage_outputs_2_4_imaginary_node = _T_4435_imaginary_node__T_4454_data;
    assign stage_outputs_2_4_real_node = _T_4435_real_node__T_4454_data;
    assign stage_outputs_2_5_imaginary_node = _T_4380_1_imaginary_node;
    assign stage_outputs_2_5_real_node = _T_4380_1_real_node;
    assign stage_outputs_2_6_imaginary_node = _T_4714_imaginary_node__T_4733_data;
    assign stage_outputs_2_6_real_node = _T_4714_real_node__T_4733_data;
    assign stage_outputs_2_7_imaginary_node = _T_4659_1_imaginary_node;
    assign stage_outputs_2_7_real_node = _T_4659_1_real_node;
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
