module Sort( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [15:0] io_inputs_0, // @[:@6.4]
  input  [15:0] io_inputs_1, // @[:@6.4]
  input  [15:0] io_inputs_2, // @[:@6.4]
  input  [15:0] io_inputs_3, // @[:@6.4]
  input  [15:0] io_inputs_4, // @[:@6.4]
  input         io_newInputs, // @[:@6.4]
  output [15:0] io_outputs_0, // @[:@6.4]
  output [15:0] io_outputs_1, // @[:@6.4]
  output [15:0] io_outputs_2, // @[:@6.4]
  output [15:0] io_outputs_3, // @[:@6.4]
  output [15:0] io_outputs_4, // @[:@6.4]
  output        io_sortDone // @[:@6.4]
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
  reg [63:0] orderedRegs_0; // @[Sort.scala 21:25:@11.4]
  reg [63:0] orderedRegs_1; // @[Sort.scala 21:25:@11.4]
  reg [63:0] orderedRegs_2; // @[Sort.scala 21:25:@11.4]
  reg [63:0] orderedRegs_3; // @[Sort.scala 21:25:@11.4]
  reg [63:0] orderedRegs_4; // @[Sort.scala 21:25:@11.4]
  reg  busy; // @[Sort.scala 22:29:@12.4]
  reg [2:0] sortCounter; // @[Sort.scala 23:29:@13.4]
  reg  isEvenCycle; // @[Sort.scala 24:29:@14.4]
  wire  _T_42 = ~isEvenCycle; // @[Sort.scala 35:20:@27.8]
  wire [2:0] _T_45 = sortCounter + 3'h1; // @[Sort.scala 37:32:@30.8]
  wire  _T_47 = sortCounter > 3'h5; // @[Sort.scala 38:22:@32.8]
  wire  _GEN_0 = _T_47 ? 1'h0 : busy; // @[Sort.scala 38:37:@33.8]
  wire  _T_49 = $signed(orderedRegs_0) > $signed(orderedRegs_1); // @[Sort.scala 45:21:@37.10]
  wire  _T_50 = $signed(orderedRegs_2) > $signed(orderedRegs_3); // @[Sort.scala 45:21:@42.10]
  wire  _T_51 = $signed(orderedRegs_1) > $signed(orderedRegs_2); // @[Sort.scala 55:21:@49.10]
  wire  _T_52 = $signed(orderedRegs_3) > $signed(orderedRegs_4); // @[Sort.scala 55:21:@54.10]
  wire  _GEN_16 = busy ? _GEN_0 : busy; // @[Sort.scala 34:19:@26.6]
  wire [23:0] _GEN_30 = {$signed(io_inputs_0), 8'h0}; // @[Sort.scala 26:22:@15.4]
  wire [23:0] _GEN_31 = {$signed(io_inputs_1), 8'h0}; // @[Sort.scala 26:22:@15.4]
  wire [23:0] _GEN_32 = {$signed(io_inputs_2), 8'h0}; // @[Sort.scala 26:22:@15.4]
  wire [23:0] _GEN_33 = {$signed(io_inputs_3), 8'h0}; // @[Sort.scala 26:22:@15.4]
  wire [23:0] _GEN_34 = {$signed(io_inputs_4), 8'h0}; // @[Sort.scala 26:22:@15.4]
  wire  _GEN_27 = io_newInputs | _GEN_16; // @[Sort.scala 26:22:@15.4]
  wire [55:0] _GEN_35 = orderedRegs_0[63:8];
  wire [55:0] _GEN_37 = orderedRegs_1[63:8];
  wire [55:0] _GEN_39 = orderedRegs_2[63:8];
  wire [55:0] _GEN_41 = orderedRegs_3[63:8];
  wire [55:0] _GEN_43 = orderedRegs_4[63:8];
  assign io_outputs_0 = _GEN_35[15:0];
  assign io_outputs_1 = _GEN_37[15:0];
  assign io_outputs_2 = _GEN_39[15:0];
  assign io_outputs_3 = _GEN_41[15:0];
  assign io_outputs_4 = _GEN_43[15:0];
  assign io_sortDone = ~busy; // @[Sort.scala 64:18:@61.4]
  always @(posedge clock) begin
    if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      orderedRegs_0 <= {{40{_GEN_30[23]}},_GEN_30};
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      if (isEvenCycle) begin // @[Sort.scala 42:23:@36.8]
        if (_T_49) begin // @[Sort.scala 45:29:@38.10]
          orderedRegs_0 <= orderedRegs_1;
        end
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      orderedRegs_1 <= {{40{_GEN_31[23]}},_GEN_31};
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      if (isEvenCycle) begin // @[Sort.scala 42:23:@36.8]
        if (_T_49) begin // @[Sort.scala 45:29:@38.10]
          orderedRegs_1 <= orderedRegs_0;
        end
      end else if (_T_51) begin // @[Sort.scala 55:29:@50.10]
        orderedRegs_1 <= orderedRegs_2;
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      orderedRegs_2 <= {{40{_GEN_32[23]}},_GEN_32};
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      if (isEvenCycle) begin // @[Sort.scala 42:23:@36.8]
        if (_T_50) begin // @[Sort.scala 45:29:@43.10]
          orderedRegs_2 <= orderedRegs_3;
        end
      end else if (_T_51) begin // @[Sort.scala 55:29:@50.10]
        orderedRegs_2 <= orderedRegs_1;
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      orderedRegs_3 <= {{40{_GEN_33[23]}},_GEN_33};
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      if (isEvenCycle) begin // @[Sort.scala 42:23:@36.8]
        if (_T_50) begin // @[Sort.scala 45:29:@43.10]
          orderedRegs_3 <= orderedRegs_2;
        end
      end else if (_T_52) begin // @[Sort.scala 55:29:@55.10]
        orderedRegs_3 <= orderedRegs_4;
      end
    end
    if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      orderedRegs_4 <= {{40{_GEN_34[23]}},_GEN_34};
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      if (!(isEvenCycle)) begin // @[Sort.scala 42:23:@36.8]
        if (_T_52) begin // @[Sort.scala 55:29:@55.10]
          orderedRegs_4 <= orderedRegs_3;
        end
      end
    end
    if (reset) begin
      busy <= 1'h0;
    end else begin
      busy <= _GEN_27;
    end
    if (reset) begin
      sortCounter <= 3'h0;
    end else if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      sortCounter <= 3'h0;
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      sortCounter <= _T_45;
    end
    if (reset) begin
      isEvenCycle <= 1'h0;
    end else if (io_newInputs) begin // @[Sort.scala 26:22:@15.4]
      isEvenCycle <= 1'h0;
    end else if (busy) begin // @[Sort.scala 34:19:@26.6]
      isEvenCycle <= _T_42;
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
