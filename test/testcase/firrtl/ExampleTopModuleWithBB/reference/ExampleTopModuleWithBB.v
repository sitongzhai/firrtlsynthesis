module ExampleTopModuleWithBB(
    input clock,
    input reset,
    input [14:0] io_a,
    input [14:0] io_b,
    input [13:0] io_c,
    output [15:0] io_x,
    output [15:0] io_y,
    output [15:0] io_z,
    inout [2:0] io_analog1,
    inout [2:0] io_analog2,
    output [4:0] io_v_0,
    output [4:0] io_v_1,
    output [4:0] io_v_2
);
    wire [15:0] _bb__z;
    wire [13:0] _bb__c;
    BB bb (
        .analog2(io_analog2),
        .analog1(io_analog1),
        .z(_bb__z),
        .c(_bb__c)
    );
    wire [15:0] _T_24;
    wire [14:0] _WTEMP_0;
    PAD_UNSIGNED #(.width(1), .n(15)) u_pad_1 (
        .y(_WTEMP_0),
        .in(1'h1)
    );
    ADD_UNSIGNED #(.width(15)) u_add_2 (
        .y(_T_24),
        .a(io_a),
        .b(_WTEMP_0)
    );
    wire [14:0] _T_25;
    TAIL #(.width(16), .n(1)) tail_3 (
        .y(_T_25),
        .in(_T_24)
    );
    wire [15:0] _T_27;
    wire [14:0] _WTEMP_1;
    PAD_UNSIGNED #(.width(1), .n(15)) u_pad_4 (
        .y(_WTEMP_1),
        .in(1'h1)
    );
    SUB_UNSIGNED #(.width(15)) u_sub_5 (
        .y(_T_27),
        .a(io_b),
        .b(_WTEMP_1)
    );
    wire [15:0] _T_28;
    ASUINT #(.width(16)) asuint_6 (
        .y(_T_28),
        .in(_T_27)
    );
    wire [14:0] _T_29;
    TAIL #(.width(16), .n(1)) tail_7 (
        .y(_T_29),
        .in(_T_28)
    );
    assign _bb__c = io_c;
    BITS #(.width(15), .high(4), .low(0)) bits_8 (
        .y(io_v_0),
        .in(io_a)
    );
    BITS #(.width(15), .high(4), .low(0)) bits_9 (
        .y(io_v_1),
        .in(io_a)
    );
    BITS #(.width(15), .high(4), .low(0)) bits_10 (
        .y(io_v_2),
        .in(io_a)
    );
    PAD_UNSIGNED #(.width(15), .n(16)) u_pad_11 (
        .y(io_x),
        .in(_T_25)
    );
    PAD_UNSIGNED #(.width(15), .n(16)) u_pad_12 (
        .y(io_y),
        .in(_T_29)
    );
    assign io_z = _bb__z;
endmodule //ExampleTopModuleWithBB
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
module ADD_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a + b;
endmodule // ADD_UNSIGNED
module TAIL(y, in);
    parameter width = 4;
    parameter n = 2;
    output [width-n-1:0] y;
    input [width-1:0] in;
    assign y = in[width-n-1:0];
endmodule // TAIL
module SUB_UNSIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = a - b;
endmodule // SUB_UNSIGNED
module ASUINT(y, in);
    parameter width = 4;
    output [width-1:0] y;
    input [width-1:0] in;
    assign y = $unsigned(in);
endmodule // ASUINT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
