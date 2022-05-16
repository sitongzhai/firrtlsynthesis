module DynamicMemorySearch(
  input        clk,
  input        reset,
  input        io_isWr,
  input  [2:0] io_wrAddr,
  input  [3:0] io_data,
  input        io_en,
  output [2:0] io_target,
  output       io_done
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] list [0:7];
  wire  list_memVal_en;
  wire [2:0] list_memVal_addr;
  wire [3:0] list_memVal_data;
  wire [3:0] list_T_16_data;
  wire [2:0] list_T_16_addr;
  wire  list_T_16_mask;
  wire  list_T_16_en;
  wire [3:0] list_T_19_data;
  wire [2:0] list_T_19_addr;
  wire  list_T_19_mask;
  wire  list_T_19_en;
  wire [3:0] list_T_22_data;
  wire [2:0] list_T_22_addr;
  wire  list_T_22_mask;
  wire  list_T_22_en;
  wire [3:0] list_T_25_data;
  wire [2:0] list_T_25_addr;
  wire  list_T_25_mask;
  wire  list_T_25_en;
  wire [3:0] list_T_28_data;
  wire [2:0] list_T_28_addr;
  wire  list_T_28_mask;
  wire  list_T_28_en;
  wire [3:0] list_T_31_data;
  wire [2:0] list_T_31_addr;
  wire  list_T_31_mask;
  wire  list_T_31_en;
  wire [3:0] list_T_34_data;
  wire [2:0] list_T_34_addr;
  wire  list_T_34_mask;
  wire  list_T_34_en;
  wire [3:0] list_T_37_data;
  wire [2:0] list_T_37_addr;
  wire  list_T_37_mask;
  wire  list_T_37_en;
  wire [3:0] list_T_39_data;
  wire [2:0] list_T_39_addr;
  wire  list_T_39_mask;
  wire  list_T_39_en;
  reg [2:0] index;
  wire  T_10 = ~io_en;
  wire  T_11 = list_memVal_data == io_data;
  wire  T_13 = index == 3'h7;
  wire  T_14 = T_11 | T_13;
  wire  over = T_10 & T_14;
  wire  T_41 = ~io_isWr;
  wire  T_42 = T_41 & io_en;
  wire  T_45 = ~over;
  wire  T_50 = T_41 & T_10;
  wire  T_51 = T_50 & T_45;
  wire [2:0] T_54 = index + 3'h1;
  assign list_memVal_en = 1'h1;
  assign list_memVal_addr = index;
  assign list_memVal_data = list[list_memVal_addr];
  assign list_T_16_data = 4'h0;
  assign list_T_16_addr = 3'h0;
  assign list_T_16_mask = 1'h1;
  assign list_T_16_en = reset;
  assign list_T_19_data = 4'h0;
  assign list_T_19_addr = 3'h1;
  assign list_T_19_mask = 1'h1;
  assign list_T_19_en = reset;
  assign list_T_22_data = 4'h0;
  assign list_T_22_addr = 3'h2;
  assign list_T_22_mask = 1'h1;
  assign list_T_22_en = reset;
  assign list_T_25_data = 4'h0;
  assign list_T_25_addr = 3'h3;
  assign list_T_25_mask = 1'h1;
  assign list_T_25_en = reset;
  assign list_T_28_data = 4'h0;
  assign list_T_28_addr = 3'h4;
  assign list_T_28_mask = 1'h1;
  assign list_T_28_en = reset;
  assign list_T_31_data = 4'h0;
  assign list_T_31_addr = 3'h5;
  assign list_T_31_mask = 1'h1;
  assign list_T_31_en = reset;
  assign list_T_34_data = 4'h0;
  assign list_T_34_addr = 3'h6;
  assign list_T_34_mask = 1'h1;
  assign list_T_34_en = reset;
  assign list_T_37_data = 4'h0;
  assign list_T_37_addr = 3'h7;
  assign list_T_37_mask = 1'h1;
  assign list_T_37_en = reset;
  assign list_T_39_data = io_data;
  assign list_T_39_addr = io_wrAddr;
  assign list_T_39_mask = 1'h1;
  assign list_T_39_en = io_isWr;
  assign io_target = index;
  assign io_done = T_10 & T_14;
  always @(posedge clk) begin
    if (list_T_16_en & list_T_16_mask) begin
      list[list_T_16_addr] <= list_T_16_data;
    end
    if (list_T_19_en & list_T_19_mask) begin
      list[list_T_19_addr] <= list_T_19_data;
    end
    if (list_T_22_en & list_T_22_mask) begin
      list[list_T_22_addr] <= list_T_22_data;
    end
    if (list_T_25_en & list_T_25_mask) begin
      list[list_T_25_addr] <= list_T_25_data;
    end
    if (list_T_28_en & list_T_28_mask) begin
      list[list_T_28_addr] <= list_T_28_data;
    end
    if (list_T_31_en & list_T_31_mask) begin
      list[list_T_31_addr] <= list_T_31_data;
    end
    if (list_T_34_en & list_T_34_mask) begin
      list[list_T_34_addr] <= list_T_34_data;
    end
    if (list_T_37_en & list_T_37_mask) begin
      list[list_T_37_addr] <= list_T_37_data;
    end
    if (list_T_39_en & list_T_39_mask) begin
      list[list_T_39_addr] <= list_T_39_data;
    end
    if (reset) begin
      index <= 3'h0;
    end else if (T_51) begin
      index <= T_54;
    end else if (T_42) begin
      index <= 3'h0;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    list[initvar] = _RAND_0[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  index = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
