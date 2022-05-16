module CSR(
  input         clock,
  input         reset,
  input         io_stall,
  input  [2:0]  io_cmd,
  input  [31:0] io_in,
  output [31:0] io_out,
  input  [31:0] io_pc,
  input  [31:0] io_addr,
  input  [31:0] io_inst,
  input         io_illegal,
  input  [1:0]  io_st_type,
  input  [2:0]  io_ld_type,
  input         io_pc_check,
  output        io_expt,
  output [31:0] io_evec,
  output [31:0] io_epc,
  output [31:0] io_host_tohost
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire [11:0] csr_addr = io_inst[31:20]; // @[CSR.scala 101:25]
  wire [4:0] rs1_addr = io_inst[19:15]; // @[CSR.scala 102:25]
  reg [31:0] time_; // @[Reg.scala 26:44]
  reg [31:0] timeh; // @[Reg.scala 26:44]
  reg [31:0] cycle; // @[Reg.scala 26:44]
  reg [31:0] cycleh; // @[Reg.scala 26:44]
  reg [31:0] instret; // @[Reg.scala 26:44]
  reg [31:0] instreth; // @[Reg.scala 26:44]
  reg [1:0] PRV; // @[Reg.scala 26:44]
  reg [1:0] PRV1; // @[Reg.scala 26:44]
  reg  IE; // @[Reg.scala 26:44]
  reg  IE1; // @[Reg.scala 26:44]
  wire [31:0] mstatus = {22'h0,3'h0,1'h0,PRV1,IE1,PRV,IE}; // @[Cat.scala 30:58]
  reg  MTIP; // @[Reg.scala 26:44]
  reg  MTIE; // @[Reg.scala 26:44]
  reg  MSIP; // @[Reg.scala 26:44]
  reg  MSIE; // @[Reg.scala 26:44]
  wire [31:0] mip = {24'h0,MTIP,1'h0,2'h0,MSIP,1'h0,2'h0}; // @[Cat.scala 30:58]
  wire [31:0] mie = {24'h0,MTIE,1'h0,2'h0,MSIE,1'h0,2'h0}; // @[Cat.scala 30:58]
  reg [31:0] mtimecmp; // @[CSR.scala 155:21]
  reg [31:0] mscratch; // @[CSR.scala 157:21]
  reg [31:0] mepc; // @[CSR.scala 159:17]
  reg [31:0] mcause; // @[CSR.scala 160:19]
  reg [31:0] mbadaddr; // @[CSR.scala 161:21]
  reg [31:0] mtohost; // @[Reg.scala 26:44]
  reg [31:0] mfromhost; // @[CSR.scala 164:22]
  wire  _T_140 = 12'hc00 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_144 = 12'hc01 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_148 = 12'hc02 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_152 = 12'hc80 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_156 = 12'hc81 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_160 = 12'hc82 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_164 = 12'h900 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_168 = 12'h901 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_172 = 12'h902 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_176 = 12'h980 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_180 = 12'h981 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_184 = 12'h982 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_188 = 12'hf00 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_192 = 12'hf01 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_196 = 12'hf10 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_200 = 12'h301 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_204 = 12'h302 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_208 = 12'h304 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_212 = 12'h321 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_216 = 12'h701 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_220 = 12'h741 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_224 = 12'h340 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_228 = 12'h341 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_232 = 12'h342 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_236 = 12'h343 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_240 = 12'h344 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_244 = 12'h780 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_248 = 12'h781 == csr_addr; // @[Lookup.scala 9:38]
  wire  _T_252 = 12'h300 == csr_addr; // @[Lookup.scala 9:38]
  wire [31:0] _T_253 = _T_252 ? mstatus : 32'h0; // @[Lookup.scala 11:37]
  wire [31:0] _T_254 = _T_248 ? mfromhost : _T_253; // @[Lookup.scala 11:37]
  wire [31:0] _T_255 = _T_244 ? mtohost : _T_254; // @[Lookup.scala 11:37]
  wire [31:0] _T_256 = _T_240 ? mip : _T_255; // @[Lookup.scala 11:37]
  wire [31:0] _T_257 = _T_236 ? mbadaddr : _T_256; // @[Lookup.scala 11:37]
  wire [31:0] _T_258 = _T_232 ? mcause : _T_257; // @[Lookup.scala 11:37]
  wire [31:0] _T_259 = _T_228 ? mepc : _T_258; // @[Lookup.scala 11:37]
  wire [31:0] _T_260 = _T_224 ? mscratch : _T_259; // @[Lookup.scala 11:37]
  wire [31:0] _T_261 = _T_220 ? timeh : _T_260; // @[Lookup.scala 11:37]
  wire [31:0] _T_262 = _T_216 ? time_ : _T_261; // @[Lookup.scala 11:37]
  wire [31:0] _T_263 = _T_212 ? mtimecmp : _T_262; // @[Lookup.scala 11:37]
  wire [31:0] _T_264 = _T_208 ? mie : _T_263; // @[Lookup.scala 11:37]
  wire [31:0] _T_265 = _T_204 ? 32'h0 : _T_264; // @[Lookup.scala 11:37]
  wire [31:0] _T_266 = _T_200 ? 32'h100 : _T_265; // @[Lookup.scala 11:37]
  wire [31:0] _T_267 = _T_196 ? 32'h0 : _T_266; // @[Lookup.scala 11:37]
  wire [31:0] _T_268 = _T_192 ? 32'h0 : _T_267; // @[Lookup.scala 11:37]
  wire [31:0] _T_269 = _T_188 ? 32'h100100 : _T_268; // @[Lookup.scala 11:37]
  wire [31:0] _T_270 = _T_184 ? instreth : _T_269; // @[Lookup.scala 11:37]
  wire [31:0] _T_271 = _T_180 ? timeh : _T_270; // @[Lookup.scala 11:37]
  wire [31:0] _T_272 = _T_176 ? cycleh : _T_271; // @[Lookup.scala 11:37]
  wire [31:0] _T_273 = _T_172 ? instret : _T_272; // @[Lookup.scala 11:37]
  wire [31:0] _T_274 = _T_168 ? time_ : _T_273; // @[Lookup.scala 11:37]
  wire [31:0] _T_275 = _T_164 ? cycle : _T_274; // @[Lookup.scala 11:37]
  wire [31:0] _T_276 = _T_160 ? instreth : _T_275; // @[Lookup.scala 11:37]
  wire [31:0] _T_277 = _T_156 ? timeh : _T_276; // @[Lookup.scala 11:37]
  wire [31:0] _T_278 = _T_152 ? cycleh : _T_277; // @[Lookup.scala 11:37]
  wire [31:0] _T_279 = _T_148 ? instret : _T_278; // @[Lookup.scala 11:37]
  wire [31:0] _T_280 = _T_144 ? time_ : _T_279; // @[Lookup.scala 11:37]
  wire  privValid = csr_addr[9:8] <= PRV; // @[CSR.scala 204:34]
  wire  privInst = io_cmd == 3'h4; // @[CSR.scala 205:26]
  wire  _T_286 = privInst & ~csr_addr[0]; // @[CSR.scala 206:28]
  wire  _T_289 = ~csr_addr[8]; // @[CSR.scala 206:47]
  wire  isEcall = privInst & ~csr_addr[0] & ~csr_addr[8]; // @[CSR.scala 206:44]
  wire  isEbreak = privInst & csr_addr[0] & _T_289; // @[CSR.scala 207:44]
  wire  isEret = _T_286 & csr_addr[8]; // @[CSR.scala 208:44]
  wire  csrValid = _T_140 | _T_144 | _T_148 | _T_152 | _T_156 | _T_160 | _T_164 | _T_168 | _T_172 | _T_176 | _T_180 |
    _T_184 | _T_188 | _T_192 | _T_196 | _T_200 | _T_204 | _T_208 | _T_212 | _T_216 | _T_220 | _T_224 | _T_228 | _T_232
     | _T_236 | _T_240 | _T_244 | _T_248 | _T_252; // @[CSR.scala 209:61]
  wire [1:0] _T_444 = ~csr_addr[11:10]; // @[CSR.scala 210:36]
  wire  csrRO = _T_444 == 2'h0 | csr_addr == 12'h301 | csr_addr == 12'h302; // @[CSR.scala 210:67]
  wire  wen = io_cmd == 3'h1 | io_cmd[1] & rs1_addr != 5'h0; // @[CSR.scala 211:36]
  wire [31:0] _T_456 = io_out | io_in; // @[CSR.scala 214:22]
  wire [31:0] _T_457 = ~io_in; // @[CSR.scala 215:24]
  wire [31:0] _T_458 = io_out & _T_457; // @[CSR.scala 215:22]
  wire [31:0] _T_460 = 3'h3 == io_cmd ? _T_458 : 32'h0; // @[Mux.scala 46:16]
  wire [31:0] _T_462 = 3'h2 == io_cmd ? _T_456 : _T_460; // @[Mux.scala 46:16]
  wire [31:0] wdata = 3'h1 == io_cmd ? io_in : _T_462; // @[Mux.scala 46:16]
  wire  iaddrInvalid = io_pc_check & io_addr[1]; // @[CSR.scala 217:34]
  wire  _T_521 = io_addr[1:0] != 2'h0; // @[CSR.scala 219:36]
  wire  _T_527 = 3'h2 == io_ld_type ? io_addr[0] : 3'h4 == io_ld_type & io_addr[0]; // @[Mux.scala 46:16]
  wire  laddrInvalid = 3'h1 == io_ld_type ? _T_521 : _T_527; // @[Mux.scala 46:16]
  wire  saddrInvalid = 2'h1 == io_st_type ? _T_521 : 2'h2 == io_st_type & io_addr[0]; // @[Mux.scala 46:16]
  wire  _T_546 = ~privValid; // @[CSR.scala 223:48]
  wire  _T_548 = io_cmd[1:0] != 2'h0 & (~csrValid | ~privValid); // @[CSR.scala 223:31]
  wire  _T_549 = io_illegal | iaddrInvalid | laddrInvalid | saddrInvalid | _T_548; // @[CSR.scala 222:73]
  wire  _T_554 = privInst & _T_546; // @[CSR.scala 224:24]
  wire  _T_555 = _T_549 | wen & csrRO | _T_554; // @[CSR.scala 223:76]
  wire [7:0] _T_558 = {PRV, 6'h0}; // @[CSR.scala 225:27]
  wire [31:0] _GEN_82 = {{24'd0}, _T_558}; // @[CSR.scala 225:20]
  wire [31:0] _T_563 = time_ + 32'h1; // @[CSR.scala 229:16]
  wire [31:0] _T_564 = ~time_; // @[CSR.scala 230:13]
  wire [31:0] _T_569 = timeh + 32'h1; // @[CSR.scala 230:36]
  wire [31:0] _GEN_1 = _T_564 == 32'h0 ? _T_569 : timeh; // @[CSR.scala 230:19 CSR.scala 230:27 Reg.scala 26:44]
  wire [31:0] _T_572 = cycle + 32'h1; // @[CSR.scala 231:18]
  wire [31:0] _T_573 = ~cycle; // @[CSR.scala 232:14]
  wire [31:0] _T_578 = cycleh + 32'h1; // @[CSR.scala 232:39]
  wire [31:0] _GEN_2 = _T_573 == 32'h0 ? _T_578 : cycleh; // @[CSR.scala 232:20 CSR.scala 232:29 Reg.scala 26:44]
  wire  _T_582 = ~io_expt; // @[CSR.scala 233:52]
  wire  _T_587 = ~io_stall; // @[CSR.scala 233:88]
  wire  isInstRet = io_inst != 32'h13 & (~io_expt | isEcall | isEbreak) & ~io_stall; // @[CSR.scala 233:85]
  wire [31:0] _T_590 = instret + 32'h1; // @[CSR.scala 234:40]
  wire [31:0] _GEN_3 = isInstRet ? _T_590 : instret; // @[CSR.scala 234:19 CSR.scala 234:29 Reg.scala 26:44]
  wire [31:0] _T_591 = ~instret; // @[CSR.scala 235:29]
  wire [31:0] _T_597 = instreth + 32'h1; // @[CSR.scala 235:58]
  wire [31:0] _GEN_4 = isInstRet & _T_591 == 32'h0 ? _T_597 : instreth; // @[CSR.scala 235:35 CSR.scala 235:46 Reg.scala 26:44]
  wire [31:0] _T_601 = {io_pc[31:2], 2'h0}; // @[CSR.scala 239:28]
  wire [3:0] _GEN_83 = {{2'd0}, PRV}; // @[CSR.scala 243:47]
  wire [3:0] _T_609 = 4'h8 + _GEN_83; // @[CSR.scala 243:47]
  wire [1:0] _T_610 = isEbreak ? 2'h3 : 2'h2; // @[CSR.scala 244:20]
  wire [3:0] _T_611 = isEcall ? _T_609 : {{2'd0}, _T_610}; // @[CSR.scala 243:20]
  wire [3:0] _T_612 = saddrInvalid ? 4'h6 : _T_611; // @[CSR.scala 242:20]
  wire [3:0] _T_613 = laddrInvalid ? 4'h4 : _T_612; // @[CSR.scala 241:20]
  wire [3:0] _T_614 = iaddrInvalid ? 4'h0 : _T_613; // @[CSR.scala 240:20]
  wire [31:0] _GEN_5 = iaddrInvalid | laddrInvalid | saddrInvalid ? io_addr : mbadaddr; // @[CSR.scala 249:58 CSR.scala 249:69 CSR.scala 161:21]
  wire [31:0] _GEN_6 = io_expt ? _T_601 : mepc; // @[CSR.scala 238:19 CSR.scala 239:14 CSR.scala 159:17]
  wire [31:0] _GEN_7 = io_expt ? {{28'd0}, _T_614} : mcause; // @[CSR.scala 238:19 CSR.scala 240:14 CSR.scala 160:19]
  wire [1:0] _GEN_8 = io_expt ? 2'h3 : PRV; // @[CSR.scala 238:19 CSR.scala 245:12 Reg.scala 26:44]
  wire  _GEN_9 = io_expt ? 1'h0 : IE; // @[CSR.scala 238:19 CSR.scala 246:12 Reg.scala 26:44]
  wire [1:0] _GEN_10 = io_expt ? PRV : PRV1; // @[CSR.scala 238:19 CSR.scala 247:12 Reg.scala 26:44]
  wire  _GEN_11 = io_expt ? IE : IE1; // @[CSR.scala 238:19 CSR.scala 248:12 Reg.scala 26:44]
  wire [31:0] _GEN_12 = io_expt ? _GEN_5 : mbadaddr; // @[CSR.scala 238:19 CSR.scala 161:21]
  wire [1:0] _GEN_13 = _T_582 & isEret ? PRV1 : _GEN_8; // @[CSR.scala 250:24 CSR.scala 251:12]
  wire  _GEN_14 = _T_582 & isEret ? IE1 : _GEN_9; // @[CSR.scala 250:24 CSR.scala 252:12]
  wire [1:0] _GEN_15 = _T_582 & isEret ? 2'h0 : _GEN_10; // @[CSR.scala 250:24 CSR.scala 253:12]
  wire  _GEN_16 = _T_582 & isEret | _GEN_11; // @[CSR.scala 250:24 CSR.scala 254:12]
  wire  _T_626 = _T_582 & ~isEret; // @[CSR.scala 250:24]
  wire  _T_635 = ~(csr_addr == 12'h300); // @[CSR.scala 256:38]
  wire  _T_644 = _T_635 & ~(csr_addr == 12'h344); // @[CSR.scala 262:39]
  wire  _T_656 = _T_644 & ~(csr_addr == 12'h304); // @[CSR.scala 266:39]
  wire [31:0] _GEN_25 = _T_656 & csr_addr == 12'h701 ? wdata : _T_563; // @[CSR.scala 270:41 CSR.scala 270:48 CSR.scala 229:8]
  wire  _T_669 = _T_656 & ~(csr_addr == 12'h701); // @[CSR.scala 270:41]
  wire [31:0] _GEN_26 = _T_669 & csr_addr == 12'h741 ? wdata : _GEN_1; // @[CSR.scala 271:42 CSR.scala 271:50]
  wire  _T_685 = _T_669 & ~(csr_addr == 12'h741); // @[CSR.scala 271:42]
  wire  _T_704 = _T_685 & ~(csr_addr == 12'h321); // @[CSR.scala 272:44]
  wire  _T_726 = _T_704 & ~(csr_addr == 12'h340); // @[CSR.scala 273:44]
  wire [31:0] _T_729 = {{2'd0}, wdata[31:2]}; // @[CSR.scala 274:56]
  wire [33:0] _GEN_85 = {_T_729, 2'h0}; // @[CSR.scala 274:63]
  wire [34:0] _T_731 = {{1'd0}, _GEN_85}; // @[CSR.scala 274:63]
  wire [34:0] _GEN_29 = _T_726 & csr_addr == 12'h341 ? _T_731 : {{3'd0}, _GEN_6}; // @[CSR.scala 274:40 CSR.scala 274:47]
  wire  _T_755 = _T_726 & ~(csr_addr == 12'h341); // @[CSR.scala 274:40]
  wire [31:0] _T_758 = wdata & 32'h8000000f; // @[CSR.scala 275:60]
  wire  _T_785 = _T_755 & ~(csr_addr == 12'h342); // @[CSR.scala 275:42]
  wire  _T_816 = _T_785 & ~(csr_addr == 12'h343); // @[CSR.scala 276:44]
  wire  _T_850 = _T_816 & ~(csr_addr == 12'h780); // @[CSR.scala 277:43]
  wire  _T_887 = _T_850 & ~(csr_addr == 12'h781); // @[CSR.scala 278:45]
  wire  _T_927 = _T_887 & ~(csr_addr == 12'h900); // @[CSR.scala 279:42]
  wire  _T_970 = _T_927 & ~(csr_addr == 12'h901); // @[CSR.scala 280:41]
  wire  _T_1016 = _T_970 & ~(csr_addr == 12'h902); // @[CSR.scala 281:44]
  wire  _T_1065 = _T_1016 & ~(csr_addr == 12'h980); // @[CSR.scala 282:43]
  wire  _T_1117 = _T_1065 & ~(csr_addr == 12'h981); // @[CSR.scala 283:42]
  wire [34:0] _GEN_52 = _T_626 & wen ? _GEN_29 : {{3'd0}, _GEN_6}; // @[CSR.scala 255:21]
  wire [34:0] _GEN_61 = _T_587 ? _GEN_52 : {{3'd0}, mepc}; // @[CSR.scala 237:19 CSR.scala 159:17]
  assign io_out = _T_140 ? cycle : _T_280; // @[Lookup.scala 11:37]
  assign io_expt = _T_555 | isEcall | isEbreak; // @[CSR.scala 224:50]
  assign io_evec = 32'h100 + _GEN_82; // @[CSR.scala 225:20]
  assign io_epc = mepc; // @[CSR.scala 226:11]
  assign io_host_tohost = mtohost; // @[CSR.scala 165:18]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 26:44]
      time_ <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_927 & csr_addr == 12'h901) begin // @[CSR.scala 280:41]
          time_ <= wdata; // @[CSR.scala 280:48]
        end else begin
          time_ <= _GEN_25;
        end
      end else begin
        time_ <= _T_563; // @[CSR.scala 229:8]
      end
    end else begin
      time_ <= _T_563; // @[CSR.scala 229:8]
    end
    if (reset) begin // @[Reg.scala 26:44]
      timeh <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_1065 & csr_addr == 12'h981) begin // @[CSR.scala 283:42]
          timeh <= wdata; // @[CSR.scala 283:50]
        end else begin
          timeh <= _GEN_26;
        end
      end else begin
        timeh <= _GEN_1;
      end
    end else begin
      timeh <= _GEN_1;
    end
    if (reset) begin // @[Reg.scala 26:44]
      cycle <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_887 & csr_addr == 12'h900) begin // @[CSR.scala 279:42]
          cycle <= wdata; // @[CSR.scala 279:50]
        end else begin
          cycle <= _T_572; // @[CSR.scala 231:9]
        end
      end else begin
        cycle <= _T_572; // @[CSR.scala 231:9]
      end
    end else begin
      cycle <= _T_572; // @[CSR.scala 231:9]
    end
    if (reset) begin // @[Reg.scala 26:44]
      cycleh <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_1016 & csr_addr == 12'h980) begin // @[CSR.scala 282:43]
          cycleh <= wdata; // @[CSR.scala 282:52]
        end else begin
          cycleh <= _GEN_2;
        end
      end else begin
        cycleh <= _GEN_2;
      end
    end else begin
      cycleh <= _GEN_2;
    end
    if (reset) begin // @[Reg.scala 26:44]
      instret <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_970 & csr_addr == 12'h902) begin // @[CSR.scala 281:44]
          instret <= wdata; // @[CSR.scala 281:54]
        end else begin
          instret <= _GEN_3;
        end
      end else begin
        instret <= _GEN_3;
      end
    end else begin
      instret <= _GEN_3;
    end
    if (reset) begin // @[Reg.scala 26:44]
      instreth <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_1117 & csr_addr == 12'h982) begin // @[CSR.scala 284:45]
          instreth <= wdata; // @[CSR.scala 284:56]
        end else begin
          instreth <= _GEN_4;
        end
      end else begin
        instreth <= _GEN_4;
      end
    end else begin
      instreth <= _GEN_4;
    end
    if (reset) begin // @[Reg.scala 26:44]
      PRV <= 2'h3; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (csr_addr == 12'h300) begin // @[CSR.scala 256:38]
          PRV <= wdata[2:1]; // @[CSR.scala 259:14]
        end else begin
          PRV <= _GEN_13;
        end
      end else begin
        PRV <= _GEN_13;
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      PRV1 <= 2'h3; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (csr_addr == 12'h300) begin // @[CSR.scala 256:38]
          PRV1 <= wdata[5:4]; // @[CSR.scala 257:14]
        end else begin
          PRV1 <= _GEN_15;
        end
      end else begin
        PRV1 <= _GEN_15;
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      IE <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (csr_addr == 12'h300) begin // @[CSR.scala 256:38]
          IE <= wdata[0]; // @[CSR.scala 260:14]
        end else begin
          IE <= _GEN_14;
        end
      end else begin
        IE <= _GEN_14;
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      IE1 <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (csr_addr == 12'h300) begin // @[CSR.scala 256:38]
          IE1 <= wdata[3]; // @[CSR.scala 258:14]
        end else begin
          IE1 <= _GEN_16;
        end
      end else begin
        IE1 <= _GEN_16;
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      MTIP <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_635 & csr_addr == 12'h344) begin // @[CSR.scala 262:39]
          MTIP <= wdata[7]; // @[CSR.scala 263:14]
        end
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      MTIE <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_644 & csr_addr == 12'h304) begin // @[CSR.scala 266:39]
          MTIE <= wdata[7]; // @[CSR.scala 267:14]
        end
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      MSIP <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_635 & csr_addr == 12'h344) begin // @[CSR.scala 262:39]
          MSIP <= wdata[3]; // @[CSR.scala 264:14]
        end
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      MSIE <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_644 & csr_addr == 12'h304) begin // @[CSR.scala 266:39]
          MSIE <= wdata[3]; // @[CSR.scala 268:14]
        end
      end
    end
    if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_685 & csr_addr == 12'h321) begin // @[CSR.scala 272:44]
          if (3'h1 == io_cmd) begin // @[Mux.scala 46:16]
            mtimecmp <= io_in;
          end else begin
            mtimecmp <= _T_462;
          end
        end
      end
    end
    if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_704 & csr_addr == 12'h340) begin // @[CSR.scala 273:44]
          if (3'h1 == io_cmd) begin // @[Mux.scala 46:16]
            mscratch <= io_in;
          end else begin
            mscratch <= _T_462;
          end
        end
      end
    end
    mepc <= _GEN_61[31:0];
    if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_755 & csr_addr == 12'h342) begin // @[CSR.scala 275:42]
          mcause <= _T_758; // @[CSR.scala 275:51]
        end else begin
          mcause <= _GEN_7;
        end
      end else begin
        mcause <= _GEN_7;
      end
    end
    if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_785 & csr_addr == 12'h343) begin // @[CSR.scala 276:44]
          if (3'h1 == io_cmd) begin // @[Mux.scala 46:16]
            mbadaddr <= io_in;
          end else begin
            mbadaddr <= _T_462;
          end
        end else begin
          mbadaddr <= _GEN_12;
        end
      end else begin
        mbadaddr <= _GEN_12;
      end
    end
    if (reset) begin // @[Reg.scala 26:44]
      mtohost <= 32'h0; // @[Reg.scala 26:44]
    end else if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_816 & csr_addr == 12'h780) begin // @[CSR.scala 277:43]
          mtohost <= wdata; // @[CSR.scala 277:53]
        end
      end
    end
    if (_T_587) begin // @[CSR.scala 237:19]
      if (_T_626 & wen) begin // @[CSR.scala 255:21]
        if (_T_850 & csr_addr == 12'h781) begin // @[CSR.scala 278:45]
          if (3'h1 == io_cmd) begin // @[Mux.scala 46:16]
            mfromhost <= io_in;
          end else begin
            mfromhost <= _T_462;
          end
        end
      end
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
  _RAND_0 = {1{`RANDOM}};
  time_ = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  timeh = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cycle = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cycleh = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  instret = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  instreth = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  PRV = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  PRV1 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  IE = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  IE1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  MTIP = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  MTIE = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  MSIP = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  MSIE = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  mtimecmp = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mscratch = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mepc = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mcause = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mbadaddr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mtohost = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mfromhost = _RAND_20[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RegFile(
  input         clock,
  input  [4:0]  io_raddr1,
  input  [4:0]  io_raddr2,
  output [31:0] io_rdata1,
  output [31:0] io_rdata2,
  input         io_wen,
  input  [4:0]  io_waddr,
  input  [31:0] io_wdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] regs [0:31]; // @[RegFile.scala 20:17]
  wire  regs__T_20_en; // @[RegFile.scala 20:17]
  wire [4:0] regs__T_20_addr; // @[RegFile.scala 20:17]
  wire [31:0] regs__T_20_data; // @[RegFile.scala 20:17]
  wire  regs__T_25_en; // @[RegFile.scala 20:17]
  wire [4:0] regs__T_25_addr; // @[RegFile.scala 20:17]
  wire [31:0] regs__T_25_data; // @[RegFile.scala 20:17]
  wire [31:0] regs__T_31_data; // @[RegFile.scala 20:17]
  wire [4:0] regs__T_31_addr; // @[RegFile.scala 20:17]
  wire  regs__T_31_mask; // @[RegFile.scala 20:17]
  wire  regs__T_31_en; // @[RegFile.scala 20:17]
  wire  _T_29 = io_waddr != 5'h0; // @[RegFile.scala 23:26]
  assign regs__T_20_en = 1'h1;
  assign regs__T_20_addr = io_raddr1;
  assign regs__T_20_data = regs[regs__T_20_addr]; // @[RegFile.scala 20:17]
  assign regs__T_25_en = 1'h1;
  assign regs__T_25_addr = io_raddr2;
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[RegFile.scala 20:17]
  assign regs__T_31_data = io_wdata;
  assign regs__T_31_addr = io_waddr;
  assign regs__T_31_mask = 1'h1;
  assign regs__T_31_en = io_wen & _T_29;
  assign io_rdata1 = io_raddr1 != 5'h0 ? regs__T_20_data : 32'h0; // @[RegFile.scala 21:19]
  assign io_rdata2 = io_raddr2 != 5'h0 ? regs__T_25_data : 32'h0; // @[RegFile.scala 22:19]
  always @(posedge clock) begin
    if (regs__T_31_en & regs__T_31_mask) begin
      regs[regs__T_31_addr] <= regs__T_31_data; // @[RegFile.scala 20:17]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALUArea(
  input  [31:0] io_A,
  input  [31:0] io_B,
  input  [3:0]  io_alu_op,
  output [31:0] io_out,
  output [31:0] io_sum
);
  wire [31:0] _T_15 = 32'h0 - io_B; // @[ALU.scala 59:38]
  wire [31:0] _T_16 = io_alu_op[0] ? _T_15 : io_B; // @[ALU.scala 59:23]
  wire [31:0] sum = io_A + _T_16; // @[ALU.scala 59:18]
  wire  _T_25 = io_alu_op[1] ? io_B[31] : io_A[31]; // @[ALU.scala 61:16]
  wire  cmp = io_A[31] == io_B[31] ? sum[31] : _T_25; // @[ALU.scala 60:16]
  wire [4:0] shamt = io_B[4:0]; // @[ALU.scala 62:20]
  wire [31:0] _T_32 = {{16'd0}, io_A[31:16]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_34 = {io_A[15:0], 16'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_36 = _T_34 & 32'hffff0000; // @[Bitwise.scala 102:75]
  wire [31:0] _T_37 = _T_32 | _T_36; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_0 = {{8'd0}, _T_37[31:8]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_42 = _GEN_0 & 32'hff00ff; // @[Bitwise.scala 102:31]
  wire [31:0] _T_44 = {_T_37[23:0], 8'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_46 = _T_44 & 32'hff00ff00; // @[Bitwise.scala 102:75]
  wire [31:0] _T_47 = _T_42 | _T_46; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_1 = {{4'd0}, _T_47[31:4]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_52 = _GEN_1 & 32'hf0f0f0f; // @[Bitwise.scala 102:31]
  wire [31:0] _T_54 = {_T_47[27:0], 4'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_56 = _T_54 & 32'hf0f0f0f0; // @[Bitwise.scala 102:75]
  wire [31:0] _T_57 = _T_52 | _T_56; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_2 = {{2'd0}, _T_57[31:2]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_62 = _GEN_2 & 32'h33333333; // @[Bitwise.scala 102:31]
  wire [31:0] _T_64 = {_T_57[29:0], 2'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_66 = _T_64 & 32'hcccccccc; // @[Bitwise.scala 102:75]
  wire [31:0] _T_67 = _T_62 | _T_66; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_3 = {{1'd0}, _T_67[31:1]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_72 = _GEN_3 & 32'h55555555; // @[Bitwise.scala 102:31]
  wire [31:0] _T_74 = {_T_67[30:0], 1'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_76 = _T_74 & 32'haaaaaaaa; // @[Bitwise.scala 102:75]
  wire [31:0] _T_77 = _T_72 | _T_76; // @[Bitwise.scala 102:39]
  wire [31:0] shin = io_alu_op[3] ? io_A : _T_77; // @[ALU.scala 63:19]
  wire  _T_80 = io_alu_op[0] & shin[31]; // @[ALU.scala 64:34]
  wire [32:0] _T_82 = {_T_80,shin}; // @[ALU.scala 64:57]
  wire [32:0] _T_83 = $signed(_T_82) >>> shamt; // @[ALU.scala 64:64]
  wire [31:0] shiftr = _T_83[31:0]; // @[ALU.scala 64:73]
  wire [31:0] _T_89 = {{16'd0}, shiftr[31:16]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_91 = {shiftr[15:0], 16'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_93 = _T_91 & 32'hffff0000; // @[Bitwise.scala 102:75]
  wire [31:0] _T_94 = _T_89 | _T_93; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_4 = {{8'd0}, _T_94[31:8]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_99 = _GEN_4 & 32'hff00ff; // @[Bitwise.scala 102:31]
  wire [31:0] _T_101 = {_T_94[23:0], 8'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_103 = _T_101 & 32'hff00ff00; // @[Bitwise.scala 102:75]
  wire [31:0] _T_104 = _T_99 | _T_103; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_5 = {{4'd0}, _T_104[31:4]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_109 = _GEN_5 & 32'hf0f0f0f; // @[Bitwise.scala 102:31]
  wire [31:0] _T_111 = {_T_104[27:0], 4'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_113 = _T_111 & 32'hf0f0f0f0; // @[Bitwise.scala 102:75]
  wire [31:0] _T_114 = _T_109 | _T_113; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_6 = {{2'd0}, _T_114[31:2]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_119 = _GEN_6 & 32'h33333333; // @[Bitwise.scala 102:31]
  wire [31:0] _T_121 = {_T_114[29:0], 2'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_123 = _T_121 & 32'hcccccccc; // @[Bitwise.scala 102:75]
  wire [31:0] _T_124 = _T_119 | _T_123; // @[Bitwise.scala 102:39]
  wire [31:0] _GEN_7 = {{1'd0}, _T_124[31:1]}; // @[Bitwise.scala 102:31]
  wire [31:0] _T_129 = _GEN_7 & 32'h55555555; // @[Bitwise.scala 102:31]
  wire [31:0] _T_131 = {_T_124[30:0], 1'h0}; // @[Bitwise.scala 102:65]
  wire [31:0] _T_133 = _T_131 & 32'haaaaaaaa; // @[Bitwise.scala 102:75]
  wire [31:0] shiftl = _T_129 | _T_133; // @[Bitwise.scala 102:39]
  wire [31:0] _T_145 = io_A & io_B; // @[ALU.scala 72:38]
  wire [31:0] _T_147 = io_A | io_B; // @[ALU.scala 73:38]
  wire [31:0] _T_149 = io_A ^ io_B; // @[ALU.scala 74:38]
  wire [31:0] _T_151 = io_alu_op == 4'ha ? io_A : io_B; // @[ALU.scala 75:8]
  wire [31:0] _T_152 = io_alu_op == 4'h4 ? _T_149 : _T_151; // @[ALU.scala 74:8]
  wire [31:0] _T_153 = io_alu_op == 4'h3 ? _T_147 : _T_152; // @[ALU.scala 73:8]
  wire [31:0] _T_154 = io_alu_op == 4'h2 ? _T_145 : _T_153; // @[ALU.scala 72:8]
  wire [31:0] _T_155 = io_alu_op == 4'h6 ? shiftl : _T_154; // @[ALU.scala 71:8]
  wire [31:0] _T_156 = io_alu_op == 4'h9 | io_alu_op == 4'h8 ? shiftr : _T_155; // @[ALU.scala 70:8]
  wire [31:0] _T_158 = io_alu_op == 4'h5 | io_alu_op == 4'h7 ? {{31'd0}, cmp} : _T_156; // @[ALU.scala 69:8]
  assign io_out = io_alu_op == 4'h0 | io_alu_op == 4'h1 ? sum : _T_158; // @[ALU.scala 68:8]
  assign io_sum = io_A + _T_16; // @[ALU.scala 59:18]
endmodule
module ImmGenWire(
  input  [31:0] io_inst,
  input  [2:0]  io_sel,
  output [31:0] io_out
);
  wire [11:0] Iimm = io_inst[31:20]; // @[ImmGen.scala 21:30]
  wire [11:0] Simm = {io_inst[31:25],io_inst[11:7]}; // @[ImmGen.scala 22:50]
  wire [12:0] Bimm = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[ImmGen.scala 23:86]
  wire [31:0] Uimm = {io_inst[31:12],12'h0}; // @[ImmGen.scala 24:46]
  wire [20:0] Jimm = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:25],io_inst[24:21],1'h0}; // @[ImmGen.scala 25:105]
  wire [5:0] Zimm = {1'b0,$signed(io_inst[19:15])}; // @[ImmGen.scala 26:30]
  wire [11:0] _T_38 = $signed(Iimm) & -12'sh2; // @[ImmGen.scala 28:36]
  wire [11:0] _T_40 = 3'h6 == io_sel ? $signed({{6{Zimm[5]}},Zimm}) : $signed(_T_38); // @[Mux.scala 46:16]
  wire [20:0] _T_42 = 3'h4 == io_sel ? $signed(Jimm) : $signed({{9{_T_40[11]}},_T_40}); // @[Mux.scala 46:16]
  wire [31:0] _T_44 = 3'h3 == io_sel ? $signed(Uimm) : $signed({{11{_T_42[20]}},_T_42}); // @[Mux.scala 46:16]
  wire [31:0] _T_46 = 3'h5 == io_sel ? $signed({{19{Bimm[12]}},Bimm}) : $signed(_T_44); // @[Mux.scala 46:16]
  wire [31:0] _T_48 = 3'h2 == io_sel ? $signed({{20{Simm[11]}},Simm}) : $signed(_T_46); // @[Mux.scala 46:16]
  assign io_out = 3'h1 == io_sel ? $signed({{20{Iimm[11]}},Iimm}) : $signed(_T_48); // @[ImmGen.scala 29:100]
endmodule
module BrCondArea(
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [2:0]  io_br_type,
  output        io_taken
);
  wire [31:0] diff = io_rs1 - io_rs2; // @[BrCond.scala 37:21]
  wire  neq = diff != 32'h0; // @[BrCond.scala 38:19]
  wire  eq = ~neq; // @[BrCond.scala 39:14]
  wire  isSameSign = io_rs1[31] == io_rs2[31]; // @[BrCond.scala 40:35]
  wire  lt = isSameSign ? diff[31] : io_rs1[31]; // @[BrCond.scala 41:17]
  wire  ltu = isSameSign ? diff[31] : io_rs2[31]; // @[BrCond.scala 42:17]
  wire  ge = ~lt; // @[BrCond.scala 43:14]
  wire  geu = ~ltu; // @[BrCond.scala 44:14]
  wire  _T_24 = io_br_type == 3'h6 & neq; // @[BrCond.scala 47:29]
  wire  _T_25 = io_br_type == 3'h3 & eq | _T_24; // @[BrCond.scala 46:36]
  wire  _T_27 = io_br_type == 3'h2 & lt; // @[BrCond.scala 48:29]
  wire  _T_28 = _T_25 | _T_27; // @[BrCond.scala 47:37]
  wire  _T_30 = io_br_type == 3'h5 & ge; // @[BrCond.scala 49:29]
  wire  _T_31 = _T_28 | _T_30; // @[BrCond.scala 48:36]
  wire  _T_33 = io_br_type == 3'h1 & ltu; // @[BrCond.scala 50:30]
  wire  _T_34 = _T_31 | _T_33; // @[BrCond.scala 49:36]
  wire  _T_36 = io_br_type == 3'h4 & geu; // @[BrCond.scala 51:30]
  assign io_taken = _T_34 | _T_36; // @[BrCond.scala 50:38]
endmodule
module Datapath(
  input         clock,
  input         reset,
  output [31:0] io_host_tohost,
  output [31:0] io_icache_req_bits_addr,
  input         io_icache_resp_valid,
  input  [31:0] io_icache_resp_bits_data,
  output        io_dcache_req_valid,
  output [31:0] io_dcache_req_bits_addr,
  output [31:0] io_dcache_req_bits_data,
  output [3:0]  io_dcache_req_bits_mask,
  input         io_dcache_resp_valid,
  input  [31:0] io_dcache_resp_bits_data,
  output [31:0] io_ctrl_inst,
  input  [1:0]  io_ctrl_pc_sel,
  input         io_ctrl_inst_kill,
  input         io_ctrl_A_sel,
  input         io_ctrl_B_sel,
  input  [2:0]  io_ctrl_imm_sel,
  input  [3:0]  io_ctrl_alu_op,
  input  [2:0]  io_ctrl_br_type,
  input  [1:0]  io_ctrl_st_type,
  input  [2:0]  io_ctrl_ld_type,
  input  [1:0]  io_ctrl_wb_sel,
  input         io_ctrl_wb_en,
  input  [2:0]  io_ctrl_csr_cmd,
  input         io_ctrl_illegal
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  wire  csr_clock; // @[Datapath.scala 23:23]
  wire  csr_reset; // @[Datapath.scala 23:23]
  wire  csr_io_stall; // @[Datapath.scala 23:23]
  wire [2:0] csr_io_cmd; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_in; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_out; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_pc; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_addr; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_inst; // @[Datapath.scala 23:23]
  wire  csr_io_illegal; // @[Datapath.scala 23:23]
  wire [1:0] csr_io_st_type; // @[Datapath.scala 23:23]
  wire [2:0] csr_io_ld_type; // @[Datapath.scala 23:23]
  wire  csr_io_pc_check; // @[Datapath.scala 23:23]
  wire  csr_io_expt; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_evec; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_epc; // @[Datapath.scala 23:23]
  wire [31:0] csr_io_host_tohost; // @[Datapath.scala 23:23]
  wire  regFile_clock; // @[Datapath.scala 24:23]
  wire [4:0] regFile_io_raddr1; // @[Datapath.scala 24:23]
  wire [4:0] regFile_io_raddr2; // @[Datapath.scala 24:23]
  wire [31:0] regFile_io_rdata1; // @[Datapath.scala 24:23]
  wire [31:0] regFile_io_rdata2; // @[Datapath.scala 24:23]
  wire  regFile_io_wen; // @[Datapath.scala 24:23]
  wire [4:0] regFile_io_waddr; // @[Datapath.scala 24:23]
  wire [31:0] regFile_io_wdata; // @[Datapath.scala 24:23]
  wire [31:0] alu_io_A; // @[Config.scala 13:50]
  wire [31:0] alu_io_B; // @[Config.scala 13:50]
  wire [3:0] alu_io_alu_op; // @[Config.scala 13:50]
  wire [31:0] alu_io_out; // @[Config.scala 13:50]
  wire [31:0] alu_io_sum; // @[Config.scala 13:50]
  wire [31:0] immGen_io_inst; // @[Config.scala 14:50]
  wire [2:0] immGen_io_sel; // @[Config.scala 14:50]
  wire [31:0] immGen_io_out; // @[Config.scala 14:50]
  wire [31:0] brCond_io_rs1; // @[Config.scala 15:50]
  wire [31:0] brCond_io_rs2; // @[Config.scala 15:50]
  wire [2:0] brCond_io_br_type; // @[Config.scala 15:50]
  wire  brCond_io_taken; // @[Config.scala 15:50]
  reg [31:0] fe_inst; // @[Reg.scala 26:44]
  reg [32:0] fe_pc; // @[Datapath.scala 33:20]
  reg [31:0] ew_inst; // @[Reg.scala 26:44]
  reg [32:0] ew_pc; // @[Datapath.scala 37:20]
  reg [31:0] ew_alu; // @[Datapath.scala 38:20]
  reg [31:0] csr_in; // @[Datapath.scala 39:20]
  reg [1:0] st_type; // @[Datapath.scala 42:21]
  reg [2:0] ld_type; // @[Datapath.scala 43:21]
  reg [1:0] wb_sel; // @[Datapath.scala 44:21]
  reg  wb_en; // @[Datapath.scala 45:21]
  reg [2:0] csr_cmd; // @[Datapath.scala 46:21]
  reg  illegal; // @[Datapath.scala 47:21]
  reg  pc_check; // @[Datapath.scala 48:21]
  reg  started; // @[Reg.scala 14:44]
  wire  stall = ~io_icache_resp_valid | ~io_dcache_resp_valid; // @[Datapath.scala 52:37]
  wire [31:0] _T_246 = 32'h200 - 32'h4; // @[Datapath.scala 53:47]
  reg [32:0] pc; // @[Reg.scala 26:44]
  wire  _T_248 = io_ctrl_pc_sel == 2'h1; // @[Datapath.scala 56:33]
  wire [31:0] _T_251 = {{1'd0}, alu_io_sum[31:1]}; // @[Datapath.scala 56:75]
  wire [32:0] _T_253 = {_T_251, 1'h0}; // @[Datapath.scala 56:82]
  wire [32:0] _T_257 = pc + 33'h4; // @[Datapath.scala 57:50]
  wire [32:0] _T_258 = io_ctrl_pc_sel == 2'h2 ? pc : _T_257; // @[Datapath.scala 57:17]
  wire [32:0] _T_259 = io_ctrl_pc_sel == 2'h1 | brCond_io_taken ? _T_253 : _T_258; // @[Datapath.scala 56:17]
  wire [32:0] _T_260 = io_ctrl_pc_sel == 2'h3 ? {{1'd0}, csr_io_epc} : _T_259; // @[Datapath.scala 55:17]
  wire [32:0] _T_261 = csr_io_expt ? {{1'd0}, csr_io_evec} : _T_260; // @[Datapath.scala 54:32]
  wire [32:0] npc = stall ? pc : _T_261; // @[Datapath.scala 54:17]
  wire  _T_269 = ~stall; // @[Datapath.scala 63:30]
  wire [4:0] rs1_addr = fe_inst[19:15]; // @[Datapath.scala 78:25]
  wire [4:0] rs2_addr = fe_inst[24:20]; // @[Datapath.scala 79:25]
  wire [4:0] wb_rd_addr = ew_inst[11:7]; // @[Datapath.scala 88:27]
  wire  rs1hazard = wb_en & rs1_addr != 5'h0 & rs1_addr == wb_rd_addr; // @[Datapath.scala 89:41]
  wire  rs2hazard = wb_en & rs2_addr != 5'h0 & rs2_addr == wb_rd_addr; // @[Datapath.scala 90:41]
  wire  _T_281 = wb_sel == 2'h0; // @[Datapath.scala 91:24]
  wire [31:0] rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 91:16]
  wire [31:0] rs2 = _T_281 & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 92:16]
  wire [32:0] _T_286 = io_ctrl_A_sel ? {{1'd0}, rs1} : fe_pc; // @[Datapath.scala 95:18]
  wire [31:0] _T_289 = stall ? ew_alu : alu_io_sum; // @[Datapath.scala 105:20]
  wire [31:0] _T_291 = {{2'd0}, _T_289[31:2]}; // @[Datapath.scala 105:48]
  wire [33:0] _GEN_21 = {_T_291, 2'h0}; // @[Datapath.scala 105:55]
  wire [34:0] daddr = {{1'd0}, _GEN_21}; // @[Datapath.scala 105:55]
  wire [4:0] _GEN_22 = {alu_io_sum[1], 4'h0}; // @[Datapath.scala 106:31]
  wire [7:0] _T_295 = {{3'd0}, _GEN_22}; // @[Datapath.scala 106:31]
  wire [3:0] _T_298 = {alu_io_sum[0], 3'h0}; // @[Datapath.scala 106:54]
  wire [7:0] _GEN_23 = {{4'd0}, _T_298}; // @[Datapath.scala 106:38]
  wire [7:0] woffset = _T_295 | _GEN_23; // @[Datapath.scala 106:38]
  wire [286:0] _GEN_24 = {{255'd0}, rs2}; // @[Datapath.scala 109:34]
  wire [286:0] _T_307 = _GEN_24 << woffset; // @[Datapath.scala 109:34]
  wire [1:0] _T_308 = stall ? st_type : io_ctrl_st_type; // @[Datapath.scala 110:43]
  wire [4:0] _T_313 = 5'h3 << alu_io_sum[1:0]; // @[Datapath.scala 113:27]
  wire [3:0] _T_316 = 4'h1 << alu_io_sum[1:0]; // @[Datapath.scala 114:27]
  wire [3:0] _T_318 = 2'h3 == _T_308 ? _T_316 : 4'h0; // @[Mux.scala 46:16]
  wire [4:0] _T_320 = 2'h2 == _T_308 ? _T_313 : {{1'd0}, _T_318}; // @[Mux.scala 46:16]
  wire [4:0] _T_322 = 2'h1 == _T_308 ? 5'hf : _T_320; // @[Mux.scala 46:16]
  wire  _T_336 = ~csr_io_expt; // @[Datapath.scala 124:24]
  wire  _T_339 = ~(reset | _T_269 & csr_io_expt); // @[Datapath.scala 117:40]
  wire [4:0] _GEN_25 = {ew_alu[1], 4'h0}; // @[Datapath.scala 139:27]
  wire [7:0] _T_346 = {{3'd0}, _GEN_25}; // @[Datapath.scala 139:27]
  wire [3:0] _T_349 = {ew_alu[0], 3'h0}; // @[Datapath.scala 139:46]
  wire [7:0] _GEN_26 = {{4'd0}, _T_349}; // @[Datapath.scala 139:34]
  wire [7:0] loffset = _T_346 | _GEN_26; // @[Datapath.scala 139:34]
  wire [31:0] lshift = io_dcache_resp_bits_data >> loffset; // @[Datapath.scala 140:42]
  wire [32:0] _T_350 = {1'b0,$signed(io_dcache_resp_bits_data)}; // @[Datapath.scala 141:61]
  wire [15:0] _T_352 = lshift[15:0]; // @[Datapath.scala 142:29]
  wire [7:0] _T_354 = lshift[7:0]; // @[Datapath.scala 142:60]
  wire [16:0] _T_356 = {1'b0,$signed(lshift[15:0])}; // @[Datapath.scala 143:29]
  wire [8:0] _T_358 = {1'b0,$signed(lshift[7:0])}; // @[Datapath.scala 143:60]
  wire [32:0] _T_360 = 3'h5 == ld_type ? $signed({{24{_T_358[8]}},_T_358}) : $signed(_T_350); // @[Mux.scala 46:16]
  wire [32:0] _T_362 = 3'h4 == ld_type ? $signed({{16{_T_356[16]}},_T_356}) : $signed(_T_360); // @[Mux.scala 46:16]
  wire [32:0] _T_364 = 3'h3 == ld_type ? $signed({{25{_T_354[7]}},_T_354}) : $signed(_T_362); // @[Mux.scala 46:16]
  wire [32:0] load = 3'h2 == ld_type ? $signed({{17{_T_352[15]}},_T_352}) : $signed(_T_364); // @[Mux.scala 46:16]
  wire [32:0] _T_366 = {1'b0,$signed(ew_alu)}; // @[Datapath.scala 159:43]
  wire [32:0] _T_369 = ew_pc + 33'h4; // @[Datapath.scala 161:22]
  wire [33:0] _T_370 = {1'b0,$signed(_T_369)}; // @[Datapath.scala 161:29]
  wire [32:0] _T_371 = {1'b0,$signed(csr_io_out)}; // @[Datapath.scala 162:26]
  wire [32:0] _T_373 = 2'h3 == wb_sel ? $signed(_T_371) : $signed(_T_366); // @[Mux.scala 46:16]
  wire [33:0] _T_375 = 2'h2 == wb_sel ? $signed(_T_370) : $signed({{1{_T_373[32]}},_T_373}); // @[Mux.scala 46:16]
  wire [33:0] regWrite = 2'h1 == wb_sel ? $signed({{1{load[32]}},load}) : $signed(_T_375); // @[Datapath.scala 162:34]
  CSR csr ( // @[Datapath.scala 23:23]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_stall(csr_io_stall),
    .io_cmd(csr_io_cmd),
    .io_in(csr_io_in),
    .io_out(csr_io_out),
    .io_pc(csr_io_pc),
    .io_addr(csr_io_addr),
    .io_inst(csr_io_inst),
    .io_illegal(csr_io_illegal),
    .io_st_type(csr_io_st_type),
    .io_ld_type(csr_io_ld_type),
    .io_pc_check(csr_io_pc_check),
    .io_expt(csr_io_expt),
    .io_evec(csr_io_evec),
    .io_epc(csr_io_epc),
    .io_host_tohost(csr_io_host_tohost)
  );
  RegFile regFile ( // @[Datapath.scala 24:23]
    .clock(regFile_clock),
    .io_raddr1(regFile_io_raddr1),
    .io_raddr2(regFile_io_raddr2),
    .io_rdata1(regFile_io_rdata1),
    .io_rdata2(regFile_io_rdata2),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata)
  );
  ALUArea alu ( // @[Config.scala 13:50]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[Config.scala 14:50]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondArea brCond ( // @[Config.scala 15:50]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  assign io_host_tohost = csr_io_host_tohost; // @[Datapath.scala 156:11]
  assign io_icache_req_bits_addr = npc[31:0]; // @[Datapath.scala 60:27]
  assign io_dcache_req_valid = _T_269 & (io_ctrl_st_type != 2'h0 | io_ctrl_ld_type != 3'h0); // @[Datapath.scala 107:37]
  assign io_dcache_req_bits_addr = daddr[31:0]; // @[Datapath.scala 108:27]
  assign io_dcache_req_bits_data = _T_307[31:0]; // @[Datapath.scala 109:27]
  assign io_dcache_req_bits_mask = _T_322[3:0]; // @[Datapath.scala 110:27]
  assign io_ctrl_inst = fe_inst; // @[Datapath.scala 74:17]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_stall = ~io_icache_resp_valid | ~io_dcache_resp_valid; // @[Datapath.scala 52:37]
  assign csr_io_cmd = csr_cmd; // @[Datapath.scala 148:19]
  assign csr_io_in = csr_in; // @[Datapath.scala 147:19]
  assign csr_io_pc = ew_pc[31:0]; // @[Datapath.scala 150:19]
  assign csr_io_addr = ew_alu; // @[Datapath.scala 151:19]
  assign csr_io_inst = ew_inst; // @[Datapath.scala 149:19]
  assign csr_io_illegal = illegal; // @[Datapath.scala 152:19]
  assign csr_io_st_type = st_type; // @[Datapath.scala 155:19]
  assign csr_io_ld_type = ld_type; // @[Datapath.scala 154:19]
  assign csr_io_pc_check = pc_check; // @[Datapath.scala 153:19]
  assign regFile_clock = clock;
  assign regFile_io_raddr1 = fe_inst[19:15]; // @[Datapath.scala 78:25]
  assign regFile_io_raddr2 = fe_inst[24:20]; // @[Datapath.scala 79:25]
  assign regFile_io_wen = wb_en & _T_269 & _T_336; // @[Datapath.scala 164:39]
  assign regFile_io_waddr = ew_inst[11:7]; // @[Datapath.scala 88:27]
  assign regFile_io_wdata = regWrite[31:0]; // @[Datapath.scala 166:20]
  assign alu_io_A = _T_286[31:0]; // @[Datapath.scala 95:12]
  assign alu_io_B = io_ctrl_B_sel ? rs2 : immGen_io_out; // @[Datapath.scala 96:18]
  assign alu_io_alu_op = io_ctrl_alu_op; // @[Datapath.scala 97:17]
  assign immGen_io_inst = fe_inst; // @[Datapath.scala 84:18]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[Datapath.scala 85:18]
  assign brCond_io_rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 91:16]
  assign brCond_io_rs2 = _T_281 & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 92:16]
  assign brCond_io_br_type = io_ctrl_br_type; // @[Datapath.scala 102:21]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 26:44]
      fe_inst <= 32'h13; // @[Reg.scala 26:44]
    end else if (_T_269) begin // @[Datapath.scala 67:17]
      if (started | io_ctrl_inst_kill | brCond_io_taken | csr_io_expt) begin // @[Datapath.scala 58:17]
        fe_inst <= 32'h13;
      end else begin
        fe_inst <= io_icache_resp_bits_data;
      end
    end
    if (_T_269) begin // @[Datapath.scala 67:17]
      fe_pc <= pc; // @[Datapath.scala 68:13]
    end
    if (reset) begin // @[Reg.scala 26:44]
      ew_inst <= 32'h13; // @[Reg.scala 26:44]
    end else if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      ew_inst <= fe_inst; // @[Datapath.scala 126:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      ew_pc <= fe_pc; // @[Datapath.scala 125:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      ew_alu <= alu_io_out; // @[Datapath.scala 127:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      if (io_ctrl_imm_sel == 3'h6) begin // @[Datapath.scala 128:21]
        csr_in <= immGen_io_out;
      end else if (wb_sel == 2'h0 & rs1hazard) begin // @[Datapath.scala 91:16]
        csr_in <= ew_alu;
      end else begin
        csr_in <= regFile_io_rdata1;
      end
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      st_type <= io_ctrl_st_type; // @[Datapath.scala 129:15]
    end else if (reset | _T_269 & csr_io_expt) begin // @[Datapath.scala 117:40]
      st_type <= 2'h0; // @[Datapath.scala 118:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      ld_type <= io_ctrl_ld_type; // @[Datapath.scala 130:15]
    end else if (reset | _T_269 & csr_io_expt) begin // @[Datapath.scala 117:40]
      ld_type <= 3'h0; // @[Datapath.scala 119:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      wb_sel <= io_ctrl_wb_sel; // @[Datapath.scala 131:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      wb_en <= io_ctrl_wb_en; // @[Datapath.scala 132:15]
    end else if (reset | _T_269 & csr_io_expt) begin // @[Datapath.scala 117:40]
      wb_en <= 1'h0; // @[Datapath.scala 120:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      csr_cmd <= io_ctrl_csr_cmd; // @[Datapath.scala 133:15]
    end else if (reset | _T_269 & csr_io_expt) begin // @[Datapath.scala 117:40]
      csr_cmd <= 3'h0; // @[Datapath.scala 121:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      illegal <= io_ctrl_illegal; // @[Datapath.scala 134:15]
    end else if (reset | _T_269 & csr_io_expt) begin // @[Datapath.scala 117:40]
      illegal <= 1'h0; // @[Datapath.scala 122:15]
    end
    if (_T_339 & (_T_269 & ~csr_io_expt)) begin // @[Datapath.scala 124:38]
      pc_check <= _T_248; // @[Datapath.scala 135:15]
    end else if (reset | _T_269 & csr_io_expt) begin // @[Datapath.scala 117:40]
      pc_check <= 1'h0; // @[Datapath.scala 123:15]
    end
    started <= reset; // @[Reg.scala 14:44]
    if (reset) begin // @[Reg.scala 26:44]
      pc <= {{1'd0}, _T_246}; // @[Reg.scala 26:44]
    end else if (!(stall)) begin // @[Datapath.scala 54:17]
      if (csr_io_expt) begin // @[Datapath.scala 54:32]
        pc <= {{1'd0}, csr_io_evec};
      end else if (io_ctrl_pc_sel == 2'h3) begin // @[Datapath.scala 55:17]
        pc <= {{1'd0}, csr_io_epc};
      end else begin
        pc <= _T_259;
      end
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
  _RAND_0 = {1{`RANDOM}};
  fe_inst = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  fe_pc = _RAND_1[32:0];
  _RAND_2 = {1{`RANDOM}};
  ew_inst = _RAND_2[31:0];
  _RAND_3 = {2{`RANDOM}};
  ew_pc = _RAND_3[32:0];
  _RAND_4 = {1{`RANDOM}};
  ew_alu = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  csr_in = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  st_type = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  ld_type = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  wb_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  wb_en = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  csr_cmd = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  illegal = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  pc_check = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  started = _RAND_13[0:0];
  _RAND_14 = {2{`RANDOM}};
  pc = _RAND_14[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input  [31:0] io_inst,
  output [1:0]  io_pc_sel,
  output        io_inst_kill,
  output        io_A_sel,
  output        io_B_sel,
  output [2:0]  io_imm_sel,
  output [3:0]  io_alu_op,
  output [2:0]  io_br_type,
  output [1:0]  io_st_type,
  output [2:0]  io_ld_type,
  output [1:0]  io_wb_sel,
  output        io_wb_en,
  output [2:0]  io_csr_cmd,
  output        io_illegal
);
  wire [31:0] _T_32 = io_inst & 32'h7f; // @[Lookup.scala 9:38]
  wire  _T_33 = 32'h37 == _T_32; // @[Lookup.scala 9:38]
  wire  _T_37 = 32'h17 == _T_32; // @[Lookup.scala 9:38]
  wire  _T_41 = 32'h6f == _T_32; // @[Lookup.scala 9:38]
  wire [31:0] _T_44 = io_inst & 32'h707f; // @[Lookup.scala 9:38]
  wire  _T_45 = 32'h67 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_49 = 32'h63 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_53 = 32'h1063 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_57 = 32'h4063 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_61 = 32'h5063 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_65 = 32'h6063 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_69 = 32'h7063 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_73 = 32'h3 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_77 = 32'h1003 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_81 = 32'h2003 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_85 = 32'h4003 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_89 = 32'h5003 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_93 = 32'h23 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_97 = 32'h1023 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_101 = 32'h2023 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_105 = 32'h13 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_109 = 32'h2013 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_113 = 32'h3013 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_117 = 32'h4013 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_121 = 32'h6013 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_125 = 32'h7013 == _T_44; // @[Lookup.scala 9:38]
  wire [31:0] _T_128 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38]
  wire  _T_129 = 32'h1013 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_133 = 32'h5013 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_137 = 32'h40005013 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_141 = 32'h33 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_145 = 32'h40000033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_149 = 32'h1033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_153 = 32'h2033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_157 = 32'h3033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_161 = 32'h4033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_165 = 32'h5033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_169 = 32'h40005033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_173 = 32'h6033 == _T_128; // @[Lookup.scala 9:38]
  wire  _T_177 = 32'h7033 == _T_128; // @[Lookup.scala 9:38]
  wire [31:0] _T_180 = io_inst & 32'hf00fffff; // @[Lookup.scala 9:38]
  wire  _T_181 = 32'hf == _T_180; // @[Lookup.scala 9:38]
  wire  _T_185 = 32'h100f == io_inst; // @[Lookup.scala 9:38]
  wire  _T_189 = 32'h1073 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_193 = 32'h2073 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_197 = 32'h3073 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_201 = 32'h5073 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_205 = 32'h6073 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_209 = 32'h7073 == _T_44; // @[Lookup.scala 9:38]
  wire  _T_213 = 32'h73 == io_inst; // @[Lookup.scala 9:38]
  wire  _T_217 = 32'h100073 == io_inst; // @[Lookup.scala 9:38]
  wire  _T_221 = 32'h10000073 == io_inst; // @[Lookup.scala 9:38]
  wire  _T_225 = 32'h10200073 == io_inst; // @[Lookup.scala 9:38]
  wire [1:0] _T_227 = _T_221 ? 2'h3 : 2'h0; // @[Lookup.scala 11:37]
  wire [1:0] _T_228 = _T_217 ? 2'h0 : _T_227; // @[Lookup.scala 11:37]
  wire [1:0] _T_229 = _T_213 ? 2'h0 : _T_228; // @[Lookup.scala 11:37]
  wire [1:0] _T_230 = _T_209 ? 2'h2 : _T_229; // @[Lookup.scala 11:37]
  wire [1:0] _T_231 = _T_205 ? 2'h2 : _T_230; // @[Lookup.scala 11:37]
  wire [1:0] _T_232 = _T_201 ? 2'h2 : _T_231; // @[Lookup.scala 11:37]
  wire [1:0] _T_233 = _T_197 ? 2'h2 : _T_232; // @[Lookup.scala 11:37]
  wire [1:0] _T_234 = _T_193 ? 2'h2 : _T_233; // @[Lookup.scala 11:37]
  wire [1:0] _T_235 = _T_189 ? 2'h2 : _T_234; // @[Lookup.scala 11:37]
  wire [1:0] _T_236 = _T_185 ? 2'h2 : _T_235; // @[Lookup.scala 11:37]
  wire [1:0] _T_237 = _T_181 ? 2'h0 : _T_236; // @[Lookup.scala 11:37]
  wire [1:0] _T_238 = _T_177 ? 2'h0 : _T_237; // @[Lookup.scala 11:37]
  wire [1:0] _T_239 = _T_173 ? 2'h0 : _T_238; // @[Lookup.scala 11:37]
  wire [1:0] _T_240 = _T_169 ? 2'h0 : _T_239; // @[Lookup.scala 11:37]
  wire [1:0] _T_241 = _T_165 ? 2'h0 : _T_240; // @[Lookup.scala 11:37]
  wire [1:0] _T_242 = _T_161 ? 2'h0 : _T_241; // @[Lookup.scala 11:37]
  wire [1:0] _T_243 = _T_157 ? 2'h0 : _T_242; // @[Lookup.scala 11:37]
  wire [1:0] _T_244 = _T_153 ? 2'h0 : _T_243; // @[Lookup.scala 11:37]
  wire [1:0] _T_245 = _T_149 ? 2'h0 : _T_244; // @[Lookup.scala 11:37]
  wire [1:0] _T_246 = _T_145 ? 2'h0 : _T_245; // @[Lookup.scala 11:37]
  wire [1:0] _T_247 = _T_141 ? 2'h0 : _T_246; // @[Lookup.scala 11:37]
  wire [1:0] _T_248 = _T_137 ? 2'h0 : _T_247; // @[Lookup.scala 11:37]
  wire [1:0] _T_249 = _T_133 ? 2'h0 : _T_248; // @[Lookup.scala 11:37]
  wire [1:0] _T_250 = _T_129 ? 2'h0 : _T_249; // @[Lookup.scala 11:37]
  wire [1:0] _T_251 = _T_125 ? 2'h0 : _T_250; // @[Lookup.scala 11:37]
  wire [1:0] _T_252 = _T_121 ? 2'h0 : _T_251; // @[Lookup.scala 11:37]
  wire [1:0] _T_253 = _T_117 ? 2'h0 : _T_252; // @[Lookup.scala 11:37]
  wire [1:0] _T_254 = _T_113 ? 2'h0 : _T_253; // @[Lookup.scala 11:37]
  wire [1:0] _T_255 = _T_109 ? 2'h0 : _T_254; // @[Lookup.scala 11:37]
  wire [1:0] _T_256 = _T_105 ? 2'h0 : _T_255; // @[Lookup.scala 11:37]
  wire [1:0] _T_257 = _T_101 ? 2'h0 : _T_256; // @[Lookup.scala 11:37]
  wire [1:0] _T_258 = _T_97 ? 2'h0 : _T_257; // @[Lookup.scala 11:37]
  wire [1:0] _T_259 = _T_93 ? 2'h0 : _T_258; // @[Lookup.scala 11:37]
  wire [1:0] _T_260 = _T_89 ? 2'h2 : _T_259; // @[Lookup.scala 11:37]
  wire [1:0] _T_261 = _T_85 ? 2'h2 : _T_260; // @[Lookup.scala 11:37]
  wire [1:0] _T_262 = _T_81 ? 2'h2 : _T_261; // @[Lookup.scala 11:37]
  wire [1:0] _T_263 = _T_77 ? 2'h2 : _T_262; // @[Lookup.scala 11:37]
  wire [1:0] _T_264 = _T_73 ? 2'h2 : _T_263; // @[Lookup.scala 11:37]
  wire [1:0] _T_265 = _T_69 ? 2'h0 : _T_264; // @[Lookup.scala 11:37]
  wire [1:0] _T_266 = _T_65 ? 2'h0 : _T_265; // @[Lookup.scala 11:37]
  wire [1:0] _T_267 = _T_61 ? 2'h0 : _T_266; // @[Lookup.scala 11:37]
  wire [1:0] _T_268 = _T_57 ? 2'h0 : _T_267; // @[Lookup.scala 11:37]
  wire [1:0] _T_269 = _T_53 ? 2'h0 : _T_268; // @[Lookup.scala 11:37]
  wire [1:0] _T_270 = _T_49 ? 2'h0 : _T_269; // @[Lookup.scala 11:37]
  wire [1:0] _T_271 = _T_45 ? 2'h1 : _T_270; // @[Lookup.scala 11:37]
  wire [1:0] _T_272 = _T_41 ? 2'h1 : _T_271; // @[Lookup.scala 11:37]
  wire [1:0] _T_273 = _T_37 ? 2'h0 : _T_272; // @[Lookup.scala 11:37]
  wire  _T_284 = _T_185 ? 1'h0 : _T_189 | (_T_193 | _T_197); // @[Lookup.scala 11:37]
  wire  _T_285 = _T_181 ? 1'h0 : _T_284; // @[Lookup.scala 11:37]
  wire  _T_313 = _T_69 ? 1'h0 : _T_73 | (_T_77 | (_T_81 | (_T_85 | (_T_89 | (_T_93 | (_T_97 | (_T_101 | (_T_105 | (
    _T_109 | (_T_113 | (_T_117 | (_T_121 | (_T_125 | (_T_129 | (_T_133 | (_T_137 | (_T_141 | (_T_145 | (_T_149 | (_T_153
     | (_T_157 | (_T_161 | (_T_165 | (_T_169 | (_T_173 | (_T_177 | _T_285)))))))))))))))))))))))))); // @[Lookup.scala 11:37]
  wire  _T_314 = _T_65 ? 1'h0 : _T_313; // @[Lookup.scala 11:37]
  wire  _T_315 = _T_61 ? 1'h0 : _T_314; // @[Lookup.scala 11:37]
  wire  _T_316 = _T_57 ? 1'h0 : _T_315; // @[Lookup.scala 11:37]
  wire  _T_317 = _T_53 ? 1'h0 : _T_316; // @[Lookup.scala 11:37]
  wire  _T_318 = _T_49 ? 1'h0 : _T_317; // @[Lookup.scala 11:37]
  wire  _T_320 = _T_41 ? 1'h0 : _T_45 | _T_318; // @[Lookup.scala 11:37]
  wire  _T_321 = _T_37 ? 1'h0 : _T_320; // @[Lookup.scala 11:37]
  wire  _T_344 = _T_137 ? 1'h0 : _T_141 | (_T_145 | (_T_149 | (_T_153 | (_T_157 | (_T_161 | (_T_165 | (_T_169 | (_T_173
     | _T_177)))))))); // @[Lookup.scala 11:37]
  wire  _T_345 = _T_133 ? 1'h0 : _T_344; // @[Lookup.scala 11:37]
  wire  _T_346 = _T_129 ? 1'h0 : _T_345; // @[Lookup.scala 11:37]
  wire  _T_347 = _T_125 ? 1'h0 : _T_346; // @[Lookup.scala 11:37]
  wire  _T_348 = _T_121 ? 1'h0 : _T_347; // @[Lookup.scala 11:37]
  wire  _T_349 = _T_117 ? 1'h0 : _T_348; // @[Lookup.scala 11:37]
  wire  _T_350 = _T_113 ? 1'h0 : _T_349; // @[Lookup.scala 11:37]
  wire  _T_351 = _T_109 ? 1'h0 : _T_350; // @[Lookup.scala 11:37]
  wire  _T_352 = _T_105 ? 1'h0 : _T_351; // @[Lookup.scala 11:37]
  wire  _T_353 = _T_101 ? 1'h0 : _T_352; // @[Lookup.scala 11:37]
  wire  _T_354 = _T_97 ? 1'h0 : _T_353; // @[Lookup.scala 11:37]
  wire  _T_355 = _T_93 ? 1'h0 : _T_354; // @[Lookup.scala 11:37]
  wire  _T_356 = _T_89 ? 1'h0 : _T_355; // @[Lookup.scala 11:37]
  wire  _T_357 = _T_85 ? 1'h0 : _T_356; // @[Lookup.scala 11:37]
  wire  _T_358 = _T_81 ? 1'h0 : _T_357; // @[Lookup.scala 11:37]
  wire  _T_359 = _T_77 ? 1'h0 : _T_358; // @[Lookup.scala 11:37]
  wire  _T_360 = _T_73 ? 1'h0 : _T_359; // @[Lookup.scala 11:37]
  wire  _T_361 = _T_69 ? 1'h0 : _T_360; // @[Lookup.scala 11:37]
  wire  _T_362 = _T_65 ? 1'h0 : _T_361; // @[Lookup.scala 11:37]
  wire  _T_363 = _T_61 ? 1'h0 : _T_362; // @[Lookup.scala 11:37]
  wire  _T_364 = _T_57 ? 1'h0 : _T_363; // @[Lookup.scala 11:37]
  wire  _T_365 = _T_53 ? 1'h0 : _T_364; // @[Lookup.scala 11:37]
  wire  _T_366 = _T_49 ? 1'h0 : _T_365; // @[Lookup.scala 11:37]
  wire  _T_367 = _T_45 ? 1'h0 : _T_366; // @[Lookup.scala 11:37]
  wire  _T_368 = _T_41 ? 1'h0 : _T_367; // @[Lookup.scala 11:37]
  wire  _T_369 = _T_37 ? 1'h0 : _T_368; // @[Lookup.scala 11:37]
  wire [2:0] _T_374 = _T_209 ? 3'h6 : 3'h0; // @[Lookup.scala 11:37]
  wire [2:0] _T_375 = _T_205 ? 3'h6 : _T_374; // @[Lookup.scala 11:37]
  wire [2:0] _T_376 = _T_201 ? 3'h6 : _T_375; // @[Lookup.scala 11:37]
  wire [2:0] _T_377 = _T_197 ? 3'h0 : _T_376; // @[Lookup.scala 11:37]
  wire [2:0] _T_378 = _T_193 ? 3'h0 : _T_377; // @[Lookup.scala 11:37]
  wire [2:0] _T_379 = _T_189 ? 3'h0 : _T_378; // @[Lookup.scala 11:37]
  wire [2:0] _T_380 = _T_185 ? 3'h0 : _T_379; // @[Lookup.scala 11:37]
  wire [2:0] _T_381 = _T_181 ? 3'h0 : _T_380; // @[Lookup.scala 11:37]
  wire [2:0] _T_382 = _T_177 ? 3'h0 : _T_381; // @[Lookup.scala 11:37]
  wire [2:0] _T_383 = _T_173 ? 3'h0 : _T_382; // @[Lookup.scala 11:37]
  wire [2:0] _T_384 = _T_169 ? 3'h0 : _T_383; // @[Lookup.scala 11:37]
  wire [2:0] _T_385 = _T_165 ? 3'h0 : _T_384; // @[Lookup.scala 11:37]
  wire [2:0] _T_386 = _T_161 ? 3'h0 : _T_385; // @[Lookup.scala 11:37]
  wire [2:0] _T_387 = _T_157 ? 3'h0 : _T_386; // @[Lookup.scala 11:37]
  wire [2:0] _T_388 = _T_153 ? 3'h0 : _T_387; // @[Lookup.scala 11:37]
  wire [2:0] _T_389 = _T_149 ? 3'h0 : _T_388; // @[Lookup.scala 11:37]
  wire [2:0] _T_390 = _T_145 ? 3'h0 : _T_389; // @[Lookup.scala 11:37]
  wire [2:0] _T_391 = _T_141 ? 3'h0 : _T_390; // @[Lookup.scala 11:37]
  wire [2:0] _T_392 = _T_137 ? 3'h1 : _T_391; // @[Lookup.scala 11:37]
  wire [2:0] _T_393 = _T_133 ? 3'h1 : _T_392; // @[Lookup.scala 11:37]
  wire [2:0] _T_394 = _T_129 ? 3'h1 : _T_393; // @[Lookup.scala 11:37]
  wire [2:0] _T_395 = _T_125 ? 3'h1 : _T_394; // @[Lookup.scala 11:37]
  wire [2:0] _T_396 = _T_121 ? 3'h1 : _T_395; // @[Lookup.scala 11:37]
  wire [2:0] _T_397 = _T_117 ? 3'h1 : _T_396; // @[Lookup.scala 11:37]
  wire [2:0] _T_398 = _T_113 ? 3'h1 : _T_397; // @[Lookup.scala 11:37]
  wire [2:0] _T_399 = _T_109 ? 3'h1 : _T_398; // @[Lookup.scala 11:37]
  wire [2:0] _T_400 = _T_105 ? 3'h1 : _T_399; // @[Lookup.scala 11:37]
  wire [2:0] _T_401 = _T_101 ? 3'h2 : _T_400; // @[Lookup.scala 11:37]
  wire [2:0] _T_402 = _T_97 ? 3'h2 : _T_401; // @[Lookup.scala 11:37]
  wire [2:0] _T_403 = _T_93 ? 3'h2 : _T_402; // @[Lookup.scala 11:37]
  wire [2:0] _T_404 = _T_89 ? 3'h1 : _T_403; // @[Lookup.scala 11:37]
  wire [2:0] _T_405 = _T_85 ? 3'h1 : _T_404; // @[Lookup.scala 11:37]
  wire [2:0] _T_406 = _T_81 ? 3'h1 : _T_405; // @[Lookup.scala 11:37]
  wire [2:0] _T_407 = _T_77 ? 3'h1 : _T_406; // @[Lookup.scala 11:37]
  wire [2:0] _T_408 = _T_73 ? 3'h1 : _T_407; // @[Lookup.scala 11:37]
  wire [2:0] _T_409 = _T_69 ? 3'h5 : _T_408; // @[Lookup.scala 11:37]
  wire [2:0] _T_410 = _T_65 ? 3'h5 : _T_409; // @[Lookup.scala 11:37]
  wire [2:0] _T_411 = _T_61 ? 3'h5 : _T_410; // @[Lookup.scala 11:37]
  wire [2:0] _T_412 = _T_57 ? 3'h5 : _T_411; // @[Lookup.scala 11:37]
  wire [2:0] _T_413 = _T_53 ? 3'h5 : _T_412; // @[Lookup.scala 11:37]
  wire [2:0] _T_414 = _T_49 ? 3'h5 : _T_413; // @[Lookup.scala 11:37]
  wire [2:0] _T_415 = _T_45 ? 3'h1 : _T_414; // @[Lookup.scala 11:37]
  wire [2:0] _T_416 = _T_41 ? 3'h4 : _T_415; // @[Lookup.scala 11:37]
  wire [2:0] _T_417 = _T_37 ? 3'h3 : _T_416; // @[Lookup.scala 11:37]
  wire [3:0] _T_425 = _T_197 ? 4'ha : 4'hf; // @[Lookup.scala 11:37]
  wire [3:0] _T_426 = _T_193 ? 4'ha : _T_425; // @[Lookup.scala 11:37]
  wire [3:0] _T_427 = _T_189 ? 4'ha : _T_426; // @[Lookup.scala 11:37]
  wire [3:0] _T_428 = _T_185 ? 4'hf : _T_427; // @[Lookup.scala 11:37]
  wire [3:0] _T_429 = _T_181 ? 4'hf : _T_428; // @[Lookup.scala 11:37]
  wire [3:0] _T_430 = _T_177 ? 4'h2 : _T_429; // @[Lookup.scala 11:37]
  wire [3:0] _T_431 = _T_173 ? 4'h3 : _T_430; // @[Lookup.scala 11:37]
  wire [3:0] _T_432 = _T_169 ? 4'h9 : _T_431; // @[Lookup.scala 11:37]
  wire [3:0] _T_433 = _T_165 ? 4'h8 : _T_432; // @[Lookup.scala 11:37]
  wire [3:0] _T_434 = _T_161 ? 4'h4 : _T_433; // @[Lookup.scala 11:37]
  wire [3:0] _T_435 = _T_157 ? 4'h7 : _T_434; // @[Lookup.scala 11:37]
  wire [3:0] _T_436 = _T_153 ? 4'h5 : _T_435; // @[Lookup.scala 11:37]
  wire [3:0] _T_437 = _T_149 ? 4'h6 : _T_436; // @[Lookup.scala 11:37]
  wire [3:0] _T_438 = _T_145 ? 4'h1 : _T_437; // @[Lookup.scala 11:37]
  wire [3:0] _T_439 = _T_141 ? 4'h0 : _T_438; // @[Lookup.scala 11:37]
  wire [3:0] _T_440 = _T_137 ? 4'h9 : _T_439; // @[Lookup.scala 11:37]
  wire [3:0] _T_441 = _T_133 ? 4'h8 : _T_440; // @[Lookup.scala 11:37]
  wire [3:0] _T_442 = _T_129 ? 4'h6 : _T_441; // @[Lookup.scala 11:37]
  wire [3:0] _T_443 = _T_125 ? 4'h2 : _T_442; // @[Lookup.scala 11:37]
  wire [3:0] _T_444 = _T_121 ? 4'h3 : _T_443; // @[Lookup.scala 11:37]
  wire [3:0] _T_445 = _T_117 ? 4'h4 : _T_444; // @[Lookup.scala 11:37]
  wire [3:0] _T_446 = _T_113 ? 4'h7 : _T_445; // @[Lookup.scala 11:37]
  wire [3:0] _T_447 = _T_109 ? 4'h5 : _T_446; // @[Lookup.scala 11:37]
  wire [3:0] _T_448 = _T_105 ? 4'h0 : _T_447; // @[Lookup.scala 11:37]
  wire [3:0] _T_449 = _T_101 ? 4'h0 : _T_448; // @[Lookup.scala 11:37]
  wire [3:0] _T_450 = _T_97 ? 4'h0 : _T_449; // @[Lookup.scala 11:37]
  wire [3:0] _T_451 = _T_93 ? 4'h0 : _T_450; // @[Lookup.scala 11:37]
  wire [3:0] _T_452 = _T_89 ? 4'h0 : _T_451; // @[Lookup.scala 11:37]
  wire [3:0] _T_453 = _T_85 ? 4'h0 : _T_452; // @[Lookup.scala 11:37]
  wire [3:0] _T_454 = _T_81 ? 4'h0 : _T_453; // @[Lookup.scala 11:37]
  wire [3:0] _T_455 = _T_77 ? 4'h0 : _T_454; // @[Lookup.scala 11:37]
  wire [3:0] _T_456 = _T_73 ? 4'h0 : _T_455; // @[Lookup.scala 11:37]
  wire [3:0] _T_457 = _T_69 ? 4'h0 : _T_456; // @[Lookup.scala 11:37]
  wire [3:0] _T_458 = _T_65 ? 4'h0 : _T_457; // @[Lookup.scala 11:37]
  wire [3:0] _T_459 = _T_61 ? 4'h0 : _T_458; // @[Lookup.scala 11:37]
  wire [3:0] _T_460 = _T_57 ? 4'h0 : _T_459; // @[Lookup.scala 11:37]
  wire [3:0] _T_461 = _T_53 ? 4'h0 : _T_460; // @[Lookup.scala 11:37]
  wire [3:0] _T_462 = _T_49 ? 4'h0 : _T_461; // @[Lookup.scala 11:37]
  wire [3:0] _T_463 = _T_45 ? 4'h0 : _T_462; // @[Lookup.scala 11:37]
  wire [3:0] _T_464 = _T_41 ? 4'h0 : _T_463; // @[Lookup.scala 11:37]
  wire [3:0] _T_465 = _T_37 ? 4'h0 : _T_464; // @[Lookup.scala 11:37]
  wire [2:0] _T_505 = _T_69 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37]
  wire [2:0] _T_506 = _T_65 ? 3'h1 : _T_505; // @[Lookup.scala 11:37]
  wire [2:0] _T_507 = _T_61 ? 3'h5 : _T_506; // @[Lookup.scala 11:37]
  wire [2:0] _T_508 = _T_57 ? 3'h2 : _T_507; // @[Lookup.scala 11:37]
  wire [2:0] _T_509 = _T_53 ? 3'h6 : _T_508; // @[Lookup.scala 11:37]
  wire [2:0] _T_510 = _T_49 ? 3'h3 : _T_509; // @[Lookup.scala 11:37]
  wire [2:0] _T_511 = _T_45 ? 3'h0 : _T_510; // @[Lookup.scala 11:37]
  wire [2:0] _T_512 = _T_41 ? 3'h0 : _T_511; // @[Lookup.scala 11:37]
  wire [2:0] _T_513 = _T_37 ? 3'h0 : _T_512; // @[Lookup.scala 11:37]
  wire  _T_516 = _T_217 ? 1'h0 : _T_221; // @[Lookup.scala 11:37]
  wire  _T_517 = _T_213 ? 1'h0 : _T_516; // @[Lookup.scala 11:37]
  wire  _T_525 = _T_181 ? 1'h0 : _T_185 | (_T_189 | (_T_193 | (_T_197 | (_T_201 | (_T_205 | (_T_209 | _T_517)))))); // @[Lookup.scala 11:37]
  wire  _T_526 = _T_177 ? 1'h0 : _T_525; // @[Lookup.scala 11:37]
  wire  _T_527 = _T_173 ? 1'h0 : _T_526; // @[Lookup.scala 11:37]
  wire  _T_528 = _T_169 ? 1'h0 : _T_527; // @[Lookup.scala 11:37]
  wire  _T_529 = _T_165 ? 1'h0 : _T_528; // @[Lookup.scala 11:37]
  wire  _T_530 = _T_161 ? 1'h0 : _T_529; // @[Lookup.scala 11:37]
  wire  _T_531 = _T_157 ? 1'h0 : _T_530; // @[Lookup.scala 11:37]
  wire  _T_532 = _T_153 ? 1'h0 : _T_531; // @[Lookup.scala 11:37]
  wire  _T_533 = _T_149 ? 1'h0 : _T_532; // @[Lookup.scala 11:37]
  wire  _T_534 = _T_145 ? 1'h0 : _T_533; // @[Lookup.scala 11:37]
  wire  _T_535 = _T_141 ? 1'h0 : _T_534; // @[Lookup.scala 11:37]
  wire  _T_536 = _T_137 ? 1'h0 : _T_535; // @[Lookup.scala 11:37]
  wire  _T_537 = _T_133 ? 1'h0 : _T_536; // @[Lookup.scala 11:37]
  wire  _T_538 = _T_129 ? 1'h0 : _T_537; // @[Lookup.scala 11:37]
  wire  _T_539 = _T_125 ? 1'h0 : _T_538; // @[Lookup.scala 11:37]
  wire  _T_540 = _T_121 ? 1'h0 : _T_539; // @[Lookup.scala 11:37]
  wire  _T_541 = _T_117 ? 1'h0 : _T_540; // @[Lookup.scala 11:37]
  wire  _T_542 = _T_113 ? 1'h0 : _T_541; // @[Lookup.scala 11:37]
  wire  _T_543 = _T_109 ? 1'h0 : _T_542; // @[Lookup.scala 11:37]
  wire  _T_544 = _T_105 ? 1'h0 : _T_543; // @[Lookup.scala 11:37]
  wire  _T_545 = _T_101 ? 1'h0 : _T_544; // @[Lookup.scala 11:37]
  wire  _T_546 = _T_97 ? 1'h0 : _T_545; // @[Lookup.scala 11:37]
  wire  _T_547 = _T_93 ? 1'h0 : _T_546; // @[Lookup.scala 11:37]
  wire  _T_553 = _T_69 ? 1'h0 : _T_73 | (_T_77 | (_T_81 | (_T_85 | (_T_89 | _T_547)))); // @[Lookup.scala 11:37]
  wire  _T_554 = _T_65 ? 1'h0 : _T_553; // @[Lookup.scala 11:37]
  wire  _T_555 = _T_61 ? 1'h0 : _T_554; // @[Lookup.scala 11:37]
  wire  _T_556 = _T_57 ? 1'h0 : _T_555; // @[Lookup.scala 11:37]
  wire  _T_557 = _T_53 ? 1'h0 : _T_556; // @[Lookup.scala 11:37]
  wire  _T_558 = _T_49 ? 1'h0 : _T_557; // @[Lookup.scala 11:37]
  wire  _T_561 = _T_37 ? 1'h0 : _T_41 | (_T_45 | _T_558); // @[Lookup.scala 11:37]
  wire [1:0] _T_593 = _T_101 ? 2'h1 : 2'h0; // @[Lookup.scala 11:37]
  wire [1:0] _T_594 = _T_97 ? 2'h2 : _T_593; // @[Lookup.scala 11:37]
  wire [1:0] _T_595 = _T_93 ? 2'h3 : _T_594; // @[Lookup.scala 11:37]
  wire [1:0] _T_596 = _T_89 ? 2'h0 : _T_595; // @[Lookup.scala 11:37]
  wire [1:0] _T_597 = _T_85 ? 2'h0 : _T_596; // @[Lookup.scala 11:37]
  wire [1:0] _T_598 = _T_81 ? 2'h0 : _T_597; // @[Lookup.scala 11:37]
  wire [1:0] _T_599 = _T_77 ? 2'h0 : _T_598; // @[Lookup.scala 11:37]
  wire [1:0] _T_600 = _T_73 ? 2'h0 : _T_599; // @[Lookup.scala 11:37]
  wire [1:0] _T_601 = _T_69 ? 2'h0 : _T_600; // @[Lookup.scala 11:37]
  wire [1:0] _T_602 = _T_65 ? 2'h0 : _T_601; // @[Lookup.scala 11:37]
  wire [1:0] _T_603 = _T_61 ? 2'h0 : _T_602; // @[Lookup.scala 11:37]
  wire [1:0] _T_604 = _T_57 ? 2'h0 : _T_603; // @[Lookup.scala 11:37]
  wire [1:0] _T_605 = _T_53 ? 2'h0 : _T_604; // @[Lookup.scala 11:37]
  wire [1:0] _T_606 = _T_49 ? 2'h0 : _T_605; // @[Lookup.scala 11:37]
  wire [1:0] _T_607 = _T_45 ? 2'h0 : _T_606; // @[Lookup.scala 11:37]
  wire [1:0] _T_608 = _T_41 ? 2'h0 : _T_607; // @[Lookup.scala 11:37]
  wire [1:0] _T_609 = _T_37 ? 2'h0 : _T_608; // @[Lookup.scala 11:37]
  wire [2:0] _T_644 = _T_89 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37]
  wire [2:0] _T_645 = _T_85 ? 3'h5 : _T_644; // @[Lookup.scala 11:37]
  wire [2:0] _T_646 = _T_81 ? 3'h1 : _T_645; // @[Lookup.scala 11:37]
  wire [2:0] _T_647 = _T_77 ? 3'h2 : _T_646; // @[Lookup.scala 11:37]
  wire [2:0] _T_648 = _T_73 ? 3'h3 : _T_647; // @[Lookup.scala 11:37]
  wire [2:0] _T_649 = _T_69 ? 3'h0 : _T_648; // @[Lookup.scala 11:37]
  wire [2:0] _T_650 = _T_65 ? 3'h0 : _T_649; // @[Lookup.scala 11:37]
  wire [2:0] _T_651 = _T_61 ? 3'h0 : _T_650; // @[Lookup.scala 11:37]
  wire [2:0] _T_652 = _T_57 ? 3'h0 : _T_651; // @[Lookup.scala 11:37]
  wire [2:0] _T_653 = _T_53 ? 3'h0 : _T_652; // @[Lookup.scala 11:37]
  wire [2:0] _T_654 = _T_49 ? 3'h0 : _T_653; // @[Lookup.scala 11:37]
  wire [2:0] _T_655 = _T_45 ? 3'h0 : _T_654; // @[Lookup.scala 11:37]
  wire [2:0] _T_656 = _T_41 ? 3'h0 : _T_655; // @[Lookup.scala 11:37]
  wire [2:0] _T_657 = _T_37 ? 3'h0 : _T_656; // @[Lookup.scala 11:37]
  wire [1:0] _T_660 = _T_217 ? 2'h3 : _T_227; // @[Lookup.scala 11:37]
  wire [1:0] _T_661 = _T_213 ? 2'h3 : _T_660; // @[Lookup.scala 11:37]
  wire [1:0] _T_662 = _T_209 ? 2'h3 : _T_661; // @[Lookup.scala 11:37]
  wire [1:0] _T_663 = _T_205 ? 2'h3 : _T_662; // @[Lookup.scala 11:37]
  wire [1:0] _T_664 = _T_201 ? 2'h3 : _T_663; // @[Lookup.scala 11:37]
  wire [1:0] _T_665 = _T_197 ? 2'h3 : _T_664; // @[Lookup.scala 11:37]
  wire [1:0] _T_666 = _T_193 ? 2'h3 : _T_665; // @[Lookup.scala 11:37]
  wire [1:0] _T_667 = _T_189 ? 2'h3 : _T_666; // @[Lookup.scala 11:37]
  wire [1:0] _T_668 = _T_185 ? 2'h0 : _T_667; // @[Lookup.scala 11:37]
  wire [1:0] _T_669 = _T_181 ? 2'h0 : _T_668; // @[Lookup.scala 11:37]
  wire [1:0] _T_670 = _T_177 ? 2'h0 : _T_669; // @[Lookup.scala 11:37]
  wire [1:0] _T_671 = _T_173 ? 2'h0 : _T_670; // @[Lookup.scala 11:37]
  wire [1:0] _T_672 = _T_169 ? 2'h0 : _T_671; // @[Lookup.scala 11:37]
  wire [1:0] _T_673 = _T_165 ? 2'h0 : _T_672; // @[Lookup.scala 11:37]
  wire [1:0] _T_674 = _T_161 ? 2'h0 : _T_673; // @[Lookup.scala 11:37]
  wire [1:0] _T_675 = _T_157 ? 2'h0 : _T_674; // @[Lookup.scala 11:37]
  wire [1:0] _T_676 = _T_153 ? 2'h0 : _T_675; // @[Lookup.scala 11:37]
  wire [1:0] _T_677 = _T_149 ? 2'h0 : _T_676; // @[Lookup.scala 11:37]
  wire [1:0] _T_678 = _T_145 ? 2'h0 : _T_677; // @[Lookup.scala 11:37]
  wire [1:0] _T_679 = _T_141 ? 2'h0 : _T_678; // @[Lookup.scala 11:37]
  wire [1:0] _T_680 = _T_137 ? 2'h0 : _T_679; // @[Lookup.scala 11:37]
  wire [1:0] _T_681 = _T_133 ? 2'h0 : _T_680; // @[Lookup.scala 11:37]
  wire [1:0] _T_682 = _T_129 ? 2'h0 : _T_681; // @[Lookup.scala 11:37]
  wire [1:0] _T_683 = _T_125 ? 2'h0 : _T_682; // @[Lookup.scala 11:37]
  wire [1:0] _T_684 = _T_121 ? 2'h0 : _T_683; // @[Lookup.scala 11:37]
  wire [1:0] _T_685 = _T_117 ? 2'h0 : _T_684; // @[Lookup.scala 11:37]
  wire [1:0] _T_686 = _T_113 ? 2'h0 : _T_685; // @[Lookup.scala 11:37]
  wire [1:0] _T_687 = _T_109 ? 2'h0 : _T_686; // @[Lookup.scala 11:37]
  wire [1:0] _T_688 = _T_105 ? 2'h0 : _T_687; // @[Lookup.scala 11:37]
  wire [1:0] _T_689 = _T_101 ? 2'h0 : _T_688; // @[Lookup.scala 11:37]
  wire [1:0] _T_690 = _T_97 ? 2'h0 : _T_689; // @[Lookup.scala 11:37]
  wire [1:0] _T_691 = _T_93 ? 2'h0 : _T_690; // @[Lookup.scala 11:37]
  wire [1:0] _T_692 = _T_89 ? 2'h1 : _T_691; // @[Lookup.scala 11:37]
  wire [1:0] _T_693 = _T_85 ? 2'h1 : _T_692; // @[Lookup.scala 11:37]
  wire [1:0] _T_694 = _T_81 ? 2'h1 : _T_693; // @[Lookup.scala 11:37]
  wire [1:0] _T_695 = _T_77 ? 2'h1 : _T_694; // @[Lookup.scala 11:37]
  wire [1:0] _T_696 = _T_73 ? 2'h1 : _T_695; // @[Lookup.scala 11:37]
  wire [1:0] _T_697 = _T_69 ? 2'h0 : _T_696; // @[Lookup.scala 11:37]
  wire [1:0] _T_698 = _T_65 ? 2'h0 : _T_697; // @[Lookup.scala 11:37]
  wire [1:0] _T_699 = _T_61 ? 2'h0 : _T_698; // @[Lookup.scala 11:37]
  wire [1:0] _T_700 = _T_57 ? 2'h0 : _T_699; // @[Lookup.scala 11:37]
  wire [1:0] _T_701 = _T_53 ? 2'h0 : _T_700; // @[Lookup.scala 11:37]
  wire [1:0] _T_702 = _T_49 ? 2'h0 : _T_701; // @[Lookup.scala 11:37]
  wire [1:0] _T_703 = _T_45 ? 2'h2 : _T_702; // @[Lookup.scala 11:37]
  wire [1:0] _T_704 = _T_41 ? 2'h2 : _T_703; // @[Lookup.scala 11:37]
  wire [1:0] _T_705 = _T_37 ? 2'h0 : _T_704; // @[Lookup.scala 11:37]
  wire  _T_716 = _T_185 ? 1'h0 : _T_189 | (_T_193 | (_T_197 | (_T_201 | (_T_205 | _T_209)))); // @[Lookup.scala 11:37]
  wire  _T_717 = _T_181 ? 1'h0 : _T_716; // @[Lookup.scala 11:37]
  wire  _T_737 = _T_101 ? 1'h0 : _T_105 | (_T_109 | (_T_113 | (_T_117 | (_T_121 | (_T_125 | (_T_129 | (_T_133 | (_T_137
     | (_T_141 | (_T_145 | (_T_149 | (_T_153 | (_T_157 | (_T_161 | (_T_165 | (_T_169 | (_T_173 | (_T_177 | _T_717)))))))
    ))))))))))); // @[Lookup.scala 11:37]
  wire  _T_738 = _T_97 ? 1'h0 : _T_737; // @[Lookup.scala 11:37]
  wire  _T_739 = _T_93 ? 1'h0 : _T_738; // @[Lookup.scala 11:37]
  wire  _T_745 = _T_69 ? 1'h0 : _T_73 | (_T_77 | (_T_81 | (_T_85 | (_T_89 | _T_739)))); // @[Lookup.scala 11:37]
  wire  _T_746 = _T_65 ? 1'h0 : _T_745; // @[Lookup.scala 11:37]
  wire  _T_747 = _T_61 ? 1'h0 : _T_746; // @[Lookup.scala 11:37]
  wire  _T_748 = _T_57 ? 1'h0 : _T_747; // @[Lookup.scala 11:37]
  wire  _T_749 = _T_53 ? 1'h0 : _T_748; // @[Lookup.scala 11:37]
  wire  _T_750 = _T_49 ? 1'h0 : _T_749; // @[Lookup.scala 11:37]
  wire [2:0] _T_755 = _T_221 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37]
  wire [2:0] _T_756 = _T_217 ? 3'h4 : _T_755; // @[Lookup.scala 11:37]
  wire [2:0] _T_757 = _T_213 ? 3'h4 : _T_756; // @[Lookup.scala 11:37]
  wire [2:0] _T_758 = _T_209 ? 3'h3 : _T_757; // @[Lookup.scala 11:37]
  wire [2:0] _T_759 = _T_205 ? 3'h2 : _T_758; // @[Lookup.scala 11:37]
  wire [2:0] _T_760 = _T_201 ? 3'h1 : _T_759; // @[Lookup.scala 11:37]
  wire [2:0] _T_761 = _T_197 ? 3'h3 : _T_760; // @[Lookup.scala 11:37]
  wire [2:0] _T_762 = _T_193 ? 3'h2 : _T_761; // @[Lookup.scala 11:37]
  wire [2:0] _T_763 = _T_189 ? 3'h1 : _T_762; // @[Lookup.scala 11:37]
  wire [2:0] _T_764 = _T_185 ? 3'h0 : _T_763; // @[Lookup.scala 11:37]
  wire [2:0] _T_765 = _T_181 ? 3'h0 : _T_764; // @[Lookup.scala 11:37]
  wire [2:0] _T_766 = _T_177 ? 3'h0 : _T_765; // @[Lookup.scala 11:37]
  wire [2:0] _T_767 = _T_173 ? 3'h0 : _T_766; // @[Lookup.scala 11:37]
  wire [2:0] _T_768 = _T_169 ? 3'h0 : _T_767; // @[Lookup.scala 11:37]
  wire [2:0] _T_769 = _T_165 ? 3'h0 : _T_768; // @[Lookup.scala 11:37]
  wire [2:0] _T_770 = _T_161 ? 3'h0 : _T_769; // @[Lookup.scala 11:37]
  wire [2:0] _T_771 = _T_157 ? 3'h0 : _T_770; // @[Lookup.scala 11:37]
  wire [2:0] _T_772 = _T_153 ? 3'h0 : _T_771; // @[Lookup.scala 11:37]
  wire [2:0] _T_773 = _T_149 ? 3'h0 : _T_772; // @[Lookup.scala 11:37]
  wire [2:0] _T_774 = _T_145 ? 3'h0 : _T_773; // @[Lookup.scala 11:37]
  wire [2:0] _T_775 = _T_141 ? 3'h0 : _T_774; // @[Lookup.scala 11:37]
  wire [2:0] _T_776 = _T_137 ? 3'h0 : _T_775; // @[Lookup.scala 11:37]
  wire [2:0] _T_777 = _T_133 ? 3'h0 : _T_776; // @[Lookup.scala 11:37]
  wire [2:0] _T_778 = _T_129 ? 3'h0 : _T_777; // @[Lookup.scala 11:37]
  wire [2:0] _T_779 = _T_125 ? 3'h0 : _T_778; // @[Lookup.scala 11:37]
  wire [2:0] _T_780 = _T_121 ? 3'h0 : _T_779; // @[Lookup.scala 11:37]
  wire [2:0] _T_781 = _T_117 ? 3'h0 : _T_780; // @[Lookup.scala 11:37]
  wire [2:0] _T_782 = _T_113 ? 3'h0 : _T_781; // @[Lookup.scala 11:37]
  wire [2:0] _T_783 = _T_109 ? 3'h0 : _T_782; // @[Lookup.scala 11:37]
  wire [2:0] _T_784 = _T_105 ? 3'h0 : _T_783; // @[Lookup.scala 11:37]
  wire [2:0] _T_785 = _T_101 ? 3'h0 : _T_784; // @[Lookup.scala 11:37]
  wire [2:0] _T_786 = _T_97 ? 3'h0 : _T_785; // @[Lookup.scala 11:37]
  wire [2:0] _T_787 = _T_93 ? 3'h0 : _T_786; // @[Lookup.scala 11:37]
  wire [2:0] _T_788 = _T_89 ? 3'h0 : _T_787; // @[Lookup.scala 11:37]
  wire [2:0] _T_789 = _T_85 ? 3'h0 : _T_788; // @[Lookup.scala 11:37]
  wire [2:0] _T_790 = _T_81 ? 3'h0 : _T_789; // @[Lookup.scala 11:37]
  wire [2:0] _T_791 = _T_77 ? 3'h0 : _T_790; // @[Lookup.scala 11:37]
  wire [2:0] _T_792 = _T_73 ? 3'h0 : _T_791; // @[Lookup.scala 11:37]
  wire [2:0] _T_793 = _T_69 ? 3'h0 : _T_792; // @[Lookup.scala 11:37]
  wire [2:0] _T_794 = _T_65 ? 3'h0 : _T_793; // @[Lookup.scala 11:37]
  wire [2:0] _T_795 = _T_61 ? 3'h0 : _T_794; // @[Lookup.scala 11:37]
  wire [2:0] _T_796 = _T_57 ? 3'h0 : _T_795; // @[Lookup.scala 11:37]
  wire [2:0] _T_797 = _T_53 ? 3'h0 : _T_796; // @[Lookup.scala 11:37]
  wire [2:0] _T_798 = _T_49 ? 3'h0 : _T_797; // @[Lookup.scala 11:37]
  wire [2:0] _T_799 = _T_45 ? 3'h0 : _T_798; // @[Lookup.scala 11:37]
  wire [2:0] _T_800 = _T_41 ? 3'h0 : _T_799; // @[Lookup.scala 11:37]
  wire [2:0] _T_801 = _T_37 ? 3'h0 : _T_800; // @[Lookup.scala 11:37]
  wire  _T_802 = _T_225 ? 1'h0 : 1'h1; // @[Lookup.scala 11:37]
  wire  _T_803 = _T_221 ? 1'h0 : _T_802; // @[Lookup.scala 11:37]
  wire  _T_804 = _T_217 ? 1'h0 : _T_803; // @[Lookup.scala 11:37]
  wire  _T_805 = _T_213 ? 1'h0 : _T_804; // @[Lookup.scala 11:37]
  wire  _T_806 = _T_209 ? 1'h0 : _T_805; // @[Lookup.scala 11:37]
  wire  _T_807 = _T_205 ? 1'h0 : _T_806; // @[Lookup.scala 11:37]
  wire  _T_808 = _T_201 ? 1'h0 : _T_807; // @[Lookup.scala 11:37]
  wire  _T_809 = _T_197 ? 1'h0 : _T_808; // @[Lookup.scala 11:37]
  wire  _T_810 = _T_193 ? 1'h0 : _T_809; // @[Lookup.scala 11:37]
  wire  _T_811 = _T_189 ? 1'h0 : _T_810; // @[Lookup.scala 11:37]
  wire  _T_812 = _T_185 ? 1'h0 : _T_811; // @[Lookup.scala 11:37]
  wire  _T_813 = _T_181 ? 1'h0 : _T_812; // @[Lookup.scala 11:37]
  wire  _T_814 = _T_177 ? 1'h0 : _T_813; // @[Lookup.scala 11:37]
  wire  _T_815 = _T_173 ? 1'h0 : _T_814; // @[Lookup.scala 11:37]
  wire  _T_816 = _T_169 ? 1'h0 : _T_815; // @[Lookup.scala 11:37]
  wire  _T_817 = _T_165 ? 1'h0 : _T_816; // @[Lookup.scala 11:37]
  wire  _T_818 = _T_161 ? 1'h0 : _T_817; // @[Lookup.scala 11:37]
  wire  _T_819 = _T_157 ? 1'h0 : _T_818; // @[Lookup.scala 11:37]
  wire  _T_820 = _T_153 ? 1'h0 : _T_819; // @[Lookup.scala 11:37]
  wire  _T_821 = _T_149 ? 1'h0 : _T_820; // @[Lookup.scala 11:37]
  wire  _T_822 = _T_145 ? 1'h0 : _T_821; // @[Lookup.scala 11:37]
  wire  _T_823 = _T_141 ? 1'h0 : _T_822; // @[Lookup.scala 11:37]
  wire  _T_824 = _T_137 ? 1'h0 : _T_823; // @[Lookup.scala 11:37]
  wire  _T_825 = _T_133 ? 1'h0 : _T_824; // @[Lookup.scala 11:37]
  wire  _T_826 = _T_129 ? 1'h0 : _T_825; // @[Lookup.scala 11:37]
  wire  _T_827 = _T_125 ? 1'h0 : _T_826; // @[Lookup.scala 11:37]
  wire  _T_828 = _T_121 ? 1'h0 : _T_827; // @[Lookup.scala 11:37]
  wire  _T_829 = _T_117 ? 1'h0 : _T_828; // @[Lookup.scala 11:37]
  wire  _T_830 = _T_113 ? 1'h0 : _T_829; // @[Lookup.scala 11:37]
  wire  _T_831 = _T_109 ? 1'h0 : _T_830; // @[Lookup.scala 11:37]
  wire  _T_832 = _T_105 ? 1'h0 : _T_831; // @[Lookup.scala 11:37]
  wire  _T_833 = _T_101 ? 1'h0 : _T_832; // @[Lookup.scala 11:37]
  wire  _T_834 = _T_97 ? 1'h0 : _T_833; // @[Lookup.scala 11:37]
  wire  _T_835 = _T_93 ? 1'h0 : _T_834; // @[Lookup.scala 11:37]
  wire  _T_836 = _T_89 ? 1'h0 : _T_835; // @[Lookup.scala 11:37]
  wire  _T_837 = _T_85 ? 1'h0 : _T_836; // @[Lookup.scala 11:37]
  wire  _T_838 = _T_81 ? 1'h0 : _T_837; // @[Lookup.scala 11:37]
  wire  _T_839 = _T_77 ? 1'h0 : _T_838; // @[Lookup.scala 11:37]
  wire  _T_840 = _T_73 ? 1'h0 : _T_839; // @[Lookup.scala 11:37]
  wire  _T_841 = _T_69 ? 1'h0 : _T_840; // @[Lookup.scala 11:37]
  wire  _T_842 = _T_65 ? 1'h0 : _T_841; // @[Lookup.scala 11:37]
  wire  _T_843 = _T_61 ? 1'h0 : _T_842; // @[Lookup.scala 11:37]
  wire  _T_844 = _T_57 ? 1'h0 : _T_843; // @[Lookup.scala 11:37]
  wire  _T_845 = _T_53 ? 1'h0 : _T_844; // @[Lookup.scala 11:37]
  wire  _T_846 = _T_49 ? 1'h0 : _T_845; // @[Lookup.scala 11:37]
  wire  _T_847 = _T_45 ? 1'h0 : _T_846; // @[Lookup.scala 11:37]
  wire  _T_848 = _T_41 ? 1'h0 : _T_847; // @[Lookup.scala 11:37]
  wire  _T_849 = _T_37 ? 1'h0 : _T_848; // @[Lookup.scala 11:37]
  assign io_pc_sel = _T_33 ? 2'h0 : _T_273; // @[Lookup.scala 11:37]
  assign io_inst_kill = _T_33 ? 1'h0 : _T_561; // @[Lookup.scala 11:37]
  assign io_A_sel = _T_33 ? 1'h0 : _T_321; // @[Lookup.scala 11:37]
  assign io_B_sel = _T_33 ? 1'h0 : _T_369; // @[Lookup.scala 11:37]
  assign io_imm_sel = _T_33 ? 3'h3 : _T_417; // @[Lookup.scala 11:37]
  assign io_alu_op = _T_33 ? 4'hb : _T_465; // @[Lookup.scala 11:37]
  assign io_br_type = _T_33 ? 3'h0 : _T_513; // @[Lookup.scala 11:37]
  assign io_st_type = _T_33 ? 2'h0 : _T_609; // @[Lookup.scala 11:37]
  assign io_ld_type = _T_33 ? 3'h0 : _T_657; // @[Lookup.scala 11:37]
  assign io_wb_sel = _T_33 ? 2'h0 : _T_705; // @[Lookup.scala 11:37]
  assign io_wb_en = _T_33 | (_T_37 | (_T_41 | (_T_45 | _T_750))); // @[Lookup.scala 11:37]
  assign io_csr_cmd = _T_33 ? 3'h0 : _T_801; // @[Lookup.scala 11:37]
  assign io_illegal = _T_33 ? 1'h0 : _T_849; // @[Lookup.scala 11:37]
endmodule
module Core(
  input         clock,
  input         reset,
  output [31:0] io_host_tohost,
  output [31:0] io_icache_req_bits_addr,
  input         io_icache_resp_valid,
  input  [31:0] io_icache_resp_bits_data,
  output        io_dcache_req_valid,
  output [31:0] io_dcache_req_bits_addr,
  output [31:0] io_dcache_req_bits_data,
  output [3:0]  io_dcache_req_bits_mask,
  input         io_dcache_resp_valid,
  input  [31:0] io_dcache_resp_bits_data
);
  wire  dpath_clock; // @[Core.scala 35:21]
  wire  dpath_reset; // @[Core.scala 35:21]
  wire [31:0] dpath_io_host_tohost; // @[Core.scala 35:21]
  wire [31:0] dpath_io_icache_req_bits_addr; // @[Core.scala 35:21]
  wire  dpath_io_icache_resp_valid; // @[Core.scala 35:21]
  wire [31:0] dpath_io_icache_resp_bits_data; // @[Core.scala 35:21]
  wire  dpath_io_dcache_req_valid; // @[Core.scala 35:21]
  wire [31:0] dpath_io_dcache_req_bits_addr; // @[Core.scala 35:21]
  wire [31:0] dpath_io_dcache_req_bits_data; // @[Core.scala 35:21]
  wire [3:0] dpath_io_dcache_req_bits_mask; // @[Core.scala 35:21]
  wire  dpath_io_dcache_resp_valid; // @[Core.scala 35:21]
  wire [31:0] dpath_io_dcache_resp_bits_data; // @[Core.scala 35:21]
  wire [31:0] dpath_io_ctrl_inst; // @[Core.scala 35:21]
  wire [1:0] dpath_io_ctrl_pc_sel; // @[Core.scala 35:21]
  wire  dpath_io_ctrl_inst_kill; // @[Core.scala 35:21]
  wire  dpath_io_ctrl_A_sel; // @[Core.scala 35:21]
  wire  dpath_io_ctrl_B_sel; // @[Core.scala 35:21]
  wire [2:0] dpath_io_ctrl_imm_sel; // @[Core.scala 35:21]
  wire [3:0] dpath_io_ctrl_alu_op; // @[Core.scala 35:21]
  wire [2:0] dpath_io_ctrl_br_type; // @[Core.scala 35:21]
  wire [1:0] dpath_io_ctrl_st_type; // @[Core.scala 35:21]
  wire [2:0] dpath_io_ctrl_ld_type; // @[Core.scala 35:21]
  wire [1:0] dpath_io_ctrl_wb_sel; // @[Core.scala 35:21]
  wire  dpath_io_ctrl_wb_en; // @[Core.scala 35:21]
  wire [2:0] dpath_io_ctrl_csr_cmd; // @[Core.scala 35:21]
  wire  dpath_io_ctrl_illegal; // @[Core.scala 35:21]
  wire [31:0] ctrl_io_inst; // @[Core.scala 36:21]
  wire [1:0] ctrl_io_pc_sel; // @[Core.scala 36:21]
  wire  ctrl_io_inst_kill; // @[Core.scala 36:21]
  wire  ctrl_io_A_sel; // @[Core.scala 36:21]
  wire  ctrl_io_B_sel; // @[Core.scala 36:21]
  wire [2:0] ctrl_io_imm_sel; // @[Core.scala 36:21]
  wire [3:0] ctrl_io_alu_op; // @[Core.scala 36:21]
  wire [2:0] ctrl_io_br_type; // @[Core.scala 36:21]
  wire [1:0] ctrl_io_st_type; // @[Core.scala 36:21]
  wire [2:0] ctrl_io_ld_type; // @[Core.scala 36:21]
  wire [1:0] ctrl_io_wb_sel; // @[Core.scala 36:21]
  wire  ctrl_io_wb_en; // @[Core.scala 36:21]
  wire [2:0] ctrl_io_csr_cmd; // @[Core.scala 36:21]
  wire  ctrl_io_illegal; // @[Core.scala 36:21]
  Datapath dpath ( // @[Core.scala 35:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_host_tohost(dpath_io_host_tohost),
    .io_icache_req_bits_addr(dpath_io_icache_req_bits_addr),
    .io_icache_resp_valid(dpath_io_icache_resp_valid),
    .io_icache_resp_bits_data(dpath_io_icache_resp_bits_data),
    .io_dcache_req_valid(dpath_io_dcache_req_valid),
    .io_dcache_req_bits_addr(dpath_io_dcache_req_bits_addr),
    .io_dcache_req_bits_data(dpath_io_dcache_req_bits_data),
    .io_dcache_req_bits_mask(dpath_io_dcache_req_bits_mask),
    .io_dcache_resp_valid(dpath_io_dcache_resp_valid),
    .io_dcache_resp_bits_data(dpath_io_dcache_resp_bits_data),
    .io_ctrl_inst(dpath_io_ctrl_inst),
    .io_ctrl_pc_sel(dpath_io_ctrl_pc_sel),
    .io_ctrl_inst_kill(dpath_io_ctrl_inst_kill),
    .io_ctrl_A_sel(dpath_io_ctrl_A_sel),
    .io_ctrl_B_sel(dpath_io_ctrl_B_sel),
    .io_ctrl_imm_sel(dpath_io_ctrl_imm_sel),
    .io_ctrl_alu_op(dpath_io_ctrl_alu_op),
    .io_ctrl_br_type(dpath_io_ctrl_br_type),
    .io_ctrl_st_type(dpath_io_ctrl_st_type),
    .io_ctrl_ld_type(dpath_io_ctrl_ld_type),
    .io_ctrl_wb_sel(dpath_io_ctrl_wb_sel),
    .io_ctrl_wb_en(dpath_io_ctrl_wb_en),
    .io_ctrl_csr_cmd(dpath_io_ctrl_csr_cmd),
    .io_ctrl_illegal(dpath_io_ctrl_illegal)
  );
  Control ctrl ( // @[Core.scala 36:21]
    .io_inst(ctrl_io_inst),
    .io_pc_sel(ctrl_io_pc_sel),
    .io_inst_kill(ctrl_io_inst_kill),
    .io_A_sel(ctrl_io_A_sel),
    .io_B_sel(ctrl_io_B_sel),
    .io_imm_sel(ctrl_io_imm_sel),
    .io_alu_op(ctrl_io_alu_op),
    .io_br_type(ctrl_io_br_type),
    .io_st_type(ctrl_io_st_type),
    .io_ld_type(ctrl_io_ld_type),
    .io_wb_sel(ctrl_io_wb_sel),
    .io_wb_en(ctrl_io_wb_en),
    .io_csr_cmd(ctrl_io_csr_cmd),
    .io_illegal(ctrl_io_illegal)
  );
  assign io_host_tohost = dpath_io_host_tohost; // @[Core.scala 38:11]
  assign io_icache_req_bits_addr = dpath_io_icache_req_bits_addr; // @[Core.scala 39:19]
  assign io_dcache_req_valid = dpath_io_dcache_req_valid; // @[Core.scala 40:19]
  assign io_dcache_req_bits_addr = dpath_io_dcache_req_bits_addr; // @[Core.scala 40:19]
  assign io_dcache_req_bits_data = dpath_io_dcache_req_bits_data; // @[Core.scala 40:19]
  assign io_dcache_req_bits_mask = dpath_io_dcache_req_bits_mask; // @[Core.scala 40:19]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_icache_resp_valid = io_icache_resp_valid; // @[Core.scala 39:19]
  assign dpath_io_icache_resp_bits_data = io_icache_resp_bits_data; // @[Core.scala 39:19]
  assign dpath_io_dcache_resp_valid = io_dcache_resp_valid; // @[Core.scala 40:19]
  assign dpath_io_dcache_resp_bits_data = io_dcache_resp_bits_data; // @[Core.scala 40:19]
  assign dpath_io_ctrl_pc_sel = ctrl_io_pc_sel; // @[Core.scala 41:17]
  assign dpath_io_ctrl_inst_kill = ctrl_io_inst_kill; // @[Core.scala 41:17]
  assign dpath_io_ctrl_A_sel = ctrl_io_A_sel; // @[Core.scala 41:17]
  assign dpath_io_ctrl_B_sel = ctrl_io_B_sel; // @[Core.scala 41:17]
  assign dpath_io_ctrl_imm_sel = ctrl_io_imm_sel; // @[Core.scala 41:17]
  assign dpath_io_ctrl_alu_op = ctrl_io_alu_op; // @[Core.scala 41:17]
  assign dpath_io_ctrl_br_type = ctrl_io_br_type; // @[Core.scala 41:17]
  assign dpath_io_ctrl_st_type = ctrl_io_st_type; // @[Core.scala 41:17]
  assign dpath_io_ctrl_ld_type = ctrl_io_ld_type; // @[Core.scala 41:17]
  assign dpath_io_ctrl_wb_sel = ctrl_io_wb_sel; // @[Core.scala 41:17]
  assign dpath_io_ctrl_wb_en = ctrl_io_wb_en; // @[Core.scala 41:17]
  assign dpath_io_ctrl_csr_cmd = ctrl_io_csr_cmd; // @[Core.scala 41:17]
  assign dpath_io_ctrl_illegal = ctrl_io_illegal; // @[Core.scala 41:17]
  assign ctrl_io_inst = dpath_io_ctrl_inst; // @[Core.scala 41:17]
endmodule
module CoreTester(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  dut_clock; // @[CoreTests.scala 15:19]
  wire  dut_reset; // @[CoreTests.scala 15:19]
  wire [31:0] dut_io_host_tohost; // @[CoreTests.scala 15:19]
  wire [31:0] dut_io_icache_req_bits_addr; // @[CoreTests.scala 15:19]
  wire  dut_io_icache_resp_valid; // @[CoreTests.scala 15:19]
  wire [31:0] dut_io_icache_resp_bits_data; // @[CoreTests.scala 15:19]
  wire  dut_io_dcache_req_valid; // @[CoreTests.scala 15:19]
  wire [31:0] dut_io_dcache_req_bits_addr; // @[CoreTests.scala 15:19]
  wire [31:0] dut_io_dcache_req_bits_data; // @[CoreTests.scala 15:19]
  wire [3:0] dut_io_dcache_req_bits_mask; // @[CoreTests.scala 15:19]
  wire  dut_io_dcache_resp_valid; // @[CoreTests.scala 15:19]
  wire [31:0] dut_io_dcache_resp_bits_data; // @[CoreTests.scala 15:19]
  reg [31:0] imem [0:1048575]; // @[CoreTests.scala 20:17]
  wire  imem__T_385_en; // @[CoreTests.scala 20:17]
  wire [19:0] imem__T_385_addr; // @[CoreTests.scala 20:17]
  wire [31:0] imem__T_385_data; // @[CoreTests.scala 20:17]
  wire [31:0] imem__T_402_data; // @[CoreTests.scala 20:17]
  wire [19:0] imem__T_402_addr; // @[CoreTests.scala 20:17]
  wire  imem__T_402_mask; // @[CoreTests.scala 20:17]
  wire  imem__T_402_en; // @[CoreTests.scala 20:17]
  reg [31:0] dmem [0:1048575]; // @[CoreTests.scala 21:17]
  wire  dmem__T_349_en; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_349_addr; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_349_data; // @[CoreTests.scala 21:17]
  wire  dmem__T_358_en; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_358_addr; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_358_data; // @[CoreTests.scala 21:17]
  wire  dmem__T_367_en; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_367_addr; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_367_data; // @[CoreTests.scala 21:17]
  wire  dmem__T_376_en; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_376_addr; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_376_data; // @[CoreTests.scala 21:17]
  wire  dmem__T_388_en; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_388_addr; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_388_data; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_403_data; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_403_addr; // @[CoreTests.scala 21:17]
  wire  dmem__T_403_mask; // @[CoreTests.scala 21:17]
  wire  dmem__T_403_en; // @[CoreTests.scala 21:17]
  wire [31:0] dmem__T_408_data; // @[CoreTests.scala 21:17]
  wire [19:0] dmem__T_408_addr; // @[CoreTests.scala 21:17]
  wire  dmem__T_408_mask; // @[CoreTests.scala 21:17]
  wire  dmem__T_408_en; // @[CoreTests.scala 21:17]
  reg  state; // @[Reg.scala 26:44]
  reg [31:0] cycle; // @[Reg.scala 26:44]
  wire  _T_336 = ~state; // @[CoreTests.scala 25:36]
  reg [7:0] cntr; // @[Counter.scala 15:29]
  wire  _T_339 = cntr == 8'hff; // @[Counter.scala 23:24]
  wire [7:0] _T_342 = cntr + 8'h1; // @[Counter.scala 24:22]
  wire  done = _T_336 & _T_339; // @[Counter.scala 60:20]
  wire [31:0] iaddr = dut_io_icache_req_bits_addr / 3'h4; // @[CoreTests.scala 26:43]
  wire [31:0] daddr = dut_io_dcache_req_bits_addr / 3'h4; // @[CoreTests.scala 27:43]
  wire [31:0] _T_350 = dut_io_dcache_req_valid & dut_io_dcache_req_bits_mask[0] ? dut_io_dcache_req_bits_data :
    dmem__T_349_data; // @[CoreTests.scala 29:9]
  wire [8:0] _T_353 = {{1'd0}, _T_350[7:0]}; // @[CoreTests.scala 30:69]
  wire [31:0] _T_354 = {{23'd0}, _T_353}; // @[CoreTests.scala 28:80]
  wire [31:0] _T_359 = dut_io_dcache_req_valid & dut_io_dcache_req_bits_mask[1] ? dut_io_dcache_req_bits_data :
    dmem__T_358_data; // @[CoreTests.scala 29:9]
  wire [15:0] _GEN_24 = {_T_359[15:8], 8'h0}; // @[CoreTests.scala 30:69]
  wire [22:0] _T_362 = {{7'd0}, _GEN_24}; // @[CoreTests.scala 30:69]
  wire [31:0] _GEN_25 = {{9'd0}, _T_362}; // @[CoreTests.scala 28:80]
  wire [31:0] _T_363 = _T_354 | _GEN_25; // @[CoreTests.scala 28:80]
  wire [31:0] _T_368 = dut_io_dcache_req_valid & dut_io_dcache_req_bits_mask[2] ? dut_io_dcache_req_bits_data :
    dmem__T_367_data; // @[CoreTests.scala 29:9]
  wire [23:0] _GEN_26 = {_T_368[23:16], 16'h0}; // @[CoreTests.scala 30:69]
  wire [38:0] _T_371 = {{15'd0}, _GEN_26}; // @[CoreTests.scala 30:69]
  wire [38:0] _GEN_27 = {{7'd0}, _T_363}; // @[CoreTests.scala 28:80]
  wire [38:0] _T_372 = _GEN_27 | _T_371; // @[CoreTests.scala 28:80]
  wire [31:0] _T_377 = dut_io_dcache_req_valid & dut_io_dcache_req_bits_mask[3] ? dut_io_dcache_req_bits_data :
    dmem__T_376_data; // @[CoreTests.scala 29:9]
  wire [31:0] _GEN_28 = {_T_377[31:24], 24'h0}; // @[CoreTests.scala 30:69]
  wire [38:0] _T_380 = {{7'd0}, _GEN_28}; // @[CoreTests.scala 30:69]
  wire [38:0] write = _T_372 | _T_380; // @[CoreTests.scala 28:80]
  reg [31:0] _T_386; // @[Reg.scala 14:44]
  reg [31:0] _T_389; // @[Reg.scala 14:44]
  wire [13:0] _T_397 = cntr * 6'h20; // @[CoreTests.scala 39:45]
  wire [5119:0] _T_398 = 5120'hffdff06f000000730040006f00100e130ff0000f10000073f10025733412907301428293000002973002b0731f8002931012907300028463de0282930000029700000e130400006f00100e130ff0000f00055863f000257300051063f100257300000013000000130000001300000013000000130000001300000013fa1ff06fe25ff06f000f0463e30f0f1300000f17fbff0ce334102ff3098f0f1300000f1700000013000000130000001300000013000000130000001300000013000000130000001300000013000000130000001300000013ffdff06f780e1073539e6e130000001300000013000000130000001300000013000000130000001300000013000000130000001300000013000000130000001330500073fa0f5ee334202f73000000130000001300000013000000130540006fed9ff06f000f0463ee4f0f1300000f17020f1863ef0f0f1300000f1707ff0c6334102ff3158f0f1300000f17000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000005000002600000026000000000000000000000000000000001000200050028000100200034000000000000045400000034000001000000000100f30002000000000000000000010101464c457f
     >> _T_397; // @[CoreTests.scala 39:30]
  wire  _T_400 = ~reset; // @[CoreTests.scala 41:9]
  wire  _GEN_1 = done | state; // @[CoreTests.scala 47:18 CoreTests.scala 47:26 Reg.scala 26:44]
  wire  _T_406 = dut_io_dcache_req_bits_mask != 4'h0; // @[CoreTests.scala 55:42]
  wire  _GEN_15 = dut_io_dcache_req_valid & _T_406; // @[CoreTests.scala 54:37 CoreTests.scala 21:17]
  wire [31:0] _T_413 = cycle + 32'h1; // @[CoreTests.scala 62:22]
  wire  _T_420 = dut_io_host_tohost != 32'h0; // @[CoreTests.scala 64:31]
  wire [31:0] _T_424 = {{1'd0}, dut_io_host_tohost[31:1]}; // @[CoreTests.scala 66:36]
  wire  _GEN_30 = state & _T_420; // @[CoreTests.scala 65:15]
  Core dut ( // @[CoreTests.scala 15:19]
    .clock(dut_clock),
    .reset(dut_reset),
    .io_host_tohost(dut_io_host_tohost),
    .io_icache_req_bits_addr(dut_io_icache_req_bits_addr),
    .io_icache_resp_valid(dut_io_icache_resp_valid),
    .io_icache_resp_bits_data(dut_io_icache_resp_bits_data),
    .io_dcache_req_valid(dut_io_dcache_req_valid),
    .io_dcache_req_bits_addr(dut_io_dcache_req_bits_addr),
    .io_dcache_req_bits_data(dut_io_dcache_req_bits_data),
    .io_dcache_req_bits_mask(dut_io_dcache_req_bits_mask),
    .io_dcache_resp_valid(dut_io_dcache_resp_valid),
    .io_dcache_resp_bits_data(dut_io_dcache_resp_bits_data)
  );
  assign imem__T_385_en = 1'h1;
  assign imem__T_385_addr = iaddr[19:0];
  assign imem__T_385_data = imem[imem__T_385_addr]; // @[CoreTests.scala 20:17]
  assign imem__T_402_data = _T_398[31:0];
  assign imem__T_402_addr = {{12'd0}, cntr};
  assign imem__T_402_mask = 1'h1;
  assign imem__T_402_en = ~state;
  assign dmem__T_349_en = 1'h1;
  assign dmem__T_349_addr = daddr[19:0];
  assign dmem__T_349_data = dmem[dmem__T_349_addr]; // @[CoreTests.scala 21:17]
  assign dmem__T_358_en = 1'h1;
  assign dmem__T_358_addr = daddr[19:0];
  assign dmem__T_358_data = dmem[dmem__T_358_addr]; // @[CoreTests.scala 21:17]
  assign dmem__T_367_en = 1'h1;
  assign dmem__T_367_addr = daddr[19:0];
  assign dmem__T_367_data = dmem[dmem__T_367_addr]; // @[CoreTests.scala 21:17]
  assign dmem__T_376_en = 1'h1;
  assign dmem__T_376_addr = daddr[19:0];
  assign dmem__T_376_data = dmem[dmem__T_376_addr]; // @[CoreTests.scala 21:17]
  assign dmem__T_388_en = 1'h1;
  assign dmem__T_388_addr = daddr[19:0];
  assign dmem__T_388_data = dmem[dmem__T_388_addr]; // @[CoreTests.scala 21:17]
  assign dmem__T_403_data = _T_398[31:0];
  assign dmem__T_403_addr = {{12'd0}, cntr};
  assign dmem__T_403_mask = 1'h1;
  assign dmem__T_403_en = ~state;
  assign dmem__T_408_data = write[31:0];
  assign dmem__T_408_addr = daddr[19:0];
  assign dmem__T_408_mask = 1'h1;
  assign dmem__T_408_en = state & _GEN_15;
  assign dut_clock = clock;
  assign dut_reset = ~state; // @[CoreTests.scala 32:22]
  assign dut_io_icache_resp_valid = state; // @[CoreTests.scala 33:37]
  assign dut_io_icache_resp_bits_data = _T_386; // @[CoreTests.scala 35:32]
  assign dut_io_dcache_resp_valid = state; // @[CoreTests.scala 34:37]
  assign dut_io_dcache_resp_bits_data = _T_389; // @[CoreTests.scala 36:32]
  always @(posedge clock) begin
    if (imem__T_402_en & imem__T_402_mask) begin
      imem[imem__T_402_addr] <= imem__T_402_data; // @[CoreTests.scala 20:17]
    end
    if (dmem__T_403_en & dmem__T_403_mask) begin
      dmem[dmem__T_403_addr] <= dmem__T_403_data; // @[CoreTests.scala 21:17]
    end
    if (dmem__T_408_en & dmem__T_408_mask) begin
      dmem[dmem__T_408_addr] <= dmem__T_408_data; // @[CoreTests.scala 21:17]
    end
    if (reset) begin // @[Reg.scala 26:44]
      state <= 1'h0; // @[Reg.scala 26:44]
    end else if (_T_336) begin // @[Conditional.scala 29:59]
      state <= _GEN_1;
    end
    if (reset) begin // @[Reg.scala 26:44]
      cycle <= 32'h0; // @[Reg.scala 26:44]
    end else if (state) begin // @[Conditional.scala 29:59]
      cycle <= _T_413; // @[CoreTests.scala 62:13]
    end
    if (reset) begin // @[Counter.scala 15:29]
      cntr <= 8'h0; // @[Counter.scala 15:29]
    end else if (_T_336) begin // @[Counter.scala 59:17]
      cntr <= _T_342; // @[Counter.scala 24:13]
    end
    _T_386 <= imem__T_385_data; // @[Reg.scala 14:44]
    _T_389 <= dmem__T_388_data; // @[Reg.scala 14:44]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"state: %d, cntr %d cycl %d\n",state,cntr,cycle); // @[CoreTests.scala 41:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (state & ~(cycle < 32'h3a98 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at CoreTests.scala:63 assert(cycle < maxcycles.U)\n"); // @[CoreTests.scala 63:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (state & ~(cycle < 32'h3a98 | reset)) begin
          $fatal; // @[CoreTests.scala 63:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (state & _T_420 & _T_400) begin
          $fwrite(32'h80000002,"cycles: %d\n",cycle); // @[CoreTests.scala 65:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_30 & ~(_T_424 == 32'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: * tohost: %d *\n\n    at CoreTests.scala:66 assert((dut.io.host.tohost >> 1.U) === 0.U,\n"
            ,dut_io_host_tohost); // @[CoreTests.scala 66:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_30 & ~(_T_424 == 32'h0 | reset)) begin
          $fatal; // @[CoreTests.scala 66:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_30 & _T_400) begin
          $finish; // @[CoreTests.scala 68:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_30 & _T_400) begin
          $finish; // @[CoreTests.scala 68:21]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1048576; initvar = initvar+1)
    imem[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1048576; initvar = initvar+1)
    dmem[initvar] = _RAND_1[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cycle = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cntr = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  _T_386 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_389 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
