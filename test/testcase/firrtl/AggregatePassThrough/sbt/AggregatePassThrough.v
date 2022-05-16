module AggregatePassThrough(
  input         clock,
  input         reset,
  input  [3:0]  io_inputAggregate_0,
  input  [3:0]  io_inputAggregate_1,
  input  [3:0]  io_inputAggregate_2,
  input  [3:0]  io_inputAggregate_3,
  input  [3:0]  io_inputAggregate_4,
  output [3:0]  io_outputAggregate_0,
  output [3:0]  io_outputAggregate_1,
  output [3:0]  io_outputAggregate_2,
  output [3:0]  io_outputAggregate_3,
  output [3:0]  io_outputAggregate_4,
  output [19:0] io_aggregateAsUInt,
  output [3:0]  io_outputFromUInt_0,
  output [3:0]  io_outputFromUInt_1,
  output [3:0]  io_outputFromUInt_2,
  output [3:0]  io_outputFromUInt_3,
  output [3:0]  io_outputFromUInt_4
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] aggregateRegister_0; // @[AggregateOrderingSpec.scala 134:30]
  reg [3:0] aggregateRegister_1; // @[AggregateOrderingSpec.scala 134:30]
  reg [3:0] aggregateRegister_2; // @[AggregateOrderingSpec.scala 134:30]
  reg [3:0] aggregateRegister_3; // @[AggregateOrderingSpec.scala 134:30]
  reg [3:0] aggregateRegister_4; // @[AggregateOrderingSpec.scala 134:30]
  wire [7:0] _T_46 = {aggregateRegister_1,aggregateRegister_0}; // @[AggregateOrderingSpec.scala 139:49]
  wire [11:0] _T_48 = {aggregateRegister_4,aggregateRegister_3,aggregateRegister_2}; // @[AggregateOrderingSpec.scala 139:49]
  wire [19:0] _T_49 = {aggregateRegister_4,aggregateRegister_3,aggregateRegister_2,aggregateRegister_1,
    aggregateRegister_0}; // @[AggregateOrderingSpec.scala 139:49]
  assign io_outputAggregate_0 = aggregateRegister_0; // @[AggregateOrderingSpec.scala 137:22]
  assign io_outputAggregate_1 = aggregateRegister_1; // @[AggregateOrderingSpec.scala 137:22]
  assign io_outputAggregate_2 = aggregateRegister_2; // @[AggregateOrderingSpec.scala 137:22]
  assign io_outputAggregate_3 = aggregateRegister_3; // @[AggregateOrderingSpec.scala 137:22]
  assign io_outputAggregate_4 = aggregateRegister_4; // @[AggregateOrderingSpec.scala 137:22]
  assign io_aggregateAsUInt = {_T_48,_T_46}; // @[AggregateOrderingSpec.scala 139:49]
  assign io_outputFromUInt_0 = _T_49[3:0]; // @[AggregateOrderingSpec.scala 140:51]
  assign io_outputFromUInt_1 = _T_49[7:4]; // @[AggregateOrderingSpec.scala 140:51]
  assign io_outputFromUInt_2 = _T_49[11:8]; // @[AggregateOrderingSpec.scala 140:51]
  assign io_outputFromUInt_3 = _T_49[15:12]; // @[AggregateOrderingSpec.scala 140:51]
  assign io_outputFromUInt_4 = _T_49[19:16]; // @[AggregateOrderingSpec.scala 140:51]
  always @(posedge clock) begin
    aggregateRegister_0 <= io_inputAggregate_0; // @[AggregateOrderingSpec.scala 136:21]
    aggregateRegister_1 <= io_inputAggregate_1; // @[AggregateOrderingSpec.scala 136:21]
    aggregateRegister_2 <= io_inputAggregate_2; // @[AggregateOrderingSpec.scala 136:21]
    aggregateRegister_3 <= io_inputAggregate_3; // @[AggregateOrderingSpec.scala 136:21]
    aggregateRegister_4 <= io_inputAggregate_4; // @[AggregateOrderingSpec.scala 136:21]
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
  aggregateRegister_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  aggregateRegister_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  aggregateRegister_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  aggregateRegister_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  aggregateRegister_4 = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
