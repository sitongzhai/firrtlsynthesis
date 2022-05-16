module BBWrapper(
    input clock,
    input reset,
    input io_a,
    input io_b,
    output io_result
);
    wire _tb__result;
    wire _tb__b;
    wire _tb__a;
    BBAnd tb (
        .result(_tb__result),
        .b(_tb__b),
        .a(_tb__a)
    );
    assign io_result = _tb__result;
    assign _tb__a = io_a;
    assign _tb__b = io_b;
endmodule //BBWrapper
