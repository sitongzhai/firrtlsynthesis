module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [12:0] io_alu_opcode,
  output [31:0] io_out
);
  wire [31:0] _T_8 = io_in1 + io_in2; // @[ALUTester.scala 38:32]
  wire [31:0] _T_11 = io_in1 - io_in2; // @[ALUTester.scala 39:32]
  wire [31:0] _T_12 = io_in1 & io_in2; // @[ALUTester.scala 40:32]
  wire [31:0] _T_13 = io_in1 | io_in2; // @[ALUTester.scala 41:31]
  wire [31:0] _T_14 = io_in1 ^ io_in2; // @[ALUTester.scala 42:32]
  wire [31:0] _T_16 = ~_T_14; // @[ALUTester.scala 43:26]
  wire [62:0] _GEN_0 = {{31'd0}, io_in1}; // @[ALUTester.scala 44:38]
  wire [62:0] _T_18 = _GEN_0 << io_in2[4:0]; // @[ALUTester.scala 44:38]
  wire [31:0] _T_20 = io_in1 >> io_in2[4:0]; // @[ALUTester.scala 45:46]
  wire [31:0] _T_24 = $signed(io_in1) >>> io_in2[4:0]; // @[ALUTester.scala 48:73]
  wire  _T_27 = $signed(io_in1) < $signed(io_in2); // @[ALUTester.scala 49:47]
  wire  _T_28 = io_in1 < io_in2; // @[ALUTester.scala 50:48]
  wire [31:0] _T_30 = 13'hd == io_alu_opcode ? io_in2 : 32'hdeadf00d; // @[Mux.scala 46:16]
  wire [31:0] _T_32 = 13'hc == io_alu_opcode ? io_in1 : _T_30; // @[Mux.scala 46:16]
  wire [31:0] _T_34 = 13'hb == io_alu_opcode ? {{31'd0}, _T_28} : _T_32; // @[Mux.scala 46:16]
  wire [31:0] _T_36 = 13'ha == io_alu_opcode ? {{31'd0}, _T_27} : _T_34; // @[Mux.scala 46:16]
  wire [31:0] _T_38 = 13'h9 == io_alu_opcode ? _T_24 : _T_36; // @[Mux.scala 46:16]
  wire [31:0] _T_40 = 13'h8 == io_alu_opcode ? _T_20 : _T_38; // @[Mux.scala 46:16]
  wire [62:0] _T_42 = 13'h7 == io_alu_opcode ? _T_18 : {{31'd0}, _T_40}; // @[Mux.scala 46:16]
  wire [62:0] _T_44 = 13'h6 == io_alu_opcode ? {{31'd0}, _T_16} : _T_42; // @[Mux.scala 46:16]
  wire [62:0] _T_46 = 13'h5 == io_alu_opcode ? {{31'd0}, _T_14} : _T_44; // @[Mux.scala 46:16]
  wire [62:0] _T_48 = 13'h4 == io_alu_opcode ? {{31'd0}, _T_13} : _T_46; // @[Mux.scala 46:16]
  wire [62:0] _T_50 = 13'h3 == io_alu_opcode ? {{31'd0}, _T_12} : _T_48; // @[Mux.scala 46:16]
  wire [62:0] _T_52 = 13'h2 == io_alu_opcode ? {{31'd0}, _T_11} : _T_50; // @[Mux.scala 46:16]
  wire [62:0] _T_54 = 13'h1 == io_alu_opcode ? {{31'd0}, _T_8} : _T_52; // @[Mux.scala 46:16]
  assign io_out = _T_54[31:0]; // @[ALUTester.scala 36:10]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"io.alu_opcode = %d mux_alu_opcode = %d io.in1 = %x io.in2 = %x io.out = %x\n",
            io_alu_opcode,io_alu_opcode,io_in1,io_in2,io_out); // @[ALUTester.scala 57:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
