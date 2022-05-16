module VcdAdder(
    input clock,
    input [7:0] io_a,
    input [7:0] io_b,
    output [9:0] io_c
);
    wire _do_add__clock;
    wire [7:0] _do_add__a;
    wire [7:0] _do_add__b;
    wire [9:0] _do_add__c;
    DoAdd do_add (
        .clock(_do_add__clock),
        .a(_do_add__a),
        .b(_do_add__b),
        .c(_do_add__c)
    );
    assign _do_add__a = io_a;
    assign _do_add__b = io_b;
    assign _do_add__clock = clock;
    assign io_c = _do_add__c;
endmodule //VcdAdder
module DoAdd(
    input clock,
    input [7:0] a,
    input [7:0] b,
    output [9:0] c
);
    wire [8:0] _accum__q;
    wire [8:0] _accum__d;
    DFF_POSCLK #(.width(9)) accum (
        .q(_accum__q),
        .d(_accum__d),
        .clk(clock)
    );
    ADD_SIGNED #(.width(8)) s_add_1 (
        .y(_accum__d),
        .a(a),
        .b(b)
    );
    PAD_SIGNED #(.width(9), .n(10)) s_pad_2 (
        .y(c),
        .in(_accum__q)
    );
endmodule //DoAdd
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module ADD_SIGNED(y, a, b);
    parameter width = 4;
    output [width:0] y;
    input [width-1:0] a;
    input [width-1:0] b;
    assign y = $signed(a) + $signed(b);
endmodule // ADD_SIGNED
module PAD_SIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = n > width ? {{(n - width){in[width-1]}}, in} : in;
endmodule // PAD_SIGNED
