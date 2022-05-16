FPU.fir修改：
2021-1-21
由于红区conformal对比报不等价信息，在FPU.fir增加以下内容：
io.cp_resp.bits.exc <= UInt<5>("h00")