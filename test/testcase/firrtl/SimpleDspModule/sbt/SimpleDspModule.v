module SimpleDspModule(
  input         clock,
  input         reset,
  input  [15:0] io_x,
  input  [15:0] io_y,
  output [15:0] io_z
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [16:0] _T_8; // @[Reg.scala 12:16]
  reg [16:0] _T_10; // @[Reg.scala 12:16]
  reg [16:0] _T_12; // @[Reg.scala 12:16]
  assign io_z = _T_12[15:0]; // @[SimpleDspModuleSpec.scala 37:10]
  always @(posedge clock) begin
    _T_8 <= $signed(io_x) + $signed(io_y); // @[FixedPointTypeClass.scala 25:22]
    _T_10 <= _T_8; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_12 <= _T_10; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
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
  _T_8 = _RAND_0[16:0];
  _RAND_1 = {1{`RANDOM}};
  _T_10 = _RAND_1[16:0];
  _RAND_2 = {1{`RANDOM}};
  _T_12 = _RAND_2[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
