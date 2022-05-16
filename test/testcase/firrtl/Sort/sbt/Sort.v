module Sort(
  input         clock,
  input         reset,
  input  [15:0] io_inputs_0,
  input  [15:0] io_inputs_1,
  input  [15:0] io_inputs_2,
  input  [15:0] io_inputs_3,
  input  [15:0] io_inputs_4,
  input         io_newInputs,
  output [15:0] io_outputs_0,
  output [15:0] io_outputs_1,
  output [15:0] io_outputs_2,
  output [15:0] io_outputs_3,
  output [15:0] io_outputs_4,
  output        io_sortDone
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] orderedRegs_0; // @[Sort.scala 21:25]
  reg [63:0] orderedRegs_1; // @[Sort.scala 21:25]
  reg [63:0] orderedRegs_2; // @[Sort.scala 21:25]
  reg [63:0] orderedRegs_3; // @[Sort.scala 21:25]
  reg [63:0] orderedRegs_4; // @[Sort.scala 21:25]
  reg  busy; // @[Sort.scala 22:29]
  reg [2:0] sortCounter; // @[Sort.scala 23:29]
  reg  isEvenCycle; // @[Sort.scala 24:29]
  wire [2:0] _T_45 = sortCounter + 3'h1; // @[Sort.scala 37:32]
  wire  _GEN_0 = sortCounter > 3'h5 ? 1'h0 : busy; // @[Sort.scala 38:37 Sort.scala 39:12 Sort.scala 22:29]
  wire  _GEN_16 = busy ? _GEN_0 : busy; // @[Sort.scala 34:19 Sort.scala 22:29]
  wire [23:0] _GEN_30 = {$signed(io_inputs_0), 8'h0}; // @[Sort.scala 26:22 Sort.scala 28:60]
  wire [23:0] _GEN_31 = {$signed(io_inputs_1), 8'h0}; // @[Sort.scala 26:22 Sort.scala 28:60]
  wire [23:0] _GEN_32 = {$signed(io_inputs_2), 8'h0}; // @[Sort.scala 26:22 Sort.scala 28:60]
  wire [23:0] _GEN_33 = {$signed(io_inputs_3), 8'h0}; // @[Sort.scala 26:22 Sort.scala 28:60]
  wire [23:0] _GEN_34 = {$signed(io_inputs_4), 8'h0}; // @[Sort.scala 26:22 Sort.scala 28:60]
  wire  _GEN_27 = io_newInputs | _GEN_16; // @[Sort.scala 26:22 Sort.scala 30:10]
  wire [55:0] _GEN_35 = orderedRegs_0[63:8]; // @[Sort.scala 68:9]
  wire [55:0] _GEN_37 = orderedRegs_1[63:8]; // @[Sort.scala 68:9]
  wire [55:0] _GEN_39 = orderedRegs_2[63:8]; // @[Sort.scala 68:9]
  wire [55:0] _GEN_41 = orderedRegs_3[63:8]; // @[Sort.scala 68:9]
  wire [55:0] _GEN_43 = orderedRegs_4[63:8]; // @[Sort.scala 68:9]
  assign io_outputs_0 = _GEN_35[15:0]; // @[Sort.scala 68:9]
  assign io_outputs_1 = _GEN_37[15:0]; // @[Sort.scala 68:9]
  assign io_outputs_2 = _GEN_39[15:0]; // @[Sort.scala 68:9]
  assign io_outputs_3 = _GEN_41[15:0]; // @[Sort.scala 68:9]
  assign io_outputs_4 = _GEN_43[15:0]; // @[Sort.scala 68:9]
  assign io_sortDone = ~busy; // @[Sort.scala 64:18]
  always @(posedge clock) begin
    if (io_newInputs) begin // @[Sort.scala 26:22]
      orderedRegs_0 <= {{40{_GEN_30[23]}},_GEN_30}; // @[Sort.scala 28:60]
    end else if (busy) begin // @[Sort.scala 34:19]
      if (isEvenCycle) begin // @[Sort.scala 42:23]
        if ($signed(orderedRegs_0) > $signed(orderedRegs_1)) begin // @[Sort.scala 45:29]
          orderedRegs_0 <= orderedRegs_1; // @[Sort.scala 46:18]
        end
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22]
      orderedRegs_1 <= {{40{_GEN_31[23]}},_GEN_31}; // @[Sort.scala 28:60]
    end else if (busy) begin // @[Sort.scala 34:19]
      if (isEvenCycle) begin // @[Sort.scala 42:23]
        if ($signed(orderedRegs_0) > $signed(orderedRegs_1)) begin // @[Sort.scala 45:29]
          orderedRegs_1 <= orderedRegs_0; // @[Sort.scala 47:18]
        end
      end else if ($signed(orderedRegs_1) > $signed(orderedRegs_2)) begin // @[Sort.scala 55:29]
        orderedRegs_1 <= orderedRegs_2; // @[Sort.scala 56:18]
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22]
      orderedRegs_2 <= {{40{_GEN_32[23]}},_GEN_32}; // @[Sort.scala 28:60]
    end else if (busy) begin // @[Sort.scala 34:19]
      if (isEvenCycle) begin // @[Sort.scala 42:23]
        if ($signed(orderedRegs_2) > $signed(orderedRegs_3)) begin // @[Sort.scala 45:29]
          orderedRegs_2 <= orderedRegs_3; // @[Sort.scala 46:18]
        end
      end else if ($signed(orderedRegs_1) > $signed(orderedRegs_2)) begin // @[Sort.scala 55:29]
        orderedRegs_2 <= orderedRegs_1; // @[Sort.scala 57:18]
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22]
      orderedRegs_3 <= {{40{_GEN_33[23]}},_GEN_33}; // @[Sort.scala 28:60]
    end else if (busy) begin // @[Sort.scala 34:19]
      if (isEvenCycle) begin // @[Sort.scala 42:23]
        if ($signed(orderedRegs_2) > $signed(orderedRegs_3)) begin // @[Sort.scala 45:29]
          orderedRegs_3 <= orderedRegs_2; // @[Sort.scala 47:18]
        end
      end else if ($signed(orderedRegs_3) > $signed(orderedRegs_4)) begin // @[Sort.scala 55:29]
        orderedRegs_3 <= orderedRegs_4; // @[Sort.scala 56:18]
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22]
      orderedRegs_4 <= {{40{_GEN_34[23]}},_GEN_34}; // @[Sort.scala 28:60]
    end else if (busy) begin // @[Sort.scala 34:19]
      if (!(isEvenCycle)) begin // @[Sort.scala 42:23]
        if ($signed(orderedRegs_3) > $signed(orderedRegs_4)) begin // @[Sort.scala 55:29]
          orderedRegs_4 <= orderedRegs_3; // @[Sort.scala 57:18]
        end
      end
    end
    if (reset) begin // @[Sort.scala 22:29]
      busy <= 1'h0; // @[Sort.scala 22:29]
    end else begin
      busy <= _GEN_27;
    end
    if (reset) begin // @[Sort.scala 23:29]
      sortCounter <= 3'h0; // @[Sort.scala 23:29]
    end else if (io_newInputs) begin // @[Sort.scala 26:22]
      sortCounter <= 3'h0; // @[Sort.scala 31:17]
    end else if (busy) begin // @[Sort.scala 34:19]
      sortCounter <= _T_45; // @[Sort.scala 37:17]
    end
    if (reset) begin // @[Sort.scala 24:29]
      isEvenCycle <= 1'h0; // @[Sort.scala 24:29]
    end else if (io_newInputs) begin // @[Sort.scala 26:22]
      isEvenCycle <= 1'h0; // @[Sort.scala 32:17]
    end else if (busy) begin // @[Sort.scala 34:19]
      isEvenCycle <= ~isEvenCycle; // @[Sort.scala 35:17]
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
  _RAND_0 = {2{`RANDOM}};
  orderedRegs_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  orderedRegs_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  orderedRegs_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  orderedRegs_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  orderedRegs_4 = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  busy = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sortCounter = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  isEvenCycle = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
