module MultiClockMemTest(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:7]; // @[MultiClockSpec.scala 78:16]
  wire  mem_rdata_en; // @[MultiClockSpec.scala 78:16]
  wire [2:0] mem_rdata_addr; // @[MultiClockSpec.scala 78:16]
  wire [31:0] mem_rdata_data; // @[MultiClockSpec.scala 78:16]
  wire [31:0] mem__T_24_data; // @[MultiClockSpec.scala 78:16]
  wire [2:0] mem__T_24_addr; // @[MultiClockSpec.scala 78:16]
  wire  mem__T_24_mask; // @[MultiClockSpec.scala 78:16]
  wire  mem__T_24_en; // @[MultiClockSpec.scala 78:16]
  wire [31:0] mem__T_45_data; // @[MultiClockSpec.scala 78:16]
  wire [2:0] mem__T_45_addr; // @[MultiClockSpec.scala 78:16]
  wire  mem__T_45_mask; // @[MultiClockSpec.scala 78:16]
  wire  mem__T_45_en; // @[MultiClockSpec.scala 78:16]
  reg  cDiv; // @[MultiClockSpec.scala 74:21]
  reg [4:0] value; // @[Counter.scala 17:33]
  wire  done = value == 5'h13; // @[Counter.scala 25:24]
  wire [4:0] _T_15 = value + 5'h1; // @[Counter.scala 26:22]
  reg [2:0] waddr; // @[MultiClockSpec.scala 83:22]
  wire [2:0] _T_21 = waddr + 3'h1; // @[MultiClockSpec.scala 84:18]
  wire [2:0] raddr = waddr - 3'h1; // @[MultiClockSpec.scala 89:21]
  wire  _T_33 = value > 5'h0 & value < 5'h9; // @[MultiClockSpec.scala 93:21]
  wire  _T_39 = ~(mem_rdata_data == 32'h7b | reset); // @[MultiClockSpec.scala 94:11]
  wire  _T_41 = value >= 5'h8; // @[MultiClockSpec.scala 99:17]
  wire  _T_43 = value < 5'h10; // @[MultiClockSpec.scala 99:33]
  wire  _T_51 = value > 5'h8 & value < 5'h11; // @[MultiClockSpec.scala 105:21]
  wire [2:0] _GEN_0 = raddr % 3'h2; // @[MultiClockSpec.scala 106:17]
  wire [1:0] _T_53 = _GEN_0[1:0]; // @[MultiClockSpec.scala 106:17]
  wire  _T_55 = _T_53 == 2'h0; // @[MultiClockSpec.scala 106:23]
  wire  _GEN_1 = cDiv;
  assign mem_rdata_en = 1'h1;
  assign mem_rdata_addr = waddr - 3'h1;
  assign mem_rdata_data = mem[mem_rdata_addr]; // @[MultiClockSpec.scala 78:16]
  assign mem__T_24_data = 32'h7b;
  assign mem__T_24_addr = waddr;
  assign mem__T_24_mask = 1'h1;
  assign mem__T_24_en = value < 5'h8;
  assign mem__T_45_data = 32'h1c8;
  assign mem__T_45_addr = waddr;
  assign mem__T_45_mask = 1'h1;
  assign mem__T_45_en = _T_41 & _T_43;
  always @(posedge clock) begin
    if (mem__T_24_en & mem__T_24_mask) begin
      mem[mem__T_24_addr] <= mem__T_24_data; // @[MultiClockSpec.scala 78:16]
    end
    cDiv <= reset | ~cDiv; // @[MultiClockSpec.scala 74:21 MultiClockSpec.scala 74:21 MultiClockSpec.scala 75:8]
    if (reset) begin // @[Counter.scala 17:33]
      value <= 5'h0; // @[Counter.scala 17:33]
    end else if (done) begin // @[Counter.scala 28:21]
      value <= 5'h0; // @[Counter.scala 28:29]
    end else begin
      value <= _T_15; // @[Counter.scala 26:13]
    end
    if (reset) begin // @[MultiClockSpec.scala 83:22]
      waddr <= 3'h0; // @[MultiClockSpec.scala 83:22]
    end else begin
      waddr <= _T_21; // @[MultiClockSpec.scala 84:9]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_33 & ~(mem_rdata_data == 32'h7b | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at MultiClockSpec.scala:94 assert(rdata === 123.U)\n"); // @[MultiClockSpec.scala 94:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_33 & ~(mem_rdata_data == 32'h7b | reset)) begin
          $fatal; // @[MultiClockSpec.scala 94:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_51 & _T_55 & ~(mem_rdata_data == 32'h1c8 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at MultiClockSpec.scala:107 assert(rdata === 456.U)\n"); // @[MultiClockSpec.scala 107:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_51 & _T_55 & ~(mem_rdata_data == 32'h1c8 | reset)) begin
          $fatal; // @[MultiClockSpec.scala 107:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_51 & ~_T_55 & _T_39) begin
          $fwrite(32'h80000002,"Assertion failed\n    at MultiClockSpec.scala:109 assert(rdata === 123.U)\n"); // @[MultiClockSpec.scala 109:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_51 & ~_T_55 & _T_39) begin
          $fatal; // @[MultiClockSpec.scala 109:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (done & ~reset) begin
          $finish; // @[MultiClockSpec.scala 113:21]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge _GEN_1) begin
    if (mem__T_45_en & mem__T_45_mask) begin
      mem[mem__T_45_addr] <= mem__T_45_data; // @[MultiClockSpec.scala 78:16]
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
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cDiv = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  waddr = _RAND_3[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
