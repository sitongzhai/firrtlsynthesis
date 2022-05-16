module AdderExerciser(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ticker; // @[Exerciser.scala 20:36]
  reg [31:0] max_ticks_for_state; // @[Exerciser.scala 21:36]
  reg [31:0] state_number; // @[Exerciser.scala 22:36]
  reg  state_locked; // @[Exerciser.scala 23:36]
  wire [31:0] _T_12 = ticker + 32'h1; // @[Exerciser.scala 27:20]
  wire  _T_14 = ~state_locked; // @[Exerciser.scala 28:8]
  wire [31:0] _T_18 = state_number + 32'h1; // @[Exerciser.scala 30:34]
  wire [31:0] _GEN_0 = ~state_locked ? 32'h0 : _T_12; // @[Exerciser.scala 28:23 Exerciser.scala 29:18 Exerciser.scala 27:10]
  wire [31:0] _GEN_1 = ~state_locked ? _T_18 : state_number; // @[Exerciser.scala 28:23 Exerciser.scala 30:18 Exerciser.scala 22:36]
  wire  _T_21 = ~(~state_locked); // @[Exerciser.scala 28:23]
  wire  _T_22 = _T_21 & ticker > max_ticks_for_state; // @[Exerciser.scala 32:43]
  wire  _T_24 = ~reset; // @[Exerciser.scala 33:11]
  wire  _GEN_2 = _T_21 & ticker > max_ticks_for_state ? 1'h0 : state_locked; // @[Exerciser.scala 32:43 Exerciser.scala 35:18 Exerciser.scala 23:36]
  wire [31:0] _GEN_3 = _T_21 & ticker > max_ticks_for_state ? _T_18 : _GEN_1; // @[Exerciser.scala 32:43 Exerciser.scala 36:18]
  wire  _T_30 = ticker > 32'h64; // @[Exerciser.scala 38:15]
  reg [31:0] test_number; // @[Adder.scala 54:33]
  wire  _T_192 = test_number > 32'h14; // @[Adder.scala 56:55]
  wire  _T_194 = state_number == 32'h21; // @[Exerciser.scala 53:23]
  wire  _GEN_4 = _T_14 | _GEN_2; // @[Exerciser.scala 54:28 Exerciser.scala 56:29]
  wire [4:0] _GEN_9 = 5'h1 == test_number[4:0] ? 5'h4 : 5'h3; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_10 = 5'h2 == test_number[4:0] ? 5'h5 : _GEN_9; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_11 = 5'h3 == test_number[4:0] ? 5'h6 : _GEN_10; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_12 = 5'h4 == test_number[4:0] ? 5'h7 : _GEN_11; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_13 = 5'h5 == test_number[4:0] ? 5'h8 : _GEN_12; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_14 = 5'h6 == test_number[4:0] ? 5'h9 : _GEN_13; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_15 = 5'h7 == test_number[4:0] ? 5'ha : _GEN_14; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_16 = 5'h8 == test_number[4:0] ? 5'hb : _GEN_15; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_17 = 5'h9 == test_number[4:0] ? 5'hc : _GEN_16; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_18 = 5'ha == test_number[4:0] ? 5'hd : _GEN_17; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_19 = 5'hb == test_number[4:0] ? 5'he : _GEN_18; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_20 = 5'hc == test_number[4:0] ? 5'hf : _GEN_19; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_21 = 5'hd == test_number[4:0] ? 5'h10 : _GEN_20; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_22 = 5'he == test_number[4:0] ? 5'h11 : _GEN_21; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_23 = 5'hf == test_number[4:0] ? 5'h12 : _GEN_22; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_24 = 5'h10 == test_number[4:0] ? 5'h13 : _GEN_23; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_25 = 5'h11 == test_number[4:0] ? 5'h14 : _GEN_24; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_26 = 5'h12 == test_number[4:0] ? 5'h15 : _GEN_25; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_27 = 5'h13 == test_number[4:0] ? 5'h16 : _GEN_26; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_29 = 5'h1 == test_number[4:0] ? 5'h8 : 5'h7; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_30 = 5'h2 == test_number[4:0] ? 5'h9 : _GEN_29; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_31 = 5'h3 == test_number[4:0] ? 5'ha : _GEN_30; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_32 = 5'h4 == test_number[4:0] ? 5'hb : _GEN_31; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_33 = 5'h5 == test_number[4:0] ? 5'hc : _GEN_32; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_34 = 5'h6 == test_number[4:0] ? 5'hd : _GEN_33; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_35 = 5'h7 == test_number[4:0] ? 5'he : _GEN_34; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_36 = 5'h8 == test_number[4:0] ? 5'hf : _GEN_35; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_37 = 5'h9 == test_number[4:0] ? 5'h10 : _GEN_36; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_38 = 5'ha == test_number[4:0] ? 5'h11 : _GEN_37; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_39 = 5'hb == test_number[4:0] ? 5'h12 : _GEN_38; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_40 = 5'hc == test_number[4:0] ? 5'h13 : _GEN_39; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_41 = 5'hd == test_number[4:0] ? 5'h14 : _GEN_40; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_42 = 5'he == test_number[4:0] ? 5'h15 : _GEN_41; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_43 = 5'hf == test_number[4:0] ? 5'h16 : _GEN_42; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_44 = 5'h10 == test_number[4:0] ? 5'h17 : _GEN_43; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_45 = 5'h11 == test_number[4:0] ? 5'h18 : _GEN_44; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_46 = 5'h12 == test_number[4:0] ? 5'h19 : _GEN_45; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _GEN_47 = 5'h13 == test_number[4:0] ? 5'h1a : _GEN_46; // @[Adder.scala 61:28 Adder.scala 61:28]
  wire [4:0] _T_212 = _GEN_27 + _GEN_47; // @[Adder.scala 61:28]
  wire [4:0] _GEN_89 = 5'h1 == test_number[4:0] ? 5'hc : 5'ha; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_90 = 5'h2 == test_number[4:0] ? 5'he : _GEN_89; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_91 = 5'h3 == test_number[4:0] ? 5'h10 : _GEN_90; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_92 = 5'h4 == test_number[4:0] ? 5'h12 : _GEN_91; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_93 = 5'h5 == test_number[4:0] ? 5'h14 : _GEN_92; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_94 = 5'h6 == test_number[4:0] ? 5'h16 : _GEN_93; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_95 = 5'h7 == test_number[4:0] ? 5'h18 : _GEN_94; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_96 = 5'h8 == test_number[4:0] ? 5'h1a : _GEN_95; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_97 = 5'h9 == test_number[4:0] ? 5'h1c : _GEN_96; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_98 = 5'ha == test_number[4:0] ? 5'h1e : _GEN_97; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_99 = 5'hb == test_number[4:0] ? 5'h0 : _GEN_98; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_100 = 5'hc == test_number[4:0] ? 5'h2 : _GEN_99; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_101 = 5'hd == test_number[4:0] ? 5'h4 : _GEN_100; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_102 = 5'he == test_number[4:0] ? 5'h6 : _GEN_101; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_103 = 5'hf == test_number[4:0] ? 5'h8 : _GEN_102; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_104 = 5'h10 == test_number[4:0] ? 5'ha : _GEN_103; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_105 = 5'h11 == test_number[4:0] ? 5'hc : _GEN_104; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_106 = 5'h12 == test_number[4:0] ? 5'he : _GEN_105; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [4:0] _GEN_107 = 5'h13 == test_number[4:0] ? 5'h10 : _GEN_106; // @[Adder.scala 57:11 Adder.scala 57:11]
  wire [31:0] _T_231 = test_number + 32'h1; // @[Adder.scala 65:32]
  wire  _GEN_168 = _T_192 ? 1'h0 : _GEN_4; // @[Exerciser.scala 63:38 Exerciser.scala 65:22]
  wire  _GEN_170 = state_number == 32'h21 ? _GEN_168 : _GEN_2; // @[Exerciser.scala 53:52]
  wire  _T_239 = state_number > 32'h22; // @[Exerciser.scala 45:23]
  always @(posedge clock) begin
    if (reset) begin // @[Exerciser.scala 20:36]
      ticker <= 32'h0; // @[Exerciser.scala 20:36]
    end else if (state_number == 32'h21) begin // @[Exerciser.scala 53:52]
      if (_T_14) begin // @[Exerciser.scala 54:28]
        ticker <= 32'h0; // @[Exerciser.scala 57:29]
      end else begin
        ticker <= _GEN_0;
      end
    end else begin
      ticker <= _GEN_0;
    end
    if (reset) begin // @[Exerciser.scala 21:36]
      max_ticks_for_state <= 32'h0; // @[Exerciser.scala 21:36]
    end else if (state_number == 32'h21) begin // @[Exerciser.scala 53:52]
      if (_T_14) begin // @[Exerciser.scala 54:28]
        max_ticks_for_state <= 32'h64; // @[Exerciser.scala 58:29]
      end
    end
    if (reset) begin // @[Exerciser.scala 22:36]
      state_number <= 32'h0; // @[Exerciser.scala 22:36]
    end else if (state_number == 32'h21) begin // @[Exerciser.scala 53:52]
      if (_T_192) begin // @[Exerciser.scala 63:38]
        state_number <= _T_18; // @[Exerciser.scala 66:22]
      end else if (_T_14) begin // @[Exerciser.scala 54:28]
        state_number <= 32'h21; // @[Exerciser.scala 59:22]
      end else begin
        state_number <= _GEN_3;
      end
    end else begin
      state_number <= _GEN_3;
    end
    state_locked <= reset | _GEN_170; // @[Exerciser.scala 23:36 Exerciser.scala 23:36]
    if (reset) begin // @[Adder.scala 54:33]
      test_number <= 32'h0; // @[Adder.scala 54:33]
    end else if (state_number == 32'h21) begin // @[Exerciser.scala 53:52]
      test_number <= _T_231; // @[Adder.scala 65:17]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_22 & ~reset) begin
          $fwrite(32'h80000002,"current state %d has run too many cycles, ticks %d max %d",state_number,ticker,
            max_ticks_for_state); // @[Exerciser.scala 33:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_30 & _T_24) begin
          $fwrite(32'h80000002,"Too many cycles ticker %d current_state %d state_locked %x",ticker,state_number,
            state_locked); // @[Exerciser.scala 39:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_30 & _T_24) begin
          $finish; // @[Exerciser.scala 41:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"state_number %d, ticker %d, state_locked %x max_ticks %d",state_number,ticker,
            state_locked,max_ticks_for_state); // @[Adder.scala 43:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_194 & _T_14 & _T_24) begin
          $fwrite(32'h80000002,"Entering state check adder state_number %d ticker %d",state_number,ticker); // @[Exerciser.scala 55:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_194 & _T_24) begin
          $fwrite(32'h80000002,"%d ticker %d test# %d : %d + %d => %d expected %d\n",state_number,ticker,test_number,
            _GEN_27,_GEN_47,_T_212,5'h13 == test_number[4:0] ? 5'h10 : _GEN_106); // @[Adder.scala 57:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_194 & ~(_GEN_107 == _T_212 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Adder.scala:64 assert(expected_out_vec(test_number) === in0_vec(test_number) + in1_vec(test_number))\n"
            ); // @[Adder.scala 64:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_194 & ~(_GEN_107 == _T_212 | reset)) begin
          $fatal; // @[Adder.scala 64:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_194 & _T_192 & _T_24) begin
          $fwrite(32'h80000002,"Leaving state  check adder state_number %d ticker %d",state_number,ticker); // @[Exerciser.scala 64:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_239 & _T_24) begin
          $fwrite(32'h80000002,"All states processed"); // @[Exerciser.scala 46:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_239 & _T_24) begin
          $finish; // @[Exerciser.scala 47:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_239 & _T_24) begin
          $fwrite(32'h80000002,"All states processed"); // @[Exerciser.scala 46:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_239 & _T_24) begin
          $finish; // @[Exerciser.scala 47:11]
        end
    `ifdef STOP_COND
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
  ticker = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  max_ticks_for_state = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  state_number = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  state_locked = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  test_number = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
