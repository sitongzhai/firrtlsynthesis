module TopModuleWithClks(
    input clock,
    input reset,
    output io_gen1_bbOutClk_0,
    output io_gen1_bbOutClk_1,
    output io_gen1_bbOutClk_2,
    output io_gen1_clkDivOut_0,
    output io_gen1_clkDivOut_1,
    output io_gen1_clkDivOut_2,
    output io_gen2_bbOutClk_0,
    output io_gen2_bbOutClk_1,
    output io_gen2_bbOutClk_2,
    output io_gen2_clkDivOut_0,
    output io_gen2_clkDivOut_1,
    output io_gen2_clkDivOut_2,
    output io_gen3_bbOutClk_0,
    output io_gen3_bbOutClk_1,
    output io_gen3_bbOutClk_2,
    output io_gen3_clkDivOut_0,
    output io_gen3_clkDivOut_1,
    output io_gen3_clkDivOut_2,
    input io_fakeClk1,
    input io_fakeClk2
);
    wire _gen1__clock;
    wire _gen1__reset;
    wire _gen1__io_inClk;
    wire _gen1__io_bbOutClk_0;
    wire _gen1__io_bbOutClk_1;
    wire _gen1__io_bbOutClk_2;
    wire _gen1__io_clkDivOut_0;
    wire _gen1__io_clkDivOut_1;
    wire _gen1__io_clkDivOut_2;
    ModWithNestedClk gen1 (
        .clock(_gen1__clock),
        .reset(_gen1__reset),
        .io_inClk(_gen1__io_inClk),
        .io_bbOutClk_0(_gen1__io_bbOutClk_0),
        .io_bbOutClk_1(_gen1__io_bbOutClk_1),
        .io_bbOutClk_2(_gen1__io_bbOutClk_2),
        .io_clkDivOut_0(_gen1__io_clkDivOut_0),
        .io_clkDivOut_1(_gen1__io_clkDivOut_1),
        .io_clkDivOut_2(_gen1__io_clkDivOut_2)
    );
    wire _T_63;
    ASUINT #(.width(1)) asuint_1 (
        .y(_T_63),
        .in(_gen1__io_bbOutClk_0)
    );
    wire _T_64;
    ASUINT #(.width(1)) asuint_2 (
        .y(_T_64),
        .in(_gen1__io_bbOutClk_1)
    );
    wire _T_65;
    ASUINT #(.width(1)) asuint_3 (
        .y(_T_65),
        .in(_gen1__io_bbOutClk_2)
    );
    wire _T_68_0;
    wire _T_68_1;
    wire _T_68_2;
    wire _T_74;
    ASUINT #(.width(1)) asuint_4 (
        .y(_T_74),
        .in(_gen1__io_clkDivOut_0)
    );
    wire _T_75;
    ASUINT #(.width(1)) asuint_5 (
        .y(_T_75),
        .in(_gen1__io_clkDivOut_1)
    );
    wire _T_76;
    ASUINT #(.width(1)) asuint_6 (
        .y(_T_76),
        .in(_gen1__io_clkDivOut_2)
    );
    wire _T_79_0;
    wire _T_79_1;
    wire _T_79_2;
    wire _gen2__clock;
    wire _gen2__reset;
    wire _gen2__io_inClk;
    wire _gen2__io_bbOutClk_0;
    wire _gen2__io_bbOutClk_1;
    wire _gen2__io_bbOutClk_2;
    wire _gen2__io_clkDivOut_0;
    wire _gen2__io_clkDivOut_1;
    wire _gen2__io_clkDivOut_2;
    ModWithNestedClk_1 gen2 (
        .clock(_gen2__clock),
        .reset(_gen2__reset),
        .io_inClk(_gen2__io_inClk),
        .io_bbOutClk_0(_gen2__io_bbOutClk_0),
        .io_bbOutClk_1(_gen2__io_bbOutClk_1),
        .io_bbOutClk_2(_gen2__io_bbOutClk_2),
        .io_clkDivOut_0(_gen2__io_clkDivOut_0),
        .io_clkDivOut_1(_gen2__io_clkDivOut_1),
        .io_clkDivOut_2(_gen2__io_clkDivOut_2)
    );
    wire _T_85;
    ASUINT #(.width(1)) asuint_7 (
        .y(_T_85),
        .in(_gen2__io_bbOutClk_0)
    );
    wire _T_86;
    ASUINT #(.width(1)) asuint_8 (
        .y(_T_86),
        .in(_gen2__io_bbOutClk_1)
    );
    wire _T_87;
    ASUINT #(.width(1)) asuint_9 (
        .y(_T_87),
        .in(_gen2__io_bbOutClk_2)
    );
    wire _T_90_0;
    wire _T_90_1;
    wire _T_90_2;
    wire _T_96;
    ASUINT #(.width(1)) asuint_10 (
        .y(_T_96),
        .in(_gen2__io_clkDivOut_0)
    );
    wire _T_97;
    ASUINT #(.width(1)) asuint_11 (
        .y(_T_97),
        .in(_gen2__io_clkDivOut_1)
    );
    wire _T_98;
    ASUINT #(.width(1)) asuint_12 (
        .y(_T_98),
        .in(_gen2__io_clkDivOut_2)
    );
    wire _T_101_0;
    wire _T_101_1;
    wire _T_101_2;
    wire _gen3__clock;
    wire _gen3__reset;
    wire _gen3__io_inClk;
    wire _gen3__io_bbOutClk_0;
    wire _gen3__io_bbOutClk_1;
    wire _gen3__io_bbOutClk_2;
    wire _gen3__io_clkDivOut_0;
    wire _gen3__io_clkDivOut_1;
    wire _gen3__io_clkDivOut_2;
    ModWithNestedClk_2 gen3 (
        .clock(_gen3__clock),
        .reset(_gen3__reset),
        .io_inClk(_gen3__io_inClk),
        .io_bbOutClk_0(_gen3__io_bbOutClk_0),
        .io_bbOutClk_1(_gen3__io_bbOutClk_1),
        .io_bbOutClk_2(_gen3__io_bbOutClk_2),
        .io_clkDivOut_0(_gen3__io_clkDivOut_0),
        .io_clkDivOut_1(_gen3__io_clkDivOut_1),
        .io_clkDivOut_2(_gen3__io_clkDivOut_2)
    );
    wire _T_107;
    ASUINT #(.width(1)) asuint_13 (
        .y(_T_107),
        .in(_gen3__io_bbOutClk_0)
    );
    wire _T_108;
    ASUINT #(.width(1)) asuint_14 (
        .y(_T_108),
        .in(_gen3__io_bbOutClk_1)
    );
    wire _T_109;
    ASUINT #(.width(1)) asuint_15 (
        .y(_T_109),
        .in(_gen3__io_bbOutClk_2)
    );
    wire _T_112_0;
    wire _T_112_1;
    wire _T_112_2;
    wire _T_118;
    ASUINT #(.width(1)) asuint_16 (
        .y(_T_118),
        .in(_gen3__io_clkDivOut_0)
    );
    wire _T_119;
    ASUINT #(.width(1)) asuint_17 (
        .y(_T_119),
        .in(_gen3__io_clkDivOut_1)
    );
    wire _T_120;
    ASUINT #(.width(1)) asuint_18 (
        .y(_T_120),
        .in(_gen3__io_clkDivOut_2)
    );
    wire _T_123_0;
    wire _T_123_1;
    wire _T_123_2;
    assign _T_101_0 = _T_96;
    assign _T_101_1 = _T_97;
    assign _T_101_2 = _T_98;
    assign _T_112_0 = _T_107;
    assign _T_112_1 = _T_108;
    assign _T_112_2 = _T_109;
    assign _T_123_0 = _T_118;
    assign _T_123_1 = _T_119;
    assign _T_123_2 = _T_120;
    assign _T_68_0 = _T_63;
    assign _T_68_1 = _T_64;
    assign _T_68_2 = _T_65;
    assign _T_79_0 = _T_74;
    assign _T_79_1 = _T_75;
    assign _T_79_2 = _T_76;
    assign _T_90_0 = _T_85;
    assign _T_90_1 = _T_86;
    assign _T_90_2 = _T_87;
    assign _gen1__clock = clock;
    assign _gen1__io_inClk = clock;
    assign _gen1__reset = reset;
    assign _gen2__clock = clock;
    assign _gen2__io_inClk = _gen1__io_clkDivOut_2;
    assign _gen2__reset = reset;
    assign _gen3__clock = clock;
    assign _gen3__io_inClk = _gen1__io_clkDivOut_2;
    assign _gen3__reset = reset;
    assign io_gen1_bbOutClk_0 = _T_68_0;
    assign io_gen1_bbOutClk_1 = _T_68_1;
    assign io_gen1_bbOutClk_2 = _T_68_2;
    assign io_gen1_clkDivOut_0 = _T_79_0;
    assign io_gen1_clkDivOut_1 = _T_79_1;
    assign io_gen1_clkDivOut_2 = _T_79_2;
    assign io_gen2_bbOutClk_0 = _T_90_0;
    assign io_gen2_bbOutClk_1 = _T_90_1;
    assign io_gen2_bbOutClk_2 = _T_90_2;
    assign io_gen2_clkDivOut_0 = _T_101_0;
    assign io_gen2_clkDivOut_1 = _T_101_1;
    assign io_gen2_clkDivOut_2 = _T_101_2;
    assign io_gen3_bbOutClk_0 = _T_112_0;
    assign io_gen3_bbOutClk_1 = _T_112_1;
    assign io_gen3_bbOutClk_2 = _T_112_2;
    assign io_gen3_clkDivOut_0 = _T_123_0;
    assign io_gen3_clkDivOut_1 = _T_123_1;
    assign io_gen3_clkDivOut_2 = _T_123_2;
endmodule //TopModuleWithClks
module ModWithNestedClk(
    input clock,
    input reset,
    input io_inClk,
    output io_bbOutClk_0,
    output io_bbOutClk_1,
    output io_bbOutClk_2,
    output io_clkDivOut_0,
    output io_clkDivOut_1,
    output io_clkDivOut_2
);
    wire _bb__outClk_0;
    wire _bb__outClk_1;
    wire _bb__outClk_2;
    wire _bb__inClk;
    FakeBBClk bb (
        .outClk_0(_bb__outClk_0),
        .outClk_1(_bb__outClk_1),
        .outClk_2(_bb__outClk_2),
        .inClk(_bb__inClk)
    );
    wire _clkDiv__clock;
    wire _clkDiv__reset;
    wire _clkDiv__io_reset;
    wire _clkDiv__io_inClk;
    wire _clkDiv__io_outClks_3;
    wire _clkDiv__io_outClks_1;
    wire _clkDiv__io_outClks_0;
    SEClkDivider clkDiv (
        .clock(_clkDiv__clock),
        .reset(_clkDiv__reset),
        .io_reset(_clkDiv__io_reset),
        .io_inClk(_clkDiv__io_inClk),
        .io_outClks_3(_clkDiv__io_outClks_3),
        .io_outClks_1(_clkDiv__io_outClks_1),
        .io_outClks_0(_clkDiv__io_outClks_0)
    );
    assign _bb__inClk = io_inClk;
    assign _clkDiv__clock = clock;
    assign _clkDiv__io_inClk = io_inClk;
    assign _clkDiv__io_reset = reset;
    assign _clkDiv__reset = reset;
    assign io_bbOutClk_0 = _bb__outClk_0;
    assign io_bbOutClk_1 = _bb__outClk_1;
    assign io_bbOutClk_2 = _bb__outClk_2;
    assign io_clkDivOut_0 = _clkDiv__io_outClks_0;
    assign io_clkDivOut_1 = _clkDiv__io_outClks_1;
    assign io_clkDivOut_2 = _clkDiv__io_outClks_3;
endmodule //ModWithNestedClk
module SEClkDivider(
    input clock,
    input reset,
    input io_reset,
    input io_inClk,
    output io_outClks_3,
    output io_outClks_1,
    output io_outClks_0
);
    wire _AsyncRegInit__out;
    wire _AsyncRegInit__in;
    wire _AsyncRegInit__init;
    wire _AsyncRegInit__reset;
    wire _AsyncRegInit__clk;
    AsyncRegInit AsyncRegInit (
        .out(_AsyncRegInit__out),
        .in(_AsyncRegInit__in),
        .init(_AsyncRegInit__init),
        .reset(_AsyncRegInit__reset),
        .clk(_AsyncRegInit__clk)
    );
    wire _AsyncRegInit_1__out;
    wire _AsyncRegInit_1__in;
    wire _AsyncRegInit_1__init;
    wire _AsyncRegInit_1__reset;
    wire _AsyncRegInit_1__clk;
    AsyncRegInit AsyncRegInit_1 (
        .out(_AsyncRegInit_1__out),
        .in(_AsyncRegInit_1__in),
        .init(_AsyncRegInit_1__init),
        .reset(_AsyncRegInit_1__reset),
        .clk(_AsyncRegInit_1__clk)
    );
    wire _AsyncRegInit_2__out;
    wire _AsyncRegInit_2__in;
    wire _AsyncRegInit_2__init;
    wire _AsyncRegInit_2__reset;
    wire _AsyncRegInit_2__clk;
    AsyncRegInit AsyncRegInit_2 (
        .out(_AsyncRegInit_2__out),
        .in(_AsyncRegInit_2__in),
        .init(_AsyncRegInit_2__init),
        .reset(_AsyncRegInit_2__reset),
        .clk(_AsyncRegInit_2__clk)
    );
    wire _AsyncRegInit_3__out;
    wire _AsyncRegInit_3__in;
    wire _AsyncRegInit_3__init;
    wire _AsyncRegInit_3__reset;
    wire _AsyncRegInit_3__clk;
    AsyncRegInit AsyncRegInit_3 (
        .out(_AsyncRegInit_3__out),
        .in(_AsyncRegInit_3__in),
        .init(_AsyncRegInit_3__init),
        .reset(_AsyncRegInit_3__reset),
        .clk(_AsyncRegInit_3__clk)
    );
    wire _T_22;
    assign _T_22 = _AsyncRegInit__out;
    wire _T_23;
    assign _T_23 = _AsyncRegInit_1__out;
    wire _T_24;
    assign _T_24 = _AsyncRegInit_3__out;
    assign _AsyncRegInit__clk = io_inClk;
    assign _AsyncRegInit__in = _AsyncRegInit_3__out;
    assign _AsyncRegInit__init = 1'h1;
    assign _AsyncRegInit__reset = io_reset;
    assign _AsyncRegInit_1__clk = io_inClk;
    assign _AsyncRegInit_1__in = _AsyncRegInit__out;
    assign _AsyncRegInit_1__init = 1'h0;
    assign _AsyncRegInit_1__reset = io_reset;
    assign _AsyncRegInit_2__clk = io_inClk;
    assign _AsyncRegInit_2__in = _AsyncRegInit_1__out;
    assign _AsyncRegInit_2__init = 1'h0;
    assign _AsyncRegInit_2__reset = io_reset;
    assign _AsyncRegInit_3__clk = io_inClk;
    assign _AsyncRegInit_3__in = _AsyncRegInit_2__out;
    assign _AsyncRegInit_3__init = 1'h0;
    assign _AsyncRegInit_3__reset = io_reset;
    assign io_outClks_0 = _T_22;
    assign io_outClks_1 = _T_23;
    assign io_outClks_3 = _T_24;
endmodule //SEClkDivider
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module ModWithNestedClk_1(
    input clock,
    input reset,
    input io_inClk,
    output io_bbOutClk_0,
    output io_bbOutClk_1,
    output io_bbOutClk_2,
    output io_clkDivOut_0,
    output io_clkDivOut_1,
    output io_clkDivOut_2
);
    wire _bb__outClk_0;
    wire _bb__outClk_1;
    wire _bb__outClk_2;
    wire _bb__inClk;
    FakeBBClk bb (
        .outClk_0(_bb__outClk_0),
        .outClk_1(_bb__outClk_1),
        .outClk_2(_bb__outClk_2),
        .inClk(_bb__inClk)
    );
    wire _clkDiv__clock;
    wire _clkDiv__reset;
    wire _clkDiv__io_reset;
    wire _clkDiv__io_inClk;
    wire _clkDiv__io_outClks_3;
    wire _clkDiv__io_outClks_1;
    wire _clkDiv__io_outClks_0;
    SEClkDivider_1 clkDiv (
        .clock(_clkDiv__clock),
        .reset(_clkDiv__reset),
        .io_reset(_clkDiv__io_reset),
        .io_inClk(_clkDiv__io_inClk),
        .io_outClks_3(_clkDiv__io_outClks_3),
        .io_outClks_1(_clkDiv__io_outClks_1),
        .io_outClks_0(_clkDiv__io_outClks_0)
    );
    assign _bb__inClk = io_inClk;
    assign _clkDiv__clock = clock;
    assign _clkDiv__io_inClk = io_inClk;
    assign _clkDiv__io_reset = reset;
    assign _clkDiv__reset = reset;
    assign io_bbOutClk_0 = _bb__outClk_0;
    assign io_bbOutClk_1 = _bb__outClk_1;
    assign io_bbOutClk_2 = _bb__outClk_2;
    assign io_clkDivOut_0 = _clkDiv__io_outClks_0;
    assign io_clkDivOut_1 = _clkDiv__io_outClks_1;
    assign io_clkDivOut_2 = _clkDiv__io_outClks_3;
endmodule //ModWithNestedClk_1
module SEClkDivider_1(
    input clock,
    input reset,
    input io_reset,
    input io_inClk,
    output io_outClks_3,
    output io_outClks_1,
    output io_outClks_0
);
    wire _AsyncRegInit__out;
    wire _AsyncRegInit__in;
    wire _AsyncRegInit__init;
    wire _AsyncRegInit__reset;
    wire _AsyncRegInit__clk;
    AsyncRegInit AsyncRegInit (
        .out(_AsyncRegInit__out),
        .in(_AsyncRegInit__in),
        .init(_AsyncRegInit__init),
        .reset(_AsyncRegInit__reset),
        .clk(_AsyncRegInit__clk)
    );
    wire _AsyncRegInit_1__out;
    wire _AsyncRegInit_1__in;
    wire _AsyncRegInit_1__init;
    wire _AsyncRegInit_1__reset;
    wire _AsyncRegInit_1__clk;
    AsyncRegInit AsyncRegInit_1 (
        .out(_AsyncRegInit_1__out),
        .in(_AsyncRegInit_1__in),
        .init(_AsyncRegInit_1__init),
        .reset(_AsyncRegInit_1__reset),
        .clk(_AsyncRegInit_1__clk)
    );
    wire _AsyncRegInit_2__out;
    wire _AsyncRegInit_2__in;
    wire _AsyncRegInit_2__init;
    wire _AsyncRegInit_2__reset;
    wire _AsyncRegInit_2__clk;
    AsyncRegInit AsyncRegInit_2 (
        .out(_AsyncRegInit_2__out),
        .in(_AsyncRegInit_2__in),
        .init(_AsyncRegInit_2__init),
        .reset(_AsyncRegInit_2__reset),
        .clk(_AsyncRegInit_2__clk)
    );
    wire _AsyncRegInit_3__out;
    wire _AsyncRegInit_3__in;
    wire _AsyncRegInit_3__init;
    wire _AsyncRegInit_3__reset;
    wire _AsyncRegInit_3__clk;
    AsyncRegInit AsyncRegInit_3 (
        .out(_AsyncRegInit_3__out),
        .in(_AsyncRegInit_3__in),
        .init(_AsyncRegInit_3__init),
        .reset(_AsyncRegInit_3__reset),
        .clk(_AsyncRegInit_3__clk)
    );
    wire _T_22;
    assign _T_22 = _AsyncRegInit_1__out;
    wire _T_23;
    assign _T_23 = _AsyncRegInit_2__out;
    wire _T_24;
    assign _T_24 = _AsyncRegInit__out;
    assign _AsyncRegInit__clk = io_inClk;
    assign _AsyncRegInit__in = _AsyncRegInit_3__out;
    assign _AsyncRegInit__init = 1'h1;
    assign _AsyncRegInit__reset = io_reset;
    assign _AsyncRegInit_1__clk = io_inClk;
    assign _AsyncRegInit_1__in = _AsyncRegInit__out;
    assign _AsyncRegInit_1__init = 1'h0;
    assign _AsyncRegInit_1__reset = io_reset;
    assign _AsyncRegInit_2__clk = io_inClk;
    assign _AsyncRegInit_2__in = _AsyncRegInit_1__out;
    assign _AsyncRegInit_2__init = 1'h0;
    assign _AsyncRegInit_2__reset = io_reset;
    assign _AsyncRegInit_3__clk = io_inClk;
    assign _AsyncRegInit_3__in = _AsyncRegInit_2__out;
    assign _AsyncRegInit_3__init = 1'h0;
    assign _AsyncRegInit_3__reset = io_reset;
    assign io_outClks_0 = _T_22;
    assign io_outClks_1 = _T_23;
    assign io_outClks_3 = _T_24;
endmodule //SEClkDivider_1
module ModWithNestedClk_2(
    input clock,
    input reset,
    input io_inClk,
    output io_bbOutClk_0,
    output io_bbOutClk_1,
    output io_bbOutClk_2,
    output io_clkDivOut_0,
    output io_clkDivOut_1,
    output io_clkDivOut_2
);
    wire _bb__outClk_0;
    wire _bb__outClk_1;
    wire _bb__outClk_2;
    wire _bb__inClk;
    FakeBBClk bb (
        .outClk_0(_bb__outClk_0),
        .outClk_1(_bb__outClk_1),
        .outClk_2(_bb__outClk_2),
        .inClk(_bb__inClk)
    );
    wire _clkDiv__clock;
    wire _clkDiv__reset;
    wire _clkDiv__io_reset;
    wire _clkDiv__io_inClk;
    wire _clkDiv__io_outClks_3;
    wire _clkDiv__io_outClks_1;
    wire _clkDiv__io_outClks_0;
    SEClkDivider_2 clkDiv (
        .clock(_clkDiv__clock),
        .reset(_clkDiv__reset),
        .io_reset(_clkDiv__io_reset),
        .io_inClk(_clkDiv__io_inClk),
        .io_outClks_3(_clkDiv__io_outClks_3),
        .io_outClks_1(_clkDiv__io_outClks_1),
        .io_outClks_0(_clkDiv__io_outClks_0)
    );
    assign _bb__inClk = io_inClk;
    assign _clkDiv__clock = clock;
    assign _clkDiv__io_inClk = io_inClk;
    assign _clkDiv__io_reset = reset;
    assign _clkDiv__reset = reset;
    assign io_bbOutClk_0 = _bb__outClk_0;
    assign io_bbOutClk_1 = _bb__outClk_1;
    assign io_bbOutClk_2 = _bb__outClk_2;
    assign io_clkDivOut_0 = _clkDiv__io_outClks_0;
    assign io_clkDivOut_1 = _clkDiv__io_outClks_1;
    assign io_clkDivOut_2 = _clkDiv__io_outClks_3;
endmodule //ModWithNestedClk_2
module SEClkDivider_2(
    input clock,
    input reset,
    input io_reset,
    input io_inClk,
    output io_outClks_3,
    output io_outClks_1,
    output io_outClks_0
);
    wire _AsyncRegInit__out;
    wire _AsyncRegInit__in;
    wire _AsyncRegInit__init;
    wire _AsyncRegInit__reset;
    wire _AsyncRegInit__clk;
    AsyncRegInit AsyncRegInit (
        .out(_AsyncRegInit__out),
        .in(_AsyncRegInit__in),
        .init(_AsyncRegInit__init),
        .reset(_AsyncRegInit__reset),
        .clk(_AsyncRegInit__clk)
    );
    wire _AsyncRegInit_1__out;
    wire _AsyncRegInit_1__in;
    wire _AsyncRegInit_1__init;
    wire _AsyncRegInit_1__reset;
    wire _AsyncRegInit_1__clk;
    AsyncRegInit AsyncRegInit_1 (
        .out(_AsyncRegInit_1__out),
        .in(_AsyncRegInit_1__in),
        .init(_AsyncRegInit_1__init),
        .reset(_AsyncRegInit_1__reset),
        .clk(_AsyncRegInit_1__clk)
    );
    wire _AsyncRegInit_2__out;
    wire _AsyncRegInit_2__in;
    wire _AsyncRegInit_2__init;
    wire _AsyncRegInit_2__reset;
    wire _AsyncRegInit_2__clk;
    AsyncRegInit AsyncRegInit_2 (
        .out(_AsyncRegInit_2__out),
        .in(_AsyncRegInit_2__in),
        .init(_AsyncRegInit_2__init),
        .reset(_AsyncRegInit_2__reset),
        .clk(_AsyncRegInit_2__clk)
    );
    wire _AsyncRegInit_3__out;
    wire _AsyncRegInit_3__in;
    wire _AsyncRegInit_3__init;
    wire _AsyncRegInit_3__reset;
    wire _AsyncRegInit_3__clk;
    AsyncRegInit AsyncRegInit_3 (
        .out(_AsyncRegInit_3__out),
        .in(_AsyncRegInit_3__in),
        .init(_AsyncRegInit_3__init),
        .reset(_AsyncRegInit_3__reset),
        .clk(_AsyncRegInit_3__clk)
    );
    wire _T_22;
    assign _T_22 = _AsyncRegInit_1__out;
    wire _T_23;
    assign _T_23 = _AsyncRegInit_2__out;
    wire _T_24;
    assign _T_24 = _AsyncRegInit__out;
    assign _AsyncRegInit__clk = io_inClk;
    assign _AsyncRegInit__in = _AsyncRegInit_3__out;
    assign _AsyncRegInit__init = 1'h1;
    assign _AsyncRegInit__reset = io_reset;
    assign _AsyncRegInit_1__clk = io_inClk;
    assign _AsyncRegInit_1__in = _AsyncRegInit__out;
    assign _AsyncRegInit_1__init = 1'h0;
    assign _AsyncRegInit_1__reset = io_reset;
    assign _AsyncRegInit_2__clk = io_inClk;
    assign _AsyncRegInit_2__in = _AsyncRegInit_1__out;
    assign _AsyncRegInit_2__init = 1'h0;
    assign _AsyncRegInit_2__reset = io_reset;
    assign _AsyncRegInit_3__clk = io_inClk;
    assign _AsyncRegInit_3__in = _AsyncRegInit_2__out;
    assign _AsyncRegInit_3__init = 1'h0;
    assign _AsyncRegInit_3__reset = io_reset;
    assign io_outClks_0 = _T_22;
    assign io_outClks_1 = _T_23;
    assign io_outClks_3 = _T_24;
endmodule //SEClkDivider_2
