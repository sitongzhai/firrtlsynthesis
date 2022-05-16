module LargeParamTester(
    input clock,
    input reset
);
    wire _mod1__out;
    LargeParam #(.WIDTH(1), .DATA(0)) mod1 (
        .out(_mod1__out)
    );
    wire [127:0] _mod2__out;
    LargeParam #(.WIDTH(128), .DATA(9223372036854775807000)) mod2 (
        .out(_mod2__out)
    );
    wire [127:0] _mod3__out;
    LargeParam #(.WIDTH(128), .DATA(-9223372036854775807000)) mod3 (
        .out(_mod3__out)
    );
endmodule //LargeParamTester
