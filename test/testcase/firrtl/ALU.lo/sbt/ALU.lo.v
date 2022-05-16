module ALU( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_in1, // @[:@6.4]
  input  [31:0] io_in2, // @[:@6.4]
  input  [12:0] io_alu_opcode, // @[:@6.4]
  output [31:0] io_out // @[:@6.4]
);
  wire [31:0] _T_21 = io_in1 + io_in2; // @[ALUTester.scala 38:32:@13.4]
  wire [31:0] _T_24 = io_in1 - io_in2; // @[ALUTester.scala 39:32:@16.4]
  wire [31:0] _T_25 = io_in1 & io_in2; // @[ALUTester.scala 40:32:@17.4]
  wire [31:0] _T_26 = io_in1 | io_in2; // @[ALUTester.scala 41:31:@18.4]
  wire [31:0] _T_27 = io_in1 ^ io_in2; // @[ALUTester.scala 42:32:@19.4]
  wire [31:0] _T_29 = ~_T_27; // @[ALUTester.scala 43:26:@21.4]
  wire [62:0] _GEN_0 = {{31'd0}, io_in1}; // @[ALUTester.scala 44:38:@23.4]
  wire [62:0] _T_31 = _GEN_0 << io_in2[4:0]; // @[ALUTester.scala 44:38:@23.4]
  wire [31:0] _T_33 = io_in1 >> io_in2[4:0]; // @[ALUTester.scala 45:46:@25.4]
  wire [31:0] _T_37 = $signed(io_in1) >>> io_in2[4:0]; // @[ALUTester.scala 48:73:@29.4]
  wire  _T_40 = $signed(io_in1) < $signed(io_in2); // @[ALUTester.scala 49:47:@32.4]
  wire  _T_41 = io_in1 < io_in2; // @[ALUTester.scala 50:48:@33.4]
  wire  _T_42 = 13'hd == io_alu_opcode; // @[Mux.scala 46:19:@34.4]
  wire [31:0] _T_43 = _T_42 ? io_in2 : 32'hdeadf00d; // @[Mux.scala 46:16:@35.4]
  wire  _T_44 = 13'hc == io_alu_opcode; // @[Mux.scala 46:19:@36.4]
  wire [31:0] _T_45 = _T_44 ? io_in1 : _T_43; // @[Mux.scala 46:16:@37.4]
  wire  _T_46 = 13'hb == io_alu_opcode; // @[Mux.scala 46:19:@38.4]
  wire [31:0] _T_47 = _T_46 ? {{31'd0}, _T_41} : _T_45; // @[Mux.scala 46:16:@39.4]
  wire  _T_48 = 13'ha == io_alu_opcode; // @[Mux.scala 46:19:@40.4]
  wire [31:0] _T_49 = _T_48 ? {{31'd0}, _T_40} : _T_47; // @[Mux.scala 46:16:@41.4]
  wire  _T_50 = 13'h9 == io_alu_opcode; // @[Mux.scala 46:19:@42.4]
  wire [31:0] _T_51 = _T_50 ? _T_37 : _T_49; // @[Mux.scala 46:16:@43.4]
  wire  _T_52 = 13'h8 == io_alu_opcode; // @[Mux.scala 46:19:@44.4]
  wire [31:0] _T_53 = _T_52 ? _T_33 : _T_51; // @[Mux.scala 46:16:@45.4]
  wire  _T_54 = 13'h7 == io_alu_opcode; // @[Mux.scala 46:19:@46.4]
  wire [62:0] _T_55 = _T_54 ? _T_31 : {{31'd0}, _T_53}; // @[Mux.scala 46:16:@47.4]
  wire  _T_56 = 13'h6 == io_alu_opcode; // @[Mux.scala 46:19:@48.4]
  wire [62:0] _T_57 = _T_56 ? {{31'd0}, _T_29} : _T_55; // @[Mux.scala 46:16:@49.4]
  wire  _T_58 = 13'h5 == io_alu_opcode; // @[Mux.scala 46:19:@50.4]
  wire [62:0] _T_59 = _T_58 ? {{31'd0}, _T_27} : _T_57; // @[Mux.scala 46:16:@51.4]
  wire  _T_60 = 13'h4 == io_alu_opcode; // @[Mux.scala 46:19:@52.4]
  wire [62:0] _T_61 = _T_60 ? {{31'd0}, _T_26} : _T_59; // @[Mux.scala 46:16:@53.4]
  wire  _T_62 = 13'h3 == io_alu_opcode; // @[Mux.scala 46:19:@54.4]
  wire [62:0] _T_63 = _T_62 ? {{31'd0}, _T_25} : _T_61; // @[Mux.scala 46:16:@55.4]
  wire  _T_64 = 13'h2 == io_alu_opcode; // @[Mux.scala 46:19:@56.4]
  wire [62:0] _T_65 = _T_64 ? {{31'd0}, _T_24} : _T_63; // @[Mux.scala 46:16:@57.4]
  wire  _T_66 = 13'h1 == io_alu_opcode; // @[Mux.scala 46:19:@58.4]
  wire [62:0] _T_67 = _T_66 ? {{31'd0}, _T_21} : _T_65; // @[Mux.scala 46:16:@59.4]
  wire  _T_71 = ~reset; // @[ALUTester.scala 57:11:@63.6]
  assign io_out = _T_67[31:0];
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_71) begin
          $fwrite(32'h80000002,"io.alu_opcode = %d mux_alu_opcode = %d io.in1 = %x io.in2 = %x io.out = %x\n",
            io_alu_opcode,io_alu_opcode,io_in1,io_in2,io_out); // @[ALUTester.scala 57:11:@65.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
