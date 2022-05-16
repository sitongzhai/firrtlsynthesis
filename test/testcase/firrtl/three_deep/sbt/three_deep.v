module Level1(
  input  [15:0] addr,
  output [15:0] data
);
  wire [15:0] level2_addr;
  wire [15:0] level2_data;
  Level2 level2 (
    .addr(level2_addr),
    .data(level2_data)
  );
  assign data = level2_data;
  assign level2_addr = addr;
endmodule
module Level2(
  input  [15:0] addr,
  output [15:0] data
);
  wire [15:0] memory_addr;
  wire [15:0] memory_data;
  Level3 memory (
    .addr(memory_addr),
    .data(memory_data)
  );
  assign data = memory_data;
  assign memory_addr = addr;
endmodule
module Level3(
  input  [15:0] addr,
  output [15:0] data
);
  assign data = addr;
endmodule
module Top(
  input         clk,
  input         reset,
  input  [15:0] addr,
  output [15:0] data
);
  wire [15:0] level1_addr;
  wire [15:0] level1_data;
  Level1 level1 (
    .addr(level1_addr),
    .data(level1_data)
  );
  assign data = level1_data;
  assign level1_addr = addr;
endmodule
