module OuterMemModule( // @[:@13.2]
  input         clock, // @[:@14.4]
  input         reset, // @[:@15.4]
  input  [9:0]  io_readAddress, // @[:@16.4]
  output [31:0] io_readData // @[:@16.4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] billy [0:1023]; // @[MemPokeSpec.scala 22:18:@21.4]
  wire  billy__T_6_en; // @[MemPokeSpec.scala 22:18:@21.4]
  wire [9:0] billy__T_6_addr; // @[MemPokeSpec.scala 22:18:@21.4]
  wire [31:0] billy__T_6_data; // @[MemPokeSpec.scala 22:18:@21.4]
  assign billy__T_6_en = 1'h1;
  assign billy__T_6_addr = io_readAddress;
  assign billy__T_6_data = billy[billy__T_6_addr]; // @[MemPokeSpec.scala 22:18:@21.4]
  assign io_readData = billy__T_6_data;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    billy[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
