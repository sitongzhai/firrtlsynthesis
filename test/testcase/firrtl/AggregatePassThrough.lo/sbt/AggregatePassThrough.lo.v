module AggregatePassThrough( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [3:0]  io_inputAggregate_u0, // @[:@6.4]
  input  [3:0]  io_inputAggregate_u1, // @[:@6.4]
  input  [3:0]  io_inputAggregate_u2, // @[:@6.4]
  input  [3:0]  io_inputAggregate_u3, // @[:@6.4]
  input  [3:0]  io_inputAggregate_u4, // @[:@6.4]
  output [3:0]  io_outputAggregate_u0, // @[:@6.4]
  output [3:0]  io_outputAggregate_u1, // @[:@6.4]
  output [3:0]  io_outputAggregate_u2, // @[:@6.4]
  output [3:0]  io_outputAggregate_u3, // @[:@6.4]
  output [3:0]  io_outputAggregate_u4, // @[:@6.4]
  output [19:0] io_aggregateAsUInt, // @[:@6.4]
  output [3:0]  io_outputFromUInt_u0, // @[:@6.4]
  output [3:0]  io_outputFromUInt_u1, // @[:@6.4]
  output [3:0]  io_outputFromUInt_u2, // @[:@6.4]
  output [3:0]  io_outputFromUInt_u3, // @[:@6.4]
  output [3:0]  io_outputFromUInt_u4 // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] aggregateRegister_u0; // @[AggregateOrderingSpec.scala 134:30:@11.4]
  reg [3:0] aggregateRegister_u1; // @[AggregateOrderingSpec.scala 134:30:@11.4]
  reg [3:0] aggregateRegister_u2; // @[AggregateOrderingSpec.scala 134:30:@11.4]
  reg [3:0] aggregateRegister_u3; // @[AggregateOrderingSpec.scala 134:30:@11.4]
  reg [3:0] aggregateRegister_u4; // @[AggregateOrderingSpec.scala 134:30:@11.4]
  wire [7:0] _T_8 = {aggregateRegister_u3,aggregateRegister_u4}; // @[AggregateOrderingSpec.scala 139:49:@22.4]
  wire [11:0] _T_10 = {aggregateRegister_u0,aggregateRegister_u1,aggregateRegister_u2}; // @[AggregateOrderingSpec.scala 139:49:@24.4]
  wire [19:0] _T_11 = {aggregateRegister_u0,aggregateRegister_u1,aggregateRegister_u2,aggregateRegister_u3,
    aggregateRegister_u4}; // @[AggregateOrderingSpec.scala 139:49:@25.4]
  assign io_outputAggregate_u0 = aggregateRegister_u0;
  assign io_outputAggregate_u1 = aggregateRegister_u1;
  assign io_outputAggregate_u2 = aggregateRegister_u2;
  assign io_outputAggregate_u3 = aggregateRegister_u3;
  assign io_outputAggregate_u4 = aggregateRegister_u4;
  assign io_aggregateAsUInt = {_T_10,_T_8}; // @[AggregateOrderingSpec.scala 139:49:@25.4]
  assign io_outputFromUInt_u0 = _T_11[19:16]; // @[AggregateOrderingSpec.scala 140:50:@44.4]
  assign io_outputFromUInt_u1 = _T_11[15:12]; // @[AggregateOrderingSpec.scala 140:50:@42.4]
  assign io_outputFromUInt_u2 = _T_11[11:8]; // @[AggregateOrderingSpec.scala 140:50:@40.4]
  assign io_outputFromUInt_u3 = _T_11[7:4]; // @[AggregateOrderingSpec.scala 140:50:@38.4]
  assign io_outputFromUInt_u4 = _T_11[3:0]; // @[AggregateOrderingSpec.scala 140:50:@36.4]
  always @(posedge clock) begin
    aggregateRegister_u0 <= io_inputAggregate_u0;
    aggregateRegister_u1 <= io_inputAggregate_u1;
    aggregateRegister_u2 <= io_inputAggregate_u2;
    aggregateRegister_u3 <= io_inputAggregate_u3;
    aggregateRegister_u4 <= io_inputAggregate_u4;
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
  aggregateRegister_u0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  aggregateRegister_u1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  aggregateRegister_u2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  aggregateRegister_u3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  aggregateRegister_u4 = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
