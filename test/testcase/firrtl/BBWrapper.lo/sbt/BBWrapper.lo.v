module BBWrapper( // @[:@11.2]
  input   clock, // @[:@12.4]
  input   reset, // @[:@13.4]
  input   io_a, // @[:@14.4]
  input   io_b, // @[:@14.4]
  output  io_result // @[:@14.4]
);
  wire  tb_result; // @[BlackBoxAnd.scala 29:18:@19.4]
  wire  tb_b; // @[BlackBoxAnd.scala 29:18:@19.4]
  wire  tb_a; // @[BlackBoxAnd.scala 29:18:@19.4]
  BB tb ( // @[BlackBoxAnd.scala 29:18:@19.4]
    .result(tb_result),
    .b(tb_b),
    .a(tb_a)
  );
  assign io_result = tb_result;
  assign tb_b = io_b;
  assign tb_a = io_a;
endmodule
