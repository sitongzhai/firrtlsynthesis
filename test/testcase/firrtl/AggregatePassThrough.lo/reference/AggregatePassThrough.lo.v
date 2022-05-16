module AggregatePassThrough(
    input clock,
    input reset,
    input [3:0] io_inputAggregate_u0,
    input [3:0] io_inputAggregate_u1,
    input [3:0] io_inputAggregate_u2,
    input [3:0] io_inputAggregate_u3,
    input [3:0] io_inputAggregate_u4,
    output [3:0] io_outputAggregate_u0,
    output [3:0] io_outputAggregate_u1,
    output [3:0] io_outputAggregate_u2,
    output [3:0] io_outputAggregate_u3,
    output [3:0] io_outputAggregate_u4,
    output [19:0] io_aggregateAsUInt,
    output [3:0] io_outputFromUInt_u0,
    output [3:0] io_outputFromUInt_u1,
    output [3:0] io_outputFromUInt_u2,
    output [3:0] io_outputFromUInt_u3,
    output [3:0] io_outputFromUInt_u4
);
    wire [3:0] _aggregateRegister_u0__q;
    wire [3:0] _aggregateRegister_u0__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_u0 (
        .q(_aggregateRegister_u0__q),
        .d(_aggregateRegister_u0__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_u1__q;
    wire [3:0] _aggregateRegister_u1__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_u1 (
        .q(_aggregateRegister_u1__q),
        .d(_aggregateRegister_u1__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_u2__q;
    wire [3:0] _aggregateRegister_u2__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_u2 (
        .q(_aggregateRegister_u2__q),
        .d(_aggregateRegister_u2__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_u3__q;
    wire [3:0] _aggregateRegister_u3__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_u3 (
        .q(_aggregateRegister_u3__q),
        .d(_aggregateRegister_u3__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_u4__q;
    wire [3:0] _aggregateRegister_u4__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_u4 (
        .q(_aggregateRegister_u4__q),
        .d(_aggregateRegister_u4__d),
        .clk(clock)
    );
    wire [7:0] _T_8;
    CAT #(.width_a(4), .width_b(4)) cat_1 (
        .y(_T_8),
        .a(_aggregateRegister_u3__q),
        .b(_aggregateRegister_u4__q)
    );
    wire [7:0] _T_9;
    CAT #(.width_a(4), .width_b(4)) cat_2 (
        .y(_T_9),
        .a(_aggregateRegister_u0__q),
        .b(_aggregateRegister_u1__q)
    );
    wire [11:0] _T_10;
    CAT #(.width_a(8), .width_b(4)) cat_3 (
        .y(_T_10),
        .a(_T_9),
        .b(_aggregateRegister_u2__q)
    );
    wire [19:0] _T_11;
    CAT #(.width_a(12), .width_b(8)) cat_4 (
        .y(_T_11),
        .a(_T_10),
        .b(_T_8)
    );
    wire [3:0] _T_14_u0;
    wire [3:0] _T_14_u1;
    wire [3:0] _T_14_u2;
    wire [3:0] _T_14_u3;
    wire [3:0] _T_14_u4;
    wire [7:0] _T_15;
    CAT #(.width_a(4), .width_b(4)) cat_5 (
        .y(_T_15),
        .a(_aggregateRegister_u3__q),
        .b(_aggregateRegister_u4__q)
    );
    wire [7:0] _T_16;
    CAT #(.width_a(4), .width_b(4)) cat_6 (
        .y(_T_16),
        .a(_aggregateRegister_u0__q),
        .b(_aggregateRegister_u1__q)
    );
    wire [11:0] _T_17;
    CAT #(.width_a(8), .width_b(4)) cat_7 (
        .y(_T_17),
        .a(_T_16),
        .b(_aggregateRegister_u2__q)
    );
    wire [19:0] _T_18;
    CAT #(.width_a(12), .width_b(8)) cat_8 (
        .y(_T_18),
        .a(_T_17),
        .b(_T_15)
    );
    wire [19:0] _T_20;
    wire [3:0] _T_21;
    BITS #(.width(20), .high(3), .low(0)) bits_9 (
        .y(_T_21),
        .in(_T_20)
    );
    wire [3:0] _T_22;
    BITS #(.width(20), .high(7), .low(4)) bits_10 (
        .y(_T_22),
        .in(_T_20)
    );
    wire [3:0] _T_23;
    BITS #(.width(20), .high(11), .low(8)) bits_11 (
        .y(_T_23),
        .in(_T_20)
    );
    wire [3:0] _T_24;
    BITS #(.width(20), .high(15), .low(12)) bits_12 (
        .y(_T_24),
        .in(_T_20)
    );
    wire [3:0] _T_25;
    BITS #(.width(20), .high(19), .low(16)) bits_13 (
        .y(_T_25),
        .in(_T_20)
    );
    assign _T_14_u0 = _T_25;
    assign _T_14_u1 = _T_24;
    assign _T_14_u2 = _T_23;
    assign _T_14_u3 = _T_22;
    assign _T_14_u4 = _T_21;
    assign _T_20 = _T_18;
    assign _aggregateRegister_u0__d = io_inputAggregate_u0;
    assign _aggregateRegister_u1__d = io_inputAggregate_u1;
    assign _aggregateRegister_u2__d = io_inputAggregate_u2;
    assign _aggregateRegister_u3__d = io_inputAggregate_u3;
    assign _aggregateRegister_u4__d = io_inputAggregate_u4;
    assign io_aggregateAsUInt = _T_11;
    assign io_outputAggregate_u0 = _aggregateRegister_u0__q;
    assign io_outputAggregate_u1 = _aggregateRegister_u1__q;
    assign io_outputAggregate_u2 = _aggregateRegister_u2__q;
    assign io_outputAggregate_u3 = _aggregateRegister_u3__q;
    assign io_outputAggregate_u4 = _aggregateRegister_u4__q;
    assign io_outputFromUInt_u0 = _T_14_u0;
    assign io_outputFromUInt_u1 = _T_14_u1;
    assign io_outputFromUInt_u2 = _T_14_u2;
    assign io_outputFromUInt_u3 = _T_14_u3;
    assign io_outputFromUInt_u4 = _T_14_u4;
endmodule //AggregatePassThrough
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module CAT(y, a, b);
    parameter width_a = 4;
    parameter width_b = 4;
    output [width_a+width_b-1:0] y;
    input [width_a-1:0] a;
    input [width_b-1:0] b;
    assign y = {a, b};
endmodule // CAT
module BITS(y, in);
    parameter width = 4;
    parameter high = 2;
    parameter low = 0;
    output [high-low:0] y;
    input [width-1:0] in;
    assign y = in[high:low];
endmodule // BITS
