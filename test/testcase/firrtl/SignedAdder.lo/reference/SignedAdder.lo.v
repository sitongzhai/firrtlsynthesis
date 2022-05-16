module SignedAdder(
    input clock,
    input reset,
    input [15:0] io_in0,
    input [15:0] io_in1,
    output [15:0] io_out
);
    wire [16:0] _T_5;
    ADD_SIGNED #(.width(16)) s_add_1 (
        .y(_T_5),
        .a(io_in0),
        .b(io_in1)
    );
    wire [15:0] _T_6;
    TAIL #(.width(17), .n(1)) tail_2 (
        .y(_T_6),
        .in(_T_5)
    );
    wire [15:0] _T_7;
    ASSINT #(.width(16)) assint_3 (
        .y(_T_7),
        .in(_T_6)
    );
    assign io_out = _T_7;
endmodule //SignedAdder
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
