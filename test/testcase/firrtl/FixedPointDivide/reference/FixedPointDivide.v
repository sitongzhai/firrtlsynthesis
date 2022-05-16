module FixedPointDivide(
    input clock,
    input reset,
    input [9:0] io_in,
    output [9:0] io_out
);
    wire [9:0] _T_2;
    ASUINT #(.width(10)) asuint_1 (
        .y(_T_2),
        .in(io_in)
    );
    wire [7:0] _T_3;
    SHR_UNSIGNED #(.width(10), .n(2)) u_shr_2 (
        .y(_T_3),
        .in(_T_2)
    );
    wire [7:0] _T_4;
    ASSINT #(.width(8)) assint_3 (
        .y(_T_4),
        .in(_T_3)
    );
    PAD_SIGNED #(.width(8), .n(10)) s_pad_4 (
        .y(io_out),
        .in(_T_4)
    );
endmodule //FixedPointDivide
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module SHR_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : 1'b0;
endmodule // SHR_UNSIGNED
module ASSINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $signed(in);
endmodule // ASSINT
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
