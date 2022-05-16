module Compare(
  input        clock,
  input        reset,
  input  [7:0] io_u0,
  input  [5:0] io_u1,
  input  [3:0] io_s0,
  input  [7:0] io_s1,
  output       io_uout_lt,
  output       io_sout_lt,
  output       io_uout_leq,
  output       io_sout_leq,
  input  [4:0] io_u2,
  input  [5:0] io_u3,
  input  [5:0] io_s2,
  input  [6:0] io_s3,
  output       io_uout_gt,
  output       io_sout_gt,
  output       io_uout_geq,
  output       io_sout_geq,
  output       io_uout_eq,
  output       io_sout_eq,
  output       io_uout_neq,
  output       io_sout_neq
);
  wire [7:0] _GEN_0 = {{2'd0}, io_u1}; // @[Compare.scala 32:23]
  wire [7:0] _GEN_1 = {{4{io_s0[3]}},io_s0}; // @[Compare.scala 33:23]
  wire [5:0] _GEN_4 = {{1'd0}, io_u2}; // @[Compare.scala 37:23]
  wire [6:0] _GEN_5 = {{1{io_s2[5]}},io_s2}; // @[Compare.scala 38:23]
  assign io_uout_lt = io_u0 < _GEN_0; // @[Compare.scala 32:23]
  assign io_sout_lt = $signed(_GEN_1) < $signed(io_s1); // @[Compare.scala 33:23]
  assign io_uout_leq = io_u0 <= _GEN_0; // @[Compare.scala 34:24]
  assign io_sout_leq = $signed(_GEN_1) <= $signed(io_s1); // @[Compare.scala 35:24]
  assign io_uout_gt = _GEN_4 > io_u3; // @[Compare.scala 37:23]
  assign io_sout_gt = $signed(_GEN_5) > $signed(io_s3); // @[Compare.scala 38:23]
  assign io_uout_geq = _GEN_4 >= io_u3; // @[Compare.scala 39:24]
  assign io_sout_geq = $signed(_GEN_5) >= $signed(io_s3); // @[Compare.scala 40:24]
  assign io_uout_eq = _GEN_4 == io_u3; // @[Compare.scala 42:23]
  assign io_sout_eq = $signed(_GEN_5) == $signed(io_s3); // @[Compare.scala 43:23]
  assign io_uout_neq = _GEN_4 != io_u3; // @[Compare.scala 44:24]
  assign io_sout_neq = $signed(_GEN_5) != $signed(io_s3); // @[Compare.scala 45:24]
endmodule
