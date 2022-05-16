module MultiExtModuleTester(
    input clock,
    input reset
);
    wire [15:0] _dut1__foo;
    wire [15:0] _dut1__bar;
    SimpleExtModule dut1 (
        .foo(_dut1__foo),
        .bar(_dut1__bar)
    );
    wire [15:0] _dut2__foo;
    wire [15:0] _dut2__bar;
    SimpleExtModule dut2 (
        .foo(_dut2__foo),
        .bar(_dut2__bar)
    );
    wire [15:0] _dut3__foo;
    wire [15:0] _dut3__bar;
    AdderExtModule dut3 (
        .foo(_dut3__foo),
        .bar(_dut3__bar)
    );
    PAD_UNSIGNED #(.width(11), .n(16)) u_pad_1 (
        .y(_dut1__foo),
        .in(11'h4D2)
    );
    PAD_UNSIGNED #(.width(13), .n(16)) u_pad_2 (
        .y(_dut2__foo),
        .in(13'h162E)
    );
    PAD_UNSIGNED #(.width(7), .n(16)) u_pad_3 (
        .y(_dut3__foo),
        .in(7'h64)
    );
endmodule //MultiExtModuleTester
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
