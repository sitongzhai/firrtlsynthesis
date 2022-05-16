module OpShift(
    input clock,
    input reset,
    input [7:0] io_u0,
    input [2:0] io_u1,
    input [7:0] io_s0,
    output [9:0] io_uout_shl,
    output [5:0] io_uout_shr,
    output [9:0] io_sout_shl,
    output [5:0] io_sout_shr,
    output [14:0] io_uout_dshl,
    output [7:0] io_uout_dshr,
    output [14:0] io_sout_dshl,
    output [7:0] io_sout_dshr
);
    wire [9:0] _T_27;
    SHL_UNSIGNED #(.width(8), .n(2)) u_shl_1 (
        .y(_T_27),
        .in(io_u0)
    );
    wire _T_28;
    SHR_UNSIGNED #(.width(8), .n(8)) u_shr_2 (
        .y(_T_28),
        .in(io_u0)
    );
    wire [9:0] _T_29;
    SHL_SIGNED #(.width(8), .n(2)) s_shl_3 (
        .y(_T_29),
        .in(io_s0)
    );
    wire _T_30;
    SHR_SIGNED #(.width(8), .n(8)) s_shr_4 (
        .y(_T_30),
        .in(io_s0)
    );
    wire [14:0] _T_31;
    DSHL_UNSIGNED #(.width_in(8), .width_n(3)) u_dshl_5 (
        .y(_T_31),
        .in(io_u0),
        .n(io_u1)
    );
    wire [7:0] _T_32;
    DSHR_UNSIGNED #(.width_in(8), .width_n(3)) u_dshr_6 (
        .y(_T_32),
        .in(io_u0),
        .n(io_u1)
    );
    wire [14:0] _T_33;
    DSHL_SIGNED #(.width_in(8), .width_n(3)) s_dshl_7 (
        .y(_T_33),
        .in(io_s0),
        .n(io_u1)
    );
    wire [7:0] _T_34;
    DSHR_SIGNED #(.width_in(8), .width_n(3)) s_dshr_8 (
        .y(_T_34),
        .in(io_s0),
        .n(io_u1)
    );
    assign io_sout_dshl = _T_33;
    assign io_sout_dshr = _T_34;
    assign io_sout_shl = _T_29;
    PAD_SIGNED #(.width(1), .n(6)) s_pad_9 (
        .y(io_sout_shr),
        .in(_T_30)
    );
    assign io_uout_dshl = _T_31;
    assign io_uout_dshr = _T_32;
    assign io_uout_shl = _T_27;
    PAD_UNSIGNED #(.width(1), .n(6)) u_pad_10 (
        .y(io_uout_shr),
        .in(_T_28)
    );
endmodule //OpShift
module SHL_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{1'b0}}, in};
    assign y = temp << n;
endmodule // SHL_UNSIGNED
module SHR_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 2;
    output [(n < width ? (width-n-1) : 0):0] y;
    input [width-1:0] in;
    assign y = n < width ? in[width-1:n] : 1'b0;
endmodule // SHR_UNSIGNED
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
module DSHL_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [(width_in+2**width_n-1)-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    wire [(width_in+2**width_n-1)-1:0] temp;
    assign temp = {{(2**width_n-1){1'b0}}, in};
    assign y = temp << n;
endmodule // DSHL_UNSIGNED
module DSHR_UNSIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = in >> n;
endmodule // DSHR_UNSIGNED
module DSHL_SIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [(width_in+2**width_n-1)-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    wire [(width_in+2**width_n-1)-1:0] temp;
    assign temp = {{(2**width_n-1){in[width_in-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // DSHL_SIGNED
module DSHR_SIGNED(y, in, n);
    parameter width_in = 4;
    parameter width_n = 2;
    output [width_in-1:0] y;
    input [width_in-1:0] in;
    input [width_n-1:0] n;
    assign y = $signed(in) >>> n;
endmodule // DSHR_SIGNED
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
