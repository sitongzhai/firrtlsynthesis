module AbsCircuitWithDelays(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [15:0] io_outContextAbs
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
`endif // RANDOMIZE_REG_INIT
  reg [15:0] _T_4; // @[Reg.scala 12:16]
  reg [15:0] _T_6; // @[Reg.scala 12:16]
  reg [15:0] _T_8; // @[Reg.scala 12:16]
  reg [16:0] _T_14; // @[Reg.scala 12:16]
  reg [16:0] _T_16; // @[Reg.scala 12:16]
  reg [16:0] _T_18; // @[Reg.scala 12:16]
  reg [15:0] _T_21; // @[Reg.scala 12:16]
  reg [15:0] _T_23; // @[Reg.scala 12:16]
  reg [15:0] _T_25; // @[Reg.scala 12:16]
  wire [16:0] _T_27 = _T_8[15] ? $signed(_T_18) : $signed({{1{_T_25[15]}},_T_25}); // @[FixedPointTypeClass.scala 207:8]
  assign io_outContextAbs = _T_27[15:0]; // @[ShiftRegisterDelaySpec.scala 27:22]
  always @(posedge clock) begin
    _T_4 <= io_in; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_6 <= _T_4; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_8 <= _T_6; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_14 <= 16'sh0 - $signed(io_in); // @[FixedPointTypeClass.scala 34:22]
    _T_16 <= _T_14; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_18 <= _T_16; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_21 <= io_in; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_23 <= _T_21; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    _T_25 <= _T_23; // @[Reg.scala 13:19 Reg.scala 13:23 Reg.scala 12:16]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"io.in %d con %d\n",io_in,_T_8[15] ? $signed(_T_18) : $signed({{1{_T_25[15]}},_T_25})); // @[ShiftRegisterDelaySpec.scala 26:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  _T_4 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  _T_6 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  _T_8 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  _T_14 = _RAND_3[16:0];
  _RAND_4 = {1{`RANDOM}};
  _T_16 = _RAND_4[16:0];
  _RAND_5 = {1{`RANDOM}};
  _T_18 = _RAND_5[16:0];
  _RAND_6 = {1{`RANDOM}};
  _T_21 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  _T_23 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  _T_25 = _RAND_8[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
