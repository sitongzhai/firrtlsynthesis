module ExampleModule(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[InterpreterVerilatorConsistencySpec.scala 20:17]
  reg [15:0] in_reg; // @[InterpreterVerilatorConsistencySpec.scala 21:21]
  wire  _T_19 = ~busy; // @[InterpreterVerilatorConsistencySpec.scala 22:18]
  wire  _T_22 = io_in_valid & _T_19; // @[InterpreterVerilatorConsistencySpec.scala 24:20]
  wire  _GEN_1 = io_in_valid & _T_19 | busy; // @[InterpreterVerilatorConsistencySpec.scala 24:30 InterpreterVerilatorConsistencySpec.scala 26:10 InterpreterVerilatorConsistencySpec.scala 20:17]
  reg [15:0] wait_counter; // @[InterpreterVerilatorConsistencySpec.scala 29:25]
  wire [15:0] _GEN_2 = _T_22 ? 16'h0 : wait_counter; // @[InterpreterVerilatorConsistencySpec.scala 31:30 InterpreterVerilatorConsistencySpec.scala 32:18 InterpreterVerilatorConsistencySpec.scala 29:25]
  wire  _T_30 = wait_counter == 16'h5; // @[InterpreterVerilatorConsistencySpec.scala 36:23]
  wire  _T_32 = ~(wait_counter == 16'h5); // @[InterpreterVerilatorConsistencySpec.scala 36:40]
  wire [15:0] _T_36 = wait_counter + 16'h1; // @[InterpreterVerilatorConsistencySpec.scala 40:36]
  assign io_in_ready = ~busy; // @[InterpreterVerilatorConsistencySpec.scala 22:18]
  assign io_out_valid = io_out_bits == in_reg & _T_30 & busy; // @[InterpreterVerilatorConsistencySpec.scala 44:78]
  assign io_out_bits = _T_32 ? 16'h0 : in_reg; // @[InterpreterVerilatorConsistencySpec.scala 38:17 InterpreterVerilatorConsistencySpec.scala 39:19]
  always @(posedge clock) begin
    if (reset) begin // @[InterpreterVerilatorConsistencySpec.scala 20:17]
      busy <= 1'h0; // @[InterpreterVerilatorConsistencySpec.scala 20:17]
    end else begin
      busy <= _GEN_1;
    end
    if (reset) begin // @[InterpreterVerilatorConsistencySpec.scala 21:21]
      in_reg <= 16'h0; // @[InterpreterVerilatorConsistencySpec.scala 21:21]
    end else if (io_in_valid & _T_19) begin // @[InterpreterVerilatorConsistencySpec.scala 24:30]
      in_reg <= io_in_bits; // @[InterpreterVerilatorConsistencySpec.scala 25:12]
    end
    if (reset) begin // @[InterpreterVerilatorConsistencySpec.scala 29:25]
      wait_counter <= 16'h0; // @[InterpreterVerilatorConsistencySpec.scala 29:25]
    end else if (busy) begin // @[InterpreterVerilatorConsistencySpec.scala 35:14]
      if (_T_32) begin // @[InterpreterVerilatorConsistencySpec.scala 38:17]
        wait_counter <= _T_36; // @[InterpreterVerilatorConsistencySpec.scala 40:20]
      end else begin
        wait_counter <= _GEN_2;
      end
    end else begin
      wait_counter <= _GEN_2;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,
            "From printf -- in: ready %d   valid %d   value %d  -- out:  ready %d  valid %d  value %d\n",io_in_ready,
            io_in_valid,io_in_bits,io_out_ready,io_out_valid,io_out_bits); // @[InterpreterVerilatorConsistencySpec.scala 46:9]
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
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  in_reg = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  wait_counter = _RAND_2[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
