module SimpleComplexAdder(
  input         clock,
  input         reset,
  input  [5:0]  io_a1_real,
  input  [5:0]  io_a1_imag,
  input  [7:0]  io_a2_real,
  input  [7:0]  io_a2_imag,
  output [13:0] io_c_real,
  output [13:0] io_c_imag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [13:0] register1_real; // @[ComplexAdderSpec.scala 23:22]
  reg [13:0] register1_imag; // @[ComplexAdderSpec.scala 23:22]
  wire [7:0] _T_30 = $signed(io_a2_real) + $signed(io_a2_imag); // @[FixedPointTypeClass.scala 21:58]
  wire [5:0] _T_33 = $signed(io_a1_real) + $signed(io_a1_imag); // @[FixedPointTypeClass.scala 21:58]
  wire [5:0] _T_36 = $signed(io_a1_imag) - $signed(io_a1_real); // @[FixedPointTypeClass.scala 31:68]
  wire [13:0] _T_37 = $signed(io_a1_real) * $signed(_T_30); // @[FixedPointTypeClass.scala 43:59]
  wire [13:0] _T_38 = $signed(_T_33) * $signed(io_a2_imag); // @[FixedPointTypeClass.scala 43:59]
  wire [13:0] _T_39 = $signed(_T_36) * $signed(io_a2_real); // @[FixedPointTypeClass.scala 43:59]
  assign io_c_real = register1_real; // @[ComplexAdderSpec.scala 30:8]
  assign io_c_imag = register1_imag; // @[ComplexAdderSpec.scala 30:8]
  always @(posedge clock) begin
    register1_real <= $signed(_T_37) - $signed(_T_38); // @[FixedPointTypeClass.scala 31:68]
    register1_imag <= $signed(_T_37) + $signed(_T_39); // @[FixedPointTypeClass.scala 21:58]
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
  register1_real = _RAND_0[13:0];
  _RAND_1 = {1{`RANDOM}};
  register1_imag = _RAND_1[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
