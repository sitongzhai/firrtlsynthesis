module FixedPointShifter(
    input clock,
    input reset,
    input [7:0] io_inValue,
    input [2:0] io_dynamicShiftValue,
    output [16:0] io_shiftLeftResult,
    output [7:0] io_dynamicShiftRightResult,
    output [14:0] io_dynamicShiftLeftResult
);
    wire [16:0] _T_7;
    SHL_SIGNED #(.width(8), .n(9)) s_shl_1 (
        .y(_T_7),
        .in(io_inValue)
    );
    wire [14:0] _T_8;
    DSHL_SIGNED #(.width_in(8), .width_n(3)) s_dshl_2 (
        .y(_T_8),
        .in(io_inValue),
        .n(io_dynamicShiftValue)
    );
    wire [7:0] _T_9;
    DSHR_SIGNED #(.width_in(8), .width_n(3)) s_dshr_3 (
        .y(_T_9),
        .in(io_inValue),
        .n(io_dynamicShiftValue)
    );
    assign io_dynamicShiftLeftResult = _T_8;
    assign io_dynamicShiftRightResult = _T_9;
    assign io_shiftLeftResult = _T_7;
endmodule //FixedPointShifter
module SHL_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [width+n-1:0] y;
    input [width-1:0] in;
    wire [width+n-1:0] temp;
    assign temp = {{n{in[width-1]}}, in};
    assign y = $signed(temp) << n;
endmodule // SHL_SIGNED
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
