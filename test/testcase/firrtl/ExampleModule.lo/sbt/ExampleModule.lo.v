module ExampleModule( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_in_ready, // @[:@6.4]
  input         io_in_valid, // @[:@6.4]
  input  [15:0] io_in_bits, // @[:@6.4]
  input         io_out_ready, // @[:@6.4]
  output        io_out_valid, // @[:@6.4]
  output [15:0] io_out_bits // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[InterpreterVerilatorConsistencySpec.scala 20:21:@11.4]
  reg [15:0] in_reg; // @[InterpreterVerilatorConsistencySpec.scala 21:25:@12.4]
  wire  _T_19 = ~busy; // @[InterpreterVerilatorConsistencySpec.scala 22:18:@13.4]
  wire  _T_22 = io_in_valid & _T_19; // @[InterpreterVerilatorConsistencySpec.scala 24:20:@16.4]
  wire  _GEN_1 = _T_22 | busy; // @[InterpreterVerilatorConsistencySpec.scala 24:30:@17.4]
  reg [15:0] wait_counter; // @[InterpreterVerilatorConsistencySpec.scala 29:29:@21.4]
  wire [15:0] _GEN_2 = _T_22 ? 16'h0 : wait_counter; // @[InterpreterVerilatorConsistencySpec.scala 31:30:@24.4]
  wire  _T_30 = wait_counter == 16'h5; // @[InterpreterVerilatorConsistencySpec.scala 36:23:@28.6]
  wire [15:0] _T_34 = wait_counter + 16'h1; // @[InterpreterVerilatorConsistencySpec.scala 40:36:@35.8]
  wire  _T_35 = io_out_bits == in_reg; // @[InterpreterVerilatorConsistencySpec.scala 44:32:@39.4]
  wire  _T_37 = _T_35 & _T_30; // @[InterpreterVerilatorConsistencySpec.scala 44:44:@41.4]
  wire  _T_41 = ~reset; // @[InterpreterVerilatorConsistencySpec.scala 46:9:@45.4]
  assign io_in_ready = ~busy; // @[InterpreterVerilatorConsistencySpec.scala 22:18:@13.4]
  assign io_out_valid = _T_37 & busy; // @[InterpreterVerilatorConsistencySpec.scala 44:78:@42.4]
  assign io_out_bits = _T_30 ? in_reg : 16'h0; // @[InterpreterVerilatorConsistencySpec.scala 36:40:@29.6]
  always @(posedge clock) begin
    if (reset) begin
      busy <= 1'h0;
    end else begin
      busy <= _GEN_1;
    end
    if (reset) begin
      in_reg <= 16'h0;
    end else if (_T_22) begin // @[InterpreterVerilatorConsistencySpec.scala 24:30:@17.4]
      in_reg <= io_in_bits;
    end
    if (reset) begin
      wait_counter <= 16'h0;
    end else if (busy) begin // @[InterpreterVerilatorConsistencySpec.scala 35:14:@27.4]
      if (_T_30) begin // @[InterpreterVerilatorConsistencySpec.scala 36:40:@29.6]
        wait_counter <= _GEN_2;
      end else begin
        wait_counter <= _T_34;
      end
    end else begin
      wait_counter <= _GEN_2;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_41) begin
          $fwrite(32'h80000002,
            "From printf -- in: ready %d   valid %d   value %d  -- out:  ready %d  valid %d  value %d\n",io_in_ready,
            io_in_valid,io_in_bits,io_out_ready,io_out_valid,io_out_bits); // @[InterpreterVerilatorConsistencySpec.scala 46:9:@47.6]
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
