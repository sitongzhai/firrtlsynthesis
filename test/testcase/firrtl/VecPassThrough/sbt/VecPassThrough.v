module VecPassThrough(
  input          clock,
  input          reset,
  input  [15:0]  io_inVector_0,
  input  [15:0]  io_inVector_1,
  input  [15:0]  io_inVector_2,
  input  [15:0]  io_inVector_3,
  input  [15:0]  io_inVector_4,
  input  [15:0]  io_inVector_5,
  input  [15:0]  io_inVector_6,
  input  [15:0]  io_inVector_7,
  input  [15:0]  io_inVector_8,
  input  [15:0]  io_inVector_9,
  output [15:0]  io_outVector_0,
  output [15:0]  io_outVector_1,
  output [15:0]  io_outVector_2,
  output [15:0]  io_outVector_3,
  output [15:0]  io_outVector_4,
  output [15:0]  io_outVector_5,
  output [15:0]  io_outVector_6,
  output [15:0]  io_outVector_7,
  output [15:0]  io_outVector_8,
  output [15:0]  io_outVector_9,
  output [159:0] io_outVectorAsUInt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] regVector_0; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_1; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_2; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_3; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_4; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_5; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_6; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_7; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_8; // @[AggregateOrderingSpec.scala 21:22]
  reg [15:0] regVector_9; // @[AggregateOrderingSpec.scala 21:22]
  wire [79:0] _T_51 = {io_inVector_4,io_inVector_3,io_inVector_2,io_inVector_1,io_inVector_0}; // @[AggregateOrderingSpec.scala 26:43]
  wire [79:0] _T_55 = {io_inVector_9,io_inVector_8,io_inVector_7,io_inVector_6,io_inVector_5}; // @[AggregateOrderingSpec.scala 26:43]
  assign io_outVector_0 = regVector_0; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_1 = regVector_1; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_2 = regVector_2; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_3 = regVector_3; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_4 = regVector_4; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_5 = regVector_5; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_6 = regVector_6; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_7 = regVector_7; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_8 = regVector_8; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVector_9 = regVector_9; // @[AggregateOrderingSpec.scala 24:16]
  assign io_outVectorAsUInt = {_T_55,_T_51}; // @[AggregateOrderingSpec.scala 26:43]
  always @(posedge clock) begin
    regVector_0 <= io_inVector_0; // @[AggregateOrderingSpec.scala 23:13]
    regVector_1 <= io_inVector_1; // @[AggregateOrderingSpec.scala 23:13]
    regVector_2 <= io_inVector_2; // @[AggregateOrderingSpec.scala 23:13]
    regVector_3 <= io_inVector_3; // @[AggregateOrderingSpec.scala 23:13]
    regVector_4 <= io_inVector_4; // @[AggregateOrderingSpec.scala 23:13]
    regVector_5 <= io_inVector_5; // @[AggregateOrderingSpec.scala 23:13]
    regVector_6 <= io_inVector_6; // @[AggregateOrderingSpec.scala 23:13]
    regVector_7 <= io_inVector_7; // @[AggregateOrderingSpec.scala 23:13]
    regVector_8 <= io_inVector_8; // @[AggregateOrderingSpec.scala 23:13]
    regVector_9 <= io_inVector_9; // @[AggregateOrderingSpec.scala 23:13]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regVector_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  regVector_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  regVector_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  regVector_3 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  regVector_4 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  regVector_5 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  regVector_6 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  regVector_7 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  regVector_8 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  regVector_9 = _RAND_9[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
