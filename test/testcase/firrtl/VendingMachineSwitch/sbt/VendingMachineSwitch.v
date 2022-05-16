module VendingMachineSwitch(
  input   clock,
  input   reset,
  input   io_nickel,
  input   io_dime,
  output  io_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[VendingMachineSwitch.scala 23:22]
  wire  _T_12 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_13 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_2 = io_nickel ? 3'h2 : state; // @[VendingMachineSwitch.scala 31:24 VendingMachineSwitch.scala 31:32 VendingMachineSwitch.scala 23:22]
  wire  _T_14 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_4 = io_nickel ? 3'h3 : state; // @[VendingMachineSwitch.scala 35:24 VendingMachineSwitch.scala 35:32 VendingMachineSwitch.scala 23:22]
  wire [2:0] _GEN_5 = io_dime ? 3'h4 : _GEN_4; // @[VendingMachineSwitch.scala 36:22 VendingMachineSwitch.scala 36:30]
  wire  _T_15 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_6 = io_nickel ? 3'h4 : state; // @[VendingMachineSwitch.scala 39:24 VendingMachineSwitch.scala 39:32 VendingMachineSwitch.scala 23:22]
  wire [2:0] _GEN_7 = io_dime ? 3'h4 : _GEN_6; // @[VendingMachineSwitch.scala 40:22 VendingMachineSwitch.scala 40:30]
  wire  _T_16 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_8 = _T_16 ? 3'h0 : state; // @[Conditional.scala 39:67 VendingMachineSwitch.scala 43:13 VendingMachineSwitch.scala 23:22]
  wire [2:0] _GEN_9 = _T_15 ? _GEN_7 : _GEN_8; // @[Conditional.scala 39:67]
  assign io_valid = state == 3'h4; // @[VendingMachineSwitch.scala 46:22]
  always @(posedge clock) begin
    if (reset) begin // @[VendingMachineSwitch.scala 23:22]
      state <= 3'h0; // @[VendingMachineSwitch.scala 23:22]
    end else if (_T_12) begin // @[Conditional.scala 40:58]
      if (io_dime) begin // @[VendingMachineSwitch.scala 28:22]
        state <= 3'h2; // @[VendingMachineSwitch.scala 28:30]
      end else if (io_nickel) begin // @[VendingMachineSwitch.scala 27:24]
        state <= 3'h1; // @[VendingMachineSwitch.scala 27:32]
      end
    end else if (_T_13) begin // @[Conditional.scala 39:67]
      if (io_dime) begin // @[VendingMachineSwitch.scala 32:22]
        state <= 3'h3; // @[VendingMachineSwitch.scala 32:30]
      end else begin
        state <= _GEN_2;
      end
    end else if (_T_14) begin // @[Conditional.scala 39:67]
      state <= _GEN_5;
    end else begin
      state <= _GEN_9;
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
