考虑一个and-gate, in_1 in_2 out
当
in_1 = 0, 
in_2 = 1,  =>  out = 0.

发生改变
0, 1 => 1, 0
即
in_1 = 1
in_2 = 0
通过下列方式实现改变, 注意在模拟器里就是通过这种逐个改变的方式把0, 1 => 1, 0的
(set-signal! in_1 1)
(set-signal! in_2 0)
; 
(set-signal! in_1 1) 设置完以后, 开始调各种after-delay, 等propagate执行, 然后把(1 & 1 = 1)设置到out
依次类推(set-signal! in_2 0)导致的然后把(1[in_1] & 0[in_2] = 0)设置到out
因为queue的FIFO特性, 设置out的动作被放置在了同一个time的queue下, 所以是先set out=1, 然后out=0, 结果正确
; 如果是LIFO, 那么这两个set反了, 最终导致out = 1, 不正确!
; 如果在propagate里的segment(time-queue pair)