module BinaryRepr(
    input clock,
    input reset,
    input [7:0] io_uIn,
    input [7:0] io_sIn,
    input [9:0] io_fIn,
    output io_uOut,
    output io_sOut,
    output io_fOut,
    output [7:0] io_uDiv2,
    output [7:0] io_sDiv2,
    output [9:0] io_fDiv2,
    output [15:0] io_uMul2,
    output [15:0] io_sMul2,
    output [19:0] io_fMul2
);
    wire _T_9;
    BITS #(.width(8), .high(7), .low(7)) bits_1 (
        .y(_T_9),
        .in(io_sIn)
    );
    wire _T_10;
    BITS #(.width(10), .high(9), .low(9)) bits_2 (
        .y(_T_10),
        .in(io_fIn)
    );
    wire [5:0] _T_11;
    SHR_UNSIGNED #(.width(8), .n(2)) u_shr_3 (
        .y(_T_11),
        .in(io_uIn)
    );
    wire [7:0] _T_12;
    ASSINT #(.width(8)) assint_4 (
        .y(_T_12),
        .in(io_sIn)
    );
    wire [9:0] _T_14;
    wire [9:0] _node_0;
    SHL_SIGNED #(.width(8), .n(2)) s_shl_5 (
        .y(_node_0),
        .in(_T_12)
    );
    wire [7:0] _T_16;
    wire [7:0] _T_17;
    SHR_SIGNED #(.width(10), .n(2)) s_shr_6 (
        .y(_T_17),
        .in(_T_14)
    );
    wire [5:0] _T_18;
    SHR_SIGNED #(.width(8), .n(2)) s_shr_7 (
        .y(_T_18),
        .in(_T_16)
    );
    wire [5:0] _T_19;
    ASSINT #(.width(6)) assint_8 (
        .y(_T_19),
        .in(_T_18)
    );
    wire [11:0] _T_21;
    wire [11:0] _node_1;
    SHL_SIGNED #(.width(10), .n(2)) s_shl_9 (
        .y(_node_1),
        .in(io_fIn)
    );
    wire [9:0] _T_23;
    wire [9:0] _T_24;
    SHR_SIGNED #(.width(12), .n(2)) s_shr_10 (
        .y(_T_24),
        .in(_T_21)
    );
    wire [8:0] _T_25;
    SHR_SIGNED #(.width(10), .n(1)) s_shr_11 (
        .y(_T_25),
        .in(_T_23)
    );
    wire [7:0] _node_2;
    SHR_SIGNED #(.width(9), .n(1)) s_shr_12 (
        .y(_node_2),
        .in(_T_25)
    );
    wire [9:0] _T_26;
    SHL_UNSIGNED #(.width(8), .n(2)) u_shl_13 (
        .y(_T_26),
        .in(io_uIn)
    );
    wire [9:0] _T_27;
    SHL_SIGNED #(.width(8), .n(2)) s_shl_14 (
        .y(_T_27),
        .in(io_sIn)
    );
    wire [11:0] _T_28;
    SHL_SIGNED #(.width(10), .n(2)) s_shl_15 (
        .y(_T_28),
        .in(io_fIn)
    );
    assign _T_14 = _node_0;
    assign _T_16 = _T_17;
    assign _T_21 = _node_1;
    assign _T_23 = _T_24;
    PAD_SIGNED #(.width(8), .n(10)) s_pad_16 (
        .y(io_fDiv2),
        .in(_node_2)
    );
    PAD_SIGNED #(.width(12), .n(20)) s_pad_17 (
        .y(io_fMul2),
        .in(_T_28)
    );
    assign io_fOut = _T_10;
    PAD_SIGNED #(.width(6), .n(8)) s_pad_18 (
        .y(io_sDiv2),
        .in(_T_19)
    );
    PAD_SIGNED #(.width(10), .n(16)) s_pad_19 (
        .y(io_sMul2),
        .in(_T_27)
    );
    assign io_sOut = _T_9;
    PAD_UNSIGNED #(.width(6), .n(8)) u_pad_20 (
        .y(io_uDiv2),
        .in(_T_11)
    );
    PAD_UNSIGNED #(.width(10), .n(16)) u_pad_21 (
        .y(io_uMul2),
        .in(_T_26)
    );
    assign io_uOut = 1'h0;
endmodule //BinaryRepr
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
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
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
module SHR_SIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : in[width-1:width-1];
endmodule // SHR_SIGNED
module SHL_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{1'b0}}, in};
    assign y = temp << n;
endmodule // SHL_UNSIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
