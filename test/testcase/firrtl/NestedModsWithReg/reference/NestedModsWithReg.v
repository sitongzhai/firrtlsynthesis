module Top(
    input clk,
    input reset,
    input [15:0] in1,
    output [15:0] out1,
    output [15:0] out2,
    output [15:0] out3
);
    wire _level1__clk;
    wire _level1__reset;
    wire [15:0] _level1__in1;
    wire [15:0] _level1__out1;
    wire [15:0] _level1__out2;
    wire [15:0] _level1__out3;
    Level1 level1 (
        .clk(_level1__clk),
        .reset(_level1__reset),
        .in1(_level1__in1),
        .out1(_level1__out1),
        .out2(_level1__out2),
        .out3(_level1__out3)
    );
    assign _level1__clk = clk;
    assign _level1__in1 = in1;
    assign _level1__reset = reset;
    assign out1 = _level1__out1;
    assign out2 = _level1__out2;
    assign out3 = _level1__out3;
endmodule //Top
module Level1(
    input clk,
    input reset,
    input [15:0] in1,
    output [15:0] out1,
    output [15:0] out2,
    output [15:0] out3
);
    wire [15:0] _reg1__q;
    wire [15:0] _reg1__d;
    DFF_POSCLK #(.width(16)) reg1 (
        .q(_reg1__q),
        .d(_reg1__d),
        .clk(clk)
    );
    wire _level2__clk;
    wire _level2__reset;
    wire [15:0] _level2__in1;
    wire [15:0] _level2__out2;
    wire [15:0] _level2__out3;
    Level2 level2 (
        .clk(_level2__clk),
        .reset(_level2__reset),
        .in1(_level2__in1),
        .out2(_level2__out2),
        .out3(_level2__out3)
    );
    assign _level2__clk = clk;
    assign _level2__in1 = in1;
    assign _level2__reset = reset;
    assign out1 = _reg1__q;
    assign out2 = _level2__out2;
    assign out3 = _level2__out3;
    assign _reg1__d = in1;
endmodule //Level1
module DFF_POSCLK(q, d, clk);
    parameter width = 4;
    output reg [width-1:0] q;
    input [width-1:0] d;
    input clk;
    always @(posedge clk) begin
        q <= d;
    end
endmodule // DFF_POSCLK
module Level2(
    input clk,
    input reset,
    input [15:0] in1,
    output [15:0] out2,
    output [15:0] out3
);
    wire [15:0] _reg2__q;
    wire [15:0] _reg2__d;
    DFF_POSCLK #(.width(16)) reg2 (
        .q(_reg2__q),
        .d(_reg2__d),
        .clk(clk)
    );
    wire _level3__clk;
    wire _level3__reset;
    wire [15:0] _level3__in1;
    wire [15:0] _level3__out3;
    Level3 level3 (
        .clk(_level3__clk),
        .reset(_level3__reset),
        .in1(_level3__in1),
        .out3(_level3__out3)
    );
    assign _level3__clk = clk;
    assign _level3__in1 = in1;
    assign _level3__reset = reset;
    assign out2 = _reg2__q;
    assign out3 = _level3__out3;
    assign _reg2__d = in1;
endmodule //Level2
module Level3(
    input clk,
    input reset,
    input [15:0] in1,
    output [15:0] out3
);
    wire [15:0] _reg3__q;
    wire [15:0] _reg3__d;
    DFF_POSCLK #(.width(16)) reg3 (
        .q(_reg3__q),
        .d(_reg3__d),
        .clk(clk)
    );
    assign out3 = in1;
    assign _reg3__d = in1;
endmodule //Level3
