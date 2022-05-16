module Top(
    input clk,
    input reset,
    input [15:0] addr,
    output [15:0] data
);
    wire _level1__clk;
    wire _level1__reset;
    wire [15:0] _level1__addr;
    wire [15:0] _level1__data;
    Level1 level1 (
        .clk(_level1__clk),
        .reset(_level1__reset),
        .addr(_level1__addr),
        .data(_level1__data)
    );
    assign data = _level1__data;
    assign _level1__addr = addr;
    assign _level1__clk = clk;
    assign _level1__reset = reset;
endmodule //Top
module Level1(
    input clk,
    input reset,
    input [15:0] addr,
    output [15:0] data
);
    wire _level2__clk;
    wire _level2__reset;
    wire [15:0] _level2__addr;
    wire [15:0] _level2__data;
    Level2 level2 (
        .clk(_level2__clk),
        .reset(_level2__reset),
        .addr(_level2__addr),
        .data(_level2__data)
    );
    assign data = _level2__data;
    assign _level2__addr = addr;
    assign _level2__clk = clk;
    assign _level2__reset = reset;
endmodule //Level1
module Level2(
    input clk,
    input reset,
    input [15:0] addr,
    output [15:0] data
);
    wire _memory__clk;
    wire _memory__reset;
    wire [15:0] _memory__addr;
    wire [15:0] _memory__data;
    Level3 memory (
        .clk(_memory__clk),
        .reset(_memory__reset),
        .addr(_memory__addr),
        .data(_memory__data)
    );
    assign data = _memory__data;
    assign _memory__addr = addr;
    assign _memory__clk = clk;
    assign _memory__reset = reset;
endmodule //Level2
module Level3(
    input clk,
    input reset,
    input [15:0] addr,
    output [15:0] data
);
    assign data = addr;
endmodule //Level3
