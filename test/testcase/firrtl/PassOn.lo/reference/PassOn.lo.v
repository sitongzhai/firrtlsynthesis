module PassOn(
    input clock,
    input reset,
    input [63:0] io_in,
    output [63:0] io_out
);
    assign io_out = io_in;
endmodule //PassOn
