UseMyBundle.fir修改：
2021-1-21
由于红区conformal对比报不等价信息，在UseMyBundle.fir增加以下内容：
_T_18.x <= UInt<8>("h00")
_T_32.x <= UInt<8>("h00")