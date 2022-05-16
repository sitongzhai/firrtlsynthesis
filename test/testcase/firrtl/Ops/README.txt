2021-05-17
不等价原因为：
之前社区认为ADD_SIGNED：assign y = $signed(a) + $signed(b)
后来修改成 assign y = $signed($signed(a) + $signed(b))
前者表示先将a和b扩展为width+1位，然后再计算扩展后的a+b
后者表示先计算width位的a+b，然后再将width位的结果扩展为width+1位
这两种方式不等价
按照社区官方文档的理解，其实社区想要的都不是这两种，而是width位的a和b相加得到width位的结果以及一个进位，让进位的结果直接给y[width]，而不是直接扩展y[width-1]给y[width]
不过前者的运算结果刚好等于社区想要的，所以前者的计算方式更合理

经过测试，assign y = a + b相当于assign y = $unsigned(a) + $unsigned(b)


而且output signed [width:0] y这种写法也是相当于assign y = $signed(a) + $signed(b) 

等价方式修改：只需修改ADD_UNSIGNED的module为 assign y = $signed($signed(a) + $signed(b))