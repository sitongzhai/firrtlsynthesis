module UsesBBAddOne(
    input clock,
    input reset,
    input [15:0] io_in,
    output [15:0] io_out1,
    output [15:0] io_out2,
    output [15:0] io_out3
);
    wire [15:0] _bbAddOne__out;
    wire [15:0] _bbAddOne__in;
    BBAddOne bbAddOne (
        .out(_bbAddOne__out),
        .in(_bbAddOne__in)
    );
    wire [15:0] _bbAddTwo__out;
    wire [15:0] _bbAddTwo__in;
    BBAddTwo bbAddTwo (
        .out(_bbAddTwo__out),
        .in(_bbAddTwo__in)
    );
    wire [15:0] _bbAddThree__out;
    wire [15:0] _bbAddThree__in;
    BBAddThree bbAddThree (
        .out(_bbAddThree__out),
        .in(_bbAddThree__in)
    );
    assign _bbAddOne__in = io_in;
    assign _bbAddThree__in = io_in;
    assign _bbAddTwo__in = io_in;
    assign io_out1 = _bbAddOne__out;
    assign io_out2 = _bbAddTwo__out;
    assign io_out3 = _bbAddThree__out;
endmodule //UsesBBAddOne
