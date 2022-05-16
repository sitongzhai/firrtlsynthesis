module ParameterizedExtModuleTester(
    input clock,
    input reset
);
    wire [15:0] _dut1__foo;
    wire [15:0] _dut1__bar;
    ParameterizedExtModule #(.VALUE(1), .STRING("one"), .REAL(-1.7), .TYP(bit)) dut1 (
        .foo(_dut1__foo),
        .bar(_dut1__bar)
    );
    wire [15:0] _dut2__foo;
    wire [15:0] _dut2__bar;
    ParameterizedExtModule #(.VALUE(2), .STRING("two"), .REAL(2.6E50), .TYP(bit [1:0])) dut2 (
        .foo(_dut2__foo),
        .bar(_dut2__bar)
    );
    PAD_UNSIGNED #(.width(10), .n(16)) u_pad_1 (
        .y(_dut1__foo),
        .in(10'h3E8)
    );
    PAD_UNSIGNED #(.width(10), .n(16)) u_pad_2 (
        .y(_dut2__foo),
        .in(10'h3E8)
    );
endmodule //ParameterizedExtModuleTester
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
