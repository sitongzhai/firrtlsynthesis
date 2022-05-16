module ZeroPortMem(
    input clock,
    input reset
);
    wire [31:0] foo;
    assign foo = 32'hDEADBEEF;
endmodule //ZeroPortMem
