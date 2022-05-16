module AggregatePassThrough(
    input clock,
    input reset,
    input [3:0] io_inputAggregate_0,
    input [3:0] io_inputAggregate_1,
    input [3:0] io_inputAggregate_2,
    input [3:0] io_inputAggregate_3,
    input [3:0] io_inputAggregate_4,
    output [3:0] io_outputAggregate_0,
    output [3:0] io_outputAggregate_1,
    output [3:0] io_outputAggregate_2,
    output [3:0] io_outputAggregate_3,
    output [3:0] io_outputAggregate_4,
    output [19:0] io_aggregateAsUInt,
    output [3:0] io_outputFromUInt_0,
    output [3:0] io_outputFromUInt_1,
    output [3:0] io_outputFromUInt_2,
    output [3:0] io_outputFromUInt_3,
    output [3:0] io_outputFromUInt_4
);
    wire [3:0] _aggregateRegister_0__q;
    wire [3:0] _aggregateRegister_0__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_0 (
        .q(_aggregateRegister_0__q),
        .d(_aggregateRegister_0__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_1__q;
    wire [3:0] _aggregateRegister_1__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_1 (
        .q(_aggregateRegister_1__q),
        .d(_aggregateRegister_1__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_2__q;
    wire [3:0] _aggregateRegister_2__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_2 (
        .q(_aggregateRegister_2__q),
        .d(_aggregateRegister_2__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_3__q;
    wire [3:0] _aggregateRegister_3__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_3 (
        .q(_aggregateRegister_3__q),
        .d(_aggregateRegister_3__d),
        .clk(clock)
    );
    wire [3:0] _aggregateRegister_4__q;
    wire [3:0] _aggregateRegister_4__d;
    DFF_POSCLK #(.width(4)) aggregateRegister_4 (
        .q(_aggregateRegister_4__q),
        .d(_aggregateRegister_4__d),
        .clk(clock)
    );
    wire [7:0] _T_46;
    CAT #(.width_a(4), .width_b(4)) cat_1 (
        .y(_T_46),
        .a(_aggregateRegister_1__q),
        .b(_aggregateRegister_0__q)
    );
    wire [7:0] _T_47;
    CAT #(.width_a(4), .width_b(4)) cat_2 (
        .y(_T_47),
        .a(_aggregateRegister_4__q),
        .b(_aggregateRegister_3__q)
    );
    wire [11:0] _T_48;
    CAT #(.width_a(8), .width_b(4)) cat_3 (
        .y(_T_48),
        .a(_T_47),
        .b(_aggregateRegister_2__q)
    );
    wire [19:0] _T_49;
    CAT #(.width_a(12), .width_b(8)) cat_4 (
        .y(_T_49),
        .a(_T_48),
        .b(_T_46)
    );
    wire [7:0] _T_53;
    CAT #(.width_a(4), .width_b(4)) cat_5 (
        .y(_T_53),
        .a(_aggregateRegister_1__q),
        .b(_aggregateRegister_0__q)
    );
    wire [7:0] _T_54;
    CAT #(.width_a(4), .width_b(4)) cat_6 (
        .y(_T_54),
        .a(_aggregateRegister_4__q),
        .b(_aggregateRegister_3__q)
    );
    wire [11:0] _T_55;
    CAT #(.width_a(8), .width_b(4)) cat_7 (
        .y(_T_55),
        .a(_T_54),
        .b(_aggregateRegister_2__q)
    );
    wire [19:0] _T_56;
    CAT #(.width_a(12), .width_b(8)) cat_8 (
        .y(_T_56),
        .a(_T_55),
        .b(_T_53)
    );
    wire [3:0] _T_65_0;
    wire [3:0] _T_65_1;
    wire [3:0] _T_65_2;
    wire [3:0] _T_65_3;
    wire [3:0] _T_65_4;
    wire [19:0] _T_80;
    wire [3:0] _T_81;
    BITS #(.width(20), .high(3), .low(0)) bits_9 (
        .y(_T_81),
        .in(_T_80)
    );
    wire [3:0] _T_82;
    BITS #(.width(20), .high(7), .low(4)) bits_10 (
        .y(_T_82),
        .in(_T_80)
    );
    wire [3:0] _T_83;
    BITS #(.width(20), .high(11), .low(8)) bits_11 (
        .y(_T_83),
        .in(_T_80)
    );
    wire [3:0] _T_84;
    BITS #(.width(20), .high(15), .low(12)) bits_12 (
        .y(_T_84),
        .in(_T_80)
    );
    wire [3:0] _T_85;
    BITS #(.width(20), .high(19), .low(16)) bits_13 (
        .y(_T_85),
        .in(_T_80)
    );
    assign _T_65_0 = _T_81;
    assign _T_65_1 = _T_82;
    assign _T_65_2 = _T_83;
    assign _T_65_3 = _T_84;
    assign _T_65_4 = _T_85;
    assign _T_80 = _T_56;
    assign _aggregateRegister_0__d = io_inputAggregate_0;
    assign _aggregateRegister_1__d = io_inputAggregate_1;
    assign _aggregateRegister_2__d = io_inputAggregate_2;
    assign _aggregateRegister_3__d = io_inputAggregate_3;
    assign _aggregateRegister_4__d = io_inputAggregate_4;
    assign io_aggregateAsUInt = _T_49;
    assign io_outputAggregate_0 = _aggregateRegister_0__q;
    assign io_outputAggregate_1 = _aggregateRegister_1__q;
    assign io_outputAggregate_2 = _aggregateRegister_2__q;
    assign io_outputAggregate_3 = _aggregateRegister_3__q;
    assign io_outputAggregate_4 = _aggregateRegister_4__q;
    assign io_outputFromUInt_0 = _T_65_0;
    assign io_outputFromUInt_1 = _T_65_1;
    assign io_outputFromUInt_2 = _T_65_2;
    assign io_outputFromUInt_3 = _T_65_3;
    assign io_outputFromUInt_4 = _T_65_4;
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
