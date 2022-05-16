module BBWrapper(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  output  io_result
);
  wire  tb_result; // @[BlackBoxAnd.scala 27:18]
  wire  tb_b; // @[BlackBoxAnd.scala 27:18]
  wire  tb_a; // @[BlackBoxAnd.scala 27:18]
  BBAnd tb ( // @[BlackBoxAnd.scala 27:18]
    .result(tb_result),
    .b(tb_b),
    .a(tb_a)
  );
  assign io_result = tb_result; // @[BlackBoxAnd.scala 30:13]
  assign tb_b = io_b; // @[BlackBoxAnd.scala 29:11]
  assign tb_a = io_a; // @[BlackBoxAnd.scala 28:11]
endmodule
