module SortFixed(
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
  reg [63:0] orderedRegs_0; // @[SortFixed.scala 20:28]
  reg [63:0] orderedRegs_1; // @[SortFixed.scala 20:28]
  reg [63:0] orderedRegs_2; // @[SortFixed.scala 20:28]
  reg [63:0] orderedRegs_3; // @[SortFixed.scala 20:28]
  reg [63:0] orderedRegs_4; // @[SortFixed.scala 20:28]
  reg  busy; // @[SortFixed.scala 21:21]
  reg [2:0] sortCounter; // @[SortFixed.scala 22:28]
  reg  isEvenCycle; // @[SortFixed.scala 23:28]
  wire [2:0] _T_110 = sortCounter + 3'h1; // @[SortFixed.scala 33:34]
  wire  _GEN_0 = sortCounter > 3'h5 ? 1'h0 : busy; // @[SortFixed.scala 34:37 SortFixed.scala 35:14 SortFixed.scala 21:21]
  wire [63:0] _GEN_1 = $signed(orderedRegs_0) > $signed(orderedRegs_1) ? $signed(orderedRegs_1) : $signed(orderedRegs_0)
    ; // @[SortFixed.scala 38:48 SortFixed.scala 39:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_2 = $signed(orderedRegs_0) > $signed(orderedRegs_1) ? $signed(orderedRegs_0) : $signed(orderedRegs_1)
    ; // @[SortFixed.scala 38:48 SortFixed.scala 40:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_3 = $signed(orderedRegs_2) > $signed(orderedRegs_3) ? $signed(orderedRegs_3) : $signed(orderedRegs_2)
    ; // @[SortFixed.scala 42:48 SortFixed.scala 43:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_4 = $signed(orderedRegs_2) > $signed(orderedRegs_3) ? $signed(orderedRegs_2) : $signed(orderedRegs_3)
    ; // @[SortFixed.scala 42:48 SortFixed.scala 44:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_5 = $signed(orderedRegs_1) > $signed(orderedRegs_2) ? $signed(orderedRegs_2) : $signed(orderedRegs_1)
    ; // @[SortFixed.scala 47:48 SortFixed.scala 48:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_6 = $signed(orderedRegs_1) > $signed(orderedRegs_2) ? $signed(orderedRegs_1) : $signed(orderedRegs_2)
    ; // @[SortFixed.scala 47:48 SortFixed.scala 49:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_7 = $signed(orderedRegs_3) > $signed(orderedRegs_4) ? $signed(orderedRegs_4) : $signed(orderedRegs_3)
    ; // @[SortFixed.scala 51:48 SortFixed.scala 52:26 SortFixed.scala 20:28]
  wire [63:0] _GEN_8 = $signed(orderedRegs_3) > $signed(orderedRegs_4) ? $signed(orderedRegs_3) : $signed(orderedRegs_4)
    ; // @[SortFixed.scala 51:48 SortFixed.scala 53:26 SortFixed.scala 20:28]
  wire  _GEN_16 = busy ? _GEN_0 : busy; // @[SortFixed.scala 31:17 SortFixed.scala 21:21]
  wire [23:0] _GEN_30 = {$signed(io_inputs_0), 8'h0}; // @[SortFixed.scala 25:23 SortFixed.scala 26:17]
  wire [23:0] _GEN_31 = {$signed(io_inputs_1), 8'h0}; // @[SortFixed.scala 25:23 SortFixed.scala 26:17]
  wire [23:0] _GEN_32 = {$signed(io_inputs_2), 8'h0}; // @[SortFixed.scala 25:23 SortFixed.scala 26:17]
  wire [23:0] _GEN_33 = {$signed(io_inputs_3), 8'h0}; // @[SortFixed.scala 25:23 SortFixed.scala 26:17]
  wire [23:0] _GEN_34 = {$signed(io_inputs_4), 8'h0}; // @[SortFixed.scala 25:23 SortFixed.scala 26:17]
  wire  _GEN_27 = io_newInputs | _GEN_16; // @[SortFixed.scala 25:23 SortFixed.scala 27:10]
  wire [55:0] _GEN_35 = orderedRegs_0[63:8]; // @[SortFixed.scala 59:14]
  wire [55:0] _GEN_37 = orderedRegs_1[63:8]; // @[SortFixed.scala 59:14]
  wire [55:0] _GEN_39 = orderedRegs_2[63:8]; // @[SortFixed.scala 59:14]
  wire [55:0] _GEN_41 = orderedRegs_3[63:8]; // @[SortFixed.scala 59:14]
  wire [55:0] _GEN_43 = orderedRegs_4[63:8]; // @[SortFixed.scala 59:14]
  assign io_outputs_0 = _GEN_35[15:0]; // @[SortFixed.scala 59:14]
  assign io_outputs_1 = _GEN_37[15:0]; // @[SortFixed.scala 59:14]
  assign io_outputs_2 = _GEN_39[15:0]; // @[SortFixed.scala 59:14]
  assign io_outputs_3 = _GEN_41[15:0]; // @[SortFixed.scala 59:14]
  assign io_outputs_4 = _GEN_43[15:0]; // @[SortFixed.scala 59:14]
  assign io_sortDone = ~busy; // @[SortFixed.scala 58:24]
  always @(posedge clock) begin
    if (reset) begin // @[SortFixed.scala 20:28]
      orderedRegs_0 <= 64'sh0; // @[SortFixed.scala 20:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      orderedRegs_0 <= {{40{_GEN_30[23]}},_GEN_30}; // @[SortFixed.scala 26:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      if (isEvenCycle) begin // @[SortFixed.scala 37:26]
        orderedRegs_0 <= _GEN_1;
      end
    end
    if (reset) begin // @[SortFixed.scala 20:28]
      orderedRegs_1 <= 64'sh0; // @[SortFixed.scala 20:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      orderedRegs_1 <= {{40{_GEN_31[23]}},_GEN_31}; // @[SortFixed.scala 26:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      if (isEvenCycle) begin // @[SortFixed.scala 37:26]
        orderedRegs_1 <= _GEN_2;
      end else begin
        orderedRegs_1 <= _GEN_5;
      end
    end
    if (reset) begin // @[SortFixed.scala 20:28]
      orderedRegs_2 <= 64'sh0; // @[SortFixed.scala 20:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      orderedRegs_2 <= {{40{_GEN_32[23]}},_GEN_32}; // @[SortFixed.scala 26:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      if (isEvenCycle) begin // @[SortFixed.scala 37:26]
        orderedRegs_2 <= _GEN_3;
      end else begin
        orderedRegs_2 <= _GEN_6;
      end
    end
    if (reset) begin // @[SortFixed.scala 20:28]
      orderedRegs_3 <= 64'sh0; // @[SortFixed.scala 20:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      orderedRegs_3 <= {{40{_GEN_33[23]}},_GEN_33}; // @[SortFixed.scala 26:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      if (isEvenCycle) begin // @[SortFixed.scala 37:26]
        orderedRegs_3 <= _GEN_4;
      end else begin
        orderedRegs_3 <= _GEN_7;
      end
    end
    if (reset) begin // @[SortFixed.scala 20:28]
      orderedRegs_4 <= 64'sh0; // @[SortFixed.scala 20:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      orderedRegs_4 <= {{40{_GEN_34[23]}},_GEN_34}; // @[SortFixed.scala 26:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      if (!(isEvenCycle)) begin // @[SortFixed.scala 37:26]
        orderedRegs_4 <= _GEN_8;
      end
    end
    if (reset) begin // @[SortFixed.scala 21:21]
      busy <= 1'h0; // @[SortFixed.scala 21:21]
    end else begin
      busy <= _GEN_27;
    end
    if (reset) begin // @[SortFixed.scala 22:28]
      sortCounter <= 3'h0; // @[SortFixed.scala 22:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      sortCounter <= 3'h0; // @[SortFixed.scala 28:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      sortCounter <= _T_110; // @[SortFixed.scala 33:19]
    end
    if (reset) begin // @[SortFixed.scala 23:28]
      isEvenCycle <= 1'h0; // @[SortFixed.scala 23:28]
    end else if (io_newInputs) begin // @[SortFixed.scala 25:23]
      isEvenCycle <= 1'h0; // @[SortFixed.scala 29:17]
    end else if (busy) begin // @[SortFixed.scala 31:17]
      isEvenCycle <= ~isEvenCycle; // @[SortFixed.scala 32:19]
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
