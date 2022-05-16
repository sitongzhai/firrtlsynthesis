ICache.fir修改：
2021-1-21
因为空格原因，使用sbt社区工具生成verilog报错，将如下内容重新进行了空格对齐调整：
node _T_565 = bits(_T_564, 8, 0)
read mport _T_566 = _T_550[_T_565], clock

node _T_587 = bits(_T_586, 8, 0)
read mport _T_588 = _T_572[_T_587], clock

node _T_609 = bits(_T_608, 8, 0)
read mport _T_610 = _T_594[_T_609], clock

node _T_631 = bits(_T_630, 8, 0)
read mport _T_632 = _T_616[_T_631], clock

2021-2-27
由于已临时解决mport的定义问题，即when下的mport定义，when的条件则为此mport的enable信号，现将所有内容恢复至原文件。

2021-4-14
由于sbt会将data端连接0或1的register优化掉，导致后续的mux等其他单元也会被优化掉然而悬空的register会被sbt直接赋值为0，导致conformal的LEC运行时无法匹配相应的register，因而不等价。
修改方式为为每个register增加reset信号，这样就会保留register，验证就可以全部通过，但是有的register定义是vector类型的，然而firrtl无法支持vector类型的UIntExpression，因此需要增加vector的wire，并为每个subindex的wire都连接一个UIntExpression。

2021-4-22
添加悬空接口置为0
assign io_mem_0_e_bits_sink = 4'h0;
assign io_mem_0_c_bits_address = 32'h0;
assign io_mem_0_c_bits_data = 64'h0;
assign io_mem_0_c_bits_source = 1'h0;
assign io_mem_0_c_bits_size = 4'h0;
assign io_resp_bits_data = 16'h0;
assign io_mem_0_c_bits_param = 3'h0;
assign io_mem_0_c_bits_opcode = 3'h0;
assign io_mem_0_b_ready = 1'h0;
assign io_mem_0_c_bits_error = 1'h0;
但是通过设置dofile中的 undriven 0可以避免修改上述语句。