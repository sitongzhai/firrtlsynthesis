2021-05-17
smem需要寄存数据；cmem不需要寄存，直接输出。
新版本的社区代码修改了memory生成的方式，原来是寄存的read的addr地址，现在是寄存的read的data数据，修改库之后就可以等价

memory中write部分不能使用generate for是因为两个write的话是有顺序的，万一两个要写的地址都是一样的，有个写的先后顺序的问题，所以只能用integer for。

关于asyncread memory参考chisel-lang.org/api/latest/chisel3/Mem.html
关于syncread memory参考chisel-lang.org/api/latest/chisel3/SyncReadMem.html
以上均可通过chisel的官网https://www.chisel-lang.org/api搜索mem和syncreadmem搜索到