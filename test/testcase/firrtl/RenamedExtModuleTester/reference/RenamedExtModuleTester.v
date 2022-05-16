module RenamedExtModuleTester(
    input clock,
    input reset
);
    wire [15:0] _dut__foo;
    wire [15:0] _dut__bar;
    SimpleExtModule dut (
        .foo(_dut__foo),
        .bar(_dut__bar)
    );
    PAD_UNSIGNED #(.width(11), .n(16)) u_pad_1 (
        .y(_dut__foo),
        .in(11'h4D2)
    );
endmodule //RenamedExtModuleTester
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
